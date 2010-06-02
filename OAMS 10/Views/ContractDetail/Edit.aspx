<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.ContractDetail>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Fields</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Contract.Number) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.Contract.Number) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.SiteID) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.SiteID) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Price) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Price) %>
            <%: Html.ValidationMessageFor(model => model.Price) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductionPrice) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ProductionPrice) %>
            <%: Html.ValidationMessageFor(model => model.ProductionPrice) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.PaymentTerm) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PaymentTerm) %>
            <%: Html.ValidationMessageFor(model => model.PaymentTerm) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.EffectiveDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EffectiveDate)%>
            <%: Html.ValidationMessageFor(model => model.EffectiveDate) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.TermDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TermDate)%>
            <%: Html.ValidationMessageFor(model => model.TermDate) %>
        </div>
        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
    <% } %>
</asp:Content>
