-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: marine.ctzsnnhkpfq4.ap-northeast-2.rds.amazonaws.com    Database: marineDB
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `alarm`
--

DROP TABLE IF EXISTS `alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `did` int DEFAULT NULL,
  `camid` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirm` int NOT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `al_ibfk_1` (`uid`),
  KEY `al_ibfk_2` (`did`),
  CONSTRAINT `al_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `al_ibfk_2` FOREIGN KEY (`did`) REFERENCES `detect` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarm`
--

LOCK TABLES `alarm` WRITE;
/*!40000 ALTER TABLE `alarm` DISABLE KEYS */;
INSERT INTO `alarm` VALUES (1,2,1,'home1','2022-08-26 15:15:29',1,'HELMET'),(2,2,2,'home1','2022-08-26 15:15:40',1,'HELMET'),(3,2,3,'home1','2022-08-26 15:15:55',1,'HELMET'),(4,2,4,'home1','2022-08-26 15:16:00',1,'FALLDOWN'),(5,2,5,'home1','2022-08-26 15:16:10',1,'FALLDOWN'),(6,2,6,'home1','2022-08-26 15:16:17',1,'HELMET'),(7,2,7,'home1','2022-08-26 15:16:21',1,'FALLDOWN'),(8,2,8,'home1','2022-08-26 15:16:28',1,'HELMET'),(9,2,9,'home1','2022-08-26 15:16:31',1,'FALLDOWN'),(10,2,10,'home1','2022-08-26 15:17:27',1,'HELMET'),(11,1,11,'home1','2022-10-04 23:13:57',1,'HELMET'),(12,1,12,'home1','2022-10-04 23:14:24',1,'HELMET'),(13,1,13,'home1','2022-10-04 23:14:36',1,'HELMET'),(14,1,14,'home1','2022-10-04 23:15:29',1,'HELMET'),(15,1,15,'home1','2022-10-10 14:09:18',1,'FALLDOWN'),(16,1,16,'home1','2022-10-10 14:09:29',1,'FALLDOWN'),(17,1,17,'home1','2022-10-10 14:09:39',1,'FALLDOWN'),(18,1,18,'home1','2022-10-10 14:09:50',1,'FALLDOWN'),(19,1,19,'home1','2022-10-10 14:10:00',1,'FALLDOWN'),(20,1,20,'home1','2022-10-10 14:10:10',1,'FALLDOWN'),(21,1,21,'home1','2022-10-10 14:10:31',1,'FALLDOWN'),(22,1,22,'home1','2022-10-10 14:10:41',1,'FALLDOWN'),(23,1,23,'home1','2022-10-10 14:10:52',1,'FALLDOWN'),(24,1,24,'home1','2022-10-10 14:11:02',1,'FALLDOWN'),(25,1,25,'home1','2022-10-10 14:11:12',1,'FALLDOWN'),(26,1,26,'home1','2022-10-10 14:11:23',1,'FALLDOWN'),(27,1,27,'home1','2022-10-10 14:11:33',1,'FALLDOWN'),(28,1,28,'home1','2022-10-10 14:11:44',1,'FALLDOWN'),(29,1,29,'home1','2022-10-10 14:11:55',1,'FALLDOWN'),(30,1,30,'home1','2022-10-10 14:12:05',1,'FALLDOWN'),(31,1,31,'home1','2022-10-10 14:12:15',1,'FALLDOWN'),(32,1,32,'home1','2022-10-10 14:12:25',1,'FALLDOWN'),(33,1,33,'home1','2022-10-11 23:53:49',1,'HELMET'),(34,1,34,'home1','2022-10-11 23:54:00',1,'HELMET'),(35,1,35,'home1','2022-10-11 23:54:12',1,'HELMET'),(36,1,36,'home1','2022-10-11 23:54:26',1,'HELMET'),(37,1,37,'home1','2022-10-11 23:54:38',1,'HELMET'),(38,1,38,'home1','2022-10-12 10:53:08',1,'HELMET'),(39,1,39,'home1','2022-10-12 10:53:19',1,'HELMET'),(40,1,40,'home1','2022-10-13 09:31:21',1,'HELMET'),(41,1,41,'home1','2022-10-13 09:31:33',1,'HELMET'),(42,1,42,'home1','2022-10-13 09:31:45',1,'HELMET'),(43,1,43,'home1','2022-10-13 09:31:57',1,'HELMET'),(44,1,44,'home1','2022-10-13 09:32:10',1,'HELMET'),(45,1,45,'home1','2022-10-13 09:32:22',1,'HELMET'),(46,1,46,'home1','2022-10-13 09:32:34',1,'HELMET'),(47,1,47,'home1','2022-11-02 13:16:05',1,'PERSON'),(48,1,48,'home1','2022-11-02 13:17:13',1,'PERSON'),(49,1,49,'home1','2022-11-02 13:17:23',1,'PERSON'),(50,1,50,'home1','2022-11-02 13:17:40',1,'FALLDOWN'),(51,1,51,'home2','2022-11-02 13:20:44',1,'HELMET'),(52,1,52,'home2','2022-11-02 13:24:42',1,'FIRE'),(53,1,53,'home2','2022-11-02 13:25:39',1,'FIRE'),(54,1,54,'home2','2022-11-02 13:26:05',1,'FALLDOWN'),(55,1,55,'home2','2022-11-02 13:26:18',1,'FALLDOWN'),(56,1,56,'home2','2022-11-02 13:26:34',1,'FALLDOWN'),(57,1,57,'home2','2022-11-02 13:26:52',1,'FALLDOWN'),(58,1,58,'home2','2022-11-02 13:27:02',1,'FALLDOWN'),(59,1,59,'home2','2022-11-02 13:27:12',1,'FALLDOWN'),(60,1,60,'home2','2022-11-02 13:27:22',1,'FALLDOWN'),(61,1,61,'home2','2022-11-02 13:27:32',1,'FALLDOWN'),(62,1,62,'home2','2022-11-02 13:27:44',1,'FALLDOWN'),(63,1,63,'home2','2022-11-02 13:27:55',1,'FALLDOWN'),(64,1,64,'home2','2022-11-02 13:29:15',1,'FALLDOWN'),(65,1,65,'home2','2022-11-02 13:29:25',1,'FALLDOWN'),(66,1,66,'home2','2022-11-02 13:29:35',1,'FALLDOWN'),(67,1,67,'home2','2022-11-02 13:29:45',1,'FALLDOWN'),(68,1,68,'home2','2022-11-02 13:30:07',1,'HELMET'),(69,1,69,'home2','2022-11-02 13:30:23',1,'HELMET'),(70,1,70,'home2','2022-11-04 15:09:44',1,'HELMET'),(71,1,71,'home2','2022-11-04 15:11:45',1,'HELMET'),(72,1,72,'home2','2022-11-04 15:13:22',1,'HELMET'),(73,1,73,'home2','2022-11-04 15:13:57',1,'HELMET'),(74,1,74,'home2','2022-11-04 15:15:20',1,'HELMET'),(75,1,75,'home2','2022-11-04 16:51:34',1,'PERSON'),(76,1,76,'home2','2022-11-04 16:51:44',1,'PERSON'),(77,1,77,'home2','2022-11-04 16:51:55',1,'PERSON'),(78,1,78,'home2','2022-11-04 16:52:12',1,'PERSON'),(79,1,79,'home2','2022-11-04 16:59:56',1,'PERSON'),(80,1,80,'home2','2022-11-04 17:00:06',1,'PERSON'),(81,1,81,'home2','2022-11-04 17:00:16',1,'PERSON'),(82,1,82,'home2','2022-11-04 17:11:24',1,'HELMET'),(83,1,83,'home2','2022-11-04 17:11:45',1,'HELMET'),(84,1,84,'home2','2022-11-04 17:12:04',1,'HELMET'),(85,1,85,'home2','2022-11-04 17:12:21',1,'HELMET'),(86,1,86,'home2','2022-11-04 17:12:34',1,'HELMET'),(87,1,87,'home2','2022-11-04 17:13:10',1,'FALLDOWN'),(88,1,88,'home2','2022-11-04 17:13:20',1,'FALLDOWN'),(89,1,89,'home2','2022-11-04 17:13:33',1,'FALLDOWN'),(90,1,90,'home2','2022-11-04 17:14:03',1,'FALLDOWN'),(91,1,91,'home2','2022-11-04 20:56:26',1,'HELMET'),(92,1,92,'home2','2022-11-04 20:58:39',1,'FIRE'),(93,1,93,'home2','2022-11-04 21:00:27',1,'FIRE'),(94,1,94,'home2','2022-11-04 21:00:57',1,'FIRE'),(95,1,95,'home2','2022-11-04 21:01:23',1,'FIRE'),(96,1,96,'home2','2022-11-04 21:03:18',1,'PERSON'),(97,1,97,'home2','2022-11-04 21:03:28',1,'PERSON'),(98,4,98,'dock1','2022-11-04 21:45:50',1,'FALLDOWN'),(99,4,99,'dock1','2022-11-04 21:46:25',1,'FALLDOWN'),(100,4,100,'dock2','2022-11-04 23:51:30',1,'PERSON'),(101,4,101,'dock1','2022-11-05 08:05:56',1,'FIRE'),(102,4,102,'dock1','2022-11-05 08:12:54',1,'HELMET'),(103,4,103,'dock1','2022-11-05 08:13:30',1,'PERSON'),(104,4,104,'dock1','2022-11-05 08:13:34',1,'HELMET'),(105,4,105,'dock1','2022-11-05 11:06:30',1,'PERSON'),(106,4,106,'dock1','2022-11-05 11:06:38',1,'HELMET'),(107,4,107,'dock1','2022-11-05 11:06:40',1,'PERSON'),(108,4,108,'dock1','2022-11-05 11:06:48',1,'HELMET'),(109,4,109,'dock1','2022-11-05 11:06:50',1,'PERSON'),(110,4,110,'dock1','2022-11-05 11:07:01',1,'PERSON'),(111,4,111,'dock1','2022-11-05 11:07:06',1,'HELMET'),(112,4,112,'dock1','2022-11-05 11:07:15',1,'PERSON'),(113,4,113,'dock1','2022-11-05 11:07:21',1,'HELMET'),(114,4,114,'dock1','2022-11-05 11:07:28',1,'PERSON'),(115,4,115,'dock1','2022-11-05 11:08:50',1,'FALLDOWN'),(116,4,116,'dock1','2022-11-05 11:10:04',1,'FALLDOWN'),(117,4,117,'dock1','2022-11-05 11:25:21',1,'FALLDOWN'),(118,4,118,'dock1','2022-11-05 11:25:53',1,'FALLDOWN'),(119,4,119,'dock1','2022-11-05 11:26:05',1,'FALLDOWN'),(120,4,120,'dock1','2022-11-05 11:26:43',1,'FALLDOWN'),(121,4,121,'dock1','2022-11-05 11:28:04',1,'FIRE'),(122,4,122,'dock1','2022-11-05 11:28:15',1,'FIRE'),(123,4,123,'dock1','2022-11-05 11:30:48',1,'PERSON'),(124,4,124,'dock1','2022-11-05 11:31:02',1,'PERSON'),(125,4,125,'dock1','2022-11-05 11:31:42',1,'HELMET'),(126,4,126,'dock1','2022-11-05 11:31:54',1,'HELMET'),(127,4,127,'dock1','2022-11-05 11:37:38',1,'FALLDOWN'),(128,4,128,'dock1','2022-11-05 11:37:48',1,'FALLDOWN'),(129,4,129,'dock1','2022-11-05 12:05:36',1,'FALLDOWN'),(130,4,130,'dock1','2022-11-05 12:05:49',1,'FALLDOWN'),(131,4,131,'dock1','2022-11-05 12:09:34',1,'HELMET'),(132,4,132,'dock1','2022-11-05 12:09:44',1,'HELMET'),(133,4,133,'dock1','2022-11-05 12:10:03',1,'HELMET'),(134,4,134,'dock1','2022-11-05 12:10:16',1,'HELMET'),(135,4,135,'dock1','2022-11-05 12:10:26',1,'HELMET'),(136,4,136,'dock1','2022-11-05 12:10:36',1,'HELMET'),(137,4,137,'dock1','2022-11-05 12:13:15',1,'FIRE'),(138,4,138,'dock1','2022-11-05 12:13:45',1,'FALLDOWN'),(139,4,139,'dock1','2022-11-05 12:14:47',1,'PERSON'),(140,4,140,'dock1','2022-11-05 12:15:39',1,'PERSON'),(141,4,141,'dock1','2022-11-05 12:15:49',1,'PERSON'),(142,4,142,'dock1','2022-11-05 12:15:59',1,'PERSON'),(143,4,143,'dock1','2022-11-05 12:16:10',1,'HELMET'),(144,4,144,'dock1','2022-11-05 12:16:20',1,'HELMET'),(145,4,145,'dock1','2022-11-05 12:16:31',1,'HELMET'),(146,4,146,'dock1','2022-11-05 12:16:45',1,'HELMET'),(147,4,147,'dock1','2022-11-05 12:37:33',1,'PERSON'),(148,4,148,'dock1','2022-11-05 12:37:43',1,'PERSON'),(149,4,149,'dock1','2022-11-05 12:38:15',0,'HELMET'),(150,4,150,'dock1','2022-11-05 12:38:28',1,'HELMET'),(151,4,151,'dock1','2022-11-05 12:38:39',0,'HELMET'),(152,4,152,'dock1','2022-11-05 12:39:52',1,'FIRE'),(153,4,153,'dock1','2022-11-05 12:40:03',0,'FIRE'),(154,4,154,'dock1','2022-11-05 12:40:35',1,'FALLDOWN'),(155,4,155,'dock1','2022-11-05 12:40:45',0,'FALLDOWN'),(156,4,156,'dock1','2022-11-05 12:40:55',0,'FALLDOWN');
/*!40000 ALTER TABLE `alarm` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-06 14:03:40