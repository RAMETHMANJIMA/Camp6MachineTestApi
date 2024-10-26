USE [master]
GO
/****** Object:  Database [Camp6MachineTest]    Script Date: 26-10-2024 17:02:21 ******/
CREATE DATABASE [Camp6MachineTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Camp6MachineTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Camp6MachineTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Camp6MachineTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Camp6MachineTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Camp6MachineTest] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Camp6MachineTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Camp6MachineTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Camp6MachineTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Camp6MachineTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Camp6MachineTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Camp6MachineTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET RECOVERY FULL 
GO
ALTER DATABASE [Camp6MachineTest] SET  MULTI_USER 
GO
ALTER DATABASE [Camp6MachineTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Camp6MachineTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Camp6MachineTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Camp6MachineTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Camp6MachineTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Camp6MachineTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Camp6MachineTest', N'ON'
GO
ALTER DATABASE [Camp6MachineTest] SET QUERY_STORE = ON
GO
ALTER DATABASE [Camp6MachineTest] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Camp6MachineTest]
GO
/****** Object:  Table [dbo].[BackgroundVerification]    Script Date: 26-10-2024 17:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackgroundVerification](
	[VerificationID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [int] NULL,
	[LoanOfficerID] [int] NULL,
	[Status] [varchar](20) NULL,
	[Notes] [text] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[VerificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 26-10-2024 17:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Comments] [text] NOT NULL,
	[Rating] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Help]    Script Date: 26-10-2024 17:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Help](
	[HelpID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [text] NOT NULL,
	[Answer] [text] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[HelpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 26-10-2024 17:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[LoanID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Status] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanVerification]    Script Date: 26-10-2024 17:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanVerification](
	[VerificationID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [int] NULL,
	[LoanOfficerID] [int] NULL,
	[Status] [varchar](20) NULL,
	[Notes] [text] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[VerificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 26-10-2024 17:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26-10-2024 17:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RoleID] [int] NULL,
	[Email] [varchar](100) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BackgroundVerification] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[BackgroundVerification] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BackgroundVerification] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Help] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Help] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Loans] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Loans] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Loans] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[LoanVerification] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[LoanVerification] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[LoanVerification] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[BackgroundVerification]  WITH CHECK ADD FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loans] ([LoanID])
GO
ALTER TABLE [dbo].[BackgroundVerification]  WITH CHECK ADD FOREIGN KEY([LoanOfficerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[LoanVerification]  WITH CHECK ADD FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loans] ([LoanID])
GO
ALTER TABLE [dbo].[LoanVerification]  WITH CHECK ADD FOREIGN KEY([LoanOfficerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[BackgroundVerification]  WITH CHECK ADD CHECK  (([Status]='Failed' OR [Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD CHECK  (([Status]='Rejected' OR [Status]='Approved' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[LoanVerification]  WITH CHECK ADD CHECK  (([Status]='Not Verified' OR [Status]='Verified' OR [Status]='Pending'))
GO
USE [master]
GO
ALTER DATABASE [Camp6MachineTest] SET  READ_WRITE 
GO
