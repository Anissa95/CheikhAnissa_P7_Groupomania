-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomania
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `authorId` int NOT NULL,
  `postId` int NOT NULL,
  `comment` varchar(2000) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Alex',2,1,'Super!!!!','2021-11-11 15:38:11','2021-11-11 15:38:11'),(2,'Louise',3,1,'Wahh c\'est genial!!!','2021-11-11 15:52:31','2021-11-11 15:52:31'),(3,'anissa',1,2,'C\'est intéressant !!!','2021-11-11 15:59:07','2021-11-11 15:59:07');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(2000) NOT NULL DEFAULT '',
  `imageUrl` varchar(2000) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'Et si vous vous évadez en république dominicaine','anissa','DES SÉJOURS HAUT DE GAMME NÉGOCIÉS PAR VOYAGE PRIVÉ JUSQU\'À -70%','http://localhost:3000/images/RépubliqueDominicaine.png1636644836741.png','2021-11-11 15:33:56','2021-11-11 15:56:13'),(2,2,'OpenClassRooms','Alex','OpenClassrooms est un site web de formation en ligne, créé en 1999 sous le nom de Site du Zéro','http://localhost:3000/images/download.jpg1636645078583.jpg','2021-11-11 15:37:58','2021-11-11 15:50:33'),(3,4,'Pc ','louis','Ordinateur de qualité','http://localhost:3000/images/a573108a-3474-41c6-a192-c94b3ce1aec6.jpg1636646448180.jpg','2021-11-11 16:00:48','2021-11-11 16:00:48');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(250) NOT NULL DEFAULT '',
  `isAdmin` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'anissa','843ff3665b6effe0cedbe23b3d95faad6a6dfbcc6354eb1374c956c295704156','$2b$10$TYH.WuBzDAZHrBvdWPnRU.KDNGcgXCDm.lyN5BDRLUnc.AosZtODW',1,'2021-11-11 15:30:59','2021-11-11 15:30:59'),(2,'Alex','cdd2b8c8921b2fb0be2ee13824e220d00fecebdbe6a108a97c9110212c9cea56','$2b$10$JUieACGv8Ua1LDsPRJroBeLcLQirahkxYWHl8pbZAzRGa17Pdzz/m',0,'2021-11-11 15:36:25','2021-11-11 15:36:25'),(3,'Louise','916d5a9c2e6558757cf813aba2b1d91c09489a260a0d57d5e5f10893e8560c39','$2b$10$XktHw10v.TvfMiaIi3vjPeVCBri2VhxlaBO/DTG3oMD1/1hPv2sye',0,'2021-11-11 15:51:29','2021-11-11 15:51:29');
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

-- Dump completed on 2021-11-11 18:10:07
