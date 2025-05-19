using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class HeSoSinhVien
    {
        public int IdHeSoSinhVien { get; set; }
        public int SoNamHoc { get; set; }
        public int TiLeSinhVienMin { get; set; }
        public int TiLeSinhVienMax { get; set; }
        public double? HeSoSinhVienLopHoc { get; set; }
    }
}
