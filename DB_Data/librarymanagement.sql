CREATE DATABASE  IF NOT EXISTS `librarymanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `librarymanagement`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: librarymanagement
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `published_date` datetime(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Pragmatic Programmer','Andrew Hunt, David Thomas','978-0201616224','1999-10-20 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31'),(2,'Clean Code','Robert C. Martin','978-0132350884','2008-08-01 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31'),(3,'Design Patterns: Elements of Reusable Object-Oriented Software','Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides','978-0201633610','1994-10-31 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31'),(4,'Refactoring: Improving the Design of Existing Code','Martin Fowler','978-0201485677','1999-07-08 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31'),(5,'Effective Java','Joshua Bloch','978-0134685991','2018-01-06 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31'),(6,'Head First Design Patterns','Eric Freeman, Bert Bates, Kathy Sierra, Elisabeth Robson','978-0596007126','2004-10-25 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31'),(7,'You Don’t Know JS','Kyle Simpson','978-1491904244','2014-12-28 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31'),(8,'The Mythical Man-Month','Frederick P. Brooks Jr.','978-0201835953','1975-01-01 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31'),(9,'Introduction to the Theory of Computation','Michael Sipser','978-1133187790','1996-01-01 00:00:00.000000','2025-05-30 16:00:31','2025-05-30 16:00:31');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-30 16:13:08
