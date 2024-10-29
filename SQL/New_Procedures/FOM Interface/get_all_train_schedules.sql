DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_train_schedules`()
BEGIN
    SELECT * FROM train_delivery WHERE sent = false;
END //

DELIMITER ;
