CREATE DATABASE  IF NOT EXISTS `Plants` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Plants`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: planten
-- ------------------------------------------------------
-- Server version	5.6.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bestellijnen`
--

DROP TABLE IF EXISTS `bestellijnen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bestellijnen` (
  `bestelnr` varchar(4) NOT NULL,
  `artCodeLev` varchar(10) NOT NULL,
  `aantal` smallint(6) NOT NULL,
  `prijs` decimal(6,2) NOT NULL,
  PRIMARY KEY (`bestelnr`,`artCodeLev`),
  CONSTRAINT `FK_Bestellijnen_Bestellingen` FOREIGN KEY (`bestelnr`) REFERENCES `bestellingen` (`bestelnr`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellijnen`
--

LOCK TABLES `bestellijnen` WRITE;
/*!40000 ALTER TABLE `bestellijnen` DISABLE KEYS */;
INSERT INTO `bestellijnen` VALUES ('0121','A154',150,0.45),('0121','B006',150,0.95),('0121','B111',25,2.25),('0121','B396',50,1.65),('0121','E098',50,1.90),('0121','G202',25,6.35),('0174','A421',50,1.35),('0174','B148',25,0.65),('0174','B331',25,0.70),('0174','C274',25,0.65),('0175','A004',50,0.75),('0175','A075',250,0.25),('0175','A103',400,0.20),('0175','A184',50,0.45),('0175','A385',100,0.40),('0175','A421',50,0.80),('0175','B148',50,0.45),('0175','B331',10,0.45),('0175','B337',100,0.70),('0175','C274',25,0.45),('0175','D225',25,0.35),('0181','044',10,3.60),('0181','045',5,7.20),('0181','099',20,6.05),('0181','114',3,9.45),('0181','116',25,15.45),('0184','E-003',200,1.20),('0186','162',100,0.65),('0186','281',100,3.25),('0186','474',25,1.30),('0190','001-2',100,1.15),('0190','103-2',100,1.00),('0190','118-V',200,1.15),('0190','209-V',25,1.60),('0190','255-1',200,0.35),('0190','263-V',50,1.65),('0190','281-2',25,0.55),('0190','393-V',20,1.45),('0191','A101',100,1.10),('0191','A103',1000,0.10),('0191','A154',100,0.50),('0191','A472',250,0.60),('0191','B101',50,0.40),('0191','B111',50,2.15),('0191','B396',50,1.50),('0191','B578',10,11.70),('0191','C051',10,7.55),('0191','D029',15,6.00),('0191','D296',10,7.55),('0191','D742',25,2.95),('0191','E098',50,1.80),('0191','G001',25,1.20),('0191','G430',30,2.75),('0191','H510',40,1.75),('0192','ST1P1',100,1.65),('0192','ST2P1',25,1.35),('0192','ST3P2',24,5.05),('0192','ST4P5',12,0.90),('0197','ST1P9',50,3.75),('0197','ST2P1',25,1.45),('0197','ST2P6',50,2.30),('0197','ST3P1',36,4.85),('0197','ST4P1',48,8.95),('0197','ST4P5',24,1.00),('0200','A004',25,1.25),('0200','A184',25,0.65),('0200','B148',25,0.70),('0200','B331',10,0.70),('0201','A004',25,1.25),('0201','A184',25,0.70),('0201','A385',25,0.70),('0201','A421',50,1.45),('0201','B148',25,0.70),('0201','B331',25,0.75),('0201','C274',25,0.75),('0201','D225',50,0.55),('0202','162-V',75,1.35),('0202','201-V',25,2.40),('0202','255-1',150,0.40),('0202','327-1',150,0.50),('0202','408-V',100,2.05),('0202','498-1',100,0.40),('0203','ALTH',25,1.15),('0203','CENT',50,1.15),('0203','CYNO',50,1.40),('0203','GYPS',25,2.65),('0203','KNIP',50,2.05),('0203','LUPI',200,1.40),('0204','ALTH',50,1.00),('0204','BEGO',50,0.35),('0204','CAMP',150,1.55),('0204','CHEI',50,0.95),('0204','DELP',100,1.50);
/*!40000 ALTER TABLE `bestellijnen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bestellingen`
--

DROP TABLE IF EXISTS `bestellingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bestellingen` (
  `bestelnr` varchar(4) NOT NULL,
  `levCode` varchar(3) NOT NULL,
  `bestelDatum` datetime NOT NULL,
  `leverDatum` datetime DEFAULT NULL,
  `bedrag` decimal(6,2) NOT NULL,
  PRIMARY KEY (`bestelnr`),
  KEY `FK_Bestellingen_Leveranciers` (`levCode`),
  CONSTRAINT `FK_Bestellingen_Leveranciers` FOREIGN KEY (`levCode`) REFERENCES `leveranciers` (`levCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellingen`
--

LOCK TABLES `bestellingen` WRITE;
/*!40000 ALTER TABLE `bestellingen` DISABLE KEYS */;
INSERT INTO `bestellingen` VALUES ('0121','013','2003-01-31 00:00:00','2003-01-17 00:00:00',590.45),('0174','004','2003-02-25 00:00:00','2003-03-04 00:00:00',117.50),('0175','004','2003-02-27 00:00:00','2003-03-06 00:00:00',395.51),('0181','009','2003-03-06 00:00:00','2003-03-27 00:00:00',577.22),('0184','022','2003-06-06 00:00:00','2003-03-16 00:00:00',240.00),('0186','020','2003-01-11 00:00:00','2003-03-18 00:00:00',414.05),('0190','014','2003-03-13 00:00:00','2003-03-23 00:00:00',659.84),('0191','013','2003-03-13 00:00:00','2003-03-27 00:00:00',1211.41),('0192','035','2003-03-13 00:00:00','2003-03-23 00:00:00',317.52),('0197','035','2003-03-14 00:00:00','2003-03-23 00:00:00',928.27),('0200','004','2003-03-14 00:00:00','2003-03-21 00:00:00',72.00),('0201','004','2003-03-26 00:00:00','2003-04-02 00:00:00',221.25),('0202','014','2003-03-26 00:00:00','2003-04-05 00:00:00',530.43),('0203','019','2003-04-01 00:00:00','2003-04-15 00:00:00',556.60),('0204','034','2003-04-01 00:00:00','2003-04-15 00:00:00',492.53);
/*!40000 ALTER TABLE `bestellingen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtproperties`
--

DROP TABLE IF EXISTS `dtproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtproperties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` int(11) DEFAULT NULL,
  `property` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `uvalue` varchar(510) DEFAULT NULL,
  `lvalue` tinyblob,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtproperties`
--

LOCK TABLES `dtproperties` WRITE;
/*!40000 ALTER TABLE `dtproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kleuren`
--

DROP TABLE IF EXISTS `kleuren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kleuren` (
  `kleurID` int(11) NOT NULL AUTO_INCREMENT,
  `kleur` varchar(100) NOT NULL,
  PRIMARY KEY (`kleurID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kleuren`
--

LOCK TABLES `kleuren` WRITE;
/*!40000 ALTER TABLE `kleuren` DISABLE KEYS */;
INSERT INTO `kleuren` VALUES (1,'blauw'),(2,'bruin'),(3,'geel'),(4,'gemengd'),(5,'groen'),(6,'lila'),(7,'oranje'),(8,'paars'),(9,'rood'),(10,'roze'),(11,'violet'),(12,'wit'),(13,'whoopa'),(14,'whoopa'),(15,'whoopa');
/*!40000 ALTER TABLE `kleuren` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leveranciers`
--

DROP TABLE IF EXISTS `leveranciers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leveranciers` (
  `levCode` varchar(3) NOT NULL,
  `naam` varchar(50) DEFAULT NULL,
  `adres` varchar(50) DEFAULT NULL,
  `woonplaats` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`levCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leveranciers`
--

LOCK TABLES `leveranciers` WRITE;
/*!40000 ALTER TABLE `leveranciers` DISABLE KEYS */;
INSERT INTO `leveranciers` VALUES ('004','HOVENIER G.H.','ZANDWEG 50','LISSE'),('009','BAUMGARTEN R.','TAKSTRAAT 13','HILLEGOM'),('011','STRUIK BV.','BESSENLAAN 1','LISSE'),('013','SPITMAN EN ZN.','ACHTERTUIN 9','AALSMEER'),('014','DEZAAIER L.J.A.','DE GRONDEN 101','LISSE'),('019','MOOIWEER FA.','VERLENGDE ZOMERSTR. 24','AALSMEER'),('020','BLOEM L.Z.H.W.','LINNAEUSHOF 17','HILLEGOM'),('021','TRA A.','KOELEPLEKSTRAAT 10','LISSE'),('022','ERICA BV.','BERKENWEG 87','HEEMSTEDE'),('034','DE GROENE KAS BV.','GLASWEG 1','AALSMEER'),('035','FLORA BV.','OEVERSTRAAT 76','AALSMEER');
/*!40000 ALTER TABLE `leveranciers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offertes`
--

DROP TABLE IF EXISTS `offertes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offertes` (
  `levCode` varchar(3) NOT NULL,
  `artCodeLev` varchar(10) NOT NULL,
  `artCode` varchar(3) DEFAULT NULL,
  `levertermijn` int(11) DEFAULT NULL,
  `offertePrijs` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`levCode`,`artCodeLev`),
  KEY `FK_Offertes_Planten` (`artCode`),
  CONSTRAINT `FK_Offertes_Leveranciers` FOREIGN KEY (`levCode`) REFERENCES `leveranciers` (`levCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Offertes_Planten` FOREIGN KEY (`artCode`) REFERENCES `planten` (`artCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offertes`
--

LOCK TABLES `offertes` WRITE;
/*!40000 ALTER TABLE `offertes` DISABLE KEYS */;
INSERT INTO `offertes` VALUES ('004','A004','036',7,1.10),('004','A075','426',7,0.35),('004','A103','157',7,0.30),('004','A184','478',7,0.60),('004','A385','095',7,0.60),('004','A421','455',7,1.20),('004','B148','380',7,0.60),('004','B331','102',7,0.60),('004','B337','074',7,1.10),('004','C274','470',7,0.60),('004','D225','434',7,0.50),('009','002','498',21,2.95),('009','011','420',21,9.90),('009','013','195',21,6.55),('009','014','104',21,7.90),('009','021','364',21,2.25),('009','023','408',21,10.15),('009','024','103',21,7.90),('009','029','117',21,2.50),('009','044','257',21,3.40),('009','045','397',21,6.75),('009','050','001',21,8.80),('009','064','393',21,4.30),('009','078','286',21,10.15),('009','081','178',21,3.40),('009','085','471',21,4.50),('009','091','027',21,7.90),('009','097','210',21,0.20),('009','099','362',21,5.65),('009','103','066',21,6.10),('009','114','209',21,8.80),('009','115','281',21,5.65),('009','116','263',21,14.40),('009','145','162',21,4.30),('011','E01R','335',21,2.90),('011','E05R','365',10,0.80),('011','E11X','327',10,1.05),('011','E23W','255',10,1.05),('011','H09','408',14,11.95),('011','H10R','001',14,10.35),('011','H14R','397',14,7.95),('011','H14W','195',14,7.70),('011','H17','117',14,2.90),('011','H19O','103',14,9.30),('011','H75P','012',14,10.35),('011','H99G','263',14,16.95),('013','A002','067',10,1.45),('013','A101','036',7,1.15),('013','A103','184',7,0.10),('013','A154','314',7,0.50),('013','A230','372',10,1.65),('013','A395','082',10,2.30),('013','A472','383',7,0.65),('013','A520','391',10,1.30),('013','A677','437',10,1.30),('013','B006','365',14,1.00),('013','B024','393',14,6.20),('013','B101','123',7,0.40),('013','B111','422',10,2.30),('013','B396','311',10,1.65),('013','B578','001',14,12.70),('013','C051','281',14,8.15),('013','C119','262',14,6.20),('013','C243','200',14,11.40),('013','D029','471',14,6.50),('013','D296','362',14,8.15),('013','D321','056',10,1.65),('013','D555','047',14,12.70),('013','D742','364',14,3.25),('013','E098','087',10,1.95),('013','E409','228',10,1.30),('013','F342','300',10,6.20),('013','F823','332',10,1.65),('013','G001','071',10,1.30),('013','G202','031',14,6.50),('013','G430','312',10,2.95),('013','H510','316',10,1.95),('014','001-2','455',10,1.15),('014','012-V','212',10,1.70),('014','027-V','372',10,1.45),('014','067-V','384',10,2.00),('014','082-V','297',10,1.15),('014','103-2','023',10,1.05),('014','117-V','013',10,1.70),('014','118-V','467',10,1.15),('014','162-V','228',10,1.15),('014','195-1','478',10,0.55),('014','201-V','390',10,2.00),('014','209-V','068',10,1.70),('014','255-1','050',10,0.35),('014','257-V','164',10,1.45),('014','263-V','054',10,1.70),('014','264-V','351',10,1.45),('014','273-2','398',10,0.55),('014','281-2','102',10,0.55),('014','286-V','087',10,1.70),('014','300-V','071',10,1.15),('014','327-1','147',10,0.45),('014','335-V','438',10,1.70),('014','362-V','311',10,1.45),('014','365-V','157',10,0.30),('014','393-V','056',10,1.45),('014','397-V','363',10,2.55),('014','400-2','380',10,0.55),('014','408-V','316',10,1.70),('014','471-2','035',10,0.55),('014','498-1','123',10,0.35),('019','ACMO','082',14,2.10),('019','ACON','175',14,1.80),('019','ALSC','425',14,1.20),('019','ALTH','061',14,1.20),('019','CAMP','087',14,1.80),('019','CENT','080',14,1.20),('019','CHRY','164',14,1.50),('019','CYNO','056',14,1.50),('019','DELP','212',14,1.80),('019','DIAN','438',14,1.80),('019','ERYN','013',14,1.80),('019','EUPH','372',14,1.50),('019','GEUM','316',14,1.80),('019','GYPS','363',14,2.70),('019','HELI','467',14,1.20),('019','KNIP','486',14,2.10),('019','LAMI','071',14,1.20),('019','LUPI','089',14,1.50),('019','MATR','234',14,1.80),('019','PAEO','078',14,2.70),('019','POTE','067',14,1.35),('019','ROSM','207',14,1.20),('020','001','470',7,0.65),('020','047','361',7,0.65),('020','066','253',7,0.10),('020','103','036',7,1.15),('020','162','468',7,0.50),('020','195','184',7,0.10),('020','209','123',7,0.40),('020','210','434',7,0.50),('020','257','266',7,0.65),('020','263','169',7,0.05),('020','281','126',7,2.45),('020','362','383',7,0.65),('020','393','147',7,0.50),('020','471','143',7,1.00),('020','498','314',7,0.50),('021','AZA','103',10,8.75),('021','BRE','364',10,2.50),('021','FOR','108',10,2.75),('021','HUL','408',10,11.25),('021','KOR','117',10,2.75),('021','LIG','210',10,0.20),('021','MAG','195',10,7.25),('021','OLI','471',10,5.00),('021','PEP','397',10,7.50),('021','ROD','001',10,9.75),('021','SER','012',10,9.75),('021','TOV','263',10,16.00),('021','VUU','019',10,2.50),('021','ZUU','242',10,1.75),('022','B-003','393',14,5.15),('022','B-011','286',14,12.15),('022','B-034','281',14,6.75),('022','B-076','039',14,2.45),('022','B-104','028',14,22.95),('022','E-002','335',10,2.95),('022','E-003','365',10,0.80),('022','S-015','210',14,0.20),('022','S-077','471',14,5.40),('022','S-118','103',14,9.45),('022','S-154','364',14,2.70),('034','ACMO','082',14,2.15),('034','ALTH','061',14,1.25),('034','ANCE','462',14,1.25),('034','ANEM','390',14,2.15),('034','ANGR','224',14,1.25),('034','ANTI','468',14,0.50),('034','AQUI','153',14,1.55),('034','ARDR','105',14,1.25),('034','BEGO','123',14,0.40),('034','CAMP','087',14,1.85),('034','CHEI','074',14,1.10),('034','CHMA','164',14,1.55),('034','CORT','300',14,5.90),('034','CYNO','398',14,0.60),('034','DELP','212',14,1.85),('034','ECHI','024',14,1.85),('034','ERYN','013',14,1.85),('034','HEDE','427',14,4.65),('034','LUPI','089',14,1.55),('034','OCBA','120',14,1.25),('034','PAPA','285',14,3.10),('034','PARH','380',14,0.60),('034','PHLO','143',14,0.95),('034','PRIM','455',14,1.25),('034','RUSC','319',14,1.25),('034','SALV','391',14,1.25),('034','TAGE','050',14,0.35),('034','TULI','469',14,0.25),('034','VIOL','157',14,0.30),('034','VITI','031',14,6.20),('034','WIST','253',14,0.05),('035','ST1P1','089',10,1.65),('035','ST1P3','311',10,1.65),('035','ST1P4','130',10,1.30),('035','ST1P6','061',10,1.30),('035','ST1P8','428',10,2.95),('035','ST1P9','285',10,3.30),('035','ST2P1','467',10,1.30),('035','ST2P2','054',10,2.00),('035','ST2P3','082',10,2.30),('035','ST2P5','205',10,2.95),('035','ST2P6','068',10,2.00),('035','ST3P1','180',10,4.30),('035','ST3P2','427',10,4.95),('035','ST3P5','296',10,1.30),('035','ST4P1','320',10,7.90),('035','ST4P2','283',10,3.30),('035','ST4P5','190',10,0.85),('035','ST4P6','042',10,3.30);
/*!40000 ALTER TABLE `offertes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planten`
--

DROP TABLE IF EXISTS `planten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planten` (
  `artCode` varchar(3) NOT NULL,
  `naam` varchar(32) NOT NULL,
  `soortID` int(11) NOT NULL,
  `kleurID` int(11) DEFAULT NULL,
  `hoogte` int(11) DEFAULT NULL,
  `bl_b` int(11) DEFAULT NULL,
  `bl_e` int(11) DEFAULT NULL,
  `prijs` decimal(6,2) NOT NULL,
  PRIMARY KEY (`artCode`),
  KEY `FK_Planten_Kleuren` (`kleurID`),
  KEY `FK_Planten_Soorten` (`soortID`),
  CONSTRAINT `FK_Planten_Kleuren` FOREIGN KEY (`kleurID`) REFERENCES `kleuren` (`kleurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Planten_Soorten` FOREIGN KEY (`soortID`) REFERENCES `soorten` (`soortID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planten`
--

LOCK TABLES `planten` WRITE;
/*!40000 ALTER TABLE `planten` DISABLE KEYS */;
INSERT INTO `planten` VALUES ('001','Rododendron',5,9,125,5,7,19.50),('012','Sering',5,8,500,5,6,19.50),('013','Kruisdistel',9,1,75,6,7,3.00),('019','Vuurdoorn',5,12,NULL,6,6,5.00),('023','Klokjesbloem',2,1,70,6,8,1.80),('024','Kogeldistel',9,1,175,6,7,3.00),('027','Paardekastanje',4,12,2500,5,5,17.50),('028','Linde',4,3,4000,7,8,42.50),('031','Wijnstok',7,NULL,600,NULL,NULL,10.00),('035','Violier',2,4,60,6,7,1.00),('036','Zonnebloem',1,3,150,8,10,1.80),('039','Populier',4,12,1000,3,4,4.50),('042','Cypergras',10,NULL,100,NULL,NULL,5.00),('047','Zilverspar',4,NULL,3000,NULL,NULL,19.50),('050','Afrikaantje',1,3,25,7,10,0.60),('054','Boterbloem',9,12,50,5,6,3.00),('056','Hondstong',9,1,30,6,8,2.50),('061','Stokroos',9,9,250,6,9,2.00),('066','Dwergcypres',4,NULL,500,NULL,NULL,13.50),('067','Ganzerik',9,9,25,6,9,2.25),('068','Daglelie',9,9,80,6,8,3.00),('071','Dovenetel',9,3,25,4,5,2.00),('074','Muurbloem',2,2,50,4,5,1.80),('078','Pioen',9,9,50,6,7,4.50),('080','Korenbloem',9,1,80,7,8,2.00),('082','Bereklauw',9,12,100,7,9,3.50),('087','Klokjesbloem',9,1,90,6,8,3.00),('089','Lupine',9,4,100,6,7,2.50),('095','Violier',1,4,60,6,8,1.00),('102','Judaspenning',2,6,70,5,7,1.00),('103','Azalea',5,7,200,4,5,17.50),('104','Esdoorn',4,5,2500,6,6,17.50),('105','Dragon',8,12,100,8,9,2.00),('108','Forsythia',5,3,250,3,4,5.50),('117','Kornoeltje',5,3,300,5,NULL,5.50),('120','Basilicum',8,12,50,8,9,2.00),('123','Begonia',1,9,15,6,9,0.65),('126','Sierui',3,1,75,6,8,3.75),('130','Vingerhoedskruid',9,4,NULL,6,8,2.00),('143','Vlambloem',1,4,30,7,8,1.50),('147','Aster',1,4,50,7,10,0.75),('153','Akelei',9,1,60,5,7,2.50),('157','Viooltje',2,4,15,3,8,0.50),('162','Azijnboom',4,9,NULL,6,7,9.50),('164','Margriet',9,12,70,6,8,2.50),('169','Krokus',3,12,15,2,3,0.10),('175','Monnikskap',9,11,120,8,9,3.00),('178','Lijsterbes',4,12,500,5,5,7.50),('180','Bosrank',7,8,300,7,9,6.50),('184','Iris',3,1,100,5,7,0.14),('190','Kikkerbeet',10,12,NULL,7,8,1.25),('195','Magnolia',5,12,1000,4,5,14.50),('200','Acacia',4,12,2500,6,6,17.50),('205','Dotterbloem',10,3,30,4,6,4.50),('207','Rozemarijn',8,1,150,5,5,2.00),('209','Meidoorn',4,10,700,5,5,19.50),('210','Liguster',5,12,200,7,7,0.40),('212','Ridderspoor',9,6,150,6,7,3.00),('224','Dille',8,3,90,7,8,2.00),('228','Engels gras',9,9,20,NULL,NULL,2.00),('234','Kamille',9,12,70,6,7,3.00),('242','Zuurbes',5,7,300,5,6,3.50),('253','Blauw druifje',3,1,20,2,6,0.12),('255','Winterheide',6,12,20,2,4,2.00),('257','Berk',4,NULL,2000,NULL,NULL,7.50),('262','Passiebloem',7,1,NULL,6,9,9.50),('263','Toverhazelaar',5,3,500,1,2,32.00),('266','Korenbloem',1,4,80,7,8,1.00),('281','Beuk',4,5,3000,4,5,12.50),('283','Waterhyacint',10,1,NULL,6,9,5.00),('285','Klaproos',9,9,70,5,6,3.00),('286','Tulpeboom',4,3,2000,6,7,22.50),('296','Peterselie',8,NULL,25,NULL,NULL,2.00),('297','Majoraan',8,8,30,7,8,2.00),('300','Pampusgras',9,12,300,9,10,9.50),('311','Leverkruid',9,8,175,8,9,2.50),('312','Lisdodde',10,3,200,8,9,4.50),('314','Chrysant',1,3,80,6,8,0.80),('316','Nagelkruid',9,7,50,7,8,3.00),('319','Zuring',8,9,70,6,6,2.00),('320','Waterlelie',10,12,NULL,NULL,NULL,12.00),('327','Struikheide',6,4,30,6,8,2.00),('332','Blaasjeskruid',10,3,NULL,7,8,2.50),('335','Boomheide',6,10,150,7,9,5.50),('351','Tijm',8,8,10,6,6,2.50),('361','Ridderspoor',1,4,50,7,8,1.00),('362','Spar',4,NULL,3000,NULL,NULL,12.50),('363','Gipskruid',9,12,90,7,8,4.50),('364','Brem',5,3,150,4,7,5.00),('365','Dopheide',6,9,35,6,9,1.50),('372','Wolfsmelk',9,3,60,4,4,2.50),('380','Klaproos',2,4,40,6,6,1.00),('383','Dahlia',1,4,40,8,10,1.00),('384','Vuurwerkplant',9,10,150,6,7,3.50),('390','Anemoon',9,10,50,8,10,3.50),('391','Salie',8,11,100,6,7,2.00),('393','Judasboom',4,10,800,5,5,9.50),('397','Peperboompje',5,10,125,2,3,15.00),('398','Hondstong',2,1,30,5,6,1.00),('408','Hulst',5,NULL,700,NULL,NULL,22.50),('420','Gouden regen',4,3,600,5,5,22.00),('422','Wolgras',10,12,30,5,6,3.50),('425','Bieslook',8,8,20,7,8,2.00),('426','Alyssum',1,8,10,6,9,0.60),('427','Klimop',7,NULL,NULL,NULL,NULL,7.50),('428','Kalmoes',10,NULL,90,NULL,NULL,4.50),('434','Petunia',1,10,25,7,10,0.80),('437','Munt',8,8,40,8,8,2.00),('438','Anjer',9,12,40,6,8,3.00),('455','Sleutelbloem',2,4,25,4,5,2.00),('462','Kervel',8,12,30,NULL,NULL,2.00),('467','Zonnebloem',9,3,150,8,9,2.00),('468','Leeuwebekje',1,4,50,7,8,0.80),('469','Tulp',3,3,30,4,6,0.40),('470','Gipskruid',1,12,50,6,7,1.00),('471','Olijfwilg',5,3,400,9,10,10.00),('478','Klaproos',1,4,35,6,9,1.00),('486','Vuurpijl',9,9,120,6,9,3.50),('498','Jeneverbes',4,NULL,250,NULL,NULL,6.50);
/*!40000 ALTER TABLE `planten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soorten`
--

DROP TABLE IF EXISTS `soorten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soorten` (
  `soortID` int(11) NOT NULL AUTO_INCREMENT,
  `soort` varchar(100) NOT NULL,
  PRIMARY KEY (`soortID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soorten`
--

LOCK TABLES `soorten` WRITE;
/*!40000 ALTER TABLE `soorten` DISABLE KEYS */;
INSERT INTO `soorten` VALUES (1,'1-jarig'),(2,'2-jarig'),(3,'bol'),(4,'boom'),(5,'heester'),(6,'heide'),(7,'klim'),(8,'kruid'),(9,'vast'),(10,'water');
/*!40000 ALTER TABLE `soorten` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-13 15:56:14
