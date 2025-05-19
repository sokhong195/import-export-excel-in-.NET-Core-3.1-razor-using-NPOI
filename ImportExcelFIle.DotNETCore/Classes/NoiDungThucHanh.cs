using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;

namespace ImportExcelFIle.DotNETCore.Classes
{
    internal class NoiDungThucHanh
    {
        public static string GiangDayThucHanh = "Giờ dạy thực hành";
        public static string HuongDanThucTapSuPham = "Hướng dẫn thực tập sư phạm";
        internal static SelectList GetListNoiDungThucHanh(string tenNoiDungGiangDay)
        {
            List<string> list = new List<string>();
            list.Add(GiangDayThucHanh);
            list.Add(HuongDanThucTapSuPham);
            return new SelectList(list, tenNoiDungGiangDay);
        }
    }
}