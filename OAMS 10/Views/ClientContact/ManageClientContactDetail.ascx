<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ClientContact>" %>
<div id="divManageClientContactDetail">
    <div id="divManageClientContactDetailList">
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
        <% foreach (var item in Model.ClientContactDetails)
        { %>
        <% Html.RenderPartial("~/Views/ClientContactDetail/View.ascx", item); %>
        <% } %>
    </div>
    <div style="clear:both;"></div>
    <div>
        <%: Html.ActionLink("Add", "Add", "ClientContactDetail", new { href = string.Format("javascript:AddClientContactDetail({0})", Model.ID) })%>
    </div>
</div>
