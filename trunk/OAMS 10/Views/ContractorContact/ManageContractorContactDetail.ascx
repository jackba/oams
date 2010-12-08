<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ContractorContact>" %>
<div id='<%= "divManageContractorContactDetail" + Model.ID.ToString()%>'>
    <table>
        <thead>
            <tr>
                <td>
                    Contact Type
                </td>
                <td>
                    Value
                </td>
                <td>
                    Note
                </td>
                <td>
                    Action
                </td>
            </tr>
        </thead>
        <tbody id='<%= "divManageContractorContactDetailList" + Model.ID.ToString()%>'>
            <% foreach (var item in Model.ContractorContactDetails)
               { %>
            <% Html.RenderPartial("~/Views/ContractorContactDetail/View.ascx", item); %>
            <% } %>
        </tbody>
    </table>
    <div>
        <%: Html.ActionLink("Add", "Add", "ContractorContactDetail", new { href = string.Format("javascript:AddContractorContactDetail({0})", Model.ID) })%>
    </div>
</div>
