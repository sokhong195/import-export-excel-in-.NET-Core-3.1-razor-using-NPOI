using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class PhanQuyen
    {
        public PhanQuyen()
        {
            PhanQuyenChiTiets = new HashSet<PhanQuyenChiTiet>();
        }

        public int IdPhanQuyen { get; set; }
        public string TenPhanQuyen { get; set; }

        public virtual ICollection<PhanQuyenChiTiet> PhanQuyenChiTiets { get; set; }
    }
}
