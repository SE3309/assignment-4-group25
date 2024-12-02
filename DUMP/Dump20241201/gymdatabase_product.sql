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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int DEFAULT '0',
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `product_chk_1` CHECK ((`Price` >= 0)),
  CONSTRAINT `product_chk_2` CHECK ((`Stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Resistance Bands','Ideal for yoga, Pilates, and stretching exercises.',22.78,1),(2,'Dumbbell Set','Boost your recovery and reduce muscle soreness effectively.',144.36,3),(3,'Weight Bench','Helps you stay hydrated and on top of your fitness goals.',96.69,8),(4,'Fitness Tracker','A must-have for any fitness enthusiast.',69.06,9),(5,'Ankle Weights','Perfect for strength training and muscle building.',179.59,3),(6,'Ankle Weights','Boost your recovery and reduce muscle soreness effectively.',86.76,4),(7,'Exercise Ball','Designed to improve balance, flexibility, and coordination.',77.39,9),(8,'Exercise Ball','Enhance your home gym setup with this essential equipment.',174.26,0),(9,'Yoga Mat','Premium quality, built to last through intense workouts.',10.87,1),(10,'Jump Rope','Boost your recovery and reduce muscle soreness effectively.',122.45,6),(11,'Treadmill','A must-have for any fitness enthusiast.',51.08,2),(12,'Yoga Mat','Premium quality, built to last through intense workouts.',137.05,7),(13,'Treadmill','Enhance your home gym setup with this essential equipment.',47.08,9),(14,'Protein Powder','Perfect for strength training and muscle building.',14.30,6),(15,'Yoga Mat','Helps you stay hydrated and on top of your fitness goals.',134.93,2),(16,'Protein Powder','Compact and easy to store, great for small spaces.',94.13,8),(17,'Resistance Bands','Enhance your home gym setup with this essential equipment.',47.24,3),(18,'Fitness Tracker','A must-have for any fitness enthusiast.',15.96,7),(19,'Water Bottle','Designed to improve balance, flexibility, and coordination.',170.67,7),(20,'Water Bottle','Enhance your home gym setup with this essential equipment.',76.90,6),(21,'Gym Bag','Durable and lightweight for easy portability.',155.62,0),(22,'Gym Bag','Premium quality, built to last through intense workouts.',87.12,7),(23,'Resistance Bands','Enhance your home gym setup with this essential equipment.',112.03,2),(24,'Ankle Weights','Designed to improve balance, flexibility, and coordination.',9.44,8),(25,'Gym Bag','Compact and easy to store, great for small spaces.',85.85,2),(26,'Gym Gloves','Ideal for yoga, Pilates, and stretching exercises.',80.91,6),(27,'Jump Rope','Boost your recovery and reduce muscle soreness effectively.',162.66,6),(28,'Water Bottle','Compact and easy to store, great for small spaces.',96.91,0),(29,'Ankle Weights','Ideal for yoga, Pilates, and stretching exercises.',136.78,4),(30,'Gym Gloves','Perfect for strength training and muscle building.',69.25,1),(31,'Pull-up Bar','Designed to improve balance, flexibility, and coordination.',179.09,6),(32,'Dumbbell Set','Helps you stay hydrated and on top of your fitness goals.',138.40,8),(33,'Jump Rope','Helps you stay hydrated and on top of your fitness goals.',25.36,2),(34,'Yoga Mat','Perfect for strength training and muscle building.',88.05,9),(35,'Gym Bag','Durable and lightweight for easy portability.',103.87,3),(36,'Ankle Weights','Designed to improve balance, flexibility, and coordination.',25.95,1),(37,'Fitness Tracker','Durable and lightweight for easy portability.',109.38,3),(38,'Dumbbell Set','Durable and lightweight for easy portability.',55.01,6),(39,'Weight Bench','Enhance your home gym setup with this essential equipment.',143.95,4),(40,'Protein Powder','A must-have for any fitness enthusiast.',195.37,7),(41,'Weight Bench','A must-have for any fitness enthusiast.',111.51,0),(42,'Resistance Bands','Boost your recovery and reduce muscle soreness effectively.',19.61,0),(43,'Ankle Weights','Boost your recovery and reduce muscle soreness effectively.',177.68,5),(44,'Protein Powder','Perfect for strength training and muscle building.',168.67,9),(45,'Jump Rope','Enhance your home gym setup with this essential equipment.',188.43,8),(46,'Kettlebell','Boost your recovery and reduce muscle soreness effectively.',107.17,4),(47,'Gym Bag','Designed to improve balance, flexibility, and coordination.',172.31,1),(48,'Kettlebell','Helps you stay hydrated and on top of your fitness goals.',163.86,5),(49,'Fitness Tracker','Durable and lightweight for easy portability.',137.89,4),(50,'Foam Roller','Durable and lightweight for easy portability.',160.43,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 20:15:50
