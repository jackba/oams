<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OAMS.Models.Product>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">
        //var oTable;
        $(document).ready(function () {
            //oTable = $('#tblResult').dataTable({ "aaSorting": [[1, "desc"]] });
            var oTable = $('#tblResult').dataTable({ "aaSorting": [[1, "desc"]] });
        });
    </script>
    <h2>Index</h2>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <table id="tblResult" class="display">
        <thead>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Name
            </th>
            <th>
                Note
            </th>
            <th>
                CategoryID1
            </th>
            <th>
                CategoryID2
            </th>
            <th>
                CategoryID3
            </th>
            <th>
                ClientID
            </th>
        </tr>
        </thead>
        <tbody>
    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.ID })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>
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
            <td>
                <%: item.Category1 == null ? "" : item.Category1.Name %>
            </td>
            <td>
                <%: item.Category2 == null ? "" : item.Category2.Name %>
            </td>
            <td>
                <%: item.Category3 == null ? "" : item.Category3.Name %>
            </td>
            <td>
                <%: item.Client == null ? "" :item.Client.Name %>
            </td>
        </tr>
    
    <% } %>
    </tbody>
    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

