DELIMITER //

CREATE PROCEDURE GetOrdersOnCurrentDelivery(IN deliveryId INT)
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
        p.product_id,
        p.product_name,
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
    WHERE 
        o.delivery_id = deliveryId;
END //

DELIMITER ;
