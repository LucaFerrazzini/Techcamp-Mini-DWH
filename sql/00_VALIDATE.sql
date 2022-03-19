CREATE OR ALTER PROCEDURE VALIDATE_SQL (@sql varchar(max)) AS
BEGIN
    BEGIN TRY
        SET @sql = 'SET PARSEONLY ON;' + REPLACE ( @sql , '''' , '''''' );
        EXEC(@sql);
    END TRY
    BEGIN CATCH
        RAISERROR('test',16,1);
        RAISERROR('##vso[task.logissue type=error]SQL-Script contains synrtax-errors!',16,1);
        PRINT 'test';
        PRINT '##vso[task.logissue result=failed]SQL-Script contains synrtax-errors!';
        RAISERROR('##vso[task.logissue result=failed]SQL-Script contains synrtax-errors!', 10, 1) WITH NOWAIT
        RAISERROR('##vso[task.logissue type=error]SQL-Script contains synrtax-errors!', 10, 1) WITH NOWAIT
    END CATCH;
END; -- IsValidSQL

EXEC VALIDATE_SQL @sql = '
