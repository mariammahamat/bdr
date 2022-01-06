-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: fiche_malade
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultation` (
  `id_consult` int unsigned NOT NULL AUTO_INCREMENT,
  `compte_rendu` varchar(255) NOT NULL,
  `date_consult` date NOT NULL,
  `heure_consult` time NOT NULL,
  PRIMARY KEY (`id_consult`),
  KEY `id2` (`id_consult`),
  KEY `tbl_consultation1` (`id_consult`),
  CONSTRAINT `tbl_consultation1` FOREIGN KEY (`id_consult`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_consultation2` FOREIGN KEY (`id_consult`) REFERENCES `medecin` (`id_medecin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation`
--

LOCK TABLES `consultation` WRITE;
/*!40000 ALTER TABLE `consultation` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dossier_medicale`
--

DROP TABLE IF EXISTS `dossier_medicale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dossier_medicale` (
  `id_dossier` int unsigned NOT NULL AUTO_INCREMENT,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id_dossier`),
  KEY `id` (`id_dossier`),
  KEY `tbl_dossier1` (`id_dossier`),
  CONSTRAINT `tbl_dossier1` FOREIGN KEY (`id_dossier`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_dossier2` FOREIGN KEY (`id_dossier`) REFERENCES `consultation` (`id_consult`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_dossier3` FOREIGN KEY (`id_dossier`) REFERENCES `prescription` (`id_prescription`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_dossier4` FOREIGN KEY (`id_dossier`) REFERENCES `fiche_payement` (`id_fiche_payement`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_dossier5` FOREIGN KEY (`id_dossier`) REFERENCES `operation_analyse` (`id_oper_anal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dossier_medicale`
--

LOCK TABLES `dossier_medicale` WRITE;
/*!40000 ALTER TABLE `dossier_medicale` DISABLE KEYS */;
/*!40000 ALTER TABLE `dossier_medicale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiche_payement`
--

DROP TABLE IF EXISTS `fiche_payement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiche_payement` (
  `id_fiche_payement` int unsigned NOT NULL AUTO_INCREMENT,
  `montant_paye` int NOT NULL,
  `date_payement` date NOT NULL,
  PRIMARY KEY (`id_fiche_payement`),
  KEY `id` (`id_fiche_payement`),
  KEY `tbl_fiche_payement` (`id_fiche_payement`),
  CONSTRAINT `tbl_fiche_payement` FOREIGN KEY (`id_fiche_payement`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiche_payement`
--

LOCK TABLES `fiche_payement` WRITE;
/*!40000 ALTER TABLE `fiche_payement` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiche_payement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medecin` (
  `id_medecin` int unsigned NOT NULL AUTO_INCREMENT,
  ` nom` varchar(50) NOT NULL,
  ` prenom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_medecin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medecin`
--

LOCK TABLES `medecin` WRITE;
/*!40000 ALTER TABLE `medecin` DISABLE KEYS */;
/*!40000 ALTER TABLE `medecin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_analyse`
--

DROP TABLE IF EXISTS `operation_analyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation_analyse` (
  `id_oper_anal` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `date_heure` datetime NOT NULL,
  `resultat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_oper_anal`),
  KEY `id` (`id_oper_anal`),
  KEY `tbl_operation_analyse` (`id_oper_anal`),
  CONSTRAINT `tbl_operation_analyse` FOREIGN KEY (`id_oper_anal`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_analyse`
--

LOCK TABLES `operation_analyse` WRITE;
/*!40000 ALTER TABLE `operation_analyse` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_analyse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id_patient` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_patient` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `sexe` varchar(50) NOT NULL,
  PRIMARY KEY (`id_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id_prescription` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  `date_heure` datetime NOT NULL,
  `indication` varchar(255) NOT NULL,
  PRIMARY KEY (`id_prescription`),
  KEY `id` (`id_prescription`),
  KEY `tbl_prescription` (`id_prescription`),
  CONSTRAINT `tbl_prescription1` FOREIGN KEY (`id_prescription`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_prescription2` FOREIGN KEY (`id_prescription`) REFERENCES `consultation` (`id_consult`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-06 14:20:25
