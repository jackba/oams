<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OAMS.Models.Client>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Client List</h2>
    <p>
        <%--<%: Html.ActionLink("Create New", "Create") %>--%>
        <%: Html.ActionLinkWithRoles<OAMS.Controllers.ClientController>("Create New", r => r.Create())%>
    </p>
    <div>
        <table id="tblResult" class="display">
            <thead>
                <tr>
                    <th>
                    </th>
                    <th>
                        ID
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        Note
                    </th>
                </tr>
            </thead>
            <tbody>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td>
                        <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %>
                        |
                        <%: Html.ActionLink("Delete", "Delete", new { id = item.ID }, new { onclick="return confirm('Delete?');" })%>
                    </td>
                    <td>
                        <%: item.ID %>
                    </td>
                    <td>
                        <%: item.Name %>
                    </td>
                    <td>
                        <%: item.Note %>
                    </td>
                </tr>
                <% } %>
            </tbody>
            <tfoot>
                <tr>
                    <th>
                    </th>
                    <th>
                    </th>
                    <th>
                    </th>
                    <th>
                    </th>
                </tr>
            </tfoot>
        </table>
    </div>
    <br />
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <script type="text/javascript">
        $(document).ready(function () {
            var oTable = $('#tblResult').dataTable({ "aaSorting": [[1, "desc"]] });
        });
    </script>
</asp:Content>
