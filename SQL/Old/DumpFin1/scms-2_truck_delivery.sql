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
-- Table structure for table `truck_delivery`
--

DROP TABLE IF EXISTS `truck_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck_delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `truck_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `ast_driver_id` int DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `sent_datetime` datetime DEFAULT NULL,
  `compleated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `ast_driver_id` (`ast_driver_id`),
  KEY `route_id` (`route_id`),
  KEY `driver_id` (`driver_id`),
  KEY `truck_id` (`truck_id`),
  CONSTRAINT `truck_delivery_ibfk_1` FOREIGN KEY (`ast_driver_id`) REFERENCES `assistant_driver` (`ast_driver_id`),
  CONSTRAINT `truck_delivery_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  CONSTRAINT `truck_delivery_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  CONSTRAINT `truck_delivery_ibfk_4` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`truck_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_delivery`
--

LOCK TABLES `truck_delivery` WRITE;
/*!40000 ALTER TABLE `truck_delivery` DISABLE KEYS */;
INSERT INTO `truck_delivery` VALUES (1,1,1,1,1,1,'2024-10-30 01:42:56',0),(2,2,2,2,2,NULL,NULL,0),(3,3,3,3,3,NULL,NULL,0),(4,4,4,4,4,NULL,NULL,0),(5,5,5,5,5,NULL,NULL,0),(6,6,6,6,6,NULL,NULL,0),(7,7,7,7,7,NULL,NULL,0),(8,8,8,8,8,NULL,NULL,0),(9,9,9,9,9,NULL,NULL,0),(10,10,10,10,10,NULL,NULL,0),(11,11,11,11,11,NULL,NULL,0),(12,12,12,12,12,NULL,NULL,0),(13,13,13,13,13,NULL,NULL,0),(14,14,14,14,14,NULL,NULL,0),(15,1,2,2,2,1,'2024-10-30 01:43:21',0),(16,2,13,13,3,1,NULL,0),(17,3,1,1,2,1,NULL,0),(18,22,21,18,1,1,'2024-10-30 06:47:37',1),(19,21,19,19,1,1,'2024-10-30 08:35:23',0),(20,22,21,19,1,1,'2024-10-30 08:48:43',0),(21,22,21,19,1,1,'2024-10-30 13:13:13',0),(22,22,21,19,1,1,'2024-10-30 14:29:17',1),(23,7,6,5,7,3,NULL,0),(24,22,21,18,1,1,'2024-10-30 18:40:23',1),(25,22,21,19,1,1,NULL,0);
/*!40000 ALTER TABLE `truck_delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_driver_time` BEFORE INSERT ON `truck_delivery` FOR EACH ROW BEGIN 
    DECLARE driver_time INT DEFAULT 0;
    DECLARE ast_driver_time INT DEFAULT 0;
    DECLARE route_time INT DEFAULT 0;

    -- Get the driver’s worked hours
    SELECT worked_hours INTO driver_time 
    FROM Driver
    WHERE driver_id = NEW.driver_id;

    -- Get the assistant driver’s worked hours
    SELECT worked_hours INTO ast_driver_time
    FROM Assistant_Driver
    WHERE ast_driver_id = NEW.ast_driver_id;
    
    -- Get the route max time
    SELECT max_time INTO route_time
    FROM Route
    WHERE route_id = NEW.route_id;
    
    -- Check if driver or assistant driver exceeds max allowed time
    IF ((driver_time + route_time) > 40 OR (ast_driver_time + route_time) > 60) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Driver or Assistant Driver Limit Exceeded.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_truck_delivery_insert` AFTER INSERT ON `truck_delivery` FOR EACH ROW BEGIN
    UPDATE truck
    SET availability = false
    WHERE truck_id = NEW.truck_id;

    UPDATE driver
    SET availability = false
    WHERE driver_id = NEW.driver_id;

    UPDATE assistant_driver
    SET availability = false
    WHERE ast_driver_id = NEW.ast_driver_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_after_end_trip` AFTER UPDATE ON `truck_delivery` FOR EACH ROW BEGIN
	IF NEW.compleated  = true THEN
    
		UPDATE driver
		SET availability = true,
			worked_hours = worked_hours + get_route_time(NEW.route_id)
        WHERE driver_id = NEW.driver_id;
        
        UPDATE assistant_driver
		SET availability = true,
			worked_hours = worked_hours + get_route_time(NEW.route_id)
        WHERE ast_driver_id = NEW.ast_driver_id;
        
        UPDATE truck
		SET availability = true
        WHERE truck_id = NEW.truck_id;
        
        
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 19:46:16
