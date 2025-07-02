DELIMITER //
CREATE PROCEDURE remove_orders_from_truck(in_order_id INT) 
BEGIN
	UPDATE orders
    SET delivery_id = null
    WHERE order_id = in_order_id ;
END //

DELIMITER ;