<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS_10.Models.ContractDetail>" %>
<%--<%= Html.TextBox("", String.Format("{0:d}", ViewData.TemplateInfo.FormattedModelValue), new { @class = "text-box single-line" }) %>--%>
<%= Html.EditorFor(r => r.ID) %> |
<%= Html.EditorFor(r => r.EffectiveDate) %>
<%--<%= Html.TextBox("", ViewData.TemplateInfo.FormattedModelValue, new { @class = "text-box single-line" }) %>--%>
