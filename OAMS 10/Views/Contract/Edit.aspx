<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteFull.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.Contract>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">
        var oTable;
        $(document).ready(function () {
            oTable = $('#tblResult').dataTable({ "aaSorting": [[1, "desc"]] });
            ShowHideCols();
        });
    </script>
    <h2>
        Edit</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <div style="overflow: auto;">
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
                            Supplier
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
                        <div>
                            <% Html.RenderPartial("ManageContractTimeline", Model); %>
                        </div>
                        <p>
                            <input type="submit" value="Save" />
                        </p>
                    </fieldset>
                </td>
                <td>
                    <%: Html.ActionLink("Add Sites", "Find4Contract", "FindSite", new { ContractID = Model.ID},null)%>
                    <div id="divCol" style="overflow: auto;">
                        Display columns:
                        <input type="checkbox" id="chkColID" checked="checked" />
                        ID
                        <input type="checkbox" id="chkColPrice" />
                        Price
                        <input type="checkbox" id="chkColProductionPrice" />
                        Production Price
                        <input type="checkbox" id="chkColEffectiveDate" />
                        Effective Date
                        <input type="checkbox" id="chkColTermDate" />
                        Term Date
                        <br />
                        <input type="checkbox" id="chkColGeoFullName" checked="checked" />
                        Geo Full Name
                        <input type="checkbox" id="chkColAddressLine1" checked="checked" />
                        Address Line 1
                        <input type="checkbox" id="chkColAddressLine2" checked="checked" />
                        Address Line 2
                        <input type="checkbox" id="chkColType" checked="checked" />
                        Type
                        <input type="checkbox" id="chkColFormat" checked="checked" />
                        Format
                        <br />
                        <input type="checkbox" id="chkColCurrentClient" checked="checked" />
                        Current Client
                        <input type="checkbox" id="chkColCurrentProduct" checked="checked" />
                        Current Product
                        <input type="checkbox" id="chkColContractor" checked="checked" />
                        Contractor
                        <input type="checkbox" id="chkColPhotoCount" checked="checked" />
                        PhotoCount
                        <input type="button" id="hell" value="Ok" onclick='ShowHideCols();' />
                    </div>
                    <br />
                    <div>
                        <table id="tblResult" class="display">
                            <thead>
                                <tr>
                                    <th>
                                    </th>
                                    <th>
                                        Monitoring
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
                                        Geo Full Name
                                    </th>
                                    <th>
                                        Address Line1
                                    </th>
                                    <th>
                                        Address Line2
                                    </th>
                                    <th>
                                        Type
                                    </th>
                                    <th>
                                        Format
                                    </th>
                                    <th>
                                        Current Client
                                    </th>
                                    <th>
                                        Current Product
                                    </th>
                                    <th>
                                        Contractor
                                    </th>
                                    <th>
                                        Photo Count
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <% foreach (var item in Model.ContractDetails)
                                   { %>
                                <tr>
                                    <td>
                                        <%: Html.ActionLink("Edit", "Edit", "ContractDetail", new { id=item.ID }, null) %>
                                        <%--<a href='javascript:EditDetail( <%: item.ID %> )'>Edit</a>--%>
                                        <br />
                                        <br />
                                        <%: Html.ActionLink("Remove", "Delete", "ContractDetail", new { id=item.ID }, null) %>
                                    </td>
                                    <td>
                                        <div style='float: left;'>
                                            <%: Html.ActionLink("New", "Create", "SiteMonitoring",  new { ContractDetailID=item.ID },null) %>
                                            <% 
                                                int i = 0;
                                                foreach (var sm in item.SiteMonitorings)
                                                {
                                                    i++;
                                            %>
                                            <%: "|" %>
                                            <%--<%: Html.ActionLink(i.ToString(), "Edit", "SiteMonitoring", new { id = sm.ID }, null)%>--%>
                                            <%: Html.ActionLink(sm.Order.ToStringOrDefault(), "Edit", "SiteMonitoring", new { id = sm.ID }, null)%>
                                            <% if (sm.SiteMonitoringPhotoes.Count > 0)
                                               {%>
                                            <%: "(" + sm.SiteMonitoringPhotoes.Count.ToString() + ")"  %>
                                            <% } %>
                                            <% if (sm.Issues != "" && sm.Issues != null)
                                               {%>
                                            <% } %>
                                            <% if (sm.RequiredFollowUp != null && sm.RequiredFollowUp.Value)
                                               { %>
                                            <img border='0' src='<%= Url.Content("~/Content/Image/exclamation.gif")%>' alt="RequiredFollowUp" />
                                            <% } %>
                                            <% } %>
                                        </div>
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
                                        <%: item.Site.GeoFullName %>
                                    </td>
                                    <td>
                                        <%: item.Site.AddressLine1 %>
                                    </td>
                                    <td>
                                        <%: item.Site.AddressLine2 %>
                                    </td>
                                    <td>
                                        <%: item.Site.Type %>
                                    </td>
                                    <td>
                                        <%: item.Site.Format %>
                                    </td>
                                    <td>
                                        <%: item.Site.CurrentClientName %>
                                    </td>
                                    <td>
                                        <%: item.Site.CurrentProduct %>
                                    </td>
                                    <td>
                                        <%: item.Site.ContractorName %>
                                    </td>
                                    <td>
                                        <%: item.Site.SitePhotoes.Count %>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div id="divEditDetail">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
    <script type="text/javascript" language="javascript">
        function ShowHideCols() {
            oTable.fnSetColumnVis(2, $('#chkColID').attr('checked'));
            oTable.fnSetColumnVis(3, $('#chkColPrice').attr('checked'));
            oTable.fnSetColumnVis(4, $('#chkColProductionPrice').attr('checked'));
            oTable.fnSetColumnVis(5, $('#chkColEffectiveDate').attr('checked'));
            oTable.fnSetColumnVis(6, $('#chkColTermDate').attr('checked'));
            oTable.fnSetColumnVis(7, $('#chkColGeoFullName').attr('checked'));
            oTable.fnSetColumnVis(8, $('#chkColAddressLine1').attr('checked'));
            oTable.fnSetColumnVis(9, $('#chkColAddressLine2').attr('checked'));
            oTable.fnSetColumnVis(10, $('#chkColType').attr('checked'));
            oTable.fnSetColumnVis(11, $('#chkColFormat').attr('checked'));
            oTable.fnSetColumnVis(12, $('#chkColCurrentClient').attr('checked'));
            oTable.fnSetColumnVis(13, $('#chkColCurrentProduct').attr('checked'));
            oTable.fnSetColumnVis(14, $('#chkColContractor').attr('checked'));
            oTable.fnSetColumnVis(15, $('#chkColPhotoCount').attr('checked'));
        }

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
