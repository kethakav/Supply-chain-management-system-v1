DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFinanceOrderManagers`()
BEGIN
    SELECT 
        finance_manager_id, 
        manager_first_name, 
        manager_last_name, 
        manager_contact, 
        manager_email
    FROM 
        FinanceandOrder_Manager;
END //

DELIMITER ;