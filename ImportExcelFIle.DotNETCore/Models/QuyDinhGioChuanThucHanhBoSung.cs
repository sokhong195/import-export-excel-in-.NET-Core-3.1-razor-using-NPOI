using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class QuyDinhGioChuanThucHanhBoSung
    {
        public int IdQuyDinhGioChuanThucHanhBoSung { get; set; }
        public string IdKhoa { get; set; }
        public double GioChuanMotSinhVien { get; set; }
        public int SinhVienToiDaDuocTinh { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual Khoa IdKhoaNavigation { get; set; }
    }
}
