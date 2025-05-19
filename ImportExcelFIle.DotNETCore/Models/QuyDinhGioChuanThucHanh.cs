using ImportExcelFIle.DotNETCore.Classes;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class QuyDinhGioChuanThucHanh:IThoiGian
    {
        [DisplayName("Nội dung thực hành")]
        [Required(ErrorMessage = "Nhập tên nội dung thực hành")]
        public string TenNoiDungGiangDay { get; set; }
        public int IdQuyDinhGioChuanThucHanh { get; set; }
        [DisplayName("Khoa")]
        [Required(ErrorMessage = "Nhập khoa")]
        public string IdKhoa { get; set; }

        [DisplayName("Sĩ số nhỏ nhất")]
        [Required(ErrorMessage = "Nhập sĩ số nhỏ nhất")]
        [RegularExpression("([1-9]+[0-9]*)", ErrorMessage = "Nhập một số dương")]
        public int CanDuoi { get; set; }

        [DisplayName("Sĩ số lớn nhất")]
        [Required(ErrorMessage = "Nhập sĩ số lớn nhất")]
        [RegularExpression("([1-9]+[0-9]*)", ErrorMessage = "Nhập một số dương")]
        [Comparison("CanDuoi", Comparison.ComparisonType.GreaterThan, ErrorMessage = "Cận trên phải lớn hơn cận dưới")]
        public int CanTren { get; set; }

        [DisplayName("Số giờ chuẩn")]
        [RegularExpression(@"(^[0-9]+(?:\.[0-9]*)?)", ErrorMessage = "Nhập một số thực dương")]
        public float SoGioChuan { get; set; }

        [DisplayName("Thời gian bắt đầu")]
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [BindProperty, DataType(DataType.Date)]
        public DateTime ThoiGianBatDau { get; set; }

        [DisplayName("Thời gian kết thúc")]
        [Comparison("ThoiGianBatDau", Comparison.ComparisonType.GreaterThan, ErrorMessage = "Thời gian bắt đầu phải nhỏ hơn thời gian kết thúc")]
        [BindProperty, DataType(DataType.Date)]
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual Khoa IdKhoaNavigation { get; set; }
    }
}
