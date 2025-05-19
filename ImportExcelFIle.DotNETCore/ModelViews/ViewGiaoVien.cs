using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewGiaoVien
    {
        public ViewGiaoVien()
        {
            ViewGiaoVienChiTiets = new List<ViewGiaoVienChiTiet>();
            CacHeSoLuongs = new List<CacHeSoLuong>();
            ViewChucVuChiTiets = new List<ViewGiaoVienChucVu>();
            ViewGiaoVienTrangThaiLamViecs = new List<ViewGiaoVienTrangThaiLamViec>();
            ViewGiaoVienTrinhDoes = new List<ViewGiaoVienTrinhDo>();
        }
        public int IdGiaoVien { get; set; }

        [Required(ErrorMessage = "Tên giáo không được để trống")]
        [DisplayName("Họ tên giáo viên")]
        public string HoTenGiaoVien { get; set; }

        [Required(ErrorMessage = "Nhập ngày sinh")]
        [DisplayName("Ngày sinh")]
        public DateTime NgaySinh { get; set; }

        public int? IdNguoiDung { get; set; }

        [Required(ErrorMessage = "Nhập số điện thoại")]
        [DisplayName("Số điện thoại")]
        public string DienThoai { get; set; }

        [Required(ErrorMessage = "Nhập thư điện tử")]
        [DisplayName("Thư điện tử")]
        [EmailAddress(ErrorMessage = "Nhập đúng thư điện tử")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Chọn giới tính")]
        [DisplayName("Giới tính")]
        public bool GioiTinh { get; set; }
        public List<ViewGiaoVienChiTiet> ViewGiaoVienChiTiets { get; set; }
        public List<ViewGiaoVienChucVu> ViewChucVuChiTiets { get; set; }
        public List<ViewGiaoVienTrangThaiLamViec> ViewGiaoVienTrangThaiLamViecs { get; set; }
        public List<CacHeSoLuong> CacHeSoLuongs { get; set; }
        public List<ViewGiaoVienTrinhDo> ViewGiaoVienTrinhDoes { get; set; }
    }
}
