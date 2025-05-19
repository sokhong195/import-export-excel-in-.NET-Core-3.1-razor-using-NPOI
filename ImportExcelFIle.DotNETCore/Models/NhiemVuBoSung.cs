using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class NhiemVuBoSung
    {
        public int IdNhiemVuBoSung { get; set; }
        public string IdGiaoVien { get; set; }
        public string TenNhiemVu { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public int GioChuan { get; set; }
        public string GhiChu { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }
        public int? IdNamHocHocKy { get; set; }

        public virtual NamHocHocKy IdNamHocHocKyNavigation { get; set; }
    }
}
