DELIMITER //

CREATE PROCEDURE GetTruckDeliveryDetails(IN truck_delivery_id INT)
BEGIN
    SELECT 
        td.delivery_id,
        td.sent_datetime,
        td.compleated AS completed,
        t.truck_id,
        t.vehicle_number,
        t.availability AS truck_availability,
        d.driver_id,
        CONCAT(d.driver_first_name, ' ', d.driver_last_name) AS driver_name,
        d.driver_contact AS driver_contact,
        ad.ast_driver_id,
        CONCAT(ad.ast_driver_first_name, ' ', ad.ast_driver_last_name) AS assistant_driver_name,
        ad.ast_driver_contact AS assistant_driver_contact,
        r.route_id,
        r.end_point AS route_end_point,
        r.route_description,
        r.distance AS route_distance,
        r.max_time AS route_max_time,
        s.store_id,
        s.store_city AS store_city,
        s.truck_count AS store_truck_count
    FROM 
        Truck_Delivery td
    JOIN 
        Truck t ON td.truck_id = t.truck_id
    LEFT JOIN 
        Driver d ON td.driver_id = d.driver_id
    LEFT JOIN 
        Assistant_Driver ad ON td.ast_driver_id = ad.ast_driver_id
    JOIN 
        Route r ON td.route_id = r.route_id
    JOIN 
        Store s ON td.store_id = s.store_id
    WHERE 
        td.delivery_id = truck_delivery_id;
END //

DELIMITER ;
