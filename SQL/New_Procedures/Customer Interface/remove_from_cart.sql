DELIMITER //

CREATE PROCEDURE `remove_from_cart`(customer_ID INT, product_ID INT)
BEGIN
	DELETE FROM cart
    WHERE customer_id = customer_ID and product_id = product_ID ;
END //

DELIMITER ;