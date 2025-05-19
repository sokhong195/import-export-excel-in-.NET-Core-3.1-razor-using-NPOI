using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class CacHeSoLuong : IThoiGian
    {
        public int IdHeSoLuong { get; set; }
        public int IdGiaoVien { get; set; }
        [DisplayName("Hệ số lương")]
        [RegularExpression("([0-9]+[.0-9]*)", ErrorMessage = "Nhập một số không âm")]

        [Required(ErrorMessage = "Nhập hệ số lương")]

        public double HeSoLuong { get; set; }
        [DisplayName("Phụ cấp chức vụ")]

        [RegularExpression("([0-9]+[.0-9]*)", ErrorMessage = "Nhập một số không âm")]
        public double? PhuCapChucVu { get; set; }
        [DisplayName("Phụ cấp nghề nghiệp")]
        [RegularExpression("([0-9]+[.0-9]*)", ErrorMessage = "Nhập một số không âm")]
        public double? PhuCapNgheNghiep { get; set; }

        [DisplayName("Quyết đinh")]
        //[Required(ErrorMessage ="Hãy chọn ảnh chụp quyết định")]
        public string QuyetDinh { get; set; }

        [DisplayName("Tình trạng")]
        //[Required(ErrorMessage = "Hãy xác nhận tình trạng")]
        public string TinhTrang { get; set; }
        public virtual GiaoVien IdGiaoVienNavigation { get; set; }
        [BindProperty, DataType(DataType.Date)]

        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [DisplayName("Thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]
        [BindProperty, DataType(DataType.Date)]

        public DateTime? ThoiGianKetThuc { get; set; }

    }
}
