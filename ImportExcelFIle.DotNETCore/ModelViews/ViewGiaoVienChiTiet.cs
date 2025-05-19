using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewGiaoVienChiTiet : IThoiGian
    {
        public ViewGiaoVienChiTiet()
        {
           
        }
        [Key]
        public int IdGiaoVienChiTiet { get; set; }

        public int IdGiaoVien { get; set; }

        //[Required(ErrorMessage = "Tên giáo không được để trống")]
        //[DisplayName("Họ tên giáo viên")]
        public string HoTenGiaoVien { get; set; }

        //[Required(ErrorMessage = "Nhập ngày sinh")]
        //[DisplayName("Ngày sinh")]
        //public DateTime NgaySinh { get; set; }

        //public int? IdNguoiDung { get; set; }

        //[Required(ErrorMessage = "Nhập số điện thoại")]
        //[DisplayName("Số điện thoại")]
        //public string DienThoai { get; set; }

        //[Required(ErrorMessage = "Nhập thư điện tử")]
        //[DisplayName("Thư điện tử")]
        //[EmailAddress(ErrorMessage ="Nhập đúng thư điện tử")]
        //public string Email { get; set; }

        //[Required(ErrorMessage = "Chọn giới tính")]
        //[DisplayName("Giới tính")]
        //public bool GioiTinh { get; set; }

        [Required(ErrorMessage = "Nhập loại công việc")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Chọn loại công việc")]
        [DisplayName("Loại công việc")]
        public int IdLoaiCongViec { get; set; }

        [DisplayName("Tên loại công việc")]
        public string TenLoaiCongViec { get; set; }

        [DisplayName("Phòng - Trung tâm")]
        public int? IdPhongTrungTam { get; set; }

        [DisplayName("Tên phòng, trung tâm")]
        public string TenPhongTrungTam { get; set; }

        [DisplayName("Tên bộ môn")]

        public int? IdBoMon { get; set; }

        [DisplayName("Tên bộ môn")]
        public string TenBoMon { get; set; }

        [DisplayName("Khoa")]
        public string TenKhoa { get; set; }
        [DisplayName("Khoa")]
        public string IdKhoa { get; set; }

        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [DisplayName("Thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }

        [DisplayName("Tình trạng")]
        //[Required(ErrorMessage = "Hãy xác nhận tình trạng")]
        public string TinhTrang { get; set; }

        [DisplayName("Quyết đinh")]
        //[Required(ErrorMessage ="Hãy chọn ảnh chụp quyết định")]
        public string QuyetDinh { get; set; }

    }
}
