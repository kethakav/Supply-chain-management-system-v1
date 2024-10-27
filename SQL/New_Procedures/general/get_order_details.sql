DELIMITER //

CREATE PROCEDURE GetOrderDetails(IN orderId INT)
BEGIN
    SELECT 
        o.order_id,
        o.customer_id,
        c.customer_first_name,
        c.customer_last_name,
        o.ordered_date_time,
        o.total_amount,
        o.order_capacity,
        o.expecting_delivery_date,
        o.route_id,
        r.route_description AS route_details,
        o.delivery_id,
        p.product_id,
        p.product_name,
        p.product_price,
        op.quantity,
        op.price AS unit_price,
        (op.quantity * op.price) AS total_product_price
    FROM 
        Orders o
    INNER JOIN 
        Ordered_products op ON o.order_id = op.order_id
    INNER JOIN 
        Product p ON op.product_id = p.product_id
    INNER JOIN 
        Customer c ON o.customer_id = c.customer_id
    LEFT JOIN 
        Route r ON o.route_id = r.route_id
    WHERE 
        o.order_id = orderId;
END //

DELIMITER ;
