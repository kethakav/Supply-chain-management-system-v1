DELIMITER //

CREATE PROCEDURE get_ready_to_send_orders()
BEGIN
	
    SELECT * FROM Orders
    WHERE train_delivery_id is not null and sent_by_train is false;
    
END //

DELIMITER ;