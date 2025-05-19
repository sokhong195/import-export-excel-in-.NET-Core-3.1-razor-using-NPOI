using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class PhanCongGiangDay
    {
        public int IdPhanCongGiangDay { get; set; }
        public int IdBaoGioGiangDayChiTiet { get; set; }
        public int IdGiaoVien { get; set; }
        public float SoGioHoacTuanHoacSoNguoi { get; set; }
        public string GhiChu { get; set; }
        public int? IdNamHocHocKy { get; set; }

        public virtual BaoGioGiangDayChiTiet IdBaoGioGiangDayChiTietNavigation { get; set; }
        public virtual GiaoVien IdGiaoVienNavigation { get; set; }
    }
}
