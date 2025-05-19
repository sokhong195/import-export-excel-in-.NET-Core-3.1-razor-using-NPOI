using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class QuyDinhGioChuanCoiThiLyThuyet
    {
        public int IdQuyDinhGioChuanCoiThiLyThuyet { get; set; }
        public int IdHinhThucThi { get; set; }
        public int SoGiaoVienMax { get; set; }
        public double GioChuanMotGiaoVien { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }
        public int SoSinhVienMin { get; set; }
        public int SoSinhVienMax { get; set; }

        public virtual HinhThucThi IdHinhThucThiNavigation { get; set; }
    }
}
