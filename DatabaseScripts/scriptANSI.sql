USE [master]
GO
/****** Object:  Database [AfstandslerenDB]    Script Date: 6-11-2020 10:39:39 ******/
CREATE DATABASE [AfstandslerenDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AfstandslerenDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AfstandslerenDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AfstandslerenDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AfstandslerenDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AfstandslerenDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AfstandslerenDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AfstandslerenDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AfstandslerenDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AfstandslerenDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AfstandslerenDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AfstandslerenDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AfstandslerenDB] SET  MULTI_USER 
GO
ALTER DATABASE [AfstandslerenDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AfstandslerenDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AfstandslerenDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AfstandslerenDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AfstandslerenDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AfstandslerenDB', N'ON'
GO
ALTER DATABASE [AfstandslerenDB] SET QUERY_STORE = OFF
GO
USE [AfstandslerenDB]
GO
/****** Object:  Table [dbo].[Studenten]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studenten](
	[studentId] [int] IDENTITY(1,1) NOT NULL,
	[studentNaam] [varchar](50) NOT NULL,
	[studentNummer] [varchar](50) NOT NULL,
	[klasId] [int] NOT NULL,
 CONSTRAINT [PK_Studenten] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lokalen]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lokalen](
	[lokaalId] [int] IDENTITY(1,1) NOT NULL,
	[lokaalNaam] [varchar](50) NOT NULL,
	[lokaalCapaciteit] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lokalen] PRIMARY KEY CLUSTERED 
(
	[lokaalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LokaalPlanner]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LokaalPlanner](
	[lokaalplannerId] [int] IDENTITY(1,1) NOT NULL,
	[lokaalId] [int] NOT NULL,
	[datum] [varchar](50) NOT NULL,
	[tijdstip] [varchar](50) NOT NULL,
	[studentId] [int] NOT NULL,
 CONSTRAINT [PK_LokaalPlanner] PRIMARY KEY CLUSTERED 
(
	[lokaalplannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPlanner]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPlanner]
AS
SELECT        dbo.LokaalPlanner.lokaalplannerId, dbo.Lokalen.lokaalNaam, dbo.LokaalPlanner.datum, dbo.LokaalPlanner.tijdstip, dbo.Studenten.studentNaam
FROM            dbo.LokaalPlanner INNER JOIN
                         dbo.Lokalen ON dbo.LokaalPlanner.lokaalId = dbo.Lokalen.lokaalId INNER JOIN
                         dbo.Studenten ON dbo.LokaalPlanner.studentId = dbo.Studenten.studentId
GO
/****** Object:  Table [dbo].[Expertises]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expertises](
	[expertiseId] [int] IDENTITY(1,1) NOT NULL,
	[expertiseNaam] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Expertises] PRIMARY KEY CLUSTERED 
(
	[expertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interesses]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interesses](
	[interesseId] [int] IDENTITY(1,1) NOT NULL,
	[interesseNaam] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Interesses] PRIMARY KEY CLUSTERED 
(
	[interesseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klassen]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klassen](
	[klasId] [int] IDENTITY(1,1) NOT NULL,
	[klasNaam] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Klassen] PRIMARY KEY CLUSTERED 
(
	[klasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socials]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socials](
	[socialId] [int] IDENTITY(1,1) NOT NULL,
	[socialNaam] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Socials] PRIMARY KEY CLUSTERED 
(
	[socialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentExpertise]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExpertise](
	[studentId] [int] NOT NULL,
	[expertiseId] [int] NOT NULL,
	[expertiseNiveau] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentExpertise] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC,
	[expertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentInteresse]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInteresse](
	[studentId] [int] NOT NULL,
	[interesseId] [int] NOT NULL,
 CONSTRAINT [PK_StudentInteresse] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC,
	[interesseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentSocial]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSocial](
	[studentId] [int] NOT NULL,
	[socialId] [int] NOT NULL,
	[socialLink] [varchar](100) NOT NULL,
 CONSTRAINT [PK_StudentSocial] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC,
	[socialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentVak]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentVak](
	[studentId] [int] NOT NULL,
	[vakId] [int] NOT NULL,
 CONSTRAINT [PK_StudentVak] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC,
	[vakId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vakken]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vakken](
	[vakId] [int] IDENTITY(1,1) NOT NULL,
	[vakNaam] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Vakken] PRIMARY KEY CLUSTERED 
(
	[vakId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentenView]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentenView]
AS
SELECT        dbo.Studenten.studentId, dbo.Studenten.studentNaam, dbo.Studenten.studentNummer, dbo.Klassen.klasNaam, dbo.Vakken.vakNaam, dbo.Expertises.expertiseNaam, dbo.StudentExpertise.expertiseNiveau, 
                         dbo.Interesses.interesseNaam, dbo.Socials.socialNaam, dbo.StudentSocial.socialLink
FROM            dbo.Interesses INNER JOIN
                         dbo.StudentInteresse ON dbo.Interesses.interesseId = dbo.StudentInteresse.interesseId INNER JOIN
                         dbo.Expertises INNER JOIN
                         dbo.Studenten INNER JOIN
                         dbo.Klassen ON dbo.Studenten.klasId = dbo.Klassen.klasId INNER JOIN
                         dbo.StudentExpertise ON dbo.Studenten.studentId = dbo.StudentExpertise.studentId ON dbo.Expertises.expertiseId = dbo.StudentExpertise.expertiseId ON dbo.StudentInteresse.studentId = dbo.Studenten.studentId INNER JOIN
                         dbo.StudentSocial ON dbo.Studenten.studentId = dbo.StudentSocial.studentId INNER JOIN
                         dbo.Socials ON dbo.StudentSocial.socialId = dbo.Socials.socialId INNER JOIN
                         dbo.StudentVak ON dbo.Studenten.studentId = dbo.StudentVak.studentId INNER JOIN
                         dbo.Vakken ON dbo.StudentVak.vakId = dbo.Vakken.vakId
GO
/****** Object:  View [dbo].[View_1]    Script Date: 6-11-2020 10:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Studenten.studentId, dbo.Studenten.studentNaam, dbo.Studenten.studentNummer, dbo.Klassen.klasNaam
FROM            dbo.Studenten INNER JOIN
                         dbo.StudentVak ON dbo.Studenten.studentId = dbo.StudentVak.studentId INNER JOIN
                         dbo.Vakken ON dbo.StudentVak.vakId = dbo.Vakken.vakId INNER JOIN
                         dbo.Klassen ON dbo.Studenten.klasId = dbo.Klassen.klasId
WHERE        (dbo.StudentVak.vakId = 1)
GO
SET IDENTITY_INSERT [dbo].[Expertises] ON 

INSERT [dbo].[Expertises] ([expertiseId], [expertiseNaam]) VALUES (1, N'C#')
INSERT [dbo].[Expertises] ([expertiseId], [expertiseNaam]) VALUES (2, N'Webforms')
INSERT [dbo].[Expertises] ([expertiseId], [expertiseNaam]) VALUES (3, N'Php')
INSERT [dbo].[Expertises] ([expertiseId], [expertiseNaam]) VALUES (4, N'Python')
INSERT [dbo].[Expertises] ([expertiseId], [expertiseNaam]) VALUES (5, N'Extended abstract')
INSERT [dbo].[Expertises] ([expertiseId], [expertiseNaam]) VALUES (6, N'Webservers')
INSERT [dbo].[Expertises] ([expertiseId], [expertiseNaam]) VALUES (7, N'Databases')
INSERT [dbo].[Expertises] ([expertiseId], [expertiseNaam]) VALUES (8, N'PowerBI')
SET IDENTITY_INSERT [dbo].[Expertises] OFF
GO
SET IDENTITY_INSERT [dbo].[Interesses] ON 

INSERT [dbo].[Interesses] ([interesseId], [interesseNaam]) VALUES (1, N'Mountainbiken')
INSERT [dbo].[Interesses] ([interesseId], [interesseNaam]) VALUES (2, N'Skiën')
INSERT [dbo].[Interesses] ([interesseId], [interesseNaam]) VALUES (3, N'Gamen')
INSERT [dbo].[Interesses] ([interesseId], [interesseNaam]) VALUES (4, N'Piano')
INSERT [dbo].[Interesses] ([interesseId], [interesseNaam]) VALUES (5, N'Gitaar')
INSERT [dbo].[Interesses] ([interesseId], [interesseNaam]) VALUES (6, N'Fitnessen')
SET IDENTITY_INSERT [dbo].[Interesses] OFF
GO
SET IDENTITY_INSERT [dbo].[Klassen] ON 

INSERT [dbo].[Klassen] ([klasId], [klasNaam]) VALUES (1, N'B2D')
INSERT [dbo].[Klassen] ([klasId], [klasNaam]) VALUES (2, N'B2A')
INSERT [dbo].[Klassen] ([klasId], [klasNaam]) VALUES (3, N'B2B')
INSERT [dbo].[Klassen] ([klasId], [klasNaam]) VALUES (4, N'B2C')
INSERT [dbo].[Klassen] ([klasId], [klasNaam]) VALUES (5, N'B2E')
SET IDENTITY_INSERT [dbo].[Klassen] OFF
GO
SET IDENTITY_INSERT [dbo].[LokaalPlanner] ON 

INSERT [dbo].[LokaalPlanner] ([lokaalplannerId], [lokaalId], [datum], [tijdstip], [studentId]) VALUES (13, 2, N'12-11-2020', N'10:00', 1)
INSERT [dbo].[LokaalPlanner] ([lokaalplannerId], [lokaalId], [datum], [tijdstip], [studentId]) VALUES (14, 1, N'19-11-2020', N'9:00', 2)
INSERT [dbo].[LokaalPlanner] ([lokaalplannerId], [lokaalId], [datum], [tijdstip], [studentId]) VALUES (15, 3, N'01-12-2020', N'15:00', 6)
INSERT [dbo].[LokaalPlanner] ([lokaalplannerId], [lokaalId], [datum], [tijdstip], [studentId]) VALUES (16, 1, N'18-12-2020', N'14:00', 4)
INSERT [dbo].[LokaalPlanner] ([lokaalplannerId], [lokaalId], [datum], [tijdstip], [studentId]) VALUES (17, 2, N'24-11-2020', N'17:00', 3)
INSERT [dbo].[LokaalPlanner] ([lokaalplannerId], [lokaalId], [datum], [tijdstip], [studentId]) VALUES (18, 1, N'23-11-2020', N'14:00', 7)
SET IDENTITY_INSERT [dbo].[LokaalPlanner] OFF
GO
SET IDENTITY_INSERT [dbo].[Lokalen] ON 

INSERT [dbo].[Lokalen] ([lokaalId], [lokaalNaam], [lokaalCapaciteit]) VALUES (1, N'B2104', N'20')
INSERT [dbo].[Lokalen] ([lokaalId], [lokaalNaam], [lokaalCapaciteit]) VALUES (2, N'B3305', N'20')
INSERT [dbo].[Lokalen] ([lokaalId], [lokaalNaam], [lokaalCapaciteit]) VALUES (3, N'B3204', N'8')
SET IDENTITY_INSERT [dbo].[Lokalen] OFF
GO
SET IDENTITY_INSERT [dbo].[Socials] ON 

INSERT [dbo].[Socials] ([socialId], [socialNaam]) VALUES (1, N'Facebook')
INSERT [dbo].[Socials] ([socialId], [socialNaam]) VALUES (2, N'Twitter')
INSERT [dbo].[Socials] ([socialId], [socialNaam]) VALUES (3, N'Discord')
INSERT [dbo].[Socials] ([socialId], [socialNaam]) VALUES (4, N'Instagram')
INSERT [dbo].[Socials] ([socialId], [socialNaam]) VALUES (5, N'Reddit')
INSERT [dbo].[Socials] ([socialId], [socialNaam]) VALUES (6, N'StackOverflow')
INSERT [dbo].[Socials] ([socialId], [socialNaam]) VALUES (7, N'Github')
SET IDENTITY_INSERT [dbo].[Socials] OFF
GO
SET IDENTITY_INSERT [dbo].[Studenten] ON 

INSERT [dbo].[Studenten] ([studentId], [studentNaam], [studentNummer], [klasId]) VALUES (1, N'Judith Otten', N'1426753', 1)
INSERT [dbo].[Studenten] ([studentId], [studentNaam], [studentNummer], [klasId]) VALUES (2, N'Mitchel Spiekers', N'1944584', 1)
INSERT [dbo].[Studenten] ([studentId], [studentNaam], [studentNummer], [klasId]) VALUES (3, N'Ennio Paone', N'1938258', 1)
INSERT [dbo].[Studenten] ([studentId], [studentNaam], [studentNummer], [klasId]) VALUES (4, N'Tom Skerka', N'1849123', 1)
INSERT [dbo].[Studenten] ([studentId], [studentNaam], [studentNummer], [klasId]) VALUES (6, N'Jan Jansen', N'1948291', 2)
INSERT [dbo].[Studenten] ([studentId], [studentNaam], [studentNummer], [klasId]) VALUES (7, N'Karel de Wit', N'1729371', 3)
INSERT [dbo].[Studenten] ([studentId], [studentNaam], [studentNummer], [klasId]) VALUES (8, N'Hans Pietersen', N'1628394', 4)
SET IDENTITY_INSERT [dbo].[Studenten] OFF
GO
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (1, 1, N'Novice')
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (1, 2, N'Novice')
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (2, 3, N'Novice')
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (3, 2, N'Novice')
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (4, 1, N'Novice')
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (4, 2, N'Novice')
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (6, 3, N'Novice')
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (7, 7, N'Novice')
INSERT [dbo].[StudentExpertise] ([studentId], [expertiseId], [expertiseNiveau]) VALUES (8, 3, N'Novice')
GO
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (1, 1)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (1, 2)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (1, 3)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (2, 1)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (2, 3)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (3, 5)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (4, 1)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (4, 2)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (6, 3)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (7, 4)
INSERT [dbo].[StudentInteresse] ([studentId], [interesseId]) VALUES (8, 1)
GO
INSERT [dbo].[StudentSocial] ([studentId], [socialId], [socialLink]) VALUES (1, 3, N'darksideofpotato#5568')
INSERT [dbo].[StudentSocial] ([studentId], [socialId], [socialLink]) VALUES (2, 7, N'LightningSlash')
INSERT [dbo].[StudentSocial] ([studentId], [socialId], [socialLink]) VALUES (3, 7, N'enniomp')
INSERT [dbo].[StudentSocial] ([studentId], [socialId], [socialLink]) VALUES (4, 7, N'Poptardpounder')
INSERT [dbo].[StudentSocial] ([studentId], [socialId], [socialLink]) VALUES (6, 2, N'@JanJansen')
INSERT [dbo].[StudentSocial] ([studentId], [socialId], [socialLink]) VALUES (7, 2, N'@Karellll')
INSERT [dbo].[StudentSocial] ([studentId], [socialId], [socialLink]) VALUES (8, 5, N'/u/IkWeetGeenUserName')
GO
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (1, 1)
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (1, 2)
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (2, 1)
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (2, 2)
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (3, 1)
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (4, 1)
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (6, 3)
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (7, 4)
INSERT [dbo].[StudentVak] ([studentId], [vakId]) VALUES (8, 5)
GO
SET IDENTITY_INSERT [dbo].[Vakken] ON 

INSERT [dbo].[Vakken] ([vakId], [vakNaam]) VALUES (1, N'B2C2')
INSERT [dbo].[Vakken] ([vakId], [vakNaam]) VALUES (2, N'B2F1')
INSERT [dbo].[Vakken] ([vakId], [vakNaam]) VALUES (3, N'B2C1')
INSERT [dbo].[Vakken] ([vakId], [vakNaam]) VALUES (4, N'B2F2')
INSERT [dbo].[Vakken] ([vakId], [vakNaam]) VALUES (5, N'B2C3')
SET IDENTITY_INSERT [dbo].[Vakken] OFF
GO
ALTER TABLE [dbo].[LokaalPlanner]  WITH CHECK ADD  CONSTRAINT [FK_LokaalPlanner_Lokalen] FOREIGN KEY([lokaalId])
REFERENCES [dbo].[Lokalen] ([lokaalId])
GO
ALTER TABLE [dbo].[LokaalPlanner] CHECK CONSTRAINT [FK_LokaalPlanner_Lokalen]
GO
ALTER TABLE [dbo].[LokaalPlanner]  WITH CHECK ADD  CONSTRAINT [FK_LokaalPlanner_Studenten] FOREIGN KEY([studentId])
REFERENCES [dbo].[Studenten] ([studentId])
GO
ALTER TABLE [dbo].[LokaalPlanner] CHECK CONSTRAINT [FK_LokaalPlanner_Studenten]
GO
ALTER TABLE [dbo].[Studenten]  WITH CHECK ADD  CONSTRAINT [FK_Studenten_Klassen] FOREIGN KEY([klasId])
REFERENCES [dbo].[Klassen] ([klasId])
GO
ALTER TABLE [dbo].[Studenten] CHECK CONSTRAINT [FK_Studenten_Klassen]
GO
ALTER TABLE [dbo].[StudentExpertise]  WITH CHECK ADD  CONSTRAINT [FK_StudentExpertise_Expertises] FOREIGN KEY([expertiseId])
REFERENCES [dbo].[Expertises] ([expertiseId])
GO
ALTER TABLE [dbo].[StudentExpertise] CHECK CONSTRAINT [FK_StudentExpertise_Expertises]
GO
ALTER TABLE [dbo].[StudentExpertise]  WITH CHECK ADD  CONSTRAINT [FK_StudentExpertise_Studenten] FOREIGN KEY([studentId])
REFERENCES [dbo].[Studenten] ([studentId])
GO
ALTER TABLE [dbo].[StudentExpertise] CHECK CONSTRAINT [FK_StudentExpertise_Studenten]
GO
ALTER TABLE [dbo].[StudentInteresse]  WITH CHECK ADD  CONSTRAINT [FK_StudentInteresse_Interesses] FOREIGN KEY([interesseId])
REFERENCES [dbo].[Interesses] ([interesseId])
GO
ALTER TABLE [dbo].[StudentInteresse] CHECK CONSTRAINT [FK_StudentInteresse_Interesses]
GO
ALTER TABLE [dbo].[StudentInteresse]  WITH CHECK ADD  CONSTRAINT [FK_StudentInteresse_Studenten] FOREIGN KEY([studentId])
REFERENCES [dbo].[Studenten] ([studentId])
GO
ALTER TABLE [dbo].[StudentInteresse] CHECK CONSTRAINT [FK_StudentInteresse_Studenten]
GO
ALTER TABLE [dbo].[StudentSocial]  WITH CHECK ADD  CONSTRAINT [FK_StudentSocial_Socials] FOREIGN KEY([socialId])
REFERENCES [dbo].[Socials] ([socialId])
GO
ALTER TABLE [dbo].[StudentSocial] CHECK CONSTRAINT [FK_StudentSocial_Socials]
GO
ALTER TABLE [dbo].[StudentSocial]  WITH CHECK ADD  CONSTRAINT [FK_StudentSocial_Studenten] FOREIGN KEY([studentId])
REFERENCES [dbo].[Studenten] ([studentId])
GO
ALTER TABLE [dbo].[StudentSocial] CHECK CONSTRAINT [FK_StudentSocial_Studenten]
GO
ALTER TABLE [dbo].[StudentVak]  WITH CHECK ADD  CONSTRAINT [FK_StudentVak_Studenten] FOREIGN KEY([studentId])
REFERENCES [dbo].[Studenten] ([studentId])
GO
ALTER TABLE [dbo].[StudentVak] CHECK CONSTRAINT [FK_StudentVak_Studenten]
GO
ALTER TABLE [dbo].[StudentVak]  WITH CHECK ADD  CONSTRAINT [FK_StudentVak_Vakken] FOREIGN KEY([vakId])
REFERENCES [dbo].[Vakken] ([vakId])
GO
ALTER TABLE [dbo].[StudentVak] CHECK CONSTRAINT [FK_StudentVak_Vakken]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Expertises"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Interesses"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Klassen"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Socials"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Studenten"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1047
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentExpertise"
            Begin Extent = 
               Top = 6
               Left = 1085
               Bottom = 119
               Right = 1258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentInteresse"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 198
               Right = 208
            End
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentenView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentSocial"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 215
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentVak"
            Begin Extent = 
               Top = 102
               Left = 454
               Bottom = 198
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vakken"
            Begin Extent = 
               Top = 102
               Left = 662
               Bottom = 198
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentenView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentenView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Studenten"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentVak"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vakken"
            Begin Extent = 
               Top = 234
               Left = 38
               Bottom = 330
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Klassen"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 426
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LokaalPlanner"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Lokalen"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Studenten"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPlanner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPlanner'
GO
USE [master]
GO
ALTER DATABASE [AfstandslerenDB] SET  READ_WRITE 
GO
