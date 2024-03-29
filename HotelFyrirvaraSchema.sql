USE [master]
GO

if exists (select * from sys.databases where name = N'HotelFyrirvara')
begin
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'HotelFyrirvara';
	ALTER DATABASE HotelFyrirvara SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE HotelFyrirvara;
end

CREATE DATABASE HotelFyrirvara
GO
--/****** Object:  Database [HotelFyrirvara]    Script Date: 2/26/2019 6:00:47 PM ******/
--CREATE DATABASE [HotelFyrirvara]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'HotelFyrirvara', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HotelFyrirvara.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'HotelFyrirvara_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HotelFyrirvara_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
--GO
--ALTER DATABASE [HotelFyrirvara] SET COMPATIBILITY_LEVEL = 140
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [HotelFyrirvara].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [HotelFyrirvara] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET AUTO_CLOSE OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [HotelFyrirvara] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [HotelFyrirvara] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET  ENABLE_BROKER 
--GO
--ALTER DATABASE [HotelFyrirvara] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [HotelFyrirvara] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET RECOVERY FULL 
--GO
--ALTER DATABASE [HotelFyrirvara] SET  MULTI_USER 
--GO
--ALTER DATABASE [HotelFyrirvara] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [HotelFyrirvara] SET DB_CHAINING OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [HotelFyrirvara] SET TARGET_RECOVERY_TIME = 60 SECONDS 
--GO
--ALTER DATABASE [HotelFyrirvara] SET DELAYED_DURABILITY = DISABLED 
--GO
--EXEC sys.sp_db_vardecimal_storage_format N'HotelFyrirvara', N'ON'
--GO
--ALTER DATABASE [HotelFyrirvara] SET QUERY_STORE = OFF
--GO
USE [HotelFyrirvara]
GO
/****** Object:  Table [dbo].[AddOn]    Script Date: 2/26/2019 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddOn](
	[AddOnId] [int] IDENTITY(1,1) NOT NULL,
	[RoomService] [varchar](35) NULL,
	[Movie] [varchar](25) NULL,
	[Snacks] [varchar](100) NULL,
	[Price] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddOnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[AmenityId] [int] IDENTITY(1,1) NOT NULL,
	[BathType] [varchar](30) NOT NULL,
	[Minibar] [varchar](30) NULL,
	[ClosetType] [varchar](30) NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AmenityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[BillingId] [int] IDENTITY(1,1) NOT NULL,
	[Tax] [decimal](18, 0) NULL,
	[AddOnId] [int] NULL,
	[ReservationId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](35) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[HoldCard] [bit] NULL,
	[Age] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionCode]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionCode](
	[PromotionCodeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[isValidStart] [date] NOT NULL,
	[isValidEnd] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[ColdSeason] [bit] NOT NULL,
	[WarmSeason] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [int] IDENTITY(100,1) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[AllGuests] [int] NULL,
	[PromotionCode] [bit] NULL,
	[PromotionCodeId] [int] NULL,
	[AddOnId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationAddOn]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationAddOn](
	[ReservationId] [int] NOT NULL,
	[AddOnId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationGuest]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationGuest](
	[GuestId] [int] NOT NULL,
	[ReservationId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[RoomFloor] [int] NOT NULL,
	[Limit] [int] NULL,
	[RoomTypeId] [int] NOT NULL,
	[Reserved] [bit] NOT NULL,
	[RateId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomAmenity]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAmenity](
	[RoomId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomReservation]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomReservation](
	[RoomId] [int] NOT NULL,
	[ReservationId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RoomType] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Guest] ADD  DEFAULT ((1)) FOR [HoldCard]
GO
ALTER TABLE [dbo].[Rate] ADD  DEFAULT ((0)) FOR [ColdSeason]
GO
ALTER TABLE [dbo].[Rate] ADD  DEFAULT ((1)) FOR [WarmSeason]
GO
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT ((0)) FOR [PromotionCode]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [Reserved]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [fk_billing_reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [fk_billing_reservation]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [fk_reservation_promotionCode] FOREIGN KEY([PromotionCodeId])
REFERENCES [dbo].[PromotionCode] ([PromotionCodeId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [fk_reservation_promotionCode]
GO
ALTER TABLE [dbo].[ReservationAddOn]  WITH CHECK ADD  CONSTRAINT [FK_ReservationAddOn_AddOn] FOREIGN KEY([AddOnId])
REFERENCES [dbo].[AddOn] ([AddOnId])
GO
ALTER TABLE [dbo].[ReservationAddOn] CHECK CONSTRAINT [FK_ReservationAddOn_AddOn]
GO
ALTER TABLE [dbo].[ReservationAddOn]  WITH CHECK ADD  CONSTRAINT [FK_ReservationAddOn_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[ReservationAddOn] CHECK CONSTRAINT [FK_ReservationAddOn_Reservation]
GO
ALTER TABLE [dbo].[ReservationGuest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationGuest_Guest] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([GuestId])
GO
ALTER TABLE [dbo].[ReservationGuest] CHECK CONSTRAINT [FK_ReservationGuest_Guest]
GO
ALTER TABLE [dbo].[ReservationGuest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationGuest_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[ReservationGuest] CHECK CONSTRAINT [FK_ReservationGuest_Reservation]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [fk_room_rate] FOREIGN KEY([RateId])
REFERENCES [dbo].[Rate] ([RateId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_room_rate]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [fk_room_roomType] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomType] ([RoomTypeId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_room_roomType]
GO
ALTER TABLE [dbo].[RoomAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenity_Amenity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([AmenityId])
GO
ALTER TABLE [dbo].[RoomAmenity] CHECK CONSTRAINT [FK_RoomAmenity_Amenity]
GO
ALTER TABLE [dbo].[RoomAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenity_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[RoomAmenity] CHECK CONSTRAINT [FK_RoomAmenity_Room]
GO
ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomReservation_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK_RoomReservation_Reservation]
GO
ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomReservation_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK_RoomReservation_Room]
GO
USE [master]
GO
ALTER DATABASE [HotelFyrirvara] SET  READ_WRITE 
GO
