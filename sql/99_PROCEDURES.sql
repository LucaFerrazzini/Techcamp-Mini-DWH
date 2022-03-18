CREATE OR ALTER PROCEDURE [EXEC_PROCEDURES]
AS
BEGIN
    DECLARE @SCHEMA TABLE ([SCHEMA] NVARCHAR(50));
    INSERT INTO @SCHEMA VALUES ('ODS')
    INSERT INTO @SCHEMA VALUES ('CORE')
    INSERT INTO @SCHEMA VALUES ('MART')

    DECLARE @current_schema NVARCHAR(50);
    DECLARE @proc_exec NVARCHAR(100);

    DECLARE schema_cursor CURSOR  
        FOR SELECT [SCHEMA] FROM @SCHEMA

    OPEN schema_cursor  
    FETCH NEXT FROM schema_cursor INTO @current_schema; 

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE proc_cursor CURSOR  
            FOR SELECT 'EXEC ' + @current_schema + '.' + SPECIFIC_NAME
                FROM [mini-dwh-db].INFORMATION_SCHEMA.ROUTINES
                WHERE ROUTINE_TYPE = 'PROCEDURE' AND SPECIFIC_SCHEMA = @current_schema
        
        OPEN proc_cursor
        FETCH NEXT FROM proc_cursor INTO @proc_exec; 
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            EXEC(@proc_exec)
            FETCH NEXT FROM proc_cursor INTO @proc_exec; 
        END
        
        CLOSE proc_cursor
        DEALLOCATE proc_cursor

        FETCH NEXT FROM schema_cursor INTO @current_schema; 

    END
END
GO