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
INSERT INTO `driver` VALUES (1,NULL,NULL,'Amal','Perera',771234567,'amal.perera@email.com',NULL,1,0,0),(2,NULL,NULL,'Nimal','Fernando',772345678,'nimal.fernando@email.com',NULL,1,0,0),(3,NULL,NULL,'Sunil','Weerasinghe',773456789,'sunil.weerasinghe@email.com',NULL,2,0,1),(4,NULL,NULL,'Saman','Jayasinghe',774567890,'saman.jayasinghe@email.com',NULL,2,0,1),(5,NULL,NULL,'Kamal','Gunawardena',775678901,'kamal.gunawardena@email.com',NULL,3,0,1),(6,NULL,NULL,'Dinesh','Ranasinghe',776789012,'dinesh.ranasinghe@email.com',NULL,3,0,0),(7,NULL,NULL,'Ruwan','Abeysekara',777890123,'ruwan.abeysekara@email.com',NULL,4,0,1),(8,NULL,NULL,'Mahesh','Edirisinghe',778901234,'mahesh.edirisinghe@email.com',NULL,4,0,1),(9,NULL,NULL,'Ajith','De Silva',779012345,'ajith.desilva@email.com',NULL,5,0,1),(10,NULL,NULL,'Prasanna','Rathnayake',771234568,'prasanna.rathnayake@email.com',NULL,5,0,1),(11,NULL,NULL,'Bandara','Seneviratne',772345679,'bandara.seneviratne@email.com',NULL,6,0,1),(12,NULL,NULL,'Sarath','Liyanage',773456780,'sarath.liyanage@email.com',NULL,6,0,1),(13,NULL,NULL,'Asela','Kumara',779123456,'asela.kumara@email.com',NULL,1,0,0),(14,NULL,NULL,'Chamara','Perera',771234569,'chamara.perera@email.com',NULL,2,0,1),(15,NULL,NULL,'Indika','Senanayake',772345670,'indika.senanayake@email.com',NULL,3,0,1),(16,NULL,NULL,'Sujith','Bandara',773456781,'sujith.bandara@email.com',NULL,4,0,1),(17,NULL,NULL,'Ramesh','Kumar',774567892,'ramesh.kumar@email.com',NULL,5,0,1),(18,NULL,NULL,'Nuwan','Jayalath',775678903,'nuwan.jayalath@email.com',NULL,6,0,1),(19,'driver`1','$argon2id$v=19$m=65536,t=3,p=4$lxiUg4fUvkBELcp6WG4nWA$wsRaCCFaj+N+ePBij5YU7JjgS2EqPCNRIcYJMOcu7NY','Driver','Store 1',123456,'fin@asd.com',NULL,1,0,0),(20,'dr7','$argon2id$v=19$m=65536,t=3,p=4$iFLhLfaS2kTeftN/vsuXVw$pobJxU7ATk3cLfMbbgAyysxVo7Lp6dKOTkJib3pyJIg','jnhgtbf','nygbfd',123456,'nbhjb@gmaiol.com',NULL,2,0,1),(21,'driver1','$argon2id$v=19$m=65536,t=3,p=4$wxXh3XyTLSBpHNvJDdRhZQ$nNWnRtaHzdrw5X5pSr2lMOY2CCgYruI/mnhsHw2Y7dc','Store 1','Driver',123456,'fin@asd.com',NULL,1,0,0);
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

-- Dump completed on 2024-10-30 19:46:16
