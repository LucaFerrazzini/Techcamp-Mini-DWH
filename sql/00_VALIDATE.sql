CREATE OR ALTER PROCEDURE VALIDATE_SQL (@sql varchar(max)) AS
BEGIN
    BEGIN TRY
        SET @sql = 'set parseonly on;' + REPLACE ( @sql , '''' , '''''' );
        EXEC(@sql);
    END TRY
    BEGIN CATCH
        RAISERROR ('SQL deployment script does contain syntax error!', -- Message text.  
               16, -- Severity.  
               1 -- State.  
               ); 
    END CATCH;
END; -- IsValidSQL

EXEC VALIDATE_SQL @sql = '
