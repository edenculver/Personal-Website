/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.28-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: edenculver
-- ------------------------------------------------------
-- Server version	10.5.28-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `edenculver`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `edenculver` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `edenculver`;

--
-- Table structure for table `battle_pack`
--

DROP TABLE IF EXISTS `battle_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pack` (
  `set_number` int(11) NOT NULL DEFAULT 0,
  `set_name` varchar(50) NOT NULL,
  `release_year` year(4) NOT NULL,
  `source_id` int(11) NOT NULL,
  `piece_count` int(11) DEFAULT NULL,
  `msrp` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`set_number`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `battle_pack_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle_pack`
--

LOCK TABLES `battle_pack` WRITE;
/*!40000 ALTER TABLE `battle_pack` DISABLE KEYS */;
INSERT INTO `battle_pack` VALUES (7654,'Droids Battle Pack',2007,3,102,9.99);
INSERT INTO `battle_pack` VALUES (7655,'Clone Troopers Battle Pack',2007,3,58,9.99);
INSERT INTO `battle_pack` VALUES (7667,'Imperial Dropship',2008,10,81,9.99);
INSERT INTO `battle_pack` VALUES (7668,'Rebel Scout Speeder',2008,4,82,9.99);
INSERT INTO `battle_pack` VALUES (7913,'Clone Trooper Battle Pack',2011,11,85,12.99);
INSERT INTO `battle_pack` VALUES (7914,'Mandalorian Battle Pack',2011,11,68,12.99);
INSERT INTO `battle_pack` VALUES (8014,'Clone Walker Battle Pack',2009,11,72,11.99);
INSERT INTO `battle_pack` VALUES (8015,'Assassin Droids Battle Pack',2009,11,94,11.99);
INSERT INTO `battle_pack` VALUES (8083,'Rebel Trooper Battle Pack',2010,5,79,11.99);
INSERT INTO `battle_pack` VALUES (8084,'Snowtrooper Battle Pack',2010,5,74,11.99);
INSERT INTO `battle_pack` VALUES (9488,'Elite Clone Trooper & Commando Droid Battle Pack',2012,11,98,12.99);
INSERT INTO `battle_pack` VALUES (9489,'Endor Rebel Trooper & Imperial Trooper Battle Pack',2012,6,77,12.99);
INSERT INTO `battle_pack` VALUES (75000,'Clone Troopers vs. Droidekas',2013,2,124,12.99);
INSERT INTO `battle_pack` VALUES (75001,'Republic Troopers vs. Sith Troopers',2013,12,63,12.99);
INSERT INTO `battle_pack` VALUES (75034,'Death Star Troopers',2014,6,102,12.99);
INSERT INTO `battle_pack` VALUES (75035,'Kashyyyk Troopers',2014,3,99,12.99);
INSERT INTO `battle_pack` VALUES (75036,'Utapau Troopers',2014,3,83,12.99);
INSERT INTO `battle_pack` VALUES (75037,'Battle on Saleucami',2014,3,183,14.99);
INSERT INTO `battle_pack` VALUES (75078,'Imperial Trooper Transport',2015,13,141,12.99);
INSERT INTO `battle_pack` VALUES (75079,'Shadow Troopers',2015,14,95,12.99);
INSERT INTO `battle_pack` VALUES (75088,'Senate Commando Troops',2015,11,106,12.99);
INSERT INTO `battle_pack` VALUES (75089,'Geonosis Troopers',2015,10,105,12.99);
INSERT INTO `battle_pack` VALUES (75131,'Resistance Trooper Battle Pack',2016,7,112,12.99);
INSERT INTO `battle_pack` VALUES (75132,'First Order Battle Pack',2016,7,88,12.99);
INSERT INTO `battle_pack` VALUES (75133,'Rebel Alliance Battle Pack',2016,15,101,12.99);
INSERT INTO `battle_pack` VALUES (75134,'Galactic Empire Battle Pack',2016,15,109,12.99);
INSERT INTO `battle_pack` VALUES (75164,'Rebel Trooper Battle Pack',2017,16,120,14.99);
INSERT INTO `battle_pack` VALUES (75165,'Imperial Trooper Battle Pack',2017,16,112,14.99);
INSERT INTO `battle_pack` VALUES (75166,'First Order Transport Speeder Battle Pack',2017,7,117,14.99);
INSERT INTO `battle_pack` VALUES (75167,'Bounty Hunter Speeder Bike Battle Pack',2017,5,125,14.99);
INSERT INTO `battle_pack` VALUES (75197,'First Order Specialists Battle Pack',2018,8,108,14.99);
INSERT INTO `battle_pack` VALUES (75198,'Tatooine Battle Pack',2018,4,97,14.99);
INSERT INTO `battle_pack` VALUES (75206,'Jedi and Clone Troopers Battle Pack',2018,2,102,14.99);
INSERT INTO `battle_pack` VALUES (75207,'Imperial Patrol Battle Pack',2018,17,99,14.99);
INSERT INTO `battle_pack` VALUES (75225,'Elite Praetorian Guard Battle Pack',2019,8,109,14.99);
INSERT INTO `battle_pack` VALUES (75226,'Inferno Squad Battle Pack',2019,15,118,14.99);
INSERT INTO `battle_pack` VALUES (75262,'Imperial Dropship – 20th Anniversary Edition',2019,10,125,19.99);
INSERT INTO `battle_pack` VALUES (75266,'Sith Troopers Battle Pack',2020,9,105,14.99);
INSERT INTO `battle_pack` VALUES (75267,'Mandalorian Battle Pack',2020,18,102,14.99);
INSERT INTO `battle_pack` VALUES (75280,'501st Legion Clone Troopers',2020,11,285,29.99);
INSERT INTO `battle_pack` VALUES (75320,'Snowtrooper Battle Pack',2022,5,105,19.99);
INSERT INTO `battle_pack` VALUES (75345,'501st Clone Troopers Battle Pack',2023,11,119,19.99);
INSERT INTO `battle_pack` VALUES (75359,'332nd Ahsoka\'s Clone Trooper Battle Pack',2023,11,108,19.99);
INSERT INTO `battle_pack` VALUES (75372,'Clone Trooper & Battle Droid Battle Pack',2024,11,215,29.99);
INSERT INTO `battle_pack` VALUES (75373,'Ambush on Mandalore Battle Pack',2024,18,109,19.99);
INSERT INTO `battle_pack` VALUES (75412,'Death Trooper & Night Trooper Battle Pack',2025,19,119,19.99);
INSERT INTO `battle_pack` VALUES (75431,'327th Star Corps Clone Troopers Battle Pack',2025,3,258,44.99);
/*!40000 ALTER TABLE `battle_pack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battle_pack_has_minifig`
--

DROP TABLE IF EXISTS `battle_pack_has_minifig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pack_has_minifig` (
  `set_number` int(11) NOT NULL,
  `bl_id` varchar(10) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`set_number`,`bl_id`),
  KEY `bl_id` (`bl_id`),
  CONSTRAINT `battle_pack_has_minifig_ibfk_1` FOREIGN KEY (`set_number`) REFERENCES `battle_pack` (`set_number`),
  CONSTRAINT `battle_pack_has_minifig_ibfk_2` FOREIGN KEY (`bl_id`) REFERENCES `minifig` (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle_pack_has_minifig`
--

LOCK TABLES `battle_pack_has_minifig` WRITE;
/*!40000 ALTER TABLE `battle_pack_has_minifig` DISABLE KEYS */;
INSERT INTO `battle_pack_has_minifig` VALUES (7654,'sw0001b',4);
INSERT INTO `battle_pack_has_minifig` VALUES (7654,'sw0092',3);
INSERT INTO `battle_pack_has_minifig` VALUES (7655,'sw0091',1);
INSERT INTO `battle_pack_has_minifig` VALUES (7655,'sw0126',2);
INSERT INTO `battle_pack_has_minifig` VALUES (7655,'sw0128a',1);
INSERT INTO `battle_pack_has_minifig` VALUES (7667,'sw0166a',1);
INSERT INTO `battle_pack_has_minifig` VALUES (7667,'sw0188',3);
INSERT INTO `battle_pack_has_minifig` VALUES (7668,'sw0187',4);
INSERT INTO `battle_pack_has_minifig` VALUES (7913,'sw0297',1);
INSERT INTO `battle_pack_has_minifig` VALUES (7913,'sw0298',1);
INSERT INTO `battle_pack_has_minifig` VALUES (7913,'sw0299',2);
INSERT INTO `battle_pack_has_minifig` VALUES (7914,'sw0296',4);
INSERT INTO `battle_pack_has_minifig` VALUES (8014,'sw0201',2);
INSERT INTO `battle_pack_has_minifig` VALUES (8014,'sw0221',1);
INSERT INTO `battle_pack_has_minifig` VALUES (8014,'sw0223',1);
INSERT INTO `battle_pack_has_minifig` VALUES (8015,'sw0222',2);
INSERT INTO `battle_pack_has_minifig` VALUES (8015,'sw0229',3);
INSERT INTO `battle_pack_has_minifig` VALUES (8083,'sw0258',1);
INSERT INTO `battle_pack_has_minifig` VALUES (8083,'sw0259',2);
INSERT INTO `battle_pack_has_minifig` VALUES (8083,'sw0260',1);
INSERT INTO `battle_pack_has_minifig` VALUES (8084,'sw0115',2);
INSERT INTO `battle_pack_has_minifig` VALUES (8084,'sw0261',1);
INSERT INTO `battle_pack_has_minifig` VALUES (8084,'sw0262',1);
INSERT INTO `battle_pack_has_minifig` VALUES (9488,'sw0359',2);
INSERT INTO `battle_pack_has_minifig` VALUES (9488,'sw0377',1);
INSERT INTO `battle_pack_has_minifig` VALUES (9488,'sw0378',1);
INSERT INTO `battle_pack_has_minifig` VALUES (9489,'sw0005b',1);
INSERT INTO `battle_pack_has_minifig` VALUES (9489,'sw0366',1);
INSERT INTO `battle_pack_has_minifig` VALUES (9489,'sw0367',1);
INSERT INTO `battle_pack_has_minifig` VALUES (9489,'sw0368',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75000,'sw0438',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75000,'sw0441',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75000,'sw0442',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75001,'sw0436',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75001,'sw0440',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75001,'sw0443',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75001,'sw0444',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75034,'sw0520',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75034,'sw0521',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75034,'sw0529',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75035,'sw0518',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75035,'sw0519',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75036,'sw0522',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75036,'sw0523',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75037,'sw0001b',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75037,'sw0001c',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75037,'sw0092',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75037,'sw0524',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75078,'sw0578',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75078,'sw0617',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75079,'sw0603',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75079,'sw0604',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75088,'sw0613',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75088,'sw0614',3);
INSERT INTO `battle_pack_has_minifig` VALUES (75089,'sw0605',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75089,'sw0606',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75131,'sw0696',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75131,'sw0697',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75131,'sw0698',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75131,'sw0699',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75132,'sw0667',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75132,'sw0671',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75132,'sw0694',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75132,'sw0695',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75133,'sw0687',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75133,'sw0688',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75133,'sw0689',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75133,'sw0690',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75134,'sw0691',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75134,'sw0692',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75134,'sw0693',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75164,'sw0803',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75164,'sw0804',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75164,'sw0805',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75164,'sw0806',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75165,'sw0585',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75165,'sw0807',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75166,'sw0666',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75166,'sw0667',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75166,'sw0832',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75167,'sw0751',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75167,'sw0828',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75167,'sw0830',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75167,'sw0831a',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75197,'sw0671',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75197,'sw0871',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75197,'sw0886',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75198,'sw0620',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75198,'sw0895',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75198,'sw0896',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75198,'sw0897',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75206,'sw0909',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75206,'sw0910',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75206,'sw0911',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75207,'sw0912',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75207,'sw0913',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75207,'sw0914',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75225,'sw0905',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75225,'sw0989',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75225,'sw0990',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75225,'sw0998',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75226,'sw0986',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75226,'sw0987',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75226,'sw0988',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75226,'sw1000',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75262,'sw0997b',3);
INSERT INTO `battle_pack_has_minifig` VALUES (75262,'sw1031',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75262,'sw1032',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75266,'sw1065',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75266,'sw1075',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75266,'sw1076',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75267,'sw1077',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75267,'sw1078',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75267,'sw1079',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75267,'sw1080',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75280,'sw0001c',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75280,'sw1093',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75280,'sw1094',3);
INSERT INTO `battle_pack_has_minifig` VALUES (75320,'sw1178',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75320,'sw1179',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75320,'sw1181',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75320,'sw1182',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75345,'sw1246',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75345,'sw1247',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75345,'sw1248',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75359,'sw1276',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75359,'sw1277',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75359,'sw1278',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75372,'sw0001d',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75372,'sw1305',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75372,'sw1319',3);
INSERT INTO `battle_pack_has_minifig` VALUES (75372,'sw1320',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75372,'sw1321',3);
INSERT INTO `battle_pack_has_minifig` VALUES (75373,'sw1344',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75373,'sw1345',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75373,'sw1346',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75412,'sw1358',1);
INSERT INTO `battle_pack_has_minifig` VALUES (75412,'sw1416',2);
INSERT INTO `battle_pack_has_minifig` VALUES (75412,'sw1417',1);
/*!40000 ALTER TABLE `battle_pack_has_minifig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `game_id` int(11) NOT NULL,
  `game_title` varchar(50) NOT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (0,'UNDERTALE');
INSERT INTO `game` VALUES (1,'DELTARUNE Chapter 1');
INSERT INTO `game` VALUES (2,'DELTARUNE Chapter 2');
INSERT INTO `game` VALUES (3,'DELTARUNE Chapter 3');
INSERT INTO `game` VALUES (4,'DELTARUNE Chapter 4');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitmotif`
--

DROP TABLE IF EXISTS `leitmotif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitmotif` (
  `leitmotif_id` int(11) NOT NULL AUTO_INCREMENT,
  `leitmotif_name` varchar(50) NOT NULL,
  PRIMARY KEY (`leitmotif_id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitmotif`
--

LOCK TABLES `leitmotif` WRITE;
/*!40000 ALTER TABLE `leitmotif` DISABLE KEYS */;
INSERT INTO `leitmotif` VALUES (1,'Once Upon a Time');
INSERT INTO `leitmotif` VALUES (2,'Flowey');
INSERT INTO `leitmotif` VALUES (3,'Toriel');
INSERT INTO `leitmotif` VALUES (4,'Determination (Ruins)');
INSERT INTO `leitmotif` VALUES (5,'Uwa');
INSERT INTO `leitmotif` VALUES (6,'Enemy Approaching');
INSERT INTO `leitmotif` VALUES (7,'Ghost Fight');
INSERT INTO `leitmotif` VALUES (8,'Game Over (Determination)');
INSERT INTO `leitmotif` VALUES (9,'Home');
INSERT INTO `leitmotif` VALUES (10,'Heartache');
INSERT INTO `leitmotif` VALUES (11,'Sans');
INSERT INTO `leitmotif` VALUES (12,'Papyrus');
INSERT INTO `leitmotif` VALUES (13,'Monster (Snowdin)');
INSERT INTO `leitmotif` VALUES (14,'Undyne');
INSERT INTO `leitmotif` VALUES (15,'Another Medium');
INSERT INTO `leitmotif` VALUES (16,'Asriel');
INSERT INTO `leitmotif` VALUES (17,'Alphys');
INSERT INTO `leitmotif` VALUES (18,'Dummy Coda');
INSERT INTO `leitmotif` VALUES (19,'Spooktune');
INSERT INTO `leitmotif` VALUES (20,'It\'s Showtime');
INSERT INTO `leitmotif` VALUES (21,'Mettaton');
INSERT INTO `leitmotif` VALUES (22,'Oh! One True Love');
INSERT INTO `leitmotif` VALUES (23,'It\'s Raining Somewhere Else');
INSERT INTO `leitmotif` VALUES (24,'Asgore');
INSERT INTO `leitmotif` VALUES (25,'Your Best Nightmare');
INSERT INTO `leitmotif` VALUES (26,'Battle Against a True Hero');
INSERT INTO `leitmotif` VALUES (101,'Don\'t Forget');
INSERT INTO `leitmotif` VALUES (102,'Hometown');
INSERT INTO `leitmotif` VALUES (103,'Susie');
INSERT INTO `leitmotif` VALUES (104,'Roaring Knight');
INSERT INTO `leitmotif` VALUES (105,'The Legend');
INSERT INTO `leitmotif` VALUES (106,'Lancer');
INSERT INTO `leitmotif` VALUES (107,'Rude Buster');
INSERT INTO `leitmotif` VALUES (108,'Field of Hopes and Dreams');
INSERT INTO `leitmotif` VALUES (109,'Quiet Autumn');
INSERT INTO `leitmotif` VALUES (110,'King');
INSERT INTO `leitmotif` VALUES (111,'Rouxls Kaard');
INSERT INTO `leitmotif` VALUES (112,'Hip Shop');
INSERT INTO `leitmotif` VALUES (113,'Darkness Falls');
INSERT INTO `leitmotif` VALUES (114,'Freedom (The World Revolving)');
INSERT INTO `leitmotif` VALUES (115,'THE HOLY');
INSERT INTO `leitmotif` VALUES (201,'Noelle');
INSERT INTO `leitmotif` VALUES (202,'Queen');
INSERT INTO `leitmotif` VALUES (203,'Cyber City');
INSERT INTO `leitmotif` VALUES (204,'Sweet Cap\'n Cakes');
INSERT INTO `leitmotif` VALUES (205,'Berdly');
INSERT INTO `leitmotif` VALUES (206,'TV Time');
INSERT INTO `leitmotif` VALUES (207,'Spamton');
INSERT INTO `leitmotif` VALUES (301,'Tenna');
INSERT INTO `leitmotif` VALUES (401,'Sanctuary');
INSERT INTO `leitmotif` VALUES (402,'Gerson Boom');
INSERT INTO `leitmotif` VALUES (403,'2nd Sanctuary');
INSERT INTO `leitmotif` VALUES (404,'Titan');
/*!40000 ALTER TABLE `leitmotif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitmotif_in_song`
--

DROP TABLE IF EXISTS `leitmotif_in_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitmotif_in_song` (
  `leitmotif_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `track_number` int(11) NOT NULL,
  PRIMARY KEY (`leitmotif_id`,`game_id`,`track_number`),
  KEY `game_id` (`game_id`,`track_number`),
  CONSTRAINT `leitmotif_in_song_ibfk_1` FOREIGN KEY (`leitmotif_id`) REFERENCES `leitmotif` (`leitmotif_id`),
  CONSTRAINT `leitmotif_in_song_ibfk_2` FOREIGN KEY (`game_id`, `track_number`) REFERENCES `song` (`game_id`, `track_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitmotif_in_song`
--

LOCK TABLES `leitmotif_in_song` WRITE;
/*!40000 ALTER TABLE `leitmotif_in_song` DISABLE KEYS */;
INSERT INTO `leitmotif_in_song` VALUES (1,0,1);
INSERT INTO `leitmotif_in_song` VALUES (1,0,2);
INSERT INTO `leitmotif_in_song` VALUES (1,0,12);
INSERT INTO `leitmotif_in_song` VALUES (1,0,13);
INSERT INTO `leitmotif_in_song` VALUES (1,0,54);
INSERT INTO `leitmotif_in_song` VALUES (1,0,55);
INSERT INTO `leitmotif_in_song` VALUES (1,0,71);
INSERT INTO `leitmotif_in_song` VALUES (1,0,73);
INSERT INTO `leitmotif_in_song` VALUES (1,0,85);
INSERT INTO `leitmotif_in_song` VALUES (1,0,87);
INSERT INTO `leitmotif_in_song` VALUES (1,0,89);
INSERT INTO `leitmotif_in_song` VALUES (1,0,91);
INSERT INTO `leitmotif_in_song` VALUES (1,0,93);
INSERT INTO `leitmotif_in_song` VALUES (1,0,94);
INSERT INTO `leitmotif_in_song` VALUES (1,0,95);
INSERT INTO `leitmotif_in_song` VALUES (1,0,96);
INSERT INTO `leitmotif_in_song` VALUES (1,0,101);
INSERT INTO `leitmotif_in_song` VALUES (1,1,2);
INSERT INTO `leitmotif_in_song` VALUES (1,1,38);
INSERT INTO `leitmotif_in_song` VALUES (1,1,40);
INSERT INTO `leitmotif_in_song` VALUES (2,0,3);
INSERT INTO `leitmotif_in_song` VALUES (2,0,79);
INSERT INTO `leitmotif_in_song` VALUES (2,0,80);
INSERT INTO `leitmotif_in_song` VALUES (2,0,87);
INSERT INTO `leitmotif_in_song` VALUES (2,0,89);
INSERT INTO `leitmotif_in_song` VALUES (2,0,96);
INSERT INTO `leitmotif_in_song` VALUES (3,0,4);
INSERT INTO `leitmotif_in_song` VALUES (3,0,85);
INSERT INTO `leitmotif_in_song` VALUES (3,0,95);
INSERT INTO `leitmotif_in_song` VALUES (4,0,5);
INSERT INTO `leitmotif_in_song` VALUES (4,0,31);
INSERT INTO `leitmotif_in_song` VALUES (4,0,33);
INSERT INTO `leitmotif_in_song` VALUES (4,0,45);
INSERT INTO `leitmotif_in_song` VALUES (4,0,46);
INSERT INTO `leitmotif_in_song` VALUES (4,0,81);
INSERT INTO `leitmotif_in_song` VALUES (4,0,86);
INSERT INTO `leitmotif_in_song` VALUES (4,0,94);
INSERT INTO `leitmotif_in_song` VALUES (4,0,95);
INSERT INTO `leitmotif_in_song` VALUES (4,0,97);
INSERT INTO `leitmotif_in_song` VALUES (4,0,98);
INSERT INTO `leitmotif_in_song` VALUES (4,4,51);
INSERT INTO `leitmotif_in_song` VALUES (4,4,52);
INSERT INTO `leitmotif_in_song` VALUES (4,4,58);
INSERT INTO `leitmotif_in_song` VALUES (4,4,69);
INSERT INTO `leitmotif_in_song` VALUES (5,0,6);
INSERT INTO `leitmotif_in_song` VALUES (5,0,18);
INSERT INTO `leitmotif_in_song` VALUES (5,0,52);
INSERT INTO `leitmotif_in_song` VALUES (5,3,22);
INSERT INTO `leitmotif_in_song` VALUES (6,0,7);
INSERT INTO `leitmotif_in_song` VALUES (6,0,9);
INSERT INTO `leitmotif_in_song` VALUES (6,0,21);
INSERT INTO `leitmotif_in_song` VALUES (6,0,43);
INSERT INTO `leitmotif_in_song` VALUES (6,0,44);
INSERT INTO `leitmotif_in_song` VALUES (6,0,95);
INSERT INTO `leitmotif_in_song` VALUES (7,0,10);
INSERT INTO `leitmotif_in_song` VALUES (7,0,19);
INSERT INTO `leitmotif_in_song` VALUES (7,0,36);
INSERT INTO `leitmotif_in_song` VALUES (7,0,37);
INSERT INTO `leitmotif_in_song` VALUES (7,0,59);
INSERT INTO `leitmotif_in_song` VALUES (7,2,43);
INSERT INTO `leitmotif_in_song` VALUES (7,4,71);
INSERT INTO `leitmotif_in_song` VALUES (8,0,11);
INSERT INTO `leitmotif_in_song` VALUES (8,0,77);
INSERT INTO `leitmotif_in_song` VALUES (8,1,10);
INSERT INTO `leitmotif_in_song` VALUES (8,1,15);
INSERT INTO `leitmotif_in_song` VALUES (8,3,15);
INSERT INTO `leitmotif_in_song` VALUES (9,0,12);
INSERT INTO `leitmotif_in_song` VALUES (9,0,13);
INSERT INTO `leitmotif_in_song` VALUES (9,1,38);
INSERT INTO `leitmotif_in_song` VALUES (10,0,14);
INSERT INTO `leitmotif_in_song` VALUES (10,0,77);
INSERT INTO `leitmotif_in_song` VALUES (11,0,15);
INSERT INTO `leitmotif_in_song` VALUES (11,0,63);
INSERT INTO `leitmotif_in_song` VALUES (11,0,72);
INSERT INTO `leitmotif_in_song` VALUES (11,0,95);
INSERT INTO `leitmotif_in_song` VALUES (12,0,16);
INSERT INTO `leitmotif_in_song` VALUES (12,0,24);
INSERT INTO `leitmotif_in_song` VALUES (12,0,72);
INSERT INTO `leitmotif_in_song` VALUES (12,0,95);
INSERT INTO `leitmotif_in_song` VALUES (13,0,17);
INSERT INTO `leitmotif_in_song` VALUES (13,0,22);
INSERT INTO `leitmotif_in_song` VALUES (13,0,23);
INSERT INTO `leitmotif_in_song` VALUES (13,0,25);
INSERT INTO `leitmotif_in_song` VALUES (13,0,27);
INSERT INTO `leitmotif_in_song` VALUES (13,0,56);
INSERT INTO `leitmotif_in_song` VALUES (13,0,87);
INSERT INTO `leitmotif_in_song` VALUES (13,0,92);
INSERT INTO `leitmotif_in_song` VALUES (13,0,95);
INSERT INTO `leitmotif_in_song` VALUES (13,1,3);
INSERT INTO `leitmotif_in_song` VALUES (13,1,37);
INSERT INTO `leitmotif_in_song` VALUES (13,4,41);
INSERT INTO `leitmotif_in_song` VALUES (14,0,26);
INSERT INTO `leitmotif_in_song` VALUES (14,0,30);
INSERT INTO `leitmotif_in_song` VALUES (14,0,32);
INSERT INTO `leitmotif_in_song` VALUES (14,0,45);
INSERT INTO `leitmotif_in_song` VALUES (14,0,46);
INSERT INTO `leitmotif_in_song` VALUES (14,0,77);
INSERT INTO `leitmotif_in_song` VALUES (14,0,95);
INSERT INTO `leitmotif_in_song` VALUES (14,4,51);
INSERT INTO `leitmotif_in_song` VALUES (14,4,52);
INSERT INTO `leitmotif_in_song` VALUES (14,4,56);
INSERT INTO `leitmotif_in_song` VALUES (14,4,58);
INSERT INTO `leitmotif_in_song` VALUES (14,4,69);
INSERT INTO `leitmotif_in_song` VALUES (15,0,31);
INSERT INTO `leitmotif_in_song` VALUES (15,0,51);
INSERT INTO `leitmotif_in_song` VALUES (15,0,65);
INSERT INTO `leitmotif_in_song` VALUES (15,0,68);
INSERT INTO `leitmotif_in_song` VALUES (15,0,95);
INSERT INTO `leitmotif_in_song` VALUES (16,0,34);
INSERT INTO `leitmotif_in_song` VALUES (16,0,71);
INSERT INTO `leitmotif_in_song` VALUES (16,0,73);
INSERT INTO `leitmotif_in_song` VALUES (16,0,80);
INSERT INTO `leitmotif_in_song` VALUES (16,0,90);
INSERT INTO `leitmotif_in_song` VALUES (17,0,35);
INSERT INTO `leitmotif_in_song` VALUES (17,0,48);
INSERT INTO `leitmotif_in_song` VALUES (17,0,82);
INSERT INTO `leitmotif_in_song` VALUES (17,0,83);
INSERT INTO `leitmotif_in_song` VALUES (18,0,36);
INSERT INTO `leitmotif_in_song` VALUES (18,2,39);
INSERT INTO `leitmotif_in_song` VALUES (19,0,38);
INSERT INTO `leitmotif_in_song` VALUES (19,0,39);
INSERT INTO `leitmotif_in_song` VALUES (19,4,53);
INSERT INTO `leitmotif_in_song` VALUES (20,0,49);
INSERT INTO `leitmotif_in_song` VALUES (20,0,57);
INSERT INTO `leitmotif_in_song` VALUES (20,0,58);
INSERT INTO `leitmotif_in_song` VALUES (20,0,68);
INSERT INTO `leitmotif_in_song` VALUES (21,0,50);
INSERT INTO `leitmotif_in_song` VALUES (21,0,66);
INSERT INTO `leitmotif_in_song` VALUES (21,0,68);
INSERT INTO `leitmotif_in_song` VALUES (22,0,61);
INSERT INTO `leitmotif_in_song` VALUES (22,0,62);
INSERT INTO `leitmotif_in_song` VALUES (22,0,69);
INSERT INTO `leitmotif_in_song` VALUES (23,0,63);
INSERT INTO `leitmotif_in_song` VALUES (23,4,70);
INSERT INTO `leitmotif_in_song` VALUES (24,0,76);
INSERT INTO `leitmotif_in_song` VALUES (24,0,77);
INSERT INTO `leitmotif_in_song` VALUES (24,0,95);
INSERT INTO `leitmotif_in_song` VALUES (25,0,78);
INSERT INTO `leitmotif_in_song` VALUES (25,0,79);
INSERT INTO `leitmotif_in_song` VALUES (25,0,88);
INSERT INTO `leitmotif_in_song` VALUES (25,1,23);
INSERT INTO `leitmotif_in_song` VALUES (25,1,24);
INSERT INTO `leitmotif_in_song` VALUES (25,2,36);
INSERT INTO `leitmotif_in_song` VALUES (25,2,37);
INSERT INTO `leitmotif_in_song` VALUES (25,3,36);
INSERT INTO `leitmotif_in_song` VALUES (25,4,64);
INSERT INTO `leitmotif_in_song` VALUES (26,0,98);
INSERT INTO `leitmotif_in_song` VALUES (26,0,99);
INSERT INTO `leitmotif_in_song` VALUES (26,2,39);
INSERT INTO `leitmotif_in_song` VALUES (26,3,38);
INSERT INTO `leitmotif_in_song` VALUES (101,1,2);
INSERT INTO `leitmotif_in_song` VALUES (101,1,3);
INSERT INTO `leitmotif_in_song` VALUES (101,1,13);
INSERT INTO `leitmotif_in_song` VALUES (101,1,19);
INSERT INTO `leitmotif_in_song` VALUES (101,1,33);
INSERT INTO `leitmotif_in_song` VALUES (101,1,34);
INSERT INTO `leitmotif_in_song` VALUES (101,1,36);
INSERT INTO `leitmotif_in_song` VALUES (101,1,37);
INSERT INTO `leitmotif_in_song` VALUES (101,1,38);
INSERT INTO `leitmotif_in_song` VALUES (101,1,39);
INSERT INTO `leitmotif_in_song` VALUES (101,2,1);
INSERT INTO `leitmotif_in_song` VALUES (101,2,36);
INSERT INTO `leitmotif_in_song` VALUES (101,2,45);
INSERT INTO `leitmotif_in_song` VALUES (101,3,20);
INSERT INTO `leitmotif_in_song` VALUES (101,4,40);
INSERT INTO `leitmotif_in_song` VALUES (101,4,41);
INSERT INTO `leitmotif_in_song` VALUES (101,4,43);
INSERT INTO `leitmotif_in_song` VALUES (101,4,49);
INSERT INTO `leitmotif_in_song` VALUES (101,4,50);
INSERT INTO `leitmotif_in_song` VALUES (101,4,57);
INSERT INTO `leitmotif_in_song` VALUES (101,4,64);
INSERT INTO `leitmotif_in_song` VALUES (101,4,66);
INSERT INTO `leitmotif_in_song` VALUES (101,4,68);
INSERT INTO `leitmotif_in_song` VALUES (101,4,74);
INSERT INTO `leitmotif_in_song` VALUES (102,1,3);
INSERT INTO `leitmotif_in_song` VALUES (102,1,37);
INSERT INTO `leitmotif_in_song` VALUES (102,4,41);
INSERT INTO `leitmotif_in_song` VALUES (103,1,4);
INSERT INTO `leitmotif_in_song` VALUES (103,1,24);
INSERT INTO `leitmotif_in_song` VALUES (104,1,5);
INSERT INTO `leitmotif_in_song` VALUES (104,1,7);
INSERT INTO `leitmotif_in_song` VALUES (104,1,33);
INSERT INTO `leitmotif_in_song` VALUES (104,3,30);
INSERT INTO `leitmotif_in_song` VALUES (105,1,8);
INSERT INTO `leitmotif_in_song` VALUES (105,1,11);
INSERT INTO `leitmotif_in_song` VALUES (105,1,30);
INSERT INTO `leitmotif_in_song` VALUES (105,2,3);
INSERT INTO `leitmotif_in_song` VALUES (105,4,39);
INSERT INTO `leitmotif_in_song` VALUES (105,4,43);
INSERT INTO `leitmotif_in_song` VALUES (105,4,49);
INSERT INTO `leitmotif_in_song` VALUES (105,4,60);
INSERT INTO `leitmotif_in_song` VALUES (105,4,63);
INSERT INTO `leitmotif_in_song` VALUES (105,4,73);
INSERT INTO `leitmotif_in_song` VALUES (106,1,9);
INSERT INTO `leitmotif_in_song` VALUES (106,1,16);
INSERT INTO `leitmotif_in_song` VALUES (106,1,20);
INSERT INTO `leitmotif_in_song` VALUES (106,1,21);
INSERT INTO `leitmotif_in_song` VALUES (106,1,25);
INSERT INTO `leitmotif_in_song` VALUES (106,1,30);
INSERT INTO `leitmotif_in_song` VALUES (106,2,28);
INSERT INTO `leitmotif_in_song` VALUES (106,2,29);
INSERT INTO `leitmotif_in_song` VALUES (106,3,9);
INSERT INTO `leitmotif_in_song` VALUES (107,1,10);
INSERT INTO `leitmotif_in_song` VALUES (107,1,15);
INSERT INTO `leitmotif_in_song` VALUES (107,3,11);
INSERT INTO `leitmotif_in_song` VALUES (107,3,15);
INSERT INTO `leitmotif_in_song` VALUES (108,1,13);
INSERT INTO `leitmotif_in_song` VALUES (108,1,19);
INSERT INTO `leitmotif_in_song` VALUES (109,1,18);
INSERT INTO `leitmotif_in_song` VALUES (109,1,19);
INSERT INTO `leitmotif_in_song` VALUES (110,1,22);
INSERT INTO `leitmotif_in_song` VALUES (110,1,25);
INSERT INTO `leitmotif_in_song` VALUES (110,1,30);
INSERT INTO `leitmotif_in_song` VALUES (111,1,26);
INSERT INTO `leitmotif_in_song` VALUES (111,2,29);
INSERT INTO `leitmotif_in_song` VALUES (112,1,28);
INSERT INTO `leitmotif_in_song` VALUES (112,3,14);
INSERT INTO `leitmotif_in_song` VALUES (112,3,26);
INSERT INTO `leitmotif_in_song` VALUES (112,3,32);
INSERT INTO `leitmotif_in_song` VALUES (113,1,31);
INSERT INTO `leitmotif_in_song` VALUES (113,2,16);
INSERT INTO `leitmotif_in_song` VALUES (114,1,32);
INSERT INTO `leitmotif_in_song` VALUES (114,1,33);
INSERT INTO `leitmotif_in_song` VALUES (114,2,39);
INSERT INTO `leitmotif_in_song` VALUES (114,2,41);
INSERT INTO `leitmotif_in_song` VALUES (114,4,58);
INSERT INTO `leitmotif_in_song` VALUES (114,4,77);
INSERT INTO `leitmotif_in_song` VALUES (115,1,35);
INSERT INTO `leitmotif_in_song` VALUES (115,3,32);
INSERT INTO `leitmotif_in_song` VALUES (115,3,33);
INSERT INTO `leitmotif_in_song` VALUES (201,2,2);
INSERT INTO `leitmotif_in_song` VALUES (201,2,30);
INSERT INTO `leitmotif_in_song` VALUES (201,2,31);
INSERT INTO `leitmotif_in_song` VALUES (201,3,20);
INSERT INTO `leitmotif_in_song` VALUES (201,4,42);
INSERT INTO `leitmotif_in_song` VALUES (201,4,45);
INSERT INTO `leitmotif_in_song` VALUES (201,4,46);
INSERT INTO `leitmotif_in_song` VALUES (202,2,5);
INSERT INTO `leitmotif_in_song` VALUES (202,2,7);
INSERT INTO `leitmotif_in_song` VALUES (202,2,15);
INSERT INTO `leitmotif_in_song` VALUES (202,2,20);
INSERT INTO `leitmotif_in_song` VALUES (202,2,24);
INSERT INTO `leitmotif_in_song` VALUES (202,2,26);
INSERT INTO `leitmotif_in_song` VALUES (202,2,32);
INSERT INTO `leitmotif_in_song` VALUES (202,2,33);
INSERT INTO `leitmotif_in_song` VALUES (202,2,35);
INSERT INTO `leitmotif_in_song` VALUES (202,4,44);
INSERT INTO `leitmotif_in_song` VALUES (203,2,6);
INSERT INTO `leitmotif_in_song` VALUES (203,2,17);
INSERT INTO `leitmotif_in_song` VALUES (204,2,6);
INSERT INTO `leitmotif_in_song` VALUES (204,2,8);
INSERT INTO `leitmotif_in_song` VALUES (204,2,11);
INSERT INTO `leitmotif_in_song` VALUES (204,2,12);
INSERT INTO `leitmotif_in_song` VALUES (204,2,13);
INSERT INTO `leitmotif_in_song` VALUES (204,2,17);
INSERT INTO `leitmotif_in_song` VALUES (204,2,18);
INSERT INTO `leitmotif_in_song` VALUES (204,2,19);
INSERT INTO `leitmotif_in_song` VALUES (205,2,14);
INSERT INTO `leitmotif_in_song` VALUES (205,2,15);
INSERT INTO `leitmotif_in_song` VALUES (205,2,25);
INSERT INTO `leitmotif_in_song` VALUES (205,2,32);
INSERT INTO `leitmotif_in_song` VALUES (205,2,35);
INSERT INTO `leitmotif_in_song` VALUES (205,4,44);
INSERT INTO `leitmotif_in_song` VALUES (206,2,21);
INSERT INTO `leitmotif_in_song` VALUES (206,2,40);
INSERT INTO `leitmotif_in_song` VALUES (206,3,2);
INSERT INTO `leitmotif_in_song` VALUES (206,3,21);
INSERT INTO `leitmotif_in_song` VALUES (206,3,26);
INSERT INTO `leitmotif_in_song` VALUES (206,3,27);
INSERT INTO `leitmotif_in_song` VALUES (206,3,28);
INSERT INTO `leitmotif_in_song` VALUES (206,3,32);
INSERT INTO `leitmotif_in_song` VALUES (206,4,76);
INSERT INTO `leitmotif_in_song` VALUES (207,2,22);
INSERT INTO `leitmotif_in_song` VALUES (207,2,23);
INSERT INTO `leitmotif_in_song` VALUES (207,2,38);
INSERT INTO `leitmotif_in_song` VALUES (207,2,39);
INSERT INTO `leitmotif_in_song` VALUES (207,3,27);
INSERT INTO `leitmotif_in_song` VALUES (207,4,76);
INSERT INTO `leitmotif_in_song` VALUES (207,4,77);
INSERT INTO `leitmotif_in_song` VALUES (301,3,2);
INSERT INTO `leitmotif_in_song` VALUES (301,3,3);
INSERT INTO `leitmotif_in_song` VALUES (301,3,4);
INSERT INTO `leitmotif_in_song` VALUES (301,3,5);
INSERT INTO `leitmotif_in_song` VALUES (301,3,6);
INSERT INTO `leitmotif_in_song` VALUES (301,3,7);
INSERT INTO `leitmotif_in_song` VALUES (301,3,8);
INSERT INTO `leitmotif_in_song` VALUES (301,3,12);
INSERT INTO `leitmotif_in_song` VALUES (301,3,13);
INSERT INTO `leitmotif_in_song` VALUES (301,3,16);
INSERT INTO `leitmotif_in_song` VALUES (301,3,23);
INSERT INTO `leitmotif_in_song` VALUES (301,3,24);
INSERT INTO `leitmotif_in_song` VALUES (301,3,25);
INSERT INTO `leitmotif_in_song` VALUES (301,3,26);
INSERT INTO `leitmotif_in_song` VALUES (301,3,27);
INSERT INTO `leitmotif_in_song` VALUES (301,3,33);
INSERT INTO `leitmotif_in_song` VALUES (301,4,76);
INSERT INTO `leitmotif_in_song` VALUES (401,4,49);
INSERT INTO `leitmotif_in_song` VALUES (401,4,50);
INSERT INTO `leitmotif_in_song` VALUES (401,4,55);
INSERT INTO `leitmotif_in_song` VALUES (401,4,66);
INSERT INTO `leitmotif_in_song` VALUES (401,4,67);
INSERT INTO `leitmotif_in_song` VALUES (401,4,68);
INSERT INTO `leitmotif_in_song` VALUES (401,4,72);
INSERT INTO `leitmotif_in_song` VALUES (402,4,51);
INSERT INTO `leitmotif_in_song` VALUES (402,4,56);
INSERT INTO `leitmotif_in_song` VALUES (402,4,58);
INSERT INTO `leitmotif_in_song` VALUES (402,4,69);
INSERT INTO `leitmotif_in_song` VALUES (403,4,60);
INSERT INTO `leitmotif_in_song` VALUES (403,4,63);
INSERT INTO `leitmotif_in_song` VALUES (404,4,65);
INSERT INTO `leitmotif_in_song` VALUES (404,4,66);
INSERT INTO `leitmotif_in_song` VALUES (404,4,67);
INSERT INTO `leitmotif_in_song` VALUES (404,4,68);
/*!40000 ALTER TABLE `leitmotif_in_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minifig`
--

DROP TABLE IF EXISTS `minifig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `minifig` (
  `bl_id` varchar(10) NOT NULL,
  `minifig_name` varchar(50) NOT NULL,
  `specification` varchar(60) DEFAULT NULL,
  `is_unique` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minifig`
--

LOCK TABLES `minifig` WRITE;
/*!40000 ALTER TABLE `minifig` DISABLE KEYS */;
INSERT INTO `minifig` VALUES ('sw0001b','Battle Droid',NULL,0);
INSERT INTO `minifig` VALUES ('sw0001c','Battle Droid',NULL,0);
INSERT INTO `minifig` VALUES ('sw0001d','Battle Droid',NULL,0);
INSERT INTO `minifig` VALUES ('sw0005b','Scout Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0091','Clone Shock Trooper','Coruscant Guard',1);
INSERT INTO `minifig` VALUES ('sw0092','Super Battle Droid',NULL,0);
INSERT INTO `minifig` VALUES ('sw0115','Snowtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0126','Clone Trooper','Phase II',0);
INSERT INTO `minifig` VALUES ('sw0128a','Clone Trooper','327th Star Corps',1);
INSERT INTO `minifig` VALUES ('sw0166a','Shadow Trooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0187','Rebel Trooper','Fleet Trooper',0);
INSERT INTO `minifig` VALUES ('sw0188','Stormtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0201','Clone Trooper','Phase I',0);
INSERT INTO `minifig` VALUES ('sw0221','Clone Gunner',NULL,0);
INSERT INTO `minifig` VALUES ('sw0222','Elite Assassin Droid',NULL,0);
INSERT INTO `minifig` VALUES ('sw0223','Clone Commander',NULL,1);
INSERT INTO `minifig` VALUES ('sw0229','Assassin Droid',NULL,1);
INSERT INTO `minifig` VALUES ('sw0258','Hoth Officer',NULL,1);
INSERT INTO `minifig` VALUES ('sw0259','Hoth Rebel Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0260','Zev Senesca',NULL,0);
INSERT INTO `minifig` VALUES ('sw0261','Imperial Officer','Battle Armor',1);
INSERT INTO `minifig` VALUES ('sw0262','AT-AT Driver',NULL,0);
INSERT INTO `minifig` VALUES ('sw0296','Mandalorian Death Watch Warrior',NULL,0);
INSERT INTO `minifig` VALUES ('sw0297','ARF Trooper','91st Mobile Reconnaissance Corps, Lightning Squadron',1);
INSERT INTO `minifig` VALUES ('sw0298','Clone Trooper','Horn Company',1);
INSERT INTO `minifig` VALUES ('sw0299','Bomb Squad Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0359','Commando Droid',NULL,0);
INSERT INTO `minifig` VALUES ('sw0366','Stormtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0367','Endor Rebel Trooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0368','Endor Rebel Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0377','ARC Trooper Hammer','Rancor Battalion',1);
INSERT INTO `minifig` VALUES ('sw0378','ARF Trooper','Rancor Battalion',1);
INSERT INTO `minifig` VALUES ('sw0436','Sith Trooper','Red Armor',1);
INSERT INTO `minifig` VALUES ('sw0438','Clone Sergeant',NULL,1);
INSERT INTO `minifig` VALUES ('sw0440','Republic Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0441','Droideka',NULL,1);
INSERT INTO `minifig` VALUES ('sw0442','Clone Trooper','Phase I',0);
INSERT INTO `minifig` VALUES ('sw0443','Sith Trooper','Black Armor',0);
INSERT INTO `minifig` VALUES ('sw0444','Republic Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0518','Clone Scout Trooper','41st Elite Corps, Kashyyyk Camo',0);
INSERT INTO `minifig` VALUES ('sw0519','Clone Trooper','41st Elite Corps, Kashyyyk Camo',0);
INSERT INTO `minifig` VALUES ('sw0520','Imperial Gunner',NULL,1);
INSERT INTO `minifig` VALUES ('sw0521','Royal Guard',NULL,0);
INSERT INTO `minifig` VALUES ('sw0522','Clone Trooper','212th Attack Battalion',1);
INSERT INTO `minifig` VALUES ('sw0523','Airborne Trooper','212th Attack Battalion',1);
INSERT INTO `minifig` VALUES ('sw0524','BARC Trooper','91st Mobile Reconnaissance Corps',1);
INSERT INTO `minifig` VALUES ('sw0529','Imperial Gunner',NULL,0);
INSERT INTO `minifig` VALUES ('sw0578','Stormtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0585','Stormtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0603','Shadow Stormtrooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0604','Shadow Guard',NULL,1);
INSERT INTO `minifig` VALUES ('sw0605','Airborne Trooper','Geonosis Camo',1);
INSERT INTO `minifig` VALUES ('sw0606','Clone Trooper','Geonosis Camo',1);
INSERT INTO `minifig` VALUES ('sw0613','Senate Commando Captain',NULL,1);
INSERT INTO `minifig` VALUES ('sw0614','Senate Commando',NULL,1);
INSERT INTO `minifig` VALUES ('sw0617','Stormtrooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0620','Tusken Raider',NULL,0);
INSERT INTO `minifig` VALUES ('sw0666','First Order Flametrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0667','First Order Stormtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0671','First Order Fleet Engineer',NULL,0);
INSERT INTO `minifig` VALUES ('sw0687','Rodian Alliance Fighter',NULL,1);
INSERT INTO `minifig` VALUES ('sw0688','Rebel Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0689','Duros Alliance Fighter',NULL,1);
INSERT INTO `minifig` VALUES ('sw0690','Rebel Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0691','Jump Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0692','Imperial Shock Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0693','Imperial Crewman',NULL,1);
INSERT INTO `minifig` VALUES ('sw0694','First Order Crewman',NULL,1);
INSERT INTO `minifig` VALUES ('sw0695','First Order Heavy Assault Stormtrooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0696','Resistance Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0697','Resistance Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0698','Resistance Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0699','Resistance Officer',NULL,1);
INSERT INTO `minifig` VALUES ('sw0751','Dengar',NULL,0);
INSERT INTO `minifig` VALUES ('sw0803','Private Kappehl','Rebel Trooper',1);
INSERT INTO `minifig` VALUES ('sw0804','Corporal Rostok','Rebel Trooper',1);
INSERT INTO `minifig` VALUES ('sw0805','Private Calfor','Rebel Trooper',1);
INSERT INTO `minifig` VALUES ('sw0806','Corporal Tonc','Rebel Trooper',1);
INSERT INTO `minifig` VALUES ('sw0807','Death Trooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0828','Bossk',NULL,1);
INSERT INTO `minifig` VALUES ('sw0830','4-LOM',NULL,0);
INSERT INTO `minifig` VALUES ('sw0831a','IG-88',NULL,0);
INSERT INTO `minifig` VALUES ('sw0832','Colonel Datoo','First Order Officer',1);
INSERT INTO `minifig` VALUES ('sw0871','First Order Shuttle Pilot',NULL,0);
INSERT INTO `minifig` VALUES ('sw0886','First Order Stormtrooper Executioner',NULL,1);
INSERT INTO `minifig` VALUES ('sw0895','R3-T2',NULL,1);
INSERT INTO `minifig` VALUES ('sw0896','Jawa',NULL,0);
INSERT INTO `minifig` VALUES ('sw0897','Jawa',NULL,0);
INSERT INTO `minifig` VALUES ('sw0905','First Order Stormtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0909','Barriss Offee',NULL,1);
INSERT INTO `minifig` VALUES ('sw0910','Clone Trooper','Phase I',1);
INSERT INTO `minifig` VALUES ('sw0911','Ki-Adi-Mundi',NULL,1);
INSERT INTO `minifig` VALUES ('sw0912','Corporal Latt','Imperial Emigration Officer',1);
INSERT INTO `minifig` VALUES ('sw0913','Imperial Recruitment Officer',NULL,1);
INSERT INTO `minifig` VALUES ('sw0914','Imperial Patrol Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw0986','Inferno Squad Agent',NULL,1);
INSERT INTO `minifig` VALUES ('sw0987','Inferno Squad Agent',NULL,1);
INSERT INTO `minifig` VALUES ('sw0988','Inferno Squad Agent',NULL,1);
INSERT INTO `minifig` VALUES ('sw0989','Elite Praetorian Guard',NULL,1);
INSERT INTO `minifig` VALUES ('sw0990','Elite Praetorian Guard',NULL,0);
INSERT INTO `minifig` VALUES ('sw0997b','Stormtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw0998','Praetorian Training Droid',NULL,1);
INSERT INTO `minifig` VALUES ('sw1000','Iden Versio','Inferno Squad Commander',1);
INSERT INTO `minifig` VALUES ('sw1031','Shadow Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw1032','Han Solo','20th Anniversary',1);
INSERT INTO `minifig` VALUES ('sw1065','Sith Trooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw1075','Sith Jet Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw1076','Sith Fleet Officer',NULL,1);
INSERT INTO `minifig` VALUES ('sw1077','Mandalorian Tribe Warrior',NULL,1);
INSERT INTO `minifig` VALUES ('sw1078','Mandalorian Tribe Warrior',NULL,0);
INSERT INTO `minifig` VALUES ('sw1079','Mandalorian Tribe Warrior',NULL,1);
INSERT INTO `minifig` VALUES ('sw1080','Mandalorian Tribe Warrior',NULL,1);
INSERT INTO `minifig` VALUES ('sw1093','Clone Jet Trooper','501st Legion',1);
INSERT INTO `minifig` VALUES ('sw1094','Clone Trooper','501st Legion',0);
INSERT INTO `minifig` VALUES ('sw1178','Snowtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw1179','Snowtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw1181','Snowtrooper',NULL,0);
INSERT INTO `minifig` VALUES ('sw1182','Scout Trooper','Hoth',1);
INSERT INTO `minifig` VALUES ('sw1246','Clone Officer','501st Legion',1);
INSERT INTO `minifig` VALUES ('sw1247','Clone Heavy Trooper','501st Legion',1);
INSERT INTO `minifig` VALUES ('sw1248','Clone Specialist','501st Legion',1);
INSERT INTO `minifig` VALUES ('sw1276','Clone Trooper','501st Legion, 332nd Company',1);
INSERT INTO `minifig` VALUES ('sw1277','Captain Vaughn','501st Legion, 332nd Company',1);
INSERT INTO `minifig` VALUES ('sw1278','Clone Trooper','501st Legion, 332nd Company',1);
INSERT INTO `minifig` VALUES ('sw1305','Clone Shock Trooper','Coruscant Guard',1);
INSERT INTO `minifig` VALUES ('sw1319','Clone Trooper','Phase II',1);
INSERT INTO `minifig` VALUES ('sw1320','Battle Droid',NULL,1);
INSERT INTO `minifig` VALUES ('sw1321','Super Battle Droid',NULL,0);
INSERT INTO `minifig` VALUES ('sw1344','Mandalorian Nite Owl',NULL,1);
INSERT INTO `minifig` VALUES ('sw1345','Mandalorian Warrior',NULL,1);
INSERT INTO `minifig` VALUES ('sw1346','Imperial Commando',NULL,1);
INSERT INTO `minifig` VALUES ('sw1358','Night Trooper',NULL,1);
INSERT INTO `minifig` VALUES ('sw1416','Death Trooper','Thrawn',1);
INSERT INTO `minifig` VALUES ('sw1417','Night Trooper',NULL,1);
/*!40000 ALTER TABLE `minifig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `game_id` int(11) NOT NULL,
  `track_number` int(11) NOT NULL,
  `track_title` varchar(100) NOT NULL,
  `spotify_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`game_id`,`track_number`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (0,1,'Once Upon a Time','https://open.spotify.com/track/4XX5uZb9PvTKh8Nm2KSJfk');
INSERT INTO `song` VALUES (0,2,'Start Menu','https://open.spotify.com/track/5pb39nk7Wr8e0aMQ6VUdlr');
INSERT INTO `song` VALUES (0,3,'Your Best Friend','https://open.spotify.com/track/6gJTgSwOw2TqAPCnk2gTlk');
INSERT INTO `song` VALUES (0,4,'Fallen Down','https://open.spotify.com/track/1jDMi92a9zNQuPD3uPMkla');
INSERT INTO `song` VALUES (0,5,'Ruins','https://open.spotify.com/track/1vuSdk2EGjh3eXCXBbT9Qf');
INSERT INTO `song` VALUES (0,6,'Uwa!! So Temperate♫','https://open.spotify.com/track/3PV4bPPqezu18K45MIOrVY');
INSERT INTO `song` VALUES (0,7,'Anticipation','https://open.spotify.com/track/5qmsdZZamDrOAq5wKCuSKC');
INSERT INTO `song` VALUES (0,8,'Unnecessary Tension','https://open.spotify.com/track/184lW8f9jvoShhMV8o6BuW');
INSERT INTO `song` VALUES (0,9,'Enemy Approaching','https://open.spotify.com/track/5iOTHhi2C3mHSn007Neqcg');
INSERT INTO `song` VALUES (0,10,'Ghost Fight','https://open.spotify.com/track/36AhCvv8NAVPr0eNsv2PrW');
INSERT INTO `song` VALUES (0,11,'Determination','https://open.spotify.com/track/3KHbBpwYdlM6uKJirvCrEA');
INSERT INTO `song` VALUES (0,12,'Home','https://open.spotify.com/track/5L9MJsGqzTRD09rSzHkCDy');
INSERT INTO `song` VALUES (0,13,'Home (Music Box)','https://open.spotify.com/track/1DkjqnjgbbpT7cYL2D2ma4');
INSERT INTO `song` VALUES (0,14,'Heartache','https://open.spotify.com/track/2bvbLvGD7YnS4Nhf9E4hUl');
INSERT INTO `song` VALUES (0,15,'sans.','https://open.spotify.com/track/26lWYpgbcknITI0Fy1eZDs');
INSERT INTO `song` VALUES (0,16,'Nyeh Heh Heh!','https://open.spotify.com/track/6YEGQH32aAXb9vQQbBrPlw');
INSERT INTO `song` VALUES (0,17,'Snowy','https://open.spotify.com/track/7Af5aQzfpm2VxnCFsy6Tkx');
INSERT INTO `song` VALUES (0,18,'Uwa!! So Holiday♫','https://open.spotify.com/track/4mWFafcREuKWv2MeTVxDlQ');
INSERT INTO `song` VALUES (0,19,'Dogbass','https://open.spotify.com/track/1ynRabP8jaySeRvHBejfCT');
INSERT INTO `song` VALUES (0,20,'Mysterious Place','https://open.spotify.com/track/79HBiklNqtQXln5ocHUR3B');
INSERT INTO `song` VALUES (0,21,'Dogsong','https://open.spotify.com/track/23aRUhe4gmS4Bh7DUZecL4');
INSERT INTO `song` VALUES (0,22,'Snowdin Town','https://open.spotify.com/track/6VhLpbQlPWgU11As8woUIC');
INSERT INTO `song` VALUES (0,23,'Shop','https://open.spotify.com/track/5OyWN37xTdZtjbSQ15FA8K');
INSERT INTO `song` VALUES (0,24,'Bonetrousle','https://open.spotify.com/track/2AtC6i0b8TjpjhWBZYLprX');
INSERT INTO `song` VALUES (0,25,'Dating Start!','https://open.spotify.com/track/0R3JgweOfGl9kPxyd5DFC8');
INSERT INTO `song` VALUES (0,26,'Dating Tense!','https://open.spotify.com/track/0FnCnFGi6TKQSFDvxiCCuF');
INSERT INTO `song` VALUES (0,27,'Dating Fight!','https://open.spotify.com/track/0KQnhlCVldP6qicvBy9IJ5');
INSERT INTO `song` VALUES (0,28,'Premonition','https://open.spotify.com/track/2acj21k56lNshKpVAYF7DR');
INSERT INTO `song` VALUES (0,29,'Danger Mystery','https://open.spotify.com/track/3577RkKMcLN7NKeqNDjLQw');
INSERT INTO `song` VALUES (0,30,'Undyne','https://open.spotify.com/track/1MoAGaJNyPwaLSB6iTLNg1');
INSERT INTO `song` VALUES (0,31,'Waterfall','https://open.spotify.com/track/2N2lDDaucbMUw1I1GxBrbc');
INSERT INTO `song` VALUES (0,32,'Run!','https://open.spotify.com/track/6d3RasED8YglcjKywHGnKd');
INSERT INTO `song` VALUES (0,33,'Quiet Water','https://open.spotify.com/track/0gt76DuMx7F3UZJPg7jcC5');
INSERT INTO `song` VALUES (0,34,'Memory','https://open.spotify.com/track/4LrlsO9cnnNjxBiHeRedjF');
INSERT INTO `song` VALUES (0,35,'Bird That Carries You Over A Disproportionately Small Gap','https://open.spotify.com/track/5YfXQD5Jn5o5Wxay5pDL3j');
INSERT INTO `song` VALUES (0,36,'Dummy!','https://open.spotify.com/track/6ZEenbPqCbKxPmu49taU8u');
INSERT INTO `song` VALUES (0,37,'Pathetic House','https://open.spotify.com/track/4uDhRzIuby0r2dOD7DdYhA');
INSERT INTO `song` VALUES (0,38,'Spooktune','https://open.spotify.com/track/7jxPl7YKBJuLEgG2iuQ86u');
INSERT INTO `song` VALUES (0,39,'Spookwave','https://open.spotify.com/track/7IOkjKXVKvVoWNZCILCQNS');
INSERT INTO `song` VALUES (0,40,'Ghouliday','https://open.spotify.com/track/2ErNeINBpB3nr64KRi9JUS');
INSERT INTO `song` VALUES (0,41,'Chill','https://open.spotify.com/track/7aETfVDs6MnQg6uyEhhpro');
INSERT INTO `song` VALUES (0,42,'Thundersnail','https://open.spotify.com/track/47nTwghY7OBlUhnrp0npNp');
INSERT INTO `song` VALUES (0,43,'Temmie Village','https://open.spotify.com/track/7ym2c9z3JgkXVEQDk0sKn8');
INSERT INTO `song` VALUES (0,44,'Tem Shop','https://open.spotify.com/track/3SVrOYdMaqeW56eHfw7ScX');
INSERT INTO `song` VALUES (0,45,'NGAHHH!!','https://open.spotify.com/track/5Q2YHimqwRHoPifb3H8Nlo');
INSERT INTO `song` VALUES (0,46,'Spear of Justice','https://open.spotify.com/track/0wae8KoprNjfrXWjYYHGy9');
INSERT INTO `song` VALUES (0,47,'Ooo','https://open.spotify.com/track/6MpL0zLvaHKjWFZQjwBnFB');
INSERT INTO `song` VALUES (0,48,'Alphys','https://open.spotify.com/track/5Prf4wpKlnsqj9HTSW4BjW');
INSERT INTO `song` VALUES (0,49,'It\'s Showtime!','https://open.spotify.com/track/5lLuAtrQXTi204GNxkEenv');
INSERT INTO `song` VALUES (0,50,'Metal Crusher','https://open.spotify.com/track/6ZT36tXEKY2vvTCuNK4fi1');
INSERT INTO `song` VALUES (0,51,'Another Medium','https://open.spotify.com/track/3eQijz4pPT7rb020LqdhdX');
INSERT INTO `song` VALUES (0,52,'Uwa!! So HEATS!!♫','https://open.spotify.com/track/31Delkg9AZ1B4vmMrtJToF');
INSERT INTO `song` VALUES (0,53,'Stronger Monsters','https://open.spotify.com/track/0ROETpoLOKjq61LjwxNz92');
INSERT INTO `song` VALUES (0,54,'Hotel','https://open.spotify.com/track/0Tz2tckjhEvAppdWHsgqg6');
INSERT INTO `song` VALUES (0,55,'Can You Really Call This A Hotel, I Didn\'t Receive A Mint On My Pillow Or Anything','https://open.spotify.com/track/3llcyZnL04lIUQAiBCFng1');
INSERT INTO `song` VALUES (0,56,'Confession','https://open.spotify.com/track/1vIZ87PlB1PFABFX6W5DJ6');
INSERT INTO `song` VALUES (0,57,'Live Report','https://open.spotify.com/track/755DqpjjxuMQKAKdwvJ77Y');
INSERT INTO `song` VALUES (0,58,'Death Report','https://open.spotify.com/track/569EMDdG2cW670EchBfdfO');
INSERT INTO `song` VALUES (0,59,'Spider Dance','https://open.spotify.com/track/3aiGshuqYhdBBBhHqRf6jn');
INSERT INTO `song` VALUES (0,60,'Wrong Enemy !?','https://open.spotify.com/track/5R8oeZeq8AUiJuz5FIPR9m');
INSERT INTO `song` VALUES (0,61,'Oh! One True Love','https://open.spotify.com/track/4wBMMqeY2NnFnStBIPHxyG');
INSERT INTO `song` VALUES (0,62,'Oh! Dungeon','https://open.spotify.com/track/68QEE1JPRjEBbdhzpEIKGZ');
INSERT INTO `song` VALUES (0,63,'It\'s Raining Somewhere Else','https://open.spotify.com/track/5z4vmar50qPl80GjIrPBXm');
INSERT INTO `song` VALUES (0,64,'CORE Approach','https://open.spotify.com/track/1PVw70FUrm08BuED8bdiPb');
INSERT INTO `song` VALUES (0,65,'CORE','https://open.spotify.com/track/5JyEFY05sV5Z8z5Bj7HQ1J');
INSERT INTO `song` VALUES (0,66,'Last Episode!','https://open.spotify.com/track/3zoav3LSItdvh7fj0iE43t');
INSERT INTO `song` VALUES (0,67,'Oh My...','https://open.spotify.com/track/6CBsGV6sv811sRb4sNBmcl');
INSERT INTO `song` VALUES (0,68,'Death by Glamour','https://open.spotify.com/track/7BGZ27yeaKR5OZOIxyegZi');
INSERT INTO `song` VALUES (0,69,'For the Fans','https://open.spotify.com/track/39pQcPmAdzhvmmGwyyPatD');
INSERT INTO `song` VALUES (0,70,'Long Elevator','https://open.spotify.com/track/3bmbaQXM98fEAoQotiNu9Q');
INSERT INTO `song` VALUES (0,71,'Undertale','https://open.spotify.com/track/2FZ99j224ohiGLavqjijza');
INSERT INTO `song` VALUES (0,72,'Song That Might Play When You Fight Sans','https://open.spotify.com/track/4OOA9mtwTevG39jcALusOu');
INSERT INTO `song` VALUES (0,73,'The Choice','https://open.spotify.com/track/6NhXSjpsasGw0dad5CxBYu');
INSERT INTO `song` VALUES (0,74,'Small Shock','https://open.spotify.com/track/7g2vS40kPg9PVMc8muxzBb');
INSERT INTO `song` VALUES (0,75,'Barrier','https://open.spotify.com/track/4UJoJcVKSuek1PaFdg238X');
INSERT INTO `song` VALUES (0,76,'Bergentrückung','https://open.spotify.com/track/7txouAZgjqHcIPQQTzojyv');
INSERT INTO `song` VALUES (0,77,'ASGORE','https://open.spotify.com/track/0ybMBs8mKdAP9WSnFTiZvs');
INSERT INTO `song` VALUES (0,78,'You Idiot','https://open.spotify.com/track/2RgL4ee5hWEik9TW6EHvbe');
INSERT INTO `song` VALUES (0,79,'Your Best Nightmare','https://open.spotify.com/track/723rnBXRc09umUfsasI6Cd');
INSERT INTO `song` VALUES (0,80,'Finale','https://open.spotify.com/track/4kNKL8kCCV3vt9U2k28Lyx');
INSERT INTO `song` VALUES (0,81,'An Ending','https://open.spotify.com/track/6eTcxkl9G7C2mwejLJ7Amm');
INSERT INTO `song` VALUES (0,82,'She\'s Playing Piano','https://open.spotify.com/track/3JoyM8nj4rQMha1uBAFgOB');
INSERT INTO `song` VALUES (0,83,'Here We Are','https://open.spotify.com/track/3BNy5x10fy5dG6JIgrimZI');
INSERT INTO `song` VALUES (0,84,'Amalgam','https://open.spotify.com/track/4uS9yFLe90uxnAz5VXqHQv');
INSERT INTO `song` VALUES (0,85,'Fallen Down (Reprise)','https://open.spotify.com/track/23b9BdZ2WZnDSeDzNUTVvZ');
INSERT INTO `song` VALUES (0,86,'Don\'t Give Up','https://open.spotify.com/track/4Yqrr5SMB84skeJ8cupJgs');
INSERT INTO `song` VALUES (0,87,'Hopes and Dreams','https://open.spotify.com/track/7CMVo848b9LsUtVavIoiXC');
INSERT INTO `song` VALUES (0,88,'Burn in Despair!','https://open.spotify.com/track/0bJIXo7oEFC7YuEAEd44SL');
INSERT INTO `song` VALUES (0,89,'SAVE the World','https://open.spotify.com/track/0w5CRIokPrQAAq7OdIKesr');
INSERT INTO `song` VALUES (0,90,'His Theme','https://open.spotify.com/track/46A71ZDLPRIFCppAdV2W6j');
INSERT INTO `song` VALUES (0,91,'Final Power','https://open.spotify.com/track/0t3tVUVhg7qOMeIzv8MwS0');
INSERT INTO `song` VALUES (0,92,'Reunited','https://open.spotify.com/track/4Gk2tZ5l4O3MG1UMm0dTcd');
INSERT INTO `song` VALUES (0,93,'Menu (Full)','https://open.spotify.com/track/1o7aArKOIkgCQucVQI7LvM');
INSERT INTO `song` VALUES (0,94,'Respite','https://open.spotify.com/track/4WYlewJtfeVhAoPlApq5fu');
INSERT INTO `song` VALUES (0,95,'Bring It In, Guys!','https://open.spotify.com/track/2uJGEsQ1pvi0pDqxTcDxIj');
INSERT INTO `song` VALUES (0,96,'Last Goodbye','https://open.spotify.com/track/3KsJYk6EDfkDZZM7CWcLWA');
INSERT INTO `song` VALUES (0,97,'But the Earth Refused to Die','https://open.spotify.com/track/21Aur7G0jPU49v0Ag7ul4l');
INSERT INTO `song` VALUES (0,98,'Battle Against a True Hero','https://open.spotify.com/track/6YnPqvc66bdYGGOJIlDEz1');
INSERT INTO `song` VALUES (0,99,'Power of \"NEO\"','https://open.spotify.com/track/0Juv2xdUtCPtCOVM3ADePa');
INSERT INTO `song` VALUES (0,100,'MEGALOVANIA','https://open.spotify.com/track/1J03Vp93ybKIxfzYI4YJtL');
INSERT INTO `song` VALUES (0,101,'Good Night','https://open.spotify.com/track/6Z3K31BKi5YL9Tj0zD3yvq');
INSERT INTO `song` VALUES (1,1,'ANOTHER HIM','https://open.spotify.com/track/63K6koyn1kUIXj4soQ9wNl');
INSERT INTO `song` VALUES (1,2,'Beginning','https://open.spotify.com/track/5NiD264RGry4WmWRRAZ0uN');
INSERT INTO `song` VALUES (1,3,'School','https://open.spotify.com/track/1xIYcuzRrYEfMkh7CjSKoF');
INSERT INTO `song` VALUES (1,4,'Susie','https://open.spotify.com/track/72tN7vUHvkke6lUwCb2lDy');
INSERT INTO `song` VALUES (1,5,'The Door','https://open.spotify.com/track/0r1IrLoXomZ3JFSd4Khp1h');
INSERT INTO `song` VALUES (1,6,'Cliffs','https://open.spotify.com/track/5PiPRr9KGpqWW12Kwq3FsV');
INSERT INTO `song` VALUES (1,7,'The Chase','https://open.spotify.com/track/1PnxSUmMmpIDWWBhMEY56C');
INSERT INTO `song` VALUES (1,8,'The Legend','https://open.spotify.com/track/1ZA8wuVp91YbS1uif1hyYR');
INSERT INTO `song` VALUES (1,9,'Lancer','https://open.spotify.com/track/2uE9ZTSf2wJINqCHOrV6a0');
INSERT INTO `song` VALUES (1,10,'Rude Buster','https://open.spotify.com/track/322mgWaD4DetiHmoDVlwWc');
INSERT INTO `song` VALUES (1,11,'Empty Town','https://open.spotify.com/track/6Z9eoMfegGE6pQc9Toawnd');
INSERT INTO `song` VALUES (1,12,'Weird Birds','https://open.spotify.com/track/3XFaNF6EbDJdSr3InmAxJO');
INSERT INTO `song` VALUES (1,13,'Field of Hopes and Dreams','https://open.spotify.com/track/2W90IO8eRnFg1qsPunKm9B');
INSERT INTO `song` VALUES (1,14,'Fanfare (from \"Rose of Winter\")','https://open.spotify.com/track/1r3DdJ79HTJ2V62OipRyoC');
INSERT INTO `song` VALUES (1,15,'Lantern','https://open.spotify.com/track/0fBXFpNA9Movn5G2WHPgbM');
INSERT INTO `song` VALUES (1,16,'I\'m Very Bad','https://open.spotify.com/track/6actYECaeFH1vOyOUCvTT9');
INSERT INTO `song` VALUES (1,17,'Checker Dance','https://open.spotify.com/track/6p3ckEGHB7tIiBmHLWZlVf');
INSERT INTO `song` VALUES (1,18,'Quiet Autumn','https://open.spotify.com/track/6jNxEc8nmpFBj3Pje7BVbx');
INSERT INTO `song` VALUES (1,19,'Scarlet Forest','https://open.spotify.com/track/4zLEqCe2KCWBJLKN3RyWAG');
INSERT INTO `song` VALUES (1,20,'Thrash Machine','https://open.spotify.com/track/2gafFAtDIGgDQLiEpRokIx');
INSERT INTO `song` VALUES (1,21,'Vs. Lancer','https://open.spotify.com/track/2LsYIw2gn24nkzgwA2g4gw');
INSERT INTO `song` VALUES (1,22,'Basement','https://open.spotify.com/track/1XfSpjUBuZwrNUDV8AbYpZ');
INSERT INTO `song` VALUES (1,23,'Imminent Death','https://open.spotify.com/track/1aSimBo97eJ6bHr5vrpoKd');
INSERT INTO `song` VALUES (1,24,'Vs. Susie','https://open.spotify.com/track/5ydKiJ69LWOzfSya9ojhE4');
INSERT INTO `song` VALUES (1,25,'Card Castle','https://open.spotify.com/track/6JuC5mhOzqPt8lEGfQJQ05');
INSERT INTO `song` VALUES (1,26,'Rouxls Kaard','https://open.spotify.com/track/6cQuiiADGJDs4H7SfIJdYF');
INSERT INTO `song` VALUES (1,27,'April 2012','https://open.spotify.com/track/0HuvIX3Jul87KRTOGpGr9P');
INSERT INTO `song` VALUES (1,28,'Hip Shop','https://open.spotify.com/track/2ASkgao4Nv7FtY9AjASDNQ');
INSERT INTO `song` VALUES (1,29,'Gallery','https://open.spotify.com/track/5zDC9xOmwH1yb7KttqbaDH');
INSERT INTO `song` VALUES (1,30,'Chaos King','https://open.spotify.com/track/5Y8awVkb5cXvlDyH1kIXaN');
INSERT INTO `song` VALUES (1,31,'Darkness Falls','https://open.spotify.com/track/1eodgnlUYiH3s0q99vk18p');
INSERT INTO `song` VALUES (1,32,'The Circus','https://open.spotify.com/track/1N2FBAFlTdHDCRUXq0XHPf');
INSERT INTO `song` VALUES (1,33,'THE WORLD REVOLVING','https://open.spotify.com/track/5QBozbgRWIYDSriHCRTsXd');
INSERT INTO `song` VALUES (1,34,'Friendship','https://open.spotify.com/track/2R6MB4GkUVnRwLN5VXHiDF');
INSERT INTO `song` VALUES (1,35,'THE HOLY','https://open.spotify.com/track/2DORTEXJd9o5Gdhr57M5yC');
INSERT INTO `song` VALUES (1,36,'Your Power','https://open.spotify.com/track/4eLHWCv6pLrxvpKomdGx5w');
INSERT INTO `song` VALUES (1,37,'A Town Called Hometown','https://open.spotify.com/track/1He6isaU9SoB6GzIM2lx6Z');
INSERT INTO `song` VALUES (1,38,'You Can Always Come Home','https://open.spotify.com/track/1pZrOGjhNld3S2QHdEt87N');
INSERT INTO `song` VALUES (1,39,'Don\'t Forget','https://open.spotify.com/track/7y6NbGuLZuNW0lVaPnYx22');
INSERT INTO `song` VALUES (1,40,'Before the Story','https://open.spotify.com/track/4AwX5ALZ1RxU9x29ispTyS');
INSERT INTO `song` VALUES (2,1,'Faint Glow','https://open.spotify.com/track/0wntsmQSoI55KsAD56KEAq');
INSERT INTO `song` VALUES (2,2,'Girl Next Door','https://open.spotify.com/track/3elKCP0PpuipOtLn7K8FXT');
INSERT INTO `song` VALUES (2,3,'My Castle Town','https://open.spotify.com/track/6g0y8cpi8c9eCPfz5XvW5T');
INSERT INTO `song` VALUES (2,4,'Ohhhhohohoho!','https://open.spotify.com/track/2rZU9qk1HWqWrKA7BKOWyy');
INSERT INTO `song` VALUES (2,5,'Queen','https://open.spotify.com/track/4fXX61n4gV1yfPbAdDmdcz');
INSERT INTO `song` VALUES (2,6,'A CYBER\'S WORLD?','https://open.spotify.com/track/0BE2Lbu4GgcCT6kgB1tDTc');
INSERT INTO `song` VALUES (2,7,'A Simple Diversion','https://open.spotify.com/track/7CaYooLVhBdkhRjSHrntgD');
INSERT INTO `song` VALUES (2,8,'Almost To The Guys!','https://open.spotify.com/track/3nVfeoR3BDeBqZhkxZTwFp');
INSERT INTO `song` VALUES (2,9,'Cool Beat','https://open.spotify.com/track/1GDlWTtvFLS0ii1lNeG8lL');
INSERT INTO `song` VALUES (2,10,'When I Get Mad I Dance Like This','https://open.spotify.com/track/3eZk3GxGcwVDPa1xIK4Fnp');
INSERT INTO `song` VALUES (2,11,'Cyber Battle (Solo)','https://open.spotify.com/track/6VpzCI5KbudaEYSKPNwzY1');
INSERT INTO `song` VALUES (2,12,'When I Get Happy I Dance Like This','https://open.spotify.com/track/5ZBgN5tJHXUxQLv40xGe39');
INSERT INTO `song` VALUES (2,13,'Sound Studio','https://open.spotify.com/track/51XshBkYoRNSL5iRQD1SJF');
INSERT INTO `song` VALUES (2,14,'Berdly','https://open.spotify.com/track/3GtA0wC7ZV1LtiaKVcFARJ');
INSERT INTO `song` VALUES (2,15,'Smart Race','https://open.spotify.com/track/1GdTlOlPxxXhuA1Z4Tbf5H');
INSERT INTO `song` VALUES (2,16,'Faint Courage (Game Over)','https://open.spotify.com/track/1RDnckI3aDh19h9TJAUm3N');
INSERT INTO `song` VALUES (2,17,'WELCOME TO THE CITY','https://open.spotify.com/track/30hbRoex1LUK0fShzTLR1C');
INSERT INTO `song` VALUES (2,18,'Mini Studio','https://open.spotify.com/track/2Y5yRdf42KyABdwUaafUgp');
INSERT INTO `song` VALUES (2,19,'Holiday Studio','https://open.spotify.com/track/67ER6SEIRevkaLsLhJCVzZ');
INSERT INTO `song` VALUES (2,20,'Cool Mixtape','https://open.spotify.com/track/5UDxDGERH44CfeecPnpPLY');
INSERT INTO `song` VALUES (2,21,'HEY EVERY !','https://open.spotify.com/track/3FwU0oJcpuWnu0eECt65jC');
INSERT INTO `song` VALUES (2,22,'Spamton','https://open.spotify.com/track/1dWgRROqpijnPVQS0LNJMf');
INSERT INTO `song` VALUES (2,23,'NOW\'S YOUR CHANCE TO BE A','https://open.spotify.com/track/4RZCenPPiY28As8ZzeMYyv');
INSERT INTO `song` VALUES (2,24,'Elegant Entrance','https://open.spotify.com/track/0v32fKwN5VpiZYEW9bwcmI');
INSERT INTO `song` VALUES (2,25,'Bluebird of Misfortune','https://open.spotify.com/track/3XfcINMr19vye9Imaazx0T');
INSERT INTO `song` VALUES (2,26,'Pandora Palace','https://open.spotify.com/track/7tNsMfItoswjCO5oOQgbBB');
INSERT INTO `song` VALUES (2,27,'KEYGEN','https://open.spotify.com/track/4GyPLAUgO1JdKe48giXBQo');
INSERT INTO `song` VALUES (2,28,'Acid Tunnel of Love','https://open.spotify.com/track/3M1Xiw8PplJsehXCUdlGi2');
INSERT INTO `song` VALUES (2,29,'It\'s Pronounced \"Rules\"','https://open.spotify.com/track/6zOVVoWfAnRMj5XfcvUoyF');
INSERT INTO `song` VALUES (2,30,'Lost Girl','https://open.spotify.com/track/4OaDjTKDu5wNML5Ia1AqOI');
INSERT INTO `song` VALUES (2,31,'Ferris Wheel','https://open.spotify.com/track/7JGkl7TSwWcVlwtDuoHDLj');
INSERT INTO `song` VALUES (2,32,'Attack of the Killer Queen','https://open.spotify.com/track/1K45maA9jDR1kBRpojtPmO');
INSERT INTO `song` VALUES (2,33,'Giga Size','https://open.spotify.com/track/7gRPYFtMaq0KIOO7vIxCLd');
INSERT INTO `song` VALUES (2,34,'Powers Combined','https://open.spotify.com/track/0t71OmjPF5oYOigH9p0AER');
INSERT INTO `song` VALUES (2,35,'Knock You Down !!','https://open.spotify.com/track/7ARvBQv5g2gDmBGXM6VDCR');
INSERT INTO `song` VALUES (2,36,'The Dark Truth','https://open.spotify.com/track/49vU3wEaRNGzZIy1TATOlW');
INSERT INTO `song` VALUES (2,37,'Digital Roots','https://open.spotify.com/track/21JQ1y4y0tBSwSJv0zV9K7');
INSERT INTO `song` VALUES (2,38,'Deal Gone Wrong','https://open.spotify.com/track/6pZ84L82buMFjAqev002Tv');
INSERT INTO `song` VALUES (2,39,'BIG SHOT','https://open.spotify.com/track/2hpQl8ryv3IonCg9LiAtGT');
INSERT INTO `song` VALUES (2,40,'A Real Boy!','https://open.spotify.com/track/0LtRb6SfD9zAm1mZqfzsd1');
INSERT INTO `song` VALUES (2,41,'Dialtone','https://open.spotify.com/track/5Z4bnMj3gxU2a07jaiRwzs');
INSERT INTO `song` VALUES (2,42,'sans.','https://open.spotify.com/track/3QrQeftqohPVWkqO0Dyj0u');
INSERT INTO `song` VALUES (2,43,'Chill Jailbreak Alarm To Study And Relax To','https://open.spotify.com/track/3RhudFHKBLdUqcwTwRWSfm');
INSERT INTO `song` VALUES (2,44,'You Can Always Come Home','https://open.spotify.com/track/2Rf33bpATyDiqTGm0NvlNb');
INSERT INTO `song` VALUES (2,45,'Until Next Time','https://open.spotify.com/track/4O0JVgOSsdJrj6Tao1ViEY');
INSERT INTO `song` VALUES (2,46,'Before The Story','https://open.spotify.com/track/2JWq4IwxQB4O8yL3pMe6aj');
INSERT INTO `song` VALUES (3,1,'Flashback (Excerpt)','https://open.spotify.com/track/5hsRssY21u2RnOzAaRPRPE');
INSERT INTO `song` VALUES (3,2,'Feature Presentation','https://open.spotify.com/track/6tvpQrBDbIjbzgETc7FJAA');
INSERT INTO `song` VALUES (3,3,'And Now For Today\'s Sponsors…!','https://open.spotify.com/track/34ov2MLnX3jUhL5QeosFly');
INSERT INTO `song` VALUES (3,4,'MIKE, the BOARD, please!','https://open.spotify.com/track/2jGCOh2CyVs6fKWx6Mdqin');
INSERT INTO `song` VALUES (3,5,'Sandy Board','https://open.spotify.com/track/1ibB9qEsHH6LdhZSCxUhtq');
INSERT INTO `song` VALUES (3,6,'Adventure Board','https://open.spotify.com/track/77AbXWzEwS7xb2y0cQ1vKV');
INSERT INTO `song` VALUES (3,7,'Query?','https://open.spotify.com/track/0f3lbqBNjllwLhPpmPqoYH');
INSERT INTO `song` VALUES (3,8,'Quiz!','https://open.spotify.com/track/06MqXIRp3PBssVsdgQ2LmO');
INSERT INTO `song` VALUES (3,9,'Dig! Dig! To The Center of the Earth!','https://open.spotify.com/track/7tXOPzioo1bTWpOe9XHcKz');
INSERT INTO `song` VALUES (3,10,'Pushing Buddies','https://open.spotify.com/track/33tFlu3Zwzk0DuiqpqKvoc');
INSERT INTO `song` VALUES (3,11,'Ruder Buster','https://open.spotify.com/track/1pzBe2vFkYc7RvieibXO8b');
INSERT INTO `song` VALUES (3,12,'Physical Challenge','https://open.spotify.com/track/4zDUTFUluT3ptuXBUhqux5');
INSERT INTO `song` VALUES (3,13,'Board Clear!','https://open.spotify.com/track/4MOXjN5shJCZHjAtOoPTPN');
INSERT INTO `song` VALUES (3,14,'Welcome to the Green Room','https://open.spotify.com/track/4F9q9vdpzkA2OxuofEXxNf');
INSERT INTO `song` VALUES (3,15,'Vapor Buster','https://open.spotify.com/track/53Q6v9ZiLLaw1MMtInfWBs');
INSERT INTO `song` VALUES (3,16,'Paradise, Paradise','https://open.spotify.com/track/59ZD83tA5CVrOT9fZmmTxS');
INSERT INTO `song` VALUES (3,17,'Raft Ride','https://open.spotify.com/track/4FjthTLSGFCMv69aEX2yqi');
INSERT INTO `song` VALUES (3,18,'SOUTH OF THE BORDER!!','https://open.spotify.com/track/126RQ9QDOI9vBdGxrO545m');
INSERT INTO `song` VALUES (3,19,'Sound Check','https://open.spotify.com/track/7mTVgwCZpAi2rxvsPtVAaj');
INSERT INTO `song` VALUES (3,20,'Raise Up Your Bat','https://open.spotify.com/track/2yvLgJd9ZcOUwdaPBhsKhn');
INSERT INTO `song` VALUES (3,21,'KING OF ROLYPOLY','https://open.spotify.com/track/4rVYnz4PMR5k3LdGfbe7uW');
INSERT INTO `song` VALUES (3,22,'Glowing Snow','https://open.spotify.com/track/4hBKerIFw7vZ8Wj5RFf992');
INSERT INTO `song` VALUES (3,23,'Big City Board','https://open.spotify.com/track/5pRrR8C22MseJx8Z9jMNsW');
INSERT INTO `song` VALUES (3,24,'Doom Board','https://open.spotify.com/track/6Esifny7MfmbRssBmqSnyO');
INSERT INTO `song` VALUES (3,25,'Metaphysical Challenge','https://open.spotify.com/track/2xmBM0jKHkoTtMB2IXh9Um');
INSERT INTO `song` VALUES (3,26,'TV WORLD','https://open.spotify.com/track/4dCf5JiHTFjDyJ3Lso0FPx');
INSERT INTO `song` VALUES (3,27,'It\'s TV Time!','https://open.spotify.com/track/3O9xF6nqYYtMjkuIutRYLP');
INSERT INTO `song` VALUES (3,28,'Hall of Fame','https://open.spotify.com/track/4PTQoGJKnCMSJHU1JhVLoH');
INSERT INTO `song` VALUES (3,29,'Breath','https://open.spotify.com/track/0IOWy7aABFxHymtVelvRuT');
INSERT INTO `song` VALUES (3,30,'Black Knife','https://open.spotify.com/track/3TXV0txNTcLXCktESOcMuG');
INSERT INTO `song` VALUES (3,31,'Crickets','https://open.spotify.com/track/2LNqzBqxASFVG7UWASevnJ');
INSERT INTO `song` VALUES (3,32,'Dump','https://open.spotify.com/track/4EJ3AaF1L6k2icQ9pcu88n');
INSERT INTO `song` VALUES (3,33,'SWORD','https://open.spotify.com/track/2FuJAsTPVx9hIZOCdRbMPV');
INSERT INTO `song` VALUES (3,34,'NORTHERNLIGHT','https://open.spotify.com/track/70k7l4qtoQkKa7kS2xsEiA');
INSERT INTO `song` VALUES (3,35,'GLACEIR','https://open.spotify.com/track/03ukf04MOfpSzDk5EakIiv');
INSERT INTO `song` VALUES (3,36,'BIT ROOTS','https://open.spotify.com/track/5HVWxGx8pVxZ5n7H0Stt9K');
INSERT INTO `song` VALUES (3,37,'ERAM','https://open.spotify.com/track/4T6NeRmGQox3l6YahP6HOp');
INSERT INTO `song` VALUES (3,38,'BURNING EYES','https://open.spotify.com/track/5y2A6lAb8c1pYgdomYM2zm');
INSERT INTO `song` VALUES (4,39,'Old wooden rafters','https://open.spotify.com/track/0KqDYr4qjE4aQ4MdiYAHSu');
INSERT INTO `song` VALUES (4,40,'Hymn','https://open.spotify.com/track/0MyDcubBn6rtcYxqKA0k5f');
INSERT INTO `song` VALUES (4,41,'Another day in hometown','https://open.spotify.com/track/7ttAYAA9xgN9X2pKgE6D2w');
INSERT INTO `song` VALUES (4,42,'Friends','https://open.spotify.com/track/42gE8OCT3DiFUg6F6heHKL');
INSERT INTO `song` VALUES (4,43,'Castle Funk','https://open.spotify.com/track/580rGEvaWqalvq6sXo7qcI');
INSERT INTO `song` VALUES (4,44,'Knock You Down!! - Rhythm Ver.','https://open.spotify.com/track/12W8e5qsinrzV6vhqN3wWl');
INSERT INTO `song` VALUES (4,45,'Gingerbread House','https://open.spotify.com/track/55JVCXdcI0FpG1XfVK7QH6');
INSERT INTO `song` VALUES (4,46,'The distance between two','https://open.spotify.com/track/6V7mrQd5w1RLYLgpa0j1lh');
INSERT INTO `song` VALUES (4,47,'C','https://open.spotify.com/track/4VYoTPAeHVhBzxhzNy5uGr');
INSERT INTO `song` VALUES (4,48,'ATRIUM','https://open.spotify.com/track/34J8FvGXDEittDb6CpV1Qs');
INSERT INTO `song` VALUES (4,49,'Dark Sanctuary','https://open.spotify.com/track/1jfGFGFCJVFswChxzkjdih');
INSERT INTO `song` VALUES (4,50,'From Now On (Battle 2)','https://open.spotify.com/track/4Hjl9fN4GFjwumSSwzfnoF');
INSERT INTO `song` VALUES (4,51,'Gyaa Ha ha!','https://open.spotify.com/track/6gecazaYAnbY23qNXXmgb2');
INSERT INTO `song` VALUES (4,52,'Fireplace','https://open.spotify.com/track/2L5nTpQVL0uAOC3D9EAgOo');
INSERT INTO `song` VALUES (4,53,'A DARK ZONE','https://open.spotify.com/track/4xWndE8mpwxptsiImg8NML');
INSERT INTO `song` VALUES (4,54,'Mysterious Ringing','https://open.spotify.com/track/6ryg7xffWWiM2k3vSaeovv');
INSERT INTO `song` VALUES (4,55,'Ever Higher','https://open.spotify.com/track/50vzjXBvI9LqWoH8rS7Ngs');
INSERT INTO `song` VALUES (4,56,'Wise words','https://open.spotify.com/track/3G8frZE57AjViNcrFSgJVS');
INSERT INTO `song` VALUES (4,57,'Piano that may not be played that well','https://open.spotify.com/track/5dH2YsWmbDhVgFrESQrMDk');
INSERT INTO `song` VALUES (4,58,'Hammer of Justice','https://open.spotify.com/track/5A1CTzfzTz7h4FZo7zxa1A');
INSERT INTO `song` VALUES (4,59,'12am','https://open.spotify.com/track/4UKmADVuX37678FmIkWNec');
INSERT INTO `song` VALUES (4,60,'The Second Sanctuary','https://open.spotify.com/track/4bmMBMIm6E5QkMcVxl98q9');
INSERT INTO `song` VALUES (4,61,'Ripple','https://open.spotify.com/track/1nRbX4Y2INifRgrjXioxz1');
INSERT INTO `song` VALUES (4,62,'13am','https://open.spotify.com/track/2j6z4O5sYkXzF73s2fYNMM');
INSERT INTO `song` VALUES (4,63,'The Third Sanctuary','https://open.spotify.com/track/559K8nUEfwvXHHuPBgX2do');
INSERT INTO `song` VALUES (4,64,'Dark Place','https://open.spotify.com/track/2BH3agU3rF9fUAyXHygvvi');
INSERT INTO `song` VALUES (4,65,'Heavy Footsteps','https://open.spotify.com/track/3P4gWy7Xs7fqmWIIx1wlyU');
INSERT INTO `song` VALUES (4,66,'Crumbling Tower','https://open.spotify.com/track/7ukURGTlj6dibrYZn5A1Gj');
INSERT INTO `song` VALUES (4,67,'SPAWN','https://open.spotify.com/track/2u4ushxdRXhwwZV1ql8FSW');
INSERT INTO `song` VALUES (4,68,'GUARDIAN','https://open.spotify.com/track/6KJL2lAVwFQyuZx9UhJvPo');
INSERT INTO `song` VALUES (4,69,'Need a hand!?','https://open.spotify.com/track/0TKD1A2DMx30e70scvLZBC');
INSERT INTO `song` VALUES (4,70,'The place where it rained','https://open.spotify.com/track/7dBppsBocHB0AhHbSe1G4L');
INSERT INTO `song` VALUES (4,71,'The Ol\' Jitterbug','https://open.spotify.com/track/13OOV33XXDkjmXcF5O4UMZ');
INSERT INTO `song` VALUES (4,72,'Neverending Night','https://open.spotify.com/track/3VoY2M955hxgj9i6g3e5Yj');
INSERT INTO `song` VALUES (4,73,'The LEGEND...?','https://open.spotify.com/track/4YKi7DleHSQLhO8dKws454');
INSERT INTO `song` VALUES (4,74,'With Hope Crossed On Our Hearts','https://open.spotify.com/track/3TIvMJwLPjWkZmdNjO33iU');
INSERT INTO `song` VALUES (4,75,'Volume Adjustment','https://open.spotify.com/track/2HzSMVOrr9iIr0nUjIttuN');
INSERT INTO `song` VALUES (4,76,'Catswing','https://open.spotify.com/track/3m5FpGqqw4Lu5jlPUx6YWr');
INSERT INTO `song` VALUES (4,77,'Air Waves','https://open.spotify.com/track/0M4R2a09Sru58lv4aW8nl0');
INSERT INTO `song` VALUES (4,78,'Concert for you','https://open.spotify.com/track/4yclX1bQYgp7WTMp9XjLh3');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `source` (
  `source_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `short_title` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
INSERT INTO `source` VALUES (1,'Star Wars: Episode I -  The Phantom Menace','I');
INSERT INTO `source` VALUES (2,'Star Wars: Episode II - Attack of the Clones','II');
INSERT INTO `source` VALUES (3,'Star Wars: Episode III - Revenge of the Sith','III');
INSERT INTO `source` VALUES (4,'Star Wars: Episode IV - A New Hope','IV');
INSERT INTO `source` VALUES (5,'Star Wars: Episode V - The Empire Strikes Back','V');
INSERT INTO `source` VALUES (6,'Star Wars: Episode VI - Return of the Jedi','VI');
INSERT INTO `source` VALUES (7,'Star Wars: Episode VII - The Force Awakens','VII');
INSERT INTO `source` VALUES (8,'Star Wars: Episode VIII - The Last Jedi','VIII');
INSERT INTO `source` VALUES (9,'Star Wars: Episode IX - The Rise of Skywalker','IX');
INSERT INTO `source` VALUES (10,'Star Wars Legends','Legends');
INSERT INTO `source` VALUES (11,'Star Wars: The Clone Wars','TCW');
INSERT INTO `source` VALUES (12,'Star Wars: The Old Republic','SWTOR');
INSERT INTO `source` VALUES (13,'Star Wars: Rebels','Rebels');
INSERT INTO `source` VALUES (14,'Star Wars: The Force Unleashed','SWTFU');
INSERT INTO `source` VALUES (15,'Star Wars: Battlefront','SWBF');
INSERT INTO `source` VALUES (16,'Rogue One: A Star Wars Story','R1');
INSERT INTO `source` VALUES (17,'Solo: A Star Wars Story','Solo');
INSERT INTO `source` VALUES (18,'Star Wars: The Mandalorian','Mando');
INSERT INTO `source` VALUES (19,'Star Wars: Ahsoka','Ahsoka');
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-11 22:45:36
