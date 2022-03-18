CREATE SCHEMA [CORE]
GO
  
IF OBJECT_ID('[CORE].[CORE_CAR]', 'U') IS NOT NULL
BEGIN
CREATE TABLE [CORE].[CORE_CAR](
            [ID] INT,
            [NAME] [nvarchar](40) NULL,
            [RELEASE_YEAR] DATETIME NULL,
            [PRICE] [INT] NULL
)
END

IF OBJECT_ID('[CORE].[CORE_DRIVER]', 'U') IS NOT NULL
BEGIN
CREATE TABLE [CORE].[CORE_DRIVER](
            [ID] INT,
            [NAME] [nvarchar](40) NULL,
            [CAR_ID] INT NULL,
            [AGE] [INT] NULL
)
END
 
IF OBJECT_ID('[CORE].[CORE_CAR_Loader]', 'U') IS NOT NULL
BEGIN
        CREATE PROCEDURE [CORE].[CORE_CAR_Loader]
        AS
                    INSERT INTO [CORE].[CORE_CAR]
                    SELECT
                    [ID],
                    [NAME],
                    [RELEASE_YEAR],
                    [PRICE]
                    FROM [ODS].[ODS_CAR]
        END
END

IF OBJECT_ID('[CORE].[CORE_DRIVER_Loader]', 'U') IS NOT NULL
BEGIN
        CREATE PROCEDURE [CORE].[CORE_DRIVER_Loader]
        AS
                    INSERT INTO [CORE].[CORE_DRIVER]
                    SELECT
                    [ID],
                    [NAME],
                    [CAR_ID],
                    [AGE]
                    FROM [ODS].[ODS_DRIVER]
        END
END