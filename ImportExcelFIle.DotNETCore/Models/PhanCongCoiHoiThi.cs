using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class PhanCongCoiHoiThi
    {
        public int IdPhanCongCoiHoiThi { get; set; }
        public int IdBaoGioGiangDayChiTiet { get; set; }
        public int IdGiaoVien { get; set; }
        public int IdNhiemVuCoiHoiThi { get; set; }
        public string GhiChu { get; set; }
        public int? IdNamHocHocKy { get; set; }

        public virtual BaoGioGiangDayChiTiet IdBaoGioGiangDayChiTiet1 { get; set; }
        public virtual GiaoVien IdGiaoVienNavigation { get; set; }
    }
}
