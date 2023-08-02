USE [master]
GO
/****** Object:  Database [SchoolDb]    Script Date: 2.08.2023 19:34:41 ******/
CREATE DATABASE [SchoolDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\SchoolDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\SchoolDb_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SchoolDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDb] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolDb] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolDb', N'ON'
GO
ALTER DATABASE [SchoolDb] SET QUERY_STORE = OFF
GO
USE [SchoolDb]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Towns]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CityId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [tinyint] NOT NULL,
	[TownId] [int] NOT NULL,
	[DistrictId] [int] NULL,
	[NeighbourhoodId] [int] NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[BuildingNumber] [smallint] NOT NULL,
	[Floor] [tinyint] NULL,
	[Apartment] [smallint] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Neighbourhoods]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Neighbourhoods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[DistrictId] [int] NOT NULL,
 CONSTRAINT [PK_Neighbourhoods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetAddresses]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetAddresses] as
 select c.[Name] as Şehir,t.[Name] as İlçe,d.[Name] as Semt,n.[Name] as Mahalle,a.Street as Cadde,a.BuildingNumber as Numara,a.[Floor] as Kat,a.Apartment as Daire from Addresses as a inner join Cities as c 
 on a.CityId = c.Id inner join Towns as t
 on a.TownId = t.Id inner join Districts as d
 on a.DistrictId = d.Id inner join Neighbourhoods as n
 on a.NeighbourhoodId = n.Id
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Duties]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Duties](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ReportsTo] [tinyint] NULL,
 CONSTRAINT [PK_Duties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[PersonId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[DutyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[IdentityNumber] [char](11) NOT NULL,
	[Birtday] [datetime] NOT NULL,
	[PlaceOfBirth] [varchar](50) NOT NULL,
	[MotherName] [varchar](50) NOT NULL,
	[FatherName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetTeacher]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetTeacher] as
select p.FirstName, p.LastName,p.IdentityNumber,p.Birtday,p.PlaceOfBirth,p.MotherName, p.FatherName, b.Name as Branş, d.Name as Görev from Persons as p inner join Teachers as t
on p.Id = t.PersonId inner join Branches as b
on t.BranchId = b.Id inner join Duties as d
on t.DutyId = d.Id
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ClassAndTeacherAndLessonId] [int] NOT NULL,
	[Exam1] [tinyint] NULL,
	[Exam2] [tinyint] NULL,
	[Exam3] [tinyint] NULL,
	[GradeAverage] [decimal](5, 2) NULL,
	[IsState] [bit] NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_Classrooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[PersonId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StudentNumber] [char](10) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersWithLessons]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersWithLessons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[LessonId] [int] NULL,
 CONSTRAINT [PK_TeachersWithLessons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_TeachersWithLessons_TeacherId_LessonId] UNIQUE NONCLUSTERED 
(
	[LessonId] ASC,
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassroomsAndLessonsAndTeachers]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassroomsAndLessonsAndTeachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassroomId] [tinyint] NOT NULL,
	[TeacherAndLessonId] [int] NOT NULL,
 CONSTRAINT [PK_ClassroomsAndLessonsAndTeachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetNotes]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[GetNotes] as
select p.FirstName + ' ' + p.LastName as Öğrenci, c.Name as Sınıf,l.Name as Ders, p2.FirstName + ' ' + p2.LastName as Öğretmen, n.Exam1 as Sınav1, n.Exam2 as Sınav2,n.Exam3 as Sınav3,n.GradeAverage as Ortalama from Notes as n inner join Students as s
on n.StudentId=s.PersonId inner join ClassroomsAndLessonsAndTeachers as clt
on n.ClassAndTeacherAndLessonId = clt.Id inner join TeachersWithLessons as tl
on clt.TeacherAndLessonId = tl.Id inner join Teachers t
on tl.TeacherId = t.PersonId inner join Lessons as l
on tl.LessonId = l.Id inner join Persons as p
on s.PersonId=p.Id inner join Persons as p2
on t.PersonId=p2.Id inner join Classrooms c
on clt.ClassroomId = c.Id
GO
/****** Object:  View [dbo].[GetStudents]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetStudents] as
select p.FirstName as Adı, p.LastName as Soyadı, p.IdentityNumber as [Kimlik No],p.Birtday as [Doğum Tarihi], p.MotherName as [Anne Adı],p.FatherName as [Baba Adı],s.IsActive as [Aktif Mi?] from Students as s inner join Persons as p 
on s.PersonId=p.Id
GO
/****** Object:  View [dbo].[GetActiveStudents]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[GetActiveStudents] as
select p.FirstName as Adı, p.LastName as Soyadı, p.IdentityNumber as [Kimlik No],p.Birtday as [Doğum Tarihi], p.MotherName as [Anne Adı],p.FatherName as [Baba Adı],s.IsActive as [Aktif Mi?] from Students as s inner join Persons as p 
on s.PersonId=p.Id where s.IsActive='1'
GO
/****** Object:  Table [dbo].[AddressAndPersons]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressAndPersons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NULL,
	[PersonId] [int] NULL,
 CONSTRAINT [PK_AddressAndPersons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_AddressAndPersons] UNIQUE NONCLUSTERED 
(
	[AddressId] ASC,
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetPersonAddresses]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetPersonAddresses] as
select p.FirstName + ' ' + p.LastName as [Ad Soyad], p.IdentityNumber as [Kimlik No],p.Birtday as [Doğum Tarihi], p.PlaceOfBirth as [Doğum Yeri], p.MotherName as [Anne Adı], p.FatherName as [Baba Adı], d.Name as Semt,n.Name as Mahalle, a.Street as [Cadde - Sokak], a.BuildingNumber as [Bina No], a.Floor as Kat, a.Apartment as [Daire No], t.Name as İlçe, c.Name as Şehir from Persons as p inner join AddressAndPersons as ap
on p.Id=ap.PersonId inner join Addresses as a
on ap.AddressId=a.Id inner join Cities as c
on a.CityId=c.Id inner join Towns as t
on a.TownId=t.Id inner join Districts as d
on a.DistrictId=d.Id inner join Neighbourhoods as n
on a.NeighbourhoodId=n.Id
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MailAddrees] [varchar](50) NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [char](16) NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentsWithLessons]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsWithLessons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student] [int] NULL,
	[Lesson] [int] NULL,
 CONSTRAINT [PK_StudentsWithLessons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AddressAndPersons]  WITH CHECK ADD  CONSTRAINT [FK_AddressAndPersons_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[AddressAndPersons] CHECK CONSTRAINT [FK_AddressAndPersons_Addresses]
GO
ALTER TABLE [dbo].[AddressAndPersons]  WITH CHECK ADD  CONSTRAINT [FK_AddressAndPersons_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[AddressAndPersons] CHECK CONSTRAINT [FK_AddressAndPersons_Persons]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Cities]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Districts]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Neighbourhoods] FOREIGN KEY([NeighbourhoodId])
REFERENCES [dbo].[Neighbourhoods] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Neighbourhoods]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Classrooms]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([PersonId])
GO
ALTER TABLE [dbo].[Classrooms] CHECK CONSTRAINT [FK_Classrooms_Students]
GO
ALTER TABLE [dbo].[ClassroomsAndLessonsAndTeachers]  WITH CHECK ADD  CONSTRAINT [FK_ClassroomsAndLessonsAndTeachers_Classrooms] FOREIGN KEY([ClassroomId])
REFERENCES [dbo].[Classrooms] ([Id])
GO
ALTER TABLE [dbo].[ClassroomsAndLessonsAndTeachers] CHECK CONSTRAINT [FK_ClassroomsAndLessonsAndTeachers_Classrooms]
GO
ALTER TABLE [dbo].[ClassroomsAndLessonsAndTeachers]  WITH CHECK ADD  CONSTRAINT [FK_ClassroomsAndLessonsAndTeachers_TeachersWithLessons] FOREIGN KEY([TeacherAndLessonId])
REFERENCES [dbo].[TeachersWithLessons] ([Id])
GO
ALTER TABLE [dbo].[ClassroomsAndLessonsAndTeachers] CHECK CONSTRAINT [FK_ClassroomsAndLessonsAndTeachers_TeachersWithLessons]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([Id])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Towns]
GO
ALTER TABLE [dbo].[Duties]  WITH CHECK ADD  CONSTRAINT [FK_Duties_Duties] FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Duties] ([Id])
GO
ALTER TABLE [dbo].[Duties] CHECK CONSTRAINT [FK_Duties_Duties]
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_Persons]
GO
ALTER TABLE [dbo].[Neighbourhoods]  WITH CHECK ADD  CONSTRAINT [FK_Neighbourhoods_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([Id])
GO
ALTER TABLE [dbo].[Neighbourhoods] CHECK CONSTRAINT [FK_Neighbourhoods_Districts]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([PersonId])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Students]
GO
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD  CONSTRAINT [FK_Phones_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK_Phones_Persons]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Persons]
GO
ALTER TABLE [dbo].[StudentsWithLessons]  WITH CHECK ADD  CONSTRAINT [FK_StudentsWithLessons_Lessons] FOREIGN KEY([Lesson])
REFERENCES [dbo].[Lessons] ([Id])
GO
ALTER TABLE [dbo].[StudentsWithLessons] CHECK CONSTRAINT [FK_StudentsWithLessons_Lessons]
GO
ALTER TABLE [dbo].[StudentsWithLessons]  WITH CHECK ADD  CONSTRAINT [FK_StudentsWithLessons_Students] FOREIGN KEY([Student])
REFERENCES [dbo].[Students] ([PersonId])
GO
ALTER TABLE [dbo].[StudentsWithLessons] CHECK CONSTRAINT [FK_StudentsWithLessons_Students]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Branches1] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Branches1]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Duties] FOREIGN KEY([DutyId])
REFERENCES [dbo].[Duties] ([Id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Duties]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Persons]
GO
ALTER TABLE [dbo].[TeachersWithLessons]  WITH CHECK ADD  CONSTRAINT [FK_TeachersWithLessons_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([Id])
GO
ALTER TABLE [dbo].[TeachersWithLessons] CHECK CONSTRAINT [FK_TeachersWithLessons_Lessons]
GO
ALTER TABLE [dbo].[TeachersWithLessons]  WITH CHECK ADD  CONSTRAINT [FK_TeachersWithLessons_Teachers] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([PersonId])
GO
ALTER TABLE [dbo].[TeachersWithLessons] CHECK CONSTRAINT [FK_TeachersWithLessons_Teachers]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Cities]
GO
/****** Object:  StoredProcedure [dbo].[AddAddress]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[AddAddress] @cityId tinyint,@townId int,@districtId int,@neighbourhoodId int,@street varchar(50),@buildingNumber smallint, @floor tinyint, @apartment smallint
 as
 begin
 insert into Addresses values (@cityId,@townId,@districtId,@neighbourhoodId,@street,@buildingNumber,@floor,@apartment)
 end
GO
/****** Object:  StoredProcedure [dbo].[AddBranch]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddBranch] @name varchar(50)
as
begin
insert into Branches values (@name)
end
GO
/****** Object:  StoredProcedure [dbo].[AddDuty]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddDuty] @name varchar(50), @reportsId tinyint
as
begin
if @reportsId > 0 begin
 insert into Duties values (@name,@reportsId)
 end
 else
 begin
 insert into Duties (Name) values (@name)
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[AddLesson]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[AddLesson] @name varchar(50)
 as
 begin
 insert into Lessons values (@name)
 end
GO
/****** Object:  StoredProcedure [dbo].[AddNote]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNote] @studentId int, @classAndTeacherAndLessonId int, @exam1 int, @exam2 int, @exam3 int
as begin
declare @id int
insert into Notes (StudentId,ClassAndTeacherAndLessonId,Exam1,Exam2,Exam3) values (@studentId,@classAndTeacherAndLessonId,@exam1,@exam2,@exam3)
set @id = (select max(Id) from Notes) 
exec UpdateNote @id,@exam1,@exam2,@exam3
end
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddStudent] @firstName varchar(50),@lastName varchar(50),@identityNumber char(11),@birthDay datetime, @placeOfBirth varchar(50),@motherName varchar(50), @fatherName varchar(50)
as
begin
declare @personId int
declare @isActive bit
insert into Persons values(@firstName,@lastName,@identityNumber,@birthDay,@placeOfBirth,@motherName,@fatherName)
set @personId = (select top 1 Id from Persons order by Id desc)
set @isActive='1'
insert into Students values (@personId,@isActive)
end
GO
/****** Object:  StoredProcedure [dbo].[AddTeacher]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddTeacher] @firstName varchar(50),@lastName varchar(50),@identityNumber char(11),@birthDay datetime, @placeOfBirth varchar(50),@motherName varchar(50), @fatherName varchar(50), @branchId int,@dutyId tinyint,@isActive bit
as
begin
declare @personId int
insert into Persons values(@firstName,@lastName,@identityNumber,@birthDay,@placeOfBirth,@motherName,@fatherName)
set @personId = (select max(Id) from Persons)
insert into Teachers values (@personId, @branchId,@dutyId,@isActive)
end
GO
/****** Object:  StoredProcedure [dbo].[AssignmentClassroomLessonTeacher]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AssignmentClassroomLessonTeacher] @classroomId tinyint,@teacherAndLessonId int
 as begin
 insert into ClassroomsAndLessonsAndTeachers values (@classroomId,@teacherAndLessonId)
 end
GO
/****** Object:  StoredProcedure [dbo].[AssignmentStudentsAndLessons]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[AssignmentStudentsAndLessons] @studentId int,@lessonId int
 as
 begin
 insert into StudentsWithLessons values (@studentId,@lessonId)
 end
GO
/****** Object:  StoredProcedure [dbo].[AssingmentAddressPerson]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AssingmentAddressPerson] @addressId int, @personId int
as begin
insert into AddressAndPersons values (@addressId,@personId)
end
GO
/****** Object:  StoredProcedure [dbo].[AssingmentStudentsClass]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[AssingmentStudentsClass] @name varchar(50), @studentId int
as
begin
insert into Classrooms values (@name,@studentId)
end
GO
/****** Object:  StoredProcedure [dbo].[AssingmentTeacherAndLesson]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AssingmentTeacherAndLesson] @teacherId int, @lessonId int
 as
 begin
 insert into TeachersWithLessons values (@teacherId,@lessonId)
 end
GO
/****** Object:  StoredProcedure [dbo].[UpdateNote]    Script Date: 2.08.2023 19:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateNote] @id int, @exam1 int,@exam2 int,@exam3 int
as begin
declare @gradeAverage decimal(5,2), @isState bit, @noteCount int 
set @noteCount = 0
if(@exam1 is not null)
begin
set @noteCount += 1
end
if(@exam2 is not null)
begin
set @noteCount += 1
end
if(@exam3 is not null)
begin
set @noteCount +=1
end
set @gradeAverage = cast((@exam1+@exam2+@exam3)/@noteCount as decimal(5,2))
if(@gradeAverage >=55) begin
set @isState = '1'
end
else
begin
set @isState = '0'
end
update Notes set Exam1=@exam1, Exam2=@exam2, Exam3=@exam3,GradeAverage= @gradeAverage, IsState=@isState where Id=@id
end
GO
USE [master]
GO
ALTER DATABASE [SchoolDb] SET  READ_WRITE 
GO
