<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ClientContactDetail>" %>
<% if (Request.HttpMethod == "GET")
   { %>
<tr id='<%= "divClientContactDetail_" + Model.ID.ToString() %>'>
    <%} %>
    <td>
        <%: Model.ContactType!=null?Model.ContactType:"_"%>
    </td>
    <td>
        <%: Model.Value != null ? Model.Value : "_"%>
    </td>
    <td>
        <%: Model.Note != null ? Model.Note : "_"%>
    </td>
    <td>
        <%: Html.ActionLink("Edit", "Edit", "ClientContactDetail", new { href = string.Format("javascript:AjaxEdit({0},'{1}','{2}');", Model.ID, "divClientContactDetail_" + Model.ID.ToString(), Url.Content("~/ClientContactDetail/Edit")) })%>
        |
        <%: Html.ActionLink("Delete", "Delete", "ClientContactDetail", new { href = string.Format("javascript:AjaxDelete({0},'{1}','{2}');", Model.ID, "divClientContactDetail_" + Model.ID.ToString(), Url.Content("~/ClientContactDetail/Delete")) })%>
    </td>
    <% if (Request.HttpMethod == "GET")
       { %>
</tr>
<%} %>
