/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.14-MariaDB : Database - textBoard
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`textBoard` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `textBoard`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `title` char(200) NOT NULL,
  `body` text NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `boardId` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`title`,`body`,`memberId`,`boardId`,`hit`) values 
(1,'2020-12-18 01:07:10','2020-12-18 01:07:10','[SQL] 데이터베이스,테이블,row 추가','# DB생성\r\n```\r\nCREATE DATABASE `DB이름`;\r\n```\r\n\r\n# table 생성\r\n```\r\nCREATE TABLE `테이블명` (\r\n `칼럼` 타입 조건,\r\n `칼럼2` 타입 조건,\r\n);\r\n```\r\n\r\n# row 생성\r\n```\r\nINSERT INTO `테이블명`\r\nSET `칼럼1` = \'data\',\r\n`칼럼2` = \'data\';\r\n```\r\n```\r\nINSERT INTO `테이블명` (`칼럼1`,`칼럼2)\r\nVALUES (\'data\',\'data\');\r\n```\r\n\r\n# 예시\r\n```\r\nCREATE DATABASE textBoard;\r\nUSE textBoard;\r\n\r\nCREATE TABLE article (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME NOT NULL,\r\n    title CHAR(200) NOT NULL,\r\n    `body` TEXT NOT NULL,\r\n    memberId INT(10) UNSIGNED NOT NULL, \r\n);\r\n\r\nINSERT INTO article\r\nSET regDate = NOW(),\r\ntitle = \'제목1\',\r\n`body` = \'내용1\',\r\nmemberId = 1;\r\n```',1,3,0),
(2,'2020-12-18 01:25:42','2020-12-18 01:25:42','[JAVA] 문자열 나누기 split','# split\r\n- split을 사용해 문자열을 나눌 수 있다\r\n```java\r\npublic static void main(String[] args) {\r\nString 동물들 = \"개,고양이,소,말,돼지\";\r\nString[] 동물 = 동물들.split(\",\");\r\nfor(int i = 0; i < 동물.length; i++){\r\nSystem.out.println(동물[i]);\r\n}\r\n}\r\n```\r\n- 결과\r\n```\r\n개\r\n고양이\r\n소\r\n말\r\n돼지\r\n```\r\n\r\n',1,3,0);

/*Table structure for table `articleRecommand` */

DROP TABLE IF EXISTS `articleRecommand`;

CREATE TABLE `articleRecommand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `articleId` int(10) unsigned NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `articleRecommand` */

/*Table structure for table `articleReply` */

DROP TABLE IF EXISTS `articleReply`;

CREATE TABLE `articleReply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `articleId` int(10) unsigned NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `reply` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `articleReply` */

insert  into `articleReply`(`id`,`regDate`,`updateDate`,`articleId`,`memberId`,`reply`) values 
(1,'2020-12-18 01:07:06','2020-12-18 01:07:06',1,1,'hi'),
(2,'2020-12-18 01:07:06','2020-12-18 01:07:06',1,2,'lol'),
(3,'2020-12-18 01:07:06','2020-12-18 01:07:06',2,1,'hello');

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `boardId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `name` char(50) NOT NULL,
  `code` char(50) NOT NULL,
  PRIMARY KEY (`boardId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `board` */

insert  into `board`(`boardId`,`regDate`,`updateDate`,`name`,`code`) values 
(1,'2020-12-18 01:07:06','2020-12-18 01:07:06','NOTICE','notice'),
(2,'2020-12-18 01:07:06','2020-12-18 01:07:06','FREE','free'),
(3,'2020-12-18 01:07:10','2020-12-18 01:07:10','STUDY','study');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `userId` char(30) NOT NULL,
  `userPw` varchar(50) NOT NULL,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`updateDate`,`userId`,`userPw`,`name`) values 
(1,'2020-12-18 01:07:10','2020-12-18 01:07:10','admin','admin','관리자');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
