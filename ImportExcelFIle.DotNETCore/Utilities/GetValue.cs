using ImportExcelFIle.DotNETCore.Classes;
using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    internal class GetValue
    {
        internal static float QuyDinh(string tenquydinh, DateTime? ngay=null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var q = from ctqd in _context.QuyDinhChiTiets
                    join qd in _context.QuyDinhs on ctqd.IdQuyDinh equals qd.IdQuyDinh
                    where qd.TenQuyDinh == tenquydinh
                    select new QuyDinhChiTiet
                    {             
                        GiaTri = ctqd.GiaTri,
                        ThoiGianBatDau = ctqd.ThoiGianBatDau,
                        ThoiGianKetThuc = ctqd.ThoiGianKetThuc,
                    };

            var v = q.ToList();
            v = v.AsQueryable().Where(Filters.FilterDate<QuyDinhChiTiet>(ngay)).ToList();
            if (v == null || v.Count() == 0 || v.Count() > 1)
            {
                return -1;
            }
            return v[0].GiaTri;
        }

        internal static float HeSoSiSo(int siSo, List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans)
        {
            var q = quyDinhSiSoLopHocPhans.Where(n => n.CanDuoi <= siSo && n.CanTren >= siSo && n.DangHocPhan == DangHocPhanTinhHeSo.HocPhanLyThuyet).SingleOrDefault();
            if (q != null) return q.HeSoSiSo;
            return -1;
        }

        internal static float HeSoHuongDanTuHoc(DateTime thoiGian)
        {
            return QuyDinh(VietTat.QuyDoiHuongDanTuHoc, thoiGian);
        }
        internal static float SoGioHuongDanTuHocCho1TinChi(DateTime thoiGian)
        {
            return QuyDinh(VietTat.SoGioHuongDanTuHocCho1TinChi, thoiGian);
        }
        internal static float HeSoHuongDanThaoLuan(int siSo, List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans)
        {
            var q = quyDinhSiSoLopHocPhans.Where(n => n.CanDuoi <= siSo && n.CanTren >= siSo && n.DangHocPhan == DangHocPhanTinhHeSo.HocPhanLyThuyetCoHuongDanThaoLuan).SingleOrDefault();
            if (q != null) return q.HeSoSiSo;
            return -1;
        }

        internal static float HeSoHuongDanThiNghiem(int siSo, List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans)
        {
            var q = quyDinhSiSoLopHocPhans.Where(n => n.CanDuoi <= siSo && n.CanTren >= siSo && n.DangHocPhan == DangHocPhanTinhHeSo.HocPhanLyThuyetCoHuongDanThiNghiem).SingleOrDefault();
            if (q != null) return q.HeSoSiSo;
            return -1;
        }

        internal static async Task<DateTime?> ThoiGianBatDauCuaBaoGioGiangDay(int idBaoGioGiangDay)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var baoGioGiangDay = await _context.BaoGioGiangDays.FindAsync(idBaoGioGiangDay);
            if (baoGioGiangDay!=null)
            {
                return baoGioGiangDay.ThoiGianBatDau;
            }
            return null;
        }

        internal static float QuyDoiGioChuan1TuanHuongDanSuPham(int siSo, List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs, out float gioChuanBoSung1Tuan, DateTime? thoiGianBatDau)
        {
            gioChuanBoSung1Tuan = 0;
            int soSinhVienMax = quyDinhGioChuanThucHanhs.Where(n => n.TenNoiDungGiangDay == NoiDungThucHanh.HuongDanThucTapSuPham).Max(n => n.CanTren);
            if (siSo<= soSinhVienMax)
            {
                var q = quyDinhGioChuanThucHanhs.Where(n => n.CanDuoi <= siSo && n.CanTren >= siSo && n.TenNoiDungGiangDay == NoiDungThucHanh.HuongDanThucTapSuPham).SingleOrDefault();
                if (q != null) return q.SoGioChuan;
                return -1;
            }
            else             //>30 tinh bo sung

            {
                var q = quyDinhGioChuanThucHanhs.Where(n => n.CanTren == soSinhVienMax && n.TenNoiDungGiangDay == NoiDungThucHanh.HuongDanThucTapSuPham).SingleOrDefault();
                int soSinhVienBoSung = siSo - soSinhVienMax;
                gioChuanBoSung1Tuan = soSinhVienBoSung*GetValue.QuyDinh(VietTat.GioChuanThucHanhTinhThemKhiSoSinhVienVuotKhung, thoiGianBatDau);
            }
            return -1;
        }

        internal static float QuyDoiGioChuan1TuanThucHanh(int siSo, string idKhoa, List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs, out float gioChuanBoSung1Tuan, DateTime? thoiGianBatDau)
        {
            gioChuanBoSung1Tuan = 0;
            int soSinhVienMax = quyDinhGioChuanThucHanhs.Where(n => n.TenNoiDungGiangDay == NoiDungThucHanh.GiangDayThucHanh&& n.IdKhoa == idKhoa).Max(n => n.CanTren);
            if (siSo <= soSinhVienMax)
            {
                var q = quyDinhGioChuanThucHanhs.Where(n => n.CanDuoi <= siSo && n.CanTren >= siSo && n.TenNoiDungGiangDay == NoiDungThucHanh.GiangDayThucHanh && idKhoa == n.IdKhoa).SingleOrDefault();
                if (q != null) return q.SoGioChuan;
                return -1;
            }
            else // tinh bo sung
            {
                var q = quyDinhGioChuanThucHanhs.Where(n => n.CanTren == soSinhVienMax && n.TenNoiDungGiangDay == NoiDungThucHanh.GiangDayThucHanh && n.IdKhoa == idKhoa).SingleOrDefault();
                int soSinhVienBoSung = siSo - soSinhVienMax;
                gioChuanBoSung1Tuan = soSinhVienBoSung * GetValue.QuyDinh(VietTat.GioChuanThucHanhTinhThemKhiSoSinhVienVuotKhung, thoiGianBatDau);
            }
            return -1;
        }

        internal static float HeSoSiSoGiaoDucTheChat(int siSo, List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans)
        {
            var q = quyDinhSiSoLopHocPhans.Where(n => n.CanDuoi <= siSo && n.CanTren >= siSo && n.DangHocPhan == DangHocPhanTinhHeSo.HocPhanGiaoDucTheChat).SingleOrDefault();
            if (q != null) return q.HeSoSiSo;
            return -1;
        }

        internal static float HeSoSiSoThucHanhNgoaiNgu(int siSo, List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans)
        {
            var q = quyDinhSiSoLopHocPhans.Where(n => n.CanDuoi <= siSo && n.CanTren >= siSo && n.DangHocPhan == DangHocPhanTinhHeSo.HocPhanThucHanhNgoaiNgu).SingleOrDefault();
            if (q != null) return q.HeSoSiSo;
            return -1;
        }

        internal static DateTime GetThoiGian(int idBaoGioGiangDay)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();

            BaoGioGiangDay baoGioGiangDay =  _context.BaoGioGiangDays.Find(idBaoGioGiangDay);
            return baoGioGiangDay.ThoiGianBatDau;
        }

        internal static void GetThoiGian(int idNamHocHocKy, out DateTime tGBD, out DateTime tGKT)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            NamHocHocKy namHocHocKy = _context.NamHocHocKies.Find(idNamHocHocKy);
            tGBD = namHocHocKy.ThoiGianBatDau;
            tGKT = namHocHocKy.ThoiGianKetThuc.Value;
        }
        /// <summary>
        /// Định mức công tác của giáo viên trong học kỳ
        /// </summary>
        /// <param name="idGiaoVien"></param>
        /// <param name="thoiGianBatDau"></param>
        /// <returns></returns>
        internal static double DinhMucCongTacHocKy(DateTime thoiGianBatDau, DateTime thoiGianKetThuc, ref double nvgd )
        {
            var nckh = QuyDinh(VietTat.NghienCuuKhoaHoc, thoiGianBatDau);
            nvgd = QuyDinh(VietTat.NhiemVuGiangDay, thoiGianBatDau);
            var pvcd = QuyDinh(VietTat.PhucVuCongDong, thoiGianBatDau);
            var soNgayCongTac = Function.TraVeNgayLamViec(thoiGianBatDau, thoiGianKetThuc);
            var soTuanContTacMotNam = GetValue.QuyDinh(VietTat.SoTuanCongTacMotNam, thoiGianBatDau);
            return (nckh + nvgd + pvcd) * soNgayCongTac / (soTuanContTacMotNam * 5);
        }
    }
}