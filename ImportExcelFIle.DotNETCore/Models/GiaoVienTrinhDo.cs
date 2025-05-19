using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Models
{
    public class GiaoVienTrinhDo:IThoiGian
    {
        public int IdGiaoVienTrinhDo { get; set; }
        public int IdGiaoVien { get; set; }
        [DisplayName("Trình độ")]
        [Required(ErrorMessage = "Nhập trình độ")]
        public int IdTrinhDo { get; set; }
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [BindProperty, DataType(DataType.Date)]

        [DisplayName("Thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]
        public DateTime? ThoiGianKetThuc { get; set; }
        [DisplayName("Tình trạng")]
        public string TinhTrang { get; set; }
        [DisplayName("Quyết đinh")]
        //  [Required(ErrorMessage = "Hãy chọn ảnh chụp quyết định")]
        public string QuyetDinh { get; set; }
        public virtual GiaoVien IdGiaoVienNavigation { get; set; }
        public virtual TrinhDo IdTrinhDoNavigation { get; set; }
    }
}
