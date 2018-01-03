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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `MemID` varchar(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Nationality` varchar(50) NOT NULL,
  `PlaceName` varchar(50) NOT NULL,
  `RoomNo` varchar(5) NOT NULL,
  PRIMARY KEY (`MemID`),
  KEY `PlaceName` (`PlaceName`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`PlaceName`) REFERENCES `accommodation` (`PlaceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('HO101','Anant',NULL,'Kakkar','1986-01-27','Indian','AshokaHotel','313'),('HO106','Akshita',NULL,'Agarwal','1985-09-24','Indian','AshokaHotel','314'),('HO107','Karan','Singh','Kataria','1998-03-26','Indian','AshokaHotel','315'),('HO113','Mohit',NULL,'Lamba','1997-12-31','Indian','AshokaHotel','316'),('HO114','Mansi',NULL,'Breja','1992-11-20','Indian','AshokaHotel','317'),('HO116','Anshima',NULL,'Chaudhary','1997-11-01','Indian','AshokaHotel','318'),('HO117','Kavita',NULL,'Maurya','1997-11-02','Indian','AshokaHotel','319'),('HP102','Sarthak',NULL,'Tandon','1998-07-30','American','Shangri-La','201'),('HP103','Ridhima',NULL,'Bansal','1988-01-30','Indian','Shangri-La','202'),('HP104','Anjali',NULL,'Agarwal','1996-12-10','SriLankan','LeMeridien','101'),('HP105','Swapan',NULL,'Asija','1994-10-13','Pakistani','LeMeridien','102'),('HP108','Pranjay',NULL,'Rana','1996-06-11','Nepali','LeMeridien','103'),('HP109','Simran',NULL,'Arora','1997-10-12','France','LeMeridien','104'),('HP110','Akshay',NULL,'Gupta','1998-01-10','Canadian','LeMeridien','105'),('HP111','Chirag',NULL,'Gupta','1995-07-11','English','Shangri-La','203'),('HP112','Rahul',NULL,'Dhiman','1995-02-11','Chinese','Shangri-La','204'),('HP115','Rahmeen',NULL,'Habib','1996-08-19','Japanese','LeMeridien','106');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
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
