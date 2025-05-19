using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewPhanCongGiangDay
    {
        public ViewPhanCongGiangDay()
        {
            ViewBaoGioGiangDayChiTiet = new ViewBaoGioGiangDayChiTiet();
            IdGiaoViens = new List<int>();
            ChiaGios = new List<float>();
        }
       public  ViewBaoGioGiangDayChiTiet ViewBaoGioGiangDayChiTiet { get; set; }
       public List<int> IdGiaoViens { get; set; }
        public List<float> ChiaGios { get; set; }
    }
}
