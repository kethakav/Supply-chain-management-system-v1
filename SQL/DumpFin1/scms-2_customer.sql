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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'ashan23',NULL,'Ashan','Perera','end customer',774123456,'ashan.perera@email.com','123, Galle Road, Colombo 03',NULL),(2,'janaki89',NULL,'Janaki','Silva','retailer',772987654,'janaki.silva@email.com','45, Temple Road, Kandy',NULL),(3,'kasun_k10',NULL,'Kasun','Kumara','wholesaler',777654321,'kasun.kumara@biz.com','78, Main Street, Negombo',NULL),(4,'nirosha_s1',NULL,'Nirosha','Fernando','end customer',779876543,'nirosha.fernando@email.com','90, St. Josephs Lane, Gampaha',NULL),(5,'uditha_biz',NULL,'Uditha','Wickramasinghe','wholesaler',771234567,'uditha.wickramasinghe@biz.com','105, Green Park, Dehiwala',NULL),(6,'niluka_w',NULL,'Niluka','Weerasinghe','retailer',773456789,'niluka.weerasinghe@email.com','88, Lake Road, Ratnapura',NULL),(7,'ranjith_99',NULL,'Ranjith','Bandara','wholesaler',771987654,'ranjith.bandara@email.com','101, High Street, Anuradhapura',NULL),(8,'sriya_m',NULL,'Sriya','Mendis','end customer',772345678,'sriya.mendis@email.com','200, Main Road, Panadura',NULL),(9,'harsha_d',NULL,'Harsha','Dissanayake','retailer',775432109,'harsha.dissanayake@email.com','57, Park Avenue, Matara',NULL),(10,'kavinda_l',NULL,'Kavinda','Lakmal','end customer',777321654,'kavinda.lakmal@email.com','32, Flower Road, Nugegoda',NULL),(11,'samitha_45',NULL,'Samitha','Jayasinghe','wholesaler',771654789,'samitha.jayasinghe@biz.com','67, Lake Drive, Nawala',NULL),(12,'maheshi_t',NULL,'Maheshi','Tharanga','retailer',778765432,'maheshi.tharanga@email.com','201, Mahaweli Gardens, Kurunegala',NULL),(13,'nuwan_k',NULL,'Nuwan','Karunaratne','end customer',774567890,'nuwan.karunaratne@email.com','150, Sea Breeze Avenue, Moratuwa',NULL),(14,'sanduni_p',NULL,'Sanduni','Perera','wholesaler',776543210,'sanduni.perera@biz.com','92, Hill Side Road, Nuwara Eliya',NULL),(15,'chathura_d',NULL,'Chathura','Dahanayake','retailer',772234567,'chathura.dahanayake@email.com','78, Kingsway Road, Galle',NULL),(16,'ayesha_s',NULL,'Ayesha','Samarasinghe','end customer',775678901,'ayesha.samarasinghe@email.com','45, New Town, Jaffna',NULL),(17,'isuru_m',NULL,'Isuru','Mendis','wholesaler',773987654,'isuru.mendis@biz.com','12, D. S. Senanayake Mawatha, Colombo 07',NULL),(18,'kasuni_k',NULL,'Kasuni','Kariyawasam','retailer',779876543,'kasuni.kariyawasam@email.com','101, Gampaha Road, Gampaha',NULL),(19,'suraj_j',NULL,'Suraj','Jayawardena','end customer',774567321,'suraj.jayawardena@email.com','23, Ambepussa Lane, Kandy',NULL),(20,'manuja_p',NULL,'Manuja','Pathirana','wholesaler',778654321,'manuja.pathirana@biz.com','34, Lotus Grove, Batticaloa',NULL),(21,'cust1','$argon2id$v=19$m=65536,t=3,p=4$76YRXgC2xZyz5MpzJ9xcDQ$W6F1i/gVFhcpL3IE/qa7tbBI3EwQHnnVUXav4SJT6yw','Customer','1','end customer',789456,'customer1@gmail.com','fdvdnfhsdn fdfdf',NULL),(22,'ret1','$argon2id$v=19$m=65536,t=3,p=4$FCrZcvJYeBKDxqiO5N+BUQ$qYmWhK+j28Nz6PV5K7BySqyifa7DSWfEvEYvgAFQRQQ','Retailer','Customer','retailer',789456,'customer1@gmail.com','fdvdnfhsdn fdfdf',NULL),(23,'whole1','$argon2id$v=19$m=65536,t=3,p=4$in5xj7XbXGIUf0csDkRWFA$68RR4W61NbSnOMBTZ0DHm0xOf3qLJh1H4ydtF2Uz1vk','Wholesaler','Customer 1','wholesaler',789456,'customer1@gmail.com','fdvdnfhsdn fdfdf',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
