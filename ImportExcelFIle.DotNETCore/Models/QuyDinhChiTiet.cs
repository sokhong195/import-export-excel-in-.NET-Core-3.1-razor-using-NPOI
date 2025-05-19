using Microsoft.AspNetCore.Mvc;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class QuyDinhChiTiet:IThoiGian
    {
        public QuyDinhChiTiet()
        {
        }

        public int IdQuyDinhChiTiet { get; set; }
        [Required(ErrorMessage = "Nhập giá trị")]
        [RegularExpression("(^[+]?([0-9]+([.][0-9]*)?|[.][0-9]+)$)", ErrorMessage = "Nhập một số không âm")]
        [DisplayName("Giá trị")]
        public float GiaTri { get; set; }
        [DisplayName("Quy đinh")]
        public int IdQuyDinh { get; set; }
        [DisplayName("Thời gian bắt đầu")]
        [BindProperty, DataType(DataType.Date)]
        public DateTime ThoiGianBatDau { get; set; }
        [BindProperty, DataType(DataType.Date)]
        [DisplayName("Thời gian kết thúc")]
        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual QuyDinh IdQuyDinhNavigation { get; set; }
    }
}
