DELIMITER //

PROCEDURE `show_cart`(customer_ID INT)
BEGIN
    SELECT 
        c.customer_id,
        c.product_id,
        c.quantity,
        p.product_name,
        p.product_price,
        p.product_image_url
    FROM 
        cart c
    JOIN 
        Product p ON c.product_id = p.product_id
    WHERE 
        c.customer_id = customer_ID;
END //

DELIMITER ;
