<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OAMS.Models.Contract>>" %>

<%@ Import Namespace="OAMS.Models" %>
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
                Number
            </th>
            <th>
                EffectiveDate
            </th>
            <th>
                TermDate
            </th>
            <th>
                Contractor
            </th>
            <th>
                Total Sites
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %>
            </td>
            <td>
                <%: item.Number %>
            </td>
            <td>
                <%: String.Format("{0:MM/dd/yyyy}", item.EffectiveDate) %>
            </td>
            <td>
                <%: String.Format("{0:MM/dd/yyyy}", item.TermDate) %>
            </td>
            <td>
                <%: item.Contractor.Name %>
            </td>
            <td>
                <%: item.ContractDetails.Count %>
            </td>
        </tr>
        <% } %>
    </table>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
</asp:Content>
