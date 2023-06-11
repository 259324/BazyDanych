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
  `nr. tel` int DEFAULT NULL,
  `e-mail` varchar(80) DEFAULT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-11 20:52:50
