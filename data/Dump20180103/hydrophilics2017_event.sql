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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `EventName` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Winner` varchar(10) DEFAULT NULL,
  `TicketPrice` float NOT NULL,
  `PlaceName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EventName`),
  KEY `Winner` (`Winner`),
  KEY `PlaceName` (`PlaceName`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`Winner`) REFERENCES `sportsperson` (`MemID`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`PlaceName`) REFERENCES `sportsvenue` (`PlaceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('Backstroke100m','2017-11-21','10:00:00',NULL,999,'DelhiGymkhana'),('Backstroke200m','2017-11-21','14:00:00',NULL,1499,'DelhiGymkhana'),('Backstroke400m','2017-11-21','18:00:00',NULL,2499,'DelhiGymkhana'),('Breaststroke100m','2017-11-22','10:00:00',NULL,999,'SaketSportsComp.'),('Breaststroke200m','2017-11-22','14:00:00',NULL,1499,'SaketSportsComp.'),('Breaststroke400m','2017-11-22','18:00:00',NULL,2499,'SaketSportsComp.'),('Butterfly100m','2017-11-23','10:00:00',NULL,999,'JLNSportsComp.'),('Butterfly200m','2017-11-23','14:00:00',NULL,1499,'JLNSportsComp.'),('Butterfly400m','2017-11-23','18:00:00',NULL,2499,'JLNSportsComp.'),('Freestyle100m','2017-11-20','10:00:00',NULL,999,'SiriFort'),('Freestyle200m','2017-11-20','14:00:00',NULL,1499,'SiriFort'),('Freestyle400m','2017-11-20','18:00:00',NULL,2499,'SiriFort'),('Underwater100m','2017-11-24','10:00:00',NULL,999,'SiriFort'),('Underwater200m','2017-11-24','14:00:00',NULL,1499,'SiriFort'),('Underwater400m','2017-11-24','18:00:00',NULL,2499,'SiriFort');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger UpdateMedalCount after update on Event
for each row
begin
update Sportsperson
set MedalCount=MedalCount+1
where MemID=new.Winner;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-03 12:30:49
