DELIMITER //

CREATE PROCEDURE create_train_shedule(in_train_id INT)
BEGIN
	INSERT INTO train_delivery(train_id, allocated_capacity)
    VALUES (in_train_id,0) ;
END //

DELIMITER ;