using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class QuyDinh
    {
        public QuyDinh()
        {
            QuyDinhChiTiets = new List<QuyDinhChiTiet>();
        }
        public int IdQuyDinh { get; set; }
        [Required(ErrorMessage ="Hãy chọn loại quy định")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Hãy chọn loại quy định")]
        [Display(Name ="Loại quy định")]
        public int IdLoaiQuyDinh { get; set; }
        [Required(ErrorMessage = "Tên không được để trống")]
        [Display(Name = "Tên quy định")]
        public string TenQuyDinh { get; set; }
        public virtual LoaiQuyDinh IdLoaiQuyDinhNavigation { get; set; }
        public virtual List<QuyDinhChiTiet> QuyDinhChiTiets { get; set; }
    }
}
