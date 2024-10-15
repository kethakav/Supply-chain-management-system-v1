CREATE TABLE `Store` (
  `store_id` INT,
  `store_city` VARCHAR(50),
  `truck_count` INT,
  PRIMARY KEY (`store_id`)
);


CREATE TABLE `Product` (
  `product_id` INT,
  `product_name` VARCHAR(50),
  `product_price` INT,
  `Product_capacity` INT,
  `product_image_url` VARCHAR(500),
  PRIMARY KEY (`product_id`)
);


CREATE TABLE `Customer` (
  `customer_id` INT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(16),
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
  `hr_manager_id` INT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(16),
  `manager_first_name` VARCHAR(100),
  `manager_last_name` VARCHAR(100),
  `manager_contact` INT,
  `manager_email` VARCHAR(200),
  `manager_image_url` VARCHAR(500),
  PRIMARY KEY (`hr_manager_id`)
);


CREATE TABLE `FinanceandOrder_Manager` (
  `finance_manager_id` INT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(16),
  `manager_first_name` VARCHAR(100),
  `manager_last_name` VARCHAR(100),
  `manager_contact` INT,
  `manager_email` VARCHAR(200),
  `manager_image_url` VARCHAR(500),
  PRIMARY KEY (`finance_manager_id`)
);


-- --------------------------------------------------------- --


CREATE TABLE `Assistant_Driver` (
  `ast_driver_id` INT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(16),
  `ast_driver_first_name` VARCHAR(100),
  `ast_driver_last_name` VARCHAR(100),
  `ast_driver_contact` INT,
  `ast_driver_email` VARCHAR(200),
  `ast_driver_image_url` VARCHAR(500),
  `store_id` INT,
  `worked_hours` INT,
  PRIMARY KEY (`ast_driver_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `Driver` (
  `driver_id` INT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(16),
  `driver_first_name` VARCHAR(100),
  `driver_last_name` VARCHAR(100),
  `driver_contact` INT,
  `driver_email` VARCHAR(200),
  `driver_image_url` VARCHAR(500),
  `store_id` INT,
  `worked_hours` INT,
  PRIMARY KEY (`driver_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `Manager` (
  `manager_id` INT,
  `store_id` INT,
  `user_name` VARCHAR(20),
  `password` VARCHAR(16),
  `manager_first_name` VARCHAR(100),
  `manager_last_name` VARCHAR(100),
  `manager_contact` INT,
  `manager_email` VARCHAR(200),
  `manager_image_url` VARCHAR(500),
  PRIMARY KEY (`manager_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `Train` (
  `train_id` INT,
  `destination_store_id` INT,
  `total_capacity` INT,
  `departure` DATETIME,
  `arrival` DATETIME,
  PRIMARY KEY (`train_id`),
  FOREIGN KEY (`destination_store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `Train_delivery` (
  `train_delivery_id` INT,
  `train_id` INT,
  `allocated_capacity` INT,
  PRIMARY KEY (`train_delivery_id`),
  FOREIGN KEY (`train_id`) REFERENCES `Train`(`train_id`)
);



CREATE TABLE `Truck` (
  `truck_id` INT,
  `store_id` INT,
  `vehicle_number` INT,
  PRIMARY KEY (`truck_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);


CREATE TABLE `Route` (
  `route_id` INT,
  `store_id` INT,
  `end_point` VARCHAR(50),
  `route_description` VARCHAR(500),
  `distance` INT,
  `max_time` INT,
  PRIMARY KEY (`route_id`),
  FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`)
);



CREATE TABLE `Truck_Delivery` (
  `delivery_id` INT,
  `truck_id` INT,
  `driver_id` INT,
  `ast_driver_id` INT,
  `route_id` INT,
  `manager_id` INT,
  `sent_datetime` DATETIME,
  PRIMARY KEY (`delivery_id`),
  FOREIGN KEY (`ast_driver_id`) REFERENCES `Assistant_Driver`(`ast_driver_id`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`route_id`),
  FOREIGN KEY (`driver_id`) REFERENCES `Driver`(`driver_id`),
  FOREIGN KEY (`truck_id`) REFERENCES `Truck`(`truck_id`),
  FOREIGN KEY (`manager_id`) REFERENCES `Manager`(`manager_id`)
);


CREATE TABLE `Order` (
  `order_id` INT,
  `customer_id` INT,
  `ordered_date_time` DATETIME,
  `total_amount` INT,
  `payment_documents` VARCHAR(1000),
  `order_capacity` INT,
  `expecting_delivery_date` DATE,
  `delivery_address` VARCHAR(1000),
  `nearest_store_id` INT,
  `route_description_input` VARCHAR(1000),
  `finance_manager_id` INT,
  `confirm_payments` BOOLEAN,
  `sent_by_train` BOOLEAN,
  `train_delivery_id` INT,
  `recieved_to_store` BOOLEAN,
  `delivery_id` INT,
  `delivered_confirmation` BOOLEAN,
  `delivered_date_time` DATETIME,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`delivery_id`) REFERENCES `Truck_Delivery`(`delivery_id`),
  FOREIGN KEY (`finance_manager_id`) REFERENCES `FinanceandOrder_Manager`(`finance_manager_id`),
  FOREIGN KEY (`nearest_store_id`) REFERENCES `Store`(`store_id`),
  FOREIGN KEY (`train_delivery_id`) REFERENCES `Train_delivery`(`train_delivery_id`)
);


CREATE TABLE `Ordered_products` (
  `order_id` INT,
  `product_id` INT,
  `quantity` INT,
  FOREIGN KEY (`product_id`) REFERENCES `Product`(`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `Order`(`order_id`)
);






