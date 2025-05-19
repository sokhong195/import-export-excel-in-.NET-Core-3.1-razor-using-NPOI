using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
namespace ImportExcelFIle.DotNETCore.Models
{
    public class ViewNamHocHocKysValidator: AbstractValidator<ViewNamHocHocKys>
    {
        public ViewNamHocHocKysValidator()
        {
            RuleFor(x => x.namHoc.TenNamHoc).Length(1,10).WithMessage("Không được để trống trường này")
                .NotEmpty().WithMessage("Nhập năm học");
            RuleForEach(x => x.thoiGianBatDaus).NotNull().WithMessage("Nhập ngày tháng năm");
            RuleForEach(x => x.thoiGianKetThucs).NotNull().WithMessage("Nhập ngày tháng năm");
        }
    }
}
