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
-- Table structure for table `participate`
--

DROP TABLE IF EXISTS `participate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participate` (
  `MemID` varchar(10) NOT NULL DEFAULT '',
  `EventName` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`MemID`,`EventName`),
  KEY `EventName` (`EventName`),
  CONSTRAINT `participate_ibfk_1` FOREIGN KEY (`MemID`) REFERENCES `sportsperson` (`MemID`),
  CONSTRAINT `participate_ibfk_2` FOREIGN KEY (`EventName`) REFERENCES `event` (`EventName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participate`
--

LOCK TABLES `participate` WRITE;
/*!40000 ALTER TABLE `participate` DISABLE KEYS */;
INSERT INTO `participate` VALUES ('HP104','Backstroke100m'),('HP115','Backstroke100m'),('HP102','Backstroke200m'),('HP115','Backstroke200m'),('HP104','Backstroke400m'),('HP110','Backstroke400m'),('HP105','Breaststroke100m'),('HP115','Breaststroke100m'),('HP105','Breaststroke200m'),('HP110','Breaststroke200m'),('HP112','Breaststroke400m'),('HP115','Breaststroke400m'),('HP102','Butterfly100m'),('HP103','Butterfly100m'),('HP104','Butterfly200m'),('HP105','Butterfly200m'),('HP108','Butterfly400m'),('HP109','Butterfly400m'),('HP102','Freestyle100m'),('HP112','Freestyle100m'),('HP102','Freestyle200m'),('HP112','Freestyle200m'),('HP103','Freestyle400m'),('HP109','Freestyle400m'),('HP103','Underwater100m'),('HP111','Underwater100m'),('HP108','Underwater200m'),('HP111','Underwater200m'),('HP103','Underwater400m'),('HP109','Underwater400m');
/*!40000 ALTER TABLE `participate` ENABLE KEYS */;
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
