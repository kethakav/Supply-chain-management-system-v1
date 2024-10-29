CREATE TABLE `Store` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `store_city` VARCHAR(50),
  `truck_count` INT,
  PRIMARY KEY (`store_id`)
);

CREATE TABLE `Product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(50),
  `product_price` INT,
  `Product_capacity` INT,
  `product_image_url` VARCHAR(500),
  PRIMARY KEY (`product_id`)
);


CREATE TABLE `Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(100),
  `customer_first_name` VARCHAR(20),
  `customer_last_name` VARCHAR(20),
  `customer_type` VARCHAR(20),
  `customer_contact` INT,
  `customer_email` VARCHAR(50),
  `customer_address` VARCHAR(200),
  `customer_image_url` VARCHAR(500),
  PRIMARY KEY (`customer_id`)
);



CREATE TABLE `HR_Manager` (
  `hr_manager_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(100),
  `manager_first_name` VARCHAR(100),
  `manager_last_name` VARCHAR(100),
  `manager_contact` INT,
  `manager_email` VARCHAR(200),
  `manager_image_url` VARCHAR(500),
  PRIMARY KEY (`hr_manager_id`)
);


CREATE TABLE `FinanceandOrder_Manager` (
  `finance_manager_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(100),
  `manager_first_name` VARCHAR(100),
  `manager_last_name` VARCHAR(100),
  `manager_contact` INT,
  `manager_email` VARCHAR(200),
  `manager_image_url` VARCHAR(500),
  PRIMARY KEY (`finance_manager_id`)
);


-- --------------------------------------------------------- --


CREATE TABLE `Assistant_Driver` (
  `ast_driver_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(100),
  `ast_driver_first_name` VARCHAR(100),
  `ast_driver_last_name` VARCHAR(100),
  `ast_driver_contact` INT,
  `ast_driver_email` VARCHAR(200),
  `ast_driver_image_url` VARCHAR(500),
  `store_id` INT,
  `worked_hours` INT,
  `availability` BOOLEAN,
  PRIMARY KEY (`ast_driver_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `Driver` (
  `driver_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(100),
  `driver_first_name` VARCHAR(100),
  `driver_last_name` VARCHAR(100),
  `driver_contact` INT,
  `driver_email` VARCHAR(200),
  `driver_image_url` VARCHAR(500),
  `store_id` INT,
  `worked_hours` INT,
  `availability` BOOLEAN,
  PRIMARY KEY (`driver_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `Manager` (
  `manager_id` INT NOT NULL AUTO_INCREMENT,
  `store_id` INT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(100),
  `manager_first_name` VARCHAR(100),
  `manager_last_name` VARCHAR(100),
  `manager_contact` INT,
  `manager_email` VARCHAR(200),
  `manager_image_url` VARCHAR(500),
  PRIMARY KEY (`manager_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `train` (
  `train_id` int NOT NULL AUTO_INCREMENT,
  `destination_store_id` int DEFAULT NULL,
  `total_capacity` int DEFAULT NULL,
  `departure_day` varchar(50) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_day` varchar(50) DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  PRIMARY KEY (`train_id`),
  KEY `destination_store_id` (`destination_store_id`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`destination_store_id`) REFERENCES `store` (`store_id`)
) ;



CREATE TABLE `Train_delivery` (
  `train_delivery_id` INT NOT NULL AUTO_INCREMENT,
  `train_id` INT,
  `allocated_capacity` INT,
  `sent` BOOLEAN,
  PRIMARY KEY (`train_delivery_id`),
  FOREIGN KEY (`train_id`) REFERENCES `Train`(`train_id`)
);



CREATE TABLE `Truck` (
  `truck_id` INT NOT NULL AUTO_INCREMENT,
  `store_id` INT,
  `vehicle_number` INT,
  `availability` BOOLEAN,
  PRIMARY KEY (`truck_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);


CREATE TABLE `Route` (
  `route_id` INT NOT NULL AUTO_INCREMENT,
  `store_id` INT,
  `end_point` VARCHAR(50),
  `route_description` VARCHAR(500),
  `distance` INT,
  `max_time` INT,
  PRIMARY KEY (`route_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `Truck_Delivery` (
  `delivery_id` INT NOT NULL AUTO_INCREMENT,
  `truck_id` INT,
  `driver_id` INT,
  `ast_driver_id` INT,
  `route_id` INT,
  `store_id` INT,
  `sent_datetime` DATETIME,
  `compleated` BOOLEAN,
  PRIMARY KEY (`delivery_id`),
  FOREIGN KEY (`ast_driver_id`) REFERENCES `Assistant_Driver`(`ast_driver_id`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`route_id`),
  FOREIGN KEY (`driver_id`) REFERENCES `Driver`(`driver_id`),
  FOREIGN KEY (`truck_id`) REFERENCES `Truck`(`truck_id`)
);


CREATE TABLE `Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT,
  `ordered_date_time` DATETIME,
  `total_amount` INT DEFAULT 0,
  `payment_documents` VARCHAR(1000),
  `order_capacity` INT DEFAULT 0,
  `expecting_delivery_date` DATE,
  `nearest_store_id` INT,
  `route_id` INT,
  `route_description_input` VARCHAR(1000),
  `finance_manager_id` INT,
  `confirm_payments` BOOLEAN DEFAULT false,
  `sent_by_train` BOOLEAN DEFAULT false,
  `train_delivery_id` INT,
  `recieved_to_store` BOOLEAN DEFAULT false,
  `delivery_id` INT,
  `delivered_confirmation` BOOLEAN DEFAULT false,
  `delivered_date_time` DATETIME,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`delivery_id`) REFERENCES `Truck_Delivery`(`delivery_id`),
  FOREIGN KEY (`finance_manager_id`) REFERENCES `FinanceandOrder_Manager`(`finance_manager_id`),
  FOREIGN KEY (`nearest_store_id`) REFERENCES `Store`(`store_id`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`route_id`),
  FOREIGN KEY (`train_delivery_id`) REFERENCES `Train_delivery`(`train_delivery_id`)
);


CREATE TABLE `Ordered_products` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT,
  `quantity` INT,
  `price` INT,
  FOREIGN KEY (`product_id`) REFERENCES `Product`(`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`)
);


CREATE TABLE `cart` (
	`customer_id` INT,
	`product_id` INT,
	`quantity` INT,
	FOREIGN KEY (`product_id`) REFERENCES `Product`(`product_id`),
	FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`)
    
);