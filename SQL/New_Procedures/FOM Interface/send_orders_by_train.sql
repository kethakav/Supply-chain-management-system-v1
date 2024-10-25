DELIMITER //

CREATE PROCEDURE send_orders_by_train()
BEGIN
	
    UPDATE orders
    SET sent_by_train = true 
    WHERE train_delivery_id is not null and confirm_payments = true;
    
END //

DELIMITER ;