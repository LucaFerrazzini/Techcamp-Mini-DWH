CREATE OR ALTER PROCEDURE VALIDATE_SQL (@sql varchar(max)) AS
BEGIN
    BEGIN TRY
        SET @sql = 'SET PARSEONLY ON;' + REPLACE ( @sql , '''' , '''''' );
        EXEC(@sql);
    END TRY
    BEGIN CATCH
        PRINT '##vso[task.logissue result=failed]SQL-Script contains synrtax-errors!';
    END CATCH;
END; -- IsValidSQL

EXEC VALIDATE_SQL @sql = '
