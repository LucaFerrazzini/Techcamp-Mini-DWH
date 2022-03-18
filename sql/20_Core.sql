IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'CORE')
BEGIN
    EXEC('CREATE SCHEMA [CORE]')
END
GO

IF OBJECT_ID('[CORE].[CORE_CAR]', 'U') IS NOT NULL
BEGIN
    DROP TABLE [CORE].[CORE_CAR]
END
CREATE TABLE [CORE].[CORE_CAR](
    [ID] INT,
    [NAME] [nvarchar](40) NULL,
    [RELEASE_YEAR] DATETIME NULL,
    [PRICE] [INT] NULL
)

IF OBJECT_ID('[CORE].[CORE_DRIVER]', 'U') IS NOT NULL
BEGIN
    DROP TABLE [CORE].[CORE_DRIVER]
END
CREATE TABLE [CORE].[CORE_DRIVER](
    [ID] INT,
    [NAME] [nvarchar](40) NULL,
    [CAR_ID] INT NULL,
    [AGE] [INT] NULL
)
GO

CREATE OR ALTER PROCEDURE [CORE].[CORE_CAR_Loader]
AS
BEGIN
    TRUNCATE TABLE [CORE].[CORE_CAR]

    INSERT INTO [CORE].[CORE_CAR]
    SELECT
    [ID],
    [NAME],
    [RELEASE_YEAR],
    [PRICE]
    FROM [ODS].[ODS_CAR]
END
GO

CREATE OR ALTER PROCEDURE [CORE].[CORE_DRIVER_Loader]
AS
BEGIN
    TRUNCATE TABLE [CORE].[CORE_DRIVER]
    
    INSERT INTO [CORE].[CORE_DRIVER]
    SELECT
    [ID],
    [NAME],
    [CAR_ID],
    [AGE]
    FROM [ODS].[ODS_DRIVER]
END
GO