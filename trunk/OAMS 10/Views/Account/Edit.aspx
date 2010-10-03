<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.UserModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Fields</legend>
        <%: Html.DisplayFor(model => model.Username) %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.RolesList) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.RolesList) %>
            <%: Html.ValidationMessageFor(model => model.RolesList) %>
        </div>
        <%
            foreach (var item in OAMS.Models.ProjectRoles.All)
            {
                string strChecked = Roles.IsUserInRole(Model.Username, item) ? "checked" : string.Empty;
        %>
        <div>
            <% if (Roles.IsUserInRole(Model.Username, item))
               {
            %>
            <input type="checkbox" name="RoleList" value="<%= item %>" checked="checked" id='chk_<%= item %>' />
            <% }
               else
               {%>
            <input type="checkbox" name="RoleList" value="<%= item %>" id='Checkbox1' />
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
