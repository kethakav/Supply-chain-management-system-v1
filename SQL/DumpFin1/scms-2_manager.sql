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
INSERT INTO `manager` VALUES (1,1,'lakshman_p',NULL,'Lakshman','Perera',771234567,'lakshman.p@sricompany.lk',NULL),(2,2,'malini_s',NULL,'Malini','Silva',772345678,'malini.s@sricompany.lk',NULL),(3,3,'asela_g',NULL,'Asela','Gunawardena',773456789,'asela.g@sricompany.lk',NULL),(4,4,'chamathka_f',NULL,'Chamathka','Fernando',774567890,'chamathka.f@sricompany.lk',NULL),(5,5,'dinesh_r',NULL,'Dinesh','Rajapaksa',775678901,'dinesh.r@sricompany.lk',NULL),(6,6,'priyanka_j',NULL,'Priyanka','Jayawardena',776789012,'priyanka.j@sricompany.lk',NULL),(7,4,'store3','$argon2id$v=19$m=65536,t=3,p=4$K67z91HdXV+gAimBe1np4g$ka027JlMvFnQ1un9W6nd4Mgi20GeO5e6BvZKQpnAD9Q','jugbfv','yuhbjink',12345678,'admin@asd.com',NULL),(8,3,'store1','$argon2id$v=19$m=65536,t=3,p=4$vTE/h8vIZkvqzx0YHsvDNA$G4U4ZqB4TJIwQd18zXfIhSQCRkc/Ybg88dz3aZT6S6U','Store','Manager 1',123456,'store@asd.com',NULL),(9,1,'st1','$argon2id$v=19$m=65536,t=3,p=4$bvtt1LOtY9LXwgKTeq+pTQ$7aVcK5K0W4RrGNft9KlPlBnWMWWxiLa9WmXxWL4kqqk','Store','Manager Colombo',12345678,'admin@asd.com',NULL);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
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
