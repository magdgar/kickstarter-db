-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 104.155.24.64    Database: kickstarter
-- ------------------------------------------------------
-- Server version	5.7.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `creator` int(11) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `createdOn` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_ID` (`ID`),
  UNIQUE KEY `name` (`name`),
  KEY `creator` (`creator`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (2,'Lorem','Lorem ipsum dolor sit amet, mel ne sanctus patrioque, sea ut novum aliquip, mel accusamus reprehendunt in. Est doctus nominati constituam ei. Pro posidonium assueverit no, sonet sapientem erroribus nec at. Eu has partem quaeque, fastidii suscipiantur cum cu, quo vidit libris ea. Eirmod theophrastus est ut, no sea facer populo, quem odio nominati ei vim. Qui vivendo vulputate at, ut duo dicam utinam.',3,12,'2015-12-08'),(3,'Vix','Vix animal suavitate no. His ex movet invidunt. Fastidii maluisset his et, prima augue timeam nec eu. Vix ne eros nostrum, ius ne vocibus expetenda delicatissimi, vix an harum utinam eruditi. An nonumy sanctus est, ius ex atqui elitr.',2,0,'2015-12-08'),(4,'Voluptua','Voluptua mandamus efficiendi id his. Ex aliquam accusata cotidieque duo, nam adhuc modus impetus at. Esse vivendo dissentiunt ius eu, feugiat principes his an. Est debitis commune percipit eu, nam no aeque dicam propriae, deleniti explicari vis cu.',1,4,'2015-12-08'),(5,'Reque','Reque mnesarchum ne qui. Ut mel viris mnesarchum. Ea option nostrum pericula mea, ad discere eripuit denique qui. Eu mel doctus accusam explicari.',1,0,'2015-12-08'),(10,'Fajny Projekt','Fajny projekt jest bardzo fajny.',1,0,'2015-12-08'),(11,'New','New',1,0,'2015-12-08'),(12,'Nowy Projekt','Opis projektu\nBla la whatever\nKoniec',1,0,'2015-12-08'),(13,':)',':P',1,0,'2015-12-08'),(14,'We did IT!',':D',1,0,'2015-12-08'),(15,'I can see! That\'s great! :)','undefined',1,0,'2015-12-08'),(16,'Show me','go',1,0,'2015-12-08'),(32,'1234','maszeruj? oficery',1,0,'2015-12-08');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `state` varchar(45) NOT NULL DEFAULT 'IN_PROGRESS',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,0,3,2,'2016-01-03 00:00:00','sth'),(2,0,3,2,'2016-01-03 19:25:46','sth'),(3,0,0,0,'2016-01-03 19:26:35','failed'),(4,6,2,0,'2016-01-03 19:27:28','failed'),(5,6,2,0,'2016-01-03 19:32:57','accepted'),(6,6,2,1,'2016-01-03 19:34:04','accepted'),(7,6,2,2,'2016-01-03 19:35:07','failed'),(8,2,15,6,'2016-01-03 19:36:37','failed'),(9,0,0,0,'2016-01-03 19:59:04','failed'),(10,4,1,2,'2016-01-03 19:59:47','accepted'),(11,4,2,2,'2016-01-03 20:27:13','failed'),(12,4,1,2,'2016-01-03 20:27:28','accepted');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '15',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_ID` (`ID`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tomek',5),(2,'magda',1),(3,'maciek',15),(42,'someTestUser',15);
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

-- Dump completed on 2016-01-03 21:38:07
