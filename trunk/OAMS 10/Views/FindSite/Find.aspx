<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.FindSite>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Find
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Find Site</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.HiddenFor(r => r.CampaignID) %>
    <table>
        <tr>
            <td>
                Geo1:
                <br />
                
                <%--<%: Html.DropDownListForGeo1(r => r.GeoID1) %>--%>
                <%: Html.EditorFor(model => model.Geo1FullName, "AutoCompleteGeo", new { level = 1 }) %>
                <br />
                Geo2:
                <div id="geo2List">
                    as
                </div>
                <br />
                Style List:
                <br />
                <%
                    foreach (var category in OAMS.Models.CodeMasterRepository.Get((new OAMS.Models.CodeMasterType()).Style))
                    {
                %>
                <input type="checkbox" name="StyleList" value="<%= category.Code %>" />
                <%: category.Note %>
                <br />
                <%
                    }
                %>
                <br />
                <%: Html.LabelFor(r => r.Material) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.Material) %>
                <br />
                <%: Html.LabelFor(r => r.RoadType1) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.RoadType2) %>
                <br />
                <%: Html.LabelFor(r => r.InstallationPosition1) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.InstallationPosition2) %>
                <br />
                <%: Html.LabelFor(r => r.ViewingDistance) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.ViewingDistance) %>
                <br />
                <%: Html.LabelFor(r => r.VisibilityBuilding) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.VisibilityBuilding) %>
                <br />
                <%: Html.LabelFor(r => r.VisibilityTrees) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.VisibilityTrees) %>
                <br />
                <%: Html.LabelFor(r => r.VisibilityBridgeWalkway) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.VisibilityBridgeWalkway) %>
                <br />
                <%: Html.LabelFor(r => r.VisibilityElectricityPolesOther) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.VisibilityElectricityPolesOther) %>
                <br />
                <%: Html.LabelFor(r => r.ViewingSpeed) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.ViewingSpeed)%>
                <br />
                <%: Html.LabelFor(r => r.AboveStreet) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(r => r.AboveStreet)%>
                <br />
                <%: Html.LabelFor(model => model.DirectionalTrafficPublicTransport) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(model => model.DirectionalTrafficPublicTransport)%>
                <br />
                <%: Html.LabelFor(model => model.ShopSignsBillboards) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(model => model.ShopSignsBillboards)%>
                <br />
                <%: Html.LabelFor(model => model.FlagsTemporaryBannersPromotionalItems) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(model => model.FlagsTemporaryBannersPromotionalItems)%>
                <br />
                <%: Html.LabelFor(model => model.CompetitiveProductSigns) %>
                <br />
                <%: Html.CodeMasterDropDownListFor(model => model.CompetitiveProductSigns)%>
                <br />
                Within
                <%: Html.EditorFor(r => r.Distance) %>
                km
                <%: Html.HiddenFor(r => r.Lat) %>
                <%: Html.HiddenFor(r => r.Long) %>
                <br />
            </td>
            <td valign="top">
                <input type="button" onclick="search(this)" value="Find" />
                <table>
                    <tr>
                        <td>
                            <div id="map" style="width: 500px; height: 500px;">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top;">
                            <table id="tblResult">
                                <thead>
                                    <tr>
                                        <td>
                                            Code
                                        </td>
                                        <td>
                                            Style
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <% } %>
    <script type="text/javascript">

        function showGeo2(str) {
            //alert(str);
            //var v = $("#geo2List").text();
            var div1 = $("#geo2List");
            div1.empty();



            $.ajax({
                url: "../Listing/ListGeo2", type: "POST", dataType: "json",
                data: { parentFullName: str },
                success: function (data) {
                    response($.map(data, function (item) {

                        var chk = document.createElement('input');
                        chk.type = 'checkbox';
                        chk.name = 'Geo2List';
                        chk.value = item.FullName;

                        div1.append(chk);
                        div1.append(item.FullName);
                        div1.append('<br />');
                        
                        //return { label: item.FullName, value: item.FullName, id: item.ID }


                    }))
                }

            })



          


            //alert(v);
        }

        function addResults(json) {



            if (json.length) {
                for (var i = 0, site; site = json[i]; i++) {

                    //  var image = new google.maps.MarkerImage(profileImageUrl,
                    //          new google.maps.Size(48, 48),
                    //          new google.maps.Point(0, 0),
                    //          new google.maps.Point(24, 24),
                    //          new google.maps.Size(24, 24));


                    var pos = new google.maps.LatLng(site.Latitude, site.Longitude);

                    var marker = new google.maps.Marker({
                        map: map,
                        position: pos,
                        //icon: image,
                        zIndex: 10
                    });


                    profileMarkers.push(marker);

                    bindInfoWindow(marker, map, infoWindow, site.Code);

                    var tbl = $('#tblResult tbody');
                    tbl.innerHTML = '';
                    html = [];

                    var rSel = document.createElement('tr');
                    tbl.append(rSel);

                    //Code
                    var cSel = document.createElement('td');
                    rSel.appendChild(cSel);

                    var aSel = document.createElement('a');
                    aSel.href = 'javascript:void(0);';
                    aSel.innerHTML = site.Code;
                    aSel.onclick = generateTriggerCallback(marker, 'click');
                    //aSel.onclick = function () { google.maps.event.trigger(marker, 'click'); };

                    cSel.appendChild(aSel);

                    //Style
                    var cStyle = document.createElement('td');
                    cStyle.innerHTML = site.Style;
                    rSel.appendChild(cStyle);

                    //Add2Campaign
                    var cAdd2Cam = document.createElement('td');
                    rSel.appendChild(cAdd2Cam);

                    var aAdd2Cam = document.createElement('a');
                    aAdd2Cam.href = 'javascript:void(0);';
                    aAdd2Cam.innerHTML = 'Add to Campaign';

                    //aAdd2Cam.onclick = Add2Campaign1();
                    cAdd2Cam.appendChild(aAdd2Cam);

                    aAdd2Cam.onclick = Add2Campaign(aAdd2Cam, $("#CampaignID").val(), site.ContractDetailID);

                }
            }
            else {
                tbl.push('No site found.');
            }

            //$(results).html(html.join(''));
            //$('#results-wrapper').show();
        }



        var distanceWidget;
        var map;
        var geocodeTimer;
        var profileMarkers = [];

        var infoWindow = new google.maps.InfoWindow;

        function init() {
            var mapDiv = document.getElementById('map');
            map = new google.maps.Map(mapDiv, {
                center: new google.maps.LatLng(10.74981, 106.70176),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            distanceWidget = new DistanceWidget({
                map: map,
                distance: 1, // Starting distance in km.
                maxDistance: 2500, // Twitter has a max distance of 2500km.
                color: '#000',
                activeColor: '#59b',
                sizerIcon: new google.maps.MarkerImage('../Content/Image/resize-off.png'),
                activeSizerIcon: new google.maps.MarkerImage('../Content/Image/resize.png')
            });

            google.maps.event.addListener(distanceWidget, 'distance_changed',
      updateDistance);

            google.maps.event.addListener(distanceWidget, 'position_changed',
      updatePosition);

            map.fitBounds(distanceWidget.get('bounds'));

            updateDistance();
            updatePosition();
            addActions();
        }

        function updatePosition() {
            if (geocodeTimer) {
                window.clearTimeout(geocodeTimer);
            }

            // Throttle the geo query so we don't hit the limit
            geocodeTimer = window.setTimeout(function () {
                reverseGeocodePosition();
            }, 200);
        }

        function reverseGeocodePosition() {
            var pos = distanceWidget.get('position');
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': pos }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        $('#of').html('of ' + results[1].formatted_address);
                        return;
                    }
                }

                $('#of').html('of somewhere');
            });
        }

        function updateDistance() {
            var distance = distanceWidget.get('distance');
            //            $('#dist').html(distance.toFixed(2));
            $('#Distance').val(distance.toFixed(2));
        }





        function addActions() {




            var s = $('#s').submit(search);

            $('#close').click(function () {
                $('#cols').removeClass('has-cols');
                google.maps.event.trigger(map, 'resize');
                map.fitBounds(distanceWidget.get('bounds'));
                $('#results-wrapper').hide();

                return false;
            });
        }

        function Add2Campaign(link, campaignID, contractDetailID) {

            var url = '/Campaign/AddSiteDetail?CampaignID=' + campaignID + '&ContractDetailID=' + contractDetailID;

            return function () {
                $.ajax({
                    url: url, type: "POST", dataType: "json",
                    success: function (data) {

                        //aAdd2Cam.setAttribute('visible', 'invisible');

                        link.innerHTML = 'Added';
                        link.onclick = null;
                        link.setAttribute('visible', 'invisible');

                        //link.visible = false;

                        //                        if (data == 0) {
                        //                            alert('Added.');
                        //                        }
                        //                        else { 

                        //                        }

                        //clearMarkers();

                        //addResults(data);

                        //                    $.map(data, function (item) {
                        //                        var latlng = new google.maps.LatLng(item.Latitude, item.Longitude);
                        //                        var marker = new google.maps.Marker({ position: latlng, map: map, title: item.Code });
                        //                        bindInfoWindow(marker, map, infoWindow, item.Note);
                        //                    })
                    }
                });
            };
        }

        function search(e) {

            var tdata = $("form").serialize();

            $.ajax({
                url: "../FindSite/FindJson", type: "POST", dataType: "json",
                data: tdata,
                success: function (data) {

                    clearMarkers();

                    addResults(data);

                    //                    $.map(data, function (item) {
                    //                        var latlng = new google.maps.LatLng(item.Latitude, item.Longitude);
                    //                        var marker = new google.maps.Marker({ position: latlng, map: map, title: item.Code });
                    //                        bindInfoWindow(marker, map, infoWindow, item.Note);
                    //                    })
                }
            })




            //            e.preventDefault();
            //            var q = $('#q').val();
            //            if (q == '') {
            //                return false;
            //            }

            //            var d = distanceWidget.get('distance');
            //            var p = distanceWidget.get('position');

            //            var url = 'http://search.twitter.com/search.json?callback=addResults' +
            //    '&rrp=100&q=' + escape(q) + '&geocode=' + escape(p.lat() + ',' + p.lng() +
            //    ',' + d + 'km');

            //            clearMarkers();

            //            $.getScript(url);

            //            $('#results').html('Searching...');
            //            var cols = $('#cols');
            //            if (!cols.hasClass('has-cols')) {
            //                $('#cols').addClass('has-cols');
            //                google.maps.event.trigger(map, 'resize');
            //                map.fitBounds(distanceWidget.get('bounds'));
            //            }
        }

        function clearMarkers() {
            for (var i = 0, marker; marker = profileMarkers[i]; i++) {
                marker.setMap(null);
            }
            infoWindow.close();
            $("#tblResult tbody tr").remove();
        }

        function clickMarker(marker) {
            marker.click();
        }



        google.maps.event.addDomListener(window, 'load', init);

        function generateTriggerCallback(object, eventType) {
            //alert("as");
            return function () {
                google.maps.event.trigger(object, eventType);
            };
        }

        function bindInfoWindowToA(marker, map, infoWindow, html, link) {
            google.maps.event.addListener(link, 'click', function () {
                //                infoWindow.setContent(html);
                //                infoWindow.open(map, marker);
                alert('aa');
            });
        }

        function bindInfoWindow(marker, map, infoWindow, html) {
            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.setContent(html);
                infoWindow.open(map, marker);
            });
        }

        /**
        * A distance widget that will display a circle that can be resized and will
        * provide the radius in km.
        *
        * @param {Object} opt_options Options such as map, position etc.
        *
        * @constructor
        */
        function DistanceWidget(opt_options) {
            var options = opt_options || {};

            this.setValues(options);

            if (!this.get('position')) {
                this.set('position', map.getCenter());
            }

            // Add a marker to the page at the map center or specified position
            var marker = new google.maps.Marker({
                draggable: true,
                title: 'Move me!'
            });

            marker.bindTo('map', this);
            marker.bindTo('zIndex', this);
            marker.bindTo('position', this);
            marker.bindTo('icon', this);

            // Create a new radius widget
            var radiusWidget = new RadiusWidget(options['distance'] || 50);

            // Bind the radius widget properties.
            radiusWidget.bindTo('center', this, 'position');
            radiusWidget.bindTo('map', this);
            radiusWidget.bindTo('zIndex', marker);
            radiusWidget.bindTo('maxDistance', this);
            radiusWidget.bindTo('minDistance', this);
            radiusWidget.bindTo('color', this);
            radiusWidget.bindTo('activeColor', this);
            radiusWidget.bindTo('sizerIcon', this);
            radiusWidget.bindTo('activeSizerIcon', this);

            // Bind to the radius widget distance property
            this.bindTo('distance', radiusWidget);
            // Bind to the radius widget bounds property
            this.bindTo('bounds', radiusWidget);

            var me = this;
            google.maps.event.addListener(marker, 'dblclick', function () {
                // When a user double clicks on the icon fit to the map to the bounds
                map.fitBounds(me.get('bounds'));
            });
        }
        DistanceWidget.prototype = new google.maps.MVCObject();


        /**
        * A radius widget that add a circle to a map and centers on a marker.
        *
        * @param {number} opt_distance Optional starting distance.
        * @constructor
        */
        function RadiusWidget(opt_distance) {
            var circle = new google.maps.Circle({
                strokeWeight: 2
            });

            this.set('distance', opt_distance);
            this.set('active', false);
            this.bindTo('bounds', circle);

            circle.bindTo('center', this);
            circle.bindTo('zIndex', this);
            circle.bindTo('map', this);
            circle.bindTo('strokeColor', this);
            circle.bindTo('radius', this);

            this.addSizer_();
        }
        RadiusWidget.prototype = new google.maps.MVCObject();


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

            sizer.bindTo('zIndex', this);
            sizer.bindTo('map', this);
            sizer.bindTo('icon', this);
            sizer.bindTo('position', this, 'sizer_position');

            var me = this;
            google.maps.event.addListener(sizer, 'dragstart', function () {
                me.set('active', true);
            });

            google.maps.event.addListener(sizer, 'drag', function () {
                // Set the circle distance (radius)
                me.setDistance_();
            });

            google.maps.event.addListener(sizer, 'dragend', function () {
                me.set('active', false);
            });
        };


        /**
        * Update the radius when the distance has changed.
        */
        RadiusWidget.prototype.distance_changed = function () {
            this.set('radius', this.get('distance') * 1000);
        };

        /**
        * Update the radius when the min distance has changed.
        */
        RadiusWidget.prototype.minDistance_changed = function () {
            if (this.get('minDistance') &&
      this.get('distance') < this.get('minDistance')) {
                this.setDistance_();
            }
        };


        /**
        * Update the radius when the max distance has changed.
        */
        RadiusWidget.prototype.maxDistance_changed = function () {
            if (this.get('maxDistance') &&
      this.get('distance') > this.get('maxDistance')) {
                this.setDistance_();
            }
        };


        /**
        * Update the stroke color when the color is changed.
        */
        RadiusWidget.prototype.color_changed = function () {
            this.active_changed();
        };


        /**
        * Update the active stroke color when the color is changed.
        */
        RadiusWidget.prototype.activeColor_changed = function () {
            this.active_changed();
        };


        /**
        * Update the active stroke color when the color is changed.
        */
        RadiusWidget.prototype.sizerIcon_changed = function () {
            this.active_changed();
        };


        /**
        * Update the active stroke color when the color is changed.
        */
        RadiusWidget.prototype.activeSizerIcon_changed = function () {
            this.active_changed();
        };


        /**
        * Update the center of the circle and position the sizer back on the line.
        *
        * Position is bound to the DistanceWidget so this is expected to change when
        * the position of the distance widget is changed.
        */
        RadiusWidget.prototype.center_changed = function () {
            var sizerPos = this.get('sizer_position');
            var position;
            if (sizerPos) {
                position = this.getSnappedPosition_(sizerPos);
            } else {
                var bounds = this.get('bounds');
                if (bounds) {
                    var lng = bounds.getNorthEast().lng();
                    position = new google.maps.LatLng(this.get('center').lat(), lng);
                }
            }

            if (position) {
                this.set('sizer_position', position);
            }

            $('#Lat').val(this.get('center').lat());
            $('#Long').val(this.get('center').lng());


        };

        /**
        * Update the center of the circle and position the sizer back on the line.
        */
        RadiusWidget.prototype.active_changed = function () {
            var strokeColor;
            var icon;

            if (this.get('active')) {
                if (this.get('activeColor')) {
                    strokeColor = this.get('activeColor');
                }

                if (this.get('activeSizerIcon')) {
                    icon = this.get('activeSizerIcon');
                }
            } else {
                strokeColor = this.get('color');

                icon = this.get('sizerIcon');
            }

            if (strokeColor) {
                this.set('strokeColor', strokeColor);
            }

            if (icon) {
                this.set('icon', icon);
            }
        };


        /**
        * Set the distance of the circle based on the position of the sizer.
        * @private
        */
        RadiusWidget.prototype.setDistance_ = function () {
            // As the sizer is being dragged, its position changes.  Because the
            // RadiusWidget's sizer_position is bound to the sizer's position, it will
            // change as well.
            var pos = this.get('sizer_position');
            var center = this.get('center');
            var distance = this.distanceBetweenPoints_(center, pos);

            if (this.get('maxDistance') && distance > this.get('maxDistance')) {
                distance = this.get('maxDistance');
            }

            if (this.get('minDistance') && distance < this.get('minDistance')) {
                distance = this.get('minDistance');
            }

            // Set the distance property for any objects that are bound to it
            this.set('distance', distance);

            var newPos = this.getSnappedPosition_(pos);
            this.set('sizer_position', newPos);
        };


        /**
        * Finds the closest left or right of the circle to the position.
        *
        * @param {google.maps.LatLng} pos The position to check against.
        * @return {google.maps.LatLng} The closest point to the circle.
        * @private.
        */
        RadiusWidget.prototype.getSnappedPosition_ = function (pos) {
            var bounds = this.get('bounds');
            var center = this.get('center');
            var left = new google.maps.LatLng(center.lat(),
      bounds.getSouthWest().lng());
            var right = new google.maps.LatLng(center.lat(),
      bounds.getNorthEast().lng());

            var leftDist = this.distanceBetweenPoints_(pos, left);
            var rightDist = this.distanceBetweenPoints_(pos, right);

            if (leftDist < rightDist) {
                return left;
            } else {
                return right;
            }
        };


        /**
        * Calculates the distance between two latlng points in km.
        * @see http://www.movable-type.co.uk/scripts/latlong.html
        *
        * @param {google.maps.LatLng} p1 The first lat lng point.
        * @param {google.maps.LatLng} p2 The second lat lng point.
        * @return {number} The distance between the two points in km.
        * @private
        */
        RadiusWidget.prototype.distanceBetweenPoints_ = function (p1, p2) {
            if (!p1 || !p2) {
                return 0;
            }

            var R = 6371; // Radius of the Earth in km
            var dLat = (p2.lat() - p1.lat()) * Math.PI / 180;
            var dLon = (p2.lng() - p1.lng()) * Math.PI / 180;
            var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(p1.lat() * Math.PI / 180) * Math.cos(p2.lat() * Math.PI / 180) *
    Math.sin(dLon / 2) * Math.sin(dLon / 2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var d = R * c;
            return d;
        };

    </script>
</asp:Content>
