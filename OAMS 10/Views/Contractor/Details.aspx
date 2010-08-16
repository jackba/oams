<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.Contractor>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.ID %></div>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%: Model.Name %></div>
        
        <div class="display-label">Address</div>
        <div class="display-field"><%: Model.Address %></div>

        <div class="display-label">Telephone</div>
        <div class="display-field"><%: Model.Telephone %></div>

        <div class="display-label">Contact Name</div>
        <div class="display-field"><%: Model.ContactName %></div>

        <div class="display-label">Contact Phone</div>
        <div class="display-field"><%: Model.ContactPhone %></div>

        <div class="display-label">Contact Email</div>
        <div class="display-field"><%: Model.ContactEmail %></div>
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

