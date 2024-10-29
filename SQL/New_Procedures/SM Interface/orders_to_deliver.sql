DELIMITER //

CREATE PROCEDURE orders_to_deliver(in_store_id INT)
BEGIN
	SELECT * FROM orders
	WHERE nearest_store_id = in_store_id and recieved_to_store = true and delivery_id is null ;
END //

DELIMITER ;