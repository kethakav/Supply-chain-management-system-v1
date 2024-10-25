DELIMITER //

CREATE PROCEDURE add_to_cart(customer_ID INT, product_ID INT, quantity INT)
BEGIN
	INSERT INTO cart VALUES (customer_ID, product_ID, quantity) ;
END //

DELIMITER ;
