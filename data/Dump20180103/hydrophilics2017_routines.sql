CREATE DATABASE  IF NOT EXISTS `hydrophilics2017` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hydrophilics2017`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hydrophilics2017
-- ------------------------------------------------------
-- Server version	5.6.37-log

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
-- Temporary view structure for view `officialfulldetails`
--

DROP TABLE IF EXISTS `officialfulldetails`;
/*!50001 DROP VIEW IF EXISTS `officialfulldetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `officialfulldetails` AS SELECT 
 1 AS `MemID`,
 1 AS `FirstName`,
 1 AS `MiddleName`,
 1 AS `LastName`,
 1 AS `DOB`,
 1 AS `Nationality`,
 1 AS `PlaceName`,
 1 AS `RoomNo`,
 1 AS `Department`,
 1 AS `Salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `accommodationfulldetails`
--

DROP TABLE IF EXISTS `accommodationfulldetails`;
/*!50001 DROP VIEW IF EXISTS `accommodationfulldetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `accommodationfulldetails` AS SELECT 
 1 AS `PlaceName`,
 1 AS `PlotNo`,
 1 AS `StreetName`,
 1 AS `Locality`,
 1 AS `PINCode`,
 1 AS `Capacity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sportspersonfulldetails`
--

DROP TABLE IF EXISTS `sportspersonfulldetails`;
/*!50001 DROP VIEW IF EXISTS `sportspersonfulldetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sportspersonfulldetails` AS SELECT 
 1 AS `MemID`,
 1 AS `FirstName`,
 1 AS `MiddleName`,
 1 AS `LastName`,
 1 AS `DOB`,
 1 AS `Nationality`,
 1 AS `PlaceName`,
 1 AS `RoomNo`,
 1 AS `MedalCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sportsvenuefulldetails`
--

DROP TABLE IF EXISTS `sportsvenuefulldetails`;
/*!50001 DROP VIEW IF EXISTS `sportsvenuefulldetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sportsvenuefulldetails` AS SELECT 
 1 AS `PlaceName`,
 1 AS `PlotNo`,
 1 AS `StreetName`,
 1 AS `Locality`,
 1 AS `PINCode`,
 1 AS `SeatingCapacity`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `officialfulldetails`
--

/*!50001 DROP VIEW IF EXISTS `officialfulldetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `officialfulldetails` AS select `member`.`MemID` AS `MemID`,`member`.`FirstName` AS `FirstName`,`member`.`MiddleName` AS `MiddleName`,`member`.`LastName` AS `LastName`,`member`.`DOB` AS `DOB`,`member`.`Nationality` AS `Nationality`,`member`.`PlaceName` AS `PlaceName`,`member`.`RoomNo` AS `RoomNo`,`official`.`Department` AS `Department`,`official`.`Salary` AS `Salary` from (`member` join `official` on((`member`.`MemID` = `official`.`MemID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `accommodationfulldetails`
--

/*!50001 DROP VIEW IF EXISTS `accommodationfulldetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `accommodationfulldetails` AS select `place`.`PlaceName` AS `PlaceName`,`place`.`PlotNo` AS `PlotNo`,`place`.`StreetName` AS `StreetName`,`place`.`Locality` AS `Locality`,`place`.`PINCode` AS `PINCode`,`accommodation`.`Capacity` AS `Capacity` from (`place` join `accommodation` on((`place`.`PlaceName` = `accommodation`.`PlaceName`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sportspersonfulldetails`
--

/*!50001 DROP VIEW IF EXISTS `sportspersonfulldetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sportspersonfulldetails` AS select `member`.`MemID` AS `MemID`,`member`.`FirstName` AS `FirstName`,`member`.`MiddleName` AS `MiddleName`,`member`.`LastName` AS `LastName`,`member`.`DOB` AS `DOB`,`member`.`Nationality` AS `Nationality`,`member`.`PlaceName` AS `PlaceName`,`member`.`RoomNo` AS `RoomNo`,`sportsperson`.`MedalCount` AS `MedalCount` from (`member` join `sportsperson` on((`member`.`MemID` = `sportsperson`.`MemID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sportsvenuefulldetails`
--

/*!50001 DROP VIEW IF EXISTS `sportsvenuefulldetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sportsvenuefulldetails` AS select `place`.`PlaceName` AS `PlaceName`,`place`.`PlotNo` AS `PlotNo`,`place`.`StreetName` AS `StreetName`,`place`.`Locality` AS `Locality`,`place`.`PINCode` AS `PINCode`,`sportsvenue`.`SeatingCapacity` AS `SeatingCapacity` from (`place` join `sportsvenue` on((`place`.`PlaceName` = `sportsvenue`.`PlaceName`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'hydrophilics2017'
--

--
-- Dumping routines for database 'hydrophilics2017'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-03 12:30:50
