using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class BaoGioCoiHoiThi
    {

        public BaoGioCoiHoiThi()
        {
            BaoGioGiangDayChiTiets = new HashSet<BaoGioGiangDayChiTiet>();
        }

        public int IdBaoGioCoiHoiThi { get; set; }
        public string TenBaoGioCoiHoiThi { get; set; }
        public int IdNamHocHocKy { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime ThoiGianKetThuc { get; set; }

        public virtual NamHocHocKy IdNamHocHocKyNavigation { get; set; }
        public virtual ICollection<BaoGioGiangDayChiTiet> BaoGioGiangDayChiTiets { get; set; }
    }
}
