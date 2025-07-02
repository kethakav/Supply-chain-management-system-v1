DELIMITER //

CREATE PROCEDURE GetManagersByStoreId(IN store_id_param INT)
BEGIN
    SELECT manager_id, user_name, manager_first_name, manager_last_name, manager_contact, manager_email, manager_image_url
    FROM Manager
    WHERE store_id = store_id_param;
END //

DELIMITER ;
