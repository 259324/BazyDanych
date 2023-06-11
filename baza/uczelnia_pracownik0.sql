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
-- Table structure for table `pracownik`
--

DROP TABLE IF EXISTS `pracownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownik` (
  `idPracownik` int NOT NULL,
  `data_zatrudnienia` date DEFAULT NULL,
  `Prac_tytulID` int DEFAULT NULL,
  `Prac_userlID` int DEFAULT NULL,
  PRIMARY KEY (`idPracownik`),
  KEY `Prac_tytulID_idx` (`Prac_tytulID`),
  KEY `Prac_userID_idx` (`Prac_userlID`),
  CONSTRAINT `Prac_tytulID` FOREIGN KEY (`Prac_tytulID`) REFERENCES `tytuly` (`idTytuly`),
  CONSTRAINT `Prac_userID` FOREIGN KEY (`Prac_userlID`) REFERENCES `users` (`idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik`
--

LOCK TABLES `pracownik` WRITE;
/*!40000 ALTER TABLE `pracownik` DISABLE KEYS */;
INSERT INTO `pracownik` VALUES (1,'2023-01-01',4,4),(2,'2023-01-01',3,5),(3,'2023-01-01',2,6),(4,'2023-01-01',3,8);
/*!40000 ALTER TABLE `pracownik` ENABLE KEYS */;
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
