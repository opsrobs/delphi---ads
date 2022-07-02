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
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `idEndereco` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(20) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `numero` int NOT NULL,
  `bairro_idBairro` int NOT NULL,
  `pessoa_idPessoa` int NOT NULL,
  `ativo` tinyint NOT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `fk_endereco_bairro1_idx` (`bairro_idBairro`),
  KEY `fk_endereco_pessoa1_idx` (`pessoa_idPessoa`),
  CONSTRAINT `fk_endereco_bairro1` FOREIGN KEY (`bairro_idBairro`) REFERENCES `bairro` (`idBairro`),
  CONSTRAINT `fk_endereco_pessoa1` FOREIGN KEY (`pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'08090284','Rua 03 de Outubro','',0,1,1,0),(2,'04849529','Rua 13 de Maio','',0,2,2,0),(3,'04843425','Viela 16','',0,3,3,1),(4,'08226021','Rua 18 de Abril','',0,4,4,0),(5,'89057630','Rua Ottilie Tribess','',0,5,13,1),(6,'89057630','Rua Ottilie Tribess','',0,5,14,0),(9,'57010002','Avenida Siqueira Campos','Apartamento',154,7,14,1),(11,'04849529','Rua 13 de Maio','Barraco',585,2,2,1),(12,'57010070','Avenida Assis Chateaubriand','Mito',44,7,4,1),(13,'89057630','Rua Ottilie Tribess','',13254,5,17,1);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-01 20:59:41
