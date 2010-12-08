<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ContractorContact>" %>
<div id='<%= "divManageContractorContactDetail" + Model.ID.ToString()%>'>
    <div id='<%= "divManageContractorContactDetailList" + Model.ID.ToString()%>'>
        <div style="float:left;">
            <div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
                <b>Contact Type</b>
            </div>
            <div style="width:200px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
                <b>Value</b>
            </div>
            <div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
                <b>Note</b>
            </div>
            <div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
                <b>Action</b>
            </div>
        </div>
        <div style="clear:both;"></div>
        <% foreach (var item in Model.ContractorContactDetails)
        { %>
        <% Html.RenderPartial("~/Views/ContractorContactDetail/View.ascx", item); %>
        <% } %>
    </div>
    <div style="clear:both;"></div>
    <div>
        <%: Html.ActionLink("Add", "Add", "ContractorContactDetail", new { href = string.Format("javascript:AddContractorContactDetail({0})", Model.ID) })%>
    </div>
</div>
