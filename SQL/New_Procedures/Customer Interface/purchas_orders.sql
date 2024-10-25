DELIMITER //

CREATE PROCEDURE purchas_orders(
    IN in_customer_id INT, 
    IN in_store_id INT, 
    IN in_route_id INT, 
    IN in_description VARCHAR(1000), 
    IN in_payment VARCHAR(1000)
)
BEGIN
    START TRANSACTION;
    
    INSERT INTO Orders (customer_id, nearest_store_id, route_id, route_description_input, payment_documents)
    VALUES (in_customer_id, in_store_id, in_route_id, in_description, in_payment);
    
    SET @order_id = LAST_INSERT_ID();
    
    INSERT INTO ordered_products(order_id, product_id, quantity, price)
    SELECT @order_id, c.product_id, c.quantity, c.quantity * p.product_price
    FROM cart c
    JOIN product p on c.product_id = p.product_id
    WHERE c.customer_id = in_customer_id ;
    
    DELETE FROM cart where customer_id = in_customer_id ;
    
    UPDATE Orders
	SET 
		ordered_date_time = NOW(), 
		expecting_delivery_date = NOW() + INTERVAL 7 DAY,
		total_amount = (SELECT SUM(price) FROM ordered_products WHERE order_id = @order_id), 
		order_capacity = (SELECT SUM(quantity) FROM ordered_products WHERE order_id = @order_id)
	WHERE order_id= @order_id;
    
    COMMIT;
END //

DELIMITER ;

