using System;
using System.Collections.Generic;
using System.Text;

namespace TestFunction
{
    class ViewMienGiamChucVu
    {
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
        public double GioChuan { get; set; }
        public double SoNgayCongTac { get; set; }
        public override string ToString()
        {
            return TenChucVu + "\t" + GiaTri.ToString() + "\t\t" + ThoiGianBatDau.ToShortDateString()+"\t" + ThoiGianKetThuc.Value.ToShortDateString();
        }
    }
}
