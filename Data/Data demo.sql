USE [master]
GO
/****** Object:  Database [LICHTHI]    Script Date: 5/19/2020 3:04:53 PM ******/
CREATE DATABASE [LICHTHI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LICHTHI_dat', FILENAME = N'D:\LICHTHI_dat.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LICHTHI_log', FILENAME = N'D:\LICHTHI_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [LICHTHI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LICHTHI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LICHTHI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LICHTHI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LICHTHI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LICHTHI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LICHTHI] SET ARITHABORT OFF 
GO
ALTER DATABASE [LICHTHI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LICHTHI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LICHTHI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LICHTHI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LICHTHI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LICHTHI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LICHTHI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LICHTHI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LICHTHI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LICHTHI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LICHTHI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LICHTHI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LICHTHI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LICHTHI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LICHTHI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LICHTHI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LICHTHI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LICHTHI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LICHTHI] SET  MULTI_USER 
GO
ALTER DATABASE [LICHTHI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LICHTHI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LICHTHI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LICHTHI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LICHTHI] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LICHTHI]
GO
/****** Object:  Table [dbo].[MONTHI]    Script Date: 5/19/2020 3:04:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONTHI](
	[MaMon] [nchar](10) NOT NULL,
	[TenMon] [nchar](10) NULL,
 CONSTRAINT [PK_MONTHI] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 5/19/2020 3:04:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MaSV] [nchar](8) NOT NULL,
	[TenSV] [nvarchar](50) NULL,
 CONSTRAINT [PK_SINHVIEN] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THI]    Script Date: 5/19/2020 3:04:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THI](
	[MaSV] [nchar](8) NOT NULL,
	[MaMon] [nchar](10) NOT NULL,
	[ThoiGian] [nvarchar](max) NULL,
 CONSTRAINT [PK_THI] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

USE [LICHTHI]
GO
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0001      ', N'Giải tích 2')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0002      ', N'Đại số tuyến tính')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0003      ', N'Lập trình cơ bản        ')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0004      ', N'Toán chuyên đề')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0005      ', N'Toán rời rạc')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0006      ', N'Mạng máy tính')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0007      ', N'Cấu trúc máy tính')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0008      ', N'Lí thuyết hệ điều hành')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0009      ', N'Đảm bảo an toàn thông tin')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0010      ', N'Giải tích 1')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0011      ', N'Điện tử tương tự')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0012      ', N'Cơ sở dữ liệu')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0013      ', N'Thực tập cơ sở dữ liệu')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0014      ', N'Lập trình hướng đối tượng')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0015      ', N'Ngôn ngữ lập trình 1')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0016      ', N'Ngôn ngữ lập trình 2')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0017      ', N'Lí thuyết hệ điều hành')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0018      ', N'Kinh tế công nghiệp')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0019      ', N'Công nghệ phần mềm')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0020      ', N'Công nghệ web')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0021      ', N'Thực tập nhóm')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0022      ', N'Hình họa')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0023      ', N'Phân tích thiết kế và giải thuật')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0024      ', N'Kĩ thuật lập trình')
INSERT [dbo].[MONTHI] ([MaMon], [TenMon]) VALUES (N'0025      ', N'Đạo đức nghề nghiệp')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151001', N'Đinh Tấn Lực')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151002', N'Ngô Minh Quang')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151003', N'Nguyễn Thị Hương Ly')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151004', N'Đào Văn Nam')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151005', N'Nguyễn Hải Văn')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151006', N'Nguyễn Thị Hồng Ánh')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151007', N'Lê Thị Ngọc')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151008', N'Nguyễn Văn Dũng')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151009', N'Nguyễn Văn Lâm')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151010', N'Lê Duy Đạt')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151011', N'Lê Minh Hiếu')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151012', N'Nguyễn Quốc Hiếu')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151013', N'Nguyễn Tiến Dũng')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151014', N'Đặng Thế Sơn')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151015', N'Nguyễn Thị Thu Hà')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151016', N'Trần Văn Kiên')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151017', N'Phạm Thị Huế')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151018', N'Nguyễn Thị Lan Anh')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151019', N'Trịnh Vân Anh')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151020', N'Nguyễn Văn Khoa')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151021', N'Trần Xuân Đoàn')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151022', N'Nguyễn Đức Trung')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151023', N'Nguyễn Thị Thu Hoài')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151024', N'Ngô Thị Diễm')
INSERT [dbo].[SINHVIEN] ([MaSV], [TenSV]) VALUES (N'17151025', N'Bùi Thị Diễm')
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150021', N'0021      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150021', N'0025      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150022', N'0022      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150022', N'0023      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150022', N'0024      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150022', N'0025      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150023', N'0001      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150023', N'0010      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150023', N'0014      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150023', N'0018      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150024', N'0003      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150024', N'0008      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150024', N'0017      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150024', N'0023      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150025', N'0008      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150025', N'0022      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150025', N'0023      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150025', N'0024      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17150025', N'0025      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151001', N'0001      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151001', N'0002      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151002', N'0003      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151002', N'0004      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151003', N'0001      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151003', N'0005      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151004', N'0002      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151004', N'0007      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151004', N'0008      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151005', N'0002      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151006', N'0005      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151006', N'0006      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151007', N'0001      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151007', N'0003      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151007', N'0007      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151007', N'0008      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151008', N'0001      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151008', N'0003      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151008', N'0004      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151009', N'0003      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151009', N'0005      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151009', N'0007      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151009', N'0008      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151010', N'0001      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151010', N'0003      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151010', N'0004      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151010', N'0006      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151011', N'0002      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151011', N'0009      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151011', N'0010      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151012', N'0003      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151012', N'0004      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151013', N'0006      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151013', N'0007      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151013', N'0008      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151014', N'0005      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151014', N'0006      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151014', N'0009      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151015', N'0005      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151015', N'0007      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151015', N'0010      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151016', N'0011      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151016', N'0013      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151016', N'0014      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151017', N'0012      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151017', N'0015      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151017', N'0016      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151018', N'0010      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151018', N'0012      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151018', N'0014      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151019', N'0015      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151019', N'0016      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151019', N'0017      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151020', N'0010      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151020', N'0013      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151020', N'0016      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151020', N'0017      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151020', N'0018      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151021', N'0014      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151021', N'0017      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151021', N'0019      ', NULL)
INSERT [dbo].[THI] ([MaSV], [MaMon], [ThoiGian]) VALUES (N'17151021', N'0020      ', NULL)

/****** Object:  StoredProcedure [dbo].[P1]    Script Date: 5/19/2020 3:04:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[P1]
as begin
	select distinct thi2.MaMon,
					(	select thi1.MaSV + ','
						from THI thi1
						where thi1.MaMon=thi2.MaMon
						order by thi1.MaMon
						for XML PATH(''))[MaSV]
	from THI thi2
end
GO
USE [master]
GO
ALTER DATABASE [LICHTHI] SET  READ_WRITE 
GO
