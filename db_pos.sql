-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)

--

-- Host: 127.0.0.1    Database: db_pos

-- ------------------------------------------------------

-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!50503 SET NAMES utf8 */

;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */

;

/*!40103 SET TIME_ZONE='+00:00' */

;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */

;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */

;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */

;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */

;

--

-- Table structure for table `categories`

--

DROP TABLE IF EXISTS `categories`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `categories` (
        `id` int NOT NULL AUTO_INCREMENT,
        `name` varchar(255) DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `categories`

--

LOCK TABLES `categories` WRITE;

/*!40000 ALTER TABLE `categories` DISABLE KEYS */

;

INSERT INTO `categories`
VALUES (
        1,
        'Espresso Beverages',
        '2023-02-05 13:25:47',
        '2023-02-05 13:40:00'
    ), (
        2,
        'Brewed Coffee',
        '2023-02-05 13:26:10',
        '2023-02-05 13:40:24'
    ), (
        3,
        'Tea Latte',
        '2023-02-05 13:26:17',
        '2023-02-05 13:40:44'
    );

/*!40000 ALTER TABLE `categories` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `products`

--

DROP TABLE IF EXISTS `products`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `products` (
        `id` int NOT NULL AUTO_INCREMENT,
        `name` varchar(255) DEFAULT NULL,
        `price` int DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `CategoryId` int DEFAULT NULL,
        `image` varchar(255) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `CategoryId` (`CategoryId`),
        CONSTRAINT `Products_CategoryId_foreign_idx` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            CONSTRAINT `products_ibfk_3` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            CONSTRAINT `products_ibfk_4` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            CONSTRAINT `products_ibfk_5` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE
        SET
            NULL ON UPDATE CASCADE,
            CONSTRAINT `products_ibfk_6` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`) ON DELETE
        SET
            NULL ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `products`

--

LOCK TABLES `products` WRITE;

/*!40000 ALTER TABLE `products` DISABLE KEYS */

;

INSERT INTO `products`
VALUES (
        2,
        'Caffe Latte',
        47000,
        '2023-02-05 09:52:52',
        '2023-02-05 09:52:52',
        1,
        'localhost:2000/image/DTGXXtuWbOcFH92mrSKZl.jpeg'
    ), (
        3,
        'Caramel Macchiato',
        45000,
        '2023-02-05 09:54:57',
        '2023-02-05 09:54:57',
        1,
        'localhost:2000/image/7X-uxOEptRoUtosLHbcy7.jpeg'
    ), (
        4,
        'Iced Espresso & Matcha Fusion',
        50000,
        '2023-02-05 09:55:19',
        '2023-02-05 09:55:19',
        1,
        'localhost:2000/image/qrIKIkajIsL44C3BKhWma.jpeg'
    ), (
        5,
        'Espresso Con Panna',
        47000,
        '2023-02-05 09:55:45',
        '2023-02-05 09:55:45',
        1,
        'localhost:2000/image/NyOGgAYOLZfA1HQay4ARd.jpeg'
    ), (
        6,
        'Vanilla Sweet Cream Cold Brew',
        42000,
        '2023-02-05 09:56:09',
        '2023-02-05 09:56:09',
        2,
        'localhost:2000/image/0TIM5fxNr-LGc2Yfj9N6Z.jpeg'
    ), (
        7,
        'Misto',
        40000,
        '2023-02-05 09:56:43',
        '2023-02-05 09:56:43',
        2,
        'localhost:2000/image/26pigKgO9A5Mrk7EPrKm2.jpeg'
    ), (
        8,
        'Freshly Brewed Coffee',
        45000,
        '2023-02-05 09:56:59',
        '2023-02-05 09:56:59',
        2,
        'localhost:2000/image/RgXvLv99o_KdLzoOdlXzo.jpeg'
    ), (
        9,
        'Chai Tea Latte',
        41000,
        '2023-02-05 09:57:20',
        '2023-02-05 09:57:20',
        3,
        'localhost:2000/image/c2gq_jiTO908tDw3zHA2X.jpeg'
    ), (
        10,
        'Earl Grey Tea Latte',
        41000,
        '2023-02-05 09:57:35',
        '2023-02-05 09:57:35',
        3,
        'localhost:2000/image/WBkasCDc4vTYDggyrMEdR.jpeg'
    ), (
        11,
        'Black Tea Latte',
        43000,
        '2023-02-05 09:57:47',
        '2023-02-05 13:59:52',
        3,
        'localhost:2000/image/Q2Ef9Ulql1QvCDKB2C1ms.jpeg'
    );

/*!40000 ALTER TABLE `products` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `sequelizemeta`

--

DROP TABLE IF EXISTS `sequelizemeta`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `sequelizemeta` (
        `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
        PRIMARY KEY (`name`),
        UNIQUE KEY `name` (`name`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `sequelizemeta`

--

LOCK TABLES `sequelizemeta` WRITE;

/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */

;

INSERT INTO `sequelizemeta`
VALUES (
        '20230202130530-create-user.js'
    ), (
        '20230204093154-create-product.js'
    ), (
        '20230204093223-create-category.js'
    );

/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `users`

--

DROP TABLE IF EXISTS `users`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `users` (
        `id` int NOT NULL AUTO_INCREMENT,
        `name` varchar(255) DEFAULT NULL,
        `phone_number` varchar(255) DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `password` varchar(255) DEFAULT NULL,
        `isAdmin` tinyint(1) DEFAULT '0',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `refresh_token` text,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `users`

--

LOCK TABLES `users` WRITE;

/*!40000 ALTER TABLE `users` DISABLE KEYS */

;

INSERT INTO `users`
VALUES (
        1,
        'testest',
        '5849850518',
        'test@gmail.com',
        '$2b$10$e8LUQr8a7x90MlIpsViLjeZVsDqNrhTGPQyxDyMYcXlyBOmag6AQG',
        0,
        '2023-02-02 15:08:24',
        '2023-02-07 02:58:26',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6InRlc3Rlc3QiLCJ1c2VybmFtZSI6InRlc3QxMjMiLCJpc0FkbWluIjpmYWxzZSwiY3JlYXRlZEF0IjoiMjAyMy0wMi0wMlQxNTowODoyNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMy0wMi0wNlQxNDo1OTozMi4wMDBaIiwiaWF0IjoxNjc1NzM4NzA2LCJleHAiOjE2NzU3NDIzMDZ9.97KxoQtWp43X297Djj0fOidhIYQvtlFmm49DM7asEA0'
    ), (
        4,
        'testest',
        '08580394305559',
        'test123@gmail.com',
        '$2b$10$qkprHOjLRy2os9jB5rp2du0CKDevnpnWsVW0hIwhsL/vPYRgPVIlS',
        0,
        '2023-02-03 03:36:07',
        '2023-02-03 03:36:07',
        NULL
    );

/*!40000 ALTER TABLE `users` ENABLE KEYS */

;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */

;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */

;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */

;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */

;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */

;

-- Dump completed on 2023-02-07 11:42:26