CREATE DATABASE  IF NOT EXISTS `vegin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vegin`;
-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: vegin
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2021-03-20 00:48:10','2021-03-20 00:48:10'),(2,NULL,1,'Category 2','category-2','2021-03-20 00:48:10','2021-03-20 00:48:10'),(3,1,3,'category 3','category-3','2021-04-10 06:53:41','2021-04-10 06:53:41');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `dish_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_index` (`user_id`),
  KEY `comments_dish_id_index` (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Boa pedida!!!',3,3,'2021-04-10 02:22:00','2021-05-11 10:05:14'),(2,'Não tem competição, ninguem segura o vegan burger!!',2,3,'2021-05-11 10:05:00','2021-05-11 21:42:39'),(3,'Realmente..',3,3,'2021-05-11 10:15:59','2021-05-11 10:15:59'),(17,'Superou o do hareburguer... Só acreditei vendo mesmo....',2,3,'2021-05-24 03:33:56','2021-05-24 03:33:56'),(22,'Haha',2,3,'2021-05-24 03:39:02','2021-05-24 03:39:02'),(23,'Lol',2,3,'2021-05-24 03:39:50','2021-05-24 03:39:50'),(24,'?',2,3,'2021-05-24 03:41:15','2021-05-24 03:41:15'),(25,'Zoa',2,3,'2021-05-24 03:42:09','2021-05-24 03:42:09'),(26,'Excelente ??',2,4,'2021-05-27 00:40:22','2021-05-27 00:40:22');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `animal_prod` tinyint DEFAULT NULL,
  `animal_tests` tinyint DEFAULT NULL,
  `animal_event` tinyint DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Nabisco',1,0,0,'Nabisco, cujo nome advém das iniciais de National Biscuit Company, é uma empresa americana fabricante de biscoitos e outros tipos de doces.',2,'companies\\April2021\\w3tdMdMgzuX3Ym4GrhWN.png','2021-04-21 07:29:00','2021-04-24 03:06:57',1),(2,'Nissin',1,1,0,'Empresa do ramo alimenticio especializada em macarrão instantaneo, fundada no Japão em 1958. Em 2018 a empresa se propôs a parar com os testes em animais, porém nunca mais mencionou o assunto.',2,'companies/June2021/L3xvCnnSZF5fOxHXPEfJ.png','2021-06-20 01:06:00','2021-06-20 01:06:00',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_group_reports`
--

DROP TABLE IF EXISTS `company_group_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_group_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `user_id` int NOT NULL,
  `company_group_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_group_reports`
--

LOCK TABLES `company_group_reports` WRITE;
/*!40000 ALTER TABLE `company_group_reports` DISABLE KEYS */;
INSERT INTO `company_group_reports` VALUES (7,'Observação com dados incorretos',0,2,1,'2021-06-17 05:27:39','2021-06-17 05:27:39');
/*!40000 ALTER TABLE `company_group_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_groups`
--

DROP TABLE IF EXISTS `company_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `animal_tests` tinyint DEFAULT NULL,
  `animal_event` tinyint DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_groups`
--

LOCK TABLES `company_groups` WRITE;
/*!40000 ALTER TABLE `company_groups` DISABLE KEYS */;
INSERT INTO `company_groups` VALUES (1,'Mondelez International','company-groups\\April2021\\vjJ32247RIm3dAJ9hO8l.png',0,0,'Mondelēz International, Inc. é um conglomerado multinacional estadunidense de alimentos.  A empresa fica sediada em Deerfield, Illinois e fabrica chocolates, biscoitos, chicletes, confeitos e bebidas em pó.',2,'2021-04-21 07:26:20','2021-04-21 07:26:20');
/*!40000 ALTER TABLE `company_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_reports`
--

DROP TABLE IF EXISTS `company_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_reports`
--

LOCK TABLES `company_reports` WRITE;
/*!40000 ALTER TABLE `company_reports` DISABLE KEYS */;
INSERT INTO `company_reports` VALUES (1,'Dados sobre testes em animais incorretos',0,2,1,'2021-06-17 05:22:18','2021-06-17 05:22:18'),(2,'Observação com dados incorretos',0,2,1,'2021-06-17 05:23:09','2021-06-17 05:23:09'),(3,'Observação com dados incorretos',0,2,1,'2021-06-17 05:27:57','2021-06-17 05:27:57'),(4,'Essa empresa não existe mais',0,2,1,'2021-06-19 00:59:45','2021-06-19 00:59:45');
/*!40000 ALTER TABLE `company_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'{}',1),(2,1,'name','text','Name',1,1,1,1,1,1,'{}',2),(3,1,'email','text','Email',1,1,1,1,1,1,'{}',3),(4,1,'password','password','Password',1,0,0,1,1,0,'{}',4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,'{}',5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,'{}',8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,'{}',12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',0,1,1,1,1,1,'{}',9),(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,NULL,4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(29,5,'id','number','ID',1,0,0,0,0,0,NULL,1),(30,5,'author_id','text','Author',1,0,1,1,0,1,NULL,2),(31,5,'category_id','text','Category',1,0,1,1,1,0,NULL,3),(32,5,'title','text','Title',1,1,1,1,1,1,NULL,4),(33,5,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(37,5,'meta_description','text_area','Meta Description',1,0,1,1,1,1,NULL,9),(38,5,'meta_keywords','text_area','Meta Keywords',1,0,1,1,1,1,NULL,10),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(42,5,'seo_title','text','SEO Title',0,1,1,1,1,1,NULL,14),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,NULL,15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Author',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Title',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(50,6,'meta_description','text','Meta Description',1,0,1,1,1,1,NULL,7),(51,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,NULL,8),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Page Image',0,1,1,1,1,1,NULL,12),(66,1,'email_verified_at','timestamp','Email Verified At',0,1,1,1,1,1,'{}',6),(67,1,'Location','text','Location',0,0,0,0,0,0,'{}',12),(68,1,'last_long','text','Last Long',0,0,0,0,0,0,'{}',13),(69,1,'last_lat','text','Last Lat',0,0,0,0,0,0,'{}',14),(70,1,'language','text','Language',0,0,0,0,0,0,'{}',15),(77,19,'id','text','Id',1,0,0,0,0,0,'{}',1),(78,19,'content','text','Content',1,1,1,1,1,1,'{}',2),(79,19,'user_id','text','User Id',1,1,1,1,1,0,'{}',3),(80,19,'dish_id','text','Dish Id',1,1,1,1,1,0,'{}',4),(81,19,'comment_belongsto_dish_relationship','relationship','dishes',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Dish\",\"table\":\"dishes\",\"type\":\"belongsTo\",\"column\":\"dish_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',5),(83,19,'comment_belongsto_user_relationship','relationship','users',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',6),(84,21,'id','text','Id',1,0,0,0,0,0,'{}',1),(85,21,'name','text','Name',1,1,1,1,1,1,'{}',2),(86,21,'image','image','Image',1,1,1,1,1,1,'{}',3),(87,21,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',4),(88,21,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'{}',5),(89,21,'description','text','Description',0,1,1,1,1,1,'{}',6),(90,22,'id','text','Id',1,0,0,0,0,0,'{}',1),(93,22,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(94,22,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'{}',5),(95,22,'coordinates','coordinates','Coordinates',1,1,1,1,1,1,'{}',2),(96,23,'id','text','Id',1,0,0,0,0,0,'{}',1),(97,23,'name','text','Name',1,1,1,1,1,1,'{}',2),(98,23,'image','image','Image',0,1,1,1,1,1,'{}',3),(99,23,'type','select_dropdown','Type',1,1,1,1,1,1,'{\"default\":\"omnivore\",\"options\":{\"0\":\"omnivore\",\"1\":\"vegan\",\"2\":\"vegetarian\",\"3\":\"carnivore\"}}',4),(100,23,'status','select_dropdown','Status',1,1,1,1,1,0,'{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}',5),(101,23,'notes','text','Notes',0,1,1,1,1,1,'{}',6),(102,23,'rating','text','Rating',0,1,1,1,1,0,'{}',7),(103,23,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(104,23,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(106,22,'location_belongsto_establishment_relationship','relationship','establishments',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Establishment\",\"table\":\"establishments\",\"type\":\"belongsTo\",\"column\":\"establishment_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',6),(107,22,'establishment_id','text','Establishment Id',1,1,1,1,1,1,'{}',5),(116,21,'dish_belongsto_establishment_relationship','relationship','Establishments',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Establishment\",\"table\":\"establishments\",\"type\":\"belongsTo\",\"column\":\"establishment_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(117,21,'establishment_id','text','Establishment Id',1,1,1,1,1,1,'{}',8),(124,25,'id','text','Id',1,0,0,0,0,0,'{}',1),(125,25,'name','text','Name',1,1,1,1,1,1,'{}',2),(126,25,'animal_ing','checkbox','Animal Ing',0,1,1,1,1,1,'{}',4),(127,25,'notes','text','Notes',0,1,1,1,1,1,'{}',6),(128,25,'barcode_id','text','Barcode Id',0,1,1,1,1,1,'{}',7),(129,25,'barcode_format','select_dropdown','Barcode Format',0,1,1,1,1,1,'{\"default\":\"ean13\",\"options\":{\"1\":\"code128\",\"2\":\"code39\",\"4\":\"code93\",\"8\":\"codabar\",\"16\":\"datamatrix\",\"32\":\"ean13\",\"64\":\"ean8\",\"128\":\"itf14\",\"256\":\"qr\",\"512\":\"upc_a\",\"1024\":\"upc_e\",\"2048\":\"pdf417\",\"4096\":\"aztec\"}}',8),(130,25,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}',5),(131,25,'company_id','text','Company Id',0,1,1,1,1,1,'{}',9),(132,25,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',10),(133,25,'updated_at','timestamp','Updated At',0,0,1,0,0,0,'{}',11),(134,19,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(135,19,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(136,26,'id','text','Id',1,0,0,0,0,0,'{}',1),(137,26,'name','text','Name',0,1,1,1,1,1,'{}',2),(138,26,'animal_prod','checkbox','Animal Prod',0,1,1,1,1,1,'{}',5),(139,26,'animal_tests','checkbox','Animal Tests',0,1,1,1,1,1,'{}',6),(140,26,'animal_event','checkbox','Animal Event',0,1,1,1,1,1,'{}',7),(141,26,'notes','text','Notes',0,1,1,1,1,1,'{}',8),(142,26,'status','select_dropdown','Status',0,1,1,1,1,1,'{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}',4),(143,26,'image','image','Image',0,1,1,1,1,1,'{}',3),(144,26,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',9),(145,26,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',10),(146,25,'image','image','Image',0,1,1,1,1,1,'{}',3),(147,25,'product_belongsto_company_relationship','relationship','companies',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',12),(148,27,'id','text','Id',1,0,0,0,0,0,'{}',1),(149,27,'name','text','Name',0,1,1,1,1,1,'{}',2),(150,27,'image','image','Image',0,1,1,1,1,1,'{}',3),(151,27,'animal_tests','checkbox','Animal Tests',0,1,1,1,1,1,'{}',4),(152,27,'animal_event','checkbox','Animal Event',0,1,1,1,1,1,'{}',5),(153,27,'notes','text','Notes',0,1,1,1,1,1,'{}',6),(154,27,'status','select_dropdown','Status',0,1,1,1,1,1,'{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}',7),(155,27,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(156,27,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(157,26,'company_belongsto_company_group_relationship','relationship','company_groups',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\CompanyGroup\",\"table\":\"company_groups\",\"type\":\"belongsTo\",\"column\":\"group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',12),(158,26,'group_id','text','Group Id',0,1,1,1,1,1,'{}',11),(159,29,'id','text','Id',1,0,0,0,0,0,'{}',1),(160,29,'description','text','Description',1,1,1,1,1,1,'{}',2),(161,29,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}',3),(162,29,'user_id','text','User Id',1,1,1,1,1,1,'{}',4),(163,29,'company_id','text','Company Id',1,1,1,1,1,1,'{}',5),(164,29,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(165,29,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(166,29,'company_report_belongsto_company_relationship','relationship','companies',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(167,29,'company_report_belongsto_user_relationship','relationship','users',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(168,30,'id','text','Id',1,0,0,0,0,0,'{}',1),(169,30,'description','text','Description',1,1,1,1,1,1,'{}',2),(170,30,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}',3),(171,30,'user_id','text','User Id',1,1,1,1,1,1,'{}',4),(172,30,'company_group_id','text','Company Group Id',1,1,1,1,1,1,'{}',5),(173,30,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(174,30,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(175,30,'company_group_report_belongsto_company_group_relationship','relationship','company_groups',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\CompanyGroup\",\"table\":\"company_groups\",\"type\":\"belongsTo\",\"column\":\"company_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(176,30,'company_group_report_belongsto_user_relationship','relationship','users',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(177,31,'id','text','Id',1,0,0,0,0,0,'{}',1),(178,31,'description','text','Description',1,1,1,1,1,1,'{}',2),(179,31,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}',3),(180,31,'user_id','text','User Id',1,1,1,1,1,1,'{}',4),(181,31,'product_id','text','Product Id',1,1,1,1,1,1,'{}',5),(182,31,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(183,31,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(184,31,'product_report_belongsto_user_relationship','relationship','users',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(185,31,'product_report_belongsto_product_relationship','relationship','products',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(186,33,'id','text','Id',1,0,0,0,0,0,'{}',1),(187,33,'description','text','Description',1,1,1,1,1,1,'{}',2),(188,33,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}',3),(189,33,'user_id','text','User Id',1,1,1,1,1,1,'{}',4),(190,33,'establishment_id','text','Establishment Id',1,1,1,1,1,1,'{}',5),(191,33,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(192,33,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(193,33,'establishment_report_belongsto_user_relationship','relationship','users',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(194,33,'establishment_report_belongsto_establishment_relationship','relationship','establishments',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Establishment\",\"table\":\"establishments\",\"type\":\"belongsTo\",\"column\":\"establishment_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(195,21,'dish_belongsto_user_relationship','relationship','users',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',11),(196,21,'user_id','text','User Id',1,1,1,1,1,1,'{}',10),(197,21,'rating','text','Rating',0,1,1,1,1,1,'{}',7);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2021-03-20 00:47:55','2021-04-10 06:26:45'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2021-03-20 00:47:55','2021-03-20 00:47:55'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2021-03-20 00:47:55','2021-03-20 00:47:55'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2021-03-20 00:48:09','2021-03-20 00:48:09'),(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2021-03-20 00:48:11','2021-03-20 00:48:11'),(6,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2021-03-20 00:48:13','2021-03-20 00:48:13'),(19,'comments','comments','Comment','Comments','voyager-chat','App\\Models\\Comment',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-09 02:48:29','2021-04-21 06:11:18'),(21,'dishes','dishes','Dish','Dishes','voyager-pizza','App\\Models\\Dish',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-10 02:17:45','2021-05-10 23:45:31'),(22,'locations','locations','Location','Locations','voyager-location','App\\Models\\Location',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-10 02:36:14','2021-05-18 06:36:54'),(23,'establishments','establishments','Establishment','Establishments','voyager-shop','App\\Models\\Establishment',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-10 05:23:29','2021-06-19 05:33:00'),(25,'products','products','Product','Products','voyager-cup','App\\Models\\Product',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-21 05:53:21','2021-06-20 07:58:05'),(26,'companies','companies','Company','Companies','voyager-lighthouse','App\\Models\\Company',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-21 06:40:44','2021-04-21 07:16:38'),(27,'company_groups','company-groups','Company Group','Company Groups','voyager-company','App\\Models\\CompanyGroup',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2021-04-21 07:12:32','2021-04-21 07:12:32'),(29,'company_reports','company-reports','Company Report','Company Reports','voyager-warning','App\\Models\\CompanyReport',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-23 02:10:45','2021-04-25 00:28:37'),(30,'company_group_reports','company-group-reports','Company Group Report','Company Group Reports','voyager-warning','App\\Models\\CompanyGroupReport',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-23 02:17:17','2021-06-17 05:31:36'),(31,'product_reports','product-reports','Product Report','Product Reports','voyager-warning','App\\Models\\ProductReport',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-23 02:33:52','2021-04-25 00:30:15'),(33,'establishment_reports','establishment-reports','Establishment Report','Establishment Reports','voyager-warning','App\\Models\\EstablishmentReport',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-04-23 02:41:12','2021-04-25 00:29:22');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_ratings`
--

DROP TABLE IF EXISTS `dish_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dish_id` int NOT NULL,
  `user_id` int NOT NULL,
  `value` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_ratings`
--

LOCK TABLES `dish_ratings` WRITE;
/*!40000 ALTER TABLE `dish_ratings` DISABLE KEYS */;
INSERT INTO `dish_ratings` VALUES (5,4,1,5,'2021-06-20 08:16:35','2021-06-20 08:16:35'),(6,3,1,1,'2021-06-20 08:16:42','2021-06-20 08:16:42'),(10,3,2,1,'2021-06-20 08:25:30','2021-06-20 08:25:30'),(12,4,2,5,'2021-06-20 08:27:30','2021-06-20 08:27:30');
/*!40000 ALTER TABLE `dish_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (3,'Vegan Burger','dishes\\April2021\\6H4gY43cYD8wQ6VxSo9a.jpg','2021-04-10 02:16:31','2021-06-20 08:25:30','Melhor hamburguer vegano da cidade',2,2,1),(4,'Coxinha de Jaca','dishes\\April2021\\AkP3dY1835lf5INuetu4.jpg','2021-04-25 00:18:58','2021-06-20 09:31:05','Já comi melhores mas ela é muito boa',3,3,5),(5,'HotVegan','dishes/May2021/Anp5WE6aWQBhO2jyKWSp.jpg','2021-05-07 02:52:02','2021-05-10 23:46:03','Melhor cachorro quente vegano do mundo!!',3,2,4.5);
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establishment_ratings`
--

DROP TABLE IF EXISTS `establishment_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establishment_ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `establishment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `value` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establishment_ratings`
--

LOCK TABLES `establishment_ratings` WRITE;
/*!40000 ALTER TABLE `establishment_ratings` DISABLE KEYS */;
INSERT INTO `establishment_ratings` VALUES (7,2,1,3,'2021-06-19 08:06:57','2021-06-19 08:06:57'),(13,3,1,5,'2021-06-19 08:47:45','2021-06-19 08:47:45'),(18,3,2,5,'2021-06-19 09:05:01','2021-06-19 09:05:01');
/*!40000 ALTER TABLE `establishment_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establishment_reports`
--

DROP TABLE IF EXISTS `establishment_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establishment_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `user_id` int NOT NULL,
  `establishment_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establishment_reports`
--

LOCK TABLES `establishment_reports` WRITE;
/*!40000 ALTER TABLE `establishment_reports` DISABLE KEYS */;
INSERT INTO `establishment_reports` VALUES (2,'Logo do restaurante incorreto',0,2,2,'2021-06-19 05:29:15','2021-06-19 05:29:15');
/*!40000 ALTER TABLE `establishment_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establishments`
--

DROP TABLE IF EXISTS `establishments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establishments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establishments`
--

LOCK TABLES `establishments` WRITE;
/*!40000 ALTER TABLE `establishments` DISABLE KEYS */;
INSERT INTO `establishments` VALUES (2,'The Fifties','establishments\\April2021\\uWeryxBJsdRCJXW7U9A5.png',0,0,'Eles possuem somente um hamburguer como opção vegana, mas realmente vale a pena',3,'2021-04-10 06:19:00','2021-06-19 08:06:57'),(3,'HareBurger','establishments\\April2021\\mG3sKPyeLmfo1G8he3W7.jpg',2,2,'Melhor fast-food vegetariano do Rio',5,'2021-04-20 07:37:00','2021-06-19 09:05:01');
/*!40000 ALTER TABLE `establishments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `coordinates` geometry NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `establishment_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (3,_binary '\0\0\0\0\0\0\0d���E�\�up\���6�','2021-04-10 06:20:35','2021-04-10 06:20:35',2),(4,_binary '\0\0\0\0\0\0\0k\�,���E���4\�6�','2021-05-18 06:38:45','2021-05-18 06:38:45',3);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2021-03-20 00:47:57','2021-03-20 00:47:57','voyager.dashboard',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2021-03-20 00:47:57','2021-04-07 02:03:53','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2021-03-20 00:47:57','2021-04-07 02:03:53','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,18,'2021-03-20 00:47:57','2021-04-23 02:42:20',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2021-03-20 00:47:57','2021-04-06 22:43:14','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2021-03-20 00:47:57','2021-04-06 22:43:14','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2021-03-20 00:47:57','2021-04-06 22:43:14','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2021-03-20 00:47:57','2021-04-06 22:43:14','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,19,'2021-03-20 00:47:57','2021-04-23 02:42:20','voyager.settings.index',NULL),(14,1,'Hooks','','_self','voyager-hook',NULL,5,5,'2021-03-20 00:48:18','2021-04-06 22:43:14','voyager.hooks',NULL),(22,1,'Comments','','_self','voyager-chat','#000000',NULL,9,'2021-04-09 02:48:29','2021-04-10 06:54:57','voyager.comments.index','null'),(23,1,'Dishes','','_self','voyager-pizza','#000000',NULL,8,'2021-04-10 02:17:46','2021-04-10 06:54:57','voyager.dishes.index','null'),(24,1,'Locations','','_self','voyager-location','#000000',NULL,6,'2021-04-10 02:36:14','2021-04-10 06:54:57','voyager.locations.index','null'),(25,1,'Establishments','','_self','voyager-shop','#000000',NULL,7,'2021-04-10 05:23:29','2021-04-10 06:54:57','voyager.establishments.index','null'),(27,1,'Products','','_self','voyager-cup',NULL,NULL,12,'2021-04-21 05:53:21','2021-04-21 07:13:58','voyager.products.index',NULL),(28,1,'Companies','','_self','voyager-lighthouse',NULL,NULL,11,'2021-04-21 06:40:44','2021-04-21 07:13:58','voyager.companies.index',NULL),(29,1,'Company Groups','','_self','voyager-company',NULL,NULL,10,'2021-04-21 07:12:33','2021-04-21 07:13:58','voyager.company-groups.index',NULL),(30,1,'Company Reports','','_self','voyager-warning','#000000',NULL,14,'2021-04-23 02:10:46','2021-04-23 02:13:16','voyager.company-reports.index','null'),(31,1,'Company Group Reports','','_self','voyager-warning',NULL,NULL,15,'2021-04-23 02:17:17','2021-04-23 02:42:15','voyager.company-group-reports.index',NULL),(32,1,'Product Reports','','_self','voyager-warning',NULL,NULL,16,'2021-04-23 02:33:52','2021-04-23 02:42:18','voyager.product-reports.index',NULL),(33,1,'Establishment Reports','','_self','voyager-warning','#000000',NULL,17,'2021-04-23 02:41:12','2021-04-23 02:43:24','voyager.establishment-reports.index','null');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2021-03-20 00:47:56','2021-03-20 00:47:56');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2016_01_01_000000_create_pages_table',2),(25,'2016_01_01_000000_create_posts_table',2),(26,'2016_02_15_204651_create_categories_table',2),(27,'2017_04_11_000000_alter_post_nullable_fields_table',2),(28,'2016_06_01_000001_create_oauth_auth_codes_table',3),(29,'2016_06_01_000002_create_oauth_access_tokens_table',3),(30,'2016_06_01_000003_create_oauth_refresh_tokens_table',3),(31,'2016_06_01_000004_create_oauth_clients_table',3),(32,'2016_06_01_000005_create_oauth_personal_access_clients_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('01d784d41af1986555ad185f0df8154108c59760bf92026b40aa1391b91ddabe94ac48914b5f9e32',2,1,'authToken','[]',0,'2021-05-27 08:02:40','2021-05-27 08:02:40','2022-05-27 05:02:40'),('01f6349bcc408d56ea233c054e72f7d1d6cb7734859e6ed0071dd9e1387a0f9fc285a02b1ddb4394',2,1,'authToken','[]',0,'2021-06-20 04:16:35','2021-06-20 04:16:35','2022-06-20 01:16:35'),('020d8a79a6a06996e01f2b39642643d9f67c56104419b43e945d9557ac6594eb41c53c7f7f0837f0',1,1,'authToken','[]',0,'2021-05-23 01:03:54','2021-05-23 01:03:54','2022-05-22 22:03:54'),('021ca49c319a74357c90e4d3e411e84da3c5536fb021c46e56f9848f04af3c643d92f93a03e14031',2,1,'authToken','[]',0,'2021-06-20 04:09:59','2021-06-20 04:09:59','2022-06-20 01:09:59'),('0248a723fd13c16a25b1ae61cfde3ad60238080c9ba0475c3e33e6b19cccb8975e632a18f94987b7',2,1,'authToken','[]',0,'2021-06-20 08:52:43','2021-06-20 08:52:43','2022-06-20 05:52:43'),('02e022f8004e7d93242b409cfd78bb35fd81df306577180ad91f5bfeb68fd88fbeccbf49cd267494',2,1,'authToken','[]',0,'2021-06-19 09:03:52','2021-06-19 09:03:52','2022-06-19 06:03:52'),('033d6bc29de11dbc509b21b248bfce34bb0b842ae4c166aeae937092d02fc885b77be913d4a65932',1,1,'authToken','[]',0,'2021-05-19 04:40:16','2021-05-19 04:40:16','2022-05-19 01:40:16'),('049ca3942f7b3f11dd8140d4ed52de5ce226f8fb6e107ac6552b5acf858387dc7964479841604e1b',1,1,'authToken','[]',0,'2021-05-23 05:16:41','2021-05-23 05:16:41','2022-05-23 02:16:41'),('06f64cb25a401a4605b61e215b102635c60e93a775881c80e3c087e96fb5aac46d64d777c575c5e9',1,1,'authToken','[]',0,'2021-05-22 07:51:07','2021-05-22 07:51:07','2022-05-22 04:51:07'),('0880d1277a0d60ec8b90f61b5a7e14e59377734506a3ae660d0e0d448eda90fadd187a7d9c409279',2,1,'authToken','[]',0,'2021-06-20 09:57:53','2021-06-20 09:57:53','2022-06-20 06:57:53'),('098923418b80e20b634fde7250421a8a7a8880a5380e34a37674dc4ec49b9ca4ef6e9507689f15fb',2,1,'authToken','[]',0,'2021-05-27 01:07:45','2021-05-27 01:07:45','2022-05-26 22:07:45'),('098b517afdcf4e57e0015157e5fe10f03dca8f099d3b65dcbce34c5dcf6874d8ef9946af9c9175b2',1,1,'authToken','[]',0,'2021-06-02 09:28:23','2021-06-02 09:28:23','2022-06-02 06:28:23'),('0b0f26aefb2f486e8486b063b4c4ff13ea08c515fbf4be59401dad067b0744e7f770a60839dff061',2,1,'authToken','[]',0,'2021-06-19 00:33:47','2021-06-19 00:33:47','2022-06-18 21:33:47'),('0bcd725d60df3fc56e7d8131151ed8dda7cdf82a76f3681d1c2c85674b81ffb75252d511946ad96c',1,1,'authToken','[]',0,'2021-05-22 07:43:07','2021-05-22 07:43:07','2022-05-22 04:43:07'),('0dfc23189fc5a871d8c5803fc5af44a39163603b75246f496aa3400fb224b2e0c1824a564139689b',2,1,'authToken','[]',0,'2021-06-15 08:34:13','2021-06-15 08:34:13','2022-06-15 05:34:13'),('10da0039531ceb01071a2bc8d1daf3178a855b089450afd517d580b88fa7e96ae4db982aa0b11d61',1,1,'authToken','[]',0,'2021-05-22 07:50:14','2021-05-22 07:50:14','2022-05-22 04:50:14'),('120bf7dd282b9f413752442c0e65b30adf5256a45aa9e454078a26f21d3f182923c8fe0eacc5aecf',2,1,'authToken','[]',0,'2021-06-19 23:43:49','2021-06-19 23:43:49','2022-06-19 20:43:49'),('13071cb1a6e5d5d7163629effa96956a58961924c8122457965e87fe4e94d6f284108a82514ebe04',2,1,'authToken','[]',0,'2021-06-06 02:15:39','2021-06-06 02:15:39','2022-06-05 23:15:39'),('13da2d8db65f683443bf2246e16be3a1726a9015ee19b30c97bd47ca5b96bef47bfe56e0a103bd7b',1,1,'authToken','[]',0,'2021-05-23 01:11:14','2021-05-23 01:11:14','2022-05-22 22:11:14'),('143e4809bf41c07b3c917b7b207a2bf04ce3d21e38f2cc0bb09ef91d4824c62ef97c844b6aa4f0b5',2,1,'authToken','[]',0,'2021-06-18 03:18:42','2021-06-18 03:18:42','2022-06-18 00:18:42'),('176dae2fd84429ced54e29b18ce1aff507f5164da8f06f8078b567162de445a58dab8cc80914cf73',2,1,'authToken','[]',0,'2021-06-20 08:46:20','2021-06-20 08:46:20','2022-06-20 05:46:20'),('178fe648c4cd4cc5d04babc69c96c2a5c92c7ce90d8aecfcdddc6f61d831e3d982625934c0a76572',2,1,'authToken','[]',0,'2021-06-15 08:44:42','2021-06-15 08:44:42','2022-06-15 05:44:42'),('17b9b4838cc6229c3bf63a94273cf46baf964dc1cea18d38711cbaadeba95fa5be5bdff3d0af1d77',2,1,'authToken','[]',0,'2021-05-27 00:24:24','2021-05-27 00:24:24','2022-05-26 21:24:24'),('1c7b71b2fe8f0a348d31f743d237de9d9ab98f298550f9e0211d7e3ed423e3aabae9385cba29485c',2,1,'authToken','[]',0,'2021-06-04 23:29:26','2021-06-04 23:29:26','2022-06-04 20:29:26'),('1c96c972bc955fba1f0ab7308f5ad1ff9e3d398d67aecd49f61fee0ffcf916d7ef0b025449b30d3e',2,1,'authToken','[]',0,'2021-05-27 05:05:56','2021-05-27 05:05:56','2022-05-27 02:05:56'),('1ccd0fc6f044fdc257de53df59a7caed81f45401eb9e52c888e3b2745830903edfe5b25e48fd550e',2,1,'authToken','[]',0,'2021-06-18 03:16:13','2021-06-18 03:16:13','2022-06-18 00:16:13'),('1ce65e758a6a45ad866abaf67622e3a4d9b035a870a17f158715967d4151f2711fe4d560f9178742',2,1,'authToken','[]',0,'2021-05-27 05:19:56','2021-05-27 05:19:56','2022-05-27 02:19:56'),('1d1893ee966a62142bffa0ddc1dfcf56233d4da1376c0baab351265ad6238079b5aa3981c9afcdf9',2,1,'authToken','[]',0,'2021-06-20 04:13:33','2021-06-20 04:13:33','2022-06-20 01:13:33'),('1d28e44f98d0ebc31faa7863294fb3d2dd317132379219eb03ee5700a0490d7c099ee810d45fb745',2,1,'authToken','[]',0,'2021-05-26 04:36:58','2021-05-26 04:36:58','2022-05-26 01:36:58'),('1da3e0c329494180c7cb78fa35237e6e1aa5a32f18a482a2bc0d6f1a5e14e90e7f62b3d8554ea68b',2,1,'authToken','[]',0,'2021-06-07 05:11:59','2021-06-07 05:11:59','2022-06-07 02:11:59'),('1e16831ab45d37024d09bf9aa5879a1c61ef1e14bece0b09b3bab627c3ed62be20f572872a0fd3b6',2,1,'authToken','[]',0,'2021-06-06 01:01:18','2021-06-06 01:01:18','2022-06-05 22:01:18'),('217c7040b6cc92b0a968c34bfdd80537f353b409a5099664d0a406b8ce72687a86899a479cfd621f',2,1,'authToken','[]',0,'2021-06-18 00:31:55','2021-06-18 00:31:55','2022-06-17 21:31:55'),('23a5b98275e2d1413a38adb20e22528344c30214fb5ff693128286ed0eead0fabee246c402105b74',1,1,'authToken','[]',0,'2021-05-19 07:51:12','2021-05-19 07:51:12','2022-05-19 04:51:12'),('25e7264fb44a284e5b7eb134dd4554c806c904580a25ce0f5076f67967dbb4faa3e695c35dc48c05',1,1,'authToken','[]',0,'2021-05-23 01:21:27','2021-05-23 01:21:27','2022-05-22 22:21:27'),('267f080287b18da421602e04aa615974e98a5ff9bbf1519f62f7f8378324ce6d7f4dbb89c09318a8',1,1,'authToken','[]',0,'2021-05-23 02:52:38','2021-05-23 02:52:38','2022-05-22 23:52:38'),('27bce10bfe64f92bc741ff0daca3717dfd13df1f54df01c9a02691faa850402fe49be9aa88aa0e8f',2,1,'authToken','[]',0,'2021-06-07 23:42:09','2021-06-07 23:42:09','2022-06-07 20:42:09'),('27e1c1b29f4ed84d0811bed2b0a373e14c6df11d14a30c299bee22f5911ad619714ed5f1b2f86c80',1,1,'authToken','[]',0,'2021-05-23 02:52:09','2021-05-23 02:52:09','2022-05-22 23:52:09'),('29bfca3c11945d19b831b8783df59c9b675447903eaa1105bb3a5982718f772a29ad84ef8292dba7',2,1,'authToken','[]',0,'2021-05-27 08:48:24','2021-05-27 08:48:24','2022-05-27 05:48:24'),('2b0edbed8811ff91e3e30bb94cd73c9d82182e7f7c4d88c1df26160a95342e1877212ad912f02d41',1,1,'authToken','[]',0,'2021-05-23 00:09:30','2021-05-23 00:09:30','2022-05-22 21:09:30'),('2bdd0f2ce81b4306a38f65145412fec51aae7e454bd9ba70e23154a2fb35c0e84561521d7ae60050',2,1,'authToken','[]',0,'2021-06-05 05:09:36','2021-06-05 05:09:36','2022-06-05 02:09:36'),('2c0c77f850c8e76b6a64e066bda965f58da5d63349aa3171da618d077b4e31fa9f9b52ea3627428e',2,1,'authToken','[]',0,'2021-06-18 02:11:40','2021-06-18 02:11:40','2022-06-17 23:11:40'),('2e3e5fd735114adf78e66592c839f631de0e53976efbe89847c6437a4ba031ec6239958edebef1ea',2,1,'authToken','[]',0,'2021-06-18 01:42:07','2021-06-18 01:42:07','2022-06-17 22:42:07'),('2ffb96f8ade9d931bab95c1de1ae5e694b4e6d3d9c44fe1dae793bf2d2f8fd091a66b2db93e15196',2,1,'authToken','[]',0,'2021-05-24 02:21:17','2021-05-24 02:21:17','2022-05-23 23:21:17'),('305cc5484b25eb127f54e8b89abd2d51ca4f8cf15b312d8cab0ee583d95b55d1ab7564791835995c',1,1,'authToken','[]',0,'2021-05-22 07:41:28','2021-05-22 07:41:28','2022-05-22 04:41:28'),('30d9bb77712cb38879c478e036063d0a873642c1a2c4ab4e6035364c8bb267f6393721e48baa6bf6',1,1,'authToken','[]',0,'2021-05-23 01:22:50','2021-05-23 01:22:50','2022-05-22 22:22:50'),('3167e3d7c4b1e2aebbc961c8779b353518748df2784e34414c9194af4cdc09e324fdd3659e9c155d',2,1,'authToken','[]',0,'2021-05-27 05:27:17','2021-05-27 05:27:17','2022-05-27 02:27:17'),('32871f345e80d37b23441d965fc6063ee2b8a20bd60ed6074097d97ce3ad2c1e24d45fc674f1b034',2,1,'authToken','[]',0,'2021-06-20 07:10:28','2021-06-20 07:10:28','2022-06-20 04:10:28'),('330b86797f7b063dd3cabfb138b33bd4126b7ad2ce22b766a69d7e9a55008a43de9ffd82f9b6e212',2,1,'authToken','[]',0,'2021-06-08 02:20:04','2021-06-08 02:20:04','2022-06-07 23:20:04'),('33f5ea6b7e2a86149b409f362715975f3a5114f01d3acef18993885d280430d5b59fc5b743f304f9',2,1,'authToken','[]',0,'2021-06-18 08:33:49','2021-06-18 08:33:49','2022-06-18 05:33:49'),('370bf2803166bfb8534a4da92ea9a273b58ef4122bd0c26760b42f535d335490cf0f815f2a87df65',1,1,'authToken','[]',0,'2021-05-22 08:16:23','2021-05-22 08:16:23','2022-05-22 05:16:23'),('385a5b94a1ee58175c83eda05f97f9342a1973480a672f50e76a162170cfd0c1794297da772de43f',2,1,'authToken','[]',0,'2021-06-17 23:14:33','2021-06-17 23:14:33','2022-06-17 20:14:33'),('38fe0f8bd1e210371129d5b25f07058aa8c171785f3f41dc6b20f1efa5c5c2609a0ebc6b126b9058',1,1,'authToken','[]',0,'2021-05-23 05:23:07','2021-05-23 05:23:07','2022-05-23 02:23:07'),('3908a72b3a649f0b94da59bdc1c8b6d4e9d8c44253151c8cb5935ef5fbd37b83bf58c3e077e6eb87',2,1,'authToken','[]',0,'2021-05-27 06:04:17','2021-05-27 06:04:17','2022-05-27 03:04:17'),('39527edabe91f4a93e894df25cb53981b0e346947ba90fa4cada3aaf2db1beb6f984baf38b618076',2,1,'authToken','[]',0,'2021-06-18 03:26:26','2021-06-18 03:26:26','2022-06-18 00:26:26'),('3c1d657ca7a41a33c8d36a8a7ab8003e9fcc593d9523b8a9bf119a64759a3e7efced3b970cb9c1b3',2,1,'authToken','[]',0,'2021-06-19 06:04:20','2021-06-19 06:04:20','2022-06-19 03:04:20'),('3d3790699370b6c22c303571be9c04cb36953316cd06d6b6d26ba9a8633bfd88faddbc7067625eeb',2,1,'authToken','[]',0,'2021-06-07 22:13:40','2021-06-07 22:13:40','2022-06-07 19:13:40'),('3df67ac4a22fa4033de515d931344675684657dad6da98c55b452c5e7704d6b2ec67af570807790b',2,1,'authToken','[]',0,'2021-05-27 00:03:57','2021-05-27 00:03:57','2022-05-26 21:03:57'),('3e0b96a1557e4388bfff873fdf7c1fbc9f062fbecf8a253cc942d7e625a9aaaf1ffc97b89ea48084',2,1,'authToken','[]',0,'2021-05-27 08:59:26','2021-05-27 08:59:26','2022-05-27 05:59:26'),('3fd549917ab6724ff0712725bef3de4d87004aa69a48f71ba82caa929eca3c768bd02b5a4c1f37ce',2,1,'authToken','[]',0,'2021-06-20 07:50:26','2021-06-20 07:50:26','2022-06-20 04:50:26'),('40d600b59ae31dc0c0c9a008eee3a3dc2d04b1180fb41e3af7c5aeacd7ca62a9fb10cfcc2bd912c3',2,1,'authToken','[]',0,'2021-05-27 09:18:25','2021-05-27 09:18:25','2022-05-27 06:18:25'),('41b019f3ae4e3705c37b2e2fbf21808e09dd654c0ca91aad490c03da5c6275c7ff190347c7b89f09',2,1,'authToken','[]',0,'2021-06-18 03:54:10','2021-06-18 03:54:10','2022-06-18 00:54:10'),('4336007740e080f6ce5487c7dd87f28a86d67e63d9614304084dcfb0145f7ca3f63f32c1c71abc70',2,1,'authToken','[]',0,'2021-06-18 02:25:34','2021-06-18 02:25:34','2022-06-17 23:25:34'),('43725cadb49261415895cf62098789a4222308a61547a8c2df91566d124c342116ab8fdbcb92c8b0',2,1,'authToken','[]',0,'2021-05-24 02:38:03','2021-05-24 02:38:03','2022-05-23 23:38:03'),('4548cf03f511964d129362b55aecb26b345be3491f70f8b4c26d45dace3894ff2994f4562794e480',2,1,'authToken','[]',0,'2021-06-17 08:58:36','2021-06-17 08:58:36','2022-06-17 05:58:36'),('493600322aa78b39223e03fdc032241096c6bb5db64f41c30f0e6eaf965a80c197c1c61d4fc69314',2,1,'authToken','[]',0,'2021-06-05 05:27:27','2021-06-05 05:27:27','2022-06-05 02:27:27'),('495fdf758a3e7a789cd10af0bbec927c89cf02c82aec918ca36ba0a0d7226f9c7ce158c4d0baec52',2,1,'authToken','[]',0,'2021-06-01 09:55:32','2021-06-01 09:55:32','2022-06-01 06:55:32'),('4a97e1a224689400af5f5d57fb282b8b061ed84331708390b6008548678cd3016b632c236d8f6470',2,1,'authToken','[]',0,'2021-05-26 23:42:52','2021-05-26 23:42:52','2022-05-26 20:42:52'),('4d6503416ec3a9d171fa2d5354936d8837ee33d74961adbdcb61b5bd184dcd8be22989fc3ccab57f',2,1,'authToken','[]',0,'2021-06-18 03:54:11','2021-06-18 03:54:11','2022-06-18 00:54:11'),('4f564f4628def85d8121af73592c5abc0f486bc50f3f7092cc28902b8a0560a3691e9724f735b033',2,1,'authToken','[]',0,'2021-06-17 23:15:40','2021-06-17 23:15:40','2022-06-17 20:15:40'),('502c09ce7ff88e44726ea6f7180004a0eb18df1586274c152c68f1f01647e8409bee99dd6252d37a',2,1,'authToken','[]',0,'2021-05-27 05:10:16','2021-05-27 05:10:16','2022-05-27 02:10:16'),('5319dd06f92719d9a94efdf74e6ea8ae0102327d5ccd64a55c15ed91296786e05b743fb0b7c31ff2',1,1,'authToken','[]',0,'2021-05-23 23:37:46','2021-05-23 23:37:46','2022-05-23 20:37:46'),('531f812c7ec0c7e81fda9b106666011471a594a2aa29f587eca3a252edbacf99957f260e3bc5feb6',2,1,'authToken','[]',0,'2021-05-24 03:45:45','2021-05-24 03:45:45','2022-05-24 00:45:45'),('53d54ec960312d010165dfcebc6c4f79a40e536a4106ae1a43da44f0eff064f29d3d20d0aa25b6fb',2,1,'authToken','[]',0,'2021-06-19 08:12:30','2021-06-19 08:12:30','2022-06-19 05:12:30'),('54112d12b5ba0048aa5c20f3ef8505c0cce58f519f03d41639ff98cea497a03a56db3f3b2ee942a2',2,1,'authToken','[]',0,'2021-06-19 23:44:57','2021-06-19 23:44:57','2022-06-19 20:44:57'),('55153bda9a0648cbc758d10099609a0856bcc3c118b0a586bcac23441b2a2c1b46c576bc2f96d2e5',1,1,'authToken','[]',0,'2021-05-23 03:06:39','2021-05-23 03:06:39','2022-05-23 00:06:39'),('56e5c57006b4ca517be26af7c1584240a6de3c8d7e9b906aa68a11a3f55422b9571eed2f3781eefd',2,1,'authToken','[]',0,'2021-06-18 04:07:08','2021-06-18 04:07:08','2022-06-18 01:07:08'),('57341afdee1476c9f779f3250ba437210e624a10ded2822e8109d2b54324a0520189fccfc2c130fc',2,1,'authToken','[]',0,'2021-06-07 05:38:40','2021-06-07 05:38:40','2022-06-07 02:38:40'),('5775f987184c577b5a28669d969099a2b703dc15945e08dae4ce8e72917fe4da3c5e332222855274',2,1,'authToken','[]',0,'2021-05-26 04:39:33','2021-05-26 04:39:33','2022-05-26 01:39:33'),('590d67613c043799dd086b7bb9b6ff54983598cfa1d7ffeb91da0f1e773f7f4701f3bbdc902fefd9',2,1,'authToken','[]',0,'2021-05-27 05:19:57','2021-05-27 05:19:57','2022-05-27 02:19:57'),('59f82ada1aa69f08f58a66ee363fe130db05ff32054550d875bad9b42db6b235e4c77a2ae8ad4090',2,1,'authToken','[]',0,'2021-06-15 09:08:03','2021-06-15 09:08:03','2022-06-15 06:08:03'),('5a42fdb630c07b7bb37ad74def07f1d48149b57046e991600909b47ae353cd53b517116301589494',2,1,'authToken','[]',0,'2021-05-26 05:58:56','2021-05-26 05:58:56','2022-05-26 02:58:56'),('5b00b906331805e33295f141a88ec33b7987fa44d92e26efbccc538395e12af58cdb8bb18ca4391c',2,1,'authToken','[]',0,'2021-06-04 08:52:58','2021-06-04 08:52:58','2022-06-04 05:52:58'),('5c27b1bc789abbdf873ef2aa4178b26f3068a08114e282625e8f9a7cc37658cd2843a006c9478be3',2,1,'authToken','[]',0,'2021-06-05 05:47:19','2021-06-05 05:47:19','2022-06-05 02:47:19'),('5cf43d9eeac3b9779271ae4e34829301a97cce0bbd7d634894230aa9093c08c612808189e0e9d2dc',2,1,'authToken','[]',0,'2021-06-20 06:58:22','2021-06-20 06:58:22','2022-06-20 03:58:22'),('5d1cd8476d3cd56e04ab5fd207e99c929b8f751e2f0e0badcc4a174b46cdcfa5b307079c12dfdac0',2,1,'authToken','[]',0,'2021-05-27 06:17:36','2021-05-27 06:17:36','2022-05-27 03:17:36'),('5ff1d511392be4a5825907795eb901021ed87703fe374e53e9b682aaef28903af0a8b8da601698cd',1,1,'authToken','[]',0,'2021-05-23 05:11:17','2021-05-23 05:11:17','2022-05-23 02:11:17'),('61d06bf2771b89863d742763be3b8c38c0258183a47e56111880a05b2b9cbeb1c31cc5e7e33bb780',2,1,'authToken','[]',0,'2021-06-06 01:00:19','2021-06-06 01:00:19','2022-06-05 22:00:19'),('625e0714625b829ad5b059a1a0d3e58b4a7a22c3f82807385a8be7275f483c691005cf067b99e816',2,1,'authToken','[]',0,'2021-06-05 05:34:01','2021-06-05 05:34:01','2022-06-05 02:34:01'),('6389d1174ae6497cb82e82e5488aa4c8b951897dcf46ab3d82e7f6c3ccc1b7cee7866fd7d9b16645',2,1,'authToken','[]',0,'2021-06-18 01:48:10','2021-06-18 01:48:10','2022-06-17 22:48:10'),('67246e493835244f7d40a8a6615c7a4d8c9f549b9d0bb4721cccf5efcecfc7046bf416c9ac805cb7',1,1,'authToken','[]',0,'2021-05-22 07:53:54','2021-05-22 07:53:54','2022-05-22 04:53:54'),('68cd0d6139a94cb1a9b6a61f16d891ffb57409524e35645fc0585c6c3468badc406780647ac87961',2,1,'authToken','[]',0,'2021-06-06 02:17:09','2021-06-06 02:17:09','2022-06-05 23:17:09'),('694156d05e8460b080847191ab3d64614977ba00783987d5a13ee4dc238fdc326a76ce2a3fb4797e',1,1,'authToken','[]',0,'2021-05-22 07:43:29','2021-05-22 07:43:29','2022-05-22 04:43:29'),('69d7a4ab6997baf3a9752699c75e6c4d7f57cbc95413628e59f0738d2f58b5f173b7d4883c27279a',2,1,'authToken','[]',0,'2021-06-17 02:34:12','2021-06-17 02:34:12','2022-06-16 23:34:12'),('6c98cb07ac150ca046a8faf4c6430976941bf220feb6a4ab2439d58928399ebc600ff26294a538c6',2,1,'authToken','[]',0,'2021-06-18 00:26:28','2021-06-18 00:26:28','2022-06-17 21:26:28'),('6e063fe806de035600cfe336da93b268be810987469a2128993cd7516b5c49bb0146080c4febf264',2,1,'authToken','[]',0,'2021-06-18 02:09:30','2021-06-18 02:09:30','2022-06-17 23:09:30'),('6f31a3a66bd66c8000e8514456f9edc2f167d2eed07b0f2604d23e5741a6ad00aab0d0dae657b824',2,1,'authToken','[]',0,'2021-06-06 02:08:55','2021-06-06 02:08:55','2022-06-05 23:08:55'),('7004a2b672dd1383426314da4d87b191ca840e0a275f80b368c303f420759c7bfd302a1369c7835f',2,1,'authToken','[]',0,'2021-06-20 01:27:01','2021-06-20 01:27:01','2022-06-19 22:27:01'),('700ebcaa57cbbc16a1736cd9cb9d56ca1c8a63e8d604192f9826434a26a6b8a904d5afe581759e2d',2,1,'authToken','[]',0,'2021-06-17 23:14:33','2021-06-17 23:14:33','2022-06-17 20:14:33'),('70b43a2e2484509f09c89a52a113419518548e42010e531d43408e6f41f33823b8fb9a7394e27788',2,1,'authToken','[]',0,'2021-05-27 05:09:36','2021-05-27 05:09:36','2022-05-27 02:09:36'),('7119e167e06263afd2dddcf106c6bbf3f106b290dd0c5c2f694c64db040726ed006ca6be2e902be1',1,1,'authToken','[]',0,'2021-05-23 01:40:36','2021-05-23 01:40:36','2022-05-22 22:40:36'),('72ddbafbc5db8af92c9bc682f75ce9827e4dcb9a80facded28439a3fea5741c06a3ef1a36781721b',2,1,'authToken','[]',0,'2021-05-26 05:50:27','2021-05-26 05:50:27','2022-05-26 02:50:27'),('74dfdfa1e50125fb975d43f79e6a127d28df7d4cf1553e0153b1a7fac0e319add142b285126ccccf',2,1,'authToken','[]',0,'2021-06-07 22:14:56','2021-06-07 22:14:56','2022-06-07 19:14:56'),('75ac119f6c9be690c484dcacb7d75bfad3c6787a50939688f614b29338c3c8e83bf7f26e37fe62d7',1,1,'authToken','[]',0,'2021-05-19 05:09:21','2021-05-19 05:09:21','2022-05-19 02:09:21'),('76742a84337d0e474154f67f4edb1bb01dd5c6fb8ea32ab433fc9b2a8ab21241fa9217135967f67b',2,1,'authToken','[]',0,'2021-06-18 03:30:18','2021-06-18 03:30:18','2022-06-18 00:30:18'),('7682e7c763f3a524342ea66edc89a9125bf00b0f4839fb89a3fc6a0a35a1eb0e95f66fdb44758bea',2,1,'authToken','[]',0,'2021-06-19 05:17:27','2021-06-19 05:17:27','2022-06-19 02:17:27'),('77bd722ca5ea6177eee7fbcbb68008b76eefcf382534e51119a2f35170841b1c6a2e98ab96a0dfb0',1,1,'authToken','[]',0,'2021-05-22 07:42:10','2021-05-22 07:42:10','2022-05-22 04:42:10'),('7821b788fdd9f52af9a82f1d1c7b8439d15e32e6893274e2bed4e41c7b99b78ecd039ba1e1b3e47c',1,1,'authToken','[]',0,'2021-05-22 23:59:51','2021-05-22 23:59:51','2022-05-22 20:59:51'),('79c2c97e46e9e29ab960db617eb08f565150027faf7037fd5b54d2a041e61ee25b8786c28b00415e',1,1,'authToken','[]',0,'2021-05-19 04:33:52','2021-05-19 04:33:52','2022-05-19 01:33:52'),('7b8a1abfd7492cf8d63e7f13da8ba5842b9b1e03a6f1d94556fd06a2c17e4bf7b6e3ebf6077ee509',1,1,'authToken','[]',0,'2021-05-23 01:23:19','2021-05-23 01:23:19','2022-05-22 22:23:19'),('7d3fb4601324545efc4a493ddc630abe056ef7b02aac537748d1679ab5939a92d249d23ca8941cd4',2,1,'authToken','[]',0,'2021-06-19 00:28:59','2021-06-19 00:28:59','2022-06-18 21:28:59'),('827b717d79b12b7b52e31dd4c39d1249edb38fcef374c4f8bf4034151e3b6c13944c5b841751f292',1,1,'authToken','[]',0,'2021-05-23 04:47:06','2021-05-23 04:47:06','2022-05-23 01:47:06'),('84dcacedd1fda4939f36b6bb4f93e7f6013a2700c40d0d59c2471d25c3c5cfcf976a7d1014c43a8a',1,1,'authToken','[]',0,'2021-05-23 03:29:55','2021-05-23 03:29:55','2022-05-23 00:29:55'),('8593e9addd967b0cb15840c61eaa90a884a114c712b69dabf522879d096fe98083de1c5567105968',2,1,'authToken','[]',0,'2021-06-18 00:27:39','2021-06-18 00:27:39','2022-06-17 21:27:39'),('884f9f7e42959b535ca59d702b6f61b8d0552e57ebfc97df5c1abc05eab7ad68da6fb78ee0b9e919',2,1,'authToken','[]',0,'2021-06-20 07:07:55','2021-06-20 07:07:55','2022-06-20 04:07:55'),('8a3368a654a78b60a3960a2dd8afb22e166d09c3fa39e882c12d440d6b52bfeb7f6356a79b0b45e3',2,1,'authToken','[]',0,'2021-06-06 02:10:40','2021-06-06 02:10:40','2022-06-05 23:10:40'),('8ae12c50c0e1b6d9d0ef946ef73df895fa219c0c3b4f473afecde1f3371603c549fd67abf92ae2d3',2,1,'authToken','[]',0,'2021-06-18 01:44:14','2021-06-18 01:44:14','2022-06-17 22:44:14'),('8b3353de84913292c70d87f0457c58bd7892b66fb9e0a9d90cd4122e150d3a1c3c785ac67d58569f',1,1,'authToken','[]',0,'2021-05-22 07:45:15','2021-05-22 07:45:15','2022-05-22 04:45:15'),('8c18dc91fa7721beb7f59bd2a304b1e89adef18816e448afabefab97f5d7fefba05faf0b6fdadc33',2,1,'authToken','[]',0,'2021-06-07 23:37:43','2021-06-07 23:37:43','2022-06-07 20:37:43'),('8c59e32b9ae5e7c4575010d100fe1bce7dbeca5ea3f07da7a1c9cdb7a890639c4a89e269f0c65081',2,1,'authToken','[]',0,'2021-06-19 00:30:40','2021-06-19 00:30:40','2022-06-18 21:30:40'),('8ddd5ffc5e8447f8b4788bacb8ef02c20e1c6aa0809dc630906accecdd34625e0f11840a21b20c1d',2,1,'authToken','[]',0,'2021-05-27 00:47:27','2021-05-27 00:47:27','2022-05-26 21:47:27'),('8e2a0cd35e9a6e111d412a0e2bbfb029ab39ded077dac265c566aa18940410e5d0f1bcb75899a7c5',2,1,'authToken','[]',0,'2021-06-17 23:17:01','2021-06-17 23:17:01','2022-06-17 20:17:01'),('8e59efe17008fc73b846b971b6b3e0992250a1a88a98db2d018fe36bd9eedb737f601e70d7ced0a3',2,1,'authToken','[]',0,'2021-05-27 05:41:11','2021-05-27 05:41:11','2022-05-27 02:41:11'),('9039304137bed77452f2fe3b63ae21b33fad2cd46edd8c9947572c40f099d696f6eb49d68049c13f',2,1,'authToken','[]',0,'2021-05-27 00:29:38','2021-05-27 00:29:38','2022-05-26 21:29:38'),('90adba551131550810d5fba4d1e6cd4573396a50990def4e9694ee0aa68502bcc5ff43445155522e',2,1,'authToken','[]',0,'2021-05-24 02:21:53','2021-05-24 02:21:53','2022-05-23 23:21:53'),('91badbcbfff84752b016785295985bb218d216956afa2bfbe37b9b63acb336ec3a0192a8109e7909',2,1,'authToken','[]',0,'2021-06-20 07:04:42','2021-06-20 07:04:42','2022-06-20 04:04:42'),('937c2779dce2f21e5d8c228c08670f304ad3a28afd00782cb468a1c757163b0604f10ef55f4917e1',2,1,'authToken','[]',0,'2021-06-07 22:51:36','2021-06-07 22:51:36','2022-06-07 19:51:36'),('94a62e1e17faf56ac37985ce626608dd77aa8a58f77d53e6a35d81c61d692cabefb55b6ef94bfae9',2,1,'authToken','[]',0,'2021-06-20 09:50:16','2021-06-20 09:50:16','2022-06-20 06:50:16'),('94a6c93acb4327628a2523253b56f7a1c4216b02c83bf1303a2d91ab98f964f296b7d82efba57cb4',2,1,'authToken','[]',0,'2021-06-19 00:52:55','2021-06-19 00:52:55','2022-06-18 21:52:55'),('95102cb766d57099b1749cbe4c76f5e7f68d84b2541f42931fa2715d203f1f4dfb4b21eeaa6bee81',1,1,'authToken','[]',0,'2021-05-19 10:00:08','2021-05-19 10:00:08','2022-05-19 07:00:08'),('95dc3683d0002365a6632b264f2278523fe36f782d95de665ab0c46fb3c403027dd26ab20860837a',1,1,'authToken','[]',0,'2021-05-19 04:32:05','2021-05-19 04:32:05','2022-05-19 01:32:05'),('961293b2ae1f4c39d65c40bc9c76892baed0f04c6a40d82e964bd44bae42652ee267578a0c017449',1,1,'authToken','[]',0,'2021-05-22 08:19:35','2021-05-22 08:19:35','2022-05-22 05:19:35'),('96a7816b2185ceac20b02883f5a00953ba969656888b767c7226daa11caaf3188deff865394032ea',2,1,'authToken','[]',0,'2021-06-06 02:10:37','2021-06-06 02:10:37','2022-06-05 23:10:37'),('98ae8480aa566aef000dfdb19fca35f805ada5a9b66dbc1b87fb4433f6c1fb6430dc6886d44448a8',2,1,'authToken','[]',0,'2021-05-27 06:19:43','2021-05-27 06:19:43','2022-05-27 03:19:43'),('98cabc6310cdcd1fa202ac180de84870b543de77bb4c8315d653796c627a1ab03bfc91fc25d7971a',2,1,'authToken','[]',0,'2021-06-18 00:31:07','2021-06-18 00:31:07','2022-06-17 21:31:07'),('98e3694e86608aaa8b7990700deb6872ed452f7adf8303619617bf06066042fe358a8bec17951599',2,1,'authToken','[]',0,'2021-06-03 02:11:52','2021-06-03 02:11:52','2022-06-02 23:11:52'),('9a1ed6e6310f8a68577f0915bee202959eb23165b54eaf900c53122160eeea09832d94e17c1844cc',2,1,'authToken','[]',0,'2021-06-18 03:17:11','2021-06-18 03:17:11','2022-06-18 00:17:11'),('9c508f4a255af9bb76894374c1ecb5fff01ab6baaf11bb6a614a5f71211357d2bf23879aca470a18',2,1,'authToken','[]',0,'2021-06-05 05:07:26','2021-06-05 05:07:26','2022-06-05 02:07:26'),('9cc64d20b35d10957e1567ec20b2599f81c9b87bbdde88fa008eca67e60b5dfe08a10edad843f766',2,1,'authToken','[]',0,'2021-06-17 02:05:06','2021-06-17 02:05:06','2022-06-16 23:05:06'),('9fc7c113c86ed4ecce4aae5c91908014d67c72f8324a7224da0796711a6aa4d9f947fabc1043682b',2,1,'authToken','[]',0,'2021-06-15 08:34:12','2021-06-15 08:34:12','2022-06-15 05:34:12'),('a25b0b544204b286cbd33fb3be7d63b9dd83c09a930d0fd56f05edcf8ee3eb78f1fb7ea8ccabb1d0',1,1,'authToken','[]',0,'2021-05-22 07:50:32','2021-05-22 07:50:32','2022-05-22 04:50:32'),('a3bf92abf5f0a5c7488a094ce19220b89d425ed5955a5deac16cae67b803ffbf1dcdc301b759896d',2,1,'authToken','[]',0,'2021-06-20 04:12:23','2021-06-20 04:12:23','2022-06-20 01:12:23'),('a55dbdb6802682be1d3fd276826caca8b41e85fb6a2e7f0d90931f5865a850a433c3e18b2fe095a7',2,1,'authToken','[]',0,'2021-06-07 23:38:20','2021-06-07 23:38:20','2022-06-07 20:38:20'),('a6ddf801a3642b3da0e7472c70b96a07b94a55864044c112fc2f3db3ed5cce040266b653f3a60033',1,1,'authToken','[]',0,'2021-05-23 05:15:24','2021-05-23 05:15:24','2022-05-23 02:15:24'),('a75c2d664fa340a41345c57403a1c65720f37ebeed5d13dc1f930cb8bb4fff23de8984cf453f0ac1',2,1,'authToken','[]',0,'2021-06-06 01:00:20','2021-06-06 01:00:20','2022-06-05 22:00:20'),('a7b0c8dd6f2cbb8829158d6e18e8d15b213c465ee8006a9b50941062165d70d957ba5c3c25fa1bd3',2,1,'authToken','[]',0,'2021-05-27 09:17:42','2021-05-27 09:17:42','2022-05-27 06:17:42'),('a7b585e92773eeac2d6730c39eb96d8dbc3e8e51fe054ccc789917e503a1c3e84b88e2096d2dab87',2,1,'authToken','[]',0,'2021-06-01 01:10:16','2021-06-01 01:10:16','2022-05-31 22:10:16'),('a936f1b6bdce6b920f77572c9463f066b80b83e0eab57018fdea3cbabbaffdbff662b42da5c760e1',2,1,'authToken','[]',0,'2021-06-19 02:14:09','2021-06-19 02:14:09','2022-06-18 23:14:09'),('a9565a9fc2e313a42b62644b8d5b3ff7520dc6baa805d5ab84a98a6010e51c553d6d8efbac19d3f7',2,1,'authToken','[]',0,'2021-06-18 04:06:23','2021-06-18 04:06:23','2022-06-18 01:06:23'),('aa93ad222753e12fa4538137731575c732f4cf521bb2409b3f1261c17d499b6aab10c882d564a953',1,1,'authToken','[]',0,'2021-05-22 09:09:55','2021-05-22 09:09:55','2022-05-22 06:09:55'),('add2638422aeaf56ba0a4826a46edb9bbe214d8ebfcc81fbad34bb0335710a5e4ff681e718cdd0b4',1,1,'MyApp','[]',0,'2021-05-18 21:02:52','2021-05-18 21:02:52','2022-05-18 18:02:52'),('ae32f85b05d945eca3819537389cf677854abe290c952e80f4e03b7d178d6edcebdfbe0c16908311',2,1,'authToken','[]',0,'2021-06-06 01:22:11','2021-06-06 01:22:11','2022-06-05 22:22:11'),('afc8eab16689e41b27257096fd3d1ab83c42d7b2cf8ccf64d4e127aa2b20b3587364bbb8c0f9e70c',2,1,'authToken','[]',0,'2021-06-18 02:23:24','2021-06-18 02:23:24','2022-06-17 23:23:24'),('afd1ac861066ec8e0494ca4cfb02d9129382b7125ffaa317d2236bbcca899666b7a455b725ce4e79',2,1,'authToken','[]',0,'2021-06-17 01:29:49','2021-06-17 01:29:49','2022-06-16 22:29:49'),('b010fe943651a55231357493bca40bc4e5661d790d2f7dad0bf8e2e0a09b628ddb05e983955530b3',1,1,'authToken','[]',0,'2021-05-23 04:27:02','2021-05-23 04:27:02','2022-05-23 01:27:02'),('b24787ea9a8e1fbf0ce1887bf11aad7cfb0d063255633bf38f8aabb5da297e5ce7986c8f340cdc50',2,1,'authToken','[]',0,'2021-05-26 23:47:16','2021-05-26 23:47:16','2022-05-26 20:47:16'),('b2e33650d629ca6d5e89dc689c2653fe0423edefb2b2561bf31a3d90085f5f6c92ffb081d290cb03',2,1,'authToken','[]',0,'2021-06-17 23:21:12','2021-06-17 23:21:12','2022-06-17 20:21:12'),('b32c5ed372ffa7d50764db439067f693885c5ddba539b69693c5b97d3a70ac7258931a7a5e9719e8',2,1,'authToken','[]',0,'2021-05-26 09:44:42','2021-05-26 09:44:42','2022-05-26 06:44:42'),('b384ed300a258ddbb1000e9f1006207f07f6d7b99ad7bdf6e892a8b192aadf0f19d5a1c45b83a198',2,1,'authToken','[]',0,'2021-06-19 03:06:31','2021-06-19 03:06:31','2022-06-19 00:06:31'),('b476418a876a9d9786cdf0cad1ee2a53c3f4e0020587cf7950cee6f23288765d1dbee2f0990ffd66',2,1,'authToken','[]',0,'2021-06-19 00:29:45','2021-06-19 00:29:45','2022-06-18 21:29:45'),('b550263b1ff8b38fb899e0f802a7444ef03095071d8c786dd841de55eac3c186eada8cad3a47ff73',1,1,'authToken','[]',0,'2021-05-22 07:50:27','2021-05-22 07:50:27','2022-05-22 04:50:27'),('b72a2404f3a36939ed1d3285a5e98863fd865936c561451a540d380875f27ced6d547b6fc27664ff',2,1,'authToken','[]',0,'2021-06-04 23:25:08','2021-06-04 23:25:08','2022-06-04 20:25:08'),('b8f5386da7b732530a2d70510894c43f63c3701d8d99478bee1874a92cc7676b82fbcc62fb0a37bb',2,1,'authToken','[]',0,'2021-06-06 02:18:11','2021-06-06 02:18:11','2022-06-05 23:18:11'),('ba42bd603efcb4de3346e9496f9880baf07be72c51922289d837b89bbb5dca45ba2eb7fd5d0ed354',2,1,'authToken','[]',0,'2021-05-27 06:32:16','2021-05-27 06:32:16','2022-05-27 03:32:16'),('ba8ecc95ed974530dcbef3c54a04d1e28b0e30c5729257017dc61b61691bd297bbfba64c72306c63',2,1,'authToken','[]',0,'2021-05-26 04:37:42','2021-05-26 04:37:42','2022-05-26 01:37:42'),('bac49eb42e016d868efeeac6d228945d3f536e59cd633cea4d1a7a1135e7bf8e7680cb45710e562a',2,1,'authToken','[]',0,'2021-06-19 00:36:23','2021-06-19 00:36:23','2022-06-18 21:36:23'),('bb8ea3f01a7e1c3c55e6bfd71663d4df1e960985cb23953191b921282805d4cf404dfd26ec36f961',2,1,'authToken','[]',0,'2021-06-01 10:03:16','2021-06-01 10:03:16','2022-06-01 07:03:16'),('bc1736010be7a7179a0e15011e5b99b3426fbe12426d067c88376aa06854cbc944185473fbd62a76',1,1,'authToken','[]',0,'2021-05-23 01:01:53','2021-05-23 01:01:53','2022-05-22 22:01:53'),('be9fb4dd32302ac16bc3685f7ba538c732196afda8eab0546c4e641a2ac1aff3511aa663c16769bd',1,1,'authToken','[]',0,'2021-05-23 05:12:39','2021-05-23 05:12:39','2022-05-23 02:12:39'),('beb63f3b1818a07cf0a96741a318549d1d58dc276b165644e642d0c649ad0ca9fccd6a215924dfd3',2,1,'authToken','[]',0,'2021-06-18 01:54:26','2021-06-18 01:54:26','2022-06-17 22:54:26'),('c0913d95b8e15a70db61b81635d07038aa6ced2afbad8515366120cc18b91f376beaed772335fda4',2,1,'authToken','[]',0,'2021-06-04 20:09:33','2021-06-04 20:09:33','2022-06-04 17:09:33'),('c0c9494bcdbebd2c79bb7329cf37c761e3d11010ca3fca9bdf133f232da0b8a0a5630a73e1fcb0b6',1,1,'authToken','[]',0,'2021-05-22 07:15:50','2021-05-22 07:15:50','2022-05-22 04:15:50'),('c515e2539ac1f83d1471e41457546812cb12d46b7a36ea2ce2701203a7ed1c7bf2b31a078739aeb0',2,1,'authToken','[]',0,'2021-06-05 04:34:12','2021-06-05 04:34:12','2022-06-05 01:34:12'),('c87e21cb93cee6932a25635d0845e04a3ceca2bd6d4925f2a639e2ee6a34dac666db5e913c5645aa',2,1,'authToken','[]',0,'2021-05-27 06:20:31','2021-05-27 06:20:31','2022-05-27 03:20:31'),('cacb92a40c58dcda9e7b26e22539090d8dc588d736cae0caddcdcb79eb9350681bbed7f272807b6d',2,1,'authToken','[]',0,'2021-06-15 09:08:04','2021-06-15 09:08:04','2022-06-15 06:08:04'),('cb52d5e15c13e7cc8dc551a68d6bb15d9ee3d372d47bc6ac96acc6860e1552db8a375df9406a7c08',1,1,'authToken','[]',0,'2021-05-23 04:30:48','2021-05-23 04:30:48','2022-05-23 01:30:48'),('cb68a43acbf6a57fd1684f004e6d8b83316dd8a8da268699d5a57e9e568f534d6846e17674b068fc',2,1,'authToken','[]',0,'2021-06-04 23:09:52','2021-06-04 23:09:52','2022-06-04 20:09:52'),('cbb44a68c796d0deb30a295e134a8c741e256cf640f8f16f995c1d9ea9791689e04e3e6fe0d3edca',2,1,'authToken','[]',0,'2021-05-26 04:15:38','2021-05-26 04:15:38','2022-05-26 01:15:38'),('cbe950bc7251b1df2ebb2be586caf25b8bc269c0cef5bc2ceb5127e123f1197754ea5a6432035ba9',2,1,'authToken','[]',0,'2021-06-18 02:26:37','2021-06-18 02:26:37','2022-06-17 23:26:37'),('ccc67b7e395eb4ae499e7d7693e622684317dff2e2819855e7f7ade4c81765f750250d6a08c79df9',2,1,'authToken','[]',0,'2021-06-06 01:18:41','2021-06-06 01:18:41','2022-06-05 22:18:41'),('cd4d7d270664d9fade56b6f8033c517a11dcfd6df79e925bc92eb03752bbf73d9d4abff7f40f054f',2,1,'authToken','[]',0,'2021-06-20 05:20:53','2021-06-20 05:20:53','2022-06-20 02:20:53'),('cd6645fbf8e600b2594244c67999bb9a5b738bda74e967e4cf9d5a0251938cdb0812b1baba670df8',2,1,'authToken','[]',0,'2021-06-06 02:13:05','2021-06-06 02:13:05','2022-06-05 23:13:05'),('ce653a1457b06ea938878489300c9a4ff7557234a9cd863bb81f52abd50aa2d8135e1c03161c21a4',2,1,'authToken','[]',0,'2021-06-04 23:29:26','2021-06-04 23:29:26','2022-06-04 20:29:26'),('d240b12c6b50eaaf20545b7af31375c88fd3fe400ed5b0abf84842a009f0778071fa22b044c1b10f',2,1,'authToken','[]',0,'2021-06-18 00:29:52','2021-06-18 00:29:52','2022-06-17 21:29:52'),('d2e1c9c3cb90cf64c0695684c494442c2d8266e0b6623609f82cfa5cf7adb0dec82c218e8b123f24',2,1,'authToken','[]',0,'2021-06-19 23:42:22','2021-06-19 23:42:22','2022-06-19 20:42:22'),('d2e388b5be1b2ea48b6044ca32756945509fcd7f20367516918a9156db2234b7cf5d5d9b57c6e483',2,1,'authToken','[]',0,'2021-06-19 00:42:22','2021-06-19 00:42:22','2022-06-18 21:42:22'),('d406dc00374ea091fd6bf19b0e86f980fb520deb1d180873974809011973c8ee0b906bde05b37775',2,1,'authToken','[]',0,'2021-06-19 00:34:13','2021-06-19 00:34:13','2022-06-18 21:34:13'),('d51b9fb115bb2c37f6df6378cc76d1285b96bb33831093ddfc906e86eb295e7f9f9880986db17d6b',2,1,'authToken','[]',0,'2021-05-27 01:02:05','2021-05-27 01:02:05','2022-05-26 22:02:05'),('d8a6dadc0761dc1b4fbb1af043cac0f32a1595547f38cdba45611af1e4b472f907a4b7978d9b15a2',2,1,'authToken','[]',0,'2021-06-19 08:38:16','2021-06-19 08:38:16','2022-06-19 05:38:16'),('db82858c3b15a7b8e6080de3b30f4e99c99c176db66aedcd21ffd7052de567a9efd05d38b9913921',1,1,'authToken','[]',0,'2021-05-22 07:05:56','2021-05-22 07:05:56','2022-05-22 04:05:56'),('e16a451ea0e4278d3c212255dc1bdeb0a118f5731e5274beee0bd5632b33f1aa9ef71ace30c5112f',2,1,'authToken','[]',0,'2021-06-08 00:26:39','2021-06-08 00:26:39','2022-06-07 21:26:39'),('e2adf56b2571ea782d5af505af7cdd680fafde4945417d800074cfe7c540eb8056115288094d6c41',2,1,'authToken','[]',0,'2021-06-18 01:51:25','2021-06-18 01:51:25','2022-06-17 22:51:25'),('e51528797dc0a79d5461b5565ede79eae4181b5758ad1fc2d5d7c779b2138a35e011c5a1d5308d17',2,1,'authToken','[]',0,'2021-05-27 05:19:30','2021-05-27 05:19:30','2022-05-27 02:19:30'),('e8fe91d060554e0471a80bfa15b773bdc2e423c20949d9f525dd9abb1d79df6236fedd607cd76d0f',2,1,'authToken','[]',0,'2021-06-18 01:52:19','2021-06-18 01:52:19','2022-06-17 22:52:19'),('e933a17f238d9c3072d7e364c05d144263a5f9f39e38ac097db5c894de68ac8323be2a04d056294c',2,1,'authToken','[]',0,'2021-05-27 00:07:25','2021-05-27 00:07:25','2022-05-26 21:07:25'),('e988613d7faed6b254e9f04552097f538a1f37dc5bb2c703a621cd53cc0471aba90384eb65ffee6d',2,1,'authToken','[]',0,'2021-05-26 04:03:10','2021-05-26 04:03:10','2022-05-26 01:03:10'),('ec69962bd18622b8a38a3417f5f412a82a9e8a6c3a6d9c19a5c14efc39a59ec428d0f845e114e763',2,1,'authToken','[]',0,'2021-06-19 05:54:16','2021-06-19 05:54:16','2022-06-19 02:54:16'),('ee64f6dc40a18b44041f4f8a38ec18686efb38d05e9052ebd5b05b6230fb75b91fcbbb1898daafc1',1,1,'authToken','[]',0,'2021-05-23 04:30:21','2021-05-23 04:30:21','2022-05-23 01:30:21'),('ee829de18793bebca851bd5e07036f6e728f6af4deaabb4a2adc6bacae4236d1acba5159a12f90d8',2,1,'authToken','[]',0,'2021-05-26 05:57:57','2021-05-26 05:57:57','2022-05-26 02:57:57'),('eebb5dc82dfb6b74b2100d258fd17b87031da60cef376f03b4b325f422819d344af63479ddb0663a',2,1,'authToken','[]',0,'2021-06-19 00:44:59','2021-06-19 00:44:59','2022-06-18 21:44:59'),('f09ef09c398e5d87905af56ac2c40e1a006998ab3dd7b0e7dbd42639121fcf572ac88208f6bbfb97',1,1,'MyApp','[]',0,'2021-05-18 21:02:50','2021-05-18 21:02:50','2022-05-18 18:02:50'),('f204ebdcca0610e333d9c148f934dd2d1e15b6030fe74dd5205a65fba1a529c28b1b54d42bdbeb23',2,1,'authToken','[]',0,'2021-05-27 00:12:39','2021-05-27 00:12:39','2022-05-26 21:12:39'),('f284b4eb43b6186e5cdb81d3f644395133b8c2743aabde9058a17f41c1ff8f57e57f914e19526d55',2,1,'authToken','[]',0,'2021-06-06 02:19:22','2021-06-06 02:19:22','2022-06-05 23:19:22'),('f2d0c8b004684b3469c93e96ff251cea6833ef913da6c7b55346b3d08b15d1678241846d99744e93',1,1,'MyApp','[]',0,'2021-05-18 20:57:11','2021-05-18 20:57:11','2022-05-18 17:57:11'),('f610d4d6a3855abc05cf177be45e72bd5b9204b3a8410377c50194333bea5a58516513a9d4d4b237',1,1,'MyApp','[]',0,'2021-05-18 21:25:03','2021-05-18 21:25:03','2022-05-18 18:25:03'),('f64f9c7a9634bcf5253f232f80df216dfe65fddd3183d5ef3300b97a2aa1087fafc36e27644aff32',1,1,'authToken','[]',0,'2021-05-23 04:19:59','2021-05-23 04:19:59','2022-05-23 01:19:59'),('f6b06081e76282d9c5d814dd286223b9c6afba00977be7902a3ee010740b17994bcefb50f846bf34',2,1,'authToken','[]',0,'2021-06-07 22:52:12','2021-06-07 22:52:12','2022-06-07 19:52:12'),('f703c7718f853e60ac07589673e7bbf635b2064aa02ab458609834fa11a6fca0c2a0d2336b508ac5',1,1,'authToken','[]',0,'2021-05-22 07:40:31','2021-05-22 07:40:31','2022-05-22 04:40:31'),('f808bd7d66bca62216a9d0159e86ffb9279f4dd60816b2e5ce726713e973253bf3b2f600e730f22f',1,1,'MyApp','[]',0,'2021-05-18 21:10:39','2021-05-18 21:10:39','2022-05-18 18:10:39'),('f85c3ae4b8fdb8e325905f8df6b4bcd73f59a14e804ec124dcd33b9b91e954230eb457cd76c471e8',2,1,'authToken','[]',0,'2021-06-02 08:40:21','2021-06-02 08:40:21','2022-06-02 05:40:21'),('f89a44de9ea03ce0d3e212d7b3d2c2a161e461e66e71ae843820afba11328b5ca96addc706a81b73',2,1,'authToken','[]',0,'2021-06-08 00:48:28','2021-06-08 00:48:28','2022-06-07 21:48:28'),('f8ce422d2e50589533210e8f58be63f8b6d9617cd50baf2339dcd66ca051a2713adbb34881f79e1d',1,1,'MyApp','[]',0,'2021-05-18 20:48:49','2021-05-18 20:48:49','2022-05-18 17:48:49'),('fbae4d62e6f7d7e9eb969326541d4215d3814aa71c18258667e5a93b01a04763ee36e2eeaac84717',2,1,'authToken','[]',0,'2021-06-15 03:23:41','2021-06-15 03:23:41','2022-06-15 00:23:41'),('fdceb67bf4eda1e4521c53a2eebb6e08d9147c6dbcece39b6366d89abadcb30308ded4bcaa692bea',2,1,'authToken','[]',0,'2021-06-17 23:14:33','2021-06-17 23:14:33','2022-06-17 20:14:33'),('fee0990393b30732727acf288d5502cc3abc0ef35ec53194d6422aa2f631e926770dd75288dcbe46',1,1,'authToken','[]',0,'2021-05-22 07:52:09','2021-05-22 07:52:09','2022-05-22 04:52:09'),('ff52419cd6dd89607f31b5bc4400165f7e0d8194e67c1b629acb73db37f61cc1829a87b47cd8c1f5',2,1,'authToken','[]',0,'2021-06-06 02:10:41','2021-06-06 02:10:41','2022-06-05 23:10:41'),('ff87b6e3a4a3e8724ebb92da579b434ddf37fdbfd54fd179ef3f4138bd71dfe03d4765bcd7cd2226',2,1,'authToken','[]',0,'2021-06-20 08:22:39','2021-06-20 08:22:39','2022-06-20 05:22:39');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','linZ03Yp3gOikm177xe0OZEMz6u32UbQMgQMgKW7',NULL,'http://localhost',1,0,0,'2021-05-18 06:30:35','2021-05-18 06:30:35'),(2,NULL,'Laravel Password Grant Client','ELGtxNqWBNJozWXR9KZkmIQnR6JexagrBFwe3XcI','users','http://localhost',0,1,0,'2021-05-18 06:30:36','2021-05-18 06:30:36');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-05-18 06:30:36','2021-05-18 06:30:36');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2021-03-20 00:48:14','2021-03-20 00:48:14');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(1,3),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(26,3),(27,1),(27,3),(28,1),(28,3),(29,1),(29,3),(30,1),(30,3),(31,1),(31,3),(32,1),(32,3),(33,1),(33,3),(34,1),(34,3),(35,1),(35,3),(36,1),(36,3),(37,1),(37,3),(38,1),(38,3),(39,1),(39,3),(40,1),(40,3),(72,1),(72,3),(73,1),(73,3),(74,1),(75,1),(76,1),(76,3),(77,1),(77,3),(78,1),(78,3),(79,1),(79,3),(80,1),(80,3),(81,1),(81,3),(82,1),(82,3),(83,1),(83,3),(84,1),(84,3),(85,1),(85,3),(86,1),(86,3),(87,1),(87,3),(88,1),(88,3),(89,1),(89,3),(90,1),(90,3),(91,1),(91,3),(97,1),(97,3),(98,1),(98,3),(99,1),(99,3),(100,1),(100,3),(101,1),(101,3),(102,1),(102,3),(103,1),(103,3),(104,1),(104,3),(105,1),(105,3),(106,1),(106,3),(107,1),(107,3),(108,1),(108,3),(109,1),(109,3),(110,1),(110,3),(111,1),(111,3),(112,1),(112,3),(113,1),(113,3),(114,1),(114,3),(115,1),(115,3),(116,1),(116,3),(117,1),(117,3),(118,1),(118,3),(119,1),(119,3),(120,1),(120,3),(121,1),(121,3),(122,1),(122,3),(123,1),(123,3),(124,1),(124,3),(125,1),(125,3),(126,1),(126,3),(127,1),(127,3),(128,1),(128,3),(129,1),(129,3),(130,1),(130,3),(131,1),(131,3);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2021-03-20 00:47:58','2021-03-20 00:47:58'),(2,'browse_bread',NULL,'2021-03-20 00:47:58','2021-03-20 00:47:58'),(3,'browse_database',NULL,'2021-03-20 00:47:58','2021-03-20 00:47:58'),(4,'browse_media',NULL,'2021-03-20 00:47:58','2021-03-20 00:47:58'),(5,'browse_compass',NULL,'2021-03-20 00:47:58','2021-03-20 00:47:58'),(6,'browse_menus','menus','2021-03-20 00:47:58','2021-03-20 00:47:58'),(7,'read_menus','menus','2021-03-20 00:47:58','2021-03-20 00:47:58'),(8,'edit_menus','menus','2021-03-20 00:47:59','2021-03-20 00:47:59'),(9,'add_menus','menus','2021-03-20 00:47:59','2021-03-20 00:47:59'),(10,'delete_menus','menus','2021-03-20 00:47:59','2021-03-20 00:47:59'),(11,'browse_roles','roles','2021-03-20 00:47:59','2021-03-20 00:47:59'),(12,'read_roles','roles','2021-03-20 00:47:59','2021-03-20 00:47:59'),(13,'edit_roles','roles','2021-03-20 00:47:59','2021-03-20 00:47:59'),(14,'add_roles','roles','2021-03-20 00:47:59','2021-03-20 00:47:59'),(15,'delete_roles','roles','2021-03-20 00:47:59','2021-03-20 00:47:59'),(16,'browse_users','users','2021-03-20 00:47:59','2021-03-20 00:47:59'),(17,'read_users','users','2021-03-20 00:47:59','2021-03-20 00:47:59'),(18,'edit_users','users','2021-03-20 00:47:59','2021-03-20 00:47:59'),(19,'add_users','users','2021-03-20 00:47:59','2021-03-20 00:47:59'),(20,'delete_users','users','2021-03-20 00:47:59','2021-03-20 00:47:59'),(21,'browse_settings','settings','2021-03-20 00:48:00','2021-03-20 00:48:00'),(22,'read_settings','settings','2021-03-20 00:48:00','2021-03-20 00:48:00'),(23,'edit_settings','settings','2021-03-20 00:48:00','2021-03-20 00:48:00'),(24,'add_settings','settings','2021-03-20 00:48:00','2021-03-20 00:48:00'),(25,'delete_settings','settings','2021-03-20 00:48:00','2021-03-20 00:48:00'),(26,'browse_categories','categories','2021-03-20 00:48:10','2021-03-20 00:48:10'),(27,'read_categories','categories','2021-03-20 00:48:10','2021-03-20 00:48:10'),(28,'edit_categories','categories','2021-03-20 00:48:10','2021-03-20 00:48:10'),(29,'add_categories','categories','2021-03-20 00:48:10','2021-03-20 00:48:10'),(30,'delete_categories','categories','2021-03-20 00:48:10','2021-03-20 00:48:10'),(31,'browse_posts','posts','2021-03-20 00:48:12','2021-03-20 00:48:12'),(32,'read_posts','posts','2021-03-20 00:48:12','2021-03-20 00:48:12'),(33,'edit_posts','posts','2021-03-20 00:48:12','2021-03-20 00:48:12'),(34,'add_posts','posts','2021-03-20 00:48:12','2021-03-20 00:48:12'),(35,'delete_posts','posts','2021-03-20 00:48:13','2021-03-20 00:48:13'),(36,'browse_pages','pages','2021-03-20 00:48:14','2021-03-20 00:48:14'),(37,'read_pages','pages','2021-03-20 00:48:14','2021-03-20 00:48:14'),(38,'edit_pages','pages','2021-03-20 00:48:14','2021-03-20 00:48:14'),(39,'add_pages','pages','2021-03-20 00:48:14','2021-03-20 00:48:14'),(40,'delete_pages','pages','2021-03-20 00:48:14','2021-03-20 00:48:14'),(41,'browse_hooks',NULL,'2021-03-20 00:48:18','2021-03-20 00:48:18'),(72,'browse_comments','comments','2021-04-09 02:48:29','2021-04-09 02:48:29'),(73,'read_comments','comments','2021-04-09 02:48:29','2021-04-09 02:48:29'),(74,'edit_comments','comments','2021-04-09 02:48:29','2021-04-09 02:48:29'),(75,'add_comments','comments','2021-04-09 02:48:29','2021-04-09 02:48:29'),(76,'delete_comments','comments','2021-04-09 02:48:29','2021-04-09 02:48:29'),(77,'browse_dishes','dishes','2021-04-10 02:17:46','2021-04-10 02:17:46'),(78,'read_dishes','dishes','2021-04-10 02:17:46','2021-04-10 02:17:46'),(79,'edit_dishes','dishes','2021-04-10 02:17:46','2021-04-10 02:17:46'),(80,'add_dishes','dishes','2021-04-10 02:17:46','2021-04-10 02:17:46'),(81,'delete_dishes','dishes','2021-04-10 02:17:46','2021-04-10 02:17:46'),(82,'browse_locations','locations','2021-04-10 02:36:14','2021-04-10 02:36:14'),(83,'read_locations','locations','2021-04-10 02:36:14','2021-04-10 02:36:14'),(84,'edit_locations','locations','2021-04-10 02:36:14','2021-04-10 02:36:14'),(85,'add_locations','locations','2021-04-10 02:36:14','2021-04-10 02:36:14'),(86,'delete_locations','locations','2021-04-10 02:36:14','2021-04-10 02:36:14'),(87,'browse_establishments','establishments','2021-04-10 05:23:29','2021-04-10 05:23:29'),(88,'read_establishments','establishments','2021-04-10 05:23:29','2021-04-10 05:23:29'),(89,'edit_establishments','establishments','2021-04-10 05:23:29','2021-04-10 05:23:29'),(90,'add_establishments','establishments','2021-04-10 05:23:29','2021-04-10 05:23:29'),(91,'delete_establishments','establishments','2021-04-10 05:23:29','2021-04-10 05:23:29'),(97,'browse_products','products','2021-04-21 05:53:21','2021-04-21 05:53:21'),(98,'read_products','products','2021-04-21 05:53:21','2021-04-21 05:53:21'),(99,'edit_products','products','2021-04-21 05:53:21','2021-04-21 05:53:21'),(100,'add_products','products','2021-04-21 05:53:21','2021-04-21 05:53:21'),(101,'delete_products','products','2021-04-21 05:53:21','2021-04-21 05:53:21'),(102,'browse_companies','companies','2021-04-21 06:40:44','2021-04-21 06:40:44'),(103,'read_companies','companies','2021-04-21 06:40:44','2021-04-21 06:40:44'),(104,'edit_companies','companies','2021-04-21 06:40:44','2021-04-21 06:40:44'),(105,'add_companies','companies','2021-04-21 06:40:44','2021-04-21 06:40:44'),(106,'delete_companies','companies','2021-04-21 06:40:44','2021-04-21 06:40:44'),(107,'browse_company_groups','company_groups','2021-04-21 07:12:33','2021-04-21 07:12:33'),(108,'read_company_groups','company_groups','2021-04-21 07:12:33','2021-04-21 07:12:33'),(109,'edit_company_groups','company_groups','2021-04-21 07:12:33','2021-04-21 07:12:33'),(110,'add_company_groups','company_groups','2021-04-21 07:12:33','2021-04-21 07:12:33'),(111,'delete_company_groups','company_groups','2021-04-21 07:12:33','2021-04-21 07:12:33'),(112,'browse_company_reports','company_reports','2021-04-23 02:10:46','2021-04-23 02:10:46'),(113,'read_company_reports','company_reports','2021-04-23 02:10:46','2021-04-23 02:10:46'),(114,'edit_company_reports','company_reports','2021-04-23 02:10:46','2021-04-23 02:10:46'),(115,'add_company_reports','company_reports','2021-04-23 02:10:46','2021-04-23 02:10:46'),(116,'delete_company_reports','company_reports','2021-04-23 02:10:46','2021-04-23 02:10:46'),(117,'browse_company_group_reports','company_group_reports','2021-04-23 02:17:17','2021-04-23 02:17:17'),(118,'read_company_group_reports','company_group_reports','2021-04-23 02:17:17','2021-04-23 02:17:17'),(119,'edit_company_group_reports','company_group_reports','2021-04-23 02:17:17','2021-04-23 02:17:17'),(120,'add_company_group_reports','company_group_reports','2021-04-23 02:17:17','2021-04-23 02:17:17'),(121,'delete_company_group_reports','company_group_reports','2021-04-23 02:17:17','2021-04-23 02:17:17'),(122,'browse_product_reports','product_reports','2021-04-23 02:33:52','2021-04-23 02:33:52'),(123,'read_product_reports','product_reports','2021-04-23 02:33:52','2021-04-23 02:33:52'),(124,'edit_product_reports','product_reports','2021-04-23 02:33:52','2021-04-23 02:33:52'),(125,'add_product_reports','product_reports','2021-04-23 02:33:52','2021-04-23 02:33:52'),(126,'delete_product_reports','product_reports','2021-04-23 02:33:52','2021-04-23 02:33:52'),(127,'browse_establishment_reports','establishment_reports','2021-04-23 02:41:12','2021-04-23 02:41:12'),(128,'read_establishment_reports','establishment_reports','2021-04-23 02:41:12','2021-04-23 02:41:12'),(129,'edit_establishment_reports','establishment_reports','2021-04-23 02:41:12','2021-04-23 02:41:12'),(130,'add_establishment_reports','establishment_reports','2021-04-23 02:41:12','2021-04-23 02:41:12'),(131,'delete_establishment_reports','establishment_reports','2021-04-23 02:41:12','2021-04-23 02:41:12');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2021-03-20 00:48:13','2021-03-20 00:48:13'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2021-03-20 00:48:13','2021-03-20 00:48:13'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2021-03-20 00:48:13','2021-03-20 00:48:13');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reports`
--

DROP TABLE IF EXISTS `product_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reports`
--

LOCK TABLES `product_reports` WRITE;
/*!40000 ALTER TABLE `product_reports` DISABLE KEYS */;
INSERT INTO `product_reports` VALUES (5,'Dados sobre testes em animais incorretos',0,2,1,'2021-06-15 03:35:27','2021-06-15 03:35:27'),(7,'Observação com dados incorretos',0,2,1,'2021-06-15 03:39:07','2021-06-15 03:39:07');
/*!40000 ALTER TABLE `product_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `animal_ing` tinyint DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Oreo',0,'Oreo é uma marca de biscoito recheado da Nabisco, uma divisão do grupo empresarial estadunidense Mondelēz International. Consiste em dois biscoitos redondos de chocolate e um recheio doce sabor baunilha.','7622300830151','32',2,1,'2021-04-21 07:32:00','2021-06-20 07:58:33','products/June2021/FDgj7hHbaQNDr16tHIaF.png'),(2,'Nissin Lamen Galinha Caipira',1,'O produto pode conter peixes, crustáceos (Camarão e caranguejo, ovos e leite de vaca.','7891079000229','32',2,2,'2021-06-20 02:10:00','2021-06-20 07:58:26','products/June2021/feb4zJBaPcyOaKUvA3ro.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2021-03-20 00:47:57','2021-03-20 00:47:57'),(2,'user','Normal User','2021-03-20 00:47:58','2021-03-20 00:47:58'),(3,'Contributor','Contributor','2021-04-07 02:23:09','2021-04-07 02:23:09');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Vegin','','text',1,'Site'),(2,'site.description','Site Description','Vegin the easy way to be vegan','','text',2,'Site'),(3,'site.logo','Site Logo','settings\\April2021\\dqODUq96hBPhBRWzsJ4e.png','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings\\April2021\\4hDmNXy1aRJpgMnQypOw.jpg','','image',5,'Admin'),(6,'admin.title','Admin Title','Vegin Admin','','text',1,'Admin'),(7,'admin.description','Admin Description','Creating a better world for us','','text',2,'Admin'),(8,'admin.loader','Admin Loader','settings\\April2021\\m4tfbZjbJOACEs5gZsth.png','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','settings\\April2021\\aqdfYsK8pc8GhTrhIoCf.png','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2021-03-20 00:48:15','2021-03-20 00:48:15'),(2,'data_types','display_name_singular',6,'pt','Página','2021-03-20 00:48:15','2021-03-20 00:48:15'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2021-03-20 00:48:15','2021-03-20 00:48:15'),(4,'data_types','display_name_singular',4,'pt','Categoria','2021-03-20 00:48:15','2021-03-20 00:48:15'),(5,'data_types','display_name_singular',2,'pt','Menu','2021-03-20 00:48:15','2021-03-20 00:48:15'),(6,'data_types','display_name_singular',3,'pt','Função','2021-03-20 00:48:15','2021-03-20 00:48:15'),(7,'data_types','display_name_plural',5,'pt','Posts','2021-03-20 00:48:15','2021-03-20 00:48:15'),(8,'data_types','display_name_plural',6,'pt','Páginas','2021-03-20 00:48:15','2021-03-20 00:48:15'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2021-03-20 00:48:15','2021-03-20 00:48:15'),(10,'data_types','display_name_plural',4,'pt','Categorias','2021-03-20 00:48:15','2021-03-20 00:48:15'),(11,'data_types','display_name_plural',2,'pt','Menus','2021-03-20 00:48:15','2021-03-20 00:48:15'),(12,'data_types','display_name_plural',3,'pt','Funções','2021-03-20 00:48:15','2021-03-20 00:48:15'),(13,'categories','slug',1,'pt','categoria-1','2021-03-20 00:48:16','2021-03-20 00:48:16'),(14,'categories','name',1,'pt','Categoria 1','2021-03-20 00:48:16','2021-03-20 00:48:16'),(15,'categories','slug',2,'pt','categoria-2','2021-03-20 00:48:16','2021-03-20 00:48:16'),(16,'categories','name',2,'pt','Categoria 2','2021-03-20 00:48:16','2021-03-20 00:48:16'),(17,'pages','title',1,'pt','Olá Mundo','2021-03-20 00:48:16','2021-03-20 00:48:16'),(18,'pages','slug',1,'pt','ola-mundo','2021-03-20 00:48:16','2021-03-20 00:48:16'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2021-03-20 00:48:16','2021-03-20 00:48:16'),(20,'menu_items','title',1,'pt','Painel de Controle','2021-03-20 00:48:16','2021-03-20 00:48:16'),(21,'menu_items','title',2,'pt','Media','2021-03-20 00:48:16','2021-03-20 00:48:16'),(22,'menu_items','title',12,'pt','Publicações','2021-03-20 00:48:16','2021-03-20 00:48:16'),(23,'menu_items','title',3,'pt','Utilizadores','2021-03-20 00:48:16','2021-03-20 00:48:16'),(24,'menu_items','title',11,'pt','Categorias','2021-03-20 00:48:17','2021-03-20 00:48:17'),(25,'menu_items','title',13,'pt','Páginas','2021-03-20 00:48:17','2021-03-20 00:48:17'),(26,'menu_items','title',4,'pt','Funções','2021-03-20 00:48:17','2021-03-20 00:48:17'),(27,'menu_items','title',5,'pt','Ferramentas','2021-03-20 00:48:17','2021-03-20 00:48:17'),(28,'menu_items','title',6,'pt','Menus','2021-03-20 00:48:17','2021-03-20 00:48:17'),(29,'menu_items','title',7,'pt','Base de dados','2021-03-20 00:48:17','2021-03-20 00:48:17'),(30,'menu_items','title',10,'pt','Configurações','2021-03-20 00:48:17','2021-03-20 00:48:17');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_long` decimal(10,0) DEFAULT NULL,
  `last_lat` decimal(10,0) DEFAULT NULL,
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users\\April2021\\59YzjmV2CB7UGEPRWfTL.jpg',NULL,'$2y$10$jmVE92/8b6JPZbtnUoha0uDc7/BnffThvdWS8OiPwZnenlBHETYd2','QdBJstJw6vpYyBkI5wVxS4L5tUTreMvFvArnepArPKOGwyVAUPNvBeCZGGO7','{\"locale\":\"en\"}','2021-03-20 00:48:10','2021-04-10 06:25:04',NULL,NULL,NULL,NULL),(2,3,'Leonardo Veloso','leo-veloso@gmail.com','users\\April2021\\GZBWhtkIPUzM68dMa05b.jpg',NULL,'$2y$10$ubIiPmgAd6xl3c1kZNMcge4XY7oEZ8jZ1G.I437ff39QwCQj12j9u',NULL,'{\"locale\":\"pt_br\"}','2021-04-07 02:24:18','2021-05-11 08:21:20','Rio de Janeiro',NULL,NULL,NULL),(3,3,'Rodrigo Azevedo','Rodrigo-Azevedo@gmail.com','users/May2021/g34vMvHpCKdKnq6qGsZ7.jpeg',NULL,'$2y$10$rbhagc8/udduP9uL70eYGOt8BW8xMiHsx7vf5GAVcN.wFaMv1VdL.',NULL,'{\"locale\":\"en\"}','2021-05-11 10:04:21','2021-05-11 10:04:21',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-21 22:26:52
