using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImportExcelFIle.DotNETCore.Models
{
    interface IThoiGian
    {

        DateTime ThoiGianBatDau { get; set; }

        DateTime? ThoiGianKetThuc
        { get; set; }
    }
}
