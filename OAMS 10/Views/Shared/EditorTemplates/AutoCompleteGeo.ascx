<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%= Html.TextBox("", ViewData.TemplateInfo.FormattedModelValue, new { @class = "text-box single-line" }) %>

<script type="text/javascript" language="javascript">
    $(function () {
        $("#<%= ViewData.ModelMetadata.PropertyName %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/Listing/ListGeos", type: "POST", dataType: "json",
                    data: { searchText: request.term, maxResults: 10 },
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
