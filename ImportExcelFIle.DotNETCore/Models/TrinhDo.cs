using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class TrinhDo
    {
        public TrinhDo()
        {
            HocPhans = new HashSet<HocPhan>();
            GiaoVienTrinhDos = new HashSet<GiaoVienTrinhDo>();

        }

        public int IdTrinhDo { get; set; }
        public string TenTrinhDo { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual ICollection<HocPhan> HocPhans { get; set; }
        public virtual ICollection<GiaoVienTrinhDo> GiaoVienTrinhDos { get; set; }

    }
}
