<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.SiteDetail>" %>
<% if (Request.HttpMethod == "GET")
   { %>
<tr id='<%= "divSiteDetail_" + Model.ID.ToString() %>'>
    <%} %>
    <td>
        <%: Model.Name %>
    </td>
    <td>
        <%: Model.Format %>
    </td>
    <td>
        <%: Model.Product == null ? "" : Model.Product.NewClientName %>
    </td>
    <td>
        <%: Model.Product == null ? "" : Model.Product.Name %>
    </td>
    <td>
        <%: Model.Product == null ? "" : Model.Product.NewCategoryFullName %>
    </td>
    <td>
        <%: Html.ActionLink("Edit", "Edit", "SiteDetail", new { href = string.Format("javascript:AjaxEdit({0},'{1}','{2}');", Model.ID, "divSiteDetail_" + Model.ID.ToString(), Url.Content("~/SiteDetail/Edit")) })%>
        |
        <%: Html.ActionLink("Delete", "Delete", "SiteDetail", new { href = string.Format("javascript:AjaxDelete({0},'{1}','{2}');", Model.ID, "divSiteDetail_" + Model.ID.ToString(), Url.Content("~/SiteDetail/Delete")) })%>
    </td>
    <% if (Request.HttpMethod == "GET")
       { %>
</tr>
<%} %>
