DELIMITER $$

CREATE PROCEDURE SendTrain(IN trainDeliveryID INT)
BEGIN
  -- Update the Train_delivery table to mark the train as sent
  UPDATE Train_delivery
  SET sent = TRUE
  WHERE train_delivery_id = trainDeliveryID;

  -- Update all orders linked to this train delivery
  UPDATE Orders
  SET sent_by_train = TRUE
  WHERE train_delivery_id = trainDeliveryID;
END$$

DELIMITER ;
