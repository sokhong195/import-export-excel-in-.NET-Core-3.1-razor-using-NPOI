using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Classes
{
    public class PhanGioHocPhan
    {
        public int IdBaoGioGiangDayChiTiet { get; set; }
        public List<int> IdGiaoViens { get; set; }
        public float SoGio { get; set; }
        public List<float> ChiaGios { get; set; }
    }
}
