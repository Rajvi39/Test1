-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cybercom
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(48) NOT NULL,
  `categoryStatus` tinyint NOT NULL,
  `createdDate` date NOT NULL,
  `isActive` tinyint NOT NULL,
  `updatedDate` date NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `amount` double NOT NULL,
  `oderDate` date NOT NULL,
  `orderStatus` varchar(16) NOT NULL,
  `paymentStatus` varchar(16) NOT NULL,
  `phoneNum` varchar(16) NOT NULL,
  `oderAddressId` int NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userid_idx` (`userId`),
  KEY `orderAddressId_idx` (`oderAddressId`),
  CONSTRAINT `orderAddressId` FOREIGN KEY (`oderAddressId`) REFERENCES `orderaddress` (`id`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderaddress`
--

DROP TABLE IF EXISTS `orderaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personId` int NOT NULL,
  `userAddressId` int NOT NULL,
  `type` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personId_idx` (`personId`),
  KEY `userAddressId_idx` (`userAddressId`),
  CONSTRAINT `personId` FOREIGN KEY (`personId`) REFERENCES `user` (`userId`),
  CONSTRAINT `userAddressId` FOREIGN KEY (`userAddressId`) REFERENCES `useraddresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderaddress`
--

LOCK TABLES `orderaddress` WRITE;
/*!40000 ALTER TABLE `orderaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `categoryId` int NOT NULL,
  `productName` varchar(48) NOT NULL,
  `productQuantity` int NOT NULL,
  `productPrice` double NOT NULL,
  `productWeight` double NOT NULL,
  `productStatus` int NOT NULL,
  `productSku` tinyint NOT NULL,
  `createdDate` date NOT NULL,
  `updatedDate` date NOT NULL,
  `isActive` tinyint NOT NULL,
  `uniqKey` varchar(8) NOT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `productcol_UNIQUE` (`uniqKey`),
  KEY `c_id_idx` (`categoryId`),
  CONSTRAINT `c_id` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(32) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(8) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phoneNum` varchar(16) NOT NULL,
  `isActie` tinyint DEFAULT NULL,
  `password` varchar(16) NOT NULL,
  `lastName` varchar(32) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraddresses`
--

DROP TABLE IF EXISTS `useraddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraddresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `homeNum` varchar(8) NOT NULL,
  `street` varchar(16) NOT NULL,
  `city` varchar(16) NOT NULL,
  `pincode` varchar(16) NOT NULL,
  `state` varchar(16) NOT NULL,
  `country` varchar(16) NOT NULL,
  `isActive` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `userId_idx` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraddresses`
--

LOCK TABLES `useraddresses` WRITE;
/*!40000 ALTER TABLE `useraddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraddresses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-09 15:37:58
