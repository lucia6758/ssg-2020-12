/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.6-MariaDB : Database - textBoard
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`textBoard` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `textBoard`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `title` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `boardId` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`title`,`body`,`memberId`,`boardId`,`hit`) values 
(1,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목1','내용1',1,1,0),
(2,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목2','내용2',1,1,0),
(3,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목3','# 공지사항\r\n안녕하세요.\r\n이 사이트는 저의 글 연재 공간입니다.\r\n\r\n---\r\n\r\n# 이 사이트의 특징\r\n- A\r\n- B\r\n- C',1,1,0),
(4,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목4','내용4',1,1,0),
(5,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목5','내용5',1,1,0),
(6,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목6','내용6',1,1,0),
(7,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목7','내용7',1,1,0),
(8,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목8','내용8',1,1,0),
(9,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목9','내용9',1,1,0),
(10,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목10','내용10',1,1,0),
(11,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목11','내용11',2,2,0),
(12,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목12','내용12',1,1,0),
(13,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목13','내용13',1,2,0),
(14,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목14','내용14',1,2,0),
(15,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목15','내용15',1,2,0),
(16,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목16','내용16',1,1,0),
(17,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목17','내용17',2,2,0),
(18,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목18','내용18',1,1,0),
(19,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목19','내용19',1,2,0),
(20,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목20','내용20',2,2,0),
(21,'2020-12-17 10:57:30','2020-12-17 10:57:30','제목_0.9873168878139154','내용_0.928948986277868',2,2,0);

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `boardId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`boardId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `board` */

insert  into `board`(`boardId`,`regDate`,`updateDate`,`name`,`code`) values 
(1,'2020-12-17 10:57:30','2020-12-17 10:57:30','공지사항','notice'),
(2,'2020-12-17 10:57:30','2020-12-17 10:57:30','자유','free');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `userPw` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `member` */

insert  into `member`(`id`,`userId`,`userPw`,`name`) values 
(1,'aaa','aaa','aaa'),
(2,'bbb','bbb','bbb');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `articleId` int(10) unsigned NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `body` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reply` */

insert  into `reply`(`id`,`regDate`,`updateDate`,`articleId`,`userId`,`body`) values 
(1,'2020-12-17 10:57:30','2020-12-17 10:57:30',1,1,'hi'),
(2,'2020-12-17 10:57:30','2020-12-17 10:57:30',1,2,'lol'),
(3,'2020-12-17 10:57:30','2020-12-17 10:57:30',2,1,'hello');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
