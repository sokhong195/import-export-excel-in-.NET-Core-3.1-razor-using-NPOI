using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    internal class CheckData
    {
        public static dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
        /// <summary>
        /// Kiểm tra một số dương
        /// </summary>
        /// <param name="text"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        internal static bool IsPositiveInteger(string text, out int val)
        {
            if (int.TryParse(text, out val))
            {
                if (val > 0)
                {
                    return true;
                }
            }
            return false;
        }
        internal static bool IsPositiveInteger(string text, out int? val)
        {
            int v = 0;
            if (int.TryParse(text, out v))
            {
                if (v > 0)
                {
                    val = v;
                    return true;
                }
            }
            val = null;
            return false;
        }
        /// <summary>
        /// Kiểm tra một số không âm
        /// </summary>
        /// <param name="text"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        internal static bool IsNotNegativeInteger(string text, out int val)
        {
            if (int.TryParse(text, out val))
            {
                if (val >= 0)
                {
                    return true;
                }
            }
            return false;
        }
        internal static bool IsNotNegativeInteger(string text, out float val)
        {
            if (float.TryParse(text, out val))
            {
                if (val >= 0)
                {
                    return true;
                }
            }
            return false;
        }
        internal static bool IsMaHocPhan(string mahocphan)
        {
            mahocphan = mahocphan.Trim();
            var pattern = @"[\p{L}\d]{4}0[1-7][1-2][1,2,3,4,8][L,T,D]";
            Regex r = new Regex(pattern, RegexOptions.IgnoreCase);
            Match m = r.Match(mahocphan);
            if (!m.Success)
            {                
                return false;
            }
            return true;
        }
        internal static bool IsSoDienThoai(string mahocphan)
        {
            mahocphan = mahocphan.Trim();
            var pattern = @"0[0-9]{9}[0-9]*";
            Regex r = new Regex(pattern, RegexOptions.IgnoreCase);
            Match m = r.Match(mahocphan);
            if (!m.Success)
            {
                return false;
            }
            return true;
        }
        internal static bool IsNhomTinChi(string nhomTinChi, out int soTinChi, out int soGioLyThuyet, out int soGioThucHanh, out int soGioTuHoc)
        {
            nhomTinChi.Trim();
            nhomTinChi = nhomTinChi.Replace(" ", "");
            var pattern = @"\d\(\d*,\d*,\d*\)";
            Regex r = new Regex(pattern, RegexOptions.IgnoreCase);
            Match m = r.Match(nhomTinChi);
            if (!m.Success)
            {
                soTinChi = soGioLyThuyet = soGioThucHanh = soGioTuHoc = 0;
                return false;
            }
            Extract(nhomTinChi, out soTinChi, out soGioLyThuyet, out soGioThucHanh, out soGioTuHoc);
            return true;
        }

        internal static async Task<bool> IsHocPhanLyThuyet(int idLoaiHocPhan)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var loaiHocPhan = await _context.LoaiHocPhans.FindAsync(idLoaiHocPhan);
            return Function.CompareUpcaseAndTrim(loaiHocPhan.TenLoaiHocPhan, "Lý thuyết");
        }

    public static void Extract(string content, out int SoTinChi, out int SoGioLyThuyet, out int SoGioThucHanh, out int SoGioTuHoc)
        {
            int quyDinhSoGioTuHoc = (int)GetValue.QuyDinh(@"Số giờ tự học cho 1 tín chỉ",null);
            int posNgoacMo = content.IndexOf('(');
            int posNgoacDong = content.IndexOf(')');
            SoTinChi = int.Parse(content.Substring(0, posNgoacMo));
            string chuoiTrongNgoac = content.Substring(posNgoacMo + 1, posNgoacDong - posNgoacMo - 1);
            string[] tachTheoDauPhay = chuoiTrongNgoac.Split(new char[] { ',' });
            SoGioLyThuyet = int.Parse(tachTheoDauPhay[0]);
            SoGioThucHanh = int.Parse(tachTheoDauPhay[1]);
            SoGioTuHoc = int.Parse(tachTheoDauPhay[2]);
            if (quyDinhSoGioTuHoc * SoTinChi != SoGioTuHoc)
            {
                SoGioTuHoc = quyDinhSoGioTuHoc * SoTinChi;
            }
        }

        internal static async Task<bool> IsHocPhanThucHanh(int idLoaiHocPhan)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var loaiHocPhan = await _context.LoaiHocPhans.FindAsync(idLoaiHocPhan);
            return Function.CompareUpcaseAndTrim(loaiHocPhan.TenLoaiHocPhan, "Thực hành");
        }

        internal static bool IsInteger(string text,out int? value)
        {
            int val;
            if (int.TryParse(text, out val))
            {
                value = val;
                return true;
            }
            value = null;
            return false;
        }

        internal static bool IsLoaiHocPhan(string tenLoaiHocPhan)
        {
            return _context.LoaiHocPhans.ToList().Any(n => Function.CompareUpcaseAndTrimAllSpecialCase( n.TenLoaiHocPhan, tenLoaiHocPhan));
        }

        internal static bool IsDate(string text, out DateTime thoiGian)
        {
            return DateTime.TryParse(text,out thoiGian);
        }

        internal static bool IsDate(string text, out DateTime? thoiGian)
        {
            DateTime date;
            if( !DateTime.TryParse(text, out date))
            {
                thoiGian = null;
                return false;
            }
            thoiGian = date;
            return true;
        }

        internal static string CheckParametersHocPhan(HocPhan hocPhan)
        {
            VietTat vietTat = new VietTat();
            float LyThuyet1TinChi = GetValue.QuyDinh(VietTat.SoGioLyThuyet1TinChi, hocPhan.ThoiGianBatDau);

            float HuongDanTuHoc1TinChi = GetValue.QuyDinh(VietTat.SoGioHuongDanTuHocCho1TinChi, hocPhan.ThoiGianBatDau);

            float TuHoc1TinChi = GetValue.QuyDinh(VietTat.SoGioTuHocCho1TinChi, hocPhan.ThoiGianBatDau);

            float ThucTapDoAn = GetValue.QuyDinh(VietTat.SoGioThucTapDoAnKhoaLuanTotNghiepCho1TinChi, hocPhan.ThoiGianBatDau);

            float ThiNghiemThaoLuan1TinChi = GetValue.QuyDinh(VietTat.SoTietThiNghiemThaoLuanCho1TinChi, hocPhan.ThoiGianBatDau);

            float ThucHanh1TinChi = GetValue.QuyDinh(VietTat.SoGioThucHanh1TinChi, hocPhan.ThoiGianBatDau);

            string TenLoaiHocPhan = GetName.TenLoaiHocPhan(hocPhan.IdLoaiHocPhan);
            if (TenLoaiHocPhan=="Lý thuyết")
            {
                if (LyThuyet1TinChi * hocPhan.SoTinChi != hocPhan.SoTietLyThuyet + hocPhan.SoTietThaoLuanThiNghiemThucHanh* (LyThuyet1TinChi/ ThiNghiemThaoLuan1TinChi))
                {
                    return "Xem lại về công thức tính số tiết cho học phần lý thuyết";
                }
                if (HuongDanTuHoc1TinChi*hocPhan.SoTinChi!=hocPhan.HuongDanTuHoc)
                {
                    return "Xem lại về công thức tính số giờ tự học cho học phần lý thuyết";
                }

            }
            else if (TenLoaiHocPhan =="Thực hành")
            {
                if(hocPhan.SoTinChi * ThucHanh1TinChi != hocPhan.SoTietThaoLuanThiNghiemThucHanh)
                {
                    return "Xem lại về công thức tính số tiết thực hành cho học phần thực hành";
                }
                if (hocPhan.HuongDanTuHoc!=0)
                {
                    return "Số giờ hướng dẫn tự học cho học phần thực hành = 0";
                }
            }
            else if (TenLoaiHocPhan == "Đồ án")
            {
                if (hocPhan.SoTinChi * ThucTapDoAn != hocPhan.SoTietThaoLuanThiNghiemThucHanh)
                {
                    return "Xem lại về công thức tính số tiết cho học phần đồ án";
                }
                if (hocPhan.HuongDanTuHoc != 0)
                {
                    return "Số giờ hướng dẫn tự học cho học phần đồ án = 0";
                }
            }
            if(Function.CompareUpcaseAndTrimAllSpecialCase(hocPhan.TenHocPhan,"Giáo dục thể chất") && hocPhan.SoGioChuanBiTuHoc !=0)
            {
                return "Các học phần Giáo dục thể có số giờ tự học = 0";
            }
            //chưa xét các trường hợp các môn thuộc bộ môn thể chất
            if (hocPhan.SoGioChuanBiTuHoc != TuHoc1TinChi * hocPhan.SoTinChi && !Function.CompareUpcaseAndTrimAllSpecialCase(hocPhan.TenHocPhan, "Giáo dục thể chất"))
            {
                return "Xem lại về công thức tính số giờ tự học cho học phần";
            }
            return "";
        }

        internal static bool CheckDuplicateHocPhan(List<HocPhan> list, HocPhan HocPhan)
        {
            HocPhan hp = null;
            hp = list.Where(n => Function.CompareTwoHocPhan(n, HocPhan)).FirstOrDefault();
            if (hp!=null)
            {
                if (HocPhan.IdHocPhan==0)
                {
                    return true;
                }
                else if (hp.IdHocPhan != HocPhan.IdHocPhan)
                {
                    return true;
                }
            }
            return false;
        }

        internal static bool IsTenCongViec(string tenLoaiCongViec)
        {
            return _context.LoaiCongViecs.ToList().Any(n => Function.CompareUpcaseAndTrimAllSpecialCase( n.TenLoaiCongViec, tenLoaiCongViec));

        }

        internal static bool isKhoa(string phongKhoaTrungTam)
        {
            return _context.Khoas.ToList().Any(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenKhoa, phongKhoaTrungTam));
        }

        internal static bool isPhongTrungTam(string phongKhoaTrungTam)
        {
            return _context.PhongTrungTams.ToList().Any(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenPhongTrungTam, phongKhoaTrungTam));
        }

        internal static bool isPositiveFloat(string text, out float val)
        {
            if (float.TryParse(text, out val))
            {
                if (val > 0)
                {
                    return true;
                }
            }
            return false;
        }

        internal static bool isPositiveFloat(string text, out float? val)
        {
            float vv = 0;
            if (float.TryParse(text, out vv))
            {
                if (vv > 0)
                {
                    val = vv;
                    return true;
                }
            }
            val = null;
            return false;
        }

        internal static bool isNotNegativeFloat(string text, out float? val)
        {
            float vv = 0;
            if (float.TryParse(text, out vv))
            {
                if (vv >= 0)
                {
                    val = vv;
                    return true;
                }
            }
            val = null;
            return false;
        }
    }
}