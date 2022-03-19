CREATE OR ALTER PROCEDURE IsValidSQL (@sql varchar(max)) AS
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
    RETURN(0);
END; -- IsValidSQL

EXEC IsValidSQL @sql = '
