<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<string>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Acouunt In Role
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Fields</legend>
        <%: Html.DisplayFor(model => model) %>
        <div class="editor-label">
            Account List
        </div>
        <%
            foreach (MembershipUser item in Membership.GetAllUsers())
            {
                
                string strChecked = Roles.IsUserInRole(item.UserName, Model) ? "checked" : string.Empty;
        %>
        <div>
            <% if (Roles.IsUserInRole(item.UserName, Model))
               {
            %>
            <input type="checkbox" name="UserList" value="<%= item.UserName %>" checked="checked" id='chk_<%= item %>' />
            <% }
               else
               {%>
            <input type="checkbox" name="UserList" value="<%= item %>" id='Checkbox1' />
            <%} %>
            <label for='chk_<%= item %>'>
                <%: item %>
            </label>
        </div>
        <%
            }
        %>
        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
