USE [master]
GO
/****** Object:  Database [PSAKramse]    Script Date: 16-6-2022 16:39:44 ******/
CREATE DATABASE [PSAKramse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PSAKramse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PSAKramse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PSAKramse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PSAKramse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PSAKramse] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PSAKramse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PSAKramse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PSAKramse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PSAKramse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PSAKramse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PSAKramse] SET ARITHABORT OFF 
GO
ALTER DATABASE [PSAKramse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PSAKramse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PSAKramse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PSAKramse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PSAKramse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PSAKramse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PSAKramse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PSAKramse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PSAKramse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PSAKramse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PSAKramse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PSAKramse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PSAKramse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PSAKramse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PSAKramse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PSAKramse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PSAKramse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PSAKramse] SET RECOVERY FULL 
GO
ALTER DATABASE [PSAKramse] SET  MULTI_USER 
GO
ALTER DATABASE [PSAKramse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PSAKramse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PSAKramse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PSAKramse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PSAKramse] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PSAKramse', N'ON'
GO
ALTER DATABASE [PSAKramse] SET QUERY_STORE = OFF
GO
USE [PSAKramse]
GO
/****** Object:  Table [dbo].[D_Consignor]    Script Date: 16-6-2022 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Consignor](
	[Id] [int] NOT NULL,
	[Consignor] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Consignor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Container]    Script Date: 16-6-2022 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Container](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[RefrigerationFlag] [nvarchar](50) NULL,
	[PowerFlag] [nvarchar](50) NULL,
	[Length] [decimal](18, 2) NULL,
	[Cubes] [decimal](18, 2) NULL,
	[EuroPricePerKm] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Item]    Script Date: 16-6-2022 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Item](
	[item_key] [int] NOT NULL,
	[item_description] [nvarchar](50) NULL,
	[item_category] [nvarchar](50) NULL,
	[item_mfgr] [nvarchar](50) NULL,
	[item_storage_type] [nvarchar](50) NULL,
	[item_hazard_flag] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[item_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Port]    Script Date: 16-6-2022 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Port](
	[P_PortOrder] [nvarchar](50) NULL,
	[VPS_PortId] [int] NOT NULL,
	[P_PortName] [nvarchar](50) NULL,
	[P_Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Port] PRIMARY KEY CLUSTERED 
(
	[VPS_PortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Ship]    Script Date: 16-6-2022 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Ship](
	[VS_Shipid] [int] NOT NULL,
	[Sh_Shipname] [nvarchar](50) NULL,
	[Sh_MaxTEU] [int] NULL,
	[Sh_SpeedInKnots] [int] NULL,
	[Sh_SpeedInKm_H] [int] NULL,
	[Sh_Country] [nvarchar](50) NULL,
	[Sh_Yearcost] [money] NULL,
	[Total_fuel_consumption_per_mile_in_Kg] [float] NULL,
	[Total_CO2_Emission_per_mile_in_kg] [float] NULL,
	[Total_Annual_Time_Spent_At_Sea] [float] NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[VS_Shipid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey]    Script Date: 16-6-2022 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey](
	[RouteId] [int] NOT NULL,
	[ShipId] [int] NOT NULL,
	[IdleDays] [int] NULL,
	[CurrentPortId] [int] NOT NULL,
	[AmountOfContainers] [int] NOT NULL,
	[DaysOnSea] [int] NOT NULL,
	[DistanceMiles] [int] NULL,
	[DistanceKm] [int] NULL,
	[CurrentTEU] [int] NULL,
	[LoadFactor] [float] NULL,
	[CO2EmissionKg] [float] NULL,
	[FuelConsumptionKg] [float] NULL,
	[JourneyId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Journey] PRIMARY KEY CLUSTERED 
(
	[JourneyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 16-6-2022 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[Name] [nvarchar](255) NOT NULL,
	[PortFrom] [int] NOT NULL,
	[PortTo] [int] NOT NULL,
	[RouteId] [int] IDENTITY(1,1) NOT NULL,
	[DistanceKm] [int] NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetail]    Script Date: 16-6-2022 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetail](
	[ShipmentId] [int] NOT NULL,
	[Item] [int] NOT NULL,
	[ContainertypeId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[ShipId] [int] NOT NULL,
	[ConsignorId] [int] NOT NULL,
	[ContainerNr] [nvarchar](50) NOT NULL,
	[Costs] [int] NULL,
	[Discount] [int] NULL,
	[Distance] [int] NULL,
 CONSTRAINT [PK_ShipmentDetail_1] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC,
	[ContainerNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (1, N'P. Abramson', N'Stockholm', N'Sweden', 8)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (2, N'C. Lassenius', N'Helsinki', N'Finland', 10)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (3, N'D. Damian', N'Vancouver', N'Canada', 9)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (4, N'S. Marzak', N'Rio de Janiero', N'Brazilië', 7)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (5, N'R. Helms', N'Utrecht', N'Nederland', 0)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (6, N'H. Sharpe', N'Edinborough', N'Scotland', 4)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (7, N'D. Freer', N'Newcastle', N'NL', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (8, N'F. Delpaz', N'Roma', N'Italia', 5)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (9, N'K. Lindemeijer', N'Hamburg', N'Germany', 10)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (10, N'M. di Sassi', N'Barcelona', N'Spain', 1)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (11, N'O. Freire', N'Lisboa', N'Portugal', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (12, N'Y. Stanopoulos', N'Piraes', N'Greece', NULL)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (13, N'K. de Haan', N'Rotterdam', N'Nederland', 9)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (14, N'H. de Kaan', N'A''dam', N'Nederland', 8)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (15, N'C. de Masserkerke', N'Zeebrugge', N'BE', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (16, N'J. Schimanski', N'Gdansk', N'Poland', 2)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (17, N'F. la Filloise', N'Le Havre', N'France', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (18, N'H.B. Lord', N'Dublin', N'Ireland', 4)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (19, N'C. Ceasari', N'Bari', N'Italy', 5)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (20, N'C. Szolsky', N'Dubrovnik', N'Yougoslavia', 0)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (21, N'D. van der Vlucht', N'Amsterdam', N'NL', 7)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (22, N'K. Konrath', N'Hamburg', N'Deutschland', 9)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (23, N'M. Moolenaar', N'Leuven', N'België', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (24, N'C.J.A. Claussen zu Hohenstein', N'Berlin', N'Germany', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (25, N'W. Werff', NULL, N'Estonia', 4)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (26, N'P. aus das Veld', N'Essen', N'Germany', 9)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (27, N'J. Kornuit', N'Gand', N'Belgique', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (28, N'A. Bruinsma', N'Detroxter', N'Great Britain', 2)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (29, N'R. Boxelaar', N'Hoogerheide', N'Belgium', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (30, N'C le Bozec', N'Trégastel ', N'Francia', 89)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (31, N'P.L. Passchier', N'Wuust', N'Belgie', 2)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (32, N'C. Cioffarelli', N'Como', N'Italy', 4)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (33, N'D. de Weger', N'Antwerpen', N'Belgium', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (35, N'S. de Françon', N'Marseille', N'France', 2)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (36, N'H.H. Restorantos', N'Athens', N'Griekenland', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (37, N'P. du Maurier', N'Le Havre', N'France', 4)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (38, N'J. Jonesies', N'Gibraltar', N'Gibraltar', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (39, N'S. Sondström', N'Oslo', N'Norway', 9)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (40, N'B. Bentraths', N'Kiel', N'Germany', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (41, N'X. Movros', N'Athens', N'Greece', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (42, N'C.H.J. de Bruin - van der Delden', N'IJmuiden', N'Netherlands', 8)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (43, N'D. Dressel', N'Genava', N'Switzerland', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (44, N'V. Nasajev', N'Moskou', N'Rusland', 1)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (45, N'R. Claus', N'Berlin', N'Deutschland', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (46, N'R. Claus', N'Bremerhafen', N'Deutschland', 6)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (47, N'J. Jones', N'Liverpool', N'United Kingdom', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (48, N'R. van Rooijen', N'Marseille', N'FR', NULL)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (49, N'L. Bürgel', N'Dortmund', N'Germany', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (50, N'V. Boersin', N'Warsawa', N'Polska', 3)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (53, N'T. Brady', N'Newcastle', N'UK', 5)
INSERT [dbo].[D_Consignor] ([Id], [Consignor], [City], [Country], [Discount]) VALUES (59, N'K. Van den Broeke', N'Rijsel', N'France', 1)
INSERT [dbo].[D_Container] ([Id], [Type], [RefrigerationFlag], [PowerFlag], [Length], [Cubes], [EuroPricePerKm]) VALUES (1, N'Standard', N'Yes', N'NL', CAST(6.10 AS Decimal(18, 2)), CAST(38.51 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[D_Container] ([Id], [Type], [RefrigerationFlag], [PowerFlag], [Length], [Cubes], [EuroPricePerKm]) VALUES (2, N'Protected', N'No', N'B', CAST(6.10 AS Decimal(18, 2)), CAST(38.51 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[D_Container] ([Id], [Type], [RefrigerationFlag], [PowerFlag], [Length], [Cubes], [EuroPricePerKm]) VALUES (3, N'Safe', N'Yes', N'USA', CAST(12.20 AS Decimal(18, 2)), CAST(77.02 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[D_Container] ([Id], [Type], [RefrigerationFlag], [PowerFlag], [Length], [Cubes], [EuroPricePerKm]) VALUES (4, N'Secret', N'Yes', N'GB', CAST(12.20 AS Decimal(18, 2)), CAST(77.02 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[D_Container] ([Id], [Type], [RefrigerationFlag], [PowerFlag], [Length], [Cubes], [EuroPricePerKm]) VALUES (5, N'Standard', N'No', N'I', CAST(6.10 AS Decimal(18, 2)), CAST(38.51 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[D_Container] ([Id], [Type], [RefrigerationFlag], [PowerFlag], [Length], [Cubes], [EuroPricePerKm]) VALUES (6, N'Safe', N'No', N'D', CAST(6.10 AS Decimal(18, 2)), CAST(38.51 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[D_Container] ([Id], [Type], [RefrigerationFlag], [PowerFlag], [Length], [Cubes], [EuroPricePerKm]) VALUES (7, N'anti-explosion', N'No', N'China', CAST(6.10 AS Decimal(18, 2)), CAST(38.51 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[D_Container] ([Id], [Type], [RefrigerationFlag], [PowerFlag], [Length], [Cubes], [EuroPricePerKm]) VALUES (8, N'Secret', N'No', N'N', CAST(6.10 AS Decimal(18, 2)), CAST(38.51 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (1, N'Mountains bikes', N'Bikes', N'Gazelle', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (2, N'Netbooks', N'Computers', N'Asus', N'safe', N'high')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (3, N'Computer books', N'Books', N'AW', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (4, N'Flatscreens', N'domestic appliance', N'Philips', N'protected', N'medium')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (5, N'Cigarettes', N'Smoking goods', N'Marlboro', N'safe', N'medium')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (6, N'Frozen spinace', N'Frozen food', N'Iglo', N'refrigeration', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (7, N'Beef', N'Frozen food', N'Beef&Steak', N'refrigeration', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (8, N'Chicken', N'Frozen food', N'Poultex', N'refrigeration', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (9, N'Fireworks', N'Explosive', N'Bonbridge', N'anti-explosive', N'high')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (10, N'Refrigerators', N'domestic appliances', N'Miele', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (11, N'Sports shoes', N'shoes', N'Addidas', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (12, N'Desks', N'Furniture', N'Ikea', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (13, N'Chair', N'Furniture', N'Ikea', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (14, N'Wardrobes', N'Furniture', N'Ikea', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (15, N'Memory sticks', N'Media hardware', N'Emtec', N'protected', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (16, N'CD', N'Media hardware', N'Emtec', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (17, N'DVD', N'Media hardware', N'Emtec', N'standard', N'low')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (18, N'Balls', N'Toys', N'Toys R us', N'standard', N'medium')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (19, N'Trains', N'Toys', N'Toys R us', N'standard', N'medium')
INSERT [dbo].[D_Item] ([item_key], [item_description], [item_category], [item_mfgr], [item_storage_type], [item_hazard_flag]) VALUES (20, N'Guns', N'Arms', N'Xxx', N'secret', N'high')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'1', 1, N'Rotterdam', N'Netherlands')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'7', 2, N'Amsterdam', N'Netherlands')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'15', 3, N'Alborg', N'Denmark')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'21', 4, N'Helsinki', N'Finland')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'8', 5, N'Le Havre', N'France')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'5', 6, N'Marseilles', N'France')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'4', 7, N'Hamburg', N'Germany')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'10', 8, N'Piraeus', N'Greece')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'11', 10, N'Oslo', N'Norway')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'12', 11, N'Gdansk', N'Poland')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'3', 12, N'Barcelona', N'Spain')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'13', 13, N'Bilbao', N'Spain')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'19', 14, N'Goteborg', N'Sweden')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'2', 15, N'London', N'England')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'16', 16, N'Genua', N'Italy')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'17', 17, N'Ostia', N'Italy')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'9', 18, N'Napels', N'Italy')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'18', 19, N'Bari', N'Italy')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'14', 20, N'Cardiff', N'England')
INSERT [dbo].[D_Port] ([P_PortOrder], [VPS_PortId], [P_PortName], [P_Country]) VALUES (N'6', 21, N'Antwerp', N'Belgium')
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (1, N'XIN BEIJING', 9580, 15, 28, N'Hong Kong', 1000000.0000, 289.41, 907.09, 1500.32)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (2, N'MSC VITTORIA', 8809, 12, 22, N'Panama', 950000.0000, 289.91, 903.34, 4596.87)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (3, N'MSC RACHELE', 8238, 18, 33, N'Germany', 860000.0000, 260.5, 813.02, 3150.7)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (4, N'EMMA MAERSK', 13000, 19, 35, N'Denmark', 1350000.0000, 353.3, 1101.45, 2184.42)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (5, N'MAERSK SANA', 8452, 15, 28, N'Liberia', 750000.0000, 213.85, 666.56, 1283.3)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (6, N'CMA CGM OTELLO', 8488, 20, 37, N'Frankrijk', 700000.0000, 82.22, 263.6, 3087.81)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (7, N'CAROLINE MAERSK', 8660, 22, 41, N'Denmark', 750000.0000, 115.25, 360.26, 6265.61)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (8, N'COSCO', 10046, 20, 37, N'China', 1200000.0000, 346.76, 1081.24, 1155.44)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (9, N'MÆRSK STEPNICA', 8750, 17, 31, N'Cyprus', 1150000.0000, 150.26, 468.5, 269.5)
INSERT [dbo].[D_Ship] ([VS_Shipid], [Sh_Shipname], [Sh_MaxTEU], [Sh_SpeedInKnots], [Sh_SpeedInKm_H], [Sh_Country], [Sh_Yearcost], [Total_fuel_consumption_per_mile_in_Kg], [Total_CO2_Emission_per_mile_in_kg], [Total_Annual_Time_Spent_At_Sea]) VALUES (10, N'OOCL NINGBO', 8063, 20, 37, N'Marshalleilanden', 950000.0000, 293.04, 917.74, 4463.1)
SET IDENTITY_INSERT [dbo].[Journey] ON 

INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (2, 7, 0, 7, 6500, 2, 378, 700, 9000, 1.0392609699769053, 0.0025972264182, 0.0008308731047, 650)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (1, 10, 0, 1, 8000, 1, 162, 300, 8000, 0.99218653106784072, 0.0102925338007, 0.0032864690489, 651)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (3, 2, 0, 3, 8500, 3, 432, 800, 8500, 0.96492223861959359, 0.0165427353178, 0.0053090800761, 652)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (9, 6, 0, 15, 7300, 5, 432, 800, 7300, 0.86003770028275217, 0.0042730118303, 0.0013328036141, 653)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (10, 3, 0, 1, 9000, 3, 270, 500, 9000, 1.0924981791697015, 0.014481755774, 0.0046401040308, 654)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (14, 8, 0, 8, 6000, 2, 540, 1000, 6000, 0.59725263786581728, 0.0468396848396, 0.0150217612324, 655)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (21, 1, 0, 4, 7000, 5, 1404, 2600, 7000, 0.7306889352818372, 0.0399898183963, 0.0127588809733, 656)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (24, 6, 0, 18, 7000, 2, 405, 750, 7000, 0.824693685202639, 0.0042730118303, 0.0013328036141, 657)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (7, 2, 3, 18, 8700, 6, 540, 1000, 9300, 1.0557384493132025, 0.0165427353178, 0.0053090800761, 658)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (8, 6, 4, 3, 8200, 4, 810, 1500, 8500, 1.0014137606032045, 0.0042730118303, 0.0013328036141, 659)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (11, 3, 2, 5, 7000, 4, 648, 1200, 14000, 1.6994416120417577, 0.014481755774, 0.0046401040308, 660)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (13, 8, 2, 6, 7000, 2, 243, 450, 9000, 0.89587895679872587, 0.0468396848396, 0.0150217612324, 661)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (15, 8, 2, 12, 9000, 2, 1620, 3000, 13000, 1.2940473820426039, 0.0468396848396, 0.0150217612324, 662)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (4, 2, 5, 12, 7500, 7, 648, 1200, 7500, 0.85140197525258254, 0.0165427353178, 0.0053090800761, 663)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (5, 2, 4, 13, 8800, 16, 1620, 3000, 8800, 0.99897831762969691, 0.0165427353178, 0.0053090800761, 664)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (6, 2, 2, 15, 8700, 4, 567, 1050, 8700, 0.98762629129299584, 0.0165427353178, 0.0053090800761, 665)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (5, 3, 4, 13, 7000, 4, 1620, 3000, 7000, 0.84972080602087885, 0.014481755774, 0.0046401040308, 666)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (16, 8, 2, 16, 7500, 2, 270, 500, 7500, 0.74656579733227157, 0.0468396848396, 0.0150217612324, 667)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (17, 8, 3, 17, 8000, 2, 243, 450, 8000, 0.79633685048775638, 0.0468396848396, 0.0150217612324, 668)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (18, 8, 3, 18, 8000, 13, 162, 300, 8000, 0.79633685048775638, 0.0468396848396, 0.0150217612324, 669)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (19, 8, 2, 19, 6500, 4, 405, 750, 6500, 0.647023691021302, 0.0468396848396, 0.0150217612324, 670)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (20, 1, 2, 2, 5000, 8, 972, 1800, 5000, 0.52192066805845516, 0.0399898183963, 0.0127588809733, 671)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (22, 1, 5, 12, 7000, 5, 1296, 2400, 7000, 0.7306889352818372, 0.0399898183963, 0.0127588809733, 672)
INSERT [dbo].[Journey] ([RouteId], [ShipId], [IdleDays], [CurrentPortId], [AmountOfContainers], [DaysOnSea], [DistanceMiles], [DistanceKm], [CurrentTEU], [LoadFactor], [CO2EmissionKg], [FuelConsumptionKg], [JourneyId]) VALUES (5, 1, 5, 13, 8000, 5, 1620, 3000, 8000, 0.83507306889352817, 0.0399898183963, 0.0127588809733, 673)
SET IDENTITY_INSERT [dbo].[Journey] OFF
SET IDENTITY_INSERT [dbo].[Route] ON 

INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Rotterdam-Antwerp', 1, 21, 1, 300)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Hamburg-Amsterdam', 7, 2, 2, 700)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Alborg-London', 3, 15, 3, 800)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Barcelona-Napels', 12, 18, 4, 1200)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Bilbao-Barcelona', 13, 12, 5, 3000)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'London-Bilbao', 15, 13, 6, 1050)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Napels-Piraeus', 18, 8, 7, 1000)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Alborg-Helsinki', 3, 4, 8, 1500)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'London-Alborg', 15, 3, 9, 800)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Rotterdam-Le Havre', 1, 5, 10, 500)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Le Havre-Bilbao', 5, 13, 11, 1200)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Bilbao-Barcelona', 13, 12, 12, 3000)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Marseilles-Barcelona', 6, 12, 13, 450)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Piraeus-Bari', 8, 19, 14, 1000)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Barcelona-Bilbao', 12, 13, 15, 3000)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Genua-Marseilles', 16, 6, 16, 500)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Ostia-Genua', 17, 16, 17, 450)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Napels-Ostia', 18, 17, 18, 300)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Bari-Napels', 19, 18, 19, 750)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Amsterdam-Bilbao', 2, 13, 20, 1800)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Helsinki-Amsterdam', 4, 2, 21, 2600)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Barcelona-Piraeus', 12, 8, 22, 2400)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Bilbao-Barcelona', 13, 12, 23, 3000)
INSERT [dbo].[Route] ([Name], [PortFrom], [PortTo], [RouteId], [DistanceKm]) VALUES (N'Napels-Bari', 18, 19, 24, 750)
SET IDENTITY_INSERT [dbo].[Route] OFF
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (1, 3, 5, 1, 10, 2, N'1-2000', 300, 30, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (1, 1, 5, 1, 10, 2, N'2001-3800', 300, 30, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (2, 4, 2, 1, 10, 1, N'1-1000', 300, 24, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (3, 5, 6, 1, 10, 3, N'1001-2000', 900, 81, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (3, 9, 7, 1, 10, 3, N'1-1000', 1500, 135, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (4, 4, 2, 1, 10, 4, N'1-600', 300, 21, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (4, 11, 5, 1, 10, 4, N'601-1200', 300, 21, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (5, 8, 3, 2, 7, 3, N'1001-2000', 2100, 189, 700)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (5, 6, 1, 2, 7, 3, N'1-1000', 1050, 94, 700)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (5, 2, 5, 2, 7, 3, N'2001-2500', 700, 63, 700)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (6, 7, 1, 2, 7, 1, N'1-1000', 1050, 84, 700)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (7, 3, 5, 2, 7, 2, N'1-1600', 700, 70, 700)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (7, 7, 1, 2, 7, 2, N'1601-2000', 1050, 105, 700)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (8, 5, 2, 2, 7, 2, N'1-600', 700, 70, 700)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (8, 1, 5, 2, 7, 2, N'601-1000', 700, 70, 700)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (9, 7, 1, 4, 2, 4, N'1-1500', 1800, 126, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (9, 4, 6, 4, 2, 4, N'1501-3000', 3600, 252, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (10, 11, 5, 4, 2, 3, N'1-1500', 1200, 108, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (10, 4, 6, 4, 2, 3, N'1501-2000', 3600, 324, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (10, 10, 2, 4, 2, 3, N'2001-2500', 1200, 108, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (11, 11, 5, 4, 2, 3, N'1601-2000', 1200, 108, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (11, 19, 5, 4, 2, 3, N'1-800', 1200, 108, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (11, 20, 8, 4, 2, 3, N'801-1600', 1800, 162, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (12, 16, 5, 3, 2, 1, N'1601-2000', 800, 64, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (12, 18, 5, 3, 2, 1, N'2001-6000', 800, 64, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (13, 14, 5, 3, 2, 1, N'1-1200', 800, 64, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (13, 13, 5, 3, 2, 1, N'1201-1500', 800, 64, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (13, 12, 5, 3, 2, 1, N'1501-2500', 800, 64, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (14, 16, 2, 5, 2, 3, N'1-1700', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (14, 11, 5, 5, 2, 3, N'1701-2500', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (14, 20, 8, 5, 2, 3, N'2501-3200', 4500, 405, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (15, 6, 1, 5, 2, 2, N'1-1800', 4500, 450, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (15, 4, 2, 5, 2, 2, N'1801-3200', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (15, 11, 5, 5, 2, 2, N'3201-4300', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (15, 1, 5, 5, 2, 2, N'4301-4600', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (16, 15, 2, 5, 2, 2, N'1-1000', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (17, 20, 8, 6, 2, 3, N'1-1300', 1575, 142, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (17, 12, 5, 6, 2, 3, N'1301-2400', 1050, 94, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (17, 16, 5, 6, 2, 3, N'2401-3300', 1050, 94, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (17, 5, 6, 6, 2, 3, N'3301-4200', 3150, 284, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (17, 8, 1, 6, 2, 3, N'4201-5000', 1575, 142, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (18, 17, 5, 6, 2, 3, N'1-1400', 1050, 94, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (18, 12, 5, 6, 2, 3, N'1401-2300', 1050, 94, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (18, 19, 5, 6, 2, 3, N'2301-3400', 1050, 94, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (18, 20, 8, 6, 2, 3, N'3401-3700', 1575, 142, 1050)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (19, 12, 5, 7, 2, 4, N'1-1800', 1000, 70, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (19, 18, 5, 7, 2, 4, N'1801-2300', 1000, 70, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (19, 11, 5, 7, 2, 4, N'2301-3800', 1000, 70, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (19, 19, 5, 7, 2, 4, N'3801-4800', 1000, 70, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (19, 13, 5, 7, 2, 4, N'4801-5500', 1000, 70, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (20, 11, 5, 7, 2, 2, N'1-1400', 1000, 100, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (20, 16, 5, 7, 2, 2, N'1401-2600', 1000, 100, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (21, 5, 3, 7, 2, 2, N'1-400', 3000, 300, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (21, 2, 5, 7, 2, 2, N'401-600', 1000, 100, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (22, 15, 2, 8, 6, 1, N'1-2500', 1500, 120, 1500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (22, 4, 2, 8, 6, 1, N'2501-4600', 1500, 120, 1500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (22, 9, 7, 8, 6, 1, N'4601-6100', 7500, 600, 1500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (22, 17, 5, 8, 6, 1, N'6101-7900', 1500, 120, 1500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (23, 16, 4, 8, 6, 1, N'1-300', 4500, 360, 1500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (24, 12, 5, 9, 6, 3, N'1-2200', 800, 72, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (24, 7, 1, 9, 6, 3, N'2201-3600', 1200, 108, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (25, 19, 5, 9, 6, 2, N'1-1700', 800, 80, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (25, 8, 1, 9, 6, 2, N'1701-3200', 1200, 120, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (25, 4, 5, 9, 6, 2, N'3201-3700', 800, 80, 800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (26, 12, 5, 10, 3, 1, N'1-1700', 500, 40, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (26, 14, 5, 10, 3, 1, N'1701-3000', 500, 40, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (27, 10, 5, 10, 3, 4, N'1-2400', 500, 35, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (27, 8, 1, 10, 3, 4, N'2401-3500', 750, 53, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (27, 7, 1, 10, 3, 4, N'3501-4500', 750, 53, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (27, 6, 1, 10, 3, 4, N'4501-6000', 750, 53, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (28, 10, 5, 11, 3, 2, N'1-2500', 1200, 120, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (28, 11, 5, 11, 3, 2, N'2501-4500', 1200, 120, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (28, 19, 5, 11, 3, 2, N'4501-5800', 1200, 120, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (28, 20, 4, 11, 3, 2, N'5801-7000', 3600, 360, 1200)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (29, 18, 5, 5, 3, 3, N'1-1400', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (29, 12, 5, 5, 3, 3, N'1401-3000', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (30, 7, 1, 5, 3, 3, N'1001-2000', 4500, 405, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (30, 10, 5, 5, 3, 3, N'1-1000', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (31, 11, 5, 5, 3, 2, N'1-1200', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (31, 9, 1, 5, 3, 2, N'1201-2000', 4500, 450, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (32, 14, 5, 13, 8, 2, N'1-1000', 450, 45, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (33, 16, 5, 13, 8, 1, N'1-1800', 450, 36, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (33, 9, 7, 13, 8, 1, N'1801-3000', 2250, 180, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (34, 4, 2, 13, 8, 3, N'1001-2000', 450, 40, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (34, 15, 3, 13, 8, 3, N'1-1000', 1350, 122, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (35, 11, 5, 13, 8, 3, N'1-1000', 450, 40, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (36, 13, 5, 14, 8, 2, N'1101-2000', 1000, 100, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (36, 1, 5, 14, 8, 2, N'1-1100', 1000, 100, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (37, 8, 1, 14, 8, 4, N'1-1800', 1500, 105, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (37, 14, 5, 14, 8, 4, N'1801-3000', 1000, 70, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (37, 6, 1, 14, 8, 4, N'3001-4000', 1500, 105, 1000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (38, 15, 2, 15, 8, 3, N'1-1700', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (38, 18, 5, 15, 8, 3, N'1701-3600', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (38, 20, 4, 15, 8, 3, N'3601-4000', 9000, 810, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (39, 17, 5, 15, 8, 3, N'1-2500', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (39, 19, 5, 15, 8, 3, N'2501-4000', 3000, 270, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (39, 8, 1, 15, 8, 3, N'4001-4500', 4500, 405, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (40, 20, 8, 15, 8, 2, N'1-500', 4500, 450, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (41, 11, 5, 16, 8, 2, N'1-1700', 500, 50, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (41, 3, 5, 16, 8, 2, N'1701-3000', 500, 50, 500)
GO
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (42, 13, 5, 16, 8, 3, N'1-1200', 500, 45, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (42, 9, 1, 16, 8, 3, N'1201-3400', 750, 68, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (42, 2, 5, 16, 8, 3, N'3401-4000', 500, 45, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (43, 8, 1, 16, 8, 1, N'1-500', 750, 60, 500)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (44, 5, 6, 17, 8, 1, N'1-1300', 1350, 108, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (44, 14, 5, 17, 8, 1, N'1301-3200', 450, 36, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (44, 19, 5, 17, 8, 1, N'3201-5000', 450, 36, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (45, 13, 5, 17, 8, 4, N'1-1400', 450, 32, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (45, 14, 5, 17, 8, 4, N'1401-3000', 450, 32, 450)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (46, 12, 5, 18, 8, 4, N'1-900', 300, 21, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (46, 13, 5, 18, 8, 4, N'901-2000', 300, 21, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (47, 17, 5, 18, 8, 2, N'1101-2000', 300, 30, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (47, 6, 1, 18, 8, 2, N'1-1100', 450, 45, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (48, 5, 6, 18, 8, 1, N'1501-2000', 900, 72, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (48, 15, 2, 18, 8, 1, N'1-800', 300, 24, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (48, 14, 5, 18, 8, 1, N'801-1500', 300, 24, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (49, 4, 6, 18, 8, 3, N'1-1500', 900, 81, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (49, 3, 5, 18, 8, 3, N'1501-2000', 300, 27, 300)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (50, 17, 5, 19, 8, 2, N'1801-3000', 750, 75, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (50, 18, 5, 19, 8, 2, N'1-900', 750, 75, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (50, 19, 5, 19, 8, 2, N'901-1800', 750, 75, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (51, 9, 7, 19, 8, 4, N'1-1400', 3750, 262, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (51, 11, 5, 19, 8, 4, N'1401-2200', 750, 53, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (51, 12, 5, 19, 8, 4, N'2201-3000', 750, 53, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (52, 5, 6, 19, 8, 3, N'1-500', 2250, 202, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (53, 4, 2, 20, 1, 2, N'1101-2000', 1800, 180, 1800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (53, 19, 5, 20, 1, 2, N'1-1100', 1800, 180, 1800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (54, 18, 5, 20, 1, 3, N'1-800', 1800, 162, 1800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (54, 17, 5, 20, 1, 3, N'801-2000', 1800, 162, 1800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (55, 4, 5, 20, 1, 2, N'1-1000', 1800, 180, 1800)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (56, 8, 1, 21, 1, 3, N'1-1600', 3900, 351, 2600)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (56, 7, 1, 21, 1, 3, N'1601-2500', 3900, 351, 2600)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (56, 1, 5, 21, 1, 3, N'2501-3000', 2600, 234, 2600)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (57, 2, 6, 21, 1, 2, N'1-1400', 7800, 780, 2600)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (57, 3, 5, 21, 1, 2, N'1401-2000', 2600, 260, 2600)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (58, 4, 2, 21, 1, 2, N'1-500', 2600, 260, 2600)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (58, 6, 1, 21, 1, 2, N'1801-2000', 3900, 390, 2600)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (58, 5, 2, 21, 1, 2, N'501-1800', 2600, 260, 2600)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (59, 8, 1, 22, 1, 4, N'1001-1800', 3600, 252, 2400)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (59, 7, 1, 22, 1, 4, N'1-1000', 3600, 252, 2400)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (59, 9, 1, 22, 1, 4, N'1801-2500', 3600, 252, 2400)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (60, 10, 5, 22, 1, 3, N'1-1500', 2400, 216, 2400)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (60, 11, 5, 22, 1, 3, N'1501-2200', 2400, 216, 2400)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (60, 12, 5, 22, 1, 3, N'2201-3500', 2400, 216, 2400)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (60, 13, 5, 22, 1, 3, N'3501-4500', 2400, 216, 2400)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (61, 16, 5, 5, 1, 2, N'1401-2200', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (61, 14, 5, 5, 1, 2, N'1-800', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (61, 17, 5, 5, 1, 2, N'2201-3300', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (61, 18, 5, 5, 1, 2, N'3301-4000', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (61, 15, 2, 5, 1, 2, N'801-1400', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (62, 20, 8, 5, 1, 2, N'1101-3000', 4500, 450, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (62, 19, 2, 5, 1, 2, N'1-1100', 3000, 300, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (63, 1, 5, 5, 1, 1, N'1-1000', 3000, 240, 3000)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (64, 4, 5, 24, 6, 4, N'1401-2000', 750, 53, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (64, 2, 5, 24, 6, 4, N'1-900', 750, 53, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (64, 3, 5, 24, 6, 4, N'901-1400', 750, 53, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (65, 20, 8, 24, 6, 2, N'1-1500', 1125, 113, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (66, 19, 5, 24, 6, 3, N'1-1500', 750, 68, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (66, 18, 5, 24, 6, 3, N'1501-2500', 750, 68, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (67, 17, 5, 24, 6, 1, N'1-500', 750, 60, 750)
INSERT [dbo].[ShipmentDetail] ([ShipmentId], [Item], [ContainertypeId], [RouteId], [ShipId], [ConsignorId], [ContainerNr], [Costs], [Discount], [Distance]) VALUES (67, 16, 5, 24, 6, 1, N'501-1000', 750, 60, 750)
ALTER TABLE [dbo].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_Journey_D_Port] FOREIGN KEY([CurrentPortId])
REFERENCES [dbo].[D_Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Journey] CHECK CONSTRAINT [FK_Journey_D_Port]
GO
ALTER TABLE [dbo].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_Journey_D_Ship] FOREIGN KEY([ShipId])
REFERENCES [dbo].[D_Ship] ([VS_Shipid])
GO
ALTER TABLE [dbo].[Journey] CHECK CONSTRAINT [FK_Journey_D_Ship]
GO
ALTER TABLE [dbo].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_Journey_Route] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Route] ([RouteId])
GO
ALTER TABLE [dbo].[Journey] CHECK CONSTRAINT [FK_Journey_Route]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_D_Consignor] FOREIGN KEY([ConsignorId])
REFERENCES [dbo].[D_Consignor] ([Id])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_D_Consignor]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_D_Container] FOREIGN KEY([ContainertypeId])
REFERENCES [dbo].[D_Container] ([Id])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_D_Container]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_D_Item] FOREIGN KEY([Item])
REFERENCES [dbo].[D_Item] ([item_key])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_D_Item]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_D_Ship] FOREIGN KEY([ShipId])
REFERENCES [dbo].[D_Ship] ([VS_Shipid])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_D_Ship]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Route] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Route] ([RouteId])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Route]
GO
USE [master]
GO
ALTER DATABASE [PSAKramse] SET  READ_WRITE 
GO
