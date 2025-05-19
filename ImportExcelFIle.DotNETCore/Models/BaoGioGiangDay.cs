using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class BaoGioGiangDay
    {
        public BaoGioGiangDay()
        {
            BaoGioGiangDayChiTiets = new HashSet<BaoGioGiangDayChiTiet>();
        }

        public int IdBaoGioGiangDay { get; set; }
        [Required]
        [DisplayName("Tên báo giờ giảng dạy")]
        public string TenPhanCongGiangDay { get; set; }
        [Required]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Chọn học kỳ và năm học")]
        [DisplayName("Học kỳ - Năm học")]

        public int IdNamHocHocKy { get; set; }
        [Required]
        [DisplayName("Thời gian bắt đầu")]

        public DateTime ThoiGianBatDau { get; set; }
        [Required]
        [DisplayName("Thời gian kết thúc")]

        public DateTime? ThoiGianKetThuc { get; set; }
        [Required]
        [DisplayName("Tệp báo giờ")]

        public string TenTepBaoGio { get; set; }
        public virtual NamHocHocKy IdNamHocHocKyNavigation{get; set;}
        public virtual ICollection<BaoGioGiangDayChiTiet> BaoGioGiangDayChiTiets { get; set; }
    }
}
