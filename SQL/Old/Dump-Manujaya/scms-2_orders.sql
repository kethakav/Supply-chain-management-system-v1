-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: scms-2
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (14,24,'2024-10-30 15:38:51',88000,'xdtcfbg',7,'2024-11-06',1,2,'sdxfcgvh',8,1,1,17,1,22,1,'2024-10-30 16:26:09'),(15,24,'2024-10-30 16:32:14',200000,'yhfvhm',10,'2024-11-06',2,6,'rfgdhnyg linh,kj lk;jkjnkloi rfgdhnyg linh,kj lk;jkjnkloirfgdhnyg linh,kj lk;jkjnkloirfgdhnyg linh,kj lk;jkjnkloi',8,1,1,17,0,NULL,0,NULL),(16,28,'2024-10-30 20:35:36',86000,'11',5,'2024-11-06',1,1,'Go along Galle road and Come to Pelawatta',9,1,1,20,1,23,1,'2024-10-30 22:10:15'),(17,28,'2024-10-30 20:38:44',60000,'11-2',3,'2024-11-06',1,1,'Go along Galle road and Come to Pelawatta',9,1,1,18,0,NULL,0,NULL),(18,26,'2024-10-30 20:44:41',62000,'12-1',5,'2024-11-06',4,11,'Go along Hambantota road',9,1,0,18,0,NULL,0,NULL),(19,26,'2024-10-30 20:45:18',66000,'12-2',4,'2024-11-06',4,11,'Go along Hambantota road',9,1,0,18,0,NULL,0,NULL),(20,27,'2024-10-30 20:47:18',69600,'13-1',4,'2024-11-06',2,4,'Go along kurunagala road and come to Puttalama',9,1,0,18,0,NULL,0,NULL),(21,27,'2024-10-30 20:48:37',30000,'13-2',2,'2024-11-06',2,4,'Go along Kurunagala road and come to Puttalama',NULL,0,0,NULL,0,NULL,0,NULL),(22,29,'2024-10-30 20:51:16',216800,'14-1',15,'2024-11-06',1,3,'Go along Galle road and near Parliament',9,1,1,18,1,NULL,0,NULL),(23,29,'2024-10-30 20:52:22',178000,'14-2',16,'2024-11-06',1,3,'Go along Galle road and near parliament',NULL,0,0,NULL,0,NULL,0,NULL),(24,30,'2024-10-30 20:55:18',177600,'15-1',12,'2024-11-06',3,8,'Come along Ambalangoda road ',NULL,0,0,NULL,0,NULL,0,NULL),(25,30,'2024-10-30 20:55:57',157600,'15-2',16,'2024-11-06',3,8,'Come along Ambalangoda road ',NULL,0,0,NULL,0,NULL,0,NULL),(26,31,'2024-10-30 20:58:19',223400,'16-1',15,'2024-11-06',5,15,'Come along Kilinochchi road',9,1,0,18,0,NULL,0,NULL),(27,31,'2024-10-30 20:58:58',170000,'16-2',10,'2024-11-06',5,15,'Come along Kilinochchi road',NULL,0,0,NULL,0,NULL,0,NULL),(28,32,'2024-10-30 21:01:07',9600,'17-1',1,'2024-11-06',1,2,'Come along Galle road',NULL,0,0,NULL,0,NULL,0,NULL),(29,32,'2024-10-30 21:01:43',13000,'17-2',1,'2024-11-06',1,2,'Come along Galle road',NULL,0,0,NULL,0,NULL,0,NULL),(30,33,'2024-10-30 21:04:56',9600,'18-1',1,'2024-11-06',6,16,'Come along Polonnaruwa road',NULL,0,0,NULL,0,NULL,0,NULL),(31,33,'2024-10-30 21:05:22',13000,'18-2',1,'2024-11-06',6,16,'Come along Polonnaruwa road',NULL,0,0,NULL,0,NULL,0,NULL),(32,34,'2024-10-30 21:06:48',20000,'19-1',1,'2024-11-06',6,17,'Come to mutur through Thoppigala road',9,1,0,18,0,NULL,0,NULL),(33,34,'2024-10-30 21:07:19',13000,'19-2',1,'2024-11-06',6,17,'Come to mutur through Thoppigala road',NULL,0,0,NULL,0,NULL,0,NULL),(34,35,'2024-10-30 21:08:59',30000,'20-1',2,'2024-11-06',1,1,'Come along Wattala road',9,1,1,24,1,23,0,NULL),(35,35,'2024-10-30 21:09:24',9600,'20-2',1,'2024-11-06',1,1,'Come along Wattala road',NULL,0,0,NULL,0,NULL,0,NULL);
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

-- Dump completed on 2024-10-30 22:15:18
