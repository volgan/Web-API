USE [master]
GO
/****** Object:  Database [WebServices]    Script Date: 22/03/2016 9:52:21 AM ******/
CREATE DATABASE [WebServices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebServices', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WebServices.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebServices_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WebServices_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebServices] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebServices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebServices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebServices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebServices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebServices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebServices] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebServices] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebServices] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WebServices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebServices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebServices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebServices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebServices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebServices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebServices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebServices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebServices] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebServices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebServices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebServices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebServices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebServices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebServices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebServices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebServices] SET RECOVERY FULL 
GO
ALTER DATABASE [WebServices] SET  MULTI_USER 
GO
ALTER DATABASE [WebServices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebServices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebServices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebServices] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebServices', N'ON'
GO
USE [WebServices]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 22/03/2016 9:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Thich] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 22/03/2016 9:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [bigint] IDENTITY(1203,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[SDT] [nvarchar](11) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Laptop]    Script Date: 22/03/2016 9:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[price] [bigint] NOT NULL,
	[icon] [nvarchar](max) NOT NULL,
	[slide] [nvarchar](max) NOT NULL,
	[images] [nvarchar](max) NOT NULL,
	[CPU_Manf] [nvarchar](max) NOT NULL,
	[CPU_Tech] [nvarchar](max) NOT NULL,
	[CPU_Type] [nvarchar](max) NOT NULL,
	[CPU_Speed] [nvarchar](max) NOT NULL,
	[CPU_Cache] [nvarchar](max) NOT NULL,
	[CPU_MaxSpeed] [nvarchar](max) NOT NULL,
	[MainBoard_Chipset] [nvarchar](max) NOT NULL,
	[MainBoard_Bus] [nvarchar](max) NOT NULL,
	[MainBoard_SupporRam] [nvarchar](max) NOT NULL,
	[Storage_Type] [nvarchar](max) NOT NULL,
	[Storage_RAM] [nvarchar](max) NOT NULL,
	[Storage_Bus] [nvarchar](max) NOT NULL,
	[HardDisk_Type] [nvarchar](max) NOT NULL,
	[HardDisk_Capacity] [nvarchar](max) NOT NULL,
	[screenSize] [nvarchar](max) NOT NULL,
	[screenResolution] [nvarchar](max) NOT NULL,
	[screenTech] [nvarchar](max) NOT NULL,
	[touchScreen] [nvarchar](max) NOT NULL,
	[Graphics_Chipset] [nvarchar](max) NOT NULL,
	[Graphics_Capacity] [nvarchar](max) NOT NULL,
	[Graphics_Design] [nvarchar](max) NOT NULL,
	[Audio_Channels] [nvarchar](max) NOT NULL,
	[Audio_Other] [nvarchar](max) NOT NULL,
	[CD] [nvarchar](max) NOT NULL,
	[CD_Type] [nvarchar](max) NOT NULL,
	[Interfaces] [nvarchar](max) NOT NULL,
	[Interfaces_Other] [nvarchar](max) NOT NULL,
	[LAN] [nvarchar](max) NOT NULL,
	[Wifi] [nvarchar](max) NOT NULL,
	[Network_Other] [nvarchar](max) NOT NULL,
	[CardReader_Support] [nvarchar](max) NOT NULL,
	[CardReader_Other] [nvarchar](max) NOT NULL,
	[Webcam_Resolution] [nvarchar](max) NOT NULL,
	[Webcam_Other] [nvarchar](max) NOT NULL,
	[Battery] [nvarchar](max) NOT NULL,
	[OS] [nvarchar](max) NOT NULL,
	[dimensions] [nvarchar](max) NOT NULL,
	[weight] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Laptop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 22/03/2016 9:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductsID] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Prices] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[icon] [varchar](max) NOT NULL,
	[Discount] [real] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22/03/2016 9:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1238,1) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[OrderDate] [varchar](50) NOT NULL,
	[RequriedDate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Orders_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 22/03/2016 9:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[icon] [nvarchar](max) NOT NULL,
	[slide] [nvarchar](max) NOT NULL,
	[images] [nvarchar](max) NOT NULL,
	[price] [bigint] NOT NULL,
	[manuf] [nvarchar](max) NOT NULL,
	[descImg] [nvarchar](max) NOT NULL,
	[screenTech] [nvarchar](max) NOT NULL,
	[screenResolution] [nvarchar](max) NOT NULL,
	[screenSize] [nvarchar](max) NOT NULL,
	[touchScreen] [nvarchar](max) NOT NULL,
	[glassTouch] [nvarchar](max) NOT NULL,
	[CameraBehind_primary] [nvarchar](max) NOT NULL,
	[CameraBehind_film] [nvarchar](max) NOT NULL,
	[CameraBehind_Flash] [nvarchar](max) NOT NULL,
	[CameraBehind_Advanced] [nvarchar](max) NOT NULL,
	[CameraFront_primary] [nvarchar](max) NOT NULL,
	[CameraFront_film] [nvarchar](max) NOT NULL,
	[CameraFront_VideoCall] [nvarchar](max) NOT NULL,
	[CameraFront_Other] [nvarchar](max) NOT NULL,
	[OS] [nvarchar](max) NOT NULL,
	[Chipset] [nvarchar](max) NOT NULL,
	[NumCore] [nvarchar](max) NOT NULL,
	[Speed] [nvarchar](max) NOT NULL,
	[GPU] [nvarchar](max) NOT NULL,
	[RAM] [nvarchar](max) NOT NULL,
	[ROM] [nvarchar](max) NOT NULL,
	[availability] [nvarchar](max) NOT NULL,
	[memoryCard] [nvarchar](max) NOT NULL,
	[MaximumSupport] [nvarchar](max) NOT NULL,
	[TwoG] [nvarchar](max) NOT NULL,
	[ThreeG] [nvarchar](max) NOT NULL,
	[FourG] [nvarchar](max) NOT NULL,
	[NumSIM] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Wifi] [nvarchar](max) NOT NULL,
	[GPS] [nvarchar](max) NOT NULL,
	[Bluetooth] [nvarchar](max) NOT NULL,
	[NFC] [nvarchar](max) NOT NULL,
	[Charger] [nvarchar](max) NOT NULL,
	[audioJack] [nvarchar](max) NOT NULL,
	[Connection_Other] [nvarchar](max) NOT NULL,
	[Design_Type] [nvarchar](max) NOT NULL,
	[Material] [nvarchar](max) NOT NULL,
	[dimensions] [nvarchar](max) NOT NULL,
	[weight] [nvarchar](max) NOT NULL,
	[Capacity] [nvarchar](max) NOT NULL,
	[Battery_Type] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 22/03/2016 9:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[CategoryID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories_1] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tablet]    Script Date: 22/03/2016 9:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tablet](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[icon] [nvarchar](max) NOT NULL,
	[slide] [nvarchar](max) NOT NULL,
	[images] [nvarchar](max) NOT NULL,
	[price] [bigint] NOT NULL,
	[manuf] [nvarchar](max) NOT NULL,
	[descImg] [nvarchar](max) NOT NULL,
	[screenTech] [nvarchar](max) NOT NULL,
	[screenResolution] [nvarchar](max) NOT NULL,
	[screenSize] [nvarchar](max) NOT NULL,
	[touchScreen] [nvarchar](max) NOT NULL,
	[CameraBehind] [nvarchar](max) NOT NULL,
	[film] [nvarchar](max) NOT NULL,
	[Advanced] [nvarchar](max) NOT NULL,
	[CameraFront] [nvarchar](max) NOT NULL,
	[OS] [nvarchar](max) NOT NULL,
	[Chipset] [nvarchar](max) NOT NULL,
	[NumCore] [nvarchar](max) NOT NULL,
	[Speed] [nvarchar](max) NOT NULL,
	[GPU] [nvarchar](max) NOT NULL,
	[RAM] [nvarchar](max) NOT NULL,
	[ROM] [nvarchar](max) NOT NULL,
	[availability] [nvarchar](max) NOT NULL,
	[memoryCard] [nvarchar](max) NOT NULL,
	[MaximumSupport] [nvarchar](max) NOT NULL,
	[ThreeG] [nvarchar](max) NOT NULL,
	[FourG] [nvarchar](max) NOT NULL,
	[SIM] [nvarchar](max) NOT NULL,
	[Wifi] [nvarchar](max) NOT NULL,
	[GPS] [nvarchar](max) NOT NULL,
	[Bluetooth] [nvarchar](max) NOT NULL,
	[USB] [nvarchar](max) NOT NULL,
	[HDMI] [nvarchar](max) NOT NULL,
	[audioJack] [nvarchar](max) NOT NULL,
	[Connection_Other] [nvarchar](max) NOT NULL,
	[dimensions] [nvarchar](max) NOT NULL,
	[weight] [nvarchar](max) NOT NULL,
	[Capacity] [nvarchar](max) NOT NULL,
	[Battery_Type] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [Comment], [Thich]) VALUES (4, 1235, N'acer-iconia-b1', N'Được', 3)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [Comment], [Thich]) VALUES (7, 1235, N'lenovo-ideatab-a5500', N'Sản phẩm này có vẻ được', 2)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [Comment], [Thich]) VALUES (8, 1235, N'zenfone-2-laser-zẹ00kg', N'Điện thoại này xài rất tốt', 0)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [Comment], [Thich]) VALUES (10, 1235, N'asus-tp500lb-i5-5200u', N'Nhìn đẹp quá', 0)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [Comment], [Thich]) VALUES (12, 1235, N'asus-tp500lb-i5-5200u', N'Hay quá', 0)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [Comment], [Thich]) VALUES (16, 1235, N'asus-tp500lb-i5-5200u', N'Xấu quá', 0)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [Comment], [Thich]) VALUES (20, 1235, N'lenovo-ideatab-a5500', N'Sản phẩm này có vẻ được', 2)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [Comment], [Thich]) VALUES (21, 1235, N'huawei-g7-plus', N'Nhật k được bình thường', 0)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Email], [Password], [FullName], [SDT], [Address]) VALUES (1235, N'aladin1266@gmail.com', N'd29591994efa1712b44fdfa05d3630f7a03edd67c48418574fef0dc113287', N'Phan Trần Hồng Phúc', N'936127004', N'304/50/16 Bùi Đình Túy, P12, Quận Bình Thạnh, TPHCM')
INSERT [dbo].[Customer] ([CustomerID], [Email], [Password], [FullName], [SDT], [Address]) VALUES (1237, N'abc@gmail.com', N'bda2783362d189cf1e9b93ee37f6efe69e86a2288125f9611553a1a1fc9ec5', N'Phan Trần Hồng Phúc', N'936127004', N'304/50/16 Bùi Đình Túy, P12, Quận Bình Thạnh, TPHCM')
INSERT [dbo].[Customer] ([CustomerID], [Email], [Password], [FullName], [SDT], [Address]) VALUES (1238, N'phucpth@student.ptithcm.edu.vn', N'9a307c23fe6143dca31323750d462a615634b2d6841ce6e3e3aafe7c330f8e', N'Phan Trần Hồng Phúc', N'909080812', N'304/50/16 Bùi Đình Túy, P12, Quận Bình Thạnh, TPHCM')
INSERT [dbo].[Customer] ([CustomerID], [Email], [Password], [FullName], [SDT], [Address]) VALUES (1240, N'bushy_porcupine0809@yahoo.com', N'd29591994efa1712b44fdfa05d3630f7a03edd67c48418574fef0dc113287', N'Phan Việt Ngân Hà', N'1265082889', N'304/50/16 Bùi Đình Túy, P12, Quận Bình Thạnh, TPHCM')
INSERT [dbo].[Customer] ([CustomerID], [Email], [Password], [FullName], [SDT], [Address]) VALUES (1244, N'thanh@gmail.com', N'929cbb6bc86b52f7070b8b413b301b5053ec38468144e611052ef125bf1f', N'Nguyễn Quốc Thành', N'909080812', N'98 Man Thiện, Quận 9')
SET IDENTITY_INSERT [dbo].[Customer] OFF
INSERT [dbo].[Laptop] ([ID], [Name], [price], [icon], [slide], [images], [CPU_Manf], [CPU_Tech], [CPU_Type], [CPU_Speed], [CPU_Cache], [CPU_MaxSpeed], [MainBoard_Chipset], [MainBoard_Bus], [MainBoard_SupporRam], [Storage_Type], [Storage_RAM], [Storage_Bus], [HardDisk_Type], [HardDisk_Capacity], [screenSize], [screenResolution], [screenTech], [touchScreen], [Graphics_Chipset], [Graphics_Capacity], [Graphics_Design], [Audio_Channels], [Audio_Other], [CD], [CD_Type], [Interfaces], [Interfaces_Other], [LAN], [Wifi], [Network_Other], [CardReader_Support], [CardReader_Other], [Webcam_Resolution], [Webcam_Other], [Battery], [OS], [dimensions], [weight]) VALUES (N'asus-f454la-i3-4005u', N'Laptop Asus F454LA i3 4005U', 9490000, N'../images/laptop/asus-f454la-i3-4005u.png', N'../images/laptop/asus-f454la-i3-4005u-10.jpg,../images/laptop/asus-f454la-i3-4005u-11.jpg,../images/laptop/asus-f454la-i3-4005u-12.jpg,../images/laptop/asus-f454la-i3-4005u-13.jpg', N'../images/laptop/asus-f454la-i3-4005u-1.jpg,../images/laptop/asus-f454la-i3-4005u-2.jpg,../images/laptop/asus-f454la-i3-4005u-3.jpg,../images/laptop/asus-f454la-i3-4005u-4.jpg,../images/laptop/asus-f454la-i3-4005u-5.jpg,../images/laptop/asus-f454la-i3-4005u-6.jpg,../images/laptop/asus-f454la-i3-4005u-7.jpg,../images/laptop/asus-f454la-i3-4005u-8.jpg', N'Intel', N'Core i3 Haswell', N'4005U', N'1.70 GHz', N'Intel® Smart Cache, 3 MB', N'Không', N'Intel® HM8 Series Express Chipset', N'1600Mhz', N'8 GB', N'DDR3L(On board+1Khe)', N'4Gb', N'1600 Mhz', N'HDD', N'500 GB', N'14', N'HD (1366 x 768 pixels)', N'LED Backlight Splend Video Intelligent', N'Không', N'Intel HD Graphics 4400', N'Share (Du`ng chung bô? nho´ vo´i RAM)', N'Tích h?p', N'2.0', N'Combo Microphone & Headphone', N'Có', N'DVD Super Multi Double Layer', N'HDMI LAN (RJ45) USB 2.0 USB 3.0', N'Instant On Ice Cool', N'10/100/1000 Mbps Ethernet LAN (RJ-45 connector)', N'802.11b/g/n', N'Không', N'Có', N'SD', N'0.3 MP(16:9)', N'VGA webcam', N'Li-Ion 2 cell', N'Windows 10', N'Dài 348 mm - Ngang 241 mm - Dày 31.7 mm', N'1.98 kg')
INSERT [dbo].[Laptop] ([ID], [Name], [price], [icon], [slide], [images], [CPU_Manf], [CPU_Tech], [CPU_Type], [CPU_Speed], [CPU_Cache], [CPU_MaxSpeed], [MainBoard_Chipset], [MainBoard_Bus], [MainBoard_SupporRam], [Storage_Type], [Storage_RAM], [Storage_Bus], [HardDisk_Type], [HardDisk_Capacity], [screenSize], [screenResolution], [screenTech], [touchScreen], [Graphics_Chipset], [Graphics_Capacity], [Graphics_Design], [Audio_Channels], [Audio_Other], [CD], [CD_Type], [Interfaces], [Interfaces_Other], [LAN], [Wifi], [Network_Other], [CardReader_Support], [CardReader_Other], [Webcam_Resolution], [Webcam_Other], [Battery], [OS], [dimensions], [weight]) VALUES (N'asus-tp500lb-i5-5200u', N'Laptop Asus TP500LB i5 5200U', 15590000, N'../images/laptop/asus-tp500lb-i5-5200u.png', N'../images/laptop/asus-tp500lb-i5-5200u-10.jpg,1../images/laptop/asus-tp500lb-i5-5200u-11.jpg,../images/laptop/asus-tp500lb-i5-5200u-12.jpg,../images/laptop/asus-tp500lb-i5-5200u-13.jpg', N'../images/laptop/asus-tp500lb-i5-5200u-1.jpg,../images/laptop/asus-tp500lb-i5-5200u-2.jpg,../images/laptop/asus-tp500lb-i5-5200u-3.jpg,../images/laptop/asus-tp500lb-i5-5200u-4.jpg,../images/laptop/asus-tp500lb-i5-5200u-5.jpg,../images/laptop/asus-tp500lb-i5-5200u-6.jpg,../images/laptop/asus-tp500lb-i5-5200u-7.jpg,../images/laptop/asus-tp500lb-i5-5200u-8.jpg', N'Intel', N'Core i3 Haswell', N'4005U', N'1.70 GHz', N'Intel® Smart Cache, 3 MB', N'Không', N'Intel® HM8 Series Express Chipset', N'1600Mhz', N'8 GB', N'DDR3L(On board+1Khe)', N'4Gb', N'1600 Mhz', N'HDD', N'500 GB', N'14', N'HD (1366 x 768 pixels)', N'LED Backlight Splend Video Intelligent', N'Không', N'Intel HD Graphics 4400', N'Share (Du`ng chung bô? nho´ vo´i RAM)', N'Tích h?p', N'2.0', N'Combo Microphone & Headphone', N'Có', N'DVD Super Multi Double Layer', N'HDMI LAN (RJ45) USB 2.0 USB 3.0', N'Instant On Ice Cool', N'10/100/1000 Mbps Ethernet LAN (RJ-45 connector)', N'802.11b/g/n', N'Không', N'Có', N'SD', N'0.3 MP(16:9)', N'VGA webcam', N'Li-Ion 2 cell', N'Windows 10', N'Dài 348 mm - Ngang 241 mm - Dày 31.7 mm', N'1.98 kg')
INSERT [dbo].[Laptop] ([ID], [Name], [price], [icon], [slide], [images], [CPU_Manf], [CPU_Tech], [CPU_Type], [CPU_Speed], [CPU_Cache], [CPU_MaxSpeed], [MainBoard_Chipset], [MainBoard_Bus], [MainBoard_SupporRam], [Storage_Type], [Storage_RAM], [Storage_Bus], [HardDisk_Type], [HardDisk_Capacity], [screenSize], [screenResolution], [screenTech], [touchScreen], [Graphics_Chipset], [Graphics_Capacity], [Graphics_Design], [Audio_Channels], [Audio_Other], [CD], [CD_Type], [Interfaces], [Interfaces_Other], [LAN], [Wifi], [Network_Other], [CardReader_Support], [CardReader_Other], [Webcam_Resolution], [Webcam_Other], [Battery], [OS], [dimensions], [weight]) VALUES (N'asus-zenbook-ux305fa', N'Laptop Asus Zenbook UX305FA', 18190000, N'../images/laptop/asus-zenbook-ux305fa.png', N'../images/laptop/asus-zenbook-ux305fa-10.jpg,1../images/laptop/asus-zenbook-ux305fa-11.jpg,../images/laptop/asus-zenbook-ux305fa-12.jpg,../images/laptop/asus-zenbook-ux305fa-13.jpg', N'../images/laptop/asus-zenbook-ux305fa-1.jpg,../images/laptop/asus-zenbook-ux305fa-2.jpg,../images/laptop/asus-zenbook-ux305fa-3.jpg,../images/laptop/asus-zenbook-ux305fa-4.jpg,../images/laptop/asus-zenbook-ux305fa-5.jpg,../images/laptop/asus-zenbook-ux305fa-6.jpg,../images/laptop/asus-zenbook-ux305fa-7.jpg,../images/laptop/asus-zenbook-ux305fa-8.jpg', N'Intel', N'Core i3 Haswell', N'4005U', N'1.70 GHz', N'Intel® Smart Cache, 3 MB', N'Không', N'Intel® HM8 Series Express Chipset', N'1600Mhz', N'8 GB', N'DDR3L(On board+1Khe)', N'4Gb', N'1600 Mhz', N'HDD', N'500 GB', N'14', N'HD (1366 x 768 pixels)', N'LED Backlight Splend Video Intelligent', N'Không', N'Intel HD Graphics 4400', N'Share (Du`ng chung bô? nho´ vo´i RAM)', N'Tích h?p', N'2.0', N'Combo Microphone & Headphone', N'Có', N'DVD Super Multi Double Layer', N'HDMI LAN (RJ45) USB 2.0 USB 3.0', N'Instant On Ice Cool', N'10/100/1000 Mbps Ethernet LAN (RJ-45 connector)', N'802.11b/g/n', N'Không', N'Có', N'SD', N'0.3 MP(16:9)', N'VGA webcam', N'Li-Ion 2 cell', N'Windows 10', N'Dài 348 mm - Ngang 241 mm - Dày 31.7 mm', N'1.98 kg')
INSERT [dbo].[Laptop] ([ID], [Name], [price], [icon], [slide], [images], [CPU_Manf], [CPU_Tech], [CPU_Type], [CPU_Speed], [CPU_Cache], [CPU_MaxSpeed], [MainBoard_Chipset], [MainBoard_Bus], [MainBoard_SupporRam], [Storage_Type], [Storage_RAM], [Storage_Bus], [HardDisk_Type], [HardDisk_Capacity], [screenSize], [screenResolution], [screenTech], [touchScreen], [Graphics_Chipset], [Graphics_Capacity], [Graphics_Design], [Audio_Channels], [Audio_Other], [CD], [CD_Type], [Interfaces], [Interfaces_Other], [LAN], [Wifi], [Network_Other], [CardReader_Support], [CardReader_Other], [Webcam_Resolution], [Webcam_Other], [Battery], [OS], [dimensions], [weight]) VALUES (N'dell-inspiron-5458', N'Laptop Dell Inspiron 5458', 19000000, N'../images/laptop/dell-inspiron-5458.png', N'../images/laptop/dell-inspiron-5458-10.jpg,1../images/laptop/dell-inspiron-5458-11.jpg,../images/laptop/dell-inspiron-5458-12.jpg,../images/laptop/dell-inspiron-5458-13.jpg', N'../images/laptop/dell-inspiron-5458-1.jpg,../images/laptop/dell-inspiron-5458-2.jpg,../images/laptop/dell-inspiron-5458-3.jpg,../images/laptop/dell-inspiron-5458-4.jpg,../images/laptop/dell-inspiron-5458-5.jpg,../images/laptop/dell-inspiron-5458-6.jpg,../images/laptop/dell-inspiron-5458-7.jpg,../images/laptop/dell-inspiron-5458-8.jpg', N'Intel', N'Core i3 Haswell', N'4005U', N'1.70 GHz', N'Intel® Smart Cache, 3 MB', N'Không', N'Intel® HM8 Series Express Chipset', N'1600Mhz', N'8 GB', N'DDR3L(On board+1Khe)', N'4Gb', N'1600 Mhz', N'HDD', N'500 GB', N'14', N'HD (1366 x 768 pixels)', N'LED Backlight Splend Video Intelligent', N'Không', N'Intel HD Graphics 4400', N'Share (Du`ng chung bô? nho´ vo´i RAM)', N'Tích h?p', N'2.0', N'Combo Microphone & Headphone', N'Có', N'DVD Super Multi Double Layer', N'HDMI LAN (RJ45) USB 2.0 USB 3.0', N'Instant On Ice Cool', N'10/100/1000 Mbps Ethernet LAN (RJ-45 connector)', N'802.11b/g/n', N'Không', N'Có', N'SD', N'0.3 MP(16:9)', N'VGA webcam', N'Li-Ion 2 cell', N'Windows 10', N'Dài 348 mm - Ngang 241 mm - Dày 31.7 mm', N'1.98 kg')
INSERT [dbo].[Laptop] ([ID], [Name], [price], [icon], [slide], [images], [CPU_Manf], [CPU_Tech], [CPU_Type], [CPU_Speed], [CPU_Cache], [CPU_MaxSpeed], [MainBoard_Chipset], [MainBoard_Bus], [MainBoard_SupporRam], [Storage_Type], [Storage_RAM], [Storage_Bus], [HardDisk_Type], [HardDisk_Capacity], [screenSize], [screenResolution], [screenTech], [touchScreen], [Graphics_Chipset], [Graphics_Capacity], [Graphics_Design], [Audio_Channels], [Audio_Other], [CD], [CD_Type], [Interfaces], [Interfaces_Other], [LAN], [Wifi], [Network_Other], [CardReader_Support], [CardReader_Other], [Webcam_Resolution], [Webcam_Other], [Battery], [OS], [dimensions], [weight]) VALUES (N'hp-15-ac152tu-i3-5005u', N'Laptop HP 15 ac152TU i3 5005U', 18690000, N'../images/laptop/hp-15-ac152tu-i3-5005u.png', N'../images/laptop/hp-15-ac152tu-i3-5005u-10.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-11.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-12.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-13.jpg', N'../images/laptop/hp-15-ac152tu-i3-5005u-1.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-2.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-3.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-4.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-5.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-6.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-7.jpg,../images/laptop/hp-15-ac152tu-i3-5005u-8.jpg', N'Intel', N'Core i3 Haswell', N'4005U', N'1.70 GHz', N'Intel® Smart Cache, 3 MB', N'Không', N'Intel® HM8 Series Express Chipset', N'1600Mhz', N'8 GB', N'DDR3L(On board+1Khe)', N'4Gb', N'1600 Mhz', N'HDD', N'500 GB', N'14', N'HD (1366 x 768 pixels)', N'LED Backlight Splend Video Intelligent', N'Không', N'Intel HD Graphics 4400', N'Share (Du`ng chung bô? nho´ vo´i RAM)', N'Tích h?p', N'2.0', N'Combo Microphone & Headphone', N'Có', N'DVD Super Multi Double Layer', N'HDMI LAN (RJ45) USB 2.0 USB 3.0', N'Instant On Ice Cool', N'10/100/1000 Mbps Ethernet LAN (RJ-45 connector)', N'802.11b/g/n', N'Không', N'Có', N'SD', N'0.3 MP(16:9)', N'VGA webcam', N'Li-Ion 2 cell', N'Windows 10', N'Dài 348 mm - Ngang 241 mm - Dày 31.7 mm', N'1.98 kg')
INSERT [dbo].[Laptop] ([ID], [Name], [price], [icon], [slide], [images], [CPU_Manf], [CPU_Tech], [CPU_Type], [CPU_Speed], [CPU_Cache], [CPU_MaxSpeed], [MainBoard_Chipset], [MainBoard_Bus], [MainBoard_SupporRam], [Storage_Type], [Storage_RAM], [Storage_Bus], [HardDisk_Type], [HardDisk_Capacity], [screenSize], [screenResolution], [screenTech], [touchScreen], [Graphics_Chipset], [Graphics_Capacity], [Graphics_Design], [Audio_Channels], [Audio_Other], [CD], [CD_Type], [Interfaces], [Interfaces_Other], [LAN], [Wifi], [Network_Other], [CardReader_Support], [CardReader_Other], [Webcam_Resolution], [Webcam_Other], [Battery], [OS], [dimensions], [weight]) VALUES (N'lenovo-yoga-500-14ibd-i3-5020u', N'Laptop Lenovo Yoga 500 14IBD i3 5020U', 16900000, N'../images/laptop/lenovo-yoga-500-14ibd-i3-5020u.png', N'../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-10.jpg,1../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-11.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-12.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-13.jpg', N'../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-1.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-2.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-3.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-4.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-5.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-6.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-7.jpg,../images/laptop/lenovo-yoga-500-14ibd-i3-5020u-8.jpg', N'Intel', N'Core i3 Haswell', N'4005U', N'1.70 GHz', N'Intel® Smart Cache, 3 MB', N'Không', N'Intel® HM8 Series Express Chipset', N'1600Mhz', N'8 GB', N'DDR3L(On board+1Khe)', N'4Gb', N'1600 Mhz', N'HDD', N'500 GB', N'14', N'HD (1366 x 768 pixels)', N'LED Backlight Splend Video Intelligent', N'Không', N'Intel HD Graphics 4400', N'Share (Du`ng chung bô? nho´ vo´i RAM)', N'Tích h?p', N'2.0', N'Combo Microphone & Headphone', N'Có', N'DVD Super Multi Double Layer', N'HDMI LAN (RJ45) USB 2.0 USB 3.0', N'Instant On Ice Cool', N'10/100/1000 Mbps Ethernet LAN (RJ-45 connector)', N'802.11b/g/n', N'Không', N'Có', N'SD', N'0.3 MP(16:9)', N'VGA webcam', N'Li-Ion 2 cell', N'Windows 10', N'Dài 348 mm - Ngang 241 mm - Dày 31.7 mm', N'1.98 kg')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductsID], [ProductName], [Prices], [Quantity], [icon], [Discount]) VALUES (1247, N'asus-tp500lb-i5-5200u', N'Laptop Asus TP500LB i5 5200U', 15590000, 1, N'../images/laptop/asus-tp500lb-i5-5200u.png', 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductsID], [ProductName], [Prices], [Quantity], [icon], [Discount]) VALUES (1247, N'galaxy-a7', N'Samsung Galaxy A7', 7990000, 1, N'../images/phones/galaxy-a7.jpg', 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductsID], [ProductName], [Prices], [Quantity], [icon], [Discount]) VALUES (1248, N'huawei-mediapad-t1', N'Huawei MediaPad T1 8.0', 3490000, 1, N'../images/tablet/huawei-mediapad-t1.jpg	', 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductsID], [ProductName], [Prices], [Quantity], [icon], [Discount]) VALUES (1248, N'iphone-6s', N'iPhone 6s 64GB', 21790000, 1, N'../images/phones/iphone-6s.jpg', 0)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequriedDate]) VALUES (1247, 1235, N'22/2/2016 9:38:28', N'23/2/2016')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequriedDate]) VALUES (1248, 1235, N'22/2/2016 9:38:49', N'23/2/2016')
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Phone] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [glassTouch], [CameraBehind_primary], [CameraBehind_film], [CameraBehind_Flash], [CameraBehind_Advanced], [CameraFront_primary], [CameraFront_film], [CameraFront_VideoCall], [CameraFront_Other], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [TwoG], [ThreeG], [FourG], [NumSIM], [Type], [Wifi], [GPS], [Bluetooth], [NFC], [Charger], [audioJack], [Connection_Other], [Design_Type], [Material], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'zenfone-2-laser-zẹ00kg', N'Asus Zenfone 2 Laser', N'../images/phones/zenfone-2-laser-ze500kg.jpg', N'../images/phones/zenfone-2-laser-ze500kg-6.jpg, ../images/phones/zenfone-2-laser-ze500kg-7.jpg,../images/phones/zenfone-2-laser-ze500kg-8.jpg', N'../images/phones/zenfone-2-laser-ze500kg-1.jpg,../images/phones/zenfone-2-laser-ze500kg-2.jpg,../images/phones/zenfone-2-laser-ze500kg-3.jpg,../images/phones/zenfone-2-laser-ze500kg-4.jpg,../images/phones/zenfone-2-laser-ze500kg-5.jpg', 3690000, N'ASUS', N'../images/phones/asus-zenfone-2-laser-mo-ta-chuc-nang.jpg', N'IPS LCD', N'720 x 1280 pixels', N'5.0', N'Cảm ứng điện dung đa điểm', N'Kính cường lực Gorilla Glass 4', N'8 MP', N'Quay phim FullHD 1080@30fps', N'Có', N'Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama', N'5 MP', N'Có', N'Có', N'Tự động lấy nét', N'Android 5e (Lollipop)', N'Snapdragon 410', N'4 nhân', N'1.2 Ghz', N'Adreno 306', N'2 GB', N'16 GB', N'Đang cập nhật', N'MicroSD (T-Flash)', N'128 GB', N'GSM 850/900/1800/1900', N'HSDPA 850/900/1900/2100, LTE', N'Không', N'2 SIM 2 sóng', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Wi-Fi hotspot', N'A-GPS, GLONASS', N'V4.0, A2DP, EDR', N'không', N'Micro USB', N'3.5 mm', N'Không', N'Pin rời', N'Nhựa', N'Dài 143.7 mm - Ngang 71.5 mm - Dày 10.5 mm', N'170 g', N'2070 mAh', N'Pin chuẩn Li-Po')
INSERT [dbo].[Phone] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [glassTouch], [CameraBehind_primary], [CameraBehind_film], [CameraBehind_Flash], [CameraBehind_Advanced], [CameraFront_primary], [CameraFront_film], [CameraFront_VideoCall], [CameraFront_Other], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [TwoG], [ThreeG], [FourG], [NumSIM], [Type], [Wifi], [GPS], [Bluetooth], [NFC], [Charger], [audioJack], [Connection_Other], [Design_Type], [Material], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'galaxy-a7', N'Samsung Galaxy A7', N'../images/phones/galaxy-a7.jpg', N'../images/phones/galaxy-a7-6.jpg, ../images/phones/galaxy-a7-7.jpg,../images/phones/galaxy-a7-8.jpg', N'../images/phones/galaxy-a7-1.jpg,../images/phones/galaxy-a7-2.jpg,../images/phones/galaxy-a7-3.jpg,../images/phones/galaxy-a7-4.jpg,../images/phones/galaxy-a7-5.jpg', 7990000, N'Samsung', N'../images/phones/galaxy-a7-10.jpg', N'IPS LCD', N'720 x 1280 pixels', N'5.0', N'Cảm ứng điện dung đa điểm', N'Kính cường lực Gorilla Glass 4', N'8 MP', N'Quay phim FullHD 1080@30fps', N'Có', N'Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama', N'5 MP', N'Có', N'Có', N'Tự động lấy nét', N'Android 5e (Lollipop)', N'Snapdragon 410', N'4 nhân', N'1.2 Ghz', N'Adreno 306', N'2 GB', N'16 GB', N'Đang cập nhật', N'MicroSD (T-Flash)', N'128 GB', N'GSM 850/900/1800/1900', N'HSDPA 850/900/1900/2100, LTE', N'Không', N'2 SIM 2 sóng', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Wi-Fi hotspot', N'A-GPS, GLONASS', N'V4.0, A2DP, EDR', N'không', N'Micro USB', N'3.5 mm', N'Không', N'Pin rời', N'Nhựa', N'Dài 143.7 mm - Ngang 71.5 mm - Dày 10.5 mm', N'170 g', N'2070 mAh', N'Pin chuẩn Li-Po')
INSERT [dbo].[Phone] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [glassTouch], [CameraBehind_primary], [CameraBehind_film], [CameraBehind_Flash], [CameraBehind_Advanced], [CameraFront_primary], [CameraFront_film], [CameraFront_VideoCall], [CameraFront_Other], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [TwoG], [ThreeG], [FourG], [NumSIM], [Type], [Wifi], [GPS], [Bluetooth], [NFC], [Charger], [audioJack], [Connection_Other], [Design_Type], [Material], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'huawei-g7-plus', N'Huawei G7 Plus', N'../images/phones/huawei-g7-plus.jpg', N'../images/phones/huawei-g7-plus-6.jpg, ../images/phones/huawei-g7-plus-7.jpg,../images/phones/huawei-g7-plus-8.jpg', N'../images/phones/huawei-g7-plus-1.jpg,../images/phones/huawei-g7-plus-2.jpg,../images/phones/huawei-g7-plus-3.jpg,../images/phones/huawei-g7-plus-4.jpg,../images/phones/huawei-g7-plus-5.jpg', 8990000, N'Huawei', N'../images/phones/huawei-g7-plus-mo-ta-chuc-nang.jpg', N'IPS LCD', N'720 x 1280 pixels', N'5.0', N'Cảm ứng điện dung đa điểm', N'Kính cường lực Gorilla Glass 4', N'8 MP', N'Quay phim FullHD 1080@30fps', N'Có', N'Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama', N'5 MP', N'Có', N'Có', N'Tự động lấy nét', N'Android 5e (Lollipop)', N'Snapdragon 410', N'4 nhân', N'1.2 Ghz', N'Adreno 306', N'2 GB', N'16 GB', N'Đang cập nhật', N'MicroSD (T-Flash)', N'128 GB', N'GSM 850/900/1800/1900', N'HSDPA 850/900/1900/2100, LTE', N'Không', N'2 SIM 2 sóng', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Wi-Fi hotspot', N'A-GPS, GLONASS', N'V4.0, A2DP, EDR', N'không', N'Micro USB', N'3.5 mm', N'Không', N'Pin rời', N'Nhựa', N'Dài 143.7 mm - Ngang 71.5 mm - Dày 10.5 mm', N'170 g', N'2070 mAh', N'Pin chuẩn Li-Po')
INSERT [dbo].[Phone] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [glassTouch], [CameraBehind_primary], [CameraBehind_film], [CameraBehind_Flash], [CameraBehind_Advanced], [CameraFront_primary], [CameraFront_film], [CameraFront_VideoCall], [CameraFront_Other], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [TwoG], [ThreeG], [FourG], [NumSIM], [Type], [Wifi], [GPS], [Bluetooth], [NFC], [Charger], [audioJack], [Connection_Other], [Design_Type], [Material], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'iphone-6s', N'iPhone 6s 64GB', N'../images/phones/iphone-6s.jpg', N'../images/phones/iphone-6s-1.jpg,../images/phones/iphone-6s-2.jpg,../images/phones/iphone-6s-3.jpg,../images/phones/iphone-6s-4.jpg,../images/phones/iphone-6s-5.jpg', N'../images/phones/huawei-g7-plus-1.jpg,../images/phones/huawei-g7-plus-2.jpg,../images/phones/huawei-g7-plus-3.jpg,../images/phones/huawei-g7-plus-4.jpg,../images/phones/huawei-g7-plus-5.jpg', 21790000, N'Apple', N'../images/phones/iphone-6s-64gb-mo-ta-chuc-nang.jpg', N'IPS LCD', N'720 x 1280 pixels', N'5.0', N'Cảm ứng điện dung đa điểm', N'Kính cường lực Gorilla Glass 4', N'8 MP', N'Quay phim FullHD 1080@30fps', N'Có', N'Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama', N'5 MP', N'Có', N'Có', N'Tự động lấy nét', N'Android 5e (Lollipop)', N'Snapdragon 410', N'4 nhân', N'1.2 Ghz', N'Adreno 306', N'2 GB', N'16 GB', N'Đang cập nhật', N'MicroSD (T-Flash)', N'128 GB', N'GSM 850/900/1800/1900', N'HSDPA 850/900/1900/2100, LTE', N'Không', N'2 SIM 2 sóng', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Wi-Fi hotspot', N'A-GPS, GLONASS', N'V4.0, A2DP, EDR', N'không', N'Micro USB', N'3.5 mm', N'Không', N'Pin rời', N'Nhựa', N'Dài 143.7 mm - Ngang 71.5 mm - Dày 10.5 mm', N'170 g', N'2070 mAh', N'Pin chuẩn Li-Po')
INSERT [dbo].[Phone] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [glassTouch], [CameraBehind_primary], [CameraBehind_film], [CameraBehind_Flash], [CameraBehind_Advanced], [CameraFront_primary], [CameraFront_film], [CameraFront_VideoCall], [CameraFront_Other], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [TwoG], [ThreeG], [FourG], [NumSIM], [Type], [Wifi], [GPS], [Bluetooth], [NFC], [Charger], [audioJack], [Connection_Other], [Design_Type], [Material], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'lg-v10', N'LG V10', N'../images/phones/lg-v10.jpg', N'../images/phones/lg-v10-6.jpg, ../images/phones/lg-v10-7.jpg,../images/phones/lg-v10-8.jpg', N'../images/phones/lg-v10-1.jpg,../images/phones/lg-v10-2.jpg,../images/phones/lg-v10-3.jpg,../images/phones/lg-v10-4.jpg,../images/phones/lg-v10-5.jpg', 15900000, N'LG', N'', N'IPS LCD', N'720 x 1280 pixels', N'5.0', N'Cảm ứng điện dung đa điểm', N'Kính cường lực Gorilla Glass 4', N'8 MP', N'Quay phim FullHD 1080@30fps', N'Có', N'Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama', N'5 MP', N'Có', N'Có', N'Tự động lấy nét', N'Android 5e (Lollipop)', N'Snapdragon 410', N'4 nhân', N'1.2 Ghz', N'Adreno 306', N'2 GB', N'16 GB', N'Đang cập nhật', N'MicroSD (T-Flash)', N'128 GB', N'GSM 850/900/1800/1900', N'HSDPA 850/900/1900/2100, LTE', N'Không', N'2 SIM 2 sóng', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Wi-Fi hotspot', N'A-GPS, GLONASS', N'V4.0, A2DP, EDR', N'không', N'Micro USB', N'3.5 mm', N'Không', N'Pin rời', N'Nhựa', N'Dài 143.7 mm - Ngang 71.5 mm - Dày 10.5 mm', N'170 g', N'2070 mAh', N'Pin chuẩn Li-Po')
INSERT [dbo].[Phone] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [glassTouch], [CameraBehind_primary], [CameraBehind_film], [CameraBehind_Flash], [CameraBehind_Advanced], [CameraFront_primary], [CameraFront_film], [CameraFront_VideoCall], [CameraFront_Other], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [TwoG], [ThreeG], [FourG], [NumSIM], [Type], [Wifi], [GPS], [Bluetooth], [NFC], [Charger], [audioJack], [Connection_Other], [Design_Type], [Material], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'oppo-r7s', N'OPPO R7s', N'../images/phones/oppo-r7s.jpg', N'../images/phones/oppo-r7s-6.jpg, ../images/phones/oppo-r7s-7.jpg,../images/phones/oppo-r7s-8.jpg', N'../images/phones/oppo-r7s-1.jpg,../images/phones/oppo-r7s-2.jpg,../images/phones/oppo-r7s-3.jpg,../images/phones/oppo-r7s-4.jpg,../images/phones/oppo-r7s-5.jpg', 9490000, N'OPPO', N'../images/phones/oppo-r7s-mo-ta-chuc-nang1.jpg', N'IPS LCD', N'720 x 1280 pixels', N'5.0', N'Cảm ứng điện dung đa điểm', N'Kính cường lực Gorilla Glass 4', N'8 MP', N'Quay phim FullHD 1080@30fps', N'Có', N'Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama', N'5 MP', N'Có', N'Có', N'Tự động lấy nét', N'Android 5e (Lollipop)', N'Snapdragon 410', N'4 nhân', N'1.2 Ghz', N'Adreno 306', N'2 GB', N'16 GB', N'Đang cập nhật', N'MicroSD (T-Flash)', N'128 GB', N'GSM 850/900/1800/1900', N'HSDPA 850/900/1900/2100, LTE', N'Không', N'2 SIM 2 sóng', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Wi-Fi hotspot', N'A-GPS, GLONASS', N'V4.0, A2DP, EDR', N'không', N'Micro USB', N'3.5 mm', N'Không', N'Pin rời', N'Nhựa', N'Dài 143.7 mm - Ngang 71.5 mm - Dày 10.5 mm', N'170 g', N'2070 mAh', N'Pin chuẩn Li-Po')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Tablet', N'acer-iconia-b1')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Laptop', N'asus-f454la-i3-4005u')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Tablet', N'asus-t200ta')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Laptop', N'asus-tp500lb-i5-5200u')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Laptop', N'asus-zenbook-ux305fa')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Laptop', N'dell-inspiron-5458')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Phone', N'galaxy-a7')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Laptop', N'hp-pavilion-15-ab254tx-i7-6500u')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Phone', N'huawei-g7-plus')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Tablet', N'huawei-mediapad-t1')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Tablet', N'ipad-pro')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Phone', N'iphone-6s')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Tablet', N'lenovo-ideatab-a5500')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Laptop', N'lenovo-yoga-500-14ibd-i3-5020u')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Phone', N'lg-v10')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Phone', N'oppo-r7s')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Tablet', N'samsung-galaxy-tab-e-96')
INSERT [dbo].[Products] ([CategoryID], [ProductID]) VALUES (N'Phone', N'zenfone-2-laser-zẹ00kg')
INSERT [dbo].[Tablet] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [CameraBehind], [film], [Advanced], [CameraFront], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [ThreeG], [FourG], [SIM], [Wifi], [GPS], [Bluetooth], [USB], [HDMI], [audioJack], [Connection_Other], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'lenovo-ideatab-a5500', N'Lenovo IdeaTab A8-50 HD (A5500)', N'../images/tablet/lenovo-ideatab-a5500.jpg', N'../images/tablet/lenovo-ideatab-a5500-6.jpg, ../images/tablet/lenovo-ideatab-a5500-7.jpg,../images/tablet/lenovo-ideatab-a5500-8.jpg', N'../images/tablet/lenovo-ideatab-a5500-1.jpg,../images/tablet/lenovo-ideatab-a5500-2.jpg,../images/tablet/lenovo-ideatab-a5500-3.jpg,../images/tablet/lenovo-ideatab-a5500-4.jpg,../images/tablet/lenovo-ideatab-a5500-5.jpg', 3990000, N'LENOVO', N'../images/tablet/Lenovo-Idea-Tab-A5500-mo-ta.jpg', N'LED Backlit IPS LCD', N'1280 x 800 pixels', N'8', N'Cảm ứng điện dung đa điểm', N'5 MP', N'Full HD 1080p (1920 x 1080 pixels)', N'Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, Nhân diện nụ cười, HDR, Panorama, Chụp bằng giọng nói', N'2 MP', N'Android 4.2', N'MediaTek MTK 8382', N'Quad-core', N'1.3 GHz', N'Mali-400MP', N'1 GB', N'16 GB', N'Đang cập nhật', N'Micro SD', N'64 GB', N'Có 3G (tốc độ Download 21Mbps/42 Mbps; Upload 5.76 Mbps)', N'Không', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Dual-band', N'A-GPS, GLONASS', N'Có', N'Micro USB', N'Không', N'3.5 mm', N'Không', N'Dài 217 mm - Ngang 136 mm - Dày 8.9 mm', N'360 g', N'3000 mAh', N'Lithium - Ion')
INSERT [dbo].[Tablet] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [CameraBehind], [film], [Advanced], [CameraFront], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [ThreeG], [FourG], [SIM], [Wifi], [GPS], [Bluetooth], [USB], [HDMI], [audioJack], [Connection_Other], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'samsung-galaxy-tab-e-96', N'Samsung Galaxy Tab E 9.6 (SM-T561)', N'../images/tablet/samsung-galaxy-tab-e-96.jpg', N'../images/tablet/samsung-galaxy-tab-e-96-6.jpg, ../images/tablet/samsung-galaxy-tab-e-96-7.jpg,../images/tablet/samsung-galaxy-tab-e-96-8.jpg	', N'../images/tablet/samsung-galaxy-tab-e-96-1.jpg,../images/tablet/samsung-galaxy-tab-e-96-2.jpg,../images/tablet/samsung-galaxy-tab-e-96-3.jpg,../images/tablet/samsung-galaxy-tab-e-96-4.jpg,../images/tablet/samsung-galaxy-tab-e-96-5.jpg', 13990000, N'Samsung', N'../images/tablet/samsung-galaxy-tab-s2-t815-mo-ta-chuc-nang.jpg', N'LED Backlit IPS LCD', N'1280 x 800 pixels', N'8', N'Cảm ứng điện dung đa điểm', N'5 MP', N'Full HD 1080p (1920 x 1080 pixels)', N'Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, Nhân diện nụ cười, HDR, Panorama, Chụp bằng giọng nói', N'2 MP', N'Android 4.2', N'MediaTek MTK 8382', N'Quad-core', N'1.3 GHz', N'Mali-400MP', N'1 GB', N'16 GB', N'Đang cập nhật', N'Micro SD', N'64 GB', N'Có 3G (tốc độ Download 21Mbps/42 Mbps; Upload 5.76 Mbps)', N'Không', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Dual-band', N'A-GPS, GLONASS', N'Có', N'Micro USB', N'Không', N'3.5 mm', N'Không', N'Dài 217 mm - Ngang 136 mm - Dày 8.9 mm', N'360 g', N'3000 mAh', N'Lithium - Ion')
INSERT [dbo].[Tablet] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [CameraBehind], [film], [Advanced], [CameraFront], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [ThreeG], [FourG], [SIM], [Wifi], [GPS], [Bluetooth], [USB], [HDMI], [audioJack], [Connection_Other], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'acer-iconia-b1', N'Acer Iconia B1-723', N'../images/tablet/acer-iconia-b1.jpg	', N'../images/tablet/acer-iconia-b1-6.jpg, ../images/tablet/acer-iconia-b1-7.jpg,../images/tablet/acer-iconia-b1-8.jpg	', N'../images/tablet/acer-iconia-b1-1.jpg,../images/tablet/acer-iconia-b1-2.jpg,../images/tablet/acer-iconia-b1-3.jpg,../images/tablet/acer-iconia-b1-4.jpg,../images/tablet/acer-iconia-b1-5.jpg', 2290000, N'ACER', N'../images/tablet/acer-iconia-b1-723-mo-ta-chuc-nang.jpg', N'LED Backlit IPS LCD', N'1280 x 800 pixels', N'8', N'Cảm ứng điện dung đa điểm', N'5 MP', N'Full HD 1080p (1920 x 1080 pixels)', N'Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, Nhân diện nụ cười, HDR, Panorama, Chụp bằng giọng nói', N'2 MP', N'Android 4.2', N'MediaTek MTK 8382', N'Quad-core', N'1.3 GHz', N'Mali-400MP', N'1 GB', N'16 GB', N'Đang cập nhật', N'Micro SD', N'64 GB', N'Có 3G (tốc độ Download 21Mbps/42 Mbps; Upload 5.76 Mbps)', N'Không', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Dual-band', N'A-GPS, GLONASS', N'Có', N'Micro USB', N'Không', N'3.5 mm', N'Không', N'Dài 217 mm - Ngang 136 mm - Dày 8.9 mm', N'360 g', N'3000 mAh', N'Lithium - Ion')
INSERT [dbo].[Tablet] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [CameraBehind], [film], [Advanced], [CameraFront], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [ThreeG], [FourG], [SIM], [Wifi], [GPS], [Bluetooth], [USB], [HDMI], [audioJack], [Connection_Other], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'asus-t200ta', N'ASUS Transformer Book T200TA', N'../images/tablet/asus-t200ta.jpg	', N'../images/tablet/asus-t200ta-6.jpg, ../images/tablet/asus-t200ta-7.jpg,../images/tablet/asus-t200ta-8.jpg', N'../images/tablet/asus-t200ta-1.jpg,../images/tablet/asus-t200ta-2.jpg,../images/tablet/asus-t200ta-3.jpg,../images/tablet/asus-t200ta-4.jpg,../images/tablet/asus-t200ta-5.jpg', 8890000, N'ASUS', N'../images/tablet/Asus-Transformer-Book-T200TA-mo-ta-chuc-nang.jpg', N'LED Backlit IPS LCD', N'1280 x 800 pixels', N'8', N'Cảm ứng điện dung đa điểm', N'5 MP', N'Full HD 1080p (1920 x 1080 pixels)', N'Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, Nhân diện nụ cười, HDR, Panorama, Chụp bằng giọng nói', N'2 MP', N'Android 4.2', N'MediaTek MTK 8382', N'Quad-core', N'1.3 GHz', N'Mali-400MP', N'1 GB', N'16 GB', N'Đang cập nhật', N'Micro SD', N'64 GB', N'Có 3G (tốc độ Download 21Mbps/42 Mbps; Upload 5.76 Mbps)', N'Không', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Dual-band', N'A-GPS, GLONASS', N'Có', N'Micro USB', N'Không', N'3.5 mm', N'Không', N'Dài 217 mm - Ngang 136 mm - Dày 8.9 mm', N'360 g', N'3000 mAh', N'Lithium - Ion')
INSERT [dbo].[Tablet] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [CameraBehind], [film], [Advanced], [CameraFront], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [ThreeG], [FourG], [SIM], [Wifi], [GPS], [Bluetooth], [USB], [HDMI], [audioJack], [Connection_Other], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'huawei-mediapad-t1', N'Huawei MediaPad T1 8.0', N'../images/tablet/huawei-mediapad-t1.jpg	', N'../images/tablet/huawei-mediapad-t1-6.jpg, ../images/tablet/huawei-mediapad-t1-7.jpg,../images/tablet/huawei-mediapad-t1-8.jpg	', N'../images/tablet/huawei-mediapad-t1-1.jpg,../images/tablet/huawei-mediapad-t1-2.jpg,../images/tablet/huawei-mediapad-t1-3.jpg,../images/tablet/huawei-mediapad-t1-4.jpg,../images/tablet/huawei-mediapad-t1-5.jpg', 3490000, N'Huawai', N'../images/tablet/huawei-mediapad-t1-80--mo-ta-chuc-nang.jpg', N'LED Backlit IPS LCD', N'1280 x 800 pixels', N'8', N'Cảm ứng điện dung đa điểm', N'5 MP', N'Full HD 1080p (1920 x 1080 pixels)', N'Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, Nhân diện nụ cười, HDR, Panorama, Chụp bằng giọng nói', N'2 MP', N'Android 4.2', N'MediaTek MTK 8382', N'Quad-core', N'1.3 GHz', N'Mali-400MP', N'1 GB', N'16 GB', N'Đang cập nhật', N'Micro SD', N'64 GB', N'Có 3G (tốc độ Download 21Mbps/42 Mbps; Upload 5.76 Mbps)', N'Không', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Dual-band', N'A-GPS, GLONASS', N'Có', N'Micro USB', N'Không', N'3.5 mm', N'Không', N'Dài 217 mm - Ngang 136 mm - Dày 8.9 mm', N'360 g', N'3000 mAh', N'Lithium - Ion')
INSERT [dbo].[Tablet] ([ID], [Name], [icon], [slide], [images], [price], [manuf], [descImg], [screenTech], [screenResolution], [screenSize], [touchScreen], [CameraBehind], [film], [Advanced], [CameraFront], [OS], [Chipset], [NumCore], [Speed], [GPU], [RAM], [ROM], [availability], [memoryCard], [MaximumSupport], [ThreeG], [FourG], [SIM], [Wifi], [GPS], [Bluetooth], [USB], [HDMI], [audioJack], [Connection_Other], [dimensions], [weight], [Capacity], [Battery_Type]) VALUES (N'ipad-pro', N'iPad Pro Wifi 32GB', N'../images/tablet/ipad-pro.jpg', N'../images/tablet/ipad-pro-6.jpg, ../images/tablet/ipad-pro-7.jpg,../images/tablet/ipad-pro-8.jpg', N'../images/tablet/ipad-pro-1.jpg,../images/tablet/ipad-pro-2.jpg,../images/tablet/ipad-pro-3.jpg,../images/tablet/ipad-pro-4.jpg,../images/tablet/ipad-pro-5.jpg', 19990000, N'Apple', N'../images/tablet/ipad-pro-wifi-32gb-mo-ta-chuc-nang.jpg', N'LED Backlit IPS LCD', N'1280 x 800 pixels', N'8', N'Cảm ứng điện dung đa điểm', N'5 MP', N'Full HD 1080p (1920 x 1080 pixels)', N'Gắn thẻ địa lý, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, Nhân diện nụ cười, HDR, Panorama, Chụp bằng giọng nói', N'2 MP', N'Android 4.2', N'MediaTek MTK 8382', N'Quad-core', N'1.3 GHz', N'Mali-400MP', N'1 GB', N'16 GB', N'Đang cập nhật', N'Micro SD', N'64 GB', N'Có 3G (tốc độ Download 21Mbps/42 Mbps; Upload 5.76 Mbps)', N'Không', N'Micro SIM', N'Wi-Fi 802.11 b/g/n, Dual-band', N'A-GPS, GLONASS', N'Có', N'Micro USB', N'Không', N'3.5 mm', N'Không', N'Dài 217 mm - Ngang 136 mm - Dày 8.9 mm', N'360 g', N'3000 mAh', N'Lithium - Ion')
/****** Object:  Index [UQ__Orders__C3905BAED3214C48]    Script Date: 22/03/2016 9:52:21 AM ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [UQ__Orders__C3905BAED3214C48] UNIQUE NONCLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_Phone]    Script Date: 22/03/2016 9:52:21 AM ******/
ALTER TABLE [dbo].[Phone] ADD  CONSTRAINT [PK_Phone] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_Tablet]    Script Date: 22/03/2016 9:52:21 AM ******/
ALTER TABLE [dbo].[Tablet] ADD  CONSTRAINT [PK_Tablet] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Customer]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductsID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
USE [master]
GO
ALTER DATABASE [WebServices] SET  READ_WRITE 
GO
