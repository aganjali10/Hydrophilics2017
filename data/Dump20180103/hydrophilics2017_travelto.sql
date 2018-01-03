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
-- Table structure for table `travelto`
--

DROP TABLE IF EXISTS `travelto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelto` (
  `MemID` varchar(10) NOT NULL DEFAULT '',
  `PlaceName` varchar(50) NOT NULL DEFAULT '',
  `Date` date NOT NULL DEFAULT '0000-00-00',
  `DepartureTime` time DEFAULT NULL,
  `Mode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MemID`,`PlaceName`,`Date`),
  KEY `PlaceName` (`PlaceName`),
  CONSTRAINT `travelto_ibfk_1` FOREIGN KEY (`MemID`) REFERENCES `member` (`MemID`),
  CONSTRAINT `travelto_ibfk_2` FOREIGN KEY (`PlaceName`) REFERENCES `sportsvenue` (`PlaceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelto`
--

LOCK TABLES `travelto` WRITE;
/*!40000 ALTER TABLE `travelto` DISABLE KEYS */;
INSERT INTO `travelto` VALUES ('HO101','DelhiGymkhana','2017-11-21','17:00:00','Taxi103'),('HO101','SaketSportsComp.','2017-11-22','13:00:00','Taxi102'),('HO101','SiriFort','2017-11-20','09:00:00','Taxi101'),('HO101','SiriFort','2017-11-24','09:00:00','Taxi101'),('HO106','SiriFort','2017-11-20','13:00:00','Taxi102'),('HO107','DelhiGymkhana','2017-11-21','09:00:00','Taxi101'),('HO107','JLNSportsComp.','2017-11-23','09:00:00','Taxi101'),('HO107','SaketSportsComp.','2017-11-22','09:00:00','Taxi101'),('HO107','SiriFort','2017-11-24','13:00:00','Taxi102'),('HO113','DelhiGymkhana','2017-11-21','13:00:00','Taxi102'),('HO113','JLNSportsComp.','2017-11-23','13:00:00','Taxi102'),('HO113','SiriFort','2017-11-20','09:00:00','Taxi101'),('HO114','SaketSportsComp.','2017-11-22','17:00:00','Taxi103'),('HO114','SiriFort','2017-11-20','13:00:00','Taxi102'),('HO114','SiriFort','2017-11-24','09:00:00','Taxi101'),('HP102','DelhiGymkhana','2017-11-21','13:00:00','Taxi202'),('HP102','JLNSportsComp.','2017-11-23','09:00:00','Taxi301'),('HP102','SiriFort','2017-11-20','09:00:00','Taxi201'),('HP103','JLNSportsComp.','2017-11-23','09:00:00','Taxi401'),('HP103','SiriFort','2017-11-20','17:00:00','Taxi203'),('HP103','SiriFort','2017-11-24','09:00:00','Taxi501'),('HP104','DelhiGymkhana','2017-11-21','09:00:00','Taxi501'),('HP104','JLNSportsComp.','2017-11-23','13:00:00','Taxi402'),('HP105','JLNSportsComp.','2017-11-23','13:00:00','Taxi502'),('HP105','SaketSportsComp.','2017-11-22','09:00:00','Taxi601'),('HP108','JLNSportsComp.','2017-11-23','17:00:00','Taxi303'),('HP108','SiriFort','2017-11-24','13:00:00','Taxi602'),('HP109','JLNSportsComp.','2017-11-23','17:00:00','Taxi503'),('HP109','SiriFort','2017-11-20','17:00:00','Taxi403'),('HP109','SiriFort','2017-11-24','17:00:00','Taxi603'),('HP110','DelhiGymkhana','2017-11-21','17:00:00','Taxi703'),('HP110','SaketSportsComp.','2017-11-22','13:00:00','Taxi702'),('HP111','SiriFort','2017-11-24','09:00:00','Taxi701'),('HP112','SaketSportsComp.','2017-11-22','17:00:00','Taxi803'),('HP112','SiriFort','2017-11-20','09:00:00','Taxi801'),('HP115','DelhiGymkhana','2017-11-21','09:00:00','Taxi901'),('HP115','SaketSportsComp.','2017-11-22','09:00:00','Taxi1001');
/*!40000 ALTER TABLE `travelto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-03 12:30:50
