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
-- Table structure for table `mealplan`
--

DROP TABLE IF EXISTS `mealplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mealplan` (
  `MealPlanID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `PlanName` varchar(100) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MealPlanID`),
  KEY `idx_meal_user` (`UserID`),
  CONSTRAINT `fk_user_meal` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mealplan`
--

LOCK TABLES `mealplan` WRITE;
/*!40000 ALTER TABLE `mealplan` DISABLE KEYS */;
INSERT INTO `mealplan` VALUES (1,3514,'productize real-time architectures','2024-11-21 00:01:11'),(2,3116,'seize global info-mediaries','2024-11-21 00:01:11'),(3,2615,'mesh transparent eyeballs','2024-11-21 00:01:11'),(4,1813,'incubate robust channels','2024-11-21 00:01:11'),(5,1970,'streamline 24/365 deliverables','2024-11-21 00:01:11'),(6,1689,'scale dynamic ROI','2024-11-21 00:01:11'),(7,897,'strategize leading-edge deliverables','2024-11-21 00:01:11'),(8,828,'brand 24/7 technologies','2024-11-21 00:01:11'),(9,3324,'integrate collaborative niches','2024-11-21 00:01:11'),(10,2308,'integrate mission-critical e-commerce','2024-11-21 00:01:11'),(11,21,'expedite next-generation functionalities','2024-11-21 00:01:11'),(12,1649,'engage magnetic niches','2024-11-21 00:01:11'),(13,460,'aggregate strategic platforms','2024-11-21 00:01:11'),(14,2929,'optimize visionary methodologies','2024-11-21 00:01:11'),(15,2113,'enhance frictionless info-mediaries','2024-11-21 00:01:11'),(16,2409,'utilize scalable technologies','2024-11-21 00:01:11'),(17,3869,'re-contextualize cross-media experiences','2024-11-21 00:01:11'),(18,2886,'seize cross-platform partnerships','2024-11-21 00:01:11'),(19,2213,'engineer revolutionary e-markets','2024-11-21 00:01:11'),(20,2374,'drive vertical paradigms','2024-11-21 00:01:11'),(21,247,'engineer mission-critical eyeballs','2024-11-21 00:01:11'),(22,1419,'envisioneer front-end ROI','2024-11-21 00:01:11'),(23,2013,'embrace bleeding-edge bandwidth','2024-11-21 00:01:11'),(24,2957,'iterate open-source experiences','2024-11-21 00:01:11'),(25,2558,'unleash world-class supply-chains','2024-11-21 00:01:11'),(26,916,'synergize compelling supply-chains','2024-11-21 00:01:11'),(27,2605,'architect interactive content','2024-11-21 00:01:11'),(28,2746,'strategize user-centric deliverables','2024-11-21 00:01:11'),(29,1450,'empower clicks-and-mortar infrastructures','2024-11-21 00:01:11'),(30,2588,'innovate world-class convergence','2024-11-21 00:01:11'),(31,3330,'optimize intuitive systems','2024-11-21 00:01:11'),(32,2788,'re-contextualize bleeding-edge networks','2024-11-21 00:01:11'),(33,3458,'re-intermediate one-to-one web services','2024-11-21 00:01:11'),(34,2145,'envisioneer bricks-and-clicks metrics','2024-11-21 00:01:11'),(35,3816,'matrix out-of-the-box portals','2024-11-21 00:01:11'),(36,3960,'embrace e-business deliverables','2024-11-21 00:01:11'),(37,1728,'incubate out-of-the-box e-business','2024-11-21 00:01:11'),(38,1611,'exploit impactful web-readiness','2024-11-21 00:01:11'),(39,443,'streamline cutting-edge systems','2024-11-21 00:01:11'),(40,1344,'deploy interactive technologies','2024-11-21 00:01:11'),(41,545,'iterate frictionless schemas','2024-11-21 00:01:11'),(42,451,'incubate ubiquitous bandwidth','2024-11-21 00:01:11'),(43,154,'architect compelling models','2024-11-21 00:01:11'),(44,2687,'leverage compelling systems','2024-11-21 00:01:11'),(45,253,'iterate visionary e-commerce','2024-11-21 00:01:11'),(46,2842,'synergize cross-media niches','2024-11-21 00:01:11'),(47,2539,'re-intermediate visionary initiatives','2024-11-21 00:01:11'),(48,3206,'e-enable enterprise e-services','2024-11-21 00:01:11'),(49,168,'scale killer e-markets','2024-11-21 00:01:12'),(50,2313,'reinvent frictionless technologies','2024-11-21 00:01:12'),(51,1066,'implement visionary vortals','2024-11-21 00:01:12'),(52,1964,'monetize sticky vortals','2024-11-21 00:01:12'),(53,1400,'synthesize integrated mindshare','2024-11-21 00:01:12'),(54,94,'envisioneer synergistic action-items','2024-11-21 00:01:12'),(55,2500,'expedite sticky web-readiness','2024-11-21 00:01:12'),(56,193,'synergize distributed communities','2024-11-21 00:01:12'),(57,871,'leverage wireless networks','2024-11-21 00:01:12'),(58,2624,'generate cutting-edge deliverables','2024-11-21 00:01:12'),(59,1822,'brand customized relationships','2024-11-21 00:01:12'),(60,828,'disintermediate intuitive technologies','2024-11-21 00:01:12'),(61,2955,'deploy extensible interfaces','2024-11-21 00:01:12'),(62,1717,'whiteboard compelling schemas','2024-11-21 00:01:12'),(63,3301,'leverage ubiquitous communities','2024-11-21 00:01:12'),(64,2936,'transition killer info-mediaries','2024-11-21 00:01:12'),(65,1446,'embrace global deliverables','2024-11-21 00:01:12'),(66,2652,'enhance granular e-markets','2024-11-21 00:01:12'),(67,2453,'cultivate magnetic e-business','2024-11-21 00:01:12'),(68,3534,'leverage user-centric schemas','2024-11-21 00:01:12'),(69,3499,'harness turn-key experiences','2024-11-21 00:01:12'),(70,445,'streamline integrated partnerships','2024-11-21 00:01:12'),(71,209,'transition vertical vortals','2024-11-21 00:01:12'),(72,1854,'redefine viral paradigms','2024-11-21 00:01:12'),(73,1536,'target B2C methodologies','2024-11-21 00:01:12'),(74,3353,'matrix bricks-and-clicks action-items','2024-11-21 00:01:12'),(75,2923,'matrix world-class experiences','2024-11-21 00:01:12'),(76,663,'transform rich metrics','2024-11-21 00:01:12'),(77,2748,'brand efficient markets','2024-11-21 00:01:12'),(78,2344,'engage rich solutions','2024-11-21 00:01:12'),(79,436,'morph front-end content','2024-11-21 00:01:12'),(80,897,'enhance dynamic web-readiness','2024-11-21 00:01:12'),(81,3307,'synthesize cutting-edge metrics','2024-11-21 00:01:12'),(82,1498,'strategize bricks-and-clicks models','2024-11-21 00:01:12'),(83,3914,'enable intuitive convergence','2024-11-21 00:01:12'),(84,845,'incentivize integrated e-services','2024-11-21 00:01:12'),(85,2642,'mesh dynamic vortals','2024-11-21 00:01:12'),(86,3536,'iterate 24/365 action-items','2024-11-21 00:01:12'),(87,1094,'e-enable clicks-and-mortar vortals','2024-11-21 00:01:12'),(88,2164,'extend viral channels','2024-11-21 00:01:12'),(89,1821,'redefine wireless e-markets','2024-11-21 00:01:12'),(90,3783,'whiteboard B2C convergence','2024-11-21 00:01:12'),(91,2546,'enable collaborative initiatives','2024-11-21 00:01:12'),(92,1214,'re-intermediate out-of-the-box portals','2024-11-21 00:01:12'),(93,1364,'revolutionize dynamic web services','2024-11-21 00:01:12'),(94,3853,'streamline cross-platform applications','2024-11-21 00:01:12'),(95,1102,'expedite mission-critical infrastructures','2024-11-21 00:01:12'),(96,1441,'engineer bleeding-edge metrics','2024-11-21 00:01:12'),(97,1347,'productize enterprise e-tailers','2024-11-21 00:01:12'),(98,1697,'e-enable integrated mindshare','2024-11-21 00:01:12'),(99,996,'enable magnetic networks','2024-11-21 00:01:12'),(100,3849,'grow user-centric content','2024-11-21 00:01:12');
/*!40000 ALTER TABLE `mealplan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 20:15:52
