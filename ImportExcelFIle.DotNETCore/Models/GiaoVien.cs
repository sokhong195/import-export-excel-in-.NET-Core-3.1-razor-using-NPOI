using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class GiaoVien
    {
        public GiaoVien()
        {
            CacHeSoLuongs = new HashSet<CacHeSoLuong>();
            GiaoVienChiTiets = new HashSet<GiaoVienChiTiet>();
            GiaoVienChucVus = new HashSet<GiaoVienChucVu>();
            GiaoVienTrangThaiLamViecs = new HashSet<GiaoVienTrangThaiLamViec>();
            PhanCongCoiHoiThis = new HashSet<PhanCongCoiHoiThi>();
            PhanCongDayTrungTams = new HashSet<PhanCongDayTrungTam>();
            PhanCongGiangDays = new HashSet<PhanCongGiangDay>();   
            ThanhVienDeTais = new HashSet<ThanhVienDeTai>();
            GiaoVienTrinhDos = new HashSet<GiaoVienTrinhDo>();
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

        public virtual NguoiDung IdNguoiDungNavigation { get; set; }
        public virtual ICollection<CacHeSoLuong> CacHeSoLuongs { get; set; }
        public virtual ICollection<GiaoVienChiTiet> GiaoVienChiTiets { get; set; }
        public virtual ICollection<GiaoVienChucVu> GiaoVienChucVus { get; set; }
        public virtual ICollection<GiaoVienTrangThaiLamViec> GiaoVienTrangThaiLamViecs { get; set; }
        public virtual ICollection<PhanCongCoiHoiThi> PhanCongCoiHoiThis { get; set; }
        public virtual ICollection<PhanCongDayTrungTam> PhanCongDayTrungTams { get; set; }
        public virtual ICollection<PhanCongGiangDay> PhanCongGiangDays { get; set; }
        public virtual ICollection<ThanhVienDeTai> ThanhVienDeTais { get; set; }
        public virtual ICollection<GiaoVienTrinhDo> GiaoVienTrinhDos { get; set; }

    }
}
