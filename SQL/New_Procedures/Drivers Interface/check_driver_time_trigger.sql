DELIMITER //

CREATE TRIGGER check_driver_time
BEFORE INSERT ON Truck_Delivery
FOR EACH ROW
BEGIN 
    DECLARE driver_time INT DEFAULT 0;
    DECLARE ast_driver_time INT DEFAULT 0;
    DECLARE route_time INT DEFAULT 0;

    -- Get the driver’s worked hours
    SELECT worked_hours INTO driver_time 
    FROM Driver
    WHERE driver_id = NEW.driver_id;

    -- Get the assistant driver’s worked hours
    SELECT worked_hours INTO ast_driver_time
    FROM Assistant_Driver
    WHERE ast_driver_id = NEW.ast_driver_id;
    
    -- Get the route max time
    SELECT max_time INTO route_time
    FROM Route
    WHERE route_id = NEW.route_id;
    
    -- Check if driver or assistant driver exceeds max allowed time
    IF ((driver_time + route_time) > 40 OR (ast_driver_time + route_time) > 60) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Driver or Assistant Driver Limit Exceeded.';
    END IF;
END //

DELIMITER ;
