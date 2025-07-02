DELIMITER //

CREATE PROCEDURE GetAstDriversByStoreID(IN input_store_id INT)
BEGIN
    SELECT 
        d.ast_driver_id,
        d.user_name,
        d.ast_driver_first_name,
        d.ast_driver_last_name,
        d.ast_driver_contact,
        d.ast_driver_email,
        d.ast_driver_image_url,
        d.worked_hours,
        d.availability
    FROM 
        assistant_driver d
    WHERE 
        d.store_id = input_store_id;
END //

DELIMITER ;
