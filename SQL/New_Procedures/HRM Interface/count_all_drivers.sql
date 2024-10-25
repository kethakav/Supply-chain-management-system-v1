

DELIMITER //

CREATE FUNCTION count_all_drivers() 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE C1 INT ;
    DECLARE C2 INT ;
    
    SELECT COUNT(*) INTO C1
    FROM driver ;
    
    SELECT COUNT(*) INTO C2
    FROM assistant_driver ;
    
    RETURN C1 + C2 ;
    
END //

DELIMITER ;