USE [dbDoAnWeb]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Img] [nvarchar](max) NULL,
	[IDPhim] [int] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTTapPhim]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTTapPhim](
	[IDPhim] [int] IDENTITY(1,1) NOT NULL,
	[TapPhim] [int] NULL,
	[ID] [int] NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_CTTapPhim] PRIMARY KEY CLUSTERED 
(
	[IDPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DSPhimBo]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSPhimBo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NamPhatHanh] [int] NULL,
	[IDTheLoai] [int] NULL,
	[ThoiLuong] [nvarchar](15) NULL,
	[Img] [nvarchar](max) NULL,
	[MaQG] [int] NULL,
	[LuotXem] [int] NULL,
 CONSTRAINT [PK_DSPhim1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DSPhimLe]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSPhimLe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NamPhatHanh] [int] NULL,
	[IDTheLoai] [int] NULL,
	[ThoiLuong] [nvarchar](15) NULL,
	[Img] [nvarchar](max) NULL,
	[MaQG] [int] NULL,
	[LuotXem] [int] NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_DSPhimLe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gioithieu]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gioithieu](
	[idgioitin] [int] IDENTITY(1,1) NOT NULL,
	[noidung] [nvarchar](max) NULL,
	[sdtlien] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HopPhim]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HopPhim](
	[TenDN] [varchar](50) NOT NULL,
	[IDPhim] [int] NOT NULL,
 CONSTRAINT [PK_HopPhim1] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC,
	[IDPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LichSu]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LichSu](
	[TenDN] [varchar](50) NOT NULL,
	[IDPhim] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC,
	[IDPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nam]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nam](
	[MaNam] [int] IDENTITY(1,1) NOT NULL,
	[TenNam] [int] NULL,
 CONSTRAINT [PK_Nam] PRIMARY KEY CLUSTERED 
(
	[MaNam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuocGia]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuocGia](
	[MaQG] [int] IDENTITY(1,1) NOT NULL,
	[TenQG] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quốc Gia] PRIMARY KEY CLUSTERED 
(
	[MaQG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDN] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[Quyen] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[IDTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[IDTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tintucphim]    Script Date: 4/1/2024 4:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tintucphim](
	[idtintuc] [int] IDENTITY(1,1) NOT NULL,
	[tieude] [nvarchar](max) NULL,
	[tomtat] [nvarchar](max) NULL,
	[noidung] [nvarchar](max) NULL,
	[hinhanh] [nvarchar](max) NULL,
	[ngaycapnhat] [date] NULL,
	[luotxem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idtintuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([ID], [Img], [IDPhim]) VALUES (1, N'k2-banner.jpg', 7)
INSERT [dbo].[Banner] ([ID], [Img], [IDPhim]) VALUES (2, N'yetcndt-banner.png', 9)
INSERT [dbo].[Banner] ([ID], [Img], [IDPhim]) VALUES (3, N'bannerluattroi.jpg', 5)
INSERT [dbo].[Banner] ([ID], [Img], [IDPhim]) VALUES (4, N'bannernhuytruyen.jpg', 3)
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[CTTapPhim] ON 

INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (1, 1, 1, N'https://www.youtube.com/embed/9Prz_Qzl9pg?si=pg89XxojOlDu8SOF')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (2, 2, 1, N'https://www.youtube.com/embed/oXadkYlw0s4?si=SRpjYyg6oDVHlSUN')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (3, 3, 1, N'https://www.youtube.com/embed/Yn46PAnnBxA?si=104GDcij4MFiMH3_')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (4, 4, 1, N'https://www.youtube.com/embed/4OZ2OTPKZ2g?si=srilbDARAfDM7zal')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (5, 5, 1, N'https://www.youtube.com/embed/HnT_4FKCTVM?si=K5zJ_2CJWTJkVu47')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (6, 6, 1, N'https://www.youtube-nocookie.com/embed/h6RONxjPBf4?si=qvWQ2xwx-boMCYNr')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (7, 1, 2, N'https://www.youtube.com/embed/D7nuvssOsiY?si=gb80wKbRHatEwiJT')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (8, 2, 2, N'https://www.youtube.com/embed/WFFe7Urepgo?si=roUJzV8SFSgGzghb')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (9, 1, 3, N'https://www.dailymotion.com/embed/video/x8pnoih?autoplay=1')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (10, 2, 3, N'https://www.dailymotion.com/embed/video/x8pnoin?autoplay=1')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (11, 3, 3, N'https://www.dailymotion.com/embed/video/x8pnoif?autoplay=1')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (12, 4, 3, N'https://www.dailymotion.com/embed/video/x8pnoik?autoplay=1')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (13, 5, 3, N'https://www.dailymotion.com/embed/video/x8pnoio?autoplay=1')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (14, 1, 4, N'https://www.youtube.com/embed/DnGQGuf01ms?si=ZS7qRQvXxQvGNi7a')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (15, 2, 4, N'https://www.youtube.com/embed/gBXdxhKLI3Q?si=vJHZsZnu-_sRnVtL')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (16, 3, 4, N'https://www.youtube.com/embed/n9rc-cLypco?si=Fec5u6v-au5D1qy9')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (17, 4, 4, N'https://www.youtube.com/embed/nIFHsOVIBQo?si=w-YuA1nhgC1oLUgj')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (18, 5, 4, N'https://www.youtube.com/embed/-wyKcxRFB4o?si=vDUkzGeU-8C7c2gA')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (19, 1, 5, N'https://www.youtube.com/embed/Gtc_9t0pqi4?si=bl0v-8Fya76Yg8D9')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (20, 2, 5, N'https://www.youtube.com/embed/TkF0oomn44s?si=iI0WsI_AyvplXpSo')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (21, 3, 5, N'https://www.youtube.com/embed/eqqjBDKy8H8?si=DxzRIcEb8k7SX3f7')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (28, 4, 5, N'https://www.youtube.com/embed/JtyAsy0rNAQ?si=I9aNfdA9HxdbL4O5')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (29, 5, 5, N'https://www.youtube.com/embed/eVNoNw3HSe4?si=xMxWUF6b_GO9jp2H')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (30, 1, 6, N'https://www.youtube.com/embed/as21f3LHFyo?si=Jzt-m-O5i4-0Qrtj')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (31, 1, 7, N'https://www.youtube.com/embed/TiB9eBFlTko?si=nxg01_MFsKwLHx2m')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (32, 1, 8, N'https://www.youtube.com/embed/wMeRUXpYBao?si=hFPrHXgnozZPg0VV')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (33, 2, 8, N'https://www.youtube.com/embed/eGIYb31rov8?si=D3gC66QgW0NxNyob')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (34, 3, 8, N'https://www.youtube.com/embed/g8e39yvhscI?si=o-Z2dnH09CpxsFhh')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (35, 4, 8, N'https://www.youtube.com/embed/ZYenJJQO4ps?si=GJ4M8DTUyc3HrkYL')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (36, 5, 8, N'https://www.youtube.com/embed/bMXvitpf_2E?si=LKj9UVh4X17u2RKx')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (37, 1, 9, N'https://www.youtube.com/embed/wxHfpsBgR1g?si=Ee7K3n9xwiYvojoH')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (38, 2, 9, N'https://www.youtube.com/embed/QjCHBviHviE?si=qrh3ugCe99nazCQV')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (39, 3, 9, N'https://www.youtube.com/embed/QjCHBviHviE?si=8KNEnd8GW1HqAook')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (40, 4, 9, N'https://www.youtube.com/embed/dY8pBXPJaWU?si=OlDlDrF2g28LJASl')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (41, 5, 9, N'https://www.youtube.com/embed/1QQueN5HXTE?si=IE98GZsE1EDCmJ-r')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (42, 1, 10, N'https://www.youtube.com/embed/lv39zyRRgJ8?si=aJrL9NGAM_KKY0CB')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (43, 2, 10, N'https://www.youtube.com/embed/7IuHtQvKoa8?si=N3OmQkiKykSQuGV_')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (44, 1, 16, N'https://www.youtube.com/embed/fixYVa1GjkQ?si=KAgv4XsTYKTaab0')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (45, 2, 16, N'https://www.youtube.com/embed/fixYVa1GjkQ?si=KAgv4XsTYKTaab0')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (46, 3, 16, N'https://www.youtube.com/embed/fixYVa1GjkQ?si=KAgv4XsTYKTaab0')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (48, 1, 17, N'https://www.youtube.com/embed/GBRiM6Xw31E?si=ydvoKfvTNgCb0GWz')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (49, 2, 17, N'https://www.youtube.com/embed/GBRiM6Xw31E?si=ydvoKfvTNgCb0GWz')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (50, 3, 17, NULL)
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (51, 1, 19, N'https://www.youtube.com/embed/p90V7QNJuX8?si=STgyoQ1ImHM5Jmw4')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (52, 2, 19, N'https://www.youtube.com/embed/9mbGOrXLMhE?si=gJRnWnNjaiqCBlK_')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (53, 1, 20, N'https://www.youtube.com/embed/S5UeNHBhUMQ?si=cXnIS8W81g4AZzA7')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (54, 2, 20, N'https://www.youtube.com/embed/uiDMjSxjZz0?si=2ZZI2RQKMhBtUxuC')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (55, 3, 20, N'https://www.youtube.com/embed/fNlBvIEn9tk?si=el3ZKtyPlN5yR8K_')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (56, 4, 20, N'https://www.youtube.com/embed/qtb-nN3xiT4?si=IKixUxOeg-7BPKjC')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (57, 1, 23, N'https://www.youtube.com/embed/EX6clvId19s?si=v3CK3wjiTyYbtohv')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (58, 1, 27, N'https://www.youtube.com/embed/G62Nub_Mfpw?si=LdkfqLYxU51sNFF6')
SET IDENTITY_INSERT [dbo].[CTTapPhim] OFF
SET IDENTITY_INSERT [dbo].[DSPhimBo] ON 

INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (1, N'SHOWBIZ Đại Chiến', N'Bộ phim kể về cuộc đấu tranh, cạnh tranh gay gắt giữa các nghệ sĩ, người nổi tiếng trong ngành giải trí, với sự cạnh tranh, ganh đua và những mưu mô, thủ đoạn đầy tính chiến lược, SHOWBIZ ĐẠI CHIẾN mang đến cho khán giả cái nhìn thú vị và lôi cuốn về thế giới giải trí Thái Lan.', 3, 3, N'16 Tập', N'showbiz-dai-chien.jpg', 6, 29)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (2, N'Số Phận Nghiệt Ngã', N'Câu chuyện kể lại cuộc đấu tranh đầy mạo hiểm và khổ đau của ba nhân vật chính. Phần lớn mối quan hệ của họ có thể được mô tả như một mối tình tay ba. Khun Paen (bảnh bao nhưng nghèo) và Khun Chang (giàu nhưng xấu) cạnh tranh nhau để giành lấy Wanthong xinh đẹp, đáng yêu từ thời thơ ấu. Câu chuyện của họ xuyên suốt trong bối cảnh lịch sử, bao gồm hai cuộc chiến tranh, một số vụ bắt cóc, một cuộc nổi dậy, một cuộc sống bình dị trong rừng, hai phiên tòa. Cuối cùng, vua Vương quốc Ayuthaya kết án Wanthong tử hình vì đã không lựa chọn giữa hai người đàn ông.', 10, 7, N'Đang công chiếu', N'so-phan-nghiet-nga.jpg', 6, 6)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (3, N'Như Ý Truyện', N'Như Ý Truyện kể về Những năm Ung Chính, sau khi bị Tam a ca Hoằng Thời từ hôn, thiếu nữ Ô Lạp Na Lạp Thanh Anh, cháu của Cảnh Nhân cung Hoàng hậu Ô Lạp Na Lạp Nghi Tu, được Tứ A ca Hoằng Lịch, con trai nuôi của Hi Quý phi Nữu Hỗ Lộc thị, chọn làm Đích Phúc tấn, còn Phú Sát thị xuất thân danh môn mà Hi Quý phi nhắm đến chỉ là Trắc Phúc tấn. Ngay lúc đó, biến cố xảy ra, Ô Lạp Na Lạp Hoàng hậu bị khép tội và cấm túc, Thanh Anh cũng vì thế mà phải nhường vị trí Đích Phúc Tấn cho Phú Sát thị, còn mình chỉ đành nhận vị trí Trắc Phúc tấn.', 4, 4, N'12 Tập', N'nhu-y-truyen.jpg', 3, 5)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (4, N'Vương Phi Bất Đắc Dĩ', N'Hiệp nữ giang hồ Vương Thụy Thu vào nhầm vương phủ, thay thế tân nương, phá hỏng kế hoạch bắt kẻ gian trong ngày tân hôn của vương gia. Vương Thụy Thu không thoát thân được chỉ đành tiếp tục với thân phận vương phi phối hợp với vương gia, hai người lâu dần nảy sinh tình cảm.', 10, 4, N'Đang công chiếu', N'vuong-phi-bat-dac-di.jpg', 3, 5)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (5, N'Luật Trời', N'Luật trời xoay quanh câu chuyện về hai chị em Trang (Ngọc Lan) và Thảo (Quỳnh Lam). Từ nhỏ, Trang đã ghen tị khi cho rằng Thảo luôn nhận được sự yêu thương nhiều hơn từ mọi người. Khi lớn lên, cô bỏ ra Sài Gòn và gặp Được (Huy Khánh), một kẻ vô công rỗi nghề lợi dụng mã bề ngoài để ăn bám phụ nữ, từ đó dụ dỗ đưa vào con đường bán phấn buôn hương. Trong một lần về quê, Được đã cưỡng bức Thảo nhưng không thành và bị Trang đuổi ra khỏi nhà. Thảo sau đó đã trở thành vợ thứ của điền chủ Lâm và được cả ông bà điền chủ hết lòng yêu thương bởi sự dịu dàng và ôn hoà trong cách đối nhân xử thế. Trong khi đó, Trang bị Được trở mặt đánh đập, xua đuổi nên trắng tay trở về quê nương náu trong căn nhà cũ. Ghen tị với những gì em gái đang có, Trang quyết cướp đoạt mọi thứ của Thảo khi biết giờ đang hưởng cuộc sống giàu sang…', 9, 7, N'35 Tập', N'luat-troi.png', 8, 28)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (6, N'Hậu Duệ Mặt Trời', N'Hậu duệ mặt trời là bộ phim dài 16 tập của đài KBS kể về những quân nhân làm nhiệm vụ gìn giữ hòa bình ở một vùng đất xa xôi. Xuyên suốt bộ phim là câu chuyện tình của Yoo Shi Jin (do Song Joong Ki đóng), đội trưởng lực lượng gìn giữ hòa bình của Liên Hợp Quốc, và nàng bác sĩ Kang Mo Yeon (do Song Hye Kyo thủ vai).', 4, 7, N'16 Tập', N'5.jpg', 1, 2)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (7, N'The K2', N'The K2 xoay quanh câu chuyện của Kim Je Ha, còn được gọi là K2, một người lính yêu nước bị chính Tổ quốc và đồng nghiệp phản bội. Giờ đây, anh ta được thuê làm vệ sĩ riêng cho Choi Yoo Jin, vợ của ứng cử viên Tổng thống đồng thời là ái nữ của một gia đình tài phiệt.  Go Ahn Na, cô con gái riêng của vị ứng cử viên Tổng thống. Những tổn thương thời thơ ấu khiến Go Ahn Na trở nên cô lập và ít giao tiếp với thế giới. Đối với cô, tình yêu chỉ là công cụ để trả thù. Đây là người sẽ khiến trái tim Kim Je Ha phải rung động?', 2, 2, N'16 Tập', N'k2.jpg', 1, 4)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (8, N'Em Là Của Anh Đừng Của Ai', N'Nội dung kể về nữ chính là Hương (Lê Lý Lan Hương) cô nàng xinh đẹp, thông minh, tốt bụng nhưng có tính cách lạnh lùng. Với những đổ vỡ tình cảm trong gia đình khiến cô trở nên trầm tính đến khi Đăng xuất hiện. Nam chính là Đăng (Lương Gia Huy) là chàng trai nhà quê có tính cách hài hước.', 1, 7, N'24 Tập', N'em-la-cua-anh-dung-cua-ai.jpg', 8, 9)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (9, N'Yêu Em Từ Cái Nhìn Đầu Tiên', N'“ Yêu em từ cái nhìn đầu tiên” bắt đầu từ một câu chuyện tình yêu trên mạng. Sau khi “ly hôn” (trong trò chơi) với Chân Thủy Vô Hương – một cao thủ của game Thiện Nữ U Hồn, Bối Vy Vy – hoa khôi khoa Công nghệ thông tin trường Đại học nổi tiếng A với nickname là Lô Vĩ Vy Vy đã “tái hôn” với Đại thần Nhất Tiếu Nại Hà – đệ nhất cao thủ trong game. Không ngờ khi hai người quyết định gặp mặt nhau ngoài đời, đệ nhất cao thủ Nhất Tiếu Nại Hà lại là Tiêu Nại – đại thần của trường đại học A', 2, 7, N'30 Tập', N'yeu-em-tu-cai-nhin-dau-tien.jpg', 3, 6)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (10, N'Lương Ngôn Tả Ý', N'Lương Ngôn Tả Ý là bộ phim chuyển thể từ truyện cùng tên của tác giả Mộc Phù Sinh, tuy nhiên khi lên phim thì có khá nhiều tình tiết nhỏ đã bị thay đổi so với nguyên tác. Ví dụ cặp đôi chính Lệ Trạch Lương (La Vân Hi đóng) và Tô Tả Ý (Trình Tiêu đóng) vốn là thanh mai trúc mã nhưng sau khi được chuyển thể thì họ lại trở thành một cặp đôi “nhất kiến chung tình”. Nam nữ chính của chúng ta gặp nhau trên núi và sau những tiếp xúc thì đã nhanh chóng nảy sinh tình cảm, mang theo một cảm giác hơi miễn cưỡng.', 7, 7, N'32 Tập', N'luong-ngon-ta-y.jpg', 3, 14)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (16, N'Lãng Khách', N'Một vụ tai nạn máy bay bí ẩn giết chết hơn 211 thường dân và để lại nhiều bí ẩn chưa được giải đáp, và một trong số các nạn nhân có cháu trai của Cha Dal-geon (Lee Seung-gi) [7]. Quyết tâm tìm ra sự thật đằng sau vụ tai nạn, Cha Dal-geon bắt tay vào một cuộc điều tra, dẫn anh ta đến một mạng lưới tham nhũng rối rắm. Cuộc sống của anh đan xen với Go Hae-ri (Bae Suzy), một nhân viên bí mật cho Cơ quan Tình báo Quốc gia. Họ đã cùng nhau hợp tác để tìm ra nguyên nhân của vụ rơi máy bay.', 5, 2, N'12 Tập', N'lang-khach.jpg', 1, 58)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (17, N'Vincenzo', N'“Vincenzo” là câu chuyện kể về một “luật sư mafia” người Ý gốc Hàn trốn về Hàn Quốc sau khi bị tổ chức phản bội. Khi trở lại quê hương, anh tham gia quét sạch kẻ xấu theo đúng cách của “một người xấu” cùng luật sư Hong Cha-yong.', 7, 8, N'20 Tập', N'vincenzo.jpg', 1, 21)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (18, N'My Name', N'Phim kể về hành trình báo thù của Yoon Ji Woo. Bố của cô là một tay anh chị trong một tổ chức tội phạm nguy hiểm. Việc bố bị truy nã và biến mất suốt nhiều tháng khiến cuộc sống của Yoon Ji Woo rơi vào địa ngục. Cô bị bạn bè kì thị bắt nạt và bị trường đuổi học. Đỉnh điểm là khi cô tận mắt chứng kiến cái chết của bố do một kẻ đội mũ trùm đầu gây ra.', 7, 8, N'8 Tập', N'my-name.jpg', 1, NULL)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (19, N'Conan - Thám Tử Lừng Danh', N'Thám tử lừng danh Conan xoay quanh câu chuyện về chàng thám tử Kudo Shinichi, trong một lần đang điều tra đã bị Tổ chức Áo Đen ép uống thuốc độc, khiến cho cơ thể bị teo nhỏ. Sau đó, Shinichi chuyển đến sống ở nhà của người bạn thuở niên thiếu Ran Mori cùng người bố Kogoro Mori. Tại đây, cậu dùng văn phòng thám tử của ông Kogoro để truy tìm tung tích của tổ chức Áo Đen đồng thời giúp ông phá nhiều vụ án dưới một thân phận mới là Conan Edogawa.', 1, 1, N'90 phút', N'bannerconan.jpg', 2, 3)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (20, N'Doraemon - Mèo Máy Đến Từ Tương Lai', N'Bộ truyện kể về một chú mèo máy tên Doraemon đến từ thế kỉ 22 để giúp một cậu bé lớp 5 hậu đậu tên là Nobi Nobita. Sewashi (Nobito), cháu ba đời của Nobita gửi Doraemon về quá khứ nhằm giúp đỡ ông mình, qua đó cải thiện được hoàn cảnh của con cháu Nobita sau này. Các tập phim Doraemon thường xoay quanh những rắc rối hay xảy ra với cậu bé Nobita. Cốt truyện thường gặp nhất là Nobita trở về nhà khóc lóc với Doraemon vì những rắc rối mà cậu gặp phải ở trường học hoặc với bạn bè. Sau khi bị cậu van nài hoặc thúc giục, Doraemon sẽ lấy ra một bảo bối trong chiếc túi thần kỳ trước bụng để giúp Nobita giải quyết rắc rối của mình. Nhưng Nobita sẽ lại thường đi quá xa so với dự định ban đầu của Doraemon. Cậu thường lấy sự ưu việt của bảo bối để trêu ghẹo mọi người nên cuối cùng bị phản tác dụng, bị bảo bối gây phiền phức. Có đôi khi những người bạn của Nobita, thường là Suneo hoặc Jaian lại lấy trộm những bảo bối và sử dụng chúng không đúng mục đích. Kết thúc mỗi câu chuyện, những ai sử dụng sai mục đích bảo bối sẽ phải chịu hậu quả do mình gây ra, từ đó khán giả sẽ rút ra được bài học cho riêng mình.', 1, 1, N'90 phút', N'nhung-hiep-si-khong-gian.jpg', 2, 2)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (23, N'Phim Rạp', N'Tổng Hợp Các Thể Loại Phim Rạp', 9, 7, N'90 phút', N'phimrap.png', 8, 3)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (27, N'Đường Ngầm Tội Ác', N'Sau một vụ tai nạn ở hệ thống tàu điện ngầm ở Thành phố Mexico, thám tử Ulises Elizalde (Juan Pablo Medina) được cử đi điều tra. Ulises theo sau một người đàn ông khả nghi đã đánh gục anh ta và ném anh ta xuống cống rãnh của thành phố. Anh được cứu bởi Yamel (Ana Serradilla), một phụ nữ trẻ đang che giấu một bí mật to lớn. Yamel và những người khác sống dưới cống đã được tiêm một loại huyết thanh trẻ mãi không già được phát triển bởi một nhà khoa học tên là Igor, theo lệnh của triệu phú Milosz - một bác sĩ khét tiếng từ cuối những năm 60, người sở hữu một công ty dược phẩm lớn và che giấu hành vi tham nhũng của mình. Những thí nghiệm rợn người, ẩn sâu dưới lòng thành phố này liệu có bị phát hiện đưa ra ánh sáng hay không. Mời quý khán giả thưởng thức bộ phim "Đường Ngầm Tội Ác"', 8, 8, N'90 phút', N'duongngamtoiac.jpg', 4, 1)
SET IDENTITY_INSERT [dbo].[DSPhimBo] OFF
INSERT [dbo].[HopPhim] ([TenDN], [IDPhim]) VALUES (N'admin', 10)
INSERT [dbo].[HopPhim] ([TenDN], [IDPhim]) VALUES (N'admin', 16)
INSERT [dbo].[HopPhim] ([TenDN], [IDPhim]) VALUES (N'sanh', 16)
INSERT [dbo].[HopPhim] ([TenDN], [IDPhim]) VALUES (N'sanh', 17)
INSERT [dbo].[HopPhim] ([TenDN], [IDPhim]) VALUES (N'Sanh@321dSDFdgb', 5)
INSERT [dbo].[HopPhim] ([TenDN], [IDPhim]) VALUES (N'Sanh@321dSDFdgb', 16)
INSERT [dbo].[HopPhim] ([TenDN], [IDPhim]) VALUES (N'tuanphuc', 16)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 1)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 2)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 4)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 5)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 9)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 16)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 17)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 19)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 20)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'admin', 23)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'sanh', 1)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'sanh', 5)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'sanh', 16)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'sanh', 18)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'Sanh@321dSDFdgb', 5)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'Sanh@321dSDFdgb', 10)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'Sanh@321dSDFdgb', 16)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'tuanphuc', 5)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'tuanphuc', 6)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'tuanphuc', 8)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'tuanphuc', 9)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'tuanphuc', 10)
INSERT [dbo].[LichSu] ([TenDN], [IDPhim]) VALUES (N'tuanphuc', 16)
SET IDENTITY_INSERT [dbo].[Nam] ON 

INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (1, 2015)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (2, 2016)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (3, 2017)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (4, 2018)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (5, 2019)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (6, 2020)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (7, 2021)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (8, 2022)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (9, 2023)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (10, 2024)
SET IDENTITY_INSERT [dbo].[Nam] OFF
SET IDENTITY_INSERT [dbo].[QuocGia] ON 

INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (1, N'Hàn Quốc')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (2, N'Nhật Bản ')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (3, N'Trung Quốc')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (4, N'Mỹ')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (5, N'Pháp')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (6, N'Thái Lan')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (7, N'Quốc gia khác')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (8, N'Việt Nam')
SET IDENTITY_INSERT [dbo].[QuocGia] OFF
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen]) VALUES (N'admin', N'admin', 1)
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen]) VALUES (N'chisanh', N'123', 0)
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen]) VALUES (N'sanh', N'123', NULL)
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen]) VALUES (N'Sanh@321dSDFdgb', N'12312ABC@312jidqjv', NULL)
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen]) VALUES (N'tuanphuc', N'123', 0)
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (1, N'Anime')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (2, N'Hành Động')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (3, N'Hài hước')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (4, N'Cổ trang')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (5, N'Học đường')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (6, N'Thần thoại')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (7, N'Tình cảm')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (8, N'Kịch tính')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
SET IDENTITY_INSERT [dbo].[tintucphim] ON 

INSERT [dbo].[tintucphim] ([idtintuc], [tieude], [tomtat], [noidung], [hinhanh], [ngaycapnhat], [luotxem]) VALUES (8, N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server Việt Nam', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server Việt Nam', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server Việt Nam', N'faraz-shanyar-img-3900.jpg', CAST(N'1999-07-07' AS Date), 5)
INSERT [dbo].[tintucphim] ([idtintuc], [tieude], [tomtat], [noidung], [hinhanh], [ngaycapnhat], [luotxem]) VALUES (12, N'fileName', N'fileName', N'fileName', N'72596273_p5.jpg', CAST(N'1999-07-07' AS Date), 3)
INSERT [dbo].[tintucphim] ([idtintuc], [tieude], [tomtat], [noidung], [hinhanh], [ngaycapnhat], [luotxem]) VALUES (14, N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIaaaaaaaaaaaaaaaaaaaa', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server Việt Nam', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server Việt Nam', N'67327788_917046421975818_8421098014549999616_n.jpg', CAST(N'2019-11-26' AS Date), 2)
SET IDENTITY_INSERT [dbo].[tintucphim] OFF
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD  CONSTRAINT [FK_Banner_DSPhimBo] FOREIGN KEY([IDPhim])
REFERENCES [dbo].[DSPhimBo] ([ID])
GO
ALTER TABLE [dbo].[Banner] CHECK CONSTRAINT [FK_Banner_DSPhimBo]
GO
ALTER TABLE [dbo].[CTTapPhim]  WITH CHECK ADD  CONSTRAINT [FK_CTTapPhim_DSPhimBo] FOREIGN KEY([ID])
REFERENCES [dbo].[DSPhimBo] ([ID])
GO
ALTER TABLE [dbo].[CTTapPhim] CHECK CONSTRAINT [FK_CTTapPhim_DSPhimBo]
GO
ALTER TABLE [dbo].[DSPhimBo]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimBo_Nam] FOREIGN KEY([NamPhatHanh])
REFERENCES [dbo].[Nam] ([MaNam])
GO
ALTER TABLE [dbo].[DSPhimBo] CHECK CONSTRAINT [FK_DSPhimBo_Nam]
GO
ALTER TABLE [dbo].[DSPhimBo]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimBo_QuocGia] FOREIGN KEY([MaQG])
REFERENCES [dbo].[QuocGia] ([MaQG])
GO
ALTER TABLE [dbo].[DSPhimBo] CHECK CONSTRAINT [FK_DSPhimBo_QuocGia]
GO
ALTER TABLE [dbo].[DSPhimBo]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimBo_TheLoai] FOREIGN KEY([IDTheLoai])
REFERENCES [dbo].[TheLoai] ([IDTheLoai])
GO
ALTER TABLE [dbo].[DSPhimBo] CHECK CONSTRAINT [FK_DSPhimBo_TheLoai]
GO
ALTER TABLE [dbo].[DSPhimLe]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimLe_Nam] FOREIGN KEY([NamPhatHanh])
REFERENCES [dbo].[Nam] ([MaNam])
GO
ALTER TABLE [dbo].[DSPhimLe] CHECK CONSTRAINT [FK_DSPhimLe_Nam]
GO
ALTER TABLE [dbo].[DSPhimLe]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimLe_QuocGia] FOREIGN KEY([MaQG])
REFERENCES [dbo].[QuocGia] ([MaQG])
GO
ALTER TABLE [dbo].[DSPhimLe] CHECK CONSTRAINT [FK_DSPhimLe_QuocGia]
GO
ALTER TABLE [dbo].[DSPhimLe]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimLe_TheLoai] FOREIGN KEY([IDTheLoai])
REFERENCES [dbo].[TheLoai] ([IDTheLoai])
GO
ALTER TABLE [dbo].[DSPhimLe] CHECK CONSTRAINT [FK_DSPhimLe_TheLoai]
GO
ALTER TABLE [dbo].[HopPhim]  WITH CHECK ADD  CONSTRAINT [FK_HopPhim_DSPhimBo] FOREIGN KEY([IDPhim])
REFERENCES [dbo].[DSPhimBo] ([ID])
GO
ALTER TABLE [dbo].[HopPhim] CHECK CONSTRAINT [FK_HopPhim_DSPhimBo]
GO
ALTER TABLE [dbo].[HopPhim]  WITH CHECK ADD  CONSTRAINT [FK_HopPhim_TaiKhoan] FOREIGN KEY([TenDN])
REFERENCES [dbo].[TaiKhoan] ([TenDN])
GO
ALTER TABLE [dbo].[HopPhim] CHECK CONSTRAINT [FK_HopPhim_TaiKhoan]
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD FOREIGN KEY([IDPhim])
REFERENCES [dbo].[DSPhimBo] ([ID])
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD FOREIGN KEY([TenDN])
REFERENCES [dbo].[TaiKhoan] ([TenDN])
GO
