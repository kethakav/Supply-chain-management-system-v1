DELIMITER //

CREATE PROCEDURE sales_report_by_stores()
BEGIN

	SELECT o.nearest_store_id, s.store_city , sum(o.total_amount) as "sum"
	FROM orders o
	JOIN store s ON s.store_id = o.nearest_store_id 
	WHERE O.confirm_payments = TRUE
	GROUP BY o.nearest_store_id;


END //
DELIMITER ;