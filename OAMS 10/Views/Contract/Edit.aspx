<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.Contract>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <table>
        <tr valign="top">
            <td>
                <fieldset>
                    <legend>Fields</legend>
                    <%: Html.HiddenFor(model => model.ID) %>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Number) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Number) %>
                        <%: Html.ValidationMessageFor(model => model.Number) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ContractType) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.CodeMasterDropDownListFor(model => model.ContractType) %>
                        <%: Html.ValidationMessageFor(model => model.ContractType) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ContractorName)%>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.ContractorName, "AutoCompleteContractor")%>
                        <%: Html.ValidationMessageFor(r => r.ContractorName)%>
                        <%: Html.TextBoxFor(model => model.ContractorID, new { @style = "visibility:collapse;" })%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ClientName)%>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.ClientName, "AutoCompleteClient")%>
                        <%: Html.ValidationMessageFor(r => r.ClientName)%>
                        <%: Html.TextBoxFor(model => model.ClientID, new { @style = "visibility:collapse;" })%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.SignedDate) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.SignedDate) %>
                        <%: Html.ValidationMessageFor(model => model.SignedDate) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ExpiredDate) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.ExpiredDate)%>
                        <%: Html.ValidationMessageFor(model => model.ExpiredDate)%>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.InspectionFrequency) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.InspectionFrequency) %>
                        <%: Html.ValidationMessageFor(model => model.InspectionFrequency) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ReportOn) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.ReportOn) %>
                        <%: Html.ValidationMessageFor(model => model.ReportOn) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Value) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Value) %>
                        <%: Html.ValidationMessageFor(model => model.Value) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.PaymentTerm) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.PaymentTerm) %>
                        <%: Html.ValidationMessageFor(model => model.PaymentTerm) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ContactName1) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.ContactName1) %>
                        <%: Html.ValidationMessageFor(model => model.ContactName1) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Phone1) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Phone1) %>
                        <%: Html.ValidationMessageFor(model => model.Phone1) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Email1) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Email1) %>
                        <%: Html.ValidationMessageFor(model => model.Email1) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ContractName2) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.ContractName2) %>
                        <%: Html.ValidationMessageFor(model => model.ContractName2) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Phone2) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Phone2) %>
                        <%: Html.ValidationMessageFor(model => model.Phone2) %>
                    </div>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Email2) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Email2) %>
                        <%: Html.ValidationMessageFor(model => model.Email2) %>
                    </div>
                    <p>
                        <input type="submit" value="Save" />
                    </p>
                </fieldset>
            </td>
            <td>
                <%: Html.ActionLink("Add Sites", "Find4Contract", "FindSite", new { ContractID = Model.ID},null)%>
                <div style="overflow: auto;">
                    <table>
                        <tr>
                            <th>
                            </th>
                            <th>
                                Site ID
                            </th>
                            <th>
                                Price
                            </th>
                            <th>
                                Production Price
                            </th>
                            <th>
                                Effective Date
                            </th>
                            <th>
                                Term Date
                            </th>
                            <th>
                                Monitoring
                            </th>
                        </tr>
                        <% foreach (var item in Model.ContractDetails)
                           { %>
                        <tr>
                            <td>
                                <%: Html.ActionLink("Edit", "Edit", "ContractDetail", new { id=item.ID }, null) %>
                                <%--<a href='javascript:EditDetail( <%: item.ID %> )'>Edit</a>--%>
                                |
                                <%: Html.ActionLink("Remove", "Delete", "ContractDetail", new { id=item.ID }, null) %>
                            </td>
                            <td>
                                <%: item.SiteID %>
                            </td>
                            <td>
                                <%: String.Format("{0:c}", item.Price) %>
                            </td>
                            <td>
                                <%: String.Format("{0:c}", item.ProductionPrice) %>
                            </td>
                            <td>
                                <%: String.Format("{0:d}", item.EffectiveDate) %>
                            </td>
                            <td>
                                <%: String.Format("{0:d}", item.TermDate) %>
                            </td>
                            <td>
                                <%: Html.ActionLink("New", "Create", "SiteMonitoring",  new { ContractDetailID=item.ID },null) %>
                                
                                <% 
                                    int i = 0;
                                    foreach (var sm in item.SiteMonitorings)
                                    {
                                        i++;
                                %>
                                <%: "|" %>
                                <%: Html.ActionLink(i.ToString(), "Edit", "SiteMonitoring", new { id = sm.ID }, null)%>
                                
                                <% } %>
                            </td>
                        </tr>
                        <% } %>
                    </table>
                </div>
                <div id="divEditDetail">
                </div>
            </td>
        </tr>
    </table>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
    <script type="text/javascript" language="javascript">
        function EditDetail(contractDetailID) {

            $.ajax({
                url: '<%= Url.Content("~/ContractDetail/Edit/") %>' + contractDetailID, type: "POST",
                success: function (data) {
                    //alert(data);
                    //clearMarkers();


                    //addResults(data);

                    //                    $.map(data, function (item) {
                    //                        var latlng = new google.maps.LatLng(item.Latitude, item.Longitude);
                    //                        var marker = new google.maps.Marker({ position: latlng, map: map, title: item.Code });
                    //                        bindInfoWindow(marker, map, infoWindow, item.Note);
                    //                    })
                    //var divEdit = $("#divEditDetail");
                    //divEdit.innerHTML = data;
                    $("#divEditDetail").html(data).dialog({ modal: true });



                }
            })

        };
    </script>
</asp:Content>
