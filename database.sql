USE [master]
GO
/****** Object:  Database [dbPhanCongThanhToan]    Script Date: 27/12/2021 8:57:20 PM ******/
CREATE DATABASE [dbPhanCongThanhToan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbPhanCongThanhToan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbPhanCongThanhToan.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbPhanCongThanhToan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbPhanCongThanhToan_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbPhanCongThanhToan] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbPhanCongThanhToan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbPhanCongThanhToan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET RECOVERY FULL 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET  MULTI_USER 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbPhanCongThanhToan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbPhanCongThanhToan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbPhanCongThanhToan', N'ON'
GO
USE [dbPhanCongThanhToan]
GO
/****** Object:  Table [dbo].[BaoGioCoiHoiThi]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaoGioCoiHoiThi](
	[idBaoGioCoiHoiThi] [int] IDENTITY(1,1) NOT NULL,
	[TenBaoGioCoiHoiThi] [varchar](255) NOT NULL,
	[IdNamHocHocKy] [int] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NOT NULL,
 CONSTRAINT [PK_TBLBAOGIOCOIHOITHI] PRIMARY KEY CLUSTERED 
(
	[idBaoGioCoiHoiThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BaoGioGiangDay]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoGioGiangDay](
	[idBaoGioGiangDay] [int] IDENTITY(1,1) NOT NULL,
	[TenPhanCongGiangDay] [nvarchar](100) NOT NULL,
	[IdNamHocHocKy] [int] NOT NULL,
	[ThoiGianBatDau] [datetime] NOT NULL,
	[ThoiGianKetThuc] [datetime] NULL,
	[TenTepBaoGio] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TBLBAOGIOGIANGDAY] PRIMARY KEY CLUSTERED 
(
	[idBaoGioGiangDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaoGioGiangDayChiTiet]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoGioGiangDayChiTiet](
	[IdBaoGioGiangDayChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[idBaoGioGiangDay] [int] NOT NULL,
	[idHocPhan] [int] NOT NULL,
	[TenLopHocPhan] [nvarchar](100) NOT NULL,
	[SiSo] [int] NOT NULL,
	[SoNhom] [int] NOT NULL,
	[PhongThi] [nvarchar](100) NULL,
	[NgayThi] [date] NULL,
	[CaThi] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
	[IdBaoGioCoiHoiThi] [int] NULL,
 CONSTRAINT [PK_TBLBAOGIOGIANGDAYCHITIET] PRIMARY KEY CLUSTERED 
(
	[IdBaoGioGiangDayChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaoGioTrungTam]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaoGioTrungTam](
	[idBaoGioTrungTam] [int] NOT NULL,
	[TenBaoGio] [varchar](255) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NOT NULL,
	[idKhoa] [int] NOT NULL,
	[ThongTinVeThoiGianKhoaHoc] [varchar](255) NOT NULL,
	[TenTepBaoGio] [nvarchar](100) NULL,
 CONSTRAINT [PK_TBLBAOGIOTRUNGTAM] PRIMARY KEY CLUSTERED 
(
	[idBaoGioTrungTam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BaoGioTrungTamChiTiet]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaoGioTrungTamChiTiet](
	[idBaoGioTrungTamChiTiet] [int] NOT NULL,
	[idBaoGioTrungTam] [int] NOT NULL,
	[TenLop] [varchar](255) NOT NULL,
	[Siso] [int] NOT NULL,
	[SoTiet] [int] NOT NULL,
	[GhiChu] [varchar](255) NULL,
 CONSTRAINT [PK_TBLBAOGIOTRUNGTAMCHITIET] PRIMARY KEY CLUSTERED 
(
	[idBaoGioTrungTamChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BoMon]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoMon](
	[idBoMon] [int] IDENTITY(1,1) NOT NULL,
	[TenBoMon] [nvarchar](55) NOT NULL,
	[idKhoa] [nvarchar](2) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_TBLBOMON] PRIMARY KEY CLUSTERED 
(
	[idBoMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CacHeSoLuong]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CacHeSoLuong](
	[idHeSoLuong] [int] IDENTITY(1,1) NOT NULL,
	[idGiaoVien] [int] NOT NULL,
	[HeSoLuong] [float] NOT NULL,
	[PhuCapChucVu] [float] NULL,
	[PhuCapNgheNghiep] [float] NULL,
	[ThoiGianBatDau] [date] NULL,
	[ThoiGianKetThuc] [date] NULL,
	[QuyetDinh] [nvarchar](200) NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_HeSoLuong] PRIMARY KEY CLUSTERED 
(
	[idHeSoLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietLoaiDeTai]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLoaiDeTai](
	[idChiTietLoaiDeTai] [int] IDENTITY(1,1) NOT NULL,
	[TenChiTietLoaiDeTai] [nchar](100) NOT NULL,
	[idLoaiDeTai] [int] NOT NULL,
 CONSTRAINT [PK_tblChiTietLoaiDeTai] PRIMARY KEY CLUSTERED 
(
	[idChiTietLoaiDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[idChucVu] [int] IDENTITY(1,1) NOT NULL,
	[TenChucVu] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TBLCHUCVU] PRIMARY KEY CLUSTERED 
(
	[idChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DinhMucTheoLoaiGiangVien]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DinhMucTheoLoaiGiangVien](
	[idDinhMucTheoLoaiGiangVien] [int] IDENTITY(1,1) NOT NULL,
	[idLoaiGiangVien] [int] NOT NULL,
	[DinhMuc] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblDinhMucTheoLoaiGiangVien] PRIMARY KEY CLUSTERED 
(
	[idDinhMucTheoLoaiGiangVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[idGiaoVien] [int] IDENTITY(1,1) NOT NULL,
	[HoTenGiaoVien] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[idNguoiDung] [int] NULL,
	[DienThoai] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[GioiTinh] [bit] NOT NULL,
 CONSTRAINT [PK_TBLGIAOVIEN] PRIMARY KEY CLUSTERED 
(
	[idGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoVienChiTiet]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVienChiTiet](
	[idGiaoVienChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[idGiaoVien] [int] NOT NULL,
	[idLoaiCongViec] [int] NOT NULL,
	[idPhongTrungTam] [int] NULL,
	[idBoMon] [int] NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[QuyetDinh] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblGiaoVienLoaiCongViec] PRIMARY KEY CLUSTERED 
(
	[idGiaoVienChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoVienChucVu]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVienChucVu](
	[IdGiaoVienChucVu] [int] IDENTITY(1,1) NOT NULL,
	[IdGiaoVien] [int] NOT NULL,
	[IdChucVu] [int] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
	[QuyetDinh] [nvarchar](200) NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_GiaoVienChucVu] PRIMARY KEY CLUSTERED 
(
	[IdGiaoVienChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoVienTrangThaiLamViec]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVienTrangThaiLamViec](
	[idGiaoVienTrangThaiLamViec] [int] IDENTITY(1,1) NOT NULL,
	[idGiaoVien] [int] NOT NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[QuyetDinh] [nvarchar](200) NULL,
	[idTrangThaiLamViec] [int] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_GiaoVienCongViecChiTiet] PRIMARY KEY CLUSTERED 
(
	[idGiaoVienTrangThaiLamViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GioChuanLyThuyet]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioChuanLyThuyet](
	[idGioChuanLyThuyet] [int] NOT NULL,
	[SiSoSinhVienMin] [int] NOT NULL,
	[SiSoSinhVienMax] [int] NOT NULL,
	[HeSoSiSo] [float] NOT NULL,
 CONSTRAINT [PK_tblGioChuanLyThuyet] PRIMARY KEY CLUSTERED 
(
	[idGioChuanLyThuyet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GioChuanNghienCuuKhoaHoc]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioChuanNghienCuuKhoaHoc](
	[idGioChuanNghienCuuKhoaHoc] [int] IDENTITY(1,1) NOT NULL,
	[GioChuanNghieCuuKhoaHoc] [float] NOT NULL,
	[idChiTietLoaiDeTai] [int] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblGioChuanNghienCuuKhoaHoc] PRIMARY KEY CLUSTERED 
(
	[idGioChuanNghienCuuKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeSoChucVu]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeSoChucVu](
	[IdHeSoChucVu] [int] IDENTITY(1,1) NOT NULL,
	[GiaTri] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
	[IdChucVu] [int] NOT NULL,
 CONSTRAINT [PK_HeSoChucVu] PRIMARY KEY CLUSTERED 
(
	[IdHeSoChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeSoSinhVien]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeSoSinhVien](
	[idHeSoSinhVien] [int] IDENTITY(1,1) NOT NULL,
	[SoNamHoc] [int] NOT NULL,
	[TiLeSinhVienMin] [int] NOT NULL,
	[TiLeSinhVienMax] [int] NOT NULL,
	[HeSoSinhVienLopHoc] [float] NULL,
 CONSTRAINT [PK_tblHeSoSinhVien] PRIMARY KEY CLUSTERED 
(
	[idHeSoSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhThucThi]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhThucThi](
	[idHinhThucThi] [int] IDENTITY(1,1) NOT NULL,
	[TenHinhThucThi] [nvarchar](50) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblHinhThucThi] PRIMARY KEY CLUSTERED 
(
	[idHinhThucThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoatDongNCKH]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoatDongNCKH](
	[idHoatDongNCKH] [int] IDENTITY(1,1) NOT NULL,
	[TenHoatDongNCKH] [nchar](80) NULL,
 CONSTRAINT [PK_tblHoatDongNCKH] PRIMARY KEY CLUSTERED 
(
	[idHoatDongNCKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKy](
	[IdHocKy] [int] IDENTITY(1,1) NOT NULL,
	[TenHocKy] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TBLHOCKY] PRIMARY KEY CLUSTERED 
(
	[IdHocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocPhan]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocPhan](
	[idHocPhan] [int] IDENTITY(1,1) NOT NULL,
	[MaHocPhan] [nvarchar](10) NOT NULL,
	[TenHocPhan] [nvarchar](100) NOT NULL,
	[SoTinChi] [int] NOT NULL,
	[ThuocHocKy] [int] NOT NULL,
	[SoTietLyThuyet] [int] NOT NULL,
	[SoTietThaoLuanThiNghiemThucHanh] [int] NOT NULL,
	[HuongDanTuHoc] [int] NULL,
	[SoGioChuanBiTuHoc] [int] NOT NULL,
	[idKhoa] [nvarchar](2) NULL,
	[idBoMon] [int] NULL,
	[idLoaiHocPhan] [int] NOT NULL,
	[idTrinhDo] [int] NOT NULL,
	[IdHinhThucThi] [int] NULL,
	[ThoiGianThi] [int] NULL,
	[CoNganHangDe] [bit] NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
	[DangThucHanh] [nvarchar](100) NOT NULL,
	[DangLyThuyet] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TBLHOCPHAN] PRIMARY KEY CLUSTERED 
(
	[idHocPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[idKhoa] [nvarchar](2) NOT NULL,
	[TenKhoa] [nvarchar](50) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_TBLKHOA] PRIMARY KEY CLUSTERED 
(
	[idKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[idKhoaHoc] [int] NOT NULL,
	[TenKhoaHoc] [varchar](255) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[SoNamHoc] [int] NOT NULL,
	[DaTotNghiep] [int] NOT NULL,
 CONSTRAINT [PK_TBLKHOAHOC] PRIMARY KEY CLUSTERED 
(
	[idKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiCongViec]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCongViec](
	[idLoaiCongViec] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiCongViec] [nchar](90) NULL,
 CONSTRAINT [PK_tblLoaiCongViec] PRIMARY KEY CLUSTERED 
(
	[idLoaiCongViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDeTai]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDeTai](
	[idLoaiDeTai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiDeTai] [nchar](100) NOT NULL,
	[idHoatDongNCKH] [int] NULL,
 CONSTRAINT [PK_tblLoaiDeTai] PRIMARY KEY CLUSTERED 
(
	[idLoaiDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHocPhan]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHocPhan](
	[idLoaiHocPhan] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiHocPhan] [nvarchar](50) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblLoaiMonHoc] PRIMARY KEY CLUSTERED 
(
	[idLoaiHocPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiQuyDinh]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiQuyDinh](
	[idLoaiQuyDinh] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiQuyDinh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBLLOAIQUYDINH] PRIMARY KEY CLUSTERED 
(
	[idLoaiQuyDinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiThucHanh]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThucHanh](
	[idLoaiThucHanh] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiThucHanh] [nvarchar](50) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblLoaiThucHanh] PRIMARY KEY CLUSTERED 
(
	[idLoaiThucHanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiThucHanhVoiKhoa]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThucHanhVoiKhoa](
	[idLoaiThucHanhVoiKhoa] [nvarchar](2) NOT NULL,
	[idKhoa] [nchar](2) NULL,
	[idLoaiThucHanh] [int] NULL,
 CONSTRAINT [PK_tblLoaiThucHanhVoiKhoa] PRIMARY KEY CLUSTERED 
(
	[idLoaiThucHanhVoiKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MienGiamTheoTrangThaiLamViec]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MienGiamTheoTrangThaiLamViec](
	[idMienGiamTheoTrangThaiLamViec] [int] IDENTITY(1,1) NOT NULL,
	[idTrangThaiLamViec] [int] NOT NULL,
	[GiaTri] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_MienGiamTheoTrangThaiGiaoVien] PRIMARY KEY CLUSTERED 
(
	[idMienGiamTheoTrangThaiLamViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NamHoc]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamHoc](
	[idNamHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenNamHoc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBLNAMHOC] PRIMARY KEY CLUSTERED 
(
	[idNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NamHocHocKy]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamHocHocKy](
	[idNamHocHocKy] [int] IDENTITY(1,1) NOT NULL,
	[idNamHoc] [int] NOT NULL,
	[idHocKy] [int] NOT NULL,
	[ThoiGianKetThuc] [date] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[SoTuan] [int] NOT NULL,
 CONSTRAINT [PK_TBLNAMHOCHOCKY] PRIMARY KEY CLUSTERED 
(
	[idNamHocHocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NghienCuuKhoaHoc]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NghienCuuKhoaHoc](
	[idDeTaiNghienCuuKhoaHoc] [int] NOT NULL,
	[TenDeTai] [varchar](255) NOT NULL,
	[LoaiDeTai] [varchar](255) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianNghiemThu] [date] NOT NULL,
	[SoGioChuan] [nchar](10) NULL,
 CONSTRAINT [PK_TBLDETAINGHIENCUUKHOAHOC] PRIMARY KEY CLUSTERED 
(
	[idDeTaiNghienCuuKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[idNguoiDung] [int] NOT NULL,
	[TenNguoiDung] [varchar](255) NOT NULL,
	[MatKhau] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[VoHieuHoa] [bit] NOT NULL,
	[SDT] [varchar](15) NULL,
 CONSTRAINT [PK_TBLNGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[idNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhiemVuBoSung]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhiemVuBoSung](
	[idNhiemVuBoSung] [int] NOT NULL,
	[idGiaoVien] [varchar](20) NOT NULL,
	[TenNhiemVu] [varchar](100) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[GioChuan] [int] NOT NULL,
	[GhiChu] [varchar](255) NULL,
	[ThoiGianKetThuc] [date] NULL,
	[idNamHocHocKy] [int] NULL,
 CONSTRAINT [PK_TBLPHANCONGNHIEMVUGIAOVIEN] PRIMARY KEY CLUSTERED 
(
	[idNhiemVuBoSung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhiemVuKhoaHoc]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhiemVuKhoaHoc](
	[idNhiemVuKhoaHoc] [int] IDENTITY(1,1) NOT NULL,
	[idNamHocHocKy] [int] NOT NULL,
	[SoGio] [float] NOT NULL,
	[idThanhVienDeTai] [int] NOT NULL,
 CONSTRAINT [PK_tblNhiemVuKhoaHoc_1] PRIMARY KEY CLUSTERED 
(
	[idNhiemVuKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanCongCoiHoiThi]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCongCoiHoiThi](
	[idPhanCongCoiHoiThi] [int] NOT NULL,
	[idBaoGioGiangDayChiTiet] [int] NOT NULL,
	[idGiaoVien] [int] NOT NULL,
	[IdNhiemVuCoiHoiThi] [int] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
	[idNamHocHocKy] [int] NULL,
 CONSTRAINT [PK_TBLNHIEMVUCOIHOITHI] PRIMARY KEY CLUSTERED 
(
	[idPhanCongCoiHoiThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanCongDayTrungTam]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCongDayTrungTam](
	[idPhanCongDayTrungTam] [int] NOT NULL,
	[idGiaoVien] [int] NOT NULL,
	[idBaoGioTrungTamChiTiet] [int] NOT NULL,
	[SoGio] [int] NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_TBLNHIEMVUDAYTRUNGTAM] PRIMARY KEY CLUSTERED 
(
	[idPhanCongDayTrungTam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanCongGiangDay]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCongGiangDay](
	[IdPhanCongGiangDay] [int] IDENTITY(1,1) NOT NULL,
	[idBaoGioGiangDayChiTiet] [int] NOT NULL,
	[idGiaoVien] [int] NOT NULL,
	[SoGioHoacTuanHoacSoNguoi] [float] NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
	[idNamHocHocKy] [int] NULL,
 CONSTRAINT [PK_TBLNHIEMVUGIANGDAY] PRIMARY KEY CLUSTERED 
(
	[IdPhanCongGiangDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[idPhanQuyen] [int] NOT NULL,
	[TenPhanQuyen] [varchar](255) NOT NULL,
 CONSTRAINT [PK_TBLPHANQUYEN] PRIMARY KEY CLUSTERED 
(
	[idPhanQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanQuyenChiTiet]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanQuyenChiTiet](
	[idPhanQuyenChiTiet] [int] NOT NULL,
	[idPhanQuyen] [int] NOT NULL,
	[Quyen] [varchar](255) NOT NULL,
 CONSTRAINT [PK_TBLPHANQUYENCHITIET] PRIMARY KEY CLUSTERED 
(
	[idPhanQuyenChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanQuyenNguoiDung]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyenNguoiDung](
	[idNguoiDung] [int] NOT NULL,
	[idPhanQuyen] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongTrungTam]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongTrungTam](
	[idPhongTrungTam] [int] IDENTITY(1,1) NOT NULL,
	[TenPhongTrungTam] [nvarchar](50) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblPhongTrungTam] PRIMARY KEY CLUSTERED 
(
	[idPhongTrungTam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinh]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinh](
	[idQuyDinh] [int] IDENTITY(1,1) NOT NULL,
	[idLoaiQuyDinh] [int] NOT NULL,
	[TenQuyDinh] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TBLQUYDINH] PRIMARY KEY CLUSTERED 
(
	[idQuyDinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhChiTiet]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhChiTiet](
	[idQuyDinhChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[idQuyDinh] [int] NOT NULL,
	[GiaTri] [float] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
	[ThoiGianBatDau] [date] NOT NULL,
 CONSTRAINT [PK_tblChiTietQuyDinh] PRIMARY KEY CLUSTERED 
(
	[idQuyDinhChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhGioChuanChamThiLyThuyet]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhGioChuanChamThiLyThuyet](
	[idQuyDinhGioChuanChamThiLyThuyet] [int] IDENTITY(1,1) NOT NULL,
	[idHinhThucThi] [int] NOT NULL,
	[ThoiGianThi] [int] NULL,
	[SoGiaoVienCham1BaiThi] [int] NOT NULL,
	[SoSinhVienTinh1GioChuanTuLuan] [int] NULL,
	[GioChuanVanDap1SinhVien] [float] NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblQuyDinhGioChuanChamThiLyThuyet] PRIMARY KEY CLUSTERED 
(
	[idQuyDinhGioChuanChamThiLyThuyet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhGioChuanCoiThiLyThuyet]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhGioChuanCoiThiLyThuyet](
	[idQuyDinhGioChuanCoiThiLyThuyet] [int] IDENTITY(1,1) NOT NULL,
	[idHinhThucThi] [int] NOT NULL,
	[SoGiaoVienMax] [int] NOT NULL,
	[GioChuanMotGiaoVien] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
	[SoSinhVienMin] [int] NOT NULL,
	[SoSinhVienMax] [int] NOT NULL,
 CONSTRAINT [PK_tblQuyDinhGioChuanCoiThiLyThuyet] PRIMARY KEY CLUSTERED 
(
	[idQuyDinhGioChuanCoiThiLyThuyet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhGioChuanRaDe]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhGioChuanRaDe](
	[idQuyDinhGioChuanRaDe] [int] IDENTITY(1,1) NOT NULL,
	[idHinhThuThi] [int] NOT NULL,
	[GioChuan1De] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
	[ThoiGianThi] [int] NULL,
 CONSTRAINT [PK_tblQuyDinhGioChuanRaDe] PRIMARY KEY CLUSTERED 
(
	[idQuyDinhGioChuanRaDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhGioChuanThucHanh]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhGioChuanThucHanh](
	[TenNoiDungGiangDay] [nvarchar](100) NOT NULL,
	[idQuyDinhGioChuanThucHanh] [int] IDENTITY(1,1) NOT NULL,
	[idKhoa] [nvarchar](2) NOT NULL,
	[CanDuoi] [int] NOT NULL,
	[CanTren] [int] NOT NULL,
	[SoGioChuan] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblGioChuanThucHanh] PRIMARY KEY CLUSTERED 
(
	[idQuyDinhGioChuanThucHanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhGioChuanThucHanhBoSung]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhGioChuanThucHanhBoSung](
	[idQuyDinhGioChuanThucHanhBoSung] [int] IDENTITY(1,1) NOT NULL,
	[idKhoa] [nvarchar](2) NOT NULL,
	[GioChuanMotSinhVien] [float] NOT NULL,
	[SinhVienToiDaDuocTinh] [int] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblQuyDinhGioChuanThucHanhBoSung] PRIMARY KEY CLUSTERED 
(
	[idQuyDinhGioChuanThucHanhBoSung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhSiSoLopHocPhan]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhSiSoLopHocPhan](
	[idQuyDinhSiSoLopHocPhanLyThuyet] [int] IDENTITY(1,1) NOT NULL,
	[CanDuoi] [int] NOT NULL,
	[CanTren] [int] NOT NULL,
	[HeSoSiSo] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
	[DangHocPhan] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_QuyDinhSiSoLopHocPhanLyThuyet] PRIMARY KEY CLUSTERED 
(
	[idQuyDinhSiSoLopHocPhanLyThuyet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhVeHuongDanDoAn]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhVeHuongDanDoAn](
	[idQuyDinhVeHuongDanDoAn] [int] IDENTITY(1,1) NOT NULL,
	[idLoaiHocPhan] [int] NOT NULL,
	[SoSinhVienToiDaTrongKy] [int] NOT NULL,
	[SoGioChuanChoMotSinhVien] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblQuyDinhVeHuongDanDoAn] PRIMARY KEY CLUSTERED 
(
	[idQuyDinhVeHuongDanDoAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhVienDeTai]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVienDeTai](
	[idThanhVienDeTai] [int] IDENTITY(1,1) NOT NULL,
	[idGiaoVien] [int] NOT NULL,
	[LaChuBien] [bit] NOT NULL,
	[TinhGio] [bit] NOT NULL,
	[idDeTaiNghienCuuKhoaHoc] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
 CONSTRAINT [PK_TBLNHIEMVUKHOAHOC] PRIMARY KEY CLUSTERED 
(
	[idThanhVienDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongKeSinhVienThuocKhoa]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKeSinhVienThuocKhoa](
	[idThongKeSinhVienThuocKhoa] [int] NOT NULL,
	[idKhoa] [int] NOT NULL,
	[SoSinhVien] [int] NOT NULL,
	[idNamHocHocKy] [int] NOT NULL,
 CONSTRAINT [PK_TBLTHONGKESINHVIENTHUOCKHOA] PRIMARY KEY CLUSTERED 
(
	[idThongKeSinhVienThuocKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhGioTrungTam]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhGioTrungTam](
	[idTinhGioTrungTam] [int] IDENTITY(1,1) NOT NULL,
	[idNhiemVuDayTrungTam] [int] NULL,
	[SoGio] [float] NULL,
	[idNamHocHocKy] [int] NULL,
 CONSTRAINT [PK_tblTinhGioTrungTam] PRIMARY KEY CLUSTERED 
(
	[idTinhGioTrungTam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrangThaiLamViec]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiLamViec](
	[idTrangThaiLamViec] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThaiLamViec] [nvarchar](200) NULL,
 CONSTRAINT [PK_TrangThaiLamViecGiaoVien] PRIMARY KEY CLUSTERED 
(
	[idTrangThaiLamViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrinhDo]    Script Date: 27/12/2021 8:57:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDo](
	[idTrinhDo] [int] IDENTITY(1,1) NOT NULL,
	[TenTrinhDo] [nvarchar](50) NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_tblTrinhDo] PRIMARY KEY CLUSTERED 
(
	[idTrinhDo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BaoGioGiangDay] ON 

INSERT [dbo].[BaoGioGiangDay] ([idBaoGioGiangDay], [TenPhanCongGiangDay], [IdNamHocHocKy], [ThoiGianBatDau], [ThoiGianKetThuc], [TenTepBaoGio]) VALUES (6, N'Báo giờ kỳ 1 năm học 2020 - 2021', 12, CAST(N'2021-09-19 15:42:35.947' AS DateTime), CAST(N'2021-09-19 15:42:00.000' AS DateTime), N'BGGD_Học_kỳ_1_2019-2020.xlsx')
SET IDENTITY_INSERT [dbo].[BaoGioGiangDay] OFF
SET IDENTITY_INSERT [dbo].[BaoGioGiangDayChiTiet] ON 

INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (4, 6, 2164, N'An toàn và bảo dưỡng công nghiệp-1-21(ĐH14.01)', 4, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (6, 6, 2329, N'Tổ chức quản lý sản xuất-1-21(ĐH15.01)', 42, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (8, 6, 2329, N'Tổ chức quản lý sản xuất-1-21(ĐH15.03)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (9, 6, 2329, N'Tổ chức quản lý sản xuất-1-21(ĐH15.04)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (10, 6, 2329, N'Tổ chức quản lý sản xuất-1-21(ĐH15.05)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (11, 6, 2329, N'Tổ chức quản lý sản xuất-1-21(ĐH15.06)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (12, 6, 2297, N'Kinh tế học vi mô-1-21(ĐH15.01)', 30, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (13, 6, 2176, N'Toán chuyên đề 1-1-21(ĐL14.01)', 28, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (14, 6, 2434, N'Toán chuyên đề 3-1-21(ĐL14.01)', 28, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (15, 6, 2244, N'Đồ án kỹ thuật cơ khí-1-21(ĐL14.01)', 8, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (16, 6, 2251, N'Công nghệ gia công áp lực-1-21(ĐL14.01)', 8, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (17, 6, 2249, N'Kiểm tra chất lượng mối hàn-1-21(ĐL14.01)', 8, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (18, 6, 2243, N'Tay máy và Robot công nghiệp-1-21(ĐL14.01)', 8, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (19, 6, 2247, N'Thực hành hàn MIG/MAG-1-21(ĐL14.01)', 8, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (20, 6, 2250, N'Thực hành hàn hồ quang que hàn thuốc bọc liên kết góc-1-21(ĐL14.01)', 8, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (21, 6, 2221, N'Đồ án chuyên môn ô tô-1-21(ĐL14.01)', 13, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (22, 6, 2219, N'Chẩn đoán trạng thái kỹ thuật ô tô-1-21(ĐL14.01)', 13, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (23, 6, 2213, N'Hộp số tự động-1-21(ĐL14.01)', 13, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (24, 6, 2435, N'Vật liệu điện - Khí cụ điện-1-21(ĐH15.02)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (25, 6, 2210, N'Hệ thống kiểm soát khí xả-1-21(ĐL14.01)', 13, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (26, 6, 2435, N'Vật liệu điện - Khí cụ điện-1-21(ĐH15.01)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (27, 6, 2436, N'Mạch điện 1-1-21(ĐH15.01)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (28, 6, 2299, N'Tư tưởng Hồ Chí Minh-1-21(ĐH15.01)', 42, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (29, 6, 2299, N'Tư tưởng Hồ Chí Minh-1-21(ĐH15.02)', 43, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (30, 6, 2299, N'Tư tưởng Hồ Chí Minh-1-21(ĐH15.03)', 58, 2, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (31, 6, 2299, N'Tư tưởng Hồ Chí Minh-1-21(ĐH15.04)', 58, 2, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (32, 6, 2299, N'Tư tưởng Hồ Chí Minh-1-21(ĐH15.05)', 59, 2, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (33, 6, 2299, N'Tư tưởng Hồ Chí Minh-1-21(ĐH15.06)', 59, 2, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (34, 6, 2308, N'Tâm lý học-1-21(ĐH15.01)', 42, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (35, 6, 2308, N'Tâm lý học-1-21(ĐH15.02)', 43, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (36, 6, 2308, N'Tâm lý học-1-21(ĐH15.03)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (37, 6, 2308, N'Tâm lý học-1-21(ĐH15.04)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (38, 6, 2308, N'Tâm lý học-1-21(ĐH15.05)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (39, 6, 2308, N'Tâm lý học-1-21(ĐH15.06)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (40, 6, 2135, N'Cơ lý thuyết-1-21(ĐH15.01)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (41, 6, 2135, N'Cơ lý thuyết-1-21(ĐH15.02)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (42, 6, 2137, N'Hình họa - Vẽ kỹ thuật 1-1-21(ĐH15.01)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (43, 6, 2137, N'Hình họa - Vẽ kỹ thuật 1-1-21(ĐH15.02)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (44, 6, 2136, N'Vật liệu kỹ thuật 1-1-21(ĐH15.01)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (45, 6, 2136, N'Vật liệu kỹ thuật 1-1-21(ĐH15.02)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (46, 6, 2331, N'Cơ sở dữ liệu quan hệ-1-21(ĐH15.01)', 55, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (47, 6, 2436, N'Mạch điện 1-1-21(ĐH15.02)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (48, 6, 2465, N'Chủ nghĩa xã hội khoa học-1-21(ĐH15.06)', 59, 2, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (49, 6, 2211, N'Hệ thống phun dầu điện tử-1-21(ĐL14.01)', 13, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (50, 6, 2222, N'Tính toán động cơ ô tô-1-21(ĐL14.01)', 13, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (51, 6, 2382, N'Thực hành vi điều khiển-1-21(ĐL14.01)', 28, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (52, 6, 2329, N'Tổ chức quản lý sản xuất-1-21(ĐL14.01)', 49, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (53, 6, 2420, N'Thực hành kế toán máy-1-21(ĐL14.01)', 29, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (54, 6, 2420, N'Thực hành kế toán máy-1-21(ĐL14.02)', 29, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (55, 6, 2420, N'Thực hành kế toán máy-1-21(ĐL14.03)', 30, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (56, 6, 2419, N'Thực tập cơ sở-1-21(ĐL14.01)', 88, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (57, 6, 2417, N'Thực hành kế toán thuế-1-21(ĐL14.01)', 29, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (58, 6, 2417, N'Thực hành kế toán thuế-1-21(ĐL14.02)', 29, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (59, 6, 2417, N'Thực hành kế toán thuế-1-21(ĐL14.03)', 30, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (60, 6, 2414, N'Bảo hiểm-1-21(ĐL14.01)', 29, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (61, 6, 2414, N'Bảo hiểm-1-21(ĐL14.02)', 29, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (62, 6, 2414, N'Bảo hiểm-1-21(ĐL14.03)', 30, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (63, 6, 2413, N'Quản trị tài chính-1-21(ĐL14.01)', 29, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (64, 6, 2413, N'Quản trị tài chính-1-21(ĐL14.02)', 29, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (65, 6, 2413, N'Quản trị tài chính-1-21(ĐL14.03)', 30, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (66, 6, 2418, N'Thực hành kế toán doanh nghiệp thương mại, dịch vụ và xây lắp-1-21(ĐL14.01)', 26, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (67, 6, 2418, N'Thực hành kế toán doanh nghiệp thương mại, dịch vụ và xây lắp-1-21(ĐL14.02)', 26, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (68, 6, 2418, N'Thực hành kế toán doanh nghiệp thương mại, dịch vụ và xây lắp-1-21(ĐL14.03)', 27, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (69, 6, 2416, N'Thực hành kế toán quản trị-1-21(ĐL14.01)', 26, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (70, 6, 2399, N'Thực hành trang bị điện, điện tử công nghiệp-1-21(ĐL14.01)', 28, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (71, 6, 2212, N'Hệ thống treo điều khiển điện tử-1-21(ĐL14.01)', 13, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (72, 6, 2401, N'Hệ thống kiểm soát an ninh, an toàn-1-21(ĐL14.01)', 28, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (73, 6, 2272, N'Thực hành phát triển phần mềm-1-21(ĐL14.03)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (74, 6, 2102, N'Dao động kỹ thuật-1-21(ĐL14.01)', 21, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (75, 6, 2334, N'Thực hành phát triển ứng dụng web-1-21(ĐL14.01)', 23, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (76, 6, 2334, N'Thực hành phát triển ứng dụng web-1-21(ĐL14.02)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (77, 6, 2334, N'Thực hành phát triển ứng dụng web-1-21(ĐL14.03)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (78, 6, 2334, N'Thực hành phát triển ứng dụng web-1-21(ĐL14.04)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (79, 6, 2271, N'Thực hành kiểm thử và triển khai phần mềm-1-21(ĐL14.01)', 23, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (80, 6, 2271, N'Thực hành kiểm thử và triển khai phần mềm-1-21(ĐL14.02)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (81, 6, 2271, N'Thực hành kiểm thử và triển khai phần mềm-1-21(ĐL14.03)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (82, 6, 2271, N'Thực hành kiểm thử và triển khai phần mềm-1-21(ĐL14.04)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (83, 6, 2277, N'Thực hành thiết kế, quản trị và bảo trì hệ thống mạng-1-21(ĐL14.01)', 23, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (84, 6, 2277, N'Thực hành thiết kế, quản trị và bảo trì hệ thống mạng-1-21(ĐL14.02)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (85, 6, 2277, N'Thực hành thiết kế, quản trị và bảo trì hệ thống mạng-1-21(ĐL14.03)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (86, 6, 2277, N'Thực hành thiết kế, quản trị và bảo trì hệ thống mạng-1-21(ĐL14.04)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (87, 6, 2273, N'Thực hành phân tích thiết kế hệ thống thông tin-1-21(ĐL14.01)', 23, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (88, 6, 2273, N'Thực hành phân tích thiết kế hệ thống thông tin-1-21(ĐL14.02)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (89, 6, 2273, N'Thực hành phân tích thiết kế hệ thống thông tin-1-21(ĐL14.03)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (90, 6, 2273, N'Thực hành phân tích thiết kế hệ thống thông tin-1-21(ĐL14.04)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (91, 6, 2272, N'Thực hành phát triển phần mềm-1-21(ĐL14.01)', 23, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (92, 6, 2272, N'Thực hành phát triển phần mềm-1-21(ĐL14.02)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (93, 6, 2272, N'Thực hành phát triển phần mềm-1-21(ĐL14.04)', 24, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (94, 6, 2416, N'Thực hành kế toán quản trị-1-21(ĐL14.02)', 26, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (95, 6, 2465, N'Chủ nghĩa xã hội khoa học-1-21(ĐH15.05)', 59, 2, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (96, 6, 2465, N'Chủ nghĩa xã hội khoa học-1-21(ĐH15.03)', 58, 2, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (97, 6, 2077, N'Vật liệu kỹ thuật 2-1-21(ĐH14.01)', 43, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (98, 6, 2077, N'Vật liệu kỹ thuật 2-1-21(ĐH14.02)', 43, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (99, 6, 2344, N'Lập trình Java nâng cao-1-21(ĐH14.01)', 26, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (100, 6, 2341, N'Lập trình Web-1-21(ĐH14.01)', 26, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (101, 6, 2345, N'Mạng máy tính-1-21(ĐH14.01)', 26, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (102, 6, 2342, N'Phân tích thiết kế hệ thống thông tin-1-21(ĐH14.01)', 26, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (103, 6, 2343, N'Phát triển ứng dụng trên thiết bị di động-1-21(ĐH14.01)', 26, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (104, 6, 2120, N'Bảo vệ hệ thống điện-1-21(ĐH14.01)', 1, 0, NULL, NULL, NULL, N'S', NULL)
GO
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (105, 6, 2375, N'Cung cấp điện-1-21(ĐH14.01)', 33, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (106, 6, 2375, N'Cung cấp điện-1-21(ĐH14.02)', 34, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (107, 6, 2370, N'Thực hành điện cơ bản-1-21(ĐH14.01)', 22, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (108, 6, 2370, N'Thực hành điện cơ bản-1-21(ĐH14.02)', 22, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (109, 6, 2370, N'Thực hành điện cơ bản-1-21(ĐH14.03)', 23, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (110, 6, 2165, N'Đo lường điện và thiết bị đo-1-21(ĐH14.01)', 4, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (111, 6, 2371, N'Thực hành đo lường điện và thiết bị đo-1-21(ĐH14.01)', 22, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (112, 6, 2371, N'Thực hành đo lường điện và thiết bị đo-1-21(ĐH14.02)', 22, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (113, 6, 2371, N'Thực hành đo lường điện và thiết bị đo-1-21(ĐH14.03)', 23, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (114, 6, 2374, N'Điện tử công suất-1-21(ĐH14.01)', 33, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (115, 6, 2374, N'Điện tử công suất-1-21(ĐH14.02)', 34, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (116, 6, 2163, N'Truyền động thủy lực và khí nén-1-21(ĐH14.01)', 4, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (117, 6, 2369, N'Thực hành điện tử cơ bản - xung số-1-21(ĐH14.01)', 22, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (118, 6, 2071, N'Thực hành tiện cơ bản 1-1-21(ĐH14.01)', 16, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (119, 6, 2090, N'Nguyên lý động cơ đốt trong-1-21(ĐH14.02)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (120, 6, 2159, N'Công nghệ CAD/CAM-1-21(ĐH14.01)', 4, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (121, 6, 2153, N'Kỹ thuật CAD/CAM-1-21(ĐH14.01)', 40, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (122, 6, 2160, N'Vẽ và thiết kế trên máy tính-1-21(ĐH14.01)', 4, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (123, 6, 2072, N'Công nghệ chế tạo máy-1-21(ĐH14.01)', 16, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (124, 6, 2076, N'Công nghệ kim loại-1-21(ĐH14.01)', 43, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (125, 6, 2076, N'Công nghệ kim loại-1-21(ĐH14.02)', 43, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (126, 6, 2087, N'Công nghệ mới cho xe ô tô-1-21(ĐH14.01)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (127, 6, 2089, N'Hệ thống điện động cơ-1-21(ĐH14.01)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (128, 6, 2089, N'Hệ thống điện động cơ-1-21(ĐH14.02)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (129, 6, 2088, N'Kết cấu động cơ đốt trong-1-21(ĐH14.01)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (130, 6, 2088, N'Kết cấu động cơ đốt trong-1-21(ĐH14.02)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (131, 6, 2091, N'Lý thuyết ô tô-1-21(ĐH14.01)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (132, 6, 2091, N'Lý thuyết ô tô-1-21(ĐH14.02)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (133, 6, 2073, N'Máy‎ cắt kim loại đại cương-1-21(ĐH14.01)', 16, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (134, 6, 2074, N'Nguyên lý cắt gọt kim loại-1-21(ĐH14.01)', 16, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (135, 6, 2167, N'Nguyên lý - chi tiết máy-1-21(ĐH14.01)', 4, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (136, 6, 2075, N'Nguyên lý - chi tiết máy 2-1-21(ĐH14.01)', 43, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (137, 6, 2075, N'Nguyên lý - chi tiết máy 2-1-21(ĐH14.02)', 43, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (138, 6, 2090, N'Nguyên lý động cơ đốt trong-1-21(ĐH14.01)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (139, 6, 2086, N'Động cơ ô tô và môi trường-1-21(ĐH14.01)', 35, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (140, 6, 2465, N'Chủ nghĩa xã hội khoa học-1-21(ĐH15.04)', 58, 2, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (141, 6, 2369, N'Thực hành điện tử cơ bản - xung số-1-21(ĐH14.02)', 22, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (142, 6, 2372, N'Kỹ thuật mạch điện tử-1-21(ĐH14.01)', 26, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (143, 6, 2209, N'Tiếng anh kỹ thuật cơ khí-1-21(ĐH15.01)', 14, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (144, 6, 2138, N'Tiếng anh chế tạo máy-1-21(ĐH15.01)', 25, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (145, 6, 2437, N'Tiếng anh điện-1-21(ĐH15.01)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (146, 6, 2437, N'Tiếng anh điện-1-21(ĐH15.02)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (147, 6, 2298, N'Tiếng anh Kinh tế-1-21(ĐH15.01)', 30, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (148, 6, 2092, N'Tiếng anh ô tô-1-21(ĐH15.01)', 38, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (149, 6, 2092, N'Tiếng anh ô tô-1-21(ĐH15.02)', 39, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (150, 6, 2310, N'Tiếng anh Công nghệ thông tin-1-21(ĐH15.01)', 55, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (151, 6, 2176, N'Toán chuyên đề 1-1-21(ĐH15.01)', 42, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (152, 6, 2176, N'Toán chuyên đề 1-1-21(ĐH15.02)', 43, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (153, 6, 2176, N'Toán chuyên đề 1-1-21(ĐH15.03)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (154, 6, 2176, N'Toán chuyên đề 1-1-21(ĐH15.04)', 58, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (155, 6, 2176, N'Toán chuyên đề 1-1-21(ĐH15.05)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (156, 6, 2176, N'Toán chuyên đề 1-1-21(ĐH15.06)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (157, 6, 2354, N'Toán chuyên đề 2-1-21(ĐH15.01)', 55, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (158, 6, 2434, N'Toán chuyên đề 3-1-21(ĐH15.01)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (159, 6, 2434, N'Toán chuyên đề 3-1-21(ĐH15.02)', 59, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (160, 6, 2465, N'Chủ nghĩa xã hội khoa học-1-21(ĐH15.01)', 42, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (161, 6, 2465, N'Chủ nghĩa xã hội khoa học-1-21(ĐH15.02)', 43, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (162, 6, 2353, N'Giáo dục thể chất 4-1-21(ĐH15.03)', 54, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (163, 6, 2369, N'Thực hành điện tử cơ bản - xung số-1-21(ĐH14.03)', 23, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (164, 6, 2353, N'Giáo dục thể chất 4-1-21(ĐH15.02)', 53, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (165, 6, 2332, N'Giáo dục thể chất 3-1-21(ĐH15.03)', 53, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (166, 6, 2133, N'Kỹ thuật điện tử-1-21(ĐH14.01)', 4, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (167, 6, 2373, N'Ngôn ngữ lập trình-1-21(ĐH14.01)', 26, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (168, 6, 2161, N'Thực hành điện cơ bản-1-21(ĐH14.01)', 4, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (169, 6, 2391, N'Truyền động điện-1-21(ĐH14.01)', 41, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (170, 6, 2162, N'Truyền động điện-1-21(ĐH14.01)', 4, 1, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (171, 6, 2376, N'Vi xử lý-1-21(ĐH14.01)', 33, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (172, 6, 2376, N'Vi xử lý-1-21(ĐH14.01)', 34, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (174, 6, 2282, N'Kế toán doanh nghiệp thương mại, dịch vụ và xây lắp-1-21(ĐH14.01)', 10, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (175, 6, 2431, N'Kinh tế quốc tế-1-21(ĐH14.01)', 3, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (177, 6, 2408, N'Nghiên cứu khách hàng-1-21(ĐH14.01)', 3, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (178, 6, 2409, N'Quản trị chiến lược-1-21(ĐH14.01)', 3, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (179, 6, 2429, N'Quản trị tác nghiệp-1-21(ĐH14.01)', 3, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (181, 6, 2277, N'Thực hành kế toán tài chính 1-1-21(ĐH14.01)', 10, 0, NULL, NULL, NULL, N'S', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (183, 6, 2332, N'Giáo dục thể chất 3-1-21(ĐH15.01)', 53, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (184, 6, 2332, N'Giáo dục thể chất 3-1-21(ĐH15.02)', 53, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (185, 6, 2353, N'Giáo dục thể chất 4-1-21(ĐH15.01)', 53, 0, NULL, NULL, NULL, N'C', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (186, 6, 2416, N'Thực hành kế toán quản trị-1-21(ĐL14.03)', 27, 0, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet], [idBaoGioGiangDay], [idHocPhan], [TenLopHocPhan], [SiSo], [SoNhom], [PhongThi], [NgayThi], [CaThi], [GhiChu], [IdBaoGioCoiHoiThi]) VALUES (188, 6, 2056, N'Triết học Mác - Lênin ndfg', 19, 2, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BaoGioGiangDayChiTiet] OFF
SET IDENTITY_INSERT [dbo].[BoMon] ON 

INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (135, N'Giáo dục Thể chất', N'01', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (136, N'Tiếng Anh', N'01', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (137, N'Khoa học cơ bản', N'01', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (138, N'Kỹ thuật Cơ khí', N'04', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (139, N'Cơ khí - Chế tạo máy', N'04', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (140, N'Máy tính', N'05', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (141, N'Công nghệ Thông Tin', N'05', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (142, N'Điện - Điện tử', N'06', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (143, N'Nhiệt lạnh', N'06', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (144, N'Điều khiển - Tự động hóa', N'06', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (145, N'Kế toán', N'07', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (146, N'Quản trị Kinh doanh', N'07', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (148, N'Cơ khí động lực', N'04', CAST(N'2021-09-23' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (149, N'Lý luận chính trị', N'01', CAST(N'2019-01-01' AS Date), NULL)
INSERT [dbo].[BoMon] ([idBoMon], [TenBoMon], [idKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (150, N'Sư phạm Kỹ thuật', N'03', CAST(N'2019-01-01' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[BoMon] OFF
SET IDENTITY_INSERT [dbo].[CacHeSoLuong] ON 

INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (670, 670, 6.2, 1, 1.871999979019165, CAST(N'2019-11-11' AS Date), NULL, N'670_670_29-09-2021_1.jpg 670_670_29-09-2021_2.jpg', N'Xác nhận')
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (671, 889, 3.9900000095367432, 0, 0, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (672, 890, 3.9900000095367432, 0, 0.59899997711181641, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (673, 758, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (674, 866, 3.9900000095367432, 0.30000001192092896, 0.64399999380111694, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (675, 757, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (676, 878, 3.9900000095367432, 0, 0.27900001406669617, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (677, 865, 3.6600000858306885, 0, 0, CAST(N'2019-11-24' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (678, 756, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (679, 850, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-25' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (680, 839, 3.9900000095367432, 0.30000001192092896, 0.64399999380111694, CAST(N'2019-11-26' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (681, 755, 3.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (682, 840, 3.9900000095367432, 0, 0.59899997711181641, CAST(N'2019-11-27' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (683, 726, 3.9900000095367432, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (684, 759, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (685, 841, 3.9900000095367432, 0, 0.51899999380111694, CAST(N'2019-11-28' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (686, 752, 4.320000171661377, 0.5, 0.72299998998641968, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (687, 843, 3.9900000095367432, 0, 0.51899999380111694, CAST(N'2019-11-30' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (688, 844, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-12-01' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (689, 725, 3.6500000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (690, 845, 3.6600000858306885, 0, 0, CAST(N'2019-12-02' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (691, 846, 3.6600000858306885, 0, 0, CAST(N'2019-12-03' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (692, 696, 2.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (693, 847, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-12-04' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (694, 848, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-12-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (695, 694, 2.8599998950958252, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (696, 849, 3.6600000858306885, 0, 0.40299999713897705, CAST(N'2019-12-06' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (697, 851, 3.9900000095367432, 0.30000001192092896, 0.30000001192092896, CAST(N'2019-12-07' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (698, 693, 2.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (699, 842, 3.9900000095367432, 0, 0.59899997711181641, CAST(N'2019-11-29' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (700, 888, 4.4000000953674316, 0.5, 0.73500001430511475, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (701, 760, 3.9900000095367432, 0, 0.43900001049041748, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (702, 887, 4.6500000953674316, 0, 0.69800001382827759, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (703, 771, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (704, 869, 3.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (705, 770, 3.6500000953674316, 0, 0, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (706, 870, 3.6500000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (707, 871, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (708, 769, 4.4000000953674316, 0.40000000596046448, 0.72000002861022949, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (709, 872, 3.0299999713897705, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (710, 873, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (711, 768, 3.9900000095367432, 0, 0.59899997711181641, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (712, 874, 4.4000000953674316, 0.30000001192092896, 1.0809999704360962, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (713, 779, 3.9900000095367432, 0, 0.55900001525878906, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (714, 875, 4.9800000190734863, 0, 1.2450000047683716, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (715, 876, 4.9800000190734863, 0, 0.94099998474121094, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (716, 767, 4.4000000953674316, 0.40000000596046448, 0.527999997138977, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (717, 877, 3.6600000858306885, 0.30000001192092896, 0.47499999403953552, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (718, 698, 3.3299999237060547, 0.30000001192092896, 0.36300000548362732, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (719, 879, 3.3299999237060547, 0, 0.36599999666213989, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (720, 891, 3.3299999237060547, 0, 0.36599999666213989, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (721, 764, 3.3299999237060547, 0, 0, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (722, 880, 3.059999942779541, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (723, 881, 3.3299999237060547, 0, 0, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (724, 763, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (725, 882, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (726, 883, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (727, 762, 6.440000057220459, 0, 2.190000057220459, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (728, 884, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (729, 885, 3.9900000095367432, 0, 0.71799999475479126, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (730, 761, 3.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (731, 886, 4.9800000190734863, 0, 1.2259999513626099, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (732, 863, 3.6600000858306885, 0, 0.40299999713897705, CAST(N'2019-12-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (733, 868, 4.6500000953674316, 0.40000000596046448, 0.75800001621246338, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (734, 692, 3.6600000858306885, 0.40000000596046448, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (735, 853, 3.6600000858306885, 0, 0, CAST(N'2019-12-10' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (736, 679, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (737, 706, 3.6600000858306885, 0.30000001192092896, 0.51499998569488525, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (738, 678, 3.6600000858306885, 0, 0.47600001096725464, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (739, 707, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (740, 677, 3.6600000858306885, 0, 0, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (741, 708, 3.6600000858306885, 0.30000001192092896, 0.47499999403953552, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (742, 676, 3.6600000858306885, 0, 0, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (743, 709, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (744, 711, 4.9800000190734863, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (745, 675, 3.9900000095367432, 0.40000000596046448, 0.57099997997283936, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (746, 723, 4.9800000190734863, 0.5, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (747, 674, 3.3299999237060547, 0, 0, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (748, 712, 4.320000171661377, 0.40000000596046448, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (749, 705, 3.6600000858306885, 0.30000001192092896, 0.47499999403953552, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (750, 673, 3.3299999237060547, 0, 0.36599999666213989, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (751, 714, 3.9900000095367432, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (752, 672, 3.6600000858306885, 0, 0.47600001096725464, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (753, 715, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (754, 716, 3.6600000858306885, 0.30000001192092896, 0.27700001001358032, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (755, 671, 3.6500000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (756, 717, 3.3299999237060547, 0.40000000596046448, 0.37299999594688416, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (757, 682, 3.9900000095367432, 0.40000000596046448, 0.57099997997283936, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (758, 718, 3.6600000858306885, 0, 0.36599999666213989, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (759, 697, 3, 0, 0.18000000715255737, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (760, 719, 3.3299999237060547, 0.40000000596046448, 0.37299999594688416, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (761, 710, 3, 0, 0.18000000715255737, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (762, 720, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (763, 721, 3.3299999237060547, 0, 0.23299999535083771, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (764, 713, 3.9900000095367432, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (765, 704, 3.6500000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (766, 680, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (767, 703, 3.9900000095367432, 0, 0.59899997711181641, CAST(N'2019-11-24' AS Date), CAST(N'2020-11-11' AS Date), NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (768, 691, 4.9800000190734863, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (769, 854, 3.6600000858306885, 0, 0, CAST(N'2019-12-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (770, 855, 4.4000000953674316, 0.40000000596046448, 0.62400001287460327, CAST(N'2019-12-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (771, 690, 5.0799999237060547, 0.40000000596046448, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (772, 856, 5.7600002288818359, 0.5, 1.815000057220459, CAST(N'2019-12-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (773, 689, 3.6600000858306885, 0.40000000596046448, 0.527999997138977, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (774, 857, 2.8599998950958252, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (775, 688, 3.6500000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (776, 858, 3.6500000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (777, 859, 3.6600000858306885, 0.40000000596046448, 0, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (778, 687, 3.9900000095367432, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (779, 860, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (780, 686, 3.9900000095367432, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (781, 861, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (782, 862, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (783, 685, 2.2599999904632568, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (784, 782, 3.3299999237060547, 0, 0, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (785, 836, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-17' AS Date), CAST(N'2020-11-11' AS Date), NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (786, 684, 1.8999999761581421, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (787, 781, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-18' AS Date), CAST(N'2020-11-11' AS Date), NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (788, 892, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (789, 724, 3.3299999237060547, 0, 0, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (790, 699, 3.3299999237060547, 0, 0.20000000298023224, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (791, 695, 3.9900000095367432, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (792, 700, 2.6700000762939453, 0, 0, CAST(N'2019-11-21' AS Date), CAST(N'2020-11-11' AS Date), NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (793, 701, 3.3299999237060547, 0.30000001192092896, 0.43599998950958252, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (794, 683, 3.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (795, 702, 4.320000171661377, 0.40000000596046448, 0.80199998617172241, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (796, 681, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (797, 852, 3.3299999237060547, 0, 0, CAST(N'2019-12-09' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (798, 867, 3.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (799, 765, 4.4000000953674316, 0.5, 0.63700002431869507, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (800, 734, 2.4000000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (801, 751, 5.7600002288818359, 0.5, 1.815000057220459, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (802, 830, 3.6600000858306885, 0, 0, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (803, 739, 2.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (804, 831, 3, 0, 0, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (805, 832, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (806, 737, 3.6600000858306885, 0.40000000596046448, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (807, 833, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-24' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (808, 834, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-25' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (809, 736, 3.9900000095367432, 0.5, 0.7630000114440918, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (810, 810, 3.6600000858306885, 0.30000001192092896, 0.47499999403953552, CAST(N'2019-11-26' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (811, 735, 2.6600000858306885, 0, 0, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (812, 822, 5.4200000762939453, 0, 1.3009999990463257, CAST(N'2019-11-27' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (813, 829, 3.9900000095367432, 0.30000001192092896, 0.55800002813339233, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (814, 809, 3.3299999237060547, 0, 0.30000001192092896, CAST(N'2019-11-28' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (815, 794, 3.3299999237060547, 0, 0, CAST(N'2019-11-29' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (816, 783, 3.3299999237060547, 0, 0.23299999535083771, CAST(N'2019-11-30' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (817, 733, 2.4000000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (818, 784, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-12-01' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (819, 785, 3.3299999237060547, 0, 0.36599999666213989, CAST(N'2019-12-02' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (820, 732, 2.0799999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (821, 786, 3.3299999237060547, 0, 0.23299999535083771, CAST(N'2019-12-03' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (822, 787, 3.3299999237060547, 0.30000001192092896, 0.36300000548362732, CAST(N'2019-12-04' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (823, 731, 2.940000057220459, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (824, 788, 3.3299999237060547, 0.30000001192092896, 0.36300000548362732, CAST(N'2019-12-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (825, 730, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (826, 789, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-12-06' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (827, 772, 2.6700000762939453, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (828, 740, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (829, 828, 3.9900000095367432, 0.30000001192092896, 0.55800002813339233, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (830, 741, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (831, 780, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (832, 811, 4.4000000953674316, 0.800000011920929, 0.77999997138977051, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (833, 750, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (834, 812, 3.3299999237060547, 0, 0.30000001192092896, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (835, 813, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (836, 749, 3.6600000858306885, 0.40000000596046448, 0.28400000929832458, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (837, 814, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (838, 815, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (839, 748, 2.6700000762939453, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (840, 816, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (841, 817, 3.3299999237060547, 0, 0.23299999535083771, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (842, 747, 2.6700000762939453, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (843, 818, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (844, 819, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (845, 746, 3.0299999713897705, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (846, 820, 3.3399999141693115, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (847, 821, 3.3299999237060547, 0, 0, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (848, 745, 3, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (849, 823, 3.9900000095367432, 0.40000000596046448, 0.6589999794960022, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (850, 744, 3.0299999713897705, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (851, 835, 3.9900000095367432, 0, 0.59899997711181641, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (852, 824, 3.6600000858306885, 0.30000001192092896, 0.43599998950958252, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (853, 743, 3, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (854, 825, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (855, 742, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (856, 826, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (857, 827, 3.9900000095367432, 0.40000000596046448, 0.57099997997283936, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (858, 729, 2.4000000953674316, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (859, 790, 3.3299999237060547, 0, 0.33300000429153442, CAST(N'2019-12-07' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (860, 722, 3.3299999237060547, 0, 0.36599999666213989, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (861, 753, 3.059999942779541, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (862, 796, 3.9900000095367432, 0, 0.51899999380111694, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (863, 774, 4.9800000190734863, 0.5, 1.6679999828338623, CAST(N'2019-11-12' AS Date), CAST(N'2021-10-01' AS Date), NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (864, 797, 4.9800000190734863, 0.30000001192092896, 1.0219999551773071, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (865, 806, 3.6600000858306885, 0, 0.43900001049041748, CAST(N'2019-11-25' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (866, 775, 4.059999942779541, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (867, 798, 4.4000000953674316, 0.5, 0.73500001430511475, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (868, 766, 3.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (869, 805, 3.9900000095367432, 0.30000001192092896, 0.55800002813339233, CAST(N'2019-11-24' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (870, 808, 3.3399999141693115, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (871, 799, 3.9900000095367432, 0.30000001192092896, 0.51499998569488525, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (872, 804, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (873, 800, 3.9900000095367432, 0, 0.51899999380111694, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (874, 776, 4.059999942779541, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (875, 778, 2.4100000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (876, 803, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (877, 791, 3, 0, 0, CAST(N'2019-12-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (878, 801, 3.6600000858306885, 0, 0.25600001215934753, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (879, 802, 3.6600000858306885, 0.40000000596046448, 0.28400000929832458, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (880, 754, 2.059999942779541, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (881, 738, 2.9500000476837158, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (882, 777, 3.059999942779541, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (883, 773, 4.059999942779541, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (884, 793, 3.3299999237060547, 0, 0.23299999535083771, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (885, 727, 3.9900000095367432, 0.40000000596046448, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (886, 838, 3.0299999713897705, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (887, 792, 2.6600000858306885, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (888, 728, 3.9900000095367432, 0.40000000596046448, 0.6589999794960022, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (889, 795, 3.3299999237060547, 0, 0.20000000298023224, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (890, 864, 3.0299999713897705, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (891, 807, 3, 0, 0, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (892, 837, 3.3299999237060547, 0, 0, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[CacHeSoLuong] ([idHeSoLuong], [idGiaoVien], [HeSoLuong], [PhuCapChucVu], [PhuCapNgheNghiep], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (893, 896, 0, NULL, NULL, CAST(N'2021-10-01' AS Date), NULL, N'896_0_01-10-2021_1.jpg', N'Xác nhận')
SET IDENTITY_INSERT [dbo].[CacHeSoLuong] OFF
SET IDENTITY_INSERT [dbo].[ChucVu] ON 

INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (15, N'Trưởng bộ môn')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (16, N'Phó trưởng bộ môn')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (17, N'Hiệu trưởng')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (18, N'Phó Hiệu trưởng')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (19, N'Trưởng phòng')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (20, N'Phó trưởng phòng')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (21, N'Thư ký Hội đồng trường')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (22, N'Bí thư Đảng ủy')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (23, N'Phó Bí thư Đảng ủy')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (24, N'Bí thư chi bộ')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (25, N'Trưởng ban Thanh tra nhân dân')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (26, N'Trưởng Ban nữ công')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (27, N'Chủ tịch Hội cựu chiến binh')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (28, N'Phó bí thư chi bộ')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (29, N'Bí thư Đoàn trường')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (30, N'Phó Bí thư Đoàn trường')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (31, N'Chủ tịch Hội sinh viên')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (32, N'Phó chủ tịch Hội sinh viên')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (33, N'Bí thư liên chi đoàn khoa')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (34, N'Chủ tịch Công đoàn Trường')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (35, N'Phó Chủ tịch Công đoàn Trường')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (36, N'UVBCH Công đoàn Trường')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (37, N'Chủ tịch Công đoàn bộ phận')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (38, N'Phó chủ tịch Công đoàn bộ phận')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (39, N'Trưởng khoa')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (40, N'Phó trưởng khoa')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (41, N'Trưởng Trung tâm')
INSERT [dbo].[ChucVu] ([idChucVu], [TenChucVu]) VALUES (42, N'Phó trưởng trung tâm')
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
SET IDENTITY_INSERT [dbo].[GiaoVien] ON 

INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (670, N'Đặng Quyết Thắng', CAST(N'1970-09-14' AS Date), NULL, N'0912208186', N'ntvinh195@gmail.com', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (671, N'Trần Thị Bích', CAST(N'1981-10-13' AS Date), NULL, N'0987915868', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (672, N'Phạm Anh Bình', CAST(N'1982-06-21' AS Date), NULL, N'0912644784', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (673, N'Phạm Thị Thu Hương', CAST(N'1983-01-03' AS Date), NULL, N'0915566221', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (674, N'Ngô Thị Thuỳ', CAST(N'1985-01-28' AS Date), NULL, N'0988476047', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (675, N'Vũ Thị Phương Dung', CAST(N'1979-10-20' AS Date), NULL, N'0915190727', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (676, N'Trần Thị Ngọc Tâm', CAST(N'1980-07-22' AS Date), NULL, N'0913345432', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (677, N'Trần Thị Thùy Ninh', CAST(N'1980-10-16' AS Date), NULL, N'0838299350', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (678, N'Mai Văn Thao', CAST(N'1981-06-14' AS Date), NULL, N'0949888009', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (679, N'Nguyễn Thành Nam', CAST(N'1982-06-03' AS Date), NULL, N'0989730621', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (680, N'Đặng Thị Thu Phương', CAST(N'1984-10-02' AS Date), NULL, N'0988473281', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (681, N'Trần Thị Ngọc', CAST(N'1983-12-04' AS Date), NULL, N'0917344663', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (682, N'Phạm Thị Lê Hoa', CAST(N'1978-01-06' AS Date), NULL, N'0983156780', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (683, N'Trần Đình Tụng', CAST(N'1978-06-15' AS Date), NULL, N'0989832004', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (684, N'Nguyễn Thị Hà', CAST(N'1972-06-01' AS Date), NULL, N'0912320776', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (685, N'Vũ Thị Hiền', CAST(N'1990-03-02' AS Date), NULL, N'0949838005', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (686, N'Vũ Văn Định', CAST(N'1976-03-17' AS Date), NULL, N'0982836492', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (687, N'Đoàn Văn Hiện', CAST(N'1976-09-21' AS Date), NULL, N'0364951258', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (688, N'Hoàng Thị Thuỷ', CAST(N'1979-12-30' AS Date), NULL, N'0948461806', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (689, N'Ngô Mạnh Hà', CAST(N'1980-01-04' AS Date), NULL, N'0973776072', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (690, N'Đặng Hồng Quân', CAST(N'1969-08-05' AS Date), NULL, N'0989661169', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (691, N'Phạm Đức Phiến', CAST(N'1965-01-04' AS Date), NULL, N'0914512683', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (692, N'Nguyễn Thị Thanh Bình', CAST(N'1982-11-01' AS Date), NULL, N'0983185172', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (693, N'Nguyễn Thị Lương', CAST(N'1987-10-07' AS Date), NULL, N'0866484348', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (694, N'Nguyễn Thị Như Hoa', CAST(N'1985-10-14' AS Date), NULL, N'0916113067', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (695, N'Nguyễn Thanh Tùng', CAST(N'1974-07-22' AS Date), NULL, N'0983090206', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (696, N'Trần Thanh Tùng', CAST(N'1991-12-11' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (697, N'Nguyễn Thị Huyền My', CAST(N'1990-10-22' AS Date), NULL, N'0969900003', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (698, N'Bùi Quốc Việt', CAST(N'1986-04-24' AS Date), NULL, N'0973050355', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (699, N'Nguyễn Thanh Bình', CAST(N'1983-04-16' AS Date), NULL, N'0912978695', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (700, N'Ngô Ngọc Hoàng', CAST(N'1990-09-23' AS Date), NULL, N'0949419350', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (701, N'Ngô Thanh Bình', CAST(N'1983-10-18' AS Date), NULL, N'0982073858', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (702, N'Nguyễn Đình Thi', CAST(N'1979-04-22' AS Date), NULL, N'0912797719', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (703, N'Lưu Văn Vương', CAST(N'1980-09-29' AS Date), NULL, N'0983369980', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (704, N'Hà Thị Minh Nguyệt', CAST(N'1982-02-28' AS Date), NULL, N'0943695597', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (705, N'Phạm Thanh Bình', CAST(N'1982-12-24' AS Date), NULL, N'0983326981', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (706, N'Trịnh Thế Anh', CAST(N'1982-09-05' AS Date), NULL, N'0912131563', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (707, N'Nguyễn Thị Thu', CAST(N'1983-01-08' AS Date), NULL, N'0989645683', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (708, N'Trần Văn Đồng', CAST(N'1983-03-24' AS Date), NULL, N'0917515368', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (709, N'Trần Thị Thu Hương', CAST(N'1986-03-13' AS Date), NULL, N'0987763743', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (710, N'Đỗ Thu Trang', CAST(N'1990-01-01' AS Date), NULL, N'0961296777', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (711, N'Phạm Minh Xuân', CAST(N'1973-05-07' AS Date), NULL, N'0917684914', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (712, N'Vũ Thị Mai Anh', CAST(N'1976-09-14' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (713, N'Vũ Xuân Luận', CAST(N'1976-01-30' AS Date), NULL, N'0912850384', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (714, N'Trần Văn Hiệp', CAST(N'1980-10-10' AS Date), NULL, N'0912460193', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (715, N'Trần Thị Hồng Nhung', CAST(N'1986-06-14' AS Date), NULL, N'0834514586', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (716, N'Lê Anh Tuấn', CAST(N'1979-08-16' AS Date), NULL, N'0982512366', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (717, N'Nguyễn Thị Phương Dung', CAST(N'1979-12-19' AS Date), NULL, N'0945512171', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (718, N'Đỗ Thuỳ Linh', CAST(N'1981-11-21' AS Date), NULL, N'0902188114', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (719, N'Lê Thị Hồng Tâm', CAST(N'1984-06-01' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (720, N'Nguyễn Thị Bích Thuỷ', CAST(N'1983-02-02' AS Date), NULL, N'0943134389', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (721, N'Nguyễn Thị Thu Trang', CAST(N'1984-10-27' AS Date), NULL, N'0936631084', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (722, N'Trần Thị Khánh Linh', CAST(N'1985-03-14' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (723, N'Vũ Quang Trung', CAST(N'1961-02-02' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (724, N'Trần Quang Thịnh', CAST(N'1985-06-20' AS Date), NULL, N'0949009308', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (725, N'Nguyễn Hải Long', CAST(N'1976-06-16' AS Date), NULL, N'0942236378', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (726, N'Phùng Ngọc Quý', CAST(N'1977-02-22' AS Date), NULL, N'0916578955', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (727, N'Vũ Thị Thu Huyền', CAST(N'1975-09-19' AS Date), NULL, N'0914761507', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (728, N'Lê Quỳnh Lan', CAST(N'1980-05-23' AS Date), NULL, N'0946830980', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (729, N'Hoàng Văn Sỹ', CAST(N'1975-01-06' AS Date), NULL, N'0916081431', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (730, N'Nguyễn Thanh Xuân', CAST(N'1980-03-13' AS Date), NULL, N'0977931478', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (731, N'Trần Thanh Bình', CAST(N'1981-02-12' AS Date), NULL, N'0917417082', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (732, N'Bùi Phương Loan', CAST(N'1978-11-01' AS Date), NULL, N'0943817454', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (733, N'Nguyễn Hữu Mai', CAST(N'1980-11-22' AS Date), NULL, N'0916112236', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (734, N'Trần Đại Dương', CAST(N'1967-10-10' AS Date), NULL, N'0914816467', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (735, N'Vũ Thị Phương Linh', CAST(N'1989-10-25' AS Date), NULL, N'0945121989', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (736, N'Nguyễn Tiến Đức', CAST(N'1978-03-21' AS Date), NULL, N'0912668039', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (737, N'Phạm Đức Cường', CAST(N'1982-02-06' AS Date), NULL, N'0944882922', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (738, N'Vũ Văn Thể', CAST(N'1973-07-05' AS Date), NULL, N'0912139436', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (739, N'Hoàng Quốc Vương', CAST(N'1984-08-17' AS Date), NULL, N'0964851636', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (740, N'Trần Huy Trọng', CAST(N'1981-10-20' AS Date), NULL, N'0915301600', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (741, N'Phan Đức Thiện', CAST(N'1982-07-19' AS Date), NULL, N'0918875005', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (742, N'Trần Xuân Phương', CAST(N'1982-01-27' AS Date), NULL, N'0904271121', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (743, N'Nguyễn Công Trường', CAST(N'1984-03-10' AS Date), NULL, N'0948925969', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (744, N'Lê Văn Khải', CAST(N'1987-09-10' AS Date), NULL, N'0988100987', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (745, N'Vũ Ngọc Hoàn', CAST(N'1983-12-19' AS Date), NULL, N'0912725020', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (746, N'Vũ Tùng Lâm', CAST(N'1986-05-28' AS Date), NULL, N'0917358354', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (747, N'Vũ Khắc Thanh', CAST(N'1991-12-30' AS Date), NULL, N'0943284299', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (748, N'Dương Thế Vinh', CAST(N'1990-12-06' AS Date), NULL, N'0945833088', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (749, N'Trần Công Chính', CAST(N'1979-01-28' AS Date), NULL, N'0915548839', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (750, N'Trần Văn Hạnh', CAST(N'1982-10-26' AS Date), NULL, N'0915267862', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (751, N'Trần Quốc Đảng', CAST(N'1964-02-03' AS Date), NULL, N'0912443987', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (752, N'Nguyễn Lương Kiên', CAST(N'1976-07-09' AS Date), NULL, N'0947022117', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (753, N'Mai Thị Tố Như', CAST(N'1970-10-14' AS Date), NULL, N'0912451375', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (754, N'Hoàng Thị Kim Dung', CAST(N'1988-12-14' AS Date), NULL, N'0989381074', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (755, N'Trần Xuân Bao', CAST(N'1975-04-20' AS Date), NULL, N'0912311261', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (756, N'Nguyễn Thị Mây', CAST(N'1982-09-22' AS Date), NULL, N'0948042025', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (757, N'Nguyễn Thu Mai', CAST(N'1982-01-23' AS Date), NULL, N'0916403498', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (758, N'Trần Thị Thơm', CAST(N'1983-06-01' AS Date), NULL, N'0919347319', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (759, N'Trần Thị Thu Hằng', CAST(N'1983-03-01' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (760, N'Ngô Nhật Thành', CAST(N'1981-11-06' AS Date), NULL, N'0989661707', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (761, N'Đinh Thị Nhung', CAST(N'1981-08-09' AS Date), NULL, N'0369394133', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (762, N'Hà Mạnh Hợp', CAST(N'1961-12-17' AS Date), NULL, N'0912137539', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (763, N'Trần Thị Thơm', CAST(N'1983-05-01' AS Date), NULL, N'0983983153', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (764, N'Bùi Thị Huyền', CAST(N'1985-07-06' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (765, N'Nguyễn Trường Giang', CAST(N'1976-09-19' AS Date), NULL, N'0912559176', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (766, N'Lê Mai Hương', CAST(N'1976-12-30' AS Date), NULL, N'0912851085', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (767, N'Trần Thị Thu Hằng', CAST(N'1980-01-19' AS Date), NULL, N'0914815579', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (768, N'Trần Thị Ngọc Loan', CAST(N'1979-01-23' AS Date), NULL, N'0912779585', N'', 0)
GO
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (769, N'Ngô Thị Nhung', CAST(N'1979-07-09' AS Date), NULL, N'0948256689', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (770, N'Nguyễn Thị Phương Thảo', CAST(N'1982-10-30' AS Date), NULL, N'0903966008', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (771, N'Trần Trung Kiên', CAST(N'1982-10-06' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (772, N'Vũ Trung Thành', CAST(N'1992-07-13' AS Date), NULL, N'0907478668', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (773, N'Nguyễn Kim Vân', CAST(N'1971-12-16' AS Date), NULL, N'0827588368', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (774, N'Vũ Đình Mạnh', CAST(N'1961-05-18' AS Date), NULL, N'0912432288', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (775, N'Đặng Xuân Toàn', CAST(N'1965-12-02' AS Date), NULL, N'0912171453', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (776, N'Trần Ngọc Tuấn', CAST(N'1969-02-26' AS Date), NULL, N'0945917007', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (777, N'Nguyễn Thị Thanh Xuân', CAST(N'1981-02-20' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (778, N'Phạm Tuấn Đạt', CAST(N'1983-10-28' AS Date), NULL, N'0919368370', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (779, N'Nguyễn Trọng Hợp', CAST(N'1979-03-27' AS Date), NULL, N'0984989871', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (780, N'Trần Tuấn Anh', CAST(N'1974-01-03' AS Date), NULL, N'0917438609', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (781, N'Trần Hồng Vân', CAST(N'1987-10-21' AS Date), NULL, N'0984093521', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (782, N'Trần Thị Vân', CAST(N'1984-02-21' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (783, N'Phạm Văn Hà', CAST(N'1982-10-22' AS Date), NULL, N'0976565058', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (784, N'Bùi Đức Phương', CAST(N'1982-12-07' AS Date), NULL, N'0989731728', N'ntvinh195@gmail.com', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (785, N'Hoàng Thị Diệu', CAST(N'1983-08-16' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (786, N'Vũ Văn Khánh', CAST(N'1985-07-31' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (787, N'Nguyễn Trung Kiên', CAST(N'1984-12-07' AS Date), NULL, N'0978955921', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (788, N'Trần Quang Huy', CAST(N'1984-11-05' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (789, N'Hoàng Xuân Huân', CAST(N'1983-02-03' AS Date), NULL, N'0975300282', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (790, N'Phạm Văn Trưởng', CAST(N'1986-01-02' AS Date), NULL, N'0976200602', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (791, N'Trịnh Xuân Phong', CAST(N'1982-11-09' AS Date), NULL, N'0912840850', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (792, N'Trần Thị Thu Trang', CAST(N'1986-10-04' AS Date), NULL, N'0918398887', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (793, N'Nguyễn Trung Kiên', CAST(N'1984-10-11' AS Date), NULL, N'0915829535', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (794, N'Trần Đình Tài', CAST(N'1979-03-10' AS Date), NULL, N'0944868459', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (795, N'Trương Thành Trung', CAST(N'1984-04-01' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (796, N'Vũ Mạnh Hùng', CAST(N'1981-07-24' AS Date), NULL, N'0904067672', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (797, N'Nguyễn Mạnh Chất', CAST(N'1962-03-01' AS Date), NULL, N'0912137726', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (798, N'Vũ Văn Ba', CAST(N'1976-05-05' AS Date), NULL, N'0915562256', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (799, N'Trần Thanh Tâm', CAST(N'1973-10-01' AS Date), NULL, N'0945983609', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (800, N'Hoàng Trọng ánh', CAST(N'1972-04-17' AS Date), NULL, N'0912763476', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (801, N'Nguyễn Thị Mỵ', CAST(N'1976-12-16' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (802, N'Nguyễn Hồng Thanh', CAST(N'1972-01-11' AS Date), NULL, N'0989142735', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (803, N'Nguyễn Thị Hiên', CAST(N'1979-11-03' AS Date), NULL, N'0947060856', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (804, N'Bùi Thị Tuyết Nhung', CAST(N'1981-07-22' AS Date), NULL, N'0912876875', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (805, N'Mai Văn Hồng', CAST(N'1981-11-02' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (806, N'Lê Thanh', CAST(N'1982-10-18' AS Date), NULL, N'0915184376', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (807, N'Đặng Huy Cường', CAST(N'1985-02-28' AS Date), NULL, N'0356256954', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (808, N'Vũ Thị Thuý Hoàn', CAST(N'1984-12-08' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (809, N'Cao Thị Hằng', CAST(N'1983-11-12' AS Date), NULL, N'0985886841', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (810, N'Nguyễn Thế Vinh', CAST(N'1984-05-19' AS Date), NULL, N'0915673547', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (811, N'Trần Xuân Thảnh', CAST(N'1979-11-24' AS Date), NULL, N'0982050467', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (812, N'Trần Thị Yến', CAST(N'1986-08-07' AS Date), NULL, N'0982965319', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (813, N'Trần Thị Duyên', CAST(N'1982-06-01' AS Date), NULL, N'0941413668', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (814, N'Nguyễn Thị Thu Hằng', CAST(N'1984-07-06' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (815, N'Trần Văn Long', CAST(N'1982-01-18' AS Date), NULL, N'0917305364', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (816, N'Bùi Thu Hải', CAST(N'1985-05-25' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (817, N'Bùi Thị Thảo', CAST(N'1985-11-07' AS Date), NULL, N'0912832749', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (818, N'Phạm Thị Cúc', CAST(N'1984-02-11' AS Date), NULL, N'0948268622', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (819, N'Đỗ Thị Hồng Lĩnh', CAST(N'1984-10-08' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (820, N'Đinh Thị Hương', CAST(N'1984-12-20' AS Date), NULL, N'0912942623', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (821, N'Lê Thị Mừng', CAST(N'1984-02-13' AS Date), NULL, N'0946117132', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (822, N'Đoàn Tuấn Nam', CAST(N'1973-03-22' AS Date), NULL, N'0989661196', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (823, N'Tô Đức Nhuận', CAST(N'1979-01-16' AS Date), NULL, N'0836364493', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (824, N'Nguyễn Văn Trung', CAST(N'1978-04-10' AS Date), NULL, N'0912590489', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (825, N'Ngô Thị Nga', CAST(N'1981-06-21' AS Date), NULL, N'0915300215', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (826, N'Đặng Thị Hiền', CAST(N'1981-10-17' AS Date), NULL, N'0982900881', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (827, N'Nguyễn Thị Thu Thuỷ', CAST(N'1981-11-16' AS Date), NULL, N'0919589288', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (828, N'Nguyễn Văn Thẩm', CAST(N'1982-06-27' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (829, N'Nguyễn Văn Vũ', CAST(N'1979-01-20' AS Date), NULL, N'0912284726', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (830, N'Bùi Thị Ngọc Tú', CAST(N'1981-08-21' AS Date), NULL, N'0942019895', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (831, N'Phạm Thị Hồng Nhung', CAST(N'1982-02-12' AS Date), NULL, N'0912850448', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (832, N'Phùng Thị Thu Hiền', CAST(N'1982-05-04' AS Date), NULL, N'0973768808', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (833, N'Đinh Gia Trường', CAST(N'1982-06-25' AS Date), NULL, N'0909092883', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (834, N'Hoàng Thị Hồng Hà', CAST(N'1983-04-09' AS Date), NULL, N'0852163688', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (835, N'Vũ Thị Phương', CAST(N'1976-10-23' AS Date), NULL, N'0917380780', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (836, N'Ngô Thị Thơm', CAST(N'1984-11-02' AS Date), NULL, N'0978122457', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (837, N'Phạm Thị Liên', CAST(N'1983-12-03' AS Date), NULL, N'0948888638', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (838, N'Đinh Văn Điều', CAST(N'1985-04-24' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (839, N'Vũ Thị Thắng', CAST(N'1978-02-21' AS Date), NULL, N'0915703287', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (840, N'Nguyễn Thị Hoà', CAST(N'1978-08-21' AS Date), NULL, N'0948353050', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (841, N'Trần Gia Khánh', CAST(N'1979-10-07' AS Date), NULL, N'0912717629', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (842, N'Lã Văn Trưởng', CAST(N'1978-11-24' AS Date), NULL, N'0915004828', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (843, N'Lưu Quốc Cường', CAST(N'1974-02-08' AS Date), NULL, N'0915566825', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (844, N'Phạm Văn Phi', CAST(N'1975-11-03' AS Date), NULL, N'0983950590', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (845, N'Đoàn Ngọc Sỹ', CAST(N'1976-10-03' AS Date), NULL, N'0919267876', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (846, N'Khúc Ngọc Khoa', CAST(N'1978-05-03' AS Date), NULL, N'0378595945', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (847, N'Trần Thị Nhung', CAST(N'1978-10-02' AS Date), NULL, N'0982526560', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (848, N'Nguyễn Thị Duyên', CAST(N'1980-05-22' AS Date), NULL, N'0915652003', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (849, N'Vũ Ngọc Tuấn', CAST(N'1980-11-21' AS Date), NULL, N'0989830646', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (850, N'Nghiêm Thị Hưng', CAST(N'1977-03-21' AS Date), NULL, N'0936636121', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (851, N'Giản Quốc Anh', CAST(N'1981-04-02' AS Date), NULL, N'0915659051', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (852, N'Vũ Tiến Lập', CAST(N'1982-11-15' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (853, N'Trần Thị Hiền', CAST(N'1980-03-30' AS Date), NULL, N'0989398732', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (854, N'Đào Thị Hằng', CAST(N'1980-08-05' AS Date), NULL, N'0913820052', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (855, N'Phạm Xuân Bách', CAST(N'1980-06-26' AS Date), NULL, N'0989256608', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (856, N'Nguyễn Văn Hùng', CAST(N'1961-09-14' AS Date), NULL, N'0912208005', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (857, N'Trần Thị Hồng', CAST(N'1986-10-03' AS Date), NULL, N'0906177969', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (858, N'Nguyễn Thị Huyền', CAST(N'1979-01-28' AS Date), NULL, N'0948077447', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (859, N'Trần Thanh Thuỷ', CAST(N'1979-07-11' AS Date), NULL, N'0982527982', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (860, N'Phạm Thị Hường', CAST(N'1981-06-28' AS Date), NULL, N'0946582609', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (861, N'Mai Thị Thanh Nga', CAST(N'1984-01-20' AS Date), NULL, N'0914791857', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (862, N'Đinh Công Quý', CAST(N'1983-10-29' AS Date), NULL, N'0983116783', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (863, N'Trần Thị Hiền', CAST(N'1981-07-17' AS Date), NULL, N'0916044216', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (864, N'Nguyễn Văn Quyền', CAST(N'1983-10-24' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (865, N'Trần Ngọc Đức', CAST(N'1974-06-05' AS Date), NULL, N'0946117474', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (866, N'Trần Hiếu', CAST(N'1978-03-09' AS Date), NULL, N'0912138407', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (867, N'Hà Minh Ngọc', CAST(N'1978-04-27' AS Date), NULL, N'0982769009', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (868, N'Trần Sỹ Long', CAST(N'1976-09-08' AS Date), NULL, N'0912208326', N'', 1)
GO
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (869, N'Trần Thị Thuý Anh', CAST(N'1976-09-24' AS Date), NULL, N'0914274486', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (870, N'Nguyễn Mạnh Trân', CAST(N'1979-11-13' AS Date), NULL, N'0988023468', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (871, N'Hà Tiến Điển', CAST(N'1980-05-16' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (872, N'Chu Hoàng Hà', CAST(N'1984-04-09' AS Date), NULL, N'0945016098', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (873, N'Vũ Hải Thượng', CAST(N'1983-09-06' AS Date), NULL, N'', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (874, N'Nguyễn Tiến Hưng', CAST(N'1973-10-04' AS Date), NULL, N'0912280146', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (875, N'Hà Thị Thịnh', CAST(N'1970-08-10' AS Date), NULL, N'0914914554', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (876, N'Nguyễn Hùng Khôi', CAST(N'1962-08-12' AS Date), NULL, N'0915254747', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (877, N'Phan Thị Thu Hường', CAST(N'1984-12-26' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (878, N'Trần Văn Biên', CAST(N'1976-06-16' AS Date), NULL, N'0946644899', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (879, N'Hoàng Mai Hồng', CAST(N'1979-10-18' AS Date), NULL, N'0914825705', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (880, N'Lê Thị Chinh', CAST(N'1980-08-10' AS Date), NULL, N'', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (881, N'Phí Văn Hùng', CAST(N'1979-04-04' AS Date), NULL, N'0912899434', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (882, N'Nguyễn Thị Kha', CAST(N'1986-12-16' AS Date), NULL, N'0979948516', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (883, N'Bùi Thị Thu Hường', CAST(N'1985-12-01' AS Date), NULL, N'0904791186', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (884, N'Cao Văn Thế', CAST(N'1986-02-21' AS Date), NULL, N'0978823821', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (885, N'Nguyễn Thúy Hằng', CAST(N'1975-08-18' AS Date), NULL, N'0919538120', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (886, N'Trần Thanh Sơn', CAST(N'1964-11-22' AS Date), NULL, N'0912850091', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (887, N'Nghiêm Thị Thuý Nga', CAST(N'1976-08-29' AS Date), NULL, N'0948932136', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (888, N'Hoàng Thị Phương', CAST(N'1976-07-03' AS Date), NULL, N'0919283776', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (889, N'Mai Thị Thêm', CAST(N'1977-05-14' AS Date), NULL, N'0916767607', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (890, N'Phạm Thị Hoa', CAST(N'1978-07-19' AS Date), NULL, N'0915865978', N'', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (891, N'Trần Quý Bình', CAST(N'1984-05-12' AS Date), NULL, N'0984112245', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (892, N'Vũ Quang Hưng', CAST(N'1980-06-01' AS Date), NULL, N'0915605606', N'', 1)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (895, N'sdf', CAST(N'2021-09-26' AS Date), NULL, N'0219549898', N'ntvinh195@gmail.com', 0)
INSERT [dbo].[GiaoVien] ([idGiaoVien], [HoTenGiaoVien], [NgaySinh], [idNguoiDung], [DienThoai], [Email], [GioiTinh]) VALUES (896, N'Trần Thanh Bình', CAST(N'2021-09-27' AS Date), NULL, N'0915683547', N'ntvinh195@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[GiaoVien] OFF
SET IDENTITY_INSERT [dbo].[GiaoVienChiTiet] ON 

INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (449, 698, 1, NULL, 146, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (450, 767, 13, NULL, 150, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (451, 677, 1, NULL, 149, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (452, 750, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (453, 680, 1, NULL, 149, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (454, 744, 3, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (455, 678, 1, NULL, 149, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (456, 710, 1, NULL, 145, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (457, 772, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (458, 780, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (459, 770, 3, NULL, 150, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (460, 776, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (461, 679, 1, NULL, 149, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (462, 765, 13, NULL, 150, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (463, 743, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (464, 748, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (465, 676, 1, NULL, 149, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (466, 745, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (467, 773, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (468, 769, 13, NULL, 150, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (469, 672, 1, NULL, 146, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (470, 682, 1, NULL, 146, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (471, 747, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (472, 673, 1, NULL, 149, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (473, 768, 1, NULL, 150, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (474, 775, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (475, 742, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (476, 774, 1, 6, 138, CAST(N'2019-11-12' AS Date), CAST(N'2021-10-01' AS Date), NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (477, 746, 3, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (478, 749, 1, 8, 138, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (479, 697, 1, NULL, 146, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (480, 675, 1, NULL, 149, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (481, 779, 1, NULL, 150, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (482, 671, 3, NULL, 145, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (483, 674, 1, NULL, 149, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (484, 728, 1, 6, 149, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (485, 740, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (486, 764, 1, NULL, 150, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (487, 691, 7, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (488, 759, 16, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (489, 733, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (490, 692, 16, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (491, 758, 16, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (492, 693, 12, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (493, 732, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (494, 738, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (495, 694, 12, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (496, 753, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (497, 757, 16, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (498, 696, 12, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (499, 730, 10, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (500, 725, 3, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (501, 756, 16, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (502, 727, 10, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (503, 729, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (504, 752, 1, 5, 138, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (505, 755, 12, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (506, 726, 10, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (507, 731, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (508, 734, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (509, 690, 15, 4, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (510, 735, 12, 7, NULL, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (511, 683, 9, 4, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (512, 741, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (513, 777, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (514, 695, 10, 4, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (515, 763, 1, NULL, 150, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (516, 751, 13, 8, 138, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (517, 684, 12, 4, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (518, 778, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (519, 739, 12, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (520, 762, 13, NULL, 150, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (521, 685, 12, 4, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (522, 737, 10, 7, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (523, 686, 9, 4, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (524, 754, 12, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (525, 761, 16, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (526, 687, 9, 4, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (527, 736, 1, 7, 142, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (528, 688, 3, 4, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (529, 766, 10, 6, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (530, 760, 10, 5, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (531, 689, 1, 4, 138, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (532, 681, 1, NULL, 149, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (533, 771, 1, NULL, 150, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (534, 781, 1, NULL, 135, CAST(N'2019-11-18' AS Date), CAST(N'2020-11-11' AS Date), NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (535, 721, 1, NULL, 146, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (536, 838, 3, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (537, 864, 3, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (538, 837, 10, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (539, 808, 3, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (540, 806, 1, NULL, 138, CAST(N'2019-11-25' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (541, 805, 1, NULL, 139, CAST(N'2019-11-24' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (542, 804, 1, NULL, 138, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (543, 867, 12, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (544, 803, 1, NULL, 139, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (545, 801, 1, NULL, 138, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (546, 800, 1, NULL, 138, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (547, 799, 1, NULL, 148, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (548, 798, 13, NULL, 138, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (549, 797, 1, NULL, 138, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (550, 796, 1, NULL, 139, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (551, 807, 1, NULL, 148, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (552, 802, 1, NULL, 138, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (553, 795, 1, NULL, 139, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (554, 868, 1, 9, 138, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (555, 870, 3, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (556, 886, 1, NULL, 142, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (557, 885, 1, NULL, 144, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (558, 884, 1, NULL, 142, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (559, 883, 1, NULL, 144, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (560, 882, 1, NULL, 144, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (561, 881, 1, NULL, 144, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (562, 880, 12, NULL, 144, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (563, 869, 10, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (564, 891, 1, NULL, 144, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (565, 877, 1, NULL, 143, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (566, 722, 1, NULL, 145, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (567, 875, 1, NULL, 144, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (568, 874, 13, NULL, 144, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (569, 873, 1, NULL, 144, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (570, 872, 3, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (571, 871, 10, 9, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (572, 879, 1, NULL, 143, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (573, 793, 1, NULL, 148, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (574, 792, 12, NULL, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (575, 791, 1, NULL, 148, CAST(N'2019-12-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (576, 825, 1, NULL, 140, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (577, 824, 1, NULL, 141, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (578, 835, 1, NULL, 141, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (579, 823, 1, NULL, 141, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (580, 821, 1, NULL, 140, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (581, 820, 3, NULL, 141, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (582, 819, 1, NULL, 141, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (583, 826, 1, NULL, 141, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (584, 818, 1, NULL, 141, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (585, 816, 1, NULL, 141, CAST(N'2019-11-17' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (586, 815, 1, NULL, 141, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (587, 814, 1, NULL, 141, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (588, 813, 1, NULL, 141, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (589, 812, 1, NULL, 140, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (590, 811, 13, 10, 139, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (591, 670, 14, 10, 140, CAST(N'2019-11-11' AS Date), NULL, N'Xác nhận', N'670_591_29-09-2021_1.jpg')
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (592, 817, 1, NULL, 140, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (593, 827, 1, NULL, 140, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (594, 828, 1, NULL, 140, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (595, 829, 1, NULL, 140, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (596, 790, 1, NULL, 139, CAST(N'2019-12-07' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (597, 789, 1, NULL, 139, CAST(N'2019-12-06' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (598, 788, 1, NULL, 139, CAST(N'2019-12-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (599, 787, 1, NULL, 148, CAST(N'2019-12-04' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (600, 786, 1, NULL, 138, CAST(N'2019-12-03' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (601, 785, 1, NULL, 139, CAST(N'2019-12-02' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (602, 784, 1, NULL, 139, CAST(N'2019-12-01' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (603, 783, 1, NULL, 139, CAST(N'2019-11-30' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (604, 794, 1, NULL, 139, CAST(N'2019-11-29' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (605, 809, 1, NULL, 138, CAST(N'2019-11-28' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (606, 822, 13, NULL, 140, CAST(N'2019-11-27' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (607, 810, 1, NULL, 141, CAST(N'2019-11-26' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (608, 834, 1, NULL, 141, CAST(N'2019-11-25' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (609, 833, 1, NULL, 141, CAST(N'2019-11-24' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (610, 832, 1, NULL, 141, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (611, 831, 1, NULL, 140, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (612, 830, 11, NULL, 140, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (613, 887, 1, NULL, 142, CAST(N'2019-11-18' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (614, 888, 13, NULL, 142, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (615, 876, 1, NULL, 144, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (616, 889, 1, NULL, 144, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (617, 856, 13, 1, 150, CAST(N'2019-12-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (618, 857, 12, 1, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (619, 858, 3, 1, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (620, 859, 1, 1, 142, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (621, 860, 1, NULL, 137, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (622, 861, 1, NULL, 136, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (623, 862, 1, NULL, 135, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (624, 836, 1, NULL, 137, CAST(N'2019-11-17' AS Date), CAST(N'2020-11-11' AS Date), NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (625, 724, 1, NULL, 137, CAST(N'2019-11-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (626, 699, 1, NULL, 136, CAST(N'2019-11-20' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (627, 700, 11, NULL, 135, CAST(N'2019-11-21' AS Date), CAST(N'2020-11-11' AS Date), NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (628, 701, 1, NULL, 137, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (629, 702, 1, NULL, 137, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (630, 703, 1, NULL, 135, CAST(N'2019-11-24' AS Date), CAST(N'2020-11-11' AS Date), NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (631, 704, 3, NULL, 137, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (632, 705, 1, NULL, 136, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (633, 706, 1, NULL, 137, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (634, 720, 1, NULL, 145, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (635, 719, 1, NULL, 145, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (636, 718, 1, NULL, 145, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (637, 717, 1, NULL, 145, CAST(N'2019-11-13' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (638, 716, 1, 3, 142, CAST(N'2019-11-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (639, 715, 10, 3, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (640, 855, 13, NULL, 142, CAST(N'2019-12-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (641, 714, 5, 2, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (642, 712, 5, 2, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (643, 723, 5, 2, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (644, 711, 5, 2, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (645, 709, 1, NULL, 136, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (646, 708, 1, NULL, 135, CAST(N'2019-11-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (647, 707, 1, NULL, 136, CAST(N'2019-11-14' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (648, 713, 5, 2, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (649, 854, 1, NULL, 142, CAST(N'2019-12-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (650, 782, 1, NULL, 136, CAST(N'2019-11-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (651, 892, 9, 8, NULL, CAST(N'2019-11-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (652, 841, 1, NULL, 144, CAST(N'2019-11-28' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (653, 842, 1, NULL, 144, CAST(N'2019-11-29' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (654, 843, 1, NULL, 144, CAST(N'2019-11-30' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (655, 844, 1, NULL, 142, CAST(N'2019-12-01' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (656, 845, 1, NULL, 142, CAST(N'2019-12-02' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (657, 840, 1, NULL, 142, CAST(N'2019-11-27' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (658, 846, 1, NULL, 142, CAST(N'2019-12-03' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (659, 847, 1, NULL, 142, CAST(N'2019-12-04' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (660, 848, 1, NULL, 144, CAST(N'2019-12-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (661, 850, 1, NULL, 144, CAST(N'2019-11-25' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (662, 865, 1, NULL, 142, CAST(N'2019-11-24' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (663, 849, 1, NULL, 144, CAST(N'2019-12-06' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (664, 851, 1, NULL, 142, CAST(N'2019-12-07' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (665, 839, 1, NULL, 144, CAST(N'2019-11-26' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (666, 878, 1, NULL, 142, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (667, 890, 1, NULL, 144, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (668, 866, 1, NULL, 144, CAST(N'2019-11-22' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (669, 852, 1, NULL, 142, CAST(N'2019-12-09' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (670, 853, 1, NULL, 142, CAST(N'2019-12-10' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (671, 863, 1, NULL, 142, CAST(N'2019-12-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GiaoVienChiTiet] ([idGiaoVienChiTiet], [idGiaoVien], [idLoaiCongViec], [idPhongTrungTam], [idBoMon], [ThoiGianBatDau], [ThoiGianKetThuc], [TinhTrang], [QuyetDinh]) VALUES (674, 896, 1, NULL, 141, CAST(N'2019-09-27' AS Date), CAST(N'2021-09-29' AS Date), N'Chờ xác nhận', NULL)
SET IDENTITY_INSERT [dbo].[GiaoVienChiTiet] OFF
SET IDENTITY_INSERT [dbo].[GiaoVienChucVu] ON 

INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (53, 828, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (54, 717, 40, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (55, 670, 17, CAST(N'2021-09-26' AS Date), NULL, N'670_17_29-09-2021_1.jpg', N'Chờ xác nhận')
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (56, 751, 41, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (57, 765, 39, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (58, 827, 40, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (59, 752, 19, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (60, 877, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (61, 723, 19, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (62, 698, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (63, 811, 18, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (64, 824, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (65, 716, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (66, 749, 42, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (67, 719, 15, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (68, 682, 40, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (69, 712, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (70, 823, 15, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (71, 839, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (72, 866, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (73, 675, 40, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (74, 706, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (75, 708, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (76, 805, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (77, 802, 40, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (78, 689, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (79, 855, 15, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (80, 799, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (81, 856, 41, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (82, 798, 40, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (83, 797, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (84, 851, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (85, 859, 42, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (86, 692, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (87, 727, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (88, 888, 39, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (89, 868, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (90, 728, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (91, 788, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (92, 769, 15, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (93, 787, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (94, 701, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (95, 702, 40, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (96, 874, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (97, 810, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (98, 705, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (99, 767, 15, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (100, 690, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (101, 736, 19, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (102, 737, 20, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (103, 829, 16, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
INSERT [dbo].[GiaoVienChucVu] ([IdGiaoVienChucVu], [IdGiaoVien], [IdChucVu], [ThoiGianBatDau], [ThoiGianKetThuc], [QuyetDinh], [TinhTrang]) VALUES (104, 774, 19, CAST(N'2021-09-26' AS Date), NULL, N'Chưa rõ', NULL)
SET IDENTITY_INSERT [dbo].[GiaoVienChucVu] OFF
SET IDENTITY_INSERT [dbo].[GiaoVienTrangThaiLamViec] ON 

INSERT [dbo].[GiaoVienTrangThaiLamViec] ([idGiaoVienTrangThaiLamViec], [idGiaoVien], [TinhTrang], [QuyetDinh], [idTrangThaiLamViec], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (2, 784, N'Xác nhận', N'784_0_29-09-2021_1.jpg', 1, CAST(N'2021-09-29' AS Date), NULL)
INSERT [dbo].[GiaoVienTrangThaiLamViec] ([idGiaoVienTrangThaiLamViec], [idGiaoVien], [TinhTrang], [QuyetDinh], [idTrangThaiLamViec], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (3, 670, N'Chờ xác nhận', N'670_0_29-09-2021_1.jpg', 8, CAST(N'2021-09-29' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[GiaoVienTrangThaiLamViec] OFF
SET IDENTITY_INSERT [dbo].[HeSoChucVu] ON 

INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (1, 90, CAST(N'2021-09-24' AS Date), NULL, 36)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (2, 85, CAST(N'2021-09-24' AS Date), NULL, 24)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (3, 15, CAST(N'2021-09-24' AS Date), NULL, 22)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (4, 50, CAST(N'2021-09-24' AS Date), NULL, 29)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (5, 80, CAST(N'2021-09-24' AS Date), NULL, 33)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (6, 90, CAST(N'2021-09-24' AS Date), NULL, 37)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (7, 85, CAST(N'2021-09-24' AS Date), NULL, 34)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (8, 85, CAST(N'2021-09-24' AS Date), NULL, 27)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (9, 60, CAST(N'2021-09-24' AS Date), NULL, 31)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (10, 15, CAST(N'2021-09-24' AS Date), NULL, 17)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (11, 90, CAST(N'2021-09-24' AS Date), NULL, 28)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (12, 30, CAST(N'2021-09-24' AS Date), NULL, 23)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (13, 60, CAST(N'2021-09-24' AS Date), NULL, 30)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (14, 90, CAST(N'2021-09-24' AS Date), NULL, 38)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (15, 85, CAST(N'2021-09-24' AS Date), NULL, 35)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (16, 70, CAST(N'2021-09-24' AS Date), NULL, 32)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (17, 20, CAST(N'2021-09-24' AS Date), NULL, 18)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (18, 85, CAST(N'2021-09-24' AS Date), NULL, 16)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (19, 80, CAST(N'2021-09-24' AS Date), NULL, 40)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (20, 30, CAST(N'2021-09-24' AS Date), NULL, 20)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (21, 30, CAST(N'2021-09-24' AS Date), NULL, 42)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (22, 25, CAST(N'2021-09-24' AS Date), NULL, 21)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (23, 85, CAST(N'2021-09-24' AS Date), NULL, 26)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (24, 85, CAST(N'2021-09-24' AS Date), NULL, 25)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (25, 80, CAST(N'2021-09-24' AS Date), NULL, 15)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (26, 70, CAST(N'2021-09-24' AS Date), NULL, 39)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (27, 25, CAST(N'2021-09-24' AS Date), NULL, 19)
INSERT [dbo].[HeSoChucVu] ([IdHeSoChucVu], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc], [IdChucVu]) VALUES (28, 25, CAST(N'2021-09-24' AS Date), NULL, 41)
SET IDENTITY_INSERT [dbo].[HeSoChucVu] OFF
SET IDENTITY_INSERT [dbo].[HinhThucThi] ON 

INSERT [dbo].[HinhThucThi] ([idHinhThucThi], [TenHinhThucThi], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (1, N'Tự luận', CAST(N'2011-11-11' AS Date), NULL)
INSERT [dbo].[HinhThucThi] ([idHinhThucThi], [TenHinhThucThi], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (2, N'Vấn đáp', CAST(N'2011-11-11' AS Date), NULL)
INSERT [dbo].[HinhThucThi] ([idHinhThucThi], [TenHinhThucThi], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (3, N'Trắc nghiệm', CAST(N'2011-11-11' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[HinhThucThi] OFF
SET IDENTITY_INSERT [dbo].[HocKy] ON 

INSERT [dbo].[HocKy] ([IdHocKy], [TenHocKy]) VALUES (1, N'Học kỳ 1')
INSERT [dbo].[HocKy] ([IdHocKy], [TenHocKy]) VALUES (2, N'Học kỳ 2')
INSERT [dbo].[HocKy] ([IdHocKy], [TenHocKy]) VALUES (3, N'Học kỳ hè')
SET IDENTITY_INSERT [dbo].[HocKy] OFF
SET IDENTITY_INSERT [dbo].[HocPhan] ON 

INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2056, N'THML0213L', N'Triết học Mác - Lênin', 3, 1, 32, 26, 6, 90, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2057, N'CCKM0412L', N'Công nghệ chế tạo khuôn mẫu', 2, 7, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2058, N'DCTM0411D', N'Đồ án chế tạo máy', 1, 7, 0, 48, 0, 30, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2059, N'MHHH0412L', N'Mô hình hóa hình học', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2060, N'CTKN0412L', N'Công nghệ thiết kế ngược', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2061, N'KTTK0412L', N'Kỹ thuật thủy khí', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2062, N'VTMT0412L', N'Vẽ và thiết kế trên máy tính', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2063, N'TCB20412T', N'Thực hành tiện cơ bản 2', 2, 6, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2064, N'THNG0411T', N'Thực hành nguội', 1, 6, 0, 34, 0, 30, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2065, N'TKTM0412L', N'Truyền động thủy lực khí nén trong máy công nghiệp', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2066, N'PGKT0412L', N'Các phương pháp gia công không truyền thống', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2067, N'CCAM0412L', N'Công nghệ CAD/CAM', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2068, N'CCNC0412L', N'Công nghệ CNC', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2069, N'DOGA0412L', N'Đồ gá', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2070, N'DACT0411D', N'Đồ án chi tiết máy', 1, 6, 0, 48, 0, 30, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2071, N'TCB10413T', N'Thực hành tiện cơ bản 1', 3, 5, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2072, N'CCTM0413L', N'Công nghệ chế tạo máy', 3, 5, 45, 0, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2073, N'MCKL0412L', N'Máy‎ cắt kim loại đại cương', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2074, N'NCKL0413L', N'Nguyên lý cắt gọt kim loại', 3, 5, 45, 0, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2075, N'NLC20412L', N'Nguyên lý-chi tiết máy 2', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2076, N'CNKL0412L', N'Công nghệ kim loại', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2077, N'VLK20412L', N'Vật liệu kỹ thuật 2', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2078, N'TCNC0413T', N'Thực hành CNC', 3, 7, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2079, N'SBVL0413L', N'Sức bền vật liệu', 3, 4, 45, 0, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2080, N'TPBC0413T', N'Thực hành phay-bào cơ bản', 3, 7, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2081, N'CIFM0412L', N'Hệ thống CIM và FMS', 2, 7, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2082, N'DDCO0412T', N'Thực hành điện động cơ', 2, 6, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2083, N'CKDC0412T', N'Thực hành động cơ', 2, 6, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2084, N'KCOT0413L', N'Kết cấu ô tô', 3, 6, 45, 0, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2085, N'HDTX0412L', N'Hệ thống điện thân xe và điều khiển tự động ô tô', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2086, N'OTMT0412L', N'Động cơ ô tô và môi trường ', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2087, N'CNMO0412L', N'Công nghệ mới cho xe ô tô', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2088, N'KCDC0413L', N'Kết cấu động cơ đốt trong', 3, 5, 45, 0, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2089, N'HDDC0412L', N'Hệ thống điện động cơ', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2090, N'NLDC0412L', N'Nguyên lý động cơ đốt trong', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2091, N'LTOT0412L', N'Lý thuyết ô tô', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2092, N'TAOT0112L', N'Tiếng anh ô tô', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2093, N'CNCN0412T', N'Thực hành CNC nâng cao', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2094, N'THCC0413T', N'Thực hành công nghệ CAD/CAM-CNC', 3, 8, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2095, N'UDCN0413T', N'Ứng dụng công nghệ số hóa để phục hồi và thiết kế chi tiết máy', 3, 8, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2096, N'CMTN0418D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2097, N'TPBN0413T', N'Thực hành phay-bào nâng cao', 3, 8, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2098, N'TTNC0413T', N'Thực hành tiện nâng cao', 3, 8, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2099, N'TTLD0412T', N'Thực hành gia công tia lửa điện', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2100, N'TMAI0412T', N'Thực hành mài', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2101, N'MNCH0412L', N'Máy nâng chuyển', 2, 7, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2102, N'DDKT0412L', N'Dao động kỹ thuật', 2, 7, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2103, N'MDRO0412L', N'Máy điều khiển số và robot công nghiệp', 2, 7, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2104, N'TBTN0412L', N'Thiết bị tiện nghi ô tô', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2105, N'DSKT0412L', N'Dung sai-Kỹ thuật đo', 2, 4, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2106, N'HHV20412L', N'Hình họa-Vẽ kỹ thuật 2', 2, 4, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2107, N'HTTN0618D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2108, N'VHTD0612T', N'Thực hành vận hành hệ thống điện', 2, 8, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2109, N'BHTD0612T', N'Thực hành bảo vệ hệ thống điện', 2, 8, 0, 34, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2110, N'CCDI0612T', N'Thực hành Cung cấp điện', 2, 8, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2111, N'TDHH0613T', N'Thực hành điều khiển và tự động hóa trong hệ thống điện', 3, 7, 0, 102, 0, 90, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2112, N'CHTD0612L', N'Chuyên đề hệ thống điện', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2113, N'VHTD0612L', N'Vận hành hệ thống điện', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2114, N'LUD20612L', N'Lưới điện 2', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2115, N'OHTD0612L', N'Ổn định hệ thống điện', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2116, N'DAHT0612D', N'Đồ án hệ thống điện', 2, 7, 0, 48, 0, 60, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2117, N'KTCA0612L', N'Kỹ thuật cao áp', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2118, N'DDDC0612L', N'Đường dây truyền tải điện đi xa', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2119, N'TDHH0612L', N'Điều khiển và tự động hóa trong hệ thống điện', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2120, N'BHTD0612L', N'Bảo vệ hệ thống điện', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2121, N'LUD10612L', N'Lưới điện 1', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2122, N'MYDT0612T', N'Thực hành máy điện', 2, 5, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2123, N'DINC0614T', N'Thực hành điện nâng cao', 4, 8, 0, 134, 0, 120, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2124, N'THTD0614T', N'Thực hành thiết kế hệ thống điện', 4, 8, 0, 134, 0, 120, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2125, N'KTTN0618D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2126, N'CCDI0613T', N'Thực hành cung cấp điện', 3, 8, 0, 102, 0, 90, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2127, N'MTDD0613T', N'Thực hành máy điện, truyền động điện', 3, 8, 0, 102, 0, 90, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2128, N'THTD0614T', N'Thực hành thiết kế hệ thống điện', 4, 8, 0, 136, 0, 120, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2129, N'NLC10412L', N'Nguyên lý-chi tiết máy 1', 2, 4, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2130, N'HTDN0614T', N'Thực hành hệ thống điện nâng cao', 4, 8, 0, 136, 0, 120, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2131, N'DACS0612D', N'Đồ án cơ sở ngành', 2, 6, 0, 96, 0, 60, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2132, N'KYTN0412L', N'Kỹ thuật nhiệt', 2, 4, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2133, N'KTDD0612L', N'Kỹ thuật điện-điện tử', 2, 4, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2134, N'HHDC0112L', N'Hóa học đại cương', 2, 4, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2135, N'CLTH0413L', N'Cơ lý thuyết', 3, 3, 45, 0, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2136, N'VLK10412L', N'Vật liệu kỹ thuật 1', 2, 3, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2137, N'HHV10412L', N'Hình họa-Vẽ kỹ thuật 1', 2, 3, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2138, N'TACM0112L', N'Tiếng anh chế tạo máy', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2139, N'HTTD0614T', N'Thực hành lắp đặt hệ thống tự động hóa', 4, 8, 0, 136, 0, 120, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2140, N'DKNC0614T', N'Thực hành điều khiển lập trình nâng cao', 4, 8, 0, 136, 0, 120, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2141, N'DKTN0618D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2142, N'MTTC0612T', N'Thực hành mạng truyền thông công nghiệp', 2, 8, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2143, N'MCNC0412T', N'Thực hành lập trình trên máy CNC', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2144, N'KNTL0612T', N'Thực hành khí nén, thủy lực', 2, 8, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2145, N'HTDT0612L', N'Hệ thống cơ điện tử công nghiệp', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2146, N'TDSX0612L', N'Tự động hóa sản xuất và hệ thống sản xuất tự động', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2147, N'TDQT0612L', N'Tự động hóa quá trình công nghệ', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2148, N'MTTC0612L', N'Mạng truyền thông công nghiệp', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2149, N'DADK0612D', N'Đồ án điều khiển tự động', 2, 7, 0, 96, 0, 60, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2150, N'MDTD0612T', N'Thực hành máy điện, truyền động điện', 2, 6, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2151, N'RBCN0612L', N'Robot công nghiệp', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2152, N'KNTL0612L', N'Truyền động khí nén, thủy lực', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2153, N'CADC0412L', N'Kỹ thuật CAD/CAM', 2, 5, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2154, N'OXCD0412L', N'Xe chuyên dụng', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
GO
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2155, N'CNSC0412L', N'Công nghệ sửa chữa ô tô', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2156, N'UDTH0412L', N'Ứng dụng tin học trong mô phỏng và sửa chữa ô tô', 2, 6, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2157, N'KGCK0412L', N'Kỹ thuật gia công cắt gọt kim loại', 2, 6, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2158, N'KTXL0612L', N'Kỹ thuật vi xử lý', 2, 6, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2159, N'CACM0412L', N'Công nghệ CAD/CAM', 2, 5, 15, 30, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2160, N'CADD0412L', N'Vẽ và thiết kế trên máy tính', 2, 5, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2161, N'TDCB0611T', N'Thực hành điện cơ bản', 1, 5, 0, 34, 0, 30, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2162, N'TRDI0612L', N'Truyền động điện', 2, 5, 25, 10, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2163, N'TDTK0412L', N'Truyền động thủy lực và khí nén', 2, 5, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2164, N'ATBD0412L', N'An toàn và bảo dưỡng công nghiệp', 2, 5, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2165, N'DLDD0612L', N'Đo lường điện và thiết bị đo', 2, 5, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2166, N'KTDT0612L', N'Kỹ thuật điện tử', 2, 5, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2167, N'NCTM0413L', N'Nguyên lý - chi tiết máy', 3, 5, 40, 10, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2168, N'CKĐC0412L', N'Cơ khí đại cương', 2, 4, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2169, N'VLHC0412L', N'Vật liệu học', 2, 4, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2170, N'KTXS0612L', N'Kỹ thuật xung - số', 2, 4, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2171, N'KYTD0612L', N'Kỹ thuật điện', 2, 4, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2172, N'SVLI0412L', N'Sức bền vật liệu', 2, 4, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2173, N'DSKT0411L', N'Dung sai – Kỹ thuật đo', 1, 4, 15, 0, 2, 30, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2174, N'NLTR0612L', N'Ngôn ngữ lập trình', 2, 4, 25, 10, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2175, N'HHDC0112L', N'Hóa học đại cương', 2, 4, 27, 6, 4, 60, N'01', 137, 1, 1, 1, 90, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'Học phần lý thuyết có hướng dẫn thí nghiệm')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2176, N'TCD10112L', N'Toán chuyên đề 1 ', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2177, N'CHOC0413L', N'Cơ học', 3, 3, 42, 6, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2178, N'HTCD0412L', N'Hệ thống cơ - điện tử', 2, 6, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2179, N'HVKT0413L', N'Hình họa -vẽ kỹ thuật', 3, 3, 40, 10, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2180, N'HTLT0412L', N'Hệ thống sản xuất linh hoạt và tích hợp', 2, 6, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2181, N'THMC0413T', N'Thực hành máy công cụ', 3, 6, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2182, N'TNCD0412L', N'Động lực học hệ nhiều vật', 2, 8, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2183, N'MTCN0612L', N'Mạng truyền thông công nghiệp', 2, 8, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2184, N'CNTK0412L', N'Công nghệ thiết kế ngược', 2, 8, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2185, N'CNND0612L', N'Công nghệ nhúng', 2, 8, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2186, N'PPKT0412L', N'Các phương pháp gia công không truyền thống', 2, 8, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2187, N'KTBD0612L', N'Kỹ thuật bảo dưỡng công nghiệp', 2, 8, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2188, N'CDTT0418D', N'Đồ án/Khóa luận TN', 8, 8, 0, 384, 0, 240, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2189, N'TTCN0412T', N'Thực tập xí nghiệp', 2, 8, 0, 96, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2190, N'TCD20413T', N'Thực hành hệ thống cơ điện tử 2', 3, 8, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2191, N'THDC0611T', N'Thực hành điện tử công suất', 1, 8, 0, 34, 0, 30, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2192, N'TKKM0412L', N'Công nghệ chế tạo khuôn mẫu', 2, 7, 20, 20, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2193, N'MHHC0412L', N'Mô hình hóa hình học', 2, 7, 15, 30, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2194, N'DKTD0612L', N'Điều khiển tự động', 2, 7, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2195, N'DKMT0612L', N'Điều khiển bằng máy tính', 2, 7, 15, 30, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2196, N'TCD10612T', N'Thực hành hệ thống cơ điện tử 1', 2, 7, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2197, N'THXL0612T', N'Thực hành vi xử lý', 2, 7, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2198, N'KTRB0412L', N'Kỹ thuật rô bốt', 2, 7, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2199, N'TCNC0412T', N'Thực hành CNC', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2200, N'ĐTCS0612L', N'Điện tử công suất', 2, 7, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2201, N'DACD0411D', N'Đồ án hệ thống cơ điện tử', 1, 7, 0, 48, 0, 30, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2202, N'THDT0612T', N'Thực hành điện tử cơ bản', 2, 6, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2203, N'LPLC0612L', N'Lập trình PLC', 2, 6, 15, 30, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2204, N'TACD0112L', N'Tiếng Anh CN cơ điện tử', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2206, N'TCC30112L', N'Toán cao cấp 3', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2207, N'THGC0412T', N'Thực hành gia công kim loại tấm', 2, 5, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2208, N'LTHA0412L', N'Lý thuyết hàn', 2, 5, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2209, N'TACK0112L', N'Tiếng anh kỹ thuật cơ khí', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2210, N'KSKX0412T', N'Hệ thống kiểm soát khí xả', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2211, N'PDDT0412T', N'Hệ thống phun dầu điện tử', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2212, N'TRED0412T', N'Hệ thống treo điều khiển điện tử', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2213, N'HSTD0412T', N'Hộp số tự động', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2214, N'OTTN0418D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2215, N'CDDC0412T', N'Thực hành chẩn đoán động cơ và ô tô', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2216, N'TNDC0412T', N'Thực hành thí nghiệm động cơ và ô tô', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2217, N'HTTN0412T', N'Thực hành hệ thống tiện nghi trên ô tô', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2218, N'TVSX0412T', N'Thực hành thân vỏ và sơn xe', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2219, N'CDKT0412L', N'Chẩn đoán trạng thái kỹ thuật ô tô', 2, 7, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2220, N'TNDO0412L', N'Thí nghiệm Động cơ và ô tô', 2, 7, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2221, N'DAOT0411D', N'Đồ án chuyên môn ô tô', 1, 7, 0, 48, 0, 30, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2222, N'TTDO0412L', N'Tính toán động cơ ô tô', 2, 7, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2223, N'NLDC0412T', N'Thực hành nhiên liệu', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2224, N'HTLT0412T', N'Thực hành hệ thống treo, lái', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2225, N'HTPO0412T', N'Thực hành hệ thống phanh', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2226, N'HTTL0412T', N'Thực hành hệ thống truyền lực', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2227, N'DTXO0412T', N'Thực hành điện thân xe', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2228, N'CHNC0414L', N'Công nghệ hàn nóng chảy', 4, 5, 57, 6, 8, 120, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2229, N'LTBD0412L', N'Lý thuyết biến dạng dẻo kim loại', 2, 5, 29, 2, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2230, N'TBVL0413L', N'Thiết bị hàn-Vật liệu hàn', 3, 6, 41, 8, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2232, N'NMKT0712L', N'Nhập môn kinh tế học', 2, 2, 28, 4, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2233, N'MLN20213L', N'Kinh tế chính trị Mác - Lênin', 3, 2, 38, 14, 6, 90, N'01', 149, 1, 1, 1, 90, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'Học phần lý thuyết có hướng dẫn thảo luận')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2234, N'NMCĐ0411L', N'Nhập môn cơ điện tử', 1, 1, 15, 0, 2, 30, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2235, N'XLNH0413T', N'Xây dựng quy trình xử lý nhiệt', 3, 8, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2236, N'XDQT0412T', N'Xây dựng quy trình hàn kết cấu thép', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2237, N'GLKC0413T', N'Gá lắp kết cấu thép', 3, 8, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2238, N'CKTN0418D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2239, N'CGKL0412T', N'Thực hành cắt gọt kim loại', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2240, N'RBHQ0412T', N'Thực hành Rô bốt hàn hồ quang', 2, 8, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2241, N'TTXN0414T', N'Thực tập xí nghiệp', 4, 8, 0, 192, 0, 120, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2242, N'DKLT0612T', N'Thực hành điều khiển lập trình', 2, 7, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2243, N'TMRB0412L', N'Tay máy và Robot công nghiệp', 2, 7, 29, 2, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2244, N'DACK0411D', N'Đồ án kỹ thuật cơ khí', 1, 7, 0, 48, 0, 30, N'04', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2245, N'HPHK0412T', N'Thực hành các phương pháp hàn khác', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2246, N'HTIG0412T', N'Thực hành hàn TIG', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2247, N'HMAG0412T', N'Thực hành hàn MIG/MAG', 2, 7, 0, 68, 0, 60, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2248, N'THQM0413T', N'Thực hành hàn hồ quang que hàn thuốc bọc liên kết giáp mối', 3, 7, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2249, N'KTCL0412L', N'Kiểm tra chất lượng mối hàn', 2, 7, 20, 20, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2250, N'THQG0413T', N'Thực hành hàn hồ quang que hàn thuốc bọc liên kết góc', 3, 6, 0, 102, 0, 90, N'04', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2251, N'GCAL0412L', N'Công nghệ gia công áp lực', 2, 6, 29, 2, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2252, N'UCAE0412L', N'Ứng dụng CAE trong thiết kế', 2, 6, 25, 10, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2253, N'KCHA0413L', N'Kết cấu hàn', 3, 6, 43, 4, 6, 90, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2254, N'TDSX0412L', N'Tự động hóa quá trình sản xuất', 2, 7, 29, 2, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2255, N'TĐCN0612L', N'Tự động hóa quá trình công nghệ', 2, 8, 28, 4, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2256, N'TBTM0613T', N'Thực hành trang bị điện', 3, 7, 0, 102, 0, 90, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
GO
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2257, N'TTDQ0612L', N'Tính toán sửa chữa dây quấn máy điện', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2258, N'NMMH0512L', N'Nhập môn máy học', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2259, N'XLNN0512L', N'Xử lý ngôn ngữ tự nhiên', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2260, N'KPDL0512L', N'Khai phá dữ liệu', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2261, N'QTDA0512L', N'Quản trị dự án phần mềm', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2262, N'QTMA0512L', N'Quản trị mạng', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2264, N'LTCD0513T', N'Thực hành lập trình cơ sở dữ liệu với Java', 3, 6, 0, 101, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2265, N'LTCD0513L', N'Lập trình cơ sở dữ liệu với Java', 3, 6, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2266, N'PMMP0513T', N'Thực hành phần mềm mô phỏng', 3, 5, 0, 101, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2267, N'LTJS0513L', N'Lập trình JSP/Serverlet', 3, 5, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2268, N'HDTJ0513L', N'Lập trình hướng đối tượng với Java', 3, 4, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2269, N'KTCT0212L', N'Kinh tế chính trị Mác - Lênin', 3, 2, 38, 14, 6, 90, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2270, N'THML0213L', N'Triết học Mác - Lênin', 2, 1, 22, 16, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2271, N'KTTK0512T', N'Thực hành kiểm thử và triển khai phần mềm', 2, 8, 0, 68, 0, 60, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2272, N'PTPM0513T', N'Thực hành phát triển phần mềm', 3, 8, 0, 102, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2273, N'PTTK0513T', N'Thực hành phân tích thiết kế hệ thống thông tin', 3, 8, 0, 102, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2274, N'CNTN0518D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'05', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2275, N'PTDD0513T', N'Thực hành phát triển ứng dụng trên thiết bị di động', 3, 8, 0, 102, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2276, N'PUIT0513T', N'Thực hành phát triển ứng dụng Internet Of Thing', 3, 8, 0, 102, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2277, N'TQBM0513T', N'Thực hành thiết kế, quản trị và bảo trì hệ thống mạng', 3, 7, 0, 102, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2278, N'TTNT0512L', N'Trí tuệ nhân tạo', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2279, N'ATDL0512L', N'An toàn dữ liệu', 2, 7, 30, 0, 4, 60, N'05', 140, 1, 1, 1, 1, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2280, N'BMTT0512L', N'Bảo mật thông tin', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2282, N'PTDD0513T', N'Thực hành phát triển ứng dụng trên thiết bị di động', 3, 8, 0, 101, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2283, N'PLKT0213L', N'Pháp luật kinh tế', 3, 6, 40, 10, 6, 90, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2284, N'THK10713T', N'Thực hành kế toán tài chính 1', 3, 5, 0, 102, 0, 90, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2285, N'KTMX0713L', N'Kế toán doanh nghiệp thương mại, dịch vụ và xây lắp', 3, 5, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2286, N'KTC20713L', N'Kế toán tài chính 2', 3, 5, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2287, N'TCDN0713L', N'Tài chính doanh nghiệp', 3, 5, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2288, N'TKDN0712L', N'Thống kê doanh nghiệp', 2, 5, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2289, N'MKCB0713L', N'Marketing căn bản', 3, 5, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2290, N'KTC10713L', N'Kế toán tài chính 1', 3, 4, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2291, N'TCTT0713L', N'Tài chính tiền tệ', 3, 4, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2292, N'NLTK0712L', N'Nguyên lý thống kê kinh tế', 2, 4, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2293, N'THUE0712L', N'Thuế', 2, 4, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2294, N'KTVM0713L', N'Kinh tế học vĩ mô', 3, 4, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2295, N'QTRH0712L', N'Quản trị học', 2, 4, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2296, N'NLKT0713L', N'Nguyên lý kế toán', 3, 3, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2297, N'VIMO0713L', N'Kinh tế học vi mô', 3, 3, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2298, N'TAKT0112L', N'Tiếng anh Kinh tế', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2299, N'THCM0212L', N'Tư tưởng Hồ Chí Minh ', 2, 3, 22, 16, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2300, N'LSHT0712L', N'Lịch sử các học thuyết kinh tế', 2, 2, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2303, N'KHTN0518D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'05', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2304, N'PUIT0513T', N'Thực hành phát triển ứng dụng Internet Of Thing', 3, 8, 0, 101, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2305, N'KTLU0713L', N'Kinh tế lượng', 3, 6, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2306, N'CNPM0512L', N'Công nghệ phần mềm', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2307, N'HDHM0512L', N'Hệ điều hành mạng', 2, 7, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2308, N'TLHC0313L', N'Tâm lý học 234', 3, 3, 45, 0, 6, 90, N'03', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2310, N'TATI0112L', N'Tiếng anh Công nghệ thông tin', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2313, N'KHNG0712L', N'Khởi nghiệp', 2, 2, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2314, N'NMGT0312L', N'Nhập môn khoa học giao tiếp', 2, 2, 30, 0, 4, 60, N'03', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2315, N'VLDC0113L', N'Vật lý đại cương', 3, 2, 45, 0, 6, 90, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2316, N'GTC20112T', N'Giáo dục thể chất 2', 2, 2, 0, 68, 0, 60, N'01', 135, 2, 1, 2, 45, 1, CAST(N'2021-09-16' AS Date), NULL, N'Học phần giáo dục thể chất', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2317, N'TCC20112L', N'Toán cao cấp 2', 2, 2, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2318, N'ANH20113L', N'Tiếng anh 2', 3, 2, 45, 0, 6, 90, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2319, N'KTCT0212L', N'Kinh tế chính trị Mác - Lênin', 2, 2, 22, 16, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2320, N'NMN40712L', N'Nhập môn ngành 4', 2, 1, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2321, N'NMN30512L', N'Nhập môn ngành 3', 2, 1, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2322, N'NMN20612L', N'Nhập môn ngành 2', 2, 1, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2323, N'NMN10412L', N'Nhập môn ngành 1', 2, 1, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2324, N'GTC10111T', N'Giáo dục thể chất 1', 1, 1, 0, 34, 0, 30, N'01', 135, 2, 1, 2, 45, 1, CAST(N'2021-09-16' AS Date), NULL, N'Học phần giáo dục thể chất', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2325, N'TCC10112L', N'Toán cao cấp 1', 2, 1, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2326, N'ANH10112L', N'Tiếng anh 1', 2, 1, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2327, N'NMTH0513L', N'Nhập môn tin học', 3, 1, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2328, N'PLDC0212L', N'Pháp luật đại cương', 2, 1, 28, 4, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2329, N'TCQS0712L', N'Tổ chức quản lý sản xuất', 2, 3, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2330, N'PUNM0514L', N'Phát triển ứng dụng mã nguồn mở', 4, 7, 60, 0, 8, 120, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2331, N'CSDL0513L', N'Cơ sở dữ liệu quan hệ', 3, 3, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2332, N'GTC30111T', N'Giáo dục thể chất 3', 1, 3, 0, 34, 0, 30, N'01', 135, 2, 1, 2, 45, 1, CAST(N'2021-09-16' AS Date), NULL, N'Học phần giáo dục thể chất', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2333, N'DACM0512D', N'Đồ án chuyên môn', 2, 7, 0, 96, 0, 60, N'05', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2334, N'PTUW0513T', N'Thực hành phát triển ứng dụng web', 3, 6, 0, 102, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2335, N'LTUD0513T', N'Thực hành lập trình ứng dụng với Java', 3, 6, 0, 102, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2336, N'TKMA0513L', N'Thiết kế mạng', 3, 6, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2337, N'LTUD0513L', N'Lập trình ứng dụng với Java', 3, 6, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2338, N'KTMT0512L', N'Kiến trúc máy tính', 2, 6, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2339, N'TRRA0513L', N'Toán rời rạc', 3, 6, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2340, N'PMMP0513T', N'Thực hành phần mềm mô phỏng', 3, 5, 0, 102, 0, 90, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2341, N'LTWS0513L', N'Lập trình Web', 3, 5, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2342, N'PTTK0513L', N'Phân tích thiết kế hệ thống thông tin', 3, 5, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2343, N'PTUD0513L', N'Phát triển ứng dụng trên thiết bị di động', 3, 5, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2344, N'LTNC0513L', N'Lập trình Java nâng cao', 3, 5, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2345, N'MMTI0512L', N'Mạng máy tính', 2, 5, 30, 0, 4, 60, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2346, N'DHUD0512T', N'Thực hành đồ họa ứng dụng', 2, 4, 0, 68, 0, 60, N'05', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2347, N'DAUD0512D', N'Đồ án ứng dụng công nghệ thông tin', 2, 4, 0, 96, 0, 60, N'05', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2348, N'HQTC0513L', N'Hệ quản trị cơ sở dữ liệu', 3, 4, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2349, N'TKWS0513L', N'Thiết kế web', 3, 4, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2350, N'LHDT0513L', N'Lập trình hướng đối tượng', 3, 4, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2351, N'CTDL0513L', N'Cấu trúc dữ liệu và giải thuật', 3, 4, 45, 0, 6, 90, N'05', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2352, N'LSVN0212L', N'Lịch sử Đảng cộng sản Việt Nam', 3, 4, 34, 22, 6, 90, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2353, N'GTC40111T', N'Giáo dục thể chất 4', 1, 3, 0, 34, 0, 30, N'01', 135, 2, 1, 2, 45, 1, CAST(N'2021-09-16' AS Date), NULL, N'Học phần giáo dục thể chất', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2354, N'TCD20112L', N'Toán chuyên đề 2', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2355, N'KTNV0712L', N'Kế toán doanh nghiệp nhỏ và vừa', 2, 6, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2356, N'KTCB0712L', N'Kiểm toán căn bản', 2, 6, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2357, N'KQTE0712L', N'Kế toán quốc tế', 2, 6, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2358, N'MTGD0612L', N'Cấu trúc máy tính và giao diện', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2359, N'DADT0611D', N'Đồ án điện, điện tử', 1, 7, 0, 48, 0, 30, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2360, N'KMDT0613T', N'Thực hành kỹ thuật mạch điện tử-mạch in', 3, 6, 0, 102, 0, 90, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2361, N'DTCS0612T', N'Thực hành điện tử công suất', 2, 6, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2362, N'ACAD0611T', N'Thực hành CAD', 1, 6, 0, 34, 0, 30, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2363, N'CNCB0612L', N'Công nghệ cảm biến', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
GO
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2364, N'KTSL0612L', N'Kỹ thuật truyền số liệu', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2365, N'TBDT0612L', N'Trang bị điện, điện tử công nghiệp', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2366, N'VIDK0612L', N'Vi điều khiển', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2367, N'DKLT0612L', N'Điều khiển lập trình', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2368, N'DACS0612D', N'Đồ án cơ sở ngành', 2, 6, 30, 0, 0, 60, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2369, N'DTXS0613T', N'Thực hành điện tử cơ bản-xung số', 3, 5, 0, 102, 0, 90, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2370, N'DICB0612T', N'Thực hành điện cơ bản', 2, 5, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2371, N'DLTB0611T', N'Thực hành đo lường điện và thiết bị đo', 1, 5, 0, 34, 0, 30, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2372, N'KMDT0613L', N'Kỹ thuật mạch điện tử', 3, 5, 45, 0, 6, 90, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2373, N'NNLT0612L', N'Ngôn ngữ lập trình', 2, 5, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2374, N'DTCS0612L', N'Điện tử công suất', 2, 5, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2375, N'CCDI0613L', N'Cung cấp điện', 3, 5, 45, 0, 6, 90, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2376, N'VIXL0612L', N'Vi xử lý', 2, 5, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2377, N'MAYD0612L', N'Máy điện', 2, 4, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2378, N'KYTS0612L', N'Kỹ thuật số', 2, 4, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2379, N'SCAD0612L', N'Hệ thống SCADA', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2380, N'MHD20612L', N'Mạch điện 2', 2, 4, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2381, N'AUVI0612L', N'Kỹ thuật Audio và Video', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2382, N'VIDK0612T', N'Thực hành vi điều khiển', 2, 7, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2383, N'DAKT0612D', N'Đồ án kỹ thuật điện', 2, 7, 30, 0, 0, 60, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2384, N'TKNL0612L', N'Sử dụng năng lượng tiết kiệm và hiệu quả', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2385, N'CTBD0612L', N'Công nghệ chế tạo thiết bị điện', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2386, N'DKTD0613L', N'Điều khiển tự động', 3, 6, 45, 0, 6, 90, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2387, N'NMBA0612L', N'Nhà máy điện và trạm biến áp', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2388, N'HTDI0612L', N'Hệ thống điện', 2, 6, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2389, N'TBTM0613L', N'Trang bị điện, điện tử trên máy', 3, 6, 45, 0, 6, 90, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2390, N'MDI20612L', N'Máy điện 2', 2, 5, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2391, N'TRDD0612L', N'Truyền động điện', 2, 5, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2392, N'MDI10612L', N'Máy điện 1', 2, 4, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2393, N'TBDT0613T', N'Thực hành thiết bị điện tử', 3, 8, 0, 102, 0, 90, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2394, N'DTNC0613L', N'Thực hành điện tử nâng cao', 3, 8, 0, 102, 6, 90, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2395, N'VHDL0612T', N'Thực hành thiết kế vi mạch số với HDL', 2, 8, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2396, N'DTTN0618D', N'Đồ án/Khoá luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'06', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2397, N'BTCN0612T', N'Thực hành biến tần công nghiệp', 2, 8, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2398, N'SCAD0612T', N'Thực hành SCADA', 2, 8, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2399, N'TBDT0612T', N'Thực hành trang bị điện, điện tử công nghiệp', 2, 8, 0, 68, 0, 60, N'06', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2400, N'TBTM0612L', N'Điều khiển thiết bị thông minh', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2401, N'ANAT0612L', N'Hệ thống kiểm soát an ninh, an toàn', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2402, N'KTLU0612L', N'Kỹ thuật lạnh ứng dụng', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2403, N'KTNL0612L', N'Kỹ thuật nhiệt lạnh', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2404, N'TKDT0612L', N'Thiết kế mạch điện tử', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2405, N'DLTB0612L', N'Đo lường điện và thiết bị đo', 2, 4, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2406, N'ATLD0612L', N'An toàn lao động', 2, 4, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2407, N'VEKT0412L', N'Vẽ kỹ thuật', 2, 4, 30, 0, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2408, N'NCKH0712T', N'Nghiên cứu khách hàng', 2, 5, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2409, N'QTCL0713L', N'Quản trị chiến lược', 3, 5, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2410, N'QTDN0712L', N'Quản trị doanh nghiệp', 2, 4, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2411, N'KTNH0712T', N'Kế toán ngân hàng', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2412, N'KTHS0712T', N'Kế toán hành chính sự nghiệp', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2413, N'QTTC0712T', N'Quản trị tài chính', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2414, N'BAHI0712T', N'Bảo hiểm', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2415, N'KLTN0718D', N'Đồ án/Khóa luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'07', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2416, N'THQT0712T', N'Thực hành kế toán quản trị', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2417, N'KTHU0712T', N'Thực hành kế toán thuế', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2418, N'THMX0712T', N'Thực hành kế toán doanh nghiệp thương mại, dịch vụ và xây lắp', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2419, N'TTCS0713T', N'Thực tập cơ sở', 3, 7, 0, 144, 0, 90, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2420, N'KMAY0712T', N'Thực hành kế toán máy', 2, 7, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2421, N'KITC0712L', N'Kiểm toán tài chính', 2, 7, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2422, N'PTBC0712T', N'Phân tích báo cáo tài chính', 2, 7, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2423, N'PTKD0713L', N'Phân tích hoạt động kinh doanh', 3, 7, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2424, N'KTQR0712L', N'Kế toán quản trị', 2, 7, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2425, N'CDKT0712D', N'Chuyên đề kế toán tài chính', 2, 7, 0, 96, 0, 60, N'07', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2426, N'TTQT0712L', N'Thanh toán quốc tế', 2, 6, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2427, N'LPDA0712L', N'Lập và phân tích dự án đầu tư', 2, 6, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2428, N'THK20712T', N'Thực hành kế toán tài chính 2', 2, 6, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2429, N'QTTN0712T', N'Quản trị tác nghiệp', 2, 5, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2430, N'KTPT0712L', N'Kinh tế phát triển', 2, 5, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2431, N'KTQT0712L', N'Kinh tế quốc tế', 2, 5, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2432, N'PLKT0213L', N'Pháp luật kinh tế', 3, 6, 45, 0, 6, 90, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2433, N'DTCB0613L', N'Điện tử cơ bản', 3, 4, 45, 0, 6, 90, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2434, N'TCD30112L', N'Toán chuyên đề 3', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2435, N'VLKC0612L', N'Vật liệu điện-Khí cụ điện', 2, 3, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2436, N'MHD10612L', N'Mạch điện 1', 2, 3, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2437, N'TADT0112L', N'Tiếng anh điện', 2, 3, 30, 0, 4, 60, N'01', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2438, N'DNTM0712T', N'Quản trị doanh nghiệp thương mại', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2439, N'GTDP0712T', N'Giao tiếp và đàm phán trong kinh doanh', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2440, N'QTRR0712T', N'Quản trị rủi ro', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2441, N'QTTN0718D', N'Đồ án/Khóa luận tốt nghiệp', 8, 8, 0, 384, 0, 240, N'07', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2442, N'KSKD0712T', N'Khởi sự kinh doanh', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2443, N'DBMS0612L', N'Điều khiển giám sát hệ thống điện tòa nhà', 2, 7, 30, 0, 4, 60, N'06', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2444, N'QTHP0712T', N'Quản trị hành chính văn phòng', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2445, N'QTBH0712T', N'Quản trị bán hàng', 2, 7, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2446, N'TMDT0712L', N'Thương mại điện tử', 2, 7, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2447, N'QKQO0712L', N'Quản trị kinh doanh quốc tế', 2, 7, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2448, N'QTHC0713L', N'Quản trị hậu cần kinh doanh', 3, 7, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2449, N'QTDN0711D', N'Chuyên đề quản trị doanh nghiệp', 1, 7, 0, 34, 0, 30, N'07', NULL, 3, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2450, N'KTDT0712L', N'Kinh tế đầu tư', 2, 6, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2451, N'BCKD0712T', N'Báo cáo phân tích hoạt động kinh doanh', 2, 6, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2452, N'PTKD0712L', N'Phân tích hoạt động kinh doanh', 2, 6, 30, 0, 4, 60, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2453, N'QTNL0713L', N'Quản trị nhân lực', 3, 6, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2454, N'QCLG0713L', N'Quản trị chất lượng', 3, 6, 45, 0, 6, 90, N'07', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2455, N'TMQT0712T', N'Kỹ thuật thương mại quốc tế', 2, 8, 0, 68, 0, 60, N'07', NULL, 2, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2456, N'MDRB0412L', N'Máy điều khiển số và rôbôt công nghiệp', 2, 8, 28, 4, 4, 60, N'04', NULL, 1, 1, NULL, 0, 1, CAST(N'2021-09-16' AS Date), NULL, N'', N'')
INSERT [dbo].[HocPhan] ([idHocPhan], [MaHocPhan], [TenHocPhan], [SoTinChi], [ThuocHocKy], [SoTietLyThuyet], [SoTietThaoLuanThiNghiemThucHanh], [HuongDanTuHoc], [SoGioChuanBiTuHoc], [idKhoa], [idBoMon], [idLoaiHocPhan], [idTrinhDo], [IdHinhThucThi], [ThoiGianThi], [CoNganHangDe], [ThoiGianBatDau], [ThoiGianKetThuc], [DangThucHanh], [DangLyThuyet]) VALUES (2465, N'CNKH0212L', N'Chủ nghĩa xã hội khoa học', 2, 3, 22, 16, 4, 60, N'01', 137, 1, 1, 1, 1, 0, CAST(N'2021-09-19' AS Date), NULL, N'', N'Học phần lý thuyết có hướng dẫn thảo luận')
SET IDENTITY_INSERT [dbo].[HocPhan] OFF
INSERT [dbo].[Khoa] ([idKhoa], [TenKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'01', N'Giáo dục Đại cương', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[Khoa] ([idKhoa], [TenKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'03', N'Sư phạm Kỹ thuật', CAST(N'2021-09-09' AS Date), NULL)
INSERT [dbo].[Khoa] ([idKhoa], [TenKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'04', N'Cơ khí', CAST(N'2021-09-06' AS Date), NULL)
INSERT [dbo].[Khoa] ([idKhoa], [TenKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'05', N'Công nghệ Thông Tin', CAST(N'2021-09-01' AS Date), NULL)
INSERT [dbo].[Khoa] ([idKhoa], [TenKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'06', N'Điện', CAST(N'2021-09-01' AS Date), NULL)
INSERT [dbo].[Khoa] ([idKhoa], [TenKhoa], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'07', N'Kinh tế', CAST(N'2021-09-09' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[LoaiCongViec] ON 

INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (1, N'Giảng viên                                                                                ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (3, N'Cán sự                                                                                    ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (5, N'Kế toán viên                                                                              ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (6, N'Kế toán trưởng                                                                            ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (7, N'Bác sỹ                                                                                    ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (9, N'Kỹ sư                                                                                     ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (10, N'Chuyên viên                                                                               ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (11, N'Giáo viên                                                                                 ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (12, N'Nhân viên                                                                                 ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (13, N'Giảng viên chính                                                                          ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (14, N'Giảng viên cao cấp                                                                        ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (15, N'Chuyên viên chính                                                                         ')
INSERT [dbo].[LoaiCongViec] ([idLoaiCongViec], [TenLoaiCongViec]) VALUES (16, N'Thư viện viên                                                                             ')
SET IDENTITY_INSERT [dbo].[LoaiCongViec] OFF
SET IDENTITY_INSERT [dbo].[LoaiHocPhan] ON 

INSERT [dbo].[LoaiHocPhan] ([idLoaiHocPhan], [TenLoaiHocPhan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (1, N'Lý thuyết', CAST(N'2011-11-11' AS Date), NULL)
INSERT [dbo].[LoaiHocPhan] ([idLoaiHocPhan], [TenLoaiHocPhan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (2, N'Thực hành', CAST(N'2011-11-11' AS Date), NULL)
INSERT [dbo].[LoaiHocPhan] ([idLoaiHocPhan], [TenLoaiHocPhan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (3, N'Đồ án', CAST(N'2011-11-11' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[LoaiHocPhan] OFF
SET IDENTITY_INSERT [dbo].[LoaiQuyDinh] ON 

INSERT [dbo].[LoaiQuyDinh] ([idLoaiQuyDinh], [TenLoaiQuyDinh]) VALUES (14, N'Quy định về học phần')
INSERT [dbo].[LoaiQuyDinh] ([idLoaiQuyDinh], [TenLoaiQuyDinh]) VALUES (15, N'Quy định về định mức giảng dạy')
INSERT [dbo].[LoaiQuyDinh] ([idLoaiQuyDinh], [TenLoaiQuyDinh]) VALUES (18, N'Quy định quy đổi giờ chuẩn')
SET IDENTITY_INSERT [dbo].[LoaiQuyDinh] OFF
SET IDENTITY_INSERT [dbo].[MienGiamTheoTrangThaiLamViec] ON 

INSERT [dbo].[MienGiamTheoTrangThaiLamViec] ([idMienGiamTheoTrangThaiLamViec], [idTrangThaiLamViec], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (1, 1, 100, CAST(N'2021-09-29' AS Date), CAST(N'2021-09-22' AS Date))
INSERT [dbo].[MienGiamTheoTrangThaiLamViec] ([idMienGiamTheoTrangThaiLamViec], [idTrangThaiLamViec], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (6, 4, 50, CAST(N'2019-09-29' AS Date), NULL)
INSERT [dbo].[MienGiamTheoTrangThaiLamViec] ([idMienGiamTheoTrangThaiLamViec], [idTrangThaiLamViec], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (7, 6, 12.5, CAST(N'2019-09-29' AS Date), NULL)
INSERT [dbo].[MienGiamTheoTrangThaiLamViec] ([idMienGiamTheoTrangThaiLamViec], [idTrangThaiLamViec], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (8, 7, 100, CAST(N'2021-09-29' AS Date), NULL)
INSERT [dbo].[MienGiamTheoTrangThaiLamViec] ([idMienGiamTheoTrangThaiLamViec], [idTrangThaiLamViec], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (9, 8, 0, CAST(N'2021-09-29' AS Date), NULL)
INSERT [dbo].[MienGiamTheoTrangThaiLamViec] ([idMienGiamTheoTrangThaiLamViec], [idTrangThaiLamViec], [GiaTri], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (10, 9, 10, CAST(N'2021-09-29' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[MienGiamTheoTrangThaiLamViec] OFF
SET IDENTITY_INSERT [dbo].[NamHoc] ON 

INSERT [dbo].[NamHoc] ([idNamHoc], [TenNamHoc]) VALUES (12, N'2017-2018')
INSERT [dbo].[NamHoc] ([idNamHoc], [TenNamHoc]) VALUES (14, N'2019-2020')
INSERT [dbo].[NamHoc] ([idNamHoc], [TenNamHoc]) VALUES (15, N'2020-2021')
SET IDENTITY_INSERT [dbo].[NamHoc] OFF
SET IDENTITY_INSERT [dbo].[NamHocHocKy] ON 

INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (6, 12, 1, CAST(N'2021-08-27' AS Date), CAST(N'2021-08-27' AS Date), 44)
INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (7, 12, 2, CAST(N'2021-08-27' AS Date), CAST(N'2021-08-27' AS Date), 44)
INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (8, 12, 3, CAST(N'2021-08-27' AS Date), CAST(N'2021-08-27' AS Date), 44)
INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (9, 14, 1, CAST(N'2021-09-06' AS Date), CAST(N'2021-09-06' AS Date), 44)
INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (10, 14, 2, CAST(N'2021-09-06' AS Date), CAST(N'2021-09-06' AS Date), 44)
INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (11, 14, 3, CAST(N'2021-09-06' AS Date), CAST(N'2021-09-06' AS Date), 44)
INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (12, 15, 1, CAST(N'2022-01-06' AS Date), CAST(N'2021-09-06' AS Date), 44)
INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (13, 15, 2, CAST(N'2022-06-06' AS Date), CAST(N'2022-01-07' AS Date), 44)
INSERT [dbo].[NamHocHocKy] ([idNamHocHocKy], [idNamHoc], [idHocKy], [ThoiGianKetThuc], [ThoiGianBatDau], [SoTuan]) VALUES (14, 15, 3, CAST(N'2022-08-07' AS Date), CAST(N'2022-06-07' AS Date), 44)
SET IDENTITY_INSERT [dbo].[NamHocHocKy] OFF
SET IDENTITY_INSERT [dbo].[PhanCongGiangDay] ON 

INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (53, 86, 810, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (56, 85, 822, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (57, 84, 820, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (58, 83, 670, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (59, 78, 834, 33, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (61, 78, 822, 33, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (63, 76, 834, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (64, 75, 834, 45, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (65, 75, 823, 21, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (66, 93, 822, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (67, 73, 822, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (68, 77, 810, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (69, 174, 810, 60, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (72, 100, 822, 49.5, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (73, 101, 810, 33, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (74, 102, 822, 49.5, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (76, 79, 810, 44, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (77, 80, 834, 44, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (78, 81, 832, 44, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (79, 82, 834, 44, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (80, 87, 825, 31, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (81, 87, 832, 35, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (82, 88, 834, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (83, 89, 833, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (84, 90, 810, 66, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (85, 91, 833, 36, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (86, 91, 834, 20, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (87, 91, 810, 10, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (88, 92, 834, 31, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (89, 103, 832, 49.5, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (90, 92, 810, 35, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (91, 181, 833, 60, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (94, 46, 822, 30, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (95, 46, 821, 28.5, NULL, NULL)
INSERT [dbo].[PhanCongGiangDay] ([IdPhanCongGiangDay], [idBaoGioGiangDayChiTiet], [idGiaoVien], [SoGioHoacTuanHoacSoNguoi], [GhiChu], [idNamHocHocKy]) VALUES (97, 99, 832, 49.5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PhanCongGiangDay] OFF
SET IDENTITY_INSERT [dbo].[PhongTrungTam] ON 

INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (1, N'Đào tạo Bồi dưỡng', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (2, N'Kế toán', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (3, N'Khoa học', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (4, N'Quản trị Thiết bị', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (5, N'Sinh viên', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (6, N'Tổ chức Cán bộ', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (7, N'Thanh tra', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (8, N'Thực hành', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (9, N'Đào tạo', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (10, N'Ban Giám hiệu', CAST(N'0001-01-01' AS Date), NULL)
INSERT [dbo].[PhongTrungTam] ([idPhongTrungTam], [TenPhongTrungTam], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (12, N'LLCT', CAST(N'0001-01-01' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[PhongTrungTam] OFF
SET IDENTITY_INSERT [dbo].[QuyDinh] ON 

INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (2, 14, N'Số giờ tự học cho 1 tín chỉ')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (3, 14, N'Số giờ hướng dẫn tự học cho 1 tín chỉ')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (7, 15, N'Nhiệm vụ giảng dạy')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (8, 14, N'Số giờ lý thuyết 1 tín chỉ')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (9, 14, N'Số giờ thực hành 1 tín chỉ')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (10, 14, N'Số tiết thí nghiệm thảo luận 1 tín chỉ')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (11, 14, N'Sồ giờ thực tập cơ sở, làm đồ án hoặc khóa luận tốt nghiệp 1 tín chỉ')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (44, 15, N'Nghiên cứu khoa học')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (45, 15, N'Phục vụ cộng đồng')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (46, 15, N'Giảng viên tập sự')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (47, 18, N'Quy đổi hướng dẫn tự học')
INSERT [dbo].[QuyDinh] ([idQuyDinh], [idLoaiQuyDinh], [TenQuyDinh]) VALUES (48, 18, N'Số sinh viên tối đa được thêm trong thực hành')
SET IDENTITY_INSERT [dbo].[QuyDinh] OFF
SET IDENTITY_INSERT [dbo].[QuyDinhChiTiet] ON 

INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (16, 3, 2, NULL, CAST(N'2019-08-15' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (17, 2, 30, NULL, CAST(N'2021-08-18' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (18, 7, 300, NULL, CAST(N'2021-09-15' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (19, 8, 15, NULL, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (20, 9, 34, NULL, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (21, 10, 30, NULL, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (22, 11, 48, NULL, CAST(N'2021-08-17' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (23, 10, 29, CAST(N'2021-08-16' AS Date), CAST(N'2013-09-18' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (25, 8, 100, CAST(N'2021-08-16' AS Date), CAST(N'2013-09-18' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (26, 2, 15, CAST(N'2021-08-17' AS Date), CAST(N'2013-09-18' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (27, 11, 24, CAST(N'2021-08-16' AS Date), CAST(N'2013-09-18' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (28, 9, 17, CAST(N'2021-08-16' AS Date), CAST(N'2013-09-18' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (63, 44, 200, NULL, CAST(N'2019-09-29' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (64, 45, 86, NULL, CAST(N'2019-09-29' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (65, 46, 150, NULL, CAST(N'2019-09-29' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (66, 47, 1.5, NULL, CAST(N'2020-10-11' AS Date))
INSERT [dbo].[QuyDinhChiTiet] ([idQuyDinhChiTiet], [idQuyDinh], [GiaTri], [ThoiGianKetThuc], [ThoiGianBatDau]) VALUES (67, 48, 10, NULL, CAST(N'2020-10-12' AS Date))
SET IDENTITY_INSERT [dbo].[QuyDinhChiTiet] OFF
SET IDENTITY_INSERT [dbo].[QuyDinhGioChuanThucHanh] ON 

INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 1, N'05', 1, 20, 20, CAST(N'2020-10-10' AS Date), CAST(N'2021-10-10' AS Date))
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 2, N'05', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 3, N'05', 26, 30, 24, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 4, N'07', 1, 30, 20, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 5, N'07', 31, 35, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 6, N'07', 36, 40, 24, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 7, N'05', 1, 20, 20, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 8, N'05', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 9, N'05', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 10, N'04', 1, 20, 20, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 11, N'04', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 12, N'04', 26, 30, 24, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 13, N'06', 1, 20, 20, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 14, N'06', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Giờ dạy thực hành', 15, N'06', 26, 30, 24, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 16, N'04', 1, 20, 20, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 17, N'04', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 18, N'04', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 19, N'06', 1, 20, 20, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 20, N'06', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
INSERT [dbo].[QuyDinhGioChuanThucHanh] ([TenNoiDungGiangDay], [idQuyDinhGioChuanThucHanh], [idKhoa], [CanDuoi], [CanTren], [SoGioChuan], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'Hướng dẫn thực tập sư phạm', 21, N'06', 21, 25, 22, CAST(N'2020-10-10' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[QuyDinhGioChuanThucHanh] OFF
SET IDENTITY_INSERT [dbo].[QuyDinhSiSoLopHocPhan] ON 

INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (5, 71, 80, 1.4, CAST(N'2020-10-09' AS Date), NULL, N'Học phần lý thuyết')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (7, 81, 120, 1.5, CAST(N'2020-10-09' AS Date), NULL, N'Học phần lý thuyết')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (8, 1, 49, 1, CAST(N'2020-10-09' AS Date), NULL, N'Học phần giáo dục thể chất')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (9, 50, 64, 1.1, CAST(N'2020-10-09' AS Date), NULL, N'Học phần giáo dục thể chất')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (10, 65, 80, 1.2, CAST(N'2020-10-09' AS Date), NULL, N'Học phần giáo dục thể chất')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (11, 1, 20, 0.6, CAST(N'2021-10-09' AS Date), NULL, N'Học phần thực hành ngoại ngữ')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (12, 21, 25, 0.65, CAST(N'2020-10-09' AS Date), NULL, N'Học phần thực hành ngoại ngữ')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (13, 26, 30, 0.7, CAST(N'2020-10-09' AS Date), NULL, N'Học phần thực hành ngoại ngữ')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (14, 1, 32, 0.5, CAST(N'2020-10-09' AS Date), NULL, N'Học phần có hướng dẫn thí nghiệm')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (15, 33, 40, 0.75, CAST(N'2020-10-09' AS Date), NULL, N'Học phần có hướng dẫn thí nghiệm')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (16, 1, 40, 0.5, CAST(N'2020-10-09' AS Date), NULL, N'Học phần có hướng dẫn thảo luận')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (17, 41, 55, 0.75, CAST(N'2020-10-09' AS Date), NULL, N'Học phần có hướng dẫn thảo luận')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (18, 1, 40, 1, CAST(N'2020-10-10' AS Date), NULL, N'Học phần lý thuyết')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (19, 41, 50, 1.1, CAST(N'2020-10-10' AS Date), NULL, N'Học phần lý thuyết')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (20, 51, 60, 1.2, CAST(N'2020-10-10' AS Date), NULL, N'Học phần lý thuyết')
INSERT [dbo].[QuyDinhSiSoLopHocPhan] ([idQuyDinhSiSoLopHocPhanLyThuyet], [CanDuoi], [CanTren], [HeSoSiSo], [ThoiGianBatDau], [ThoiGianKetThuc], [DangHocPhan]) VALUES (21, 61, 70, 1.3, CAST(N'2020-10-10' AS Date), NULL, N'Học phần lý thuyết')
SET IDENTITY_INSERT [dbo].[QuyDinhSiSoLopHocPhan] OFF
SET IDENTITY_INSERT [dbo].[TrangThaiLamViec] ON 

INSERT [dbo].[TrangThaiLamViec] ([idTrangThaiLamViec], [TenTrangThaiLamViec]) VALUES (1, N'Nghiên cứu sinh tập trung')
INSERT [dbo].[TrangThaiLamViec] ([idTrangThaiLamViec], [TenTrangThaiLamViec]) VALUES (4, N'Nghiên cứu sinh không tập trung')
INSERT [dbo].[TrangThaiLamViec] ([idTrangThaiLamViec], [TenTrangThaiLamViec]) VALUES (6, N'Giảng viên nữ nuôi con nhỏ dưới 12 tháng')
INSERT [dbo].[TrangThaiLamViec] ([idTrangThaiLamViec], [TenTrangThaiLamViec]) VALUES (7, N'Thỉnh giảng')
INSERT [dbo].[TrangThaiLamViec] ([idTrangThaiLamViec], [TenTrangThaiLamViec]) VALUES (8, N'Giảng viên')
INSERT [dbo].[TrangThaiLamViec] ([idTrangThaiLamViec], [TenTrangThaiLamViec]) VALUES (9, N'Giáo viên')
SET IDENTITY_INSERT [dbo].[TrangThaiLamViec] OFF
SET IDENTITY_INSERT [dbo].[TrinhDo] ON 

INSERT [dbo].[TrinhDo] ([idTrinhDo], [TenTrinhDo], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (1, N'Đại học', CAST(N'2021-01-01' AS Date), NULL)
INSERT [dbo].[TrinhDo] ([idTrinhDo], [TenTrinhDo], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (2, N'Cao đẳng', CAST(N'2021-01-01' AS Date), NULL)
INSERT [dbo].[TrinhDo] ([idTrinhDo], [TenTrinhDo], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (3, N'Thạc sỹ', CAST(N'2021-01-01' AS Date), NULL)
INSERT [dbo].[TrinhDo] ([idTrinhDo], [TenTrinhDo], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (4, N'Đại học liên thông', CAST(N'2021-01-01' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[TrinhDo] OFF
ALTER TABLE [dbo].[BaoGioCoiHoiThi]  WITH CHECK ADD  CONSTRAINT [FK_BaoGioCoiHoiThi_NamHocHocKy] FOREIGN KEY([IdNamHocHocKy])
REFERENCES [dbo].[NamHocHocKy] ([idNamHocHocKy])
GO
ALTER TABLE [dbo].[BaoGioCoiHoiThi] CHECK CONSTRAINT [FK_BaoGioCoiHoiThi_NamHocHocKy]
GO
ALTER TABLE [dbo].[BaoGioGiangDay]  WITH CHECK ADD  CONSTRAINT [FK_BaoGioGiangDay_NamHocHocKy] FOREIGN KEY([IdNamHocHocKy])
REFERENCES [dbo].[NamHocHocKy] ([idNamHocHocKy])
GO
ALTER TABLE [dbo].[BaoGioGiangDay] CHECK CONSTRAINT [FK_BaoGioGiangDay_NamHocHocKy]
GO
ALTER TABLE [dbo].[BaoGioGiangDayChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_BaoGioGiangDayChiTiet_BaoGioCoiHoiThi] FOREIGN KEY([IdBaoGioCoiHoiThi])
REFERENCES [dbo].[BaoGioCoiHoiThi] ([idBaoGioCoiHoiThi])
GO
ALTER TABLE [dbo].[BaoGioGiangDayChiTiet] CHECK CONSTRAINT [FK_BaoGioGiangDayChiTiet_BaoGioCoiHoiThi]
GO
ALTER TABLE [dbo].[BaoGioGiangDayChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_BaoGioGiangDayChiTiet_HocPhan] FOREIGN KEY([idHocPhan])
REFERENCES [dbo].[HocPhan] ([idHocPhan])
GO
ALTER TABLE [dbo].[BaoGioGiangDayChiTiet] CHECK CONSTRAINT [FK_BaoGioGiangDayChiTiet_HocPhan]
GO
ALTER TABLE [dbo].[BaoGioGiangDayChiTiet]  WITH CHECK ADD  CONSTRAINT [tblBaoGioGiangDayChiTiet_fk0] FOREIGN KEY([idBaoGioGiangDay])
REFERENCES [dbo].[BaoGioGiangDay] ([idBaoGioGiangDay])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BaoGioGiangDayChiTiet] CHECK CONSTRAINT [tblBaoGioGiangDayChiTiet_fk0]
GO
ALTER TABLE [dbo].[BaoGioTrungTamChiTiet]  WITH CHECK ADD  CONSTRAINT [tblBaoGioTrungTamChiTiet_fk0] FOREIGN KEY([idBaoGioTrungTam])
REFERENCES [dbo].[BaoGioTrungTam] ([idBaoGioTrungTam])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BaoGioTrungTamChiTiet] CHECK CONSTRAINT [tblBaoGioTrungTamChiTiet_fk0]
GO
ALTER TABLE [dbo].[BoMon]  WITH CHECK ADD  CONSTRAINT [FK_tblBoMon_tblKhoa] FOREIGN KEY([idKhoa])
REFERENCES [dbo].[Khoa] ([idKhoa])
GO
ALTER TABLE [dbo].[BoMon] CHECK CONSTRAINT [FK_tblBoMon_tblKhoa]
GO
ALTER TABLE [dbo].[CacHeSoLuong]  WITH CHECK ADD  CONSTRAINT [FK_HeSoLuong_GiaoVien] FOREIGN KEY([idGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
GO
ALTER TABLE [dbo].[CacHeSoLuong] CHECK CONSTRAINT [FK_HeSoLuong_GiaoVien]
GO
ALTER TABLE [dbo].[ChiTietLoaiDeTai]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietLoaiDeTai_tblLoaiDeTai] FOREIGN KEY([idLoaiDeTai])
REFERENCES [dbo].[LoaiDeTai] ([idLoaiDeTai])
GO
ALTER TABLE [dbo].[ChiTietLoaiDeTai] CHECK CONSTRAINT [FK_tblChiTietLoaiDeTai_tblLoaiDeTai]
GO
ALTER TABLE [dbo].[GiaoVien]  WITH CHECK ADD  CONSTRAINT [tblGiaoVien_fk1] FOREIGN KEY([idNguoiDung])
REFERENCES [dbo].[NguoiDung] ([idNguoiDung])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GiaoVien] CHECK CONSTRAINT [tblGiaoVien_fk1]
GO
ALTER TABLE [dbo].[GiaoVienChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienChiTiet_BoMon] FOREIGN KEY([idBoMon])
REFERENCES [dbo].[BoMon] ([idBoMon])
GO
ALTER TABLE [dbo].[GiaoVienChiTiet] CHECK CONSTRAINT [FK_GiaoVienChiTiet_BoMon]
GO
ALTER TABLE [dbo].[GiaoVienChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienChiTiet_GiaoVien] FOREIGN KEY([idGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
GO
ALTER TABLE [dbo].[GiaoVienChiTiet] CHECK CONSTRAINT [FK_GiaoVienChiTiet_GiaoVien]
GO
ALTER TABLE [dbo].[GiaoVienChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienChiTiet_LoaiCongViec] FOREIGN KEY([idLoaiCongViec])
REFERENCES [dbo].[LoaiCongViec] ([idLoaiCongViec])
GO
ALTER TABLE [dbo].[GiaoVienChiTiet] CHECK CONSTRAINT [FK_GiaoVienChiTiet_LoaiCongViec]
GO
ALTER TABLE [dbo].[GiaoVienChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienChiTiet_PhongTrungTam] FOREIGN KEY([idPhongTrungTam])
REFERENCES [dbo].[PhongTrungTam] ([idPhongTrungTam])
GO
ALTER TABLE [dbo].[GiaoVienChiTiet] CHECK CONSTRAINT [FK_GiaoVienChiTiet_PhongTrungTam]
GO
ALTER TABLE [dbo].[GiaoVienChucVu]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienChucVu_ChucVu] FOREIGN KEY([IdChucVu])
REFERENCES [dbo].[ChucVu] ([idChucVu])
GO
ALTER TABLE [dbo].[GiaoVienChucVu] CHECK CONSTRAINT [FK_GiaoVienChucVu_ChucVu]
GO
ALTER TABLE [dbo].[GiaoVienChucVu]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienChucVu_GiaoVien] FOREIGN KEY([IdGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
GO
ALTER TABLE [dbo].[GiaoVienChucVu] CHECK CONSTRAINT [FK_GiaoVienChucVu_GiaoVien]
GO
ALTER TABLE [dbo].[GiaoVienTrangThaiLamViec]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienCongViecChiTiet_GiaoVien] FOREIGN KEY([idGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
GO
ALTER TABLE [dbo].[GiaoVienTrangThaiLamViec] CHECK CONSTRAINT [FK_GiaoVienCongViecChiTiet_GiaoVien]
GO
ALTER TABLE [dbo].[GiaoVienTrangThaiLamViec]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienTrangThaiLamViec_TrangThaiLamViec] FOREIGN KEY([idTrangThaiLamViec])
REFERENCES [dbo].[TrangThaiLamViec] ([idTrangThaiLamViec])
GO
ALTER TABLE [dbo].[GiaoVienTrangThaiLamViec] CHECK CONSTRAINT [FK_GiaoVienTrangThaiLamViec_TrangThaiLamViec]
GO
ALTER TABLE [dbo].[GioChuanNghienCuuKhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblGioChuanNghienCuuKhoaHoc_tblChiTietLoaiDeTai] FOREIGN KEY([idChiTietLoaiDeTai])
REFERENCES [dbo].[ChiTietLoaiDeTai] ([idChiTietLoaiDeTai])
GO
ALTER TABLE [dbo].[GioChuanNghienCuuKhoaHoc] CHECK CONSTRAINT [FK_tblGioChuanNghienCuuKhoaHoc_tblChiTietLoaiDeTai]
GO
ALTER TABLE [dbo].[HeSoChucVu]  WITH CHECK ADD  CONSTRAINT [FK_HeSoChucVu_ChucVu] FOREIGN KEY([IdChucVu])
REFERENCES [dbo].[ChucVu] ([idChucVu])
GO
ALTER TABLE [dbo].[HeSoChucVu] CHECK CONSTRAINT [FK_HeSoChucVu_ChucVu]
GO
ALTER TABLE [dbo].[HocPhan]  WITH CHECK ADD  CONSTRAINT [FK_HocPhan_Khoa] FOREIGN KEY([idKhoa])
REFERENCES [dbo].[Khoa] ([idKhoa])
GO
ALTER TABLE [dbo].[HocPhan] CHECK CONSTRAINT [FK_HocPhan_Khoa]
GO
ALTER TABLE [dbo].[HocPhan]  WITH CHECK ADD  CONSTRAINT [FK_tblHocPhan_tblHinhThucThi] FOREIGN KEY([IdHinhThucThi])
REFERENCES [dbo].[HinhThucThi] ([idHinhThucThi])
GO
ALTER TABLE [dbo].[HocPhan] CHECK CONSTRAINT [FK_tblHocPhan_tblHinhThucThi]
GO
ALTER TABLE [dbo].[HocPhan]  WITH CHECK ADD  CONSTRAINT [FK_tblHocPhan_tblLoaiMonHoc] FOREIGN KEY([idLoaiHocPhan])
REFERENCES [dbo].[LoaiHocPhan] ([idLoaiHocPhan])
GO
ALTER TABLE [dbo].[HocPhan] CHECK CONSTRAINT [FK_tblHocPhan_tblLoaiMonHoc]
GO
ALTER TABLE [dbo].[HocPhan]  WITH CHECK ADD  CONSTRAINT [FK_tblHocPhan_tblTrinhDo] FOREIGN KEY([idTrinhDo])
REFERENCES [dbo].[TrinhDo] ([idTrinhDo])
GO
ALTER TABLE [dbo].[HocPhan] CHECK CONSTRAINT [FK_tblHocPhan_tblTrinhDo]
GO
ALTER TABLE [dbo].[HocPhan]  WITH CHECK ADD  CONSTRAINT [tblHocPhan_fk0] FOREIGN KEY([idBoMon])
REFERENCES [dbo].[BoMon] ([idBoMon])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HocPhan] CHECK CONSTRAINT [tblHocPhan_fk0]
GO
ALTER TABLE [dbo].[LoaiDeTai]  WITH CHECK ADD  CONSTRAINT [FK_tblLoaiDeTai_tblHoatDongNCKH] FOREIGN KEY([idHoatDongNCKH])
REFERENCES [dbo].[HoatDongNCKH] ([idHoatDongNCKH])
GO
ALTER TABLE [dbo].[LoaiDeTai] CHECK CONSTRAINT [FK_tblLoaiDeTai_tblHoatDongNCKH]
GO
ALTER TABLE [dbo].[MienGiamTheoTrangThaiLamViec]  WITH CHECK ADD  CONSTRAINT [FK_MienGiamTheoTrangThaiGiaoVien_TrangThaiLamViecGiaoVien] FOREIGN KEY([idTrangThaiLamViec])
REFERENCES [dbo].[TrangThaiLamViec] ([idTrangThaiLamViec])
GO
ALTER TABLE [dbo].[MienGiamTheoTrangThaiLamViec] CHECK CONSTRAINT [FK_MienGiamTheoTrangThaiGiaoVien_TrangThaiLamViecGiaoVien]
GO
ALTER TABLE [dbo].[NamHocHocKy]  WITH CHECK ADD  CONSTRAINT [tblNamHocHocKy_fk0] FOREIGN KEY([idNamHoc])
REFERENCES [dbo].[NamHoc] ([idNamHoc])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NamHocHocKy] CHECK CONSTRAINT [tblNamHocHocKy_fk0]
GO
ALTER TABLE [dbo].[NamHocHocKy]  WITH CHECK ADD  CONSTRAINT [tblNamHocHocKy_fk1] FOREIGN KEY([idHocKy])
REFERENCES [dbo].[HocKy] ([IdHocKy])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NamHocHocKy] CHECK CONSTRAINT [tblNamHocHocKy_fk1]
GO
ALTER TABLE [dbo].[NhiemVuBoSung]  WITH CHECK ADD  CONSTRAINT [FK_tblNhiemVuBoSung_tblNamHocHocKy] FOREIGN KEY([idNamHocHocKy])
REFERENCES [dbo].[NamHocHocKy] ([idNamHocHocKy])
GO
ALTER TABLE [dbo].[NhiemVuBoSung] CHECK CONSTRAINT [FK_tblNhiemVuBoSung_tblNamHocHocKy]
GO
ALTER TABLE [dbo].[NhiemVuKhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblNhiemVuKhoaHoc_tblNghienCuuKhoaHocChiTiet] FOREIGN KEY([idThanhVienDeTai])
REFERENCES [dbo].[ThanhVienDeTai] ([idThanhVienDeTai])
GO
ALTER TABLE [dbo].[NhiemVuKhoaHoc] CHECK CONSTRAINT [FK_tblNhiemVuKhoaHoc_tblNghienCuuKhoaHocChiTiet]
GO
ALTER TABLE [dbo].[PhanCongCoiHoiThi]  WITH CHECK ADD  CONSTRAINT [FK_PhanCongCoiHoiThi_BaoGioGiangDayChiTiet1] FOREIGN KEY([idBaoGioGiangDayChiTiet])
REFERENCES [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet])
GO
ALTER TABLE [dbo].[PhanCongCoiHoiThi] CHECK CONSTRAINT [FK_PhanCongCoiHoiThi_BaoGioGiangDayChiTiet1]
GO
ALTER TABLE [dbo].[PhanCongCoiHoiThi]  WITH CHECK ADD  CONSTRAINT [FK_PhanCongCoiHoiThi_GiaoVien] FOREIGN KEY([idGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
GO
ALTER TABLE [dbo].[PhanCongCoiHoiThi] CHECK CONSTRAINT [FK_PhanCongCoiHoiThi_GiaoVien]
GO
ALTER TABLE [dbo].[PhanCongDayTrungTam]  WITH CHECK ADD  CONSTRAINT [tblNhiemVuDayTrungTam_fk0] FOREIGN KEY([idGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhanCongDayTrungTam] CHECK CONSTRAINT [tblNhiemVuDayTrungTam_fk0]
GO
ALTER TABLE [dbo].[PhanCongDayTrungTam]  WITH CHECK ADD  CONSTRAINT [tblNhiemVuDayTrungTam_fk1] FOREIGN KEY([idBaoGioTrungTamChiTiet])
REFERENCES [dbo].[BaoGioTrungTamChiTiet] ([idBaoGioTrungTamChiTiet])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhanCongDayTrungTam] CHECK CONSTRAINT [tblNhiemVuDayTrungTam_fk1]
GO
ALTER TABLE [dbo].[PhanCongGiangDay]  WITH CHECK ADD  CONSTRAINT [tblNhiemVuGiangDay_fk0] FOREIGN KEY([idBaoGioGiangDayChiTiet])
REFERENCES [dbo].[BaoGioGiangDayChiTiet] ([IdBaoGioGiangDayChiTiet])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhanCongGiangDay] CHECK CONSTRAINT [tblNhiemVuGiangDay_fk0]
GO
ALTER TABLE [dbo].[PhanCongGiangDay]  WITH CHECK ADD  CONSTRAINT [tblNhiemVuGiangDay_fk1] FOREIGN KEY([idGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhanCongGiangDay] CHECK CONSTRAINT [tblNhiemVuGiangDay_fk1]
GO
ALTER TABLE [dbo].[PhanQuyenChiTiet]  WITH CHECK ADD  CONSTRAINT [tblPhanQuyenChiTiet_fk0] FOREIGN KEY([idPhanQuyen])
REFERENCES [dbo].[PhanQuyen] ([idPhanQuyen])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhanQuyenChiTiet] CHECK CONSTRAINT [tblPhanQuyenChiTiet_fk0]
GO
ALTER TABLE [dbo].[PhanQuyenNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_tblPhanQuyenNguoiDung_tblNguoiDung] FOREIGN KEY([idNguoiDung])
REFERENCES [dbo].[NguoiDung] ([idNguoiDung])
GO
ALTER TABLE [dbo].[PhanQuyenNguoiDung] CHECK CONSTRAINT [FK_tblPhanQuyenNguoiDung_tblNguoiDung]
GO
ALTER TABLE [dbo].[PhanQuyenNguoiDung]  WITH CHECK ADD  CONSTRAINT [tblPhanQuyenNguoiDung_fk1] FOREIGN KEY([idPhanQuyen])
REFERENCES [dbo].[PhanQuyen] ([idPhanQuyen])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhanQuyenNguoiDung] CHECK CONSTRAINT [tblPhanQuyenNguoiDung_fk1]
GO
ALTER TABLE [dbo].[QuyDinh]  WITH CHECK ADD  CONSTRAINT [tblQuyDinh_fk0] FOREIGN KEY([idLoaiQuyDinh])
REFERENCES [dbo].[LoaiQuyDinh] ([idLoaiQuyDinh])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[QuyDinh] CHECK CONSTRAINT [tblQuyDinh_fk0]
GO
ALTER TABLE [dbo].[QuyDinhChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietQuyDinh_QuyDinh] FOREIGN KEY([idQuyDinh])
REFERENCES [dbo].[QuyDinh] ([idQuyDinh])
GO
ALTER TABLE [dbo].[QuyDinhChiTiet] CHECK CONSTRAINT [FK_ChiTietQuyDinh_QuyDinh]
GO
ALTER TABLE [dbo].[QuyDinhGioChuanCoiThiLyThuyet]  WITH CHECK ADD  CONSTRAINT [FK_tblQuyDinhGioChuanCoiThiLyThuyet_tblHinhThucThi] FOREIGN KEY([idHinhThucThi])
REFERENCES [dbo].[HinhThucThi] ([idHinhThucThi])
GO
ALTER TABLE [dbo].[QuyDinhGioChuanCoiThiLyThuyet] CHECK CONSTRAINT [FK_tblQuyDinhGioChuanCoiThiLyThuyet_tblHinhThucThi]
GO
ALTER TABLE [dbo].[QuyDinhGioChuanRaDe]  WITH CHECK ADD  CONSTRAINT [FK_tblQuyDinhGioChuanRaDe_tblHinhThucThi] FOREIGN KEY([idHinhThuThi])
REFERENCES [dbo].[HinhThucThi] ([idHinhThucThi])
GO
ALTER TABLE [dbo].[QuyDinhGioChuanRaDe] CHECK CONSTRAINT [FK_tblQuyDinhGioChuanRaDe_tblHinhThucThi]
GO
ALTER TABLE [dbo].[QuyDinhGioChuanThucHanh]  WITH CHECK ADD  CONSTRAINT [FK_QuyDinhGioChuanThucHanh_Khoa] FOREIGN KEY([idKhoa])
REFERENCES [dbo].[Khoa] ([idKhoa])
GO
ALTER TABLE [dbo].[QuyDinhGioChuanThucHanh] CHECK CONSTRAINT [FK_QuyDinhGioChuanThucHanh_Khoa]
GO
ALTER TABLE [dbo].[QuyDinhGioChuanThucHanhBoSung]  WITH CHECK ADD  CONSTRAINT [FK_QuyDinhGioChuanThucHanhBoSung_Khoa] FOREIGN KEY([idKhoa])
REFERENCES [dbo].[Khoa] ([idKhoa])
GO
ALTER TABLE [dbo].[QuyDinhGioChuanThucHanhBoSung] CHECK CONSTRAINT [FK_QuyDinhGioChuanThucHanhBoSung_Khoa]
GO
ALTER TABLE [dbo].[QuyDinhVeHuongDanDoAn]  WITH CHECK ADD  CONSTRAINT [FK_tblQuyDinhVeHuongDanDoAn_tblLoaiMonHoc] FOREIGN KEY([idLoaiHocPhan])
REFERENCES [dbo].[LoaiHocPhan] ([idLoaiHocPhan])
GO
ALTER TABLE [dbo].[QuyDinhVeHuongDanDoAn] CHECK CONSTRAINT [FK_tblQuyDinhVeHuongDanDoAn_tblLoaiMonHoc]
GO
ALTER TABLE [dbo].[ThanhVienDeTai]  WITH CHECK ADD  CONSTRAINT [tblNhiemVuKhoaHoc_fk0] FOREIGN KEY([idGiaoVien])
REFERENCES [dbo].[GiaoVien] ([idGiaoVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ThanhVienDeTai] CHECK CONSTRAINT [tblNhiemVuKhoaHoc_fk0]
GO
ALTER TABLE [dbo].[ThanhVienDeTai]  WITH CHECK ADD  CONSTRAINT [tblNhiemVuKhoaHoc_fk2] FOREIGN KEY([idDeTaiNghienCuuKhoaHoc])
REFERENCES [dbo].[NghienCuuKhoaHoc] ([idDeTaiNghienCuuKhoaHoc])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ThanhVienDeTai] CHECK CONSTRAINT [tblNhiemVuKhoaHoc_fk2]
GO
ALTER TABLE [dbo].[ThongKeSinhVienThuocKhoa]  WITH CHECK ADD  CONSTRAINT [tblThongKeSinhVienThuocKhoa_fk1] FOREIGN KEY([idNamHocHocKy])
REFERENCES [dbo].[NamHocHocKy] ([idNamHocHocKy])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ThongKeSinhVienThuocKhoa] CHECK CONSTRAINT [tblThongKeSinhVienThuocKhoa_fk1]
GO
ALTER TABLE [dbo].[TinhGioTrungTam]  WITH CHECK ADD  CONSTRAINT [FK_tblTinhGioTrungTam_tblNamHocHocKy] FOREIGN KEY([idNamHocHocKy])
REFERENCES [dbo].[NamHocHocKy] ([idNamHocHocKy])
GO
ALTER TABLE [dbo].[TinhGioTrungTam] CHECK CONSTRAINT [FK_tblTinhGioTrungTam_tblNamHocHocKy]
GO
ALTER TABLE [dbo].[TinhGioTrungTam]  WITH CHECK ADD  CONSTRAINT [FK_tblTinhGioTrungTam_tblNhiemVuDayTrungTam] FOREIGN KEY([idNhiemVuDayTrungTam])
REFERENCES [dbo].[PhanCongDayTrungTam] ([idPhanCongDayTrungTam])
GO
ALTER TABLE [dbo].[TinhGioTrungTam] CHECK CONSTRAINT [FK_tblTinhGioTrungTam_tblNhiemVuDayTrungTam]
GO
USE [master]
GO
ALTER DATABASE [dbPhanCongThanhToan] SET  READ_WRITE 
GO
