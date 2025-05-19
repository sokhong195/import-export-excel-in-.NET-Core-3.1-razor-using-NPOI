using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    public class GetName
    {
        public static dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
        public static string NamHocHocKy(int idNamHocHocKy, string namhoc=" năm học ")
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var namHocHocKy = _context.NamHocHocKies
                .Join(
                _context.NamHocs,
                p => p.IdNamHoc,
                q => q.IdNamHoc,
                (p, q) => new
                {
                    q.TenNamHoc,
                    p.IdHocKy,
                    p.IdNamHocHocKy,
                    p.ThoiGianBatDau
                })
                .Join(
                _context.HocKies,
                 p => p.IdHocKy,
                q => q.IdHocKy,
                (p, q) => new
                {
                    p.IdNamHocHocKy,
                    TenNamHocHocKy = q.TenHocKy + namhoc + p.TenNamHoc,
                    p.ThoiGianBatDau
                }).Where(x => x.IdNamHocHocKy == idNamHocHocKy).FirstOrDefault();
            if (namHocHocKy == null) return "";
            return namHocHocKy.TenNamHocHocKy;
        }
        public static string TenBaoGioGiangDay(int idBaoGioGiangDay)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var baoGioGiangDay = _context.BaoGioGiangDays
               .Where(x => x.IdBaoGioGiangDay == idBaoGioGiangDay).FirstOrDefault();
            if (baoGioGiangDay == null) return "";
            return baoGioGiangDay.TenPhanCongGiangDay;
        }

        internal static string TenLoaiHocPhan(int idLoaiHocPhan)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var loaiHocPhan = _context.LoaiHocPhans
               .Where(x => x.IdLoaiHocPhan == idLoaiHocPhan).FirstOrDefault();
            if (loaiHocPhan == null) return "";
            return loaiHocPhan.TenLoaiHocPhan;
        }

        internal static string TenChucVu(int id)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var chucVu = _context.ChucVus
               .Where(x => x.IdChucVu == id).FirstOrDefault();
            if (chucVu == null) return "";
            return chucVu.TenChucVu;
        }

        internal static string TenBoMon(int idBoMon)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var boMon = _context.BoMons
               .Where(x => x.IdBoMon == idBoMon).FirstOrDefault();
            if (boMon == null) return "";
            return boMon.TenBoMon;
        }

        internal static string TenKhoa(string idKhoa)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var entity = _context.Khoas
               .Where(x => x.IdKhoa == idKhoa).FirstOrDefault();
            if (entity == null) return "";
            return entity.TenKhoa;
        }

       
    }
}
