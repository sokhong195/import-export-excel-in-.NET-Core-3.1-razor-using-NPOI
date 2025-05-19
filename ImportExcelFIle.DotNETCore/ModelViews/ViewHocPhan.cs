using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewHocPhan
    {
        
        public int IdHocPhan { get; set; }
        [Required(ErrorMessage = "Nhập mã học phần")]
        [DisplayName("Mã học phần")]
        [StringLength(10, ErrorMessage = "Nhập mã học phần với độ dài không quá 10 ký tự")]
        public string MaHocPhan { get; set; }
        [Required(ErrorMessage = "Nhập tên học phần")]
        [DisplayName("Tên học phần")]
        public string TenHocPhan { get; set; }
        [Required(ErrorMessage = "Nhập số tín chỉ")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Nhập một số nguyên dương")]
        [DisplayName("Số tín chỉ")]
        public int SoTinChi { get; set; }
        [Required(ErrorMessage = "Nhập học kỳ")]
        [RegularExpression("([1-9]{1})", ErrorMessage = "Nhập một số nguyên dương")]
        [DisplayName("Học kỳ")]
        public int ThuocHocKy { get; set; }
        [DisplayName("Khoa")]
        [RegularExpression("(0[1-9]+)", ErrorMessage = "Chọn Khoa")]
        public string IdKhoa { get; set; }
        [DisplayName("Khoa")]
        public string TenKhoa { get; set; }
        [DisplayName("Bộ môn")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Chọn bộ môn")]
        public int? IdBoMon { get; set; }
        [DisplayName("Bộ môn")]
        public string TenBoMon { get; set; }
        [DisplayName("Loại học phần")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Chọn loại học phần")]
        public int IdLoaiHocPhan { get; set; }
        [DisplayName("Loại học phần")]
        public string TenLoaiHocPhan { get; set; }
        [DisplayName("Hình thức thi")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Chọn hình thức thi")]
        public int? IdHinhThucThi { get; set; }
        [DisplayName("Hình thức thi")]
        public string TenHinhThucThi { get; set; }
        [Required(ErrorMessage = "Nhập thời gian thi")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Nhập thời gian thì là một số dương")]
        [DisplayName("Thời gian thi")]
        public int ThoiGianThi { get; set; }
        [DisplayName("Ngân hàng đề")]
        public bool CoNganHangDe { get; set; }
        [Required(ErrorMessage = "Nhập số tiết lý thuyết")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Số tiết lý thuyết phải là một số dương")]
        [DisplayName("Số tiết lý thuyết")]
        public int SoTietLyThuyet { get; set; }
        [Required(ErrorMessage = "Nhập số tiết thảo luận, thí nghiệm hoặc thực hành")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Số tiết thảo luận, thí nghiệm hoặc thực hành phải là một số dương")]
        [DisplayName("Số tiết thảo luận, thí nghiệm hoặc thực hành")]
        public int SoTietThaoLuanThiNghiemThucHanh { get; set; }
        [DisplayName("Số giờ chuẩn bị tự học")]
        public int SoGioChuanBiTuHoc { get; set; }
        [DisplayName("Số giờ hướng dẫn tự học")]
        public int HuongDanTuHoc { get; set; }
        [Required(ErrorMessage = "Nhập trình độ")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Nhập trình độ")]
        [DisplayName("Trình độ")]
        public int IdTrinhDo { get; set; }
        [DisplayName("Trình độ")]
        public string TenTrinhDo { get; set; }
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [DisplayName("Thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]
        public DateTime? ThoiGianKetThuc { get; set; }

        [DisplayName("Dạng thực hành")]

        public string DangThucHanh { get; set; }
        [DisplayName("Dạng lý thuyết")]

        public string DangLyThuyet { get; set; }
    }
}
