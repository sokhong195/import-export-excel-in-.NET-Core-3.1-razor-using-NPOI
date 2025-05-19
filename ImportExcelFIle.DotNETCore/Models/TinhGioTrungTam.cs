using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class TinhGioTrungTam
    {
        public int IdTinhGioTrungTam { get; set; }
        public int? IdNhiemVuDayTrungTam { get; set; }
        public double? SoGio { get; set; }
        public int? IdNamHocHocKy { get; set; }

        public virtual NamHocHocKy IdNamHocHocKyNavigation { get; set; }
        public virtual PhanCongDayTrungTam IdNhiemVuDayTrungTamNavigation { get; set; }
    }
}
