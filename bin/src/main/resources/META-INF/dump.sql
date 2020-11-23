-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: language_school
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `LS_comments`
--

DROP TABLE IF EXISTS `LS_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_comments` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `text` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `thread_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKqrkifmjmpl7g432978bfnsiqe` (`thread_id`),
  KEY `FKni5ofwy8ocj6deqc1gx93kvy3` (`user_id`),
  CONSTRAINT `FKni5ofwy8ocj6deqc1gx93kvy3` FOREIGN KEY (`user_id`) REFERENCES `LS_users` (`id`),
  CONSTRAINT `FKqrkifmjmpl7g432978bfnsiqe` FOREIGN KEY (`thread_id`) REFERENCES `LS_threads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_comments`
--

LOCK TABLES `LS_comments` WRITE;
/*!40000 ALTER TABLE `LS_comments` DISABLE KEYS */;
INSERT INTO `LS_comments` VALUES (2,'2019-02-01','But I\'m a student and I can leave comment here',2,3),(3,'2019-02-01','But I\'m a teacher and I can leave a message here. ',1,2),(4,'2019-02-01','I\'m a student and i also can leave a comment',1,3),(5,'2019-02-01','OK :)',3,3);
/*!40000 ALTER TABLE `LS_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_groups`
--

DROP TABLE IF EXISTS `LS_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_groups`
--

LOCK TABLES `LS_groups` WRITE;
/*!40000 ALTER TABLE `LS_groups` DISABLE KEYS */;
INSERT INTO `LS_groups` VALUES (1,'Bucket'),(2,'Group 1');
/*!40000 ALTER TABLE `LS_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_links`
--

DROP TABLE IF EXISTS `LS_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8yf75mr3tuj7p6l2ewqfed7oo` (`group_id`),
  CONSTRAINT `FK8yf75mr3tuj7p6l2ewqfed7oo` FOREIGN KEY (`group_id`) REFERENCES `LS_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_links`
--

LOCK TABLES `LS_links` WRITE;
/*!40000 ALTER TABLE `LS_links` DISABLE KEYS */;
INSERT INTO `LS_links` VALUES (1,'BY or WITH','https://www.youtube.com/embed/J0FDlPkWGDs',1),(2,'Conversations','https://www.youtube.com/embed/QTJ02h7uiXs',1),(3,'WHAT or WHICH','https://www.youtube.com/embed/zAKnC2kr1_I',1),(4,'Pronunciation Training Techniques','https://www.youtube.com/embed/VcONw2BBfb8',2),(5,'50 Words You\'re Pronouncing WRONGLY','https://www.youtube.com/embed/TdtUjWb0O9w',2);
/*!40000 ALTER TABLE `LS_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_privileges`
--

DROP TABLE IF EXISTS `LS_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_privileges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_privileges`
--

LOCK TABLES `LS_privileges` WRITE;
/*!40000 ALTER TABLE `LS_privileges` DISABLE KEYS */;
INSERT INTO `LS_privileges` VALUES (1,'ADMIN_PRIVILEGE'),(2,'TEACHER_PRIVILEGE'),(3,'STUDENT_PRIVILEGE');
/*!40000 ALTER TABLE `LS_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_roles`
--

DROP TABLE IF EXISTS `LS_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_roles`
--

LOCK TABLES `LS_roles` WRITE;
/*!40000 ALTER TABLE `LS_roles` DISABLE KEYS */;
INSERT INTO `LS_roles` VALUES (1,'Admin'),(2,'Teacher'),(3,'User');
/*!40000 ALTER TABLE `LS_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_roles_LS_privileges`
--

DROP TABLE IF EXISTS `LS_roles_LS_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_roles_LS_privileges` (
  `roles_id` bigint(20) NOT NULL,
  `privileges_id` bigint(20) NOT NULL,
  KEY `FKckuee4ycg8p993a150p4unjhl` (`privileges_id`),
  KEY `FKauleyk32gaqsrpl4u71k1h110` (`roles_id`),
  CONSTRAINT `FKauleyk32gaqsrpl4u71k1h110` FOREIGN KEY (`roles_id`) REFERENCES `LS_roles` (`id`),
  CONSTRAINT `FKckuee4ycg8p993a150p4unjhl` FOREIGN KEY (`privileges_id`) REFERENCES `LS_privileges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_roles_LS_privileges`
--

LOCK TABLES `LS_roles_LS_privileges` WRITE;
/*!40000 ALTER TABLE `LS_roles_LS_privileges` DISABLE KEYS */;
INSERT INTO `LS_roles_LS_privileges` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `LS_roles_LS_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_threads`
--

DROP TABLE IF EXISTS `LS_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_threads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `text` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt5sjkgk3h5qcb5tqktsv55916` (`group_id`),
  KEY `FK49tkqa4og5cmq8rw5mwjd5e8b` (`user_id`),
  CONSTRAINT `FK49tkqa4og5cmq8rw5mwjd5e8b` FOREIGN KEY (`user_id`) REFERENCES `LS_users` (`id`),
  CONSTRAINT `FKt5sjkgk3h5qcb5tqktsv55916` FOREIGN KEY (`group_id`) REFERENCES `LS_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_threads`
--

LOCK TABLES `LS_threads` WRITE;
/*!40000 ALTER TABLE `LS_threads` DISABLE KEYS */;
INSERT INTO `LS_threads` VALUES (1,'2019-02-01','It\'s a main group (called Bucket) - only an Admin can add new Thread here.','Admin Thread',1,1),(2,'2019-02-01','Only Teacher can star a new Thread ','Teacher Thread',2,2),(3,'2019-02-01','This is very interesting and very important information for my students.','Another Thread',2,2);
/*!40000 ALTER TABLE `LS_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_user_details`
--

DROP TABLE IF EXISTS `LS_user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_user_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjpvlifhcsps8j7jyx0r94a7rb` (`user_id`),
  CONSTRAINT `FKjpvlifhcsps8j7jyx0r94a7rb` FOREIGN KEY (`user_id`) REFERENCES `LS_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_user_details`
--

LOCK TABLES `LS_user_details` WRITE;
/*!40000 ALTER TABLE `LS_user_details` DISABLE KEYS */;
INSERT INTO `LS_user_details` VALUES (1,'123 152 456','my address','Description',1),(2,'123 456 789','teacher address','Teacher description',2),(3,'789 456 123','Student address','Student description',3);
/*!40000 ALTER TABLE `LS_user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_users`
--

DROP TABLE IF EXISTS `LS_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_users`
--

LOCK TABLES `LS_users` WRITE;
/*!40000 ALTER TABLE `LS_users` DISABLE KEYS */;
INSERT INTO `LS_users` VALUES (1,'admin@admin.com',_binary '','$2a$10$26xtoJP/vtiwetD8nDV3..d05hKsMKfkUf4KFKqrrHf/zWoktXG.C','Admin'),(2,'ewa@mail.com',_binary '','$2a$10$yvyl5pWGG9FaA9lUEtiwbeJemGbqGbiv76utpx9u9Ee9H.EDo.wiC','Teacher'),(3,'mail@mail.com',_binary '','$2a$10$FcRCWSWOVZUva9eNcgc4.u.o.1ftB5Eto2iXbrsMWLTgp7Cm.ugMy','Student');
/*!40000 ALTER TABLE `LS_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_users_LS_groups`
--

DROP TABLE IF EXISTS `LS_users_LS_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_users_LS_groups` (
  `members_id` bigint(20) NOT NULL,
  `groups_id` bigint(20) NOT NULL,
  KEY `FKhmy0k87h9a4rah6cawph2bt5b` (`groups_id`),
  KEY `FKkdh6i7t5kod1qxrx96u3efust` (`members_id`),
  CONSTRAINT `FKhmy0k87h9a4rah6cawph2bt5b` FOREIGN KEY (`groups_id`) REFERENCES `LS_groups` (`id`),
  CONSTRAINT `FKkdh6i7t5kod1qxrx96u3efust` FOREIGN KEY (`members_id`) REFERENCES `LS_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_users_LS_groups`
--

LOCK TABLES `LS_users_LS_groups` WRITE;
/*!40000 ALTER TABLE `LS_users_LS_groups` DISABLE KEYS */;
INSERT INTO `LS_users_LS_groups` VALUES (1,1),(2,1),(2,2),(3,1),(3,2);
/*!40000 ALTER TABLE `LS_users_LS_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LS_users_LS_roles`
--

DROP TABLE IF EXISTS `LS_users_LS_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LS_users_LS_roles` (
  `users_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  KEY `FKp8t0awy74du8m4t0qd5q5o3n0` (`roles_id`),
  KEY `FK11x5iias8bg9a87y4a60ut71d` (`users_id`),
  CONSTRAINT `FK11x5iias8bg9a87y4a60ut71d` FOREIGN KEY (`users_id`) REFERENCES `LS_users` (`id`),
  CONSTRAINT `FKp8t0awy74du8m4t0qd5q5o3n0` FOREIGN KEY (`roles_id`) REFERENCES `LS_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LS_users_LS_roles`
--

LOCK TABLES `LS_users_LS_roles` WRITE;
/*!40000 ALTER TABLE `LS_users_LS_roles` DISABLE KEYS */;
INSERT INTO `LS_users_LS_roles` VALUES (1,1),(1,2),(1,3),(2,2),(2,3),(3,3);
/*!40000 ALTER TABLE `LS_users_LS_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-01 11:22:42
