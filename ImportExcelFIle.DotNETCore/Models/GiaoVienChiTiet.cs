using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class GiaoVienChiTiet:IThoiGian
    {
        public int IdGiaoVienChiTiet { get; set; }
        public int IdGiaoVien { get; set; }
        [Required(ErrorMessage = "Nhập loại công việc")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Chọn loại công việc")]
        [DisplayName("Loại công việc")]
        public int IdLoaiCongViec { get; set; }
        [DisplayName("Phòng - Trung tâm")]
        public int? IdPhongTrungTam { get; set; }
        [DisplayName("Bộ môn")]
        public int? IdBoMon { get; set; }
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        [BindProperty, DataType(DataType.Date)]

        [DisplayName("Thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]
        [BindProperty, DataType(DataType.Date)]

        public DateTime? ThoiGianKetThuc { get; set; }
        [DisplayName("Tình trạng")]
        //[Required(ErrorMessage = "Hãy xác nhận tình trạng")]
        public string TinhTrang { get; set; }

        [DisplayName("Quyết đinh")]
        //[Required(ErrorMessage ="Hãy chọn ảnh chụp quyết định")]
        public string QuyetDinh { get; set; }


        public virtual BoMon IdBoMonNavigation { get; set; }
        public virtual GiaoVien IdGiaoVienNavigation { get; set; }
        public virtual LoaiCongViec IdLoaiCongViecNavigation { get; set; }
        public virtual PhongTrungTam IdPhongTrungTamNavigation { get; set; }
    }
}
