DELIMITER //
CREATE PROCEDURE end_trip(in_delivery_id INT)
BEGIN
	UPDATE truck_delivery
    SET compleated = true 
    WHERE delivery_id = in_delivery_id ;
END //
DELIMITER ;