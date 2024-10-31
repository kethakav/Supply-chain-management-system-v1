DELIMITER //

CREATE PROCEDURE sales_report_by_route()
BEGIN

	SELECT o.route_id, r.end_point , sum(o.total_amount) as "sum"
	FROM orders o
	JOIN route r ON r.route_id = o.route_id
	WHERE O.confirm_payments = TRUE
	GROUP BY o.route_id;


END //
DELIMITER ;