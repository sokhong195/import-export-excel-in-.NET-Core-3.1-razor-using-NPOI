using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class NhiemVuKhoaHoc
    {
        public int IdNhiemVuKhoaHoc { get; set; }
        public int IdNamHocHocKy { get; set; }
        public double SoGio { get; set; }
        public int IdThanhVienDeTai { get; set; }

        public virtual ThanhVienDeTai IdThanhVienDeTaiNavigation { get; set; }
    }
}
