DELIMITER //
CREATE FUNCTION get_route_time(in_route_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE out_time INT ;
    
    SELECT max_time INTO out_time
    FROM route
    WHERE route_id = in_route_id ;
	RETURN out_time ;
    
END //
DELIMITER ;