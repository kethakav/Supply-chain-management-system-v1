DELIMITER //

CREATE PROCEDURE available_trucks(in_store_id INT)
BEGIN
	SELECT * FROM truck
    WHERE store_id = in_store_id  and availability = true ;

END //

DELIMITER ;