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
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`),
  KEY `comments_ibfk_1` (`authorId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Louise',2,1,'Un bon plan!!!','2021-11-13 09:25:16','2021-11-13 09:25:41'),(2,'Louise',2,2,'C\'est très intéressant!!!!','2021-11-13 09:25:52','2021-11-13 09:25:52'),(3,'Louis',4,1,'Super!!!!','2021-11-13 09:26:54','2021-11-13 09:26:54'),(4,'Louis',4,3,'Génial!!!','2021-11-13 09:27:14','2021-11-13 09:27:14');
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
  `imageUrl` varchar(2000) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'République dominicaine','Anissa','Un hôtel en front de mer, des prestations modernes, de nombreux restaurants.','http://localhost:3000/images/RépubliqueDominicaine.png1636795296016.png','2021-11-13 09:21:36','2021-11-13 09:21:36'),(2,3,'Formation intéressante ','Alex','OpenClassrooms est un site web de formation en ligne, créé en 1999 sous le nom de Site du Zéro.','http://localhost:3000/images/download.jpg1636795391243.jpg','2021-11-13 09:23:11','2021-11-13 09:23:11'),(3,2,'30 activités à  faire avec les enfants quelle que soit la saison','Louise','Jeux, coloriages, bricolages. Ces activitÃ©s pour enfants sont réalisables chez vous en toutes circonstances.','http://localhost:3000/images/coloriage.PNG1636795502865.png','2021-11-13 09:25:02','2021-11-13 09:25:02');
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
INSERT INTO `users` VALUES (1,'Anissa','843ff3665b6effe0cedbe23b3d95faad6a6dfbcc6354eb1374c956c295704156','$2b$10$dO65D1LN2l/HqrMOkIH6.uNsszQA9YErHpSzFdWSV5IXRMUgGRQTG',1,'2021-11-13 09:16:22','2021-11-13 09:16:22'),(2,'Louise','916d5a9c2e6558757cf813aba2b1d91c09489a260a0d57d5e5f10893e8560c39','$2b$10$/6XIpiZrUnzR0Dn0K4bKweewvq0zODh4EbS2yaXVTfxUULo6xOAfm',0,'2021-11-13 09:16:43','2021-11-13 09:16:43'),(3,'Alex','a969e71589db23445e5e7528da78bb84976ffea13e97c3ce6e86bfe9b6490e61','$2b$10$s/zbSzHNurKNrvmELGTxq.UNMr6ZVtL2sRzYCaxo6PONMuVQ4aZYe',0,'2021-11-13 09:17:18','2021-11-13 09:17:18'),(4,'Louis','3fd5b42fe98b16782a3402b72b99317abecdd6134626e6e7efa4754fbb86d88e','$2b$10$a506HFREQW34Fi8.ZurRYO2EFYqJfUmsjbj/TU9sNb8xAZaLnLobO',0,'2021-11-13 09:17:48','2021-11-13 09:17:48');
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

-- Dump completed on 2021-11-13 10:28:06
