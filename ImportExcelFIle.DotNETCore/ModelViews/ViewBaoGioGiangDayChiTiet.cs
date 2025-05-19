using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewBaoGioGiangDayChiTiet
    {
        public ViewBaoGioGiangDayChiTiet()
        {

        }
        public ViewBaoGioGiangDayChiTiet(int idBaoGioGiangDayChiTiet, int idHocPhan, string maHocPhan, string tenLopHocPhan, int siSo, int soNhom, int soTinChi, int soTietLyThuyet, int soTietThaoLuanThiNghiemThucHanh, int soGioChuanBiTuHoc, string idKhoa, string ghiChu, int huongDanTuHoc, int idBaoGioGiangDay, float soGioChuan,string hinhThucThi="",float heSoSiSoLTTHMDDA=0, float heSoSiSoBTTNTL=0, float heSoChucDanh=1.0f, float heSoHDTH = 0)
        {
            IdBaoGioGiangDayChiTiet = idBaoGioGiangDayChiTiet;
            MaHocPhan = maHocPhan;
            TenLopHocPhan = tenLopHocPhan;
            SiSo = siSo;
            SoNhom = soNhom;
            SoTinChi = soTinChi;
            SoTietLyThuyet = soTietLyThuyet;
            SoTietThaoLuanThiNghiemThucHanh = soTietThaoLuanThiNghiemThucHanh;
            SoGioChuanBiTuHoc = soGioChuanBiTuHoc;
            IdKhoa = idKhoa;
            GhiChu = ghiChu;
            IdBaoGioGiangDay = idBaoGioGiangDay;
            HuongDanTuHoc = huongDanTuHoc;
            IdHocPhan = idHocPhan;
            SoGioChuan = soGioChuan;
            HinhThuThi = hinhThucThi;
            HeSoChucDanh = heSoChucDanh;
            HeSoSiSoBTTNTL = heSoSiSoBTTNTL;
            HeSoSiSoLTTHMDDA = heSoSiSoLTTHMDDA;
            HeSoHDTH = heSoHDTH;
        }
        [Key]
        public int IdBaoGioGiangDayChiTiet { get; set; }
        [DisplayName("Số giờ chuẩn")]
        public float? SoGioChuan { get; set; }
        public string MaHocPhan { get; set; }
        [Required(ErrorMessage = "Nhập tên học phần")]
        [DisplayName("Tên học phần")]
        public string TenLopHocPhan { get; set; }
        [DisplayName("Hình thức thi")]
        public string HinhThuThi { get; set; }
        [Required(ErrorMessage = "Nhập sĩ số")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Nhập một số nguyên dương")]
        [DisplayName("Sĩ số")]
        public  int SiSo{ get; set; }
        [Required(ErrorMessage = "Nhập số nhóm")]
        [RegularExpression("([0-9]*)", ErrorMessage = "Nhập số nhó là một số không âm")]
        [DisplayName("Số nhóm")]
        public int SoNhom { get; set; }
        [DisplayName("Số tín chỉ")]

        public int SoTinChi { get; set; }
        [DisplayName("Số tiết lý thuyết")]

        public int SoTietLyThuyet { get; set; }
        [DisplayName("Số tiết thảo luận, thí nghiệm hoặc thực hành")]

        public int SoTietThaoLuanThiNghiemThucHanh { get; set; }
        [DisplayName("Số giờ chuẩn bị tự học")]

        public int SoGioChuanBiTuHoc { get; set; }
        [DisplayName("Hệ số hướng dẫn tự học")]

        public float HeSoHDTH { get; set; }
        [DisplayName("Hệ số sĩ số LT/TH/MD/ĐA")]

        public float HeSoSiSoLTTHMDDA { get; set; }
        [DisplayName("Hệ số sĩ số BT/TN/TL")]

        public float HeSoSiSoBTTNTL { get; set; }
        [DisplayName("Hệ số chức danh")]

        public float HeSoChucDanh { get; set; }
        public string IdKhoa { get; set; }
        [DisplayName("Ghi chú")]
        public string GhiChu { get; set; }
        [DisplayName("Số giờ hướng dẫn tự học")]

        public int HuongDanTuHoc { get; set; }
        public int IdBaoGioGiangDay  { get; set; }
        [Required(ErrorMessage = "Nhập mã học phần")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Hãy chọn mã học phần")]
        [DisplayName("Mã học phần")]
        public int IdHocPhan { get; set; }
    }
}
