USE [QLBH]
GO

/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 9/10/2024 5:00:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] NOT NULL,
	[TenNCC] [nvarchar](40) NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[Phone] [nvarchar](24) NULL,
	[SoFax] [nvarchar](24) NULL,
	[DCMail] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


