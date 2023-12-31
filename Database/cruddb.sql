USE [master]
GO
/****** Object:  Database [CRUDDB]    Script Date: 8/26/2023 3:49:55 PM ******/
CREATE DATABASE [CRUDDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRUDDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CRUDDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CRUDDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CRUDDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CRUDDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRUDDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRUDDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRUDDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRUDDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRUDDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRUDDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRUDDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRUDDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CRUDDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRUDDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRUDDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRUDDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRUDDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRUDDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRUDDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRUDDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRUDDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRUDDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRUDDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRUDDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRUDDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRUDDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRUDDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRUDDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRUDDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CRUDDB] SET  MULTI_USER 
GO
ALTER DATABASE [CRUDDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRUDDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRUDDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRUDDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CRUDDB]
GO
/****** Object:  Table [dbo].[Desginations]    Script Date: 8/26/2023 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desginations](
	[DesginationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Desginations] PRIMARY KEY CLUSTERED 
(
	[DesginationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/26/2023 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[EmployeeName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](10) NULL,
	[DesignationId] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 8/26/2023 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RefreshToken] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/26/2023 3:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Desginations] ON 

GO
INSERT [dbo].[Desginations] ([DesginationId], [DesignationName]) VALUES (1, N'Junior Software Developer')
GO
INSERT [dbo].[Desginations] ([DesginationId], [DesignationName]) VALUES (2, N'Software Developer')
GO
INSERT [dbo].[Desginations] ([DesginationId], [DesignationName]) VALUES (3, N'Senior Software Developer')
GO
INSERT [dbo].[Desginations] ([DesginationId], [DesignationName]) VALUES (4, N'Lead Engineer')
GO
INSERT [dbo].[Desginations] ([DesginationId], [DesignationName]) VALUES (5, N'Manager')
GO
SET IDENTITY_INSERT [dbo].[Desginations] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

GO
INSERT [dbo].[Employees] ([EmployeeId], [Code], [EmployeeName], [Email], [Phone], [DesignationId]) VALUES (1, N'101', N'Jawed Shaikh', N'j@gmail.com', N'012314565', 1)
GO
INSERT [dbo].[Employees] ([EmployeeId], [Code], [EmployeeName], [Email], [Phone], [DesignationId]) VALUES (2, N'102', N'Rajesh Pawar', N'r@gmail.com', NULL, 1)
GO
INSERT [dbo].[Employees] ([EmployeeId], [Code], [EmployeeName], [Email], [Phone], [DesignationId]) VALUES (3, N'103', N'Sumit Deshmukh', N'sd@gmail.com', N'985165156', 3)
GO
INSERT [dbo].[Employees] ([EmployeeId], [Code], [EmployeeName], [Email], [Phone], [DesignationId]) VALUES (4, N'104', N'Pawan', N'p@gmail.com', NULL, 1)
GO
INSERT [dbo].[Employees] ([EmployeeId], [Code], [EmployeeName], [Email], [Phone], [DesignationId]) VALUES (5, N'105', N'Ejaz Shaikh', N'e@gmail.com', NULL, 3)
GO
INSERT [dbo].[Employees] ([EmployeeId], [Code], [EmployeeName], [Email], [Phone], [DesignationId]) VALUES (7, N'107', N'User 07', N'user7@gmail.com', N'0978745663', 1)
GO
INSERT [dbo].[Employees] ([EmployeeId], [Code], [EmployeeName], [Email], [Phone], [DesignationId]) VALUES (8, N'107', N'User 07', N'user7@gmail.com', N'0564987321', 1)
GO
INSERT [dbo].[Employees] ([EmployeeId], [Code], [EmployeeName], [Email], [Phone], [DesignationId]) VALUES (11, N'109', N'Bob', N'bob@gmail.com', N'981651', 5)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshTokens] ON 

GO
INSERT [dbo].[RefreshTokens] ([TokenId], [Username], [RefreshToken], [IsActive]) VALUES (1, N'jawed', N'SUQhAaHsGmaVrLR5+8xcoEwZKe4uA+y0WV3E/4nCvtw=', 1)
GO
INSERT [dbo].[RefreshTokens] ([TokenId], [Username], [RefreshToken], [IsActive]) VALUES (2, N'AdminUser', N'5AbErKXNqhfPY1FCjALEn6juC0tEWZLZGDCNaqAj+YI=', 1)
GO
INSERT [dbo].[RefreshTokens] ([TokenId], [Username], [RefreshToken], [IsActive]) VALUES (3, N'OperatorUser', N'C71gJQoJlSMAX9kWr3nmFlyvvw5lbQgwbh3JQ7NZHmw=', 1)
GO
SET IDENTITY_INSERT [dbo].[RefreshTokens] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role]) VALUES (1, N'AdminUser', N'1234546', N'Admin')
GO
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role]) VALUES (2, N'OperatorUser', N'546789', N'Operator')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [CRUDDB] SET  READ_WRITE 
GO
