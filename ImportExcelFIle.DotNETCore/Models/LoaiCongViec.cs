using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class LoaiCongViec
    {
        public LoaiCongViec()
        {
            GiaoVienChiTiets = new HashSet<GiaoVienChiTiet>();
        }

        public int IdLoaiCongViec { get; set; }
        [Required(ErrorMessage = "Tên loại công việc không được để trống")]
        [DisplayName("Tên loại công việc")]
        public string TenLoaiCongViec { get; set; }

        public virtual ICollection<GiaoVienChiTiet> GiaoVienChiTiets { get; set; }
    }
}
