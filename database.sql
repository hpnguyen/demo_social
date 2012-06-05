-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: Social_test
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_verb_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `user_author_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activities_on_activity_verb_id` (`activity_verb_id`),
  CONSTRAINT `index_activities_on_activity_verb_id` FOREIGN KEY (`activity_verb_id`) REFERENCES `activity_verbs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,1,'2012-06-04 09:30:26','2012-06-04 09:30:26',NULL,1,1,1),(4,1,'2012-06-04 09:31:58','2012-06-04 09:31:58','1',1,1,1),(5,1,'2012-06-04 09:32:14','2012-06-04 09:32:14','1',1,1,1);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_actions`
--

DROP TABLE IF EXISTS `activity_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) DEFAULT NULL,
  `activity_object_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `follow` tinyint(1) DEFAULT '0',
  `author` tinyint(1) DEFAULT '0',
  `user_author` tinyint(1) DEFAULT '0',
  `owner` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_activity_actions_on_actor_id` (`actor_id`),
  KEY `index_activity_actions_on_activity_object_id` (`activity_object_id`),
  CONSTRAINT `index_activity_actions_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`),
  CONSTRAINT `index_activity_actions_on_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_actions`
--

LOCK TABLES `activity_actions` WRITE;
/*!40000 ALTER TABLE `activity_actions` DISABLE KEYS */;
INSERT INTO `activity_actions` VALUES (1,1,2,'2012-06-04 09:30:26','2012-06-04 09:30:26',1,1,1,1),(2,1,3,'2012-06-04 09:31:58','2012-06-04 09:31:58',1,1,1,1),(3,1,4,'2012-06-04 09:32:14','2012-06-04 09:32:14',1,1,1,1);
/*!40000 ALTER TABLE `activity_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object_activities`
--

DROP TABLE IF EXISTS `activity_object_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_object_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `activity_object_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activity_object_activities_on_activity_id` (`activity_id`),
  KEY `index_activity_object_activities_on_activity_object_id` (`activity_object_id`),
  CONSTRAINT `activity_object_activities_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`),
  CONSTRAINT `index_activity_object_activities_on_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object_activities`
--

LOCK TABLES `activity_object_activities` WRITE;
/*!40000 ALTER TABLE `activity_object_activities` DISABLE KEYS */;
INSERT INTO `activity_object_activities` VALUES (1,1,2,'2012-06-04 09:30:26','2012-06-04 09:30:26','object'),(4,4,3,'2012-06-04 09:31:58','2012-06-04 09:31:58','object'),(5,5,4,'2012-06-04 09:32:14','2012-06-04 09:32:14','object');
/*!40000 ALTER TABLE `activity_object_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object_audiences`
--

DROP TABLE IF EXISTS `activity_object_audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_object_audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_object_audiences_on_activity_object_id` (`activity_object_id`),
  KEY `activity_object_audiences_on_relation_id` (`relation_id`),
  CONSTRAINT `activity_object_audiences_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`),
  CONSTRAINT `activity_object_audiences_on_relation_id` FOREIGN KEY (`relation_id`) REFERENCES `relations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object_audiences`
--

LOCK TABLES `activity_object_audiences` WRITE;
/*!40000 ALTER TABLE `activity_object_audiences` DISABLE KEYS */;
INSERT INTO `activity_object_audiences` VALUES (1,2,3,'2012-06-04 09:30:26','2012-06-04 09:30:26'),(2,2,4,'2012-06-04 09:30:26','2012-06-04 09:30:26'),(3,2,5,'2012-06-04 09:30:26','2012-06-04 09:30:26'),(4,3,3,'2012-06-04 09:31:58','2012-06-04 09:31:58'),(5,3,4,'2012-06-04 09:31:58','2012-06-04 09:31:58'),(6,3,5,'2012-06-04 09:31:58','2012-06-04 09:31:58'),(7,4,3,'2012-06-04 09:32:14','2012-06-04 09:32:14'),(8,4,4,'2012-06-04 09:32:14','2012-06-04 09:32:14'),(9,4,5,'2012-06-04 09:32:14','2012-06-04 09:32:14');
/*!40000 ALTER TABLE `activity_object_audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object_properties`
--

DROP TABLE IF EXISTS `activity_object_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_object_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activity_object_properties_on_activity_object_id` (`activity_object_id`),
  KEY `index_activity_object_properties_on_property_id` (`property_id`),
  CONSTRAINT `index_activity_object_properties_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`),
  CONSTRAINT `index_activity_object_properties_on_property_id` FOREIGN KEY (`property_id`) REFERENCES `activity_objects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object_properties`
--

LOCK TABLES `activity_object_properties` WRITE;
/*!40000 ALTER TABLE `activity_object_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_object_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_objects`
--

DROP TABLE IF EXISTS `activity_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  `like_count` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `description` text,
  `follower_count` int(11) DEFAULT '0',
  `visit_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_objects`
--

LOCK TABLES `activity_objects` WRITE;
/*!40000 ALTER TABLE `activity_objects` DISABLE KEYS */;
INSERT INTO `activity_objects` VALUES (1,'2012-06-01 03:32:11','2012-06-01 03:32:11','Actor',0,'',NULL,0,0),(2,'2012-06-04 09:30:26','2012-06-04 09:31:44','Document',2,'titile',NULL,0,1),(3,'2012-06-04 09:31:58','2012-06-04 09:31:58','Comment',0,'','khung\r\n',0,0),(4,'2012-06-04 09:32:14','2012-06-04 09:32:14','Comment',0,'','kakakaka',0,0);
/*!40000 ALTER TABLE `activity_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_verbs`
--

DROP TABLE IF EXISTS `activity_verbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_verbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_verbs`
--

LOCK TABLES `activity_verbs` WRITE;
/*!40000 ALTER TABLE `activity_verbs` DISABLE KEYS */;
INSERT INTO `activity_verbs` VALUES (1,'post','2012-06-04 09:30:26','2012-06-04 09:30:26'),(2,'like','2012-06-04 09:30:47','2012-06-04 09:30:47');
/*!40000 ALTER TABLE `activity_verbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `notify_by_email` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `activity_object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_actors_on_slug` (`slug`),
  KEY `index_actors_on_activity_object_id` (`activity_object_id`),
  KEY `index_actors_on_email` (`email`),
  CONSTRAINT `actors_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'san nguyen','nnsan@tma.com.vn','san-nguyen','User',1,'2012-06-01 03:32:11','2012-06-01 03:32:11',1);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences`
--

DROP TABLE IF EXISTS `audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_audiences_on_activity_id` (`activity_id`),
  KEY `index_audiences_on_relation_id` (`relation_id`),
  CONSTRAINT `audiences_on_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `audiences_on_relation_id` FOREIGN KEY (`relation_id`) REFERENCES `relations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences`
--

LOCK TABLES `audiences` WRITE;
/*!40000 ALTER TABLE `audiences` DISABLE KEYS */;
INSERT INTO `audiences` VALUES (1,3,1),(2,4,1),(3,5,1),(10,3,4),(11,4,4),(12,5,4),(13,3,5),(14,4,5),(15,5,5);
/*!40000 ALTER TABLE `audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentications`
--

DROP TABLE IF EXISTS `authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_authentications_on_user_id` (`user_id`),
  CONSTRAINT `authentications_on_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentications`
--

LOCK TABLES `authentications` WRITE;
/*!40000 ALTER TABLE `authentications` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatars`
--

DROP TABLE IF EXISTS `avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_avatars_on_actor_id` (`actor_id`),
  CONSTRAINT `avatars_on_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatars`
--

LOCK TABLES `avatars` WRITE;
/*!40000 ALTER TABLE `avatars` DISABLE KEYS */;
/*!40000 ALTER TABLE `avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_activity_object_id` (`activity_object_id`),
  CONSTRAINT `comments_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,3,'2012-06-04 09:31:58','2012-06-04 09:31:58'),(2,4,'2012-06-04 09:32:14','2012-06-04 09:32:14');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `inverse_id` int(11) DEFAULT NULL,
  `ties_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_contacts_on_inverse_id` (`inverse_id`),
  KEY `index_contacts_on_receiver_id` (`receiver_id`),
  KEY `index_contacts_on_sender_id` (`sender_id`),
  CONSTRAINT `contacts_on_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `actors` (`id`),
  CONSTRAINT `contacts_on_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `activity_object_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `file_file_name` varchar(255) DEFAULT NULL,
  `file_content_type` varchar(255) DEFAULT NULL,
  `file_file_size` varchar(255) DEFAULT NULL,
  `file_processing` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_documents_on_activity_object_id` (`activity_object_id`),
  CONSTRAINT `documents_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'Picture',2,'2012-06-04 09:30:26','2012-06-04 09:30:26','post-94904-1262089374.jpg','image/jpeg','3948',0);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_id` int(11) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `all_day` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `frequency` int(11) DEFAULT '0',
  `interval` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT '0',
  `interval_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_events_on_room_id` (`room_id`),
  KEY `events_on_activity_object_id` (`activity_object_id`),
  CONSTRAINT `events_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`),
  CONSTRAINT `index_events_on_room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groups_on_actor_id` (`actor_id`),
  CONSTRAINT `groups_on_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `callback_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT '470',
  `height` int(11) DEFAULT '353',
  PRIMARY KEY (`id`),
  KEY `index_links_on_activity_object_id` (`activity_object_id`),
  CONSTRAINT `links_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `body` text,
  `subject` varchar(255) DEFAULT '',
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` varchar(255) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `draft` tinyint(1) DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `notified_object_id` int(11) DEFAULT NULL,
  `notified_object_type` varchar(255) DEFAULT NULL,
  `notification_code` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_conversation_id` (`conversation_id`),
  CONSTRAINT `notifications_on_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'read','activity','2012-06-01 03:01:17','2012-06-01 03:01:17'),(2,'follow',NULL,'2012-06-01 03:32:11','2012-06-01 03:32:11'),(3,'create','activity','2012-06-01 03:32:11','2012-06-01 03:32:11');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_posts_on_activity_object_id` (`activity_object_id`),
  CONSTRAINT `posts_on_activity_object_id` FOREIGN KEY (`activity_object_id`) REFERENCES `activity_objects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `prefix_key` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `skype` varchar(45) DEFAULT NULL,
  `im` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profiles_on_actor_id` (`actor_id`),
  CONSTRAINT `profiles_on_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,NULL,'2012-06-01 03:32:11','2012-06-01 03:32:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_type` varchar(255) DEFAULT NULL,
  `notification_id` int(11) NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  `trashed` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(25) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_receipts_on_notification_id` (`notification_id`),
  CONSTRAINT `receipts_on_notification_id` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_permissions`
--

DROP TABLE IF EXISTS `relation_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_relation_permissions_on_permission_id` (`permission_id`),
  KEY `index_relation_permissions_on_relation_id` (`relation_id`),
  CONSTRAINT `relation_permissions_on_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `relation_permissions_on_relation_id` FOREIGN KEY (`relation_id`) REFERENCES `relations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_permissions`
--

LOCK TABLES `relation_permissions` WRITE;
/*!40000 ALTER TABLE `relation_permissions` DISABLE KEYS */;
INSERT INTO `relation_permissions` VALUES (1,1,1,'2012-06-01 03:01:18','2012-06-01 03:01:18'),(2,3,2,'2012-06-01 03:32:11','2012-06-01 03:32:11'),(3,3,3,'2012-06-01 03:32:11','2012-06-01 03:32:11'),(4,3,1,'2012-06-01 03:32:11','2012-06-01 03:32:11'),(5,4,1,'2012-06-01 03:32:11','2012-06-01 03:32:11'),(6,5,2,'2012-06-01 03:32:11','2012-06-01 03:32:11'),(7,5,3,'2012-06-01 03:32:11','2012-06-01 03:32:11'),(8,5,1,'2012-06-01 03:32:11','2012-06-01 03:32:11');
/*!40000 ALTER TABLE `relation_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sender_type` varchar(255) DEFAULT NULL,
  `receiver_type` varchar(255) DEFAULT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_relations_on_actor_id` (`actor_id`),
  KEY `index_relations_on_ancestry` (`ancestry`),
  CONSTRAINT `relations_on_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,NULL,'Relation::Public',NULL,'2012-06-01 03:01:17','2012-06-01 03:01:17',NULL,NULL,NULL),(2,NULL,'Relation::Reject',NULL,'2012-06-01 03:01:18','2012-06-01 03:01:18',NULL,NULL,NULL),(3,1,'Relation::Custom','friend','2012-06-01 03:32:11','2012-06-01 03:32:11','User',NULL,NULL),(4,1,'Relation::Custom','acquaintance','2012-06-01 03:32:11','2012-06-01 03:32:11','User',NULL,NULL),(5,1,'Relation::Custom','colleague','2012-06-01 03:32:11','2012-06-01 03:32:11','User',NULL,NULL);
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rooms_on_actor_id` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120531103930'),('20120531103931'),('20120531103932'),('20120531103933'),('20120531103934'),('20120531103935'),('20120531103936'),('20120531103937'),('20120531103938'),('20120531103939'),('20120531103940'),('20120531103941'),('20120531103942'),('20120531103943'),('20120531103944'),('20120531103945'),('20120531103946'),('20120531103947'),('20120531103948'),('20120531103949'),('20120531103950'),('20120531103951'),('20120531103952'),('20120531103953'),('20120531103954'),('20120531103955'),('20120531103956'),('20120531103957'),('20120531103958');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ties`
--

DROP TABLE IF EXISTS `ties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ties_on_contact_id` (`contact_id`),
  KEY `index_ties_on_relation_id` (`relation_id`),
  CONSTRAINT `ties_on_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `ties_on_relation_id` FOREIGN KEY (`relation_id`) REFERENCES `relations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ties`
--

LOCK TABLES `ties` WRITE;
/*!40000 ALTER TABLE `ties` DISABLE KEYS */;
/*!40000 ALTER TABLE `ties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encrypted_password` varchar(128) NOT NULL DEFAULT '',
  `password_salt` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `authentication_token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `connected` tinyint(1) DEFAULT '0',
  `status` varchar(255) DEFAULT 'available',
  `chat_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_actor_id` (`actor_id`),
  CONSTRAINT `users_on_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'$2a$10$KC4tYuVHcG/G4G0ksMIXCeipkGeFSR1sk4F/43NeljWeTyf/2oj7C',NULL,NULL,NULL,NULL,2,'2012-06-01 05:19:40','2012-06-01 03:32:11','127.0.0.1','127.0.0.1',NULL,'2012-06-01 03:32:11','2012-06-01 05:19:40',1,NULL,0,'available',1);
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

-- Dump completed on 2012-06-04 16:39:09
