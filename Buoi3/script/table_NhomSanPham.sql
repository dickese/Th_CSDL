USE [QLBH]
GO

/****** Object:  Table [dbo].[NhomSanPhanm]    Script Date: 9/10/2024 5:00:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NhomSanPhanm](
	[MaNhom] [int] NOT NULL,
	[TenNhom] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


