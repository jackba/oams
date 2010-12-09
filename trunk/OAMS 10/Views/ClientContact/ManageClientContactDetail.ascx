<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ClientContact>" %>
<div id='<%= "divManageClientContactDetail" + Model.ID.ToString()%>'>
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
        <tbody id='<%= "divManageClientContactDetailList" + Model.ID.ToString()%>'>
            <% foreach (var item in Model.ClientContactDetails)
               { %>
            <% Html.RenderPartial("~/Views/ClientContactDetail/View.ascx", item); %>
            <% } %>
        </tbody>
    </table>
    <div>
        <%: Html.ActionLink("Add", "Add", "ClientContactDetail", new { href = string.Format("javascript:AddClientContactDetail({0})", Model.ID) })%>
    </div>
</div>
