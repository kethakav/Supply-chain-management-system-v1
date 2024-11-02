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
INSERT INTO `hr_manager` VALUES (1,'priya_silva',NULL,'Priya','Silva',947,'priya.silva@example.lk',NULL),(2,'amal_perera',NULL,'Amal','Perera',947,'amal.perera@example.lk',NULL),(3,'kumari_fernando',NULL,'Kumari','Fernando',947,'kumari.fernando@example.lk',NULL),(4,'nimal_gunawardena',NULL,'Nimal','Gunawardena',947,'nimal.gunawardena@example.lk',NULL),(5,'chamathka_rajapaksa',NULL,'Chamathka','Rajapaksa',947,'chamathka.rajapaksa@example.lk',NULL),(6,'hr1','$argon2id$v=19$m=65536,t=3,p=4$xLycXD+uiCPxiaRTCXIwNA$yjQnJmNC6cwlv9cCvsF+OI8Jsp+Gj6uw2tz/h7t5kvI','HR ','Manager 1',12345678,'hr@asd.com',NULL),(7,'hr2','$argon2id$v=19$m=65536,t=3,p=4$USiiAKCqsOooBKU6+MaPCw$p79Zchug67KsnuWD/4onMVY7s4/hlv9FTMExc1P9a4I','HR','Manager',12345678,'fin@asd.com',NULL);
/*!40000 ALTER TABLE `hr_manager` ENABLE KEYS */;
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
