USE [QLBH]
GO

/****** Object:  Table [dbo].[SanPham]    Script Date: 9/10/2024 5:00:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] NOT NULL,
	[TenSp] [nvarchar](40) NOT NULL,
	[MaNCC] [int] NULL,
	[MoTa] [nvarchar](50) NULL,
	[MaNhom] [int] NULL,
	[DonViTinh] [nvarchar](20) NULL,
	[GiaGoc] [money] NULL,
	[SLTon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO

ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO

ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhomSanPham] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomSanPhanm] ([MaNhom])
GO

ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhomSanPham]
GO

ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [ck_GiaGoc] CHECK  (([GiaGoc]>(0)))
GO

ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [ck_GiaGoc]
GO

ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [ck_SLT] CHECK  (([SLTon]>=(0)))
GO

ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [ck_SLT]
GO


