using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class NghienCuuKhoaHoc
    {
        public NghienCuuKhoaHoc()
        {
            ThanhVienDeTais = new HashSet<ThanhVienDeTai>();
        }

        public int IdDeTaiNghienCuuKhoaHoc { get; set; }
        public string TenDeTai { get; set; }
        public string LoaiDeTai { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime ThoiGianNghiemThu { get; set; }
        public string SoGioChuan { get; set; }

        public virtual ICollection<ThanhVienDeTai> ThanhVienDeTais { get; set; }
    }
}
