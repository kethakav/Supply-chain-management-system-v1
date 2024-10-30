DELIMITER //

CREATE TRIGGER check_driver_time
BEFORE INSERT ON truck_delivery
FOR EACH ROW
BEGIN 
    DECLARE driver_time INT DEFAULT 0;
    DECLARE ast_driver_time INT DEFAULT 0;
    DECLARE route_time INT DEFAULT 0;

    SELECT worked_hours INTO driver_time 
    FROM driver
    WHERE driver_id = NEW.driver_id;

    SELECT worked_hours INTO ast_driver_time
    FROM assistant_driver
    WHERE ast_driver_id = NEW.ast_driver_id;
    
    SELECT max_time INTO ast_driver_time
    FROM route
    WHERE route_id = NEW.route_id;
    

    IF (driver_time < 40 OR ast_driver_time < 60) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Driver or Assistant Driver Limit Exceeded.';
    END IF;
END //

DELIMITER ;