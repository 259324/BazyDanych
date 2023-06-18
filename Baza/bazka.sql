CREATE DATABASE  IF NOT EXISTS `uczelnia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uczelnia`;
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
-- Table structure for table `dziekan`
--

DROP TABLE IF EXISTS `dziekan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dziekan` (
  `idDziekan` int NOT NULL,
  `Dizek_userID` int NOT NULL,
  `tytul` int NOT NULL,
  PRIMARY KEY (`idDziekan`),
  KEY `userID_idx` (`Dizek_userID`),
  KEY `Dizek_tytulID_idx` (`tytul`),
  CONSTRAINT `Dizek_tytulID` FOREIGN KEY (`tytul`) REFERENCES `tytuly` (`idTytuly`),
  CONSTRAINT `Dizek_userID` FOREIGN KEY (`Dizek_userID`) REFERENCES `users` (`idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dziekan`
--

LOCK TABLES `dziekan` WRITE;
/*!40000 ALTER TABLE `dziekan` DISABLE KEYS */;
INSERT INTO `dziekan` VALUES (1,1,5);
/*!40000 ALTER TABLE `dziekan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kandydat`
--

DROP TABLE IF EXISTS `kandydat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kandydat` (
  `idKandydat` int NOT NULL,
  `przyjety` tinyint NOT NULL DEFAULT '0',
  `matura` int NOT NULL,
  `Kand_userID` int NOT NULL,
  `Kand_kierID` int NOT NULL,
  PRIMARY KEY (`idKandydat`),
  KEY `Kand_userID_idx` (`Kand_userID`),
  KEY `Kand_kierID_idx` (`Kand_kierID`),
  CONSTRAINT `Kand_kierID` FOREIGN KEY (`Kand_kierID`) REFERENCES `kierunek` (`idKierunek`),
  CONSTRAINT `Kand_userID` FOREIGN KEY (`Kand_userID`) REFERENCES `users` (`idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kandydat`
--

LOCK TABLES `kandydat` WRITE;
/*!40000 ALTER TABLE `kandydat` DISABLE KEYS */;
INSERT INTO `kandydat` VALUES (1,0,85,2,1),(2,1,75,3,2);
/*!40000 ALTER TABLE `kandydat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kierunek`
--

DROP TABLE IF EXISTS `kierunek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kierunek` (
  `idKierunek` int NOT NULL,
  `nazwa` varchar(100) NOT NULL,
  PRIMARY KEY (`idKierunek`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kierunek`
--

LOCK TABLES `kierunek` WRITE;
/*!40000 ALTER TABLE `kierunek` DISABLE KEYS */;
INSERT INTO `kierunek` VALUES (1,'AiR'),(2,'ARR');
/*!40000 ALTER TABLE `kierunek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lekcja`
--

DROP TABLE IF EXISTS `lekcja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lekcja` (
  `idLekcja` int NOT NULL,
  `lekcja_przedmiotID` int NOT NULL,
  `rozpoczecie` datetime NOT NULL,
  `czas_trwania` int NOT NULL,
  `lekcja_kierunekID` int NOT NULL,
  PRIMARY KEY (`idLekcja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lekcja`
--

LOCK TABLES `lekcja` WRITE;
/*!40000 ALTER TABLE `lekcja` DISABLE KEYS */;
INSERT INTO `lekcja` VALUES (1,4,'2023-01-01 07:30:00',45,2),(2,3,'2023-01-01 07:30:00',45,2),(3,2,'2023-01-01 07:30:00',90,1),(4,1,'2023-01-01 07:30:00',90,1);
/*!40000 ALTER TABLE `lekcja` ENABLE KEYS */;
UNLOCK TABLES;

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
  `Oc_wystawilID` int NOT NULL,
  `opis` varchar(100) NOT NULL,
  PRIMARY KEY (`idOcena`),
  KEY `Oc_przedmiotID_idx` (`Oc_przedmiotID`) /*!80000 INVISIBLE */,
  KEY `Oc_studentID_idx` (`Oc_studentID`),
  KEY `Oc_wystawilID_idx` (`Oc_wystawilID`),
  CONSTRAINT `Oc_przedmiotID` FOREIGN KEY (`Oc_przedmiotID`) REFERENCES `przedmiot` (`idPrzedmiot`),
  CONSTRAINT `Oc_studentID` FOREIGN KEY (`Oc_studentID`) REFERENCES `student` (`idStudent`),
  CONSTRAINT `Oc_wystawilID` FOREIGN KEY (`Oc_wystawilID`) REFERENCES `pracownik` (`idPracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocena`
--

LOCK TABLES `ocena` WRITE;
/*!40000 ALTER TABLE `ocena` DISABLE KEYS */;
INSERT INTO `ocena` VALUES (1,2,'2022-02-02',1,1,1,'j'),(2,2.5,'2022-02-02',2,2,1,'j'),(3,3,'2022-02-02',3,3,1,'j'),(4,3.5,'2022-02-02',4,4,1,'j'),(5,4,'2022-02-02',1,5,1,'j'),(6,4.5,'2022-02-02',2,6,1,'j'),(7,5,'2022-02-02',3,7,1,'j'),(8,5.5,'2022-02-02',4,1,1,'j'),(9,2,'2022-02-02',1,2,1,'j'),(10,2.5,'2022-02-02',2,3,1,'j'),(11,3,'2022-02-02',3,4,1,'j'),(12,3.5,'2022-02-02',4,5,1,'j'),(13,4,'2022-02-02',1,6,1,'j'),(14,4.5,'2022-02-02',2,7,1,'j'),(15,5,'2022-02-02',3,1,1,'jj');
/*!40000 ALTER TABLE `ocena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik`
--

DROP TABLE IF EXISTS `pracownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownik` (
  `idPracownik` int NOT NULL,
  `data_zatrudnienia` date NOT NULL,
  `Prac_tytulID` int NOT NULL,
  `Prac_userlID` int NOT NULL,
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

--
-- Table structure for table `przedmiot`
--

DROP TABLE IF EXISTS `przedmiot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `przedmiot` (
  `idPrzedmiot` int NOT NULL,
  `Przed_pracownikID` int NOT NULL,
  `Przed_kierunekID` int NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  PRIMARY KEY (`idPrzedmiot`),
  KEY `Przed_pracownikID_idx` (`Przed_pracownikID`),
  KEY `Przed_kierunekID_idx` (`Przed_kierunekID`),
  CONSTRAINT `Przed_kierunekID` FOREIGN KEY (`Przed_kierunekID`) REFERENCES `kierunek` (`idKierunek`),
  CONSTRAINT `Przed_pracownikID` FOREIGN KEY (`Przed_pracownikID`) REFERENCES `pracownik` (`idPracownik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot`
--

LOCK TABLES `przedmiot` WRITE;
/*!40000 ALTER TABLE `przedmiot` DISABLE KEYS */;
INSERT INTO `przedmiot` VALUES (1,1,1,'SCR'),(2,2,1,'PO'),(3,3,2,'AM'),(4,4,2,'BD');
/*!40000 ALTER TABLE `przedmiot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idStudent` int NOT NULL,
  `Stud_userID` int NOT NULL,
  `Stud_kierunekID` int NOT NULL,
  `semestr` int NOT NULL,
  PRIMARY KEY (`idStudent`),
  KEY `Stud_userID_idx` (`Stud_userID`),
  KEY `Stud_kierunekID_idx` (`Stud_kierunekID`),
  CONSTRAINT `Stud_kierunekID` FOREIGN KEY (`Stud_kierunekID`) REFERENCES `kierunek` (`idKierunek`),
  CONSTRAINT `Stud_userID` FOREIGN KEY (`Stud_userID`) REFERENCES `users` (`idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,9,1,1),(2,10,1,1),(3,11,2,1),(4,12,2,1),(5,13,1,1),(6,14,2,1),(7,15,1,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tytuly`
--

DROP TABLE IF EXISTS `tytuly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tytuly` (
  `idTytuly` int NOT NULL,
  `tytul` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`idTytuly`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tytuly`
--

LOCK TABLES `tytuly` WRITE;
/*!40000 ALTER TABLE `tytuly` DISABLE KEYS */;
INSERT INTO `tytuly` VALUES (0,NULL),(1,'Inż.'),(2,'Mgr inż.'),(3,'Dr inż.'),(4,'Dr hab. inż.'),(5,'Prof. dr hab.');
/*!40000 ALTER TABLE `tytuly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUsers` int NOT NULL,
  `Imie` varchar(45) NOT NULL,
  `Nazwisko` varchar(45) NOT NULL,
  `Login` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tel` int DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `PESEL` float NOT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='każdy użytkownik musi mieć swój rekord w tej tabeli';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Piotr','Gmacki','PiGm','1234',123456789,'pg@mail.pl',24579500000),(2,'Kamil','Gracki','aw1','1234',123456789,'jh@mail.pl',24579500000),(3,'Ania','Smacki','aw2','1234',123456789,'ad@mail.pl',24579500000),(4,'Stefan','Racki','aw3','1234',123456789,'gt@mail.pl',24579500000),(5,'Tymon','Rawcki','aw4','1234',123456789,'aw@mail.pl',24579500000),(6,'Patryk','Glacki','aw5','1234',123456789,'kt@mail.pl',24579500000),(7,'Sebastian','Fracki','aw6','1234',123456789,'kw@mail.pl',24579500000),(8,'Karolina','Placki','aw7','1234',123456789,'jh@mail.pl',24579500000),(9,'Aleksandra','Skrzyna','aw8','1234',123456789,'su@mail.pl',24579500000),(10,'Grzegorz','Mrzyna','aw9','1234',123456789,'ap@mail.pl',24579500000),(11,'Michał','Grzyna','aw10','1234',123456789,'lf@mail.pl',24579500000),(12,'Tymon','Rarzyna','aw11','1234',123456789,'pl@mail.pl',24579500000),(13,'Piotr','Kubski','aw12','1234',123456789,'yh@mail.pl',24579500000),(14,'Julia','Pucki','aw13','1234',123456789,'ka@mail.pl',24579500000),(15,'Monika','Grycki','aw14','1234',123456789,'ll@mail.pl',24579500000);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'uczelnia'
--
/*!50003 DROP FUNCTION IF EXISTS `getImie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getImie`(id INT) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE result VARCHAR(255);
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT Imie INTO result FROM users WHERE idUsers = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getKier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getKier`(id INT) RETURNS int
BEGIN
  DECLARE result int;
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT Kand_kierID INTO result FROM kandydat WHERE Kand_userID = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  END IF;

SELECT Stud_kierunekID INTO result FROM student WHERE Stud_userID = id LIMIT 1;

  IF result IS NOT NULL THEN
    RETURN result;
  else	
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getLogin`(id INT) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE result VARCHAR(255);
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT Login INTO result FROM users WHERE idUsers = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMail`(id INT) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE result VARCHAR(255);
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT Email INTO result FROM users WHERE idUsers = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMatura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMatura`(id INT) RETURNS int
BEGIN
  DECLARE result int;
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT matura INTO result FROM kandydat WHERE Kand_userID = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNazwisko` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNazwisko`(id INT) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE result VARCHAR(255);
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT Nazwisko INTO result FROM users WHERE idUsers = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPass`(id INT) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE result VARCHAR(255);
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT password INTO result FROM users WHERE idUsers = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPESEL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPESEL`(id INT) RETURNS float
BEGIN
  DECLARE result float;
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT PESEL INTO result FROM users WHERE idUsers = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPrzedNazwa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPrzedNazwa`(idParam INT) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE result VARCHAR(255);
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT nazwa INTO result FROM przedmiot WHERE idPrzedmiot = idParam LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN 0; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getStatus`(id INT) RETURNS tinyint(1)
BEGIN
  DECLARE result bool;
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT przyjety INTO result FROM kandydat WHERE idKandydat = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getTel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTel`(id INT) RETURNS int
BEGIN
  DECLARE result VARCHAR(255);
  
  -- Przeszukaj tabelę w poszukiwaniu podanego ID i pobierz dane z wybranej kolumny
  -- LIMIT 1 - ograniczenie do zwrocenia jednego wier
  SELECT tel INTO result FROM users WHERE idUsers = id LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć dane z wybranej kolumny
  IF result IS NOT NULL THEN
    RETURN result;
  ELSE
    RETURN NULL; -- Jeśli nie znaleziono pasującego rekordu, zwróć NULL
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `login`(login_ VARCHAR(255), password_ VARCHAR(255)) RETURNS int
BEGIN
  DECLARE user_id INT;
  
  -- Przeszukaj tabelę w poszukiwaniu pasującego loginu i hasła
  SELECT idUsers INTO user_id FROM users WHERE Login = login_ AND password = password_ LIMIT 1;
  
  -- Jeśli pasujący rekord istnieje, zwróć user_id
  IF user_id IS NOT NULL THEN
    RETURN user_id;
  ELSE
    RETURN 0; -- Jeśli nie znaleziono pasującego rekordu, zwróć 0
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_kandydat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_kandydat`(login varchar(30),pass varchar(30))
    MODIFIES SQL DATA
BEGIN

CREATE USER login@'localhost' IDENTIFIED BY 'pass';

GRANT SELECT ON uczelnia.kierunek TO 'login'@'localhost';
GRANT SELECT ON uczelnia.przedmiot TO 'login'@'localhost';
GRANT SELECT ON uczelnia.pracownik TO 'login'@'localhost';

flush privileges;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-18 20:41:33
