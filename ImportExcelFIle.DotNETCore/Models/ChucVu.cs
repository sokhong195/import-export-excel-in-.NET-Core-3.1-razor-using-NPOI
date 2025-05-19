using ImportExcelFIle.DotNETCore.Classes;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class ChucVu
    {
        public ChucVu()
        {
            GiaoVienChucVus = new List<GiaoVienChucVu>();
            HeSoChucVus = new List<HeSoChucVu>();
        }

        public int IdChucVu { get; set; }
        [DisplayName ("Tên chức vụ")]
        [Required(ErrorMessage ="Nhập tên chức vụ")]

        public string TenChucVu { get; set; }
        public virtual List<GiaoVienChucVu> GiaoVienChucVus { get; set; }
        public virtual List<HeSoChucVu> HeSoChucVus { get; set; }
    }
}
