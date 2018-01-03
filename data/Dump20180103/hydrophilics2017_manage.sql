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
-- Table structure for table `manage`
--

DROP TABLE IF EXISTS `manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manage` (
  `MemID` varchar(10) NOT NULL DEFAULT '',
  `EventName` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`MemID`,`EventName`),
  KEY `EventName` (`EventName`),
  CONSTRAINT `manage_ibfk_1` FOREIGN KEY (`MemID`) REFERENCES `official` (`MemID`),
  CONSTRAINT `manage_ibfk_2` FOREIGN KEY (`EventName`) REFERENCES `event` (`EventName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage`
--

LOCK TABLES `manage` WRITE;
/*!40000 ALTER TABLE `manage` DISABLE KEYS */;
INSERT INTO `manage` VALUES ('HO107','Backstroke100m'),('HO113','Backstroke200m'),('HO101','Backstroke400m'),('HO107','Breaststroke100m'),('HO101','Breaststroke200m'),('HO107','Breaststroke400m'),('HO114','Breaststroke400m'),('HO107','Butterfly100m'),('HO107','Butterfly200m'),('HO113','Butterfly200m'),('HO113','Butterfly400m'),('HO101','Freestyle100m'),('HO113','Freestyle100m'),('HO101','Freestyle200m'),('HO106','Freestyle200m'),('HO114','Freestyle200m'),('HO106','Freestyle400m'),('HO114','Freestyle400m'),('HO101','Underwater100m'),('HO114','Underwater100m'),('HO101','Underwater200m'),('HO107','Underwater200m'),('HO107','Underwater400m'),('HO114','Underwater400m');
/*!40000 ALTER TABLE `manage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-03 12:30:49
