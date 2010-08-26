﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.Site>" %>

<%@ Import Namespace="OAMS.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">
        $(function () {

            //run the currently selected effect
            function show(div) {
                var options = {};
                $(div).show('blind', options, 500);
            };

            function hide(div) {
                var options = {};
                $(div).hide('blind', options, 500);
            };
            function toggle() {
                var reg = /^\d+$/;
                if (reg.test($("#FrontlitNumerOfLamps").val())) {
                    if ($("#FrontlitNumerOfLamps").val() > 0) {
                        if (!($('#FrontLit').is(":visible"))) {
                            show('#FrontLit');
                        }
                        if ($('#BackLit').is(":visible")) {
                            hide('#BackLit');
                        }
                    }
                    else {
                        if ($('#FrontLit').is(":visible")) {
                            hide('#FrontLit');
                        }
                        if (!($('#BackLit').is(":visible"))) {
                            show('#BackLit');
                        }
                    }
                }
                else {
                    if ($("#FrontlitNumerOfLamps").val() == '') {
                        if ($('#FrontLit').is(":visible")) {
                            hide('#FrontLit');
                        }
                        if (!($('#BackLit').is(":visible"))) {
                            show('#BackLit');
                        }
                    }
                }
            }
            //set effect from select menu value
            $("#FrontlitNumerOfLamps").keyup(function () {
                toggle();
                return false;
            });
        });

        function addMoreFileInput() {

            var divAddMore = $('#divMoreFile');

            var lbl = document.createElement('label');
            lbl.innerHTML = 'Filename:';

            divAddMore.append(lbl);


            var input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.setAttribute('name', 'files');
            input.setAttribute('size', '65');

            divAddMore.append(input);
            divAddMore.append('<br />');
        }

        var map;
        var marker;
        function init() {
            var mapDiv = document.getElementById('map');
            map = new google.maps.Map(mapDiv, {
                center: new google.maps.LatLng(10.77250, 106.69808),
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
        }

        google.maps.event.addDomListener(window, 'load', init);

        function txtGeoChanged() {

            var lng = $('#Lng').val();
            var lat = $('#Lat').val();

            if (marker != null) {
                marker.setMap(null);
            }

            marker = new google.maps.Marker({

                position: new google.maps.LatLng(lat, lng),
                map: map,
                draggable: true,
                title: 'Move me!'
            });



            if (!map.getBounds().contains(marker.position)) {
                var bounds = new google.maps.LatLngBounds();
                bounds.extend(marker.position);
                map.fitBounds(bounds);
            }

            google.maps.event.addListener(marker, 'drag', function () {
                $('#Lng').val(marker.getPosition().lng());
                $('#Lat').val(marker.getPosition().lat());
            });
        }
    </script>
    <h2>
        Create</h2>
    <% Html.EnableClientValidation(); %>
    <% using (Html.BeginForm("Create", "Site", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
    <%: Html.ValidationSummary(true) %>
    <table>
        <tr valign="top">
            <td>
                <fieldset>
                    <legend>Fields</legend>
                    <div id="map" style="width: 300px; height: 300px;">
                    </div>
                    <div class="editor-label">
                        Latitude
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Lat, new { onblur = "txtGeoChanged();" })%>
                        <%: Html.ValidationMessageFor(model => model.Lat)%>
                    </div>
                    <div class="editor-label">
                        Longitude
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Lng, new { onblur = "txtGeoChanged();" })%>
                        <%: Html.ValidationMessageFor(model => model.Lng)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Code) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Code)%>
                        <%: Html.ValidationMessageFor(model => model.Code)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.NewGeoFullName)%>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.NewGeoFullName, "AutoCompleteGeo")%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.AddressLine1) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.AddressLine1)%>
                        <%: Html.ValidationMessageFor(model => model.AddressLine1)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.AddressLine2) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.AddressLine2)%>
                        <%: Html.ValidationMessageFor(model => model.AddressLine2)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Type) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(r => r.Type)%>
                        <%: Html.ValidationMessageFor(model => model.Type)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Format) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(r => r.Format)%>
                        <%: Html.ValidationMessageFor(model => model.Format)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Height) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Height) %>
                        <%: Html.ValidationMessageFor(model => model.Height) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Width) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Width) %>
                        <%: Html.ValidationMessageFor(model => model.Width) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Contractor) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.Contractor)%>
                        <%: Html.ValidationMessageFor(model => model.Contractor)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CurrentClient) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.CurrentClient)%>
                        <%: Html.ValidationMessageFor(model => model.CurrentClient)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Competition) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.Competition)%>
                        <%: Html.ValidationMessageFor(model => model.Competition)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Category) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.Category)%>
                        <%: Html.ValidationMessageFor(model => model.Category)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CurrentProduct) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.CurrentProduct)%>
                        <%: Html.ValidationMessageFor(model => model.CurrentProduct)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CBDViewed) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(r => r.CBDViewed) %>
                        <%: Html.ValidationMessageFor(model => model.CBDViewed) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.StreetLight) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.StreetLight)%>
                        <%: Html.ValidationMessageFor(model => model.StreetLight)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.SurroundingAreaLight) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(r => r.SurroundingAreaLight)%>
                        <%: Html.ValidationMessageFor(model => model.SurroundingAreaLight)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.FrontlitNumerOfLamps) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.FrontlitNumerOfLamps)%>
                        <%: Html.ValidationMessageFor(model => model.FrontlitNumerOfLamps)%>
                    </div>
                    <div id="FrontLit" style="display: none;">
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.FrontlitTopBottom) %>
                        </div>
                        <div class="editor-field">
                            <%: Html.CodeMasterDropDownListFor(r => r.FrontlitTopBottom)%>
                            <%: Html.ValidationMessageFor(model => model.FrontlitTopBottom)%>
                        </div>
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.FrontlitSideLighting)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.EditorFor(model => model.FrontlitSideLighting)%>
                            <%: Html.ValidationMessageFor(model => model.FrontlitSideLighting)%>
                        </div>
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.FontlitArmsPlacement)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.CodeMasterDropDownListFor(r => r.FontlitArmsPlacement)%>
                            <%: Html.ValidationMessageFor(model => model.FontlitArmsPlacement)%>
                        </div>
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.FontlitIlluminationDistribution)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.CodeMasterDropDownListFor(r => r.FontlitIlluminationDistribution)%>
                            <%: Html.ValidationMessageFor(model => model.FontlitIlluminationDistribution)%>
                        </div>
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.FontLightArmsStraight)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.EditorFor(model => model.FontLightArmsStraight)%>
                            <%: Html.ValidationMessageFor(model => model.FontLightArmsStraight)%>
                        </div>
                    </div>
                    <div id="BackLit" style="display: none;">
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.BacklitFormat)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.CodeMasterDropDownListFor(r => r.BacklitFormat)%>
                            <%: Html.ValidationMessageFor(model => model.BacklitFormat)%>
                        </div>
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.BacklitIlluninationSpread)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.CodeMasterDropDownListFor(r => r.BacklitIlluninationSpread)%>
                            <%: Html.ValidationMessageFor(model => model.BacklitIlluninationSpread)%>
                        </div>
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.BacklitLightingBlocks)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.CodeMasterDropDownListFor(r => r.BacklitLightingBlocks)%>
                            <%: Html.ValidationMessageFor(model => model.BacklitLightingBlocks)%>
                        </div>
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.BacklitLightBoxLeakage)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.CodeMasterDropDownListFor(r => r.BacklitLightBoxLeakage)%>
                            <%: Html.ValidationMessageFor(model => model.BacklitLightBoxLeakage)%>
                        </div>
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.BacklitVisualLegibility)%>
                        </div>
                        <div class="editor-field">
                            <%: Html.CodeMasterDropDownListFor(r => r.BacklitVisualLegibility)%>
                            <%: Html.ValidationMessageFor(model => model.BacklitVisualLegibility)%>
                        </div>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ViewingDistance) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.ViewingDistance)%>
                        <%: Html.ValidationMessageFor(model => model.ViewingDistance)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ViewingSpeed) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.ViewingSpeed)%>
                        <%: Html.ValidationMessageFor(model => model.ViewingSpeed)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.High) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.High)%>
                        <%: Html.ValidationMessageFor(model => model.High)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.RoadType1) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.RoadType1) %>
                        <%: Html.ValidationMessageFor(model => model.RoadType1) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.RoadType2) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.RoadType2) %>
                        <%: Html.ValidationMessageFor(model => model.RoadType2) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.InstallationPosition1) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.InstallationPosition1)%>
                        <%: Html.ValidationMessageFor(model => model.InstallationPosition1)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.InstallationPosition2) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.InstallationPosition2)%>
                        <%: Html.ValidationMessageFor(model => model.InstallationPosition2)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.VisibilityBuilding) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.VisibilityBuilding)%>
                        <%: Html.ValidationMessageFor(model => model.VisibilityBuilding)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.VisibilityHight) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.VisibilityHight)%>
                        <%: Html.ValidationMessageFor(model => model.VisibilityHight)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.VisibilityTrees) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.VisibilityTrees)%>
                        <%: Html.ValidationMessageFor(model => model.VisibilityTrees)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.VisibilityBridgeWalkway) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.VisibilityBridgeWalkway)%>
                        <%: Html.ValidationMessageFor(model => model.VisibilityBridgeWalkway)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.VisibilityElectricityPolesOther) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.VisibilityElectricityPolesOther)%>
                        <%: Html.ValidationMessageFor(model => model.VisibilityElectricityPolesOther)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.DirectionalTrafficPublicTransport) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.DirectionalTrafficPublicTransport)%>
                        <%: Html.ValidationMessageFor(model => model.DirectionalTrafficPublicTransport)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ShopSignsBillboards) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.ShopSignsBillboards)%>
                        <%: Html.ValidationMessageFor(model => model.ShopSignsBillboards)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.FlagsTemporaryBannersPromotionalItems) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.FlagsTemporaryBannersPromotionalItems)%>
                        <%: Html.ValidationMessageFor(model => model.FlagsTemporaryBannersPromotionalItems)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CompetitiveProductSigns) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.CompetitiveProductSigns)%>
                        <%: Html.ValidationMessageFor(model => model.CompetitiveProductSigns)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToAirport) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToAirport) %>
                        <%: Html.ValidationMessageFor(model => model.CloseToAirport) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToFactory) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToFactory) %>
                        <%: Html.ValidationMessageFor(model => model.CloseToFactory) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToGasStation) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToGasStation)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToGasStation) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToHopistal) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToHopistal)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToHopistal) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToMarket) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToMarket)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToMarket) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToOffice) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToOffice)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToOffice) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToParking) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToParking)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToParking) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToResident) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToResident)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToResident) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToSchool) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToSchool)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToSchool) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToShopping) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToShopping)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToShopping) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToStadium) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToStadium)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToStadium) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToStation) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToStation)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToStation) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToTownCenter) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToTownCenter)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToTownCenter) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CloseToUniversity) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CloseToUniversity)%>
                        <%: Html.ValidationMessageFor(model => model.CloseToUniversity) %>
                    </div>
                </fieldset>
            </td>
            <td>
                <label for="file1">
                    Filename:</label>
                <input type="file" name="files" id="file3" size="65"/>
                <br />
                <div id="divMoreFile">
                </div>
                <br />
                <input type="button" value="Add more" onclick="addMoreFileInput()" />
            </td>
        </tr>
    </table>
    <p>
        <input type="submit" value="Create" />
    </p>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
