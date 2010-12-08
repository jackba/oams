<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ContractorContactDetail>" %>
<div id='<%= "divContractorContactDetail_" + Model.ID.ToString() %>' style="float:left;">
    <div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;word-wrap:break-word;">
        <%: Model.ContactType!=null?Model.ContactType:"_"%>
    </div>
    <div style="width:200px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;word-wrap:break-word;">
        <%: Model.Value != null ? Model.Value : "_"%>
    </div>
    <div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;word-wrap:break-word;">
        <%: Model.Note != null ? Model.Note : "_"%>
    </div>
    <div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
        <%: Html.ActionLink("Edit", "Edit", "ContractorContactDetail", new { href = string.Format("javascript:AjaxEdit({0},'{1}','{2}');", Model.ID, "divContractorContactDetail_" + Model.ID.ToString(), Url.Content("~/ContractorContactDetail/Edit")) })%>
        |
        <%: Html.ActionLink("Delete", "Delete", "ContractorContactDetail", new { href = string.Format("javascript:AjaxDelete({0},'{1}','{2}');", Model.ID, "divContractorContactDetail_" + Model.ID.ToString(), Url.Content("~/ContractorContactDetail/Delete")) })%>
    </div>
</div>
<div style="clear:both;"></div>