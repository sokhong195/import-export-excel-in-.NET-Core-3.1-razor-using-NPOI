using System;
using System.Collections.Generic;

#nullable disable

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class NamHoc
    {
        public NamHoc()
        {
            NamHocHocKies = new HashSet<NamHocHocKy>();
        }

        public int IdNamHoc { get; set; }
        public string TenNamHoc { get; set; }

        public virtual ICollection<NamHocHocKy> NamHocHocKies { get; set; }
    }
}
