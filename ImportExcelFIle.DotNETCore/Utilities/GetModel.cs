using AutoMapper;
using ImportExcelFIle.DotNETCore.Classes;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.ModelViews;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    internal class GetModel
    {
        internal static async  Task<ViewBaoGioGiangDayChiTiet> ViewBaoGioGiangDayChiTiet(int? id, DateTime? thoiGianBatDau=null)
        {

            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans = await GetList.QuyDinhSiSoLopHocPhans(thoiGianBatDau);
            List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs = await GetList.QuyDinhGioChuanThucHanhs(thoiGianBatDau);

            return _context.BaoGioGiangDayChiTiets.Where(n=>n.IdBaoGioGiangDayChiTiet ==id)
                .Join(
                _context.HocPhans,
                p => p.IdHocPhan,
                q => q.IdHocPhan,
                (p, q) =>
                new ViewBaoGioGiangDayChiTiet(
                     p.IdBaoGioGiangDayChiTiet,
                     q.IdHocPhan,
                     q.MaHocPhan,
                     p.TenLopHocPhan,
                     p.SiSo,
                     p.SoNhom,
                     q.SoTinChi,
                     q.SoTietLyThuyet,
                     q.SoTietThaoLuanThiNghiemThucHanh,
                     q.SoGioChuanBiTuHoc,
                     q.IdKhoa,
                     p.GhiChu,
                     q.HuongDanTuHoc,
                     p.IdBaoGioGiangDay != null ? (int)p.IdBaoGioGiangDay : 0,
                     Function.CalculateGioChuan(p, q, quyDinhGioChuanThucHanhs, quyDinhSiSoLopHocPhans, thoiGianBatDau),
                     "",
                     0,
                     0,
                     0,
                     0
                    )
                ).FirstOrDefault();
        }

        internal async static Task<GiaoVienTrinhDo> GiaoVienTrinhDo(int idGiaoVienTrinhDo)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return await _context.GiaoVienTrinhDoes.FindAsync(idGiaoVienTrinhDo);
        }

        internal async static Task<ViewChuVuQuyDinhChiTiet> ViewChucVuQuyDinhChiTiet(int id)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            ViewChuVuQuyDinhChiTiet chucVu = await Task.Run(()=> _context.ChucVus.Where(n=>n.IdChucVu == id).Select(n=> new ViewChuVuQuyDinhChiTiet { 
            IdChucVu = n.IdChucVu,
            TenChucVu = n.TenChucVu,
            QuyDinhChiTiets = new System.Collections.Generic.List<QuyDinhChiTiet>()
            }).FirstOrDefault());
            return chucVu;
        }

        internal static async Task<GiaoVienTrangThaiLamViec> GiaoVienTrangThaiLamViec(int idGiaoVienTrangThaiLamViec)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return await _context.GiaoVienTrangThaiLamViecs.FindAsync(idGiaoVienTrangThaiLamViec);
        }

        internal static async Task<CacHeSoLuong> CacHeSoLuong(int idCacHeSoLuong)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return await _context.CacHeSoLuongs.FindAsync(idCacHeSoLuong);
        }

        internal static async Task<GiaoVienChucVu> GiaoVienChucVu(int idGiaoVienChucVu)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return await _context.GiaoVienChucVus.FindAsync(idGiaoVienChucVu);
        }

        internal async static Task<HocPhan> HocPhan(int objId)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return await _context.HocPhans.FindAsync(objId);
        }

        internal async static Task<GiaoVienChiTiet> GiaoVienChiTiet(int idGiaoVienChiTiet)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return await _context.GiaoVienChiTiets.FindAsync(idGiaoVienChiTiet);
        }

        internal async static Task<ViewGiaoVien> ViewGiaoVien(int IdGiaoVien, DateTime? thoiGian=null)
        {
            GiaoVien giaoVien = await GetModel.GiaoVien(IdGiaoVien);
            if (giaoVien !=null)
            {
                ViewGiaoVien viewGiaoVien = new ViewGiaoVien();
                IMapper mapper = AutoMapperProfile.AutoMapperConfig();
                viewGiaoVien = mapper.Map<ViewGiaoVien>(giaoVien);
                viewGiaoVien.ViewGiaoVienChiTiets = GetList.ViewGiaoVienChiTiets(null, IdGiaoVien, thoiGian,true);
                viewGiaoVien.ViewChucVuChiTiets = GetList.ViewChucVuChiTiets(IdGiaoVien, thoiGian,true);
                viewGiaoVien.CacHeSoLuongs = GetList.CacHeSoLuongs(IdGiaoVien, thoiGian,true);
                viewGiaoVien.ViewGiaoVienTrangThaiLamViecs = GetList.ViewGiaoVienTrangThaiLamViecs(IdGiaoVien, thoiGian,true);
                viewGiaoVien.ViewGiaoVienTrinhDoes = GetList.ViewGiaoVienTrinhDoes(IdGiaoVien, thoiGian, true);

                return viewGiaoVien;
            }
            return null;
        }

        private async static Task< GiaoVien> GiaoVien(int idGiaoVien)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return await _context.GiaoViens.FindAsync(idGiaoVien);
        }

        internal static QuyDinh QuyDinhByName(string chucVu)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var quydinh = _context.QuyDinhs.Where(n => n.TenQuyDinh == chucVu).FirstOrDefault();
            return quydinh;
        }

        internal static async Task<PhanCongGiangDay> PhanCongGiangDay(int idBaoGioGiangDayChiTiet, int idGiaoVien)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var phanCongGiangDay = await _context.PhanCongGiangDays.SingleOrDefaultAsync(n => n.IdBaoGioGiangDayChiTiet == idBaoGioGiangDayChiTiet && n.IdGiaoVien == idGiaoVien);
            return phanCongGiangDay;
        }
    }
}