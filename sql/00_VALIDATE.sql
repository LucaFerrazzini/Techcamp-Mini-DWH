CREATE OR ALTER PROCEDURE VALIDATE_SQL (@sql varchar(max)) AS
BEGIN
        SET @sql = 'SET PARSEONLY ON;' + REPLACE ( @sql , '''' , '''''' );
        EXEC(@sql);
END; -- IsValidSQL

EXEC VALIDATE_SQL @sql = '
