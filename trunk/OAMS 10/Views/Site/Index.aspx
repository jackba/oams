<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OAMS.Models.Site>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Index</h2>
    <table>
        <tr>
            <th>
            </th>
            <th>
                ID
            </th>
            <th>
                Type
            </th>
            <th>
                Code
            </th>
            <th>
                Format
            </th>
            <th>
                Height
            </th>
            <th>
                Width
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
                <%: item.Type %>
            </td>
            <td>
                <%: item.Code %>
            </td>
            <td>
                <%: item.Format %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Height) %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Width) %>
            </td>
        </tr>
        <% } %>
    </table>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
</asp:Content>
