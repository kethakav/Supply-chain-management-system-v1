DELIMITER //
CREATE PROCEDURE send_truck(in_truck_delivery_id INT)
BEGIN
	UPDATE truck_delivery
    SET sent_datetime = NOW()
    WHERE delivery_id = in_truck_delivery_id ;
    
END //
DELIMITER ;