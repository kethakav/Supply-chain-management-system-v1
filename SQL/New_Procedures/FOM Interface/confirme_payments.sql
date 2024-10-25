DELIMITER //
CREATE PROCEDURE confirm_payment(in_order_id INT, in_fom_id INT)
BEGIN
	UPDATE orders
    SET confirm_payments = True ,
		finance_manager_id = in_fom_id
    WHERE order_id = in_order_id ;
END //

DELIMITER ;