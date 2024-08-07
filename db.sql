CREATE DATABASE  IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `engine_type` varchar(255) NOT NULL,
  `engine_fuel_type` varchar(255) NOT NULL,
  `transmission` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `body_type` varchar(255) NOT NULL,
  `engine_horsepower` int NOT NULL,
  `num_engine_cylinders` int NOT NULL,
  `drivetrain` varchar(255) NOT NULL,
  `num_of_doors` int NOT NULL,
  `size` varchar(255) NOT NULL,
  `highway_mpg` int NOT NULL,
  `city_mpg` int NOT NULL,
  `popularity` int NOT NULL,
  `MSRP` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idCar_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `car_sales`
--

DROP TABLE IF EXISTS `car_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `car` int NOT NULL,
  `date` int NOT NULL,
  `customer` int NOT NULL,
  `dealer` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `car_fk` (`car`),
  KEY `customer_fk` (`customer`),
  KEY `date_fk` (`date`),
  KEY `dealer_fk` (`dealer`),
  CONSTRAINT `car_fk` FOREIGN KEY (`car`) REFERENCES `car` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_fk` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `date_fk` FOREIGN KEY (`date`) REFERENCES `date` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dealer_fk` FOREIGN KEY (`dealer`) REFERENCES `dealership` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18494 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cpi`
--

DROP TABLE IF EXISTS `cpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` int NOT NULL,
  `cpi_value` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `date_fk_cpi` (`date`),
  CONSTRAINT `date_fk_cpi` FOREIGN KEY (`date`) REFERENCES `date` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2776 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `annual_income` int NOT NULL,
  `phone_num` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `day_of_week` varchar(255) NOT NULL,
  `fiscal_quarter` varchar(255) NOT NULL,
  `season` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15438 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dealership`
--

DROP TABLE IF EXISTS `dealership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealership` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dealer_num` varchar(255) NOT NULL,
  `dealer_region` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `salesbyfuelincome`
--

DROP TABLE IF EXISTS `salesbyfuelincome`;
/*!50001 DROP VIEW IF EXISTS `salesbyfuelincome`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesbyfuelincome` AS SELECT 
 1 AS `id`,
 1 AS `car`,
 1 AS `date`,
 1 AS `customer`,
 1 AS `dealer`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `salesbymakemodel`
--

DROP TABLE IF EXISTS `salesbymakemodel`;
/*!50001 DROP VIEW IF EXISTS `salesbymakemodel`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesbymakemodel` AS SELECT 
 1 AS `company`,
 1 AS `model`,
 1 AS `TotalSales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `salesbympgincome`
--

DROP TABLE IF EXISTS `salesbympgincome`;
/*!50001 DROP VIEW IF EXISTS `salesbympgincome`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesbympgincome` AS SELECT 
 1 AS `id`,
 1 AS `car`,
 1 AS `date`,
 1 AS `customer`,
 1 AS `dealer`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `salesbyyrfq`
--

DROP TABLE IF EXISTS `salesbyyrfq`;
/*!50001 DROP VIEW IF EXISTS `salesbyyrfq`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesbyyrfq` AS SELECT 
 1 AS `year`,
 1 AS `fiscal_quarter`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `salescpi120`
--

DROP TABLE IF EXISTS `salescpi120`;
/*!50001 DROP VIEW IF EXISTS `salescpi120`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salescpi120` AS SELECT 
 1 AS `id`,
 1 AS `car`,
 1 AS `date`,
 1 AS `customer`,
 1 AS `dealer`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `salesbyfuelincome`
--

/*!50001 DROP VIEW IF EXISTS `salesbyfuelincome`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesbyfuelincome` AS select `cs`.`id` AS `id`,`cs`.`car` AS `car`,`cs`.`date` AS `date`,`cs`.`customer` AS `customer`,`cs`.`dealer` AS `dealer`,`cs`.`price` AS `price` from ((`car_sales` `cs` join `car` `c` on((`cs`.`car` = `c`.`id`))) join `customer` `cu` on((`cs`.`customer` = `cu`.`id`))) where ((`c`.`engine_fuel_type` = 'regular unleaded') and (`cu`.`annual_income` > 82000)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesbymakemodel`
--

/*!50001 DROP VIEW IF EXISTS `salesbymakemodel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesbymakemodel` AS select `c`.`company` AS `company`,`c`.`model` AS `model`,sum(`cs`.`price`) AS `TotalSales` from (`car` `c` join `car_sales` `cs` on((`c`.`id` = `cs`.`car`))) group by `c`.`company`,`c`.`model` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesbympgincome`
--

/*!50001 DROP VIEW IF EXISTS `salesbympgincome`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesbympgincome` AS select `cs`.`id` AS `id`,`cs`.`car` AS `car`,`cs`.`date` AS `date`,`cs`.`customer` AS `customer`,`cs`.`dealer` AS `dealer`,`cs`.`price` AS `price` from ((`car_sales` `cs` join `car` `c` on((`cs`.`car` = `c`.`id`))) join `customer` `cu` on((`cs`.`customer` = `cu`.`id`))) where ((`c`.`city_mpg` < 19) and (`cu`.`annual_income` < 60000)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesbyyrfq`
--

/*!50001 DROP VIEW IF EXISTS `salesbyyrfq`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesbyyrfq` AS select `d`.`year` AS `year`,`d`.`fiscal_quarter` AS `fiscal_quarter`,sum(`cs`.`price`) AS `total_price` from (`car_sales` `cs` join `date` `d` on((`cs`.`date` = `d`.`id`))) group by `d`.`year`,`d`.`fiscal_quarter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salescpi120`
--

/*!50001 DROP VIEW IF EXISTS `salescpi120`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salescpi120` AS select `cs`.`id` AS `id`,`cs`.`car` AS `car`,`cs`.`date` AS `date`,`cs`.`customer` AS `customer`,`cs`.`dealer` AS `dealer`,`cs`.`price` AS `price` from ((`car_sales` `cs` join `date` `d` on((`cs`.`date` = `d`.`id`))) join `cpi` `c` on((`d`.`id` = `c`.`date`))) where (`c`.`cpi_value` > 120) */;
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

-- Dump completed on 2024-04-05 15:33:20
