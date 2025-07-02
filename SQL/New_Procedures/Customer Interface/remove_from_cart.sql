DELIMITER //

CREATE PROCEDURE `remove_from_cart`(in_customer_ID INT, in_product_ID INT)
BEGIN
	DELETE FROM cart
    WHERE customer_id = in_customer_ID and product_id = in_product_ID ;
END //

DELIMITER ;