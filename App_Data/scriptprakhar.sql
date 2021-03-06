USE [master]
GO
/****** Object:  Database [Demo]    Script Date: 10-02-2022 17:37:38 ******/
CREATE DATABASE [Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [Demo] SET  ENABLE_BROKER 
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
ALTER DATABASE [Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demo', N'ON'
GO
USE [Demo]
GO
/****** Object:  Table [dbo].[M_City]    Script Date: 10-02-2022 17:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NULL,
	[CityCode] [varchar](50) NULL,
	[StateId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_State]    Script Date: 10-02-2022 17:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NULL,
	[StateCode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 10-02-2022 17:37:39 ******/
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
	[CityId] [int] NULL,
	[StateId] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[M_City] ON 

INSERT [dbo].[M_City] ([CityId], [CityName], [CityCode], [StateId]) VALUES (1, N'Kanpur', N'20213', 1)
INSERT [dbo].[M_City] ([CityId], [CityName], [CityCode], [StateId]) VALUES (2, N'Sidhauli', N'89657', 2)
INSERT [dbo].[M_City] ([CityId], [CityName], [CityCode], [StateId]) VALUES (3, N'Lucknow', N'32658', 2)
INSERT [dbo].[M_City] ([CityId], [CityName], [CityCode], [StateId]) VALUES (4, N'Allahabad', N'63599', 1)
INSERT [dbo].[M_City] ([CityId], [CityName], [CityCode], [StateId]) VALUES (5, N'Sitapur', N'63258', 3)
SET IDENTITY_INSERT [dbo].[M_City] OFF
GO
SET IDENTITY_INSERT [dbo].[M_State] ON 

INSERT [dbo].[M_State] ([StateId], [StateName], [StateCode]) VALUES (1, N'UP', N'2656')
INSERT [dbo].[M_State] ([StateId], [StateName], [StateCode]) VALUES (2, N'MP', N'5564')
INSERT [dbo].[M_State] ([StateId], [StateName], [StateCode]) VALUES (3, N'Bihar', N'5566')
SET IDENTITY_INSERT [dbo].[M_State] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [Name], [Class], [MobileNo], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [CityId], [StateId]) VALUES (1, N'Alakshendra Singh', N'Diploma', N'9554386401', 1, CAST(N'2022-02-07T18:38:45.680' AS DateTime), NULL, CAST(N'2022-02-07T22:00:51.587' AS DateTime), NULL, NULL, NULL, 2, 2)
INSERT [dbo].[Students] ([StudentId], [Name], [Class], [MobileNo], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [CityId], [StateId]) VALUES (2, N'munabachha', N'diploma', N'955438401', 1, CAST(N'2022-02-07T21:49:03.447' AS DateTime), NULL, CAST(N'2022-02-07T22:15:49.380' AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Students] ([StudentId], [Name], [Class], [MobileNo], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [CityId], [StateId]) VALUES (3, N'alakshendra', N'Diploma', N'9554386401', NULL, CAST(N'2022-02-07T22:27:03.997' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Students] ([StudentId], [Name], [Class], [MobileNo], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [CityId], [StateId]) VALUES (4, N'Alakshendra Singhh', N'Diploma', N'9554386401', NULL, CAST(N'2022-02-07T22:36:06.907' AS DateTime), NULL, CAST(N'2022-02-08T21:42:14.570' AS DateTime), NULL, NULL, NULL, 5, 3)
INSERT [dbo].[Students] ([StudentId], [Name], [Class], [MobileNo], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy], [CityId], [StateId]) VALUES (5, N'alakshendra nn', N'knnn', N'9895656335', NULL, CAST(N'2022-02-08T21:42:46.787' AS DateTime), NULL, NULL, NULL, NULL, NULL, 2, 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddStudents]    Script Date: 10-02-2022 17:37:39 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_AddStudentsWithCity]    Script Date: 10-02-2022 17:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_AddStudentsWithCity]     
@StudentId int=0,    
@Name nvarchar(50)=null,    
@Class nvarchar(50)=null,    
@MobileNo nvarchar(15)=null,   
@CityId    int,  
@StateId   int,  
@ProcId int=0    
    
As Begin    
 IF(@procid=1)    
 BEGIN    
    IF NOT EXISTS(SELECT 1 FROM Students WHERE Name=@Name AND isnull(IsDeleted,0)=1)    
    BEGIN    
         INSERT INTO dbo.Students ( Name,Class,MobileNo,CityId,StateId)    
            VALUES ( @Name,@Class,@MobileNo,@CityId,@StateId)    
    
   SELECT   'success' msg, StudentId, Name,Class,MobileNo ,CityId,StateId   
   FROM            Students d    
   WHERE         isnull(IsDeleted,0)=0     
    END    
     else    
    begin    
    SELECT   'exists' msg, StudentId, Name,Class,MobileNo ,CityId,StateId   
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
   CityId=@CityId,  
   StateId=@StateId,  
   UpdatedOn = getdate()    
  WHERE StudentId=@StudentId     
      
  SELECT     'update' msg, StudentId, Name,Class,MobileNo ,CityId,StateId   
   FROM            Students d    
   WHERE         isnull(IsDeleted,0)=0     
 END    
  IF(@procid=3)    
 BEGIN    
 Select StudentId, Name,Class,MobileNo,CityId CityId1,StateId ,  
            (select CityName from M_City where d.CityId=CityId)City,  
   (select StateName from M_State where d.StateId=StateId)State  
   FROM            Students d    
   WHERE    StudentId=@StudentId and     isnull(IsDeleted,0)=0     
 END    
    
  IF(@procid=4)    
 BEGIN    
 SELECT      StudentId, Name,Class,MobileNo,CityId CityId1,StateId,  
            (select CityName from M_City where d.CityId=CityId)City,  
   (select StateName from M_State where d.StateId=StateId)State  
   FROM            Students d     
   WHERE         isnull(IsDeleted,0)=0     
 END    
 IF(@procid=5)    
 BEGIN    
  update Students set IsDeleted=1 where StudentId=@StudentId     
 END    
End 
GO
/****** Object:  StoredProcedure [dbo].[Sp_Master]    Script Date: 10-02-2022 17:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure  [dbo].[Sp_Master]
(@ProcId int=0)
as begin
  if(@ProcId=1)
   begin
    select '0'MasterId,'--Select State--'MasterName from M_State
	union
	select StateId MasterId,StateName MasterName from M_State order by MasterId
  end
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_MasterById]    Script Date: 10-02-2022 17:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Sp_MasterById]
(@ProcId int=0,
@Id int=0
)
as begin
  if(@ProcId=1)
   begin
    select '0'MasterId,'--Select City--'MasterName from M_City
	union
	select CityId MasterId,CityName MasterName from M_City where stateid=@id order by MasterId
  end
end
GO
USE [master]
GO
ALTER DATABASE [Demo] SET  READ_WRITE 
GO
