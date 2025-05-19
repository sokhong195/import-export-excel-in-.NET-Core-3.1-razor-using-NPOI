using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class PhongTrungTam : IThoiGian
    {
        public PhongTrungTam()
        {
            GiaoVienChiTiets = new HashSet<GiaoVienChiTiet>();
        }

        public int IdPhongTrungTam { get; set; }
        [DisplayName("Tên phòng, trung tâm")]
        [Required(ErrorMessage ="Tên không được để trống")]
        public string TenPhongTrungTam { get; set; }
        [DisplayName("Thời gian bắt đầu")]
        [Required(ErrorMessage = "Nhập thời gian bắt đầu")]
        public DateTime ThoiGianBatDau { get; set; }
        [DisplayName("Thời gian kết thúc")]

        public DateTime? ThoiGianKetThuc { get; set; }

        public virtual ICollection<GiaoVienChiTiet> GiaoVienChiTiets { get; set; }
    }
}
