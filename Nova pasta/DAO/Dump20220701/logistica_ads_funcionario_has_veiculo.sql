-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: logistica_ads
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `funcionario_has_veiculo`
--

DROP TABLE IF EXISTS `funcionario_has_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_has_veiculo` (
  `idFuncionarioVeiculo` int NOT NULL AUTO_INCREMENT,
  `veiculo_idveiculos` int NOT NULL,
  `funcionario_idfuncionario` int NOT NULL,
  PRIMARY KEY (`idFuncionarioVeiculo`,`veiculo_idveiculos`,`funcionario_idfuncionario`),
  KEY `fk_funcionario_has_veiculo_veiculo1_idx` (`veiculo_idveiculos`),
  KEY `fk_funcionario_has_veiculo_funcionario1_idx` (`funcionario_idfuncionario`),
  CONSTRAINT `fk_funcionario_has_veiculo_funcionario1` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `fk_funcionario_has_veiculo_veiculo1` FOREIGN KEY (`veiculo_idveiculos`) REFERENCES `veiculo` (`idveiculos`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_has_veiculo`
--

LOCK TABLES `funcionario_has_veiculo` WRITE;
/*!40000 ALTER TABLE `funcionario_has_veiculo` DISABLE KEYS */;
INSERT INTO `funcionario_has_veiculo` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(13,1,1),(14,1,1),(15,1,1),(17,1,1),(18,1,1),(21,1,1),(22,1,1),(23,1,1),(24,1,1),(25,1,1),(26,1,1),(33,1,1),(39,1,1),(43,1,1),(50,1,1),(7,2,1),(11,2,1),(12,2,1),(16,2,1),(19,2,1),(20,2,1),(27,2,1),(28,2,1),(29,2,1),(30,2,1),(31,2,1),(32,2,1),(34,2,1),(35,2,1),(36,2,1),(37,2,1),(38,2,1),(40,2,1),(41,2,1),(42,2,1),(45,2,1),(46,2,1),(47,2,1),(48,2,1),(49,2,1);
/*!40000 ALTER TABLE `funcionario_has_veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-01 20:59:39
