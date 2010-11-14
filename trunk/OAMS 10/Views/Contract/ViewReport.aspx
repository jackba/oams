<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteFull.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.Contract>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    View
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.DisplayForModel("ViewReportSumary")%>
</asp:Content>



