using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class QuyDinhGioChuanChamThiLyThuyet
    {
        public int IdQuyDinhGioChuanChamThiLyThuyet { get; set; }
        public int IdHinhThucThi { get; set; }
        public int? ThoiGianThi { get; set; }
        public int SoGiaoVienCham1BaiThi { get; set; }
        public int? SoSinhVienTinh1GioChuanTuLuan { get; set; }
        public double? GioChuanVanDap1SinhVien { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }
    }
}
