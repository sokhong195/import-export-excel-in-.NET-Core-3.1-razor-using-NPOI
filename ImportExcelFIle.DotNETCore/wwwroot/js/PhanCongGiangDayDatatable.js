$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "/PhanCongGiangDays/AjaxMethod",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var datas = eval(response);
            var t = $("#tblPhanCongGiangDay").DataTable({
                "language": {
                    "lengthMenu": "Hiển thị _MENU_ bản ghi mỗi trang",
                    "zeroRecords": "Không tìm thấy kết quả",
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
                data: datas[0],
                drawCallback: function () {
                    $('.popoverButton').popover({
                        "html": true,
                        trigger: 'hover',
                        placement: 'bottom',
                    })
                },
                pagingType: 'full_numbers',
                fixedHeader: true,
                "processing": true,
                "serverSide": true,
                "filter": true,
                "columnDefs": [{
                    "targets": 0,
                    "searchable": false,
                    "orderable": false,
                },
                {
                    "targets": 1,
                    "width": 250,
                    "nowrap": false
                },
                {
                    "targets": 2,
                    "width": 150,
                }
                ],
                "responsive": true,
                "order": [[1, 'asc']],
                "columns": [

                    { "data": null },
                    { "data": "ViewBaoGioGiangDayChiTiet.TenLopHocPhan", "name": "Tên lớp học phần" },

                    {
                        "data": "ViewBaoGioGiangDayChiTiet",
                        render: function (data, row) {
                            return SinhThongTinGio(data);
                        }
                    },
                    {
                        'data': 'PhanCongGiangDays', 'searchable': false,
                        render: function (data, type, row, meta) {
                            var idGiaoVien = [].idGiaoVien;
                            var countries = $("<select></select>");
                            $.each(datas[1], function (i, item) {
                                var option = $("<option />");
                                option.html(this.Text);
                                option.val(this.Value);
                                if (this.Value == idGiaoVien) {
                                    option.attr("selected", "selected")
                                }
                                countries.append(option);
                            });
                            return countries[0].outerHTML;
                        }
                    },
                    { "data": "ViewBaoGioGiangDayChiTiet.SoNhom", "name": "Tên lớp học phần" },
                    { "data": "ViewBaoGioGiangDayChiTiet.SoTietLyThuyet", "name": "Tên lớp học phần" },
                    {
                        data: 'ViewBaoGioGiangDayChiTiet',
                        "render": function (data, row) { return "<a href='#' class='btn btn-danger' onclick=alert('" + data.IdBaoGioGiangDayChiTiet + "'); >Delete</a>"; }
                    }

                ]
            });
            t.on('draw.dt', function () {
                var PageInfo = $('#tblPhanCongGiangDay').DataTable().page.info();
                t.column(0, { page: 'current' }).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1 + PageInfo.start;
                });
            });
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
    
    function SinhThongTinGio(data) {
        var details = "<b>" + "Mã học phần: " + "</b>" + data.MaHocPhan + "<br />" +
            "<b>" + "Số tín chỉ: " + "</b>" + data.SoTinChi + "<br />" +
            "<b>" + "Sĩ số: " + "</b>" + data.SiSo + "<br />" +
            "<b>" + "Số tiết lý thuyết: " + "</b>" + data.SoTietLyThuyet + "<br />" +
            "<b>" + "Số nhóm: " + "</b>" + data.SoNhom + "<br />" +
            "<b>" + "Số tiết thảo luận, thí nghiệm, thực hành: " + "</b>" + data.SoTietThaoLuanThiNghiemThucHanh + "<br />" +
            "<b>" + "Hướng dẫn tự học: " + "</b>" + data.HuongDanTuHoc;
        var shortcut = data.SoTinChi + " - " + data.SiSo + " - " + data.SoNhom;
        var html = "<a tabindex='0' class='popoverButton' role='button' data-toggle='popover' data-html='true' title='Thông tin học phần' data-placement='bottom' data-content='" + details + "'>" + shortcut + " </a>";
        return html;
    }

})