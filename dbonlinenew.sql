USE [OnlineExam]
GO
/****** Object:  Table [dbo].[Cauhoi]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cauhoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[debai] [nvarchar](max) NOT NULL,
	[a] [nvarchar](max) NOT NULL,
	[b] [nvarchar](max) NOT NULL,
	[c] [nvarchar](max) NOT NULL,
	[d] [nvarchar](max) NULL,
	[dapan] [varchar](1) NOT NULL,
	[dokho] [varchar](50) NOT NULL,
	[usernameGV] [varchar](20) NOT NULL,
	[idmonhoc] [int] NOT NULL,
 CONSTRAINT [PK_Cauhoi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dethi]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dethi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](60) NOT NULL,
	[time] [int] NOT NULL,
	[starttime] [smalldatetime] NULL,
	[endtime] [smalldatetime] NULL,
	[de] [int] NOT NULL,
	[tb] [int] NOT NULL,
	[kho] [int] NOT NULL,
	[tong] [int] NOT NULL,
	[idmon] [int] NOT NULL,
	[usernameGV] [varchar](20) NOT NULL,
	[random] [bit] NOT NULL,
	[type] [bit] NOT NULL,
 CONSTRAINT [PK_Dethi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DethiCauhoi]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DethiCauhoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NULL,
	[questionid] [int] NULL,
 CONSTRAINT [PK_DethiCauhoi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DethiLop]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DethiLop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NULL,
	[classid] [int] NULL,
 CONSTRAINT [PK_ExamClass] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ketqua]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ketqua](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[masv] [varchar](20) NOT NULL,
	[examid] [int] NOT NULL,
	[classid] [int] NOT NULL,
	[ngaythi] [smalldatetime] NULL,
	[tglambai] [int] NULL,
	[diem] [float] NULL,
	[camthi] [bit] NOT NULL,
 CONSTRAINT [PK_Ketqua] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lichsuthi]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lichsuthi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examname] [nvarchar](60) NULL,
	[ngaythi] [smalldatetime] NULL,
	[tglambai] [int] NULL,
	[diem] [float] NULL,
	[mon] [nvarchar](80) NULL,
	[masv] [varchar](20) NULL,
 CONSTRAINT [PK_Lichsuthi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lophoc]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lophoc](
	[classid] [int] IDENTITY(1,1) NOT NULL,
	[classname] [nvarchar](65) NOT NULL,
	[siso] [int] NOT NULL,
	[matkhau] [varchar](15) NOT NULL,
	[usernameGV] [varchar](20) NULL,
	[idmonhoc] [int] NOT NULL,
 CONSTRAINT [PK_Lophoc] PRIMARY KEY CLUSTERED 
(
	[classid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monhoc]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monhoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_Monhoc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhanvien]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvien](
	[username] [varchar](20) NOT NULL,
	[hoten] [nvarchar](30) NOT NULL,
	[image] [nvarchar](max) NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](12) NULL,
	[phong_khoa] [nvarchar](30) NOT NULL,
	[chucvu] [nvarchar](30) NULL,
	[gioithieu] [nvarchar](max) NULL,
	[userid] [int] NOT NULL,
	[loaitk] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Nhanvien] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sinhvien]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sinhvien](
	[masv] [varchar](20) NOT NULL,
	[hoten] [nvarchar](30) NOT NULL,
	[image] [nvarchar](max) NULL,
	[ngaysinh] [date] NOT NULL,
	[gioitinh] [bit] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](12) NULL,
	[quequan] [nvarchar](80) NULL,
	[cmnd] [int] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_Sinhvien] PRIMARY KEY CLUSTERED 
(
	[masv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhvienLop]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhvienLop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[classid] [int] NULL,
	[masv] [varchar](20) NULL,
 CONSTRAINT [PK_SinhvienLop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 10/20/2020 08:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[role] [varchar](2) NOT NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cauhoi] ON 

INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (1, N'Trong các hàm sau, hàm nào dùng để in kết quả ra màn hình?', N'scanf();', N'printf();', N'getch();', N' getchar();', N'B', N'de', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (2, N'Trong ngôn ngữ C, khai báo “int array[3][5]” có nghĩa là:', N'Các phần tử của mảng là các số nguyên.', N'array[3][5] là một phần tử của mảng.', N'Là một mảng hai chiều tối đa là 15 phần tử và mỗi phần tử là một số nguyên.', N'Mảng có 2 giá trị nguyên 3 và 5', N'C', N'tb', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (3, N'Kí hiệu nào là con trỏ của phẩn tử thứ 3 của màng a có 4 kí tự:', N'*(a+3);', N'*(a+2);', N'*a+3;', N'*(a+4);', N'B', N'kho', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (4, N'1+1=?', N'3', N'2', N'1', N'0', N'B', N'de', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (5, N'"What is your name?" nghĩa là gì trong Tiếng Việt?', N'Tên của bạn là gì?', N'Bạn quê ở đâu?', N'Bạn có người yêu chưa?', N'Bạn là ai?', N'A', N'de', N'vana123', 7)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (6, N'Để đảo giá trị của một biến boolean, ta dùng toán tử nào?', N'<>', N'>>', N'<<', N'!', N'D', N'de', N'vana123', 8)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (7, N'Phép trừ 2 con trỏ có cùng kiểu sẽ là:', N'Một con trỏ có cùng kiểu.', N'Giá trị true.', N'Không thực hiện được.', N'Một số nguyên.', N'D', N'tb', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (8, N'3 + 2 = ?', N'5', N'6', N'7', N'8', N'A', N'de', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (9, N'5 + 5 = ?', N'15', N'25', N'10', N'20', N'C', N'tb', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (10, N'100 + 500 = ?', N'150', N'5', N'550', N'600', N'D', N'de', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (11, N'Câu hỏi', N'Phương án 1', N'Phương án 2 (Đúng)', N'Phương án 3', N'Phương án 4', N'B', N'kho', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (12, N'15 + 15 = ?', N'20', N'10', N'50', N'30', N'D', N'de', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (13, N'50 + 50 = ?', N'100', N'101', N'102', N'201', N'A', N'de', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (14, N'35 * 500 = ?', N'17500', N'57100', N'71500', N'15700', N'A', N'tb', N'vana123', 6)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (15, N'Cho tập A={1,2,3,4,5,6,7,8,9}, tập B={1,2,3,9,10}. Tập A-B là:', N'{1,6,8}', N'{4,5,7,8,9,10}', N'{4,5,6,7,8}', N'{1,2,5,7,9}', N'C', N'de', N'vana123', 10)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (16, N'Microsoft Word là phần mềm dùng để?', N'Lướt web', N'Soạn thảo văn bản', N'Chụp ảnh', N'Tạo bản trình chiếu', N'B', N'de', N'vana123', 1)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (17, N'Hàm sau được viết ở ô J5 trong bảng tính Excel. Kết quả hiện thị là gì, biết ô J4 có giá trị 30?  =IF(OR(J4=29,J4=30),"Hà Nội","")', N'30', N'Ô trống không có giá trị', N'Lỗi cú pháp', N'Hà Nội', N'D', N'tb', N'vana123', 1)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (18, N'1000 * 1000 = ? ', N'1000000', N'2000000', N'1000', N'0', N'A', N'de', N'vana123', 10)
INSERT [dbo].[Cauhoi] ([id], [debai], [a], [b], [c], [d], [dapan], [dokho], [usernameGV], [idmonhoc]) VALUES (19, N'200+600=?', N'800', N'900', N'1000', N'700', N'A', N'de', N'vana123', 10)
SET IDENTITY_INSERT [dbo].[Cauhoi] OFF
GO
SET IDENTITY_INSERT [dbo].[Dethi] ON 

INSERT [dbo].[Dethi] ([id], [name], [time], [starttime], [endtime], [de], [tb], [kho], [tong], [idmon], [usernameGV], [random], [type]) VALUES (2, N'Bài kiểm tra 1 phút lần 1', 2, CAST(N'2020-10-07T13:30:00' AS SmallDateTime), CAST(N'2020-10-21T13:35:00' AS SmallDateTime), 4, 1, 1, 6, 6, N'vana123', 0, 0)
INSERT [dbo].[Dethi] ([id], [name], [time], [starttime], [endtime], [de], [tb], [kho], [tong], [idmon], [usernameGV], [random], [type]) VALUES (4, N'Thi giữa kỳ Lập trình', 45, CAST(N'2020-10-10T20:00:00' AS SmallDateTime), CAST(N'2020-10-18T20:05:00' AS SmallDateTime), 5, 4, 2, 11, 6, N'vana123', 0, 1)
INSERT [dbo].[Dethi] ([id], [name], [time], [starttime], [endtime], [de], [tb], [kho], [tong], [idmon], [usernameGV], [random], [type]) VALUES (5, N'Kiểm tra 15p Toán rời rạc', 15, NULL, NULL, 3, 0, 0, 3, 10, N'vana123', 0, 0)
INSERT [dbo].[Dethi] ([id], [name], [time], [starttime], [endtime], [de], [tb], [kho], [tong], [idmon], [usernameGV], [random], [type]) VALUES (9, N'toán rời rạc abc', 12, NULL, NULL, 0, 0, 0, 0, 10, N'vana123', 0, 0)
INSERT [dbo].[Dethi] ([id], [name], [time], [starttime], [endtime], [de], [tb], [kho], [tong], [idmon], [usernameGV], [random], [type]) VALUES (10, N'Đề thi Tin học đại cương', 15, CAST(N'2020-10-19T10:10:00' AS SmallDateTime), CAST(N'2020-10-24T10:15:00' AS SmallDateTime), 0, 0, 0, 0, 1, N'vana123', 0, 0)
SET IDENTITY_INSERT [dbo].[Dethi] OFF
GO
SET IDENTITY_INSERT [dbo].[DethiCauhoi] ON 

INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (5, 2, 4)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (6, 2, 7)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1012, 2, 8)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1023, 2, 10)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1024, 2, 11)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1026, 2, 1)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1036, 5, 15)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1037, 5, 18)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1038, 5, 19)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1039, 4, 1)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1040, 4, 4)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1041, 4, 8)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1042, 4, 2)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1043, 4, 7)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1044, 4, 9)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1045, 4, 3)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1046, 4, 11)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1047, 4, 10)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1048, 4, 12)
INSERT [dbo].[DethiCauhoi] ([id], [examid], [questionid]) VALUES (1049, 4, 14)
SET IDENTITY_INSERT [dbo].[DethiCauhoi] OFF
GO
SET IDENTITY_INSERT [dbo].[DethiLop] ON 

INSERT [dbo].[DethiLop] ([id], [examid], [classid]) VALUES (12, 2, 1)
INSERT [dbo].[DethiLop] ([id], [examid], [classid]) VALUES (35, 5, 3)
INSERT [dbo].[DethiLop] ([id], [examid], [classid]) VALUES (53, 4, 1)
INSERT [dbo].[DethiLop] ([id], [examid], [classid]) VALUES (56, 9, 3)
INSERT [dbo].[DethiLop] ([id], [examid], [classid]) VALUES (57, 10, 4)
SET IDENTITY_INSERT [dbo].[DethiLop] OFF
GO
SET IDENTITY_INSERT [dbo].[Ketqua] ON 

INSERT [dbo].[Ketqua] ([id], [masv], [examid], [classid], [ngaythi], [tglambai], [diem], [camthi]) VALUES (4, N'AT140620', 2, 1, CAST(N'2020-10-18T00:48:00' AS SmallDateTime), 4, 3.3, 0)
INSERT [dbo].[Ketqua] ([id], [masv], [examid], [classid], [ngaythi], [tglambai], [diem], [camthi]) VALUES (15, N'AT140620', 5, 3, NULL, NULL, NULL, 0)
INSERT [dbo].[Ketqua] ([id], [masv], [examid], [classid], [ngaythi], [tglambai], [diem], [camthi]) VALUES (35, N'AT140620', 4, 1, NULL, NULL, NULL, 0)
INSERT [dbo].[Ketqua] ([id], [masv], [examid], [classid], [ngaythi], [tglambai], [diem], [camthi]) VALUES (38, N'AT140620', 9, 3, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Ketqua] OFF
GO
SET IDENTITY_INSERT [dbo].[Lichsuthi] ON 

INSERT [dbo].[Lichsuthi] ([id], [examname], [ngaythi], [tglambai], [diem], [mon], [masv]) VALUES (1, N'Bài kiểm tra 1 phút lần 1', CAST(N'2020-10-10T07:24:00' AS SmallDateTime), 7, 4, N'Lập trình căn bản', N'AT140620')
INSERT [dbo].[Lichsuthi] ([id], [examname], [ngaythi], [tglambai], [diem], [mon], [masv]) VALUES (2, N'Thi giữa kỳ Lập trình', CAST(N'2020-10-15T14:34:00' AS SmallDateTime), 68, 8.8, N'Lập trình căn bản', N'AT140620')
INSERT [dbo].[Lichsuthi] ([id], [examname], [ngaythi], [tglambai], [diem], [mon], [masv]) VALUES (3, N'Thi giữa kỳ Lập trình', CAST(N'2020-10-15T14:44:00' AS SmallDateTime), 10, 3.3, N'Lập trình căn bản', N'AT140620')
INSERT [dbo].[Lichsuthi] ([id], [examname], [ngaythi], [tglambai], [diem], [mon], [masv]) VALUES (12, N'Bài kiểm tra 1 phút lần 1', CAST(N'2020-10-17T20:04:00' AS SmallDateTime), 60, 1.7, N'Lập trình căn bản', N'AT140620')
INSERT [dbo].[Lichsuthi] ([id], [examname], [ngaythi], [tglambai], [diem], [mon], [masv]) VALUES (13, N'Thi giữa kỳ Lập trình', CAST(N'2020-10-17T20:30:00' AS SmallDateTime), 10, 1.1, N'Lập trình căn bản', N'AT140620')
INSERT [dbo].[Lichsuthi] ([id], [examname], [ngaythi], [tglambai], [diem], [mon], [masv]) VALUES (14, N'Thi giữa kỳ Lập trình', CAST(N'2020-10-17T20:31:00' AS SmallDateTime), 3, 0, N'Lập trình căn bản', N'AT140620')
SET IDENTITY_INSERT [dbo].[Lichsuthi] OFF
GO
SET IDENTITY_INSERT [dbo].[Lophoc] ON 

INSERT [dbo].[Lophoc] ([classid], [classname], [siso], [matkhau], [usernameGV], [idmonhoc]) VALUES (1, N'Lập trình C L06 - AT16', 0, N'123', N'vana123', 6)
INSERT [dbo].[Lophoc] ([classid], [classname], [siso], [matkhau], [usernameGV], [idmonhoc]) VALUES (2, N'Tin đại cương 08/2020', 0, N'123456', NULL, 1)
INSERT [dbo].[Lophoc] ([classid], [classname], [siso], [matkhau], [usernameGV], [idmonhoc]) VALUES (3, N'Toán rời rạc L03 thầy Nguyễn Văn A', 0, N'123000', N'vana123', 10)
INSERT [dbo].[Lophoc] ([classid], [classname], [siso], [matkhau], [usernameGV], [idmonhoc]) VALUES (4, N'Tin học đại cương AT17', 0, N'321', N'vana123', 1)
SET IDENTITY_INSERT [dbo].[Lophoc] OFF
GO
SET IDENTITY_INSERT [dbo].[Monhoc] ON 

INSERT [dbo].[Monhoc] ([id], [name]) VALUES (1, N'Tin học đại cương')
INSERT [dbo].[Monhoc] ([id], [name]) VALUES (2, N'Toán cao cấp A1')
INSERT [dbo].[Monhoc] ([id], [name]) VALUES (3, N'Toán cao cấp A2')
INSERT [dbo].[Monhoc] ([id], [name]) VALUES (5, N'Kỹ năng mềm')
INSERT [dbo].[Monhoc] ([id], [name]) VALUES (6, N'Lập trình căn bản')
INSERT [dbo].[Monhoc] ([id], [name]) VALUES (7, N'Tiếng Anh 1')
INSERT [dbo].[Monhoc] ([id], [name]) VALUES (8, N'Kỹ thuật lập trình')
INSERT [dbo].[Monhoc] ([id], [name]) VALUES (9, N'Lý thuyết cơ sở dữ liệu')
INSERT [dbo].[Monhoc] ([id], [name]) VALUES (10, N'Toán rời rạc')
SET IDENTITY_INSERT [dbo].[Monhoc] OFF
GO
INSERT [dbo].[Nhanvien] ([username], [hoten], [image], [email], [phone], [phong_khoa], [chucvu], [gioithieu], [userid], [loaitk]) VALUES (N'kkitnguyen', N'KKit Nguyễn', NULL, N'nffkfsdn@gmail.com', N'0986516', N'An Toàn Thông Tin', NULL, NULL, 6, N'gv')
INSERT [dbo].[Nhanvien] ([username], [hoten], [image], [email], [phone], [phong_khoa], [chucvu], [gioithieu], [userid], [loaitk]) VALUES (N'vana123', N'Nguyễn Văn A', NULL, N'nguyenvana89@gmail.com', N'0986516', N'Công nghệ thông tin', N'Trưởng khoa', N'Tốt nghiệp Đại học Bách Khoa Hà Nội và đã có hơn 10 năm kinh nghiệm trong việc giảng dạy tại trường Học viện Kỹ thuật Mật mã. Là tác giả của 2 cuốn sách nổi tiếng chuyên ngành Công nghệ thông tin, được giảng dạy tại nhiều trường Đại học trong cả nước.', 1, N'gv')
GO
INSERT [dbo].[Sinhvien] ([masv], [hoten], [image], [ngaysinh], [gioitinh], [email], [phone], [quequan], [cmnd], [userid]) VALUES (N'AT140407', N'NGUYỄN VĂN ĐỊNH', NULL, CAST(N'2020-02-26' AS Date), 1, N'nffkfsdn@gmail.com', N'0986516', N'', 1234567, 3)
INSERT [dbo].[Sinhvien] ([masv], [hoten], [image], [ngaysinh], [gioitinh], [email], [phone], [quequan], [cmnd], [userid]) VALUES (N'AT140620', N'NGUYỄN XUÂN KHƯƠNG', NULL, CAST(N'1998-10-31' AS Date), 1, N'xuankhuongit@gmail.com', N'0989377910', N'', 1234567, 5)
GO
SET IDENTITY_INSERT [dbo].[SinhvienLop] ON 

INSERT [dbo].[SinhvienLop] ([id], [classid], [masv]) VALUES (1, 1, N'AT140620')
INSERT [dbo].[SinhvienLop] ([id], [classid], [masv]) VALUES (2, 3, N'AT140620')
SET IDENTITY_INSERT [dbo].[SinhvienLop] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([userid], [username], [password], [role]) VALUES (1, N'vana123', N'123456', N'gv')
INSERT [dbo].[UserAccount] ([userid], [username], [password], [role]) VALUES (3, N'AT140407', N'dinh123', N'sv')
INSERT [dbo].[UserAccount] ([userid], [username], [password], [role]) VALUES (5, N'AT140620', N'khuongit', N'sv')
INSERT [dbo].[UserAccount] ([userid], [username], [password], [role]) VALUES (6, N'kkitnguyen', N'123456', N'gv')
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
GO
ALTER TABLE [dbo].[Cauhoi]  WITH CHECK ADD  CONSTRAINT [FK_Cauhoi_Monhoc] FOREIGN KEY([idmonhoc])
REFERENCES [dbo].[Monhoc] ([id])
GO
ALTER TABLE [dbo].[Cauhoi] CHECK CONSTRAINT [FK_Cauhoi_Monhoc]
GO
ALTER TABLE [dbo].[Cauhoi]  WITH CHECK ADD  CONSTRAINT [FK_Cauhoi_Nhanvien] FOREIGN KEY([usernameGV])
REFERENCES [dbo].[Nhanvien] ([username])
GO
ALTER TABLE [dbo].[Cauhoi] CHECK CONSTRAINT [FK_Cauhoi_Nhanvien]
GO
ALTER TABLE [dbo].[Dethi]  WITH CHECK ADD  CONSTRAINT [FK_Dethi_Monhoc] FOREIGN KEY([idmon])
REFERENCES [dbo].[Monhoc] ([id])
GO
ALTER TABLE [dbo].[Dethi] CHECK CONSTRAINT [FK_Dethi_Monhoc]
GO
ALTER TABLE [dbo].[Dethi]  WITH CHECK ADD  CONSTRAINT [FK_Dethi_Nhanvien] FOREIGN KEY([usernameGV])
REFERENCES [dbo].[Nhanvien] ([username])
GO
ALTER TABLE [dbo].[Dethi] CHECK CONSTRAINT [FK_Dethi_Nhanvien]
GO
ALTER TABLE [dbo].[DethiCauhoi]  WITH CHECK ADD  CONSTRAINT [FK_DethiCauhoi_Cauhoi] FOREIGN KEY([questionid])
REFERENCES [dbo].[Cauhoi] ([id])
GO
ALTER TABLE [dbo].[DethiCauhoi] CHECK CONSTRAINT [FK_DethiCauhoi_Cauhoi]
GO
ALTER TABLE [dbo].[DethiCauhoi]  WITH CHECK ADD  CONSTRAINT [FK_DethiCauhoi_Dethi] FOREIGN KEY([examid])
REFERENCES [dbo].[Dethi] ([id])
GO
ALTER TABLE [dbo].[DethiCauhoi] CHECK CONSTRAINT [FK_DethiCauhoi_Dethi]
GO
ALTER TABLE [dbo].[DethiLop]  WITH CHECK ADD  CONSTRAINT [FK_DethiLop_Dethi] FOREIGN KEY([examid])
REFERENCES [dbo].[Dethi] ([id])
GO
ALTER TABLE [dbo].[DethiLop] CHECK CONSTRAINT [FK_DethiLop_Dethi]
GO
ALTER TABLE [dbo].[DethiLop]  WITH CHECK ADD  CONSTRAINT [FK_DethiLop_Lophoc] FOREIGN KEY([classid])
REFERENCES [dbo].[Lophoc] ([classid])
GO
ALTER TABLE [dbo].[DethiLop] CHECK CONSTRAINT [FK_DethiLop_Lophoc]
GO
ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [FK_Ketqua_Dethi] FOREIGN KEY([examid])
REFERENCES [dbo].[Dethi] ([id])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [FK_Ketqua_Dethi]
GO
ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [FK_Ketqua_Lophoc] FOREIGN KEY([classid])
REFERENCES [dbo].[Lophoc] ([classid])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [FK_Ketqua_Lophoc]
GO
ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [FK_Ketqua_Sinhvien] FOREIGN KEY([masv])
REFERENCES [dbo].[Sinhvien] ([masv])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [FK_Ketqua_Sinhvien]
GO
ALTER TABLE [dbo].[Lichsuthi]  WITH CHECK ADD  CONSTRAINT [FK_Lichsuthi_Sinhvien] FOREIGN KEY([masv])
REFERENCES [dbo].[Sinhvien] ([masv])
GO
ALTER TABLE [dbo].[Lichsuthi] CHECK CONSTRAINT [FK_Lichsuthi_Sinhvien]
GO
ALTER TABLE [dbo].[Lophoc]  WITH CHECK ADD  CONSTRAINT [FK_Lophoc_Monhoc] FOREIGN KEY([idmonhoc])
REFERENCES [dbo].[Monhoc] ([id])
GO
ALTER TABLE [dbo].[Lophoc] CHECK CONSTRAINT [FK_Lophoc_Monhoc]
GO
ALTER TABLE [dbo].[Lophoc]  WITH CHECK ADD  CONSTRAINT [FK_Lophoc_Nhanvien] FOREIGN KEY([usernameGV])
REFERENCES [dbo].[Nhanvien] ([username])
GO
ALTER TABLE [dbo].[Lophoc] CHECK CONSTRAINT [FK_Lophoc_Nhanvien]
GO
ALTER TABLE [dbo].[SinhvienLop]  WITH CHECK ADD  CONSTRAINT [FK_SinhvienLop_Lophoc] FOREIGN KEY([classid])
REFERENCES [dbo].[Lophoc] ([classid])
GO
ALTER TABLE [dbo].[SinhvienLop] CHECK CONSTRAINT [FK_SinhvienLop_Lophoc]
GO
ALTER TABLE [dbo].[SinhvienLop]  WITH CHECK ADD  CONSTRAINT [FK_SinhvienLop_Sinhvien] FOREIGN KEY([masv])
REFERENCES [dbo].[Sinhvien] ([masv])
GO
ALTER TABLE [dbo].[SinhvienLop] CHECK CONSTRAINT [FK_SinhvienLop_Sinhvien]
GO
