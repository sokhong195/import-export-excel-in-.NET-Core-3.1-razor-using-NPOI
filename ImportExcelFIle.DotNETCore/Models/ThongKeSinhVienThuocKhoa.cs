using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class ThongKeSinhVienThuocKhoa
    {
        public int IdThongKeSinhVienThuocKhoa { get; set; }
        public int IdKhoa { get; set; }
        public int SoSinhVien { get; set; }
        public int IdNamHocHocKy { get; set; }

        public virtual NamHocHocKy IdNamHocHocKyNavigation { get; set; }
    }
}
