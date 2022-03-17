/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.20-MariaDB : Database - parcial1_base_de_datos_ii
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parcial1_base_de_datos_ii` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `parcial1_base_de_datos_ii`;

/*Table structure for table `academicperiodgroups` */

DROP TABLE IF EXISTS `academicperiodgroups`;

CREATE TABLE `academicperiodgroups` (
  `Id` int(11) NOT NULL,
  `journeyId` int(11) NOT NULL,
  `degreeId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `matriculateId` int(11) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `quota` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `journeyId` (`journeyId`),
  KEY `degreeId` (`degreeId`),
  KEY `groupId` (`groupId`),
  KEY `matriculateId` (`matriculateId`),
  CONSTRAINT `academicperiodgroups_ibfk_1` FOREIGN KEY (`journeyId`) REFERENCES `journeys` (`Id`),
  CONSTRAINT `academicperiodgroups_ibfk_2` FOREIGN KEY (`degreeId`) REFERENCES `degrees` (`Id`),
  CONSTRAINT `academicperiodgroups_ibfk_3` FOREIGN KEY (`groupId`) REFERENCES `groups` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `academicperiodgroups` */

insert  into `academicperiodgroups`(`Id`,`journeyId`,`degreeId`,`groupId`,`matriculateId`,`updatedAt`,`createdAt`,`quota`) values 
(62,16,23,10,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0);

/*Table structure for table `degrees` */

DROP TABLE IF EXISTS `degrees`;

CREATE TABLE `degrees` (
  `Id` int(11) NOT NULL,
  `levelId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Idleve` (`levelId`),
  CONSTRAINT `degrees_ibfk_1` FOREIGN KEY (`levelId`) REFERENCES `levels` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `degrees` */

insert  into `degrees`(`Id`,`levelId`,`name`,`abbreviation`,`updatedAt`,`createdAt`) values 
(23,11,'Kinder','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,13,'Preparatoria','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,12,'Primero Primaria','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,12,'Segundo Primaria','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,12,'Tercero Primaria','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,12,'Cuarto Primaria','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,12,'Quinto Primaria','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `groups` */

insert  into `groups`(`Id`,`name`,`abbreviation`,`createdAt`,`updatedAt`) values 
(10,'Sección A','A','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `journeys` */

DROP TABLE IF EXISTS `journeys`;

CREATE TABLE `journeys` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `journeys` */

insert  into `journeys`(`Id`,`name`,`abbreviation`,`updatedAt`,`createdAt`) values 
(16,'Matutina','Mat.','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `levels` */

insert  into `levels`(`Id`,`name`,`abbreviation`,`updatedAt`,`createdAt`) values 
(11,'Preprimaria y Primaria Baja','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'Primaria Alta','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'Secundaria','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `matriculates` */

DROP TABLE IF EXISTS `matriculates`;

CREATE TABLE `matriculates` (
  `Id` int(11) NOT NULL,
  `academicPeriodGroupId` int(11) NOT NULL,
  PRIMARY KEY (`academicPeriodGroupId`),
  CONSTRAINT `matriculates_ibfk_1` FOREIGN KEY (`academicPeriodGroupId`) REFERENCES `academicperiodgroups` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `matriculates` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
