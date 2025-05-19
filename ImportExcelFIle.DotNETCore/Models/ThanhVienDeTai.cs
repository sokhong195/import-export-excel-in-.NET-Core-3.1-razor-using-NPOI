using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class ThanhVienDeTai
    {
        public ThanhVienDeTai()
        {
            NhiemVuKhoaHocs = new HashSet<NhiemVuKhoaHoc>();
        }

        public int IdThanhVienDeTai { get; set; }
        public int IdGiaoVien { get; set; }
        public bool LaChuBien { get; set; }
        public bool TinhGio { get; set; }
        public int IdDeTaiNghienCuuKhoaHoc { get; set; }
        public string HoTen { get; set; }

        public virtual NghienCuuKhoaHoc IdDeTaiNghienCuuKhoaHocNavigation { get; set; }
        public virtual GiaoVien IdGiaoVienNavigation { get; set; }
        public virtual ICollection<NhiemVuKhoaHoc> NhiemVuKhoaHocs { get; set; }
    }
}
