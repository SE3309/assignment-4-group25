-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: gymdatabase
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `EquipmentID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `GymLocationID` int NOT NULL,
  `MaintenanceDate` date DEFAULT NULL,
  PRIMARY KEY (`EquipmentID`),
  KEY `idx_equipment_gym` (`GymLocationID`),
  CONSTRAINT `fk_equipment_gym` FOREIGN KEY (`GymLocationID`) REFERENCES `gymlocation` (`GymLocationID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (2,'CompactRoller',578,'2023-06-07'),(3,'FoldableRoller',1996,'1991-02-21'),(4,'PremiumRoller',126,'2014-06-26'),(5,'FoldableRack',1598,'1982-02-08'),(6,'PortableMachine',1554,'1970-06-18'),(7,'FoldableRack',2032,'2020-01-27'),(8,'PremiumBar',1943,'1978-03-25'),(9,'DurableSet',1058,'2000-09-09'),(10,'PortableBench',791,'1985-02-19'),(11,'AdjustableBar',278,'1983-05-15'),(12,'Heavy-DutyRope',2865,'1980-11-21'),(13,'FoldableBar',1865,'1974-05-02'),(14,'PortableBench',818,'1993-07-11'),(15,'Heavy-DutyRoller',2579,'2013-07-26'),(16,'FoldableMachine',2392,'2013-03-25'),(17,'Heavy-DutyMachine',1913,'1995-04-12'),(18,'FoldableRope',1830,'1980-12-06'),(19,'AdjustableBench',883,'1970-10-14'),(20,'FoldableBench',976,'1974-01-15'),(21,'Heavy-DutyMachine',1599,'2001-11-16'),(22,'AdjustableMachine',2395,'1997-12-04'),(23,'PremiumRoller',1906,'2021-10-25'),(24,'CompactBench',1863,'1973-05-13'),(25,'DurableRope',632,'1975-09-06'),(26,'Heavy-DutyBar',2426,'1995-07-03'),(27,'DurableRope',60,'1972-07-26'),(28,'PremiumRope',2212,'2001-04-07'),(29,'CompactRope',704,'2015-09-10'),(30,'PortableRack',2783,'2022-04-30'),(31,'FoldableRoller',1389,'2014-07-11'),(32,'Heavy-DutyMachine',2314,'2007-11-11'),(33,'AdjustableMachine',392,'1992-11-10'),(34,'DurableRoller',894,'1984-07-20'),(35,'DurableRope',44,'1995-11-06'),(36,'CompactRoller',1107,'2018-02-03'),(37,'PortableMachine',2319,'1982-03-08'),(38,'PortableRope',1221,'1997-11-01'),(39,'CompactBench',833,'2021-02-05'),(40,'CompactSet',1244,'1996-06-05'),(41,'PremiumRope',1537,'2010-04-18'),(42,'PremiumRack',1797,'2005-06-01'),(43,'PortableBench',1258,'1988-03-21'),(44,'PortableRope',115,'1979-11-03'),(45,'PremiumRoller',1656,'2005-04-01'),(46,'DurableRope',1795,'1993-07-12'),(47,'CompactMachine',1659,'1975-10-16'),(48,'PremiumBench',1631,'1988-10-20'),(49,'PremiumRoller',2379,'1970-11-27'),(50,'PremiumSet',47,'1972-06-20'),(51,'CompactRack',611,'2002-03-06'),(52,'AdjustableRoller',1618,'2022-05-30'),(54,'CompactBar',2960,'2022-06-04'),(56,'PremiumMachine',2380,'1987-11-07'),(57,'DurableRoller',1084,'1981-03-18'),(58,'AdjustableRoller',685,'1983-11-07'),(60,'FoldableRack',102,'2017-06-12'),(61,'FoldableBench',84,'1991-12-19'),(62,'PortableSet',1617,'1991-11-14'),(63,'AdjustableBar',356,'1994-10-31'),(64,'CompactRack',328,'2001-07-27'),(65,'AdjustableRack',195,'1993-05-26'),(66,'PortableRope',2670,'1971-09-28'),(67,'FoldableSet',2309,'2016-05-13'),(68,'DurableSet',2704,'2005-10-12'),(69,'AdjustableRoller',196,'1991-05-24'),(70,'DurableMachine',1669,'1995-06-27'),(71,'DurableBench',2302,'1978-11-19'),(72,'DurableBar',2810,'1982-12-15'),(73,'AdjustableRoller',99,'2004-06-27'),(74,'FoldableSet',2994,'2007-12-23'),(75,'DurableSet',371,'1975-03-15'),(76,'FoldableSet',1736,'2016-10-16'),(77,'CompactRack',2340,'2009-01-11'),(78,'AdjustableRoller',376,'1986-08-28'),(79,'Heavy-DutyBench',1164,'1985-01-13'),(80,'AdjustableRack',1342,'1979-07-09'),(81,'DurableRack',902,'1975-02-22'),(82,'CompactSet',1623,'1997-05-14'),(83,'PortableRoller',2967,'1993-03-28'),(84,'CompactRope',2958,'1982-05-31'),(85,'Heavy-DutyRope',4,'2001-12-17'),(86,'FoldableBench',773,'2016-06-26'),(87,'CompactRope',2323,'1997-02-10'),(88,'PortableRoller',1957,'2018-08-01'),(89,'Heavy-DutyBar',1329,'1973-12-02'),(90,'Heavy-DutySet',697,'1990-08-19'),(91,'FoldableBar',1130,'2010-04-27'),(92,'FoldableMachine',1908,'2014-03-11'),(93,'Heavy-DutyMachine',2915,'2010-06-29'),(94,'FoldableBench',2322,'1988-05-08'),(96,'Heavy-DutyBench',2114,'2002-03-02'),(97,'AdjustableMachine',1817,'1973-11-08'),(98,'AdjustableMachine',194,'2023-09-20'),(99,'PremiumBar',29,'1987-10-20'),(100,'DurableBar',2151,'1976-01-04'),(101,'PremiumSet',2403,'2009-02-15'),(102,'PremiumBench',797,'1996-06-28'),(103,'PortableRope',1825,'2014-06-30'),(104,'PremiumRope',1327,'2014-06-21'),(105,'PremiumBench',1435,'1988-12-31'),(106,'DurableBench',224,'2005-11-07'),(107,'AdjustableBench',832,'1981-09-28'),(108,'FoldableSet',2944,'1977-02-05'),(109,'CompactRack',107,'1973-09-27'),(110,'PortableBench',2524,'2006-11-03'),(111,'PortableBench',571,'2014-11-25'),(112,'FoldableRope',1468,'2023-07-11'),(113,'PremiumRack',278,'1989-04-26'),(114,'Heavy-DutyBar',1108,'2010-06-14'),(115,'FoldableBench',816,'1976-03-25'),(116,'PortableBench',1486,'2000-07-14'),(117,'CompactBench',2307,'2020-06-14'),(118,'PremiumMachine',566,'1976-01-28'),(119,'DurableMachine',1891,'2017-11-01'),(120,'Heavy-DutyRoller',1377,'1983-06-23'),(121,'CompactBar',326,'1970-09-02'),(122,'PremiumMachine',1595,'2023-07-24'),(123,'CompactRoller',1730,'1997-06-22'),(124,'PremiumRope',2679,'2013-06-09'),(125,'FoldableBar',2720,'1991-12-02'),(126,'DurableRope',2673,'1995-10-27'),(127,'Heavy-DutyMachine',1580,'2022-08-28'),(129,'PortableSet',1288,'1987-07-28'),(130,'CompactSet',888,'2010-08-21'),(131,'FoldableRack',1858,'2014-02-01'),(132,'Heavy-DutyBar',1326,'2004-07-31'),(133,'CompactBench',2695,'2012-05-05'),(134,'PremiumBar',677,'2016-11-01'),(135,'Heavy-DutyMachine',2890,'2022-08-28'),(136,'CompactRack',2784,'1997-09-29'),(137,'DurableRack',1373,'1992-06-29'),(138,'CompactBench',542,'2011-12-22'),(139,'PortableRoller',1823,'2009-07-22'),(140,'DurableRack',477,'2016-08-14'),(141,'AdjustableBar',1831,'1970-06-21'),(142,'PortableMachine',2004,'2012-02-09'),(143,'AdjustableMachine',5,'1985-11-19'),(144,'PremiumMachine',1728,'2007-10-29'),(145,'FoldableBar',1730,'1983-11-20'),(146,'PremiumRack',735,'2001-12-02'),(147,'AdjustableMachine',1007,'2016-11-15'),(148,'Heavy-DutyBar',2017,'1994-10-22'),(149,'DurableSet',269,'1983-06-16'),(150,'DurableBench',2869,'2000-10-25');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 20:15:51
