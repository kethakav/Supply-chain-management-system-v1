DELIMITER //

CREATE PROCEDURE ready_to_send()
BEGIN
	
    SELECT * FROM Orders
    WHERE train_delivery_id is not null and confirm_payments = true;
    
END //

DELIMITER ;