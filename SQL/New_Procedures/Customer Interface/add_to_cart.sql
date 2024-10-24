DELIMITER //

CREATE PROCEDURE add_to_cart(customer_ID INT, order_ID INT, quantity INT)
BEGIN
	INSERT INTO cart VALUES (customer_ID, order_id, quantity) ;
END //

DELIMITER ;
