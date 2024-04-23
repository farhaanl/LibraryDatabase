CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Authors` (
  `author_id` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `age` int DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'Jennifer','Rowling',56,'Zimbabwean'),(2,'Scott','Fitzgerald',58,'Liberian'),(3,'John','Green',77,'Czech'),(4,'James','Salinger',34,'Israeli'),(5,'Dan','Brown',18,'Slovak'),(6,'Anne','Frank',99,'Uzbek'),(7,'Veronica','Roth',11,'Honduran'),(8,'George','Orwell',42,'Afghan'),(9,'Mike ','Tyson',55,'United States'),(10,'Warren ','Buffet',92,'Maltese'),(11,'Mike ','Streets',28,'Montenegrin'),(12,'Peter','Griffin',35,'England'),(13,'Sana','Smith',65,'Namibian'),(14,'Mansa','Musa',32,'Zimbabwean'),(15,'Edward','Snowden',45,'Chinese');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Books` (
  `book_id` int NOT NULL,
  `book_name` varchar(500) NOT NULL,
  `ISBN` int NOT NULL,
  `page_length` varchar(45) NOT NULL,
  `publish_date` int NOT NULL,
  `genre_id` int NOT NULL,
  `author_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  KEY `fk_Books_Genre1_idx` (`genre_id`),
  KEY `fk_Books_Authors1_idx` (`author_id`),
  KEY `fk_Books_Publishers1_idx` (`publisher_id`),
  KEY `fk_Books_Type1_idx` (`type_id`),
  CONSTRAINT `fk_Books_Authors1` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`),
  CONSTRAINT `fk_Books_Genre1` FOREIGN KEY (`genre_id`) REFERENCES `Genre` (`genre_id`),
  CONSTRAINT `fk_Books_Publishers1` FOREIGN KEY (`publisher_id`) REFERENCES `Publishers` (`publisher_id`),
  CONSTRAINT `fk_Books_Type1` FOREIGN KEY (`type_id`) REFERENCES `Type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(45) NOT NULL,
  `genre_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Drama','Stories composed in verse or prose, usually for theatrical performance, where conflicts and emotion are expressed through dialogue and action.'),(2,'Action','A story where the protaganist is involved in violence and adventure'),(3,'Fairy Tale','Story about fairies or other magical creatures, usually for children.'),(4,'Fantasy','Fiction with strange or other worldly settings or characters; fiction which invites suspension of reality.'),(5,'Fiction','Narrative literary works whose content is produced by the imagination and is not necessarily based on fact.'),(6,'Historical Fiction','Story with fictional characters and events in a historical setting.'),(7,'Horror','Fiction in which events evoke a feeling of dread in both the characters and the reader.'),(8,'Humor','Fiction full of fun, fancy, and excitement, meant to entertain; but can be contained in all genres'),(9,'Mystery','Fiction dealing with the solution of a crime or the unraveling of secrets.'),(10,'Mythology','Legend or traditional narrative, often based in part on historical events, that reveals human behavior and natural phenomena by its symbolism; often pertaining to the actions of the gods.'),(11,'Poetry','Verse and rhythmic writing with imagery that creates emotional responses.'),(12,'Realistic Fiction','Story that can actually happen and is true to life.'),(13,'Science Fiction','Story based on impact of actual, imagined, or potential science, usually set in the future or on other planets.'),(14,'Short Story','Fiction of such brevity that it supports no subplots.'),(15,'Biography/Autobiography','Narrative of a person\'s life, a true story about a real person.'),(16,'Essay','A short literary composition that reflects the author\'s outlook or point.'),(17,'Nonfiction','Informational text dealing with an actual, real-life subject.');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lending`
--

DROP TABLE IF EXISTS `Lending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lending` (
  `days_lent` int NOT NULL,
  `days_overdue` int NOT NULL,
  `check_out_date` date NOT NULL,
  `date_due` date NOT NULL,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`user_id`),
  KEY `fk_Lending_Users1_idx` (`user_id`),
  CONSTRAINT `fk_Lending_Books` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`),
  CONSTRAINT `fk_Lending_Users1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lending`
--

LOCK TABLES `Lending` WRITE;
/*!40000 ALTER TABLE `Lending` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publishers`
--

DROP TABLE IF EXISTS `Publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Publishers` (
  `publisher_id` int NOT NULL,
  `publisher_name` varchar(45) NOT NULL,
  `publisher_description` varchar(45) DEFAULT NULL,
  `publisher_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publishers`
--

LOCK TABLES `Publishers` WRITE;
/*!40000 ALTER TABLE `Publishers` DISABLE KEYS */;
INSERT INTO `Publishers` VALUES (1,'Scholastic Inc.','Book Company','New York'),(2,'Nimble Books','Scholar Company','Maine'),(3,'Gramercy Books','Grammer','Chicago'),(4,'Del Rey Books','Biography','New York'),(5,'Crown','Novels ','Californa'),(6,'Random House Audio','Good Books','New York'),(7,'Broadway Books','Old novels','New York'),(8,'New York Times','Article ','New York'),(9,'Washington Post','Article ','Washington'),(10,'Get Lit Press','Modern Book','New York'),(11,'Miami Beach Press','Books','Miami'),(12,'Epic Man Journal','Epic Books','Virgina'),(13,'The Dancing Pages','Novels ','New York'),(14,'The Fresh Fit Press','Books','Maryland'),(15,'Case Bounded','Case of History','Texas');
/*!40000 ALTER TABLE `Publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Type`
--

DROP TABLE IF EXISTS `Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Type` (
  `type_id` int NOT NULL,
  `type_name` varchar(45) NOT NULL,
  `type_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Type`
--

LOCK TABLES `Type` WRITE;
/*!40000 ALTER TABLE `Type` DISABLE KEYS */;
INSERT INTO `Type` VALUES (1,'paperback','Paper'),(2,'E-book','Electronic'),(3,'Article','Political');
/*!40000 ALTER TABLE `Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03 19:07:15
