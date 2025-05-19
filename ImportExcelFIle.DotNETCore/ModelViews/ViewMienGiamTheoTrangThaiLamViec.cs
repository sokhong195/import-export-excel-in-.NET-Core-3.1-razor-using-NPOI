using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewMienGiamTheoTrangThaiLamViec
    {
        public ViewMienGiamTheoTrangThaiLamViec(DateTime thoiGianBatDau, DateTime? thoiGianKetThuc, string tenTrangThaiLamViec, double giaTri)
        {
            ThoiGianBatDau = thoiGianBatDau;
            ThoiGianKetThuc = thoiGianKetThuc;
            TenTrangThaiLamViec = tenTrangThaiLamViec;
            GiaTri = giaTri;
            SoNgayCongTac = 0;
            
        }

        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }
        public string TenTrangThaiLamViec { get; set; }
        public double GiaTri { get; set; }
        public double SoNgayCongTac { get; set; }
        public double DinhMucCongTac { get; set; }
        public double DinhMucGiangDay { get; set; }
    }
}
