<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS_10.Models.Site>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Find
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Find</h2>
    <div id="map_canvas" style="width: 500px; height: 500px;">
    </div>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', init);
        function init() {

            var latlng = new google.maps.LatLng(10.74981, 106.70176);
            var mapDiv = document.getElementById("map_canvas");

            var map = new google.maps.Map(mapDiv, {
                center: new google.maps.LatLng(10.74981, 106.70176),
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            var distanceWidget = new DistanceWidget(map);
        }



        /**
        * A distance widget that will display a circle that can be resized and will
        * provide the radius in km.
        *
        * @param {google.maps.Map} map The map on which to attach the distance widget.
        *
        * @constructor
        */
        function DistanceWidget(map) {

            this.set('map', map);
            this.set('position', map.getCenter());

            var marker = new google.maps.Marker({
                draggable: true,
                title: 'Move me!'
            });

            // Bind the marker map property to the DistanceWidget map property
            marker.bindTo('map', this);

            // Bind the marker position property to the DistanceWidget position
            // property
            marker.bindTo('position', this);

            // Create a new radius widget
            var radiusWidget = new RadiusWidget();

            // Bind the radiusWidget map to the DistanceWidget map
            radiusWidget.bindTo('map', this);

            // Bind the radiusWidget center to the DistanceWidget position
            radiusWidget.bindTo('center', this, 'position');
        }
        DistanceWidget.prototype = new google.maps.MVCObject();


        /**
        * A radius widget that add a circle to a map and centers on a marker.
        *
        * @constructor
        */
        function RadiusWidget() {
            var circle = new google.maps.Circle({
                strokeWeight: 2
            });

            // Set the distance property value, default to 50km.
            this.set('distance', 2);

            // Bind the RadiusWidget bounds property to the circle bounds property.
            this.bindTo('bounds', circle);

            // Bind the circle center to the RadiusWidget center property
            circle.bindTo('center', this);

            // Bind the circle map to the RadiusWidget map
            circle.bindTo('map', this);

            // Bind the circle radius property to the RadiusWidget radius property
            circle.bindTo('radius', this);

            this.addSizer_(); 
        }
        RadiusWidget.prototype = new google.maps.MVCObject();


        /**
        * Update the radius when the distance has changed.
        */
        RadiusWidget.prototype.distance_changed = function () {
            this.set('radius', this.get('distance') * 1000);
        };


        /**
        * Add the sizer marker to the map.
        *
        * @private
        */
        RadiusWidget.prototype.addSizer_ = function () {
            var sizer = new google.maps.Marker({
                draggable: true,
                title: 'Drag me!'
            });

            sizer.bindTo('map', this);
            sizer.bindTo('position', this, 'sizer_position');
        };

        /**
        * Update the center of the circle and position the sizer back on the line.
        *
        * Position is bound to the DistanceWidget so this is expected to change when
        * the position of the distance widget is changed.
        */
        RadiusWidget.prototype.center_changed = function () {
            var bounds = this.get('bounds');

            // Bounds might not always be set so check that it exists first.
            if (bounds) {
                var lng = bounds.getNorthEast().lng();

                // Put the sizer at center, right on the circle.
                var position = new google.maps.LatLng(this.get('center').lat(), lng);
                this.set('sizer_position', position);
            }
        };

    </script>
</asp:Content>
