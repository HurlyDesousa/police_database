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
-- Table structure for table `offence`
--

DROP TABLE IF EXISTS `offence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offence` (
  `offence_id` int(11) NOT NULL AUTO_INCREMENT,
  `offence_name` varchar(50) NOT NULL,
  `offence_date` date NOT NULL,
  `offence_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `offence_action_taken` varchar(50) NOT NULL,
  `suspect_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`offence_id`),
  KEY `suspect_id` (`suspect_id`),
  CONSTRAINT `offence_ibfk_1` FOREIGN KEY (`suspect_id`) REFERENCES `suspect` (`suspect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offence`
--

LOCK TABLES `offence` WRITE;
/*!40000 ALTER TABLE `offence` DISABLE KEYS */;
INSERT INTO `offence` VALUES (1,'Homicide','2008-08-04','0000-00-00 00:00:00','Arrest',2),(2,'Parking Fine','2018-04-03','0000-00-00 00:00:00','Fine',4),(3,'Asault','2018-05-02','0000-00-00 00:00:00','Arrest',5),(4,'Fraud‎','2017-06-02','0000-00-00 00:00:00','Fine',4),(5,'Forgery‎','2017-03-08','0000-00-00 00:00:00','Fine',1),(6,'Kidnapping‎','2008-03-07','0000-00-00 00:00:00','Arrest',5),(7,'Smuggling','2006-12-02','0000-00-00 00:00:00','Arrest',3),(8,'Treason','2007-03-01','0000-00-00 00:00:00','Arrest',3),(9,'Speeding Ticket','2001-03-06','0000-00-00 00:00:00','Warrning',6),(10,'Robbery','2015-06-05','0000-00-00 00:00:00','Arrest',6);
/*!40000 ALTER TABLE `offence` ENABLE KEYS */;
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
