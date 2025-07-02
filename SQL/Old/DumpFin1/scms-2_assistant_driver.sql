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
INSERT INTO `assistant_driver` VALUES (1,NULL,NULL,'Ruwan','Perera',761234567,'ruwan.perera@email.com',NULL,1,0,0),(2,NULL,NULL,'Sarath','Fernando',762345678,'sarath.fernando@email.com',NULL,1,0,0),(3,NULL,NULL,'Pradeep','Weerasinghe',763456789,'pradeep.weerasinghe@email.com',NULL,2,0,1),(4,NULL,NULL,'Thilina','Jayasinghe',764567890,'thilina.jayasinghe@email.com',NULL,2,0,1),(5,NULL,NULL,'Chathura','Gunawardena',765678901,'chathura.gunawardena@email.com',NULL,3,0,0),(6,NULL,NULL,'Rasika','Ranasinghe',766789012,'rasika.ranasinghe@email.com',NULL,3,0,1),(7,NULL,NULL,'Chaminda','Abeysekara',767890123,'chaminda.abeysekara@email.com',NULL,4,0,1),(8,NULL,NULL,'Upul','Edirisinghe',768901234,'upul.edirisinghe@email.com',NULL,4,0,1),(9,NULL,NULL,'Kannan','Selvarajah',769012345,'kannan.selvarajah@email.com',NULL,5,0,1),(10,NULL,NULL,'Sutharsan','Murugesu',761234568,'sutharsan.murugesu@email.com',NULL,5,0,1),(11,NULL,NULL,'Rajapaksha','Seneviratne',762345679,'rajapaksha.seneviratne@email.com',NULL,6,0,1),(12,NULL,NULL,'Kumara','Liyanage',763456780,'kumara.liyanage@email.com',NULL,6,0,1),(13,NULL,NULL,'Suresh','Perera',764567891,'suresh.perera@email.com',NULL,1,0,0),(14,NULL,NULL,'Sanjaya','Perera',765678902,'sanjaya.perera@email.com',NULL,2,0,1),(15,NULL,NULL,'Lahiru','Perera',766789013,'lahiru.perera@email.com',NULL,3,0,1),(16,NULL,NULL,'Saman','Perera',767890124,'saman.perera@email.com',NULL,4,0,1),(17,NULL,NULL,'Prasad','De Silva',769012346,'prasad.desilva@email.com',NULL,5,0,1),(18,'asd1','$argon2id$v=19$m=65536,t=3,p=4$RhzFJEsPoIfF1qncfuEPUw$Jx1vWGBidVYDyNkuZ5HI+zvSPCiR0zkbrotDXwSntXU','Store 1','Ast Driver',12345678,'fin@asd.com',NULL,1,60,1),(19,'astdriver1','$argon2id$v=19$m=65536,t=3,p=4$ncVKc2gZmQ7x7M9lksZ4xA$t2DgakiapxrULrfI4k5nmRzTBnqwz2zqfIRDWEXKEng','Store 1','Assistant Driver ',123456,'fin@asd.com',NULL,1,0,0);
/*!40000 ALTER TABLE `assistant_driver` ENABLE KEYS */;
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
