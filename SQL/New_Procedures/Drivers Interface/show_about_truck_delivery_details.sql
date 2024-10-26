DELIMITER //

CREATE PROCEDURE show_about_truck_delivery_details(in_driver_id INT, in_truck_delivery_id INT) 
BEGIN
	SELECT td.delivery_id, d.driver_first_name, asd.ast_driver_first_name, t.vehicle_number, s.store_city , r.end_point ,r.route_description FROM truck_delivery td
	join driver d on td.driver_id = d.driver_id
	join assistant_driver asd on td.ast_driver_id = asd.ast_driver_id
	join route r on r.route_id = td.route_id
	join truck t on t.truck_id = td.truck_id
	join store s on s.store_id = td.store_id
	WHERE d.driver_id = in_driver_id and td.delivery_id = in_truck_delivery_id;
END //
DELIMITER ;