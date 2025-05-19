using AutoMapper;
using ImportExcelFIle.DotNETCore.Models;
using ImportExcelFIle.DotNETCore.ModelViews;

namespace ImportExcelFIle.DotNETCore.Classes
{
    public class AutoMapperProfile:Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<ViewBaoGioGiangDayChiTiet, BaoGioGiangDayChiTiet>();
            CreateMap<BaoGioGiangDayChiTiet, ViewBaoGioGiangDayChiTiet>();
            CreateMap<ViewChuVuQuyDinhChiTiet, ChucVu>();
            CreateMap<ChucVu, ViewChuVuQuyDinhChiTiet>();
            CreateMap<ViewGiaoVienChiTiet, GiaoVienChiTiet>();
            CreateMap<ViewGiaoVienChiTiet, GiaoVien>();
            CreateMap<GiaoVienChiTiet, ViewGiaoVienChiTiet>();
            CreateMap<GiaoVien, ViewGiaoVienChiTiet>();
            CreateMap<CacHeSoLuong, ViewGiaoVienChiTiet>();
            CreateMap<ViewGiaoVienChiTiet, CacHeSoLuong>();
            CreateMap<ViewGiaoVienChucVu, GiaoVienChucVu>();
            CreateMap<GiaoVienChucVu, ViewGiaoVienChucVu>();
            CreateMap<ViewGiaoVien, GiaoVien>();
            CreateMap<GiaoVien, ViewGiaoVien>();
        }
        public static IMapper AutoMapperConfig()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new AutoMapperProfile());
            });
            return config.CreateMapper();
        }
    }
}
