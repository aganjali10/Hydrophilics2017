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
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `MiddleName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `Academy` varchar(50) DEFAULT NULL,
  `MemID` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`FirstName`,`MiddleName`,`LastName`,`MemID`),
  KEY `MemID` (`MemID`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`MemID`) REFERENCES `sportsperson` (`MemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES ('David','NULL','Schwimmer','USASports','HP102'),('Jacquin','NULL','Hagar','SLDives','HP104'),('Jean','NULL','Claude','LecoleNatation','HP109'),('Matthew','NULL','Perry','CanadianSportsAcademy','HP110'),('Mohommad','NULL','Rashid','PakGamesFederation','HP105'),('Muktyar','NULL','Ali','SiriFort','HP103'),('Peter','NULL','Higgs','EdinburghGardenClub','HP111'),('Vinod','NULL','Khullar','NationalSportsAcademy','HP108'),('Xin','Won','Yan','ChineseSwimmingAcademy','HP112'),('Yamamoto','NULL','Chi','JapaneseNationalAcademyForSports','HP115');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-03 12:30:48
