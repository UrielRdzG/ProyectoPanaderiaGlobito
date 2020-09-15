CREATE DATABASE  IF NOT EXISTS `globito` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `globito`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: globito
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `cpan`
--

DROP TABLE IF EXISTS `cpan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpan` (
  `id_cpan` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cpan` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cpan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpan`
--

LOCK TABLES `cpan` WRITE;
/*!40000 ALTER TABLE `cpan` DISABLE KEYS */;
INSERT INTO `cpan` VALUES (1,'Dona'),(2,'Conchas'),(3,'Mantecada'),(4,'Cuernito'),(5,'Oreja');
/*!40000 ALTER TABLE `cpan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csaborpan`
--

DROP TABLE IF EXISTS `csaborpan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csaborpan` (
  `id_csp` int(11) NOT NULL AUTO_INCREMENT,
  `nom_csp` varchar(45) NOT NULL,
  PRIMARY KEY (`id_csp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csaborpan`
--

LOCK TABLES `csaborpan` WRITE;
/*!40000 ALTER TABLE `csaborpan` DISABLE KEYS */;
INSERT INTO `csaborpan` VALUES (1,'Chocolate'),(2,'Vainilla'),(3,'Fresa'),(4,'Chocolate con vainilla'),(5,'Caramelo');
/*!40000 ALTER TABLE `csaborpan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dventa`
--

DROP TABLE IF EXISTS `dventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dventa` (
  `id_dventa` int(11) NOT NULL AUTO_INCREMENT,
  `id_pan` int(11) NOT NULL,
  `cant_dventa` int(11) NOT NULL,
  `subtotal_dventa` float NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_eusu` int(11) NOT NULL,
  PRIMARY KEY (`id_dventa`),
  KEY `fk_DVenta_MPan1_idx` (`id_pan`),
  KEY `fk_DVenta_MVenta1_idx` (`id_venta`),
  KEY `fk_DVenta_EUsuario1_idx` (`id_eusu`),
  CONSTRAINT `fk_DVenta_EUsuario1` FOREIGN KEY (`id_eusu`) REFERENCES `eusuario` (`id_eusu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DVenta_MPan1` FOREIGN KEY (`id_pan`) REFERENCES `mpan` (`id_pan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DVenta_MVenta1` FOREIGN KEY (`id_venta`) REFERENCES `mventa` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dventa`
--

LOCK TABLES `dventa` WRITE;
/*!40000 ALTER TABLE `dventa` DISABLE KEYS */;
INSERT INTO `dventa` VALUES (1,1,3,45,1,6),(2,4,4,52,1,6),(3,7,5,50,1,6),(4,3,10,150,2,3),(5,7,5,50,2,3),(6,10,5,62.5,2,3),(7,2,2,30,3,2),(8,10,1,12.5,3,2),(9,1,3,45,4,6),(10,4,4,52,4,6),(11,10,1,12.5,4,6),(12,8,2,26,4,6),(13,1,12,180,5,7),(14,10,5,62.5,6,3),(15,5,1,14,7,2),(16,2,3,45,7,2),(17,10,2,25,7,2),(18,6,3,33,7,2),(19,2,15,225,8,5),(20,9,10,120,8,5),(21,7,8,80,8,5),(22,4,11,143,8,5),(23,1,11,165,9,4),(24,7,2,20,9,4),(25,8,1,13,10,7),(26,8,2,26,10,7),(27,9,1,12,11,3);
/*!40000 ALTER TABLE `dventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eusuario`
--

DROP TABLE IF EXISTS `eusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eusuario` (
  `id_eusu` int(11) NOT NULL AUTO_INCREMENT,
  `id_usu` int(11) NOT NULL,
  PRIMARY KEY (`id_eusu`),
  KEY `fk_EUsuario_MUsuario1_idx` (`id_usu`),
  CONSTRAINT `fk_EUsuario_MUsuario1` FOREIGN KEY (`id_usu`) REFERENCES `musuario` (`id_usu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eusuario`
--

LOCK TABLES `eusuario` WRITE;
/*!40000 ALTER TABLE `eusuario` DISABLE KEYS */;
INSERT INTO `eusuario` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7);
/*!40000 ALTER TABLE `eusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpan`
--

DROP TABLE IF EXISTS `mpan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mpan` (
  `id_pan` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pan` varchar(45) NOT NULL,
  `pre_pan` float NOT NULL,
  `stock_pan` varchar(45) NOT NULL,
  `id_cpan` int(11) NOT NULL,
  `id_csp` int(11) NOT NULL,
  PRIMARY KEY (`id_pan`),
  KEY `fk_MPan_CPan_idx` (`id_cpan`),
  KEY `fk_MPan_CSaborPan1_idx` (`id_csp`),
  CONSTRAINT `fk_MPan_CPan` FOREIGN KEY (`id_cpan`) REFERENCES `cpan` (`id_cpan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_MPan_CSaborPan` FOREIGN KEY (`id_csp`) REFERENCES `csaborpan` (`id_csp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpan`
--

LOCK TABLES `mpan` WRITE;
/*!40000 ALTER TABLE `mpan` DISABLE KEYS */;
INSERT INTO `mpan` VALUES (1,'Dona de Chocolate',15,'1',1,1),(2,'Dona de Caramelo',15,'5',1,5),(3,'Dona de Fresa',15,'10',1,3),(4,'Mantecada de Chocolate',13,'11',3,1),(5,'Mantecada de Vainilla',14,'24',3,2),(6,'Cuernito',11,'22',4,2),(7,'Oreja',10,'0',5,2),(8,'Concha de Chocolate',13,'16',2,1),(9,'Concha de Vainilla',12,'9',2,2),(10,'Concha de Chocolate con vainilla',12.5,'16',2,4);
/*!40000 ALTER TABLE `mpan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musuario`
--

DROP TABLE IF EXISTS `musuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musuario` (
  `id_usu` int(11) NOT NULL AUTO_INCREMENT,
  `nom_usu` varchar(45) NOT NULL,
  `appat_usu` varchar(45) NOT NULL,
  `user_usu` varchar(45) NOT NULL,
  `pass_usu` varchar(45) NOT NULL,
  `priv_usu` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musuario`
--

LOCK TABLES `musuario` WRITE;
/*!40000 ALTER TABLE `musuario` DISABLE KEYS */;
INSERT INTO `musuario` VALUES (1,'Admin','Admin','Admin','Admin123','1'),(2,'Uriel','Rodriguez','UrielRdz','contra123','0'),(3,'Carlos','Gomez','Charly','contrasena','0'),(4,'Adrian','Carselle','AdriiCC','odisea','0'),(5,'Hania','Diaz','HI DG','taquitos','0'),(6,'Pedro','Rodriguez','PedroR','pedrito123','0'),(7,'Carmen','Garcia','CarG','password','0');
/*!40000 ALTER TABLE `musuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mventa`
--

DROP TABLE IF EXISTS `mventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mventa` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `total_venta` float NOT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mventa`
--

LOCK TABLES `mventa` WRITE;
/*!40000 ALTER TABLE `mventa` DISABLE KEYS */;
INSERT INTO `mventa` VALUES (1,'2020-07-24',147),(2,'2020-08-05',262.5),(3,'2020-08-18',42.5),(4,'2020-08-21',135.5),(5,'2020-09-01',180),(6,'2020-09-09',62.5),(7,'2020-09-10',117),(8,'2020-09-12',568),(9,'2020-09-15',185),(10,'2020-09-15',39),(11,'2020-09-15',12);
/*!40000 ALTER TABLE `mventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-15 13:09:42
