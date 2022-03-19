CREATE OR ALTER PROCEDURE VALIDATE_SQL (@sql varchar(max)) AS
BEGIN
    BEGIN TRY
        SET @sql = 'SET PARSEONLY ON;' + REPLACE ( @sql , '''' , '''''' );
        EXEC(@sql);
    END TRY
    BEGIN CATCH
        RAISERROR('##vso[task.logissue type=error]SQL-Script contains synrtax-errors!',16,1);
    END CATCH;
END; -- IsValidSQL

EXEC VALIDATE_SQL @sql = '
