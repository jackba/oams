<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ClientContact>" %>
<div id='<%= "divClientContact_" + Model.ID.ToString() %>' style="float:left;">
    <div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
        <%: Model.Tittle!=null?Model.Tittle:"_"%>
    </div>
    <div style="width:200px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
        <%: Model.Name!=null?Model.Name:"_"%>
    </div>
    <div style="width:150px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
        <%: Model.Note!=null?Model.Note:"_"%>
    </div>
    <div style="width:150px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
        <%: Html.ActionLink("Edit", "Edit", "ClientContact", new { href = string.Format("javascript:AjaxEdit({0},'{1}','{2}');", Model.ID, "divClientContact_" + Model.ID.ToString(), Url.Content("~/ClientContact/Edit")) })%>
        |
        <%: Html.ActionLink("Delete", "Delete", "ClientContact", new { href = string.Format("javascript:AjaxDelete({0},'{1}','{2}');", Model.ID, "divClientContact_" + Model.ID.ToString(), Url.Content("~/ClientContact/Delete")) })%>
    </div>
</div>
<div style="clear:both;"></div>
