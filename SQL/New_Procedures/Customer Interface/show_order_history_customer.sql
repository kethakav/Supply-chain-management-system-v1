DELIMITER //

CREATE PROCEDURE show_order_history_customer(in_ID INT)
BEGIN
	SELECT * FROM orders
    WHERE customer_id = in_ID and delivered_confirmation = 1;
END //

DELIMITER ;