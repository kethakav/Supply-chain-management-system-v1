DELIMITER //

CREATE PROCEDURE GetAssignedDeliveriesForAssistantDriver(IN driverId INT)
BEGIN
    SELECT 
        td.delivery_id,
        td.truck_id,
        t.vehicle_number,
        td.sent_datetime,
        td.compleated,
        td.route_id,
        r.end_point AS destination,
        r.route_description,
        r.distance,
        r.max_time,
        td.store_id,
        s.store_city AS store_location
    FROM 
        Truck_Delivery td
    INNER JOIN 
        Truck t ON td.truck_id = t.truck_id
    INNER JOIN 
        Route r ON td.route_id = r.route_id
    INNER JOIN 
        Store s ON td.store_id = s.store_id
    WHERE 
        td.ast_driver_id = driverId
        AND td.compleated = FALSE;
END //

DELIMITER ;
