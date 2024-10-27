DELIMITER //

CREATE PROCEDURE show_unconfirmed_orders()
BEGIN
	SELECT * FROM orders 
	WHERE confirm_payments = false;
END //

DELIMITER ;