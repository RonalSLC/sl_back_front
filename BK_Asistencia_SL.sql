-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: asistencia_sl
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias` (
  `id_asistencias` int NOT NULL AUTO_INCREMENT,
  `codigo_usuario` varchar(20) DEFAULT NULL,
  `nombre_usuario` varchar(30) DEFAULT NULL,
  `asitio` tinyint(1) DEFAULT NULL,
  `motivo_inasistencia` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_asistencias`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias`
--

LOCK TABLES `asistencias` WRITE;
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiosco_ubicacion`
--

DROP TABLE IF EXISTS `kiosco_ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kiosco_ubicacion` (
  `id_kiosco_ubicacion` int NOT NULL AUTO_INCREMENT,
  `id_kiosco` varchar(30) DEFAULT NULL,
  `latitud` varchar(100) DEFAULT NULL,
  `longitud` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kiosco_ubicacion`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiosco_ubicacion`
--

LOCK TABLES `kiosco_ubicacion` WRITE;
/*!40000 ALTER TABLE `kiosco_ubicacion` DISABLE KEYS */;
INSERT INTO `kiosco_ubicacion` VALUES (1,'MS-AUF','14.6866176','-90.40691199999999');
/*!40000 ALTER TABLE `kiosco_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivos`
--

DROP TABLE IF EXISTS `motivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivos` (
  `id_motivo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `tiempo` int DEFAULT NULL,
  `tiempo_flexibilidad` int DEFAULT NULL,
  `activo` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_motivo`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivos`
--

LOCK TABLES `motivos` WRITE;
/*!40000 ALTER TABLE `motivos` DISABLE KEYS */;
INSERT INTO `motivos` VALUES (1,'Apertura',NULL,10,1,1),(2,'Cierre',NULL,10,1,1),(3,'baño',15,10,1,2),(4,'Parqueo',15,10,1,2);
/*!40000 ALTER TABLE `motivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros` (
  `id_registros` int NOT NULL AUTO_INCREMENT,
  `codigo_usuario` varchar(20) DEFAULT NULL,
  `nombre_usuario` varchar(20) DEFAULT NULL,
  `id_tipo_registro` int DEFAULT NULL,
  `id_motivo` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `marco` int DEFAULT NULL,
  PRIMARY KEY (`id_registros`),
  KEY `id_motivo` (`id_motivo`),
  KEY `id_tipo_registro` (`id_tipo_registro`),
  CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`id_motivo`) REFERENCES `motivos` (`id_motivo`),
  CONSTRAINT `registros_ibfk_2` FOREIGN KEY (`id_tipo_registro`) REFERENCES `tipo_registro` (`id_tipo_registro`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES (1,'prueba.sl','prueba sl',1,1,'2021-04-30 00:00:00',NULL),(2,'prueba.sl','prueba sl',2,2,'2021-04-30 14:51:48',NULL),(3,'prueba.sl','prueba sl',1,1,'2021-04-29 07:51:48',NULL),(4,'prueba.sl','prueba sl',2,2,'2021-04-29 17:18:48',NULL),(5,'prueba.sl','prueba sl',1,1,'2021-04-28 08:18:48',NULL),(6,'prueba.sl','prueba sl',2,2,'2021-04-28 17:52:32',NULL),(7,'prueba.sl','prueba sl',1,1,'2021-04-27 07:52:32',NULL),(8,'prueba.sl','prueba sl',2,2,'2021-04-27 18:02:32',NULL),(12,'prueba.sl','prueba sl',1,1,'2021-05-03 08:36:04',NULL),(13,'prueba.sl','prueba sl',2,2,'2021-05-03 08:37:10',NULL),(14,'prueba.sl','prueba sl',1,1,'2021-05-03 08:38:00',NULL),(15,'prueba.sl','prueba sl',2,3,'2021-05-03 08:38:33',NULL),(16,'prueba.sl','prueba sl',1,3,'2021-05-03 08:39:10',NULL),(17,'prueba.sl','prueba sl',2,2,'2021-05-03 08:39:40',NULL),(18,'prueba.sl','prueba sl',1,1,'2021-05-03 08:39:48',NULL),(19,'prueba.sl','prueba sl',2,3,'2021-05-03 08:40:03',NULL),(20,'prueba.sl','prueba sl',1,3,'2021-05-03 08:40:11',NULL),(21,'prueba.sl','prueba sl',2,2,'2021-05-03 18:02:32',NULL),(22,'prueba.sl','prueba sl',1,1,'2021-05-04 12:17:42',NULL),(23,'prueba.sl','prueba sl',2,3,'2021-05-04 13:35:12',NULL),(24,'prueba.sl','prueba sl',1,3,'2021-05-04 13:36:05',NULL),(25,'prueba.sl','prueba sl',2,4,'2021-05-04 14:50:49',NULL),(26,'prueba.sl','prueba sl',1,4,'2021-05-04 14:54:08',NULL),(35,'prueba.sl','prueba sl',1,3,'2021-05-04 15:23:28',NULL),(36,'prueba.sl','prueba sl',2,4,'2021-05-04 23:54:38',NULL),(37,'prueba.sl','prueba sl',1,4,'2021-05-04 23:59:11',NULL),(38,'prueba.sl','prueba sl',1,4,'2021-05-04 23:59:20',NULL),(39,'prueba.sl','prueba sl',2,2,'2021-05-04 23:02:32',NULL),(40,'prueba.sl','prueba sl',1,1,'2021-05-05 00:17:20',NULL),(41,'prueba.sl','prueba sl',2,3,'2021-05-05 00:17:27',NULL),(42,'prueba.sl','prueba sl',1,3,'2021-05-05 00:42:48',NULL),(43,'prueba.sl','prueba sl',2,4,'2021-05-05 00:45:04',NULL),(44,'prueba.sl','prueba sl',1,4,'2021-05-05 00:45:53',NULL),(45,'prueba.sl','prueba sl',2,3,'2021-05-05 08:46:45',NULL),(46,'prueba.sl','prueba sl',1,3,'2021-05-05 08:47:24',NULL),(47,'prueba.sl','prueba sl',2,4,'2021-05-05 08:51:42',NULL),(48,'prueba.sl','prueba sl',1,4,'2021-05-05 08:54:12',NULL),(49,'prueba.sl','prueba sl',2,2,'2021-05-05 22:06:57',NULL),(51,'prueba.sl','prueba sl',1,1,'2021-05-06 16:15:45',NULL),(52,'prueba.sl','prueba sl',2,3,'2021-05-06 16:21:40',NULL),(53,'prueba.sl','prueba sl',1,3,'2021-05-06 16:24:58',NULL),(54,'prueba.sl','prueba sl',1,1,'2021-05-07 07:44:40',0),(55,'prueba.sl','prueba sl',2,3,'2021-05-07 08:04:54',1),(56,'prueba.sl','prueba sl',1,3,'2021-05-07 08:17:37',1),(57,'prueba.sl','prueba sl',2,3,'2021-05-07 08:40:10',1),(58,'prueba.sl','prueba sl',1,3,'2021-05-07 08:45:30',1);
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_registro`
--

DROP TABLE IF EXISTS `tipo_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_registro` (
  `id_tipo_registro` int NOT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_registro`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_registro`
--

LOCK TABLES `tipo_registro` WRITE;
/*!40000 ALTER TABLE `tipo_registro` DISABLE KEYS */;
INSERT INTO `tipo_registro` VALUES (1,'Entrada'),(2,'Salida');
/*!40000 ALTER TABLE `tipo_registro` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Temporary view structure for view `vw_asistencia`
--

DROP TABLE IF EXISTS `vw_asistencia`;
/*!50001 DROP VIEW IF EXISTS `vw_asistencia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_asistencia` AS SELECT 
 1 AS `nombre_usuario`,
 1 AS `fecha`,
 1 AS `tipo`,
 1 AS `motivo`,
 1 AS `hora`,
 1 AS `marco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cumplimientos`
--

DROP TABLE IF EXISTS `vw_cumplimientos`;
/*!50001 DROP VIEW IF EXISTS `vw_cumplimientos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cumplimientos` AS SELECT 
 1 AS `fecha`,
 1 AS `fechas`,
 1 AS `codigo_usuario`,
 1 AS `nombre_usuario`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_registros`
--

DROP TABLE IF EXISTS `vw_registros`;
/*!50001 DROP VIEW IF EXISTS `vw_registros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_registros` AS SELECT 
 1 AS `codigo_usuario`,
 1 AS `nombre_usuario`,
 1 AS `fecha`,
 1 AS `fechas`,
 1 AS `tipo`,
 1 AS `motivo`,
 1 AS `hora`,
 1 AS `marco`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_asistencia`
--

/*!50001 DROP VIEW IF EXISTS `vw_asistencia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_asistencia` AS select `r`.`nombre_usuario` AS `nombre_usuario`,date_format(`r`.`fecha`,'%d/%m/%Y') AS `fecha`,`t`.`tipo` AS `tipo`,`m`.`descripcion` AS `motivo`,cast(`r`.`fecha` as time) AS `hora`,`r`.`marco` AS `marco` from ((`registros` `r` join `tipo_registro` `t` on((`r`.`id_tipo_registro` = `t`.`id_tipo_registro`))) join `motivos` `m` on((`r`.`id_motivo` = `m`.`id_motivo`))) where (`r`.`id_motivo` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cumplimientos`
--

/*!50001 DROP VIEW IF EXISTS `vw_cumplimientos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cumplimientos` AS select date_format(`r`.`fecha`,'%d/%m/%Y') AS `fecha`,`r`.`fecha` AS `fechas`,`r`.`codigo_usuario` AS `codigo_usuario`,`r`.`nombre_usuario` AS `nombre_usuario`,timediff(`t1`.`fecha`,`r`.`fecha`) AS `total` from ((select `registros`.`id_registros` AS `id_registros`,`registros`.`fecha` AS `fecha` from `registros` where (`registros`.`id_motivo` = 2)) `t1` join `registros` `r` on((date_format(`t1`.`fecha`,'%d/%m/%Y') = date_format(`r`.`fecha`,'%d/%m/%Y')))) where (`r`.`id_motivo` = 1) order by `r`.`fecha` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_registros`
--

/*!50001 DROP VIEW IF EXISTS `vw_registros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_registros` AS select `r`.`codigo_usuario` AS `codigo_usuario`,`r`.`nombre_usuario` AS `nombre_usuario`,date_format(`r`.`fecha`,'%d/%m/%Y') AS `fecha`,`r`.`fecha` AS `fechas`,`t`.`tipo` AS `tipo`,`m`.`descripcion` AS `motivo`,cast(`r`.`fecha` as time) AS `hora`,`r`.`marco` AS `marco` from ((`registros` `r` join `tipo_registro` `t` on((`r`.`id_tipo_registro` = `t`.`id_tipo_registro`))) join `motivos` `m` on((`r`.`id_motivo` = `m`.`id_motivo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-12 11:00:11
