using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewMienGiamChucVu
    {
        public ViewMienGiamChucVu()
        {
        }

        public ViewMienGiamChucVu(DateTime thoiGianBatDau, DateTime? thoiGianKetThuc, string tenChucVu, double giaTri)
        {
            ThoiGianBatDau = thoiGianBatDau;
            ThoiGianKetThuc = thoiGianKetThuc;
            TenChucVu = tenChucVu;
            GiaTri = giaTri;
          
        }

        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }
        public string TenChucVu { get; set; }
        public double GiaTri { get; set; }
        public double GioChuanDuocMienGiam { get; set; }
        public double SoNgayCongTac { get; set; }
    }
}
