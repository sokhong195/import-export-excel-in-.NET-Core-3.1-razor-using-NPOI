// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})
$(function () {
    $('[data-toggle="popover"]').popover();
});
//$(function () {
//    $(".form-control-chosen").chosen();
//});
$(function () {
    $("#loaderbody").addClass('hide');

    $(document).bind('ajaxStart', function () {
        $("#loaderbody").removeClass('hide');
    }).bind('ajaxStop', function () {
        $("#loaderbody").addClass('hide');
    });

});
$("#form-modal").on("hidden.bs.modal", function () {
    var $inputs = $("input");
    if ($inputs.filter("[name=IdModalChucVu]").length > 0) {
        $('#form-modal .modal-body').html("");
        $('#form-modal .modal-title').html("");
    }

});
showInPopup = (url, title) => {
    $.ajax({
        type: 'GET',
        url: url,
        success: function (res) {
            $('#form-modal .modal-body').html(res);
            $('#form-modal .modal-title').html(title);
            $('#form-modal').modal('show');
        }
    })
}
moveTo = (url) => {
    $.ajax({
        type: 'GET',
        url: url,
        success: function (res) {
            if (res.message.indexOf("Lỗi") >= 0) {
                $.notify(res.message, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
            }
            else {
                $.notify(res.message, { globalPosition: 'top-center', className: 'success', autoHideDelay: 20000 });
            }
        }
    })
};
showInPopupCheckList = (controller, url, title) => {
    var id = $("#" + "Id" + controller).val();
    var caption = $("#" + controller).text().trim();
    if (id == null) {
        alert("Lỗi: chưa chọn giá trị " + caption + " trong danh sách!");
    }
    else {
        $.ajax({
            type: 'GET',
            url: url + "/" + id,
            success: function (res) {
                $('#form-modal .modal-body').html(res);
                $('#form-modal .modal-title').html(title);
                $('#form-modal').modal('show');
            }
        })
    }

}
jQueryAjaxPost = (form, idDiv = '') => {
    try {

        $.ajax({
            type: 'POST',
            url: form.action,
            data: new FormData(form),
            contentType: false,
            processData: false,
            success: function (res) {
                if (res.isValid) {
                    $('#form-modal .modal-body').html('');
                    $('#form-modal .modal-title').html('');
                    $('#form-modal').modal('hide');
                    if (res.message.indexOf("Lỗi") >= 0) {
                        $.notify(res.message, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
                    }
                    else {
                        $.notify(res.message, { globalPosition: 'top-center', className: 'success', autoHideDelay: 20000 });
                    } window.setTimeout(function () {
                        if (!(typeof res.href === 'undefined')) {
                            if (res.href.length > 0) {
                                var pos = location.href.indexOf('?');
                                var str = "";
                                if (pos >= 0) {
                                    str = location.href.substring(0, pos);
                                }
                                location.href = str + "?Tab=" + res.href;
                            }
                        }
                        else {
                            location.reload();
                        }
                    }, 2000);
                }
                else {
                    if (idDiv == '')
                        $('#form-modal .modal-body').html(res.html);
                    else
                        $('#' + idDiv).html(res.html);
                    if (!(typeof res.message === 'undefined')) {
                        $.notify(res.message, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
                    }
                }

            },
            error: function (err) {
                $.notify(err, { globalPosition: 'top-center', className: 'error', autoHideDelay: 30000 });
            }
        })
        //to prevent default form submit event
        return false;
    } catch (ex) {
        console.log(ex)
    }
}
jQueryAjaxDelete = (form, msg) => {
    if (confirm(msg)) {
        try {

            $.ajax({
                type: 'POST',
                url: form.action,
                data: new FormData(form),
                contentType: false,
                processData: false,
                success: function (res) {
                    window.setTimeout(function () { location.reload() }, 2000)
                    $.notify(res.message, { globalPosition: 'top-center', className: 'success', autoHideDelay: 10000 });
                },
                error: function (err) {
                    $.notify(err, { globalPosition: 'top-left', className: 'error', autoHideDelay: 20000 });
                }
            })
        } catch (ex) {
            console.log(ex)
        }
    }
    return false;
}
jQueryAjaxDeleteButton = (ctrl, msg) => {
    Confirm("Chú ý", msg);
    $('.doAction').click(function () {
        var data = {};
        var action = '';
        if (ctrl.nodeName == 'BUTTON') {
            action = ctrl.formAction;
            data = {
                __RequestVerificationToken: $('[name= "__RequestVerificationToken"]').val()
            };
            try {

                $.ajax({
                    type: 'POST',
                    url: action,
                    data: data,
                    dataType: 'json',
                    success: function (res) {
                        window.setTimeout(function () { location.reload() }, 2000)
                        $.notify(res.message, { globalPosition: 'top-center', className: 'success', autoHideDelay: 10000 });
                    },
                    error: function (err) {
                        $.notify(err, { globalPosition: 'top-left', className: 'error', autoHideDelay: 20000 });
                    }
                })
            } catch (ex) {
                console.log(ex)
            }
        }
        $(this).parents('.dialog-ovelay').fadeOut(500, function () {
            $(this).remove();
        });
    });
    //if (confirm(msg)) {
    //    var data = {};
    //    var action = '';
    //    if (ctrl.nodeName == 'BUTTON') {
    //        action = ctrl.formAction;
    //        data = {
    //            __RequestVerificationToken: $('[name= "__RequestVerificationToken"]').val()
    //        };
    //        try {

    //            $.ajax({
    //                type: 'POST',
    //                url: action,
    //                data: data,
    //                dataType: 'json',
    //                success: function (res) {
    //                    window.setTimeout(function () { location.reload() }, 2000)
    //                    $.notify(res.message, { globalPosition: 'top-center', className: 'success', autoHideDelay: 10000 });
    //                },
    //                error: function (err) {
    //                    $.notify(err, { globalPosition: 'top-left', className: 'error', autoHideDelay: 20000 });
    //                }
    //            })
    //        } catch (ex) {
    //            console.log(ex)
    //        }
    //    }
    //}
    return false;
}
jQueryAjaxDeleteCheckList = (controller, form, msg) => {
    var id = $("#" + "Id" + controller).val();
    var caption = $("#" + controller).html();
    if (id == null) {
        alert("Lỗi: chưa chọn giá trị " + caption + " trong danh sách!");
    }
    if (confirm(msg)) {
        try {
            $.ajax({
                type: 'POST',
                url: form.action + "/" + id,
                data: new FormData(form),
                contentType: false,
                processData: false,
                success: function (res) {
                    if (res.message.indexOf("Lỗi") >= 0) {
                        $.notify(res.message, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
                    }
                    else {
                        $.notify(res.message, { globalPosition: 'top-center', className: 'success', autoHideDelay: 20000 });
                    }
                    window.setTimeout(function () {
                        if (res.href.length > 0) {
                            var pos = location.href.indexOf('?');
                            var str = "";
                            if (pos >= 0) {
                                str = location.href.substring(0, pos);
                            }
                            location.href = str + "?Tab=" + res.href;
                        }
                        else {
                            location.reload();
                        }
                    }, 2000);
                },
                error: function (err) {
                    $.notify(err, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
                }
            })
        } catch (ex) {
            $.notify(err, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
        }
    }

    //prevent default form submit event
    return false;
}

jQueryAjaxDeleteAll = (form, msg) => {
    if (confirm(msg)) {
        try {
            var data = [];
            $('[name="cbbIsDelete"]:checked').each(function (checkbox) {
                data.push($(this).val());
            });
            if (data.length == 0) {
                alert("Hãy chọn các bản ghi muốn xóa!");
                return false;
            }
            $.ajax({
                type: 'POST',
                url: form,
                data: JSON.stringify(data),
                processData: false,
                dataType: 'JSON',
                contentType: "application/json",
                success: function (res) {
                    if (res.message.indexOf("Lỗi") >= 0) {
                        $.notify(res.message, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
                    }
                    else {
                        $.notify(res.message, { globalPosition: 'top-center', className: 'success', autoHideDelay: 20000 });
                    }
                    window.setTimeout(function () { location.reload(); }, 2000);
                },
                error: function (err) {
                    $.notify(err, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
                }
            })
        } catch (ex) {
            $.notify(err, { globalPosition: 'top-left', className: 'error', autoHideDelay: 30000 });
        }
    }
    return false;
}

$(function () {
    $('#btnupload').on('click', function () {
        var fileExtension = ['xlsx'];
        var filename = $('#theFile').val();
        if (filename.length == 0) {
            alert("Hãy chọn tập tin excel (.xlsx)!");
            return false;
        }
        else {
            var extension = filename.replace(/^.*\./, '');
            if ($.inArray(extension, fileExtension) == -1) {
                alert("Hãy chọn tập tin excel (.xlsx)!");
                return false;
            }
        }
        $('#TenTepBaoGio').val(filename);
    })
    $('#btnExport').on('click', function () {
        var fileExtension = ['xls', 'xlsx'];
        var filename = $('#theFile').val();
        if (filename.length == 0) {
            alert("Please select a file then Import");
            return false;
        }
    });
});
function divideString(str, n = 3) {
    var str_size = str.length;
    var part_size;
    part_size = Math.floor(str_size / n);
    var nStr = "";
    for (var i = 0; i < str_size; i++) {
        if (i % part_size == 0 && i > 0) nStr = nStr + "\n";
        nStr = nStr.concat(str[i]);
    }
    return nStr;
}
function MessageBox(str, type = '') {
    if (type == '')
        $.notify(str, { globalPosition: 'top-center', className: 'success', autoHideDelay: 10000 });
    else {
        if (str.length > 150) {
            str = divideString(str);
        }
        $.notify(str, { globalPosition: 'top-center', className: 'error', autoHideDelay: 10000 });
    }

}
$('.custom-file-input').on('change', function () {
    let fileName = $(this).val().split('\\').pop();
    $(this).next('.custom-file-label').addClass("selected").html(fileName);
});


$('#IdKhoa').change(function () {
    var selectedKhoa = $("#IdKhoa").val();
    var URL = "/BoMons/GetBoMons?IdKhoa=" + selectedKhoa;
    if ($('#IdBoMon').length > 0)
        refreshDDL('IdBoMon', URL, true, 'Hãy lựa chọn bộ môn');
});

$('#IdNamHocHocKy').change(function () {
    var selectedNamHocHocKy = $("#IdNamHocHocKy").val();
    var URL = "/BaoGioGiangDays/GetBaoGioGiangDays?IdNamHocHocKy=" + selectedNamHocHocKy;
    if ($('#IdBaoGioGiangDay').length > 0)
        refreshDDL('IdBaoGioGiangDay', URL, true, 'Hãy lựa chọn phân công');
});

$('#checkBoxAll').click(function () {
    if ($(this).is(":checked")) {
        $(".chkCheckBoxId").prop("checked", true)
    }
    else {
        $(".chkCheckBoxId").prop("checked", false)
    }
});
$('.chkCheckBoxId').click(function () {
    if (!$(this).prop(":checked")) {
        $("#checkBoxAll").prop("checked", false)
    }
});
$(".selectGiaoVien").select2({
    allowClear: true,
   
});

$(".selectGiaoVien").on("select2:select", function (evt) {
    var element = evt.params.data.element;
    var $element = $(element);
    $("#frmPhanCong").valid();

    $element.detach();
    $(this).append($element);
    $(this).trigger("change");
    var selectGiaVien = $(this).parent().find("select[name^=PhanCongGiangDay]");
    selectGiaVien.trigger("change");
    selectGiaVien.val($(this).select2('val'));
});

var $input = $('[class=customLook]')
    .tagify({
        duplicates: true,
        originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(','),
        pattern: /^[0-9]+(\.\d+)?$/,
        whitelist: [{ "id": 1, "value": "Nhập số" }],
        dropdown: {
            position: 'text',
            enabled: 1 // show suggestions dropdown after 1 typed character
        },
        transformTag: transformTag,
        placeholder: "Nhập số",
    })
    .on('change', function (e, tagName) {
      
        var inputChiaGio = $(this).parent().find("input[name^=chiaGio]");
        inputChiaGio.val(e.target.value)
    })
    .on('removeTag', function (e, tagName) {
        //console.log('JQEURY EVENT: ', 'remove', e.target.value)
    })
    .on("invalid", function (e, tagName) {
        //console.log('JQEURY EVENT: ', "invalid", e, ' ', tagName);
    });
function getRandomColor() {
    function rand(min, max) {
        return min + Math.random() * (max - min);
    }

    var h = rand(1, 360) | 0,
        s = rand(40, 70) | 0,
        l = rand(65, 72) | 0;

    return 'hsl(' + h + ',' + s + '%,' + l + '%)';
}

function transformTag(tagData) {
    tagData.color = getRandomColor();
    tagData.style = "--tag-bg:" + tagData.color;
}
$.validator.addMethod('totalCheck', function (value, element) {
    var row = $(element).closest('tr');
    var selectGiaVien = $(row).find("select[name^=PhanCongGiangDays]");
    var arrChia = value.split(",");
    var noChia = arrChia.length;
    if (value=="") {
        noChia = 0;
    }
    var noSelect = selectGiaVien.val().length;
    return (((noChia == noSelect) || (noChia == noSelect - 1)));
}, "Dữ liệu nhập chưa đúng");
$.validator.addClassRules({
    totalCheck: { totalCheck: true }
});
$.validator.addMethod('positiveFloat', function (value, element) {
    var row = $(element).closest('tr');
    var arrChia = value.split(",");
    var noChia = arrChia.length;
    if (value == "") {
        return true;
    }
    for (var i = 0; i < noChia; i++) {
        var flag = parseFloat(arrChia[i]);
        if (flag<=0) {
            return false;
        }
    }
    return true;
}, "Dữ liệu nhập chưa đúng");
$.validator.addClassRules({
    positiveFloat: { positiveFloat: true }
});
$.validator.addMethod('checkGioChuan', function (value, element) {
    var row = $(element).closest('tr');
    var gioChuan = $(row).find("input[name^=SoGioChuan]").val();
    var arrChia = value.split(",");
    var noChia = arrChia.length;
    var selectGiaVien = $(row).find("select[name^=PhanCongGiangDays]");
    var noSelect = selectGiaVien.val().length;

    if (value == "") {
        return true;
    }
    var sum = 0;
    for (var i = 0; i < noChia; i++) {
        sum += parseFloat(arrChia[i]);
    }
    if (noChia == noSelect) {
        if (sum!=gioChuan) {
            return false;
        }
    }
    if (noChia ==noSelect-1) {
        if (sum>gioChuan) {
            return false;
        }
    }
    return true;
}, "Dữ liệu nhập chưa đúng");
$.validator.addClassRules({
    checkGioChuan: { checkGioChuan: true }
});
var validator = $("#frmPhanCong").validate({
    ignore: [],
    onkeyup: function (element) { $(element).valid() },
    onclick: function (element) { $(element).valid() },
    rules: {
        "PhanCongGiangDays[]": {
            required: true
        },
        "chiaGio[]": {
            positiveFloat: true,
            totalCheck: true,
            checkGioChuan: true,

        }
    },
    messages: {
        "PhanCongGiangDays[]": "Hãy chọn giáo viên",
        "chiaGio[]": {
            positiveFloat: "Nhập số dương",
            totalCheck: 'Trong một môn học, số phần tử chia giờ phải bằng hoặc nhỏ hơn số giáo viên trừ 1',
            checkGioChuan: 'Trong một môn học, số giờ chia cho giáo viên chưa đúng',

        }
    },
    highlight: function (element) {
        $(element).closest('tr').addClass('error');
        $(element).closest('tr').removeClass('valid');
    },
    unhighlight: function (element) {
        $(element).closest('tr').removeClass('error');
        $(element).closest('tr').addClass('valid');
    },
    wrapper: 'li',
    errorPlacement: function (error, element) {
        if (element.attr("name").indexOf('PhanCongGiangDays')) {
            $("#messageBox ul").append(error);
        }
        //Custom position: second name
        if (element.attr("name").indexOf('chiaGio')) {

            $("#messageBox ul").append(error);
        }
        // Default position: if no match is met (other fields)
        else {
            $("#messageBox ul").append(error);
        }
    },
    
    submitHandler: function (form) {
        form.submit();
    }
});
function Confirm(title, msg, $true ="Đồng ý", $false="Quay lại", $link="#") { /*change*/
    window.scrollTo(0   , 0);

    var $content = "<div class='dialog-ovelay'>" +
        "<div class='dialog'><header>" +
        " <h3> " + title + " </h3> " +
        "<i class='fas fa-times'></i>" +
        "</header>" +
        "<div class='dialog-msg'>" +
        " <p> " + msg + " </p> " +
        "</div>" +
        "<footer>" +
        "<div class='controls'>" +
        " <button class='button float-right button-danger doAction'>" + $true + "</button> " +
        " <button class='button button-default cancelAction'>" + $false + "</button> " +
        "</div>" +
        "</footer>" +
        "</div>" +
        "</div>";
    $('body').prepend($content);
    //$('.doAction').click(function () {


    //    window.open($link, "_blank"); /*new*/


    //    $(this).parents('.dialog-ovelay').fadeOut(500, function () {
    //        $(this).remove();
    //    });
    //});
    $('.cancelAction, .fa-times').click(function () {
        $(this).parents('.dialog-ovelay').fadeOut(500, function () {
            $(this).remove();
        });
    });

}