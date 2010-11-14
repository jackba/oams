<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OAMS.Models.Contract>" %>
<fieldset>
    <table width="100%">
        <tr>
            <td width="90%">
                <h1>Inspection Report</h1>
                <br />
                <table>
                    <tr>
                        <td>Client: <%: Model.ClientName %></td>
                        <td>Campaign Date: <%: Convert.ToDateTime(ViewData["dFrom"]).ToShortDateString() %> - <%: Convert.ToDateTime(ViewData["dTo"]).ToShortDateString() %></td>
                    </tr>
                    <tr>
                        <td>Campaign:</td>
                        <td>Reporting Period</td>
                    </tr>
                </table>
            </td>
            <td>
                <div style="text-align:center;">
                    <img src="<%= Url.Content("~/Content/Image/ambient.png")%>" alt="Ambient" />
                    <h2>MONITORING</h2>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table>
                    <tr style="background-color:#0000FF;color:#FFFFFF;text-align:center;">
                        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                        <td colspan="2">Latest Dates</td>
                        <td colspan="5">Lighting</td>
                        <td colspan="4">Status of Creative</td>
                        <td></td>
                        <td colspan="6">Follow Up</td>
                        <td></td>
                    </tr>
                    <tr style="background-color:#0000FF;color:#FFFFFF;text-align:center;">
                        <td>#</td>
                        <td>Site Code</td>
                        <td>Supplier</td>
                        <td>Province</td>
                        <td>District</td>
                        <td>Street</td>
                        <td>Size(W x H)</td>
                        <td>Client</td>
                        <td>Product</td>
                        <td>Creative</td>
                        <td>Advertising Type</td>
                        <td>Format Execution</td>
                        <td>Inspect</td>
                        <td>Photo</td>
                        <td>Back/Front</td>
                        <td>Working</td>
                        <td>No. of Bulbs</td>
                        <td>Bulbs Working</td>
                        <td>Issue</td>
                        <td>Clean</td>
                        <td>Creative Good Condition</td>
                        <td>External Interference</td>
                        <td>Vandalism</td>
                        <td>Additional Comments / Follow Up</td>
                        <td>Required</td>
                        <td>Action</td>
                        <td>Date</td>
                        <td>Now Fixed</td>
                        <td>Date</td>
                        <td>Photo</td>
                        <td>Additional Comments / Follow Up</td>
                    </tr>
                    <% 
                        int index = 1;
                        int totalWorking = 0;
                        int totalIssues = 0;
                        int totalClean = 0;
                        int totalCreativeGoodCondition = 0;
                        int totalExternnalInterference = 0;
                        int totalVandalism = 0;
                        int totalRequiredFollowUp = 0;
                        int totalNowFixed = 0;
                        foreach (OAMS.Models.ContractDetail cd in Model.ContractDetails)
                        {
                            DateTime? lastDate = null;
                            OAMS.Models.SiteMonitoring sm = new OAMS.Models.SiteMonitoring();
                            List<OAMS.Models.SiteMonitoring> lst = cd.SiteMonitorings.Where(
                                r =>
                                r.ContractDetail.ContractDetailTimelines.Where(rr => rr.Order == r.Order).ToList().Count > 0 && r.ContractDetail.ContractDetailTimelines.Where(rr => rr.Order == r.Order).ToList()[0].IsIn(Convert.ToDateTime(ViewData["dFrom"]), Convert.ToDateTime(ViewData["dTo"]))
                            ).ToList();// OrderByDescending(item => item.Order).First();
                            if (lst.Count > 0)
                            {
                                sm = lst.OrderByDescending(item => item.Order).First();
                                foreach (OAMS.Models.SiteMonitoringPhoto item in sm.SiteMonitoringPhotoes)
                                {
                                    if (item.TakenDate != null && (lastDate == null || lastDate < item.TakenDate))
                                    {
                                        lastDate = item.TakenDate;
                                    }
                                }
                            }
                    %>
                            <tr>
                            <td><%: index %></td>
                            <td><%: cd.Site.Code %></td>
                            <td><%: cd.Site.ContractorName %></td>
                            <td><%: cd.Site.Geo1 != null ? cd.Site.Geo1.FullName : "" %></td>
                            <td><%: cd.Site.Geo2 != null ? cd.Site.Geo2.Name : "" %></td>
                            <td><%: cd.Site.Geo3 != null ? cd.Site.AddressLine1 + " " + cd.Site.AddressLine2 + " " + cd.Site.Geo3.Name : "" %></td>
                            <td><%: cd.Site.Width %>m X <%: cd.Site.Height %>m</td>
                            <td></td>
                            <td><%: cd.Product %></td>
                            <td></td>
                            <td><%: cd.Site.Type %></td>
                            <td><%: cd.Format %></td>
                            <td><%: lastDate.ToStringVN() %></td>
                            <td><%: lastDate.ToStringVN() %></td>
                            <td><%: cd.Site.BacklitFormat != null?"Backlit":"Frontlit" %></td>
                            <td><%: (sm.Working.HasValue && sm.Working.Value) ? "Yes" : (sm.Working.HasValue?"No":"")%></td>
                            <td><%: sm.NoOfBullbs %></td>
                            <td><%: sm.BullsWorking %></td>
                            <td><%: sm.Issues %></td>
                            <td><%: (sm.Clean.HasValue && sm.Clean.Value) ? "Yes" : (sm.Clean.HasValue?"No":"")%></td>
                            <td><%: (sm.CreativeGoodConditon.HasValue && sm.CreativeGoodConditon.Value) ? "Yes" : (sm.CreativeGoodConditon.HasValue?"No":"")%></td>
                            <td><%: (sm.ExternalInterference.HasValue && sm.ExternalInterference.Value) ? "Yes" : (sm.ExternalInterference.HasValue?"No":"")%></td>
                            <td><%: (sm.Vandalism.HasValue && sm.Vandalism.Value) ? "Yes" : (sm.Vandalism.HasValue?"No":"")%></td>
                            <td><%: sm.Comments %></td>
                            <td><%: (sm.RequiredFollowUp.HasValue && sm.RequiredFollowUp.Value) ? "Yes" : (sm.RequiredFollowUp.HasValue?"No":"")%></td>
                            <td><%: sm.Action %></td>
                            <td><%: sm.DateOfProblem.ToStringVN()%></td>
                            <td><%: (sm.NowFixed.HasValue && sm.NowFixed.Value) ? "Yes" : (sm.NowFixed.HasValue?"No":"")%></td>
                            <td><%: sm.DateFixed.ToStringVN()%></td>
                            <td></td>
                            <td></td>
                            </tr>
                    <%
                            index++;
                            if (sm.Working.HasValue && sm.Working.Value) totalWorking++;
                            if (sm.Issues != null) totalIssues++;
                            if (sm.Clean.HasValue && sm.Clean.Value) totalClean++;
                            if (sm.CreativeGoodConditon.HasValue && sm.CreativeGoodConditon.Value) totalCreativeGoodCondition++;
                            if (sm.ExternalInterference.HasValue && sm.ExternalInterference.Value) totalExternnalInterference++;
                            if (sm.Vandalism.HasValue && sm.Vandalism.Value) totalVandalism++;
                            if (sm.RequiredFollowUp.HasValue && sm.RequiredFollowUp.Value) totalRequiredFollowUp++;
                            if (sm.NowFixed.HasValue && sm.NowFixed.Value) totalNowFixed++;
                        }
                    %>
                    <tr style="background-color:#0000FF;color:#FFFFFF;text-align:center;">
                        <td>Total</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><%: totalWorking %></td>
                        <td></td>
                        <td></td>
                        <td><%: totalIssues %></td>
                        <td><%: totalClean %></td>
                        <td><%: totalCreativeGoodCondition %></td>
                        <td><%: totalExternnalInterference %></td>
                        <td><%: totalVandalism %></td>
                        <td></td>
                        <td><%: totalRequiredFollowUp %></td>
                        <td></td>
                        <td></td>
                        <td><%: totalNowFixed %></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</fieldset>
