using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Models
{
    public class ViewNamHocHocKys
    {
        public ViewNamHocHocKys()
        {
            hocKies = new List<HocKy>();
            thoiGianBatDaus = new List<DateTime?>();
            thoiGianKetThucs = new List<DateTime?>();
        }
        public NamHoc namHoc { get; set; }
        public  List<HocKy> hocKies { get; set; }
        

        public List<DateTime?> thoiGianBatDaus { get; set; }
        
        public List<DateTime?> thoiGianKetThucs { get; set; }
    }
}
