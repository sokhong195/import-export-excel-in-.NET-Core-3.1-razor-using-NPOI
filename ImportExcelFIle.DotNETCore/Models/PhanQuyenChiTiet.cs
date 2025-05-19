using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class PhanQuyenChiTiet
    {
        public int IdPhanQuyenChiTiet { get; set; }
        public int IdPhanQuyen { get; set; }
        public string Quyen { get; set; }

        public virtual PhanQuyen IdPhanQuyenNavigation { get; set; }
    }
}
