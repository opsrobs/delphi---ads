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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2022-06-05',564,'APROVADO',1,618,54,'1899-12-30',3,15,1),(2,'2022-05-28',88,'APROVADO',4,152,64,'1899-12-30',3,65,1),(3,'2022-06-22',152,'APROVADO',2,176,24,'1899-12-30',3,14,1),(5,'2022-07-02',1250,'APROVADO',2,1465,215,'1899-12-30',2,410,3),(6,'2022-07-03',2550,'APROVADO',1,2680,130,'1899-12-30',13,80,6),(7,'2022-07-03',1899,'APROVADO',4,2024,125,'1899-12-30',6,54,7),(8,'2022-07-03',1540,'APROVADO',1,1597,57,'1899-12-30',5,65,8),(9,'2022-07-03',111,'APROVADO',4,1222,1111,'1899-12-30',6,12,7),(10,'2022-07-20',154,'APROVADO',2,166,12,'1899-12-30',4,32,2),(11,'2022-07-04',645,'APROVADO',1,677,32,'1899-12-30',4,12,2),(12,'2022-07-04',123,'APROVADO',1,135,12,'1899-12-30',13,1,6),(13,'2022-07-04',1544,'APROVADO',2,1570,26,'1899-12-30',5,13,8),(14,'2022-07-04',550,'APROVADO',1,582,32,'1899-12-30',5,54,8),(15,'2022-07-04',56.55,'APROVADO',1,76.55,20,'1899-12-30',6,15,7),(16,'2022-07-04',55.79,'APROVADO',4,68.03,12.24,'1899-12-30',2,16,3),(17,'2022-07-04',154.97,'APROVADO',4,189.97,35,'1899-12-30',14,21,9),(18,'2022-07-04',59,'APROVADO',1,69,10,'1899-12-30',6,3,7),(19,'2022-07-05',648,'APROVADO',3,660.57,12.57,'1899-12-30',15,10,10),(20,'2022-07-05',999.9,'APROVADO',10,1123.9,124,'1899-12-30',15,25,10),(21,'2022-07-06',1020,'EM ANÁLISE',8,1143.9,123.9,'1899-12-30',15,54,10);
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

-- Dump completed on 2022-07-06 19:47:49
