<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ContractorContactDetail>" %>
<hr style="color: #0f0;background-color: #0f0;height: 1px;" />
<div style="float:left;">
    <%: Html.ValidationSummary(true) %>
    <%: Html.HiddenFor(model => model.ID) %>
    <%: Html.HiddenFor(model => model.ContractorContactID)%>
</div>
<div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;height:20px;">
    <%: Html.CodeMasterDropDownListFor(r => r.ContactType)%>
</div>
<div style="width:200px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;height:20px;">
    <%: Html.TextBoxFor(model => model.Value, new { style = "width: 198px;" })%>
</div>
<div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;height:20px;">
    <%: Html.TextBoxFor(model => model.Note, new { style = "width: 118px;" })%>
</div>
<div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;height:20px;">
    <%: Html.ActionLink("Save", "Edit", "ContractorContactDetail", new { href = string.Format("javascript:AjaxSave('{0}','{1}');", "divContractorContactDetail_" + Model.ID.ToString(), Url.Content("~/ContractorContactDetail/Edit")) })%>
    |
    <%: Html.ActionLink("Cancel", "View", "ContractorContactDetail", new { href = string.Format("javascript:AjaxView({0},'{1}','{2}');", Model.ID, "divContractorContactDetail_" + Model.ID.ToString(), Url.Content("~/ContractorContactDetail/View")) })%>
</div>
<div style="clear:both;"></div>
<hr style="color: #0f0;background-color: #0f0;height: 1px;" />
