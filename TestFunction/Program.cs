using System;
using System.Collections.Generic;
using System.Linq;

namespace TestFunction
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            DateTime thoiGianBatDau = new DateTime(2021, 09, 09);
            DateTime thoiGianKetThuc = new DateTime(2022, 01, 11);
            List<ViewMienGiamChucVu> viewMienGiamChucVus = new List<ViewMienGiamChucVu>();
            viewMienGiamChucVus.Add(new ViewMienGiamChucVu(new DateTime(2021,08,26), new DateTime(2025,8,26),"Phó Trường Phòng",30));
            viewMienGiamChucVus.Add(new ViewMienGiamChucVu(new DateTime(2021, 10, 05), new DateTime(2021, 11, 30), "Trường Phòng", 20));
            viewMienGiamChucVus.Add(new ViewMienGiamChucVu(new DateTime(2021, 11, 10), new DateTime(2021, 12, 15), "Phó hiệu trưởng", 10));
            viewMienGiamChucVus = viewMienGiamChucVus.OrderBy(n => n.GiaTri).ToList();
            foreach (var item in viewMienGiamChucVus)
            {
                Console.WriteLine(item.ToString());
            }
            List<ViewMienGiamChucVu> view = TraVeDanhSachMienGiamChucVuKhongLongNhau(viewMienGiamChucVus, thoiGianBatDau, thoiGianKetThuc);
            Console.WriteLine("++++++++++++++++++++++++++++++++++++++++++++++++++++");
            foreach (var item in view)
            {
                Console.WriteLine(item.ToString());
            }
        }

        private static List<ViewMienGiamChucVu> TraVeDanhSachMienGiamChucVuKhongLongNhau(List<ViewMienGiamChucVu> viewMienGiamChucVus, DateTime thoiGianBatDauHocKy, DateTime thoiGianKetThucHocKy)
        {
            DateTime tgbd =  DateTime.Now;
            DateTime tgkt = DateTime.Now;
            List<ViewMienGiamChucVu> mienGiamChucVus=null;
            foreach (var chucVu in viewMienGiamChucVus)
            {
                if (chucVu.ThoiGianKetThuc == null || chucVu.ThoiGianKetThuc.Value.Date > thoiGianKetThucHocKy)
                {
                    chucVu.ThoiGianKetThuc = thoiGianKetThucHocKy;
                }
                if (chucVu.ThoiGianBatDau<thoiGianBatDauHocKy)
                {
                    chucVu.ThoiGianBatDau = thoiGianBatDauHocKy;
                }
                //Chưa có chức vụ nào
                if (mienGiamChucVus==null)
                {
                    mienGiamChucVus = new List<ViewMienGiamChucVu>();
                    mienGiamChucVus.Add(chucVu);
                    tgbd = chucVu.ThoiGianBatDau;
                    tgkt = chucVu.ThoiGianKetThuc.Value.Date;
                }
                else
                {
                    if (chucVu.ThoiGianBatDau.Date <tgbd.Date)
                    {
                        mienGiamChucVus.Add(new ViewMienGiamChucVu(chucVu.ThoiGianBatDau, tgbd.AddDays(-1), chucVu.TenChucVu, chucVu.GiaTri));
                        tgbd = chucVu.ThoiGianBatDau;
                    }
                    if (chucVu.ThoiGianKetThuc>tgkt)
                    {
                        mienGiamChucVus.Add(new ViewMienGiamChucVu(tgkt.AddDays(1),chucVu.ThoiGianKetThuc, chucVu.TenChucVu, chucVu.GiaTri));
                        tgkt = chucVu.ThoiGianKetThuc.Value;
                    }
                }
            }
            return mienGiamChucVus.OrderBy(n=>n.ThoiGianBatDau).ToList();
        }
    }
}
