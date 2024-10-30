-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: scms-2
-- ------------------------------------------------------
-- Server version	8.0.39

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,21,'2024-10-27 08:46:09',90000,'fdvdjnk',2,'2024-11-03',1,1,'fhueifhe',1,1,1,11,1,1,1,NULL),(2,21,'2024-10-27 23:47:23',690000,'bfdvd',5,'2024-11-03',1,2,'vdvd',NULL,1,1,10,1,1,0,NULL),(3,21,'2024-10-27 23:47:52',390000,'bfd',5,'2024-11-03',6,16,'vdvdfv',6,1,0,9,0,NULL,0,NULL),(4,21,'2024-10-28 03:28:56',215000,'sxdrcfvghb',2,'2024-11-04',6,17,'bhjbhgv',6,1,1,10,0,NULL,0,NULL),(5,21,'2024-10-28 06:09:11',875000,'brtb',5,'2024-11-04',3,8,'fdfgft',6,1,1,10,1,NULL,0,NULL),(6,21,'2024-10-28 06:09:25',45000,'fgbgfb',3,'2024-11-04',3,8,'bfbfgb',6,1,1,11,1,NULL,0,NULL),(7,21,'2024-10-28 06:09:48',75000,'btrb',1,'2024-11-04',2,4,'vvrdfvr',6,1,1,11,0,NULL,0,NULL),(8,21,'2024-10-29 18:46:56',415000,'fs',3,'2024-11-05',1,1,'fd',6,1,1,13,1,15,0,NULL),(9,21,'2024-10-30 06:40:22',200000,'rvd',1,'2024-11-06',1,1,'vfdv',6,1,1,14,1,18,1,'2024-10-30 14:29:57'),(10,21,'2024-10-30 08:44:54',200000,'bbdftb',1,'2024-11-06',1,1,'vvdrb',6,1,1,15,1,20,1,'2024-10-30 08:48:59'),(11,22,'2024-10-30 11:28:34',260000,'bhjnk',5,'2024-11-06',1,1,'xdrcftvgh',6,1,1,17,1,22,1,'2024-10-30 14:29:50'),(12,23,'2024-10-30 11:41:37',660000,'fgvhbj',7,'2024-11-06',1,3,'ftyghu',6,1,1,17,1,22,1,'2024-10-30 14:29:51'),(13,21,'2024-10-30 12:30:59',15000,'jnhbgv',1,'2024-11-06',1,1,'xrdcftgvh',6,1,1,16,1,21,0,'2024-10-30 13:14:11'),(14,21,'2024-10-30 14:31:42',200000,'h',1,'2024-11-06',1,1,'rtfgh',NULL,0,0,NULL,0,NULL,0,NULL),(15,21,'2024-10-30 15:57:07',42600,'drdctfvgh',3,'2024-11-06',1,1,'ftyg',NULL,0,0,NULL,0,NULL,0,NULL),(16,21,'2024-10-30 18:24:58',215000,'tfvygbh',2,'2024-11-06',1,2,'vfgbhjn',6,1,1,18,1,24,1,'2024-10-30 18:44:16'),(17,21,'2024-10-30 19:26:45',275000,'tyvubhjnkml',2,'2024-11-06',1,1,'ctfvyghubjn',6,1,1,19,1,NULL,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 19:46:16
