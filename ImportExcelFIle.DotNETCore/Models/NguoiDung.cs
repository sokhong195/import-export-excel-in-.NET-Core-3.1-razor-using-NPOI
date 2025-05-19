using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class NguoiDung
    {
        public NguoiDung()
        {
            GiaoViens = new HashSet<GiaoVien>();
        }

        public int IdNguoiDung { get; set; }
        public string TenNguoiDung { get; set; }
        public string MatKhau { get; set; }
        public string Email { get; set; }
        public bool VoHieuHoa { get; set; }
        public string Sdt { get; set; }

        public virtual ICollection<GiaoVien> GiaoViens { get; set; }
    }
}
