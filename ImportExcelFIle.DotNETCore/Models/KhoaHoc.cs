using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class KhoaHoc
    {
        public KhoaHoc()
        {
        }

        public int IdKhoaHoc { get; set; }
        public string TenKhoaHoc { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public int SoNamHoc { get; set; }
        public int DaTotNghiep { get; set; }

    }
}
