<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ContractDetail>" %>
<div id="divManageContractDetailTimeline">
    <div id="divManageContractDetailTimelineList">
        <% foreach (var item in Model.ContractDetailTimelines)
           { %>
        <% Html.RenderPartial("~/Views/ContractDetailTimeline/View.ascx", item); %>
        <% } %>
    </div>
    <div>
        <input id="txtManageContractDetailTimeline_day" type="text" style="width: 50px;" />
        day(s)
        <%: Html.ActionLink("Add", "Add", "ContractDetailTimeline", new { href = string.Format("javascript:AddContractDetailTimeline({0},'{1}')", Model.ID, "day") })%>
        <br />
        <input id="txtManageContractDetailTimeline_month" type="text" style="width: 50px;" />
        month(s)
        <%: Html.ActionLink("Add", "Add", "ContractDetailTimeline", new { href = string.Format("javascript:AddContractDetailTimeline({0},'{1}')", Model.ID, "month") })%>
        <br />
        <%: Html.ActionLink("Delete last timeline", "DeleteTheLastTimeline", "ContractDetailTimeline", new { href = "javascript:DeleteTheLastTimeline(" + Model.ID + ");" })%>
        <script type="text/javascript" language="javascript">

            function AddContractDetailTimeline(contractDetailID, timeUnit) {

                var timeCount = 0;
                if (timeUnit == 'day') {
                    timeCount = $('#txtManageContractDetailTimeline_day').val();
                }
                if (timeUnit == 'month') {
                    timeCount = $('#txtManageContractDetailTimeline_month').val();
                }

                $.ajax({
                    url: '<%= Url.Content("~/ContractDetailTimeLine/Add") %>', type: "POST",
                    data: { contractDetailID: contractDetailID, timeCount: timeCount, timeUnit: timeUnit },
                    success: function (data) {

                        $("#divManageContractDetailTimelineList").append(data);
                    }

                })

            }

            function DeleteTheLastTimeline(contractDetailID) {

                $.ajax({
                    url: '<%= Url.Content("~/ContractDetailTimeline/DeleteTheLastTimeline") %>', type: "POST",
                    data: { contractDetailID: contractDetailID },
                    success: function (data) {

                        $("#divManageContractDetailTimeline").empty().append(data);
                    }

                })

            }
        </script>
    </div>
</div>
