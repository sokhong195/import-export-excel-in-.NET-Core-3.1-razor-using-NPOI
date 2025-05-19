using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class HinhThucThi
    {
        public HinhThucThi()
        {
            HocPhans = new HashSet<HocPhan>();
            QuyDinhGioChuanCoiThiLyThuyets = new HashSet<QuyDinhGioChuanCoiThiLyThuyet>();
            QuyDinhGioChuanRaDes = new HashSet<QuyDinhGioChuanRaDe>();
        }

        public int IdHinhThucThi { get; set; }
        public string TenHinhThucThi { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual ICollection<HocPhan> HocPhans { get; set; }
        public virtual ICollection<QuyDinhGioChuanCoiThiLyThuyet> QuyDinhGioChuanCoiThiLyThuyets { get; set; }
        public virtual ICollection<QuyDinhGioChuanRaDe> QuyDinhGioChuanRaDes { get; set; }
    }
}
