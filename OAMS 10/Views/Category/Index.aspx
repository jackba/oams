<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OAMS.Models.Category>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Category List</h2>
    <p>
        <%: Html.ActionLink("Create New", "Create", new { parentID = Request.Params["parentID"] })%>
        |
        <%: string.IsNullOrEmpty(Request.Params["parentID"]) ? null :  Html.ActionLink("Upper Category", "IndexParent", new { parentID = Request.Params["parentID"] })%>
    </p>
    <table>
        <tr>
            <th>
            </th>
            <th>
                Name
            </th>
            <th>
                Level
            </th>
            <th>
                FullName
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %>
                |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>
                <%= item.Level < 3 ? "| " + Html.ActionLink(string.Format("Subs ({0})", item.Children.Count), "Index", new { parentID = item.ID }) : null %>
            </td>
            <td>
                <%: item.Name %>
            </td>
            <td>
                <%: item.Level %>
            </td>
            <td>
                <%: item.FullName %>
            </td>
        </tr>
        <% } %>
    </table>
</asp:Content>
