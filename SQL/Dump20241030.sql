-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: dboriginal
-- ------------------------------------------------------
-- Server version	9.0.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assistant_driver`
--

DROP TABLE IF EXISTS `assistant_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assistant_driver` (
  `ast_driver_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `ast_driver_first_name` varchar(100) DEFAULT NULL,
  `ast_driver_last_name` varchar(100) DEFAULT NULL,
  `ast_driver_contact` int DEFAULT NULL,
  `ast_driver_email` varchar(200) DEFAULT NULL,
  `ast_driver_image_url` varchar(500) DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `worked_hours` int DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ast_driver_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `assistant_driver_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistant_driver`
--

LOCK TABLES `assistant_driver` WRITE;
/*!40000 ALTER TABLE `assistant_driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `assistant_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `customer_first_name` varchar(20) DEFAULT NULL,
  `customer_last_name` varchar(20) DEFAULT NULL,
  `customer_type` varchar(20) DEFAULT NULL,
  `customer_contact` int DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `customer_address` varchar(200) DEFAULT NULL,
  `customer_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (24,'user1','$argon2id$v=19$m=65536,t=3,p=4$D8wCWFCEMB9fA/HBiN3vaQ$ilx5X8i6ZMoWXkNliSuHdTvOnzDUJwAS7haqfmKU6dA','user1','user','end customer',775656897,'user1@gmail.com','19,Main Road, Seeduwa',NULL),(25,'user2','$argon2id$v=19$m=65536,t=3,p=4$Ac7xQaGhAZo5IDvtupt/Bg$4+fJDTesgQKqVL1lJzeCJ68GM1GjEcAuTdx7Ety5OnM','user2','user','end customer',778656453,'user2@gmail.com','23,Main Street,Koggala',NULL),(26,'user3','$argon2id$v=19$m=65536,t=3,p=4$Y0FdtseE9h2c5YlTMz7Nww$QHco3311OGJnhUsdXcV/QZKPY292IcKa9lL54HAYRns','user3','user','end customer',712354679,'user3@gmail.com','29,Circular Road,Mutur',NULL),(27,'user4','$argon2id$v=19$m=65536,t=3,p=4$lUogi4ya+PRd3Rhzv/zYlA$EZDKy1qFuB24zx906pbk1gaXhIJPRo8qvPnndGq1bWw','user4','user','retailer',778656432,'user4@gmail.com','89,School road,Kinniya',NULL),(30,'user5','$argon2id$v=19$m=65536,t=3,p=4$m17Gd7K+YNSzkP4aoq6iVw$DupL35us2LUTdURRcCSsaNYZXeZzanPcHAIPpIGrMMg','user5','user','retailer',776534897,'user5@gmail.com','34,Lakeside Road,Wattala',NULL),(31,'user6','$argon2id$v=19$m=65536,t=3,p=4$Didag18GnOPqU2x+ehsO4g$uoRfIBTjHU7huJ8N32hFQChnMkfGCvA+iF71wkl4PWE','user6','user','retailer',776589234,'user6@gmail.com','89,Galler Road, Moratuwa',NULL),(32,'user7','$argon2id$v=19$m=65536,t=3,p=4$aAAfqUoYahMFwWcA2/1p0g$R+vrbUt5ByFNJDQVUDiviaAxLUEADL2ucW+Jgb9h6xY','user7','user','wholesaler',776589086,'user7@gmail.com','56, Main Street, Akuressa',NULL),(33,'user8','$argon2id$v=19$m=65536,t=3,p=4$d2xHVZQWPnSf9G6NM1hcsA$KjHBSyWsRgyhiPlxGFf9cdQcURSFSdhiCEFesA5bn5o','user8','user','wholesaler',775689076,'user8@gmail.com','No.90, Hospital Road, Nelliady',NULL),(34,'user9','$argon2id$v=19$m=65536,t=3,p=4$OTCWW6SUuNXI3yILmp+djw$5fCjc0MGnJu0oRn1A7Wk/SBn6Lzv7SZ72L7HuJmiD20','user9','user','wholesaler',776890543,'user9@gmail.com','no.90, Kochchikade',NULL),(35,'user10','$argon2id$v=19$m=65536,t=3,p=4$R16qhbFR2qxhlyJExTekXw$gnDA2B5/43SLuLSdt6HFAUsFnq7CdboZdPFePlF56Cs','user10','user','wholesaler',776534897,'user10@gmail.com','no.10, Main road, Seeduwa',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `driver_first_name` varchar(100) DEFAULT NULL,
  `driver_last_name` varchar(100) DEFAULT NULL,
  `driver_contact` int DEFAULT NULL,
  `driver_email` varchar(200) DEFAULT NULL,
  `driver_image_url` varchar(500) DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `worked_hours` int DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`driver_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeandorder_manager`
--

DROP TABLE IF EXISTS `financeandorder_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financeandorder_manager` (
  `finance_manager_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `manager_first_name` varchar(100) DEFAULT NULL,
  `manager_last_name` varchar(100) DEFAULT NULL,
  `manager_contact` int DEFAULT NULL,
  `manager_email` varchar(200) DEFAULT NULL,
  `manager_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`finance_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeandorder_manager`
--

LOCK TABLES `financeandorder_manager` WRITE;
/*!40000 ALTER TABLE `financeandorder_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `financeandorder_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_manager`
--

DROP TABLE IF EXISTS `hr_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hr_manager` (
  `hr_manager_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `manager_first_name` varchar(100) DEFAULT NULL,
  `manager_last_name` varchar(100) DEFAULT NULL,
  `manager_contact` int DEFAULT NULL,
  `manager_email` varchar(200) DEFAULT NULL,
  `manager_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`hr_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_manager`
--

LOCK TABLES `hr_manager` WRITE;
/*!40000 ALTER TABLE `hr_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `manager_first_name` varchar(100) DEFAULT NULL,
  `manager_last_name` varchar(100) DEFAULT NULL,
  `manager_contact` int DEFAULT NULL,
  `manager_email` varchar(200) DEFAULT NULL,
  `manager_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_products`
--

DROP TABLE IF EXISTS `ordered_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_products` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `ordered_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `ordered_products_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_products`
--

LOCK TABLES `ordered_products` WRITE;
/*!40000 ALTER TABLE `ordered_products` DISABLE KEYS */;
INSERT INTO `ordered_products` VALUES (14,1,3,60000),(14,3,3,39000),(14,4,1,10000),(15,1,1,20000),(15,2,1,9600),(15,3,1,13000),(15,5,2,40000),(16,1,7,140000),(17,4,5,50000),(17,5,4,80000),(18,1,6,120000),(18,2,4,38400),(18,3,4,52000),(18,4,3,30000),(18,5,2,40000),(19,1,2,40000),(19,3,3,39000),(19,5,3,60000),(20,1,3,60000),(20,2,2,19200),(20,3,2,26000),(21,1,2,40000),(21,4,2,20000),(22,1,1,20000),(22,3,1,13000),(22,4,1,10000),(23,1,3,60000),(23,3,2,26000),(23,4,1,10000),(24,4,3,30000),(24,3,2,26000),(24,5,2,40000),(25,2,2,19200),(26,1,2,40000),(26,3,9,117000),(27,1,4,80000),(27,2,3,28800),(27,3,3,39000),(27,4,3,30000),(28,1,3,60000),(29,3,9,117000),(29,2,5,48000),(30,3,5,65000),(30,2,5,48000),(31,1,10,200000),(32,1,4,80000),(32,2,4,38400),(33,3,9,117000);
/*!40000 ALTER TABLE `ordered_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `ordered_date_time` datetime DEFAULT NULL,
  `total_amount` int DEFAULT '0',
  `payment_documents` varchar(1000) DEFAULT NULL,
  `order_capacity` int DEFAULT '0',
  `expecting_delivery_date` date DEFAULT NULL,
  `nearest_store_id` int DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  `route_description_input` varchar(1000) DEFAULT NULL,
  `finance_manager_id` int DEFAULT NULL,
  `confirm_payments` tinyint(1) DEFAULT '0',
  `sent_by_train` tinyint(1) DEFAULT '0',
  `train_delivery_id` int DEFAULT NULL,
  `recieved_to_store` tinyint(1) DEFAULT '0',
  `delivery_id` int DEFAULT NULL,
  `delivered_confirmation` tinyint(1) DEFAULT '0',
  `delivered_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `delivery_id` (`delivery_id`),
  KEY `finance_manager_id` (`finance_manager_id`),
  KEY `nearest_store_id` (`nearest_store_id`),
  KEY `route_id` (`route_id`),
  KEY `train_delivery_id` (`train_delivery_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `truck_delivery` (`delivery_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`finance_manager_id`) REFERENCES `financeandorder_manager` (`finance_manager_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`nearest_store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`train_delivery_id`) REFERENCES `train_delivery` (`train_delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (14,24,'2024-10-30 19:03:19',109000,'https://payments.example.com/slip/123456',7,'2024-11-06',1,1,'From Colombo Fort,passing Technical Junction, Panchikawatta, along base line road to Sedawatta, along Negambo road to Wattala',NULL,0,0,NULL,0,NULL,0,NULL),(15,24,'2024-10-30 19:06:23',82600,'https://billing.example.net/invoice/20231012',5,'2024-11-06',1,2,'From Colombo Fort, passing Mount Lavinia and Ratmalana, along Galle Road to Moratuwa',NULL,0,0,NULL,0,NULL,0,NULL),(16,25,'2024-10-30 19:07:57',140000,'https://payportal.com/slips/ABX98765',7,'2024-11-06',2,5,'From Negombo, along Giriulla Road via Koppara Junction and Kandawala to reach Katana',NULL,0,0,NULL,0,NULL,0,NULL),(17,25,'2024-10-30 19:09:47',130000,'https://myaccount.fakepay.com/paymentslip/870239',9,'2024-11-06',1,3,'From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama',NULL,0,0,NULL,0,NULL,0,NULL),(18,26,'2024-10-30 19:11:29',280400,'https://securepay.example.org/slip/REF76342',19,'2024-11-06',1,2,'From Colombo Fort, passing Mount Lavinia and Ratmalana, along Galle Road to Moratuwa',NULL,0,0,NULL,0,NULL,0,NULL),(19,26,'2024-10-30 19:14:59',139000,'https://invoices.paymentgateway.com/slip/INV90127',8,'2024-11-06',3,8,'From Galle, along Galle Road passing Bossa to reach Hikkaduwa',NULL,0,0,NULL,0,NULL,0,NULL),(20,27,'2024-10-30 19:16:59',105200,'https://invoices.paymentgateway.com/slip/INV901273',7,'2024-11-06',4,10,'From Matara, along Matara Road passing Mirissa to reach Weligama',NULL,0,0,NULL,0,NULL,0,NULL),(21,27,'2024-10-30 19:18:01',60000,'https://payfake.example.biz/payment/567889',4,'2024-11-06',5,14,'From Jaffna, via Jayanthan and Karativu Road to reach Vaddukoddai',NULL,0,0,NULL,0,NULL,0,NULL),(22,30,'2024-10-30 19:21:50',43000,'https://checkout.fakeinvoice.com/slip/REF2023A',3,'2024-11-06',2,5,'From Negombo, along Giriulla Road via Koppara Junction and Kandawala to reach Katana',NULL,0,0,NULL,0,NULL,0,NULL),(23,30,'2024-10-30 19:22:55',96000,'https://securebill.example.org/payment/103928',6,'2024-11-06',1,3,'From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama',NULL,0,0,NULL,0,NULL,0,NULL),(24,31,'2024-10-30 19:24:58',96000,'https://customerportal.demo.com/slip/9237812',7,'2024-11-06',2,6,'From Negombo, via Periyamulla along Puttalama-Colombo main road passing Kattuwa to reach Kochchikade',NULL,0,0,NULL,0,NULL,0,NULL),(25,31,'2024-10-30 19:36:17',19200,'https://myaccount.fakebilling.com/slip/REF65748',2,'2024-11-06',1,3,'From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama',NULL,0,0,NULL,0,NULL,0,NULL),(26,32,'2024-10-30 19:37:58',157000,'https://billingportal.example.net/receipt/REF109283',11,'2024-11-06',1,1,'From Colombo Fort,passing Technical Junction, Panchikawatta, along base line road to Sedawatta, along Negambo road to Wattala',NULL,0,0,NULL,0,NULL,0,NULL),(27,32,'2024-10-30 19:39:05',177800,'https://receipts.demo.com/payment/INV20231018',13,'2024-11-06',4,11,'From Matara, via Malimbada and Thelijjawila to reach Akuressa',NULL,0,0,NULL,0,NULL,0,NULL),(28,33,'2024-10-30 19:41:48',60000,'https://myinvoiceportal.example.com/slip/3001928',3,'2024-11-06',3,7,'From Galle, passing Hapugala and Wakwella to reach Ginimellagaha and then Beddegama',NULL,0,0,NULL,0,NULL,0,NULL),(29,33,'2024-10-30 19:42:40',165000,'https://invoice.fakepay.net/slip/REF98231',14,'2024-11-06',1,3,'Maharagama\', \'From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama',NULL,0,0,NULL,0,NULL,0,NULL),(30,34,'2024-10-30 19:43:40',113000,'https://myinvoiceportal.example.com/slip/3001928',10,'2024-11-06',2,5,'From Negombo, along Giriulla Road via Koppara Junction and Kandawala to reach Katana',NULL,0,0,NULL,0,NULL,0,NULL),(31,34,'2024-10-30 19:44:33',200000,'https://paymentslip.fakepay.com/slip/237498',10,'2024-11-06',2,4,'From Negombo, along Negombo Road passing Kurana to reach Seeduwa',NULL,0,0,NULL,0,NULL,0,NULL),(32,35,'2024-10-30 19:48:35',118400,'https://securebill.example.org/payment/1039287',8,'2024-11-06',6,16,'From Trincomalee, along Kandy Road and crossing Kinniya Bridge to reach Kinniya',NULL,0,0,NULL,0,NULL,0,NULL),(33,35,'2024-10-30 19:49:24',117000,'https://invoicecenter.fakepay.org/invoice/1982736',9,'2024-11-06',3,7,'From Galle, passing Hapugala and Wakwella to reach Ginimellagaha and then Beddegama',NULL,0,0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  `Product_capacity` int DEFAULT NULL,
  `product_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Hisence UHD TV',20000,100,'/images/product/tv1.png'),(2,'INNOVEX 32 Inch TV',9600,200,'/images/product/tv2.png'),(3,'Abans 42 Inch TV',13000,300,'/images/product/tv3.png'),(4,'Abans 32 Inch HD TV',10000,250,'/images/product/tv4.png'),(5,'Samsung Smart TV',20000,150,'/images/product/tv5.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `end_point` varchar(50) DEFAULT NULL,
  `route_description` varchar(500) DEFAULT NULL,
  `distance` int DEFAULT NULL,
  `max_time` int DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1,'Wattala','From Colombo Fort,passing Technical Junction, Panchikawatta, along base line road to Sedawatta, along Negambo road to Wattala',10,30),(2,1,'Moratuwa','From Colombo Fort, passing Mount Lavinia and Ratmalana, along Galle Road to Moratuwa',20,60),(3,1,'Maharagama','From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama',15,40),(4,2,'Seeduwa','From Negombo, along Negombo Road passing Kurana to reach Seeduwa',11,25),(5,2,'Katana','From Negombo, along Giriulla Road via Koppara Junction and Kandawala to reach Katana',10,20),(6,2,'Kochchikade','From Negombo, via Periyamulla along Puttalama-Colombo main road passing Kattuwa to reach Kochchikade',8,18),(7,3,'Beddegama','From Galle, passing Hapugala and Wakwella to reach Ginimellagaha and then Beddegama',20,40),(8,3,'Hikkaduwa','From Galle, along Galle Road passing Bossa to reach Hikkaduwa',20,40),(9,3,'Koggala','From Galle, along Matara Road via Unawatuna and Thalpe to reach Koggala',22,40),(10,4,'Weligama','From Matara, along Matara Road passing Mirissa to reach Weligama',20,30),(11,4,'Akuressa','From Matara, via Malimbada and Thelijjawila to reach Akuressa',25,40),(12,4,'Dikwella','From Matara, along New Thangalla Road passing Gandara and Pathegama to reach Dikwella',23,40),(13,5,'Tellippalai','From Jaffna, along Eluppayady Junction and Jaffna Kankasanthurai Road passing Chunnakkam to reach Tellippalai',17,30),(14,5,'Vaddukoddai','From Jaffna, via Jayanthan and Karativu Road to reach Vaddukoddai',14,25),(15,5,'Nelliady','From Jaffna, along Nallur and Jaffna Point Pedro Road passing Neervely to reach Nelliady',25,40),(16,6,'Kinniya','From Trincomalee, along Kandy Road and crossing Kinniya Bridge to reach Kinniya',20,35),(17,6,'Mutur','From Trincomalee, via Trincomalee-Muttur Road passing Sampur to reach Mutur',30,50),(18,6,'Kuchchaveli','From Trincomalee, along Pulmoddai Road passing Nilaveli to reach Kuchchaveli',35,55);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_city` varchar(50) DEFAULT NULL,
  `truck_count` int DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Colombo',5),(2,'Negombo',3),(3,'Galle',3),(4,'Matara',3),(5,'Jaffna',4),(6,'Trincomalee',3);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,1,1000,'2024-10-14','08:00:00','2024-10-14','10:00:00'),(2,2,800,'2024-10-15','09:30:00','2024-10-15','11:00:00'),(3,3,1200,'2024-10-16','07:45:00','2024-10-16','09:45:00'),(4,4,500,'2024-10-17','06:00:00','2024-10-17','08:30:00'),(5,5,600,'2024-10-18','05:30:00','2024-10-18','08:30:00'),(6,6,1000,'2024-10-19','07:15:00','2024-10-19','10:15:00');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_delivery`
--

DROP TABLE IF EXISTS `train_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_delivery` (
  `train_delivery_id` int NOT NULL AUTO_INCREMENT,
  `train_id` int DEFAULT NULL,
  `allocated_capacity` int DEFAULT NULL,
  `sent` tinyint DEFAULT NULL,
  PRIMARY KEY (`train_delivery_id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `train_delivery_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_delivery`
--

LOCK TABLES `train_delivery` WRITE;
/*!40000 ALTER TABLE `train_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `train_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `truck_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `vehicle_number` int DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`truck_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `truck_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_delivery`
--

DROP TABLE IF EXISTS `truck_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck_delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `truck_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `ast_driver_id` int DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `sent_datetime` datetime DEFAULT NULL,
  `compleated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `ast_driver_id` (`ast_driver_id`),
  KEY `route_id` (`route_id`),
  KEY `driver_id` (`driver_id`),
  KEY `truck_id` (`truck_id`),
  CONSTRAINT `truck_delivery_ibfk_1` FOREIGN KEY (`ast_driver_id`) REFERENCES `assistant_driver` (`ast_driver_id`),
  CONSTRAINT `truck_delivery_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  CONSTRAINT `truck_delivery_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  CONSTRAINT `truck_delivery_ibfk_4` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`truck_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_delivery`
--

LOCK TABLES `truck_delivery` WRITE;
/*!40000 ALTER TABLE `truck_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck_delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 19:53:38
