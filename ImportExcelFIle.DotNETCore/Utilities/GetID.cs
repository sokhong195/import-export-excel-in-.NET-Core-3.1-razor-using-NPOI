using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    public static class GetID
    {
        public static dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
        public static string IdKhoaTheoBoMon(int? IdBoMon)
        {
            BoMon boMon = _context.BoMons.Find(IdBoMon);
             if (boMon != null) return boMon.IdKhoa;
            return "";
        }

        internal static int IdLoaiHocPhan(string tenLoaiHocPhan)
        {
            var loaiHocPhans = _context.LoaiHocPhans.ToList().Where(n => Function.CompareUpcaseAndTrimAllSpecialCase( n.TenLoaiHocPhan , tenLoaiHocPhan)).FirstOrDefault();
            if (loaiHocPhans==null)
            {
                return 0;
            }
            return loaiHocPhans.IdLoaiHocPhan;
        }

        internal static int IdTrinhDo(string tenTrinhDo)
        {
            var trinhDos = _context.TrinhDos.ToList().Where(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenTrinhDo , tenTrinhDo)).ToList();
            if (trinhDos == null ||trinhDos.Count()>1)
            {
                return 0;
            }
            return trinhDos[0].IdTrinhDo;
        }

        internal static int? IdBoMon(string tenBoMon)
        {
            var q = _context.BoMons.ToList().Where(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenBoMon, tenBoMon)).FirstOrDefault();
            if (q==null)
            {
                return null;
            }
            return q.IdBoMon;
        }

        internal static int? IdHinhThuThi(string tenHinhThucThi)
        {
            var q = _context.HinhThucThis.ToList().Where(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenHinhThucThi, tenHinhThucThi)).FirstOrDefault();
            if (q == null)
            {
                return null;
            }
            return q.IdHinhThucThi;
        }

        internal static int? IdLoaiCongViec(string tenLoaiCongViec)
        {
            var q = _context.LoaiCongViecs.ToList().Where(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenLoaiCongViec, tenLoaiCongViec)).FirstOrDefault();
            if (q == null)
            {
                return null;
            }
            return q.IdLoaiCongViec;
        }

        internal static string IdKhoa(string phongKhoaTrungTam)
        {
            var q = _context.Khoas.ToList().Where(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenKhoa, phongKhoaTrungTam)).FirstOrDefault();
            if (q == null)
            {
                return "";
            }
            return q.IdKhoa;
        }

        internal static int? IdPhongTrungTam(string phongKhoaTrungTam)
        {
            var q = _context.PhongTrungTams.ToList().Where(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenPhongTrungTam, phongKhoaTrungTam)).FirstOrDefault();
            if (q == null)
            {
                return null;
            }
            return q.IdPhongTrungTam;
        }

        internal static int? IdChucVu(string tenChucVu)
        {
            var q = _context.ChucVus.ToList().Where(n => Function.CompareUpcaseAndTrimAllSpecialCase(n.TenChucVu, tenChucVu)).FirstOrDefault();
            if (q == null)
            {
                return null;
            }
            return q.IdChucVu;
        }

        internal static int IdGiaoVienByIdChiTietGiaoVien(int idGiaoVienChiTiet)
        {
            GiaoVienChiTiet giaoVienChiTiet = _context.GiaoVienChiTiets.Find(idGiaoVienChiTiet);
            if (giaoVienChiTiet != null) return giaoVienChiTiet.IdGiaoVien;
            return 0;
        }

        internal static int IdBaoGioGiangDay(int idBaoGioGiangDayChiTiet)
        {
            BaoGioGiangDayChiTiet baoGioGiangDayChiTiet = _context.BaoGioGiangDayChiTiets.Find(idBaoGioGiangDayChiTiet);
            if (baoGioGiangDayChiTiet != null) return (int)baoGioGiangDayChiTiet.IdBaoGioGiangDay;
            return 0;
        }
    }
}
