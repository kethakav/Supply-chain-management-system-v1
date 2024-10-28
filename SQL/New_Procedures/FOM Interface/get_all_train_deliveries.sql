CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTrainDeliveries`()
BEGIN
    SELECT 
        td.train_delivery_id,
        td.train_id,
        td.allocated_capacity,
        t.destination_store_id,
        t.total_capacity,
        t.departure_day,
        t.departure_time,
        t.arrival_day,
        t.arrival_time
    FROM 
        Train_delivery AS td
    JOIN 
        train AS t ON td.train_id = t.train_id
    WHERE 
        td.sent = FALSE or td.sent is null;  -- Only return rows where sent is false
END
