DELIMITER //

CREATE PROCEDURE available_drivers(in_store_id INT)
BEGIN
	SELECT * FROM driver
    WHERE store_id = in_store_id  and availability = true ;

END //

DELIMITER ;