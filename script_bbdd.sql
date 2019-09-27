CREATE DATABASE  IF NOT EXISTS `v2019` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `v2019`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: v2019
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (11,'aaaaa'),(2,'bromas'),(1,'musica'),(5,'nombre0'),(6,'nombre1'),(9,'nombre4'),(10,'nuevo5'),(3,'surf'),(4,'sustos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `likes` (
  `id_usuario` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`,`id_video`),
  KEY `fk_usuario_likes_video_idx` (`id_video`),
  CONSTRAINT `fk_usuario_likes_video` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_video_likes_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,5,'2019-09-06 09:36:27'),(1,7,'2019-09-19 12:56:21'),(1,8,'2019-09-19 12:54:15'),(3,8,'2019-09-19 12:47:14'),(6,7,'2019-09-19 12:56:24');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='1: Administrador\n2: Usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador'),(2,'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `contrasenya` varchar(45) NOT NULL,
  `id_rol` int(11) NOT NULL DEFAULT '2' COMMENT 'Por defecto es 2 que es el id del rol "Usuario"',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_rol_id_idx` (`id_rol`),
  CONSTRAINT `fk_rol_id` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin',1,'2019-09-12 08:47:50',NULL),(2,'pepe','pepe',2,'2019-09-12 08:47:50',NULL),(3,'soso','soso',2,'2019-09-12 08:47:50',NULL),(5,'Sr burns','123',1,'2019-09-12 09:02:31',NULL),(6,'eliminado','123',2,'2019-09-11 09:02:31','2019-09-20 13:31:39'),(7,'adadasdads','aaaaaa',2,'2019-09-12 12:50:09','2019-09-12 12:50:09');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_totales_categoria`
--

DROP TABLE IF EXISTS `v_totales_categoria`;
/*!50001 DROP VIEW IF EXISTS `v_totales_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_totales_categoria` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_totales_categoria_likes`
--

DROP TABLE IF EXISTS `v_totales_categoria_likes`;
/*!50001 DROP VIEW IF EXISTS `v_totales_categoria_likes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_totales_categoria_likes` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `total_videos`,
 1 AS `total_likes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_totales_video`
--

DROP TABLE IF EXISTS `v_totales_video`;
/*!50001 DROP VIEW IF EXISTS `v_totales_video`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_totales_video` AS SELECT 
 1 AS `total_videos`,
 1 AS `total_visibles`,
 1 AS `total_eliminados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_videos`
--

DROP TABLE IF EXISTS `v_videos`;
/*!50001 DROP VIEW IF EXISTS `v_videos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_videos` AS SELECT 
 1 AS `video_id`,
 1 AS `video_nombre`,
 1 AS `codigo`,
 1 AS `usuario_id`,
 1 AS `usuario_nombre`,
 1 AS `categoria_id`,
 1 AS `categoria_nombre`,
 1 AS `likes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `codigo` varchar(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_video_usuario_idx` (`usuario_id`),
  KEY `fk_video_categoria_idx` (`categoria_id`),
  CONSTRAINT `fk_video_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_video_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (5,'Red Hot Chili Peppers - Dark Necessities2','Q0oIoR9mLwc',1,1),(7,'El Fary - El Torito Guapo','NFkI-zxZlHo',3,9),(8,'Sustos varios de animales','-OYb-rs1eWo',1,4),(11,'No te olvides de poner el Where en el Delete From.','i_cVJgIz_Cs',6,9),(13,'Jojo Rabbit','VTqd4yNFuSw',2,9),(19,'dark materials2','ng9PdJvI194',2,4);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'v2019'
--

--
-- Dumping routines for database 'v2019'
--
/*!50003 DROP FUNCTION IF EXISTS `DIME_MES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `DIME_MES`(

	`pFecha` DATE

) RETURNS varchar(20) CHARSET utf8mb4
    COMMENT 'retorna el nombre del mes en castellano'
BEGIN

	DECLARE mes VARCHAR(50);

	DECLARE mesNumero INT;

	

	SET mesNumero = MONTH(pFecha);

	

	CASE mesNumero

	WHEN 1 THEN SET mes ='enero';

	WHEN 2 THEN SET mes ='febrero';

	WHEN 3 THEN SET mes ='marzo';

	WHEN 4 THEN SET mes ='abril';

	WHEN 5 THEN SET mes ='mayo';

	WHEN 6 THEN SET mes ='junio';

	WHEN 7 THEN SET mes ='julio';

	WHEN 8 THEN SET mes ='agosto';

	WHEN 9 THEN SET mes ='septiembre';

	WHEN 10 THEN SET mes ='octubre';

	WHEN 11 THEN SET mes ='noviembre';

	WHEN 12 THEN SET mes = 'diciembre';

	ELSE SET mes ='no valido';

	END CASE;

	RETURN mes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoriaDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriaDelete`(

	IN `idCategoria` INT

)
    COMMENT 'Borra una categoria'
BEGIN    

    DELETE FROM categoria WHERE id = idCategoria;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoriaGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriaGetAll`()
    COMMENT 'Devuelve la lista de categorias'
BEGIN

	SELECT `id`, `nombre`

	FROM `categoria`

    ORDER BY id DESC LIMIT 500;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoriaGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriaGetById`(

	IN `idCategoria` INT





)
    COMMENT 'busca una categoria concreta por id'
BEGIN

	SELECT `id`, `nombre`

	FROM `categoria`

	WHERE `id`= idCategoria ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoriaInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriaInsert`(

	IN `nombreCategoria` VARCHAR(50),

	OUT `idCategoria` INT



)
    COMMENT 'Inserta una nueva categoria'
BEGIN

	INSERT INTO categoria (nombre) VALUES(nombreCategoria);

	-- conseguimos el id generado para retornarlo como OUT

	SET idCategoria = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoriaUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriaUpdate`(

	IN `pNombre` VARCHAR(45),

	INOUT `pId` INT

)
BEGIN

	UPDATE categoria SET nombre = pNombre WHERE id = pId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_totales_categoria`
--

/*!50001 DROP VIEW IF EXISTS `v_totales_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_totales_categoria` AS select `c`.`id` AS `id`,`c`.`nombre` AS `nombre`,count(`v`.`id`) AS `total` from (`categoria` `c` left join `video` `v` on((`v`.`categoria_id` = `c`.`id`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_totales_categoria_likes`
--

/*!50001 DROP VIEW IF EXISTS `v_totales_categoria_likes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_totales_categoria_likes` AS select `c`.`id` AS `id`,`c`.`nombre` AS `nombre`,count(`v`.`id`) AS `total_videos`,(select count(`l`.`id_video`) AS `total_likes` from ((`categoria` `c2` left join `video` `v` on((`c2`.`id` = `v`.`categoria_id`))) left join `likes` `l` on((`v`.`id` = `l`.`id_video`))) where (`c2`.`id` = `c`.`id`) group by `c2`.`id`) AS `total_likes` from (`categoria` `c` left join `video` `v` on((`c`.`id` = `v`.`categoria_id`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_totales_video`
--

/*!50001 DROP VIEW IF EXISTS `v_totales_video`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_totales_video` AS select count(0) AS `total_videos`,(select count(0) from (`video` `v` join `usuario` `u`) where ((`v`.`usuario_id` = `u`.`id`) and isnull(`u`.`fecha_eliminacion`))) AS `total_visibles`,(select count(0) from (`video` `v` join `usuario` `u`) where ((`v`.`usuario_id` = `u`.`id`) and (`u`.`fecha_eliminacion` is not null))) AS `total_eliminados` from `video` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_videos`
--

/*!50001 DROP VIEW IF EXISTS `v_videos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_videos` AS select `v`.`id` AS `video_id`,`v`.`nombre` AS `video_nombre`,`v`.`codigo` AS `codigo`,`u`.`id` AS `usuario_id`,`u`.`nombre` AS `usuario_nombre`,`c`.`id` AS `categoria_id`,`c`.`nombre` AS `categoria_nombre`,ifnull((select count(0) AS `likes_videos` from `likes` group by `likes`.`id_video` having (`likes`.`id_video` = `v`.`id`)),0) AS `likes` from ((`video` `v` join `usuario` `u`) join `categoria` `c`) where ((`v`.`usuario_id` = `u`.`id`) and (`v`.`categoria_id` = `c`.`id`)) order by `likes` desc limit 500 */;
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

-- Dump completed on 2019-09-24  9:41:36
