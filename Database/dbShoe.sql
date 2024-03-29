USE [master]
GO
/****** Object:  Database [Wish]    Script Date: 12/5/2023 6:35:20 PM ******/
CREATE DATABASE [Wish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wish', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Wish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wish_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Wish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Wish] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wish] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wish] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Wish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wish] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wish] SET  MULTI_USER 
GO
ALTER DATABASE [Wish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Wish] SET QUERY_STORE = ON
GO
ALTER DATABASE [Wish] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Wish]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[fullname] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](10) NULL,
	[gender] [varchar](5) NULL,
	[avatar] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategorySizes]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorySizes](
	[CategoryID] [int] NULL,
	[sizeID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[information]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[information](
	[inforID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [varchar](100) NULL,
	[phoneNumber] [varchar](10) NULL,
	[address] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[inforID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[inforID] [int] NULL,
	[orderID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[dateBuy] [datetime] NULL,
	[amount] [decimal](10, 2) NULL,
	[inforId] [int] NULL,
	[uid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[orderId] [int] NULL,
	[pId] [int] NULL,
	[quantity] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[size] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoeSizes]    Script Date: 12/5/2023 6:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoeSizes](
	[SizeID] [int] NOT NULL,
	[Size] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [fullname], [email], [phone], [gender], [avatar]) VALUES (1, N'huynh', N'1234', 1, 1, N'Phan Van Huynh', N'phanhuynh681@gmail.com', N'0377262942', N'1', N'IMG_20210325_094214_910.jpg')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [fullname], [email], [phone], [gender], [avatar]) VALUES (2, N'toan123', N'123', 1, 1, N'Nguyen Quang Toan 123', N'toannqhe170680@fpt.edu.vn', N'0377262941', N'1', N'wallpaperflare.com_wallpaper (6).jpg')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [fullname], [email], [phone], [gender], [avatar]) VALUES (3, N'123', N'123', 0, 0, N'Le Van B', N'levanb@gmail.com', N'0377294312', N'1', N'wallpaperflare.com_wallpaper (12).jpg')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [fullname], [email], [phone], [gender], [avatar]) VALUES (4, N'abc', N'123', 1, 0, N'Le Van A', N'leavana@gmail.com', N'0366260603', N'1', N'wallpaperflare.com_wallpaper (17).jpg')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [fullname], [email], [phone], [gender], [avatar]) VALUES (5, N'hoang123', N'123', 0, 0, N'Pham Hai Hoang', N'hoangphhe172740@fpt.edu.vn', N'0377294312', N'0', N'')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIÀY ADIDAS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIÀY NIKE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIÀY BITI''S')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIÀY CONVERSE')
GO
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (1, 1)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (1, 2)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (1, 3)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (1, 4)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (1, 5)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (2, 5)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (2, 6)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (2, 7)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (2, 8)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (2, 9)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (3, 4)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (3, 5)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (3, 6)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (3, 7)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (3, 8)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (4, 5)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (4, 6)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (4, 7)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (4, 8)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (4, 1)
INSERT [dbo].[CategorySizes] ([CategoryID], [sizeID]) VALUES (4, 2)
GO
SET IDENTITY_INSERT [dbo].[information] ON 

INSERT [dbo].[information] ([inforID], [fullName], [phoneNumber], [address]) VALUES (3, N'Huynh Phan', N'0377262942', N'Hung Yen')
INSERT [dbo].[information] ([inforID], [fullName], [phoneNumber], [address]) VALUES (4, N'Huynh Phan', N'0377262942', N'Hung Yen')
INSERT [dbo].[information] ([inforID], [fullName], [phoneNumber], [address]) VALUES (5, N'Phan Van Huynh', N'0377262942', N'Hung Yen')
INSERT [dbo].[information] ([inforID], [fullName], [phoneNumber], [address]) VALUES (6, N'Nguyen Quang Toan', N'0377262941', N'Van Lam')
INSERT [dbo].[information] ([inforID], [fullName], [phoneNumber], [address]) VALUES (7, N'Do Minh Hung', N'0377262944', N'Ha Noi')
INSERT [dbo].[information] ([inforID], [fullName], [phoneNumber], [address]) VALUES (8, N'Do Minh Hung', N'0377262944', N'Ha Noi')
INSERT [dbo].[information] ([inforID], [fullName], [phoneNumber], [address]) VALUES (9, N'Huynh Phan', N'0377262942', N'Hung Yen')
INSERT [dbo].[information] ([inforID], [fullName], [phoneNumber], [address]) VALUES (10, N'Phan Van Huynh', N'0377262942', N'Hung Yen')
SET IDENTITY_INSERT [dbo].[information] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderId], [dateBuy], [amount], [inforId], [uid]) VALUES (2, CAST(N'2023-11-07T00:00:00.000' AS DateTime), CAST(360.00 AS Decimal(10, 2)), 3, 2)
INSERT [dbo].[Order] ([orderId], [dateBuy], [amount], [inforId], [uid]) VALUES (3, CAST(N'2023-11-07T00:00:00.000' AS DateTime), CAST(240.00 AS Decimal(10, 2)), 4, 2)
INSERT [dbo].[Order] ([orderId], [dateBuy], [amount], [inforId], [uid]) VALUES (4, CAST(N'2023-11-07T00:00:00.000' AS DateTime), CAST(318.00 AS Decimal(10, 2)), 5, 2)
INSERT [dbo].[Order] ([orderId], [dateBuy], [amount], [inforId], [uid]) VALUES (5, CAST(N'2023-11-07T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), 6, 2)
INSERT [dbo].[Order] ([orderId], [dateBuy], [amount], [inforId], [uid]) VALUES (6, CAST(N'2023-11-07T04:55:26.087' AS DateTime), CAST(330.00 AS Decimal(10, 2)), 8, 2)
INSERT [dbo].[Order] ([orderId], [dateBuy], [amount], [inforId], [uid]) VALUES (7, CAST(N'2023-11-07T22:51:33.973' AS DateTime), CAST(160.00 AS Decimal(10, 2)), 9, 2)
INSERT [dbo].[Order] ([orderId], [dateBuy], [amount], [inforId], [uid]) VALUES (8, CAST(N'2023-12-05T18:13:01.503' AS DateTime), CAST(216.00 AS Decimal(10, 2)), 10, 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[orderDetail] ([orderId], [pId], [quantity], [price], [size]) VALUES (2, 2, 1, CAST(120.00 AS Decimal(10, 2)), 41)
INSERT [dbo].[orderDetail] ([orderId], [pId], [quantity], [price], [size]) VALUES (2, 2, 2, CAST(120.00 AS Decimal(10, 2)), 44)
INSERT [dbo].[orderDetail] ([orderId], [pId], [quantity], [price], [size]) VALUES (3, 2, 2, CAST(120.00 AS Decimal(10, 2)), 42)
INSERT [dbo].[orderDetail] ([orderId], [pId], [quantity], [price], [size]) VALUES (4, 30, 1, CAST(318.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[orderDetail] ([orderId], [pId], [quantity], [price], [size]) VALUES (5, 8, 2, CAST(150.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[orderDetail] ([orderId], [pId], [quantity], [price], [size]) VALUES (6, 12, 2, CAST(165.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[orderDetail] ([orderId], [pId], [quantity], [price], [size]) VALUES (8, 31, 4, CAST(54.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[orderDetail] ([orderId], [pId], [quantity], [price], [size]) VALUES (7, 6, 1, CAST(160.00 AS Decimal(10, 2)), 43)
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (2, N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120.0000, N'Giày Adidas Nova Run EE9266
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 2, 92)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (3, N'Giày du lịch', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 130.0000, N'Dép đúc thể thao nam Adidas Adilette Boost Slides Đen - EH2256
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 2, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (5, N'Giày adidas 2B', N'https://th.bing.com/th/id/OIP.rgM9bTGNUKTSgz079uUGSQHaHa?pid=ImgDet&w=800&h=800&rs=1', 150.0000, N'Giày đá bóng nam chính hãng Adidas Predator 18.4 FXG DB2007
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 2, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (6, N'Giày adidas 2C', N'https://www.slangesport.sk/katalog/obrazky/produkty/12653.jpg?id=1630795688', 160.0000, N'Giày đá bóng nam chính hãng Adidas Copa Tango 18.3 TF DB2410
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 2, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (7, N'Giày adidas 2D', N'https://mcdn.assets.adidas.com/images/w_600,f_auto,q_auto/eb3976c263224980b2c9ad2600cc1596_9366/adidas_4DFWD_Pulse_Shoes_Black_Q46450_01_standard.jpg', 170.0000, N'Giày đá bóng nam chính hãng Adidas X TANGO 18.4 TF DB2479
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 2, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (8, N'New Men''s Running Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a05a08b26e56dcf17a643-normal.jpg?cache_buster=6d01b751858e14e68932bb234cdc44c1', 150.0000, N'Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', N'New Men''s Running Shoes Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', 4, 2, 97)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (9, N'Men Hiking Shoes Waterproof Non', N'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f', 180.0000, N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', 3, 2, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (10, N'Winter Men''s Snow Boots Plus Velvet', N'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681', 180.0000, N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', 4, 2, 98)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (12, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 165.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', 3, 2, 98)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (13, N'NEW Spring White Shoes Men', N'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc', 185.0000, N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', 3, 2, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (15, N'Men''s Fashion Casual Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a06d9e6a1c62df8877125-large.jpg?cache_buster=d17e757a3f8465edc71812b95b4b1a57', 100.0000, N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', 4, 2, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (16, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899', 120.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', 4, 2, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (19, N'Giày thể thao 2a', N'https://product.hstatic.net/1000230642/product/dsm074233kem40_7__fac1d188bde04910ba433e587e221ed0_1024x1024.jpg', 100.0000, N'Nike Free technology in the forefoot creates flexibility for agility moves like burpees, planks and sprints. Stretch around the collar lets your foot move naturally as you burst, cut and brake.', N'Khi quá trình tập luyện của bạn trở nên khó khăn, Nike Free Metcon 5 có thể gặp bạn ở độ sâu, giúp bạn đào sâu để tìm ra lực cuối cùng và thoát ra khỏi phía bên kia trên cao. Nó phù hợp với phong cách với chất, sự linh hoạt của bàn chân trước với sự ổn định của back-end, hoàn hảo để bay qua một ngày tập tim mạch hoặc tăng cường sự nhanh nhẹn của bạn. Một phần trên được tân trang lại cung cấp lối vào dễ dàng hơn với cổ áo được làm riêng cho mắt cá chân của bạn.

Màu sắc hiển thị: Violet Dust / Plum Eclipse / Rush Fuchsia
Phong cách: DV3950-500', 1, 1, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (22, N'Giày Phong cách', N'https://alexnld.com/wp-content/uploads/2023/02/309699fa-1ba2-4372-8177-a2b4391b9f8b-14663766.jpg', 84.8700, N'Đàn ông Phong cách Chống trượt Màu Chặn Lưới thoáng khí Giày thể thao Giày dép Chạy bộ', N'Phong cách', 3, 1, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (23, N'Giày đi chơi', N'https://alexnld.com/wp-content/uploads/2022/02/73de1bba-818f-4f03-b424-be9ee1fc17d9-500x500.jpg', 84.4200, N'Nam giới màu mẫu Velcro xoay khóa thiết kế giày đạp xe ngoài trời', N'Màu sắc: Đen, Trắng

Tính năng: thoáng khí, chống trượt

Kích thước: US 10.5, US 8, US 9, US 10, US 11, US 7.5, US 8.5, US 6.5

Chất liệu đế ngoài: Cao su', 4, 1, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (25, N'Run star HIKE low black white', N'https://conversestore.vn/wp-content/uploads/2023/09/z4695858391690_3ce0d0da7433b0d9591666ca42d27140-1-600x600.jpg', 512.0000, N'Converse Run Star Hike Low Black White là một đôi giày thể thao unisex mang phong cách hiện đại và độc đáo. Với sự kết hợp tinh tế giữa màu đen và trắng, đôi giày này không chỉ thể hiện sự tinh tế mà còn mang đến sự thoải mái cho người đeo.', N'1.Đặc Điểm Nổi Bật:

Thiết Kế Độc Đáo: Đôi giày sở hữu thiết kế độc đáo với đế cao su dày, mang đến một phong cách thời trang đường phố đặc trưng.
Chất Liệu Cao Cấp: Được làm từ chất liệu vải canvas cao cấp, kết hợp với đế cao su bền bỉ, đem lại cảm giác thoải mái và bền lâu.
Màu Sắc Tinh Tế: Sự kết hợp giữa màu đen và trắng tạo nên một vẻ ngoài tinh tế, dễ dàng kết hợp với nhiều trang phục khác nhau.
2. Ứng Dụng:

Đa Năng: Phù hợp cho cả nam và nữ, có thể kết hợp với nhiều loại trang phục từ casual đến sporty.
Thoải Mái: Đế giày được thiết kế để mang lại sự thoải mái tối đa, thích hợp cho cả việc đi chơi lẫn vận động nhẹ.
3. Bảo Dưỡng và Chăm Sóc:

Để bảo dưỡng đôi giày, bạn nên tránh tiếp xúc trực tiếp với nước và chất làm bẩn.
Để giữ form giày, nên sử dụng các dụng cụ giữ form khi không sử dụng.
Để làm sạch, sử dụng chất làm sạch dành riêng cho giày và làm sạch theo hướng dẫn của nhà sản xuất.', 4, 2, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (29, N'Vans Slip on checker', N'https://conversestore.vn/wp-content/uploads/2021/08/3-42-600x600.jpg', 323.0000, N'<p>Vans Slip on checker</p>', N'<h2>Th&ocirc;ng tin bổ sung</h2>
<table style="width: 1510.84px;">
<tbody>
<tr>
<th>Trọng lượng</th>
<td>1 kg</td>
</tr>
<tr>
<th>K&iacute;ch thước</th>
<td>30 &times; 20 &times; 15 cm</td>
</tr>
<tr>
<th>M&agrave;u</th>
<td>
<p>Đen</p>
</td>
</tr>
<tr>
<th>D&aacute;ng</th>
<td>
<p>Cao</p>
</td>
</tr>
<tr>
<th>Size</th>
<td>
<p>36, 37, 38, 39, 40, 41, 42, 43</p>
</td>
</tr>
</tbody>
</table>', 4, 2, 123)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (30, N'Vans Old Skool Navy', N'https://conversestore.vn/wp-content/uploads/2021/08/4-25-600x600.jpg', 318.0000, N'<p><strong><em>VANS</em>&nbsp;OLD SKOOL NAVY</strong></p>
<p>Được gọi vui một c&aacute;ch th&acirc;n thuộc l&agrave; &ldquo;<strong>gi&agrave;y Vans&nbsp;</strong>&ldquo;, thực chất đ&acirc;y l&agrave; một trong những phi&ecirc;n bản&nbsp;đầu ti&ecirc;n v&agrave; cổ điển nhất của&nbsp;<a href="https://vansvietnam.vn/"><em><strong>VANS</strong></em></a>&nbsp;trong bộ sưu tập&nbsp;<em><a href="https://vansvietnam.vn/vans-old-skool" aria-invalid="true"><strong>VANS OLD SKOOL</strong></a></em>&nbsp;ra đời năm 1977. Tới nay đ&ocirc;i gi&agrave;y chỉ với phối m&agrave;u đen trắng n&agrave;y vẫn nằm trong top &ldquo;Best Seller&rdquo; của&nbsp;<strong><em>VANS&nbsp;</em></strong>tr&ecirc;n to&agrave;n thế giới, với kiểu d&aacute;ng cổ điển c&ugrave;ng &ldquo;sọc Jazz&rdquo; huyền thoại&nbsp;hợp thời trang khiến đ&ocirc;i&nbsp;<em><strong>VANS</strong></em>&nbsp;n&agrave;y thật sự trở th&agrave;nh mẫu gi&agrave;y&nbsp;<em><strong>classic</strong></em>&nbsp;bất bại, l&agrave; fan h&acirc;m mộ của&nbsp;<em><strong>VANS</strong></em>&nbsp;n&oacute;i chung v&agrave; những skaters n&oacute;i ri&ecirc;ng đều n&ecirc;n c&oacute; một đ&ocirc;i trong tủ gi&agrave;y. Được mệnh danh l&agrave; phi&ecirc;n bản mang &ldquo;c&agrave;ng cũ c&agrave;ng đẹp&rdquo; v&agrave; nhiều phi&ecirc;n bản custom&nbsp; bậc nhất của nh&agrave;&nbsp;<em><strong>VANS</strong></em>.</p>', N'<h2>Th&ocirc;ng tin bổ sung</h2>
<table style="width: 1510.84px;">
<tbody>
<tr>
<th>Trọng lượng</th>
<td>1 kg</td>
</tr>
<tr>
<th>K&iacute;ch thước</th>
<td>30 &times; 20 &times; 15 cm</td>
</tr>
<tr>
<th>M&agrave;u</th>
<td>
<p>Đen</p>
</td>
</tr>
<tr>
<th>D&aacute;ng</th>
<td>
<p>Cao</p>
</td>
</tr>
<tr>
<th>Size</th>
<td>
<p>36, 37, 38, 39, 40, 41, 42, 43</p>
</td>
</tr>
</tbody>
</table>', 4, 2, 108)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (31, N'Giày Thể Thao Cao Cấp Nữ Biti''s Hunter X ', N'https://product.hstatic.net/1000230642/product/z4389356487504_ae429d8976ecbdc5c47240cb7e632684_523d32d0a4a5410eb56b0ccc6a7e7b25_1024x1024.jpg', 54.0000, N'<p><span style="color: #252a2b; font-family: futura-REGULAR, sans-serif; font-size: 14px; background-color: #ffffff;">Bạn đang mong muốn sở hữu một đ&ocirc;i gi&agrave;y thể thao nữ vừa năng động vừa c&oacute; sự &ecirc;m &aacute;i khi vận động, di chuyển? Gi&agrave;y thể thao cao cấp nữ&nbsp;</span><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold; color: #252a2b; font-family: futura-REGULAR, sans-serif; font-size: 14px; background-color: #ffffff;">Biti''s Hunter X Layered Upper DSWH02800</span><span style="color: #252a2b; font-family: futura-REGULAR, sans-serif; font-size: 14px; background-color: #ffffff;">&nbsp;ch&iacute;nh l&agrave; lựa chọn ph&ugrave; hợp nhất bạn kh&ocirc;ng n&ecirc;n bỏ qua. H&atilde;y c&ugrave;ng t&igrave;m hiểu kỹ hơn về si&ecirc;u phẩm n&agrave;y qua phần m&ocirc; tả dưới đ&acirc;y:</span></p>', N'<div class="head-title-desc" style="box-sizing: border-box; margin: 0px 0px 15px; padding: 0px 0px 5px; font-size: 20px; border-bottom: 1px solid #cccccc; color: #252a2b; font-family: futura-REGULAR, sans-serif; background-color: #ffffff;">M&ocirc; tả sản phẩm</div>
<div class="product-description  show" style="box-sizing: border-box; margin: 0px; padding: 15px 0px 0px; color: #252a2b; font-family: futura-REGULAR, sans-serif; font-size: 14px; background-color: #ffffff;">
<p style="box-sizing: border-box; margin: 0px 0px 1rem; padding: 10px 0px; font-size: 1em;">Bạn đang mong muốn sở hữu một đ&ocirc;i gi&agrave;y thể thao nữ vừa năng động vừa c&oacute; sự &ecirc;m &aacute;i khi vận động, di chuyển? Gi&agrave;y thể thao cao cấp nữ&nbsp;<span style="box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;">Biti''s Hunter X Layered Upper DSWH02800</span>&nbsp;ch&iacute;nh l&agrave; lựa chọn ph&ugrave; hợp nhất bạn kh&ocirc;ng n&ecirc;n bỏ qua. H&atilde;y c&ugrave;ng t&igrave;m hiểu kỹ hơn về si&ecirc;u phẩm n&agrave;y qua phần m&ocirc; tả dưới đ&acirc;y:</p>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.9; font-size: 1.5rem; color: var(--shop-color-title); display: inline-block;">Đế gi&agrave;y</h2>
<p style="box-sizing: border-box; margin: 0px 0px 1rem; padding: 10px 0px; font-size: 1em;">Gi&agrave;y thể thao nữ Biti''s Hunter X Layered Upper DSWH02800 sử dụng bộ đế v&ocirc; c&ugrave;ng chất lượng:</p>
<h3 style="box-sizing: border-box; margin: 0px 0px 0px 15px; padding: 0px; line-height: 1.9; font-size: 1.2rem; color: #363636; display: inline-block;">Đế ngo&agrave;i</h3>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Điểm độc đ&aacute;o của thể thao nữ Biti''s Hunter X Layered Upper DSWH02800 l&agrave; phần đế bộ l&agrave; đế Lite Flex được l&agrave;m từ chất liệu IP với độ đ&agrave;n hồi &gt;40%. Chất liệu n&agrave;y gi&uacute;p phần đế gi&agrave;y c&oacute; độ đ&agrave;n hồi cao hơn,&nbsp; tăng độ b&aacute;m d&iacute;nh, nhẹ, thoải m&aacute;i trong từng vận động.</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Độ cao 5 ph&acirc;n vừa đem lại cảm gi&aacute;c khi di chuyển vừa đủ để n&acirc;ng tầm chiều cao cho chủ sở hữu.</li>
</ul>
<h3 style="box-sizing: border-box; margin: 0px 0px 0px 15px; padding: 0px; line-height: 1.9; font-size: 1.2rem; color: #363636; display: inline-block;">Đế trong (l&oacute;t gi&agrave;y)</h3>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Lớp l&oacute;t bảo đảm &ecirc;m &aacute;i, mềm xốp, c&oacute; t&aacute;c dụng n&acirc;ng đỡ b&agrave;n ch&acirc;n nhẹ nh&agrave;ng v&agrave; hạn chế ẩm mốc, m&ugrave;i h&ocirc;i sau một thời gian d&agrave;i sử dụng.</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Đế l&oacute;t kh&aacute;ng khuẩn với c&ocirc;ng nghệ 6 điểm massage l&ograve;ng b&agrave;n ch&acirc;n &ecirc;m &aacute;i cho cả ng&agrave;y d&agrave;i.</li>
</ul>
<h3 style="box-sizing: border-box; margin: 0px 0px 0px 15px; padding: 0px; line-height: 1.9; font-size: 1.2rem; color: #363636; display: inline-block;">Đế giữa</h3>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Đế gi&agrave;y được l&agrave;m từ chất liệu nhẹ gi&uacute;p giảm tải trọng tr&ecirc;n ch&acirc;n, gi&uacute;p người mang cảm thấy thoải m&aacute;i hơn v&agrave; kh&ocirc;ng bị đau khi di chuyển.</li>
</ul>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.9; font-size: 1.5rem; color: var(--shop-color-title); display: inline-block;">Th&acirc;n gi&agrave;y</h2>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Quai Mũ quai vải dệt cải tiến. Đặc biệt, mũ quai nhiều lớp layers định h&igrave;nh v&agrave; giữ form gi&agrave;y cực tốt.</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Biti''s Hunter X Layered Upper DSWH02800 c&oacute; th&acirc;n với chất liệu vải LiteKnit cao cấp, chống nhăn v&agrave; kh&ocirc;ng thấm nước, gi&uacute;p bạn thoải m&aacute;i di chuyển dưới mưa hay nắng.</li>
</ul>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.9; font-size: 1.5rem; color: var(--shop-color-title); display: inline-block;"><span style="background-color: #f1c40f;">M&agrave;u sắc</span></h2>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Sản phẩm hiện đang được b&agrave;y b&aacute;n tại c&aacute;c cửa h&agrave;ng Biti&rsquo;s với 2 m&agrave;u ch&iacute;nh cho kh&aacute;ch h&agrave;ng lựa chọn l&agrave; Hồng v&agrave; Đen</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Do m&agrave;n h&igrave;nh v&agrave; điều kiện &aacute;nh s&aacute;ng kh&aacute;c nhau, m&agrave;u sắc thực tế của sản phẩm c&oacute; thể ch&ecirc;nh lệch khoảng 3-5%</li>
</ul>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.9; font-size: 1.5rem; color: var(--shop-color-title); display: inline-block;">Size gi&agrave;y</h2>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Sản phẩm hiện c&oacute; 7 size cơ bản từ 35-39.</li>
</ul>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.9; font-size: 1.5rem; color: var(--shop-color-title); display: inline-block;">Bảo h&agrave;nh</h2>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Sản phẩm được bảo h&agrave;nh trong v&ograve;ng 3 th&aacute;ng kể từ thời điểm mua h&agrave;ng. Ngo&agrave;i ra sản phẩm c&ograve;n được bảo h&agrave;nh trọn đời với lỗi bong keo, đứt chỉ (vật tư của sản phẩm đủ điều kiện t&aacute;i chế kh&ocirc;ng bị r&aacute;ch,&hellip;)</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Đổi size trong v&ograve;ng 7 ng&agrave;y, đổi sản phẩm lỗi trong v&ograve;ng 7 ng&agrave;y, kể từ thời điểm mua h&agrave;ng, nếu sản phẩm vẫn đ&aacute;p ứng ch&iacute;nh s&aacute;ch đổi trả. Điều kiện v&agrave; quy định đổi trả, qu&yacute; kh&aacute;ch vui l&ograve;ng tham khảo tr&ecirc;n website ch&iacute;nh thức.&nbsp;</li>
</ul>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.9; font-size: 1.5rem; color: var(--shop-color-title); display: inline-block;">T&iacute;nh năng v&agrave; lợi &iacute;ch nổi bật</h2>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Thiết kế đơn giản nhưng kh&ocirc;ng k&eacute;m phần thanh lịch. Th&iacute;ch hợp với nhiều nhu cầu sử dụng kh&aacute;c nhau: đi học, đi l&agrave;m, đi chơi..</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Gi&agrave;y thể thao nữ Biti''s Hunter X Layered Upper DSWH02800 sở hữu nhiều cải tiến về c&ocirc;ng nghệ lẫn thiết kế, hứa hẹn sẽ đem đến nhiều trải nghiệm tuyệt vời.</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Trọng lượng gi&agrave;y nhẹ, tho&aacute;ng m&aacute;t kh&ocirc;ng g&acirc;y t&igrave;nh trạng b&iacute; b&aacute;ch khi di chuyển vận động li&ecirc;n tục.</li>
</ul>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.9; font-size: 1.5rem; color: var(--shop-color-title); display: inline-block;">Sản phẩm bao gồm</h2>
<ul style="box-sizing: border-box; margin: 0px; padding: 10px 22px; list-style-type: none; font-size: 1em;">
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Hộp gi&agrave;y giấy b&igrave;a cứng c&aacute;p gi&uacute;p bảo quản gi&agrave;y tốt hơn.</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">D&acirc;y gi&agrave;y chắc chắn.</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">T&uacute;i chống ẩm.</li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px;">Gi&agrave;y.</li>
</ul>
<p style="box-sizing: border-box; margin: 0px 0px 1rem; padding: 10px 0px; font-size: 1em;">Tr&ecirc;n đ&acirc;y l&agrave; những th&ocirc;ng tin về sản phẩm gi&agrave;y thể thao cao cấp nữ Biti''s Hunter X Layered Upper DSWH02800. Nếu qu&yacute; kh&aacute;ch y&ecirc;u th&iacute;ch v&agrave; muốn ở hữu sản phẩm n&agrave;y , xin vui l&ograve;ng li&ecirc;n hệ Biti&rsquo;s ngay h&ocirc;m nay để nh&acirc;n vi&ecirc;n tư vấn th&ecirc;m về Biti''s Hunter X Layered Upper DSWH02800 v&agrave; đặt mua bạn nh&eacute;!</p>
</div>', 3, 2, 126)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (1, N'36')
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (2, N'37')
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (3, N'38')
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (4, N'39')
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (5, N'40')
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (6, N'41')
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (7, N'42')
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (8, N'43')
INSERT [dbo].[ShoeSizes] ([SizeID], [Size]) VALUES (9, N'44')
GO
ALTER TABLE [dbo].[CategorySizes]  WITH CHECK ADD FOREIGN KEY([sizeID])
REFERENCES [dbo].[ShoeSizes] ([SizeID])
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([inforID])
REFERENCES [dbo].[information] ([inforID])
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([inforId])
REFERENCES [dbo].[information] ([inforID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([orderId])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [fk_pID] FOREIGN KEY([pId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [fk_pID]
GO
USE [master]
GO
ALTER DATABASE [Wish] SET  READ_WRITE 
GO
