/// <reference path="moment.min.js" />

$(document).ready(function () {
    var t = $("#tblQuyDinhGioChuanThucHanh").DataTable({

        "language": {
            "lengthMenu": "Hiển thị _MENU_ bản ghi mỗi trang",
            "zeroRecords": "Không có bản ghi!",
            "info": "Hiển thị trang thứ <strong>_PAGE_</strong> trên tổng số <strong>_PAGES_</strong> trang",
            "infoEmpty": "Không có bản ghi nào",
            "infoFiltered": "(được lọc từ _MAX_ bản ghi)",
            "processing": "Đang xử lý...",
            "search": "Tìm kiếm:",
            "loadingRecords": "Tải dữ liệu...",
            "paginate": {
                "first": "Về Đầu",
                "last": " Về Cuối",
                "next": "Kế tiếp",
                "previous": "Trước"
            },
        },
        pagingType: 'full_numbers',
        fixedHeader: true,
        "processing": true,
        "serverSide": true,
        "filter": true,
        "ajax": {
            "url": '/QuyDinhGioChuanThucHanhs/GetData',
            "type": "POST",
            "datatype": "json",
            dataSrc: function (json) {
                return $.parseJSON(json.data);
            },
            "dataType": "json",
        },
        "columnDefs": [
            {
                "targets": 0,
                "searchable": false,
                "orderable": false,
            },
            {
                "targets": 3,
                "searchable": false,
                "orderable": false,
            },
            {
                "targets": 4,
                "searchable": false,
                "orderable": false,
            },
            {
                "targets": 5,
                "searchable": false,
                "orderable": false,
            },
            {
                "targets": 8,
                "searchable": false,
                "orderable": false,
            }
        ],
        drawCallback: function () {
            $('.tooltipButton').tooltip({
                "html": true,
                trigger: 'hover',
                placement: 'bottom',
            })
        },
        "responsive": true,
        "order": [[1, 'asc']],
        "columns": [

            { "data": null },
            {
                "data": 'TenNoiDungGiangDay', "name": 'Nội dung thực hành'
            },
            {
                "data": 'IdKhoa', "name": 'Khoa'
            },
            { "data": "CanDuoi" },
            { "data": "CanTren" },
            { "data": "SoGioChuan" },
            {
                "data": 'ThoiGianBatDau', "name": 'Thời gian bắt đầu',
                'render': function (data) {//data
                    return moment(data).format('DD/MM/YYYY');
                }
            },
            {
                "data": 'ThoiGianKetThuc', "name": 'Thời gian kết thúc',
                'render': function (data) {//data
                    var date = moment(data);
                    if (date.isValid()) {
                        return moment(data).format('DD/MM/YYYY');
                    }
                    return "";
                }
            },
            {
                "data": "IdQuyDinhGioChuanThucHanh",
                "render": function (data) {
                    var name = "quy định giờ chuẩn thực hành";
                    var controller = "QuyDinhGioChuanThucHanhs";
                    var editRow = "<a href='#' data-toggle='tooltip' onclick='showInPopup(\"" + controller + "\/CreateOrEdit\/" + data + "\",\"Sửa " + name + "\")' class='btn btn-info btn-sm fontawesome tooltipButton' data-original-title='Sửa " + name + "'><i class='fas fa-pencil-alt'></i></a>";
                    var deleteRow = "<button data-toggle='tooltip' title='' type='submit' class='btn btn-danger btn-sm fontawesome tooltipButton' onclick='return jQueryAjaxDeleteButton(this,\"Xác nhận muốn xóa " + name + " này không?\")' formaction='/" + controller + "/Delete/" + data + "' data-original-title='Xóa " + name + "'><i class='far fa-trash-alt'></i></button>";

                    return editRow + " | " + deleteRow;
                }
            }
        ]
    });
    t.on('draw.dt', function () {
        var PageInfo = $('#tblQuyDinhGioChuanThucHanh').DataTable().page.info();
        t.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
})