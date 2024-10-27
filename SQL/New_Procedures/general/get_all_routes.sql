CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_routes`()
BEGIN
    SELECT * FROM route;
END