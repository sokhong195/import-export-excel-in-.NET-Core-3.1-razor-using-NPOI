using ImportExcelFIle.DotNETCore.Classes;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.ModelViews;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    public class Function
    {
        internal static bool CompareUpcaseAndTrim(string a, string b)
        {
            return a.Trim().ToUpper() == b.Trim().ToUpper();
        }
        public static bool ListIsNullOrEmpty<T>(List<T> ts)
        {
            if (ts==null || ts.Count()==0)
            {
                return true;
            }
            return false;
        }
        public static string ToListString(List<float> list)
        {
            if (!ListIsNullOrEmpty(list))
            {
                string str = "";
                foreach (var item in list)
                {
                    if (str=="")
                    {
                        str += item.ToString();
                    }
                    else
                    {
                        str += ","+ item.ToString();
                    }
                }
                return str; 
            }
            return "";
        }
        /// <summary>
        /// Kiểm tra tồn tại tập tin hay không
        /// </summary>
        /// <param name="hostingEnvironment"></param>
        /// <param name="folderName"></param>
        /// <param name="file"></param>
        /// <returns></returns>
        internal static FileInfo CheckExistFile(string folderName, string fileName)
        {
            string webRootPath = @"wwwroot";
            string newPath = Path.Combine(webRootPath, folderName);
            if (!Directory.Exists(newPath))
            {
                return null;
            }
            string fullPath = Path.Combine(newPath, fileName);
            FileInfo file = new FileInfo(fullPath);
            if (file.Exists)//check file exsit or not  
            {
                return file;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Trả về true nếu thông tin về học phần là giống nhau
        /// </summary>
        /// <param name="hp1"></param>
        /// <param name="hp2"></param>
        /// <returns></returns>
        internal static bool CompareTwoHocPhan(HocPhan hp1, HocPhan hp2)
        {
            if (
                 CompareUpcaseAndTrim(hp1.MaHocPhan,hp2.MaHocPhan)&&
                 CompareUpcaseAndTrimAllSpecialCase(hp1.TenHocPhan, hp2.TenHocPhan)&&
                hp1.SoTinChi==hp2.SoTinChi&&
                hp1.ThuocHocKy == hp2.ThuocHocKy &&
                hp1.IdLoaiHocPhan == hp2.IdLoaiHocPhan &&
                //hp1.IdHinhThucThi == hp2.IdHinhThucThi &&
                hp1.SoTietLyThuyet == hp2.SoTietLyThuyet &&
                hp1.SoTietThaoLuanThiNghiemThucHanh == hp2.SoTietThaoLuanThiNghiemThucHanh &&
                hp1.IdTrinhDo ==hp2.IdTrinhDo
                )
                {
                    return true;
                }
            return false;
        }

        internal static bool IsNullOrZero(int? id)
        {
            if (id == null || id == 0) return true;
            return false;
        }

        internal static bool CompareUpcaseAndTrimAllSpecialCase(string str1, string str2)
        {
            str1 = RemoveSpecialCharacters(str1);
            str2 = RemoveSpecialCharacters(str2);
            return str1.ToUpper() == str2.ToUpper();
        }
        public static string RemoveSpecialCharacters(string str)
        {
            return Regex.Replace(str, @"[ \\._-]", string.Empty, RegexOptions.Compiled);
        }

        internal static  float CalculateGioChuan(BaoGioGiangDayChiTiet baoGioGiangDayChiTiet, HocPhan hocPhan, List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs, List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans,DateTime? thoiGianBatDau)
        {
            var gioChuan = 0.0f;
            DateTime thoiGian = DateTime.Now;
            var TenLoaiHocPhan = GetName.TenLoaiHocPhan(hocPhan.IdLoaiHocPhan);
            switch (TenLoaiHocPhan)
            { 
                case "Lý thuyết":
                    //He so si so
                    float heSoSiSo = GetValue.HeSoSiSo(baoGioGiangDayChiTiet.SiSo, quyDinhSiSoLopHocPhans);
                    //He so huong dan tu hoc
                    float hesoHuongDanTuHoc = GetValue.HeSoHuongDanTuHoc((DateTime)thoiGianBatDau);
                    gioChuan = hocPhan.SoTietLyThuyet * heSoSiSo;
                    //He so huog dan thao luan
                    if (hocPhan.DangLyThuyet == DangLyThuyet.HocPhanCoHuongDanThaoLuan)
                    {
                        if (baoGioGiangDayChiTiet.SoNhom==0)
                        {
                            baoGioGiangDayChiTiet.SoNhom = 1;
                        }
                        float heSoHuongDanThaoLuan = GetValue.HeSoHuongDanThaoLuan(baoGioGiangDayChiTiet.SiSo/baoGioGiangDayChiTiet.SoNhom, quyDinhSiSoLopHocPhans);
                        gioChuan += hocPhan.SoTietThaoLuanThiNghiemThucHanh * heSoHuongDanThaoLuan * baoGioGiangDayChiTiet.SoNhom;
                    }
                    //He so huog dan thi nghiem
                    if (hocPhan.DangLyThuyet == DangLyThuyet.HocPhanCoHuongDanThiNghiem)
                    {
                        if (baoGioGiangDayChiTiet.SoNhom == 0)
                        {
                            baoGioGiangDayChiTiet.SoNhom = 1;
                        }
                        float heSoHuongDanThiNghiem = GetValue.HeSoHuongDanThiNghiem(baoGioGiangDayChiTiet.SiSo / baoGioGiangDayChiTiet.SoNhom, quyDinhSiSoLopHocPhans);
                        gioChuan += hocPhan.SoTietThaoLuanThiNghiemThucHanh * heSoHuongDanThiNghiem * baoGioGiangDayChiTiet.SoNhom;
                    }
                    //Huong dan tu hoc
                    gioChuan += hocPhan.SoTinChi * hesoHuongDanTuHoc* GetValue.SoGioHuongDanTuHocCho1TinChi((DateTime)thoiGianBatDau);
                    break;
                case "Thực hành":
                    //thực tập sư phạm
                    if (hocPhan.DangThucHanh == DangThucHanh.HuongDanThucTapSuPham)
                    {
                        float gioChuanBoSung1Tuan = 0;
                        var gioChuan1Tuan = GetValue.QuyDoiGioChuan1TuanHuongDanSuPham(baoGioGiangDayChiTiet.SiSo, quyDinhGioChuanThucHanhs,out gioChuanBoSung1Tuan, thoiGianBatDau);
                        gioChuan = (gioChuan1Tuan + gioChuanBoSung1Tuan) * hocPhan.SoTinChi;
                    }
                    //Giáo dục thể chất
                    else if (hocPhan.DangThucHanh == DangThucHanh.HocPhanGiaoDucTheChat)
                    {
                        heSoSiSo = GetValue.HeSoSiSoGiaoDucTheChat(baoGioGiangDayChiTiet.SiSo, quyDinhSiSoLopHocPhans);
                        gioChuan = hocPhan.SoTietThaoLuanThiNghiemThucHanh * heSoSiSo;
                    }
                    //thực hành ngoại ngữ
                    else if (hocPhan.DangThucHanh == DangThucHanh.HocPhanThucHanhNgoaiNgu)
                    {
                        heSoSiSo = GetValue.HeSoSiSoThucHanhNgoaiNgu(baoGioGiangDayChiTiet.SiSo, quyDinhSiSoLopHocPhans);
                        gioChuan = hocPhan.SoTietThaoLuanThiNghiemThucHanh * heSoSiSo;
                    }
                    //thực hành chuyên môn
                    else
                    {
                        float gioChuanBoSung1Tuan = 0;
                        var gioChuan1Tuan = GetValue.QuyDoiGioChuan1TuanThucHanh(baoGioGiangDayChiTiet.SiSo, hocPhan.IdKhoa, quyDinhGioChuanThucHanhs, out gioChuanBoSung1Tuan, thoiGianBatDau);
                        gioChuan = (gioChuan1Tuan + gioChuanBoSung1Tuan) * hocPhan.SoTinChi;
                    }
                    break;
                case "Đồ án":
                    break;
                default:
                    return -1;
            }
            return gioChuan;
        }
        internal static float CalculateHeSoSiSoBTTNTL(BaoGioGiangDayChiTiet baoGioGiangDayChiTiet, HocPhan hocPhan, List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs, List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans, DateTime? thoiGianBatDau)
        {

            var TenLoaiHocPhan = GetName.TenLoaiHocPhan(hocPhan.IdLoaiHocPhan);
            switch (TenLoaiHocPhan)
            {
                case "Lý thuyết":
                    //He so huog dan thao luan
                    if (hocPhan.DangLyThuyet == DangLyThuyet.HocPhanCoHuongDanThaoLuan)
                    {
                        if (baoGioGiangDayChiTiet.SoNhom == 0)
                        {
                            baoGioGiangDayChiTiet.SoNhom = 1;
                        }
                        return GetValue.HeSoHuongDanThaoLuan(baoGioGiangDayChiTiet.SiSo / baoGioGiangDayChiTiet.SoNhom, quyDinhSiSoLopHocPhans);

                    }
                    //He so huog dan thi nghiem
                    if (hocPhan.DangLyThuyet == DangLyThuyet.HocPhanCoHuongDanThiNghiem)
                    {
                        if (baoGioGiangDayChiTiet.SoNhom == 0)
                        {
                            baoGioGiangDayChiTiet.SoNhom = 1;
                        }
                        return GetValue.HeSoHuongDanThiNghiem(baoGioGiangDayChiTiet.SiSo / baoGioGiangDayChiTiet.SoNhom, quyDinhSiSoLopHocPhans);

                    }
                    break;
                case "Thực hành":
                    return 0;
                   
                case "Đồ án":
                    return 0;
                default:
                    return -1;
            }
            return 0;
        }
        internal static float CalculateHeSoSiSoLTTHMDDA(BaoGioGiangDayChiTiet baoGioGiangDayChiTiet, HocPhan hocPhan, List<QuyDinhGioChuanThucHanh> quyDinhGioChuanThucHanhs, List<QuyDinhSiSoLopHocPhan> quyDinhSiSoLopHocPhans, DateTime? thoiGianBatDau)
        {
            var TenLoaiHocPhan = GetName.TenLoaiHocPhan(hocPhan.IdLoaiHocPhan);
            switch (TenLoaiHocPhan)
            {
                case "Lý thuyết":
                    //He so si so
                    return GetValue.HeSoSiSo(baoGioGiangDayChiTiet.SiSo, quyDinhSiSoLopHocPhans);
                    break;
                case "Thực hành":
                    //thực tập sư phạm
                    if (hocPhan.DangThucHanh == DangThucHanh.HuongDanThucTapSuPham)
                    {
                        float gioChuanBoSung1Tuan = 0;
                        return GetValue.QuyDoiGioChuan1TuanHuongDanSuPham(baoGioGiangDayChiTiet.SiSo, quyDinhGioChuanThucHanhs, out gioChuanBoSung1Tuan, thoiGianBatDau);
                    }
                    //Giáo dục thể chất
                    else if (hocPhan.DangThucHanh == DangThucHanh.HocPhanGiaoDucTheChat)
                    {
                        return GetValue.HeSoSiSoGiaoDucTheChat(baoGioGiangDayChiTiet.SiSo, quyDinhSiSoLopHocPhans);
                       
                    }
                    //thực hành ngoại ngữ
                    else if (hocPhan.DangThucHanh == DangThucHanh.HocPhanThucHanhNgoaiNgu)
                    {
                        return GetValue.HeSoSiSoThucHanhNgoaiNgu(baoGioGiangDayChiTiet.SiSo, quyDinhSiSoLopHocPhans);
                    }
                    //thực hành chuyên môn
                    else
                    {
                        float gioChuanBoSung1Tuan = 0;
                        return GetValue.QuyDoiGioChuan1TuanThucHanh(baoGioGiangDayChiTiet.SiSo, hocPhan.IdKhoa, quyDinhGioChuanThucHanhs, out gioChuanBoSung1Tuan, thoiGianBatDau);
                    }
                    break;
                case "Đồ án":
                    break;
                default:
                    return -1;
            }
            return 0;
        }
        /// <summary>
        /// Giờ chuẩn giáo viên trong học kỳ
        /// </summary>
        /// <param name="idGiaoVien"></param>
        /// <param name="idNamHocHocKy"></param>
        /// <returns></returns>
        internal static double CalculateGioChuanGiaoVien(int idGiaoVien,DateTime thoiGianBatDauHocKy, DateTime thoiGianKetThucHocKy, List<HeSoChucVu> heSoChucVus, List<MienGiamTheoTrangThaiLamViec> mienGiamTheoTrangThaiLamViecs)
        {
            try
            {
                dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
                
                var queryChucVu = from gv in _context.GiaoViens.ToList()
                            join gvcv in _context.GiaoVienChucVus.AsQueryable().Where(Filters.FilterDate<GiaoVienChucVu>(thoiGianBatDauHocKy, thoiGianKetThucHocKy)).Where(n => n.TinhTrang == TinhTrang.XacNhan).ToList() on gv.IdGiaoVien equals gvcv.IdGiaoVien
                            join cv in _context.ChucVus on gvcv.IdChucVu equals cv.IdChucVu
                            join hscv in heSoChucVus on cv.IdChucVu equals hscv.IdChucVu
                            where gv.IdGiaoVien == idGiaoVien
                            select new ViewMienGiamChucVu(
                                gvcv.ThoiGianBatDau,
                                gvcv.ThoiGianKetThuc,
                                cv.TenChucVu,
                                hscv.GiaTri
                                );
                var listChucVu = queryChucVu.OrderBy(n => n.GiaTri).ToList();
                List<ViewMienGiamChucVu> viewMienGiamChucVus = null;

                //Lấy chức vụ hiện tại các chức vụ trồng nhau thì lấy cái thấp nhất
                //Lấy quy định về phân công hiện tại
                if (listChucVu!=null&&listChucVu.Count>0)
                {
                    viewMienGiamChucVus = TraVeDanhSachMienGiamChucVuKhongLongNhau(listChucVu, thoiGianBatDauHocKy, thoiGianKetThucHocKy);
                }

                var queryMienGiam = from gv in _context.GiaoViens.ToList()
                            join gvttlv in _context.GiaoVienTrangThaiLamViecs.AsQueryable().Where(Filters.FilterDate<GiaoVienTrangThaiLamViec>(thoiGianBatDauHocKy, thoiGianKetThucHocKy)).Where(n => n.TinhTrang == TinhTrang.XacNhan).ToList() on gv.IdGiaoVien equals gvttlv.IdGiaoVien
                            join ttlv in _context.TrangThaiLamViecs on gvttlv.IdTrangThaiLamViec equals ttlv.IdTrangThaiLamViec
                            join mgtttlv in mienGiamTheoTrangThaiLamViecs on gvttlv.IdTrangThaiLamViec equals mgtttlv.IdTrangThaiLamViec
                            where gv.IdGiaoVien == idGiaoVien
                            select new ViewMienGiamTheoTrangThaiLamViec
                            (
                                gvttlv.ThoiGianBatDau,
                                gvttlv.ThoiGianKetThuc,
                                ttlv.TenTrangThaiLamViec,
                                mgtttlv.GiaTri
                            );
                var listMienGiam = queryMienGiam.OrderByDescending(n => n.ThoiGianBatDau).ToList();
                 for (int i = 0; i < listMienGiam.Count - 1; i++)
                {
                    if (listMienGiam[i].ThoiGianBatDau.Date <= listMienGiam[i + 1].ThoiGianKetThuc.Value.Date)
                    {
                        throw new Exception("Các khoảng thời gian chưa hợp lệ");
                    }
                }
                //Bh sẽ tính giờ chuẩn theo từng trạng thái công việc
                //Tính giờ chuẩn quy định của giáo viên trong kỳ
                //Là giáo viên hay giảng viên hay giảng viên tập sự chưa xử lý chỗ giáo viên
                double dinhMucGiangDayHocKy = 0;
                var dinhMucCongTacGiangVien = GetValue.DinhMucCongTacHocKy(thoiGianBatDauHocKy, thoiGianKetThucHocKy,ref dinhMucGiangDayHocKy);             
                var soNgayCongTacCuaHocKy = TraVeNgayLamViec(thoiGianBatDauHocKy, thoiGianKetThucHocKy);
                dinhMucGiangDayHocKy = (dinhMucGiangDayHocKy * soNgayCongTacCuaHocKy)/ (44 * 5);
                double gioChuanHocKy = 0;
                List<ViewMienGiamChucVu> viewMienGiamChucVusTheoTrangThais = null;
                for(int i = 0;i< listMienGiam.Count;i++)
                {
                    var dinhMucCongTacTrangThai = 0.0;                   
                    if (listMienGiam[i].GiaTri!=100)
                    {
                        //Phải đi tính số ngày công tác
                        var soNgayCongTac = TraVeSoNgayCongTac(listMienGiam[i], thoiGianBatDauHocKy, thoiGianKetThucHocKy);
                        dinhMucCongTacTrangThai = (dinhMucCongTacGiangVien * soNgayCongTac) / soNgayCongTacCuaHocKy;
                        dinhMucCongTacTrangThai = dinhMucCongTacTrangThai*(100- listMienGiam[i].GiaTri)/100;
                        var dinhMucGiangDayNhiemVu = (dinhMucGiangDayHocKy * soNgayCongTac)/soNgayCongTacCuaHocKy;
                        listMienGiam[i].SoNgayCongTac = soNgayCongTac;
                        listMienGiam[i].DinhMucCongTac = dinhMucCongTacTrangThai;
                        listMienGiam[i].DinhMucGiangDay = dinhMucGiangDayNhiemVu;
                        //Tính số giờ của chức vụ
                        if (viewMienGiamChucVus!=null)
                        {
                            for (int j = 0; j < viewMienGiamChucVus.Count; j++)
                            {
                                var viewMienGiamChucVu = TraVeMienGiamChucVuTheoTrangThai(viewMienGiamChucVus[j], listMienGiam[i], thoiGianBatDauHocKy, thoiGianKetThucHocKy);
                                if (viewMienGiamChucVu != null)
                                {
                                    if (viewMienGiamChucVusTheoTrangThais == null)
                                    {
                                        viewMienGiamChucVusTheoTrangThais = new List<ViewMienGiamChucVu>();
                                    }
                                    viewMienGiamChucVusTheoTrangThais.Add(viewMienGiamChucVu);
                                }
                            }
                        }
                    }
                    //Tính tổng giờ chuẩn
                    gioChuanHocKy += dinhMucCongTacTrangThai;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            
 
            return 0;
        }

        private static ViewMienGiamChucVu TraVeMienGiamChucVuTheoTrangThai(ViewMienGiamChucVu viewMienGiamChucVu,ViewMienGiamTheoTrangThaiLamViec viewGiaoVienTrangThaiLamViec, DateTime thoiGianBatDauHocKy, DateTime thoiGianKetThucHocKy)
        {
            DateTime thoiGianBatDauCon = viewMienGiamChucVu.ThoiGianBatDau;
            DateTime? thoiGianKetThucCon = viewMienGiamChucVu.ThoiGianKetThuc;
            DateTime thoiGianBatDauCha = viewGiaoVienTrangThaiLamViec.ThoiGianBatDau;
            DateTime? thoiGianKetThucCha = viewGiaoVienTrangThaiLamViec.ThoiGianKetThuc;

            if (thoiGianBatDauCha.Date < thoiGianBatDauHocKy.Date)
            {
                thoiGianBatDauCha = thoiGianBatDauHocKy;
            }

            if (thoiGianKetThucCha == null || thoiGianKetThucCha.Value.Date > thoiGianKetThucHocKy.Date)
            {
                thoiGianKetThucCha = thoiGianKetThucHocKy;
            }
            ViewMienGiamChucVu tmpNew = null;
            if (!(
                    thoiGianKetThucCha.Value.Date <thoiGianBatDauCon.Date && thoiGianBatDauCha.Date<thoiGianBatDauCon.Date
                ||
                    thoiGianBatDauCha.Date >thoiGianKetThucCon.Value.Date && thoiGianKetThucCha.Value.Date >thoiGianKetThucCon.Value.Date
                )
                )
            {
                tmpNew = new ViewMienGiamChucVu();
                if (thoiGianBatDauCon.Date>=thoiGianBatDauCha.Date)
                {
                    tmpNew.ThoiGianBatDau = thoiGianBatDauCon;
                }
                else
                {
                    tmpNew.ThoiGianBatDau = thoiGianBatDauCha;
                }
                if (thoiGianKetThucCon.Value.Date >= thoiGianKetThucCha.Value.Date)
                {
                    tmpNew.ThoiGianKetThuc = thoiGianKetThucCha;
                }
                else
                {
                    tmpNew.ThoiGianKetThuc = thoiGianKetThucCon;
                }
                tmpNew.TenChucVu = viewMienGiamChucVu.TenChucVu;
                tmpNew.GiaTri = viewMienGiamChucVu.GiaTri;
                tmpNew.SoNgayCongTac = TraVeNgayLamViec(tmpNew.ThoiGianBatDau, tmpNew.ThoiGianKetThuc.Value);
                tmpNew.GioChuanDuocMienGiam = (viewGiaoVienTrangThaiLamViec.DinhMucGiangDay * tmpNew.SoNgayCongTac) / (TraVeNgayLamViec(thoiGianBatDauCha, thoiGianKetThucCha.Value));
                tmpNew.GioChuanDuocMienGiam = (tmpNew.GioChuanDuocMienGiam * (100 - tmpNew.GiaTri)) / 100;
            }
            return tmpNew;
        }

        /// <summary>
        /// Tinh ngay cong tac cua mot nhiem vu trong mot khoang thoi gian cho truoc
        /// </summary>
        /// <param name="nhiemvu"></param>
        /// <param name="thoiGianBatDau"></param>
        /// <param name="thoiGianKetThuc"></param>
        /// <returns></returns>
        private static double TraVeSoNgayCongTac(ViewMienGiamTheoTrangThaiLamViec nhiemvu, DateTime thoiGianBatDau, DateTime thoiGianKetThuc)
        {
            DateTime tgBD, tgKT;
            if (nhiemvu.ThoiGianBatDau.Date < thoiGianBatDau.Date)
            {
                tgBD = thoiGianBatDau;
            }
            else
            {
                tgBD = nhiemvu.ThoiGianBatDau;
            }
            if (nhiemvu.ThoiGianKetThuc == null || nhiemvu.ThoiGianKetThuc.Value.Date >thoiGianKetThuc.Date)
            {
                tgKT = thoiGianKetThuc;
            }
            else
            {
                tgKT = nhiemvu.ThoiGianKetThuc.Value;
            }
            return TraVeNgayLamViec(tgBD, tgKT);
        }

        /// <summary>
        /// Số giờ đã phân cho giáo viên trong học kỳ từ đầu ký đến trước thời gian đã cho
        /// </summary>
        /// <param name="idGiaoVien"></param>
        /// <param name="idNamHocHocKy"></param>
        /// <param name="thoiGian"></param>
        /// <returns></returns>
        internal static double CalculateSoGioDaPhan(int idGiaoVien, int idNamHocHocKy, DateTime thoiGian)
        {
            try
            {
                dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
                var query = from bggd in _context.BaoGioGiangDays
                            join bggdct in _context.BaoGioGiangDayChiTiets on bggd.IdBaoGioGiangDay equals bggdct.IdBaoGioGiangDay
                            join pcgd in _context.PhanCongGiangDays on bggdct.IdBaoGioGiangDayChiTiet equals pcgd.IdBaoGioGiangDayChiTiet
                            join gv in _context.GiaoViens on pcgd.IdGiaoVien equals gv.IdGiaoVien
                            where bggd.IdNamHocHocKy == idNamHocHocKy && ((DateTime)bggd.ThoiGianKetThuc).Date<thoiGian.Date && gv.IdGiaoVien == idGiaoVien
                            select new
                            {
                                sogiadaphan = pcgd.SoGioHoacTuanHoacSoNguoi
                            };
                return query.Sum(n => n.sogiadaphan);
            }
            catch (Exception ex)
            {

                throw;
            }
            
        }
        public static double TraVeNgayLamViec(DateTime startD, DateTime endD)
        {
            double calcBusinessDays =
                1 + ((endD - startD).TotalDays * 5 -
                (startD.DayOfWeek - endD.DayOfWeek) * 2) / 7;

            if (endD.DayOfWeek == DayOfWeek.Saturday) calcBusinessDays--;
            if (startD.DayOfWeek == DayOfWeek.Sunday) calcBusinessDays--;

            return calcBusinessDays;
        }
        internal static string VietTat(string str)
        {
            if (str !=null && str.Length >0)
            {
                var arr = str.Split(" ");
                string vt = "";
                for (int i = 0; i < arr.Length; i++)
                {
                    vt += arr[i][0];
                }
                return vt.ToUpper();
            }
            return "";
        }
        public static List<ViewMienGiamChucVu> TraVeDanhSachMienGiamChucVuKhongLongNhau(List<ViewMienGiamChucVu> viewMienGiamChucVus, DateTime thoiGianBatDauHocKy, DateTime thoiGianKetThucHocKy)
        {
            DateTime tgbd = DateTime.Now;
            DateTime tgkt = DateTime.Now;
            List<ViewMienGiamChucVu> mienGiamChucVus = null;
            foreach (var chucVu in viewMienGiamChucVus)
            {
                if (chucVu.ThoiGianKetThuc == null || chucVu.ThoiGianKetThuc.Value.Date > thoiGianKetThucHocKy)
                {
                    chucVu.ThoiGianKetThuc = thoiGianKetThucHocKy;
                }
                if (chucVu.ThoiGianBatDau < thoiGianBatDauHocKy)
                {
                    chucVu.ThoiGianBatDau = thoiGianBatDauHocKy;
                }
                //Chưa có chức vụ nào
                if (mienGiamChucVus == null)
                {
                    mienGiamChucVus = new List<ViewMienGiamChucVu>();
                    mienGiamChucVus.Add(chucVu);
                    tgbd = chucVu.ThoiGianBatDau;
                    tgkt = chucVu.ThoiGianKetThuc.Value.Date;
                }
                else
                {
                    if (chucVu.ThoiGianBatDau.Date < tgbd.Date)
                    {
                        mienGiamChucVus.Add(new ViewMienGiamChucVu(chucVu.ThoiGianBatDau, tgbd.AddDays(-1), chucVu.TenChucVu, chucVu.GiaTri));
                        tgbd = chucVu.ThoiGianBatDau;
                    }
                    if (chucVu.ThoiGianKetThuc > tgkt)
                    {
                        mienGiamChucVus.Add(new ViewMienGiamChucVu(tgkt.AddDays(1), chucVu.ThoiGianKetThuc, chucVu.TenChucVu, chucVu.GiaTri));
                        tgkt = chucVu.ThoiGianKetThuc.Value;
                    }
                }
            }
            return mienGiamChucVus.OrderBy(n => n.ThoiGianBatDau).ToList();
        }
    }
}