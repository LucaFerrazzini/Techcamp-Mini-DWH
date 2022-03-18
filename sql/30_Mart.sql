IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'MART')
BEGIN
    CREATE SCHEMA [MART]
    GO
END
  
IF OBJECT_ID('[MART].[MART_CAR_DRIVER]', 'U') IS NULL
BEGIN
CREATE TABLE [MART].[MART_CAR_DRIVER](
            [NAME_DRIVER] [nvarchar](40) NULL,
            [NAME_CAR] [nvarchar](40) NULL
)
END

 
IF OBJECT_ID('[MART].[MART_CAR_DRIVER_Loader]', 'U') IS NULL
BEGIN
        CREATE OR ALTER PROCEDURE [MART].[MART_CAR_Loader]
        AS
                    INSERT INTO [MART].[MART_CAR_DRIVER]
                    SELECT
                    [DRIVER].[NAME],
                    [CAR].[NAME]
                    FROM [CORE].[CORE_DRIVER] [DRIVER]
                    LEFT JOIN [CORE].[CORE_CAR] [CAR]
                    ON CAR.ID = DRIVER.CAR_ID
        END
END
