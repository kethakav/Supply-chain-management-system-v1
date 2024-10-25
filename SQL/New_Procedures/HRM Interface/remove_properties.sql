DELIMITER //

CREATE PROCEDURE remove_properties(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'truck' THEN
        DELETE FROM truck
        WHERE truck_id = input_id;
    
    ELSEIF input_table = 'store' THEN
        DELETE FROM store
        WHERE store_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END //

DELIMITER ;