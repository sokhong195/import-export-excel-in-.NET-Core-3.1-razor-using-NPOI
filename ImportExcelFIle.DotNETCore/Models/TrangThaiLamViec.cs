using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class TrangThaiLamViec
    {
        public TrangThaiLamViec()
        {
            GiaoVienTrangThaiLamViecs = new List<GiaoVienTrangThaiLamViec>();
            MienGiamTheoTrangThaiLamViecs = new List<MienGiamTheoTrangThaiLamViec>();
        }

        public int IdTrangThaiLamViec { get; set; }
        [Required(ErrorMessage = "Nhập tên trạng thái làm việc")]
        [Display(Name = "Trạng thái làm việc")]
        public string TenTrangThaiLamViec { get; set; }

        public virtual List<GiaoVienTrangThaiLamViec> GiaoVienTrangThaiLamViecs { get; set; }
        public virtual List<MienGiamTheoTrangThaiLamViec> MienGiamTheoTrangThaiLamViecs { get; set; }
    }
}