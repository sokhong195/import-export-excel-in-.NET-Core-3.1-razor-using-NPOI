using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class LoaiDeTai
    {
        public LoaiDeTai()
        {
            ChiTietLoaiDeTais = new HashSet<ChiTietLoaiDeTai>();
        }

        public int IdLoaiDeTai { get; set; }
        public string TenLoaiDeTai { get; set; }
        public int? IdHoatDongNckh { get; set; }

        public virtual HoatDongNckh IdHoatDongNckhNavigation { get; set; }
        public virtual ICollection<ChiTietLoaiDeTai> ChiTietLoaiDeTais { get; set; }
    }
}
