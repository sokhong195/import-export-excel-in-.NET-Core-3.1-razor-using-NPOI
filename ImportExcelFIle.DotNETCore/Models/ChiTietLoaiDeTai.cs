using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class ChiTietLoaiDeTai
    {
        public ChiTietLoaiDeTai()
        {
            GioChuanNghienCuuKhoaHocs = new HashSet<GioChuanNghienCuuKhoaHoc>();
        }

        public int IdChiTietLoaiDeTai { get; set; }
        public string TenChiTietLoaiDeTai { get; set; }
        public int IdLoaiDeTai { get; set; }

        public virtual LoaiDeTai IdLoaiDeTaiNavigation { get; set; }
        public virtual ICollection<GioChuanNghienCuuKhoaHoc> GioChuanNghienCuuKhoaHocs { get; set; }
    }
}
