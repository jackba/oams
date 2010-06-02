<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.Campaign>" %>

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
            <%: Html.LabelFor(model => model.ClientID) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownListFor(model => model.ClientID, OAMS.Models.ClientRepository.Repo.GetAll().ToSelectListItem() , OAMSSetting.messageL.SelectNone)%>
            <%: Html.ValidationMessageFor(model => model.ClientID) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.EffectiveDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EffectiveDate) %>
            <%: Html.ValidationMessageFor(model => model.EffectiveDate) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.TermDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TermDate) %>
            <%: Html.ValidationMessageFor(model => model.TermDate) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Cost) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Cost, String.Format("{0:F}", Model.Cost)) %>
            <%: Html.ValidationMessageFor(model => model.Cost) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ProductionCost) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.ProductionCost, String.Format("{0:F}", Model.ProductionCost)) %>
            <%: Html.ValidationMessageFor(model => model.ProductionCost) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Note) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Note) %>
            <%: Html.ValidationMessageFor(model => model.Note) %>
        </div>
        <p>
            <input type="submit" value="Save" />
        </p>
        <%: Html.ActionLink("Add Site", "Find", "FindSite", new { CampaignID = Model.ID  },null)%>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
