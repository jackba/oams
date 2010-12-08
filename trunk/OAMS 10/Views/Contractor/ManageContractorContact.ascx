<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.Contractor>" %>
<script type="text/javascript" language="javascript">
    function AddContractorContactDetail(contractorContactID) {
        $.ajax({
            url: '<%= Url.Content("~/ContractorContactDetail/Add") %>', type: "GET",
            data: { contractorContactID: contractorContactID },
            success: function (data) {
                $("#divManageContractorContactDetailList" + contractorContactID).append(data);
            }
        });
    }
</script>
<div id="divManageContractorContact">
    <table>
        <thead>
            <tr>
                <td>
                    Title
                </td>
                <td>
                    Name
                </td>
                <td>
                    Note
                </td>
                <td>
                    Action
                </td>
            </tr>
        </thead>
        <tbody id="divManageContractorContactList">
            <% foreach (var item in Model.ContractorContacts)
               { %>
            <% Html.RenderPartial("~/Views/ContractorContact/View.ascx", item); %>
            <% } %>
        </tbody>
    </table>
    <div>
        <%: Html.ActionLink("Add", "Add", "ContractorContact", new { href = string.Format("javascript:AddContractorContact({0})", Model.ID) })%>
    </div>
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
