using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewPhanCongSoGioCuaGiaoVien
    {
        public ViewPhanCongSoGioCuaGiaoVien()
        {
            ViewBaoGioGiangDayChiTiets = new List<ViewBaoGioGiangDayChiTiet>();
            SoGio = new List<float>();
        }
        public int IdGiaoVien { get; set; }
        public string HoTenGiaoVien { get; set; }
        public string TenTrinhDo { get; set; }
        public double SoGioChuan { get; set; }
        public double SoGioDaPhan { get; set; }
        public string GhiChu { get; set; }
        public List<ViewBaoGioGiangDayChiTiet> ViewBaoGioGiangDayChiTiets { get; set; }
        public List<float> SoGio { get; set; }
        public float TongSoGioThucHien { get; set; }
    }
}
