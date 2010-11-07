<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.Site>" %>
<div id="divManageSiteDetail" style="overflow:auto;width:550px;" >
    <table>
        <thead>
            <tr>
                <th>
                    Name
                </th>
                <th>
                    Format
                </th>
                <th>
                    Client
                </th>
                <th>
                    Product
                </th>
                <th>
                    Category
                </th>
                <th>
                </th>
            </tr>
        </thead>
        <tbody id="divManageSiteDetailList">
            <% foreach (var item in Model.SiteDetails)
               { %>
            <% Html.RenderPartial("~/Views/SiteDetail/View.ascx", item); %>
            <% } %>
        </tbody>
    </table>
    <div>
        <%: Html.ActionLink("Add", "Add", "SiteDetail", new { href = string.Format("javascript:AddSiteDetail({0})", Model.ID) })%>
        <script type="text/javascript" language="javascript">
            function AddSiteDetail(siteID) {
                $.ajax({
                    url: '<%= Url.Content("~/SiteDetail/Add") %>', type: "GET",
                    data: { siteID: siteID },
                    success: function (data) {
                        $("#divManageSiteDetailList").append(data);
                    }
                })
            }
        </script>
    </div>
</div>
