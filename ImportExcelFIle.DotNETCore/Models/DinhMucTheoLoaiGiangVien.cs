using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class DinhMucTheoLoaiGiangVien
    {
        public int IdDinhMucTheoLoaiGiangVien { get; set; }
        public int IdLoaiGiangVien { get; set; }
        public double DinhMuc { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual LoaiCongViec IdLoaiGiangVienNavigation { get; set; }
    }
}
