DELIMITER //

CREATE PROCEDURE start_new_week()
BEGIN
	UPDATE driver
    SET worked_hours = 0; 
    
    UPDATE assistant_driver
    SET worked_hours = 0; 
    
END; //
DELIMITER ;
