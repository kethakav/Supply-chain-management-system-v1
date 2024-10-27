DELIMITER //

CREATE PROCEDURE show_confirmed_orders()
BEGIN
	SELECT * FROM orders 
	WHERE confirm_payments = true and train_delivery_id is null;
END //

DELIMITER ;