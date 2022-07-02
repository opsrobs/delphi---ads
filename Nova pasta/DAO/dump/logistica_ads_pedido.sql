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
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `numero_pedido` int NOT NULL AUTO_INCREMENT,
  `data_pedido` date NOT NULL,
  `valor` float NOT NULL,
  `status` varchar(15) NOT NULL,
  `cliente_idcliente` int NOT NULL,
  `valor_total` float NOT NULL,
  `valor_frete` float NOT NULL,
  `data_entrega` date DEFAULT NULL,
  `endereco_idEndereco` int NOT NULL,
  `peso_pedido` float NOT NULL,
  `recebedor_idrecebedor` int NOT NULL,
  PRIMARY KEY (`numero_pedido`),
  KEY `fk_pedido_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_pedido_endereco1_idx` (`endereco_idEndereco`),
  KEY `fk_pedido_recebedor1_idx` (`recebedor_idrecebedor`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_pedido_endereco1` FOREIGN KEY (`endereco_idEndereco`) REFERENCES `endereco` (`idEndereco`),
  CONSTRAINT `fk_pedido_recebedor1` FOREIGN KEY (`recebedor_idrecebedor`) REFERENCES `recebedor` (`idrecebedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2022-06-05',564,'APROVADO',1,618,54,'1899-12-30',3,15,1),(2,'2022-05-28',88,'EM ANÁLISE',4,152,64,'1899-12-30',3,65,1),(3,'2022-06-22',152,'EM ANÁLISE',2,176,24,'1899-12-30',3,14,1),(4,'2022-06-22',997,'EM ANÁLISE',1,1012.12,15.12,'1899-12-30',4,5,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-01 21:28:40
