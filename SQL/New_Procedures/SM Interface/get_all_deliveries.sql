DELIMITER //

CREATE PROCEDURE GetDeliveriesByStoreID(IN storeId INT)
BEGIN
    SELECT *
    FROM Truck_Delivery
    WHERE store_id = storeId and sent_datetime is null;
END //

DELIMITER ;
