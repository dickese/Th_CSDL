USE [QLBH]
GO

/****** Object:  Table [dbo].[HoaDon]    Script Date: 9/10/2024 4:59:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] NOT NULL,
	[NgayLapHD] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[NoiChuyen] [nvarchar](60) NOT NULL,
	[MakH] [char](5) NULL,
	[LoaiHD] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [NgayLapHD]
GO

ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ('N') FOR [LoaiHD]
GO

ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MakH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO

ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO

ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [ck_LoaiHD] CHECK  (([LoaiHD]='T' OR [LoaiHD]='C' OR [LoaiHD]='X' OR [LoaiHD]='N'))
GO

ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [ck_LoaiHD]
GO

ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [ck_NgayGiao_NgayLapHD] CHECK  (([NgayGiao]>=[NgayLapHD]))
GO

ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [ck_NgayGiao_NgayLapHD]
GO

ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [ck_NgayLapHD] CHECK  (([NgayLapHD]>=getdate()))
GO

ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [ck_NgayLapHD]
GO


