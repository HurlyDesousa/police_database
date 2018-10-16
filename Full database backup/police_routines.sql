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
-- Temporary view structure for view `vw_officialdetails`
--

DROP TABLE IF EXISTS `vw_officialdetails`;
/*!50001 DROP VIEW IF EXISTS `vw_officialdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_officialdetails` AS SELECT 
 1 AS `Official Name`,
 1 AS `Official Surame`,
 1 AS `Official Contact Info`,
 1 AS `Official Callsign`,
 1 AS `Official Rank`,
 1 AS `Station`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_policestations`
--

DROP TABLE IF EXISTS `vw_policestations`;
/*!50001 DROP VIEW IF EXISTS `vw_policestations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_policestations` AS SELECT 
 1 AS `Station Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_suspectdetails`
--

DROP TABLE IF EXISTS `vw_suspectdetails`;
/*!50001 DROP VIEW IF EXISTS `vw_suspectdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_suspectdetails` AS SELECT 
 1 AS `Suspect Name`,
 1 AS `Suspect Surame`,
 1 AS `Arest`,
 1 AS `Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_officialdetails`
--

/*!50001 DROP VIEW IF EXISTS `vw_officialdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_officialdetails` AS select `official`.`official_name` AS `Official Name`,`official`.`official_surname` AS `Official Surame`,`official`.`official_contact_info` AS `Official Contact Info`,`official`.`official_callsign` AS `Official Callsign`,`official`.`official_rank` AS `Official Rank`,`station`.`stat_name` AS `Station` from (`official` join `station` on((`official`.`stat_id` = `station`.`stat_id`))) order by `official`.`official_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_policestations`
--

/*!50001 DROP VIEW IF EXISTS `vw_policestations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_policestations` AS select `station`.`stat_name` AS `Station Name` from `station` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_suspectdetails`
--

/*!50001 DROP VIEW IF EXISTS `vw_suspectdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_suspectdetails` AS select `suspect`.`suspect_name` AS `Suspect Name`,`suspect`.`suspect_surname` AS `Suspect Surame`,`offence`.`offence_action_taken` AS `Arest`,`offence`.`offence_date` AS `Date` from (`suspect` join `offence` on((`suspect`.`suspect_id` = `offence`.`suspect_id`))) where (`offence`.`offence_date` >= '2007-11-25') having (`offence`.`offence_action_taken` = 'Arrest') order by `offence`.`offence_action_taken` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'police'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-15 13:13:14
