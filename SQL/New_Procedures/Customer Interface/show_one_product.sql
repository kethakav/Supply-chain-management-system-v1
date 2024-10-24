DELIMITER //

CREATE PROCEDURE show_one_product(in_ID INT)
BEGIN
	SELECT * FROM product
	WHERE product_id = in_ID ;
END //

DELIMITER ;

