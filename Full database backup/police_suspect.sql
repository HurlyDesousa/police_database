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
-- Table structure for table `suspect`
--

DROP TABLE IF EXISTS `suspect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suspect` (
  `suspect_id` int(11) NOT NULL AUTO_INCREMENT,
  `suspect_name` varchar(50) NOT NULL,
  `suspect_surname` varchar(50) NOT NULL,
  `suspect_address_line_1` varchar(50) NOT NULL,
  `suspect_address_line_2` varchar(50) NOT NULL,
  `suspect_contact_info` varchar(50) NOT NULL,
  `stat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`suspect_id`),
  UNIQUE KEY `suspect_contact_info_unique` (`suspect_contact_info`),
  KEY `stat_id` (`stat_id`),
  KEY `suspect_name_suspect_surname_index` (`suspect_name`,`suspect_surname`),
  KEY `suspect_address_line_1_unique` (`suspect_address_line_1`),
  KEY `suspect_address_line_2_unique` (`suspect_address_line_2`),
  CONSTRAINT `suspect_ibfk_1` FOREIGN KEY (`stat_id`) REFERENCES `station` (`stat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspect`
--

LOCK TABLES `suspect` WRITE;
/*!40000 ALTER TABLE `suspect` DISABLE KEYS */;
INSERT INTO `suspect` VALUES (1,'Jerry','Weir','Cleveland','548 Sunny Glen Lane','699706496',1),(2,'Henry','Carpenter','Sisseton','4129 Hartway Street','536639853',2),(3,'John','Mullen','Pittsburgh','2777 Michigan Avenue','357409943',3),(4,'Larry','Putnam','Centralia','2878 Carter Street','715200205',4),(5,'Meade','Jerald','Chicago','3601 Patterson Fork Road','827743971',1),(6,'Bobby','Fuller','Gardena','2099 Doctors Drive','804445218',3);
/*!40000 ALTER TABLE `suspect` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-15 13:13:13
