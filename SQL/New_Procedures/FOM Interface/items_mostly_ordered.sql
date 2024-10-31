DELIMITER //

CREATE PROCEDURE items_mostly_orderd()
BEGIN
	SELECT o.product_id, p.product_name , sum(o.quantity) AS "product_count" 
	FROM ordered_products o
	JOIN product p ON o.product_id = P.product_id 
	GROUP BY O.product_id
	ORDER BY sum(o.quantity) DESC ;

END //
DELIMITER ;