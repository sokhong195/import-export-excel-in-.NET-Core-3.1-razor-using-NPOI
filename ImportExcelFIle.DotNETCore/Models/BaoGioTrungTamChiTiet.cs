using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class BaoGioTrungTamChiTiet
    {
        public BaoGioTrungTamChiTiet()
        {
            PhanCongDayTrungTams = new HashSet<PhanCongDayTrungTam>();
        }

        public int IdBaoGioTrungTamChiTiet { get; set; }
        public int IdBaoGioTrungTam { get; set; }
        public string TenLop { get; set; }
        public int Siso { get; set; }
        public int SoTiet { get; set; }
        public string GhiChu { get; set; }

        public virtual BaoGioTrungTam IdBaoGioTrungTamNavigation { get; set; }
        public virtual ICollection<PhanCongDayTrungTam> PhanCongDayTrungTams { get; set; }
    }
}
