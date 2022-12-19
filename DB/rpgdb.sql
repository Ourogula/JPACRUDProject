-- MySQL dump 10.13  Distrib 5.7.34, for osx11.0 (x86_64)
--
-- Host: localhost    Database: rpgdb
-- ------------------------------------------------------
-- Server version	5.7.34

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
-- Current Database: `rpgdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rpgdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rpgdb`;

--
-- Table structure for table `character_build`
--

DROP TABLE IF EXISTS `character_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_build` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `strength` int(3) unsigned NOT NULL DEFAULT '1',
  `dexterity` int(3) unsigned NOT NULL DEFAULT '1',
  `constitution` int(3) unsigned NOT NULL DEFAULT '1',
  `intelligence` int(3) unsigned NOT NULL DEFAULT '1',
  `wisdom` int(3) unsigned NOT NULL DEFAULT '1',
  `charisma` int(3) unsigned NOT NULL DEFAULT '1',
  `class_id` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_character_build_class_idx` (`class_id`),
  KEY `fk_character_build_race1_idx` (`race_id`),
  CONSTRAINT `fk_character_build_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_build_race1` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_build`
--

LOCK TABLES `character_build` WRITE;
/*!40000 ALTER TABLE `character_build` DISABLE KEYS */;
INSERT INTO `character_build` VALUES (11,'Lance Longinus','Lances only please, I don\'t want any trouble. I can\'t take any more lances!',6,2,5,1,2,8,7,1),(12,'Paw McPawson','Cat fistfighter Necromancer',5,4,3,1,3,1,6,6),(14,'Alabama Beach Mouse','Infinite Mice in a human suit',1,10,1,2,1,5,2,1),(17,'GIGANTES MOTI','BIG!',10,1,101,1,11,1,8,7),(18,'Pointy Ears','Elf child',2,4,1,3,3,2,7,2),(19,'Garbill Hardbark','Treant monk is here',2,1,3,4,7,1,9,8),(20,'Kane Blood-Axe','Elf King and Orc Chieftain',10,4,4,1,1,8,8,4),(21,'Short Dwarfman','Stock dwarf ally',5,2,5,2,1,4,1,3),(22,'Mary Pawson','Cat?',2,2,2,4,4,8,3,6);
/*!40000 ALTER TABLE `character_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (7,'Assassin'),(8,'Barbarian'),(5,'Cleric'),(1,'Fighter'),(3,'Magician'),(9,'Monk'),(6,'Necromancer'),(4,'Ranger'),(2,'Rogue');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `race` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `image` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (1,'Human',NULL,'https://www.mtgnexus.com/img/gallery/1666-vivien-reid.jpg'),(2,'Elf',NULL,'https://i.pinimg.com/736x/d4/61/08/d46108be0eae0c5bf3dea9daf6197c60--the-gathering-elves.jpg'),(3,'Dwarf',NULL,'https://i.pinimg.com/originals/5c/b6/a1/5cb6a1a5fa1ca3c6edd0996f0669b50d.png'),(4,'Orc',NULL,'https://www.mtgnexus.com/img/gallery/5558-orcish-vandal.jpg'),(5,'Goblin',NULL,'https://www.mtgnexus.com/img/gallery/3214-goblin-instigator.jpg'),(6,'Cat Folk',NULL,'https://i.kym-cdn.com/photos/images/original/002/227/048/1b5.jpg'),(7,'Giant',NULL,'https://i.pinimg.com/564x/a8/3c/c4/a83cc4cb2c25f12bc174731454cbec1b.jpg'),(8,'Treant',NULL,'https://pbs.twimg.com/media/D9iAuU1VAAAz_xU.jpg:large');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-18 19:51:07
