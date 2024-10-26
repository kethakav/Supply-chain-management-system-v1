DELIMITER //
CREATE PROCEDURE confirm_delivery(in_order_id INT)
BEGIN
	UPDATE orders
    SET delivered_confirmation = true,
		delivered_date_time = NOW()
    WHERE order_id = in_order_id ;
END //
DELIMITER ;