using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Classes
{
    public static class DangHocPhanTinhHeSo
    {
        public static string HocPhanLyThuyet = "Học phần lý thuyết";
        public static string HocPhanGiaoDucTheChat = "Học phần giáo dục thể chất";
        public static string HocPhanThucHanhNgoaiNgu = "Học phần thực hành ngoại ngữ";
        public static string HocPhanLyThuyetCoHuongDanThiNghiem = "Học phần có hướng dẫn thí nghiệm";
        public static string HocPhanLyThuyetCoHuongDanThaoLuan = "Học phần có hướng dẫn thảo luận";

        public static SelectList GetListDangHocPhanTinhHeSo(string dangHocPhan)
        {
            List<string> list = new List<string>();
            list.Add(HocPhanLyThuyet);
            list.Add(HocPhanGiaoDucTheChat);
            list.Add(HocPhanThucHanhNgoaiNgu);
            list.Add(HocPhanLyThuyetCoHuongDanThiNghiem);
            list.Add(HocPhanLyThuyetCoHuongDanThaoLuan);
            return new SelectList(list, dangHocPhan);
        }
    }
}
