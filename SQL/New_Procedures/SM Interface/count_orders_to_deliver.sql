DELIMITER //

CREATE PROCEDURE count_orders_to_deliver(in_store_id INT)
BEGIN
	SELECT count(*) FROM orders
	WHERE nearest_store_id = in_store_id and recieved_to_store = true and delivered_confirmation = false ;
END //

DELIMITER ;