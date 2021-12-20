/*
SQLyog Community
MySQL - 10.4.11-MariaDB : Database - laboratorije
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laboratorije` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `laboratorije`;

/*Table structure for table `analiza` */

DROP TABLE IF EXISTS `analiza`;

CREATE TABLE `analiza` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `analiza` */

insert  into `analiza`(`id`,`naziv`) values 
(3,'krvna slika'),
(4,'biohemijski test fsgdh'),
(6,'afds'),
(8,'afdsd');

/*Table structure for table `grad` */

DROP TABLE IF EXISTS `grad`;

CREATE TABLE `grad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `grad` */

insert  into `grad`(`id`,`naziv`) values 
(1,'Beograd'),
(2,'Novi Sad'),
(3,'Pancevo'),
(4,'Pozarevac'),
(5,'Smederevo'),
(6,'Kragujevac'),
(7,'Nis'),
(8,'Kraljevo');

/*Table structure for table `laboratorija` */

DROP TABLE IF EXISTS `laboratorija`;

CREATE TABLE `laboratorija` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) DEFAULT NULL,
  `adresa` varchar(80) DEFAULT NULL,
  `grad` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grad` (`grad`),
  CONSTRAINT `laboratorija_ibfk_1` FOREIGN KEY (`grad`) REFERENCES `grad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `laboratorija` */

insert  into `laboratorija`(`id`,`naziv`,`adresa`,`grad`) values 
(1,'afds','fads',1),
(2,'Izmena','Izmena',6),
(4,'novi','novi',4);

/*Table structure for table `laboratorija_analiza` */

DROP TABLE IF EXISTS `laboratorija_analiza`;

CREATE TABLE `laboratorija_analiza` (
  `laboratorija` bigint(20) NOT NULL,
  `analiza` bigint(20) NOT NULL,
  `cena` decimal(11,2) DEFAULT NULL,
  `trajanje` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`laboratorija`,`analiza`),
  KEY `analiza` (`analiza`),
  CONSTRAINT `laboratorija_analiza_ibfk_1` FOREIGN KEY (`laboratorija`) REFERENCES `laboratorija` (`id`) ON DELETE CASCADE,
  CONSTRAINT `laboratorija_analiza_ibfk_2` FOREIGN KEY (`analiza`) REFERENCES `analiza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `laboratorija_analiza` */

insert  into `laboratorija_analiza`(`laboratorija`,`analiza`,`cena`,`trajanje`) values 
(1,3,1500.00,2),
(4,4,34.00,4),
(4,6,34.00,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
