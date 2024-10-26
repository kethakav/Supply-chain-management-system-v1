DELIMITER //
CREATE PROCEDURE confirm_recived_orders(in_order_id INT) 
BEGIN
	UPDATE orders
    SET recieved_to_store = true 
    WHERE order_ID = in_order_id ;
END //

DELIMITER ;