﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.SiteMonitoring>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Create</h2>
    <%--<% using (Html.BeginForm())--%>
    <% using (Html.BeginForm("Create", "SiteMonitoring", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
    <%: Html.ValidationSummary(true) %>
    <table>
        <tr valign="top">
            <td>
                <fieldset>
                    <legend>Fields</legend>
                    <%: Html.HiddenFor(model => model.ContractDetailID) %>
                    <div id="map" style="width: 300px; height: 300px;">
                    </div>
                    <script type="text/javascript" language="javascript">
                        var map;
                        var marker;
                        function init() {
                            var mapDiv = document.getElementById('map');
                            map = new google.maps.Map(mapDiv, {
                                center: new google.maps.LatLng(10.77250, 106.69808),
                                zoom: 12,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            });
                            google.maps.event.addListener(map, 'idle', txtGeoChanged);
                        }

                        google.maps.event.addDomListener(window, 'load', init);

                        function txtGeoChanged() {

                            var lng = $('#Site_Lng').val();
                            var lat = $('#Site_Lat').val();

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
                        }
                    </script>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Site.GeoFullName)%>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Site.GeoFullName)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Working) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Working) %>
                        <%: Html.ValidationMessageFor(model => model.Working) %>
                    </div>
                    <div class="editor-label">
                        No. Of Bulbs
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.NoOfBullbs) %>
                        <%: Html.ValidationMessageFor(model => model.NoOfBullbs) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.BullsWorking) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.BullsWorking) %>
                        <%: Html.ValidationMessageFor(model => model.BullsWorking) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Issues) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Issues) %>
                        <%: Html.ValidationMessageFor(model => model.Issues) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Clean) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Clean)%>
                        <%: Html.ValidationMessageFor(model => model.Clean) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CreativeGoodConditon) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CreativeGoodConditon)%>
                        <%: Html.ValidationMessageFor(model => model.CreativeGoodConditon) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ExternalInterference) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.ExternalInterference)%>
                        <%: Html.ValidationMessageFor(model => model.ExternalInterference) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Vandalism) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Vandalism)%>
                        <%: Html.ValidationMessageFor(model => model.Vandalism) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Comments) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Comments) %>
                        <%: Html.ValidationMessageFor(model => model.Comments) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.RequiredFollowUp) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.RequiredFollowUp)%>
                        <%: Html.ValidationMessageFor(model => model.RequiredFollowUp) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Action) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Action) %>
                        <%: Html.ValidationMessageFor(model => model.Action) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.DateOfProblem) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.DateOfProblem)%>
                        <%: Html.ValidationMessageFor(model => model.DateOfProblem) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.NowFixed) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.NowFixed)%>
                        <%: Html.ValidationMessageFor(model => model.NowFixed) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.DateFixed) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.DateFixed)%>
                        <%: Html.ValidationMessageFor(model => model.DateFixed) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CreatedDate) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.DisplayFor(model => model.CreatedDate) %>
                        <%: Html.ValidationMessageFor(model => model.CreatedDate) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.CreatedBy) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.DisplayFor(model => model.CreatedBy)%>
                        <%: Html.ValidationMessageFor(model => model.CreatedBy) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.LastUpdatedDate) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.DisplayFor(model => model.LastUpdatedDate)%>
                        <%: Html.ValidationMessageFor(model => model.LastUpdatedDate) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.LastUpdatedBy) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.DisplayFor(model => model.LastUpdatedBy)%>
                        <%: Html.ValidationMessageFor(model => model.LastUpdatedBy) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.HiddenFor(model => model.Site.Lat)%>
                    </div>
                    
                    <div class="editor-field">
                        <%: Html.HiddenFor(model => model.Site.Lng)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Site.Type) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(r => r.Site.Type)%>
                        <%: Html.ValidationMessageFor(model => model.Site.Type)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Site.Format)%>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(r => r.Site.Format)%>
                        <%: Html.ValidationMessageFor(model => model.Site.Format)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Site.Height)%>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Site.Height)%>
                        <%: Html.ValidationMessageFor(model => model.Site.Height)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Site.Width) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Site.Width)%>
                        <%: Html.ValidationMessageFor(model => model.Site.Width)%>
                    </div>
                    <p>
                        <input type="submit" value="Create" />
                    </p>
                </fieldset>
            </td>
            <td>
                <label for="file1">
                    Filename:</label>
                <input type="file" name="files" id="file3" size="65" />
                <br />
                <div id="divMoreFile">
                </div>
                <br />
                <input type="button" value="Add more" onclick="addMoreFileInput()" />
            </td>
        </tr>
    </table>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
    <script type="text/javascript">

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

    </script>
</asp:Content>
