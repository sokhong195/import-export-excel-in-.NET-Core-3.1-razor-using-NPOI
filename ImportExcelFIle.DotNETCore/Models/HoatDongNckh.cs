using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class HoatDongNckh
    {
        public HoatDongNckh()
        {
            LoaiDeTais = new HashSet<LoaiDeTai>();
        }

        public int IdHoatDongNckh { get; set; }
        public string TenHoatDongNckh { get; set; }

        public virtual ICollection<LoaiDeTai> LoaiDeTais { get; set; }
    }
}
