using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class NamHocHocKy : IThoiGian
    {
        public NamHocHocKy()
        {
            NhiemVuBoSungs = new List<NhiemVuBoSung>();
            ThongKeSinhVienThuocKhoas = new List<ThongKeSinhVienThuocKhoa>();
            TinhGioTrungTams = new List<TinhGioTrungTam>();
            BaoGioCoiHoiThis = new List<BaoGioCoiHoiThi>();
            BaoGioGiangDays = new List<BaoGioGiangDay>();
        }

        public int IdNamHocHocKy { get; set; }
        public int IdNamHoc { get; set; }
        public int IdHocKy { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public int SoTuan { get; set; }

        public virtual HocKy IdHocKyNavigation { get; set; }
        public virtual NamHoc IdNamHocNavigation { get; set; }
        public virtual List<NhiemVuBoSung> NhiemVuBoSungs { get; set; }
        public virtual List<ThongKeSinhVienThuocKhoa> ThongKeSinhVienThuocKhoas { get; set; }
        public virtual List<TinhGioTrungTam> TinhGioTrungTams { get; set; }
        public virtual List<BaoGioCoiHoiThi> BaoGioCoiHoiThis { get; set; }
        public virtual List<BaoGioGiangDay> BaoGioGiangDays { get; set; }

    }
}
