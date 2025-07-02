DELIMITER //

CREATE FUNCTION count_all_managers()
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE C1 INT ;
    DECLARE C2 INT ;
    
    SELECT COUNT(*) INTO C1
    FROM manager ;
    
    SELECT COUNT(*) INTO C2
    FROM financeandorder_manager ;
    
    RETURN C1 + C2 ;
	
END //

DELIMITER ;