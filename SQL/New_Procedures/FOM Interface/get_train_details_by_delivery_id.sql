CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTrainDetailsByDeliveryId`(IN delivery_id INT)
BEGIN
    SELECT 
        t.train_id,
        t.destination_store_id,
        t.total_capacity,
        t.departure_day,
        t.departure_time,
        t.arrival_day,
        t.arrival_time,
        td.train_delivery_id,
        td.allocated_capacity
    FROM 
        train t
    JOIN 
        Train_delivery td ON t.train_id = td.train_id
    WHERE 
        td.train_delivery_id = delivery_id;
END