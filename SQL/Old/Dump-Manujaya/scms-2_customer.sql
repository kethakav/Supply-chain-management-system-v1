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
INSERT INTO `customer` VALUES (26,'user12','$argon2id$v=19$m=65536,t=3,p=4$FfdkkZdKNfNPi0JXuJkRJg$xR6apdRqZMjzhg4JbpBXCQgEam2QMpI4YmCC1E/xqd8','user12_firstName','user12_lastName','retailer',783764064,'user12@gmail.com','no 12, Flower road , Hambantota',NULL),(27,'user13','$argon2id$v=19$m=65536,t=3,p=4$CsMbtCzBfc6gW9zdBFkGiQ$GB2zDx8duv3Q3es98PsRZ9L7QBgmaZXPKJmH5hX+wTI','user13_firstName','user13_lastName','retailer',783764064,'user13@gmail.com','no 13, Flower road , Puttalama',NULL),(28,'user11','$argon2id$v=19$m=65536,t=3,p=4$AYFw04GM3IJTfYqnr1TTUg$Fw2Q5043BWinsoUQCJwp81afbyH35coD14W7NytVMz8','user11_firstName','user11_lastName','retailer',783764064,'user11@gmail.com','no 11, Flower road , Colombo',NULL),(29,'user14','$argon2id$v=19$m=65536,t=3,p=4$gZyZCNXaTvOH6t1gEGiFJQ$VBDZDf/dx7ozIJLZSpMBSrPF+KiGskpm+VwCQzGIyfM','user14_firstName','user14_lastName','wholesaler',701629317,'user14@gmail.com','no 14 , Galle road, Colombo 7',NULL),(30,'user15','$argon2id$v=19$m=65536,t=3,p=4$+3nZ0vjOIsr/zKiqzTdN0Q$pJ2RpYWhHE8YOLxY5addxeChpdZbvUV/6HVu3VuXV0w','user15_firstName','user15_lastName','wholesaler',701629318,'user15@gmail.com','no 15 , Galle road, Hikkaduwa',NULL),(31,'user16','$argon2id$v=19$m=65536,t=3,p=4$DoAmtuAtnorJmk8oC5m7jQ$ZmompqilQOZ4z2YS6DsGr14MPd2JBstqgNM8DB1npLo','user16_firstName','user16_lastName','wholesaler',701629310,'user16@gmail.com','No 16 , Kilinochchi road, Vavniya',NULL),(32,'user17','$argon2id$v=19$m=65536,t=3,p=4$q1IvhK5J9y9PAUDhrNTqxQ$Ihia6WthyxlsqmACLeT64Zq43evO9xl5W52FlIKfPFs','user17_firstName','user17_lastName','end customer',725747552,'user17@gmail.com','No 17, Pelawatta road, Colombo',NULL),(33,'user18','$argon2id$v=19$m=65536,t=3,p=4$z1Ijm3gJUwQ34+vYf5y22w$cXJnt9TbKGptZSYgtG2gh1VjEfH7YC9LNYknMKE388Q','user18_firstName','user18_lastName','end customer',783764066,'user18@gmail.com','No 18, Anuradapura  road, Kinniya',NULL),(34,'user19','$argon2id$v=19$m=65536,t=3,p=4$ZcG2oCmRGI+EMk0C4awayQ$sb+ZOX5pniBmFR2e+tkQ1W/R2ZPlUrncT+xasb20RXM','user19_firstName','user19_lastName','end customer',728478952,'user19@gmail.com','No 19, Temple road, Trincomalee',NULL),(35,'user20','$argon2id$v=19$m=65536,t=3,p=4$wKfaGGRPq+oOp9gOlNPQvg$TQl4QeB4LidOlL8/gpsTjp1+sJfj/uh9Neq7dfY3/HQ','user20_firstName','user20_lastName','end customer',1155833425,'user20@gmail.com','No 20, Pelawatta road, Kelaniya',NULL);
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

-- Dump completed on 2024-10-30 22:15:19
