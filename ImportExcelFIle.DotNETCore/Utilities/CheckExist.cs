using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Linq;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    internal class CheckExist
    {
        public static dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
        internal static bool IdKhoa(string idKhoa)
        {
            Khoa khoa = _context.Khoas.Find(idKhoa);
            if (khoa == null) return false;
            return true;
        }
        public static bool IdHocPhan(int idHocPhan)
        {
            var q = _context.HocPhans.Find(idHocPhan);
            if (q == null) return false;
            return true;
        }

        internal static bool IdTrinhDo(int idTrinhDo)
        {
            return _context.TrinhDos.Any(e => e.IdTrinhDo == idTrinhDo);
        }
        internal static bool IdLoaiQuyDinh(int id)
        {
            return _context.LoaiQuyDinhs.Any(e => e.IdLoaiQuyDinh == id);
        }
        internal static bool TenLoaiQuyDinh(string ten)
        {
            return _context.LoaiQuyDinhs.ToList().Any(e => Function.CompareUpcaseAndTrimAllSpecialCase(e.TenLoaiQuyDinh, ten));
        }

        internal static bool TenHocKy(string tenHocKy)
        {
            return _context.HocKies.ToList().Any(e => Function.CompareUpcaseAndTrimAllSpecialCase(e.TenHocKy,tenHocKy));
        }

        internal static bool TenQuyDinh(string tenQuyDinh, int id)
        {
            var validateName = _context.QuyDinhs.ToList().FirstOrDefault
                                            (x => Function.CompareUpcaseAndTrimAllSpecialCase(x.TenQuyDinh , tenQuyDinh) && x.IdQuyDinh != id);
            if (validateName != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static int IsHocPhan(string maHP, string tenLopHP, int tinChi, int soTiet, int soTietNhom, int hDTH, string maKhoa)
        {
            int sotietlythuyet, SoTietThaoLuanThiNghiemThucHanh = 0;
            switch(maHP[^1])
            {
                case 'L':
                    sotietlythuyet = soTiet;
                    SoTietThaoLuanThiNghiemThucHanh = soTietNhom;
                    break;
                case 'T':
                case 'D':
                    sotietlythuyet = 0;
                    SoTietThaoLuanThiNghiemThucHanh = soTiet;
                    if (soTietNhom != 0) return -1;
                    break;
                default:
                    return -1;
            }
            var q = _context.HocPhans.Where(n => n.MaHocPhan == maHP
            //&& n.SoTinChi == tinChi
            //&& n.SoTietLyThuyet == sotietlythuyet
            //&& n.IdKhoa == maKhoa
            //&& n.HuongDanTuHoc == hDTH
            //&& n.SoTietThaoLuanThiNghiemThucHanh == SoTietThaoLuanThiNghiemThucHanh
            ).ToList() ;
            if (q ==null|| q.Count()!=1)
            {
                return -1;
            }
            return q[0].IdHocPhan;
        }

        internal static bool TenTrangThaiLamViecGiaoVien(string tenTrangThaiLamViec, int id)
        {
            var validateName = _context.TrangThaiLamViecs.ToList().FirstOrDefault
                                            (x => Function.CompareUpcaseAndTrimAllSpecialCase(x.TenTrangThaiLamViec, tenTrangThaiLamViec) && x.IdTrangThaiLamViec != id);
            if (validateName != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static bool TrungKhoaTaoMoi(string tenKhoa, string id)
        {
            var validateName = _context.Khoas.ToList().FirstOrDefault
                               (x => Function.CompareUpcaseAndTrimAllSpecialCase( x.TenKhoa, tenKhoa));
            var validateIdKhoa = _context.Khoas.FirstOrDefault
                              (x => x.IdKhoa == id);
            if (validateName != null || validateIdKhoa!=null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        internal static bool TrungKhoaSua(string tenKhoa, string id)
        {
            var validateName = _context.Khoas.ToList().FirstOrDefault
                               (x => Function.CompareUpcaseAndTrimAllSpecialCase(x.TenKhoa , tenKhoa) && x.IdKhoa != id);
            
            if (validateName != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static bool TenLoaiCongViec(string tenLoaiCongViec, int id)
        {
            var validateName = _context.LoaiCongViecs.ToList().FirstOrDefault
                               (x => Function.CompareUpcaseAndTrimAllSpecialCase(x.TenLoaiCongViec , tenLoaiCongViec) && x.IdLoaiCongViec != id);
            if (validateName != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static bool TenPhongTrungTam(string tenPhongTrungTam, int id)
        {
            var validateName = _context.PhongTrungTams.ToList().FirstOrDefault
                               (x => Function.CompareUpcaseAndTrimAllSpecialCase(x.TenPhongTrungTam , tenPhongTrungTam) && x.IdPhongTrungTam != id);
            if (validateName != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static bool TenChucVu(string tenChucVu, int id)
        {
            var validateName = _context.ChucVus.ToList().FirstOrDefault
                                (x => Function.CompareUpcaseAndTrimAllSpecialCase(x.TenChucVu , tenChucVu) && x.IdChucVu != id);
            if (validateName != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static bool MaHocPhan(string maHP)
        {
            return _context.HocPhans.Any(n => n.MaHocPhan == maHP);
        }

        internal static bool IdGiaoVienChiTiet(int idGiaoVienChiTiet)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();

            return _context.GiaoVienChiTiets.Any(n => n.IdGiaoVienChiTiet == idGiaoVienChiTiet);
        }
        internal static bool IdHeSoLuong(int IdHeSoLuong)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return _context.CacHeSoLuongs.Any(n => n.IdHeSoLuong == IdHeSoLuong);
        }
        internal static bool IdGiaoVien(int idGiaoVien)
        {
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            return _context.GiaoViens.Any(n => n.IdGiaoVien == idGiaoVien);
        }
        /// <summary>
        /// chưa có
        /// </summary>
        /// <param name="idNguoiDung"></param>
        /// <returns></returns>
        internal static bool IdNguoiDung(int? idNguoiDung)
        {
            return true;
        }
    }
}