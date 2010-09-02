
function SetAutoCompleteForContractor(nameOfTxtContractorName, nameOfTxtContractorID) {
    $("#" + nameOfTxtContractorName).autocomplete({
        select: function (event, ui) { $("#" + nameOfTxtContractorID).val(ui.item.id); },
        source: function (request, response) {
            $.ajax({
//                url: '<%= Url.Content("~/Listing/ListContractor") %>', type: "POST", dataType: "json",
                url: '/Listing/ListContractor', type: "POST", dataType: "json",
                data: { searchText: request.term, maxResults: 10 },
                success: function (data) {
                    response($.map(data, function (item) {
                        return { label: item.Name, value: item.Name, id: item.ID }
                    }))
                }
            })
        }
    });
}
