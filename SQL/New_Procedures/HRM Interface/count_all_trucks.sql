
DELIMITER //

CREATE FUNCTION count_all_trucks() 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE C INT ;
    
	SELECT COUNT(*) INTO C
    FROM truck ;
    
    RETURN C ;
	
END //

DELIMITER ;