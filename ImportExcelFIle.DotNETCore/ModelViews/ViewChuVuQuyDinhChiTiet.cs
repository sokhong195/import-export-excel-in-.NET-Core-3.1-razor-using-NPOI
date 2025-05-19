using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewChuVuQuyDinhChiTiet
    {
        public int IdChucVu { get; set; }
        [DisplayName("Tên chức vụ")]
        [Required(ErrorMessage = "Nhập tên chức vụ")]
        public string TenChucVu { get; set; }
        public
        List<QuyDinhChiTiet> QuyDinhChiTiets { get; set; }
        
    }
}
