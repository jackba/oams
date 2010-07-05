<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%= Html.TextBox("", ViewData.TemplateInfo.FormattedModelValue, new { @class = "text-box single-line" }) %>
<script type="text/javascript" language="javascript">
    $(function () {
        $("#<%= ViewData.ModelMetadata.PropertyName %>").autocomplete({
            select: function (event, ui) { showGeo2(ui.item.value); },
            source: function (request, response) {
                $.ajax({
                    url: '<%= Url.Content("~/Listing/ListGeos") %>', type: "POST", dataType: "json",
                    data: { searchText: request.term, maxResults: 10, level: '<%= ViewData["level"]%>' },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return { label: item.FullName, value: item.FullName, id: item.ID }


                        }))
                    }

                })
            }
        });
    });
</script>
