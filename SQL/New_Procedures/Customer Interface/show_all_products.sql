DELIMITER //

CREATE PROCEDURE show_all_products()
BEGIN
	SELECT * FROM product;
END //

DELIMITER ;