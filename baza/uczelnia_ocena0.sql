-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: uczelnia
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `ocena`
--

DROP TABLE IF EXISTS `ocena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocena` (
  `idOcena` int NOT NULL,
  `stopien` float NOT NULL DEFAULT '0',
  `data_wyst` date NOT NULL,
  `Oc_przedmiotID` int NOT NULL,
  `Oc_studentID` int NOT NULL,
  PRIMARY KEY (`idOcena`),
  KEY `Oc_przedmiotID_idx` (`Oc_przedmiotID`),
  KEY `Oc_studentID_idx` (`Oc_studentID`),
  CONSTRAINT `Oc_przedmiotID` FOREIGN KEY (`Oc_przedmiotID`) REFERENCES `przedmiot` (`idPrzedmiot`),
  CONSTRAINT `Oc_studentID` FOREIGN KEY (`Oc_studentID`) REFERENCES `student` (`idStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocena`
--

LOCK TABLES `ocena` WRITE;
/*!40000 ALTER TABLE `ocena` DISABLE KEYS */;
INSERT INTO `ocena` VALUES (1,2,'2022-02-02',1,1),(2,2.5,'2022-02-02',2,2),(3,3,'2022-02-02',3,3),(4,3.5,'2022-02-02',4,4),(5,4,'2022-02-02',1,5),(6,4.5,'2022-02-02',2,6),(7,5,'2022-02-02',3,7),(8,5.5,'2022-02-02',4,1),(9,2,'2022-02-02',1,2),(10,2.5,'2022-02-02',2,3),(11,3,'2022-02-02',3,4),(12,3.5,'2022-02-02',4,5),(13,4,'2022-02-02',1,6),(14,4.5,'2022-02-02',2,7),(15,5,'2022-02-02',3,1);
/*!40000 ALTER TABLE `ocena` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-11 20:52:51
