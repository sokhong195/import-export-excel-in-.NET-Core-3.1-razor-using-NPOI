using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class PhanQuyenNguoiDung
    {
        public int IdNguoiDung { get; set; }
        public int IdPhanQuyen { get; set; }

        public virtual NguoiDung IdNguoiDungNavigation { get; set; }
        public virtual PhanQuyen IdPhanQuyenNavigation { get; set; }
    }
}
