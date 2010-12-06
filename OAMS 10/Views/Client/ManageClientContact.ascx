<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.Client>" %>
<script type="text/javascript" language="javascript">
    function AddClientContactDetail(clientContactID) {
        $.ajax({
            url: '<%= Url.Content("~/ClientContactDetail/Add") %>', type: "GET",
            data: { clientContactID: clientContactID },
            success: function (data) {
                $("#divManageClientContactDetailList").append(data);
            }
        });
    }
</script>
<div id="divManageClientContact">
    <div id="divManageClientContactList">
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
        <% foreach (var item in Model.ClientContacts)
        { %>
        <% Html.RenderPartial("~/Views/ClientContact/View.ascx", item); %>
        <% } %>
    </div>
    <div style="clear:both;"></div>
    <div>
        <%: Html.ActionLink("Add", "Add", "ClientContact", new { href = string.Format("javascript:AddClientContact({0})", Model.ID) })%>
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
</div>
