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
-- Table structure for table `workoutplan`
--

DROP TABLE IF EXISTS `workoutplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workoutplan` (
  `WorkoutPlanID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `PlanName` varchar(100) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WorkoutPlanID`),
  KEY `idx_workout_user` (`UserID`),
  CONSTRAINT `fk_user_workout` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workoutplan`
--

LOCK TABLES `workoutplan` WRITE;
/*!40000 ALTER TABLE `workoutplan` DISABLE KEYS */;
INSERT INTO `workoutplan` VALUES (1,3450,'brand innovative bandwidth','2024-11-21 00:28:42'),(2,2407,'aggregate magnetic bandwidth','2024-11-21 00:28:42'),(3,2922,'extend one-to-one solutions','2024-11-21 00:28:42'),(4,2857,'seize wireless e-services','2024-11-21 00:28:42'),(5,1097,'grow dot-com synergies','2024-11-21 00:28:42'),(6,1770,'harness vertical functionalities','2024-11-21 00:28:42'),(7,2125,'implement efficient solutions','2024-11-21 00:28:42'),(8,777,'optimize extensible systems','2024-11-21 00:28:42'),(9,1437,'synthesize viral markets','2024-11-21 00:28:42'),(10,597,'seize 24/7 solutions','2024-11-21 00:28:42'),(11,353,'visualize seamless info-mediaries','2024-11-21 00:28:42'),(12,3973,'utilize turn-key architectures','2024-11-21 00:28:42'),(13,3890,'scale scalable channels','2024-11-21 00:28:42'),(14,848,'leverage intuitive web services','2024-11-21 00:28:42'),(15,1565,'streamline strategic networks','2024-11-21 00:28:42'),(16,1453,'facilitate wireless content','2024-11-21 00:28:42'),(17,2421,'exploit magnetic bandwidth','2024-11-21 00:28:42'),(18,750,'disintermediate enterprise networks','2024-11-21 00:28:42'),(19,2884,'scale open-source platforms','2024-11-21 00:28:42'),(20,2645,'integrate viral niches','2024-11-21 00:28:42'),(21,2349,'streamline value-added eyeballs','2024-11-21 00:28:42'),(22,174,'enable sticky deliverables','2024-11-21 00:28:42'),(23,3096,'transition cross-media supply-chains','2024-11-21 00:28:42'),(24,540,'incentivize dot-com content','2024-11-21 00:28:42'),(25,830,'cultivate 24/365 e-markets','2024-11-21 00:28:42'),(26,2419,'disintermediate robust networks','2024-11-21 00:28:42'),(27,2806,'expedite next-generation e-services','2024-11-21 00:28:42'),(28,2364,'scale cross-media e-markets','2024-11-21 00:28:42'),(29,3015,'generate cross-platform supply-chains','2024-11-21 00:28:42'),(30,3256,'syndicate seamless functionalities','2024-11-21 00:28:42'),(31,3584,'synergize intuitive partnerships','2024-11-21 00:28:42'),(32,254,'visualize turn-key interfaces','2024-11-21 00:28:42'),(33,3659,'generate magnetic synergies','2024-11-21 00:28:42'),(34,2134,'deploy bricks-and-clicks web-readiness','2024-11-21 00:28:42'),(35,981,'extend vertical models','2024-11-21 00:28:42'),(36,3672,'synergize rich convergence','2024-11-21 00:28:42'),(37,2355,'whiteboard bleeding-edge ROI','2024-11-21 00:28:43'),(38,2516,'aggregate mission-critical methodologies','2024-11-21 00:28:43'),(39,729,'embrace ubiquitous bandwidth','2024-11-21 00:28:43'),(40,1795,'scale best-of-breed technologies','2024-11-21 00:28:43'),(41,1118,'integrate dot-com convergence','2024-11-21 00:28:43'),(42,1667,'deploy world-class architectures','2024-11-21 00:28:43'),(43,3214,'mesh e-business relationships','2024-11-21 00:28:43'),(44,1727,'exploit B2C initiatives','2024-11-21 00:28:43'),(45,1953,'transition seamless eyeballs','2024-11-21 00:28:43'),(46,1227,'morph strategic architectures','2024-11-21 00:28:43'),(47,2698,'embrace bleeding-edge communities','2024-11-21 00:28:43'),(48,140,'empower 24/7 portals','2024-11-21 00:28:43'),(49,3057,'embrace one-to-one e-commerce','2024-11-21 00:28:43'),(50,696,'expedite proactive infrastructures','2024-11-21 00:28:43'),(51,3090,'architect efficient interfaces','2024-11-21 00:28:43'),(52,1726,'re-intermediate frictionless synergies','2024-11-21 00:28:43'),(53,1078,'aggregate next-generation supply-chains','2024-11-21 00:28:43'),(54,3458,'re-intermediate sticky relationships','2024-11-21 00:28:43'),(55,2661,'incentivize ubiquitous e-services','2024-11-21 00:28:43'),(56,718,'extend extensible systems','2024-11-21 00:28:43'),(57,151,'cultivate ubiquitous platforms','2024-11-21 00:28:43'),(58,499,'generate synergistic partnerships','2024-11-21 00:28:43'),(59,3386,'disintermediate proactive content','2024-11-21 00:28:43'),(60,3759,'incubate vertical web-readiness','2024-11-21 00:28:43'),(61,3333,'benchmark ubiquitous action-items','2024-11-21 00:28:43'),(62,3206,'innovate distributed users','2024-11-21 00:28:43'),(63,3675,'innovate collaborative synergies','2024-11-21 00:28:43'),(64,2162,'repurpose frictionless architectures','2024-11-21 00:28:43'),(65,2090,'whiteboard innovative networks','2024-11-21 00:28:43'),(66,185,'redefine web-enabled e-business','2024-11-21 00:28:43'),(67,3185,'implement clicks-and-mortar applications','2024-11-21 00:28:43'),(68,1811,'deliver collaborative schemas','2024-11-21 00:28:43'),(69,2485,'transform rich interfaces','2024-11-21 00:28:43'),(70,245,'visualize scalable channels','2024-11-21 00:28:43'),(71,3395,'exploit cross-media initiatives','2024-11-21 00:28:43'),(72,853,'optimize bleeding-edge methodologies','2024-11-21 00:28:43'),(73,1928,'strategize enterprise schemas','2024-11-21 00:28:43'),(74,2487,'maximize B2C bandwidth','2024-11-21 00:28:43'),(75,3294,'re-contextualize killer functionalities','2024-11-21 00:28:43'),(76,2258,'re-intermediate granular partnerships','2024-11-21 00:28:43'),(77,1001,'optimize value-added communities','2024-11-21 00:28:43'),(78,2457,'revolutionize seamless paradigms','2024-11-21 00:28:43'),(79,2207,'monetize world-class action-items','2024-11-21 00:28:43'),(80,3080,'embrace dynamic web services','2024-11-21 00:28:43'),(81,3332,'leverage front-end content','2024-11-21 00:28:43'),(82,3327,'syndicate customized experiences','2024-11-21 00:28:43'),(83,311,'integrate end-to-end communities','2024-11-21 00:28:43'),(84,47,'engage efficient portals','2024-11-21 00:28:43'),(85,1259,'transition cross-platform initiatives','2024-11-21 00:28:43'),(86,1655,'aggregate frictionless supply-chains','2024-11-21 00:28:43'),(87,980,'iterate collaborative metrics','2024-11-21 00:28:43'),(88,292,'incubate clicks-and-mortar functionalities','2024-11-21 00:28:43'),(89,269,'repurpose B2C systems','2024-11-21 00:28:43'),(90,2276,'architect extensible e-tailers','2024-11-21 00:28:43'),(91,401,'harness web-enabled communities','2024-11-21 00:28:43'),(92,341,'transform cross-media paradigms','2024-11-21 00:28:43'),(93,1220,'mesh end-to-end paradigms','2024-11-21 00:28:43'),(94,2715,'engage integrated platforms','2024-11-21 00:28:43'),(95,966,'engage open-source vortals','2024-11-21 00:28:43'),(96,2313,'target integrated technologies','2024-11-21 00:28:43'),(97,682,'repurpose web-enabled solutions','2024-11-21 00:28:43'),(98,173,'orchestrate proactive solutions','2024-11-21 00:28:43'),(99,312,'drive 24/365 e-business','2024-11-21 00:28:43'),(100,2164,'whiteboard leading-edge synergies','2024-11-21 00:28:43'),(101,926,'Burns, Boyd and Williams Gym Workout Plan','2024-11-22 20:22:24'),(102,1667,'Burns, Boyd and Williams Gym Workout Plan','2024-11-22 20:22:24');
/*!40000 ALTER TABLE `workoutplan` ENABLE KEYS */;
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
