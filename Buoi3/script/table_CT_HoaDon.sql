USE [QLBH]
GO

/****** Object:  Table [dbo].[CT_HoaDon]    Script Date: 9/10/2024 4:59:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CT_HoaDon](
	[MaHD] [int] NOT NULL,
	[MaSp] [int] NOT NULL,
	[SoLuong] [smallint] NULL,
	[DonGia] [money] NULL,
	[ChietKhau] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon1_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO

ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_CTHoaDon1_HoaDon]
GO

ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon2_HoaDon] FOREIGN KEY([MaSp])
REFERENCES [dbo].[SanPham] ([MaSP])
GO

ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_CTHoaDon2_HoaDon]
GO

ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [ck_ChietKhau] CHECK  (([ChietKhau]>=(0)))
GO

ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [ck_ChietKhau]
GO

ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [ck_soLuong] CHECK  (([SoLuong]>(0)))
GO

ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [ck_soLuong]
GO

