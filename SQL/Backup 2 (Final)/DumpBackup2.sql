CREATE DATABASE  IF NOT EXISTS `scms-6` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `scms-6`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: scms-6
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistant_driver`
--

LOCK TABLES `assistant_driver` WRITE;
/*!40000 ALTER TABLE `assistant_driver` DISABLE KEYS */;
INSERT INTO `assistant_driver` VALUES (20,'AstDriverC1','$argon2id$v=19$m=65536,t=3,p=4$Jdd6XTugKL+jeDjOgZJLtg$a+QDM/BES1g8sN0ZD6ZOsq9KEVlzGPNtS3uJxXTsEks','Chloe ','Sutton',123456789,'Ast.DriverC1@primescreen.com',NULL,1,0,1),(21,'AstDriverC2','$argon2id$v=19$m=65536,t=3,p=4$ryRSYDUDq2B3BqUuECmlzQ$6PeMjPPmrxmyy/moHRm7jrZuDQDYOG4LeksQASuPJ38','Logan ','Pierce',123456789,'Ast.DriverC2@primescreen.com',NULL,1,0,1),(22,'AstDriverC3','$argon2id$v=19$m=65536,t=3,p=4$yc9yolOVxU3gOFSgno90Eg$OwLQoS0CHlAWARQIwDDLG8cep+4bFQ0vwlrUpVAxBAs','Nora ','Dawson',123456789,'Ast.DriverC3@primescreen.com',NULL,1,0,1),(23,'AstDriverC4','$argon2id$v=19$m=65536,t=3,p=4$bcwgccyDVVTHq20EqVuQhA$S32D7FDvp9lNt1o8v3MGazVRCHeWDUgpva6S0xgStmI','Wyatt ','Garner',123456789,'Ast.DriverC4@primescreen.com',NULL,1,0,1),(24,'AstDriverC5','$argon2id$v=19$m=65536,t=3,p=4$YJX5tj/QwRCCYVEgqcDheg$Rwzo3t4AwfFy9X8Ef0nBA3zOskhxc+F1c64DeR3hFoI','Emma ','Tate',123456789,'Ast.DriverC5@primescreen.com',NULL,1,0,1),(25,'AstDriverN1','$argon2id$v=19$m=65536,t=3,p=4$pmkI7h++UbMX/d1MEeaWKQ$fnPghSBUnMLZ3AAXOUJdEGGjnp/0WLny6z1m7FbuNIA','Lily',' Townsend',123456789,'Ast.DriverN1@primescreen.com',NULL,2,0,1),(26,'AstDriverN2','$argon2id$v=19$m=65536,t=3,p=4$O7A74xw4kUAhIvvB/U9HqA$CR6lfdqs1FgECH5ecXZ4VGshOkWzv9WtlyGwM3CaP2E','Caleb ','Barrett',12345678,'Ast.DriverN2@primescreen.com',NULL,2,0,1),(27,'AstDriverN3','$argon2id$v=19$m=65536,t=3,p=4$w1ulFARRay0eNz/0gQVbWQ$TsHFdGRQMxm4Fmh71Z6dm6UEQrmEjnEBKvjf2o6Tnvk','Ella ','Monroe',12345678,'Ast.DriverN3@primescreen.com',NULL,2,0,1),(28,'AstDriverN4','$argon2id$v=19$m=65536,t=3,p=4$him1hNMjiIExUZKEzA/q2g$yZIExozSSGHciVuhdvL2FMB6jShdYn6/yfyOoF0AHe8','Owen ','Delaney',12345678,'Ast.DriverN4@primescreen.com',NULL,2,0,1),(29,'AstDriverN5','$argon2id$v=19$m=65536,t=3,p=4$vPFMVJzH/3w1XEyvzSsD9g$TmhrHa7gBleBAp5jFJ8rVTZcD/IAbdm8tNgiA6FQEmo','Ava ','Lynch',123456789,'Ast.DriverN5@primescreen.com',NULL,2,0,1),(30,'AstdriverG1','$argon2id$v=19$m=65536,t=3,p=4$8priDw7HkaXhpNdwm5KWRA$yjSBnOkzioRBAS75Er7scPaSDKEbxwmwQLS8rlF7+Yo','Lucas ','Hayes',12345678,'Ast.DriverG1@primescreen.com',NULL,3,0,1),(31,'AstdriverG2','$argon2id$v=19$m=65536,t=3,p=4$bFj225ZgLx5k6mSr/sWb4g$9YzI+C1u6biyuTebuH+wGpE3C4IFudDDYnyLxqRmINY','Ashton','Ruby ',12345678,'Ast.DriverG2@primescreen.com',NULL,3,0,1),(32,'AstdriverG3','$argon2id$v=19$m=65536,t=3,p=4$lDfqF/6aWVI2HRQd9IFxow$D+jDIWbNwlUzykVJwalN2CrDM8/0Svdu4oiKIk8mKZQ','Elijah',' Fraser',12345678,'Ast.DriverG3@primescreen.com',NULL,3,0,1),(33,'AstdriverG4','$argon2id$v=19$m=65536,t=3,p=4$dVk1Zl0v6Eo73dBkcMi37Q$rD6mMPgIqA8/tLWVJQRilxkVQPE1L2Sv4Nb7bVhjIYg','Zoe ','Martin',12345678,'Ast.DriverG4@primescreen.com',NULL,3,0,1),(34,'AstdriverM1','$argon2id$v=19$m=65536,t=3,p=4$wUHQeQCAXAEWuBSV+Oc3jQ$26iQ91CJJxVFvWoL5B2eIvBQhSs2Anqw3NQG5Vzm4z0','William ','Kerr',12345678,'Ast.DriverM1@primescreen.com',NULL,4,0,1),(35,'AstdriverM2','$argon2id$v=19$m=65536,t=3,p=4$I6MI3mop9+XTXd50ExQCbw$BrDBxUgv+UMBQNy0qJAP1/w24Ep4jBx2tWNuMru4My4','Isla ','Barnes',12345678,'Ast.DriverM2@primescreen.com',NULL,4,0,1),(36,'AstdriverM3','$argon2id$v=19$m=65536,t=3,p=4$Nk9cpBTFqOQu8M6r4tjoww$yTCf/1//wXAQoX+S6pc/IdiIPV4srb8FgJN5nM+Q5iE','Samuel ','Nash',12345678,'Ast.DriverM3@primescreen.com',NULL,4,0,1),(37,'AstdriverJ1','$argon2id$v=19$m=65536,t=3,p=4$Lg4rU76gcax2q6XsHS4oVA$G0i8eUc3+SV6anuP2EztTcKDl7pfUcyTNNiZNhaRgDA','Daniel ','Crosby',12345678,'Ast.DriverJ1@primescreen.com',NULL,5,0,1),(38,'AstdriverT1','$argon2id$v=19$m=65536,t=3,p=4$8C6rgtVr65FFLRiA4kh2mA$GP8xj8HGByCoT8qcwvpGqR6xmPkv/l8qaTulpMHY3g4','Leah ','Bryant',12345678,'Ast.DriverT1@primescreen.com',NULL,6,0,1);
/*!40000 ALTER TABLE `assistant_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (25,'CustC1','$argon2id$v=19$m=65536,t=3,p=4$8NDmOjQ8E27YB6Tq69/FnA$gnVfRhBeEYBA4XIiw/ZTZWP9RuHXRxHHVkVeEs3IGww','Kasun ','Jayasuriya','end customer',98765432,'Jayasuriya@gamil.com','1, Colombo Roade, Waththala',NULL),(26,'CustC2','$argon2id$v=19$m=65536,t=3,p=4$apW8L5FqTJFHn5P18WzlvQ$iopIm0BwU/4qhfB5k/8AriqvhNmBPbh36rIos76ACUI','Nethmi ','Perera','end customer',98765437,'Nethmip@gamil.com','1, Katubadda, Galle Road',NULL),(27,'CustC3','$argon2id$v=19$m=65536,t=3,p=4$+TFwU/EPCsB3zzMKlFzqCg$Vk2F1JzuuISYZhtDwWwCxJ+DcSNzagVifhUmdAXmUzw','Sajith ','Weerasinghe','end customer',98765436,'Weerasinghe@gmail.com','2, Moratu Mulla, Moratuwa',NULL),(28,'CustC4','$argon2id$v=19$m=65536,t=3,p=4$oa9FViR0qQmpr11A3vPvQg$lO1JgyZ+2an+pR7BafxENzDI6x3DE5aM3GhSxUatJ84','Dilini ','Fernando','end customer',98765478,'Fernando@gmail.com','3, Molpe, Road, Molpe ',NULL),(29,'CustC5','$argon2id$v=19$m=65536,t=3,p=4$j5BWOYOO6UEzefAe09VYAQ$/06+QFY9NYjkGYrCWSYOqbLSl+5B0lC8bOgPNupOINQ','Rajapaksha','Chathura ','end customer',977563452,'Rajapaksha@gmail.com','5, Colombo Road, Maharagama',NULL),(30,'CustN1','$argon2id$v=19$m=65536,t=3,p=4$a/zjhiPc94ksBkHUz7wLIA$nza+gcGHufW+7rkhOdytTTPdRkJh8qehneRFP0Lo8DQ','Harshana ','Silva','end customer',98638742,'Harshana@gmail.com','9, wakwalla, Galle',NULL),(31,'CustN2','$argon2id$v=19$m=65536,t=3,p=4$aVy+dKU+Z4LITUCKQuIiww$aUFPbJP8THKAsNrhjaNeAgGWr7sglUE8Qc5kF34cqDk','Iresha','Bandara','end customer',98765455,'iresha@gmail.com','76/9, Giriulla Road, Katana',NULL),(32,'CustN3','$argon2id$v=19$m=65536,t=3,p=4$RD/PHwNTaKAx7GDKGT3qZw$49tVyQRsRMHA8aFKVqAJUnbDKQKtyuvwt8/thwCDslc','Chamika','Samarasinghe','end customer',987654365,'chamika@gmail.com','22/3, Periyamulla Road, Kochchikade',NULL),(33,'CustG1','$argon2id$v=19$m=65536,t=3,p=4$XcTt17pa1v4af3Phv2IRqQ$j1d2DADnGhVqrncHZDG5hz3818Waojrltt0GZkjYLrA','Tharushi','Ginaratne','end customer',98765455,'tharushi@gmail.com','65, Wakwella Uyana, Galle',NULL),(34,'CustG2','$argon2id$v=19$m=65536,t=3,p=4$qgOvhG5fJKa0s/lq8tiYkg$uEzDr/JE6CZjGStzzFfchfbAgPcTqTe8/WPp5uo8G1g','Ravindu','Abeywickrama','end customer',98765455,'ravindu@gmail.com','68, Boossa Road, Hikkaduwa',NULL),(35,'CustG3','$argon2id$v=19$m=65536,t=3,p=4$FepAH+yw8C2EZjUa4FWjkA$HVUgO4Z/AK9qYM/5cniFvE7UIZ4+fHchjMMhWaXq/KE','Danusha','Senanayake','end customer',987654365,'danusha@gmail.com','47, Matara road, Koggala',NULL),(36,'CustM1','$argon2id$v=19$m=65536,t=3,p=4$7WH+TipOGshactYCkX0nxw$UTY4EF59DZL28x6r3G8KR2IiXlFk04OmgaJtrvLg/N8','Ruwanthi','Wickramasinghe','end customer',98765432,'ruwanthi@gmail.com','34, Matara road, Weligama',NULL),(37,'CustM2','$argon2id$v=19$m=65536,t=3,p=4$QapMMl4niE04b4qT1yyEQA$AoVFVkqghQqSkp0kZticvhTxJwvl2nxH+n+cEbaot7o','Sithira','Madushanka','end customer',987654521,'sithira@gmail.com','47, New Thangalla road, Dikwella',NULL),(38,'CustJ1','$argon2id$v=19$m=65536,t=3,p=4$YO2gwlS2UHGRnBnW8BpQiw$9fPhV9uDbCjP0cfnpp4waVOqgbW/HyZPHvWeIKlGwVk','Kavitha','Arulraj','end customer',98765432,'kavitha@gmail.com','64, Kankasanthurai road,Telippalai',NULL),(39,'CustJ2','$argon2id$v=19$m=65536,t=3,p=4$9CffA3BqkIqInoM66V/YaQ$vTaFb1uaYb0UNkC0hUqwkX1xdLdNZYxQPJzQmds25NY','Santhosh','Kumar','end customer',987654521,'santhosh@gmail.com','12, Karativu road, Vaddukoddai',NULL),(40,'CustT1','$argon2id$v=19$m=65536,t=3,p=4$gVm/TQPzSP6BoUkBn5hq1g$eZttsNC9a4Jvx1u9F6D8FFphCzRXo7YqO269zvi0LAE','Tharshan','Rajendran','end customer',98765455,'tharshan@gmail.com','77, Kinniya bridge road, Kinniya',NULL),(41,'CustT2','$argon2id$v=19$m=65536,t=3,p=4$s8rLYTPow9nh8qNKnTytqw$Ja+YGi3gJn4BbpniwfoU/1adTwfFXzMhESwKbC4ChmI','Anjali','Selvarajah','end customer',98765455,'anjali@gmail.com','34, Trincomalee-Mutur road, Mutur',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (22,'DriverC1','$argon2id$v=19$m=65536,t=3,p=4$Hb0/ehFbjZaJ0UvqC054AQ$TwOUVx/vQPvPJtYp8u7l1Vl4M1Jb+2jdQE42Zy3GAwc','Ethan','Reynolds',123456789,'DriverC1@primescreen.com',NULL,1,0,1),(23,'DriverC2','$argon2id$v=19$m=65536,t=3,p=4$mOn53b7P3n9KAQ33cZ0WnQ$V1itlz/UMrLqv+y1rSZ3pBc5fB18JcwJyxPK0G4mUxo','Lila ','Montgomery',123456789,'DriverC2@primescreen.com',NULL,1,0,1),(24,'DriverC3','$argon2id$v=19$m=65536,t=3,p=4$urxfqROOrGQBEjK4syuRGg$1PItiEEYRpNoc4x87Drm7lWX/Gna+U7d8S/IZw2sPv4','Mason ','Brooks',123456789,'DriverC3@primescreen.com',NULL,1,0,1),(25,'DriverC4','$argon2id$v=19$m=65536,t=3,p=4$qNqtGKaE634izk8NTAmDQQ$hbjaZFobW8kMW4jfzlV8/Stb1id3kO6aJTYByNvpPZ8','Ivy ','Lang',123456789,'DriverC4@primescreen.com',NULL,1,0,1),(26,'DriverC5','$argon2id$v=19$m=65536,t=3,p=4$mjXRG4WThoLNPT24RmkPxw$+M7OqaFBck5QLXeA3gr0I2gal2l75dlJ0OIw1KTXQ6U','Fischer','Aiden ',123456789,'DriverC5@primescreen.com',NULL,1,0,1),(27,'DriverN1','$argon2id$v=19$m=65536,t=3,p=4$6PtqsQkx5x/y54RiiIZa9w$XmYvbW4XH4EGL41jCKINXbdXicoxFkwbfRTBmLIBj8c','Liam','Donovan',12345678,'DriverN1@primescreen.com',NULL,2,0,1),(28,'DriverN2','$argon2id$v=19$m=65536,t=3,p=4$7imSL0cF//R16SmoBSJf/g$u+WNNkWu/UtwPR8zHtut18Bqq4JR1JwciBCn+lvIrfU','Zara ','Middleton',123456789,'DriverN2@primescreen.com',NULL,2,0,1),(29,'DriverN3','$argon2id$v=19$m=65536,t=3,p=4$DMvANbc40oXlkgx0e4VERQ$PsQk0WwvH4T+wB7DkJUSpX35ld7yI7WUF5v2klwJV9E','Noah ','Frazier',12345678,'DriverN3@primescreen.com',NULL,2,0,1),(30,'DriverN4','$argon2id$v=19$m=65536,t=3,p=4$753UHKdFgkf7vcRv5vlcJA$DbCKzJnbGn1FiPcrP9sGS12vYQbDl4+aQvc6VJAy2sk','Mila ','Carter',123456789,'DriverN4@primescreen.com',NULL,2,0,1),(31,'DriverN5','$argon2id$v=19$m=65536,t=3,p=4$zR0B5YdAsjzj9f3Cg8kVqA$+NWI0bCAWj8flUZV4jG8cvhNtR+KqvWQ9sm37ozan3c','Jacob ','Emerson',12345678,'DriverN5@primescreen.com',NULL,2,0,1),(32,'DriverG1','$argon2id$v=19$m=65536,t=3,p=4$8FDeSatthfnbjzF59S0kRQ$w9yGB5LX7iusajQm4+mAobM0YyHv1gq/ydFf1OOXMwQ','Jack ','Easton',122345678,'DriverR1@primescreen.com',NULL,3,0,1),(33,'DriverG2','$argon2id$v=19$m=65536,t=3,p=4$uBbF8o/bTV3nJiHP1Tj9zg$tkTJUq2bo8BcazFosEJc9Ae1cuETeqIHgSXUibgtuhI','Grace ','Holloway',123456789,'DriverG2@primescreen.com',NULL,3,0,1),(34,'DriverG3','$argon2id$v=19$m=65536,t=3,p=4$yA5pgECFAPnvu0JqcDeKkA$7Gg3NemJi1dnhM2xbvrbopkBC8zat1TlA4PGPBxHdco','Oliver ','Bishop',123456789,'DriverC3@primescreen.com',NULL,3,0,1),(35,'DriverG4','$argon2id$v=19$m=65536,t=3,p=4$PbnHVs2T0UBScj9zcN3PrQ$91Eb8g2iATA9JkMqJ0ag7Lt50VoKxNq3n/ea5jude8o','Mia ','Grant',123456789,'DriverG4@primescreen.com',NULL,3,0,1),(36,'DriverM1','$argon2id$v=19$m=65536,t=3,p=4$LckZZgnTeHp95JwxaAVfDg$NUGNkBqQMYC+s/XCq6tG+abKnUTPkF75n+czz2O8dMY','Henry ','Palmer',12345678,'DriverM1@primescreen.com',NULL,4,0,1),(37,'DriverM2','$argon2id$v=19$m=65536,t=3,p=4$9tsJa36QBhB+kgI1XVn01w$pX3DALsC3yWPBoekoRWt7xsrFkHpGCtJUnWhUwC2PK8','Sadie ','Blair',12345678,'DriverM2@primescreen.com',NULL,4,0,1),(38,'DriverM3','$argon2id$v=19$m=65536,t=3,p=4$w+yqnJ838vk5UE2B8V1tFQ$2Bue3EwXnYi76syDQMRN6o6Ta4NzNayDELIBJ/sittw','Benjamin ','Carson',12345678,'DriverM3@primescreen.com',NULL,4,0,1),(39,'DriverM4','$argon2id$v=19$m=65536,t=3,p=4$LhNQwFjKLL+U2huW7AjbCQ$OCcj5BtY5lkEN3gT7PLSZYZm44c/ArTBcJIBGl/ss8I','Stella ','Larson',12345678,'DriverM4@primescreen.com',NULL,4,0,1),(40,'DriverJ1','$argon2id$v=19$m=65536,t=3,p=4$+pYimQCnK9+7gb/SZ0f6CQ$aSDPFXd2PfiID+6SkLiuDrk0Ek/gXuKHJSXFUvf6MEc','Violet ','Quinn',12345678,'DriverJ1@primescreen.com',NULL,5,0,1),(41,'DriverJ2','$argon2id$v=19$m=65536,t=3,p=4$wuBUb0nzB7Ie9KEQcDCxOA$lEDxFNN47XR8aim34NiJL3VI+h4x9Z6HJRJL8n8pzgo','Hazel ','McCoy',12345678,'DriverJ2@primescreen.com',NULL,5,0,1),(42,'DriverT1','$argon2id$v=19$m=65536,t=3,p=4$At2UecNHuilVy8lCzI+HBQ$7OpjEuQRGSnUdU6mOfs7KLP9vfDoA6kkQ4vXUX2uWdQ','Nathaniel',' Perry',12345678,'DriverT1@primescreen.com',NULL,6,0,1);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeandorder_manager`
--

DROP TABLE IF EXISTS `financeandorder_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financeandorder_manager` (
  `finance_manager_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `manager_first_name` varchar(100) DEFAULT NULL,
  `manager_last_name` varchar(100) DEFAULT NULL,
  `manager_contact` int DEFAULT NULL,
  `manager_email` varchar(200) DEFAULT NULL,
  `manager_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`finance_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeandorder_manager`
--

LOCK TABLES `financeandorder_manager` WRITE;
/*!40000 ALTER TABLE `financeandorder_manager` DISABLE KEYS */;
INSERT INTO `financeandorder_manager` VALUES (9,'FOM1','$argon2id$v=19$m=65536,t=3,p=4$bhs1fYWxhC/W32erCsYFGA$ZtbHLb+Fv2miUVDbSOSQgvl/IB2NUUd0wuHH35z8bsI','Finance','OneScreen',110000001,'FinanceOne@primescreen.com',NULL),(10,'FOM2','$argon2id$v=19$m=65536,t=3,p=4$rPg/NfnjjMUkVgoo8dHjVA$HpxiM04YT4FYiomoqnYTGnxdToad/5GAo3rO/H5bvFQ','Finance ','SecondScreen',110000002,'FinanceTwo@primescreen.com',NULL);
/*!40000 ALTER TABLE `financeandorder_manager` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_manager`
--

LOCK TABLES `hr_manager` WRITE;
/*!40000 ALTER TABLE `hr_manager` DISABLE KEYS */;
INSERT INTO `hr_manager` VALUES (8,'HR','$argon2id$v=19$m=65536,t=3,p=4$vizd7nwR7bnLF6kqpbHXmA$pYMPm9gT9OhpRKiQyJo9SZqN6uVMjwUmEfHJhObabr4','Admin','PrimeScreen',0,'HR@primescreen.com',NULL);
/*!40000 ALTER TABLE `hr_manager` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (10,1,'SM11','$argon2id$v=19$m=65536,t=3,p=4$qgSXdh1wvBhAz515UhmiwQ$Cqk35JCvv6mkbu4NL1EOjocOn1iTALz3DI/RlY5AwRc','Colombo','ScreenOne',110000011,'StoreM11@primescreen.com',NULL),(11,1,'SM12','$argon2id$v=19$m=65536,t=3,p=4$8htBKJU13OzA6cC1MIvBEg$nxr9guaaa/WAAVfjTQPHV4PqSHM2M4HEKyV2RqYrmPc','Colombo','ScreenTwo',1100000012,'StoreM12@primescreen.com',NULL),(12,2,'SM22','$argon2id$v=19$m=65536,t=3,p=4$UvnPOVY9d0frmlRLKUaFhA$hXOkHOD8WPG4t96rumhwSD2T0Xt2plviCfo7u2MtbSk','Negombo','ScreenOne',1100000021,'StoreM22@primescreen.com',NULL),(13,2,'SM21','$argon2id$v=19$m=65536,t=3,p=4$TiVYBvBkZ3wfbnL0QQjHdA$G6nf89HLIy/0deOzi47HoqkeQWikKpa0bolUcyU17hU','Negombo','ScreenOne',1100000022,'StoreM21@primescreen.com',NULL),(14,3,'SM31','$argon2id$v=19$m=65536,t=3,p=4$FIvRF5VLcVSNYVSLCT1cTw$wGGvqoYP6XMtslDNbXJ/0u/U2I6QpKQokKLYqvGT4pw','Galle','ScreenOne',1100000031,'StoreM31@primescreen.com',NULL),(15,4,'SM41','$argon2id$v=19$m=65536,t=3,p=4$axrVcvwjJPOl6dJQto4Rbg$2UALngV4uKJwRNI2h5VKEY7OmitP5kLqlF0usKfcciA','Mathara','ScreenOne',1100000031,'DriverM1@primescreen.com',NULL),(16,5,'SM51','$argon2id$v=19$m=65536,t=3,p=4$uAZ8I8ZXkZHfybys59mi3g$5U1/XFSNIbJZSgZItO9aX0VkYQEmt52g3ARFpKp14QA','Jaffna','ScreenOne',1100000051,'StoreJ51@primescreen.com',NULL),(17,6,'SM61','$argon2id$v=19$m=65536,t=3,p=4$5P9lwDpk5fwZ13rwKGcEYA$GTVdrp7MVQof337nwNmoaWfIHSOHnuKBXIGPYV/eOks','Trinco','ScreenOne',12345678,'StoreT61@primescreen.com',NULL);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_products`
--

DROP TABLE IF EXISTS `ordered_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_products` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `ordered_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `ordered_products_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_products`
--

LOCK TABLES `ordered_products` WRITE;
/*!40000 ALTER TABLE `ordered_products` DISABLE KEYS */;
INSERT INTO `ordered_products` VALUES (23,1,1,20000,400),(24,1,1,20000,400),(24,3,1,13000,500),(25,5,1,20000,400),(26,2,2,19200,400),(26,4,1,10000,200),(27,1,1,20000,400),(28,3,1,13000,500),(28,5,1,20000,400),(29,2,2,19200,400),(30,4,1,10000,200),(30,1,1,20000,400),(31,5,1,20000,400),(32,3,2,26000,1000),(33,2,1,9600,200),(33,4,1,10000,200),(34,1,1,20000,400),(35,5,1,20000,400),(35,2,1,9600,200),(36,3,2,26000,1000),(37,4,1,10000,200),(37,2,1,9600,200),(38,1,1,20000,400),(39,5,1,20000,400),(40,1,1,20000,400),(40,4,1,10000,200),(41,5,1,20000,400),(42,2,2,19200,400),(43,3,1,13000,500),(44,1,1,20000,400),(44,2,1,9600,200),(45,5,1,20000,400),(46,1,1,20000,400),(47,3,1,13000,500),(47,4,1,10000,200),(48,5,1,20000,400),(49,2,2,19200,400),(50,4,1,10000,200),(50,2,1,9600,200),(51,1,1,20000,400),(52,5,1,20000,400),(53,1,1,20000,400),(53,2,1,9600,200),(54,3,2,26000,1000),(55,4,1,10000,200),(56,2,2,19200,400),(57,5,1,20000,400),(58,1,1,20000,400),(58,4,1,10000,200),(59,5,1,20000,400),(60,2,2,19200,400),(61,3,1,13000,500),(61,4,1,10000,200),(62,5,1,20000,400),(63,1,1,20000,400);
/*!40000 ALTER TABLE `ordered_products` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (23,25,'2024-11-01 07:38:50',20000,'abc.com/123',400,'2024-11-08',1,1,'Come straight through the temple road and call me.',NULL,0,0,NULL,0,NULL,0,NULL),(24,25,'2024-11-01 08:11:02',33000,'payment_col_01.pdf',900,'2024-11-08',1,1,'Near Waththala junction, first lane',NULL,0,0,NULL,0,NULL,0,NULL),(25,26,'2024-11-01 08:11:02',20000,'payment_col_02.pdf',400,'2024-11-08',1,2,'Opposite to Katubadda campus',NULL,0,0,NULL,0,NULL,0,NULL),(26,27,'2024-11-01 08:11:02',29200,'payment_col_03.pdf',600,'2024-11-08',1,2,'Moratu Mulla, near temple',NULL,0,0,NULL,0,NULL,0,NULL),(27,28,'2024-11-01 08:11:02',20000,'payment_col_04.pdf',400,'2024-11-08',1,2,'Molpe junction, green gate',NULL,0,0,NULL,0,NULL,0,NULL),(28,29,'2024-11-01 08:11:02',33000,'payment_col_05.pdf',900,'2024-11-08',1,3,'Near Maharagama junction, house 45',NULL,0,0,NULL,0,NULL,0,NULL),(29,25,'2024-11-01 08:11:02',19200,'payment_col_06.pdf',400,'2024-11-08',1,1,'Same address as before, Waththala',NULL,0,0,NULL,0,NULL,0,NULL),(30,26,'2024-11-01 08:11:02',30000,'payment_col_07.pdf',600,'2024-11-08',1,2,'Katubadda, call before delivery',NULL,0,0,NULL,0,NULL,0,NULL),(31,27,'2024-11-01 08:11:02',20000,'payment_col_08.pdf',400,'2024-11-08',1,2,'Moratuwa, near police station',NULL,0,0,NULL,0,NULL,0,NULL),(32,28,'2024-11-01 08:11:02',26000,'payment_col_09.pdf',1000,'2024-11-08',1,2,'Molpe area, opposite bank',NULL,0,0,NULL,0,NULL,0,NULL),(33,29,'2024-11-01 08:11:02',19600,'payment_col_10.pdf',400,'2024-11-08',1,3,'Maharagama, near hospital',NULL,0,0,NULL,0,NULL,0,NULL),(34,30,'2024-11-01 08:11:02',20000,'payment_neg_01.pdf',400,'2024-11-08',2,4,'Seeduwa area, near airport',NULL,0,0,NULL,0,NULL,0,NULL),(35,31,'2024-11-01 08:11:02',29600,'payment_neg_02.pdf',600,'2024-11-08',2,5,'Katana junction, white house',NULL,0,0,NULL,0,NULL,0,NULL),(36,32,'2024-11-01 08:11:02',26000,'payment_neg_03.pdf',1000,'2024-11-08',2,6,'Kochchikade church road',NULL,0,0,NULL,0,NULL,0,NULL),(37,30,'2024-11-01 08:11:02',19600,'payment_neg_04.pdf',400,'2024-11-08',2,4,'Seeduwa, same address',NULL,0,0,NULL,0,NULL,0,NULL),(38,31,'2024-11-01 08:11:02',20000,'payment_neg_05.pdf',400,'2024-11-08',2,5,'Katana, near school',NULL,0,0,NULL,0,NULL,0,NULL),(39,32,'2024-11-01 08:11:02',20000,'payment_neg_06.pdf',400,'2024-11-08',2,6,'Kochchikade, beach road',NULL,0,0,NULL,0,NULL,0,NULL),(40,33,'2024-11-01 08:11:02',30000,'payment_gal_01.pdf',600,'2024-11-08',3,7,'Wakwella area, near bridge',NULL,0,0,NULL,0,NULL,0,NULL),(41,34,'2024-11-01 08:11:02',20000,'payment_gal_02.pdf',400,'2024-11-08',3,8,'Hikkaduwa beach road',NULL,0,0,NULL,0,NULL,0,NULL),(42,35,'2024-11-01 08:11:02',19200,'payment_gal_03.pdf',400,'2024-11-08',3,9,'Koggala lake view house',NULL,0,0,NULL,0,NULL,0,NULL),(43,33,'2024-11-01 08:11:02',13000,'payment_gal_04.pdf',500,'2024-11-08',3,7,'Wakwella, same address',NULL,0,0,NULL,0,NULL,0,NULL),(44,34,'2024-11-01 08:11:02',29600,'payment_gal_05.pdf',600,'2024-11-08',3,8,'Hikkaduwa, hotel area',NULL,0,0,NULL,0,NULL,0,NULL),(45,35,'2024-11-01 08:11:02',20000,'payment_gal_06.pdf',400,'2024-11-08',3,9,'Koggala, airport road',NULL,0,0,NULL,0,NULL,0,NULL),(46,36,'2024-11-01 08:11:02',20000,'payment_mat_01.pdf',400,'2024-11-08',4,10,'Weligama bay area',NULL,0,0,NULL,0,NULL,0,NULL),(47,37,'2024-11-01 08:11:02',23000,'payment_mat_02.pdf',700,'2024-11-08',4,12,'Dikwella junction house',NULL,0,0,NULL,0,NULL,0,NULL),(48,36,'2024-11-01 08:11:02',20000,'payment_mat_03.pdf',400,'2024-11-08',4,10,'Weligama, same location',NULL,0,0,NULL,0,NULL,0,NULL),(49,37,'2024-11-01 08:11:02',19200,'payment_mat_04.pdf',400,'2024-11-08',4,12,'Dikwella, near beach',NULL,0,0,NULL,0,NULL,0,NULL),(50,36,'2024-11-01 08:11:02',19600,'payment_mat_05.pdf',400,'2024-11-08',4,10,'Weligama bay view',NULL,0,0,NULL,0,NULL,0,NULL),(51,37,'2024-11-01 08:11:02',20000,'payment_mat_06.pdf',400,'2024-11-08',4,12,'Dikwella, main road',NULL,0,0,NULL,0,NULL,0,NULL),(52,38,'2024-11-01 08:11:02',20000,'payment_jaf_01.pdf',400,'2024-11-08',5,13,'Tellippalai junction',NULL,0,0,NULL,0,NULL,0,NULL),(53,39,'2024-11-01 08:11:02',29600,'payment_jaf_02.pdf',600,'2024-11-08',5,14,'Vaddukoddai temple road',NULL,0,0,NULL,0,NULL,0,NULL),(54,38,'2024-11-01 08:11:02',26000,'payment_jaf_03.pdf',1000,'2024-11-08',5,13,'Tellippalai, same address',NULL,0,0,NULL,0,NULL,0,NULL),(55,39,'2024-11-01 08:11:02',10000,'payment_jaf_04.pdf',200,'2024-11-08',5,14,'Vaddukoddai, near school',NULL,0,0,NULL,0,NULL,0,NULL),(56,38,'2024-11-01 08:11:02',19200,'payment_jaf_05.pdf',400,'2024-11-08',5,13,'Tellippalai market area',NULL,0,0,NULL,0,NULL,0,NULL),(57,39,'2024-11-01 08:11:02',20000,'payment_jaf_06.pdf',400,'2024-11-08',5,14,'Vaddukoddai junction',NULL,0,0,NULL,0,NULL,0,NULL),(58,40,'2024-11-01 08:11:02',30000,'payment_tri_01.pdf',600,'2024-11-08',6,16,'Kinniya bridge area',NULL,0,0,NULL,0,NULL,0,NULL),(59,41,'2024-11-01 08:11:02',20000,'payment_tri_02.pdf',400,'2024-11-08',6,17,'Mutur junction house',NULL,0,0,NULL,0,NULL,0,NULL),(60,40,'2024-11-01 08:11:02',19200,'payment_tri_03.pdf',400,'2024-11-08',6,16,'Kinniya, main road',NULL,0,0,NULL,0,NULL,0,NULL),(61,41,'2024-11-01 08:11:02',23000,'payment_tri_04.pdf',700,'2024-11-08',6,17,'Mutur, near mosque',NULL,0,0,NULL,0,NULL,0,NULL),(62,40,'2024-11-01 08:11:02',20000,'payment_tri_05.pdf',400,'2024-11-08',6,16,'Kinniya town',NULL,0,0,NULL,0,NULL,0,NULL),(63,41,'2024-11-01 08:11:02',20000,'payment_tri_06.pdf',400,'2024-11-08',6,17,'Mutur beach road',NULL,0,0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  `Product_capacity` int DEFAULT NULL,
  `product_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Hisence UHD TV',20000,400,'/images/product/tv1.png'),(2,'INNOVEX 32 Inch TV',9600,200,'/images/product/tv2.png'),(3,'Abans 42 Inch TV',13000,500,'/images/product/tv3.png'),(4,'Abans 32 Inch HD TV',10000,200,'/images/product/tv4.png'),(5,'Samsung Smart TV',20000,400,'/images/product/tv5.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `route` VALUES (1,1,'Wattala','From Colombo Fort,passing Technical Junction, Panchikawatta, along base line road to Sedawatta, along Negambo road to Wattala',10,5),(2,1,'Moratuwa','From Colombo Fort, passing Mount Lavinia and Ratmalana, along Galle Road to Moratuwa',20,5),(3,1,'Maharagama','From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama',15,4),(4,2,'Seeduwa','From Negombo, along Negombo Road passing Kurana to reach Seeduwa',11,5),(5,2,'Katana','From Negombo, along Giriulla Road via Koppara Junction and Kandawala to reach Katana',10,4),(6,2,'Kochchikade','From Negombo, via Periyamulla along Puttalama-Colombo main road passing Kattuwa to reach Kochchikade',8,6),(7,3,'Beddegama','From Galle, passing Hapugala and Wakwella to reach Ginimellagaha and then Beddegama',20,8),(8,3,'Hikkaduwa','From Galle, along Galle Road passing Bossa to reach Hikkaduwa',20,4),(9,3,'Koggala','From Galle, along Matara Road via Unawatuna and Thalpe to reach Koggala',22,5),(10,4,'Weligama','From Matara, along Matara Road passing Mirissa to reach Weligama',20,5),(11,4,'Akuressa','From Matara, via Malimbada and Thelijjawila to reach Akuressa',25,8),(12,4,'Dikwella','From Matara, along New Thangalla Road passing Gandara and Pathegama to reach Dikwella',23,5),(13,5,'Tellippalai','From Jaffna, along Eluppayady Junction and Jaffna Kankasanthurai Road passing Chunnakkam to reach Tellippalai',17,6),(14,5,'Vaddukoddai','From Jaffna, via Jayanthan and Karativu Road to reach Vaddukoddai',14,5),(15,5,'Nelliady','From Jaffna, along Nallur and Jaffna Point Pedro Road passing Neervely to reach Nelliady',25,7),(16,6,'Kinniya','From Trincomalee, along Kandy Road and crossing Kinniya Bridge to reach Kinniya',20,6),(17,6,'Mutur','From Trincomalee, via Trincomalee-Muttur Road passing Sampur to reach Mutur',30,7),(18,6,'Kuchchaveli','From Trincomalee, along Pulmoddai Road passing Nilaveli to reach Kuchchaveli',35,6);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_city` varchar(50) DEFAULT NULL,
  `truck_count` int DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Colombo',0),(2,'Negombo',0),(3,'Galle',0),(4,'Matara',0),(5,'Jaffna',0),(6,'Trincomalee',0);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `train_id` int NOT NULL AUTO_INCREMENT,
  `destination_store_id` int DEFAULT NULL,
  `total_capacity` int DEFAULT NULL,
  `departure_day` varchar(50) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  PRIMARY KEY (`train_id`),
  KEY `destination_store_id` (`destination_store_id`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`destination_store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,1,5000,'Monday','08:00:00'),(2,1,2000,'Tuesday','08:00:00'),(3,1,2000,'Wednessday','08:00:00'),(4,1,2000,'Thursday','08:00:00'),(5,1,50000,'Friday','08:00:00'),(6,2,1000,'Monday','08:00:00'),(7,2,2000,'Tuesday','08:00:00'),(8,2,1000,'Wednessday','08:00:00'),(9,2,2000,'Thursday','08:00:00'),(10,2,50000,'Friday','08:00:00'),(11,3,10000,'Monday','08:00:00'),(12,3,5000,'Wednesssday','08:00:00'),(13,3,50000,'Friday','08:00:00'),(14,4,10000,'Monday','08:00:00'),(15,4,10000,'Wednessday','08:00:00'),(16,4,50000,'Friday','08:00:00'),(17,5,10000,'Monday','08:00:00'),(18,5,50000,'Friday','08:00:00'),(19,6,15000,'Monday','08:00:00'),(20,6,50000,'Wednessday','08:00:00');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_delivery`
--

DROP TABLE IF EXISTS `train_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_delivery` (
  `train_delivery_id` int NOT NULL AUTO_INCREMENT,
  `train_id` int DEFAULT NULL,
  `allocated_capacity` int DEFAULT NULL,
  `sent` tinyint DEFAULT NULL,
  PRIMARY KEY (`train_delivery_id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `train_delivery_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_delivery`
--

LOCK TABLES `train_delivery` WRITE;
/*!40000 ALTER TABLE `train_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `train_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `truck_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `vehicle_number` int DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `hours` int DEFAULT '0',
  PRIMARY KEY (`truck_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `truck_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (23,1,10001,1,0),(24,1,10002,1,0),(25,1,10003,1,0),(26,1,10004,1,0),(27,1,10005,1,0),(28,2,20001,1,0),(29,2,20002,1,0),(30,2,20003,1,0),(31,2,20004,1,0),(32,2,20005,1,0),(33,3,3001,1,0),(34,3,3001,1,0),(35,3,30001,1,0),(36,3,30004,1,0),(37,4,40001,1,0),(38,4,40002,1,0),(39,5,50001,1,0),(40,6,6001,1,0);
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_delivery`
--

LOCK TABLES `truck_delivery` WRITE;
/*!40000 ALTER TABLE `truck_delivery` DISABLE KEYS */;
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
		SET availability = true,
			hours = hours + get_route_time(NEW.route_id)
        WHERE truck_id = NEW.truck_id;
        
		UPDATE orders
		SET delivery_id = NULL
		WHERE delivery_id = NEW.delivery_id AND delivered_confirmation = FALSE ;
        
        
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'scms-6'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `reset_worked_hours_weekly` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `reset_worked_hours_weekly` ON SCHEDULE EVERY 1 WEEK STARTS '2024-11-03 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL start_new_week() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'scms-6'
--
/*!50003 DROP FUNCTION IF EXISTS `count_all_drivers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_all_drivers`() RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE C1 INT ;
    DECLARE C2 INT ;
    
    SELECT COUNT(*) INTO C1
    FROM driver ;
    
    SELECT COUNT(*) INTO C2
    FROM assistant_driver ;
    
    RETURN C1 + C2 ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `count_all_managers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_all_managers`() RETURNS int
    DETERMINISTIC
BEGIN

	DECLARE C1 INT ;
    DECLARE C2 INT ;
    
    SELECT COUNT(*) INTO C1
    FROM manager ;
    
    SELECT COUNT(*) INTO C2
    FROM financeandorder_manager ;
    
    RETURN C1 + C2 ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `count_all_stors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_all_stors`() RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE C INT ;
    
	SELECT COUNT(*) INTO C
    FROM store ;
    
    RETURN C ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `count_all_trucks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_all_trucks`() RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE C INT ;
    
	SELECT COUNT(*) INTO C
    FROM truck ;
    
    RETURN C ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_route_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_route_time`(in_route_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE out_time INT ;
    
    SELECT max_time INTO out_time
    FROM route
    WHERE route_id = in_route_id ;
	RETURN out_time ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `identify_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `identify_table`(in_user_name VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(50);
    
    -- Check in the customer table first
    SELECT 'customer' INTO result
	FROM customer
	WHERE user_name = in_user_name
	LIMIT 1;

    -- Check in the manager table first
     IF result IS NULL THEN
        SELECT 'manager' INTO result
		FROM manager
		WHERE user_name = in_user_name
		LIMIT 1;
    END IF;

    -- If no result found in manager, check in driver
    IF result IS NULL THEN
        SELECT 'driver' INTO result
        FROM driver
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;

    -- If no result found in driver, check in assistant_driver
    IF result IS NULL THEN
        SELECT 'assistant_driver' INTO result
        FROM assistant_driver
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;
    
    -- If no result found in driver, check in hr_manager
    IF result IS NULL THEN
        SELECT 'hr_manager' INTO result
        FROM hr_manager
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;
    
    -- If no result found in driver, check in financeandorder_manager
    IF result IS NULL THEN
        SELECT 'financeandorder_manager' INTO result
        FROM financeandorder_manager
        WHERE user_name = in_user_name
        LIMIT 1;
    END IF;

    -- If no result is found in any table, return 'Unknown'
    IF result IS NULL THEN
        SET result = 'Unknown';
    END IF;

    RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_allocated_capacity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_allocated_capacity`(in_train_delivery_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE TOTAL INT ;
	SELECT sum(order_capacity) INTO total
    FROM orders 
    WHERE train_delivery_id = in_train_delivery_id ;
    
    return total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_order_capacity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_order_capacity`(in_order_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE capacity INT ;
    
    SELECT order_capacity INTO capacity
    FROM orders 
    WHERE order_id = in_order_id ;
    
    RETURN capacity ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddTruckToStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTruckToStore`(
    IN tr_vehicle_number VARCHAR(20),
    IN tr_store_id INT
)
BEGIN
    INSERT INTO truck (store_id, vehicle_number, availability) 
    VALUES (tr_store_id, tr_vehicle_number, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_orders_to_train` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_orders_to_train`(in_order_id INT, in_train_delivery_id INT)
BEGIN
	
    UPDATE orders
    SET train_delivery_id = in_train_delivery_id 
    WHERE order_id = in_order_id ;
    
    
    UPDATE train_delivery
    SET allocated_capacity = (select total_allocated_capacity(in_train_delivery_id))
	WHERE train_delivery_id = in_train_delivery_id ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_orders_to_truck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_orders_to_truck`(in_order_id INT, in_truck_delivery_id INT)
BEGIN
	UPDATE orders
    SET delivery_id = in_truck_delivery_id
    WHERE order_id = in_order_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_product_to_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_to_order`(
    IN order_id INT,
    IN product_id INT,
    IN quantity INT)
BEGIN
    INSERT INTO `Ordered_products` (order_id, product_id, quantity)
    VALUES (order_id, product_id, quantity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_to_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_cart`(customer_ID INT, product_ID INT, quantity INT)
BEGIN
	INSERT INTO cart VALUES (customer_ID, product_ID, quantity) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignTrainDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignTrainDelivery`(
    IN p_order_id INT,  -- Order ID to assign the train to
    IN p_train_id INT   -- Train ID to assign
)
BEGIN
    -- Declare variables to store payment status and nearest store ID
    DECLARE v_nearest_store_id INT;
    DECLARE v_confirm_payments BOOLEAN;

    -- Fetch the payment status and nearest_store_id for the order
    SELECT confirm_payments, nearest_store_id
    INTO v_confirm_payments, v_nearest_store_id
    FROM `Order`
    WHERE order_id = p_order_id;

    -- If payment is confirmed, proceed with updates
    IF v_confirm_payments = 1 THEN
        -- Update the Order table to assign the train delivery and mark as sent by train
        UPDATE `Order`
        SET train_delivery_id = p_train_id, 
            sent_by_train = 1
        WHERE order_id = p_order_id;

        -- Insert the assigned train and capacity allocation into the train_delivery table
        INSERT INTO train_delivery (train_id, store_id, allocated_capacity)
        VALUES (p_train_id, v_nearest_store_id, 0);
        
    ELSE
        -- If payment is not confirmed, raise an error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment not confirmed for this order.';
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `available_assistant_drivers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `available_assistant_drivers`(in_store_id INT)
BEGIN
	SELECT * FROM assistant_driver
    WHERE store_id = in_store_id  and availability = true ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `available_drivers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `available_drivers`(in_store_id INT)
BEGIN
	SELECT * FROM driver
    WHERE store_id = in_store_id  and availability = true ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `available_trucks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `available_trucks`(in_store_id INT)
BEGIN
	SELECT * FROM truck
    WHERE store_id = in_store_id  and availability = true ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `confirm_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `confirm_delivery`(in_order_id INT)
BEGIN
	UPDATE orders
    SET delivered_confirmation = true,
		delivered_date_time = NOW()
    WHERE order_id = in_order_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `confirm_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `confirm_payment`(in_order_id INT, in_fom_id INT)
BEGIN
	UPDATE orders
    SET confirm_payments = True ,
		finance_manager_id = in_fom_id
    WHERE order_id = in_order_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `confirm_recived_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `confirm_recived_orders`(in_order_id INT)
BEGIN
	UPDATE orders
    SET recieved_to_store = true 
    WHERE order_ID = in_order_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_orders_to_deliver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_orders_to_deliver`(in_store_id INT)
BEGIN
	SELECT count(*) FROM orders
	WHERE nearest_store_id = in_store_id and recieved_to_store = true and delivered_confirmation = false ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_orders_to_recieve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_orders_to_recieve`(in_store_id INT)
BEGIN
	SELECT count(*) FROM orders
	WHERE nearest_store_id = in_store_id and sent_by_train = true and recieved_to_store = false ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateTruckDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateTruckDelivery`(
    IN p_truck_id INT,
    IN p_driver_id INT,
    IN p_ast_driver_id INT,
    IN p_route_id INT,
    IN p_manager_id INT,
    IN p_sent_datetime DATETIME
)
BEGIN
    -- Insert the new delivery into the Truck_Delivery table
    INSERT INTO Truck_Delivery (
        truck_id, 
        driver_id, 
        ast_driver_id, 
        route_id, 
        manager_id, 
        sent_datetime
    )
    VALUES (
        p_truck_id, 
        p_driver_id, 
        p_ast_driver_id, 
        p_route_id, 
        p_manager_id, 
        p_sent_datetime
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_train_shedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_train_shedule`(in_train_id INT)
BEGIN
	INSERT INTO train_delivery(train_id, allocated_capacity)
    VALUES (in_train_id,0) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `end_trip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `end_trip`(in_delivery_id INT)
BEGIN
	UPDATE truck_delivery
    SET compleated = true 
    WHERE delivery_id = in_delivery_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetActiveOrdersByStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetActiveOrdersByStore`(IN p_store_id INT)
BEGIN
    SELECT 
        o.order_id,
        o.customer_id,
        o.ordered_date_time,
        o.total_amount,
        o.order_capacity,
        o.expecting_delivery_date,
        o.delivery_address,
        o.route_description_input,
        o.confirm_payments,
        o.sent_by_train,
        o.recieved_to_store,
        o.delivered_confirmation,
        c.customer_first_name,
        c.customer_last_name,
        c.customer_contact,
        c.customer_email
    FROM 
        `Order` o
    JOIN 
        Customer c ON o.customer_id = c.customer_id
    WHERE 
        o.nearest_store_id = p_store_id
        AND o.delivered_confirmation = FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllFinanceOrderManagers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFinanceOrderManagers`()
BEGIN
    SELECT 
        finance_manager_id, 
        manager_first_name, 
        manager_last_name, 
        manager_contact, 
        manager_email
    FROM 
        FinanceandOrder_Manager;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllStoreManagers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllStoreManagers`()
BEGIN
    SELECT 
        manager_id, 
        store_id,
        manager_first_name, 
        manager_last_name, 
        manager_contact, 
        manager_email
    FROM 
        manager;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllTrainDeliveries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTrainDeliveries`()
BEGIN
    SELECT 
        td.train_delivery_id,
        td.train_id,
        td.allocated_capacity,
        t.destination_store_id,
        t.total_capacity,
        t.departure_day,
        t.departure_time
    FROM 
        Train_delivery AS td
    JOIN 
        train AS t ON td.train_id = t.train_id
    WHERE 
        td.sent = FALSE or td.sent is null;  -- Only return rows where sent is false
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAssignedDeliveriesForAssistantDriver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAssignedDeliveriesForAssistantDriver`(IN driverId INT)
BEGIN
    SELECT 
        td.delivery_id,
        td.truck_id,
        t.vehicle_number,
        td.sent_datetime,
        td.compleated,
        td.route_id,
        r.end_point AS destination,
        r.route_description,
        r.distance,
        r.max_time,
        td.store_id,
        s.store_city AS store_location
    FROM 
        Truck_Delivery td
    INNER JOIN 
        Truck t ON td.truck_id = t.truck_id
    INNER JOIN 
        Route r ON td.route_id = r.route_id
    INNER JOIN 
        Store s ON td.store_id = s.store_id
    WHERE 
        td.ast_driver_id = driverId
        AND td.compleated = FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAssignedDeliveriesForDriver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAssignedDeliveriesForDriver`(IN driverId INT)
BEGIN
    SELECT 
        td.delivery_id,
        td.truck_id,
        t.vehicle_number,
        td.sent_datetime,
        td.compleated,
        td.route_id,
        r.end_point AS destination,
        r.route_description,
        r.distance,
        r.max_time,
        td.store_id,
        s.store_city AS store_location
    FROM 
        Truck_Delivery td
    INNER JOIN 
        Truck t ON td.truck_id = t.truck_id
    INNER JOIN 
        Route r ON td.route_id = r.route_id
    INNER JOIN 
        Store s ON td.store_id = s.store_id
    WHERE 
        td.driver_id = driverId
        AND td.compleated = FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAssistantDriversByStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAssistantDriversByStore`(IN p_store_id INT)
BEGIN
    SELECT 
        ad.ast_driver_id,
        ad.user_name,
        ad.ast_driver_first_name,
        ad.ast_driver_last_name,
        ad.ast_driver_contact,
        ad.ast_driver_email,
        ad.ast_driver_image_url,
        ad.store_id,
        s.store_city,
        ad.worked_hours
    FROM 
        Assistant_Driver ad
    JOIN 
        Store s ON ad.store_id = s.store_id
    WHERE 
        ad.store_id = p_store_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAstDriversByStoreID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAstDriversByStoreID`(IN input_store_id INT)
BEGIN
    SELECT 
        d.ast_driver_id,
        d.user_name,
        d.ast_driver_first_name,
        d.ast_driver_last_name,
        d.ast_driver_contact,
        d.ast_driver_email,
        d.ast_driver_image_url,
        d.worked_hours,
        d.availability
    FROM 
        assistant_driver d
    WHERE 
        d.store_id = input_store_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAvailableDriversAndAssistantDrivers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAvailableDriversAndAssistantDrivers`()
BEGIN
    -- Fetch available drivers who are not assigned to any active deliveries
    SELECT 
        d.driver_id,
        d.user_name,
        d.driver_first_name,
        d.driver_last_name,
        d.driver_contact,
        d.driver_email,
        d.driver_image_url,
        d.store_id,
        s.store_city,
        d.worked_hours
    FROM 
        Driver d
    JOIN 
        Store s ON d.store_id = s.store_id
    LEFT JOIN 
        Truck_Delivery td ON d.driver_id = td.driver_id
    WHERE 
        td.delivery_id IS NULL;  -- If no matching delivery, driver is available

    -- Fetch available assistant drivers who are not assigned to any active deliveries
    SELECT 
        ad.ast_driver_id,
        ad.user_name,
        ad.ast_driver_first_name,
        ad.ast_driver_last_name,
        ad.ast_driver_contact,
        ad.ast_driver_email,
        ad.ast_driver_image_url,
        ad.store_id,
        s.store_city,
        ad.worked_hours
    FROM 
        Assistant_Driver ad
    JOIN 
        Store s ON ad.store_id = s.store_id
    LEFT JOIN 
        Truck_Delivery td ON ad.ast_driver_id = td.ast_driver_id
    WHERE 
        td.delivery_id IS NULL;  -- If no matching delivery, assistant driver is available
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetConfirmedPayments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetConfirmedPayments`()
BEGIN
    -- Select all orders where payments are confirmed
    SELECT * 
    FROM `Order`
    WHERE confirm_payments = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDeliveredOrdersOnCurrentDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDeliveredOrdersOnCurrentDelivery`(IN deliveryId INT)
BEGIN

    SELECT * FROM Orders WHERE delivery_id = deliveryId and delivered_confirmation = true;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDeliveriesByStoreID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDeliveriesByStoreID`(IN storeId INT)
BEGIN
    SELECT *
    FROM Truck_Delivery
    WHERE store_id = storeId and sent_datetime is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDriverForDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDriverForDelivery`(IN deliveryId INT)
BEGIN
    SELECT d.driver_id, d.driver_first_name, d.driver_last_name, d.driver_contact, d.driver_email
    FROM Truck_Delivery td
    JOIN Driver d ON td.driver_id = d.driver_id
    WHERE td.delivery_id = deliveryId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDriversByStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDriversByStore`(IN p_store_id INT)
BEGIN
    SELECT 
        d.driver_id,
        d.user_name,
        d.driver_first_name,
        d.driver_last_name,
        d.driver_contact,
        d.driver_email,
        d.driver_image_url,
        d.store_id,
        s.store_city,
        d.worked_hours
    FROM 
        Driver d
    JOIN 
        Store s ON d.store_id = s.store_id
    WHERE 
        d.store_id = p_store_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDriversByStoreID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDriversByStoreID`(IN input_store_id INT)
BEGIN
    SELECT 
        d.driver_id,
        d.user_name,
        d.driver_first_name,
        d.driver_last_name,
        d.driver_contact,
        d.driver_email,
        d.driver_image_url,
        d.worked_hours,
        d.availability
    FROM 
        Driver d
    WHERE 
        d.store_id = input_store_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetManagersByStoreId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetManagersByStoreId`(IN store_id_param INT)
BEGIN
    SELECT manager_id, user_name, manager_first_name, manager_last_name, manager_contact, manager_email, manager_image_url
    FROM Manager
    WHERE store_id = store_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrderDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOrderDetails`(IN orderId INT)
BEGIN
    SELECT 
        o.order_id,
        o.customer_id,
        c.customer_first_name,
        c.customer_last_name,
        c.customer_address,
        c.customer_contact,
        o.ordered_date_time,
        o.total_amount,
        o.order_capacity,
        o.expecting_delivery_date,
        o.route_id,
        r.route_description AS route_details,
        o.delivery_id,
        o.confirm_payments,
        o.sent_by_train,
        o.recieved_to_store,
        o.delivered_confirmation,
        o.delivered_date_time,
        p.product_id,
        p.product_name,
        p.product_price,
        op.quantity,
        op.price AS unit_price,
        (op.quantity * op.price) AS total_product_price
    FROM 
        Orders o
    INNER JOIN 
        Ordered_products op ON o.order_id = op.order_id
    INNER JOIN 
        Product p ON op.product_id = p.product_id
    INNER JOIN 
        Customer c ON o.customer_id = c.customer_id
    LEFT JOIN 
        Route r ON o.route_id = r.route_id
    WHERE 
        o.order_id = orderId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrdersByTrainDeliveryId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOrdersByTrainDeliveryId`(IN p_train_delivery_id INT)
BEGIN
    SELECT *
    FROM Orders
    WHERE train_delivery_id = p_train_delivery_id and sent_by_train = false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrdersByTruckDeliveryId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOrdersByTruckDeliveryId`(IN p_truck_delivery_id INT)
BEGIN
    SELECT *
    FROM Orders
    WHERE delivery_id = p_truck_delivery_id and recieved_to_store = true and delivered_confirmation = false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrdersOnCurrentDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOrdersOnCurrentDelivery`(IN deliveryId INT)
BEGIN

    SELECT * FROM Orders WHERE delivery_id = deliveryId and delivered_confirmation = false;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPayments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPayments`()
BEGIN
    -- Select all records from the Order table
    SELECT * 
    FROM `Order`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTrainDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTrainDetails`(IN train_schedule_id INT)
BEGIN
    SELECT 
        t.train_id,
        t.destination_store_id,
        t.total_capacity,
        t.departure_day,
        t.departure_time,
        t.arrival_day,
        t.arrival_time,
        td.train_delivery_id,
        td.allocated_capacity
    FROM 
        train t
    LEFT JOIN 
        Train_delivery td ON t.train_id = td.train_id
    WHERE 
        t.train_id = train_schedule_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTrainDetailsByDeliveryId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTrainDetailsByDeliveryId`(IN delivery_id INT)
BEGIN
    SELECT 
        t.train_id,
        t.destination_store_id,
        t.total_capacity,
        t.departure_day,
        t.departure_time,
        td.train_delivery_id,
        td.allocated_capacity
    FROM 
        train t
    JOIN 
        Train_delivery td ON t.train_id = td.train_id
    WHERE 
        td.train_delivery_id = delivery_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTrains` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTrains`()
BEGIN
    -- Select all records from the train table
    SELECT * 
    FROM `train`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTruckDeliveryDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTruckDeliveryDetails`(IN truck_delivery_id INT)
BEGIN
    SELECT 
        td.delivery_id,
        td.sent_datetime,
        td.compleated AS completed,
        t.truck_id,
        t.vehicle_number,
        t.availability AS truck_availability,
        d.driver_id,
        CONCAT(d.driver_first_name, ' ', d.driver_last_name) AS driver_name,
        d.driver_contact AS driver_contact,
        ad.ast_driver_id,
        CONCAT(ad.ast_driver_first_name, ' ', ad.ast_driver_last_name) AS assistant_driver_name,
        ad.ast_driver_contact AS assistant_driver_contact,
        r.route_id,
        r.end_point AS route_end_point,
        r.route_description,
        r.distance AS route_distance,
        r.max_time AS route_max_time,
        s.store_id,
        s.store_city AS store_city,
        s.truck_count AS store_truck_count
    FROM 
        Truck_Delivery td
    JOIN 
        Truck t ON td.truck_id = t.truck_id
    LEFT JOIN 
        Driver d ON td.driver_id = d.driver_id
    LEFT JOIN 
        Assistant_Driver ad ON td.ast_driver_id = ad.ast_driver_id
    JOIN 
        Route r ON td.route_id = r.route_id
    JOIN 
        Store s ON td.store_id = s.store_id
    WHERE 
        td.delivery_id = truck_delivery_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTrucksByStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTrucksByStore`(IN storeId INT)
BEGIN
    SELECT 
        t.truck_id, 
        t.store_id, 
        t.vehicle_number, 
        s.store_city, 
        t.availability
    FROM 
        Truck t
    JOIN 
        Store s ON t.store_id = s.store_id
    WHERE 
        t.store_id = storeId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUnconfirmedPayments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUnconfirmedPayments`()
BEGIN
    -- Select all orders where payments are not confirmed
    SELECT * 
    FROM `Order`
    WHERE confirm_payments = FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_products`()
BEGIN
    SELECT * FROM product;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_routes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_routes`()
BEGIN
    SELECT * FROM route;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_trains` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_trains`()
BEGIN
    SELECT * FROM train;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_train_schedules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_train_schedules`()
BEGIN
    SELECT * FROM train_delivery WHERE sent = false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_pending_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pending_orders`(IN customer_id_input INT)
BEGIN
    SELECT * 
    FROM `Order`
    WHERE (`customer_id` = customer_id_input AND `delivered_confirmation` = false);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `items_mostly_orderd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `items_mostly_orderd`()
BEGIN
	SELECT o.product_id, p.product_name , sum(o.quantity) AS "product_count" 
	FROM ordered_products o
	JOIN product p ON o.product_id = P.product_id 
	GROUP BY O.product_id
	ORDER BY sum(o.quantity) DESC ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `orders_to_deliver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `orders_to_deliver`(in_store_id INT)
BEGIN
	SELECT * FROM orders
	WHERE nearest_store_id = in_store_id and recieved_to_store = true and delivery_id is null ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `orders_to_recieve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `orders_to_recieve`(in_store_id INT)
BEGIN
	SELECT * FROM orders
	WHERE nearest_store_id = in_store_id and sent_by_train = true and recieved_to_store = false ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `place_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `place_order`(
    IN customer_id INT,
    IN delivery_address VARCHAR(1000),
    IN nearest_store_id INT)
BEGIN
    -- Insert into the `Order` table
    INSERT INTO `Orders` (
        customer_id,
        ordered_date_time,
        expecting_delivery_date,
        delivery_address,
        nearest_store_id
    )
    VALUES (
        customer_id, 
        now(),
        DATE(DATE_ADD(NOW(), INTERVAL 7 DAY)),
        delivery_address, 
        nearest_store_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `purchas_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purchas_orders`(
    IN in_customer_id INT, 
    IN in_store_id INT, 
    IN in_route_id INT, 
    IN in_description VARCHAR(1000), 
    IN in_payment VARCHAR(1000)
)
BEGIN
    START TRANSACTION;
    
    INSERT INTO Orders (customer_id, nearest_store_id, route_id, route_description_input, payment_documents)
    VALUES (in_customer_id, in_store_id, in_route_id, in_description, in_payment);
    
    SET @order_id = LAST_INSERT_ID();
    
    INSERT INTO ordered_products(order_id, product_id, quantity, price, capacity)
    SELECT @order_id, c.product_id, c.quantity  , c.quantity * p.product_price, c.quantity * p.Product_capacity
    FROM cart c
    JOIN product p on c.product_id = p.product_id
    WHERE c.customer_id = in_customer_id ;
    
    DELETE FROM cart where customer_id = in_customer_id ;
    
    UPDATE Orders
	SET 
		ordered_date_time = NOW(), 
		expecting_delivery_date = NOW() + INTERVAL 7 DAY,
		total_amount = (SELECT SUM(price) FROM ordered_products WHERE order_id = @order_id), 
		order_capacity = (SELECT SUM(capacity) FROM ordered_products WHERE order_id = @order_id)
	WHERE order_id= @order_id;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterAstDriver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterAstDriver`(
    IN fm_user_name VARCHAR(20),
    IN fm_password VARCHAR(100),
    IN fm_first_name VARCHAR(20),
    IN fm_last_name VARCHAR(20),
    IN fm_contact INT,
    IN fm_email VARCHAR(50),
    IN fm_store_id INT  -- Add store_id as an input parameter
)
BEGIN
    INSERT INTO assistant_driver (user_name, password, ast_driver_first_name, ast_driver_last_name, ast_driver_contact, ast_driver_email, store_id, worked_hours, availability)  -- Include store_id in the INSERT statement
    VALUES (fm_user_name, fm_password, fm_first_name, fm_last_name, fm_contact, fm_email, fm_store_id, 0, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterDriver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterDriver`(
    IN fm_user_name VARCHAR(20),
    IN fm_password VARCHAR(100),
    IN fm_first_name VARCHAR(20),
    IN fm_last_name VARCHAR(20),
    IN fm_contact INT,
    IN fm_email VARCHAR(50),
    IN fm_store_id INT  -- Add store_id as an input parameter
)
BEGIN
    INSERT INTO driver (user_name, password, driver_first_name, driver_last_name, driver_contact, driver_email, store_id, worked_hours, availability)  -- Include store_id in the INSERT statement
    VALUES (fm_user_name, fm_password, fm_first_name, fm_last_name, fm_contact, fm_email, fm_store_id, 0, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterEndCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterEndCustomer`(
    IN p_user_name VARCHAR(20),
    IN p_password VARCHAR(100),
    IN p_first_name VARCHAR(20),
    IN p_last_name VARCHAR(20),
    IN p_contact INT,
    IN p_email VARCHAR(50),
    IN p_address VARCHAR(200)
)
BEGIN
    INSERT INTO Customer (user_name, password, customer_first_name, customer_last_name, customer_type, customer_contact, customer_email, customer_address)
    VALUES (p_user_name, p_password, p_first_name, p_last_name, 'end customer', p_contact, p_email, p_address);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterFinanceManager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterFinanceManager`(
    IN fm_user_name VARCHAR(20),  -- Username of the new finance manager
    IN fm_password VARCHAR(100),  -- Password for the new finance manager
    IN fm_first_name VARCHAR(20), -- First name of the new finance manager
    IN fm_last_name VARCHAR(20),  -- Last name of the new finance manager
    IN fm_contact INT,            -- Contact number of the new finance manager
    IN fm_email VARCHAR(50)       -- Email of the new finance manager
)
BEGIN
    -- Insert the provided data into the financeandorder_manager table
    INSERT INTO financeandorder_manager (
        user_name, 
        password, 
        manager_first_name, 
        manager_last_name, 
        manager_contact, 
        manager_email
    )
    VALUES (fm_user_name, fm_password, fm_first_name, fm_last_name, fm_contact, fm_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterHrManager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterHrManager`(
    IN fm_user_name VARCHAR(20),
    IN fm_password VARCHAR(100),
    IN fm_first_name VARCHAR(20),
    IN fm_last_name VARCHAR(20),
    IN fm_contact INT,
    IN fm_email VARCHAR(50)
)
BEGIN
    INSERT INTO hr_manager (user_name, password, manager_first_name, manager_last_name, manager_contact, manager_email)
    VALUES (fm_user_name, fm_password, fm_first_name, fm_last_name, fm_contact, fm_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterRetailerCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterRetailerCustomer`(
    IN p_user_name VARCHAR(20),
    IN p_password VARCHAR(100),
    IN p_first_name VARCHAR(20),
    IN p_last_name VARCHAR(20),
    IN p_contact INT,
    IN p_email VARCHAR(50),
    IN p_address VARCHAR(200)
)
BEGIN
    INSERT INTO Customer (user_name, password, customer_first_name, customer_last_name, customer_type, customer_contact, customer_email, customer_address)
    VALUES (p_user_name, p_password, p_first_name, p_last_name, 'retailer', p_contact, p_email, p_address);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterStoreManager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterStoreManager`(
    IN fm_user_name VARCHAR(20),
    IN fm_password VARCHAR(100),
    IN fm_first_name VARCHAR(20),
    IN fm_last_name VARCHAR(20),
    IN fm_contact INT,
    IN fm_email VARCHAR(50),
    IN fm_store_id INT  -- Add store_id as an input parameter
)
BEGIN
    INSERT INTO manager (user_name, password, manager_first_name, manager_last_name, manager_contact, manager_email, store_id)  -- Include store_id in the INSERT statement
    VALUES (fm_user_name, fm_password, fm_first_name, fm_last_name, fm_contact, fm_email, fm_store_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterWholesalerCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterWholesalerCustomer`(
    IN p_user_name VARCHAR(20),
    IN p_password VARCHAR(100),
    IN p_first_name VARCHAR(20),
    IN p_last_name VARCHAR(20),
    IN p_contact INT,
    IN p_email VARCHAR(50),
    IN p_address VARCHAR(200)
)
BEGIN
    INSERT INTO Customer (user_name, password, customer_first_name, customer_last_name, customer_type, customer_contact, customer_email, customer_address)
    VALUES (p_user_name, p_password, p_first_name, p_last_name, 'wholesaler', p_contact, p_email, p_address);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_drivers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_drivers`(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'driver' THEN
        DELETE FROM driver
        WHERE driver_id = input_id;
    
    ELSEIF input_table = 'assistant_driver' THEN
        DELETE FROM assistant_driver
        WHERE ast_driver_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_from_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_from_cart`(in_customer_ID INT, in_product_ID INT)
BEGIN
	DELETE FROM cart
    WHERE customer_id = in_customer_ID and product_id = in_product_ID ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_managers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_managers`(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'financeandorder_manager' THEN
        DELETE FROM financeandorder_manager
        WHERE finance_manager_id = input_id;
    
    ELSEIF input_table = 'manager' THEN
        DELETE FROM manager
        WHERE manager_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_orders_from_train` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_orders_from_train`(in_order_id INT, in_train_delivery_id INT)
BEGIN
	
    UPDATE train_delivery
    SET allocated_capacity = allocated_capacity - (SELECT total_order_capacity(in_order_id))
	WHERE train_delivery_id = in_train_delivery_id ;
    
    UPDATE orders
    SET train_delivery_id = null
    WHERE order_id = in_order_id ;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_orders_from_truck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_orders_from_truck`(in_order_id INT)
BEGIN
	UPDATE orders
    SET delivery_id = null
    WHERE order_id = in_order_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_properties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_properties`(
    IN input_table VARCHAR(100), 
    IN input_id INT
)
BEGIN
    IF input_table = 'truck' THEN
        DELETE FROM truck
        WHERE truck_id = input_id;
    
    ELSEIF input_table = 'store' THEN
        DELETE FROM store
        WHERE store_id = input_id;
    
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid table name provided';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sales_report_by_route` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sales_report_by_route`()
BEGIN

	SELECT o.route_id, r.end_point , sum(o.total_amount) as "sum"
	FROM orders o
	JOIN route r ON r.route_id = o.route_id
	WHERE O.confirm_payments = TRUE
	GROUP BY o.route_id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sales_report_by_stores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sales_report_by_stores`()
BEGIN

	SELECT o.nearest_store_id, s.store_city , sum(o.total_amount) as "sum"
	FROM orders o
	JOIN store s ON s.store_id = o.nearest_store_id 
	WHERE O.confirm_payments = TRUE
	GROUP BY o.nearest_store_id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SendTrain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SendTrain`(IN trainDeliveryID INT)
BEGIN
  -- Update the Train_delivery table to mark the train as sent
  UPDATE Train_delivery
  SET sent = TRUE
  WHERE train_delivery_id = trainDeliveryID;

  -- Update all orders linked to this train delivery
  UPDATE Orders
  SET sent_by_train = TRUE
  WHERE train_delivery_id = trainDeliveryID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_truck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_truck`(in_truck_delivery_id INT)
BEGIN
	UPDATE truck_delivery
    SET sent_datetime = NOW()
    WHERE delivery_id = in_truck_delivery_id ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `shedule_truck_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `shedule_truck_delivery`(
    in_truck_id INT, 
    in_driver_id INT, 
    in_ast_driver_id INT, 
    in_route_id INT, 
    in_store_id INT
)
BEGIN
    INSERT INTO Truck_Delivery (truck_id, driver_id, ast_driver_id, route_id, store_id, compleated)
    VALUES (in_truck_id, in_driver_id, in_ast_driver_id, in_route_id, in_store_id, FALSE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_about_truck_delivery_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_about_truck_delivery_details`(in_driver_id INT, in_truck_delivery_id INT)
BEGIN
	SELECT td.delivery_id, d.driver_first_name, asd.ast_driver_first_name, t.vehicle_number, s.store_city , r.end_point ,r.route_description FROM truck_delivery td
	join driver d on td.driver_id = d.driver_id
	join assistant_driver asd on td.ast_driver_id = asd.ast_driver_id
	join route r on r.route_id = td.route_id
	join truck t on t.truck_id = td.truck_id
	join store s on s.store_id = td.store_id
	WHERE d.driver_id = in_driver_id and td.delivery_id = in_truck_delivery_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_products`()
BEGIN
	SELECT * FROM product;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_stores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_stores`()
BEGIN
	SELECT * FROM store;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_cart`(customer_ID INT)
BEGIN
    SELECT 
        c.customer_id,
        c.product_id,
        c.quantity,
        p.product_name,
        p.product_price,
        p.product_image_url
    FROM 
        cart c
    JOIN 
        Product p ON c.product_id = p.product_id
    WHERE 
        c.customer_id = customer_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_confirmed_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_confirmed_orders`()
BEGIN
	SELECT * FROM orders 
	WHERE confirm_payments = true and train_delivery_id is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_current_orders_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_current_orders_customer`(in_ID INT)
BEGIN
	SELECT * FROM orders
    WHERE customer_id = in_ID and delivered_confirmation = False;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order_history_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_order_history_customer`(in_ID INT)
BEGIN
	SELECT * FROM orders
    WHERE customer_id = in_ID and delivered_confirmation = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_unconfirmed_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_unconfirmed_orders`()
BEGIN
	SELECT * FROM orders 
	WHERE confirm_payments = false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `start_new_week` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `start_new_week`()
BEGIN
	UPDATE driver
    SET worked_hours = 0; 
    
    UPDATE assistant_driver
    SET worked_hours = 0; 
    
END ;;
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

-- Dump completed on 2024-11-01  8:18:01
