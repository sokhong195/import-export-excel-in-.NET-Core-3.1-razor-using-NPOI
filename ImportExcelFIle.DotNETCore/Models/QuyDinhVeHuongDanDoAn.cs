using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class QuyDinhVeHuongDanDoAn
    {
        public int IdQuyDinhVeHuongDanDoAn { get; set; }
        public int IdLoaiHocPhan { get; set; }
        public int SoSinhVienToiDaTrongKy { get; set; }
        public double SoGioChuanChoMotSinhVien { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual LoaiHocPhan IdLoaiHocPhanNavigation { get; set; }
    }
}
