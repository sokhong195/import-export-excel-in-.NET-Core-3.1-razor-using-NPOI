using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewGiaoVienTrinhDo:IThoiGian
    {
        public int IdGiaoVienTrinhDo { get; set; }
        public int IdTrinhDo { get; set; }
        public int IdGiaoVien { get; set; }
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [DisplayName("Thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }

        [DisplayName("Thời gian kết thúc")]

        public DateTime? ThoiGianKetThuc { get; set; }
        [DisplayName("Quyết định")]
        public string QuyetDinh { get; set; }
        [DisplayName("Tình trạng")]
        public string TinhTrang { get; set; }
        [DisplayName("Tên chức vụ")]
        [Required(ErrorMessage = "Nhập tên chức vụ")]
        public string TenTrinhDo { get; set; }

    }
}
