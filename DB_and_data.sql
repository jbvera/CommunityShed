USE [master]
GO
/****** Object:  Database [CommunityShed]    Script Date: 9/6/2019 3:55:08 PM ******/
CREATE DATABASE [CommunityShed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CommunityShed', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CommunityShed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CommunityShed_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CommunityShed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CommunityShed] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommunityShed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CommunityShed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CommunityShed] SET ARITHABORT OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CommunityShed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CommunityShed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CommunityShed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CommunityShed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CommunityShed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CommunityShed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CommunityShed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CommunityShed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CommunityShed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CommunityShed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CommunityShed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CommunityShed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CommunityShed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CommunityShed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CommunityShed] SET RECOVERY FULL 
GO
ALTER DATABASE [CommunityShed] SET  MULTI_USER 
GO
ALTER DATABASE [CommunityShed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CommunityShed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CommunityShed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CommunityShed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CommunityShed] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CommunityShed', N'ON'
GO
ALTER DATABASE [CommunityShed] SET QUERY_STORE = OFF
GO
USE [CommunityShed]
GO
/****** Object:  Table [dbo].[AgeRange]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Age] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AgeRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Community]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Availability] [bit] NOT NULL,
 CONSTRAINT [PK_Community] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunityPerson]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunityPerson](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommunityId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_CommunityPerson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoriesId] [int] NOT NULL,
	[Warnings] [nvarchar](50) NOT NULL,
	[CommunityPersonId] [int] NOT NULL,
	[AgeId] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanApplication]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanApplication](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[RequestedOn] [nvarchar](50) NOT NULL,
	[ApprovedOn] [nvarchar](50) NULL,
	[BorrowerId] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[LenderId] [int] NOT NULL,
	[Duration] [nvarchar](1) NULL,
 CONSTRAINT [PK_LoanApplication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[HashedPassword] [nvarchar](200) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shed]    Script Date: 9/6/2019 3:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shed](
	[Id] [int] NOT NULL,
	[CommunityId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_Shed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AgeRange] ON 

INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (1, N'0-3 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (2, N'3-6 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (3, N'6-9 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (4, N'9-12 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (5, N'12-18 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (6, N'18-24 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (7, N'24-30 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (8, N'30-36 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (9, N'36-42 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (10, N'42-48 Months')
INSERT [dbo].[AgeRange] ([Id], [Age]) VALUES (11, N'48 Months +')
SET IDENTITY_INSERT [dbo].[AgeRange] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Type]) VALUES (1, N'Hand Tools')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (2, N'Power Tools')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (3, N'Fasteners')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (4, N'Gardening')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (5, N'Other')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (6, N'Snow Tools')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Community] ON 

INSERT [dbo].[Community] ([Id], [Name], [Availability]) VALUES (1, N'Hicksville Community Shed', 1)
SET IDENTITY_INSERT [dbo].[Community] OFF
SET IDENTITY_INSERT [dbo].[CommunityPerson] ON 

INSERT [dbo].[CommunityPerson] ([Id], [CommunityId], [PersonId], [RoleId]) VALUES (6, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[CommunityPerson] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [CategoriesId], [Warnings], [CommunityPersonId], [AgeId]) VALUES (2, N'Hose', 4, N'Sharp Edges', 6, 7)
INSERT [dbo].[Item] ([Id], [Name], [CategoriesId], [Warnings], [CommunityPersonId], [AgeId]) VALUES (3, N'Lawnmower', 4, N'High Voltage', 6, 11)
INSERT [dbo].[Item] ([Id], [Name], [CategoriesId], [Warnings], [CommunityPersonId], [AgeId]) VALUES (4, N'Powerdrill', 2, N'Very Heavy', 6, 4)
INSERT [dbo].[Item] ([Id], [Name], [CategoriesId], [Warnings], [CommunityPersonId], [AgeId]) VALUES (5, N'Screwdrivers', 1, N'None', 6, 7)
INSERT [dbo].[Item] ([Id], [Name], [CategoriesId], [Warnings], [CommunityPersonId], [AgeId]) VALUES (6, N'Leaf Trimmer', 1, N'Very dangerous', 6, 9)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[LoanApplication] ON 

INSERT [dbo].[LoanApplication] ([id], [ItemId], [RequestedOn], [ApprovedOn], [BorrowerId], [Status], [LenderId], [Duration]) VALUES (1, 4, N'Sep  6 2019  4:26PM', NULL, 1, N'Pending', 1, NULL)
INSERT [dbo].[LoanApplication] ([id], [ItemId], [RequestedOn], [ApprovedOn], [BorrowerId], [Status], [LenderId], [Duration]) VALUES (2, 3, N'Sep  6 2019  7:07PM', NULL, 1, N'Pending', 1, N'5')
SET IDENTITY_INSERT [dbo].[LoanApplication] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Username], [HashedPassword], [FirstName], [LastName]) VALUES (1, N'DaveClip@gmail.com', N'mypass', N'Dave', N'Clip')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Member')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Approver')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Reviewer')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (4, N'Enforcer')
SET IDENTITY_INSERT [dbo].[Role] OFF
ALTER TABLE [dbo].[CommunityPerson]  WITH CHECK ADD  CONSTRAINT [FK_CommunityPerson_Community] FOREIGN KEY([CommunityId])
REFERENCES [dbo].[Community] ([Id])
GO
ALTER TABLE [dbo].[CommunityPerson] CHECK CONSTRAINT [FK_CommunityPerson_Community]
GO
ALTER TABLE [dbo].[CommunityPerson]  WITH CHECK ADD  CONSTRAINT [FK_CommunityPerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[CommunityPerson] CHECK CONSTRAINT [FK_CommunityPerson_Person]
GO
ALTER TABLE [dbo].[CommunityPerson]  WITH CHECK ADD  CONSTRAINT [FK_CommunityPerson_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[CommunityPerson] CHECK CONSTRAINT [FK_CommunityPerson_Role]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_AgeRange] FOREIGN KEY([AgeId])
REFERENCES [dbo].[AgeRange] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_AgeRange]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Categories] FOREIGN KEY([CategoriesId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Categories]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_CommunityPerson] FOREIGN KEY([CommunityPersonId])
REFERENCES [dbo].[CommunityPerson] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_CommunityPerson]
GO
ALTER TABLE [dbo].[LoanApplication]  WITH CHECK ADD  CONSTRAINT [FK_Person_LoanApplicationBorrower] FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[LoanApplication] CHECK CONSTRAINT [FK_Person_LoanApplicationBorrower]
GO
ALTER TABLE [dbo].[LoanApplication]  WITH CHECK ADD  CONSTRAINT [FK_Person_LoanApplicationLender] FOREIGN KEY([LenderId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[LoanApplication] CHECK CONSTRAINT [FK_Person_LoanApplicationLender]
GO
ALTER TABLE [dbo].[Shed]  WITH CHECK ADD  CONSTRAINT [FK_Shed_Community] FOREIGN KEY([CommunityId])
REFERENCES [dbo].[Community] ([Id])
GO
ALTER TABLE [dbo].[Shed] CHECK CONSTRAINT [FK_Shed_Community]
GO
ALTER TABLE [dbo].[Shed]  WITH CHECK ADD  CONSTRAINT [FK_Shed_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Shed] CHECK CONSTRAINT [FK_Shed_Item]
GO
USE [master]
GO
ALTER DATABASE [CommunityShed] SET  READ_WRITE 
GO
