using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class BaoGioGiangDayChiTiet
    {
        public BaoGioGiangDayChiTiet()
        {
            PhanCongGiangDays = new HashSet<PhanCongGiangDay>();
            PhanCongCoiHoiThis = new HashSet<PhanCongCoiHoiThi>();

        }

        public int IdBaoGioGiangDayChiTiet { get; set; }
        public int? IdBaoGioGiangDay { get; set; }
        [Required(ErrorMessage = "Nhập mã học phần")]
        [DisplayName("Mã học phần")]
        public int? IdHocPhan { get; set; }
        [Required(ErrorMessage = "Nhập tên học phần")]
        [DisplayName("Tên học phần")]
        public string TenLopHocPhan { get; set; }
        [Required(ErrorMessage = "Nhập sĩ số")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Nhập một số nguyên dương")]
        [DisplayName("Sĩ số")]
        public int SiSo { get; set; }
        [Required(ErrorMessage = "Nhập số nhóm")]
        [RegularExpression("([0-9]*)", ErrorMessage = "Nhập số nhó là một số không âm")]
        [DisplayName("Số nhóm")]
        public int SoNhom { get; set; }
        [DisplayName("Phong Thi")]

        public string PhongThi { get; set; }
        [DisplayName("Ngày thi")]
        public DateTime? NgayThi { get; set; }
        [DisplayName("Ca Thi")]
        public string CaThi { get; set; }
        [DisplayName("Ghi chú")]
        public string GhiChu { get; set; }
        public int? IdBaoGioCoiHoiThi { get; set; }

        public virtual BaoGioCoiHoiThi IdBaoGioCoiHoiThiNavigation { get; set; }
        public virtual BaoGioGiangDay IdBaoGioGiangDayNavigation { get; set; }
        public virtual HocPhan IdHocPhanNavigation { get; set; }
        public virtual ICollection<PhanCongGiangDay> PhanCongGiangDays { get; set; }
        public virtual ICollection<PhanCongCoiHoiThi> PhanCongCoiHoiThis { get; set; }


    }
}
