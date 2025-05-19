using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class LoaiHocPhan
    {
        public LoaiHocPhan()
        {
            HocPhans = new HashSet<HocPhan>();
            QuyDinhVeHuongDanDoAns = new HashSet<QuyDinhVeHuongDanDoAn>();
        }

        public int IdLoaiHocPhan { get; set; }
        public string TenLoaiHocPhan { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual ICollection<HocPhan> HocPhans { get; set; }
        public virtual ICollection<QuyDinhVeHuongDanDoAn> QuyDinhVeHuongDanDoAns { get; set; }
    }
}
