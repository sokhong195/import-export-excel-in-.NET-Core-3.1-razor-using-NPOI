using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Classes
{
    public class DangThucHanh
    {
        public static string ThucHanhChuyenMon = "Thực hành chuyên môn";
        public static string HocPhanGiaoDucTheChat = "Học phần giáo dục thể chất";
        public static string HocPhanThucHanhNgoaiNgu = "Học phần thực hành ngoại ngữ";
        public static string HuongDanThucTapSuPham = "Hướng dẫn thực tập sư phạm";

        public static SelectList GetListDangThucHanh(string dangThucHanh)
        {
            List<string> list = new List<string>();
            list.Add(ThucHanhChuyenMon);
            list.Add(HocPhanGiaoDucTheChat);
            list.Add(HocPhanThucHanhNgoaiNgu);
            list.Add(HuongDanThucTapSuPham);
            if (dangThucHanh == "")
            {
                dangThucHanh = ThucHanhChuyenMon;
            }
            return new SelectList(list, dangThucHanh);
        }
    }
}
