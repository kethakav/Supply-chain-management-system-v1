DELIMITER //
CREATE PROCEDURE add_orders_to_truck(in_order_id INT, in_truck_delivery_id INT) 
BEGIN
	UPDATE orders
    SET delivery_id = in_truck_delivery_id
    WHERE order_id = in_order_id ;
END //

DELIMITER ;