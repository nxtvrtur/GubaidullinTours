USE [master]
GO
/****** Object:  Database [GubaidullinTours]    Script Date: 17.09.2023 17:19:50 ******/
CREATE DATABASE [GubaidullinTours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GubaidullinTours', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GubaidullinTours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GubaidullinTours_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GubaidullinTours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GubaidullinTours] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GubaidullinTours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GubaidullinTours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GubaidullinTours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GubaidullinTours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GubaidullinTours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GubaidullinTours] SET ARITHABORT OFF 
GO
ALTER DATABASE [GubaidullinTours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GubaidullinTours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GubaidullinTours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GubaidullinTours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GubaidullinTours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GubaidullinTours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GubaidullinTours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GubaidullinTours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GubaidullinTours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GubaidullinTours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GubaidullinTours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GubaidullinTours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GubaidullinTours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GubaidullinTours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GubaidullinTours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GubaidullinTours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GubaidullinTours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GubaidullinTours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GubaidullinTours] SET  MULTI_USER 
GO
ALTER DATABASE [GubaidullinTours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GubaidullinTours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GubaidullinTours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GubaidullinTours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GubaidullinTours] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GubaidullinTours] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GubaidullinTours] SET QUERY_STORE = OFF
GO
USE [GubaidullinTours]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 17.09.2023 17:19:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 17.09.2023 17:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 17.09.2023 17:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[CreationDate] [date] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 17.09.2023 17:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotellOfTour]    Script Date: 17.09.2023 17:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotellOfTour](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_HotellOfTour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 17.09.2023 17:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 17.09.2023 17:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 17.09.2023 17:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AB', N'Абхазия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AI', N'Англия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BG', N'Болгария')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DE', N'Германия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EG', N'Египет')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GE', N'Грузия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IL', N'Израиль')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RU', N'Россия')
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (5, N'Тип 5', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotellOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotellOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotellOfTour] CHECK CONSTRAINT [FK_HotellOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotellOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotellOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[HotellOfTour] CHECK CONSTRAINT [FK_HotellOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [GubaidullinTours] SET  READ_WRITE 
GO
