CREATE OR ALTER PROCEDURE VALIDATE_SQL (@sql varchar(max)) AS
BEGIN
    BEGIN TRY
        SET @sql = 'SET PARSEONLY ON;' + REPLACE ( @sql , '''' , '''''' );
        EXEC(@sql);
    END TRY
    BEGIN CATCH
        RAISERROR ('SQL deployment script does contain syntax error!', -- Message text.  
               17, -- Severity.  
               -1 -- State.  
               ) WITH LOG; 
    END CATCH;
END; -- IsValidSQL

EXEC VALIDATE_SQL @sql = '
