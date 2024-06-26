USE [master]
GO
/****** Object:  Database [Kindergarten_db]    Script Date: 20.06.2024 2:09:22 ******/
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
/****** Object:  Table [dbo].[EducationTypes]    Script Date: 20.06.2024 2:09:22 ******/
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
/****** Object:  Table [dbo].[Genders]    Script Date: 20.06.2024 2:09:22 ******/
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
/****** Object:  Table [dbo].[Kid]    Script Date: 20.06.2024 2:09:22 ******/
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
/****** Object:  Table [dbo].[KidGroups]    Script Date: 20.06.2024 2:09:22 ******/
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
/****** Object:  Table [dbo].[Parent]    Script Date: 20.06.2024 2:09:22 ******/
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
/****** Object:  Table [dbo].[PrivateLessons]    Script Date: 20.06.2024 2:09:22 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 20.06.2024 2:09:22 ******/
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
/****** Object:  Table [dbo].[Visits]    Script Date: 20.06.2024 2:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visits](
	[Date] [date] NOT NULL,
	[KidId] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_Visits] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 20.06.2024 2:09:22 ******/
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
SET IDENTITY_INSERT [dbo].[EducationTypes] ON 

INSERT [dbo].[EducationTypes] ([Id], [Name]) VALUES (1, N'Уроки физкультуры')
INSERT [dbo].[EducationTypes] ([Id], [Name]) VALUES (2, N'Логопед')
INSERT [dbo].[EducationTypes] ([Id], [Name]) VALUES (3, N'Математика')
INSERT [dbo].[EducationTypes] ([Id], [Name]) VALUES (4, N'Русский язык')
INSERT [dbo].[EducationTypes] ([Id], [Name]) VALUES (5, N'Окружающий мир')
SET IDENTITY_INSERT [dbo].[EducationTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([Id], [Name]) VALUES (1, N'Мужской')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (2, N'Женский')
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[Kid] ON 

INSERT [dbo].[Kid] ([Id], [First_name], [Last_name], [Patronimyc], [DateOfBirth], [ParentId], [GroupId], [MedicalDescription], [Description], [IsValid], [Gender], [Photo]) VALUES (1, N'dsafasdf', N'sdafasdf', N'sdafsdaf', CAST(N'2020-07-07' AS Date), 1, 1, N'fweqfrqw', N'faewfwf', 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Kid] OFF
GO
SET IDENTITY_INSERT [dbo].[KidGroups] ON 

INSERT [dbo].[KidGroups] ([Id], [Name]) VALUES (1, N'1 Ясли')
INSERT [dbo].[KidGroups] ([Id], [Name]) VALUES (2, N'2 Ясли')
INSERT [dbo].[KidGroups] ([Id], [Name]) VALUES (3, N'3 Ясли')
INSERT [dbo].[KidGroups] ([Id], [Name]) VALUES (4, N'4')
INSERT [dbo].[KidGroups] ([Id], [Name]) VALUES (5, N'5')
SET IDENTITY_INSERT [dbo].[KidGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[Parent] ON 

INSERT [dbo].[Parent] ([Id], [First_name], [Last_name], [Patronimyc], [Phone], [Adress], [DateOfBirth], [PassportNumber], [IsValid], [Gender], [Photo]) VALUES (1, N'fasfd', N'sadfasdf', N'asdfsad', N'4565456564', N'vsdfkndnv', CAST(N'1995-07-05' AS Date), N'4564546444', 0, 2, NULL)
INSERT [dbo].[Parent] ([Id], [First_name], [Last_name], [Patronimyc], [Phone], [Adress], [DateOfBirth], [PassportNumber], [IsValid], [Gender], [Photo]) VALUES (2, N'Антонина', N'Ефремова', N'Порфнрьевна', N'+7 (997) 233-16-12', N'Россия, г. Северск, Дружбы ул., д. 24 кв.54', CAST(N'1999-06-18' AS Date), N'4589937622', 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Parent] OFF
GO
SET IDENTITY_INSERT [dbo].[PrivateLessons] ON 

INSERT [dbo].[PrivateLessons] ([Id], [Date], [EducationTypeId], [KidId], [WorkerId], [Price], [Description], [IsValid]) VALUES (1, CAST(N'2024-06-05' AS Date), 1, 1, 1, N'121', N'213', 1)
SET IDENTITY_INSERT [dbo].[PrivateLessons] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Воспитатель')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Администратор')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Повар')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (4, N'Охранник')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (5, N'Логопед')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (6, N'Психолог')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (7, N'Преподаватель физкультуры')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (8, N'Медсестра')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([Id], [First_name], [Last_name], [Patronimyc], [Phone], [Adress], [DateOfBirth], [PassportNumber], [RoleId], [Login], [Password], [IsValid], [Gender], [Photo]) VALUES (1, N'Константин', N'Пыжалов', N'Никифорович', N'+7 (992) 259-32-63', N'Россия, г. Стерлитамак, Белорусская ул., д. 3 кв.124', CAST(N'1987-02-22' AS Date), N'4972382663', 2, N'1', N'1', 1, 1, NULL)
INSERT [dbo].[Workers] ([Id], [First_name], [Last_name], [Patronimyc], [Phone], [Adress], [DateOfBirth], [PassportNumber], [RoleId], [Login], [Password], [IsValid], [Gender], [Photo]) VALUES (2, N'Нонна', N'Гуринова', N'Антоновна', N'+7 (998) 781-42-51', N'Россия, г. Чита, Севернаяул., д. 11 кв.93', CAST(N'1965-07-02' AS Date), N'4038829629', 1, N'dfsaf', N'dsfsd', 1, 2, NULL)
INSERT [dbo].[Workers] ([Id], [First_name], [Last_name], [Patronimyc], [Phone], [Adress], [DateOfBirth], [PassportNumber], [RoleId], [Login], [Password], [IsValid], [Gender], [Photo]) VALUES (3, N'Федот', N'Громов', N'Георгиевич', N'+7 (954) 696-53-68', N'Россия, г. Златоуст, Колхозный пер., д. 1 кв.163', CAST(N'1989-07-19' AS Date), N'4132480415', 4, N'fds', N'sdf', 1, 1, NULL)
INSERT [dbo].[Workers] ([Id], [First_name], [Last_name], [Patronimyc], [Phone], [Adress], [DateOfBirth], [PassportNumber], [RoleId], [Login], [Password], [IsValid], [Gender], [Photo]) VALUES (4, N'Анжела', N'Науменко', N'Ивановна', N'+7 (991) 685-28-10', N'Россия, г. Ессентуки, Дружбы ул., д. 9 кв.71', CAST(N'1999-07-27' AS Date), N'4137131238', 3, N'juyk', N'rty', 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Workers] OFF
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
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [FK_Visits_Kid] FOREIGN KEY([KidId])
REFERENCES [dbo].[Kid] ([Id])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [FK_Visits_Kid]
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
