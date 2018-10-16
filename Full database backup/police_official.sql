-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: police
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.10-MariaDB

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
-- Table structure for table `official`
--

DROP TABLE IF EXISTS `official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `official` (
  `official_service_id` int(11) NOT NULL AUTO_INCREMENT,
  `official_name` varchar(50) NOT NULL,
  `official_surname` varchar(50) NOT NULL,
  `official_contact_info` varchar(50) NOT NULL,
  `official_callsign` varchar(50) NOT NULL,
  `official_rank` varchar(50) NOT NULL,
  `stat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`official_service_id`),
  KEY `stat_id` (`stat_id`),
  CONSTRAINT `official_ibfk_1` FOREIGN KEY (`stat_id`) REFERENCES `station` (`stat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official`
--

LOCK TABLES `official` WRITE;
/*!40000 ALTER TABLE `official` DISABLE KEYS */;
INSERT INTO `official` VALUES (1,'Rogelio','Hayes','399913641','JULIET','Special Agent',6),(2,'Mark','Larimore','009094196','KILO','Agent',2),(3,'Levi','Thompson','990709470','LIMA','Probationary Agent',3),(4,'Donald','Brewer','574211551','MIKE','Special Agent',4),(5,'Curtis','Lambert','933108809','NOVEMBER','Supervisory Special Agent',1),(6,'Wayne','Alderman','420597327','OSCAR','Assistant Special Agent in Charge',2),(7,'Shawn','White','062889798','PAPA','Special Agent in Charge',3),(8,'Freddie','Truitt','643904524','QUEBEC','Deputy Director',4),(9,'Charlie','Martin','840396026','ROMEO','Special Agent',1),(10,'Garrett','Painter','702067839','SIERRA','Supervisory Special Agent',5),(11,'William','Miller','751359776','TANGO','Assistant Special Agent in Charge',3),(12,'Mark','Jay','262162772','X-RAY','Special Agent in Charge',1),(13,'William','Murphy','529297066','YANKEE','Deputy Director',6),(14,'Nathaniel','McNeil','124203993','ZULU','Director or Chief',1);
/*!40000 ALTER TABLE `official` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-15 13:13:14
