USE [master]
GO
/****** Object:  Database [GiupViecNhaDB]    Script Date: 30/10/2021 14:14:03 ******/
CREATE DATABASE [GiupViecNhaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GiupViecNhaDB', FILENAME = N'E:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\GiupViecNhaDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GiupViecNhaDB_log', FILENAME = N'E:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\GiupViecNhaDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GiupViecNhaDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GiupViecNhaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GiupViecNhaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GiupViecNhaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GiupViecNhaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GiupViecNhaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GiupViecNhaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GiupViecNhaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GiupViecNhaDB] SET  MULTI_USER 
GO
ALTER DATABASE [GiupViecNhaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GiupViecNhaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GiupViecNhaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GiupViecNhaDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [GiupViecNhaDB]
GO
/****** Object:  Table [dbo].[BangLuong]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangLuong](
	[MaBangLuong] [nchar](10) NOT NULL,
	[NgayLap] [date] NULL,
	[ThangTinhLuong] [int] NULL,
	[NamTinhLuong] [int] NULL,
	[TongTienLuong] [int] NULL,
 CONSTRAINT [PK_BangLuong] PRIMARY KEY CLUSTERED 
(
	[MaBangLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CapBacKH]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapBacKH](
	[MaCapBac] [nchar](10) NOT NULL,
	[TenCapBac] [nvarchar](50) NULL,
	[DiemToiThieu] [int] NULL,
	[HeSoNhan] [float] NULL,
 CONSTRAINT [PK_CapBacKH] PRIMARY KEY CLUSTERED 
(
	[MaCapBac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietThongKe]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietThongKe](
	[MaThongKe] [nchar](10) NOT NULL,
	[MaDonDat] [nchar](10) NOT NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_ChiTietThongKe] PRIMARY KEY CLUSTERED 
(
	[MaThongKe] ASC,
	[MaDonDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucNang](
	[MaChucNang] [varchar](50) NOT NULL,
	[TenChucNang] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucNang] PRIMARY KEY CLUSTERED 
(
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaVaiTro] [varchar](50) NOT NULL,
	[TenVaiTro] [nvarchar](50) NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChucVu_NguoiDung]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVu_NguoiDung](
	[MaNV] [nchar](10) NOT NULL,
	[VaiTro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VaiTro_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CongTacVien]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CongTacVien](
	[MaCTV] [nchar](10) NOT NULL,
	[TenCTV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[Email] [nchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[TrinhDo] [nchar](10) NULL,
	[KinhNghiem] [nvarchar](50) NULL,
	[DiemDanhGia] [float] NULL,
	[MaDonDKCTV] [nchar](10) NULL,
	[AnhCTV] [varchar](max) NULL,
	[NgayVaoLam] [date] NULL,
 CONSTRAINT [PK_CongTacVien] PRIMARY KEY CLUSTERED 
(
	[MaCTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_LuongCTV]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_LuongCTV](
	[MaBangLuong] [nchar](10) NOT NULL,
	[MaCTV] [nchar](10) NOT NULL,
	[SoGioLam] [int] NULL,
	[MaKhenThuong] [nchar](10) NULL,
	[ThucLanh] [int] NULL,
 CONSTRAINT [PK_CT_LuongCTV] PRIMARY KEY CLUSTERED 
(
	[MaBangLuong] ASC,
	[MaCTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDichVu] [nchar](10) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[DonViTinh] [nchar](10) NULL,
	[GiaThanh] [int] NULL,
	[KinhNghiemYeuCau] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[LoaiDV] [nchar](10) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDangKyCTV]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonDangKyCTV](
	[MaDon] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySInh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[AnhCTV] [varchar](50) NULL,
	[TrinhDoHocVan] [nvarchar](50) NULL,
	[KinhNghiem] [nvarchar](50) NULL,
	[DiemKiemTra] [float] NULL,
	[TrangThaiDuyet] [nvarchar](50) NULL,
 CONSTRAINT [PK_DonDangKyCTV] PRIMARY KEY CLUSTERED 
(
	[MaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonDatDV]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatDV](
	[MaDonDat] [nchar](10) NOT NULL,
	[MaDV] [nchar](10) NULL,
	[SoThoiGianThue] [int] NULL,
	[DiaChiThucHien] [nvarchar](50) NULL,
	[ThoiGianThucHien] [date] NULL,
	[MoTaCongViec] [nvarchar](max) NULL,
	[KinhNghiemYeuCau] [nvarchar](50) NULL,
	[TinhTrangDonDat] [nvarchar](50) NULL,
	[MaKH] [nchar](10) NULL,
	[MaCTVNhanViec] [nchar](10) NULL,
	[TuyChonCTV] [nvarchar](50) NULL,
	[HinhThucThanhToan] [nvarchar](50) NULL,
	[TinhTrangThanhToan] [nchar](10) NULL,
	[ChiPhiChonCTV] [int] NULL,
	[TongTien] [int] NULL,
	[MaUuDaiApDung] [nchar](10) NULL,
 CONSTRAINT [PK_DonDatDV] PRIMARY KEY CLUSTERED 
(
	[MaDonDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DSCTVYeuThich]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSCTVYeuThich](
	[MaCTV] [nchar](10) NOT NULL,
	[MaKH] [nchar](10) NOT NULL,
 CONSTRAINT [PK_DSCTVYeuThich] PRIMARY KEY CLUSTERED 
(
	[MaCTV] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonDV]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonDV](
	[MaHoaDon] [nchar](10) NOT NULL,
	[MaDonDat] [nchar](10) NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_HoaDonDV] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](max) NULL,
	[SoDiemThuong] [int] NULL,
	[MaCapBacKH] [nchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang_UuDai]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang_UuDai](
	[MaUuDai] [nchar](10) NOT NULL,
	[MaKH] [nchar](10) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_KhachHang_UuDai] PRIMARY KEY CLUSTERED 
(
	[MaUuDai] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LichLamViec]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichLamViec](
	[MaCTV] [nchar](10) NOT NULL,
	[MaDonDat] [nchar](10) NOT NULL,
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianKetThuc] [datetime] NULL,
	[SoDiemDanhGia] [int] NULL,
	[GopY] [nvarchar](max) NULL,
 CONSTRAINT [PK_LichLamViec] PRIMARY KEY CLUSTERED 
(
	[MaCTV] ASC,
	[MaDonDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDV]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDV](
	[MaLoaiDV] [nchar](10) NOT NULL,
	[TenLoaiDV] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiDV] PRIMARY KEY CLUSTERED 
(
	[MaLoaiDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TenDN] [varchar](15) NULL,
	[MatKhau] [varchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanQuyenND]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanQuyenND](
	[MaVaiTro] [varchar](50) NOT NULL,
	[MaChucNang] [varchar](50) NOT NULL,
	[CoQuyen] [bit] NULL,
 CONSTRAINT [PK_PhanQuyenND] PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC,
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuUuDai]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuUuDai](
	[MaUuDai] [nchar](10) NOT NULL,
	[TenUuDai] [nvarchar](50) NULL,
	[SoDiemCan] [int] NULL,
	[PhanTramGiamGia] [int] NULL,
	[MaCapBac] [nchar](10) NULL,
	[MaDichVu] [nchar](10) NULL,
 CONSTRAINT [PK_UuDai] PRIMARY KEY CLUSTERED 
(
	[MaUuDai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongKe]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKe](
	[MaThongKe] [nchar](10) NOT NULL,
	[NgayThongKe] [date] NULL,
	[LoaiThongKe] [nvarchar](50) NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_ThongKe] PRIMARY KEY CLUSTERED 
(
	[MaThongKe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YeuCauDoiCTV]    Script Date: 30/10/2021 14:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuCauDoiCTV](
	[MaYC] [nchar](10) NOT NULL,
	[MaDonDat] [nchar](10) NULL,
	[SoLanDoi] [int] NULL,
	[CTVChonDoi] [nchar](10) NULL,
	[TrangThaiDoi] [nvarchar](50) NULL,
 CONSTRAINT [PK_YeuCauDoiCTV] PRIMARY KEY CLUSTERED 
(
	[MaYC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CapBacKH] ([MaCapBac], [TenCapBac], [DiemToiThieu], [HeSoNhan]) VALUES (N'CB01      ', N'Thành viên', 0, 1)
INSERT [dbo].[CapBacKH] ([MaCapBac], [TenCapBac], [DiemToiThieu], [HeSoNhan]) VALUES (N'CB02      ', N'Bạc', 200, 1)
INSERT [dbo].[CapBacKH] ([MaCapBac], [TenCapBac], [DiemToiThieu], [HeSoNhan]) VALUES (N'CB03      ', N'Vàng', 600, 1.2)
INSERT [dbo].[CapBacKH] ([MaCapBac], [TenCapBac], [DiemToiThieu], [HeSoNhan]) VALUES (N'CB04      ', N'Bạch kim', 3000, 1.4)
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'QLCTV', N'Quản lý cộng tác viên')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'QLDD', N'Quản lý đơn đặt dịch vụ')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'QLDV', N'Quản lý dịch vụ')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'QLKH', N'Quản lý khách hàng')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'QLPQ', N'Quản lý phân quyền')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'QLUD', N'Quản lý phiếu ưu đãi')
INSERT [dbo].[ChucVu] ([MaVaiTro], [TenVaiTro]) VALUES (N'Admin     ', N'Quản lý')
INSERT [dbo].[ChucVu] ([MaVaiTro], [TenVaiTro]) VALUES (N'NVKT      ', N'Nhân viên kế toán')
INSERT [dbo].[ChucVu] ([MaVaiTro], [TenVaiTro]) VALUES (N'NVTD      ', N'Nhân viên tuyển dụng')
INSERT [dbo].[ChucVu_NguoiDung] ([MaNV], [VaiTro]) VALUES (N'NV01      ', N'Admin     ')
INSERT [dbo].[ChucVu_NguoiDung] ([MaNV], [VaiTro]) VALUES (N'NV02      ', N'NVTD      ')
INSERT [dbo].[CongTacVien] ([MaCTV], [TenCTV], [NgaySinh], [DiaChi], [SDT], [Email], [MatKhau], [TrinhDo], [KinhNghiem], [DiemDanhGia], [MaDonDKCTV], [AnhCTV], [NgayVaoLam]) VALUES (N'CTV01     ', N'Nguyễn Thị Tèo', CAST(N'1988-10-20' AS Date), N'TPHCM', N'0145458541', N'ntc@gmail.com                                     ', N'1', N'12        ', NULL, 5, N'DDK01     ', NULL, NULL)
INSERT [dbo].[CongTacVien] ([MaCTV], [TenCTV], [NgaySinh], [DiaChi], [SDT], [Email], [MatKhau], [TrinhDo], [KinhNghiem], [DiemDanhGia], [MaDonDKCTV], [AnhCTV], [NgayVaoLam]) VALUES (N'CTV02     ', N'Trần Văn A', CAST(N'1994-06-03' AS Date), N'Bình Thuận', N'0115485668', N'atv@gmail.com                                     ', N'xMpCOKC5I4INzFCab3WEmw==                          ', N'12        ', NULL, NULL, N'DDK02     ', NULL, NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'LDV01-DV03', N'Đi Chợ', N'Bạn quá bận đến nổi không có thời gian để đi chợ vậy tại sao không đến với chúng tôi! Dịch vụ đi chợ của chúng tôi sẽ giúp bạn.', N'Giờ       ', 123123, N'', N'anhgr3.png', N'LDV01     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'LDV01-DV07', N'Phun khuẩn', N'  Cấp độ bảo vệ cao hơn cho ngôi nhà của bạn.Giảm nguy cơ lây nhiễm vi rút.Xử lý khử trùng không độc hại,hoàn toàn an toàn.Được Bộ Y tế liệt kê là một dịch vụ thiết yếu', N'a         ', 12, N'', N'anhgr7.jpg', N'LDV01     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'LDV02-DV02', N'Dọn dẹp nhà theo tháng', N'Giải pháp dọn dẹp nhanh chóng và tiện lợi cho chủ các hệ thống khách sạn, homestay. Các nhân viên buồng phòng của bTaskee được sàng lọc kỹ càng, phải có ít nhất 1 năm kinh nghiệm làm việc tại khách sạn 3 sao trở lên.', N'Tháng     ', 60000, N'', N'anhgr2.png', N'LDV02     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'LDV02-DV05', N'Nấu ăn gia đình', N'Mang đến bữa ăn ngon chuẩn vị “cơm nhà” cho gia đình bạn.Cộng tác viên Nấu ăn của bTaskee là các bà nội trợ giàu kinh nghiệm nấu nướng. Bữa cơm của gia đình bạn đảm bảo được nêm nếm vừa miệng, tốt cho sức khỏe và luôn mang hương vị cơm nhà.', N'Giờ       ', 123123, N'', N'anhgr5na.jpg', N'LDV02     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'LDV04-DV04', N'Vệ sinh máy lạnh', N'Chăm sóc bầu không khí trong căn nhà thân yêu của bạn. Vệ sinh máy lạnh – Bơm gas nhanh chóng và tiện lợi trên ứng dụng bTaskee', N'KG        ', 15000, N'', N'anhgr4vsml.jpg', N'LDV04     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'LDV04-DV06', N'Giặt ủi', N'Bạn đang tìm kiếm dịch vụ giặt ủi chuyên nghiệp? bTaskee là lựa chọn tốt nhất cho bạn với dịch vụ giặt ủi tiện lợi, đáng tin cậy, chất lượng cao và phù hợp cho mọi nhu cầu giặt thường, giặt hấp của bạn.. Giao nhận tận nơi, thảnh thơi tại nhà.', N'a         ', 12, N'', N'anhgr6.jpg', N'LDV04     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'LDV05-DV01', N'Giúp việc nhà theo giờ', N'Bạn đang cần tìm người giúp việc nhà? bTaskee – Sự lựa chọn hoàn hảo để chăm sóc ngôi nhà bạn. Chỉ với 60 giây đặt lịch giúp việc nhà theo giờ trên ứng dụng bTaskee.', N'Giờ       ', 60000, N'', N'anhgr1.png', N'LDV05     ')
INSERT [dbo].[DonDangKyCTV] ([MaDon], [HoTen], [NgaySInh], [DiaChi], [SDT], [Email], [AnhCTV], [TrinhDoHocVan], [KinhNghiem], [DiemKiemTra], [TrangThaiDuyet]) VALUES (N'DDK01     ', N'Nguyễn Thị C', CAST(N'1988-10-20' AS Date), N'TPHCM', N'0145458541', N'ntc@gmail.com', NULL, N'12', NULL, 7, N'Đã đậu')
INSERT [dbo].[DonDangKyCTV] ([MaDon], [HoTen], [NgaySInh], [DiaChi], [SDT], [Email], [AnhCTV], [TrinhDoHocVan], [KinhNghiem], [DiemKiemTra], [TrangThaiDuyet]) VALUES (N'DDK02     ', N'Trần Văn A', CAST(N'1994-06-03' AS Date), N'Bình Thuận', N'0115485668', N'atv@gmail.com', NULL, N'12', NULL, 8, N'Đã đậu')
INSERT [dbo].[DonDangKyCTV] ([MaDon], [HoTen], [NgaySInh], [DiaChi], [SDT], [Email], [AnhCTV], [TrinhDoHocVan], [KinhNghiem], [DiemKiemTra], [TrangThaiDuyet]) VALUES (N'DDK03     ', N'Võ Thị B', CAST(N'1994-06-03' AS Date), N'Bình Thuận', N'0115485668', N'bvt@gmail.com', NULL, N'12', NULL, 6, N'Đã đậu')
INSERT [dbo].[DonDangKyCTV] ([MaDon], [HoTen], [NgaySInh], [DiaChi], [SDT], [Email], [AnhCTV], [TrinhDoHocVan], [KinhNghiem], [DiemKiemTra], [TrangThaiDuyet]) VALUES (N'DDK04     ', N'a', CAST(N'1212-02-02' AS Date), N'a', N'2         ', N'a', N'a.png', N'2', NULL, 7, N'Đã đậu')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Email], [SDT], [DiaChi], [MatKhau], [SoDiemThuong], [MaCapBacKH]) VALUES (N'KH01      ', N'ádasd', N'htran5646@gmail.com', N'123       ', N'ádasd', N'xMpCOKC5I4INzFCab3WEmw==', 0, N'CB01      ')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV01     ', N'Vệ Sinh Thiết Bị')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV02     ', N'Nấu Ăn')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV03     ', N'Chăm Sóc')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV04     ', N'Giặt Ủi')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV05     ', N'Dọn Vệ Sinh')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [Email], [DiaChi], [TenDN], [MatKhau]) VALUES (N'NV01      ', N'Trần Văn Hưng', CAST(N'2000-11-07' AS Date), N'htran5646@gmail.com', N'Bình thuận', N'admin', N'xMpCOKC5I4INzFCab3WEmw==')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [Email], [DiaChi], [TenDN], [MatKhau]) VALUES (N'NV02      ', N'a', CAST(N'1212-02-02' AS Date), N'b', N'a', N'nv02', N'a')
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'Admin     ', N'QLCTV', 1)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'Admin     ', N'QLDD', 1)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'Admin     ', N'QLDV', 1)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'Admin     ', N'QLKH', 1)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'Admin     ', N'QLPQ', 1)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'Admin     ', N'QLUD', 1)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVKT      ', N'QLCTV', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVKT      ', N'QLDD', 1)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVKT      ', N'QLDV', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVKT      ', N'QLKH', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVKT      ', N'QLPQ      ', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVKT      ', N'QLUD      ', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVTD      ', N'QLCTV     ', 1)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVTD      ', N'QLDD      ', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVTD      ', N'QLDV      ', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVTD      ', N'QLKH      ', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVTD      ', N'QLPQ      ', 0)
INSERT [dbo].[PhanQuyenND] ([MaVaiTro], [MaChucNang], [CoQuyen]) VALUES (N'NVTD      ', N'QLUD      ', 0)
ALTER TABLE [dbo].[ChiTietThongKe]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietThongKe_DonDatDV] FOREIGN KEY([MaDonDat])
REFERENCES [dbo].[DonDatDV] ([MaDonDat])
GO
ALTER TABLE [dbo].[ChiTietThongKe] CHECK CONSTRAINT [FK_ChiTietThongKe_DonDatDV]
GO
ALTER TABLE [dbo].[ChiTietThongKe]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietThongKe_ThongKe] FOREIGN KEY([MaThongKe])
REFERENCES [dbo].[ThongKe] ([MaThongKe])
GO
ALTER TABLE [dbo].[ChiTietThongKe] CHECK CONSTRAINT [FK_ChiTietThongKe_ThongKe]
GO
ALTER TABLE [dbo].[ChucVu_NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_VaiTro_NguoiDung_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChucVu_NguoiDung] CHECK CONSTRAINT [FK_VaiTro_NguoiDung_NhanVien]
GO
ALTER TABLE [dbo].[ChucVu_NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_VaiTro_NguoiDung_VaiTro] FOREIGN KEY([VaiTro])
REFERENCES [dbo].[ChucVu] ([MaVaiTro])
GO
ALTER TABLE [dbo].[ChucVu_NguoiDung] CHECK CONSTRAINT [FK_VaiTro_NguoiDung_VaiTro]
GO
ALTER TABLE [dbo].[CongTacVien]  WITH CHECK ADD  CONSTRAINT [FK_CongTacVien_DonDangKyCTV] FOREIGN KEY([MaDonDKCTV])
REFERENCES [dbo].[DonDangKyCTV] ([MaDon])
GO
ALTER TABLE [dbo].[CongTacVien] CHECK CONSTRAINT [FK_CongTacVien_DonDangKyCTV]
GO
ALTER TABLE [dbo].[CT_LuongCTV]  WITH CHECK ADD  CONSTRAINT [FK_CT_LuongCTV_BangLuong] FOREIGN KEY([MaBangLuong])
REFERENCES [dbo].[BangLuong] ([MaBangLuong])
GO
ALTER TABLE [dbo].[CT_LuongCTV] CHECK CONSTRAINT [FK_CT_LuongCTV_BangLuong]
GO
ALTER TABLE [dbo].[CT_LuongCTV]  WITH CHECK ADD  CONSTRAINT [FK_CT_LuongCTV_CongTacVien] FOREIGN KEY([MaCTV])
REFERENCES [dbo].[CongTacVien] ([MaCTV])
GO
ALTER TABLE [dbo].[CT_LuongCTV] CHECK CONSTRAINT [FK_CT_LuongCTV_CongTacVien]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_LoaiDV] FOREIGN KEY([LoaiDV])
REFERENCES [dbo].[LoaiDV] ([MaLoaiDV])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_LoaiDV]
GO
ALTER TABLE [dbo].[DonDatDV]  WITH CHECK ADD  CONSTRAINT [FK_DonDatDV_CongTacVien] FOREIGN KEY([MaCTVNhanViec])
REFERENCES [dbo].[CongTacVien] ([MaCTV])
GO
ALTER TABLE [dbo].[DonDatDV] CHECK CONSTRAINT [FK_DonDatDV_CongTacVien]
GO
ALTER TABLE [dbo].[DonDatDV]  WITH CHECK ADD  CONSTRAINT [FK_DonDatDV_DichVu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([MaDichVu])
GO
ALTER TABLE [dbo].[DonDatDV] CHECK CONSTRAINT [FK_DonDatDV_DichVu]
GO
ALTER TABLE [dbo].[DonDatDV]  WITH CHECK ADD  CONSTRAINT [FK_DonDatDV_PhieuUuDai] FOREIGN KEY([MaUuDaiApDung])
REFERENCES [dbo].[PhieuUuDai] ([MaUuDai])
GO
ALTER TABLE [dbo].[DonDatDV] CHECK CONSTRAINT [FK_DonDatDV_PhieuUuDai]
GO
ALTER TABLE [dbo].[DSCTVYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_DSCTVYeuThich_CongTacVien] FOREIGN KEY([MaCTV])
REFERENCES [dbo].[CongTacVien] ([MaCTV])
GO
ALTER TABLE [dbo].[DSCTVYeuThich] CHECK CONSTRAINT [FK_DSCTVYeuThich_CongTacVien]
GO
ALTER TABLE [dbo].[DSCTVYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_DSCTVYeuThich_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DSCTVYeuThich] CHECK CONSTRAINT [FK_DSCTVYeuThich_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonDV]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonDV_DonDatDV] FOREIGN KEY([MaDonDat])
REFERENCES [dbo].[DonDatDV] ([MaDonDat])
GO
ALTER TABLE [dbo].[HoaDonDV] CHECK CONSTRAINT [FK_HoaDonDV_DonDatDV]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_CapBacKH] FOREIGN KEY([MaCapBacKH])
REFERENCES [dbo].[CapBacKH] ([MaCapBac])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_CapBacKH]
GO
ALTER TABLE [dbo].[KhachHang_UuDai]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_UuDai_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[KhachHang_UuDai] CHECK CONSTRAINT [FK_KhachHang_UuDai_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang_UuDai]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_UuDai_PhieuUuDai] FOREIGN KEY([MaUuDai])
REFERENCES [dbo].[PhieuUuDai] ([MaUuDai])
GO
ALTER TABLE [dbo].[KhachHang_UuDai] CHECK CONSTRAINT [FK_KhachHang_UuDai_PhieuUuDai]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [FK_LichLamViec_CongTacVien] FOREIGN KEY([MaCTV])
REFERENCES [dbo].[CongTacVien] ([MaCTV])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [FK_LichLamViec_CongTacVien]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [FK_LichLamViec_DonDatDV] FOREIGN KEY([MaDonDat])
REFERENCES [dbo].[DonDatDV] ([MaDonDat])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [FK_LichLamViec_DonDatDV]
GO
ALTER TABLE [dbo].[PhanQuyenND]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyenND_ChucNang] FOREIGN KEY([MaChucNang])
REFERENCES [dbo].[ChucNang] ([MaChucNang])
GO
ALTER TABLE [dbo].[PhanQuyenND] CHECK CONSTRAINT [FK_PhanQuyenND_ChucNang]
GO
ALTER TABLE [dbo].[PhanQuyenND]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyenND_VaiTro] FOREIGN KEY([MaVaiTro])
REFERENCES [dbo].[ChucVu] ([MaVaiTro])
GO
ALTER TABLE [dbo].[PhanQuyenND] CHECK CONSTRAINT [FK_PhanQuyenND_VaiTro]
GO
ALTER TABLE [dbo].[PhieuUuDai]  WITH CHECK ADD  CONSTRAINT [FK_UuDai_CapBacKH] FOREIGN KEY([MaCapBac])
REFERENCES [dbo].[CapBacKH] ([MaCapBac])
GO
ALTER TABLE [dbo].[PhieuUuDai] CHECK CONSTRAINT [FK_UuDai_CapBacKH]
GO
ALTER TABLE [dbo].[PhieuUuDai]  WITH CHECK ADD  CONSTRAINT [FK_UuDai_DichVu] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDichVu])
GO
ALTER TABLE [dbo].[PhieuUuDai] CHECK CONSTRAINT [FK_UuDai_DichVu]
GO
ALTER TABLE [dbo].[YeuCauDoiCTV]  WITH CHECK ADD  CONSTRAINT [FK_YeuCauDoiCTV_CongTacVien] FOREIGN KEY([CTVChonDoi])
REFERENCES [dbo].[CongTacVien] ([MaCTV])
GO
ALTER TABLE [dbo].[YeuCauDoiCTV] CHECK CONSTRAINT [FK_YeuCauDoiCTV_CongTacVien]
GO
ALTER TABLE [dbo].[YeuCauDoiCTV]  WITH CHECK ADD  CONSTRAINT [FK_YeuCauDoiCTV_DonDatDV] FOREIGN KEY([MaDonDat])
REFERENCES [dbo].[DonDatDV] ([MaDonDat])
GO
ALTER TABLE [dbo].[YeuCauDoiCTV] CHECK CONSTRAINT [FK_YeuCauDoiCTV_DonDatDV]
GO
USE [master]
GO
ALTER DATABASE [GiupViecNhaDB] SET  READ_WRITE 
GO
