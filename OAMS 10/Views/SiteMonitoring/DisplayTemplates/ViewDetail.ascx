<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.SiteMonitoring>" %>
    <fieldset>
        <table>
            <tr>
                <td><h1>Inspection Report</h1></td>
                <td><img src="<%= Url.Content("~/Content/Image/ambient.png")%>" alt="Ambient" /></td>
            </tr>
            <tr>
                <td valign="top">
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>Site code:</td>
                                        <td><%: Model.ContractDetail.Site.Code %></td>
                                        <td>Supplier:</td>
                                        <td><%: Model.ContractDetail.Site.ContractorName %></td>
                                    </tr>
                                    <tr>
                                        <td>Site location:</td>
                                        <td><%: Model.ContractDetail.Site.AddressLine1 + " " + Model.ContractDetail.Site.AddressLine2 + " " + Model.ContractDetail.Site.Geo3.Name%></td>
                                        <td>Current Client:</td>
                                        <td><%: Model.ContractDetail.Site.CurrentClientName%></td>
                                    </tr>
                                    <tr>
                                        <td>Province:</td>
                                        <td><%: Model.ContractDetail.Site.Geo1.Name%></td>
                                        <td>GPS Lattitude:</td>
                                        <td><%: Model.ContractDetail.Site.Lat %></td>
                                    </tr>
                                    <tr>
                                        <td>District:</td>
                                        <td><%: Model.ContractDetail.Site.Geo2.Name%></td>
                                        <td>GPS Longitude:</td>
                                        <td><%: Model.ContractDetail.Site.Lng%></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
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

                                                    var lng = $('#ContractDetail_Site_Lng').val();
                                                    var lat = $('#ContractDetail_Site_Lat').val();

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
                                            <%: Html.HiddenFor(model => model.ContractDetail.Site.Lat)%>
                                            <%: Html.HiddenFor(model => model.ContractDetail.Site.Lng)%>
                                        </td>
                                        <%  int i = 0;
                                            bool hasCloseTr = false;
                                            foreach (var item in Model.SiteMonitoringPhotoes)
                                            { %>
                                        <%
                                                if (i % 2 == 0)
                                                { 
                                        %>
                                                    <td valign="top">
                                                    <img src='<%= item.Url %>' alt="" width="300"/>
                                                    </td></tr>
                                        <%
                                                    hasCloseTr = true;
                                                }
                                                else
                                                {
                                        %>
                                                    <tr><td valign="top">
                                                        <img src='<%= item.Url %>' alt="" width="300"/>
                                                    </td>
                                        <% 
                                                    hasCloseTr = false;
                                                }
                                                i++;
                                        %>
                                        <% } %>
                                        <%
                                            if (!hasCloseTr)
                                            { 
                                        %>
                                                <td></td></tr>
                                        <%
                                            }
                                        %>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td>Current Creative:</td>
                            <td><%: Model.ContractDetail.Site.CurrentClientName%></td>
                        </tr>
                        <tr>
                            <td>Advertising Type:</td>
                            <td><%: Model.ContractDetail.Site.Type %></td>
                        </tr>
                        <tr>
                            <td>Format Execution:</td>
                            <td><%: Model.ContractDetail.Site.Format %></td>
                        </tr>
                        <tr>
                            <td>In/Outbound to CBC:</td>
                            <td><%: Model.ContractDetail.Site.CBDViewed %></td>
                        </tr>
                        <tr>
                            <td>Size:</td>
                            <td><%: Model.ContractDetail.Site.Height %>m x <%: Model.ContractDetail.Site.Width %>m</td>
                        </tr>
                        <tr><td><b>Latest Dates</b></td><td></td></tr>
                        <tr>
                            <td>Latest Site Inspection:</td>
                            <td><%: Model.LastUpdatedDate.ToStringVN() %></td>
                        </tr>
                        <tr>
                            <td>Latest Photo Taken:</td>
                            <td><%: Model.ContractDetail.Site.LastUpdatedDate.ToStringVN() %></td>
                        </tr>
                        <tr><td><b>Lighting</b></td><td></td></tr>
                        <tr>
                            <td>Backlit/Frontlit Vendor:</td>
                            <td><%: Model.ContractDetail.Site.FrontlitNumerOfLamps>0?"Frontlit":"Backlit" %></td>
                        </tr>
                        <tr>
                            <td>Working:</td>
                            <td><%: (Model.Working != null && (bool)Model.Working)?"Yes":"No" %></td>
                        </tr>
                        <tr>
                            <td>No. of bulbs:</td>
                            <td><%: Model.NoOfBullbs%></td>
                        </tr>
                        <tr>
                            <td>Bulbs working:</td>
                            <td><%: Model.BullsWorking%></td>
                        </tr>
                        <tr>
                            <td>Issues:</td>
                            <td><%: Model.Issues%></td>
                        </tr>
                        <tr><td><b>Status of ContractDetail.Site</b></td><td></td></tr>
                        <tr>
                            <td>Clean:</td>
                            <td><%: (Model.Clean != null && (bool)Model.Clean)?"Yes":"No"%></td>
                        </tr>
                        <tr>
                            <td>Creative Good Condition:</td>
                            <td><%: (Model.CreativeGoodConditon != null && (bool)Model.CreativeGoodConditon)?"Yes":"No"%></td>
                        </tr>
                        <tr>
                            <td>External Interference:</td>
                            <td><%: (Model.ExternalInterference != null && (bool)Model.ExternalInterference)?"Yes":"No"%></td>
                        </tr>
                        <tr>
                            <td>Vandalism:</td>
                            <td><%: (Model.Vandalism != null && (bool)Model.Vandalism)?"Yes":"No"%></td>
                        </tr>
                        <tr>
                            <td>Comments:</td>
                            <td><%: Model.Comments%></td>
                        </tr>
                        <tr><td><b>Follow up (if any)</b></td><td></td></tr>
                        <tr>
                            <td>Required:</td>
                            <td><%: (Model.RequiredFollowUp != null && (bool)Model.RequiredFollowUp)?"Yes":"No"%></td>
                        </tr>
                        <tr>
                            <td>Action:</td>
                            <td><%: Model.Action%></td>
                        </tr>
                        <tr>
                            <td>Date of problem:</td>
                            <td><%: Model.DateOfProblem.ToStringVN()%></td>
                        </tr>
                        <tr>
                            <td>Now fixed:</td>
                            <td><%: (Model.NowFixed!=null && (bool)Model.NowFixed)?"Yes":"No"%></td>
                        </tr>
                        <tr>
                            <td>Date fixed:</td>
                            <td><%: Model.DateFixed.ToStringVN()%></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </fieldset>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>


