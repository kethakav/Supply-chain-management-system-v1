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
INSERT INTO `route` VALUES (1,1,'Wattala','From Colombo Fort,passing Technical Junction, Panchikawatta, along base line road to Sedawatta, along Negambo road to Wattala',10,1),(2,1,'Moratuwa','From Colombo Fort, passing Mount Lavinia and Ratmalana, along Galle Road to Moratuwa',20,60),(3,1,'Maharagama','From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama',15,40),(4,2,'Seeduwa','From Negombo, along Negombo Road passing Kurana to reach Seeduwa',11,25),(5,2,'Katana','From Negombo, along Giriulla Road via Koppara Junction and Kandawala to reach Katana',10,20),(6,2,'Kochchikade','From Negombo, via Periyamulla along Puttalama-Colombo main road passing Kattuwa to reach Kochchikade',8,18),(7,3,'Beddegama','From Galle, passing Hapugala and Wakwella to reach Ginimellagaha and then Beddegama',20,40),(8,3,'Hikkaduwa','From Galle, along Galle Road passing Bossa to reach Hikkaduwa',20,40),(9,3,'Koggala','From Galle, along Matara Road via Unawatuna and Thalpe to reach Koggala',22,40),(10,4,'Weligama','From Matara, along Matara Road passing Mirissa to reach Weligama',20,30),(11,4,'Akuressa','From Matara, via Malimbada and Thelijjawila to reach Akuressa',25,40),(12,4,'Dikwella','From Matara, along New Thangalla Road passing Gandara and Pathegama to reach Dikwella',23,40),(13,5,'Tellippalai','From Jaffna, along Eluppayady Junction and Jaffna Kankasanthurai Road passing Chunnakkam to reach Tellippalai',17,30),(14,5,'Vaddukoddai','From Jaffna, via Jayanthan and Karativu Road to reach Vaddukoddai',14,25),(15,5,'Nelliady','From Jaffna, along Nallur and Jaffna Point Pedro Road passing Neervely to reach Nelliady',25,40),(16,6,'Kinniya','From Trincomalee, along Kandy Road and crossing Kinniya Bridge to reach Kinniya',20,35),(17,6,'Mutur','From Trincomalee, via Trincomalee-Muttur Road passing Sampur to reach Mutur',30,50),(18,6,'Kuchchaveli','From Trincomalee, along Pulmoddai Road passing Nilaveli to reach Kuchchaveli',35,55);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
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
