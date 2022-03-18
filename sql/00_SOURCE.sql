CREATE SCHEMA [SOURCE]
GO
 
 
IF OBJECT_ID('[SOURCE].[SOURCE_CAR]', 'U') IS NOT NULL
BEGIN
CREATE TABLE [SOURCE].[SOURCE_CAR](
            [ID] INT,
            [NAME] [nvarchar](40) NULL,
            [RELEASE_YEAR] DATETIME NULL,
            [PRICE] [INT] NULL
)
END
 
IF OBJECT_ID('[SOURCE].[SOURCE_DRIVER]', 'U') IS NOT NULL
BEGIN
CREATE TABLE [SOURCE].[SOURCE_DRIVER](
            [ID] INT,
            [NAME] [nvarchar](40) NULL,
            [CAR_ID] INT NULL,
            [AGE] [INT] NULL
)
END
 

INSERT INTO [SOURCE].[SOURCE_CAR] ([ID], [NAME], [RELEASE_YEAR], [PRICE])
VALUES (0, 'FORD', DATEADD(year, -10, GETDATE()), 10000),
(1, 'HONDA', DATEADD(year, -5, GETDATE()), 15000),
(2, 'VW', DATEADD(year, -7, GETDATE()), 20000),
(3, 'BMW', DATEADD(year, -1, GETDATE()), 40000);

INSERT INTO [SOURCE].[SOURCE_DRIVER] ([ID], [NAME], [CAR_ID], [AGE])
VALUES (0, 'Peter', 3, 25),
(1, 'Hans', 1, 23),
(2, 'Loren', 0, 21),
(3, 'Sabine', 2, 20),
(4, 'Sandro', 1, 30);