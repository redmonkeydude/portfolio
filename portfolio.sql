-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `portfolio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `portfolio`;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `created`, `updated`, `order`) VALUES
(1,	'PCL',	'pcl',	'pcl related',	'2014-05-08 23:16:52',	'2014-05-08 23:16:52',	1),
(2,	'Patriots',	'patriots',	'Patriots related',	'2014-05-08 23:17:19',	'2014-05-08 23:17:19',	2),
(3,	'Reds',	'reds',	'Reds related',	'2014-05-08 23:18:15',	'2014-05-08 23:18:15',	3),
(4,	'Mcdonalds',	'mcdonalds',	'Mcdonalds related',	'2014-05-08 23:18:37',	'2014-05-08 23:18:37',	4);

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `type` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `portfolios`;
CREATE TABLE `portfolios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short_description` varchar(1000) DEFAULT NULL,
  `long_description` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `portfolios` (`id`, `name`, `short_description`, `long_description`, `created`, `updated`) VALUES
(1,	'Project #1',	'Project #1 short description',	'Project #1 long description. Project #1 long description. Project #1 long description. Project #1 long description. Project #1 long description.\r\n\r\nProject #1 long description.Project #1 long description.Project #1 long description.\r\n\r\nProject #1 long description.Project #1 long description.Project #1 long description.Project #1 long description.Project #1 long description.',	'2014-05-08 23:10:23',	'2014-05-08 23:10:23'),
(2,	'Project #2',	'Project #2 short description.',	'Project #2 long description. Project #2 long description. Project #2 long description. Project #2 long description. Project #2 long description. Project #2 long description. Project #2 long description. Project #2 long description.\r\n\r\nProject #2 long description. Project #2 long description. Project #2 long description. Project #2 long description. Project #2 long description.\r\n\r\nProject #2 long description.Project #2 long description.Project #2 long description.',	'2014-05-08 23:11:12',	'2014-05-08 23:11:12'),
(3,	'Project #3',	'Project #3 short description.',	'Project #3 long description. Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description. \r\n\r\n\r\nProject #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.\r\n\r\nProject #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.Project #3 long description.',	'2014-05-08 23:11:49',	'2014-05-08 23:11:49'),
(4,	'Project #4',	'Project #4 short description.',	'Project #4 long description. Project #4 long description.Project #4 long description.Project #4 long description.Project #4 long description. Project #4 long description.Project #4 long description.Project #4 long description.\r\n\r\nProject #4 long description.Project #4 long description.Project #4 long description.Project #4 long description.\r\nProject #4 long description.Project #4 long description.Project #4 long description.',	'2014-05-08 23:12:25',	'2014-05-08 23:12:25'),
(5,	'Project #5',	'Project #5 short description.',	'Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.\r\n\r\nProject #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.\r\n\r\n\r\n\r\n\r\nProject #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.Project #5 short description.',	'2014-05-08 23:12:53',	'2014-05-08 23:12:53');

DROP TABLE IF EXISTS `portfolios_categories`;
CREATE TABLE `portfolios_categories` (
  `portfolios_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`portfolios_id`,`categories_id`),
  KEY `fk_portfolios_has_categories_categories1_idx` (`categories_id`),
  KEY `fk_portfolios_has_categories_portfolios_idx` (`portfolios_id`),
  CONSTRAINT `fk_portfolios_has_categories_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolios_has_categories_portfolios` FOREIGN KEY (`portfolios_id`) REFERENCES `portfolios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `portfolios_categories` (`portfolios_id`, `categories_id`) VALUES
(1,	1),
(2,	2),
(3,	3),
(4,	4),
(5,	4);

DROP TABLE IF EXISTS `portfolios_media`;
CREATE TABLE `portfolios_media` (
  `portfolios_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `sort` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`portfolios_id`,`media_id`),
  KEY `fk_portfolios_has_media_media1_idx` (`media_id`),
  KEY `fk_portfolios_has_media_portfolios1_idx` (`portfolios_id`),
  CONSTRAINT `fk_portfolios_has_media_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolios_has_media_portfolios1` FOREIGN KEY (`portfolios_id`) REFERENCES `portfolios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `portfolios_tags`;
CREATE TABLE `portfolios_tags` (
  `tags_id` int(11) NOT NULL,
  `portfolios_id` int(11) NOT NULL,
  PRIMARY KEY (`tags_id`,`portfolios_id`),
  KEY `fk_tags_has_portfolios_portfolios1_idx` (`portfolios_id`),
  KEY `fk_tags_has_portfolios_tags1_idx` (`tags_id`),
  CONSTRAINT `fk_tags_has_portfolios_portfolios1` FOREIGN KEY (`portfolios_id`) REFERENCES `portfolios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_has_portfolios_tags1` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `portfolios_technologies`;
CREATE TABLE `portfolios_technologies` (
  `portfolios_id` int(11) NOT NULL,
  `technologies_id` int(11) NOT NULL,
  PRIMARY KEY (`portfolios_id`,`technologies_id`),
  KEY `fk_portfolios_has_technologies_technologies1_idx` (`technologies_id`),
  KEY `fk_portfolios_has_technologies_portfolios1_idx` (`portfolios_id`),
  CONSTRAINT `fk_portfolios_has_technologies_portfolios1` FOREIGN KEY (`portfolios_id`) REFERENCES `portfolios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolios_has_technologies_technologies1` FOREIGN KEY (`technologies_id`) REFERENCES `technologies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `technologies`;
CREATE TABLE `technologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_accessed` datetime DEFAULT NULL,
  `userscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2014-05-09 21:46:38
