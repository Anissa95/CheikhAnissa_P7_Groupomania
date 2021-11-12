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
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`),
  KEY `userId` (`userId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Alex',3,1,'C\'est très intéressant!!!!','2021-11-12 18:54:36','2021-11-12 18:54:36',NULL),(2,'Louise',2,1,'parfait!!!','2021-11-12 18:56:30','2021-11-12 18:56:30',NULL),(3,'Louise',2,2,'Intéressant !!!','2021-11-12 18:56:55','2021-11-12 18:56:55',NULL),(4,'Anissa',1,3,'Super!!!!','2021-11-12 19:03:02','2021-11-12 19:03:02',NULL);
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
INSERT INTO `posts` VALUES (1,1,'République dominicaine','Anissa','Un hôtel en front de mer, des prestations modernes, de nombreux restaurants...','http://localhost:3000/images/RépubliqueDominicaine.png1636743207986.png','2021-11-12 18:53:28','2021-11-12 18:53:28'),(2,3,'Formation intéressante ','Alex','OpenClassrooms est un site web de formation en ligne, créé en 1999 sous le nom de Site du Zéro.','http://localhost:3000/images/download.jpg1636743350644.jpg','2021-11-12 18:55:50','2021-11-12 18:55:50'),(3,4,'30 activités Ã  faire avec les enfants quelle que soit la saison','Louis','Jeux, coloriages, bricolages. Ces activités pour enfants sont réalisables chez vous en toutes circonstances.https://www.momes.net/les-tops-des-momes/top-des-momes-bricolage-diy/30-activites-a-faire-avec-les-enfants-quelle-que-soit-la-saison-875278','http://localhost:3000/images/coloriage.PNG1636743737336.png','2021-11-12 19:02:17','2021-11-12 19:02:17');
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
INSERT INTO `users` VALUES (1,'Anissa','843ff3665b6effe0cedbe23b3d95faad6a6dfbcc6354eb1374c956c295704156','$2b$10$XK9zqIbU26nIgf.CqJ1nV./lZerValDvKZsCi/Ekxo4eiLmJLs15m',1,'2021-11-12 18:45:09','2021-11-12 18:45:09'),(2,'Louise','916d5a9c2e6558757cf813aba2b1d91c09489a260a0d57d5e5f10893e8560c39','$2b$10$L4139PIMyN3l5FurIxrtlueUkkfXaZhEk6bJnwr2746z5pTC0eF9.',0,'2021-11-12 18:45:40','2021-11-12 18:45:40'),(3,'Alex','a969e71589db23445e5e7528da78bb84976ffea13e97c3ce6e86bfe9b6490e61','$2b$10$L3BQHXGVRGtewa87Q.aGwe8DicOFKoucO9IPeGtJNV7Vyxyp9pViG',0,'2021-11-12 18:46:02','2021-11-12 18:46:02'),(4,'Louis','3fd5b42fe98b16782a3402b72b99317abecdd6134626e6e7efa4754fbb86d88e','$2b$10$AeVZzy.W2.v/B6MkMopkGucsbgj3coqcLaUKYfu1L2Bvn.XJbqLsO',0,'2021-11-12 18:48:19','2021-11-12 18:48:19');
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

-- Dump completed on 2021-11-12 20:04:31
