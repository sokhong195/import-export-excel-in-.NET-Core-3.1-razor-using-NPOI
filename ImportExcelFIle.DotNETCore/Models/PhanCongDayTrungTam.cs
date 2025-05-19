using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class PhanCongDayTrungTam
    {
        public PhanCongDayTrungTam()
        {
            TinhGioTrungTams = new HashSet<TinhGioTrungTam>();
        }

        public int IdPhanCongDayTrungTam { get; set; }
        public int IdGiaoVien { get; set; }
        public int IdBaoGioTrungTamChiTiet { get; set; }
        public int SoGio { get; set; }
        public string GhiChu { get; set; }

        public virtual BaoGioTrungTamChiTiet IdBaoGioTrungTamChiTietNavigation { get; set; }
        public virtual GiaoVien IdGiaoVienNavigation { get; set; }
        public virtual ICollection<TinhGioTrungTam> TinhGioTrungTams { get; set; }
    }
}
