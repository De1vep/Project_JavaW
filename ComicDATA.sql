USE [master]
GO
/****** Object:  Database [ComicDB]    Script Date: 11/07/2023 09:21:10 ******/
CREATE DATABASE [ComicDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComicDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ComicDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ComicDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ComicDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ComicDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComicDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ComicDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComicDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComicDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComicDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComicDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComicDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ComicDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComicDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComicDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComicDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComicDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComicDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComicDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComicDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComicDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ComicDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComicDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComicDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComicDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComicDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComicDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComicDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComicDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ComicDB] SET  MULTI_USER 
GO
ALTER DATABASE [ComicDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComicDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComicDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComicDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ComicDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ComicDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ComicDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ComicDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ComicDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](150) NOT NULL,
	[password] [nvarchar](150) NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[caid] [int] IDENTITY(1,1) NOT NULL,
	[caname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[caid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[chid] [int] IDENTITY(1,1) NOT NULL,
	[chname] [nvarchar](150) NOT NULL,
	[chno] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[chimg] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Chapter_1] PRIMARY KEY CLUSTERED 
(
	[chid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comic]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comic](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](150) NOT NULL,
	[cavatar] [nvarchar](150) NOT NULL,
	[cauthor] [nvarchar](150) NOT NULL,
	[cdescrible] [nvarchar](1000) NOT NULL,
	[cpostdate] [date] NOT NULL,
	[cstatus] [bit] NOT NULL,
 CONSTRAINT [PK_Comic] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComicCategory]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComicCategory](
	[cid] [int] NOT NULL,
	[caid] [int] NOT NULL,
 CONSTRAINT [PK_ComicCategory] PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[caid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[coid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[chno] [int] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[comment] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[coid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Following]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Following](
	[username] [nvarchar](150) NOT NULL,
	[cid] [int] NOT NULL,
	[flstatus] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupAccount]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupAccount](
	[gid] [int] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_GroupAccount] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupFeature]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFeature](
	[gid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_GroupFeature] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View]    Script Date: 11/07/2023 09:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[viewed] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[chno] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'cau', N'123456', N'cau')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'device', N'123456', N'device')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'dxp', N'123456', N'dxp')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'phucdh', N'123', N'ww128')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'quocph', N'123', N'quoc db')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'thangdz', N'123', N'Wonwolf18344')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'zed', N'123456', N'zed')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([caid], [caname]) VALUES (1, N'Action')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (2, N'Adult')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (3, N'Adventure')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (4, N'Anime')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (5, N'Comedy')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (6, N'Comic')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (7, N'Cooking')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (8, N'Ecchi')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (9, N'Fantasy')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (10, N'Harem')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (11, N'Manhua')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (12, N'Manga')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (13, N'Manhwa')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (14, N'One shot')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (15, N'Romance')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (16, N'School Life')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (17, N'Seinen')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (18, N'Sports')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (19, N'Webtoon')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (20, N'Isekai')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (21, N'Yuri')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (22, N'Yaoi')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (23, N'16+')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (24, N'Cổ Đại')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (25, N'Demons')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (26, N'Detective')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (27, N'Doujinshi ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (28, N'Drama ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (29, N'Fantasy ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (30, N'Gender Bender')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (31, N'Historical ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (32, N'Horror ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (33, N'Josei ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (34, N'Mafia ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (35, N'Magic ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (36, N'Martial Arts ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (37, N'Mature ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (38, N'Military ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (39, N'Mystery ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (40, N' Ngôn Tình')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (41, N'Psychological')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (42, N'Romance')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (43, N'Truyện Màu')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (44, N'Sci-fi')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (45, N'Seinen ')
INSERT [dbo].[Category] ([caid], [caname]) VALUES (46, N'Supernatural ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (21, N'Chương 1', 1, 1, N'https://i.pinimg.com/564x/1a/9a/74/1a9a740f7c641f05ed4216c0a9c4f997.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (22, N'Chương 1', 1, 3, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (23, N'Chương 1', 1, 19, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (26, N'Chương 1', 1, 21, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (28, N'Chương 1', 1, 22, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (30, N'Chương 1', 1, 24, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (31, N'Chương 1', 1, 26, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (32, N'Chương 1', 1, 28, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (33, N'Chương 1', 1, 29, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (34, N'Chương 1', 1, 30, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (35, N'Chương 1', 1, 31, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (37, N'Chương 1', 1, 32, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (41, N'Chương 1', 1, 33, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (46, N'Chương 1', 1, 35, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (55, N'Chương 1', 1, 46, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (56, N'Chương 1', 1, 49, N'https://i.pinimg.com/564x/67/52/59/675259d4aba37a1fa21c18f50615ea70.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (57, N'Chương 2', 2, 49, N'https://i.pinimg.com/564x/d6/d4/2f/d6d42f9042991267de6546b6eefd50da.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (58, N'Chương 3', 3, 49, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (59, N'Chương 4', 4, 49, N'https://i.pinimg.com/564x/84/46/ee/8446ee2db0f2494647f7ed238e821e03.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (90, N'Chương 5', 5, 49, N'https://i.pinimg.com/564x/e0/25/09/e025096c4b390adec944d038a3e71b5d.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (91, N'Chương 2', 2, 1, N'https://i.pinimg.com/564x/77/ec/22/77ec22ad8f6ff05db87a91cdbb3ae117.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (92, N'Chương 6', 6, 49, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (95, N'Chương 2', 2, 46, N'https://i.pinimg.com/564x/81/79/90/8179901d9b052945709ceccbdcd89ef1.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (96, N'Chương 3', 3, 46, N'https://i.pinimg.com/564x/29/34/ee/2934eed1db559bc98071ce6132e9bef8.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (97, N'Chương 4', 4, 46, N'https://i.pinimg.com/564x/a8/d0/19/a8d019a770e9642a8051da2b68cb5c00.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (98, N'Chương 5', 5, 46, N'https://i.pinimg.com/564x/45/61/77/456177fe00a942a37d2aee79de8a96be.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (99, N'Chương 3', 3, 1, N'https://i.pinimg.com/564x/21/09/6b/21096ba447852f49a87170d98c1e81ee.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (100, N'Chương 4', 4, 1, N'https://i.pinimg.com/564x/2e/26/7d/2e267d2f813d8f489122718711e8d142.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (101, N'Chương 5', 5, 1, N'https://i.pinimg.com/564x/df/6d/d9/df6dd9b3b33ec2ffa3f5f0cd06b9118e.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (103, N'Chương 1', 1, 50, N'https://i.pinimg.com/564x/d6/fe/0b/d6fe0b4bef6de1a71daf63d7fd321f54.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (104, N'Chương 1', 1, 51, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (105, N'Chương 1', 1, 52, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (106, N'Chương 1', 1, 53, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (107, N'Chương 1', 1, 54, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (108, N'Chương 1', 1, 55, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (109, N'Chương 1 ', 1, 56, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (110, N'Chương 1 ', 1, 57, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (111, N'Chương 1 ', 1, 59, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (112, N'Chương 1 ', 1, 60, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (113, N'Chương 1 ', 1, 61, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (114, N'Chương 1 ', 1, 62, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (115, N'Chương 1 ', 1, 63, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (116, N'Chương 1 ', 1, 64, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (117, N'Chương 1 ', 1, 65, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (118, N'Chương 1 ', 1, 66, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (119, N'Chương 1 ', 1, 67, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (120, N'Chương 1 ', 1, 68, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (121, N'Chương 1 ', 1, 69, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (122, N'Chương 1 ', 1, 70, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (123, N'Chương 1 ', 1, 71, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (124, N'Chương 1 ', 1, 72, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (125, N'Chương 1 ', 1, 73, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (126, N'Chương 1 ', 1, 74, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (127, N'Chương 1 ', 1, 75, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (128, N'Chương 1 ', 1, 76, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (129, N'Chương 1 ', 1, 77, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (130, N'Chương 1 ', 1, 78, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (131, N'Chương 1 ', 1, 79, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (132, N'Chương 1 ', 1, 80, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (133, N'Chương 1 ', 1, 81, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (134, N'Chương 1 ', 1, 82, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (135, N'Chương 1 ', 1, 83, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (136, N'Chương 1 ', 1, 84, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (137, N'Chương 1 ', 1, 85, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (138, N'Chương 1 ', 1, 86, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (139, N'Chương 1 ', 1, 87, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (140, N'Chương 1 ', 1, 88, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (141, N'Chương 1 ', 1, 89, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (142, N'Chương 1 ', 1, 90, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (143, N'Chương 1 ', 2, 90, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
INSERT [dbo].[Chapter] ([chid], [chname], [chno], [cid], [chimg]) VALUES (144, N'Chương 1 ', 1, 91, N'https://i.pinimg.com/564x/e0/05/ca/e005cacc79214e8d989b166895a443d9.jpg')
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[Comic] ON 

INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (1, N'TIÊN TÔN LẠC VÔ CỰC', N'https://st.ntcdntempv3.com/data/comics/230/tien-ton-lac-vo-cuc.jpg', N'Thắng DZ', N'Truyện tranh Tiên Tôn Lạc Vô Cực được cập nhật nhanh và đầy đủ nhất tại NetTruyen. Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ NetTruyen ra các chương mới nhất của truyện Tiên Tôn Lạc Vô Cực.', CAST(N'2021-01-12' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (3, N'XÂY DỰNG ĐỊA NGỤC', N'http://st.ntcdntempv3.com/data/comics/228/xay-dung-dia-nguc.jpg', N'Thắng DZ', N'Nội dung Lee Eun Woo, một nam sinh vốn là con trai của một kẻ s.á.t n.h.â.n, cậu có đã có 1 cuộc sống chẳng khác gì địa ngục khi bị cả xã hội căm ghét và xa lánh. Mỗi ngày đến trường của cậu là thêm 1 ngày trở thành bao cát của bọn bắt nạt, nhưng rồi 1 ứng dụng bí ẩn mang tên "Xây Dựng Địa Ngục" đã xuất hiện. Ứng dụng này cho phép Lee Eun Woo có thể trả thù bất kì kẻ nào đã từng chà đạp cậu, thế nhưng cái ứng dụng này liệu có thể mang lại cho Lee Eun Woo cuộc sống hạnh phúc mà cậu hằng mong muốn hay không? Hay sẽ tạo ra 1 con ác quỷ đội lốt người đây?!', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (19, N'CƯỠI TRÊN BỜ HỦY DIỆT', N'http://st.ntcdntempv3.com/data/comics/181/cuoi-tren-bo-huy-diet.jpg', N'Thắng DZ', N'Nội dung Yu XiaoBei, một công nhân, để trả tiền phẫu thuật cho em gái mình, anh ta đã chọn bước vào đấu trường bí ẩn và biết được rằng nếu anh ta sống sót đến cuối cùng, anh ta sẽ có thể kiểm soát nền kinh tế thế giới. Bất ngờ thay, Yu XiaoBei sẽ phải đối mặt với những đối thủ nguy hiểm của mình, bị nhốt chung với một con quái vật và tham gia vào một trò chơi tử thần ly kỳ.', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (20, N'VỢ TÔI VÀ TÔI THỐNG TRỊ TAM GIỚI', N'http://st.ntcdntempv3.com/data/comics/32/vo-toi-va-toi-thong-tri-tam-gioi.jpg', N'Thắng DZ', N'Nội dung Ma Tôn lạc thiên hồng đã đọc thân mấy vạn năm mới thoát khỏi đọc thân mới phát hiện ra người vợ của mình chính là đế hậu đã bị hắn đánh bại 10 vạn năm trước mà tôn đã giấu kín thân phận thật để Không bị nàng giết chết... (Kitoon team)', CAST(N'2022-10-11' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (21, N'TA! VÔ ĐỊCH ĐẠI PHẢN PHÁI', N'http://st.ntcdntempv3.com/data/comics/184/ta-vo-dich-dai-phan-phai.jpg', N'Thắng DZ', N'Nội dung Phản Diện+ Vô Địch + Thông Minh + Tấu Hài + Giải Trí= Lăng Tiêu. 1 nhà văn xuyên qua chính tiểu thuyết của mình, làm công tử thế gia, đầy đủ căn cơ ma khí pháp bảo và thế gia khủng nhưng lại là nhân vật phản diện làm đá kê chân cho thiên mệnh chi tử thăng cấp. Không chịu khuất phục điều đó, Lăng Tiêu đã gáy bẩn, chơi bẩn với rất nhiều thủ đoạn để đấm chết mấy bọn thiên mệnh chi tử mõm!!!', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (22, N'BẠN GÁI CỦA TÔI RẤT KÌ LẠ', N'http://st.ntcdntempv3.com/data/comics/148/ban-gai-cua-toi-rat-ki-la-424.jpg', N'Thắng DZ', N'Nội dung Xuất hiện trước mặt A Bắc đang bị mất trí nhớ, là một cô gái xinh đẹp tên là Tô Mặc, nhưng bên trong cơ thể của Tô Mặc còn có những nhân cách khác, vấn đề đặt ra trước mắt của A Bắc chính là, nếu muốn qua lại với nhau bình thường, dường như phải am hiểu hết tất cả mọi nhân cách của cô ấy mới được. Trans by - Mộng Tiên Giới', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (24, N'MONG CHỜ GIÂY PHÚT THIÊNG LIÊNG ĐƯỢC CHẠM TỚI NGƯỜI', N'http://st.ntcdntempv3.com/data/comics/68/mong-cho-giay-phut-thieng-lieng-duoc-cha-7829.jpg', N'Thắng DZ', N'Nội dung Truyện tranh Mong Chờ Giây Phút Thiêng Liêng Được Chạm Tới Người được cập nhật nhanh và đầy đủ nhất tại NetTruyen. Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ NetTruyen ra các chương mới nhất của truyện Mong Chờ Giây Phút Thiêng Liêng Được Chạm Tới Người.', CAST(N'2022-10-11' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (26, N'SAU KHI CÔNG CHÚA BỘI TÌNH BẠC NGHĨA', N'http://st.ntcdntempv3.com/data/comics/126/sau-khi-cong-chua-boi-tinh-bac-nghia.jpg', N'Thắng DZ', N'Nội dung Trong lúc không biết tình hình thế nào mà lại vô tình bội tình bạc nghĩa một vị tiểu hoàng thúc quyền cao chức trọng thì phải làm sao đây? Một năm trước, công chúa của triều Tiểu Chu Cầu Tinh Thần ra ngoài du ngoại tình cờ gặp được tiểu hoàng thúc của triều Đại Nghiệp Yên Huyền, lừa người lại còn lừa tình hắn, một năm sau, thế cục thay đổi, nàng rơi vào cái bẫy của hắn.. Chỉ thấy một vẻ lạnh lùng, Yên Huyền với dáng vẻ giống như một người hoàn toàn khác móc ngón tay, cười lạnh: muốn chạy? Muộn rồi! Trêu chọc bản vương, thì phải chịu trách nhiệm.', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (28, N'YAMI NO PURPLE EYES', N'http://st.ntcdntempv3.com/data/comics/89/yami-no-purple-eyes.jpg', N'Shinohara Chie', N'Nội dung Rinko bẩm sinh có một cái bớt kỳ lạ trên cánh tay trái. Nhưng khi cái bớt trở nên sẫm màu, nhiều vụ tai nạn kỳ lạ xảy ra xung quanh cô ấy, gây tổn thương đến những người cô ấy yêu thương. Thứ sức mạnh gì đang dần thức tỉnh bên trong Rinko? Mời các bạn đón đọc bộ truyện "Mắt tím trong đêm" của Tác giả Shinohara Chie!', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (29, N'UMI NO YAMI, TSUKI NO KAGE', N'http://st.ntcdntempv3.com/data/comics/137/umi-no-yami-tsuki-no-kage.jpg', N'Thắng DZ', N'Nội dung Truyện tranh Umi no Yami, Tsuki no Kage được cập nhật nhanh và đầy đủ nhất tại NetTruyen. Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ NetTruyen ra các chương mới nhất của truyện Umi no Yami, Tsuki no Kage.', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (30, N'MỐI QUAN HỆ KỲ LẠ CỦA KUROYOU-CHAN VÀ SHIROTAMA-KUN', N'http://st.ntcdntempv3.com/data/comics/147/moi-quan-he-ky-la-cua-kuroyou-chan-va-sh-1467.jpg', N'Vae', N'Nội dung Sau 999 ngày, lời thì thầm của đớ... à nhầm... của Kuroyou-chan đã được đáp trả', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (31, N'STAGE S', N'http://st.ntcdntempv3.com/data/comics/159/stage-s.jpg', N'Harikawa', N'Nội dung Meguru Ukiyo đã phải lòng người bạn thời thơ ấu của mình, Sara Tatsumi. Một ngày nọ, anh tình cờ gặp một con rắn trắng ... nói rằng nó có thể nhìn thấy tương lai ?!', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (32, N'TRÒ CHƠI TÌM XÁC - MỘT THẾ GIỚI KHÁC', N'http://st.ntcdntempv3.com/data/comics/158/tro-choi-tim-xac-mot-the-gioi-khac.jpg', N'Thắng DZ', N'Nội dung Vẫn là Áo Đỏ, vẫn là câu chuyện rùng rợn về một yêu cầu tìm kiếm những mảnh thi thể, nhưng trò chơi tìm x.á.c lần này sẽ rất khác! Một vòng xoáy g.i.ế.t chóc vô tận nữa lại sắp bắt đầu.', CAST(N'2022-10-10' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (33, N'BOSS NHÀ GIÀU LẠI LÀ NỮ SINH TRUNG HỌC!', N'http://st.ntcdntempv3.com/data/comics/26/boss-nha-giau-lai-la-nu-sinh-trung-hoc.jpg', N'Thắng DZ', N'Nội dung Cô cam tâm tình nguyện làm một con rối của gia tộc, trở thành một sát thủ gián điệp, nhưng cuối cùng cô lại phát hiện tất cả chỉ là trò lừa đảo mà gia tộc và đám đàn ông dựng nên để lợi dụng cô! Sau khi rơi xuống biển chết đi, chính nhờ năng lượng Huyết Ngọc Phượng Hoàng đã khiến cô sống lại trong thân xác của một cô gái có hoàn cảnh tương tự – Cố Ninh. Để báo thù cho cả kiếp trước và kiếp này, cô quyết đoán trở về, bắt đầu gầy dựng sự nghiệp riêng, kể từ đây, giới kinh doanh lại xuất hiện thêm một huyền thoại mới!', CAST(N'2022-10-09' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (35, N'TIỂU THƯ MUỐN ĐƯỢC NGHỈ NGƠI', N'http://st.ntcdntempv3.com/data/comics/197/tieu-thu-muon-duoc-nghi-ngoi.jpg', N'Thắng DZ', N'Nội dung Truyện tranh Tiểu Thư Muốn Được Nghỉ Ngơi được cập nhật nhanh và đầy đủ nhất tại NetTruyen. Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ NetTruyen ra các chương mới nhất của truyện Tiểu Thư Muốn Được Nghỉ Ngơi.', CAST(N'2022-10-09' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (46, N'CAO NĂNG LAI TẬP', N'https://st.ntcdntempv3.com/data/comics/106/cao-nang-lai-tap.jpg', N'Thắng DZ', N'Truyện tranh Cao Năng Lai Tập được cập nhật nhanh và đầy đủ nhất tại NetTruyen. Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ NetTruyen ra các chương mới nhất của truyện Cao Năng Lai Tập.', CAST(N'2022-10-19' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (49, N'VÕ LUYỆN ĐỈNH PHONG', N'https://st.ntcdntempv3.com/data/comics/32/vo-luyen-dinh-phong.jpg', N'Thắng DZ', N'Võ đạo đỉnh phong, là cô độc, là tịch mịch, là dài đằng đẵng cầu tác, là cao xử bất thắng hàn
Phát triển trong nghịch cảnh, cầu sinh nơi tuyệt địa, bất khuất không buông tha, mới có thể có thể phá võ chi cực đạo.
Lăng Tiêu các thí luyện đệ tử kiêm quét rác gã sai vặt Dương Khai ngẫu lấy được một bản vô tự hắc thư, từ nay về sau đạp vào dài đằng đẵng võ đạo.', CAST(N'2022-10-21' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (50, N'THẦN SỦNG TIẾN HÓA', N'https://st.ntcdntempv3.com/data/comics/64/than-sung-tien-hoa.jpg', N'Đang cập nhật', N'Thiên địa dị biến, yêu thú sinh sôi, kỷ nguyên mới của nhân loại đã cho ra đời 1 nghề nghiệp mới: thu phục quái vật, nuôi dưỡng quái vật, huấn luyện quái vật, đây chính là nghề Ngự Sử', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (51, N'TÔI THĂNG CẤP TRONG LÚC NGỦ', N'https://st.ntcdntempv3.com/data/comics/62/toi-thang-cap-trong-luc-ngu.jpg', N'Daon Studio', N'“Chúng ta chỉ nghỉ giải lao trong khoảng 30 giây? Tôi không tưởng tượng mọi thứ, phải không? " "…Vâng." Sau 15 giờ săn bắn, Hyunsung yêu cầu được nghỉ ngơi một lúc, và sau 30 giây, anh ấy phải đứng dậy và bắt đầu đi săn. Thực ra, Hyunsung có một kỹ năng đặc biệt. [Kỹ năng ngủ quên của Thananos được kích hoạt.] [Bạn đang bị ép vào trạng thái ngủ.] Sau khi ngủ một lúc và thức dậy, tôi có một món đồ? Hãy chú ý đến câu chuyện về Đẳng cấp Thần, hậu duệ của Thananos, Hyunsung không thể ngăn cản.', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (52, N'VẠN CỔ TỐI CƯỜNG TÔNG', N'https://st.ntcdntempv3.com/data/comics/175/van-co-toi-cuong-tong.jpg', N'Đang cập nhật', N'Truyện tranh Vạn Cổ Tối Cường Tông được cập nhật nhanh và đầy đủ nhất tại NetTruyen. Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ NetTruyen ra các chương mới nhất của truyện Vạn Cổ Tối Cường Tông.', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (53, N'HUYỀN THIÊN CHÍ TÔN', N'https://st.ntcdntempv3.com/data/comics/58/huyen-thien-chi-ton.jpg', N'Đang cập nhật', N'Tần Vũ, người nắm giữ bức tranh vạn thú, đã trở về từ vạn năm, giơ tay khống chế núi sông, mặt trời và mặt trăng, nâng chân lên phá Nâng bầu trời, Huyền Thiên Chí Tôn, ta là đấng tối cao!', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (54, N'NGƯỜI MỚI NÀY QUÁ MẠNH', N'https://st.ntcdntempv3.com/data/comics/143/nguoi-moi-nay-qua-manh.jpg', N'Đang cập nhật', N'JaeJu lớn lên một cách khéo léo mà không có cha mẹ trong trại trẻ mồ côi, như tên của anh vậy. Một ngày nọ, anh nghe tin cô nhi viện đang gặp khó khăn và sẽ phải đóng cửa trong 3 năm. Trong khi cố gắng góp tiền cho trại trẻ mồ côi, JaeJu nhận được một cảnh báo trên điện thoại của anh. Trên đó, anh ấy đã thấy một video quay cảnh mình leo tháp với tư cách là một BJ (người phát sóng trực tiếp hay còn gọi là streamer). Bảy năm trước, một tòa tháp đột nhiên xuất hiện và đưa mọi người vào đó một cách ngẫu nhiên. Nếu bạn thành công tại tháp và trở thành một “ Kẻ thức tỉnh”, thì việc bạn trở nên giàu có chỉ còn là vấn đề thời gian!', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (55, N'TRĂNG TỐI: KỈ NGUYÊN MÁU', N'https://st.ntcdntempv3.com/data/comics/64/trang-toi-ki-nguyen-mau.jpg', N'Đang cập nhật', N'Chào mừng đến với Riverfield, nơi những nam sinh nổi tiếng nhất tại hai trường đối thủ của nhau là ma cà rồng và người sói. Khi một học sinh mới bí ẩn, Sooha, chuyển đến Riverfield, các đối thủ nhận thấy mình bị cô ấy cuốn hút một cách khó hiểu. Khi những sự cố khủng khiếp bắt đầu làm rung chuyển thị trấn, quá khứ bị lãng quên của các chàng trai dần dần được làm sáng tỏ… và thế giới của họ đảo lộn.', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (56, N'ITO JUNJI CAT''S DIARY', N'https://st.ntcdntempv3.com/data/comics/169/ito-junji-cats-diary.jpg', N'Ito Junji', N'Đây là series về mèo của Tác giả truyện kinh dị Junji Ito', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (57, N'BLACK PARADOX', N'https://st.ntcdntempv3.com/data/comics/165/black-paradox.jpg', N'Ito Junji', N'Một nhóm người muốn tự sát gặp nhau nhưng những sự việc kỳ lạ xảy ra.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (58, N'FRANKENSTEIN', N'https://st.ntcdntempv3.com/data/comics/230/frankenstein.jpg', N'Ito Junji', N'Tuyển tập Volume 16 truyện kinh dị của tác giả Junji Itou.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (59, N'JIGOKUSEI LEMINA', N'https://st.ntcdntempv3.com/data/comics/111/jigokusei-lemina.jpg', N'Ito Junji', N'Series truyện ngắn kinh dị của tác giả Junji Itou.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (60, N'FLESH COLORED HORROR', N'https://st.ntcdntempv3.com/data/comics/183/flesh-colored-horror.jpg', N'Ito Junji', N'Tuyển tập 1 loạt horror manga của Junji Ito-sensei

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (61, N'NHÂN GIAN THẤT CÁCH', N'https://st.ntcdntempv3.com/data/comics/12/nhan-gian-that-cach.jpg', N'Ito Junji', N'Bậc thầy truyện tranh kinh dị Junji Itou làm một bộ truyện tranh đầy mong đợi dựa trên "Ningen Shikkaku" viết bởi Osamu Dazai. Một câu chuyện cay đắng và hấp dẫn về một chàng trai trẻ bị kẹt giữa truyền thống của một gia tộc ở phía Bắc Nhật Bản và sự tác động của tư tưởng phương Tây. Để miêu tả anh ta thì chỉ có một từ “thất bại”, nhân vật chính trong Ningen Shikkaku của Osamu Dazai kể về một cuộc sống thường nhật trong khi anh ta không thể kiểu được loài người nữa. Oba Yozo cố gắng hòa nhập vào thế giới xung quanh anh ta từ những ngày còn trẻ, cho đến cấp ba, nơi anh ấy ở thành “thằng hề” đánh dấu thự tha hóa của anh ta, và cuối cùng đẫn đến cố ý tự sát nhưng thất bại khi thành người lớn. Không nhận được chút tình cảm nào, anh khắc ghi những thứ độc ác của cuộc sống và những khoảnh khắc thoáng qua trong sự kết nối giữa con người.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (62, N'THE SHARD OF EVIL', N'https://st.ntcdntempv3.com/data/comics/172/the-shard-of-evil.jpg', N'Ito Junji', N'Một series các truyện ngắn của Junji Ito, đến với người đọc bắt đầu từ 2013. Vẫn là những hiện tượng kỳ quái xảy ra trong những cuộc sống bình thường, không ai có thể giải thích cho sự tồn tại của những hiện tượng đó.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (63, N'QUÁI VẬT BIỂN', N'https://st.ntcdntempv3.com/data/comics/74/quai-vat-bien.jpg', N'Ito Junji', N'Trong một chuyến đi biển, Kaori và bạn gái không chịu nổi mùi thúi gần đó. Rồi họ phát hiển những sinh vật cá kì lạ có chân… Và rồi thành phố ven biển tràn ngập những con cá đó, gây bệnh cho người…

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (64, N'MÁI TÓC CỦA THÀNH A-TEN', N'https://st.ntcdntempv3.com/data/comics/199/mai-toc-cua-thanh-a-ten.jpg', N'Ito Junji', N'Tiếp tục 1 series của Junji Ito-sensei...

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (65, N'NEW VOICES IN THE DARK', N'https://st.ntcdntempv3.com/data/comics/120/new-voices-in-the-dark.jpg', N'Ito Junji', N'New Voices in the Dark là tuyển tập truyện kinh dị mới của Junji Ito,xuất bản lần đầu năm 2006.Là phần tiếp theo của "Secret of the Haunted Mansion"

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (66, N'NEW GAME!', N'https://st.ntcdntempv3.com/data/comics/188/new-game.jpg', N'TOKUNOU Shoutarou', N'Aoba suzukaze một cô gái mối tốt nghiệp cao trung nhưng vẫn hay thường bị nhầm lẫn với học sinh sơ trung, cô ấy làm họa sỹ tại công ty sản xuất game yêu thích nhất của mình. Câu chuyện được viết với một phong cách nhí nhảnh và dễ thương được thể hiện qua những bức 4-koma.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (67, N'TIỀN ĐẠO SỐ 1', N'https://st.ntcdntempv3.com/data/comics/189/tien-dao-so-1.jpg', N'KANESHIRO Muneyuki - Nomura Yuusuke', N'Yoichi Isagi đã bỏ lỡ cơ hội tham dự giải Cao Trung toàn quốc do đã chuyền cho đồng đội thay vì tự thân mình dứt điểm. Cậu là một trong 300 chân sút U-18 được tuyển chọn bởi Jinpachi Ego, người đàn ông được Hiệp Hội Bóng Đá Nhật Bản thuê sau hồi FIFA World Cup năm 2018, nhằm dẫn dắt Nhật Bản vô địch World Cup bằng cách tiêu diệt nền bóng đá Nhật Bản. Kế hoạch của Ego gồm việc cô lập 300 tay sút trong một nhà ngục - dưới một tổ chức với tên gọi là "Blue Lock", với mục tiêu là tạo ra chân sút "tự phụ" nhất thế giới, điều mà nền bóng đá Nhật Bản còn thiếu.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (68, N'TÔI SẼ CHỊU TRÁCH NHIỆM VỀ PHÚC LỢI CỦA NAM CHÍNH', N'https://st.ntcdntempv3.com/data/comics/138/toi-se-chiu-trach-nhiem-ve-phuc-loi-cua-2988.jpg', N'Đang cập nhật', N'Cô ấy trở thành ác nữ trong chính tiểu thuyết của mình. Vì nam chính, tác phẩm tự sáng tạo của cô, vì sự sống còn của bản thân, cô đã làm nữ hầu và giờ thì gia đình đại công tước đều thích cô hết!

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (69, N'CHITEKI DE COOL NA KOUHAI BIJO, ORE NO KAI NEKO NI NARU', N'https://st.ntcdntempv3.com/data/comics/104/chiteki-de-cool-na-kouhai-bijo-ore-no-ka-5673.jpg', N'Đang cập nhật', N'Cứu mèo, mèo trả ơn...?

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (70, N'CHÀO MỪNG ĐẾN VỚI LỚP HỌC ĐỀ CAO THỰC LỰC NĂM 2', N'https://st.ntcdntempv3.com/data/comics/182/chao-mung-den-voi-lop-hoc-de-cao-thuc-lu-8810.jpg', N'Kinugasa Shougo', N'Năm 2 học thứ 2 của Ayanokouji tại ngôi trường cao trung giáo dục nâng cao Tokyo
Sau khi hoàn thành xong [Bài thi đặc biệt] cuối năm nhất và thoát khỏi dã tâm của Tsukishiro, Ayanokouji lên năm hai Cao Trung Koudo Ikusei bình yên vô sự. Sau kì nghỉ xuân ngắn ngủi, lễ nhập học được tổ chức. Tháng 4 năm đó những học sinh năm nhất dần dần lộ diện. Những học sinh mới với vô vàn tính cách độc đáo không kém cạnh gì năm hai, dự rằng sẽ mang một làn sóng mới vào trường cao trung này.
Đó là chưa kể... Năm nay, có một vị khách không mời từ White Room cử đến.
Những cuộc đối đầu trong kì thi với những lớp năm hai khác, một bước đệm để nhắm đến vị trí lớp A. Thoát khỏi những âm mưu xấu xa của Tsukishiro và vị khách không mời đó, cùng theo đó là những mối quan hệ diễn ra trong trường... 
Những ngày tháng đầy chông gai của năm thứ 2 đã bắt đầu...', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (71, N'TRAINING SLAVES TO MAKE A HAREM', N'https://st.ntcdntempv3.com/data/comics/202/training-slaves-to-make-a-harem-3140.jpg', N'Đang cập nhật', N'Đây là câu chuyện về gã chủ nhân mua nô lệ, chăm sóc giáo dục các bé lên người để hiện thực hoá giấc mơ dàn harem lý tưởng

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (72, N'TS SUKI NA DANSHI GA TS SHITA KARA ZENRYOKU DE RISOU NO TS-KKO WO ENJIRU YATSU', N'https://st.ntcdntempv3.com/data/comics/109/ts-suki-na-danshi-ga-ts-shita-kara-zenry-1064.jpg', N'Đang cập nhật', N'Trên đời này, có nhân ắt sẽ có quả. Thanh niên cuồng genderswap thì sẽ bị swap gender.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (73, N'THÁM TỬ CONAN', N'https://st.ntcdntempv3.com/data/comics/30/tham-tu-conan.jpg', N'Gosho Aoyama', N'Mở đầu câu truyện, cậu học sinh trung học 16 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ (cũng là bạn gái) Ran Mori , cậu bị dính vào vụ án một hành khách trên Chuyến tàu tốc hành trong công viên, Kishida , bị giết trong một vụ án cắt đầu rùng rợn. Cậu đã làm sáng tỏ vụ án và trên đường về nhà, chứng kiến một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Kudo bị phát hiện, bị đánh ngất sau đó những người đàn ông áo đen đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy thân thể mình đã bị teo nhỏ trong hình dạng của một cậu học sinh tiểu học....

', CAST(N'2022-10-31' AS Date), 0)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (74, N'NÀNG PHÙ THỦY CỦA TÔI', N'https://st.ntcdntempv3.com/data/comics/121/nang-phu-thuy-cua-toi-5700.jpg', N'Đang cập nhật', N'Ở thời đại này, nếu bạn quá giỏi hoặc quá tệ ở một khoảng nào đó, hay chỉ đơn giản do bạn quá xinh đẹp, bạn sẽ bị gọi là Phù Thủy. Vượt qua vòng xoáy thời gian, đây là chuyện tình của cậu bé bị ruồng bỏ và nàng Phù Thủy xinh đẹp.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (75, N'VAMPIRE-CHAN CAN''T SUCK PROPERLY', N'https://st.ntcdntempv3.com/data/comics/152/vampire-chan-cant-suck-properly.jpg', N'Kyosuke Nishiki', N'Tất cả những ai đã bị hút máu sẽ yêu nó!? Ishikawa, một người bạn cùng lớp, là một ma cà rồng lạnh lùng và bí ẩn, cô ấy là một nhân vật nổi tiếng trong cùng lớp! Nhưng thực ra có vẻ như cô ây ko thik hút máu cho lắm ...?

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (76, N'ANATA NO SHIRANAI SEKAI', N'https://st.ntcdntempv3.com/data/comics/81/anata-no-shiranai-sekai.jpg', N'Igarashi Kaoru', N'Bộ sưu tập những câu truyện kinh dị ít trang của tạp chí Ciao

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (77, N'AI-CHAN', N'https://st.ntcdntempv3.com/data/comics/85/ai-chan.jpg', N'Aida Kurea', N'Từ bé đến giờ chưa thấy bộ manga nào ngắn như vậy.
', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (78, N'19 SHOW DIỄN CHÚ BƯỚM ĐỎ LANG THANG', N'https://st.ntcdntempv3.com/data/comics/93/19-show-dien-chu-buom-do-lang-thang.jpg', N'Đang cập nhật', N'19 show diễn "Chú bướm đỏ lang thang" trên Shonen Sunday (Sunday 19(to-ku) show samayoeru akai chou). Đây là một truyện cực ngắn, chỉ gồm 7 trang, kể về việc thám tử Kitakata Yuusaku vừa lái xe vừa giải đoán những câu nói "bí ẩn" của một người phụ nữ "bí ẩn".

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (79, N'197X', N'https://st.ntcdntempv3.com/data/comics/92/197x.jpg', N'Yamamoto Naoki', N'Câu chuyện trở về thập niên bảy mươi khi mà phương tiện giả trí chưa đa dạng như ngày nay, có một cậu bé học sinh trung học rất thích xem rạp và yêu phim ảnh hơn tất cả. Một ngày nọ có một cô bé bước vào đời cậu và những cuộc đi xem phim trở thành những trò chơi nho nhỏ của hai người.
', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (80, N'1/3 NO KARESHI', N'https://st.ntcdntempv3.com/data/comics/95/13-no-kareshi.jpg', N'Ako Shimaki', N'Bạn có tin rằng có một người yêu bạn không hề ngừng nghỉ?

', CAST(N'2022-10-31' AS Date), 0)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (81, N'AME NO GOGO WA ROMANCE NO HEROINE', N'https://st.ntcdntempv3.com/data/comics/82/ame-no-gogo-wa-romance-no-heroine.jpg', N'Arina Tanemura', N'Minori một cô gái rất yêu anh chàng tên Takatoo Shinya. Những hôm mưa cô cố tình quên ô để được đi chung với Takatoo. Tuy nhiên, cô bạn của Minori nói rằng Takatoo là người không tin vào tình yêu. Cô đã đến tận trường để hỏi Takatoo... Minori vẫn còn yêu Takatoo nhiều và quyết định làm cho Takatoo tin vào tình yêu một lần nữa...

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (82, N'ANTI-VENOM NEW WAY TO LIVE', N'https://st.ntcdntempv3.com/data/comics/78/anti-venom-new-way-to-live.jpg', N'Zeb Wells', N'DUCK AND COVER! It’s Anti-Venom and Punisher vs. One of the largest, most powerful and most ruthless drug cartels on the planet. Our money’s on the guys with the biggest guns…and the skulls on their chests. Zeb Wells & Paulo Siqueira deliver the senses-shattering conclusion to NEW WAYS TO LIVE!

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (83, N'APH DOUJINSHI - PARADISO DUE', N'https://st.ntcdntempv3.com/data/comics/71/aph-doujinshi-paradiso-due.jpg', N'NS plus', N'Một ngày đẹp trời, Britannia của chúng ta quyết định trả thù Spain bằng cách .... biến ra một chibiRomano . Này, đấy có phải là trả thù không vậy, không thấy rằng Spain đang rất vui sướng sao ?
', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (84, N'APH DOUJINSHI - KINJIRARETA ASOBI', N'https://st.ntcdntempv3.com/data/comics/75/aph-doujinshi-kinjirareta-asobi.jpg', N'Asamura Kaori', N'Summary: Công nghệ tạo hình đỉnh cao của Japan.

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (85, N'CAPTAIN AMERICA: WHO WILL WIELD THE SHIELD?', N'https://st.ntcdntempv3.com/data/comics/57/captain-america-who-will-wield-the-shiel-6656.jpg', N'Ed Brubaker', N'One-shot xảy ra trước sự kiện Siege. Stever Rogers đã thực sự trở lại, nhưng lại có một vấn đề mới đặt ra: Ai sẽ là Captain America mới? Liệu Steve có tiếp tục đảm nhận vai trò người anh hùng biểu tượng cho nước Mỹ hay sẽ nhường vị trí đó lại cho người đồng đội của mình là Bucky Barnes?

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (86, N'BỘ SƯU TẦM LỌ LEM', N'https://st.ntcdntempv3.com/data/comics/55/bo-suu-tam-lo-lem.jpg', N'Imai Yasue', N'Natsukawa Nina là một nữ sinh lớp sáu vô cùng \"bất bình thường\". Nina có thể là một người học sinh hoàn hảo về mọi mặt: luôn nằm trong top những nhân học đỉnh nhất trường, thành viên ban chấp hành hội học sinh, chăm chỉ và nghiêm túc hiếm có ở lứa tuổi của cô bé. Nhưng Nina cũng là một hình mẫu tiêu biểu của một \"bà cô\" quá già dặn trong mắt bạn bè, không sở thích, không thần tượng, đặc biệt nhất là Nina có vẻ như chưa bao giờ quan tâm đến áo quần, đầu tóc, gương mặt, tóm lại là tất tần tật về vẻ ngoài của mình như các bạn đồng trang lứa. Trớ truê thay, cũng đến một ngày khi Nina mở mắt thức dậy vào buổi sáng, cô bé lại trở thành một người phải sống suốt phần đời còn lại để trở thành một siêu mẫu huyền thoại...

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (87, N'CÔ GIÁO TUỔI 18', N'https://st.ntcdntempv3.com/data/comics/45/co-giao-tuoi-18.jpg', N'Han Yu Rang', N'Một cô gái 18 tuổi là giáo viên? Một người như thế liệu có thể dạy cho chúng tôi? Là một người tài năng? Cô ấy bằng tuổi với chúng tôi!! Ngôi trường đáng thương của chúng tôi đầy rẫy những cuộc đánh nhau, và cô ấy nhận được đơn mời vào dậy...Để trấn áp những trận đấu đá?? ôi, ôi, đối với một người giỏi giang như cô ấy... thì chúng tôi chỉ là những kẻ ngốc ngếch...?!

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (88, N'CÔ BÉ THÁM TỬ', N'https://st.ntcdntempv3.com/data/comics/46/co-be-tham-tu.jpg', N'Đang cập nhật', N'Update sau...

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (89, N'CLAMP RADIO COMIC', N'https://st.ntcdntempv3.com/data/comics/47/clamp-radio-comic.jpg', N'CLAMP', N'1 oneshot rất ngắn và đáng yêu

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (90, N'DARK AVENGERS / X-MEN : UTOPIA', N'https://st.ntcdntempv3.com/data/comics/41/dark-avengers-x-men-utopia.jpg', N'Marvel', N'Sau sự kiện Mesiah CompleX , học viện Xavier ở New York đã bị phá hủy hoàn toàn . Cyclops - lãnh đạo của X-men , quyết định đưa cả nhóm đến một ngôi nhà mới : thành phố San Francisco . Được hậu thuẫn bới thị trưởng thành phố , Cyclops mời gọi tất cả các mutant trên thế giới về thành phố này với ước mơ trao cho các mutant 1 thế giới mơ tưởng : nơi con người và mutant chung sống với nhau . Thế nhưng , viện vào lí do sự ra đời của đứa bé mutant sinh ra trong sự kiện Mesiah Complex đã khiến 1 thị trấn bị phá hủy , một bộ phận dân chúng mà dẫn đầu là Simon Trask , yêu cầu 1 đạo luật thắt chặt việc sinh con của các mutant...

', CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[Comic] ([cid], [cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) VALUES (91, N'DAMNED SUN', N'https://st.ntcdntempv3.com/data/comics/42/damned-sun.jpg', N'Fuyumi Souryo', N'Maki - một nữ sinh mà theo cách cô tự nhận xét là "vô duyên và trơ trẽn"; người có thể nổi giận vì bạn của cô cứ hay dùng dao rọc giấy tự cứa cổ tay mình mà "Điều làm tôi khó chịu là, con dao ấy lại là của tôi!". Maki đã nói với cô bạn rằng "Nếu muốn chết thì về mà dùng dao làm bếp ấy!". Khi phát hiện người yêu ngoại tình, cô lạnh lùng buông một câu khiến anh ta phải giật mình: "Có thể tôi sẽ đến giết anh đấy". Một cô gái độc miệng và chẳng khiến ai dễ chịu bao giờ...

', CAST(N'2022-10-31' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Comic] OFF
GO
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (1, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (1, 2)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (1, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (1, 4)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (3, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (3, 4)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (3, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (19, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (19, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (19, 13)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (19, 28)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (19, 29)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (19, 36)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (19, 37)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (19, 39)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (46, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (46, 11)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (46, 39)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (49, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (49, 2)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (50, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (50, 13)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (51, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (51, 13)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (51, 39)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (52, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (52, 13)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (52, 39)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (53, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (53, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (53, 13)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (53, 20)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (53, 29)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (54, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (54, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (54, 13)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (55, 13)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (55, 40)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (55, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (56, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (56, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (57, 2)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (57, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (57, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (58, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (58, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (59, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (59, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (60, 2)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (60, 11)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (60, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (61, 2)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (61, 17)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (61, 28)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (61, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (61, 37)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (61, 41)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (62, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (62, 33)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (63, 28)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (63, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (63, 39)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (63, 41)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (63, 44)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (64, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (64, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (65, 17)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (65, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (65, 34)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (65, 39)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (65, 41)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (65, 46)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (66, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (66, 45)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (67, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (67, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (67, 18)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (67, 28)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (67, 45)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (68, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (68, 28)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (68, 40)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (68, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (69, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (69, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (69, 43)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (70, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (70, 10)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (70, 28)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (70, 43)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (71, 2)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (71, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (71, 8)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (71, 9)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (71, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (71, 16)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (72, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (72, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (72, 16)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (72, 30)
GO
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (73, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (73, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (73, 28)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (73, 43)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (74, 9)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (74, 11)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (74, 28)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (74, 40)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (74, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (75, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (75, 12)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (75, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (75, 43)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (75, 46)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (76, 14)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (76, 32)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (76, 39)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (77, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (77, 14)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (78, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (78, 39)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (79, 14)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (79, 17)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (79, 37)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (79, 41)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (80, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (80, 14)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (80, 40)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (80, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (80, 43)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (81, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (81, 14)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (81, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (81, 43)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (82, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (82, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (82, 37)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (82, 44)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (82, 45)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (82, 46)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (83, 17)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (84, 17)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (85, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (85, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (86, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (86, 40)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (86, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (86, 43)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (87, 11)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (87, 40)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (87, 43)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (88, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (88, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (88, 5)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (88, 42)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (89, 14)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (90, 1)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (90, 3)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (90, 9)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (90, 46)
INSERT [dbo].[ComicCategory] ([cid], [caid]) VALUES (91, 14)
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (1, 1, 1, N'phgly', N'saddsgsdfkldjhsfsiljdkfhbalsdkfagjhasdjf')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (2, 1, 1, N'phgly', N'dsfjklasfdnjaiksdljikf')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (3, 1, 2, N'phgly', N'fjiodkshfnladjgkfghalsdo')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (4, 1, 3, N'phgly', N'fkjldshfgasdlonhofdaskdhgdlakdfsjfsghbfafsd,jmgsandfasdfg')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (5, 1, 2, N'phgly', N'test 1')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (6, 1, 2, N'phgly', N'test 2')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (7, 1, 1, N'phgly', N'comicId')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (8, 1, 1, N'phgly', N'test 3')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (9, 1, 1, N'phgly', N'test 3')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (10, 1, 3, N'phgly', N'le lee iu dau')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (11, 3, 1, N'phgly', N'the anh dau buoi
')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (12, 19, 1, N'thangdz', N'quoc dz
')
INSERT [dbo].[Comment] ([coid], [cid], [chno], [username], [comment]) VALUES (13, 83, 1, N'thangdz', N'thang dep trai')
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
INSERT [dbo].[Feature] ([fid], [url]) VALUES (1, N'/delete')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (2, N'/edit')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (3, N'/insert')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (4, N'/load')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (5, N'/manager')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (6, N'/insertChapter')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (7, N'/loadChapter')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (8, N'/managerChapter')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (9, N'/editChapter')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (10, N'/managerAccount')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (11, N'/deleteAccount')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (12, N'/editAccount')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (13, N'/loadAccount')
GO
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 1, 1)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 3, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 19, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 21, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 24, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 29, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 31, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 33, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 35, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 49, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 51, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 53, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 56, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 59, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 61, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 63, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 64, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 66, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 68, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 70, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 73, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 75, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 77, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 79, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 80, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 82, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 84, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 86, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 89, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 91, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 1, 1)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 3, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 21, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 24, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 29, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 31, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 33, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 46, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 49, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 51, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 53, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 55, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 59, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 61, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 63, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 65, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 66, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 68, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 70, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 72, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 75, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 77, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 79, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 81, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 82, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 3, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 20, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 22, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 28, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 30, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 32, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 35, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 46, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 50, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 52, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 54, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 57, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 60, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 62, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 64, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 65, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 67, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 69, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 71, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 74, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 76, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 78, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 80, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 81, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 83, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 85, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 87, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 90, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 1, 1)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 19, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 21, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 24, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 29, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 31, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 33, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 46, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 49, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 51, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 53, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 55, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 59, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 61, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 63, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 65, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 66, 0)
GO
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 68, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 70, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 72, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 75, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 77, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 79, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 81, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 82, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 84, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 86, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 88, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 91, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 20, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 26, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 54, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 71, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 87, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 84, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 86, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 88, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 24, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 55, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 72, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 88, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 26, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 56, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 73, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 89, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 32, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 62, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 78, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 91, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 33, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 63, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 79, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 35, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 64, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 80, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 22, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 52, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 69, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 85, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 21, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 53, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 70, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 86, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 22, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 54, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 71, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 87, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 30, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 60, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 76, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 31, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 61, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 77, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 32, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 62, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 78, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 28, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 46, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 50, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 55, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 57, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 65, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 67, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 72, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 74, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 81, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 83, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 88, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'thangdz', 90, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 1, 1)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 19, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 26, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 29, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 49, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 51, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 56, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 59, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 66, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 68, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 73, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 75, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 82, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 84, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 89, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'phucdh', 91, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 3, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 20, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 28, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 30, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 50, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 52, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 57, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 60, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 67, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 69, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 74, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 76, 0)
GO
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 83, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 85, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'quocph', 90, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 1, 1)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 3, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 19, 1)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 20, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 22, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 26, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 28, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 30, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 31, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 33, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 46, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 51, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 53, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 55, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 57, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 59, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 61, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 63, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 65, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 68, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 70, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 72, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 74, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 75, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 77, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 79, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 81, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 84, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 86, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 88, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 90, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 91, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 1, 1)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 19, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 21, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 26, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 29, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 30, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 32, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 33, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 46, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 50, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 53, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 55, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 57, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 60, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 61, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 63, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 65, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 67, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 70, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 72, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 74, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 76, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 77, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 79, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 81, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 83, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 86, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 88, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 90, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 1, 1)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 19, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 21, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 24, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 29, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 31, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 33, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 46, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 49, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 51, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 53, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 55, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 59, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 61, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 63, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 65, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 66, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 68, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 70, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 72, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 75, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 77, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 79, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 81, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 82, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 84, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 86, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 88, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 91, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 19, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 26, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 56, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 73, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 89, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 21, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 24, 0)
GO
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 29, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 35, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 49, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 56, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 64, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 66, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 73, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 80, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 82, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 89, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 20, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 22, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 31, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 49, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 51, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 59, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 66, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 68, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 75, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 82, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 84, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 91, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 22, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 26, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 35, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 54, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 56, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 64, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 71, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 73, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 80, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 87, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 89, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 35, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 64, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 80, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 32, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 54, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 62, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 71, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 78, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 87, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 3, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 35, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 56, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 64, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 73, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 80, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 89, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 20, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 32, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 52, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 62, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 69, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 78, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 85, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 22, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 54, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 71, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 87, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 50, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 52, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 60, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 67, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 69, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 76, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 83, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'dxp', 85, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 24, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 28, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 52, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 54, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 62, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 69, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 71, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 78, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 85, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'device', 87, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 3, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 28, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 30, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 50, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 57, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 60, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 67, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 74, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 76, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 83, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'zed', 90, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 32, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 62, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 78, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 20, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 52, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 69, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 85, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 28, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 30, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 50, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 57, 0)
GO
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 60, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 67, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 74, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 76, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 83, 0)
INSERT [dbo].[Following] ([username], [cid], [flstatus]) VALUES (N'cau', 90, 0)
GO
INSERT [dbo].[Group] ([gid], [gname]) VALUES (1, N'admin')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (2, N'author')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (3, N'user')
GO
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (1, N'cau')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (1, N'zed')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (2, N'dxp')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (2, N'thangdz')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'device')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'phucdh')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'quocph')
GO
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 10)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 11)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 12)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 13)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 1)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 2)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 3)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 4)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 5)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 6)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 7)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 8)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 9)
GO
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (10, 1, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 2, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 4, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 5, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 6, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 7, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 8, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 9, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 10, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 11, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 12, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 13, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 14, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 15, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 16, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 17, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 18, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (6, 19, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (3, 20, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 21, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 22, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 23, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 24, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 25, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 26, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 27, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 28, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 29, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 30, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 31, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 32, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 33, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 34, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 35, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 36, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 37, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 38, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 39, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 40, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 41, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 42, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 43, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 44, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 45, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 46, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 46, 2)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 46, 3)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 46, 4)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 46, 5)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 47, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 48, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (2, 49, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (3, 49, 2)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (3, 49, 3)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (3, 49, 4)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (4, 49, 5)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 50, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 51, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 52, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 53, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 54, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 55, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 56, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 57, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 58, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 59, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 60, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 61, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 62, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 63, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 64, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 65, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 66, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 67, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 68, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 69, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 70, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 71, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 72, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 73, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 74, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 75, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 76, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 77, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 78, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 79, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 80, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 81, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 82, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 83, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 84, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 85, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 86, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 87, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 88, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 89, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 90, 1)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (4, 1, 2)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (3, 1, 3)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 1, 4)
GO
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (2, 1, 5)
INSERT [dbo].[View] ([viewed], [cid], [chno]) VALUES (1, 6, 49)
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Chapter_Comic] FOREIGN KEY([cid])
REFERENCES [dbo].[Comic] ([cid])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FK_Chapter_Comic]
GO
ALTER TABLE [dbo].[ComicCategory]  WITH CHECK ADD  CONSTRAINT [FK_ComicCategory_Category] FOREIGN KEY([caid])
REFERENCES [dbo].[Category] ([caid])
GO
ALTER TABLE [dbo].[ComicCategory] CHECK CONSTRAINT [FK_ComicCategory_Category]
GO
ALTER TABLE [dbo].[ComicCategory]  WITH CHECK ADD  CONSTRAINT [FK_ComicCategory_Comic] FOREIGN KEY([cid])
REFERENCES [dbo].[Comic] ([cid])
GO
ALTER TABLE [dbo].[ComicCategory] CHECK CONSTRAINT [FK_ComicCategory_Comic]
GO
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_Following_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_Following_Account]
GO
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_Following_Comic] FOREIGN KEY([cid])
REFERENCES [dbo].[Comic] ([cid])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_Following_Comic]
GO
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_Following_Comic1] FOREIGN KEY([cid])
REFERENCES [dbo].[Comic] ([cid])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_Following_Comic1]
GO
ALTER TABLE [dbo].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Account]
GO
ALTER TABLE [dbo].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Group]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Feature]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Group]
GO
USE [master]
GO
ALTER DATABASE [ComicDB] SET  READ_WRITE 
GO
