using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class Khoa
    {
        public Khoa()
        {
            BoMons = new List<BoMon>();
            HocPhans = new HashSet<HocPhan>();
            QuyDinhGioChuanThucHanhBoSungs = new HashSet<QuyDinhGioChuanThucHanhBoSung>();
            QuyDinhGioChuanThucHanhs = new HashSet<QuyDinhGioChuanThucHanh>();
        }
        [Required(ErrorMessage = "Nhập mã khoa")]
        [RegularExpression("(0[1-9])", ErrorMessage = "Nhập lại mã khoa dạng 0x (x là 1 số từ 1 đến 9)")]
        [DisplayName("Mã khoa")]
        public string IdKhoa { get; set; }
        [Required(ErrorMessage ="Tên khoa")]
        [DisplayName("Tên khoa")]
        public string TenKhoa { get; set; }
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [DisplayName("Thời gian bắt đầu")]
        [BindProperty, DataType(DataType.Date)]
        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]
        [BindProperty, DataType(DataType.Date)]
        public DateTime? ThoiGianKetThuc { get; set; }
        public virtual List<BoMon> BoMons { get; set; }
        public virtual ICollection<HocPhan> HocPhans { get; set; }
        public virtual ICollection<QuyDinhGioChuanThucHanhBoSung> QuyDinhGioChuanThucHanhBoSungs { get; set; }
        public virtual ICollection<QuyDinhGioChuanThucHanh> QuyDinhGioChuanThucHanhs { get; set; }
    }
}
