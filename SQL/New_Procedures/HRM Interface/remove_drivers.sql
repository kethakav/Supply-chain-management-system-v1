DELIMITER //

CREATE PROCEDURE remove_drivers(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'driver' THEN
        DELETE FROM driver
        WHERE driver_id = input_id;
    
    ELSEIF input_table = 'assistant_driver' THEN
        DELETE FROM assistant_driver
        WHERE ast_driver_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END //

DELIMITER ;