IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ODS')
BEGIN
        CREATE SCHEMA [ODS]
        GO
END
 
/****** Object:  Table [dbo].[PayloadHash]    Script Date: 16.03.2022 17:21:12 ******/
SET ANSI_NULLS ON
GO
 
SET QUOTED_IDENTIFIER ON
GO
 
IF OBJECT_ID('[ODS].[ODS_CAR]', 'U') IS NULL
BEGIN
CREATE TABLE [ODS].[ODS_CAR](
            [ID] INT,
            [NAME] [nvarchar](40) NULL,
            [RELEASE_YEAR] DATETIME NULL,
            [PRICE] [INT] NULL
)
END

IF OBJECT_ID('[ODS].[ODS_DRIVER]', 'U') IS NULL
BEGIN
CREATE TABLE [ODS].[ODS_DRIVER](
            [ID] INT,
            [NAME] [nvarchar](40) NULL,
            [CAR_ID] INT NULL,
            [AGE] [INT] NULL
)
END
 
IF OBJECT_ID('[ODS].[ODS_CAR_Loader]', 'U') IS NULL
BEGIN
        CREATE OR ALTER PROCEDURE [ODS].[ODS_CAR_Loader]
        AS
                    INSERT INTO [ODS].[ODS_CAR]
                    SELECT
                    [ID],
                    [NAME],
                    [RELEASE_YEAR],
                    [PRICE]
                    FROM [SOURCE].[SOURCE_CAR]
        END
END

IF OBJECT_ID('[ODS].[ODS_DRIVER_Loader]', 'U') IS NULL
BEGIN
        CREATE OR ALTER PROCEDURE [ODS].[ODS_DRIVER_Loader]
        AS
                    INSERT INTO [ODS].[ODS_DRIVER]
                    SELECT
                    [ID],
                    [NAME],
                    [CAR_ID],
                    [AGE]
                    FROM [SOURCE].[SOURCE_DRIVER]
        END
END