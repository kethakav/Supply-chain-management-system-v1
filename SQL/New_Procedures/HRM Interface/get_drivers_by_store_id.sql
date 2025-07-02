DELIMITER //

CREATE PROCEDURE GetDriversByStoreID(IN input_store_id INT)
BEGIN
    SELECT 
        d.driver_id,
        d.user_name,
        d.driver_first_name,
        d.driver_last_name,
        d.driver_contact,
        d.driver_email,
        d.driver_image_url,
        d.worked_hours,
        d.availability
    FROM 
        Driver d
    WHERE 
        d.store_id = input_store_id;
END //

DELIMITER ;
