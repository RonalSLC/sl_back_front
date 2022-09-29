-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: asistencia_sl
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
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

CREATE TABLE `asistencias` (
  `id_asistencias` int NOT NULL AUTO_INCREMENT,
  `codigo_usuario` varchar(20) DEFAULT NULL,
  `nombre_usuario` varchar(30) DEFAULT NULL,
  `asitio` tinyint(1) DEFAULT NULL,
  `motivo_inasistencia` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_asistencias`)
);

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
CREATE TABLE `kiosco_ubicacion` (
  `id_kiosco_ubicacion` int NOT NULL AUTO_INCREMENT,
  `id_kiosco` varchar(30) DEFAULT NULL,
  `latitud` varchar(100) DEFAULT NULL,
  `longitud` varchar(100) DEFAULT NULL,
  `hora_apertura` int DEFAULT NULL,
  `hora_cierre` int DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kiosco_ubicacion`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiosco_ubicacion`
--

LOCK TABLES `kiosco_ubicacion` WRITE;
/*!40000 ALTER TABLE `kiosco_ubicacion` DISABLE KEYS */;
INSERT INTO `kiosco_ubicacion` VALUES (1,'MS-AUF','14.6866176','-90.40691199999999',1000,2100,'23 CALLE 10-00 ZONA 4 CONDADO EL NARANJO LOCAL K-43 MIXCO GUATEMALA'),(4,'MAS-FF','9.2225555555555','-14.5665666666',0,2100,'23 CALLE 10-00 ZONA 4 CONDADO EL NARANJO LOCAL K-43 MIXCO GUATEMALA');
/*!40000 ALTER TABLE `kiosco_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivos`
--

DROP TABLE IF EXISTS `motivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
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
INSERT INTO `motivos` VALUES (1,'Apertura',NULL,10,1,1),(2,'Cierre',NULL,15,0,1),(3,'baño',15,20,1,14),(4,'Parqueo',1,5,1,10),(5,'prueba',10,10,0,1);
/*!40000 ALTER TABLE `motivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `registros` (
  `id_registros` int NOT NULL AUTO_INCREMENT,
  `codigo_usuario` varchar(20) DEFAULT NULL,
  `nombre_usuario` varchar(20) DEFAULT NULL,
  `id_tipo_registro` int DEFAULT NULL,
  `id_motivo` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `marco` int DEFAULT NULL,
  `id_kiosco` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_registros`),
  KEY `id_motivo` (`id_motivo`),
  KEY `id_tipo_registro` (`id_tipo_registro`),
  CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`id_motivo`) REFERENCES `motivos` (`id_motivo`),
  CONSTRAINT `registros_ibfk_2` FOREIGN KEY (`id_tipo_registro`) REFERENCES `tipo_registro` (`id_tipo_registro`)
);
--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES (1,'prueba.sl','prueba sl',1,1,'2021-04-30 00:00:00',NULL,NULL),(2,'prueba.sl','prueba sl',2,2,'2021-04-30 14:51:48',NULL,NULL),(3,'prueba.sl','prueba sl',1,1,'2021-04-29 07:51:48',NULL,NULL),(4,'prueba.sl','prueba sl',2,2,'2021-04-29 17:18:48',NULL,NULL),(5,'prueba.sl','prueba sl',1,1,'2021-04-28 08:18:48',NULL,NULL),(6,'prueba.sl','prueba sl',2,2,'2021-04-28 17:52:32',NULL,NULL),(7,'prueba.sl','prueba sl',1,1,'2021-04-27 07:52:32',NULL,NULL),(8,'prueba.sl','prueba sl',2,2,'2021-04-27 18:02:32',NULL,NULL),(12,'prueba.sl','prueba sl',1,1,'2021-05-03 08:36:04',NULL,NULL),(13,'prueba.sl','prueba sl',2,2,'2021-05-03 08:37:10',NULL,NULL),(14,'prueba.sl','prueba sl',1,1,'2021-05-03 08:38:00',NULL,NULL),(15,'prueba.sl','prueba sl',2,3,'2021-05-03 08:38:33',NULL,NULL),(16,'prueba.sl','prueba sl',1,3,'2021-05-03 08:39:10',NULL,NULL),(17,'prueba.sl','prueba sl',2,2,'2021-05-03 08:39:40',NULL,NULL),(18,'prueba.sl','prueba sl',1,1,'2021-05-03 08:39:48',NULL,NULL),(19,'prueba.sl','prueba sl',2,3,'2021-05-03 08:40:03',NULL,NULL),(20,'prueba.sl','prueba sl',1,3,'2021-05-03 08:40:11',NULL,NULL),(21,'prueba.sl','prueba sl',2,2,'2021-05-03 18:02:32',NULL,NULL),(22,'prueba.sl','prueba sl',1,1,'2021-05-04 12:17:42',NULL,NULL),(23,'prueba.sl','prueba sl',2,3,'2021-05-04 13:35:12',NULL,NULL),(24,'prueba.sl','prueba sl',1,3,'2021-05-04 13:36:05',NULL,NULL),(25,'prueba.sl','prueba sl',2,4,'2021-05-04 14:50:49',NULL,NULL),(26,'prueba.sl','prueba sl',1,4,'2021-05-04 14:54:08',NULL,NULL),(35,'prueba.sl','prueba sl',1,3,'2021-05-04 15:23:28',NULL,NULL),(36,'prueba.sl','prueba sl',2,4,'2021-05-04 23:54:38',NULL,NULL),(37,'prueba.sl','prueba sl',1,4,'2021-05-04 23:59:11',NULL,NULL),(38,'prueba.sl','prueba sl',1,4,'2021-05-04 23:59:20',NULL,NULL),(39,'prueba.sl','prueba sl',2,2,'2021-05-04 23:02:32',NULL,NULL),(40,'prueba.sl','prueba sl',1,1,'2021-05-05 00:17:20',NULL,NULL),(41,'prueba.sl','prueba sl',2,3,'2021-05-05 00:17:27',NULL,NULL),(42,'prueba.sl','prueba sl',1,3,'2021-05-05 00:42:48',NULL,NULL),(43,'prueba.sl','prueba sl',2,4,'2021-05-05 00:45:04',NULL,NULL),(44,'prueba.sl','prueba sl',1,4,'2021-05-05 00:45:53',NULL,NULL),(45,'prueba.sl','prueba sl',2,3,'2021-05-05 08:46:45',NULL,NULL),(46,'prueba.sl','prueba sl',1,3,'2021-05-05 08:47:24',NULL,NULL),(47,'prueba.sl','prueba sl',2,4,'2021-05-05 08:51:42',NULL,NULL),(48,'prueba.sl','prueba sl',1,4,'2021-05-05 08:54:12',NULL,NULL),(49,'prueba.sl','prueba sl',2,2,'2021-05-05 22:06:57',NULL,NULL),(51,'prueba.sl','prueba sl',1,1,'2021-05-06 16:15:45',NULL,NULL),(52,'prueba.sl','prueba sl',2,3,'2021-05-06 16:21:40',NULL,NULL),(53,'prueba.sl','prueba sl',1,3,'2021-05-06 16:24:58',NULL,NULL),(54,'prueba.sl','prueba sl',1,1,'2021-05-07 07:44:40',0,NULL),(55,'prueba.sl','prueba sl',2,3,'2021-05-07 08:04:54',1,NULL),(56,'prueba.sl','prueba sl',1,3,'2021-05-07 08:17:37',1,NULL),(57,'prueba.sl','prueba sl',2,3,'2021-05-07 08:40:10',1,NULL),(58,'prueba.sl','prueba sl',1,3,'2021-05-07 08:45:30',1,NULL),(59,'admin@sl','admin@sl',1,1,'2021-05-10 14:05:34',0,NULL),(60,'vendedor@sl','vendedor@sl',1,1,'2021-05-10 15:57:18',0,NULL),(61,'vendedor@sl','vendedor@sl',1,1,'2021-05-14 11:42:31',0,NULL),(62,'vendedor@sl','vendedor@sl',1,1,'2021-05-17 01:01:03',0,NULL),(63,'vendedor@sl','vendedor@sl',2,4,'2021-05-17 11:23:03',1,NULL),(64,'vendedor@sl','vendedor@sl',1,4,'2021-05-17 11:36:50',0,NULL),(65,'vendedor@sl','vendedor@sl',2,4,'2021-05-17 11:37:17',1,NULL),(66,'vendedor@sl','vendedor@sl',1,4,'2021-05-17 11:47:33',0,NULL),(67,'vendedor@sl','vendedor@sl',2,4,'2021-05-17 16:40:34',1,NULL),(68,'vendedor@sl','vendedor@sl',1,1,'2021-05-18 10:16:25',0,NULL),(69,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 10:18:07',1,NULL),(70,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 10:21:59',1,NULL),(71,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 13:39:18',1,NULL),(72,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 13:59:05',0,NULL),(73,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 14:02:21',1,NULL),(74,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 14:08:28',0,NULL),(75,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 14:14:35',1,NULL),(76,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 14:20:49',0,NULL),(77,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 14:26:27',1,NULL),(78,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 14:32:57',0,NULL),(79,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 14:33:13',1,NULL),(80,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 14:49:28',0,NULL),(81,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 14:52:21',1,NULL),(82,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 14:58:40',0,NULL),(83,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 14:58:55',1,NULL),(84,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 15:05:14',0,NULL),(85,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 15:09:59',1,NULL),(86,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 15:16:38',0,NULL),(87,'vendedor2@sl','vendedor2@sl',1,1,'2021-05-18 19:25:35',0,NULL),(88,'vendedor@sl','vendedor@sl',2,4,'2021-05-18 22:44:21',1,'MS-AUF'),(89,'vendedor@sl','vendedor@sl',1,4,'2021-05-18 22:44:28',1,'MS-AUF'),(102,'No Ingreso','No Ingreso',1,1,'2021-05-19 00:37:17',0,'MAS-FF'),(103,'vendedor2@sl','vendedor2@sl',1,1,'2021-05-19 00:37:41',0,'MAS-FF');
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_registro`
--

DROP TABLE IF EXISTS `tipo_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `tipo_registro` (
  `id_tipo_registro` int NOT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_registro`)
);
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

-- Dump completed on 2021-05-19  0:42:20
