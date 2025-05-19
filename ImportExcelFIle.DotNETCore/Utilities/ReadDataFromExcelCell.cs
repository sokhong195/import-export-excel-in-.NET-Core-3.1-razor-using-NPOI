using ImportExcelFIle.DotNETCore.Models;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Http;
using System.IO;
using ImportExcelFIle.DotNETCore.ModelViews;

namespace ImportExcelFIle.DotNETCore.Utilities
{
    public static class ReadDataFromExcelCell
    {
        public static string Message;
        /// <summary>
        /// Mở tập tin excel(*.xlsx)
        /// </summary>
        /// <param name="theFile">Tên tệp</param>
        /// <param name="index">Chỉ số sheet</param>
        /// <returns></returns>
        internal static async Task<ExcelWorksheet> GetExcelWorksheet(IFormFile theFile, int index =1)
        {
            ExcelWorksheet workSheet = null;
            try
            {
                ExcelPackage excel;
                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                using (var memoryStream = new MemoryStream())
                {
                   await theFile.CopyToAsync(memoryStream);
                    excel = new ExcelPackage(memoryStream);
                    memoryStream.Close();
                }
                if (index ==1)
                {
                    workSheet = excel.Workbook.Worksheets.FirstOrDefault();
                }
                else
                {
                    workSheet = excel.Workbook.Worksheets[index];
                }
            }
            catch(Exception ex)
            {
                Message = "Lỗi: " + (ex.InnerException != null ? ex.InnerException.Message : ex.Message);
                return  null;
            }
            return await Task.Run(() => workSheet);
        }
        /// <summary>
        /// Đọc danh sách học phần từ excel
        /// </summary>
        /// <param name="theFile">Tên tệp</param>
        /// <returns></returns>
        internal static async Task<List<HocPhan>> GetHocPhans(IFormFile theFile)
        {
            int col = 1;
            HocPhan hocPhan = null;
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<HocPhan> hocPhans = new List<HocPhan>();
            List<HocPhan> hocPhansDb = _context.HocPhans.ToList();
            VietTat vietTat = new VietTat();
            try
            {
               
                ExcelWorksheet workSheet = await GetExcelWorksheet(theFile);
                var start = workSheet.Dimension.Start;
                var end = workSheet.Dimension.End;
                var Cells = workSheet.Cells;
                //Start a new list to hold imported objects
                for (int row = start.Row + 1; row <= end.Row; row++)
                {
                    try
                    {
                        col = 1;
                        string text = Cells[row, col].Text;
                        int stt = 0;
                        if(!CheckData.IsPositiveInteger(text,out stt))
                        {
                            continue;
                        }
                        col++;
                        text = Cells[row, col].Text;
                        int IdHocPhan = 0;
                        if (text != ""&& text != "0")
                        {                           
                            if (!CheckData.IsPositiveInteger(text, out IdHocPhan))
                            {
                                throw new Exception("Gía trị IdHocPhan không hợp lệ");
                            }
                            if (!CheckExist.IdHocPhan(IdHocPhan))
                            {
                                throw new Exception("Gía trị IdHocPhan không tồn tại");
                            }
                        }
                        col++;
                        string IdKhoa = Cells[row, col].Text;
                        if (IdKhoa.Length == 3 && IdKhoa[0] == '\'')
                        {
                            IdKhoa = IdKhoa.Substring(1);
                        }
                        if (!CheckExist.IdKhoa(IdKhoa))
                        {
                            throw new Exception("Không tồn tại mã khoa");
                        }
                        col++;
                        if (!CheckData.IsPositiveInteger(Cells[row, col].Text, out int hocKy))
                        {
                            throw new Exception("Học kỳ phải là số nguyên dương");
                        }
                        col++;
                        string MaHocPhan = Cells[row, col].Text;
                        if (!CheckData.IsMaHocPhan(MaHocPhan))
                        {
                            throw new Exception("Mã học phần không hợp lệ");
                        }
                        col++;
                        string TenHocPhan = Cells[row, col].Text;
                        if (TenHocPhan.Length == 0)
                        {
                            throw new Exception("Tên học phần không được để trống");
                        }
                        col++;
                        string NhomTinChi = Cells[row, col].Text;
                        int SoTinChi, SoGioLyThuyet, SoGioThucHanh, SoGioTuHoc;
                        if (!CheckData.IsNhomTinChi(NhomTinChi, out SoTinChi, out SoGioLyThuyet, out SoGioThucHanh, out SoGioTuHoc))
                        {
                            throw new Exception("Nhóm tín chỉ không hợp lệ");
                        }
                        col++;
                        string TenLoaiHocPhan = Cells[row, col].Text;
                        if (!CheckData.IsLoaiHocPhan(TenLoaiHocPhan))
                        {
                            throw new Exception("Loại học phần không hợp lệ");
                        }
                        int idLoaHocPhan = GetID.IdLoaiHocPhan(TenLoaiHocPhan);
                        if (idLoaHocPhan == 0)
                        {
                            throw new Exception("Loại học phần không hợp lệ!");
                        }
                        //Trình độ
                        col++;
                        string TenTrinhDo = Cells[row, col].Text;
                        int IdTrinhDo = GetID.IdTrinhDo(TenTrinhDo);
                        if (IdTrinhDo == 0)
                        {
                            throw new Exception("Giá trị trình độ không hợp lệ!");
                        }
                        //Bộ môn
                        col++;
                        string TenBoMon = Cells[row, col].Text;
                        int? IdBoMon = null;
                        if (TenBoMon!="")
                        {
                            IdBoMon = GetID.IdBoMon(TenBoMon);
                            if (IdBoMon == 0)
                            {
                                throw new Exception("Tên bộ môn không tồn tại!");
                            }
                        }
                        //Hình thức thi
                        col++;
                        string TenHinhThucThi = Cells[row, col].Text;
                        int? IdHinhThucThi = null;
                        if (TenHinhThucThi != "")
                        {
                            IdHinhThucThi = GetID.IdHinhThuThi(TenHinhThucThi);
                            if (IdHinhThucThi == 0)
                            {
                                throw new Exception("Tên hình thức thi không tồn tại!");
                            }
                        }
                        //Thời gian thi
                        col++;
                        text = Cells[row, col].Text;
                        int ThoiGianThi = 0;
                        if (text != "")
                        {
                            if (!CheckData.IsPositiveInteger(text,out ThoiGianThi))
                            {
                                throw new Exception("Thời gian thi phải là một số dương!");
                            }
                        }
                        else
                        {
                            ThoiGianThi = 0;
                        }
                        //Có ngân hàng
                        col++;
                        text = Cells[row, col].Text;
                        bool CoNganHang = true;
                        if (text != "")
                        {
                            text = text.Trim().ToUpper();
                            if (text == "CÓ")
                            {
                                CoNganHang = true;
                            }
                            else if (text == "KHÔNG")
                            {
                                CoNganHang = false;
                            }
                            else
                            {
                                throw new Exception("Cột ngân hàng không hợp lệ (Để trống hoặc nhập Có hoặc Không)!");
                            }
                        }
                        //Số giờ hướng dẫn tự học
                        col++;
                        string strSoGioHuongDanTuHoc = Cells[row, col].Text;
                        float SoGioHuongDanTuHoc = 0;
                        if (strSoGioHuongDanTuHoc != "")
                        {
                            strSoGioHuongDanTuHoc = strSoGioHuongDanTuHoc.Trim();
                            if (!CheckData.IsNotNegativeInteger(strSoGioHuongDanTuHoc, out SoGioHuongDanTuHoc))
                            {
                                throw new Exception("Cột số giờ hướng dẫn tự học phải là một số không âm");
                            }
                        }
                        //ThoiGianBatDu
                        col++;
                        text = Cells[row, col].Text;
                        DateTime ThoiGianBatDau;
                        if (text != "")
                        {
                            text = text.Trim();
                            if (!CheckData.IsDate(text, out ThoiGianBatDau))
                            {
                                throw new Exception("Cột thời gian bắt đầu không hợp lệ");
                            }
                        }
                        else
                        {
                            ThoiGianBatDau = DateTime.Now;
                        }
                        //Tự tính số giờ hướng dẫn dự học nếu để trống trường này
                        if (strSoGioHuongDanTuHoc == "")
                        {
                            SoGioHuongDanTuHoc = SoTinChi * GetValue.QuyDinh(VietTat.SoGioHuongDanTuHocCho1TinChi,ThoiGianBatDau);
                        }
                        //ThoiGianKetThuc
                        col++;
                        text = Cells[row, col].Text;
                        DateTime? ThoiGianKetThuc;
                        if (text != "")
                        {
                            text = text.Trim();
                            if (!CheckData.IsDate(text, out ThoiGianKetThuc))
                            {
                                throw new Exception("Cột thời gian kết thúc không hợp lệ");
                            }
                        }
                        else
                        {
                            ThoiGianKetThuc = null;
                        }
                        hocPhan = new HocPhan
                        {
                            IdHocPhan = IdHocPhan,
                            MaHocPhan = MaHocPhan,
                            TenHocPhan = TenHocPhan,
                            IdKhoa = IdKhoa,
                            SoTinChi = SoTinChi,
                            SoGioChuanBiTuHoc = SoGioTuHoc,
                            HuongDanTuHoc = (int)SoGioHuongDanTuHoc,
                            SoTietLyThuyet = SoGioLyThuyet,
                            SoTietThaoLuanThiNghiemThucHanh = SoGioThucHanh,
                            CoNganHangDe = CoNganHang,
                            ThoiGianBatDau = ThoiGianBatDau,
                            ThoiGianThi = ThoiGianThi,
                            IdTrinhDo = IdTrinhDo,
                            IdLoaiHocPhan = idLoaHocPhan,
                            ThuocHocKy = hocKy,
                            ThoiGianKetThuc = ThoiGianKetThuc
                        };
                        string error = CheckData.CheckParametersHocPhan(hocPhan);
                        if (error!="")
                        {
                            throw new Exception(error);
                        }
                        if (CheckData.CheckDuplicateHocPhan(hocPhansDb, hocPhan))
                        {
                            throw new Exception("Môn hoc thêm mới đã có trong cơ sở dữ liệu");
                        }
                        if (CheckData.CheckDuplicateHocPhan(hocPhans, hocPhan))
                        {
                            throw new Exception("Học phần trùng lặp trong excel");
                        }
                            hocPhans.Add(hocPhan);
                    }
                    catch (Exception ex)
                    {
                        Message = "Lỗi: " + ex.Message + "\\n Kiểm tra dữ liệu ở hàng [" + row.ToString() + "]";
                        return null;
                    }
                }
            }
            catch (Exception ex)
            {
                Message = "Lỗi: " + (ex.InnerException != null ? ex.InnerException.Message : ex.Message);
                return null;               
            }
            return hocPhans;
        }

        internal static async Task<List<ViewGiaoVien>> GetGiaoViens(IFormFile theFile)
        {
            int col = 1;
            dbPhanCongThanhToanContext _context = new dbPhanCongThanhToanContext();
            List<ViewGiaoVien> ViewGiaoViens = new List<ViewGiaoVien>();
            ViewGiaoVien viewGiaoVien = null;
            try
            {

                ExcelWorksheet workSheet = await GetExcelWorksheet(theFile);
                var start = workSheet.Dimension.Start;
                var end = workSheet.Dimension.End;
                var Cells = workSheet.Cells;
                //Start a new list to hold imported objects
                for (int row = start.Row + 1; row <= end.Row; row++)
                {
                    try
                    {
                        col = 1;
                        string text = Cells[row, col].Text;
                        int stt = 0;
                        if (!CheckData.IsPositiveInteger(text, out stt))
                        {
                            continue;
                        }
                        col++;
                        text = Cells[row, col].Text;
                        int IdGiaoVienChiTiet = 0;
                        if (text != "" && text != "0")
                        {
                            if (!CheckData.IsPositiveInteger(text, out IdGiaoVienChiTiet))
                            {
                                throw new Exception("Gía trị IdGiaoVienChiTiet không hợp lệ");
                            }
                            if (!CheckExist.IdGiaoVienChiTiet(IdGiaoVienChiTiet))
                            {
                                throw new Exception("Gía trị IdGiaoVienChiTiet không tồn tại");
                            }
                        }
                        col++;
                        text = Cells[row, col].Text;
                        //IdGiaoVien
                        int IdGiaoVien = 0;
                        if (text != "" && text != "0")
                        {
                            if (!CheckData.IsPositiveInteger(text, out IdGiaoVien))
                            {
                                throw new Exception("Gía trị IdGiaoVien không hợp lệ");
                            }
                            if (!CheckExist.IdGiaoVien(IdGiaoVien))
                            {
                                throw new Exception("Gía trị IdGiaoVien không tồn tại");
                            }
                        }
                        col++;
                        string HoTenGiaoVien = Cells[row, col].Text;
                        if (HoTenGiaoVien.Length==0)
                        {
                            throw new Exception("Cột tên giáo viên không được để trống");
                        }
                        col++;
                        string strGioiTinh = Cells[row, col].Text;
                        bool GioiTinh = true;
                        if (Function.CompareUpcaseAndTrim(strGioiTinh,"Nam"))
                        {
                            GioiTinh = true;
                        }
                        else if (Function.CompareUpcaseAndTrim(strGioiTinh, "Nữ"))
                        {
                            GioiTinh = false;
                        }
                        else
                        {
                            throw new Exception("Giới tính không đúng. Hãy nhập Nam hoặc Nữ");
                        }
                        col++;
                        string strNgaySinh = Cells[row, col].Text;
                        DateTime NgaySinh;
                        if (!CheckData.IsDate(strNgaySinh,out NgaySinh))
                        {
                            throw new Exception("Ngày sinh không hợp lệ");
                        }
                        col++;
                        string DienThoai = Cells[row, col].Text;
                        if (DienThoai.Length != 0 && !CheckData.IsSoDienThoai(DienThoai))
                        {
                            throw new Exception("Số điện thoại không hợp lệ");
                        }
                        col++;
                        string TenLoaiCongViec = Cells[row, col].Text;
                        int idLoaiCongViec = 0;
                        if (!CheckData.IsTenCongViec(TenLoaiCongViec))
                        {
                            throw new Exception("Tên công việc không hợp lệ hoặc để trống");
                        }
                        idLoaiCongViec = (int)GetID.IdLoaiCongViec(TenLoaiCongViec);
                        col++;
                        string PhongKhoaTrungTam = Cells[row, col].Text;
                        int? idPhongTrungTam = null;
                        string idKhoa = "";
                        if (String.IsNullOrEmpty(PhongKhoaTrungTam))
                        {
                            throw new Exception("Đơn vị không được để trống");
                        }
                        if (CheckData.isPhongTrungTam(PhongKhoaTrungTam))
                        {
                            idPhongTrungTam = GetID.IdPhongTrungTam(PhongKhoaTrungTam);
                        }
                        if (CheckData.isKhoa(PhongKhoaTrungTam))
                        {
                            idKhoa = GetID.IdKhoa(PhongKhoaTrungTam);
                        }
                        if (idPhongTrungTam == null && idKhoa == "")
                        {
                            throw new Exception("Đơn vị không có trong cơ sở dữ liệu");
                        }
        
                        //Bộ môn
                        col++;
                        string tenBoMon = Cells[row, col].Text;
                        int? IdBoMon = GetID.IdBoMon(tenBoMon);
                        if (tenBoMon!="" && IdBoMon == null)
                        {
                            throw new Exception("Bộ môn không có trong cơ sở dữ liệu!");
                        }
                        //Chức vụ
                        col++;
                        //1 chức vụ chưa xử lý hết
                        string TenChucVu = Cells[row, col].Text;
                        int? IdChucVu = GetID.IdChucVu(TenChucVu);
                        if (TenChucVu != "" && IdChucVu == null)
                        {
                            throw new Exception("Chức vụ không có trong cơ sở dữ liệu!");
                        }
                        List<ViewGiaoVienChucVu> ViewChucVuChiTiets = null;
                        if (IdChucVu!=null)
                        {
                            ViewChucVuChiTiets = new List<ViewGiaoVienChucVu>();
                            ViewGiaoVienChucVu giaoVienChucVu = new ViewGiaoVienChucVu();
                            giaoVienChucVu.IdGiaoVienChucVu = 0;
                            giaoVienChucVu.IdChucVu = (int)IdChucVu;
                            giaoVienChucVu.IdGiaoVien = IdGiaoVien;
                            giaoVienChucVu.ThoiGianBatDau = DateTime.Now;
                            giaoVienChucVu.QuyetDinh = "Chưa rõ";
                            giaoVienChucVu.TenChucVu = TenChucVu;
                            ViewChucVuChiTiets.Add(giaoVienChucVu);
                        }
                        //HeSoLuong
                        col++;
                        string strHeSoLuong = Cells[row, col].Text;
                        float HeSoLuong = 0;
                        if (!CheckData.isPositiveFloat(strHeSoLuong, out HeSoLuong))
                        {
                            throw new Exception("Hệ số lương không hợp lệ");
                        }
                        //Phục cấp chức vụ
                        col++;
                        text = Cells[row, col].Text;
                        float? PhuCapChucVu = 0;
                        if (text != "" && IdChucVu !=null)
                        {
                            if (!CheckData.isPositiveFloat(text, out PhuCapChucVu))
                            {
                                throw new Exception("Phụ cấp chức vụ khi có chức vụ phải là một số dương!");
                            }
                        }
                        else if(text != "" && text !="0" && IdChucVu == null)
                        {
                            throw new Exception("Phụ cấp chức vụ phải = 0 khi chức vụ chưa có!");
                        }
                        else
                        {
                            PhuCapChucVu = 0;
                        }
                        //Phụ cấp thâm niên
                        col++;
                        text = Cells[row, col].Text;
                        float? PhuCapNgheNghiep =null;
                        if (text!=""  && !CheckData.isNotNegativeFloat(text, out PhuCapNgheNghiep))
                        {
                            throw new Exception("Phụ cấp nghề nghiệp phải là một số không âm)!");
                        }
                        if (string.IsNullOrEmpty(text)||text=="0")
                        {
                            PhuCapNgheNghiep = 0;
                        }
                        //ThoiGianBatDu
                        col++;
                        text = Cells[row, col].Text;
                        DateTime ThoiGianBatDau;
                        if (text != "")
                        {
                            text = text.Trim();
                            if (!CheckData.IsDate(text, out ThoiGianBatDau))
                            {
                                throw new Exception("Cột thời gian bắt đầu không hợp lệ");
                            }
                        }
                        else
                        {
                            ThoiGianBatDau = DateTime.Now;
                        }
                        
                        //ThoiGianKetThuc
                        col++;
                        text = Cells[row, col].Text;
                        DateTime? ThoiGianKetThuc;
                        if (text != "")
                        {
                            text = text.Trim();
                            if (!CheckData.IsDate(text, out ThoiGianKetThuc))
                            {
                                throw new Exception("Cột thời gian kết thúc không hợp lệ");
                            }
                        }
                        else
                        {
                            ThoiGianKetThuc = null;
                        }
                        col++;
                        text = Cells[row, col].Text;
                        //IdNguoiDung
                        int? idNguoiDung = null;
                        if (text != "" && text != "0")
                        {
                            if (!CheckData.IsPositiveInteger(text, out idNguoiDung))
                            {
                                throw new Exception("Gía trị idNguoiDung không hợp lệ");
                            }
                            if (!CheckExist.IdNguoiDung(idNguoiDung))
                            {
                                throw new Exception("Gía trị IdGiaoVienChiTiet không tồn tại");
                            }
                        }
                       
                        col++;
                        text = Cells[row, col].Text;
                        //IdCacHeSoLuong
                        int IdHeSoLuong = 0;
                        if (text != "" && text != "0")
                        {
                            if (!CheckData.IsPositiveInteger(text, out IdHeSoLuong))
                            {
                                throw new Exception("Gía trị IdHeSoLuong không hợp lệ");
                            }
                            if (!CheckExist.IdHeSoLuong(IdHeSoLuong))
                            {
                                throw new Exception("Gía trị IdHeSoLuong không tồn tại");
                            }
                        }
                        List<CacHeSoLuong> CacHeSoLuongs = new List<CacHeSoLuong>();
                        CacHeSoLuongs.Add(new CacHeSoLuong
                        {
                            HeSoLuong = HeSoLuong,
                            PhuCapChucVu = PhuCapChucVu,
                            PhuCapNgheNghiep = PhuCapNgheNghiep,
                            IdHeSoLuong = IdHeSoLuong,
                            IdGiaoVien = IdGiaoVien,
                            ThoiGianBatDau = ThoiGianBatDau,
                            ThoiGianKetThuc = ThoiGianKetThuc
                        });
                        List<ViewGiaoVienChiTiet> ViewGiaoVienChiTiets  = new List<ViewGiaoVienChiTiet>();
                        ViewGiaoVienChiTiets.Add(new ViewGiaoVienChiTiet
                        {
                            IdGiaoVienChiTiet = IdGiaoVienChiTiet,
                            IdBoMon = IdBoMon,
                            IdKhoa= idKhoa,
                            TenBoMon = tenBoMon,
                            TenKhoa = (IdBoMon!=null)? PhongKhoaTrungTam:"",
                            IdLoaiCongViec =  idLoaiCongViec,
                            TenLoaiCongViec = TenLoaiCongViec,
                            IdPhongTrungTam = idPhongTrungTam,
                            TenPhongTrungTam =(idPhongTrungTam!=null)? PhongKhoaTrungTam:"",
                            IdGiaoVien = IdGiaoVien,
                            ThoiGianBatDau = ThoiGianBatDau,
                            ThoiGianKetThuc = ThoiGianKetThuc
                        });
                        viewGiaoVien = new ViewGiaoVien
                        {
                            IdGiaoVien = IdGiaoVien,
                            HoTenGiaoVien = HoTenGiaoVien,
                            NgaySinh = NgaySinh,
                            IdNguoiDung = idNguoiDung,
                            DienThoai = DienThoai,
                            Email = "",
                            GioiTinh = GioiTinh,
                            ViewGiaoVienChiTiets = ViewGiaoVienChiTiets,
                            ViewChucVuChiTiets = ViewChucVuChiTiets,
                            CacHeSoLuongs = CacHeSoLuongs
                        };
                        ViewGiaoViens.Add(viewGiaoVien);
                    }
                    catch (Exception ex)
                    {
                        Message = "Lỗi: " + ex.Message + "\\n Kiểm tra dữ liệu ở hàng [" + row.ToString() + "]";
                        return null;
                    }
                }
            }
            catch (Exception ex)
            {
                Message = "Lỗi: " + (ex.InnerException != null ? ex.InnerException.Message : ex.Message);
                return null;
            }
            return ViewGiaoViens;
        }


        internal static async Task<List<BaoGioGiangDayChiTiet>> GetBaoGioGiangDayChiTiets(IFormFile theFile)
        {
            int col = 1;
            List<BaoGioGiangDayChiTiet> baoGioGiangDayChiTiets = new List<BaoGioGiangDayChiTiet>();
            try
            {
                ExcelWorksheet workSheet = await GetExcelWorksheet(theFile);
                var start = workSheet.Dimension.Start;
                var end = workSheet.Dimension.End;
                var Cells = workSheet.Cells;
                int stt = -1;
                //Start a new list to hold imported objects
                for (int row = start.Row + 1; row <= end.Row; row++)
                {
                    try
                    {
                            if (int.TryParse(workSheet.Cells[row, 1].Text, out stt))
                            {
                                //Chưa có kiểm tra
                                col = 2;
                                string MaHP = workSheet.Cells[row, col].Text;
                                if (!CheckExist.MaHocPhan(MaHP))
                                {
                                    throw new Exception("Không tồn tại mã học phần");
                                }
                                col++;
                                string TenLopHP = workSheet.Cells[row, col].Text;
                            col++;
                            string textCell = workSheet.Cells[row, col].Text;
                            int SoTinChi = 0;
                            if (!CheckData.IsPositiveInteger(textCell,out SoTinChi))
                            {
                                throw new Exception("Tín chỉ phải là một số nguyên dương");
                            }
                            col++;
                            int SiSo = 0;
                            textCell = workSheet.Cells[row, col].Text;
                            if (!CheckData.IsPositiveInteger(textCell, out SiSo))
                            {
                                throw new Exception("Sĩ số phải là một số nguyên dương");
                            }
                            col++;
                            textCell = workSheet.Cells[row, col].Text;
                            int SoTiet = 0;
                            if (!CheckData.IsPositiveInteger(textCell, out SoTiet))
                            {
                                throw new Exception("Số tiêt phải là một số nguyên dương");
                            }
                            col++;
                            textCell = workSheet.Cells[row, col].Text;
                            int SoNhom = 0;
                            if (textCell=="")
                            {
                                SoNhom = 0;
                            }
                            else
                            {
                                if (!CheckData.IsPositiveInteger(textCell, out SoNhom))
                                {
                                    throw new Exception("Số nhóm phải là một số nguyên dương");
                                }
                            }
                            col++;
                            textCell = workSheet.Cells[row, col].Text;
                            int SoTietNhom = 0;
                            if (textCell == "")
                            {
                                SoTietNhom = 0;
                            }
                            else
                            {
                                if (!CheckData.IsPositiveInteger(textCell, out  SoTietNhom))
                                {
                                    throw new Exception("Số tiết nhóm phải là một số nguyên dương");
                                }
                            }
                            col++;
                            textCell = workSheet.Cells[row, col].Text;
                            int HDTH = 0;
                            if (textCell == ""|| textCell == "0")
                            {
                                HDTH = 0;
                            }
                            else
                            {
                                if (!CheckData.IsPositiveInteger(textCell, out HDTH))
                                {
                                    throw new Exception("Số tiết hướng dẫn tự học phải là một số nguyên dương");
                                }
                            }
                            col++;
                            string MaKhoa = workSheet.Cells[row, col].Text;
                            col++;
                            string GhiChu = workSheet.Cells[row, col].Text;
                                int idHocPhan = CheckExist.IsHocPhan(MaHP, TenLopHP, SoTinChi, SoTiet, SoTietNhom, HDTH, MaKhoa);
                                if (idHocPhan<=0)
                                {
                                    throw new Exception("Học phần không tồn tại trong cơ sở dữ liệu");
                                }
                                BaoGioGiangDayChiTiet giangDayChiTiet = new BaoGioGiangDayChiTiet
                                {
                                    TenLopHocPhan = TenLopHP,
                                    SiSo = SiSo,
                                    SoNhom = SoNhom,
                                    GhiChu = GhiChu,
                                    IdHocPhan=idHocPhan
                                };
                                baoGioGiangDayChiTiets.Add(giangDayChiTiet);
                            }
                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message + " Kiểm tra dữ liệu ở hàng [" + row.ToString() + ", " + col.ToString() + " ]";
                        return null;
                    }
                }
                return baoGioGiangDayChiTiets;
            }
            catch (Exception ex)
            {
                Message = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
                return null;
            }
        }
    }
}
