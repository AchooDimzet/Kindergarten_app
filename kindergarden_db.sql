USE [master]
GO
/****** Object:  Database [Kindergarten_db]    Script Date: 07.06.2024 4:09:43 ******/
CREATE DATABASE [Kindergarten_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kindergarten_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Kindergarten_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kindergarten_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Kindergarten_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Cyrillic_General_CI_AS
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kindergarten_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kindergarten_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kindergarten_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kindergarten_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kindergarten_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kindergarten_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kindergarten_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kindergarten_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kindergarten_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kindergarten_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kindergarten_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kindergarten_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kindergarten_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kindergarten_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kindergarten_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kindergarten_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kindergarten_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kindergarten_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kindergarten_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kindergarten_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kindergarten_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kindergarten_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kindergarten_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kindergarten_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kindergarten_db] SET  MULTI_USER 
GO
ALTER DATABASE [Kindergarten_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kindergarten_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kindergarten_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kindergarten_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kindergarten_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kindergarten_db] SET QUERY_STORE = OFF
GO
USE [Kindergarten_db]
GO
/****** Object:  Table [dbo].[EducationTypes]    Script Date: 07.06.2024 4:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_EducationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 07.06.2024 4:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kid]    Script Date: 07.06.2024 4:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kid](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Last_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Patronimyc] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[DateOfBirth] [date] NOT NULL,
	[ParentId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[MedicalDescription] [nvarchar](max) COLLATE Cyrillic_General_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE Cyrillic_General_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
	[Gender] [int] NOT NULL,
	[Photo] [varbinary](max) NULL,
 CONSTRAINT [PK_Kid] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KidGroups]    Script Date: 07.06.2024 4:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KidGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_KidGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 07.06.2024 4:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Last_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Patronimyc] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Phone] [nvarchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Adress] [nvarchar](100) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PassportNumber] [nvarchar](10) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[IsValid] [bit] NOT NULL,
	[Gender] [int] NOT NULL,
	[Photo] [varbinary](max) NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrivateLessons]    Script Date: 07.06.2024 4:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateLessons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[EducationTypeId] [int] NOT NULL,
	[KidId] [int] NOT NULL,
	[WorkerId] [int] NOT NULL,
	[Price] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE Cyrillic_General_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_PrivateLessons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 07.06.2024 4:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 07.06.2024 4:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Last_name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Patronimyc] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Phone] [nvarchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Adress] [nvarchar](100) COLLATE Cyrillic_General_CI_AS NULL,
	[DateOfBirth] [date] NOT NULL,
	[PassportNumber] [nvarchar](10) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[RoleId] [int] NOT NULL,
	[Login] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Password] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[IsValid] [bit] NOT NULL,
	[Gender] [int] NOT NULL,
	[Photo] [varbinary](max) NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kid]  WITH CHECK ADD  CONSTRAINT [FK_Kid_Genders] FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Kid] CHECK CONSTRAINT [FK_Kid_Genders]
GO
ALTER TABLE [dbo].[Kid]  WITH CHECK ADD  CONSTRAINT [FK_Kid_KidGroups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[KidGroups] ([Id])
GO
ALTER TABLE [dbo].[Kid] CHECK CONSTRAINT [FK_Kid_KidGroups]
GO
ALTER TABLE [dbo].[Kid]  WITH CHECK ADD  CONSTRAINT [FK_Kid_Parent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Parent] ([Id])
GO
ALTER TABLE [dbo].[Kid] CHECK CONSTRAINT [FK_Kid_Parent]
GO
ALTER TABLE [dbo].[Parent]  WITH CHECK ADD  CONSTRAINT [FK_Parent_Genders] FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Parent] CHECK CONSTRAINT [FK_Parent_Genders]
GO
ALTER TABLE [dbo].[PrivateLessons]  WITH CHECK ADD  CONSTRAINT [FK_PrivateLessons_EducationTypes] FOREIGN KEY([EducationTypeId])
REFERENCES [dbo].[EducationTypes] ([Id])
GO
ALTER TABLE [dbo].[PrivateLessons] CHECK CONSTRAINT [FK_PrivateLessons_EducationTypes]
GO
ALTER TABLE [dbo].[PrivateLessons]  WITH CHECK ADD  CONSTRAINT [FK_PrivateLessons_Kid] FOREIGN KEY([KidId])
REFERENCES [dbo].[Kid] ([Id])
GO
ALTER TABLE [dbo].[PrivateLessons] CHECK CONSTRAINT [FK_PrivateLessons_Kid]
GO
ALTER TABLE [dbo].[PrivateLessons]  WITH CHECK ADD  CONSTRAINT [FK_PrivateLessons_Workers] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Workers] ([Id])
GO
ALTER TABLE [dbo].[PrivateLessons] CHECK CONSTRAINT [FK_PrivateLessons_Workers]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Genders] FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Genders]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Roles]
GO
USE [master]
GO
ALTER DATABASE [Kindergarten_db] SET  READ_WRITE 
GO
