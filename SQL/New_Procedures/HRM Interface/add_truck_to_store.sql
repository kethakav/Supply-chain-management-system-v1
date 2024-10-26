CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTruckToStore`(
    IN tr_vehicle_number VARCHAR(20),
    IN tr_store_id INT
)
BEGIN
    INSERT INTO truck (store_id, vehicle_number, availability) 
    VALUES (tr_store_id, tr_vehicle_number, 1);
END