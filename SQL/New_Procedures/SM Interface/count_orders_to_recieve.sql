DELIMITER //

CREATE PROCEDURE count_orders_to_recieve(in_store_id INT)
BEGIN
	SELECT count(*) FROM orders
	WHERE nearest_store_id = in_store_id and sent_by_train = true and recieved_to_store = false ;
END //

DELIMITER ;