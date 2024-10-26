DELIMITER //
CREATE TRIGGER after_truck_delivery_insert
AFTER INSERT ON truck_delivery
FOR EACH ROW
BEGIN
    UPDATE truck
    SET availability = false
    WHERE truck_id = NEW.truck_id;

    UPDATE driver
    SET availability = false
    WHERE driver_id = NEW.driver_id;

    UPDATE assistant_driver
    SET availability = false
    WHERE ast_driver_id = NEW.ast_driver_id;
END //
DELIMITER ;
