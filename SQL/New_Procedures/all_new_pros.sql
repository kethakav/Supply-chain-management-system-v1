DELIMITER //

CREATE PROCEDURE add_to_cart(customer_ID INT, product_ID INT, quantity INT)
BEGIN
	INSERT INTO cart VALUES (customer_ID, product_ID, quantity) ;
END //

DELIMITER ;
DELIMITER //


CREATE PROCEDURE purchas_orders(
    IN in_customer_id INT, 
    IN in_store_id INT, 
    IN in_route_id INT, 
    IN in_description VARCHAR(1000), 
    IN in_payment VARCHAR(1000)
)
BEGIN
    START TRANSACTION;
    
    INSERT INTO Orders (customer_id, nearest_store_id, route_id, route_description_input, payment_documents)
    VALUES (in_customer_id, in_store_id, in_route_id, in_description, in_payment);
    
    SET @order_id = LAST_INSERT_ID();
    
    INSERT INTO ordered_products(order_id, product_id, quantity, price)
    SELECT @order_id, c.product_id, c.quantity * p.product_capacity , c.quantity * p.product_price
    FROM cart c
    JOIN product p on c.product_id = p.product_id
    WHERE c.customer_id = in_customer_id ;
    
    DELETE FROM cart where customer_id = in_customer_id ;
    
    UPDATE Orders
	SET 
		ordered_date_time = NOW(), 
		expecting_delivery_date = NOW() + INTERVAL 7 DAY,
		total_amount = (SELECT SUM(price) FROM ordered_products WHERE order_id = @order_id), 
		order_capacity = (SELECT SUM(quantity) FROM ordered_products WHERE order_id = @order_id)
	WHERE order_id= @order_id;
    
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE `remove_from_cart`(in_customer_ID INT, in_product_ID INT)
BEGIN
	DELETE FROM cart
    WHERE customer_id = in_customer_ID and product_id = in_product_ID ;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE show_all_products()
BEGIN
	SELECT * FROM product;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE show_cart(customer_ID INT)
BEGIN
	SELECT * FROM cart ;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE show_current_orders_customer(in_ID INT)
BEGIN
	SELECT * FROM orders
    WHERE customer_id = in_ID and delivered_confirmation = False;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE show_one_product(in_ID INT)
BEGIN
	SELECT * FROM product
	WHERE product_id = in_ID ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE show_order_history_customer(in_ID INT)
BEGIN
	SELECT * FROM orders
    WHERE customer_id = in_ID and delivered_confirmation = 1;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE confirm_delivery(in_order_id INT)
BEGIN
	UPDATE orders
    SET delivered_confirmation = true,
		delivered_date_time = NOW()
    WHERE order_id = in_order_id ;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE end_trip(in_delivery_id INT)
BEGIN
	UPDATE truck_delivery
    SET compleated = true 
    WHERE delivery_id = in_delivery_id ;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetAssignedDeliveriesForDriver(IN driverId INT)
BEGIN
    SELECT 
        td.delivery_id,
        td.truck_id,
        t.vehicle_number,
        td.sent_datetime,
        td.compleated,
        td.route_id,
        r.end_point AS destination,
        r.route_description,
        r.distance,
        r.max_time,
        td.store_id,
        s.store_city AS store_location
    FROM 
        Truck_Delivery td
    INNER JOIN 
        Truck t ON td.truck_id = t.truck_id
    INNER JOIN 
        Route r ON td.route_id = r.route_id
    INNER JOIN 
        Store s ON td.store_id = s.store_id
    WHERE 
        td.driver_id = driverId
        AND td.compleated = FALSE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetOrdersOnCurrentDelivery(IN deliveryId INT)
BEGIN
    SELECT 
        o.order_id,
        o.customer_id,
        c.customer_first_name,
        c.customer_last_name,
        o.ordered_date_time,
        o.total_amount,
        o.order_capacity,
        o.expecting_delivery_date,
        p.product_id,
        p.product_name,
        op.quantity,
        op.price AS unit_price,
        (op.quantity * op.price) AS total_product_price
    FROM 
        Orders o
    INNER JOIN 
        Ordered_products op ON o.order_id = op.order_id
    INNER JOIN 
        Product p ON op.product_id = p.product_id
    INNER JOIN 
        Customer c ON o.customer_id = c.customer_id
    WHERE 
        o.delivery_id = deliveryId;
END //

DELIMITER ;

DELIMITER //
CREATE FUNCTION get_route_time(in_route_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE out_time INT ;
    
    SELECT max_time INTO out_time
    FROM route
    WHERE route_id = in_route_id ;
	RETURN out_time ;
    
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE show_about_truck_delivery_details(in_driver_id INT, in_truck_delivery_id INT) 
BEGIN
	SELECT td.delivery_id, d.driver_first_name, asd.ast_driver_first_name, t.vehicle_number, s.store_city , r.end_point ,r.route_description FROM truck_delivery td
	join driver d on td.driver_id = d.driver_id
	join assistant_driver asd on td.ast_driver_id = asd.ast_driver_id
	join route r on r.route_id = td.route_id
	join truck t on t.truck_id = td.truck_id
	join store s on s.store_id = td.store_id
	WHERE d.driver_id = in_driver_id and td.delivery_id = in_truck_delivery_id;
END //
DELIMITER ;

DELIMITER //

CREATE TRIGGER update_after_end_trip
AFTER UPDATE ON truck_delivery 
FOR EACH ROW
BEGIN
	IF NEW.compleated  = true THEN
    
		UPDATE driver
		SET availability = true,
			worked_hours = worked_hours + get_route_time(NEW.route_id)
        WHERE driver_id = NEW.driver_id;
        
        UPDATE assistant_driver
		SET availability = true,
			worked_hours = worked_hours + get_route_time(NEW.route_id)
        WHERE ast_driver_id = NEW.ast_driver_id;
        
        UPDATE truck
		SET availability = true
        WHERE truck_id = NEW.truck_id;
        
        
	END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE add_orders_to_train(in_order_id INT, in_train_delivery_id INT)
BEGIN
	
    UPDATE orders
    SET train_delivery_id = in_train_delivery_id 
    WHERE order_id = in_order_id ;
    
    
    UPDATE train_delivery
    SET allocated_capacity = (select total_allocated_capacity(in_train_delivery_id))
	WHERE train_delivery_id = in_train_delivery_id ;
    
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE confirm_payment(in_order_id INT, in_fom_id INT)
BEGIN
	UPDATE orders
    SET confirm_payments = True ,
		finance_manager_id = in_fom_id
    WHERE order_id = in_order_id ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE create_train_shedule(in_train_id INT)
BEGIN
	INSERT INTO train_delivery(train_id, allocated_capacity)
    VALUES (in_train_id,0) ;
END //

DELIMITER ;
DELIMITER //

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
END//

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_train_schedules`()
BEGIN
    SELECT * FROM train_delivery WHERE sent = false;
END//
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_trains`()
BEGIN
    SELECT * FROM train;
END//
DELIMITER //

CREATE PROCEDURE GetOrdersByTrainDeliveryId(IN p_train_delivery_id INT)
BEGIN
    SELECT *
    FROM Orders
    WHERE train_delivery_id = p_train_delivery_id and sent_by_train = false;
END //

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
END//

DELIMITER //

CREATE PROCEDURE get_ready_to_send_orders()
BEGIN
	
    SELECT * FROM Orders
    WHERE train_delivery_id is not null and sent_by_train is false;
    
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE remove_orders_from_train(in_order_id INT, in_train_delivery_id INT)
BEGIN
	
    UPDATE train_delivery
    SET allocated_capacity = allocated_capacity - (SELECT total_order_capacity(in_order_id))
	WHERE train_delivery_id = in_train_delivery_id ;
    
    UPDATE orders
    SET train_delivery_id = null
    WHERE order_id = in_order_id ;
    
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE send_orders_by_train()
BEGIN
	
    UPDATE orders
    SET sent_by_train = true 
    WHERE train_delivery_id is not null and confirm_payments = true;
    
END //

DELIMITER ;

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

DELIMITER //

CREATE PROCEDURE show_confirmed_orders()
BEGIN
	SELECT * FROM orders 
	WHERE confirm_payments = true and train_delivery_id is null;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE show_unconfirmed_orders()
BEGIN
	SELECT * FROM orders 
	WHERE confirm_payments = false;
END //

DELIMITER ;

DELIMITER //
CREATE FUNCTION total_allocated_capacity(in_train_delivery_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE TOTAL INT ;
	SELECT sum(order_capacity) INTO total
    FROM orders 
    WHERE train_delivery_id = in_train_delivery_id ;
    
    return total;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION total_order_capacity(in_order_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE capacity INT ;
    
    SELECT order_capacity INTO capacity
    FROM orders 
    WHERE order_id = in_order_id ;
    
    RETURN capacity ;

END //

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_routes`()
BEGIN
    SELECT * FROM route;
END//

DELIMITER //

CREATE PROCEDURE GetOrderDetails(IN orderId INT)
BEGIN
    SELECT 
        o.order_id,
        o.customer_id,
        c.customer_first_name,
        c.customer_last_name,
        o.ordered_date_time,
        o.total_amount,
        o.order_capacity,
        o.expecting_delivery_date,
        o.route_id,
        r.route_description AS route_details,
        o.delivery_id,
        p.product_id,
        p.product_name,
        p.product_price,
        op.quantity,
        op.price AS unit_price,
        (op.quantity * op.price) AS total_product_price
    FROM 
        Orders o
    INNER JOIN 
        Ordered_products op ON o.order_id = op.order_id
    INNER JOIN 
        Product p ON op.product_id = p.product_id
    INNER JOIN 
        Customer c ON o.customer_id = c.customer_id
    LEFT JOIN 
        Route r ON o.route_id = r.route_id
    WHERE 
        o.order_id = orderId;
END //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTruckToStore`(
    IN tr_vehicle_number VARCHAR(20),
    IN tr_store_id INT
)
BEGIN
    INSERT INTO truck (store_id, vehicle_number, availability) 
    VALUES (tr_store_id, tr_vehicle_number, 1);
END//



DELIMITER //

CREATE FUNCTION count_all_drivers() 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE C1 INT ;
    DECLARE C2 INT ;
    
    SELECT COUNT(*) INTO C1
    FROM driver ;
    
    SELECT COUNT(*) INTO C2
    FROM assistant_driver ;
    
    RETURN C1 + C2 ;
    
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION count_all_managers()
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE C1 INT ;
    DECLARE C2 INT ;
    
    SELECT COUNT(*) INTO C1
    FROM manager ;
    
    SELECT COUNT(*) INTO C2
    FROM financeandorder_manager ;
    
    RETURN C1 + C2 ;
	
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION count_all_stors() 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE C INT ;
    
	SELECT COUNT(*) INTO C
    FROM store ;
    
    RETURN C ;
    
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION count_all_trucks() 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE C INT ;
    
	SELECT COUNT(*) INTO C
    FROM truck ;
    
    RETURN C ;
	
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetAllFinanceOrderManagers()
BEGIN
    SELECT 
        finance_manager_id, 
        manager_first_name, 
        manager_last_name, 
        manager_contact, 
        manager_email
    FROM 
        FinanceandOrder_Manager;
END //

DELIMITER ;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFinanceOrderManagers`()
BEGIN
    SELECT 
        finance_manager_id, 
        manager_first_name, 
        manager_last_name, 
        manager_contact, 
        manager_email
    FROM 
        FinanceandOrder_Manager;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE show_all_stores()
BEGIN
	SELECT * FROM store;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetAstDriversByStoreID(IN input_store_id INT)
BEGIN
    SELECT 
        d.ast_driver_id,
        d.ast_user_name,
        d.ast_driver_first_name,
        d.ast_driver_last_name,
        d.ast_driver_contact,
        d.ast_driver_email,
        d.ast_driver_image_url,
        d.worked_hours,
        d.availability
    FROM 
        assistant_driver d
    WHERE 
        d.store_id = input_store_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetDriversByStoreID(IN input_store_id INT)
BEGIN
    SELECT 
        d.driver_id,
        d.user_name,
        d.driver_first_name,
        d.driver_last_name,
        d.driver_contact,
        d.driver_email,
        d.driver_image_url,
        d.worked_hours,
        d.availability
    FROM 
        Driver d
    WHERE 
        d.store_id = input_store_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetManagersByStoreId(IN store_id_param INT)
BEGIN
    SELECT manager_id, user_name, manager_first_name, manager_last_name, manager_contact, manager_email, manager_image_url
    FROM Manager
    WHERE store_id = store_id_param;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE remove_drivers(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'driver' THEN
        DELETE FROM driver
        WHERE driver_id = input_id;
    
    ELSEIF input_table = 'assistant_driver' THEN
        DELETE FROM assistant_driver
        WHERE ast_driver_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE remove_managers(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'financeandorder_manager' THEN
        DELETE FROM financeandorder_manager
        WHERE finance_manager_id = input_id;
    
    ELSEIF input_table = 'manager' THEN
        DELETE FROM manager
        WHERE manager_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE remove_properties(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'truck' THEN
        DELETE FROM truck
        WHERE truck_id = input_id;
    
    ELSEIF input_table = 'store' THEN
        DELETE FROM store
        WHERE store_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END //

DELIMITER ;

-- table identifyer function : returns user's table nameidentify_table_test_1identify_table

DELIMITER //

CREATE FUNCTION identify_table(in_user_name VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(50);
    
    -- Check in the customer table first
    SELECT 'customer' INTO result
	FROM customer
	WHERE user_name = in_user_name
	LIMIT 1;

    -- Check in the manager table first
     IF result IS NULL THEN
        SELECT 'manager' INTO result
		FROM manager
		WHERE user_name = in_user_name
		LIMIT 1;
    END IF;

    -- If no result found in manager, check in driver
    IF result IS NULL THEN
        SELECT 'driver' INTO result
        FROM driver
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;

    -- If no result found in driver, check in assistant_driver
    IF result IS NULL THEN
        SELECT 'assistant_driver' INTO result
        FROM assistant_driver
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;
    
    -- If no result found in driver, check in hr_manager
    IF result IS NULL THEN
        SELECT 'hr_manager' INTO result
        FROM hr_manager
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;
    
    -- If no result found in driver, check in financeandorder_manager
    IF result IS NULL THEN
        SELECT 'financeandorder_manager' INTO result
        FROM financeandorder_manager
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;

    -- If no result is found in any table, return 'Unknown'
    IF result IS NULL THEN
        SET result = 'Unknown';
    END IF;

    RETURN result;
END //

DELIMITER ;

DELIMITER  //

CREATE DEFINER=`root`@`localhost` PROCEDURE RegisterEndCustomer(
    IN p_user_name VARCHAR(20),
    IN p_password VARCHAR(100),
    IN p_first_name VARCHAR(20),
    IN p_last_name VARCHAR(20),
    IN p_contact INT,
    IN p_email VARCHAR(50),
    IN p_address VARCHAR(200)
)
BEGIN
    INSERT INTO Customer (user_name, password, customer_first_name, customer_last_name, customer_type, customer_contact, customer_email, customer_address)
    VALUES (p_user_name, p_password, p_first_name, p_last_name, 'end customer', p_contact, p_email, p_address);
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE add_orders_to_truck(in_order_id INT, in_truck_delivery_id INT) 
BEGIN
	UPDATE orders
    SET delivery_id = in_truck_delivery_id
    WHERE order_id = in_order_id ;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER after_truck_delivery_insert
AFTER INSERT ON truck_delivery
FOR EACH ROW
BEGIN
    UPDATE truck
    SET availability = false
    WHERE truck_id = NEW.truck_id;

    UPDATE driver
    SET availability = false
    WHERE driver_id = NEW.driver_id;

    UPDATE assistant_driver
    SET availability = false
    WHERE ast_driver_id = NEW.ast_driver_id;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE available_assistant_drivers(in_store_id INT)
BEGIN
	SELECT * FROM assistant_driver
    WHERE store_id = in_store_id  and availability = true ;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE available_drivers(in_store_id INT)
BEGIN
	SELECT * FROM driver
    WHERE store_id = in_store_id  and availability = true ;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE available_trucks(in_store_id INT)
BEGIN
	SELECT * FROM truck
    WHERE store_id = in_store_id  and availability = true ;

END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE confirm_recived_orders(in_order_id INT) 
BEGIN
	UPDATE orders
    SET recieved_to_store = true 
    WHERE order_ID = in_order_id ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE count_orders_to_deliver(in_store_id INT)
BEGIN
	SELECT count(*) FROM orders
	WHERE nearest_store_id = in_store_id and recieved_to_store = true and delivered_confirmation = false ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE count_orders_to_recieve(in_store_id INT)
BEGIN
	SELECT count(*) FROM orders
	WHERE nearest_store_id = in_store_id and sent_by_train = true and recieved_to_store = false ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE orders_to_deliver(in_store_id INT)
BEGIN
	SELECT * FROM orders
	WHERE nearest_store_id = in_store_id and recieved_to_store = true and delivered_confirmation = false ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE orders_to_recieve(in_store_id INT)
BEGIN
	SELECT * FROM orders
	WHERE nearest_store_id = in_store_id and sent_by_train = true and recieved_to_store = false ;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE remove_orders_from_truck(in_order_id INT) 
BEGIN
	UPDATE orders
    SET delivery_id = null
    WHERE order_id = in_order_id ;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE send_truck(in_truck_delivery_id INT)
BEGIN
	UPDATE truck_delivery
    SET sent_datetime = NOW()
    WHERE delivery_id = in_truck_delivery_id ;
    
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE shedule_truck_delivery(in_truck_id INT, in_driver_id INT, in_ast_driver_id INT, in_route_id INT, in_store_id INT)
BEGIN
	INSERT INTO truck_delivery(truck_id, driver_id, ast_driver_id, route_id, store_id)
	VALUES (in_truck_id,in_driver_id,in_ast_driver_id,in_route_id,in_store_id ) ;
END //
DELIMITER ;