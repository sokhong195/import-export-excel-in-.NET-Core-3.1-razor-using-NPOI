using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class BaoGioTrungTam
    {
        public BaoGioTrungTam()
        {
            BaoGioTrungTamChiTiets = new HashSet<BaoGioTrungTamChiTiet>();
        }

        public int IdBaoGioTrungTam { get; set; }
        public string TenBaoGio { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime ThoiGianKetThuc { get; set; }
        public int IdKhoa { get; set; }
        public string ThongTinVeThoiGianKhoaHoc { get; set; }
        public string TenTepBaoGio { get; set; }

        public virtual ICollection<BaoGioTrungTamChiTiet> BaoGioTrungTamChiTiets { get; set; }
    }
}
