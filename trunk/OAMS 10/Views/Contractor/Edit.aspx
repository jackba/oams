<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.Contractor>" %>

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
        <%: Html.HiddenFor(model => model.ID) %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Name) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Name) %>
            <%: Html.ValidationMessageFor(model => model.Name) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Address) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Address) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Telephone) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Telephone) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ContactName) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.ContactName) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ContactPhone) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.ContactPhone) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ContactEmail) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.ContactEmail) %>
        </div>
        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
