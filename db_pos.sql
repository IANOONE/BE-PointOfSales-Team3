-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_pos
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Espresso Beverages','2023-02-05 13:25:47','2023-02-05 13:40:00',NULL),(2,'Brewed Coffee','2023-02-05 13:26:10','2023-02-05 13:40:24',NULL),(3,'Tea Latte','2023-02-05 13:26:17','2023-02-05 13:40:44','2023-02-07 07:24:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CategoryId` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CategoryId` (`CategoryId`),
  CONSTRAINT `Products_CategoryId_foreign_idx` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_10` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_11` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_12` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_13` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_14` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_15` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_16` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_17` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_18` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_19` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_20` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_21` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_22` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_23` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_24` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_25` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_26` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_27` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_28` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_29` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_30` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_31` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_32` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_33` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_34` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_35` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_36` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_37` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_38` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_39` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_4` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_40` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_41` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_42` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_43` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_44` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_45` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_46` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_47` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_48` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_49` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_5` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_50` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_51` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_52` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_53` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_54` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_55` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_56` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_6` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_7` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_8` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_9` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Caffe Latte',47000,'2023-02-05 09:52:52','2023-02-05 09:52:52',1,'localhost:2000/image/DTGXXtuWbOcFH92mrSKZl.jpeg','2023-02-07 07:16:15'),(3,'Caramel Macchiato',45000,'2023-02-05 09:54:57','2023-02-05 09:54:57',1,'localhost:2000/image/7X-uxOEptRoUtosLHbcy7.jpeg',NULL),(4,'Iced Espresso & Matcha Fusion',50000,'2023-02-05 09:55:19','2023-02-08 07:20:57',1,'localhost:2000/image/4PsK2lrqEFdkKa7mrezQ4.jpeg',NULL),(5,'Espresso Con Panna',47000,'2023-02-05 09:55:45','2023-02-05 09:55:45',1,'localhost:2000/image/NyOGgAYOLZfA1HQay4ARd.jpeg',NULL),(6,'Vanilla Sweet Cream Cold Brew',42000,'2023-02-05 09:56:09','2023-02-05 09:56:09',2,'localhost:2000/image/0TIM5fxNr-LGc2Yfj9N6Z.jpeg',NULL),(7,'Misto',40000,'2023-02-05 09:56:43','2023-02-05 09:56:43',2,'localhost:2000/image/26pigKgO9A5Mrk7EPrKm2.jpeg',NULL),(8,'Freshly Brewed Coffee',45000,'2023-02-08 09:56:59','2023-02-05 09:56:59',2,'localhost:2000/image/RgXvLv99o_KdLzoOdlXzo.jpeg',NULL),(9,'Chai Tea Latte',41000,'2023-02-09 09:57:20','2023-02-05 09:57:20',3,'localhost:2000/image/c2gq_jiTO908tDw3zHA2X.jpeg','2023-02-07 07:24:49'),(10,'Earl Grey Tea Latte',41000,'2023-02-05 09:57:35','2023-02-05 09:57:35',3,'localhost:2000/image/WBkasCDc4vTYDggyrMEdR.jpeg','2023-02-07 07:24:49'),(11,'Black Tea Latte',43000,'2023-02-05 09:57:47','2023-02-05 13:59:52',3,'localhost:2000/image/Q2Ef9Ulql1QvCDKB2C1ms.jpeg','2023-02-07 07:24:49');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20230202130530-create-user.js'),('20230204093154-create-product.js'),('20230204093223-create-category.js'),('20230209025500-create-transaction-detail.js'),('20230209025507-create-transaction.js'),('20230209032223-create-transactionzzz.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT NULL,
  `sub_total` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `TransactionId` int DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TransactionId` (`TransactionId`),
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`TransactionId`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`TransactionId`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_ibfk_3` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_ibfk_4` FOREIGN KEY (`TransactionId`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_ibfk_5` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_ibfk_6` FOREIGN KEY (`TransactionId`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_ibfk_7` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_ibfk_8` FOREIGN KEY (`TransactionId`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_ibfk_9` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Transaction_details_ProductId_foreign_idx` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Transaction_details_TransactionId_foreign_idx` FOREIGN KEY (`TransactionId`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` VALUES (3,2,94000,'2023-02-09 09:03:54','2023-02-09 09:03:54',5,2,NULL),(4,1,45000,'2023-02-09 09:03:54','2023-02-09 09:03:54',5,3,NULL),(5,2,150000,'2023-02-10 03:13:19','2023-02-10 03:13:19',6,4,NULL),(6,2,90000,'2023-02-10 03:13:19','2023-02-10 03:13:19',6,6,NULL),(7,2,150000,'2023-02-10 03:16:02','2023-02-10 03:16:02',7,4,NULL),(8,2,90000,'2023-02-10 03:16:02','2023-02-10 03:16:02',7,6,NULL),(9,2,150000,'2023-02-10 03:19:07','2023-02-10 03:19:07',8,4,NULL),(10,2,90000,'2023-02-10 03:19:07','2023-02-10 03:19:07',8,6,NULL),(11,2,150000,'2023-02-10 03:22:55','2023-02-10 03:22:55',9,4,NULL),(12,2,90000,'2023-02-10 03:22:55','2023-02-10 03:22:55',9,6,NULL),(13,2,150000,'2023-02-10 03:23:08','2023-02-10 03:23:08',10,4,NULL),(14,2,90000,'2023-02-10 03:23:08','2023-02-10 03:23:08',10,6,NULL),(15,2,150000,'2023-02-10 03:23:26','2023-02-10 03:23:26',11,4,NULL),(16,2,90000,'2023-02-10 03:23:26','2023-02-10 03:23:26',11,6,NULL),(17,2,150000,'2023-02-10 03:25:37','2023-02-10 03:25:37',12,4,NULL),(18,2,90000,'2023-02-10 03:25:37','2023-02-10 03:25:37',12,6,NULL),(19,2,150000,'2023-02-10 03:27:49','2023-02-10 03:27:49',13,4,NULL),(20,2,90000,'2023-02-10 03:27:49','2023-02-10 03:27:49',13,6,NULL),(21,2,150000,'2023-02-10 03:28:32','2023-02-10 03:28:32',14,4,NULL),(22,2,90000,'2023-02-10 03:28:32','2023-02-10 03:28:32',14,6,NULL),(23,2,150000,'2023-02-10 03:30:11','2023-02-10 03:30:11',15,4,NULL),(24,2,90000,'2023-02-10 03:30:11','2023-02-10 03:30:11',15,6,NULL),(25,2,92000,'2023-02-17 10:13:40','2023-02-17 10:13:40',16,5,NULL),(26,2,84000,'2023-02-17 10:13:40','2023-02-17 10:13:40',16,6,NULL),(27,2,92000,'2023-02-17 10:14:42','2023-02-17 10:14:42',17,5,NULL),(28,2,90000,'2023-02-17 10:14:42','2023-02-17 10:14:42',17,3,NULL),(29,2,84000,'2023-02-17 10:14:42','2023-02-17 10:14:42',17,6,NULL),(30,2,92000,'2023-02-17 11:12:51','2023-02-17 11:12:51',18,5,NULL),(31,2,90000,'2023-02-17 11:12:51','2023-02-17 11:12:51',18,3,NULL),(32,2,84000,'2023-02-17 11:12:51','2023-02-17 11:12:51',18,6,NULL);
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_trans` varchar(255) DEFAULT NULL,
  `grand_total` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_5` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_6` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Transactions_UserId_foreign_idx` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'21233241',121213432,'2023-02-09 00:00:00','2023-02-09 00:00:00',1,NULL,'2023-02-09'),(2,'09022023000201',NULL,'2023-02-09 08:48:48','2023-02-09 08:48:48',1,NULL,NULL),(3,'09022023000301',NULL,'2023-02-09 08:49:07','2023-02-09 08:49:07',1,NULL,NULL),(4,'09022023000401',NULL,'2023-02-09 08:59:51','2023-02-09 08:59:51',1,NULL,NULL),(5,'09022023000501',NULL,'2023-02-09 09:03:54','2023-02-09 09:03:54',1,NULL,NULL),(6,'10022023000101',NULL,'2023-02-10 03:13:19','2023-02-10 03:13:19',1,NULL,NULL),(7,'10022023000201',NULL,'2023-02-10 03:16:02','2023-02-10 03:16:02',1,NULL,NULL),(8,'10022023000301',NULL,'2023-02-10 03:19:07','2023-02-10 03:19:07',1,NULL,NULL),(9,'10022023000401',NULL,'2023-02-10 03:22:55','2023-02-10 03:22:55',1,NULL,NULL),(10,'10022023000501',NULL,'2023-02-10 03:23:08','2023-02-10 03:23:08',4,NULL,NULL),(11,'10022023000601',NULL,'2023-02-10 03:23:26','2023-02-10 03:23:26',4,NULL,NULL),(12,'10022023000701',NULL,'2023-02-10 03:25:37','2023-02-10 03:25:37',4,NULL,NULL),(13,'10022023000801',NULL,'2023-02-10 03:27:49','2023-02-10 03:27:49',4,NULL,NULL),(14,'10022023000901',NULL,'2023-02-10 03:28:32','2023-02-10 03:28:32',4,NULL,NULL),(15,'100220230001001',NULL,'2023-02-10 03:30:11','2023-02-10 03:30:11',4,NULL,NULL),(16,'17022023000101',176000,'2023-02-17 10:13:40','2023-02-17 10:13:40',4,NULL,NULL),(17,'17022023000201',266000,'2023-02-17 10:14:42','2023-02-17 10:14:42',4,NULL,NULL),(18,'17022023000305',266000,'2023-02-17 11:12:51','2023-02-17 11:12:51',5,NULL,NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `refresh_token` text,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','5849850518','admin@gmail.com','$2b$10$e8LUQr8a7x90MlIpsViLjeZVsDqNrhTGPQyxDyMYcXlyBOmag6AQG',1,'2023-02-02 15:08:24','2023-02-17 11:26:12','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6InRlc3Rlc3QiLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE2NzY2MzMwNTIsImV4cCI6MTY3NjYzNjY1Mn0.al_E6R9QLvVo1zchWN9W6TwVqQtX4WMOjqelA3-Xfjs',NULL),(4,'testest1','08580394305559','test123@gmail.com','$2b$10$qkprHOjLRy2os9jB5rp2du0CKDevnpnWsVW0hIwhsL/vPYRgPVIlS',0,'2023-02-03 03:36:07','2023-02-03 03:36:07',NULL,'2023-02-07 06:35:55'),(5,'cashier1','0123456789','cashier1@gmail.com','$2b$10$QK8Da5BzC0.KbEHdE4LyOe3EACTyT7.ekPQ0UnvVE21gToPZNIrB2',0,'2023-02-17 11:05:49','2023-02-17 11:23:27','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtZSI6ImNhc2hpZXIxIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTY3NjYzMzAwNywiZXhwIjoxNjc2NjM2NjA3fQ.wC0B_zcnFn79CfQj8jp8n3VzxHByoOrGAJLsfqT8Nfs',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-17 21:40:29
