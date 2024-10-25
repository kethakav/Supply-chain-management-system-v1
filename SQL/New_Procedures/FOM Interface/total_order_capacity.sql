DELIMITER //

CREATE FUNCTION total_order_capacity(in_order_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE capacity INT ;
    
    SELECT order_capacity INTO capacity
    FROM orders 
    WHERE order_id = in_order_id ;
    
    RETURN capacity ;

END //

DELIMITER ;