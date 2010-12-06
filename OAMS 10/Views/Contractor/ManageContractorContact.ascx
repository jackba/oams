<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.Contractor>" %>
<script type="text/javascript" language="javascript">
    function AddContractorContactDetail(contractorContactID) {
        $.ajax({
            url: '<%= Url.Content("~/ContractorContactDetail/Add") %>', type: "GET",
            data: { contractorContactID: contractorContactID },
            success: function (data) {
                $("#divManageContractorContactDetailList").append(data);
            }
        });
    }
</script>
<div id="divManageContractorContact">
    <div id="divManageContractorContactList">
        <div style="float:left;">
            <div style="width:120px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
                <b>Title</b>
            </div>
            <div style="width:200px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
                <b>Name</b>
            </div>
            <div style="width:150px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
                <b>Note</b>
            </div>
            <div style="width:150px;float:left;border:1px solid #000000;margin-right:2px;padding:2px;">
                <b>Action</b>
            </div>
        </div>
        <div style="clear:both;"></div>
        <% foreach (var item in Model.ContractorContacts)
        { %>
        <% Html.RenderPartial("~/Views/ContractorContact/View.ascx", item); %>
        <% } %>
    </div>
    <div style="clear:both;"></div>
    <div>
        <%: Html.ActionLink("Add", "Add", "ContractorContact", new { href = string.Format("javascript:AddContractorContact({0})", Model.ID) })%>
        <script type="text/javascript" language="javascript">
            function AddContractorContact(contractorID) {
                $.ajax({
                    url: '<%= Url.Content("~/ContractorContact/Add") %>', type: "GET",
                    data: { contractorID: contractorID },
                    success: function (data) {
                        $("#divManageContractorContactList").append(data);
                    }
                })
            }
        </script>
    </div>
</div>
