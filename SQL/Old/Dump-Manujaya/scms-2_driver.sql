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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (22,'dr1','$argon2id$v=19$m=65536,t=3,p=4$O5WZLnS6kfJmaJwDWztoVw$sny1OhrLOt5YttUSWcCo8S9u5I+wWLFXnWMzjY7kQd0','gayathriDriver','harshila',783764064,'gayathri@gmail.com',NULL,1,0,0),(23,'dr2','$argon2id$v=19$m=65536,t=3,p=4$b+q4BPHDHO9HjIPuakb5RA$9CY0IdxMtMCv0AjKDWq1m6rlS3eYDLhi+TorZNiVw3M','driver1','harshila',783764064,'gayathri@gmail.com',NULL,2,0,1),(25,'prabath','$argon2id$v=19$m=65536,t=3,p=4$gIoJJt47Edt8JMn5bsjztg$R7Msp7qFlnmt+qnPC6u8L/kLrq2OzWck9ptOjNmdX+c','prabath','samarasinghe',783464004,'prabath@gmail.com',NULL,1,30,1);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
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
