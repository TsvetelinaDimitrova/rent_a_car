-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: auto
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Current Database: `auto`
--

CREATE DATABASE IF NOT EXISTS `auto` DEFAULT CHARACTER SET utf8mb4;

USE `auto`;

--
-- Table structure for table `ausleihe`
--

DROP TABLE IF EXISTS `ausleihe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ausleihe` (
  `aunr` int(6) NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT curdate(),
  `pnr` int(5) NOT NULL,
  `kunr` int(5) NOT NULL,
  `beginn` date NOT NULL DEFAULT current_timestamp(),
  `ende` date DEFAULT NULL,
  PRIMARY KEY (`aunr`),
  KEY `pnr` (`pnr`),
  KEY `kunr` (`kunr`),
  CONSTRAINT `ausleihe_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `pkw` (`pnr`),
  CONSTRAINT `ausleihe_ibfk_2` FOREIGN KEY (`kunr`) REFERENCES `kunden` (`kunr`),
  CONSTRAINT `chk_date` CHECK (`ende` >= `beginn`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ausleihe`
--

LOCK TABLES `ausleihe` WRITE;
/*!40000 ALTER TABLE `ausleihe` DISABLE KEYS */;
INSERT INTO `ausleihe` VALUES (1,'2020-04-25',6,5,'2020-05-01','2020-06-01'),(5,'2020-04-25',2,9,'2020-06-01','2020-06-02'),(6,'2020-04-26',9,10,'2020-06-06','2020-06-26'),(7,'2020-04-26',2,4,'2020-08-06','2020-08-15'),(8,'2020-04-26',9,1,'2020-06-06','2020-06-07'),(10,'2020-04-26',8,3,'2020-05-03','2020-05-10'),(12,'2020-04-25',14,9,'2020-04-01','2020-04-22'),(13,'2020-04-28',8,9,'2020-06-30','2020-07-01'),(24,'2020-04-25',4,6,'2020-04-01','2020-04-11'),(25,'2020-04-27',5,7,'2020-04-27','2020-04-30');
/*!40000 ALTER TABLE `ausleihe` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER anz_ausleihe_after_insert
AFTER INSERT ON ausleihe
FOR EACH ROW
BEGIN
	UPDATE kunden SET anz_ausleihe = anz_ausleihe + 1
	WHERE kunden.kunr = NEW.kunr;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER anz_ausleihe_after_delete
AFTER DELETE ON ausleihe
FOR EACH ROW
BEGIN
	UPDATE kunden SET anz_ausleihe = anz_ausleihe - 1
	WHERE kunden.kunr = OLD.kunr;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bankverbindung`
--

DROP TABLE IF EXISTS `bankverbindung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankverbindung` (
  `lfdnr` int(5) NOT NULL AUTO_INCREMENT,
  `iban` varchar(30) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `kunr` int(5) NOT NULL,
  PRIMARY KEY (`lfdnr`),
  KEY `kunr` (`kunr`),
  CONSTRAINT `bankverbindung_ibfk_1` FOREIGN KEY (`kunr`) REFERENCES `kunden` (`kunr`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankverbindung`
--

LOCK TABLES `bankverbindung` WRITE;
/*!40000 ALTER TABLE `bankverbindung` DISABLE KEYS */;
INSERT INTO `bankverbindung` VALUES (1,'DE81 2020 2020 2020','PKDEFF',1),(2,'DE81 2121 2020 2020','SPKDEF',2),(3,'DE81 2020 2525 2020','VRBANK',3),(4,'DE81 2020 2020 8484','DINGEN',4),(5,'DE45 2020 2020 2020','PKDEFF',5),(6,'DE45 2121 2020 2020','SPKDEF',6),(7,'DE45 2020 2525 2020','VRBANK',7),(8,'DE45 2020 2020 8484','DINGEN',8),(9,'DE46 2020 2020 2020','PKDEFF',9),(10,'DE88 2121 2020 2020','SPKDEF',10);
/*!40000 ALTER TABLE `bankverbindung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hersteller`
--

DROP TABLE IF EXISTS `hersteller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hersteller` (
  `henr` int(5) NOT NULL AUTO_INCREMENT,
  `hename` char(35) NOT NULL,
  PRIMARY KEY (`henr`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hersteller`
--

LOCK TABLES `hersteller` WRITE;
/*!40000 ALTER TABLE `hersteller` DISABLE KEYS */;
INSERT INTO `hersteller` VALUES (1,'Mercedes'),(2,'Opel'),(3,'Renault'),(4,'BMW'),(5,'Mazda'),(6,'VW'),(7,'Tesla');
/*!40000 ALTER TABLE `hersteller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunden` (
  `kunr` int(5) NOT NULL AUTO_INCREMENT,
  `kuvorname` char(30) NOT NULL,
  `kuname` char(20) NOT NULL,
  `kustrasse` char(30) NOT NULL,
  `kuplz` char(8) NOT NULL,
  `kuort` char(30) NOT NULL,
  `kutelefon` char(20) DEFAULT NULL,
  `kugebdat` date NOT NULL,
  `kudatfschein` date NOT NULL,
  `anz_ausleihe` int(5) DEFAULT 0,
  PRIMARY KEY (`kunr`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

LOCK TABLES `kunden` WRITE;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
INSERT INTO `kunden` VALUES (1,'Anna','Fuhrmann','Bachstr. 4','12345','Bern','023-033-6252','1978-12-01','2000-02-20',1),(2,'Antonio','Hardig','Bahnhofsstr. 87','12346','Bern','023-033-6232','1986-12-22','2007-10-10',0),(3,'Thomas','Gärtner','Denkstr. 19','12355','Zürich','023-033-6874','1975-01-01','2000-03-10',1),(4,'Christina','Jansen','Am Wartberg 6','18345','Luzern','023-033-2222','1989-03-01','2010-08-01',1),(5,'Martin','Lawec','Poststr. 66','89890','Wien','023-033-4544','1960-01-03','1982-03-30',1),(6,'Francisco','Wagner','Falkenweg 33','12385','Salzburg','023-033-7777','1980-01-04','2003-11-02',1),(7,'Ming-Yang','Sokolis','Am alten Schloß 6','45450','Innsbruck','023-033-6668','2002-05-30','2020-07-01',1),(8,'Elizabeth','Jakobi','Waldweg 11','13345','Graz','023-033-4477','1977-01-06','1999-05-14',0),(9,'Sven','Barth','Kronauerallee 8','12745','Basel','023-033-5556','1973-01-07','1996-03-12',3),(10,'Roland','Trischler','Kaiserring 55','12345','Basel','023-033-2225','1985-01-08','2003-12-03',1);
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modell`
--

DROP TABLE IF EXISTS `modell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modell` (
  `monr` int(5) NOT NULL AUTO_INCREMENT,
  `henr` int(5) NOT NULL,
  `moname` char(35) DEFAULT NULL,
  `kraftstoffart` enum('Benzin','Diesel','LPG','Hibrid','Elektro') DEFAULT 'Benzin',
  `getriebe` enum('Automatik','Manuell') DEFAULT 'Manuell',
  PRIMARY KEY (`monr`),
  KEY `henr` (`henr`),
  CONSTRAINT `modell_ibfk_1` FOREIGN KEY (`henr`) REFERENCES `hersteller` (`henr`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modell`
--

LOCK TABLES `modell` WRITE;
/*!40000 ALTER TABLE `modell` DISABLE KEYS */;
INSERT INTO `modell` VALUES (1,1,'Smart','Benzin','Manuell'),(2,2,'Astra','Benzin','Manuell'),(3,3,'Megan','Benzin','Manuell'),(4,2,'Astra','Benzin','Manuell'),(5,4,'520','Benzin','Manuell'),(6,4,'750i','Diesel','Manuell'),(7,4,'323','Benzin','Automatik'),(8,5,'626','Benzin','Manuell'),(9,5,'MX 5','Benzin','Manuell'),(10,1,'A-Klasse','Benzin','Manuell'),(11,1,'C-Klasse','Benzin','Manuell'),(12,6,'Golf','Benzin','Manuell'),(13,6,'Passat','Benzin','Manuell'),(14,7,'S','Elektro','Automatik');
/*!40000 ALTER TABLE `modell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkw`
--

DROP TABLE IF EXISTS `pkw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkw` (
  `pnr` int(5) NOT NULL AUTO_INCREMENT,
  `pkennzeichen` char(15) NOT NULL,
  `monr` int(5) NOT NULL,
  `erstzulassung` date DEFAULT NULL,
  `kmstand` int(11) NOT NULL,
  `sitz` char(1) DEFAULT NULL,
  `tür` enum('2','4') DEFAULT NULL,
  `klima` enum('ja','nein') DEFAULT 'nein',
  `preisTag` decimal(5,2) unsigned NOT NULL,
  `preisKm` decimal(5,2) unsigned NOT NULL,
  PRIMARY KEY (`pnr`),
  KEY `monr` (`monr`),
  CONSTRAINT `pkw_ibfk_1` FOREIGN KEY (`monr`) REFERENCES `modell` (`monr`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkw`
--

LOCK TABLES `pkw` WRITE;
/*!40000 ALTER TABLE `pkw` DISABLE KEYS */;
INSERT INTO `pkw` VALUES (1,'BI- WT 301',1,'2000-12-03',111000,'2','2','nein',50.00,1.00),(2,'BI- WT 302',2,'2002-12-03',135050,'5','4','nein',62.00,1.24),(3,'BI- WT 303',3,'2000-12-03',152000,'5','2','ja',79.00,1.58),(4,'BI- WT 304',4,'2001-12-03',123000,'5','4','nein',88.00,1.76),(5,'BI- WT 305',5,'2000-12-03',26000,'5','4','nein',105.00,2.10),(6,'BI- WT 306',6,'1998-12-03',11150,'5','4','ja',35.00,0.70),(7,'BI- WT 307',7,'2000-12-03',56878,'5','4','ja',40.00,0.80),(8,'BI- WT 308',8,'1998-12-03',125050,'5','4','nein',60.00,1.20),(9,'BI- WT 309',9,'2008-12-03',11100,'5','2','nein',75.00,1.50),(10,'BI- WT 310',10,'2000-02-03',23568,'5','4','nein',89.00,1.78),(11,'BI- WT 311',11,'1997-12-03',14000,'5','4','ja',40.00,0.80),(12,'BI- WT 312',12,'2000-12-03',222000,'5','2','ja',65.00,1.30),(13,'BI- WT 313',13,'2000-12-03',26541,'5','4','ja',75.00,1.15),(14,'BI- WT 314',14,'2019-12-03',16000,'5','4','ja',85.00,2.20);
/*!40000 ALTER TABLE `pkw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protokoll`
--

DROP TABLE IF EXISTS `protokoll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protokoll` (
  `lfdnr` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT current_timestamp(),
  `pnr` int(5) DEFAULT NULL,
  `beginn` date DEFAULT NULL,
  `ende` date DEFAULT NULL,
  `kmstand` int(11) DEFAULT NULL,
  `kmstand_ende` int(11) DEFAULT NULL,
  PRIMARY KEY (`lfdnr`),
  KEY `pnr` (`pnr`),
  CONSTRAINT `protokoll_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `pkw` (`pnr`),
  CONSTRAINT `chk_date` CHECK (`ende` >= `beginn`),
  CONSTRAINT `chk_INT` CHECK (`kmstand_ende` >= `kmstand`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protokoll`
--

LOCK TABLES `protokoll` WRITE;
/*!40000 ALTER TABLE `protokoll` DISABLE KEYS */;
INSERT INTO `protokoll` VALUES (1,NULL,8,'2020-05-03','2020-05-10',125050,126000),(9,NULL,14,'2020-04-01','2020-04-22',15050,16000),(10,NULL,6,'2020-05-01','2020-06-01',11050,11150),(11,NULL,5,'2020-04-27','2020-04-30',25888,26000),(13,'2020-05-02',9,'2020-06-06','2020-06-26',11050,11100);
/*!40000 ALTER TABLE `protokoll` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER kmstand_after_insert
AFTER INSERT ON protokoll
FOR EACH ROW
BEGIN
UPDATE pkw SET kmstand = (SELECT kmstand_ende FROM protokoll WHERE pnr = NEW.pnr)
WHERE pkw.pnr = NEW.pnr;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `v_autobestand`
--

DROP TABLE IF EXISTS `v_autobestand`;
/*!50001 DROP VIEW IF EXISTS `v_autobestand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_autobestand` (
  `Nummer` tinyint NOT NULL,
  `Kennzeichen` tinyint NOT NULL,
  `Auto` tinyint NOT NULL,
  `Preis pro Tag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_frei_auto_heute`
--

DROP TABLE IF EXISTS `v_frei_auto_heute`;
/*!50001 DROP VIEW IF EXISTS `v_frei_auto_heute`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_frei_auto_heute` (
  `ID` tinyint NOT NULL,
  `Marke` tinyint NOT NULL,
  `Preis pro Tag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_kundenalter`
--

DROP TABLE IF EXISTS `v_kundenalter`;
/*!50001 DROP VIEW IF EXISTS `v_kundenalter`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_kundenalter` (
  `Vorname` tinyint NOT NULL,
  `Nachname` tinyint NOT NULL,
  `Geburtsdatum` tinyint NOT NULL,
  `Alter` tinyint NOT NULL,
  `Mitteilung` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'auto'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_freiAuto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_freiAuto`(IN `p_from_date` DATE, IN `p_to_date` DATE)
BEGIN
	SELECT * FROM pkw 
	WHERE pkw.pnr 
	NOT IN 
		(SELECT DISTINCT pkw.pnr 
		FROM pkw 
		LEFT JOIN ausleihe 
		ON pkw.pnr = ausleihe.pnr 
		WHERE beginn < p_from_date AND ende > p_from_date 
		OR beginn < p_to_date AND ende > p_to_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_newausleihe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_newausleihe`(
IN p_pnr CHAR(30),
    IN p_kunr CHAR(20),
    IN p_beginn DATE,
    IN p_ende DATE
)
BEGIN
INSERT INTO ausleihe(pnr, kunr, beginn, ende)  
VALUES (p_pnr, p_kunr, p_beginn, p_ende);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_newKunden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_newKunden`(
IN p_kuname CHAR(30),
    IN p_kuvorname CHAR(20),
    IN p_kustrasse CHAR(30),
    IN p_kuplz CHAR(08),
    IN p_kuort CHAR(30),
    IN p_kutelefon CHAR(20),
    IN p_kugebdat DATE,
    IN p_kudatfschein DATE
)
BEGIN
INSERT INTO kunden(kuname, kuvorname, kustrasse, kuplz, kuort, kutelefon,kugebdat, kudatfschein) 
VALUES (p_kuname, p_kuvorname, p_kustrasse, p_plz, p_kuort, p_kutelefon, p_kugebdat, p_kudatfschein);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `auto`
--

USE `auto`;

--
-- Final view structure for view `v_autobestand`
--

/*!50001 DROP TABLE IF EXISTS `v_autobestand`*/;
/*!50001 DROP VIEW IF EXISTS `v_autobestand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_autobestand` AS select `pkw`.`pnr` AS `Nummer`,`pkw`.`pkennzeichen` AS `Kennzeichen`,concat(`hersteller`.`hename`,' ',`modell`.`moname`) AS `Auto`,`pkw`.`preisTag` AS `Preis pro Tag` from ((`pkw` join `modell` on(`pkw`.`monr` = `modell`.`monr`)) join `hersteller` on(`modell`.`henr` = `hersteller`.`henr`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_frei_auto_heute`
--

/*!50001 DROP TABLE IF EXISTS `v_frei_auto_heute`*/;
/*!50001 DROP VIEW IF EXISTS `v_frei_auto_heute`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_frei_auto_heute` AS select `pkw`.`pnr` AS `ID`,concat(`hersteller`.`hename`,' ',`modell`.`moname`) AS `Marke`,`pkw`.`preisTag` AS `Preis pro Tag` from ((`pkw` join `modell` on(`pkw`.`monr` = `modell`.`monr`)) join `hersteller` on(`modell`.`henr` = `hersteller`.`henr`)) where !(`pkw`.`pnr` in (select distinct `pkw`.`pnr` from (`pkw` left join `ausleihe` on(`pkw`.`pnr` = `ausleihe`.`pnr`)) where `ausleihe`.`beginn` < curdate() and `ausleihe`.`ende` > curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_kundenalter`
--

/*!50001 DROP TABLE IF EXISTS `v_kundenalter`*/;
/*!50001 DROP VIEW IF EXISTS `v_kundenalter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_kundenalter` AS select `kunden`.`kuvorname` AS `Vorname`,`kunden`.`kuname` AS `Nachname`,`kunden`.`kugebdat` AS `Geburtsdatum`,timestampdiff(YEAR,`kunden`.`kugebdat`,curdate()) AS `Alter`,if(timestampdiff(YEAR,`kunden`.`kugebdat`,curdate()) >= 18,'Mietwagen','Der Kunde kann kein Auto mieten!') AS `Mitteilung` from `kunden` */;
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

-- Dump completed on 2020-05-02  3:56:10
