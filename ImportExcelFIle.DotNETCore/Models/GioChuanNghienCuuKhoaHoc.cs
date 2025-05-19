using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class GioChuanNghienCuuKhoaHoc
    {
        public int IdGioChuanNghienCuuKhoaHoc { get; set; }
        public double GioChuanNghieCuuKhoaHoc { get; set; }
        public int IdChiTietLoaiDeTai { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual ChiTietLoaiDeTai IdChiTietLoaiDeTaiNavigation { get; set; }
    }
}
