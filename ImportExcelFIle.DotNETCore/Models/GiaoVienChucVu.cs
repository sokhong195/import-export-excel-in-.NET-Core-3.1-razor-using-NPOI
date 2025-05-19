using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Models
{
    public class GiaoVienChucVu :IThoiGian
    {
        public int IdGiaoVienChucVu { get; set; }
        public int IdGiaoVien { get; set; }
        [DisplayName("Chức vụ")]
        [Required(ErrorMessage = "Nhập chức vụ")]
        public int IdChucVu { get; set; }
        [BindProperty, DataType(DataType.Date)]

        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [DisplayName("Thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]

        [BindProperty, DataType(DataType.Date)]

        public DateTime? ThoiGianKetThuc { get; set; }
        [DisplayName("Quyết đinh")]
      //  [Required(ErrorMessage = "Hãy chọn ảnh chụp quyết định")]
        public string QuyetDinh { get; set; }

        [DisplayName("Tình trạng")]
       // [Required(ErrorMessage ="Hãy xác nhận tình trạng")]
        public string TinhTrang { get; set; }

        public virtual ChucVu IdChucVuNavigation { get; set; }
        public virtual GiaoVien IdGiaoVienNavigation { get; set; }
    }
}
