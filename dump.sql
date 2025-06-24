-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: scooter_rental
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Temporary view structure for view `active_rentals`
--

DROP TABLE IF EXISTS `active_rentals`;
/*!50001 DROP VIEW IF EXISTS `active_rentals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `active_rentals` AS SELECT 
 1 AS `rental_id`,
 1 AS `username`,
 1 AS `scooter_model`,
 1 AS `start_time`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `maintenance_id` int NOT NULL AUTO_INCREMENT,
  `scooter_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `service_date` datetime NOT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`maintenance_id`),
  KEY `scooter_id` (`scooter_id`),
  CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`scooter_id`) REFERENCES `scooters` (`scooter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,2,'Замена тормозных колодок','2025-06-15 09:00:00',15.00),(2,3,'Зарядка батареи','2025-06-17 14:30:00',0.00);
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `rental_id` int DEFAULT NULL,
  `type` enum('top-up','charge','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) unsigned NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`user_id`),
  KEY `rental_id` (`rental_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`rental_id`) REFERENCES `rentals` (`rental_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,'top-up',0.00,'rental_start','2025-06-20 17:04:29'),(2,2,2,'top-up',0.00,'rental_start','2025-06-20 17:04:29'),(3,1,1,'top-up',100.00,'card','2025-06-20 17:04:29'),(4,1,1,'charge',45.00,'auto','2025-06-20 17:04:29'),(5,2,NULL,'top-up',50.00,'cash','2025-06-20 17:04:29'),(6,1,3,'top-up',0.00,'rental_start','2025-06-20 17:04:55'),(7,1,1,'charge',4957.50,NULL,'2025-06-20 17:05:03'),(8,1,3,'charge',0.00,NULL,'2025-06-20 17:05:38'),(9,1,NULL,'top-up',500.00,'manual','2025-06-21 02:35:40'),(10,1,1,'refund',100.00,'deposit_return','2025-06-21 02:35:40'),(11,1,1,'refund',280.00,'deposit_return','2025-06-21 02:38:11'),(12,1,NULL,'top-up',500.00,'manual','2025-06-21 02:38:50'),(13,1,NULL,'top-up',500.00,'manual','2025-06-21 02:38:57'),(14,1,NULL,'top-up',600.00,'manual','2025-06-21 02:39:56'),(15,1,1,'refund',140.00,'deposit_return','2025-06-21 02:39:56'),(16,1,1,'refund',140.00,'deposit_return','2025-06-21 02:40:17'),(17,1,1,'refund',280.00,'deposit_return','2025-06-21 02:40:37'),(18,1,NULL,'top-up',500.00,'manual','2025-06-21 02:41:52'),(19,1,1,'charge',100.00,'test_manual','2025-06-21 02:41:52'),(20,1,1,'refund',280.00,'deposit_return','2025-06-21 02:42:07'),(21,1,1,'refund',280.00,'deposit_return','2025-06-21 02:43:09'),(22,1,1,'refund',280.00,'deposit_return','2025-06-21 02:43:20'),(23,1,NULL,'top-up',123.00,'manual','2025-06-21 02:48:19'),(24,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:51'),(25,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:53'),(26,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:53'),(27,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:54'),(28,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:54'),(29,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:54'),(30,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:54'),(31,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:56'),(32,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:56'),(33,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:56'),(34,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:57'),(35,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:57'),(36,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:57'),(37,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:57'),(38,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:57'),(39,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:57'),(40,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:57'),(41,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:57'),(42,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:58'),(43,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:58'),(44,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:58'),(45,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:58'),(46,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:58'),(47,1,1,'refund',280.00,'deposit_return','2025-06-21 02:48:59'),(48,1,4,'top-up',0.00,'rental_start','2025-06-21 02:49:04'),(49,1,4,'charge',300.00,'deposit','2025-06-21 02:49:04'),(50,1,1,'charge',2200.00,'extra_charge','2025-06-21 02:49:27'),(51,1,1,'charge',2200.00,'extra_charge','2025-06-21 02:49:29'),(52,1,1,'refund',0.00,'deposit_return','2025-06-21 02:50:14'),(53,1,5,'top-up',0.00,'rental_start','2025-06-21 02:50:32'),(54,1,5,'charge',300.00,'deposit','2025-06-21 02:50:32'),(55,1,1,'refund',280.00,'deposit_return','2025-06-21 02:50:49'),(56,1,4,'refund',280.00,'deposit_return','2025-06-21 02:51:13'),(57,1,5,'refund',280.00,'deposit_return','2025-06-21 02:51:25'),(58,1,6,'top-up',0.00,'rental_start','2025-06-21 02:51:41'),(59,1,6,'charge',300.00,'deposit','2025-06-21 02:51:41'),(60,1,1,'refund',280.00,'deposit_return','2025-06-21 02:52:02'),(61,1,6,'refund',280.00,'deposit_return','2025-06-21 02:52:49'),(62,1,7,'top-up',0.00,'rental_start','2025-06-21 02:53:04'),(63,1,7,'charge',300.00,'deposit','2025-06-21 02:53:04'),(64,1,7,'refund',0.00,'deposit_return','2025-06-21 02:54:29'),(65,1,8,'top-up',0.00,'rental_start','2025-06-21 02:54:42'),(66,1,8,'charge',300.00,'deposit','2025-06-21 02:54:42'),(67,1,8,'refund',260.00,'deposit_return','2025-06-21 02:55:07'),(68,1,9,'top-up',0.00,'rental_start','2025-06-21 18:18:41'),(69,1,9,'charge',300.00,'deposit','2025-06-21 18:18:41'),(70,1,1,'refund',260.00,'deposit_return','2025-06-21 18:18:53'),(71,1,9,'refund',280.00,'deposit_return','2025-06-21 18:19:19'),(72,1,10,'top-up',0.00,'rental_start','2025-06-24 20:19:47'),(73,1,10,'charge',300.00,'deposit','2025-06-24 20:19:47'),(74,2,NULL,'top-up',500.00,'manual','2025-06-24 20:20:04'),(75,2,11,'top-up',0.00,'rental_start','2025-06-24 20:20:24'),(76,2,11,'charge',300.00,'deposit','2025-06-24 20:20:24'),(77,1,10,'charge',100.00,'extra_charge','2025-06-24 20:20:42'),(78,2,11,'refund',280.00,'deposit_return','2025-06-24 20:20:55');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_balance` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
  DECLARE v_delta DECIMAL(10,2);

  -- Определяем изменение баланса
  SET v_delta = CASE
    WHEN LOWER(NEW.type) = 'top-up'  THEN NEW.amount
    WHEN LOWER(NEW.type) = 'refund'  THEN NEW.amount
    WHEN LOWER(NEW.type) = 'charge'  THEN -NEW.amount
    ELSE 0
  END;

  -- Применяем
  UPDATE users
  SET balance = balance + v_delta
  WHERE user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentals` (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `scooter_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `distance` decimal(8,3) DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `status` enum('active','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`rental_id`),
  KEY `user_id` (`user_id`),
  KEY `scooter_id` (`scooter_id`),
  CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`scooter_id`) REFERENCES `scooters` (`scooter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;
INSERT INTO `rentals` VALUES (1,1,1,'2025-06-18 10:00:00','2025-06-21 18:18:53',2.000,40.00,'completed'),(2,2,3,'2025-06-19 12:30:00','2025-06-21 02:35:40',20.000,400.00,'completed'),(3,1,1,'2025-06-20 17:04:55','2025-06-20 17:05:38',123.000,0.00,'completed'),(4,1,1,'2025-06-21 02:49:04','2025-06-21 02:51:13',1.000,20.00,'completed'),(5,1,1,'2025-06-21 02:50:32','2025-06-21 02:51:25',1.000,20.00,'completed'),(6,1,1,'2025-06-21 02:51:41','2025-06-21 02:52:49',1.000,20.00,'completed'),(7,1,3,'2025-06-21 02:53:04','2025-06-21 02:54:29',15.000,300.00,'completed'),(8,1,1,'2025-06-21 02:54:42','2025-06-21 02:55:07',2.000,40.00,'completed'),(9,1,1,'2025-06-21 18:18:41','2025-06-21 18:19:19',1.000,20.00,'completed'),(10,1,1,'2025-06-24 20:19:47','2025-06-24 20:20:42',20.000,400.00,'completed'),(11,2,3,'2025-06-24 20:20:24','2025-06-24 20:20:55',1.000,20.00,'completed');
/*!40000 ALTER TABLE `rentals` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_rental` AFTER INSERT ON `rentals` FOR EACH ROW BEGIN
  INSERT INTO payments(user_id, rental_id, type, amount, method)
  VALUES (NEW.user_id, NEW.rental_id, 'top-up', 0.00, 'rental_start');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `scooter_usage_stats`
--

DROP TABLE IF EXISTS `scooter_usage_stats`;
/*!50001 DROP VIEW IF EXISTS `scooter_usage_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `scooter_usage_stats` AS SELECT 
 1 AS `scooter_id`,
 1 AS `model`,
 1 AS `rental_count`,
 1 AS `total_km`,
 1 AS `total_income`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `scooters`
--

DROP TABLE IF EXISTS `scooters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scooters` (
  `scooter_id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `battery_level` tinyint unsigned NOT NULL,
  `status` enum('available','rented','maintenance','broken') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `last_service` datetime DEFAULT NULL,
  PRIMARY KEY (`scooter_id`),
  UNIQUE KEY `serial_number` (`serial_number`),
  CONSTRAINT `scooters_chk_1` CHECK ((`battery_level` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scooters`
--

LOCK TABLES `scooters` WRITE;
/*!40000 ALTER TABLE `scooters` DISABLE KEYS */;
INSERT INTO `scooters` VALUES (1,'Ninebot A1','SN1001',85,'available','2025-06-10 10:00:00'),(2,'Xiaomi M365','SN1002',40,'maintenance','2025-06-12 15:30:00'),(3,'Segway ES2','SN1003',15,'available','2025-06-08 09:20:00');
/*!40000 ALTER TABLE `scooters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_rental_summary`
--

DROP TABLE IF EXISTS `user_rental_summary`;
/*!50001 DROP VIEW IF EXISTS `user_rental_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_rental_summary` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `total_rentals`,
 1 AS `total_distance`,
 1 AS `total_spent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alice','e6c3da5b206634d7f3f3586d747ffdb36b5c675757b380c6a5fe5c570c714349','Alice Иванова','alice@example.com','+70000000001','2025-06-20 17:04:29',260.00),(2,'bob','1ba3d16e9881959f8c9a9762854f72c6e6321cdd44358a10a4e939033117eab9','Bob Петров','bob@example.com','+70000000002','2025-06-20 17:04:29',480.00),(3,'carol','3acb59306ef6e660cf832d1d34c4fba3d88d616f0bb5c2a9e0f82d18ef6fc167','Carol Сидорова','carol@example.com','+70000000003','2025-06-20 17:04:29',0.00);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'scooter_rental'
--

--
-- Dumping routines for database 'scooter_rental'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_cost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_cost`(
  p_distance DECIMAL(8,3),
  p_rate     DECIMAL(10,2)
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
  RETURN ROUND(p_distance * p_rate, 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `end_rental` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `end_rental`(
  IN p_rental_id INT,
  IN p_distance  DECIMAL(8,3)
)
BEGIN
  DECLARE v_user_id INT;
  DECLARE v_cost    DECIMAL(8,2);
  DECLARE v_rate_km DECIMAL(5,2) DEFAULT 20.00;
  DECLARE v_deposit DECIMAL(8,2) DEFAULT 300.00;
  DECLARE v_diff    DECIMAL(8,2);
  DECLARE v_balance DECIMAL(10,2);

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'ОШИБКА: завершение аренды отменено' AS result;
  END;

  START TRANSACTION;

    
    SELECT user_id INTO v_user_id
    FROM rentals WHERE rental_id = p_rental_id;

    
    SET v_cost = ROUND(p_distance * v_rate_km, 2);

    
    UPDATE rentals
    SET
      end_time = NOW(),
      distance = p_distance,
      cost     = v_cost,
      status   = 'completed'
    WHERE rental_id = p_rental_id;

    
    UPDATE scooters
    SET status = 'available'
    WHERE scooter_id = (
      SELECT scooter_id FROM rentals WHERE rental_id = p_rental_id
    );

    
    IF v_cost <= v_deposit THEN
      SET v_diff = v_deposit - v_cost;

      
      INSERT INTO payments(user_id, rental_id, type, amount, method)
      VALUES (v_user_id, p_rental_id, 'refund', v_diff, 'deposit_return');
    ELSE
      SET v_diff = v_cost - v_deposit;

      
      SELECT balance INTO v_balance
      FROM users WHERE user_id = v_user_id;

      IF v_balance < v_diff THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недостаточно средств для списания сверх залога';
      END IF;

      
      INSERT INTO payments(user_id, rental_id, type, amount, method)
      VALUES (v_user_id, p_rental_id, 'charge', v_diff, 'extra_charge');
    END IF;

    
    SELECT balance INTO v_balance
    FROM users WHERE user_id = v_user_id;

    IF v_balance < 100 THEN
      SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Внимание: ваш баланс ниже 100 рублей';
    END IF;

  COMMIT;
  SELECT 'УСПЕШНО: аренда завершена' AS result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `start_rental` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `start_rental`(
  IN p_user_id    INT,
  IN p_scooter_id INT
)
BEGIN
  DECLARE v_balance     DECIMAL(8,2);
  DECLARE v_battery     TINYINT UNSIGNED;
  DECLARE v_deposit     DECIMAL(8,2) DEFAULT 300.00;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'ОШИБКА: транзакция отменена' AS result;
  END;

  START TRANSACTION;

    
    SELECT 'Шаг 1: Проверка баланса' AS step;
    SELECT SUM(
      CASE
        WHEN type = 'top-up' THEN amount
        WHEN type = 'refund' THEN amount
        WHEN type = 'charge' THEN -amount
        ELSE 0
      END
    ) INTO v_balance
    FROM payments
    WHERE user_id = p_user_id;

    IF v_balance < v_deposit THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недостаточно средств для залога';
    END IF;

    
    SELECT 'Шаг 2: Проверка батареи' AS step;
    SELECT battery_level INTO v_battery
    FROM scooters
    WHERE scooter_id = p_scooter_id;

    IF v_battery < 5 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Заряд ниже 5% — аренда невозможна';
    ELSEIF v_battery < 20 THEN
      SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Внимание: заряд ниже 20%';
    END IF;

    
    SELECT 'Шаг 3: Обновление статуса самоката' AS step;
    UPDATE scooters
    SET status = 'rented'
    WHERE scooter_id = p_scooter_id AND status = 'available';

    IF ROW_COUNT() = 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Самокат недоступен';
    END IF;

    
    SELECT 'Шаг 4: Создание аренды' AS step;
    INSERT INTO rentals(user_id, scooter_id, start_time)
    VALUES (p_user_id, p_scooter_id, NOW());

    
    SELECT 'Шаг 5: Списание залога' AS step;
    INSERT INTO payments(user_id, rental_id, type, amount, method)
    VALUES (p_user_id, LAST_INSERT_ID(), 'charge', v_deposit, 'deposit');

  COMMIT;

  SELECT 'УСПЕШНО: аренда начата, залог списан' AS result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top_up_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top_up_balance`(
  IN p_user_id INT,
  IN p_amount  DECIMAL(8,2)
)
BEGIN
  INSERT INTO payments(user_id, rental_id, type, amount, method)
  VALUES (p_user_id, NULL, 'top-up', p_amount, 'manual');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `active_rentals`
--

/*!50001 DROP VIEW IF EXISTS `active_rentals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `active_rentals` AS select `r`.`rental_id` AS `rental_id`,`u`.`username` AS `username`,`s`.`model` AS `scooter_model`,`r`.`start_time` AS `start_time`,`r`.`status` AS `status` from ((`rentals` `r` join `users` `u` on((`u`.`user_id` = `r`.`user_id`))) join `scooters` `s` on((`s`.`scooter_id` = `r`.`scooter_id`))) where (`r`.`status` = 'active') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `scooter_usage_stats`
--

/*!50001 DROP VIEW IF EXISTS `scooter_usage_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `scooter_usage_stats` AS select `s`.`scooter_id` AS `scooter_id`,`s`.`model` AS `model`,count(`r`.`rental_id`) AS `rental_count`,ifnull(sum(`r`.`distance`),0) AS `total_km`,ifnull(sum(`r`.`cost`),0) AS `total_income` from (`scooters` `s` left join `rentals` `r` on(((`s`.`scooter_id` = `r`.`scooter_id`) and (`r`.`status` = 'completed')))) group by `s`.`scooter_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_rental_summary`
--

/*!50001 DROP VIEW IF EXISTS `user_rental_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_rental_summary` AS select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,count(`r`.`rental_id`) AS `total_rentals`,ifnull(sum(`r`.`distance`),0) AS `total_distance`,ifnull(sum(`r`.`cost`),0) AS `total_spent` from (`users` `u` left join `rentals` `r` on(((`u`.`user_id` = `r`.`user_id`) and (`r`.`status` = 'completed')))) group by `u`.`user_id` */;
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

-- Dump completed on 2025-06-25  1:09:34
