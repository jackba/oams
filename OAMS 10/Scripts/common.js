﻿
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


function AjaxEdit(ID, divID, editUrl) {
    $.ajax({
        url: editUrl, type: "GET",
        data: { id: ID },
        success: function (data) {

            $('#' + divID).empty().append(data);
        }

    })

}

function AjaxSave(divID, editUrl) {
    var inputData = $('#' + divID + ' *').serialize();
    $.ajax({
        url: editUrl, type: "POST",
        data: inputData,
        success: function (data) {

            $('#' + divID).empty().append(data);
        }

    })

}

function AjaxView(timelineID, divID, editUrl) {
    $.ajax({
        url: editUrl, type: "POST",
        data: { id: timelineID },
        success: function (data) {
            $('#' + divID).empty().append(data);
        }

    })

}

function AjaxDelete(ID, divID, editUrl) {
    if (confirm('Delete?')) {
        $.ajax({
            url: editUrl, type: "POST",
            data: { id: ID },
            success: function (data) {
                //$('#' + divID).empty().append(data);
                $('#' + divID).remove();
            }

        })
    }
}



//Begin Preview image on client drive
/***** CUSTOMIZE THESE VARIABLES *****/
// width to resize large images to
var maxWidth = 500;
// height to resize large images to
var maxHeight = 500;
// valid file types
var fileTypes = ["bmp", "gif", "png", "jpg", "jpeg"];
// the id of the preview image tag
var outImage = "previewField";
// what to display when the image is not valid
var defaultPic = "spacer.gif";
/***** DO NOT EDIT BELOW *****/
function preview(what, index) {
    var source = what.value;
    var ext = source.substring(source.lastIndexOf(".") + 1, source.length).toLowerCase();
    for (var i = 0; i < fileTypes.length; i++) {
        if (fileTypes[i] == ext) {
            break;
        }
    }
    globalPic = new Image();
    if (i < fileTypes.length) {

        //Obtenemos los datos de la imagen de firefox
        try {
            globalPic.src = what.files[0].getAsDataURL();
        } catch (err) {
            globalPic.src = source;
        }
    } else {
        globalPic.src = defaultPic;
        alert("ESTA NO ES UNA IMAGEN VALIDA por favor escoge una imagen de tipo:nn" + fileTypes.join(", "));
    }
    setTimeout("applyChanges(" + index + ")", 200);
}

var globalPic;
function applyChanges(index) {
    var field = document.getElementById(outImage + index);
    var x = parseInt(globalPic.width);
    var y = parseInt(globalPic.height);
    if (x > maxWidth) {
        y *= maxWidth / x;
        x = maxWidth;
    }
    if (y > maxHeight) {
        x *= maxHeight / y;
        y = maxHeight;
    }
    field.style.display = (x < 1 || y < 1) ? "none" : "";
    field.src = globalPic.src;
    field.width = x;
    field.height = y;
}


