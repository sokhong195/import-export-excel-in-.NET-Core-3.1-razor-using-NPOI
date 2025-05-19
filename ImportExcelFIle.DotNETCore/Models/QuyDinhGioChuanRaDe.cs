using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class QuyDinhGioChuanRaDe
    {
        public int IdQuyDinhGioChuanRaDe { get; set; }
        public int IdHinhThuThi { get; set; }
        public double GioChuan1De { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }
        public int? ThoiGianThi { get; set; }

        public virtual HinhThucThi IdHinhThuThiNavigation { get; set; }
    }
}
