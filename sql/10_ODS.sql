IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ODS')
BEGIN
        EXEC('CREATE SCHEMA [ODS]')
END
GO

IF OBJECT_ID('[ODS].[ODS_CAR]', 'U') IS NOT NULL
BEGIN
    DROP TABLE [ODS].[ODS_CAR]
END
CREATE TABLE [ODS].[ODS_CAR](
        [ID] INT,
        [NAME] [nvarchar](40) NULL,
        [RELEASE_YEAR] DATETIME NULL,
        [PRICE] [INT] NULL
)

IF OBJECT_ID('[ODS].[ODS_DRIVER]', 'U') IS NOT NULL
BEGIN
    DROP TABLE [ODS].[ODS_DRIVER]
END
CREATE TABLE [ODS].[ODS_DRIVER](
        [ID] INT,
        [NAME] [nvarchar](40) NULL,
        [CAR_ID] INT NULL,
        [AGE] [INT] NULL
)
GO

CREATE OR ALTER PROCEDURE [ODS].[ODS_CAR_Loader]
AS
BEGIN
        INSERT INTO [ODS].[ODS_CAR]
        SELECT
        [ID],
        [NAME],
        [RELEASE_YEAR],
        [PRICE]
        FROM [SOURCE].[SOURCE_CAR]
END
GO

CREATE OR ALTER PROCEDURE [ODS].[ODS_DRIVER_Loader]
AS
BEGIN
        INSERT INTO [ODS].[ODS_DRIVER]
        SELECT
        [ID],
        [NAME],
        [CAR_ID],
        [AGE]
        FROM [SOURCE].[SOURCE_DRIVER]
END
