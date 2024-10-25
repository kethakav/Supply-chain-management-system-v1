DELIMITER //

CREATE PROCEDURE show_unconfirmed_orders(in_store_id INT)
BEGIN
	SELECT * FROM orders 
	WHERE confirm_payments = false and nearest_store_id = in_store_id ;
END //

DELIMITER ;