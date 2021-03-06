USE [master]
GO
/****** Object:  Database [Demo]    Script Date: 19-06-2021 10:28:18 ******/
CREATE DATABASE [Demo] ON  PRIMARY 
( NAME = N'Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo] SET RECOVERY FULL 
GO
ALTER DATABASE [Demo] SET  MULTI_USER 
GO
ALTER DATABASE [Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demo', N'ON'
GO
USE [Demo]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 19-06-2021 10:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Class] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](15) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [Name], [Class], [MobileNo], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (1, N'Prakhar', N'MCA', N'7905257939', 1, CAST(N'2021-06-19T10:16:04.270' AS DateTime), NULL, CAST(N'2021-06-19T10:22:25.743' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [Name], [Class], [MobileNo], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (2, N'Prakhar Srivastava', N'MCA', N'7905257938', NULL, CAST(N'2021-06-19T10:26:51.620' AS DateTime), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddStudents]    Script Date: 19-06-2021 10:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_AddStudents] 
@StudentId int=0,
@Name nvarchar(50)=null,
@Class nvarchar(50)=null,
@MobileNo nvarchar(15)=null,
@ProcId int=0

As Begin
	IF(@procid=1)
	BEGIN
	   IF NOT EXISTS(SELECT 1 FROM Students WHERE Name=@Name AND isnull(IsDeleted,0)=1)
	   BEGIN
	   	    INSERT INTO dbo.Students ( Name,Class,MobileNo)
            VALUES ( @Name,@Class,@MobileNo)

			SELECT   'success' msg, StudentId, Name,Class,MobileNo
			FROM            Students d
			WHERE         isnull(IsDeleted,0)=0 
	   END
	    else
	   begin
	   SELECT   'exists' msg, StudentId, Name,Class,MobileNo
			FROM            Students d
			WHERE         isnull(IsDeleted,0)=0 
	   end
	END
		IF(@procid=2)
	BEGIN
		UPDATE dbo.Students
		SET
			Name = @Name,
			Class=@Class,
			MobileNo =@MobileNo,
			UpdatedOn = getdate()
		WHERE StudentId=@StudentId 
		
		SELECT     'update' msg, StudentId, Name,Class,MobileNo
			FROM            Students d
			WHERE         isnull(IsDeleted,0)=0 
	END
		IF(@procid=3)
	BEGIN
	Select StudentId, Name,Class,MobileNo
			FROM            Students d
			WHERE    StudentId=@StudentId and     isnull(IsDeleted,0)=0 
	END

		IF(@procid=4)
	BEGIN
	SELECT      StudentId, Name,Class,MobileNo
			FROM            Students d
			WHERE         isnull(IsDeleted,0)=0 
	END
	IF(@procid=5)
	BEGIN
		update Students set IsDeleted=1 where StudentId=@StudentId 
	END
End
GO
USE [master]
GO
ALTER DATABASE [Demo] SET  READ_WRITE 
GO
