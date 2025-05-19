using ImportExcelFIle.DotNETCore.Classes;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Models
{
    public class QuyDinhSiSoLopHocPhan:IThoiGian
    {
        public int IdQuyDinhSiSoLopHocPhan { get; set; }
        [DisplayName("Sĩ số nhỏ nhất")]
        [Required(ErrorMessage ="Nhập sĩ số nhỏ nhất")]
        [RegularExpression("([1-9]+[0-9]*)", ErrorMessage = "Nhập một số dương")]
        public int CanDuoi { get; set; }
        [DisplayName("Sĩ số lớn nhất")]
        [Required(ErrorMessage = "Nhập sĩ số lớn nhất")]
        [RegularExpression("([1-9]+[0-9]*)", ErrorMessage = "Nhập một số dương")]
        [Comparison("CanDuoi", Comparison.ComparisonType.GreaterThan,ErrorMessage ="Cận trên phải lớn hơn cận dưới")]
        public int CanTren { get; set; }
        [DisplayName("Hệ số Sĩ số")]
        [RegularExpression(@"(^[0-9]+(?:\.[0-9]*)?)", ErrorMessage = "Nhập một số thực dương")]
        public float HeSoSiSo { get; set; }
        [DisplayName("Thời gian bắt đầu")]
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [BindProperty, DataType(DataType.Date)]

        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]
        [Comparison("ThoiGianBatDau", Comparison.ComparisonType.GreaterThan, ErrorMessage = "Thời gian bắt đàu phải nhỏ hơn thời gian kết thúc")]
        [BindProperty, DataType(DataType.Date)]

        public DateTime? ThoiGianKetThuc { get; set; }
        [DisplayName("Dạng học phần")]
        [Required(ErrorMessage = "Nhập dạng học phần")]
        public string DangHocPhan { get; set; }
    }
}
