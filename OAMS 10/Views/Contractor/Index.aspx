﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OAMS.Models.Contractor>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Contractor List</h2>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <div>
    <table id="tblResult" class="display">
        <thead>
            <tr>
                <th></th>
                <th>
                    Name
                </th>
                <th>
                    Address
                </th>
                <th>
                    Telephone
                </th>
                <th>
                    Contact Name
                </th>
                <th>
                    Contact Phone
                </th>
                <th>
                    Contact Email
                </th>
            </tr>
        </thead>
        <tbody>
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %> 
                <%--|--%>
                <%--<%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>--%>
            </td>
            <td>
                <%: item.Name %>
            </td>
            <td>
                <%: item.Address %>
            </td>
            <td>
                <%: item.Telephone %>
            </td>
            <td>
                <%: item.ContactName %>
            </td>
            <td>
                <%: item.ContactPhone %>
            </td>
            <td>
                <%: item.ContactEmail %>
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
            var oTable = $('#tblResult').dataTable({ "aaSorting": [[1, "asc"]] });
        });
    </script>
</asp:Content>
