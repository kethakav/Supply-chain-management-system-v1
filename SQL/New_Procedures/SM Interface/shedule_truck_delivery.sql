DELIMITER //
CREATE PROCEDURE shedule_truck_delivery(in_truck_id INT, in_driver_id INT, in_ast_driver_id INT, in_route_id INT, in_store_id INT)
BEGIN
	INSERT INTO truck_delivery(truck_id, driver_id, ast_driver_id, route_id, store_id)
	VALUES (in_truck_id,in_driver_id,in_ast_driver_id,in_route_id,in_store_id ) ;
END //
DELIMITER ;