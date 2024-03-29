﻿
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[BannerImageTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[BannerTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[CategoryTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[CustomerSearchTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[GeoZoneTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[LogTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[NewspaperTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[OrderPaymentMethodTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[OrderPaymentStatusTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[PaymentTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[ProductTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[TeacherTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
/****** Object:  Table [dbo].[TestimonialTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestimonialTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](255) NULL,
	[Description] [nvarchar](1000) NULL,
	[PersonName] [nvarchar](255) NOT NULL,
	[PersonTitle] [nvarchar](255) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[Published] [bit] NULL,
 CONSTRAINT [PK_TestimonialTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UniversityTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UniversityTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](256) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[Published] [bit] NULL,
 CONSTRAINT [PK_UniversityTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTbl]    Script Date: 8/6/2018 12:23:27 PM ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'034c549d-9e78-4037-97d1-07d5c08b2d16', N'Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ddc2287a-910a-4272-8033-58df34cca189', N'Student')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'335552a1-7023-4e25-89a7-95acb6314ffb', N'Teacher')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'372a0721-a924-48d6-b72d-fd557424fcd3', N'335552a1-7023-4e25-89a7-95acb6314ffb')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3a86da90-854f-4f47-8142-a905017f6809', N'335552a1-7023-4e25-89a7-95acb6314ffb')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'78fdcf28-b8ce-45c8-a654-f6eb7c143931', N'335552a1-7023-4e25-89a7-95acb6314ffb')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'92ad0151-cb43-465c-80c5-77a5e3fe5432', N'335552a1-7023-4e25-89a7-95acb6314ffb')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ac55f20a-87af-49d4-89da-ca617bda750d', N'335552a1-7023-4e25-89a7-95acb6314ffb')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c76c5ba2-d1b0-49e7-afb0-8ae21b287b0c', N'034c549d-9e78-4037-97d1-07d5c08b2d16')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fb358602-a98c-4c79-82ee-e9bca3d9cd7d', N'335552a1-7023-4e25-89a7-95acb6314ffb')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'07c8a005-1458-4545-bec5-52332a348edc', N'ranahamid00ss7654@gmail.com', 0, N'AN0DSHsH3P9oQATxwGV2972knsD+MUHZls92qDm7SETbGR+U+jwkQjDGRBxp7OlGeA==', N'f9f0dfb0-57df-4cda-886d-beeda720c033', N'123456123456', 0, 0, NULL, 1, 0, N'123456123456', NULL, NULL, 0, N'123456123456', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'372a0721-a924-48d6-b72d-fd557424fcd3', N'ranahamid007a@gmail.com', 0, N'AOqe+FEnYvNBfMxRqQ/iCo5jRPNPtzU2GHAH1Gf5QSeRmEyh3FcwfzFnSCi1UaGPdg==', N'd8cf17a9-a2df-4f1b-a847-16c108392956', N'12345612345622', 0, 0, NULL, 1, 0, N'12345612345622', NULL, NULL, 0, N'Pobon mama 2', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'3a86da90-854f-4f47-8142-a905017f6809', N'ranahasdfm3id02340ss7654@gmail.com', 0, N'AII7O8aEDg2Mib3a9M+mEXYt4dvosxmVLr8ziCMQM4Qfv8Q6F6Vlilc/TLYgOcDehw==', N'8bf2dd01-73a7-4fdc-a473-6f52a92dfaa6', N'44444', 0, 0, NULL, 1, 0, N'44444', NULL, NULL, 0, N'1234561233sdf4564', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'78fdcf28-b8ce-45c8-a654-f6eb7c143931', N'wer7@gmail.com', 0, N'AL+qh1GOdUmu4CPxIMFqxOBMwcIxdJqZzn7PNEHrqKDXV4DVRS4jIF6g2fzEMA8b5A==', N'319d91ba-a779-4f77-9ecc-ae8a686deaa9', N'5464', 0, 0, NULL, 1, 0, N'5464', NULL, NULL, 0, N'123456123456', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'86030355-6206-4c71-8e17-03abcad793a4', N'ranahamid007654@gmail.com', 0, N'ABIdYxYDJ5FE4gFZv2u+XxkyzKvcPzkxlTL6xxNwRpPAJ2v5cD971D9ruvKpOIcyIQ==', N'c84bed42-a9f9-457d-8987-46ba2b0792ce', N'123456', 0, 0, NULL, 1, 0, N'123456', NULL, NULL, 0, N'rana hamid ##', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'92ad0151-cb43-465c-80c5-77a5e3fe5432', N'ranahamid02340ss7654@gmail.com', 0, N'ABa6X6NWc0iv7/PNGlq28DffY9hMTLDg7WdCjCK7ap3egiO022wqiO4inCvtW+ieCA==', N'a154a83a-e236-4164-b1af-273683b67c35', N'11', 0, 0, NULL, 1, 0, N'11', NULL, NULL, 0, N'1234561234564', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'ac55f20a-87af-49d4-89da-ca617bda750d', N'sid02342307@gmail.com', 0, N'AHdwSs+UiNQ30gWJLXfcw6WTowInhRXJiEfvVSaMNMcn5bk3Al/CgGmDGVLwJCjHTQ==', N'50fd8821-dd3c-4172-ba3e-2b6d28591da8', N'244', 0, 0, NULL, 1, 0, N'244', NULL, NULL, 0, N'Pobon mama', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'c76c5ba2-d1b0-49e7-afb0-8ae21b287b0c', N'ranahamid007@gmail.com', 0, N'AFK49j3/ssoLmie6eOUvWUzqj0oQ3EVeeKR4kEORxKMzjngvYNi8s5+ityTfICF4lw==', N'47ea9242-046b-4e0e-aba2-b45529aaef5d', N'12345612345622', 1, 0, NULL, 0, 0, N'01717623876', NULL, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'd17bf3f1-47a7-4bdb-a6cf-3ef35f144df0', N'ranahamid00723@gmail.com', 0, N'AM3JPAnKwDgn+A7V4lf6vQmL2Cpg5VEnc4882piwU7QO9U6zUtUXYuAA/OvNYAiEvw==', N'32321af5-e754-4713-8dec-f259189e11be', N'3243242', 0, 0, NULL, 1, 0, N'3243242', N'HomeBanner- Shikhai', N'1', 0, N'2', N'234 432  ', N'324 ')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [TeacherName], [HospitalName], [Description]) VALUES (N'fb358602-a98c-4c79-82ee-e9bca3d9cd7d', N'ranahamid02342307@gmail.com', 0, N'AH2tqkfnRuPjqMG31xQ6KVSwEzwszyU+djoXS24bRlYMcQ7QiDOBMUzNXY1iUkBFwQ==', N'e4ca4288-f1e7-456e-a4c6-309f4f618700', N'12345612345623423', 0, 0, NULL, 1, 0, N'12345612345623423', NULL, NULL, 0, N'123456124234564', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[BannerImageTbl] ON 
GO
INSERT [dbo].[BannerImageTbl] ([Id], [URL], [ImagePath], [Description], [DisplayOrder], [MerchantId], [CategoryId], [BannerGuidId]) VALUES (4, NULL, N'Content/images/banners/14608323/36295929_1732838343465866_1794011082239508480_n.jpg', NULL, 1, NULL, NULL, N'e098791f-802c-4a17-89ae-aed889e6b9ad')
GO
INSERT [dbo].[BannerImageTbl] ([Id], [URL], [ImagePath], [Description], [DisplayOrder], [MerchantId], [CategoryId], [BannerGuidId]) VALUES (5, NULL, N'Content/images/banners/62905612/36295929_1732838343465866_1794011082239508480_n.jpg', NULL, 1, NULL, NULL, N'56d3f1e2-f453-4af7-a7b4-60f0dcc78880')
GO
INSERT [dbo].[BannerImageTbl] ([Id], [URL], [ImagePath], [Description], [DisplayOrder], [MerchantId], [CategoryId], [BannerGuidId]) VALUES (2006, NULL, N'Content/images/banners/49934403/WLKNL-964x335-b_20170308094203.jpg', NULL, 1, NULL, NULL, N'f4997479-122d-4664-85e4-dbc27622a696')
GO
INSERT [dbo].[BannerImageTbl] ([Id], [URL], [ImagePath], [Description], [DisplayOrder], [MerchantId], [CategoryId], [BannerGuidId]) VALUES (2007, NULL, N'Content/images/banners/14089781/Overseas-Teacher-Banner_banner.jpg', NULL, 1, NULL, NULL, N'f4997479-122d-4664-85e4-dbc27622a696')
GO
INSERT [dbo].[BannerImageTbl] ([Id], [URL], [ImagePath], [Description], [DisplayOrder], [MerchantId], [CategoryId], [BannerGuidId]) VALUES (2008, NULL, N'Content/images/banners/94490826/improvedlearning_banner.jpg', NULL, 1, NULL, NULL, N'f4997479-122d-4664-85e4-dbc27622a696')
GO
INSERT [dbo].[BannerImageTbl] ([Id], [URL], [ImagePath], [Description], [DisplayOrder], [MerchantId], [CategoryId], [BannerGuidId]) VALUES (2009, NULL, N'Content/images/banners/58646203/cropped-teaching-online-banner.jpg', NULL, 1, NULL, NULL, N'f4997479-122d-4664-85e4-dbc27622a696')
GO
SET IDENTITY_INSERT [dbo].[BannerImageTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[BannerTbl] ON 
GO
INSERT [dbo].[BannerTbl] ([Id], [Name], [CreatedOnUtc], [UpdatedOnUtc], [Published], [GuidId], [IsHomePageBanner]) VALUES (2002, N'Sikhahi- Banner 1', CAST(N'2018-07-15T12:34:20.9708913' AS DateTime2), CAST(N'2018-07-15T12:34:40.3922149' AS DateTime2), 1, N'f4997479-122d-4664-85e4-dbc27622a696', 1)
GO
SET IDENTITY_INSERT [dbo].[BannerTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryTbl] ON 
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (1, N'English Medium', NULL, NULL, 2, N'Content/images/categories/50490861/download.png', NULL, NULL, NULL, CAST(N'2018-07-15T12:42:29.9507793' AS DateTime2), CAST(N'2018-07-22T22:35:34.6818961' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (2, N'Language', NULL, NULL, 3, N'Content/images/categories/69549959/jezici.jpg', NULL, 1, NULL, CAST(N'2018-07-15T12:43:21.9446364' AS DateTime2), CAST(N'2018-07-22T22:35:37.9197533' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (3, N'Music', NULL, NULL, 4, N'Content/images/categories/47283227/music.png', NULL, 1, NULL, CAST(N'2018-07-15T12:44:08.9820755' AS DateTime2), CAST(N'2018-07-22T22:35:43.0303756' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (4, N'Performing Arts', NULL, NULL, 5, N'Content/images/categories/46731577/isc-3-theatre-ronsombilonphotography-2-web_0.jpg', NULL, NULL, NULL, CAST(N'2018-07-15T12:45:16.4059630' AS DateTime2), CAST(N'2018-07-22T22:35:49.7898537' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (5, N'Math', NULL, NULL, NULL, N'Content/images/categories/9819947/Math-Ed-Banner.jpg', 1, 1, 1, CAST(N'2018-07-15T12:49:28.8033758' AS DateTime2), CAST(N'2018-07-15T12:49:28.8033758' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (6, N'Algebra', NULL, NULL, NULL, N'Content/images/categories/1453152/Algebra.png', 1, 1, NULL, CAST(N'2018-07-15T12:50:53.0489648' AS DateTime2), CAST(N'2018-07-22T18:37:12.0209647' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (7, N'Reading', NULL, NULL, NULL, N'Content/images/categories/46080862/3-white-figures-reading.jpg', 1, 1, NULL, CAST(N'2018-07-15T12:51:43.6195838' AS DateTime2), CAST(N'2018-07-22T18:36:14.7325984' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (8, N'chemistry', NULL, NULL, NULL, N'Content/images/categories/21123658/Physical-Chemistry-03.jpg', 1, 1, NULL, CAST(N'2018-07-15T12:52:50.7854284' AS DateTime2), CAST(N'2018-07-22T18:37:02.7155459' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (9, N'English', NULL, NULL, NULL, N'Content/images/categories/54796269/learn-english-at-marbella-international-spanish-school-marbella.jpg', 2, 1, NULL, CAST(N'2018-07-15T12:54:16.1638982' AS DateTime2), CAST(N'2018-07-22T18:36:51.3218998' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (10, N'Arabic', NULL, NULL, NULL, N'Content/images/categories/79062857/arabic.jpg', 2, 1, NULL, CAST(N'2018-07-15T12:55:14.7661861' AS DateTime2), CAST(N'2018-07-22T18:37:07.3908017' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (11, N'Korean', NULL, NULL, NULL, N'Content/images/categories/93412275/Koren-images.jpg', 2, 1, NULL, CAST(N'2018-07-15T12:56:05.1872427' AS DateTime2), CAST(N'2018-07-22T18:36:40.2267523' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (12, N'Piano', NULL, NULL, NULL, N'Content/images/categories/27022962/86488540.jpg', 3, 1, NULL, CAST(N'2018-07-15T12:56:54.6635739' AS DateTime2), CAST(N'2018-07-22T18:36:20.2929418' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (13, N'Singing', NULL, NULL, NULL, N'Content/images/categories/3109201/hqdefault.jpg', 3, 1, NULL, CAST(N'2018-07-15T12:57:31.5956602' AS DateTime2), CAST(N'2018-07-22T18:37:23.1561171' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (14, N'Guitar', NULL, NULL, NULL, N'Content/images/categories/55706158/Learn-To-Play-Guitar-624x416.jpg', 3, 1, NULL, CAST(N'2018-07-15T12:58:31.2148240' AS DateTime2), CAST(N'2018-07-22T18:36:45.8045618' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (15, N'Acting', NULL, NULL, NULL, N'Content/images/categories/92476413/Scene_Clapper_alt.jpg', 4, 1, NULL, CAST(N'2018-07-15T12:59:10.6676790' AS DateTime2), CAST(N'2018-07-22T18:37:17.9812664' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (16, N'Dance', NULL, NULL, NULL, N'Content/images/categories/75818324/Tanias-Dancer-Rev.png', 4, 1, NULL, CAST(N'2018-07-15T13:00:09.8894275' AS DateTime2), CAST(N'2018-07-22T18:36:57.3501845' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (1002, N'বাংলা মিডিয়াম', NULL, NULL, 1, N'', NULL, 1, NULL, CAST(N'2018-07-22T18:48:28.9449957' AS DateTime2), CAST(N'2018-07-22T22:35:29.0709224' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (1003, N'গণিত', NULL, NULL, NULL, N'', 1002, 1, NULL, CAST(N'2018-07-22T18:48:57.5559404' AS DateTime2), CAST(N'2018-07-22T18:48:57.5559404' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (1004, N'বাংলা', NULL, NULL, NULL, N'', 1002, 1, NULL, CAST(N'2018-07-22T18:49:30.2750269' AS DateTime2), CAST(N'2018-07-22T18:49:30.2750269' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (1005, N'ইসলাম শিক্ষা', NULL, NULL, NULL, N'', 1002, 1, NULL, CAST(N'2018-07-22T18:50:01.6449008' AS DateTime2), CAST(N'2018-07-22T18:50:01.6449008' AS DateTime2), 1)
GO
INSERT [dbo].[CategoryTbl] ([Id], [Name_English], [Name_Bangla], [Description], [DisplayOrder], [ImagePath], [Parent1Id], [ShowOnHomePage], [IncludeInTopMenu], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (1006, N'সাধারণ বিজ্ঞান', NULL, NULL, NULL, N'', 1002, 1, NULL, CAST(N'2018-07-22T18:50:18.0892755' AS DateTime2), CAST(N'2018-07-22T18:50:18.0892755' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[CategoryTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[LogTbl] ON 
GO
INSERT [dbo].[LogTbl] ([Id], [ExceptionMessage], [ExceptionStackTrace], [ControllerName], [IpAddress], [Browser], [OS], [UserId], [ActionName], [CreatedOnUtc]) VALUES (20185, N'c:\Users\Rana Hamid\AppData\Local\Temp\Temporary ASP.NET Files\vs\1ddf306a\3ba4d60d\App_Web__testimonial.cshtml.62bc836f.gmfbai7n.0.cs(30): error CS0246: The type or namespace name ''Shikhai'' could not be found (are you missing a using directive or an assembly reference?)', N'   at System.Web.Compilation.BuildManager.PostProcessFoundBuildResult(BuildResult result, Boolean keyFromVPP, VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetBuildResultFromCacheInternal(String cacheKey, Boolean keyFromVPP, VirtualPath virtualPath, Int64 hashCode, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultFromCacheInternal(VirtualPath virtualPath, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', N'Catalog', N'127.0.0.1', N'Chrome 67.0, 3.0', N'WinNT', N'00000000-0000-0000-0000-000000000000', N'Testimonial', CAST(N'2018-08-06T02:42:43.0102195' AS DateTime2))
GO
INSERT [dbo].[LogTbl] ([Id], [ExceptionMessage], [ExceptionStackTrace], [ControllerName], [IpAddress], [Browser], [OS], [UserId], [ActionName], [CreatedOnUtc]) VALUES (20186, N'c:\Users\Rana Hamid\AppData\Local\Temp\Temporary ASP.NET Files\vs\1ddf306a\3ba4d60d\App_Web__testimonial.cshtml.62bc836f.64uvjolq.0.cs(30): error CS0246: The type or namespace name ''Shikhai'' could not be found (are you missing a using directive or an assembly reference?)', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', N'Catalog', N'127.0.0.1', N'Chrome 67.0, 3.0', N'WinNT', N'00000000-0000-0000-0000-000000000000', N'Testimonial', CAST(N'2018-08-06T02:44:16.9882197' AS DateTime2))
GO
INSERT [dbo].[LogTbl] ([Id], [ExceptionMessage], [ExceptionStackTrace], [ControllerName], [IpAddress], [Browser], [OS], [UserId], [ActionName], [CreatedOnUtc]) VALUES (20187, N'c:\Users\Rana Hamid\AppData\Local\Temp\Temporary ASP.NET Files\vs\1ddf306a\3ba4d60d\App_Web__testimonial.cshtml.62bc836f.0iadd7xh.0.cs(30): error CS0246: The type or namespace name ''Shikhai'' could not be found (are you missing a using directive or an assembly reference?)', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', N'Catalog', N'127.0.0.1', N'Chrome 67.0, 3.0', N'WinNT', N'00000000-0000-0000-0000-000000000000', N'Testimonial', CAST(N'2018-08-06T02:45:47.5183013' AS DateTime2))
GO
INSERT [dbo].[LogTbl] ([Id], [ExceptionMessage], [ExceptionStackTrace], [ControllerName], [IpAddress], [Browser], [OS], [UserId], [ActionName], [CreatedOnUtc]) VALUES (20188, N'c:\Users\Rana Hamid\AppData\Local\Temp\Temporary ASP.NET Files\vs\1ddf306a\3ba4d60d\App_Web__testimonial.cshtml.62bc836f.lejcpxpj.0.cs(30): error CS0246: The type or namespace name ''Shikhai'' could not be found (are you missing a using directive or an assembly reference?)', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', N'Catalog', N'127.0.0.1', N'Chrome 67.0, 3.0', N'WinNT', N'00000000-0000-0000-0000-000000000000', N'Testimonial', CAST(N'2018-08-06T02:46:51.2723055' AS DateTime2))
GO
INSERT [dbo].[LogTbl] ([Id], [ExceptionMessage], [ExceptionStackTrace], [ControllerName], [IpAddress], [Browser], [OS], [UserId], [ActionName], [CreatedOnUtc]) VALUES (20189, N'A task was canceled.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   at GreenWorld.Controllers.UniversitiesController.<Index>d__9.MoveNext() in E:\E\Google Drive\Google Drive-DS\Projects_Clients\Imon\GreenWorld\GreenWorld\Controllers\UniversitiesController.cs:line 50
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Web.Mvc.Async.TaskAsyncActionDescriptor.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass37.<BeginInvokeAsynchronousActionMethod>b__36(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', N'Universities', N'127.0.0.1', N'Chrome 67.0, 3.0', N'WinNT', N'00000000-0000-0000-0000-000000000000', N'Index', CAST(N'2018-08-06T11:45:18.0954513' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[LogTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[NewspaperTbl] ON 
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2003, N'cc93aeb2-2381-4d3f-a629-3d9199c07626', N'Ittefaq', N'Classified Advertisement', NULL, N'3123', N'2131', N'555', N'313@dgdf.c', CAST(N'2018-04-27T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 828, N'7', N'রাজউক প্লট ক্রয়: রাজউকের উত্তরা ও পূর্বাচলে যে কোন সেক্টরে যে কোন আয়তনের প্লট জরুরী ভিত্তিতে ক্রয়ে ইচ্ছুক। ০১৭১XXXXXXX।', NULL, N'', CAST(N'2018-04-14T17:55:40.9770012' AS DateTime2), CAST(N'2018-04-14T17:55:40.9770012' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2004, N'33df7591-90fd-44ec-bece-c0eb20a4ae5e', N'Ittefaq', N'Classified Advertisement', NULL, N'md. rana hamid', N'H#30', N'01717623876', N'ranahamid007@gmail.com', CAST(N'2018-04-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 828, N'3', N'দোকান ভাড়া: সহজ শর্তে বেইলী রোডে মার্কেটে ৩য় তলায় ৩০০ বর্গফুট (শোরুম, গোডাউন, অফিস ইত্যাদি) ভাড়া হবে। ০১৮১XXXXXXX, ০১৮XXXXXXXX।', NULL, N'', CAST(N'2018-04-14T19:55:30.7566769' AS DateTime2), CAST(N'2018-04-14T19:55:30.7566769' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2005, N'e2d69d7a-a158-419f-be6c-3e239ae529be', N'Ittefaq', N'Classified Advertisement', NULL, N'md. rana hamid', N'H#30', N'01717623876', N'ranahamid007@gmail.com', CAST(N'2018-04-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 828, N'3', N'দোকান ভাড়া: সহজ শর্তে বেইলী রোডে মার্কেটে ৩য় তলায় ৩০০ বর্গফুট (শোরুম, গোডাউন, অফিস ইত্যাদি) ভাড়া হবে। ০১৮১XXXXXXX, ০১৮XXXXXXXX।', NULL, N'', CAST(N'2018-04-14T19:58:56.6687828' AS DateTime2), CAST(N'2018-04-14T19:58:56.6687828' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2006, N'18aebd47-33da-403f-9363-32a09f45ebec', N'Ittefaq', N'Classified Advertisement', NULL, N'md. rana hamid', N'H#30', N'01717623876', N'ranahamid007@gmail.com', CAST(N'2018-04-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 828, N'3', N'দোকান ভাড়া: সহজ শর্তে বেইলী রোডে মার্কেটে ৩য় তলায় ৩০০ বর্গফুট (শোরুম, গোডাউন, অফিস ইত্যাদি) ভাড়া হবে। ০১৮১XXXXXXX, ০১৮XXXXXXXX।', NULL, N'', CAST(N'2018-04-14T19:58:59.6869843' AS DateTime2), CAST(N'2018-04-14T19:58:59.6869843' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2007, N'9c501eea-b703-43b5-b23d-8e2fef28c12b', N'Ittefaq', N'Classified Advertisement', NULL, N'md. rana hamid', N'H#30', N'01717623876', N'klaf@gmail.com', CAST(N'2018-04-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 690, N'6', N'মগবাজার আউটারসার্কুলা২৭ বর্গফুটের নির রোডে ২৭ বর্গফুটের নি(এগোরার) বিপরীতে ১৭৩৯ ও ১৮২৭ বর্গফুটের নির্মাণাধীন ফ্ল্যাট বিক্রয়। ', NULL, N'', CAST(N'2018-04-14T20:30:10.5450435' AS DateTime2), CAST(N'2018-04-14T20:30:10.5450435' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2008, N'8f4e2f42-10c2-4731-9f1d-47211683f4c5', N'Ittefaq', N'Classified Advertisement', NULL, N'mr. abc', N'H#30', N'555', N'abc@ls.com', CAST(N'2018-04-17T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 690, NULL, N'২৭ বর্গফুটের নি', NULL, N'', CAST(N'2018-04-14T20:32:07.7130041' AS DateTime2), CAST(N'2018-04-14T20:32:07.7130041' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2009, N'12cc6b5b-9ce0-4b98-a8ef-85ab02a3c16e', N'Ittefaq', N'Classified Advertisement', NULL, N'md. rana hamid', N'H#30', N'2234', N'abc@ls.com', CAST(N'2018-04-21T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 690, N'3', N'পশ্চিম আগারগাঁও ৩ বেড বাথ ড্রয়িং-ডাইনিং, ২য় তলা বাসা ভাড়া দেওয়া হবে। যোগাযোগ ঃ ০১৫xxxxxxxx', NULL, N'', CAST(N'2018-04-17T02:29:56.4864634' AS DateTime2), CAST(N'2018-04-17T02:29:56.4869656' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2010, N'cb545214-1613-44f0-93cc-5ce61b06b29f', N'Ittefaq', N'Classified Advertisement', NULL, N'md. rana hamid', N'234', N'01717623876', N'klaf@s.com', CAST(N'2018-05-02T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 690, N'13', N'23432', NULL, N'', CAST(N'2018-04-17T02:35:37.2664957' AS DateTime2), CAST(N'2018-04-17T02:35:37.2664957' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (3009, N'794ac438-7c3b-4d3a-8ec8-6dc067472e2e', N'Ittefaq', N'Classified Advertisement', NULL, N'md. rana hamid', N'H#30', N'01717623876', N'abc@ls.com', CAST(N'2018-05-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 690, N'10', N'this is my ad. please, publish this', NULL, N'', CAST(N'2018-04-21T01:04:04.1638430' AS DateTime2), CAST(N'2018-04-21T01:04:04.1643448' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (3010, N'add060b8-51ab-48a1-b633-307481c61d02', N'Ittefaq', N'Classified Advertisement', NULL, N'mr. abc', N'2131', N'5555', N'313@dgdf.c', CAST(N'2018-04-26T00:00:00.0000000' AS DateTime2), 342, 3423, 4234, 444, N'16', N'hi', NULL, N'Content/images/newspapersfile/35134530/z5oinb4s99f_1468696441_165l.jpg', CAST(N'2018-04-21T01:25:30.2993814' AS DateTime2), CAST(N'2018-04-24T02:14:11.2090920' AS DateTime2), 1)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (3011, N'8ce1c918-33a9-4c47-8f8f-6769d45a3c2e', N'Ittefaq', N'Classified Advertisement', NULL, N'md. rana hamid', N'2131', N'01717623876', N'ranahamid007@gmail.com', CAST(N'2018-04-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 828, N'19', N'ডাক্তার ইঙ্গিনিয়ার সিটিজেনশিপ ব্যবসায়িক, ডিভোর্স বয়স্ক ও হিন্দুসহ সকল ধরনের পাত্র পাত্রির সন্ধানে গ্যারান্টি সহকারে কাজ করি। যোগাযোগঃ ০১৭৭xxxxxxx', NULL, N'', CAST(N'2018-04-21T21:43:07.2572494' AS DateTime2), CAST(N'2018-04-21T21:43:07.2572494' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (3012, N'144599a5-97ed-4925-ab24-dfbf462bffe6', N'Ittefaq', N'Ittefaq First Page Color', NULL, N'mr. abc', N'234', N'555', N'ranahamid007@gmail.com', CAST(N'2018-05-01T00:00:00.0000000' AS DateTime2), 3, 3, NULL, NULL, NULL, NULL, NULL, N'~/Content/uploads54h27skdekt_1468696441_168l.jpg', CAST(N'2018-04-26T01:55:26.4629759' AS DateTime2), CAST(N'2018-04-26T01:55:26.4649801' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (3013, N'1f0cc462-9ab1-4c56-9527-1428ac4c8e7c', N'Ittefaq', N'Ittefaq First Page Color', NULL, N'dfs', N'H#30', N'2234', N'ranahamid007@gmail.com', CAST(N'2018-05-04T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'~/Content/uploads/AAMRA- Project Plan - Version 1.0 - 20180408.pdf', CAST(N'2018-04-26T02:12:29.5908108' AS DateTime2), CAST(N'2018-04-26T02:12:29.5918132' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (3014, N'74df8363-6538-4440-bef0-de153636013c', N'Ittefaq', N'Ittefaq First Page Color', NULL, N'23423', N'4234', N'324', N'23423@fs.c', CAST(N'2018-05-02T00:00:00.0000000' AS DateTime2), 234, 34, NULL, 444, NULL, NULL, NULL, N'~/Content/uploads/2018-04-24_3-12-31.png', CAST(N'2018-04-26T02:51:22.4483948' AS DateTime2), CAST(N'2018-04-26T02:51:22.4483948' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (3015, N'f75ba805-b1c8-4b52-8fde-183b57c13240', N'Ittefaq', N'Ittefaq First Page Color', NULL, N'3123', N'2131', N'555', N'klaf@s.com', CAST(N'2018-05-04T00:00:00.0000000' AS DateTime2), 2, 2, NULL, NULL, NULL, NULL, NULL, N'~/Content/uploads/111 Nagaon.pdf', CAST(N'2018-04-26T03:05:00.2396322' AS DateTime2), CAST(N'2018-04-26T03:05:00.2396322' AS DateTime2), NULL)
GO
INSERT [dbo].[NewspaperTbl] ([Id], [NewsGuidId], [NewspaperName], [AdLocation], [PriceDescription], [AdvertiserName], [AdvertiserAddress], [AdvertiserMobile], [AdvertiserEmail], [DateofPublication], [ColumnSize], [Inch], [TotalColumnInch], [TotalPrice], [AdCategoryId], [Description], [Comments], [MainImagePath], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (4012, N'5a205362-c674-4b0f-a436-77ea941d5a0f', N'Ittefaq', N'Ittefaq Last Page Color', NULL, N'3123', N'234', N'2234', N'ranahamid007@gmail.com', CAST(N'2018-04-30T00:00:00.0000000' AS DateTime2), 2, 2, NULL, NULL, NULL, NULL, NULL, N'Content/uploads/CIR_LETTER_8118.pdf', CAST(N'2018-04-28T20:43:21.0096908' AS DateTime2), CAST(N'2018-04-28T20:43:21.0096908' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[NewspaperTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderPaymentMethodTbl] ON 
GO
INSERT [dbo].[OrderPaymentMethodTbl] ([Id], [Name], [Instructions], [InstructionsImageUrl], [Published]) VALUES (1, N'Bkash', N'01. Go to your bKash Mobile Menu by dialing *247#
02. Choose “Payment”
03. Enter the Merchant bKash Account Number you want to pay to
04. Enter the amount you want to pay
05. Enter a reference* against your payment (you can mention the purpose of the transaction in one word. e.g. Bill)
06. Enter the Counter Number* (the salesperson at the counter will tell you the number)
07. Now enter your bKash Mobile Menu PIN to confirm

 ', N'Content\images\payment\bKash_payment_Process.png', 1)
GO
INSERT [dbo].[OrderPaymentMethodTbl] ([Id], [Name], [Instructions], [InstructionsImageUrl], [Published]) VALUES (2, N'Rocket', N'01. Customer can pay bills of various organizations using this payment option.
02. To make a payment please follow the following instruction.
03. To get this service from Dutch-Bangla Bank Rocket account you just need to dial *322# from any operator except citycell.
04. In case if you are using Citycell mobile phones then just send an empty sms to 16216.
05. Once you dial *322# or send an sms to 16216 you will get the following screen.
From the screen please select the option 1.', N'Content/images/OrderPaymentMethods/78011970/2018-04-14_19-03-50.png', 1)
GO
INSERT [dbo].[OrderPaymentMethodTbl] ([Id], [Name], [Instructions], [InstructionsImageUrl], [Published]) VALUES (3, N'Internet Banking', NULL, N'Content/images/OrderPaymentMethods/67844705/book.jpg', NULL)
GO
INSERT [dbo].[OrderPaymentMethodTbl] ([Id], [Name], [Instructions], [InstructionsImageUrl], [Published]) VALUES (4, N'Card', N'Pay using ssl commerz.
We accept
a) Debit Card
b) Credit Card', N'Content/images/OrderPaymentMethods/61233661/new_mod_pay.png', 1)
GO
SET IDENTITY_INSERT [dbo].[OrderPaymentMethodTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderPaymentStatusTbl] ON 
GO
INSERT [dbo].[OrderPaymentStatusTbl] ([Id], [Name], [DefaultStatus]) VALUES (1, N'InComplete', 1)
GO
INSERT [dbo].[OrderPaymentStatusTbl] ([Id], [Name], [DefaultStatus]) VALUES (2, N'Complete', 0)
GO
SET IDENTITY_INSERT [dbo].[OrderPaymentStatusTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentTbl] ON 
GO
INSERT [dbo].[PaymentTbl] ([Id], [PaymentGuidId], [CreatedOnUtc], [UpdatedOnUtc], [OrderId], [PaymentChannel], [PaymentMobile], [PaymentTrxId], [PaymentAmount], [Active]) VALUES (1, NULL, CAST(N'2018-04-17T02:35:58.0541398' AS DateTime2), CAST(N'2018-04-17T02:35:58.0546402' AS DateTime2), 3009, N'1', N'01725620123', N'TRX4423554', 850, NULL)
GO
INSERT [dbo].[PaymentTbl] ([Id], [PaymentGuidId], [CreatedOnUtc], [UpdatedOnUtc], [OrderId], [PaymentChannel], [PaymentMobile], [PaymentTrxId], [PaymentAmount], [Active]) VALUES (2, NULL, CAST(N'2018-04-21T01:53:18.2818079' AS DateTime2), CAST(N'2018-04-24T02:14:11.1829830' AS DateTime2), 3010, N'1', N'32423', N'423423', 4234, 1)
GO
INSERT [dbo].[PaymentTbl] ([Id], [PaymentGuidId], [CreatedOnUtc], [UpdatedOnUtc], [OrderId], [PaymentChannel], [PaymentMobile], [PaymentTrxId], [PaymentAmount], [Active]) VALUES (3, NULL, CAST(N'2018-04-21T21:43:52.1192071' AS DateTime2), CAST(N'2018-04-21T21:43:52.1192071' AS DateTime2), 3011, N'1', N'01725620123', N'TRX4423554', 828, NULL)
GO
INSERT [dbo].[PaymentTbl] ([Id], [PaymentGuidId], [CreatedOnUtc], [UpdatedOnUtc], [OrderId], [PaymentChannel], [PaymentMobile], [PaymentTrxId], [PaymentAmount], [Active]) VALUES (4, N'4b09b09e-60b7-4ae6-ae4f-6fca8cf45a8c', CAST(N'2018-04-24T01:52:18.2237814' AS DateTime2), CAST(N'2018-04-24T01:52:18.2242832' AS DateTime2), NULL, N'1', N'32423', N'423423', 4234, 1)
GO
INSERT [dbo].[PaymentTbl] ([Id], [PaymentGuidId], [CreatedOnUtc], [UpdatedOnUtc], [OrderId], [PaymentChannel], [PaymentMobile], [PaymentTrxId], [PaymentAmount], [Active]) VALUES (1004, N'642d60f8-b603-484e-b2dd-2cd71e691b84', CAST(N'2018-04-26T03:05:17.7461562' AS DateTime2), CAST(N'2018-04-26T03:05:17.7461562' AS DateTime2), 3015, N'1', N'01725620123', N'33sdf2354sdf', 850, NULL)
GO
INSERT [dbo].[PaymentTbl] ([Id], [PaymentGuidId], [CreatedOnUtc], [UpdatedOnUtc], [OrderId], [PaymentChannel], [PaymentMobile], [PaymentTrxId], [PaymentAmount], [Active]) VALUES (2004, N'88e24bf8-d505-49e1-9e04-ab36eab54dac', CAST(N'2018-04-28T20:43:46.7993295' AS DateTime2), CAST(N'2018-04-28T20:43:46.8003024' AS DateTime2), 4012, N'1', N'01725620123', N'TRX4423554', 850, NULL)
GO
SET IDENTITY_INSERT [dbo].[PaymentTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTbl] ON 
GO
INSERT [dbo].[ProductTbl] ([Id], [Name], [IsBook], [IsStationary], [InstructionsImageUrl], [Published], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Math', 1, NULL, N'Content/images/Products/38035602/Math-Ed-Banner.jpg', 1, 1, NULL, NULL)
GO
INSERT [dbo].[ProductTbl] ([Id], [Name], [IsBook], [IsStationary], [InstructionsImageUrl], [Published], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'English', 1, NULL, N'Content/images/Products/69154903/learn-english-at-marbella-international-spanish-school-marbella.jpg', 1, 1, NULL, NULL)
GO
INSERT [dbo].[ProductTbl] ([Id], [Name], [IsBook], [IsStationary], [InstructionsImageUrl], [Published], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Pen', NULL, 1, N'Content/images/Products/62203730/c05523710.png', 1, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[TeacherTbl] ON 
GO
INSERT [dbo].[TeacherTbl] ([Id], [GuidId], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (1, N'92ad0151-cb43-465c-80c5-77a5e3fe5432', N'1234561234564', NULL, NULL, N'234', N'we4rwe', CAST(43 AS Decimal(18, 0)), NULL, N'3432', NULL, N'11', N'ranahamid02340ss7654@gmail.com', N'2,3,5', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, 444, N'', CAST(N'2018-07-05T02:54:58.1338751' AS DateTime2), CAST(N'2018-07-05T02:54:58.1338751' AS DateTime2), 1)
GO
INSERT [dbo].[TeacherTbl] ([Id], [GuidId], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2, N'3a86da90-854f-4f47-8142-a905017f6809', N'1234561233sdf4564', NULL, NULL, N'234', N'we4rwe', CAST(43 AS Decimal(18, 0)), NULL, N'3432', NULL, N'44444', N'ranahasdfm3id02340ss7654@gmail.com', N'2,3,5', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, 444, N'', CAST(N'2018-07-05T03:00:06.5186649' AS DateTime2), CAST(N'2018-07-05T03:00:06.5186649' AS DateTime2), 1)
GO
INSERT [dbo].[TeacherTbl] ([Id], [GuidId], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (1005, N'ac55f20a-87af-49d4-89da-ca617bda750d', N'Pobon mama', NULL, NULL, N'345', N'345', CAST(345 AS Decimal(18, 0)), NULL, N'H#88', NULL, N'244', N'sid02342307@gmail.com', N'0,1,2,3,4,5,6', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, 434, N'', CAST(N'2018-07-07T20:37:03.7901181' AS DateTime2), CAST(N'2018-07-07T20:37:03.7941186' AS DateTime2), NULL)
GO
INSERT [dbo].[TeacherTbl] ([Id], [GuidId], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (1006, N'372a0721-a924-48d6-b72d-fd557424fcd3', N'Pobon mama 2', NULL, NULL, NULL, N'345', CAST(345 AS Decimal(18, 0)), NULL, N'H#88', CAST(N'2018-07-19T00:00:00.0000000' AS DateTime2), N'12345612345622', N'ranahamid007a@gmail.com', N'0,1,2,3,4,5,6', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, NULL, N'', CAST(N'2018-07-07T20:46:50.2158181' AS DateTime2), CAST(N'2018-07-07T20:46:50.2188179' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[TeacherTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[TestimonialTbl] ON 
GO
INSERT [dbo].[TestimonialTbl] ([Id], [ImagePath], [Description], [PersonName], [PersonTitle], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (1, N'/Content/images/testimonials/14174087/parents.jpg', N'  Lorem ipsum dolor sit amet, consectetur adipisicing elit. A accusantium ad asperiores at atque culpa dolores eaque fugiat hic illo ipsam ipsum minima modi necessitatibus nemo officia, omnis perferendis placeat quaerat quas quis ratione rerum sint sit vitae. Animi architecto consequatur delectus eos id.', N'Williamson', N'Web Developer', 1, NULL, NULL, 1)
GO
INSERT [dbo].[TestimonialTbl] ([Id], [ImagePath], [Description], [PersonName], [PersonTitle], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (2, N'/Content/images/testimonials/80418418/julianne_moore3.jpg', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. L 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and m um.', N'julianne moore', N'Actress', 2, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[TestimonialTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[UniversityTbl] ON 
GO
INSERT [dbo].[UniversityTbl] ([Id], [Name], [Description], [ImagePath], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (1, N'Wuzhou University', N'<p style="margin-top: 1em; margin-bottom: 1em; font-family: Helvetica, Arial, sans-serif; color: rgb(102, 102, 102); font-size: 12px;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/f25/1/16/1f393.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🎓</span></span>Best scholarship in the best location.</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: Helvetica, Arial, sans-serif; color: rgb(102, 102, 102); font-size: 12px;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/f25/1/16/1f393.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🎓</span></span>. 2018 November session .</p><p style="margin-top: 1em; margin-bottom: 0px; font-family: Helvetica, Arial, sans-serif; color: rgb(102, 102, 102); font-size: 12px;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/fef/1/16/1f535.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔵</span></span>Location: Wuzhou city ( 1 hr 40min distance from Business and Top Modern<span class="text_exposed_show" style="display: inline; font-family: inherit;">&nbsp;city Guangzhou).</span></p><div class="text_exposed_show" style="display: inline; font-family: Helvetica, Arial, sans-serif; color: rgb(102, 102, 102); font-size: 12px;"><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/fef/1/16/1f535.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔵</span></span>4 years Confirmed Tuition fees Scholarship &amp; hostel fees 7100¥ / per year .</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/f25/1/16/1f393.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🎓</span></span>Major for Bachelor:&nbsp;<br>1. Computer science &amp; Technology&nbsp;<br>2. Mechanical engineering&nbsp;<br>3. Electronic information engineering&nbsp;<br>4. International trade &amp; economy.</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/f8d/1/16/2611.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">☑️</span></span>Required to Apply:&nbsp;<br>1. Passport &amp; Photograph<br>2.High School transcript &amp; Certificate&nbsp;<br>3. Bank statement of at least 3000 USD</p><p style="margin-top: 1em; margin-bottom: 0px; font-family: inherit;">More details:- +8615677425477<br>Gmail :- shahriarimon786@gmail.com</p></div>', N'Content/images/Universities/61611416/11.jpg', 1, CAST(N'2018-08-06T02:04:24.6453693' AS DateTime2), CAST(N'2018-08-06T02:05:56.0962678' AS DateTime2), 1)
GO
INSERT [dbo].[UniversityTbl] ([Id], [Name], [Description], [ImagePath], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Published]) VALUES (2, N'Yunnan Technology and Business University', N'<p style="margin-top: 1em; margin-bottom: 1em; font-family: Helvetica, Arial, sans-serif; color: rgb(102, 102, 102); font-size: 12px;">EDUinfo Consultants started New scholarship at “Yunnan Technology and Business University “</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: Helvetica, Arial, sans-serif; color: rgb(102, 102, 102); font-size: 12px;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/faa/1/16/1f310.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🌐</span></span>&nbsp;Location: Kunming , Yunnan</p><p style="margin-top: 1em; margin-bottom: 0px; font-family: Helvetica, Arial, sans-serif; color: rgb(102, 102, 102); font-size: 12px;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/f8d/1/16/2611.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">☑️</span></span>&nbsp;4 Years Confirmed unconditional fu<span class="text_exposed_show" style="display: inline; font-family: inherit;">ll scholarship for Chinese Taught Program and partial scholarship for English Taught .</span></p><div class="text_exposed_show" style="display: inline; font-family: Helvetica, Arial, sans-serif; color: rgb(102, 102, 102); font-size: 12px;"><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/f6e/1/16/1f534.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔴</span></span>Full scholarship: full tuition and accommodation free for Chinese taught program</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/fef/1/16/1f535.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔵</span></span>English taught program:<br>Tuition: 6000 RMB/ year&nbsp;<br>Hostel : 1200 RMB/ year</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/fef/1/16/1f535.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔵</span></span>Major in English:&nbsp;<br>1. Civil Engineering&nbsp;<br>2. Accounting&nbsp;<br>3. Business administration&nbsp;<br>4. Computer Science</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/fef/1/16/1f535.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔵</span></span>&nbsp;Major in Bilingual:&nbsp;<br>1. Mechanical engineering and automation</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/fef/1/16/1f535.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔵</span></span>&nbsp;Major in Chinese : Full tuition and Hostel free :</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;">1.Computer Science and Technology<br>2.Software Engineering<br>3.Civil Engineering<br>4.Business Administration<br>5.Financial Management<br>6.Accounting<br>7.Electric Engineering and Automation<br>8.Mechanic Design, Manufacturing and Automation<br>9.Chinese Language and Literature</p><p style="margin-top: 1em; margin-bottom: 1em; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/f6e/1/16/1f534.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔴</span></span>&nbsp;Note :&nbsp;<br>1. Transfer students accepted&nbsp;<br>2. Age limit : 30&nbsp;<br>3. No countries restrictions&nbsp;<br>4. The students who has HSK4 can start major directly for Chinese taught .</p><p style="margin-top: 1em; margin-bottom: 0px; font-family: inherit;"><span class="_5mfr _47e3" style="line-height: 0; vertical-align: middle; margin-right: 1px; margin-left: 1px; font-family: inherit;"><img class="img" height="16" role="presentation" src="https://static.xx.fbcdn.net/images/emoji.php/v9/fef/1/16/1f535.png" width="16" alt="" style="vertical-align: -3px;"><span class="_7oe" style="display: inline; font-size: 0px; width: 0px; font-family: inherit;">🔵</span></span>more details contact&nbsp;<br>+8615677425477<br>Email : shahriarimon786@gmail.com</p></div>', N'Content/images/Universities/14685962/22.jpg', 2, CAST(N'2018-08-06T02:09:45.5755931' AS DateTime2), CAST(N'2018-08-06T02:10:10.5829210' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[UniversityTbl] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 8/6/2018 12:23:28 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 8/6/2018 12:23:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 8/6/2018 12:23:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 8/6/2018 12:23:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 8/6/2018 12:23:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 8/6/2018 12:23:28 PM ******/
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
ALTER DATABASE [GreenWorld] SET  READ_WRITE 
GO
