DELIMITER //

CREATE PROCEDURE remove_managers(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'financeandorder_manager' THEN
        DELETE FROM financeandorder_manager
        WHERE finance_manager_id = input_id;
    
    ELSEIF input_table = 'manager' THEN
        DELETE FROM manager
        WHERE manager_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END //

DELIMITER ;
