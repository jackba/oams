<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OAMS.Models.Site>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Index</h2>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <table>
        <tr>
            <th>
            </th>
            <th>
                ID
            </th>
            <th>
                Code
            </th>
            <th>
                Geo
            </th>
            <th>
                Address Line 1
            </th>
            <th>
                Address Line 2
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
                Total
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %>
                |
                <%: Html.ActionLink("Details", "Details", new { id=item.ID })%>
                |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>
            </td>
            <td>
                <%: item.ID %>
            </td>
            <td>
                <%: item.Code %>
            </td>
            <td>
                <%: item.GeoFullName %>
            </td>
            <td>
                <%: item.AddressLine1 %>
            </td>
            <td>
                <%: item.AddressLine2 %>
            </td>
            <td>
                <%: item.Type %>
            </td>
            <td>
                <%: item.Format %>
            </td>
            <td>
                <%: item.CurrentClient %>
            </td>
            <td>
                <%: item.CurrentProduct %>
            </td>
            <td>
                <%: item.Score %>
            </td>
        </tr>
        <% } %>
    </table>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
</asp:Content>
