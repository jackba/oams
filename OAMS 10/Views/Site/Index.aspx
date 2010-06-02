<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OAMS.Models.Site>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Geo1ID
            </th>
            <th>
                Geo2ID
            </th>
            <th>
                Geo3ID
            </th>
            <th>
                Style
            </th>
            <th>
                Code
            </th>
            <th>
                Material
            </th>
            <th>
                CBDViewed
            </th>
            <th>
                Height
            </th>
            <th>
                Width
            </th>
            <th>
                Size
            </th>
            <th>
                Grade
            </th>
            <th>
                RoadType
            </th>
            <th>
                TrafficSpeed
            </th>
            <th>
                Illumination
            </th>
            <th>
                DistanceFromRoadside
            </th>
            <th>
                AboveStreet
            </th>
            <th>
                DurationOfView
            </th>
            <th>
                AngleOfVision
            </th>
            <th>
                VisualClutter
            </th>
            <th>
                CloseToAirport
            </th>
            <th>
                CloseToFactory
            </th>
            <th>
                CloseToGasStation
            </th>
            <th>
                CloseToHopistal
            </th>
            <th>
                CloseToMarket
            </th>
            <th>
                CloseToOffice
            </th>
            <th>
                CloseToParking
            </th>
            <th>
                CloseToResident
            </th>
            <th>
                CloseToSchool
            </th>
            <th>
                CloseToShopping
            </th>
            <th>
                CloseToStadium
            </th>
            <th>
                CloseToStation
            </th>
            <th>
                CloseToTownCenter
            </th>
            <th>
                CloseToUniversity
            </th>
            <th>
                NumberOfPanel
            </th>
            <th>
                PanelCode
            </th>
            <th>
                Longitude
            </th>
            <th>
                Latitude
            </th>
            <th>
                StreetLight
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.ID })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>
            </td>
            <td>
                <%: item.ID %>
            </td>
            <td>
                <%: item.Geo1ID %>
            </td>
            <td>
                <%: item.Geo2ID %>
            </td>
            <td>
                <%: item.Geo3ID %>
            </td>
            <td>
                <%: item.Style %>
            </td>
            <td>
                <%: item.Code %>
            </td>
            <td>
                <%: item.Material %>
            </td>
            <td>
                <%: item.CBDViewed %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Height) %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Width) %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Size) %>
            </td>
            <td>
                <%: item.Grade %>
            </td>
            <td>
                <%: item.RoadType %>
            </td>
            <td>
                <%: item.TrafficSpeed %>
            </td>
            <td>
                <%: item.Illumination %>
            </td>
            <td>
                <%: item.DistanceFromRoadside %>
            </td>
            <td>
                <%: item.AboveStreet %>
            </td>
            <td>
                <%: item.DurationOfView %>
            </td>
            <td>
                <%: item.AngleOfVision %>
            </td>
            <td>
                <%: item.VisualClutter %>
            </td>
            <td>
                <%: item.CloseToAirport %>
            </td>
            <td>
                <%: item.CloseToFactory %>
            </td>
            <td>
                <%: item.CloseToGasStation %>
            </td>
            <td>
                <%: item.CloseToHopistal %>
            </td>
            <td>
                <%: item.CloseToMarket %>
            </td>
            <td>
                <%: item.CloseToOffice %>
            </td>
            <td>
                <%: item.CloseToParking %>
            </td>
            <td>
                <%: item.CloseToResident %>
            </td>
            <td>
                <%: item.CloseToSchool %>
            </td>
            <td>
                <%: item.CloseToShopping %>
            </td>
            <td>
                <%: item.CloseToStadium %>
            </td>
            <td>
                <%: item.CloseToStation %>
            </td>
            <td>
                <%: item.CloseToTownCenter %>
            </td>
            <td>
                <%: item.CloseToUniversity %>
            </td>
            <td>
                <%: item.NumberOfPanel %>
            </td>
            <td>
                <%: item.PanelCode %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Longitude) %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Latitude) %>
            </td>
            <td>
                <%: item.StreetLight %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

