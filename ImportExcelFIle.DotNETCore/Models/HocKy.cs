using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class HocKy
    {
        public HocKy()
        {
            NamHocHocKies = new HashSet<NamHocHocKy>();
        }

        public int IdHocKy { get; set; }
        [Required(ErrorMessage ="Tên học kỳ không được để trống")]
        [DisplayName("Tên học kỳ")]
        public string TenHocKy { get; set; }

        public virtual ICollection<NamHocHocKy> NamHocHocKies { get; set; }
    }
}
