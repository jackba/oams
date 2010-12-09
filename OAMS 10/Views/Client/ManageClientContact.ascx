<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.Client>" %>
<script type="text/javascript" language="javascript">
    function AddClientContactDetail(clientContactID) {
        $.ajax({
            url: '<%= Url.Content("~/ClientContactDetail/Add") %>', type: "GET",
            data: { clientContactID: clientContactID },
            success: function (data) {
                $("#divManageClientContactDetailList" + clientContactID).append(data);
            }
        });
    }
</script>
<div id="divManageClientContact">
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
        <tbody id="divManageClientContactList">
            <% foreach (var item in Model.ClientContacts)
               { %>
            <% Html.RenderPartial("~/Views/ClientContact/View.ascx", item); %>
            <% } %>
        </tbody>
    </table>
    <div>
        <%: Html.ActionLink("Add", "Add", "ClientContact", new { href = string.Format("javascript:AddClientContact({0})", Model.ID) })%>
    </div>
    <script type="text/javascript" language="javascript">
        function AddClientContact(clientID) {
            $.ajax({
                url: '<%= Url.Content("~/ClientContact/Add") %>', type: "GET",
                data: { clientID: clientID },
                success: function (data) {
                    $("#divManageClientContactList").append(data);
                }
            })
        }
    </script>
</div>
