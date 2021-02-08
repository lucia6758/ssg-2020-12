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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`title`,`body`,`memberId`,`boardId`,`hit`,`likesCount`,`replyCount`) values 
(1,'2020-12-18','2021-02-09','데이터베이스,테이블,row 추가','# DB생성\r\n```sql\r\nCREATE DATABASE `DB이름`;\r\n```\r\n\r\n# table 생성\r\n```sql\r\nCREATE TABLE `테이블명` (\r\n `칼럼` 타입 조건,\r\n `칼럼2` 타입 조건,\r\n);\r\n```\r\n\r\n# row 생성\r\n```sql\r\nINSERT INTO `테이블명`\r\nSET `칼럼1` = \'data\',\r\n`칼럼2` = \'data\';\r\n```\r\n```sql\r\nINSERT INTO `테이블명` (`칼럼1`,`칼럼2)\r\nVALUES (\'data\',\'data\');\r\n```\r\n\r\n# 예시\r\n```sql\r\nCREATE DATABASE textBoard;\r\nUSE textBoard;\r\n\r\nCREATE TABLE article (\r\n    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    regDate DATETIME NOT NULL,\r\n    title CHAR(200) NOT NULL,\r\n    `body` TEXT NOT NULL,\r\n    memberId INT(10) UNSIGNED NOT NULL, \r\n);\r\n\r\nINSERT INTO article\r\nSET regDate = NOW(),\r\ntitle = \'제목1\',\r\n`body` = \'내용1\',\r\nmemberId = 1;\r\n```',1,5,17,0,0),
(2,'2020-12-18','2021-02-09','문자열 나누기 split','# split\r\n- split을 사용해 문자열을 나눌 수 있다\r\n```java\r\npublic static void main(String[] args) {\r\n    String 동물들 = \"개,고양이,소,말,돼지\";\r\n    String[] 동물 = 동물들.split(\",\");\r\n    for(int i = 0; i < 동물.length; i++){\r\n    System.out.println(동물[i]);\r\n    }\r\n}\r\n```\r\n- 결과\r\n```\r\n개\r\n고양이\r\n소\r\n말\r\n돼지\r\n```\r\n\r\n',1,4,19,0,0),
(3,'2020-12-20','2021-02-09','데이터 조회 SELECT','# SELECT\r\n- 칼럼명에 *를 넣으면 모든 칼럼을 조회할 수 있다.\r\n```sql\r\nSELECT `칼럼명`\r\nFROM `테이블명`;\r\n```\r\n\r\n# SELECT, WHERE (조건추가)\r\n- 뒤에 WHERE를 붙이면 원하는 조건의 데이터만 조회할 수 있다.\r\n```sql\r\nSELECT `칼럼명`\r\nFROM `테이블명`\r\nWHERE `칼럼` = `데이터`;\r\n```\r\n\r\n# 예시\r\n```sql\r\nSELECT *\r\nFROM article\r\nWHERE id = 1;\r\n```\r\n- 이렇게 쓴다면 id가 1인 row의 모든 칼럼들이 조회된다.',1,5,24,0,0),
(4,'2020-12-20','2021-02-09','데이터 조회 SELECT(2)','전글에서는 조건문으로 WHERE만 소개했지만 더 많은 조건들을 추가할 수 있다\r\n\r\n# LIKE \r\n```sql\r\nSELECT *\r\nFROM article\r\nWHERE title LIKE \'SQL%\';\r\n```\r\n- 이렇게 조회하면 SQL로 시작하는 제목을 가진 데이터들을 조회할 수 있다.\r\n- %는 앞, 뒤 모두에 붙일 수 있다.\r\n\r\n# ORDER BY\r\n```sql\r\nSELECT *\r\nFROM article\r\nORDER BY id DESC;\r\n```\r\n- 이렇게 조회하면 id의 내림차수대로 데이터들이 조회된다.\r\n- DESC는 내림차순, ASC는 오름차순을 나타낸다. (descending, ascending)\r\n- DESC는 describe로 데이터타입을 조회할때도 쓰인다. 줄임말만 같을 뿐 여기서 쓰이는 것과 관련 없음.\r\n\r\n# LIMIT\r\n```sql\r\nSELECT *\r\nFROM article\r\nLIMIT 2;\r\n```\r\n- 조회하고싶은 데이터의 갯수를 정할 수 있다. 예시처럼 LIMIT을 사용하면 데이터가 많아도 2개만 나타난다.\r\n\r\n---\r\n위의 조건들을 한번에 다 사용 할 수도 있다.',1,5,17,0,0),
(5,'2020-12-22','2021-02-09','데이터 수정 UPDATE','# UPDATE\r\n-데이터 값을 수정할 수 있다.\r\n```sql\r\nUPDATE `테이블명`\r\nSET 칼럼 = \'데이터\'\r\nWHERE 조건;\r\n```\r\n\r\n## 예시\r\n```sql\r\nUPDATE article\r\nSET title = \'sql정리\'\r\nWHERE id = 3;\r\n```',1,5,26,1,1),
(6,'2020-12-23','2021-02-09','코드펜 플러그인 테스트','# hover\r\n- hover를 이용하면 마우스를 올렸을 때 색깔이나 크기 등 다양한 요소를 바꿀 수 있다. 예시에서는 색깔이 바뀌도록 만들어보았다.\r\n\r\n```codepen\r\nhttps://codepen.io/lucia6758/embed/RwRXqNN?height=500&theme-id=light&default-tab=html,result\r\n```',1,6,20,0,0),
(7,'2021-01-07','2021-02-09','예외처리 try catch','# 예외(Exception)란?\r\n사용자의 잘못된 조작 또는 개발자의 잘못된 코딩으로 인해 발생하는 프로그램 오류. 예외가 발생하면 프로그램이 종료되지만 예외처리를 통해 정상적으로 작동하게 할 수 있다.\r\n\r\n## 예외 종류\r\n- ArithmeticException : 정수를 0으로 나눌경우 발생 \r\n- ArrayIndexOutOfBoundsExcetion : 배열의 범위를 벗어난 index를 접근할 시 발생\r\n- ClassCastExcetion : 변환할 수 없는 타입으로 객체를 반환 시 발생\r\n- NullPointException : 존재하지 않는 레퍼런스를 참조할때 발생\r\n- IllegalArgumentException : 잘못된 인자를 전달 할 때 발생 \r\n- IOException : 입출력 동작 실패 또는 인터럽트 시 발생 \r\n- OutOfMemoryException : 메모리가 부족한 경우 발생\r\n- NumberFormatException : 문자열이 나타내는 숫자와 일치하지 않는 타입의 숫자로 변환시 발생\r\n\r\n# try catch\r\n```java\r\ntry{\r\n\r\n    예외가 발생할 수 있는 코드\r\n\r\n}catch (Exception e){\r\n\r\n    예외시 실행\r\n\r\n}finally{\r\n\r\n    예외발생 여부와 관계없이 실행\r\n} \r\n```\r\n\r\n## 다중 catch \r\n```java\r\ntry{\r\n\r\n} catch (ArrayIndexOutOfBoundsExcetion e){\r\n\r\n} catch (NumberFormatException e){\r\n\r\n}\r\n```\r\n예외종류에 따라 다중 catch를 사용할 수 있다.\r\n\r\n## 예외처리 던지기 throws\r\n```\r\n리턴타입 메소드명(매개변수) throws 예외클래스1, 예외클래스2, ...{\r\n}\r\n\r\n리턴타입 메소드명(매개변수) throws Exception{\r\n}\r\n```\r\nthrows는 메소드 선언부 끝에 작성되어 메소드에서 처리하지 않은 예외를 호출한 곳으로 떠넘기는 역할을 한다. 위처럼 예외클래스를 여러가지 쓸 수도 있고 아래처럼 모든 예외를 한번에 넘길 수도 있다.\r\n메인 메소드에서는 사용하지 않는 것이 좋다.\r\n\r\n### 예시\r\n```java\r\npublic void method1(){\r\n    try {\r\n        method2();\r\n    } catch (ClassCastExcetion) {\r\n        System.out.println(\"클래스가 존재하지 않습니다\");\r\n    }\r\n}\r\n\r\npublic void method2() throws ClassCastExcetion{\r\n    Class cl = Class.forName(\"java.lang.String2\");\r\n}\r\n```\r\n',1,4,14,0,0),
(8,'2021-01-18','2021-02-09','JOIN(INNER JOIN, RIGHT JOIN, LEFT JOIN)','# JOIN\r\n두개 이상의 테이블이나 데이터베이스를 연결하여 데이터를 검색하는 방법. 여러개의 테이블을 마치 하나의 테이블인것처럼 활용할 수 있다.\r\n![image](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdUvbm7%2FbtqU52a0dZO%2FrEvGDOiBkkO1ZYHnPxcjc0%2Fimg.png)\r\n\r\n## INNER JOIN\r\n```sql\r\nSELECT 칼럼 \r\nFROM 테이블1\r\nINNER JOIN 테이블2\r\nON 조건\r\n```\r\n```sql\r\nSELECT 칼럼 \r\nFROM 테이블1\r\nJOIN 테이블2\r\nON 조건\r\n```\r\nMySQL에서는 JOIN과 INNER JOIN이 같은 의미로 사용된다.\r\nON절에는 WHERE절에서 사용할 수 있는 조건들을 사용할 수 있다.\r\n\r\n### 예시\r\n```sql\r\nSELECT *\r\nFROM reservation AS R\r\nINNER JOIN customer AS C\r\nON R.Name = C.Name;\r\n```\r\n\r\n\r\n## LEFT JOIN\r\n```sql\r\nSELECT 칼럼 \r\nFROM 테이블1\r\nLEFT JOIN 테이블2\r\nON 조건\r\n```\r\n\r\n### 예시\r\n```sql\r\nSELECT *\r\nFROM reservation AS R\r\nLEFT JOIN customer AS C\r\nON R.Name = C.Name;\r\n```\r\n\r\n## RIGHT JOIN\r\n```sql\r\nSELECT 칼럼 \r\nFROM 테이블1\r\nRIGHT JOIN 테이블2\r\nON 조건\r\n```\r\n\r\n### 예시\r\n```sql\r\nSELECT *\r\nFROM reservation AS R\r\nRIGHT JOIN customer AS C\r\nON R.Name = C.Name;\r\n```',1,5,6,0,0),
(9,'2021-01-20','2021-02-09','[JSP 커뮤니티 일지 1] CRUD, 회원가입, 로그인, 권한체크','## ~210120\r\n- 다중게시판 글 CRUD\r\n- 회원가입\r\n  - 빈칸 체크, 아이디 중복확인, 비밀번호 확인\r\n- 로그인\r\n- 권한체크\r\n  - 글쓰기는 로그인상태에서만 가능\r\n  - 글 수정, 삭제버튼은 본인 글에서만 나타난다\r\n  - 로그인상태와 로그아웃상태에서 보이는 상단메뉴가 다르다(회원가입/로그인/로그아웃)\r\n\r\n```youtube\r\nARZZchbun_Q\r\n```',1,8,15,0,0),
(10,'2021-01-26','2021-02-09','마크다운 문법','# 마크다운(Markdown)\r\n- 마크다운은 마크업 언어의 일종으로 일반 텍스트 문서의 양식을 편집하는 문법이다. 마크다운을 이용해 작성된 문서는 쉽게 HTML 등 다른 문서형태로 변환이 가능하다.\r\n\r\n## 마크다운 문법\r\n작성방법, 작성결과 순으로 정리해보았다.\r\n### 1. 제목\r\n```\r\n# h1\r\n## h2\r\n### h3\r\n#### h4\r\n##### h5\r\n###### h6\r\n```\r\n<br/>\r\n# h1\r\n## h2\r\n### h3\r\n#### h4\r\n##### h5\r\n###### h6\r\n<br/>\r\n### 2. 목록\r\n##### 2.1 순서를 표기\r\n```\r\n1. 가\r\n2. 나\r\n3. 다\r\n```\r\n\r\n1. 가\r\n2. 나\r\n3. 다\r\n\r\n##### 2.2 순서 없는 목록\r\n```\r\n- 동물\r\n  - 고양이\r\n    - 코숏\r\n* 곤충\r\n  * 개미\r\n+ -,*,+ 모양과 관련없이\r\n  + 똑같이 나온다\r\n```\r\n- 동물\r\n  - 고양이\r\n    - 코숏\r\n* 곤충\r\n  * 개미\r\n+ -,*,+ 모양과 관련없이\r\n  + 똑같이 나온다\r\n<br/>\r\n### 3. 인용문\r\n```\r\n> 인용문은\r\n>> 이렇게\r\n>>> 중첩으로 사용가능\r\n```\r\n> 인용문은\r\n>> 이렇게\r\n>>> 중첩으로 사용가능\r\n\r\n<br/>\r\n### 4. 인라인 코드\r\n```\r\n`백틱 안에 작성하면 된다`\r\n```\r\n`백틱 안에 작성하면 된다`\r\n\r\n<br/>\r\n### 5. 코드블럭\r\n##### 5.1 기본\r\n```\r\n코드블럭은 ```와 ``` 사이에 입력\r\n```\r\n\r\n##### 5.2 코드 하이라이트\r\n```\r\n언어이름을 시작할때 ``` 뒤에 넣는다. ex) ```java\r\n```\r\n```java\r\nString a = \"안녕\";\r\nint b = 5;\r\n```\r\n\r\n<br/>\r\n### 6. 강조\r\n```\r\n*Italic* _Italic_\r\n**bold** __bold__\r\n ~~strike~~\r\n```\r\n*Italic* _Italic_\r\n**bold** __bold__\r\n ~~strike~~\r\n \r\n<br/>\r\n ### 7. 링크\r\n ```\r\n <https://www.naver.com>\r\n [NAVER](https://www.naver.com)\r\n ```\r\n <https://www.naver.com>\r\n [NAVER](https://www.naver.com/)\r\n \r\n<br/>\r\n ### 8. 이미지\r\n ```\r\n ![대체텍스트](이미지주소)\r\n [![대체텍스트](이미지주소)](링크주소)\r\n ```\r\n ![이미지](https://images.unsplash.com/photo-1611840155466-ac6bfe5feeac?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHw=&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60)\r\n \r\n - 이미지에 링크걸기\r\n ```\r\n [![대체텍스트](이미지주소)](링크주소)\r\n ```\r\n \r\n<br/>\r\n ### 9. 체크박스\r\n ```\r\n - [ ] 체크안함\r\n - [x] 체크\r\n ```\r\n - [ ] 체크안함\r\n - [x] 체크\r\n',1,8,1,0,0),
(11,'2021-01-28','2021-02-09','[JSP 커뮤니티 일지 2] 비번암호화, 아이디&비번찾기, 게시물리스트 개선, 토스트에디터 적용','## ~210128\r\n- 비밀번호 암호화 \r\n- 아이디 찾기 (이름, 메일주소로)\r\n- 비밀번호 찾기\r\n  - 아이디와 메일주소가 일치하면 메일로 임시비밀번호 전송\r\n  - 기존비밀번호를 임시비밀번호로 변경 \r\n- 게시판에 게시물 수 표시\r\n- 검색기능 추가\r\n  - 카테고리별 검색(제목, 본문, 제목+본문)\r\n- 게시물 페이징\r\n  - 이전/다음 버튼 추가\r\n- 토스트에디터 적용\r\n  - 글 쓰기\r\n  - 글 수정\r\n  - 상세보기\r\n\r\n```youtube\r\n-9Kz8OXs4b4\r\n```',1,8,4,0,0),
(12,'2021-02-05','2021-02-09','[JSTL] 날짜포맷 변경','##  1. 상단에 JSTL을 사용하기 위한 선언\r\n```jsp\r\n<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\"%>\r\n```\r\nJSTL은 라이브러리이기때문에 사용하기 위해 core를 추가한다.\r\n<br/>\r\n## 2. 날짜 포맷을 변경하기 위한 코드 추가\r\n```jsp\r\n<%@ taglib prefix=\"fmt\" uri=\"http://java.sun.com/jsp/jstl/fmt\"%>\r\n```\r\n이것까지 추가해야 날짜 포맷을 변경할 수 있다.\r\n<br/>\r\n## 3-1.  String 형태인 날짜를 Date 형태로 변환\r\n```jsp\r\n<fmt:parseDate value=\"${article.regDate}\" var=\"regDate\" pattern=\"yyyy-MM-dd HH:mm:ss\" />\r\n```\r\nString 상태에서 바로 변경할 수 없기때문에 우선 형변환을 시켜야한다.\r\n이미 Date형이라면 이 단계는 건너뛰어도된다.\r\nvalue에는 가져올 String 값을 넣고 pattern에는 현재 날짜형식을 넣는다.\r\n<br/>\r\n\r\n## 3-2. 원하는 날짜 포맷으로 변경\r\n```jsp\r\n<fmt:formatDate value=\"${regDate}\" pattern=\"MM.dd HH:mm\" />\r\n```\r\nvalue에 Date형으로 바꾼값을 넣고 pattern에 원하는 형식의 포맷을 넣으면 변경 완료\r\n<br/>\r\n',1,4,0,0,0),
(13,'2021-02-08','2021-02-09','[JSP 커뮤니티 일지 2] 디자인변경, 회원정보수정, 회원가입메일, 조회수, 댓글, 좋아요 기능','- 전체적으로 디자인 변경\r\n- 마이페이지에서 회원정보 수정\r\n- 회원가입시 메일 발송\r\n- 조회수\r\n- 임시비밀번호 사용시 경고바\r\n- 비밀번호 90일이상 사용시 변경 권유\r\n- 댓글 CRUD\r\n- 게시글에 좋아요, 싫어요 기능(로그인할때만 버튼보이게)\r\n\r\n```youtube\r\n05cBAUFB068\r\n```',1,8,0,0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `board` */

insert  into `board`(`boardId`,`regDate`,`updateDate`,`name`,`code`) values 
(4,'2020-12-21 12:16:10','2020-12-21 12:16:10','JAVA','java'),
(5,'2020-12-21 12:16:10','2020-12-21 12:16:10','SQL','sql'),
(6,'2020-12-23 10:26:02','2020-12-23 10:26:02','HTML/CSS','htmlCss'),
(7,'2020-12-23 10:27:25','2020-12-23 10:27:25','JAVASCRIPT','js'),
(8,'2021-01-20 23:42:24','2021-01-20 23:42:24','ETC','etc');

/*Table structure for table `ga4DataPagePath` */

DROP TABLE IF EXISTS `ga4DataPagePath`;

CREATE TABLE `ga4DataPagePath` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `pagePath` char(100) NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pagePath` (`pagePath`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ga4DataPagePath` */

insert  into `ga4DataPagePath`(`id`,`regDate`,`updateDate`,`pagePath`,`hit`) values 
(599,'2021-02-09 02:54:41','2021-02-09 02:54:41','/',271),
(600,'2021-02-09 02:54:41','2021-02-09 02:54:41','/search.html',127),
(601,'2021-02-09 02:54:41','2021-02-09 02:54:41','/index.html',112),
(602,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/list_sql_1.html',83),
(603,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/list_java_1.html',82),
(604,'2021-02-09 02:54:41','2021-02-09 02:54:41','/my/about.html',69),
(605,'2021-02-09 02:54:41','2021-02-09 02:54:41','/stat/index.html',69),
(606,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/list_htmlCss_1.html',29),
(607,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/list_study_1.html',29),
(608,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_5.html',26),
(609,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_3.html',23),
(610,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_6.html',20),
(611,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_2.html',19),
(612,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_1.html',17),
(613,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_4.html',16),
(614,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_9.html',15),
(615,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/list_js_1.html',15),
(616,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_7.html',14),
(617,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/list_free_1.html',9),
(618,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/list_notice_1.html',9),
(619,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_8.html',6),
(620,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_11.html',4),
(621,'2021-02-09 02:54:41','2021-02-09 02:54:41','/my/list_talk_1.html',4),
(622,'2021-02-09 02:54:41','2021-02-09 02:54:41','/search.html?dummy=sfsfdf',3),
(623,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/list_etc_1.html',2),
(624,'2021-02-09 02:54:41','2021-02-09 02:54:41','/index.html?sdfsdfsdf',2),
(625,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_10.html',1),
(626,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_3.html?dummy=sdfffdf',1),
(627,'2021-02-09 02:54:41','2021-02-09 02:54:41','/article/article_4.html?dummy=ughsfj234524432424324',1),
(628,'2021-02-09 02:54:41','2021-02-09 02:54:41','/index.html?dummy=dsfasdg',1),
(629,'2021-02-09 02:54:41','2021-02-09 02:54:41','/index.html?dummy=sgdsgdgdfgle',1),
(630,'2021-02-09 02:54:41','2021-02-09 02:54:41','/stat/',1);

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
(1,'2020-12-18','2020-12-18','admin','admin','Elming');

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

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `relTypeCode` char(20) NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `body` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relTypeCode_2` (`relTypeCode`,`relId`,`body`),
  KEY `relTypeCode` (`relTypeCode`,`body`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tag` */

insert  into `tag`(`id`,`regDate`,`updateDate`,`relTypeCode`,`relId`,`body`) values 
(1,'2021-01-13 22:32:51','2021-01-13 22:32:51','article',2,'JAVA'),
(2,'2021-01-13 22:32:51','2021-01-13 22:32:51','article',1,'SQL'),
(3,'2021-01-13 22:32:51','2021-01-13 22:32:51','article',1,'DB'),
(4,'2021-01-13 23:07:16','2021-01-13 23:07:16','article',3,'SQL'),
(5,'2021-01-13 23:07:16','2021-01-13 23:07:16','article',3,'DB'),
(6,'2021-01-13 23:07:28','2021-01-13 23:07:28','article',4,'SQL'),
(7,'2021-01-13 23:07:28','2021-01-13 23:07:28','article',4,'DB'),
(8,'2021-01-13 23:07:38','2021-01-13 23:07:38','article',5,'SQL'),
(9,'2021-01-13 23:07:38','2021-01-13 23:07:38','article',5,'DB'),
(10,'2021-01-13 23:09:21','2021-01-13 23:09:21','article',6,'CSS'),
(11,'2021-01-13 23:09:21','2021-01-13 23:09:21','article',6,'HTML'),
(12,'2021-01-13 23:09:21','2021-01-13 23:09:21','article',7,'JAVA');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
