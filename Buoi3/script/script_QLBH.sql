USE [master]
GO

/****** Object:  Database [QLBH]    Script Date: 9/10/2024 4:49:11 PM ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLBH.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLBH_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO

ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [QLBH] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [QLBH] SET  ENABLE_BROKER 
GO

ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [QLBH] SET RECOVERY FULL 
GO

ALTER DATABASE [QLBH] SET  MULTI_USER 
GO

ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO

ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [QLBH] SET  READ_WRITE 
GO


