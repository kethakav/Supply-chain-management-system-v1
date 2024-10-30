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
-- Dumping data for table `assistant_driver`
--

LOCK TABLES `assistant_driver` WRITE;
/*!40000 ALTER TABLE `assistant_driver` DISABLE KEYS */;
INSERT INTO `assistant_driver` VALUES (20,'astdr1','$argon2id$v=19$m=65536,t=3,p=4$RcQHVIZ2Xw0vWI9wkM+pxA$n24YdZozBGHNI4imRpz4ZJS6Oiyha092hlUwECtookw','AssistentDriver','harshila',783764064,'gayathri@gmail.com',NULL,1,0,0),(21,'astdr2','$argon2id$v=19$m=65536,t=3,p=4$mGiyZVnVJ089XWm/kh0cCg$2Huimepz9zLWtkJhDCvdpFjVDPUfUF9q8vL4SeCzsag','AstDr2','harshila',783764064,'gayathri@gmail.com',NULL,2,0,1),(23,'Kaveesha','$argon2id$v=19$m=65536,t=3,p=4$o9t3kFv1/HyKifDIaPycGA$WBijXX+GeQs13orFYbWtunDUanAMiH1Q3K7AOh/LhC0','kaveesha','priyanjith',115248789,'kaveesha@gmail.com',NULL,1,30,1);
/*!40000 ALTER TABLE `assistant_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (26,'user12','$argon2id$v=19$m=65536,t=3,p=4$FfdkkZdKNfNPi0JXuJkRJg$xR6apdRqZMjzhg4JbpBXCQgEam2QMpI4YmCC1E/xqd8','user12_firstName','user12_lastName','retailer',783764064,'user12@gmail.com','no 12, Flower road , Hambantota',NULL),(27,'user13','$argon2id$v=19$m=65536,t=3,p=4$CsMbtCzBfc6gW9zdBFkGiQ$GB2zDx8duv3Q3es98PsRZ9L7QBgmaZXPKJmH5hX+wTI','user13_firstName','user13_lastName','retailer',783764064,'user13@gmail.com','no 13, Flower road , Puttalama',NULL),(28,'user11','$argon2id$v=19$m=65536,t=3,p=4$AYFw04GM3IJTfYqnr1TTUg$Fw2Q5043BWinsoUQCJwp81afbyH35coD14W7NytVMz8','user11_firstName','user11_lastName','retailer',783764064,'user11@gmail.com','no 11, Flower road , Colombo',NULL),(29,'user14','$argon2id$v=19$m=65536,t=3,p=4$gZyZCNXaTvOH6t1gEGiFJQ$VBDZDf/dx7ozIJLZSpMBSrPF+KiGskpm+VwCQzGIyfM','user14_firstName','user14_lastName','wholesaler',701629317,'user14@gmail.com','no 14 , Galle road, Colombo 7',NULL),(30,'user15','$argon2id$v=19$m=65536,t=3,p=4$+3nZ0vjOIsr/zKiqzTdN0Q$pJ2RpYWhHE8YOLxY5addxeChpdZbvUV/6HVu3VuXV0w','user15_firstName','user15_lastName','wholesaler',701629318,'user15@gmail.com','no 15 , Galle road, Hikkaduwa',NULL),(31,'user16','$argon2id$v=19$m=65536,t=3,p=4$DoAmtuAtnorJmk8oC5m7jQ$ZmompqilQOZ4z2YS6DsGr14MPd2JBstqgNM8DB1npLo','user16_firstName','user16_lastName','wholesaler',701629310,'user16@gmail.com','No 16 , Kilinochchi road, Vavniya',NULL),(32,'user17','$argon2id$v=19$m=65536,t=3,p=4$q1IvhK5J9y9PAUDhrNTqxQ$Ihia6WthyxlsqmACLeT64Zq43evO9xl5W52FlIKfPFs','user17_firstName','user17_lastName','end customer',725747552,'user17@gmail.com','No 17, Pelawatta road, Colombo',NULL),(33,'user18','$argon2id$v=19$m=65536,t=3,p=4$z1Ijm3gJUwQ34+vYf5y22w$cXJnt9TbKGptZSYgtG2gh1VjEfH7YC9LNYknMKE388Q','user18_firstName','user18_lastName','end customer',783764066,'user18@gmail.com','No 18, Anuradapura  road, Kinniya',NULL),(34,'user19','$argon2id$v=19$m=65536,t=3,p=4$ZcG2oCmRGI+EMk0C4awayQ$sb+ZOX5pniBmFR2e+tkQ1W/R2ZPlUrncT+xasb20RXM','user19_firstName','user19_lastName','end customer',728478952,'user19@gmail.com','No 19, Temple road, Trincomalee',NULL),(35,'user20','$argon2id$v=19$m=65536,t=3,p=4$wKfaGGRPq+oOp9gOlNPQvg$TQl4QeB4LidOlL8/gpsTjp1+sJfj/uh9Neq7dfY3/HQ','user20_firstName','user20_lastName','end customer',1155833425,'user20@gmail.com','No 20, Pelawatta road, Kelaniya',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (22,'dr1','$argon2id$v=19$m=65536,t=3,p=4$O5WZLnS6kfJmaJwDWztoVw$sny1OhrLOt5YttUSWcCo8S9u5I+wWLFXnWMzjY7kQd0','gayathriDriver','harshila',783764064,'gayathri@gmail.com',NULL,1,0,0),(23,'dr2','$argon2id$v=19$m=65536,t=3,p=4$b+q4BPHDHO9HjIPuakb5RA$9CY0IdxMtMCv0AjKDWq1m6rlS3eYDLhi+TorZNiVw3M','driver1','harshila',783764064,'gayathri@gmail.com',NULL,2,0,1),(25,'prabath','$argon2id$v=19$m=65536,t=3,p=4$gIoJJt47Edt8JMn5bsjztg$R7Msp7qFlnmt+qnPC6u8L/kLrq2OzWck9ptOjNmdX+c','prabath','samarasinghe',783464004,'prabath@gmail.com',NULL,1,30,1);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `financeandorder_manager`
--

LOCK TABLES `financeandorder_manager` WRITE;
/*!40000 ALTER TABLE `financeandorder_manager` DISABLE KEYS */;
INSERT INTO `financeandorder_manager` VALUES (8,'kethaka','$argon2id$v=19$m=65536,t=3,p=4$vQRonyH6MLKo0DIFw/h9Jw$tZjxUQGetkBat87b8H6wSWJNSBUwo0lqd5uX9XcxvGA','kethaka','vidyarathna',701629317,'abc@gmail.com',NULL),(9,'geshan','$argon2id$v=19$m=65536,t=3,p=4$CRf3qsLyiNFyOnvn7gIcgg$A30Xa7GOTGEcigkKXqquTJNJIZI53F5V8Dajcof2sQI','geeshan','sugith',773419844,'geeshan@gmail.com',NULL);
/*!40000 ALTER TABLE `financeandorder_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hr_manager`
--

LOCK TABLES `hr_manager` WRITE;
/*!40000 ALTER TABLE `hr_manager` DISABLE KEYS */;
INSERT INTO `hr_manager` VALUES (8,'manujayahr','$argon2id$v=19$m=65536,t=3,p=4$8sGu76mR+tnEaNq6p4nalw$dGE0tU85H3TO4BP8q6X+rKo7Dk10TfNMr90o+SsmwEo','pasindu','manujaya',783764064,'manujaya.22@cse.mrt.ac.lk',NULL);
/*!40000 ALTER TABLE `hr_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (10,1,'Gayathri','$argon2id$v=19$m=65536,t=3,p=4$sNGjM4C+guJTwdjchaArBQ$hm27r9BZPZHOnJlxsGYiwAJWtXDBGvBL+XRzBU/vA5M','gayathri','harshila',783764064,'gayathri@gmail.com',NULL),(12,2,'sm2','$argon2id$v=19$m=65536,t=3,p=4$SuRxyQNK0t8Q8q4xjzPt4g$Lu5HKoq+az4pGFvLhrJsL8m1CosIVryT269Pj7DXmk8','manager1','harshila',783764064,'gayathri@gmail.com',NULL);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ordered_products`
--

LOCK TABLES `ordered_products` WRITE;
/*!40000 ALTER TABLE `ordered_products` DISABLE KEYS */;
INSERT INTO `ordered_products` VALUES (14,1,1,20000),(14,5,1,20000),(14,2,5,48000),(15,5,10,200000),(16,1,3,60000),(16,3,2,26000),(17,5,3,60000),(18,3,4,52000),(18,4,1,10000),(19,3,2,26000),(19,1,2,40000),(20,5,3,60000),(20,2,1,9600),(21,4,1,10000),(21,1,1,20000),(22,1,7,140000),(22,2,8,76800),(23,3,6,78000),(23,4,10,100000),(24,2,6,57600),(24,5,4,80000),(24,1,2,40000),(25,2,6,57600),(25,4,10,100000),(26,1,6,120000),(26,2,4,38400),(26,3,5,65000),(27,1,7,140000),(27,4,3,30000),(28,2,1,9600),(29,3,1,13000),(30,2,1,9600),(31,3,1,13000),(32,5,1,20000),(33,3,1,13000),(34,4,1,10000),(34,1,1,20000),(35,2,1,9600);
/*!40000 ALTER TABLE `ordered_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (14,24,'2024-10-30 15:38:51',88000,'xdtcfbg',7,'2024-11-06',1,2,'sdxfcgvh',8,1,1,17,1,22,1,'2024-10-30 16:26:09'),(15,24,'2024-10-30 16:32:14',200000,'yhfvhm',10,'2024-11-06',2,6,'rfgdhnyg linh,kj lk;jkjnkloi rfgdhnyg linh,kj lk;jkjnkloirfgdhnyg linh,kj lk;jkjnkloirfgdhnyg linh,kj lk;jkjnkloi',8,1,1,17,0,NULL,0,NULL),(16,28,'2024-10-30 20:35:36',86000,'11',5,'2024-11-06',1,1,'Go along Galle road and Come to Pelawatta',9,1,1,20,1,23,1,'2024-10-30 22:10:15'),(17,28,'2024-10-30 20:38:44',60000,'11-2',3,'2024-11-06',1,1,'Go along Galle road and Come to Pelawatta',9,1,1,18,0,NULL,0,NULL),(18,26,'2024-10-30 20:44:41',62000,'12-1',5,'2024-11-06',4,11,'Go along Hambantota road',9,1,0,18,0,NULL,0,NULL),(19,26,'2024-10-30 20:45:18',66000,'12-2',4,'2024-11-06',4,11,'Go along Hambantota road',9,1,0,18,0,NULL,0,NULL),(20,27,'2024-10-30 20:47:18',69600,'13-1',4,'2024-11-06',2,4,'Go along kurunagala road and come to Puttalama',9,1,0,18,0,NULL,0,NULL),(21,27,'2024-10-30 20:48:37',30000,'13-2',2,'2024-11-06',2,4,'Go along Kurunagala road and come to Puttalama',NULL,0,0,NULL,0,NULL,0,NULL),(22,29,'2024-10-30 20:51:16',216800,'14-1',15,'2024-11-06',1,3,'Go along Galle road and near Parliament',9,1,1,18,1,NULL,0,NULL),(23,29,'2024-10-30 20:52:22',178000,'14-2',16,'2024-11-06',1,3,'Go along Galle road and near parliament',NULL,0,0,NULL,0,NULL,0,NULL),(24,30,'2024-10-30 20:55:18',177600,'15-1',12,'2024-11-06',3,8,'Come along Ambalangoda road ',NULL,0,0,NULL,0,NULL,0,NULL),(25,30,'2024-10-30 20:55:57',157600,'15-2',16,'2024-11-06',3,8,'Come along Ambalangoda road ',NULL,0,0,NULL,0,NULL,0,NULL),(26,31,'2024-10-30 20:58:19',223400,'16-1',15,'2024-11-06',5,15,'Come along Kilinochchi road',9,1,0,18,0,NULL,0,NULL),(27,31,'2024-10-30 20:58:58',170000,'16-2',10,'2024-11-06',5,15,'Come along Kilinochchi road',NULL,0,0,NULL,0,NULL,0,NULL),(28,32,'2024-10-30 21:01:07',9600,'17-1',1,'2024-11-06',1,2,'Come along Galle road',NULL,0,0,NULL,0,NULL,0,NULL),(29,32,'2024-10-30 21:01:43',13000,'17-2',1,'2024-11-06',1,2,'Come along Galle road',NULL,0,0,NULL,0,NULL,0,NULL),(30,33,'2024-10-30 21:04:56',9600,'18-1',1,'2024-11-06',6,16,'Come along Polonnaruwa road',NULL,0,0,NULL,0,NULL,0,NULL),(31,33,'2024-10-30 21:05:22',13000,'18-2',1,'2024-11-06',6,16,'Come along Polonnaruwa road',NULL,0,0,NULL,0,NULL,0,NULL),(32,34,'2024-10-30 21:06:48',20000,'19-1',1,'2024-11-06',6,17,'Come to mutur through Thoppigala road',9,1,0,18,0,NULL,0,NULL),(33,34,'2024-10-30 21:07:19',13000,'19-2',1,'2024-11-06',6,17,'Come to mutur through Thoppigala road',NULL,0,0,NULL,0,NULL,0,NULL),(34,35,'2024-10-30 21:08:59',30000,'20-1',2,'2024-11-06',1,1,'Come along Wattala road',9,1,1,24,1,23,0,NULL),(35,35,'2024-10-30 21:09:24',9600,'20-2',1,'2024-11-06',1,1,'Come along Wattala road',NULL,0,0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Hisence UHD TV',20000,100,'/images/product/tv1.png'),(2,'INNOVEX 32 Inch TV',9600,200,'/images/product/tv2.png'),(3,'Abans 42 Inch TV',13000,300,'/images/product/tv3.png'),(4,'Abans 32 Inch HD TV',10000,250,'/images/product/tv4.png'),(5,'Samsung Smart TV',20000,150,'/images/product/tv5.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1,'Wattala','From Colombo Fort,passing Technical Junction, Panchikawatta, along base line road to Sedawatta, along Negambo road to Wattala',10,30),(2,1,'Moratuwa','From Colombo Fort, passing Mount Lavinia and Ratmalana, along Galle Road to Moratuwa',20,60),(3,1,'Maharagama','From Colombo Fort, passing Borella and Narahenpita, along the High Level Road to Maharagama',15,40),(4,2,'Seeduwa','From Negombo, along Negombo Road passing Kurana to reach Seeduwa',11,25),(5,2,'Katana','From Negombo, along Giriulla Road via Koppara Junction and Kandawala to reach Katana',10,20),(6,2,'Kochchikade','From Negombo, via Periyamulla along Puttalama-Colombo main road passing Kattuwa to reach Kochchikade',8,18),(7,3,'Beddegama','From Galle, passing Hapugala and Wakwella to reach Ginimellagaha and then Beddegama',20,40),(8,3,'Hikkaduwa','From Galle, along Galle Road passing Bossa to reach Hikkaduwa',20,40),(9,3,'Koggala','From Galle, along Matara Road via Unawatuna and Thalpe to reach Koggala',22,40),(10,4,'Weligama','From Matara, along Matara Road passing Mirissa to reach Weligama',20,30),(11,4,'Akuressa','From Matara, via Malimbada and Thelijjawila to reach Akuressa',25,40),(12,4,'Dikwella','From Matara, along New Thangalla Road passing Gandara and Pathegama to reach Dikwella',23,40),(13,5,'Tellippalai','From Jaffna, along Eluppayady Junction and Jaffna Kankasanthurai Road passing Chunnakkam to reach Tellippalai',17,30),(14,5,'Vaddukoddai','From Jaffna, via Jayanthan and Karativu Road to reach Vaddukoddai',14,25),(15,5,'Nelliady','From Jaffna, along Nallur and Jaffna Point Pedro Road passing Neervely to reach Nelliady',25,40),(16,6,'Kinniya','From Trincomalee, along Kandy Road and crossing Kinniya Bridge to reach Kinniya',20,35),(17,6,'Mutur','From Trincomalee, via Trincomalee-Muttur Road passing Sampur to reach Mutur',30,50),(18,6,'Kuchchaveli','From Trincomalee, along Pulmoddai Road passing Nilaveli to reach Kuchchaveli',35,55);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Colombo',5),(2,'Negombo',3),(3,'Galle',3),(4,'Matara',3),(5,'Jaffna',4),(6,'Trincomalee',3);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,1,1000,'2024-10-14','08:00:00','2024-10-14','10:00:00'),(2,2,800,'2024-10-15','09:30:00','2024-10-15','11:00:00'),(3,3,1200,'2024-10-16','07:45:00','2024-10-16','09:45:00'),(4,4,500,'2024-10-17','06:00:00','2024-10-17','08:30:00'),(5,5,600,'2024-10-18','05:30:00','2024-10-18','08:30:00'),(6,6,1000,'2024-10-19','07:15:00','2024-10-19','10:15:00');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `train_delivery`
--

LOCK TABLES `train_delivery` WRITE;
/*!40000 ALTER TABLE `train_delivery` DISABLE KEYS */;
INSERT INTO `train_delivery` VALUES (17,1,7,1),(18,1,47,1),(19,4,0,NULL),(20,2,5,1),(21,5,0,NULL),(22,6,0,NULL),(23,2,0,NULL),(24,1,2,1);
/*!40000 ALTER TABLE `train_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (23,1,567890,0),(24,2,1234453,1),(25,1,345345,1);
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `truck_delivery`
--

LOCK TABLES `truck_delivery` WRITE;
/*!40000 ALTER TABLE `truck_delivery` DISABLE KEYS */;
INSERT INTO `truck_delivery` VALUES (22,23,22,20,2,1,'2024-10-30 15:49:01',0),(23,25,25,23,1,1,'2024-10-30 22:06:54',1);
/*!40000 ALTER TABLE `truck_delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 22:59:56
