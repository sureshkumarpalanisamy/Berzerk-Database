CREATE DATABASE  IF NOT EXISTS `berzerk` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `berzerk`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: Berzerk
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `Entity_Type`
--

DROP TABLE IF EXISTS `Entity_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entity_Type` (
  `EntityTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EntityTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entity_Type`
--

LOCK TABLES `Entity_Type` WRITE;
/*!40000 ALTER TABLE `Entity_Type` DISABLE KEYS */;
INSERT INTO `Entity_Type` VALUES (1,'Bretford',0,'2017-03-31 13:00:01','1','2017-03-31 13:00:01','1'),(2,'Partner',0,'2017-03-31 13:02:07','1','2017-03-31 13:02:07','1'),(3,'Tenant',0,'2017-03-31 13:02:14','1','2017-03-31 13:02:14','1');
/*!40000 ALTER TABLE `Entity_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `License`
--

DROP TABLE IF EXISTS `License`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `License` (
  `LicenseID` int(10) NOT NULL AUTO_INCREMENT,
  `LicenseTypeID` int(10) DEFAULT NULL,
  `LicenseKey` varchar(100) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LicenseID`),
  UNIQUE KEY `LicenseKey_UNIQUE` (`LicenseKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `License`
--

LOCK TABLES `License` WRITE;
/*!40000 ALTER TABLE `License` DISABLE KEYS */;
/*!40000 ALTER TABLE `License` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `License_Type`
--

DROP TABLE IF EXISTS `License_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `License_Type` (
  `LicenseTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `MaxWebUser` int(10) DEFAULT NULL,
  `MaxLockerBay` int(10) DEFAULT NULL,
  `DurationDays` int(10) DEFAULT NULL,
  `ApiAccess` tinyint(1) NOT NULL,
  `Reporting` tinyint(1) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LicenseTypeID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `License_Type`
--

LOCK TABLES `License_Type` WRITE;
/*!40000 ALTER TABLE `License_Type` DISABLE KEYS */;
INSERT INTO `License_Type` VALUES (1,'Diamond',200,2000,730,1,1,0,'2017-03-31 14:01:46','1','2017-03-31 14:01:46','1'),(2,'Gold',100,1000,365,0,0,0,'2017-03-31 14:04:07','1','2017-03-31 14:04:07','1'),(3,'Silver',50,500,90,0,0,0,'2017-03-31 14:04:54','1','2017-03-31 14:04:54','1');
/*!40000 ALTER TABLE `License_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu` (
  `MenuID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ParentMenuID` int(10) DEFAULT NULL,
  `MenuOrder` int(10) NOT NULL,
  `MenuURL` varchar(150) DEFAULT NULL,
  `MenuDescription` varchar(100) DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdateAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization` (
  `OrgID` int(10) NOT NULL AUTO_INCREMENT,
  `EntityTypeID` int(10) NOT NULL,
  `TenantID` varchar(100) DEFAULT NULL,
  `TenantTypeID` int(10) DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `ContactEmail` varchar(30) NOT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zip` int(10) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `IsOrgRoot` tinyint(1) DEFAULT NULL,
  `IsActivate` tinyint(1) NOT NULL DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `ChildOf` int(10) DEFAULT NULL,
  `HierarchyID` int(10) DEFAULT NULL,
  `RootUserID` varchar(100) DEFAULT NULL,
  `APIKey` varchar(100) DEFAULT NULL,
  `ExternalID` varchar(40) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime DEFAULT NULL,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OrgID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
INSERT INTO `Organization` VALUES (1,1,NULL,NULL,'Bretford','ordersupport@bretford.com','800-521-9614','11000 Seymour Avenue','Franklin Park','IL',60131,'USA',1,0,NULL,0,NULL,'58cfd85ebdaeed709e2d22e2',NULL,NULL,NULL,0,'2017-03-31 13:17:33','4acaac37','2017-03-31 13:17:33','4acaac37'),(2,1,'undefined',3,'Duval County Public School District','contact@duvalschools.org','123-654-8790','223 E.Concord Street','Orlando','FL',32801,'USA',1,0,'Active',1,1,'undefined','ACJhSybpW69kBDbvNS3Az9RVOEUb8Z4f96OtiKGQ','Duval123','test',0,'2017-04-05 05:25:40','8KRFfFKia7Tg1','2017-04-05 05:25:40','8KRFfFKia7Tg1');
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization_Dealer_License`
--

DROP TABLE IF EXISTS `Organization_Dealer_License`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization_Dealer_License` (
  `OrgID` int(11) NOT NULL,
  `LicenseID` varchar(45) NOT NULL,
  `DealerID` varchar(45) DEFAULT NULL,
  `ActivatedAt` datetime DEFAULT NULL,
  `ExpiresAt` datetime DEFAULT NULL,
  `IsExpired` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization_Dealer_License`
--

LOCK TABLES `Organization_Dealer_License` WRITE;
/*!40000 ALTER TABLE `Organization_Dealer_License` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organization_Dealer_License` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `TenantID` varchar(100) DEFAULT NULL,
  `PolicyID` varchar(50) DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'DEVOPS',NULL,NULL,0,'2017-03-31 13:08:59','1','2017-03-31 13:08:59','1');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role_Menu`
--

DROP TABLE IF EXISTS `Role_Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role_Menu` (
  `RoleID` int(10) NOT NULL,
  `MenuID` int(10) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role_Menu`
--

LOCK TABLES `Role_Menu` WRITE;
/*!40000 ALTER TABLE `Role_Menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `Role_Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tenant_Hierarchy`
--

DROP TABLE IF EXISTS `Tenant_Hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tenant_Hierarchy` (
  `HierarchyID` int(10) NOT NULL AUTO_INCREMENT,
  `InternalName` varchar(100) NOT NULL,
  `AliasName` varchar(100) DEFAULT NULL,
  `HierarchyOrder` int(10) DEFAULT NULL,
  `TenantID` varchar(100) DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`HierarchyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tenant_Hierarchy`
--

LOCK TABLES `Tenant_Hierarchy` WRITE;
/*!40000 ALTER TABLE `Tenant_Hierarchy` DISABLE KEYS */;
INSERT INTO `Tenant_Hierarchy` VALUES (1,'Organizaion','Site',1,NULL,0,'2017-03-31 13:05:34','1','2017-03-31 13:05:34','1'),(2,'Site','Zone',2,NULL,0,'2017-03-31 13:05:53','1','2017-03-31 13:05:53','1'),(3,'Zone','Sub Zone',3,NULL,0,'2017-03-31 13:06:14','1','2017-03-31 13:06:14','1'),(4,'Group','Block',4,NULL,0,'2017-03-31 13:06:29','1','2017-03-31 13:06:29','1'),(5,'Sub-Group','Locqtion',5,'NULL',0,'2017-04-04 12:56:27','1','2017-04-04 12:56:27','1');
/*!40000 ALTER TABLE `Tenant_Hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tenant_Type`
--

DROP TABLE IF EXISTS `Tenant_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tenant_Type` (
  `TenantTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TenantTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tenant_Type`
--

LOCK TABLES `Tenant_Type` WRITE;
/*!40000 ALTER TABLE `Tenant_Type` DISABLE KEYS */;
INSERT INTO `Tenant_Type` VALUES (1,'School District',0,'2017-03-31 13:23:22','58cfd85ebdaeed709e2d22e2','2017-03-31 13:23:22','58cfd85ebdaeed709e2d22e2'),(2,'Gym',0,'2017-03-31 13:23:50','58cfd85ebdaeed709e2d22e2','2017-03-31 13:23:50','58cfd85ebdaeed709e2d22e2'),(3,'School',0,'2017-03-31 13:24:24','58cfd85ebdaeed709e2d22e2','2017-03-31 13:24:24','58cfd85ebdaeed709e2d22e2');
/*!40000 ALTER TABLE `Tenant_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Web_User`
--

DROP TABLE IF EXISTS `Web_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Web_User` (
  `WebUserID` varchar(100) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `RFID` varchar(100) DEFAULT NULL,
  `PolicyID` varchar(45) DEFAULT NULL,
  `SignedUp` datetime DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `IdentityProvider` varchar(40) NOT NULL,
  `LoginCount` int(10) DEFAULT NULL,
  `IsDeleted` varchar(45) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`WebUserID`),
  UNIQUE KEY `WebUserID_UNIQUE` (`WebUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Web_User`
--

LOCK TABLES `Web_User` WRITE;
/*!40000 ALTER TABLE `Web_User` DISABLE KEYS */;
INSERT INTO `Web_User` VALUES ('58cfd85ebdaeed709e2d22e2','Caleb',NULL,'Durante','cdurante@bretford.com',NULL,NULL,'2017-03-25 11:18:14','2017-03-31 13:28:54','Auth0',1,'0','2017-03-31 13:28:54','4acaac37','2017-03-31 13:28:54','4acaac37');
/*!40000 ALTER TABLE `Web_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Web_User_Org_Role`
--

DROP TABLE IF EXISTS `Web_User_Org_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Web_User_Org_Role` (
  `WebUserID` varchar(100) NOT NULL,
  `OrgID` int(10) NOT NULL,
  `RoleID` int(10) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Web_User_Org_Role`
--

LOCK TABLES `Web_User_Org_Role` WRITE;
/*!40000 ALTER TABLE `Web_User_Org_Role` DISABLE KEYS */;
INSERT INTO `Web_User_Org_Role` VALUES ('58cfd85ebdaeed709e2d22e2',1,1,'2017-03-31 13:10:31','1','2017-03-31 13:10:31','1');
/*!40000 ALTER TABLE `Web_User_Org_Role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-05 11:00:48
