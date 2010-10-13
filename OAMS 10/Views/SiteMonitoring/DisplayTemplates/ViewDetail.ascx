<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.SiteMonitoring>" %>
    
    <fieldset>
        <legend>Fieldasas</legend>
        as
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.ID %></div>
        
        <div class="display-label">ContractDetailID</div>
        <div class="display-field"><%: Model.ContractDetailID %></div>
        
        <div class="display-label">Working</div>
        <div class="display-field"><%: Model.Working %></div>
        
        <div class="display-label">NoOfBullbs</div>
        <div class="display-field"><%: Model.NoOfBullbs %></div>
        
        <div class="display-label">BullsWorking</div>
        <div class="display-field"><%: Model.BullsWorking %></div>
        
        <div class="display-label">Issues</div>
        <div class="display-field"><%: Model.Issues %></div>
        
        <div class="display-label">Clean</div>
        <div class="display-field"><%: Model.Clean %></div>
        
        <div class="display-label">CreativeGoodConditon</div>
        <div class="display-field"><%: Model.CreativeGoodConditon %></div>
        
        <div class="display-label">ExternalInterference</div>
        <div class="display-field"><%: Model.ExternalInterference %></div>
        
        <div class="display-label">Vandalism</div>
        <div class="display-field"><%: Model.Vandalism %></div>
        
        <div class="display-label">Comments</div>
        <div class="display-field"><%: Model.Comments %></div>
        
        <div class="display-label">RequiredFollowUp</div>
        <div class="display-field"><%: Model.RequiredFollowUp %></div>
        
        <div class="display-label">Action</div>
        <div class="display-field"><%: Model.Action %></div>
        
        <div class="display-label">DateOfProblem</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.DateOfProblem) %></div>
        
        <div class="display-label">NowFixed</div>
        <div class="display-field"><%: Model.NowFixed %></div>
        
        <div class="display-label">DateFixed</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.DateFixed) %></div>
        
        <div class="display-label">CreatedDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.CreatedDate) %></div>
        
        <div class="display-label">CreatedBy</div>
        <div class="display-field"><%: Model.CreatedBy %></div>
        
        <div class="display-label">LastUpdatedDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastUpdatedDate) %></div>
        
        <div class="display-label">LastUpdatedBy</div>
        <div class="display-field"><%: Model.LastUpdatedBy %></div>
        
        <div class="display-label">AlbumUrl</div>
        <div class="display-field"><%: Model.AlbumUrl %></div>
        
        <div class="display-label">BackupAlbumUrl</div>
        <div class="display-field"><%: Model.BackupAlbumUrl %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>


