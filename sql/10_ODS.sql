CREATE SCHEMA [SOURCE] AUTHORIZATION [sa]
GO
 
 
IF OBJECT_ID('[SOURCE].[SOURCE_CAR]', 'U') IS NOT NULL
BEGIN
CREATE TABLE [SOURCE].[SOURCE_CAR](
            [NAME] [char](40) NULL,
            [RELEASE_YEAR] DATETIME NULL,
            [PRICE] [INT] NULL
)
END
 
 
-------------------------------
 
USE [LFE_TEST]
GO

CREATE SCHEMA [ODS] AUTHORIZATION [sa]
GO
 
/****** Object:  Table [dbo].[PayloadHash]    Script Date: 16.03.2022 17:21:12 ******/
SET ANSI_NULLS ON
GO
 
SET QUOTED_IDENTIFIER ON
GO
 
IF OBJECT_ID('[ODS].[ODS_CAR]', 'U') IS NOT NULL
BEGIN
CREATE TABLE [ODS].[ODS_CAR](
            [NAME] [char](40) NULL,
            [RELEASE_YEAR] DATETIME NULL,
            [PRICE] [INT] NULL
)
END
 
IF OBJECT_ID('[ODS].[ODS_CAR_Loader]', 'U') IS NOT NULL
BEGIN
        CREATE PROCEDURE [ODS].[ODS_CAR_Loader]
        AS
                    INSERT INTO [ODS].[ODS_CAR]
                    SELECT
                    [NAME],
                    [RELEASE_YEAR],
                    [PRICE]
                    FROM [SOURCE].[SOURCE_CAR]
        END
END