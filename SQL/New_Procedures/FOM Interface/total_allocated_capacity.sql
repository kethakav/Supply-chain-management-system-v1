DELIMITER //
CREATE FUNCTION total_allocated_capacity(in_train_delivery_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE TOTAL INT ;
	SELECT sum(order_capacity) INTO total
    FROM orders 
    WHERE train_delivery_id = in_train_delivery_id ;
    
    return total;
END //

DELIMITER ;