-- table identifyer function : returns user's table nameidentify_table_test_1identify_table

DELIMITER //

CREATE FUNCTION identify_table(in_user_name VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(50);
    
    -- Check in the customer table first
    SELECT 'customer' INTO result
	FROM customer
	WHERE user_name = in_user_name
	LIMIT 1;

    -- Check in the manager table first
     IF result IS NULL THEN
        SELECT 'manager' INTO result
		FROM manager
		WHERE user_name = in_user_name
		LIMIT 1;
    END IF;

    -- If no result found in manager, check in driver
    IF result IS NULL THEN
        SELECT 'driver' INTO result
        FROM driver
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;

    -- If no result found in driver, check in assistant_driver
    IF result IS NULL THEN
        SELECT 'assistant_driver' INTO result
        FROM assistant_driver
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;
    
    -- If no result found in driver, check in hr_manager
    IF result IS NULL THEN
        SELECT 'hr_manager' INTO result
        FROM hr_manager
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;
    
    -- If no result found in driver, check in financeandorder_manager
    IF result IS NULL THEN
        SELECT 'financeandorder_manager' INTO result
        FROM financeandorder_manager
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;

    -- If no result is found in any table, return 'Unknown'
    IF result IS NULL THEN
        SET result = 'Unknown';
    END IF;

    RETURN result;
END //

DELIMITER ;