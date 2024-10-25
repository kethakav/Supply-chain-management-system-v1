DELIMITER //

CREATE PROCEDURE add_orders_to_train(in_order_id INT, in_train_delivery_id INT)
BEGIN
	
    UPDATE orders
    SET train_delivery_id = in_train_delivery_id 
    WHERE order_id = in_order_id ;
    
    
    UPDATE train_delivery
    SET allocated_capacity = (select total_allocated_capacity(in_train_delivery_id))
	WHERE train_delivery_id = in_train_delivery_id ;
    
END //

DELIMITER ;

