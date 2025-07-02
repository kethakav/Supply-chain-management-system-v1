DELIMITER //

CREATE TRIGGER update_after_end_trip
AFTER UPDATE ON truck_delivery 
FOR EACH ROW
BEGIN
	IF NEW.compleated  = true THEN
    
		UPDATE driver
		SET availability = true,
			worked_hours = worked_hours + get_route_time(NEW.route_id)
        WHERE driver_id = NEW.driver_id;
        
        UPDATE assistant_driver
		SET availability = true,
			worked_hours = worked_hours + get_route_time(NEW.route_id)
        WHERE ast_driver_id = NEW.ast_driver_id;
        
        UPDATE truck
		SET availability = true
        WHERE truck_id = NEW.truck_id;
        
        
	END IF;
END //

DELIMITER ;