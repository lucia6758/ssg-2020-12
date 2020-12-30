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
  `regDate` date NOT NULL,
  `updateDate` date NOT NULL,
  `title` char(200) NOT NULL,
  `body` text NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `boardId` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `likesCount` int(10) unsigned NOT NULL,
  `replyCount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`title`,`body`,`memberId`,`boardId`,`hit`,`likesCount`,`replyCount`) values 
(1,'2020-12-18','2020-12-30','데이터베이스,테이블,row 추가','# DB생성\r\n```\r\nCREATE DATABASE `DB이름`;\r\n```\r\n\r\n# table 생성\r\n```\r\nCREATE TABLE `테이블명` (\r\n `칼럼` 타입 조건,\r\n `칼럼2` 타입 조건,\r\n);\r\n```\r\n\r\n# row 생성\r\n```\r\nINSERT INTO `테이블명`\r\nSET `칼럼1` = \'data\',\r\n`칼럼2` = \'data\';\r\n```\r\n```\r\nINSERT INTO `테이블명` (`칼럼1`,`칼럼2)\r\nVALUES (\'data\',\'data\');\r\n```\r\n\r\n# 예시\r\n```\r\nCREATE DATABASE textBoard;\r\nUSE textBoard;\r\n\r\nCREATE TABLE article (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME NOT NULL,\r\n    title CHAR(200) NOT NULL,\r\n    `body` TEXT NOT NULL,\r\n    memberId INT(10) UNSIGNED NOT NULL, \r\n);\r\n\r\nINSERT INTO article\r\nSET regDate = NOW(),\r\ntitle = \'제목1\',\r\n`body` = \'내용1\',\r\nmemberId = 1;\r\n```',1,5,0,0,0),
(2,'2020-12-18','2020-12-30','문자열 나누기 split','# split\r\n- split을 사용해 문자열을 나눌 수 있다\r\n```java\r\npublic static void main(String[] args) {\r\nString 동물들 = \"개,고양이,소,말,돼지\";\r\nString[] 동물 = 동물들.split(\",\");\r\nfor(int i = 0; i < 동물.length; i++){\r\nSystem.out.println(동물[i]);\r\n}\r\n}\r\n```\r\n- 결과\r\n```\r\n개\r\n고양이\r\n소\r\n말\r\n돼지\r\n```\r\n\r\n',1,4,0,0,0),
(3,'2020-12-20','2020-12-30','데이터 조회 SELECT','# SELECT\r\n- 칼럼명에 *를 넣으면 모든 칼럼을 조회할 수 있다.\r\n```\r\nSELECT `칼럼명`\r\nFROM `테이블명`;\r\n```\r\n\r\n# SELECT, WHERE (조건추가)\r\n- 뒤에 WHERE를 붙이면 원하는 조건의 데이터만 조회할 수 있다.\r\n```\r\nSELECT `칼럼명`\r\nFROM `테이블명`\r\nWHERE `칼럼` = `데이터`;\r\n```\r\n\r\n# 예시\r\n```\r\nSELECT *\r\nFROM article\r\nWHERE id = 1;\r\n```\r\n- 이렇게 쓴다면 id가 1인 row의 모든 칼럼들이 조회된다.',1,5,0,0,0),
(4,'2020-12-20','2020-12-30','데이터 조회 SELECT(2)','전글에서는 조건문으로 WHERE만 소개했지만 더 많은 조건들을 추가할 수 있다\r\n\r\n# LIKE \r\n```\r\nSELECT *\r\nFROM article\r\nWHERE title LIKE \'SQL%\';\r\n```\r\n- 이렇게 조회하면 SQL로 시작하는 제목을 가진 데이터들을 조회할 수 있다.\r\n- %는 앞, 뒤 모두에 붙일 수 있다.\r\n\r\n# ORDER BY\r\n```\r\nSELECT *\r\nFROM article\r\nORDER BY id DESC;\r\n```\r\n- 이렇게 조회하면 id의 내림차수대로 데이터들이 조회된다.\r\n- DESC는 내림차순, ASC는 오름차순을 나타낸다. (descending, ascending)\r\n- DESC는 describe로 데이터타입을 조회할때도 쓰인다. 줄임말만 같을 뿐 여기서 쓰이는 것과 관련 없음.\r\n\r\n# LIMIT\r\n```\r\nSELECT *\r\nFROM article\r\nLIMIT 2;\r\n```\r\n- 조회하고싶은 데이터의 갯수를 정할 수 있다. 예시처럼 LIMIT을 사용하면 데이터가 많아도 2개만 나타난다.\r\n\r\n---\r\n위의 조건들을 한번에 다 사용 할 수도 있다.',1,5,0,0,0),
(5,'2020-12-22','2020-12-30','데이터 수정 UPDATE','# UPDATE\r\n-데이터 값을 수정할 수 있다.\r\n```\r\nUPDATE `테이블명`\r\nSET 칼럼 = \'데이터\'\r\nWHERE 조건;\r\n```\r\n\r\n## 예시\r\n```\r\nUPDATE article\r\nSET title = \'sql정리\'\r\nWHERE id = 3;\r\n```',1,5,0,1,1),
(6,'2020-12-23','2020-12-30','코드펜 플러그인 테스트','# hover\r\n- hover를 이용하면 마우스를 올렸을 때 색깔이나 크기 등 다양한 요소를 바꿀 수 있다. 예시에서는 색깔이 바뀌도록 만들어보았다.\r\n\r\n```codepen\r\nhttps://codepen.io/lucia6758/embed/RwRXqNN?height=500&theme-id=light&default-tab=html,result\r\n```',1,6,0,0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `board` */

insert  into `board`(`boardId`,`regDate`,`updateDate`,`name`,`code`) values 
(4,'2020-12-21 12:16:10','2020-12-21 12:16:10','JAVA','java'),
(5,'2020-12-21 12:16:10','2020-12-21 12:16:10','SQL','sql'),
(6,'2020-12-23 10:26:02','2020-12-23 10:26:02','HTML/CSS','htmlCss'),
(7,'2020-12-23 10:27:25','2020-12-23 10:27:25','JAVASCRIPT','js');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` date NOT NULL,
  `updateDate` date NOT NULL,
  `userId` char(30) NOT NULL,
  `userPw` varchar(50) NOT NULL,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`updateDate`,`userId`,`userPw`,`name`) values 
(1,'2020-12-18','2020-12-18','admin','admin','엘밍');

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
