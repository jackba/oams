
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


function EditTimeline(timelineID, divID, editUrl) {
    $.ajax({
        url: editUrl, type: "GET",
        data: { id: timelineID },
        success: function (data) {

            $('#' + divID).empty().append(data);
        }

    })

}

function SaveTimeline(timelineID, divID, editUrl) {
    var inputData = $('#' + divID + ' *').serialize();
    $.ajax({
        url: editUrl, type: "POST",
        data: inputData,
        success: function (data) {

            $('#' + divID).empty().append(data);
        }

    })

}

function ViewTimeline(timelineID, divID, editUrl) {
    $.ajax({
        url: editUrl, type: "GET",
        data: { id: timelineID },
        success: function (data) {
            $('#' + divID).empty().append(data);
        }

    })

}

function DeleteTimeline(timelineID, divID, editUrl) {
    if (confirm('Delete?')) {
        $.ajax({
            url: editUrl, type: "GET",
            data: { id: timelineID },
            success: function (data) {
                //$('#' + divID).empty().append(data);
                $('#' + divID).empty();
            }

        })
    }
}



