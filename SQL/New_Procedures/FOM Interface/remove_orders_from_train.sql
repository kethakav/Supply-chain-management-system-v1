DELIMITER //

CREATE PROCEDURE remove_orders_from_train(in_order_id INT, in_train_delivery_id INT)
BEGIN
	
    UPDATE train_delivery
    SET allocated_capacity = allocated_capacity - (SELECT total_order_capacity(in_order_id))
	WHERE train_delivery_id = in_train_delivery_id ;
    
    UPDATE orders
    SET train_delivery_id = null
    WHERE order_id = in_order_id ;
    
    
END //

DELIMITER ;