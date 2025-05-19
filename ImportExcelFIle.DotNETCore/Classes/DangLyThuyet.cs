using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Classes
{
    public class DangLyThuyet
    {
        public static string HocPhanChiCoLyThuyet = "Học phần chỉ có lý thuyết";
        public static string HocPhanCoHuongDanThaoLuan = "Học phần lý thuyết có hướng dẫn thảo luận";
        public static string HocPhanCoHuongDanThiNghiem = "Học phần lý thuyết có hướng dẫn thí nghiệm";

        public static SelectList GetListDangLyThuyet(string dangLyThuyet)
        {
            List<string> list = new List<string>();
            list.Add(HocPhanChiCoLyThuyet);
            list.Add(HocPhanCoHuongDanThaoLuan);
            list.Add(HocPhanCoHuongDanThiNghiem);
            if (dangLyThuyet =="")
            {
                dangLyThuyet = HocPhanChiCoLyThuyet;
            }
            return new SelectList(list, dangLyThuyet);
        }
    }
}
