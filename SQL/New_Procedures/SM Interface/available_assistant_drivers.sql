DELIMITER //

CREATE PROCEDURE available_assistant_drivers(in_store_id INT)
BEGIN
	SELECT * FROM assistant_driver
    WHERE store_id = in_store_id  and availability = true ;

END //

DELIMITER ;