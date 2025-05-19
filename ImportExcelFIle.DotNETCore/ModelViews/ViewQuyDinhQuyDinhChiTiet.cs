using ImportExcelFIle.DotNETCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.ModelViews
{
    public class ViewQuyDinhChiTietQuyDinh
    {
        public QuyDinh QuyDinh { get; set; }
        public List<QuyDinhChiTiet> QuyDinhChiTiets { get; set; }

    }
}
