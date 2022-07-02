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
-- Temporary view structure for view `getdadospessoafisica`
--

DROP TABLE IF EXISTS `getdadospessoafisica`;
/*!50001 DROP VIEW IF EXISTS `getdadospessoafisica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getdadospessoafisica` AS SELECT 
 1 AS `Nome`,
 1 AS `CPF`,
 1 AS `Contato`,
 1 AS `Situacao`,
 1 AS `CEP`,
 1 AS `Complemento`,
 1 AS `Numero`,
 1 AS `Bairro`,
 1 AS `Cidade`,
 1 AS `Estado`,
 1 AS `UF`,
 1 AS `Rua`,
 1 AS `pessoa_idPessoa`,
 1 AS `idEndereco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dados_refatorado`
--

DROP TABLE IF EXISTS `dados_refatorado`;
/*!50001 DROP VIEW IF EXISTS `dados_refatorado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dados_refatorado` AS SELECT 
 1 AS `NOME`,
 1 AS `CPF`,
 1 AS `CONTATO`,
 1 AS `SITUACAO`,
 1 AS `CEP`,
 1 AS `Complemento`,
 1 AS `Numero`,
 1 AS `Bairro`,
 1 AS `Cidade`,
 1 AS `Estado`,
 1 AS `UF`,
 1 AS `Rua`,
 1 AS `pessoa_idPessoa`,
 1 AS `idEndereco`,
 1 AS `situacao_endereco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dados_pedido_corrigido`
--

DROP TABLE IF EXISTS `dados_pedido_corrigido`;
/*!50001 DROP VIEW IF EXISTS `dados_pedido_corrigido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dados_pedido_corrigido` AS SELECT 
 1 AS `numero_pedido`,
 1 AS `nome`,
 1 AS `data_pedido`,
 1 AS `status`,
 1 AS `idrecebedor`,
 1 AS `nome recebedor`,
 1 AS `peso_pedido`,
 1 AS `valor_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `getdadospedido`
--

DROP TABLE IF EXISTS `getdadospedido`;
/*!50001 DROP VIEW IF EXISTS `getdadospedido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getdadospedido` AS SELECT 
 1 AS `numero_pedido`,
 1 AS `nome`,
 1 AS `data_pedido`,
 1 AS `status`,
 1 AS `idrecebedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dados_pessoa_juridica`
--

DROP TABLE IF EXISTS `dados_pessoa_juridica`;
/*!50001 DROP VIEW IF EXISTS `dados_pessoa_juridica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dados_pessoa_juridica` AS SELECT 
 1 AS `NOME`,
 1 AS `CNPJ`,
 1 AS `CONTATO`,
 1 AS `SITUACAO`,
 1 AS `CEP`,
 1 AS `Complemento`,
 1 AS `Numero`,
 1 AS `Bairro`,
 1 AS `Cidade`,
 1 AS `Estado`,
 1 AS `UF`,
 1 AS `Rua`,
 1 AS `pessoa_idPessoa`,
 1 AS `idEndereco`,
 1 AS `situacao_endereco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `getenderecopessoa`
--

DROP TABLE IF EXISTS `getenderecopessoa`;
/*!50001 DROP VIEW IF EXISTS `getenderecopessoa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getenderecopessoa` AS SELECT 
 1 AS `CEP`,
 1 AS `Complemento`,
 1 AS `Numero`,
 1 AS `Bairro`,
 1 AS `Cidade`,
 1 AS `Estado`,
 1 AS `UF`,
 1 AS `Rua`,
 1 AS `pessoa_idPessoa`,
 1 AS `idEndereco`,
 1 AS `ativo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `getdadospessoafisica`
--

/*!50001 DROP VIEW IF EXISTS `getdadospessoafisica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getdadospessoafisica` AS select `pe`.`nome` AS `Nome`,`pf`.`cpf` AS `CPF`,`co`.`contato` AS `Contato`,`co`.`status_contato` AS `Situacao`,`gte`.`CEP` AS `CEP`,`gte`.`Complemento` AS `Complemento`,`gte`.`Numero` AS `Numero`,`gte`.`Bairro` AS `Bairro`,`gte`.`Cidade` AS `Cidade`,`gte`.`Estado` AS `Estado`,`gte`.`UF` AS `UF`,`gte`.`Rua` AS `Rua`,`gte`.`pessoa_idPessoa` AS `pessoa_idPessoa`,`gte`.`idEndereco` AS `idEndereco` from ((((`getenderecopessoa` `gte` join `pessoa` `pe`) join `pessoa_fisica` `pf`) join `pessoa_juridica` `pj`) join `contato` `co`) where ((`pf`.`pessoa_idPessoa` = `pe`.`idPessoa`) and (`co`.`pessoa_idPessoa` = `pe`.`idPessoa`) and (`gte`.`pessoa_idPessoa` = `pe`.`idPessoa`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dados_refatorado`
--

/*!50001 DROP VIEW IF EXISTS `dados_refatorado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dados_refatorado` AS select `p`.`nome` AS `NOME`,`pf`.`cpf` AS `CPF`,`co`.`contato` AS `CONTATO`,`co`.`status_contato` AS `SITUACAO`,`gp`.`CEP` AS `CEP`,`gp`.`Complemento` AS `Complemento`,`gp`.`Numero` AS `Numero`,`gp`.`Bairro` AS `Bairro`,`gp`.`Cidade` AS `Cidade`,`gp`.`Estado` AS `Estado`,`gp`.`UF` AS `UF`,`gp`.`Rua` AS `Rua`,`gp`.`pessoa_idPessoa` AS `pessoa_idPessoa`,`gp`.`idEndereco` AS `idEndereco`,`gp`.`ativo` AS `situacao_endereco` from (((`getenderecopessoa` `gp` join `pessoa` `p`) join `pessoa_fisica` `pf`) join `contato` `co`) where ((`gp`.`pessoa_idPessoa` = `p`.`idPessoa`) and (`pf`.`pessoa_idPessoa` = `p`.`idPessoa`) and (`co`.`pessoa_idPessoa` = `p`.`idPessoa`)) order by `p`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dados_pedido_corrigido`
--

/*!50001 DROP VIEW IF EXISTS `dados_pedido_corrigido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dados_pedido_corrigido` AS select `dp`.`numero_pedido` AS `numero_pedido`,`dp`.`nome` AS `nome`,`dp`.`data_pedido` AS `data_pedido`,`dp`.`status` AS `status`,`dp`.`idrecebedor` AS `idrecebedor`,`p`.`nome` AS `nome recebedor`,`pd`.`peso_pedido` AS `peso_pedido`,`pd`.`valor_total` AS `valor_total` from ((((`getdadospedido` `dp` join `pessoa` `p`) join `recebedor` `r`) join `pedido` `pd`) join `cliente` `c`) where ((`pd`.`recebedor_idrecebedor` = `r`.`idrecebedor`) and (`r`.`pessoa_idPessoa` = `p`.`idPessoa`) and (`c`.`pessoa_idPessoa` = `p`.`idPessoa`) and (`dp`.`numero_pedido` = `pd`.`numero_pedido`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getdadospedido`
--

/*!50001 DROP VIEW IF EXISTS `getdadospedido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getdadospedido` AS select `pd`.`numero_pedido` AS `numero_pedido`,`p`.`nome` AS `nome`,`pd`.`data_pedido` AS `data_pedido`,`pd`.`status` AS `status`,`r`.`idrecebedor` AS `idrecebedor` from (((`pessoa` `p` join `cliente` `c`) join `recebedor` `r`) join `pedido` `pd`) where ((`pd`.`cliente_idcliente` = `c`.`idcliente`) and (`c`.`pessoa_idPessoa` = `p`.`idPessoa`) and (`pd`.`recebedor_idrecebedor` = `r`.`idrecebedor`) and (0 <> `r`.`pessoa_idPessoa`)) order by `r`.`idrecebedor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dados_pessoa_juridica`
--

/*!50001 DROP VIEW IF EXISTS `dados_pessoa_juridica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dados_pessoa_juridica` AS select `p`.`nome` AS `NOME`,`pj`.`cnpj` AS `CNPJ`,`co`.`contato` AS `CONTATO`,`co`.`status_contato` AS `SITUACAO`,`gp`.`CEP` AS `CEP`,`gp`.`Complemento` AS `Complemento`,`gp`.`Numero` AS `Numero`,`gp`.`Bairro` AS `Bairro`,`gp`.`Cidade` AS `Cidade`,`gp`.`Estado` AS `Estado`,`gp`.`UF` AS `UF`,`gp`.`Rua` AS `Rua`,`gp`.`pessoa_idPessoa` AS `pessoa_idPessoa`,`gp`.`idEndereco` AS `idEndereco`,`gp`.`ativo` AS `situacao_endereco` from (((`getenderecopessoa` `gp` join `pessoa` `p`) join `pessoa_juridica` `pj`) join `contato` `co`) where ((`gp`.`pessoa_idPessoa` = `p`.`idPessoa`) and (`pj`.`pessoa_idPessoa` = `p`.`idPessoa`) and (`co`.`pessoa_idPessoa` = `p`.`idPessoa`)) order by `p`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getenderecopessoa`
--

/*!50001 DROP VIEW IF EXISTS `getenderecopessoa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getenderecopessoa` AS select `e`.`cep` AS `CEP`,`e`.`complemento` AS `Complemento`,`e`.`numero` AS `Numero`,`b`.`nome_Bairro` AS `Bairro`,`c`.`nome_cidade` AS `Cidade`,`es`.`nome_estado` AS `Estado`,`es`.`uf` AS `UF`,`e`.`rua` AS `Rua`,`e`.`pessoa_idPessoa` AS `pessoa_idPessoa`,`e`.`idEndereco` AS `idEndereco`,`e`.`ativo` AS `ativo` from (((`endereco` `e` join `bairro` `b`) join `cidade` `c`) join `estado` `es`) where ((`e`.`bairro_idBairro` = `b`.`idBairro`) and (`b`.`cidade_idCidade` = `c`.`idCidade`) and (`c`.`estado_idEstado` = `es`.`idEstado`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'logistica_ads'
--

--
-- Dumping routines for database 'logistica_ads'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-01 20:59:41
