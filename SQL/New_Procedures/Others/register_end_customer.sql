DELIMITER  //

CREATE DEFINER=`root`@`localhost` PROCEDURE RegisterEndCustomer(
    IN p_user_name VARCHAR(20),
    IN p_password VARCHAR(100),
    IN p_first_name VARCHAR(20),
    IN p_last_name VARCHAR(20),
    IN p_contact INT,
    IN p_email VARCHAR(50),
    IN p_address VARCHAR(200)
)
BEGIN
    INSERT INTO Customer (user_name, password, customer_first_name, customer_last_name, customer_type, customer_contact, customer_email, customer_address)
    VALUES (p_user_name, p_password, p_first_name, p_last_name, 'end customer', p_contact, p_email, p_address);
END //

DELIMITER ;