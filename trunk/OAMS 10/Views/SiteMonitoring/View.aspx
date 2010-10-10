<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.SiteMonitoring>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    View
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        View</h2>
    <%: Html.DisplayForModel("ViewDetail")%>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %>
        |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
</asp:Content>
