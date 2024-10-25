DELIMITER //

CREATE PROCEDURE show_current_orders_customer(in_ID INT)
BEGIN
	SELECT * FROM orders
    WHERE customer_id = in_ID and delivered_confirmation = False;
END //

DELIMITER ;