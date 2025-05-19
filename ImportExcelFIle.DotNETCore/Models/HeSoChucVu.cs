using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Models
{
    public class HeSoChucVu:IThoiGian
    {
        public int IdHeSoChucVu { get; set; }

        [Required(ErrorMessage = "Nhập giá trị")]
        [RegularExpression("(^[+]?([0-9]+([.][0-9]*)?|[.][0-9]+)$)", ErrorMessage = "Nhập một số không âm")]
        [DisplayName("Giá trị")]
        public float GiaTri { get; set; }
       
        [DisplayName("Thời gian bắt đầu")]
        [BindProperty, DataType(DataType.Date)]
        public DateTime ThoiGianBatDau { get; set; }


        [BindProperty, DataType(DataType.Date)]
        [DisplayName("Thời gian kết thúc")]
        public DateTime? ThoiGianKetThuc { get; set; }

        public int IdChucVu { get; set; }

        public virtual ChucVu IdChucVuNavigation { get; set; }
    }
}
