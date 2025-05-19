using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class LoaiQuyDinh
    {
        public LoaiQuyDinh()
        {
            QuyDinhs = new HashSet<QuyDinh>();
        }

        public int IdLoaiQuyDinh { get; set; }
        [DisplayName("Loại quy định")]
        [Required(ErrorMessage ="Tên loại quy định không được để trống")]
        public string TenLoaiQuyDinh { get; set; }

        public virtual ICollection<QuyDinh> QuyDinhs { get; set; }
    }
}
