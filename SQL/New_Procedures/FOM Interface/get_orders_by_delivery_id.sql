DELIMITER //

CREATE PROCEDURE GetOrdersByTrainDeliveryId(IN p_train_delivery_id INT)
BEGIN
    SELECT *
    FROM Orders
    WHERE train_delivery_id = p_train_delivery_id;
END //

DELIMITER ;
