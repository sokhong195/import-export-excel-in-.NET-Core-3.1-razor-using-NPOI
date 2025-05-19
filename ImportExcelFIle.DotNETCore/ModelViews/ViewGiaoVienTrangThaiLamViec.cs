using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewGiaoVienTrangThaiLamViec
    {
        public int IdGiaoVienTrangThaiLamViec { get; set; }
        public int IdTrangThaiLamViec { get; set; }
        public int IdGiaoVien { get; set; }
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [DisplayName("Thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }

        [DisplayName("Thời gian kết thúc")]

        public DateTime? ThoiGianKetThuc { get; set; }
        [DisplayName("Quyết định")]
        public string QuyetDinh { get; set; }
        [DisplayName("Tình trạng")]
        public string TinhTrang { get; set; }
        [DisplayName("Trạng thái làm việc")]
        [Required(ErrorMessage = "Nhập trạng thái làm việc")]
        public string TenTrangThaiLamViec { get; set; }
    }
}
