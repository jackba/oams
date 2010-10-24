<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.ContractTimeline>" %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>Fields</legend>
    <%: Html.HiddenFor(model => model.ID) %>
    <%: Html.HiddenFor(model => model.Order) %>
    <%: Html.HiddenFor(model => model.ContractID) %>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.Order) %>: <%: Html.DisplayFor(model => model.Order) %>
        
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.FromDate) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.FromDate) %>
        <%: Html.ValidationMessageFor(model => model.FromDate) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.ToDate) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.ToDate) %>
        <%: Html.ValidationMessageFor(model => model.ToDate) %>
    </div>
    <p>
        <%: Html.ActionLink("Save", "Edit", "ContractTimeline", new { href = string.Format("javascript:SaveTimeline({0},'{1}','{2}');", Model.ID, "divContractTimeline_" + Model.ID.ToString(), Url.Content("~/ContractTimeLine/Edit")) })%>
        |
        <%: Html.ActionLink("Cancel", "View", "ContractTimeline", new { href = string.Format("javascript:ViewTimeline({0},'{1}','{2}');", Model.ID, "divContractTimeline_" + Model.ID.ToString(), Url.Content("~/ContractTimeLine/View")) })%>
    </p>
</fieldset>
