DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_trains`()
BEGIN
    SELECT * FROM train;
END //

DELIMITER ;
