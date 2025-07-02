DELIMITER //

CREATE PROCEDURE GetOrdersByTruckDeliveryId(IN p_truck_delivery_id INT)
BEGIN
    SELECT *
    FROM Orders
    WHERE delivery_id = p_truck_delivery_id and recieved_to_store = true and delivered_confirmation = false;
END //

DELIMITER ;
