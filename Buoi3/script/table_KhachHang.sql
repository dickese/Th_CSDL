USE [QLBH]
GO

/****** Object:  Table [dbo].[KhachHang]    Script Date: 9/10/2024 4:59:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[KhachHang](
	[MaKH] [char](5) NOT NULL,
	[TenKH] [nvarchar](40) NOT NULL,
	[LoaiKH] [nvarchar](3) NULL,
	[DiaChi] [nvarchar](60) NULL,
	[Phone] [nvarchar](24) NULL,
	[DCMail] [nvarchar](50) NULL,
	[DiemTL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [ck_DiemTL] CHECK  (([DiemTL]>=(0)))
GO

ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [ck_DiemTL]
GO

ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [ck_LoaiKH] CHECK  (([LoaiKH]='VL' OR [LoaiKH]='TV' OR [LoaiKH]='VIP'))
GO

ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [ck_LoaiKH]
GO


