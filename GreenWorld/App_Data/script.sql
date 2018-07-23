USE [master]
GO
/****** Object:  Database [Shikhai]    Script Date: 7/19/2018 2:08:34 AM ******/
CREATE DATABASE [Shikhai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shikhai', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Shikhai.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shikhai_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Shikhai_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Shikhai] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shikhai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shikhai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shikhai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shikhai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shikhai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shikhai] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shikhai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shikhai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shikhai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shikhai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shikhai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shikhai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shikhai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shikhai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shikhai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shikhai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shikhai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shikhai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shikhai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shikhai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shikhai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shikhai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shikhai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shikhai] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shikhai] SET  MULTI_USER 
GO
ALTER DATABASE [Shikhai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shikhai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shikhai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shikhai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shikhai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shikhai] SET QUERY_STORE = OFF
GO
USE [Shikhai]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Shikhai]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[IsFakeEmail] [bit] NULL,
	[TeacherName] [nvarchar](256) NULL,
	[HospitalName] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerImageTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerImageTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](256) NULL,
	[ImagePath] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[DisplayOrder] [int] NULL,
	[MerchantId] [int] NULL,
	[CategoryId] [int] NULL,
	[BannerGuidId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BannerImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[Published] [bit] NULL,
	[GuidId] [uniqueidentifier] NOT NULL,
	[IsHomePageBanner] [bit] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_English] [nvarchar](256) NULL,
	[Name_Bangla] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[ImagePath] [nvarchar](256) NULL,
	[Parent1Id] [int] NULL,
	[ShowOnHomePage] [bit] NULL,
	[IncludeInTopMenu] [bit] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[Published] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSearchTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSearchTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Keyword] [nvarchar](512) NULL,
	[IpAddress] [nvarchar](128) NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_CustomerSearch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeoZoneTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoZoneTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Description] [nvarchar](max) NULL,
	[DateAdded] [int] NULL,
	[DateModified] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExceptionMessage] [nvarchar](3050) NULL,
	[ExceptionStackTrace] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](256) NULL,
	[IpAddress] [nvarchar](256) NULL,
	[Browser] [nvarchar](3050) NULL,
	[OS] [nvarchar](256) NULL,
	[UserId] [uniqueidentifier] NULL,
	[ActionName] [nvarchar](256) NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_LogTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewspaperTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewspaperTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsGuidId] [uniqueidentifier] NULL,
	[NewspaperName] [nvarchar](255) NULL,
	[AdLocation] [nvarchar](127) NULL,
	[PriceDescription] [int] NULL,
	[AdvertiserName] [nvarchar](255) NULL,
	[AdvertiserAddress] [nvarchar](255) NULL,
	[AdvertiserMobile] [nvarchar](20) NULL,
	[AdvertiserEmail] [nvarchar](100) NULL,
	[DateofPublication] [datetime2](7) NULL,
	[ColumnSize] [int] NULL,
	[Inch] [int] NULL,
	[TotalColumnInch] [int] NULL,
	[TotalPrice] [int] NULL,
	[AdCategoryId] [nvarchar](20) NULL,
	[Description] [nvarchar](4000) NULL,
	[Comments] [nvarchar](255) NULL,
	[MainImagePath] [nvarchar](255) NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_NewspaperTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPaymentMethodTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPaymentMethodTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Instructions] [nvarchar](max) NULL,
	[InstructionsImageUrl] [nvarchar](256) NULL,
	[Published] [bit] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPaymentStatusTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPaymentStatusTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DefaultStatus] [bit] NULL,
 CONSTRAINT [PK_OrderPaymentStatusTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentGuidId] [uniqueidentifier] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[OrderId] [int] NULL,
	[PaymentChannel] [nvarchar](255) NULL,
	[PaymentMobile] [nvarchar](20) NULL,
	[PaymentTrxId] [nvarchar](20) NULL,
	[PaymentAmount] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_PaymentTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsBook] [bit] NULL,
	[IsStationary] [bit] NULL,
	[InstructionsImageUrl] [nvarchar](1000) NULL,
	[Published] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_ProductTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GuidId] [nvarchar](100) NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[RegistrationNo] [int] NULL,
	[RegistrationType] [nvarchar](15) NULL,
	[ClinicHospitalName] [nvarchar](150) NULL,
	[Designation] [nvarchar](150) NOT NULL,
	[YearOfExperience] [decimal](18, 0) NULL,
	[WorkingArea] [nvarchar](500) NULL,
	[Addresss] [nvarchar](150) NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[CanVisitDays] [nvarchar](20) NOT NULL,
	[VisitTimeStart] [time](7) NOT NULL,
	[VisitTimeEnd] [time](7) NOT NULL,
	[SlotDuration] [int] NOT NULL,
	[VisitFee] [int] NULL,
	[VisitingCard] [nvarchar](150) NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_DoctorTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTbl]    Script Date: 7/19/2018 2:08:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](128) NULL,
	[LastName] [nvarchar](128) NULL,
	[Company] [nvarchar](128) NULL,
	[NoOfVisits] [int] NULL,
	[LastLoginDateUtc] [datetime2](7) NULL,
	[LastLoginIP] [nvarchar](128) NULL,
	[FailedLoginAttempts] [int] NULL,
	[CannotLoginUntilDateUtc] [datetime2](7) NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/19/2018 2:08:35 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/19/2018 2:08:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/19/2018 2:08:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 7/19/2018 2:08:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/19/2018 2:08:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/19/2018 2:08:35 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BannerImageTbl] ADD  CONSTRAINT [DF_BannerImageTbl_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[BannerImageTbl] ADD  CONSTRAINT [DF_BannerImageTbl_MerchantId]  DEFAULT ((0)) FOR [MerchantId]
GO
ALTER TABLE [dbo].[BannerImageTbl] ADD  CONSTRAINT [DF_BannerImageTbl_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[CategoryTbl] ADD  CONSTRAINT [DF_CategoryTbl_Parent1Id]  DEFAULT ((0)) FOR [Parent1Id]
GO
ALTER TABLE [dbo].[CustomerSearchTbl] ADD  CONSTRAINT [DF_CustomerSearchTbl_UserId]  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[OrderPaymentStatusTbl] ADD  CONSTRAINT [DF_OrderPaymentStatusTbl_DefaultStatus]  DEFAULT ((0)) FOR [DefaultStatus]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [Shikhai] SET  READ_WRITE 
GO
