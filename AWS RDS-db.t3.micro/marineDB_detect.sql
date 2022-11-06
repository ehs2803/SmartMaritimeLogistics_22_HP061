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
-- Table structure for table `detect`
--

DROP TABLE IF EXISTS `detect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `image1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `image2` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `camid` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `df_ibfk_1` (`uid`),
  CONSTRAINT `df_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detect`
--

LOCK TABLES `detect` WRITE;
/*!40000 ALTER TABLE `detect` DISABLE KEYS */;
INSERT INTO `detect` VALUES (1,2,'images/detect/AuthUser object (2)/helmet_2022-08-26_151529_1.jpg','images/detect/AuthUser object (2)/helmet_2022-08-26_151529_2.jpg','2022-08-26 15:15:29','home1','HELMET'),(2,2,'images/detect/AuthUser object (2)/helmet_2022-08-26_151540_1.jpg','images/detect/AuthUser object (2)/helmet_2022-08-26_151540_2.jpg','2022-08-26 15:15:40','home1','HELMET'),(3,2,'images/detect/AuthUser object (2)/helmet_2022-08-26_151555_1.jpg','images/detect/AuthUser object (2)/helmet_2022-08-26_151555_2.jpg','2022-08-26 15:15:55','home1','HELMET'),(4,2,'images/detect/AuthUser object (2)/falldown_2022-08-26_151600_1.jpg','images/detect/AuthUser object (2)/falldown_2022-08-26_151600_2.jpg','2022-08-26 15:16:00','home1','PERSON'),(5,2,'images/detect/AuthUser object (2)/falldown_2022-08-26_151610_1.jpg','images/detect/AuthUser object (2)/falldown_2022-08-26_151610_2.jpg','2022-08-26 15:16:10','home1','PERSON'),(6,2,'images/detect/AuthUser object (2)/helmet_2022-08-26_151617_1.jpg','images/detect/AuthUser object (2)/helmet_2022-08-26_151617_2.jpg','2022-08-26 15:16:17','home1','HELMET'),(7,2,'images/detect/AuthUser object (2)/falldown_2022-08-26_151621_1.jpg','images/detect/AuthUser object (2)/falldown_2022-08-26_151621_2.jpg','2022-08-26 15:16:21','home1','PERSON'),(8,2,'images/detect/AuthUser object (2)/helmet_2022-08-26_151628_1.jpg','images/detect/AuthUser object (2)/helmet_2022-08-26_151628_2.jpg','2022-08-26 15:16:28','home1','HELMET'),(9,2,'images/detect/AuthUser object (2)/falldown_2022-08-26_151631_1.jpg','images/detect/AuthUser object (2)/falldown_2022-08-26_151631_2.jpg','2022-08-26 15:16:31','home1','PERSON'),(10,2,'images/detect/AuthUser object (2)/helmet_2022-08-26_151727_1.jpg','images/detect/AuthUser object (2)/helmet_2022-08-26_151727_2.jpg','2022-08-26 15:17:27','home1','HELMET'),(11,1,'images/detect/AuthUser object (1)/helmet_2022-10-04_231357_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-04_231357_2.jpg','2022-10-04 23:13:57','home1','HELMET'),(12,1,'images/detect/AuthUser object (1)/helmet_2022-10-04_231424_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-04_231424_2.jpg','2022-10-04 23:14:24','home1','HELMET'),(13,1,'images/detect/AuthUser object (1)/helmet_2022-10-04_231436_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-04_231436_2.jpg','2022-10-04 23:14:36','home1','HELMET'),(14,1,'images/detect/AuthUser object (1)/helmet_2022-10-04_231529_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-04_231529_2.jpg','2022-10-04 23:15:29','home1','HELMET'),(15,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_140918_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_140918_2.jpg','2022-10-10 14:09:18','home1','FALLDOWN'),(16,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_140929_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_140929_2.jpg','2022-10-10 14:09:29','home1','FALLDOWN'),(17,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_140939_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_140939_2.jpg','2022-10-10 14:09:39','home1','FALLDOWN'),(18,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_140950_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_140950_2.jpg','2022-10-10 14:09:50','home1','FALLDOWN'),(19,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141000_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141000_2.jpg','2022-10-10 14:10:00','home1','FALLDOWN'),(20,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141010_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141010_2.jpg','2022-10-10 14:10:10','home1','FALLDOWN'),(21,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141031_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141031_2.jpg','2022-10-10 14:10:31','home1','FALLDOWN'),(22,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141041_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141041_2.jpg','2022-10-10 14:10:41','home1','FALLDOWN'),(23,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141052_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141052_2.jpg','2022-10-10 14:10:52','home1','FALLDOWN'),(24,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141102_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141102_2.jpg','2022-10-10 14:11:02','home1','FALLDOWN'),(25,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141112_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141112_2.jpg','2022-10-10 14:11:12','home1','FALLDOWN'),(26,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141123_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141123_2.jpg','2022-10-10 14:11:23','home1','FALLDOWN'),(27,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141133_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141133_2.jpg','2022-10-10 14:11:33','home1','FALLDOWN'),(28,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141144_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141144_2.jpg','2022-10-10 14:11:44','home1','FALLDOWN'),(29,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141155_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141155_2.jpg','2022-10-10 14:11:55','home1','FALLDOWN'),(30,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141205_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141205_2.jpg','2022-10-10 14:12:05','home1','FALLDOWN'),(31,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141215_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141215_2.jpg','2022-10-10 14:12:15','home1','FALLDOWN'),(32,1,'images/detect/AuthUser object (1)/falldown_2022-10-10_141225_1.jpg','images/detect/AuthUser object (1)/falldown_2022-10-10_141225_2.jpg','2022-10-10 14:12:25','home1','FALLDOWN'),(33,1,'images/detect/AuthUser object (1)/helmet_2022-10-11_235349_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-11_235349_2.jpg','2022-10-11 23:53:49','home1','HELMET'),(34,1,'images/detect/AuthUser object (1)/helmet_2022-10-11_235400_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-11_235400_2.jpg','2022-10-11 23:54:00','home1','HELMET'),(35,1,'images/detect/AuthUser object (1)/helmet_2022-10-11_235412_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-11_235412_2.jpg','2022-10-11 23:54:12','home1','HELMET'),(36,1,'images/detect/AuthUser object (1)/helmet_2022-10-11_235426_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-11_235426_2.jpg','2022-10-11 23:54:26','home1','HELMET'),(37,1,'images/detect/AuthUser object (1)/helmet_2022-10-11_235438_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-11_235438_2.jpg','2022-10-11 23:54:38','home1','HELMET'),(38,1,'images/detect/AuthUser object (1)/helmet_2022-10-12_105308_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-12_105308_2.jpg','2022-10-12 10:53:08','home1','HELMET'),(39,1,'images/detect/AuthUser object (1)/helmet_2022-10-12_105319_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-12_105319_2.jpg','2022-10-12 10:53:19','home1','HELMET'),(40,1,'images/detect/AuthUser object (1)/helmet_2022-10-13_093121_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-13_093121_2.jpg','2022-10-13 09:31:21','home1','HELMET'),(41,1,'images/detect/AuthUser object (1)/helmet_2022-10-13_093133_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-13_093133_2.jpg','2022-10-13 09:31:33','home1','HELMET'),(42,1,'images/detect/AuthUser object (1)/helmet_2022-10-13_093145_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-13_093145_2.jpg','2022-10-13 09:31:45','home1','HELMET'),(43,1,'images/detect/AuthUser object (1)/helmet_2022-10-13_093157_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-13_093157_2.jpg','2022-10-13 09:31:57','home1','HELMET'),(44,1,'images/detect/AuthUser object (1)/helmet_2022-10-13_093210_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-13_093210_2.jpg','2022-10-13 09:32:10','home1','HELMET'),(45,1,'images/detect/AuthUser object (1)/helmet_2022-10-13_093222_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-13_093222_2.jpg','2022-10-13 09:32:22','home1','HELMET'),(46,1,'images/detect/AuthUser object (1)/helmet_2022-10-13_093234_1.jpg','images/detect/AuthUser object (1)/helmet_2022-10-13_093234_2.jpg','2022-10-13 09:32:34','home1','HELMET'),(47,1,'images/detect/AuthUser object (1)/person_2022-11-02_131605_1.jpg','images/detect/AuthUser object (1)/person_2022-11-02_131605_2.jpg','2022-11-02 13:16:05','home1','PERSON'),(48,1,'images/detect/AuthUser object (1)/person_2022-11-02_131713_1.jpg','images/detect/AuthUser object (1)/person_2022-11-02_131713_2.jpg','2022-11-02 13:17:13','home1','PERSON'),(49,1,'images/detect/AuthUser object (1)/person_2022-11-02_131723_1.jpg','images/detect/AuthUser object (1)/person_2022-11-02_131723_2.jpg','2022-11-02 13:17:23','home1','PERSON'),(50,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_131740_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_131740_2.jpg','2022-11-02 13:17:40','home1','FALLDOWN'),(51,1,'images/detect/AuthUser object (1)/helmet_2022-11-02_132044_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-02_132044_2.jpg','2022-11-02 13:20:44','home2','HELMET'),(52,1,'images/detect/AuthUser object (1)/fire_2022-11-02_132442_1.jpg','images/detect/AuthUser object (1)/fire_2022-11-02_132442_2.jpg','2022-11-02 13:24:42','home2','FIRE'),(53,1,'images/detect/AuthUser object (1)/fire_2022-11-02_132539_1.jpg','images/detect/AuthUser object (1)/fire_2022-11-02_132539_2.jpg','2022-11-02 13:25:39','home2','FIRE'),(54,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132605_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132605_2.jpg','2022-11-02 13:26:05','home2','FALLDOWN'),(55,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132618_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132618_2.jpg','2022-11-02 13:26:18','home2','FALLDOWN'),(56,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132634_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132634_2.jpg','2022-11-02 13:26:34','home2','FALLDOWN'),(57,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132652_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132652_2.jpg','2022-11-02 13:26:52','home2','FALLDOWN'),(58,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132702_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132702_2.jpg','2022-11-02 13:27:02','home2','FALLDOWN'),(59,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132712_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132712_2.jpg','2022-11-02 13:27:12','home2','FALLDOWN'),(60,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132722_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132722_2.jpg','2022-11-02 13:27:22','home2','FALLDOWN'),(61,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132732_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132732_2.jpg','2022-11-02 13:27:32','home2','FALLDOWN'),(62,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132744_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132744_2.jpg','2022-11-02 13:27:44','home2','FALLDOWN'),(63,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132755_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132755_2.jpg','2022-11-02 13:27:55','home2','FALLDOWN'),(64,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132915_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132915_2.jpg','2022-11-02 13:29:15','home2','FALLDOWN'),(65,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132925_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132925_2.jpg','2022-11-02 13:29:25','home2','FALLDOWN'),(66,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132935_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132935_2.jpg','2022-11-02 13:29:35','home2','FALLDOWN'),(67,1,'images/detect/AuthUser object (1)/falldown_2022-11-02_132945_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-02_132945_2.jpg','2022-11-02 13:29:45','home2','FALLDOWN'),(68,1,'images/detect/AuthUser object (1)/helmet_2022-11-02_133007_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-02_133007_2.jpg','2022-11-02 13:30:07','home2','HELMET'),(69,1,'images/detect/AuthUser object (1)/helmet_2022-11-02_133023_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-02_133023_2.jpg','2022-11-02 13:30:23','home2','HELMET'),(70,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_150944_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_150944_2.jpg','2022-11-04 15:09:44','home2','HELMET'),(71,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_151145_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_151145_2.jpg','2022-11-04 15:11:45','home2','HELMET'),(72,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_151322_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_151322_2.jpg','2022-11-04 15:13:22','home2','HELMET'),(73,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_151357_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_151357_2.jpg','2022-11-04 15:13:57','home2','HELMET'),(74,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_151520_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_151520_2.jpg','2022-11-04 15:15:20','home2','HELMET'),(75,1,'images/detect/AuthUser object (1)/person_2022-11-04_165134_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_165134_2.jpg','2022-11-04 16:51:34','home2','PERSON'),(76,1,'images/detect/AuthUser object (1)/person_2022-11-04_165144_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_165144_2.jpg','2022-11-04 16:51:44','home2','PERSON'),(77,1,'images/detect/AuthUser object (1)/person_2022-11-04_165155_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_165155_2.jpg','2022-11-04 16:51:55','home2','PERSON'),(78,1,'images/detect/AuthUser object (1)/person_2022-11-04_165212_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_165212_2.jpg','2022-11-04 16:52:12','home2','PERSON'),(79,1,'images/detect/AuthUser object (1)/person_2022-11-04_165956_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_165956_2.jpg','2022-11-04 16:59:56','home2','PERSON'),(80,1,'images/detect/AuthUser object (1)/person_2022-11-04_170006_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_170006_2.jpg','2022-11-04 17:00:06','home2','PERSON'),(81,1,'images/detect/AuthUser object (1)/person_2022-11-04_170016_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_170016_2.jpg','2022-11-04 17:00:16','home2','PERSON'),(82,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_171124_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_171124_2.jpg','2022-11-04 17:11:24','home2','HELMET'),(83,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_171145_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_171145_2.jpg','2022-11-04 17:11:45','home2','HELMET'),(84,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_171204_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_171204_2.jpg','2022-11-04 17:12:04','home2','HELMET'),(85,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_171221_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_171221_2.jpg','2022-11-04 17:12:21','home2','HELMET'),(86,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_171234_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_171234_2.jpg','2022-11-04 17:12:34','home2','HELMET'),(87,1,'images/detect/AuthUser object (1)/falldown_2022-11-04_171310_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-04_171310_2.jpg','2022-11-04 17:13:10','home2','FALLDOWN'),(88,1,'images/detect/AuthUser object (1)/falldown_2022-11-04_171320_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-04_171320_2.jpg','2022-11-04 17:13:20','home2','FALLDOWN'),(89,1,'images/detect/AuthUser object (1)/falldown_2022-11-04_171333_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-04_171333_2.jpg','2022-11-04 17:13:33','home2','FALLDOWN'),(90,1,'images/detect/AuthUser object (1)/falldown_2022-11-04_171403_1.jpg','images/detect/AuthUser object (1)/falldown_2022-11-04_171403_2.jpg','2022-11-04 17:14:03','home2','FALLDOWN'),(91,1,'images/detect/AuthUser object (1)/helmet_2022-11-04_205626_1.jpg','images/detect/AuthUser object (1)/helmet_2022-11-04_205626_2.jpg','2022-11-04 20:56:26','home2','HELMET'),(92,1,'images/detect/AuthUser object (1)/fire_2022-11-04_205839_1.jpg','images/detect/AuthUser object (1)/fire_2022-11-04_205839_2.jpg','2022-11-04 20:58:39','home2','FIRE'),(93,1,'images/detect/AuthUser object (1)/fire_2022-11-04_210027_1.jpg','images/detect/AuthUser object (1)/fire_2022-11-04_210027_2.jpg','2022-11-04 21:00:27','home2','FIRE'),(94,1,'images/detect/AuthUser object (1)/fire_2022-11-04_210057_1.jpg','images/detect/AuthUser object (1)/fire_2022-11-04_210057_2.jpg','2022-11-04 21:00:57','home2','FIRE'),(95,1,'images/detect/AuthUser object (1)/fire_2022-11-04_210123_1.jpg','images/detect/AuthUser object (1)/fire_2022-11-04_210123_2.jpg','2022-11-04 21:01:23','home2','FIRE'),(96,1,'images/detect/AuthUser object (1)/person_2022-11-04_210318_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_210318_2.jpg','2022-11-04 21:03:18','home2','PERSON'),(97,1,'images/detect/AuthUser object (1)/person_2022-11-04_210328_1.jpg','images/detect/AuthUser object (1)/person_2022-11-04_210328_2.jpg','2022-11-04 21:03:28','home2','PERSON'),(98,4,'images/detect/AuthUser object (4)/falldown_2022-11-04_214550_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-04_214550_2.jpg','2022-11-04 21:45:50','dock1','FALLDOWN'),(99,4,'images/detect/AuthUser object (4)/falldown_2022-11-04_214625_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-04_214625_2.jpg','2022-11-04 21:46:25','dock1','FALLDOWN'),(100,4,'images/detect/AuthUser object (4)/person_2022-11-04_235130_1.jpg','images/detect/AuthUser object (4)/person_2022-11-04_235130_2.jpg','2022-11-04 23:51:30','dock2','PERSON'),(101,4,'images/detect/AuthUser object (4)/fire_2022-11-05_080556_1.jpg','images/detect/AuthUser object (4)/fire_2022-11-05_080556_2.jpg','2022-11-05 08:05:56','dock1','FIRE'),(102,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_081254_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_081254_2.jpg','2022-11-05 08:12:54','dock1','HELMET'),(103,4,'images/detect/AuthUser object (4)/person_2022-11-05_081330_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_081330_2.jpg','2022-11-05 08:13:30','dock1','PERSON'),(104,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_081334_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_081334_2.jpg','2022-11-05 08:13:34','dock1','HELMET'),(105,4,'images/detect/AuthUser object (4)/person_2022-11-05_110630_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_110630_2.jpg','2022-11-05 11:06:30','dock1','PERSON'),(106,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_110638_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_110638_2.jpg','2022-11-05 11:06:38','dock1','HELMET'),(107,4,'images/detect/AuthUser object (4)/person_2022-11-05_110640_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_110640_2.jpg','2022-11-05 11:06:40','dock1','PERSON'),(108,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_110648_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_110648_2.jpg','2022-11-05 11:06:48','dock1','HELMET'),(109,4,'images/detect/AuthUser object (4)/person_2022-11-05_110650_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_110650_2.jpg','2022-11-05 11:06:50','dock1','PERSON'),(110,4,'images/detect/AuthUser object (4)/person_2022-11-05_110701_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_110701_2.jpg','2022-11-05 11:07:01','dock1','PERSON'),(111,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_110706_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_110706_2.jpg','2022-11-05 11:07:06','dock1','HELMET'),(112,4,'images/detect/AuthUser object (4)/person_2022-11-05_110715_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_110715_2.jpg','2022-11-05 11:07:15','dock1','PERSON'),(113,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_110721_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_110721_2.jpg','2022-11-05 11:07:21','dock1','HELMET'),(114,4,'images/detect/AuthUser object (4)/person_2022-11-05_110728_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_110728_2.jpg','2022-11-05 11:07:28','dock1','PERSON'),(115,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_110850_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_110850_2.jpg','2022-11-05 11:08:50','dock1','FALLDOWN'),(116,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_111004_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_111004_2.jpg','2022-11-05 11:10:04','dock1','FALLDOWN'),(117,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_112521_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_112521_2.jpg','2022-11-05 11:25:21','dock1','FALLDOWN'),(118,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_112553_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_112553_2.jpg','2022-11-05 11:25:53','dock1','FALLDOWN'),(119,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_112605_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_112605_2.jpg','2022-11-05 11:26:05','dock1','FALLDOWN'),(120,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_112643_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_112643_2.jpg','2022-11-05 11:26:43','dock1','FALLDOWN'),(121,4,'images/detect/AuthUser object (4)/fire_2022-11-05_112804_1.jpg','images/detect/AuthUser object (4)/fire_2022-11-05_112804_2.jpg','2022-11-05 11:28:04','dock1','FIRE'),(122,4,'images/detect/AuthUser object (4)/fire_2022-11-05_112815_1.jpg','images/detect/AuthUser object (4)/fire_2022-11-05_112815_2.jpg','2022-11-05 11:28:15','dock1','FIRE'),(123,4,'images/detect/AuthUser object (4)/person_2022-11-05_113048_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_113048_2.jpg','2022-11-05 11:30:48','dock1','PERSON'),(124,4,'images/detect/AuthUser object (4)/person_2022-11-05_113102_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_113102_2.jpg','2022-11-05 11:31:02','dock1','PERSON'),(125,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_113142_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_113142_2.jpg','2022-11-05 11:31:42','dock1','HELMET'),(126,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_113154_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_113154_2.jpg','2022-11-05 11:31:54','dock1','HELMET'),(127,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_113738_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_113738_2.jpg','2022-11-05 11:37:38','dock1','FALLDOWN'),(128,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_113748_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_113748_2.jpg','2022-11-05 11:37:48','dock1','FALLDOWN'),(129,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_120536_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_120536_2.jpg','2022-11-05 12:05:36','dock1','FALLDOWN'),(130,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_120549_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_120549_2.jpg','2022-11-05 12:05:49','dock1','FALLDOWN'),(131,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_120934_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_120934_2.jpg','2022-11-05 12:09:34','dock1','HELMET'),(132,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_120944_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_120944_2.jpg','2022-11-05 12:09:44','dock1','HELMET'),(133,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_121003_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_121003_2.jpg','2022-11-05 12:10:03','dock1','HELMET'),(134,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_121016_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_121016_2.jpg','2022-11-05 12:10:16','dock1','HELMET'),(135,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_121026_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_121026_2.jpg','2022-11-05 12:10:26','dock1','HELMET'),(136,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_121036_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_121036_2.jpg','2022-11-05 12:10:36','dock1','HELMET'),(137,4,'images/detect/AuthUser object (4)/fire_2022-11-05_121315_1.jpg','images/detect/AuthUser object (4)/fire_2022-11-05_121315_2.jpg','2022-11-05 12:13:15','dock1','FIRE'),(138,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_121345_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_121345_2.jpg','2022-11-05 12:13:45','dock1','FALLDOWN'),(139,4,'images/detect/AuthUser object (4)/person_2022-11-05_121447_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_121447_2.jpg','2022-11-05 12:14:47','dock1','PERSON'),(140,4,'images/detect/AuthUser object (4)/person_2022-11-05_121539_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_121539_2.jpg','2022-11-05 12:15:39','dock1','PERSON'),(141,4,'images/detect/AuthUser object (4)/person_2022-11-05_121549_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_121549_2.jpg','2022-11-05 12:15:49','dock1','PERSON'),(142,4,'images/detect/AuthUser object (4)/person_2022-11-05_121559_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_121559_2.jpg','2022-11-05 12:15:59','dock1','PERSON'),(143,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_121610_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_121610_2.jpg','2022-11-05 12:16:10','dock1','HELMET'),(144,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_121620_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_121620_2.jpg','2022-11-05 12:16:20','dock1','HELMET'),(145,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_121631_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_121631_2.jpg','2022-11-05 12:16:31','dock1','HELMET'),(146,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_121645_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_121645_2.jpg','2022-11-05 12:16:45','dock1','HELMET'),(147,4,'images/detect/AuthUser object (4)/person_2022-11-05_123733_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_123733_2.jpg','2022-11-05 12:37:33','dock1','PERSON'),(148,4,'images/detect/AuthUser object (4)/person_2022-11-05_123743_1.jpg','images/detect/AuthUser object (4)/person_2022-11-05_123743_2.jpg','2022-11-05 12:37:43','dock1','PERSON'),(149,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_123815_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_123815_2.jpg','2022-11-05 12:38:15','dock1','HELMET'),(150,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_123828_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_123828_2.jpg','2022-11-05 12:38:28','dock1','HELMET'),(151,4,'images/detect/AuthUser object (4)/helmet_2022-11-05_123839_1.jpg','images/detect/AuthUser object (4)/helmet_2022-11-05_123839_2.jpg','2022-11-05 12:38:39','dock1','HELMET'),(152,4,'images/detect/AuthUser object (4)/fire_2022-11-05_123952_1.jpg','images/detect/AuthUser object (4)/fire_2022-11-05_123952_2.jpg','2022-11-05 12:39:52','dock1','FIRE'),(153,4,'images/detect/AuthUser object (4)/fire_2022-11-05_124003_1.jpg','images/detect/AuthUser object (4)/fire_2022-11-05_124003_2.jpg','2022-11-05 12:40:03','dock1','FIRE'),(154,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_124035_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_124035_2.jpg','2022-11-05 12:40:35','dock1','FALLDOWN'),(155,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_124045_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_124045_2.jpg','2022-11-05 12:40:45','dock1','FALLDOWN'),(156,4,'images/detect/AuthUser object (4)/falldown_2022-11-05_124055_1.jpg','images/detect/AuthUser object (4)/falldown_2022-11-05_124055_2.jpg','2022-11-05 12:40:55','dock1','FALLDOWN');
/*!40000 ALTER TABLE `detect` ENABLE KEYS */;
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

-- Dump completed on 2022-11-06 14:03:39