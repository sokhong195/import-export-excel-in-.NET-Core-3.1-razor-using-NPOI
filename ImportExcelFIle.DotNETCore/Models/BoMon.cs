using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class BoMon:IThoiGian
    {
        public BoMon()
        {
            HocPhans = new HashSet<HocPhan>();
            GiaoVienChiTiets = new HashSet<GiaoVienChiTiet>();
        }

        public int IdBoMon { get; set; }
        [Required(ErrorMessage ="Nhập tên bộ môn")]
        [DisplayName("Tên bộ môn")]
        public string TenBoMon { get; set; }
        [DisplayName("Khoa")]
        public string IdKhoa { get; set; }
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [DisplayName("Thời gian bắt đầu")]
        [BindProperty, DataType(DataType.Date)]
        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]
        [BindProperty, DataType(DataType.Date)]
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual Khoa IdKhoaNavigation { get; set; }
        public virtual ICollection<HocPhan> HocPhans { get; set; }
        public virtual ICollection<GiaoVienChiTiet> GiaoVienChiTiets { get; set; }
    }
}
