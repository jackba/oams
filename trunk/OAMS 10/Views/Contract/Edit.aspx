<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS_10.Models.Contract>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Contract
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit Contract</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
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
            <%: Html.LabelFor(model => model.EffectiveDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EffectiveDate) %>
            <%: Html.ValidationMessageFor(model => model.EffectiveDate) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.TermDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TermDate)%>
            <%: Html.ValidationMessageFor(model => model.TermDate) %>
        </div>
        <div class="editor-label">
            <%: "Contractor Name" %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownListFor(model => model.ContractorID, OAMS_10.Models.ContractorRepository.GetAll().ToSelectListItem() , OAMSSetting.messageL.SelectNone)%>
            <%: Html.ValidationMessageFor(model => model.ContractorID) %>
        </div>
        <div>
            <%: Html.ActionLink("Back to List", "Index") %>
        </div>
    </fieldset>
    <%: Html.ActionLink("Add Site", "Create", "Site", new { contractID = Model.ID },null)%>
    <br />
    <br />
    <div style="overflow: auto;">
        <table>
            <tr>
                <th>
                </th>
                <th>
                    Effective Date
                </th>
                <th>
                    Term Date
                </th>
                <th>
                    Price
                </th>
                <th>
                    Production
                </th>
                <th>
                    Payment term
                </th>
                <th>
                </th>
                <th>
                    Code
                </th>
                <th>
                    Style
                </th>
                <th>
                    Material
                </th>
                <th>
                    Height
                </th>
                <th>
                    Width
                </th>
                <th>
                    Size
                </th>
                <th>
                    Grade
                </th>
                <th>
                    Panels
                </th>
                <th>
                    PanelCode
                </th>
                <th>
                    Longitude
                </th>
                <th>
                    Latitude
                </th>
            </tr>
            <% for (int i = 0; i < Model.ContractDetails.ToList().Count; i++)
               {
                   var item = Model.ContractDetails.ToList()[i];%>
            <tr>
                <td>
                    <%: Html.ActionLink("Edit Financial", "Edit","ContractDetail", new { id=item.ID },null) %>
                </td>
                <td>
                    <%: Html.EditorFor(r => r.ContractDetails.ToList()[i].EffectiveDate )%>
                </td>
                <td>
                    <%: item.TermDate %>
                </td>
                <td>
                    <%: item.Price %>
                </td>
                <td>
                    <%: item.ProductionPrice %>
                </td>
                <td>
                    <%: item.PaymentTerm %>
                </td>
                <td>
                    <%: Html.ActionLink("Edit", "Edit","Site", new { id=item.Site.ID },null) %>
                </td>
                <td>
                    <%: item.Site.Code %>
                </td>
                <td>
                    <%: item.Site.Style%>
                </td>
                <td>
                    <%: item.Site.Material%>
                </td>
                <td>
                    <%: String.Format("{0:F}", item.Site.Height)%>
                </td>
                <td>
                    <%: String.Format("{0:F}", item.Site.Width)%>
                </td>
                <td>
                    <%: String.Format("{0:F}", item.Site.Size)%>
                </td>
                <td>
                    <%: item.Site.Grade%>
                </td>
                <td>
                    <%: item.Site.NumberOfPanel%>
                </td>
                <td>
                    <%: item.Site.PanelCode%>
                </td>
                <td>
                    <%: item.Site.Longitude%>
                </td>
                <td>
                    <%: item.Site.Latitude%>
                </td>
            </tr>
            <% } %>
        </table>
        <br />
        <table>
            <tr>
                <th>
                    Effective Date
                </th>
            </tr>
            <% for (int i = 0; i < Model.Details.Count; i++)
               {
            %>
            <tr>
                <td>
                    <%: Html.EditorFor(r => r.Details[i].EffectiveDate )%>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
    <p>
        <input type="submit" value="Save" />
    </p>
    <% } %>
</asp:Content>
