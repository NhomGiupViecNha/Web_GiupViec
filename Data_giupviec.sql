USE [master]
GO
/****** Object:  Database [GiupViecNhaDB]    Script Date: 10/10/2021 19:21:24 ******/
CREATE DATABASE [GiupViecNhaDB]

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
/****** Object:  Table [dbo].[CapBacKH]    Script Date: 10/10/2021 19:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapBacKH](
	[MaCapBac] [nchar](10) NOT NULL,
	[TenCapBac] [nvarchar](50) NULL,
	[DiemToiThieu] [int] NULL,
	[DiemToiDa] [int] NULL,
 CONSTRAINT [PK_CapBacKH] PRIMARY KEY CLUSTERED 
(
	[MaCapBac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietThongKe]    Script Date: 10/10/2021 19:21:24 ******/
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
/****** Object:  Table [dbo].[CongTacVien]    Script Date: 10/10/2021 19:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CongTacVien](
	[MaCTV] [nchar](10) NOT NULL,
	[TenCTV] [nchar](10) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[Email] [nchar](50) NULL,
	[MatKhau] [nchar](50) NULL,
	[TrinhDo] [nchar](10) NULL,
	[KinhNghiem] [nvarchar](50) NULL,
	[DiemDanhGia] [float] NULL,
	[MaDonDKCTV] [nchar](10) NULL,
 CONSTRAINT [PK_CongTacVien] PRIMARY KEY CLUSTERED 
(
	[MaCTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_LuongCTV]    Script Date: 10/10/2021 19:21:24 ******/
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
/****** Object:  Table [dbo].[DichVu]    Script Date: 10/10/2021 19:21:24 ******/
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
/****** Object:  Table [dbo].[DonDangKyCTV]    Script Date: 10/10/2021 19:21:24 ******/
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
	[TrinhDoHocVan] [nvarchar](50) NULL,
	[KinhNghiem] [nvarchar](50) NULL,
	[TrangThaiDuyet] [nvarchar](50) NULL,
 CONSTRAINT [PK_DonDangKyCTV] PRIMARY KEY CLUSTERED 
(
	[MaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonDatDV]    Script Date: 10/10/2021 19:21:24 ******/
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
	[ChiPhiPhatSinh] [int] NULL,
	[TongTien] [int] NULL,
	[MaUuDaiApDung] [nchar](10) NULL,
 CONSTRAINT [PK_DonDatDV] PRIMARY KEY CLUSTERED 
(
	[MaDonDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DSCTVYeuThich]    Script Date: 10/10/2021 19:21:24 ******/
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
/****** Object:  Table [dbo].[HoaDonDV]    Script Date: 10/10/2021 19:21:24 ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/10/2021 19:21:24 ******/
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
	[DiaChi] [nvarchar](50) NULL,
	[MatKhau] [nchar](16) NULL,
	[SoDiemThuong] [int] NULL,
	[MaCapBacKH] [nchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang_UuDai]    Script Date: 10/10/2021 19:21:24 ******/
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
/****** Object:  Table [dbo].[LichLamViec]    Script Date: 10/10/2021 19:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichLamViec](
	[MaCTV] [nchar](10) NOT NULL,
	[MaDonDat] [nchar](10) NOT NULL,
	[NgayLamViec] [date] NULL,
	[SoDiemDanhGia] [int] NULL,
	[GopY] [nvarchar](max) NULL,
 CONSTRAINT [PK_LichLamViec] PRIMARY KEY CLUSTERED 
(
	[MaCTV] ASC,
	[MaDonDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDV]    Script Date: 10/10/2021 19:21:24 ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/10/2021 19:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuUuDai]    Script Date: 10/10/2021 19:21:24 ******/
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
/****** Object:  Table [dbo].[ThongKe]    Script Date: 10/10/2021 19:21:24 ******/
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
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'DV01      ', N'Giúp việc nhà theo giờ', N'a', N'Giờ       ', 60000, N'', N'', N'LDV05     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'DV02      ', N'Vệ sinh máy lạnh', N'jaldkjaslkdjalskdj', N'Ngày      ', 250000, N'', N'', N'LDV01     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'DV03      ', N'Nấu ăn gia đình', N'aksdjaklsdjlkasdj', N'Giờ       ', 60000, N'', N'', N'LDV02     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'DV04      ', N'Chăm sóc người cao tuổi', N'áohdashdkjahsdkjh', N'Giờ       ', 80000, N'', N'', N'LDV03     ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa], [DonViTinh], [GiaThanh], [KinhNghiemYeuCau], [HinhAnh], [LoaiDV]) VALUES (N'DV05      ', N'Giặt chăn ga', N'kajsdklasjdlkasdj', N'KG        ', 15000, N'', N'', N'LDV04     ')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV01     ', N'Vệ Sinh Thiết Bị')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV02     ', N'Nấu Ăn')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV03     ', N'Chăm Sóc')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV04     ', N'Giặt Ủi')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'LDV05     ', N'Dọn Vệ Sinh')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [Email], [MatKhau], [ChucVu]) VALUES (N'NV01      ', N'Trần Văn Hưng', N'htran5646@gmail.com', N'1', N'Quản Lý')
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
USE [master]
GO
ALTER DATABASE [GiupViecNhaDB] SET  READ_WRITE 
GO


