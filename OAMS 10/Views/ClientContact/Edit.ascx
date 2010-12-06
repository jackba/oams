<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ClientContact>" %>
<hr style="color: #f00;background-color: #f00;height: 1px;"/>
<div style="float:left;">
    <%: Html.ValidationSummary(true) %>
    <%: Html.HiddenFor(model => model.ID) %>
    <%: Html.HiddenFor(model => model.ClientID)%>
</div>
<div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;height:20px;">
    <%: Html.TextBoxFor(model => model.Tittle, new { style = "width: 118px;" })%>
</div>
<div style="width:200px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;height:20px;">
    <%: Html.TextBoxFor(model => model.Name, new { style = "width: 198px;" })%>
</div>
<div style="width:150px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;height:20px;">
    <%: Html.TextBoxFor(model => model.Note, new { style = "width: 148px;" })%>
</div>
<div style="width:150px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;height:20px;">
    <%: Html.ActionLink("Save", "Edit", "ClientContact", new { href = string.Format("javascript:AjaxSave('{0}','{1}');", "divClientContact_" + Model.ID.ToString(), Url.Content("~/ClientContact/Edit")) })%>
    |
    <%: Html.ActionLink("Cancel", "View", "ClientContact", new { href = string.Format("javascript:AjaxView({0},'{1}','{2}');", Model.ID, "divClientContact_" + Model.ID.ToString(), Url.Content("~/ClientContact/View")) })%>
</div>
<div style="clear:both;"><b>Contact details:</b></div>
<div style="float:left;margin-left:20px;">
    <% Html.RenderPartial("ManageClientContactDetail", Model); %>
</div>
<div style="clear:both;"></div>
<hr style="color: #f00;background-color: #f00;height: 1px;" />