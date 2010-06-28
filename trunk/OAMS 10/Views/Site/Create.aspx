<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OAMS.Models.Site>" %>

<%@ Import Namespace="OAMS.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Create</h2>
    <% Html.EnableClientValidation(); %>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Fields</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Code) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Code)%>
            <%: Html.ValidationMessageFor(model => model.Code) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.FullGeoName)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.FullGeoName, "AutoCompleteGeo")%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Style) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(r => r.Style) %>
            <%: Html.ValidationMessageFor(model => model.Style) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Material) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(r => r.Material) %>
            <%: Html.ValidationMessageFor(model => model.Material) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CBDViewed) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(r => r.CBDViewed) %>
            <%: Html.ValidationMessageFor(model => model.CBDViewed) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Height) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Height) %>
            <%: Html.ValidationMessageFor(model => model.Height) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Width) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Width) %>
            <%: Html.ValidationMessageFor(model => model.Width) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Direction) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(r => r.Direction) %>
            <%: Html.ValidationMessageFor(model => model.Direction)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Grade) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.Grade) %>
            <%: Html.ValidationMessageFor(model => model.Grade) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.RoadType1) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.RoadType1) %>
            <%: Html.ValidationMessageFor(model => model.RoadType1) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.RoadType2) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.RoadType2) %>
            <%: Html.ValidationMessageFor(model => model.RoadType2) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ViewingSpeed) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.ViewingSpeed)%>
            <%: Html.ValidationMessageFor(model => model.ViewingSpeed)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Frontlit) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.Frontlit)%>
            <%: Html.ValidationMessageFor(model => model.Frontlit)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.FrontlitNumerOfLamps) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.FrontlitNumerOfLamps)%>
            <%: Html.ValidationMessageFor(model => model.FrontlitNumerOfLamps)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Backlit) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.Backlit)%>
            <%: Html.ValidationMessageFor(model => model.Backlit)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.DistanceFromRoadside) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.DistanceFromRoadside) %>
            <%: Html.ValidationMessageFor(model => model.DistanceFromRoadside) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.AboveStreet) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.AboveStreet) %>
            <%: Html.ValidationMessageFor(model => model.AboveStreet) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ViewingDistance) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.ViewingDistance)%>
            <%: Html.ValidationMessageFor(model => model.ViewingDistance)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.InstallationPosition1) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.InstallationPosition1)%>
            <%: Html.ValidationMessageFor(model => model.InstallationPosition1)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.InstallationPosition2) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.InstallationPosition2)%>
            <%: Html.ValidationMessageFor(model => model.InstallationPosition2)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.VisibilityBuilding) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.VisibilityBuilding)%>
            <%: Html.ValidationMessageFor(model => model.VisibilityBuilding)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.VisibilityTrees) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.VisibilityTrees)%>
            <%: Html.ValidationMessageFor(model => model.VisibilityTrees)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.VisibilityBridgeWalkway) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.VisibilityBridgeWalkway)%>
            <%: Html.ValidationMessageFor(model => model.VisibilityBridgeWalkway)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.VisibilityElectricityPolesOther) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.VisibilityElectricityPolesOther)%>
            <%: Html.ValidationMessageFor(model => model.VisibilityElectricityPolesOther)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.VisualClutter) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.VisualClutter) %>
            <%: Html.ValidationMessageFor(model => model.VisualClutter) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.DirectionalTrafficPublicTransport) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.DirectionalTrafficPublicTransport)%>
            <%: Html.ValidationMessageFor(model => model.DirectionalTrafficPublicTransport)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.ShopSignsBillboards) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.ShopSignsBillboards)%>
            <%: Html.ValidationMessageFor(model => model.ShopSignsBillboards)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.FlagsTemporaryBannersPromotionalItems) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.FlagsTemporaryBannersPromotionalItems)%>
            <%: Html.ValidationMessageFor(model => model.FlagsTemporaryBannersPromotionalItems)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CompetitiveProductSigns) %>
        </div>
        <div class="editor-field">
            <%: Html.CodeMasterDropDownListFor(model => model.CompetitiveProductSigns)%>
            <%: Html.ValidationMessageFor(model => model.CompetitiveProductSigns)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToAirport) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToAirport) %>
            <%: Html.ValidationMessageFor(model => model.CloseToAirport) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToFactory) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToFactory) %>
            <%: Html.ValidationMessageFor(model => model.CloseToFactory) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToGasStation) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToGasStation)%>
            <%: Html.ValidationMessageFor(model => model.CloseToGasStation) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToHopistal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToHopistal)%>
            <%: Html.ValidationMessageFor(model => model.CloseToHopistal) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToMarket) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToMarket)%>
            <%: Html.ValidationMessageFor(model => model.CloseToMarket) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToOffice) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToOffice)%>
            <%: Html.ValidationMessageFor(model => model.CloseToOffice) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToParking) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToParking)%>
            <%: Html.ValidationMessageFor(model => model.CloseToParking) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToResident) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToResident)%>
            <%: Html.ValidationMessageFor(model => model.CloseToResident) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToSchool) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToSchool)%>
            <%: Html.ValidationMessageFor(model => model.CloseToSchool) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToShopping) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToShopping)%>
            <%: Html.ValidationMessageFor(model => model.CloseToShopping) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToStadium) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToStadium)%>
            <%: Html.ValidationMessageFor(model => model.CloseToStadium) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToStation) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToStation)%>
            <%: Html.ValidationMessageFor(model => model.CloseToStation) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToTownCenter) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToTownCenter)%>
            <%: Html.ValidationMessageFor(model => model.CloseToTownCenter) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CloseToUniversity) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CloseToUniversity)%>
            <%: Html.ValidationMessageFor(model => model.CloseToUniversity) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NumberOfPanel) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.NumberOfPanel) %>
            <%: Html.ValidationMessageFor(model => model.NumberOfPanel) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.PanelCode) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.PanelCode) %>
            <%: Html.ValidationMessageFor(model => model.PanelCode) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Longitude) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Longitude) %>
            <%: Html.ValidationMessageFor(model => model.Longitude) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Latitude) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Latitude) %>
            <%: Html.ValidationMessageFor(model => model.Latitude) %>
        </div>
        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
