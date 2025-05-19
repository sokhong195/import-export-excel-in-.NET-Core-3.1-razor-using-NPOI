using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.ModelViews;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    public class GetList
    {
        public static dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
        public static SelectList NamHocHocKySelectList(int? idNamHocHocKy, DateTime? thoiGian = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<NamHocHocKy> namHocHocKies = _context.NamHocHocKies.ToList();
            if (thoiGian != null)
            {
                namHocHocKies = _context.NamHocHocKies.AsQueryable().Where<NamHocHocKy>(Filters.FilterDate<NamHocHocKy>(thoiGian)).ToList();
            }

            var query = namHocHocKies
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
                    TenNamHocHocKy = q.TenHocKy + " " + p.TenNamHoc,
                    p.ThoiGianBatDau
                }).OrderByDescending(p => p.ThoiGianBatDau).ToList();
            return new SelectList(query, "IdNamHocHocKy", "TenNamHocHocKy", idNamHocHocKy);
        }

        internal static async Task<SelectList> GiaoVienSelectList(string idKhoa = "", int? idBoMon = null, int? idGiaoVien = null, DateTime? thoiGian = null, bool addZero = true)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<ViewGiaoVienChiTiet> viewGiaoVienChiTiets = GetList.ViewGiaoVienChiTiets(null, 0, thoiGian);
            if (!Function.IsNullOrZero(idBoMon))
            {
                viewGiaoVienChiTiets = viewGiaoVienChiTiets.Where(n => n.IdBoMon == (int)idBoMon).ToList();
            }
            else
            {
                if (idKhoa != "") viewGiaoVienChiTiets = viewGiaoVienChiTiets.Where(n => n.IdKhoa == idKhoa).ToList();
            }
            var dquery = viewGiaoVienChiTiets.Select(n => new { n.IdGiaoVien, n.HoTenGiaoVien }).ToList();
            if (addZero)
            {
                dquery.Insert(0, new { IdGiaoVien = 0, HoTenGiaoVien = "Chọn giáo viên" });

            }
            return await Task.Run(() => new SelectList(dquery, "IdGiaoVien", "HoTenGiaoVien", idGiaoVien));
        }

        internal static async Task<List<QuyDinhGioChuanThucHanh>> QuyDinhGioChuanThucHanhs(DateTime? thoiGianBatDau = null, DateTime? thoiGianKetThuc = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            if (thoiGianBatDau != null)
            {
                var quyDinhGioChuanThucHanhs = await _context.QuyDinhGioChuanThucHanhs.AsQueryable().Where(Filters.FilterDate<QuyDinhGioChuanThucHanh>(thoiGianBatDau, thoiGianKetThuc)).ToListAsync();
                return quyDinhGioChuanThucHanhs;
            }
            return await _context.QuyDinhGioChuanThucHanhs.ToListAsync();
        }

        internal static async Task<List<ViewPhanCongGiangDay>> ViewPhanCongGiangDays(int? idBaoGioGiangDay)
        {
            List<ViewPhanCongGiangDay> viewPhanCongGiangDays = new List<ViewPhanCongGiangDay>();
            List<ViewBaoGioGiangDayChiTiet> viewBaoGioGiangDayChiTiets = await ViewBaoGioGiangDayChiTiets((int)idBaoGioGiangDay);

            if (!Function.ListIsNullOrEmpty<ViewBaoGioGiangDayChiTiet>(viewBaoGioGiangDayChiTiets))
            {
                foreach (var item in viewBaoGioGiangDayChiTiets)
                {
                    ViewPhanCongGiangDay viewPhanCongGiangDay = new ViewPhanCongGiangDay();
                    viewPhanCongGiangDay.ViewBaoGioGiangDayChiTiet = item;
                    viewPhanCongGiangDays.Add(viewPhanCongGiangDay);
                    var phanCongGiangDays = await PhanCongGiangDays(item.IdBaoGioGiangDayChiTiet);
                    foreach (var subitem in phanCongGiangDays)
                    {
                        viewPhanCongGiangDay.IdGiaoViens.Add(subitem.IdGiaoVien);
                        viewPhanCongGiangDay.ChiaGios.Add(subitem.SoGioHoacTuanHoacSoNguoi);
                    }
                }
            }
            return viewPhanCongGiangDays;
        }

        internal static async Task<List<ViewPhanCongGiangDay>> ViewPhanCongGiangDaysTheoGiaoVien(int? idBaoGioGiangDay,int? idGiaoVien)
        {
            List<ViewPhanCongGiangDay> viewPhanCongGiangDays = new List<ViewPhanCongGiangDay>();
            List<ViewBaoGioGiangDayChiTiet> viewBaoGioGiangDayChiTiets = await ViewBaoGioGiangDayChiTiets((int)idBaoGioGiangDay);

            if (!Function.ListIsNullOrEmpty<ViewBaoGioGiangDayChiTiet>(viewBaoGioGiangDayChiTiets))
            {
                foreach (var item in viewBaoGioGiangDayChiTiets)
                {
                    ViewPhanCongGiangDay viewPhanCongGiangDay = new ViewPhanCongGiangDay();
                    viewPhanCongGiangDay.ViewBaoGioGiangDayChiTiet = item;
                    viewPhanCongGiangDays.Add(viewPhanCongGiangDay);
                    var phanCongGiangDays = await PhanCongGiangDays(item.IdBaoGioGiangDayChiTiet);
                    foreach (var subitem in phanCongGiangDays)
                    if(subitem.IdGiaoVien==idGiaoVien)
                    {
                        viewPhanCongGiangDay.IdGiaoViens.Add(subitem.IdGiaoVien);
                        viewPhanCongGiangDay.ChiaGios.Add(subitem.SoGioHoacTuanHoacSoNguoi);
                    }
                }
            }
            return viewPhanCongGiangDays;
        }

        internal static List<ViewGiaoVienTrinhDo> ViewGiaoVienTrinhDoes(int idGiaoVien, DateTime? thoiGian, bool layCa=false)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<GiaoVienTrinhDo> giaoVienTrinhDos;
            if (layCa)
            {
                giaoVienTrinhDos = _context.GiaoVienTrinhDoes.ToList();
            }
            else
                giaoVienTrinhDos = _context.GiaoVienTrinhDoes.AsQueryable().Where(Filters.FilterDate<GiaoVienTrinhDo>(thoiGian)).ToList();

            var list = from gvtd in giaoVienTrinhDos
                       join cv in _context.TrinhDos on gvtd.IdTrinhDo equals cv.IdTrinhDo
                       select new ViewGiaoVienTrinhDo
                       {
                           IdTrinhDo = gvtd.IdTrinhDo,
                           IdGiaoVienTrinhDo = gvtd.IdGiaoVienTrinhDo,
                           ThoiGianBatDau = gvtd.ThoiGianBatDau,
                           ThoiGianKetThuc = gvtd.ThoiGianKetThuc,
                           TenTrinhDo = cv.TenTrinhDo,
                           QuyetDinh = gvtd.QuyetDinh,
                           IdGiaoVien = gvtd.IdGiaoVien,
                           TinhTrang = gvtd.TinhTrang
                       };
            if (idGiaoVien != 0)
            {
                list = list.Where(n => n.IdGiaoVien == idGiaoVien).ToList();
            }
            return list.OrderByDescending(n => n.ThoiGianBatDau).ToList();

        }

        internal static async Task<List<ViewPhanCongSoGioCuaGiaoVien>> ViewPhanCongGiangDaysTheoBoMon(int idNamHocHocKy,int idBaoGioGiangDay, string idKhoa, int? idBoMon)
        {
            try
            {
                List<ViewPhanCongSoGioCuaGiaoVien> viewPhanCongSoGioCuaGiaoViens = new List<ViewPhanCongSoGioCuaGiaoVien>();
                DateTime thoiGian = GetValue.GetThoiGian((int)idBaoGioGiangDay);
                //Danh sách giáo viên chưa xét tình trạng giáo viên
                Dictionary<int,string> ListIdGiaoVien = await ListIdGiaoVienTheoBaoGioGiangDay(idBaoGioGiangDay, idBoMon);
                List<GiaoVien> ListGiaoVien = await ListGiaoVienTheoBaoGioGiangDay(idBaoGioGiangDay, idBoMon);
                DateTime thoiGianBatDau, thoiGianKetThuc;

                GetValue.GetThoiGian(idNamHocHocKy, out thoiGianBatDau, out thoiGianKetThuc);
                List<MienGiamTheoTrangThaiLamViec> mienGiamTheoTrangThaiLamViecs = MienGiamTheoTrangThaiLamViecs(thoiGianBatDau);
                List<HeSoChucVu> heSoChucVus = await GetList.ListHeSoChucVus(thoiGianBatDau);
                //Duyệt danh sách giáo viên theo bộ môn để lấy thông tin giảng dạy
                foreach (var giaovien in ListIdGiaoVien)
                {
                    ViewPhanCongSoGioCuaGiaoVien viewPhanCongSoGioCuaGiaoVien = new ViewPhanCongSoGioCuaGiaoVien();
                    viewPhanCongSoGioCuaGiaoVien.IdGiaoVien = giaovien.Key;
                    viewPhanCongSoGioCuaGiaoVien.HoTenGiaoVien = giaovien.Value;
                    viewPhanCongSoGioCuaGiaoVien.SoGioChuan = Function.CalculateGioChuanGiaoVien(giaovien.Key, thoiGianBatDau,thoiGianKetThuc,heSoChucVus,mienGiamTheoTrangThaiLamViecs);
                    viewPhanCongSoGioCuaGiaoVien.SoGioDaPhan = Function.CalculateSoGioDaPhan(giaovien.Key, idNamHocHocKy,thoiGian);
                    viewPhanCongSoGioCuaGiaoVien.TenTrinhDo = "";
                    viewPhanCongSoGioCuaGiaoVien.GhiChu = "";
                    //danh sach phan cong của giáo viên đó
                    //lọc các môn của giáo viên đó
                    GiaoVien phanCongGiaoVien = ListGiaoVien.Where(n => n.IdGiaoVien == giaovien.Key).ToList()[0];
                    viewPhanCongSoGioCuaGiaoVien.TongSoGioThucHien = 0;
                    foreach (var phancong in phanCongGiaoVien.PhanCongGiangDays)
                    {
                        //var PhanCong1Mon = phancong.PhanCongGiangDays.ToList();
                        var viewBaoGioGiangDayChiTiet = await ViewBaoGioGiangDayChiTietTheoIDKhongTinhGioChuan(phancong.IdBaoGioGiangDayChiTiet);
                        viewPhanCongSoGioCuaGiaoVien.ViewBaoGioGiangDayChiTiets.Add(viewBaoGioGiangDayChiTiet);
                        viewPhanCongSoGioCuaGiaoVien.SoGio.Add(phancong.SoGioHoacTuanHoacSoNguoi);
                    }
                    viewPhanCongSoGioCuaGiaoVien.TongSoGioThucHien = viewPhanCongSoGioCuaGiaoVien.SoGio.Sum();
                    viewPhanCongSoGioCuaGiaoViens.Add(viewPhanCongSoGioCuaGiaoVien);
                }
                return viewPhanCongSoGioCuaGiaoViens;
            }
            catch (Exception ex)
            {
                throw;
            }
            
        }

        private static async Task<Dictionary<int,string>> ListIdGiaoVienTheoBaoGioGiangDay(int idBaoGioGiangDay, int? idBoMon)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var query =
                        from gv in _context.GiaoViens
                        join gvct in _context.GiaoVienChiTiets on gv.IdGiaoVien equals gvct.IdGiaoVien
                        join pcgd in _context.PhanCongGiangDays on gv.IdGiaoVien equals pcgd.IdGiaoVien
                        join bggdct in _context.BaoGioGiangDayChiTiets on pcgd.IdBaoGioGiangDayChiTiet equals bggdct.IdBaoGioGiangDayChiTiet
                        where gvct.IdBoMon == idBoMon && bggdct.IdBaoGioGiangDay == idBaoGioGiangDay
                        group gv by new { gv.IdGiaoVien, gv.HoTenGiaoVien } into gv
                        select gv.Key;
            Dictionary<int, string> dict = new Dictionary<int, string>();
            var list = await query.ToListAsync();
            foreach (var item in list)
            {
                dict.Add(item.IdGiaoVien, item.HoTenGiaoVien);
            }
            return dict;
        }
        private static async Task<List<GiaoVien>> ListGiaoVienTheoBaoGioGiangDay(int idBaoGioGiangDay, int? idBoMon)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var query = 
            from gv in _context.GiaoViens.Include(n=>n.PhanCongGiangDays)
            .Include(n => n.GiaoVienTrangThaiLamViecs)
            .Include(n => n.PhanCongDayTrungTams)
            .Include(n => n.GiaoVienTrinhDos)
            join gvct in _context.GiaoVienChiTiets on gv.IdGiaoVien equals gvct.IdGiaoVien
            join pcgd in _context.PhanCongGiangDays on gv.IdGiaoVien equals pcgd.IdGiaoVien
            join bggdct in _context.BaoGioGiangDayChiTiets on pcgd.IdBaoGioGiangDayChiTiet equals bggdct.IdBaoGioGiangDayChiTiet
            where gvct.IdBoMon == idBoMon && bggdct.IdBaoGioGiangDay == idBaoGioGiangDay
            select gv;
            return await query.ToListAsync();
        }
        internal static async Task<List<QuyDinhSiSoLopHocPhan>> QuyDinhSiSoLopHocPhans(DateTime? thoiGianBatDau = null, DateTime? thoiGianKetThuc = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            if (thoiGianBatDau != null)
            {
                var quyDinhSiSoLopHocPhans = await _context.QuyDinhSiSoLopHocPhans.AsQueryable().Where(Filters.FilterDate<QuyDinhSiSoLopHocPhan>(thoiGianBatDau)).ToListAsync();
                return quyDinhSiSoLopHocPhans;
            }
            return await _context.QuyDinhSiSoLopHocPhans.ToListAsync();
        }

        internal static List<MienGiamTheoTrangThaiLamViec> MienGiamTheoTrangThaiLamViecs(DateTime thoiGianBatDau)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<MienGiamTheoTrangThaiLamViec> mienGiamTheoTrangThaiLamViecs = _context.MienGiamTheoTrangThaiGiaoViens.AsQueryable().Where(Filters.FilterDate<MienGiamTheoTrangThaiLamViec>(thoiGianBatDau)).ToList();
            return mienGiamTheoTrangThaiLamViecs;
        }

        internal static async Task<SelectList> BaoGioGiangDaySelectList(int? idNamHocHocKy = 0, int? idBaoGiaoGiangDay = 0)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();

            var model = "BaoGioGiangDay";
            var text = "Báo giờ giảng dạy";
            var dQuery = _context.BaoGioGiangDays.Where(n => n.IdNamHocHocKy == (int)idNamHocHocKy).Select(n => new { n.IdBaoGioGiangDay, n.TenPhanCongGiangDay }).ToList();
            dQuery.Insert(0, new { IdBaoGioGiangDay = 0, TenPhanCongGiangDay = "Chọn " + text });
            return await Task.Run(() => new SelectList(dQuery, "Id" + model, "TenPhanCongGiangDay", idBaoGiaoGiangDay));
        }

        internal static async Task<SelectList> QuyDinhValue(int? idQuyDinh = null, int? idLoaiQuyDinh = null, DateTime? thoigian = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var QuyDinhChiTiets = _context.QuyDinhChiTiets.AsQueryable().Where(Filters.FilterDate<QuyDinhChiTiet>(thoigian)).ToList();
            var dQuery = from qd in _context.QuyDinhs.ToList()
                         join qdct in QuyDinhChiTiets on qd.IdQuyDinh equals qdct.IdQuyDinh
                         select new QuyDinh
                         {
                             IdQuyDinh = qd.IdQuyDinh,
                             TenQuyDinh = qd.TenQuyDinh + " - " + qdct.GiaTri.ToString(),
                             IdLoaiQuyDinh = qd.IdLoaiQuyDinh
                         };
            if (idQuyDinh != null)
            {
                dQuery = dQuery.Where(n => n.IdQuyDinh == idQuyDinh);
            }
            if (idLoaiQuyDinh != null)
            {
                dQuery = dQuery.Where(n => n.IdLoaiQuyDinh == idLoaiQuyDinh);
            }
            return await Task.Run(() => new SelectList(dQuery.OrderBy(n => n.TenQuyDinh).ToList(), "IdQuyDinh", "TenQuyDinh"));
        }

        internal static List<GiaoVienChiTiet> GiaoVienChiTiet(int? idGiaoVien, DateTime? thoiGianBatDau = null, DateTime? thoiGianKetThuc = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var list = _context.GiaoVienChiTiets.AsQueryable().Where(Filters.FilterDate<GiaoVienChiTiet>(thoiGianBatDau, thoiGianKetThuc)).ToList();
            if (idGiaoVien != null)
            {
                list = list.Where(n => n.IdGiaoVien == idGiaoVien).ToList();
            }
            return list;
        }
        internal static List<GiaoVienChiTiet> GiaoVienChiTietTheoBoMon(int? idBoMon, DateTime? thoiGianBatDau = null, DateTime? thoiGianKetThuc = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var list = _context.GiaoVienChiTiets.AsQueryable().Where(Filters.FilterDate<GiaoVienChiTiet>(thoiGianBatDau, thoiGianKetThuc)).ToList();
            if (idBoMon != null)
            {
                list = list.Where(n => n.IdBoMon == idBoMon).ToList();
            }
            return list;
        }
        internal static async Task<SelectList> HeSoChucVus(int? idChucVu = null, DateTime? thoigian = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var HeSoChucVus = _context.HeSoChucVus.AsQueryable().Where(Filters.FilterDate<HeSoChucVu>(thoigian)).ToList();
            var dQuery = from cv in _context.ChucVus.ToList()
                         join hscv in HeSoChucVus on cv.IdChucVu equals hscv.IdChucVu
                         select new ChucVu
                         {
                             IdChucVu = cv.IdChucVu,
                             TenChucVu = cv.TenChucVu + " - " + hscv.GiaTri.ToString()
                         };
            if (idChucVu != null)
            {
                dQuery = dQuery.Where(n => n.IdChucVu == idChucVu);
            }
            return await Task.Run(() => new SelectList(dQuery.OrderBy(n => n.TenChucVu).ToList(), "IdChucVu", "TenChucVu"));
        }
        internal static async Task<List<HeSoChucVu>> ListHeSoChucVus(DateTime? thoigian = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
           return await _context.HeSoChucVus.AsQueryable().Where(Filters.FilterDate<HeSoChucVu>(thoigian)).ToListAsync();
        }
        internal static List<ViewGiaoVienTrangThaiLamViec> ViewGiaoVienTrangThaiLamViecs(int idGiaoVien, DateTime? thoiGian, bool layCa=false  )
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<GiaoVienTrangThaiLamViec> giaoVienTrangThaiLamViecs;
            try
            {
                if (layCa)
                {
                    giaoVienTrangThaiLamViecs = _context.GiaoVienTrangThaiLamViecs.ToList();
                } 
                else  
                giaoVienTrangThaiLamViecs = _context.GiaoVienTrangThaiLamViecs.AsQueryable().Where(Filters.FilterDate<GiaoVienTrangThaiLamViec>(thoiGian)).ToList();
            }
            catch (Exception ex)
            {

                throw;
            }


            var list = from gvcv in giaoVienTrangThaiLamViecs
                       join cv in _context.TrangThaiLamViecs on gvcv.IdTrangThaiLamViec equals cv.IdTrangThaiLamViec
                       select new ViewGiaoVienTrangThaiLamViec
                       {
                           IdGiaoVienTrangThaiLamViec = gvcv.IdGiaoVienTrangThaiLamViec,
                           IdTrangThaiLamViec = gvcv.IdTrangThaiLamViec,
                           ThoiGianBatDau = gvcv.ThoiGianBatDau,
                           ThoiGianKetThuc = gvcv.ThoiGianKetThuc,
                           TenTrangThaiLamViec = cv.TenTrangThaiLamViec,
                           QuyetDinh = gvcv.QuyetDinh,
                           IdGiaoVien = gvcv.IdGiaoVien,
                           TinhTrang = gvcv.TinhTrang
                       };
            if (idGiaoVien != 0)
            {
                list = list.Where(n => n.IdGiaoVien == idGiaoVien).ToList();
            }
            return list.OrderByDescending(n => n.ThoiGianBatDau).ToList();
        }

        internal static async Task<SelectList> MaHocPhan(int IdHocPhan = 0)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var dQuery = await _context.HocPhans.Select(n => new { n.IdHocPhan, n.MaHocPhan }).ToListAsync();
            dQuery.Insert(0, new { IdHocPhan = 0, MaHocPhan = "Chọn mã học phần" });
            if (IdHocPhan != 0)
                return await Task.Run(() => new SelectList(dQuery, "IdHocPhan", "MaHocPhan", IdHocPhan));
            await _context.DisposeAsync();
            return await Task.Run(() => new SelectList(dQuery, "IdHocPhan", "MaHocPhan"));
        }
        public static async Task< List<ViewBaoGioGiangDayChiTiet>> ViewBaoGioGiangDayChiTiets(int IdBaoGioGiangDay)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            DateTime? thoiGianBatDau = await GetValue.ThoiGianBatDauCuaBaoGioGiangDay(IdBaoGioGiangDay);
            List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans = await GetList.QuyDinhSiSoLopHocPhans(thoiGianBatDau);
            List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs = await GetList.QuyDinhGioChuanThucHanhs(thoiGianBatDau);
            var list = await _context.BaoGioGiangDayChiTiets
                .Join(
                _context.HocPhans,
                p => p.IdHocPhan,
                q => q.IdHocPhan,
                (p, q) =>
                new  ViewBaoGioGiangDayChiTiet(
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
                    (int)p.IdBaoGioGiangDay,
                    Function.CalculateGioChuan(p,q,quyDinhGioChuanThucHanhs,quyDinhSiSoLopHocPhans,thoiGianBatDau),
                    "",
                    0,
                    0,
                    0,
                    0
                    )
                ).ToListAsync();
            if (IdBaoGioGiangDay != 0)
            {
                list = list.Where(n => n.IdBaoGioGiangDay == IdBaoGioGiangDay).ToList();
            }
            return list;
        }
        public static async Task<ViewBaoGioGiangDayChiTiet> ViewBaoGioGiangDayChiTietTheoID(int IdBaoGioGiangDayChiTiet)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            int IdBaoGioGiangDay = GetID.IdBaoGioGiangDay(IdBaoGioGiangDayChiTiet);
            DateTime? thoiGianBatDau = await GetValue.ThoiGianBatDauCuaBaoGioGiangDay(IdBaoGioGiangDay);
            List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans = await GetList.QuyDinhSiSoLopHocPhans(thoiGianBatDau);
            List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs = await GetList.QuyDinhGioChuanThucHanhs(thoiGianBatDau);
            var query = from p in _context.BaoGioGiangDayChiTiets
                        join q in _context.HocPhans on p.IdHocPhan equals q.IdHocPhan
                        join htt in _context.HinhThucThis on q.IdHinhThucThi equals htt.IdHinhThucThi
                        select
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
                    (int)p.IdBaoGioGiangDay,
                    Function.CalculateGioChuan(p, q, quyDinhGioChuanThucHanhs, quyDinhSiSoLopHocPhans, thoiGianBatDau),
                    Function.VietTat(htt.TenHinhThucThi),
                    Function.CalculateHeSoSiSoLTTHMDDA(p, q, quyDinhGioChuanThucHanhs, quyDinhSiSoLopHocPhans, thoiGianBatDau),
                    Function.CalculateHeSoSiSoBTTNTL(p, q, quyDinhGioChuanThucHanhs, quyDinhSiSoLopHocPhans, thoiGianBatDau),
                    1,
                    GetValue.HeSoHuongDanTuHoc((DateTime)thoiGianBatDau)
                );            
            return await query.Where(n=>n.IdBaoGioGiangDayChiTiet == IdBaoGioGiangDayChiTiet).FirstOrDefaultAsync();
        }
        public static async Task<ViewBaoGioGiangDayChiTiet> ViewBaoGioGiangDayChiTietTheoIDKhongTinhGioChuan(int IdBaoGioGiangDayChiTiet)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            int IdBaoGioGiangDay = GetID.IdBaoGioGiangDay(IdBaoGioGiangDayChiTiet);
            DateTime? thoiGianBatDau = await GetValue.ThoiGianBatDauCuaBaoGioGiangDay(IdBaoGioGiangDay);
            List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans = await GetList.QuyDinhSiSoLopHocPhans(thoiGianBatDau);
            List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs = await GetList.QuyDinhGioChuanThucHanhs(thoiGianBatDau);
            var query = from p in _context.BaoGioGiangDayChiTiets
                        where p.IdBaoGioGiangDayChiTiet == IdBaoGioGiangDayChiTiet
                        join q in _context.HocPhans on p.IdHocPhan equals q.IdHocPhan
                        join htt in _context.HinhThucThis on q.IdHinhThucThi equals htt.IdHinhThucThi
                        select
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
                    (int)p.IdBaoGioGiangDay,
                    0,
                    Function.VietTat(htt.TenHinhThucThi),
                    Function.CalculateHeSoSiSoLTTHMDDA(p, q, quyDinhGioChuanThucHanhs, quyDinhSiSoLopHocPhans, thoiGianBatDau),
                    Function.CalculateHeSoSiSoBTTNTL(p, q, quyDinhGioChuanThucHanhs, quyDinhSiSoLopHocPhans, thoiGianBatDau),
                    1,
                    GetValue.HeSoHuongDanTuHoc((DateTime)thoiGianBatDau)
                );
            var list = await query.ToListAsync();
            return list.FirstOrDefault();
        }
        internal static async Task<SelectList> TrangThaiLamViecSelectList(int? id)
        {
            var model = "TrangThaiLamViec";
            var text = "Trạng thái làm việc";
            var dQuery = await _context.TrangThaiLamViecs.Select(n => new { n.IdTrangThaiLamViec, n.TenTrangThaiLamViec }).ToListAsync();
            dQuery.Insert(0, new { IdTrangThaiLamViec = 0, TenTrangThaiLamViec = "Chọn " + text });
            if (id != null)
                return await Task.Run(() => new SelectList(dQuery, "Id" + model, "Ten" + model, id));
            return await Task.Run(() => new SelectList(dQuery, "Id" + model, "Ten" + model));
        }

        internal static async Task< List<ViewBaoGioGiangDayChiTiet>> ViewBaoGioGiangDayChiTiets(List<BaoGioGiangDayChiTiet> baoGioGiangDayChiTiets, BaoGioGiangDay baoGioGiangDay)
        {
            DateTime? thoiGianBatDau = baoGioGiangDay.ThoiGianBatDau;

            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans = await GetList.QuyDinhSiSoLopHocPhans(thoiGianBatDau);
            List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs = await GetList.QuyDinhGioChuanThucHanhs(thoiGianBatDau);
            var list = baoGioGiangDayChiTiets
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
                     p.IdBaoGioGiangDay!=null?(int)p.IdBaoGioGiangDay:0,
                     Function.CalculateGioChuan(p, q, quyDinhGioChuanThucHanhs, quyDinhSiSoLopHocPhans, thoiGianBatDau)
                     )
                 ).ToList();

            int cout = list.Count();
            return list;
        }

        internal static async Task<SelectList> LoaiCongViecSelectList(int? id)
        {
            var model = "LoaiCongViec";
            var text = "Loại công việc";
            var dQuery = await _context.LoaiCongViecs.Select(n => new { n.IdLoaiCongViec, n.TenLoaiCongViec }).ToListAsync();
            dQuery.Insert(0, new { IdLoaiCongViec = 0, TenLoaiCongViec = "Chọn " + text });
            if (id != null)
                return await Task.Run(() => new SelectList(dQuery, "Id" + model, "Ten" + model, id));
            return await Task.Run(() => new SelectList(dQuery, "Id" + model, "Ten" + model));
        }

        internal static List<GiaoVienChucVu> GiaoVienByChucVu(int? idChucVu, DateTime? thoiGian)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<GiaoVienChucVu> giaoVienChucVus = _context.GiaoVienChucVus.Where(n => n.IdChucVu == idChucVu).AsQueryable().Where(Filters.FilterDate<GiaoVienChucVu>(thoiGian)).ToList();
            return giaoVienChucVus;
        }

        internal static async Task<SelectList> ChucVuSelectList(int? id)
        {
            var model = "ChucVu";
            var text = "Chức vụ";
            var dQuery = await _context.ChucVus.Select(n => new { n.IdChucVu, n.TenChucVu }).ToListAsync();
            dQuery.Insert(0, new { IdChucVu = 0, TenChucVu = "Chọn " + text });
            if (id != null)
                return await Task.Run(() => new SelectList(dQuery, "Id" + model, "Ten" + model, id));
            return await Task.Run(() => new SelectList(dQuery, "Id" + model, "Ten" + model));
        }

        internal static async Task<SelectList> PhongTrungTamSelectList(int? id)
        {
            var model = "PhongTrungTam";
            var text = "Phòng Trung tâm";
            var dQuery = await _context.PhongTrungTams.Select(n => new { n.IdPhongTrungTam, n.TenPhongTrungTam }).ToListAsync();
            dQuery.Insert(0, new { IdPhongTrungTam = 0, TenPhongTrungTam = "Chọn " + text });
            if (id != null)
                return await Task.Run(() => new SelectList(dQuery, "Id" + model, "Ten" + model, id));
            return await Task.Run(() => new SelectList(dQuery, "Id" + model, "Ten" + model));
        }

        public static async Task<List<ViewHocPhan>> ViewHocPhans(List<HocPhan> listHocPhans = null, int idHocPhan = 0, DateTime? thoiGian = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<HocPhan> hocPhans;
            if (listHocPhans == null)
            {
                hocPhans = await _context.HocPhans.AsQueryable().Where(Filters.FilterDate<HocPhan>(thoiGian)).ToListAsync();
            }
            else
            {
                hocPhans = listHocPhans;
            }
            var list = from hp in hocPhans
                       join htt in _context.HinhThucThis on hp.IdHinhThucThi equals htt.IdHinhThucThi into hphtt
                       join bm in _context.BoMons on hp.IdBoMon equals bm.IdBoMon into hpbm
                       join lhp in _context.LoaiHocPhans on hp.IdLoaiHocPhan equals lhp.IdLoaiHocPhan
                       join td in _context.TrinhDos on hp.IdTrinhDo equals td.IdTrinhDo
                       join k in _context.Khoas on hp.IdKhoa equals k.IdKhoa
                       from grhphtt in hphtt.DefaultIfEmpty()
                       from grBm in hpbm.DefaultIfEmpty()
                       select new ViewHocPhan
                       {
                           IdHocPhan = hp.IdHocPhan,
                           MaHocPhan = hp.MaHocPhan,
                           TenHocPhan = hp.TenHocPhan,
                           SoTinChi = hp.SoTinChi,
                           ThuocHocKy = hp.ThuocHocKy,
                           IdKhoa = hp.IdKhoa,
                           TenKhoa = k.TenKhoa,
                           IdBoMon = hp.IdBoMon,
                           TenBoMon = (hp.IdBoMon == null) ? "" : grBm.TenBoMon,
                           IdLoaiHocPhan = hp.IdLoaiHocPhan,
                           TenLoaiHocPhan = lhp.TenLoaiHocPhan,
                           IdHinhThucThi = hp.IdHinhThucThi,
                           TenHinhThucThi = (hp.IdHinhThucThi == null) ? "" : grhphtt.TenHinhThucThi,
                           ThoiGianThi = hp.ThoiGianThi,
                           CoNganHangDe = hp.CoNganHangDe,
                           SoTietLyThuyet = hp.SoTietLyThuyet,
                           SoTietThaoLuanThiNghiemThucHanh = hp.SoTietThaoLuanThiNghiemThucHanh,
                           SoGioChuanBiTuHoc = hp.SoGioChuanBiTuHoc,
                           HuongDanTuHoc = hp.HuongDanTuHoc,
                           IdTrinhDo = hp.IdTrinhDo,
                           TenTrinhDo = td.TenTrinhDo,
                           ThoiGianBatDau = hp.ThoiGianBatDau,
                           ThoiGianKetThuc = hp.ThoiGianKetThuc,
                         DangLyThuyet = hp.DangLyThuyet,
                         DangThucHanh = hp.DangThucHanh
                       };
            if (idHocPhan != 0)
            {
                list = list.Where(n => n.IdHocPhan == idHocPhan).ToList();
            }
            return await Task.Run(() => list.ToList());
        }

        internal static async Task<List<ViewPhanCongSoGioCuaGiaoVien>> PhanCongSoGioCuaGiaoViens(string idKhoa, int idBoMon, int idBaoGioGiangDay)
        {
            try
            {
                //Trả về danh sách idGiaoVien thuộc bộ môn idBoMon trong báo giờ idBaoGioGiangDay
                List<ViewPhanCongSoGioCuaGiaoVien> viewPhanCongSoGioCuaGiaoViens = new List<ViewPhanCongSoGioCuaGiaoVien>();
                
                // Danh sách phân công
                List<ViewPhanCongGiangDay> viewPhanCongGiangDays = await GetList.ViewPhanCongGiangDays(idBaoGioGiangDay);
                viewPhanCongGiangDays = viewPhanCongGiangDays.Where(p => p.ViewBaoGioGiangDayChiTiet.IdKhoa == idKhoa).ToList();

                return viewPhanCongSoGioCuaGiaoViens;

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        internal static async Task<List<PhanCongGiangDay>> PhanCongGiangDays(int idBaoGioGiangDayChiTiet)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return await _context.PhanCongGiangDays.Where(n => n.IdBaoGioGiangDayChiTiet == idBaoGioGiangDayChiTiet).ToListAsync();
        }
        internal static async Task<List<PhanCongGiangDay>> PhanCongGiangDaysTheoGiaoVien(int idBaoGioGiangDay, int idGiaoVien)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var query = from pcgd in _context.PhanCongGiangDays
                        join bggdct in _context.BaoGioGiangDayChiTiets on pcgd.IdBaoGioGiangDayChiTiet equals bggdct.IdBaoGioGiangDayChiTiet
                        where bggdct.IdBaoGioGiangDay == idBaoGioGiangDay && pcgd.IdGiaoVien == idGiaoVien
                        select pcgd;

            return await query.ToListAsync();
        }
        internal static async Task<List<ViewGiaoVien>> ViewGiaoViens(List<GiaoVien> giaoViens, int IdGiaoVien = 0, DateTime? thoiGian = null)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<GiaoVien> GiaoViens;
            if (giaoViens == null)
            {
                GiaoViens = await _context.GiaoViens.ToListAsync();
            }
            else
            {
                GiaoViens = giaoViens;
            }
            var list = await Task.Run(() => _context.GiaoViens.Select(
                             n => new ViewGiaoVien
                             {
                                 IdGiaoVien = n.IdGiaoVien,
                                 HoTenGiaoVien = n.HoTenGiaoVien,
                                 Email = n.Email,
                                 DienThoai = n.DienThoai,
                                 GioiTinh = n.GioiTinh,
                                 NgaySinh = n.NgaySinh,
                                 IdNguoiDung = n.IdNguoiDung,
                                 ViewGiaoVienChiTiets = ViewGiaoVienChiTiets(null, n.IdGiaoVien, thoiGian,true),
                                 ViewChucVuChiTiets = ViewChucVuChiTiets(n.IdGiaoVien, thoiGian,true),
                                 CacHeSoLuongs = CacHeSoLuongs(n.IdGiaoVien, thoiGian,true)
                             }
                        ));
            if (IdGiaoVien != 0)
            {
                list = list.Where(n => n.IdGiaoVien == IdGiaoVien);
            }
            return list.ToList();
        }
        public static List<ViewGiaoVienChiTiet> ViewGiaoVienChiTiets(List<GiaoVienChiTiet> listGiaoVienChiTiets = null, int idGiaoVien = 0, DateTime? thoiGian = null, bool layCa = false)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<GiaoVienChiTiet> GiaoVienChiTiets;
            if (listGiaoVienChiTiets == null)
            {
                if (layCa)
                {
                    GiaoVienChiTiets = _context.GiaoVienChiTiets.ToList();
                }
                else
                {
                    GiaoVienChiTiets = _context.GiaoVienChiTiets.AsQueryable().Where(Filters.FilterDate<GiaoVienChiTiet>(thoiGian)).ToList();
                }
            }
            else
            {
                GiaoVienChiTiets = listGiaoVienChiTiets;
            }
            var bmks = from a in _context.BoMons
                       join b in _context.Khoas on a.IdKhoa equals b.IdKhoa
                       select new
                       {
                           a.IdBoMon,
                           a.TenBoMon,
                           b.IdKhoa,
                           b.TenKhoa
                       };

            var listBmK = bmks.ToList();

            var list = from gvct in GiaoVienChiTiets
                       join gv in _context.GiaoViens on gvct.IdGiaoVien equals gv.IdGiaoVien
                       join lcv in _context.LoaiCongViecs on gvct.IdLoaiCongViec equals lcv.IdLoaiCongViec
                       join ptt in _context.PhongTrungTams on gvct.IdPhongTrungTam equals ptt.IdPhongTrungTam into gvptt
                       join lbmk in listBmK on gvct.IdBoMon equals lbmk.IdBoMon into gvbmk

                       from bmk in gvbmk.DefaultIfEmpty()
                       from grgvptt in gvptt.DefaultIfEmpty()
                       select new ViewGiaoVienChiTiet
                       {
                           IdGiaoVienChiTiet = gvct.IdGiaoVienChiTiet,
                           IdGiaoVien = gvct.IdGiaoVien,
                           IdLoaiCongViec = gvct.IdLoaiCongViec,
                           TenLoaiCongViec = lcv.TenLoaiCongViec,
                           IdPhongTrungTam = gvct.IdPhongTrungTam,
                           TenPhongTrungTam = (gvct.IdPhongTrungTam == null) ? "" : grgvptt.TenPhongTrungTam,
                           IdBoMon = gvct.IdBoMon,
                           TenBoMon = (gvct.IdBoMon == null) ? "" : bmk.TenBoMon,
                           IdKhoa = (gvct.IdBoMon == null) ? "" : bmk.IdKhoa,
                           TenKhoa = (gvct.IdBoMon == null) ? "" : bmk.TenKhoa,
                           ThoiGianBatDau = gvct.ThoiGianBatDau,
                           ThoiGianKetThuc = gvct.ThoiGianKetThuc,
                           TinhTrang = gvct.TinhTrang,
                           QuyetDinh = gvct.QuyetDinh,
                           HoTenGiaoVien = gv.HoTenGiaoVien
                       };
            if (idGiaoVien != 0)
            {
                list = list.Where(n => n.IdGiaoVien == idGiaoVien).ToList();
            }
            return list.OrderByDescending(n => n.ThoiGianBatDau).ToList();
        }

        public static List<CacHeSoLuong> CacHeSoLuongs(int IdGiaoVien = 0, DateTime? thoiGian = null,bool layCa = false)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<CacHeSoLuong> cacHeSoLuongs;
            if (layCa)
            {
                cacHeSoLuongs = _context.CacHeSoLuongs.ToList();
            }
            else
                cacHeSoLuongs = _context.CacHeSoLuongs.AsQueryable().Where(Filters.FilterDate<CacHeSoLuong>(thoiGian)).ToList();

            if (IdGiaoVien != 0)
            {
                cacHeSoLuongs = cacHeSoLuongs.Where(n => n.IdGiaoVien == IdGiaoVien).ToList();
            }
            return cacHeSoLuongs.OrderByDescending(n => n.ThoiGianBatDau).ToList();
        }
        public static List<ViewGiaoVienChucVu> ViewChucVuChiTiets(int IdGiaoVien = 0, DateTime? thoiGian = null,bool layCa =true)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<GiaoVienChucVu> giaoVienChucVus;
            if (layCa)
            {
                giaoVienChucVus = _context.GiaoVienChucVus.ToList();
            }
            else
                giaoVienChucVus = _context.GiaoVienChucVus.AsQueryable().Where(Filters.FilterDate<GiaoVienChucVu>(thoiGian)).ToList();

            var list = from gvcv in giaoVienChucVus
                       join cv in _context.ChucVus on gvcv.IdChucVu equals cv.IdChucVu
                       select new ViewGiaoVienChucVu
                       {
                           IdChucVu = gvcv.IdChucVu,
                           IdGiaoVienChucVu = gvcv.IdGiaoVienChucVu,
                           ThoiGianBatDau = gvcv.ThoiGianBatDau,
                           ThoiGianKetThuc = gvcv.ThoiGianKetThuc,
                           TenChucVu = cv.TenChucVu,
                           QuyetDinh = gvcv.QuyetDinh,
                           IdGiaoVien = gvcv.IdGiaoVien,
                           TinhTrang = gvcv.TinhTrang
                       };
            if (IdGiaoVien != 0)
            {
                list = list.Where(n => n.IdGiaoVien == IdGiaoVien).ToList();
            }
            return list.OrderByDescending(n => n.ThoiGianBatDau).ToList();
        }
        public static async Task<SelectList> KhoaSelectList(string idKhoa)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var dQuery = await _context.Khoas.Select(n => new { n.IdKhoa, n.TenKhoa }).ToListAsync();
            dQuery.Insert(0, new { IdKhoa = "0", TenKhoa = "Chọn khoa" });

            if (idKhoa != "")
                return await Task.Run(() => new SelectList(dQuery, "IdKhoa", "TenKhoa", idKhoa));
            await _context.DisposeAsync();
            return await Task.Run(() => new SelectList(dQuery, "IdKhoa", "TenKhoa"));
        }


        public static async Task<SelectList> BoMonSelectList(string idKhoa, int? IdBoMon)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            var dQuery = await _context.BoMons.ToListAsync();
            if (idKhoa != "")
            {
                var list = (from n in dQuery
                            where n.IdKhoa == idKhoa
                            select new
                            {
                                IdBoMon = n.IdBoMon,
                                TenBoMon = n.TenBoMon
                            }).ToList();

                list.Add(new { IdBoMon = 0, TenBoMon = "Chọn bộ môn" });
                list = list.OrderBy(n => n.IdBoMon).ToList();

                if (IdBoMon != null)
                {
                    return await Task.Run(() => new SelectList(list, "IdBoMon", "TenBoMon", IdBoMon));
                }
                else
                {
                    return await Task.Run(() => new SelectList(list, "IdBoMon", "TenBoMon"));
                }
            }
            var l = (from n in dQuery
                     select new
                     {
                         IdBoMon = n.IdBoMon,
                         TenBoMon = n.TenBoMon
                     }).ToList();
            l.Add(new { IdBoMon = 0, TenBoMon = "Chọn bộ môn" });
            l = l.OrderBy(n => n.IdBoMon).ToList();
            if (IdBoMon != null)
            {
                return await Task.Run(() => new SelectList(l, "IdBoMon", "TenBoMon", IdBoMon));
            }
            else
            {
                return await Task.Run(() => new SelectList(l, "IdBoMon", "TenBoMon"));
            }
        }

        public static async Task<SelectList> TrinhDoSelectList(int? idTrinhDo)
        {
            var dQuery = await _context.TrinhDos.Select(n => new { n.IdTrinhDo, n.TenTrinhDo }).ToListAsync();
            dQuery.Insert(0, new { IdTrinhDo = 0, TenTrinhDo = "Chọn trình độ" });
            //dQuery = dQuery.OrderBy(n => n.IdTrinhDo).ToList();
            if (idTrinhDo != null)
                return await Task.Run(() => new SelectList(dQuery, "IdTrinhDo", "TenTrinhDo", idTrinhDo));
            return await Task.Run(() => new SelectList(dQuery, "IdTrinhDo", "TenTrinhDo"));
        }

        internal static async Task<SelectList> HinhThucThiSelectList(int? idHinhThucThi)
        {
            var dQuery = await _context.HinhThucThis.Select(n => new { n.IdHinhThucThi, n.TenHinhThucThi }).ToListAsync();
            dQuery.Insert(0, new { IdHinhThucThi = 0, TenHinhThucThi = "Chọn hình thức thi" });
            //dQuery = dQuery.OrderBy(n => n.IdHinhThucThi).ToList();
            if (idHinhThucThi != null)
                return await Task.Run(() => new SelectList(dQuery, "IdHinhThucThi", "TenHinhThucThi", idHinhThucThi));
            return await Task.Run(() => new SelectList(dQuery, "IdHinhThucThi", "TenHinhThucThi"));
        }

        internal static async Task<SelectList> LoaiHocPhanSelectList(int? idLoaiHocPhan)
        {
            var dQuery = await _context.LoaiHocPhans.Select(n => new { n.IdLoaiHocPhan, n.TenLoaiHocPhan }).ToListAsync();
            dQuery.Insert(0, new { IdLoaiHocPhan = 0, TenLoaiHocPhan = "Chọn loại học phần" });
            //dQuery = dQuery.OrderBy(n => n.IdLoaiHocPhan).ToList();
            if (idLoaiHocPhan != null)
                return await Task.Run(() => new SelectList(dQuery, "IdLoaiHocPhan", "TenLoaiHocPhan", idLoaiHocPhan));
            return await Task.Run(() => new SelectList(dQuery, "IdLoaiHocPhan", "TenLoaiHocPhan"));
        }


    }
}
