/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.5.19 : Database - dbfound
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbfound` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dbfound`;

/*Table structure for table `fnd_branch` */

DROP TABLE IF EXISTS `fnd_branch`;

CREATE TABLE `fnd_branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_code` varchar(100) NOT NULL,
  `branch_name` varchar(200) NOT NULL,
  `enable_flag` varchar(1) DEFAULT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `branch_code` (`branch_code`),
  KEY `branch_name` (`branch_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `fnd_branch` */

insert  into `fnd_branch`(`branch_id`,`branch_code`,`branch_name`,`enable_flag`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values (1,'JSJ001','Java课程设计','Y',2,'2012-07-29',2,'2013-04-21'),(2,'JSJ002','C语言程序设计','Y',2,'2012-07-29',2,'2012-11-24'),(3,'JSJ003','数据库原理','Y',2,'2012-07-29',2,'2012-07-29'),(4,'JSJ004','计算机网络','Y',2,'2012-08-15',2,'2013-05-30'),(5,'JSJ005','计算机导论','Y',2,'2012-08-22',2,'2012-08-22'),(6,'JSJ006','计算机组成原理','Y',2,'2012-09-27',2,'2012-09-27');

/*Table structure for table `fnd_class` */

DROP TABLE IF EXISTS `fnd_class`;

CREATE TABLE `fnd_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_code` varchar(100) NOT NULL,
  `class_name` varchar(200) NOT NULL,
  `enable_flag` varchar(1) NOT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_code` (`class_code`),
  KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `fnd_class` */

insert  into `fnd_class`(`class_id`,`class_code`,`class_name`,`enable_flag`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values (1,'074202','07级网络工程二班','Y',2,'2012-05-08',21,'2012-09-24'),(2,'074201','07级网络工程一班','Y',2,'2012-05-22',21,'2012-09-25'),(3,'074001','07级计算机科学与技术一班','Y',2,'2012-08-21',2,'2012-08-21'),(4,'074401','07级软件工程一班','Y',21,'2012-09-22',21,'2012-09-22'),(5,'074002','07级计算机科学与技术二班','Y',21,'2012-09-22',21,'2012-09-22'),(6,'074402','07级软件工程二班','Y',21,'2012-09-22',2,'2013-05-30');

/*Table structure for table `fnd_course` */

DROP TABLE IF EXISTS `fnd_course`;

CREATE TABLE `fnd_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `enable_flag` varchar(1) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `NewIndex1` (`class_id`),
  KEY `NewIndex2` (`branch_id`),
  KEY `NewIndex3` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `fnd_course` */

insert  into `fnd_course`(`course_id`,`enable_flag`,`class_id`,`branch_id`,`teacher_id`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values (4,'Y',2,1,1,2,'2012-07-29',2,'2012-07-29'),(5,'Y',1,1,1,2,'2012-07-29',2,'2012-07-29'),(6,'Y',2,2,2,2,'2012-07-29',2,'2012-07-29'),(7,'Y',1,3,3,2,'2012-07-29',2,'2012-07-29'),(8,'Y',2,3,3,2,'2012-07-29',2,'2012-07-29'),(9,'Y',1,2,1,2,'2012-07-29',2,'2012-07-29'),(10,'Y',3,1,1,2,'2012-08-21',2,'2012-08-21'),(11,'Y',3,3,3,2,'2012-08-21',2,'2012-08-21'),(12,'Y',1,5,4,2,'2012-08-22',2,'2012-08-22'),(13,'Y',3,4,4,2,'2012-08-23',2,'2012-08-23'),(14,'Y',2,4,4,2,'2012-08-27',2,'2012-08-27'),(15,'Y',2,5,1,2,'2012-08-27',2,'2012-08-27'),(16,'Y',1,4,4,2,'2012-08-27',2,'2012-08-27'),(17,'Y',3,2,1,2,'2012-08-27',2,'2012-08-27'),(18,'Y',3,5,3,2,'2012-08-27',21,'2012-08-28'),(19,'Y',4,1,1,21,'2012-09-22',21,'2012-09-22'),(20,'Y',6,6,3,2,'2012-09-27',2,'2012-09-27'),(21,'Y',4,4,4,2,'2012-09-27',2,'2012-09-27'),(22,'Y',5,3,3,21,'2012-10-11',21,'2012-10-11');

/*Table structure for table `fnd_student` */

DROP TABLE IF EXISTS `fnd_student`;

CREATE TABLE `fnd_student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `student_code` varchar(100) NOT NULL,
  `student_name` varchar(200) NOT NULL,
  `telphone_num` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `enable_flag` char(1) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `class_id` (`student_code`),
  KEY `student_name` (`student_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `fnd_student` */

insert  into `fnd_student`(`student_id`,`class_id`,`student_code`,`student_name`,`telphone_num`,`email`,`enable_flag`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values (1,1,'07420207','小杨','12345678','213@163.com','Y',2,'2012-05-08',2,'2012-09-02'),(2,1,'07420206','小徐','123456789','123@123.com','Y',2,'2012-05-08',2,'2012-09-02'),(3,1,'07420205','小毛','12345678','213@163.com','Y',2,'2012-05-08',2,'2012-09-02'),(4,1,'ADMIN','测试学生1','18621598333','213@163.com','Y',2,'2012-05-17',2,'2013-06-04'),(5,2,'07420101','小明','18621598333','12321@123.com','Y',2,'2012-05-22',2,'2012-09-02'),(6,2,'07420102','小王','123213213','213@163.com','Y',2,'2012-07-07',2,'2012-09-25'),(7,2,'07420103','小军','18621598333','12321@123.com','Y',2,'2012-07-07',2,'2012-09-02'),(8,1,'07420221','小黄','18621598333','213@163.com','Y',2,'2012-07-28',2,'2012-09-02'),(9,2,'07420104','小海','18621598333','12321@123.com','Y',2,'2012-07-28',2,'2012-09-02'),(10,2,'07420105','小朱','18621598333','12321@123.com','Y',2,'2012-07-28',2,'2012-09-02'),(11,2,'07420106','小杨','18621598333','12321@123.com','Y',2,'2012-07-28',2,'2012-09-24'),(12,1,'07420201','小郑','18621598333','213@163.com','Y',2,'2012-07-29',2,'2013-06-04'),(13,1,'07420203','张三','18621598333','213@163.com','Y',2,'2012-07-29',2,'2012-09-02'),(14,1,'07420202','小曾','18621598333','213@163.com','Y',2,'2012-07-29',2,'2012-09-02'),(15,1,'07420204','小牛','18621598333','213@163.com','Y',2,'2012-07-29',2,'2012-09-02'),(16,3,'07400101','小王','123456789','hello@163.com','Y',2,'2012-08-23',2,'2013-06-08'),(17,3,'07400102','小明','123456789','123@sina.com','Y',21,'2012-08-30',2,'2012-09-02'),(18,3,'07400103','小胡','123456789','12323@sina.com','Y',2,'2012-08-30',2,'2012-09-02'),(19,3,'07400104','小马','123456789','123@sina.com','Y',2,'2012-08-30',2,'2012-09-02'),(20,4,'07440101','小段','123213213','123@123.com','Y',21,'2012-09-22',21,'2012-09-22'),(21,6,'07440201','小毛','123213213','huang@163.com','Y',2,'2012-09-27',2,'2012-09-27');

/*Table structure for table `fnd_teacher` */

DROP TABLE IF EXISTS `fnd_teacher`;

CREATE TABLE `fnd_teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_code` varchar(100) NOT NULL,
  `teacher_name` varchar(200) NOT NULL,
  `telphone_num` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `enable_flag` char(1) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `teacher_code` (`teacher_code`),
  KEY `teacher_name` (`teacher_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `fnd_teacher` */

insert  into `fnd_teacher`(`teacher_id`,`teacher_code`,`teacher_name`,`telphone_num`,`email`,`enable_flag`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values (1,'10000','黄炯','13888889999','nfwork@sina.com','Y',2,'2012-05-08',2,'2013-06-04'),(2,'ADMIN','测试老师','12334345454','yangyong@sina.com','Y',2,'2012-05-17',21,'2012-09-22'),(3,'10010','杨永','13888889999','yangyong@sina.com','Y',2,'2012-07-07',2,'2013-08-14'),(4,'10020','尹小军','12334345454','yangyong@sina.com','Y',2,'2012-07-27',21,'2012-10-16');

/*Table structure for table `gc_employee` */

DROP TABLE IF EXISTS `gc_employee`;

CREATE TABLE `gc_employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(100) NOT NULL,
  `employee_name` varchar(200) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_code` (`employee_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `gc_employee` */

insert  into `gc_employee`(`employee_id`,`employee_code`,`employee_name`) values (1,'HJ','黄炯'),(2,'YXJ','尹小军'),(3,'YFQ','杨凤娇'),(4,'YSM','尹双枚'),(5,'DSF','dsf');

/*Table structure for table `gc_project` */

DROP TABLE IF EXISTS `gc_project`;

CREATE TABLE `gc_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(100) NOT NULL,
  `project_name` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `branch_code` (`project_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `gc_project` */

insert  into `gc_project`(`project_id`,`project_code`,`project_name`,`price`) values (1,'YJHY','怡景花园工程',100),(2,'NNN','www',455);

/*Table structure for table `gc_work_record` */

DROP TABLE IF EXISTS `gc_work_record`;

CREATE TABLE `gc_work_record` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `work_date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  `settlement_flag` char(1) DEFAULT NULL,
  `settlement_date` date DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;

/*Data for the table `gc_work_record` */

insert  into `gc_work_record`(`work_id`,`employee_id`,`work_date`,`project_id`,`settlement_flag`,`settlement_date`) values (5,1,'2013-06-01',1,'Y','2013-06-26'),(6,1,'2013-06-02',1,'Y','2013-06-26'),(8,1,'2013-06-04',1,'Y','2013-06-26'),(11,1,'2013-06-07',1,'Y','2013-06-26'),(12,1,'2013-06-08',1,'Y','2013-06-26'),(13,1,'2013-06-09',1,'Y','2013-06-26'),(14,1,'2013-06-10',1,'Y','2013-06-26'),(15,2,'2013-06-03',1,'Y','2013-06-26'),(16,2,'2013-06-04',1,'Y','2013-06-26'),(17,2,'2013-06-05',1,'Y','2013-06-26'),(18,2,'2013-06-06',1,'Y','2013-06-26'),(19,2,'2013-06-07',1,'Y','2013-06-26'),(20,2,'2013-06-10',1,'Y','2013-06-26'),(21,2,'2013-06-11',1,'Y','2013-06-26'),(22,1,'2013-06-26',1,'Y','2013-06-26'),(25,1,'2013-06-14',1,'Y','2013-06-26'),(27,1,'2013-06-05',1,'Y','2013-06-26'),(28,1,'2013-05-04',1,'Y','2013-06-26'),(29,1,'2013-06-12',1,'Y','2013-06-26'),(39,3,'2013-06-08',1,'Y','2013-06-26'),(40,3,'2013-06-09',1,'Y','2013-06-26'),(41,3,'2013-06-10',1,'Y','2013-06-26'),(42,3,'2013-06-11',1,'Y','2013-06-26'),(43,3,'2013-06-12',1,'Y','2013-06-26'),(44,3,'2013-06-13',1,'Y','2013-06-26'),(45,3,'2013-06-14',1,'Y','2013-06-26'),(46,3,'2013-06-15',1,'Y','2013-06-26'),(47,3,'2013-06-16',1,'Y','2013-06-26'),(48,3,'2013-06-17',1,'Y','2013-06-26'),(49,3,'2013-06-18',1,'Y','2013-06-26'),(50,3,'2013-06-19',1,'Y','2013-06-26'),(51,4,'2013-06-13',1,'Y','2013-06-26'),(52,4,'2013-06-14',1,'Y','2013-06-26'),(53,4,'2013-06-15',1,'Y','2013-06-26'),(54,4,'2013-06-16',1,'Y','2013-06-26'),(55,4,'2013-06-17',1,'Y','2013-06-26'),(56,4,'2013-06-18',1,'Y','2013-06-26'),(57,4,'2013-06-19',1,'Y','2013-06-26'),(58,4,'2013-06-20',1,'Y','2013-06-26'),(62,2,'2013-06-09',1,NULL,NULL),(64,2,'2013-06-08',1,NULL,NULL),(163,4,'2013-07-01',1,NULL,NULL),(164,4,'2013-07-02',1,NULL,NULL),(165,4,'2013-07-03',1,NULL,NULL),(166,4,'2013-07-04',1,NULL,NULL),(167,4,'2013-07-05',1,NULL,NULL),(168,4,'2013-07-06',1,NULL,NULL),(172,1,'2013-04-23',1,NULL,NULL),(173,1,'2013-04-24',1,NULL,NULL),(174,1,'2013-04-25',1,NULL,NULL),(175,1,'2013-04-30',1,NULL,NULL),(176,1,'2013-04-11',1,NULL,NULL),(178,1,'2013-04-01',1,NULL,NULL),(180,1,'2013-04-03',1,NULL,NULL),(181,1,'2013-04-04',1,NULL,NULL),(182,1,'2013-04-08',1,NULL,NULL),(184,4,'2013-12-10',1,NULL,NULL),(185,4,'2013-12-11',1,NULL,NULL),(186,4,'2013-12-12',1,NULL,NULL),(187,4,'2013-12-13',1,NULL,NULL),(188,4,'2013-12-16',1,NULL,NULL),(189,4,'2013-12-17',1,NULL,NULL),(190,4,'2013-12-18',1,NULL,NULL),(191,4,'2013-12-19',1,NULL,NULL),(192,4,'2013-12-20',1,NULL,NULL),(193,4,'2013-12-23',1,NULL,NULL),(194,4,'2013-12-24',1,NULL,NULL),(195,4,'2013-12-25',1,NULL,NULL),(196,4,'2013-12-26',1,NULL,NULL),(197,4,'2013-12-27',1,NULL,NULL),(198,4,'2013-12-06',1,NULL,NULL),(199,4,'2013-12-05',1,NULL,NULL),(200,4,'2013-12-04',1,NULL,NULL),(201,4,'2013-10-09',1,NULL,NULL),(203,4,'2013-12-30',1,NULL,NULL),(204,4,'2013-06-30',1,NULL,NULL),(219,3,'2013-04-09',1,NULL,NULL),(220,3,'2013-04-10',1,NULL,NULL),(221,3,'2013-04-11',1,NULL,NULL),(222,3,'2013-04-12',1,NULL,NULL),(223,3,'2013-04-13',1,NULL,NULL),(224,3,'2013-04-06',1,NULL,NULL),(225,3,'2013-04-05',1,NULL,NULL),(226,3,'2013-04-04',1,NULL,NULL),(227,3,'2013-04-03',1,NULL,NULL),(228,3,'2013-04-02',1,NULL,NULL),(229,3,'2013-04-01',1,NULL,NULL),(230,3,'2013-04-07',1,NULL,NULL),(231,3,'2013-04-08',1,NULL,NULL),(232,3,'2013-04-14',1,NULL,NULL),(233,3,'2013-04-15',1,NULL,NULL),(234,3,'2013-07-17',1,NULL,NULL),(235,3,'2013-07-18',1,NULL,NULL),(236,3,'2013-07-23',1,NULL,NULL),(237,3,'2013-07-22',1,NULL,NULL),(238,3,'2013-08-14',1,NULL,NULL),(239,3,'2013-08-15',1,NULL,NULL),(240,3,'2013-08-30',1,NULL,NULL),(241,4,'2013-08-14',1,NULL,NULL),(242,4,'2013-08-23',1,NULL,NULL),(253,1,'2013-06-06',1,NULL,NULL),(254,1,'2013-06-11',1,NULL,NULL),(255,1,'2013-06-03',1,NULL,NULL),(258,1,'2013-06-13',1,NULL,NULL),(259,1,'2013-07-27',1,NULL,NULL),(260,2,'2013-07-27',1,NULL,NULL),(261,3,'2013-07-27',1,NULL,NULL),(262,4,'2013-07-27',1,NULL,NULL),(263,2,'2013-07-28',1,NULL,NULL),(264,3,'2013-07-28',1,NULL,NULL),(265,4,'2013-07-28',1,NULL,NULL),(266,1,'2013-07-28',1,NULL,NULL),(267,3,'2013-08-16',1,NULL,NULL),(268,3,'2013-08-17',1,NULL,NULL),(277,1,'2013-09-06',1,NULL,NULL),(297,1,'2014-05-29',1,NULL,NULL),(308,1,'2014-06-08',1,NULL,NULL),(310,1,'2014-06-16',1,NULL,NULL),(312,1,'2014-06-18',1,NULL,NULL),(313,1,'2014-06-22',1,NULL,NULL),(316,1,'2014-06-02',1,NULL,NULL),(318,1,'2014-06-10',1,NULL,NULL),(319,1,'2014-06-24',1,NULL,NULL),(320,1,'2014-06-30',1,NULL,NULL),(321,1,'2014-06-26',1,NULL,NULL),(323,1,'2014-06-12',1,NULL,NULL),(324,1,'2014-06-06',1,NULL,NULL),(325,1,'2014-06-04',1,NULL,NULL),(326,1,'2014-06-20',1,NULL,NULL),(327,1,'2014-06-14',1,NULL,NULL),(328,1,'2014-06-28',1,NULL,NULL),(339,3,'2014-06-11',1,NULL,NULL),(340,3,'2014-06-19',1,NULL,NULL),(341,3,'2014-06-18',1,NULL,NULL),(342,3,'2014-06-25',1,NULL,NULL),(345,3,'2014-06-26',1,NULL,NULL),(346,3,'2014-06-20',1,NULL,NULL),(347,3,'2012-03-14',1,NULL,NULL),(348,3,'2012-03-15',1,NULL,NULL),(349,3,'2012-03-16',1,NULL,NULL),(350,3,'2012-03-24',1,NULL,NULL),(351,3,'2012-03-28',1,NULL,NULL),(352,3,'2012-03-20',1,NULL,NULL),(354,3,'2012-03-30',1,NULL,NULL),(355,3,'2012-03-23',1,NULL,NULL),(357,5,'2014-08-06',2,NULL,NULL),(358,5,'2014-08-07',2,NULL,NULL),(359,5,'2014-08-08',2,NULL,NULL),(360,5,'2014-08-13',2,NULL,NULL);

/*Table structure for table `job_headers` */

DROP TABLE IF EXISTS `job_headers`;

CREATE TABLE `job_headers` (
  `header_id` char(24) NOT NULL,
  `class_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `end_time` date NOT NULL,
  `status` varchar(10) NOT NULL COMMENT '状态',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`header_id`),
  KEY `tile` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `job_headers` */

insert  into `job_headers`(`header_id`,`class_id`,`course_id`,`teacher_id`,`end_time`,`status`,`title`,`description`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values ('23CNJT5SGVQSDXA6AQWTTR98',2,6,2,'2014-06-27','END','111','1111',2,'2014-06-26',2,'2014-06-26'),('6L1AUD7HO9P7XK9SPDCB2NDM',2,6,2,'2012-09-21','END','c语言作业三','c语言作业三，练习题1、2、3、4、5、6',2,'2012-09-01',2,'2012-09-01'),('6W277M94DI9GNAL5132C4VNI',2,6,2,'2012-12-18','END','testq','testq',2,'2012-12-17',2,'2012-12-17'),('746SBK6A6IYTHCGDZL5Y7802',1,5,1,'2012-08-24','DOWN','Java课程设计 练习题一','Java课程设计 练习题一 完成1、2、3、7、8题，请在周五之前完成。',1,'2012-08-20',1,'2012-08-20'),('8VQ7YJTF2KF0NR35F9FB6ATX',2,6,2,'2014-10-22','NEW','32323','eweeeeee',2,'2014-10-08',2,'2014-10-08'),('AYV97UZL07SED3FBOIPAQ3WB',2,6,2,'2013-05-24','DOWN','sadsadsa','asdasdas12描述:作业题目:\n',2,'2013-05-30',2,'2013-06-24'),('DYAB8KAAPC2V5K6QAT1UPFEL',2,6,2,'2014-07-16','CHECK','111',NULL,2,'2014-07-15',2,'2014-08-04'),('EGI1BF81XF2Q34AFV9XX1PVK',2,6,2,'2013-05-30','END','test','test123 123 123 123',2,'2013-05-31',2,'2013-06-06'),('EK2Q9IYKR0EJ3UT87Q3LQD54',2,4,1,'2012-11-30','NEW','Java课程设计','Java课程设计',1,'2012-11-24',1,'2013-04-29'),('HDNJWDRZNJI1314AZ2Y0IOEH',2,6,2,'2013-04-18','END','test0002','234324234',2,'2013-04-29',2,'2013-04-29'),('HLXEZZWQL5IQV1J3S9MA19CB',2,6,2,'2012-08-17','END','Java课后系统一','Java课后系统一 1、3、4、6、7、8题，请按时完成。',2,'2012-08-08',2,'2012-08-08'),('HTBVO5F7VX71AK51NKUDB6VX',1,9,1,'2012-08-17','END','c语言 课后系统一','c语言 课后系统一',1,'2012-08-08',1,'2012-08-08'),('J42ZC7XR85ZU8ODX325RRTCE',2,6,2,'2012-08-09','END','C语言程序设计练习题二','C语言程序设计练习题二 1、2、3、5、6题 ，请按时完成。\r\n东方网9月29日消息：记者从外交部获悉，昨天，以“维护政治基础，把握发展方向”为主题的中日邦交正常化40周年座谈会在北京举行。外交部部长助理乐玉成在讲话中指出，日本不要再幻想霸占钓鱼岛，派人到中国来解释几句就万事大吉，如果继续一意孤行，中日关系这条大船就可能像“泰坦尼克”号一样触礁沉没。',2,'2012-08-08',2,'2012-09-29'),('KJ2RECRHMCGQI1S7KC90FO5J',2,6,2,'2012-08-18','END','\'测试引号\"','测试引号是否显示正常\'\'\'\'\"\"\"/\"/\"dddd\'\'\'\'\'\',,,,777777n/////',2,'2012-08-15',2,'2012-09-27'),('LR6CLROGCRTS5I89XR8LQYJA',2,6,2,'2013-06-19','END','12','12321321321312sdfdsfdsf',2,'2013-06-05',2,'2013-06-06'),('NH7NGCC7441061F336TWI4FH',2,6,2,'2013-10-31','END','测试',NULL,2,'2013-10-18',2,'2013-10-18'),('NNRXIJ577ZZHRYDG9V6M1EHP',1,9,1,'2012-08-31','END','Java课后系统二','Java课后系统二 1、3、4、5、8、9题',1,'2012-08-24',1,'2012-08-24'),('NRVQYY8V8PJZGTCMH4M176CK',1,9,1,'2012-08-24','DOWN','C语言作业联系题二','C语言作业联系题二，完成1、2、3、6、7题',1,'2012-08-17',1,'2012-08-17'),('OW3JXYY9ZGI5I9C7VSS2HT6S',1,7,3,'2012-08-17','NEW','数据库原理课后系统一','数据库原理课后系统一 1、2、4、5、15、18题，请按时完成。',9,'2012-08-08',9,'2012-08-08'),('PKQBL6Y4L0SXXVD116L71DJP',4,19,1,'2013-06-11','NEW','test001','hello kity',1,'2013-06-03',1,'2013-06-03'),('SD6OGB1WJFQHQP2MVR35GO7U',2,6,2,'2013-04-17','END','123','测试作业',2,'2013-04-09',2,'2013-04-10'),('UO80AC6RPU64DF6C7KUIVQOA',2,8,3,'2012-08-17','DOWN','数据库原理课后练习一','数据库原理课后练习一 1、2、3、5、6，请按时完成。',9,'2012-08-08',9,'2012-08-08'),('VBBJ88XTT92UUG4X0M0A5X2N',3,13,4,'2012-08-31','NEW','计算机网络课后练习题一','计算机网络课后练习题一 1、2、3、4、5题。',11,'2012-08-23',11,'2012-08-23'),('WAZNJYUD0YYYY9IOR918YFQF',1,9,1,'2012-10-05','DOWN','hello kity','hello kity',1,'2012-09-21',1,'2012-09-21'),('X676YPIAZ4RKVQTNON2TDAO6',2,6,2,'2013-04-26','DOWN','新增作业测试','新增作业测试 hello kity',2,'2013-04-20',2,'2013-04-20'),('XNGIA1T22VB0OK1HTGQBVW7W',2,6,2,'2013-10-31','END','hello kity',NULL,2,'2013-10-22',2,'2013-10-22'),('XSF060BUDZNTYVAU1VALQ89S',2,6,2,'2014-07-15','END','111','11',2,'2014-07-08',2,'2014-07-08'),('ZSQS6SUD9HDZYVKYNLF5HCTP',1,12,4,'2012-08-23','DOWN','JSJ005-计算机导论 习题一','JSJ005-计算机导论 习题一 1、2、3、4',11,'2012-08-22',11,'2012-08-22');

/*Table structure for table `job_lines` */

DROP TABLE IF EXISTS `job_lines`;

CREATE TABLE `job_lines` (
  `line_id` char(24) NOT NULL,
  `header_id` char(24) NOT NULL COMMENT '头id',
  `student_id` int(11) DEFAULT NULL COMMENT '学生id',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `score` float DEFAULT NULL COMMENT '分数',
  `teacher_comment` varchar(2000) DEFAULT NULL COMMENT '老师评语',
  `grade` varchar(200) DEFAULT NULL COMMENT '等级',
  `status` varchar(100) DEFAULT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`line_id`),
  UNIQUE KEY `student_id` (`student_id`,`header_id`),
  KEY `header_id` (`header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `job_lines` */

insert  into `job_lines`(`line_id`,`header_id`,`student_id`,`description`,`score`,`teacher_comment`,`grade`,`status`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values ('0POBIYQQO31WGHEEL12C1HGP','746SBK6A6IYTHCGDZL5Y7802',4,'123',NULL,NULL,NULL,'SUBMIT',2,'2012-08-21',2,'2012-08-21'),('11DQAQYW9F7ETBXY9ZDR3NF6','6W277M94DI9GNAL5132C4VNI',5,NULL,NULL,NULL,NULL,'NEW',7,'2013-05-30',7,'2013-05-30'),('3A9R9CSVJHHA1PG4ACRU1YZR','ZSQS6SUD9HDZYVKYNLF5HCTP',1,NULL,NULL,NULL,NULL,'NEW',4,'2012-09-01',4,'2012-09-01'),('3I6AP58IDFALNQA6SSRJBIVC','NNRXIJ577ZZHRYDG9V6M1EHP',13,NULL,NULL,NULL,NULL,'NEW',17,'2012-09-21',17,'2012-09-21'),('4LT0BNTBBCXCF6F92JIGR21N','UO80AC6RPU64DF6C7KUIVQOA',5,'已经完成，请验收。时间刚刚好，哈哈哈。。。。。',NULL,NULL,NULL,'SUBMIT',7,'2012-08-08',7,'2012-08-08'),('50PDF31TUPKG6PNI9KY6HH9L','HLXEZZWQL5IQV1J3S9MA19CB',6,NULL,NULL,NULL,NULL,'NEW',8,'2012-09-01',8,'2012-09-01'),('59GVTWUY21VY0XLFG5IOSPFF','ZSQS6SUD9HDZYVKYNLF5HCTP',4,'123',NULL,NULL,NULL,'SUBMIT',2,'2012-08-23',2,'2012-08-23'),('78EDRBZEWBAOE764XQU62C6A','WAZNJYUD0YYYY9IOR918YFQF',13,NULL,NULL,NULL,NULL,'NEW',17,'2012-09-21',17,'2012-09-21'),('7AKWEZIFDIN89W0N8Q911JDL','HLXEZZWQL5IQV1J3S9MA19CB',7,NULL,NULL,NULL,NULL,'NEW',10,'2012-09-01',10,'2012-09-01'),('7FZ9Q2G5E1BD3WXSVXD5MF0V','NNRXIJ577ZZHRYDG9V6M1EHP',4,'已经完成了',77,'一塌糊涂','合格','END',2,'2012-09-01',1,'2013-02-27'),('8FFFJLICRL2ZO9SIQM6120EU','NRVQYY8V8PJZGTCMH4M176CK',3,NULL,NULL,NULL,NULL,'NEW',5,'2012-08-20',5,'2012-08-20'),('8I5Y6E1R5L5NKYFPEP0PW2JI','6L1AUD7HO9P7XK9SPDCB2NDM',7,NULL,NULL,NULL,NULL,'NEW',10,'2012-09-01',10,'2012-09-01'),('8J50NF7CMJXTDNJ27DLWHIEH','SD6OGB1WJFQHQP2MVR35GO7U',5,NULL,NULL,NULL,NULL,'NEW',7,'2013-05-30',7,'2013-05-30'),('BKQAK25RZ6WTT0MT8T3213LQ','NNRXIJ577ZZHRYDG9V6M1EHP',1,NULL,NULL,NULL,NULL,'NEW',4,'2012-09-01',4,'2012-09-01'),('C10K6Y5HP2XNGW7HAO1ANSKI','WAZNJYUD0YYYY9IOR918YFQF',12,'yes',NULL,NULL,NULL,'SUBMIT',16,'2012-09-21',16,'2012-09-21'),('DH1IL3JF1WFFLP7GIAEFN09J','UO80AC6RPU64DF6C7KUIVQOA',6,NULL,NULL,NULL,NULL,'NEW',8,'2012-09-01',8,'2012-09-01'),('EG2IXYYH3AVHBLEXD7GAJN5R','HLXEZZWQL5IQV1J3S9MA19CB',10,'已经完成了，请测试',80,'不错，蛮好的，继续加油','良好','END',14,'2012-08-08',2,'2012-08-27'),('EKVHIS6ABAD6IOZ04AQQL3ZU','NNRXIJ577ZZHRYDG9V6M1EHP',12,'wancheng',89,'继续加油','良好','END',16,'2012-09-21',1,'2013-02-27'),('GBJ8FL97WE5JO95EO0K56R5E','746SBK6A6IYTHCGDZL5Y7802',3,'已经做好了，请查收',NULL,NULL,NULL,'SUBMIT',5,'2012-08-20',5,'2012-08-20'),('HEIIPX1GSCJZ6CK6IQ5IDXNM','WAZNJYUD0YYYY9IOR918YFQF',3,NULL,NULL,NULL,NULL,'NEW',5,'2012-10-17',5,'2012-10-17'),('HPOSPGLAMLQA70HQK08MNXR0','ZSQS6SUD9HDZYVKYNLF5HCTP',8,'好了啊',NULL,NULL,NULL,'SUBMIT',12,'2012-09-01',12,'2012-09-01'),('HR4PCHJOEMVPFTFS7C5FVT4O','NRVQYY8V8PJZGTCMH4M176CK',1,NULL,NULL,NULL,NULL,'NEW',4,'2012-09-01',4,'2012-09-01'),('HZKIV5H3COIXTETYILNGEU2E','HTBVO5F7VX71AK51NKUDB6VX',8,'已经完成了，请验收',85,'嗯，也不错','良好','END',12,'2012-08-08',1,'2012-08-13'),('I9MUCV1WOWZX1VQA94FJ9OVI','NRVQYY8V8PJZGTCMH4M176CK',13,NULL,NULL,NULL,NULL,'NEW',17,'2012-09-21',17,'2012-09-21'),('ISRWDUSCCRAQYXBMTTJVD5K8','ZSQS6SUD9HDZYVKYNLF5HCTP',13,NULL,NULL,NULL,NULL,'NEW',17,'2012-09-21',17,'2012-09-21'),('IYF5ZW3CBWNS4QO1F4NE2S8M','746SBK6A6IYTHCGDZL5Y7802',8,'ok啊',NULL,NULL,NULL,'SUBMIT',12,'2012-09-01',12,'2012-09-01'),('JIRLT8RVBEL9XY88TQFTW5F6','HLXEZZWQL5IQV1J3S9MA19CB',5,'已经完成，请验收',96,'非常好','优秀','END',7,'2012-08-08',2,'2012-08-27'),('JPNDSL8ARUKNO4KPMW1VRG7G','X676YPIAZ4RKVQTNON2TDAO6',5,NULL,NULL,NULL,NULL,'NEW',7,'2013-05-30',7,'2013-05-30'),('K2B7MHV57MSXMJIRYBFGY7RR','NNRXIJ577ZZHRYDG9V6M1EHP',3,'已经完成',87,NULL,'良好','END',5,'2012-10-17',1,'2012-10-29'),('LJDA087KCZDONFSJDDFHY3VH','746SBK6A6IYTHCGDZL5Y7802',12,'haole',NULL,NULL,NULL,'SUBMIT',16,'2012-08-23',16,'2012-08-23'),('LZK5D7MKMOUQX4FDGAYCP255','HTBVO5F7VX71AK51NKUDB6VX',3,NULL,NULL,NULL,NULL,'NEW',5,'2012-08-13',5,'2012-08-13'),('MC2LFPDKCRZQGYF6LWMBXFNO','HTBVO5F7VX71AK51NKUDB6VX',12,'已经做好了，请老师查看。谢谢',100,'太漂亮了，加油','优秀','END',16,'2012-08-09',1,'2012-08-13'),('MYMOQH98CB6IHMW19BOHWRWY','ZSQS6SUD9HDZYVKYNLF5HCTP',12,'haole',NULL,NULL,NULL,'SUBMIT',16,'2012-08-23',16,'2012-08-23'),('O2INGU7D9YMCYULQQ4NMH2TY','NRVQYY8V8PJZGTCMH4M176CK',4,'123',NULL,NULL,NULL,'SUBMIT',2,'2012-08-18',2,'2012-08-18'),('OM1AM8Z930JTTIN86J7L8ZG1','HTBVO5F7VX71AK51NKUDB6VX',1,NULL,NULL,NULL,NULL,'NEW',4,'2012-09-01',4,'2012-09-01'),('OOOW1YATNIENR6ZZMZWL9IHF','WAZNJYUD0YYYY9IOR918YFQF',8,'没有问题了啊',NULL,NULL,NULL,'SUBMIT',12,'2012-10-29',12,'2012-10-29'),('PRUIC7HGJ0H00MDPQYBRVF4I','NRVQYY8V8PJZGTCMH4M176CK',12,'ok',NULL,NULL,NULL,'SUBMIT',16,'2012-08-23',16,'2012-08-23'),('PXABL2S1CXCIHO6JIVIODWK9','UO80AC6RPU64DF6C7KUIVQOA',7,NULL,NULL,NULL,NULL,'NEW',10,'2012-09-01',10,'2012-09-01'),('QRM215VS9WOSF56Y0JG9UNC2','J42ZC7XR85ZU8ODX325RRTCE',5,NULL,NULL,NULL,NULL,'NEW',7,'2013-05-30',7,'2013-05-30'),('RR67IWIZ38W8RLVGEYSEALPK','6L1AUD7HO9P7XK9SPDCB2NDM',5,NULL,NULL,NULL,NULL,'NEW',7,'2012-09-27',7,'2012-09-27'),('U5OTVO71K8ZCKES8BO91Y78Z','KJ2RECRHMCGQI1S7KC90FO5J',5,NULL,NULL,NULL,NULL,'NEW',7,'2013-05-30',7,'2013-05-30'),('VKCVEFHSY8KITBUSNCTHJB1T','746SBK6A6IYTHCGDZL5Y7802',1,NULL,NULL,NULL,NULL,'NEW',4,'2012-09-01',4,'2012-09-01'),('VQPH0RXULA7S1NLKP6F12ATI','HTBVO5F7VX71AK51NKUDB6VX',4,NULL,NULL,NULL,NULL,'NEW',2,'2012-08-08',2,'2012-08-08'),('W7W233CL05ZLUSGPK1KC6OQQ','NNRXIJ577ZZHRYDG9V6M1EHP',8,'好了',88.5,'嗯，不错','良好','END',12,'2012-10-29',1,'2013-02-27'),('W8K6O9GQ8BBTZ3Z804NKUJEE','HTBVO5F7VX71AK51NKUDB6VX',13,NULL,NULL,NULL,NULL,'NEW',17,'2012-09-21',17,'2012-09-21'),('WCJB3N797CU999YSIAFJH1L4','ZSQS6SUD9HDZYVKYNLF5HCTP',3,'hjhg',NULL,NULL,NULL,'SUBMIT',5,'2012-10-17',5,'2012-10-17'),('XP4NUZEYB55BWKZWX2QZEAUR','HDNJWDRZNJI1314AZ2Y0IOEH',5,NULL,NULL,NULL,NULL,'NEW',7,'2013-05-30',7,'2013-05-30'),('XXZYD40LA2H5CCNX39CEBF9B','6L1AUD7HO9P7XK9SPDCB2NDM',6,NULL,NULL,NULL,NULL,'NEW',8,'2012-09-01',8,'2012-09-01'),('YRJ95HHOFS65CV9L3IE4Y6EW','NRVQYY8V8PJZGTCMH4M176CK',8,'已经完成，快吧。',NULL,NULL,NULL,'SUBMIT',12,'2012-08-17',12,'2012-08-17'),('Z9X5SZ7RH3EIGV3D6PLXS3FQ','WAZNJYUD0YYYY9IOR918YFQF',4,'123',NULL,NULL,NULL,'SUBMIT',2,'2012-09-21',2,'2012-09-21'),('ZESVPPOYL2D2T0G8F1NWVGUD','746SBK6A6IYTHCGDZL5Y7802',13,NULL,NULL,NULL,NULL,'NEW',17,'2012-09-21',17,'2012-09-21');

/*Table structure for table `sys_access_control` */

DROP TABLE IF EXISTS `sys_access_control`;

CREATE TABLE `sys_access_control` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `enable_flag` char(1) NOT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`ac_id`),
  KEY `url` (`url`(255))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `sys_access_control` */

insert  into `sys_access_control`(`ac_id`,`url`,`enable_flag`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values (1,'modules/sys/function.jsp','F',1,'2012-01-22',2,'2012-03-24'),(2,'modules/sys/user.jsp','F',2,'2012-03-05',2,'2012-03-24'),(4,'main.jsp','S',2,'2012-03-05',2,'2012-03-24'),(5,'left.jsp','S',2,'2012-03-05',2,'2013-06-25'),(6,'modules/sys/accessControl.jsp','F',2,'2012-03-05',2,'2012-03-24'),(7,'modules/sys/module.jsp','F',2,'2012-03-05',2,'2012-03-24'),(8,'modules/sys/role.jsp','F',2,'2012-03-05',2,'2012-03-24'),(9,'modules/sys/power.jsp','F',2,'2012-03-05',2,'2012-03-24'),(10,'system.jsp','F',2,'2012-03-21',2,'2012-08-16'),(12,'modules/sys/function.query','F',2,'2012-04-26',2,'2012-04-26'),(13,'modules/fnd/teacher.jsp','F',2,'2012-05-08',2,'2012-05-08'),(15,'modules/fnd/class.jsp','F',2,'2012-05-08',2,'2012-05-08'),(16,'modules/fnd/student.jsp','F',2,'2012-05-08',2,'2012-05-08'),(17,'modules/job/jobManage.jsp','F',2,'2012-05-09',2,'2012-05-09'),(18,'modules/job/newJob.jsp','F',2,'2012-05-09',2,'2012-05-09'),(19,'modules/job/myJob.jsp','F',2,'2012-05-10',2,'2012-05-10'),(20,'modules/job/myHistoryJob.jsp','F',2,'2012-05-17',2,'2012-05-17'),(21,'modules/job/jobQuery.jsp','F',2,'2012-05-22',2,'2012-05-22'),(22,'modules/job/showCheckedJob.jsp','F',2,'2012-07-07',2,'2012-07-07'),(23,'modules/job/showMyJob.jsp','F',2,'2012-07-07',2,'2012-07-07'),(24,'uploadShow.jsp','S',2,'2012-07-07',2,'2012-07-07'),(25,'modules/job/updateMyJob.jsp','F',2,'2012-07-07',2,'2012-07-07'),(26,'modules/job/showJob.jsp','F',2,'2012-07-07',2,'2012-07-07'),(27,'modules/job/updateJob.jsp','F',2,'2012-07-07',2,'2012-07-07'),(28,'modules/job/myJobQuery.jsp','F',2,'2012-07-19',2,'2012-07-19'),(29,'modules/cos/courseQuery.jsp','F',2,'2012-07-30',2,'2012-07-30'),(30,'modules/cos/course.jsp','F',2,'2012-07-30',2,'2012-07-30'),(31,'cos/course.query','F',2,'2012-08-08',2,'2012-09-28'),(32,'sys/power.query','F',2,'2012-08-08',2,'2012-08-08'),(33,'sys/accessControl.query','F',2,'2012-08-08',2,'2012-08-08'),(34,'sys/role.query','F',2,'2012-08-08',2,'2012-08-08'),(35,'upload.query','S',2,'2012-08-08',2,'2012-08-08'),(36,'sys/function.query','F',2,'2012-08-08',2,'2012-08-08'),(37,'sys/module.query','F',2,'2012-08-08',2,'2012-08-08'),(38,'sys/user.query','F',2,'2012-08-08',2,'2012-08-08'),(39,'download.jsp','S',2,'2012-08-09',2,'2012-08-09'),(40,'modules/sys/pagerAssign.jsp','F',2,'2012-08-15',2,'2012-08-15'),(41,'functionLoad.query!load','S',2,'2012-08-17',2,'2012-08-17'),(42,'modules/fnd/branch.jsp','F',2,'2012-08-18',2,'2012-08-18'),(43,'index.jsp','S',2,'2013-07-26',2,'2013-07-26');

/*Table structure for table `sys_code` */

DROP TABLE IF EXISTS `sys_code`;

CREATE TABLE `sys_code` (
  `code_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(200) NOT NULL,
  `code_value` varchar(400) NOT NULL,
  `code_name` varchar(400) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `sys_code` */

insert  into `sys_code`(`code_id`,`code`,`code_value`,`code_name`,`priority`) values (1,'JOB_STATUS','NEW','新建',10),(2,'JOB_STATUS','DOWN','已布置',20),(3,'JOB_STATUS','CHECK','审批中',30),(4,'JOB_STATUS','END','完成',40),(5,'JOB_LINE_STATUS','NEW','未提交',10),(6,'JOB_LINE_STATUS','SUBMIT','已提交',20),(7,'JOB_LINE_STATUS','END','已审批',30),(8,'JOB_PRIORITY','优秀','优秀',10),(9,'JOB_PRIORITY','良好','良好',20),(10,'JOB_PRIORITY','合格','合格',30),(11,'JOB_PRIORITY','不合格','不合格',40);

/*Table structure for table `sys_function` */

DROP TABLE IF EXISTS `sys_function`;

CREATE TABLE `sys_function` (
  `function_id` int(11) NOT NULL AUTO_INCREMENT,
  `function_code` varchar(100) NOT NULL,
  `function_des` varchar(200) NOT NULL,
  `jsp_pager` varchar(150) NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `function_module` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`function_id`),
  KEY `function_code` (`function_code`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `sys_function` */

insert  into `sys_function`(`function_id`,`function_code`,`function_des`,`jsp_pager`,`image`,`priority`,`function_module`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values (1,'SYS001','用户定义','modules/sys/user.jsp','70000001.gif',10,1,1,'2011-08-14',2,'2011-12-30'),(2,'SYS002','功能定义','modules/sys/function.jsp','80000000.gif',40,1,1,'2011-08-14',2,'2012-04-24'),(3,'SYS003','模块定义','modules/sys/module.jsp','50000000.gif',30,1,1,'2011-08-14',2,'2011-12-26'),(4,'SYS004','角色定义','modules/sys/role.jsp','90000000.gif',20,1,2,'2011-12-20',2,'2012-04-11'),(5,'SYS005','权限控制','modules/sys/power.jsp','12000000.gif',50,1,2,'2011-12-20',2,'2012-01-17'),(13,'SYS006','访问控制','modules/sys/accessControl.jsp',NULL,60,1,2,'2012-03-05',2,'2012-04-12'),(14,'SYS007','系统管理','system.jsp',NULL,70,1,2,'2012-03-20',2,'2013-03-30'),(25,'JOB001','作业新增','modules/job/newJob.jsp',NULL,10,7,2,'2012-05-08',2,'2013-05-31'),(26,'JOB002','作业工作台','modules/job/jobManage.jsp','50000000.gif',20,7,2,'2012-05-08',2,'2013-02-26'),(27,'JOB003','作业历史查询','modules/job/jobQuery.jsp',NULL,30,7,2,'2012-05-08',2,'2012-05-08'),(28,'JOB101','我的当前作业','modules/job/myJob.jsp',NULL,40,7,2,'2012-05-08',2,'2013-05-29'),(29,'JOB102','我的历史作业','modules/job/myHistoryJob.jsp',NULL,50,7,2,'2012-05-08',2,'2012-07-22'),(33,'TEST001','ViewForm 测试','modules/test/testViewForm.jsp',NULL,10,9,2,'2013-06-06',2,'2013-06-06'),(34,'TEST002','综合测试','modules/test/testAll.jsp',NULL,20,9,2,'2013-06-06',2,'2013-06-06'),(35,'TEST003','tree测试','modules/test/testTree.jsp',NULL,30,9,2,'2013-06-06',2,'2013-06-06'),(36,'TEST004','grid级联测试','modules/test/cascadeGrid.jsp',NULL,40,9,2,'2013-06-06',2,'2013-06-06'),(37,'TEST005','grid复合表头','modules/test/testGrid.jsp',NULL,50,9,2,'2013-06-06',2,'2013-06-06'),(39,'TEST007','tab测试','modules/test/testTab.jsp',NULL,70,9,2,'2013-06-06',2,'2013-06-06'),(44,'GC005','结算查询','modules/gc/settlementQuery.jsp',NULL,50,10,2,'2013-06-09',2,'2013-06-09'),(45,'GC006','报工取消','modules/gc/workUnRegist.jsp',NULL,35,10,2,'2013-06-09',2,'2013-06-09'),(46,'GC007','工时补报','modules/gc/workRegistAdd.jsp',NULL,33,10,2,'2013-06-26',2,'2013-06-26'),(47,'TEST008','panel测试','modules/test/testPanel.jsp',NULL,80,9,2,'2013-07-18',2,'2013-07-18'),(48,'TEST009','chart图像报表','modules/test/chart.jsp',NULL,90,9,2,'2013-07-19',2,'2014-06-03'),(49,'TEST010','form表单','modules/test/form.jsp',NULL,5,9,2,'2013-07-21',2,'2013-07-21'),(50,'TEST011','treegrid测试','modules/test/testTreeGrid.jsp',NULL,100,9,2,'2013-07-22',2,'2013-07-22'),(51,'TEST012','menu右击菜单','modules/test/testMenu.jsp',NULL,35,9,2,'2013-08-16',2,'2013-08-16'),(54,'TEST013','chart图表综合测试','modules/test/chartGrid.jsp',NULL,90,9,2,'2014-04-30',2,'2014-06-03'),(55,'TEST014','动态列表','modules/test/dynamicGrid.jsp',NULL,70,9,2,'2014-04-30',2,'2014-04-30'),(57,'TEST015','image图片测试','modules/test/testImage.jsp',NULL,110,9,2,'2014-07-23',2,'2014-07-23'),(60,'TEST016','级联测试','modules/test/comboCasecade.jsp',NULL,111,9,2,'2014-08-19',2,'2014-08-19');

/*Table structure for table `sys_module` */

DROP TABLE IF EXISTS `sys_module`;

CREATE TABLE `sys_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_code` varchar(100) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_code` (`module_code`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Data for the table `sys_module` */

insert  into `sys_module`(`module_id`,`module_code`,`module_name`,`priority`,`create_by`,`create_date`,`last_update_by`,`last_update_date`,`image`) values (1,'SYS','系统设置',10,1,'2011-08-14',2,'2013-05-31','nav_icon1.png'),(6,'FND','基础定义',20,2,'2012-05-07',2,'2013-06-25','nav_icon2.png'),(7,'JOB','作业管理',30,2,'2012-05-08',2,'2012-05-08','nav_icon3.png'),(8,'COS','课程管理',40,2,'2012-07-30',2,'2013-05-31','nav_icon4.png'),(9,'TEST','测试用例',50,2,'2013-06-06',2,'2013-06-06','nav_icon5.png'),(10,'GC','工程计费',60,2,'2013-06-09',2,'2013-06-09','nav_icon6.png');

/*Table structure for table `sys_pager_assign` */

DROP TABLE IF EXISTS `sys_pager_assign`;

CREATE TABLE `sys_pager_assign` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `function_id` int(11) NOT NULL,
  `ac_id` int(11) NOT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`assign_id`),
  KEY `ac_id` (`ac_id`),
  KEY `function_id` (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `sys_pager_assign` */

insert  into `sys_pager_assign`(`assign_id`,`function_id`,`ac_id`,`create_by`,`create_date`,`last_update_by`,`last_update_date`) values (3,13,6,2,'2012-03-24',2,'2012-03-24'),(5,3,7,2,'2012-03-24',2,'2012-10-10'),(6,5,9,2,'2012-03-24',2,'2012-03-24'),(7,4,8,2,'2012-03-24',2,'2012-03-24'),(8,1,2,2,'2012-03-24',2,'2012-03-24'),(10,2,1,2,'2012-03-24',2,'2012-03-24'),(11,14,10,2,'2012-04-25',2,'2012-04-25'),(13,2,12,2,'2012-04-26',2,'2012-04-26'),(14,22,13,2,'2012-05-08',2,'2012-05-08'),(16,23,15,2,'2012-05-08',2,'2012-05-08'),(17,21,16,2,'2012-05-08',2,'2012-05-08'),(18,26,17,2,'2012-05-09',2,'2012-05-09'),(19,25,18,2,'2012-05-09',2,'2012-05-09'),(20,28,19,2,'2012-05-10',2,'2012-05-10'),(21,29,20,2,'2012-05-17',2,'2012-05-17'),(22,27,21,2,'2012-05-22',2,'2012-05-22'),(23,27,22,2,'2012-07-07',2,'2012-07-07'),(24,26,22,2,'2012-07-07',2,'2012-07-07'),(25,29,23,2,'2012-07-07',2,'2012-07-07'),(26,28,25,2,'2012-07-07',2,'2012-07-07'),(27,27,26,2,'2012-07-07',2,'2012-07-07'),(28,26,27,2,'2012-07-07',2,'2012-07-07'),(29,28,28,2,'2012-07-19',2,'2012-07-19'),(30,32,29,2,'2012-07-30',2,'2012-07-30'),(31,26,30,2,'2012-07-30',2,'2014-09-18'),(32,21,31,2,'2012-08-08',2,'2014-04-11'),(33,5,32,2,'2012-08-08',2,'2012-08-08'),(34,13,33,2,'2012-08-08',2,'2012-08-08'),(35,4,34,2,'2012-08-08',2,'2012-08-08'),(36,2,36,2,'2012-08-08',2,'2012-08-08'),(37,3,37,2,'2012-08-08',2,'2012-08-08'),(38,1,38,2,'2012-08-08',2,'2012-08-08'),(39,13,40,2,'2012-08-15',2,'2012-08-15'),(40,30,42,2,'2012-08-18',2,'2012-08-18');

/*Table structure for table `sys_power` */

DROP TABLE IF EXISTS `sys_power`;

CREATE TABLE `sys_power` (
  `power_id` int(11) NOT NULL AUTO_INCREMENT,
  `function_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  `enable_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`power_id`),
  KEY `role_id` (`role_id`),
  KEY `function_id` (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;

/*Data for the table `sys_power` */

insert  into `sys_power`(`power_id`,`function_id`,`role_id`,`create_by`,`create_date`,`last_update_by`,`last_update_date`,`enable_flag`) values (87,1,3,2,'2012-03-21',2,'2012-03-21','Y'),(88,2,3,2,'2012-03-21',2,'2012-03-24','Y'),(89,3,3,2,'2012-03-21',2,'2012-03-21','Y'),(90,4,3,2,'2012-03-21',2,'2012-03-21','Y'),(91,5,3,2,'2012-03-21',2,'2012-03-21','Y'),(92,13,3,2,'2012-03-21',2,'2012-03-21','Y'),(93,14,3,2,'2012-03-21',2,'2012-03-21','Y'),(97,1,5,2,'2012-03-21',2,'2012-07-29',NULL),(98,2,5,2,'2012-03-21',2,'2012-07-29',NULL),(99,3,5,2,'2012-03-21',2,'2012-07-29',NULL),(100,4,5,2,'2012-03-21',2,'2012-07-29',NULL),(101,5,5,2,'2012-03-21',2,'2012-07-29',NULL),(102,13,5,2,'2012-03-21',2,'2012-07-29',NULL),(103,14,5,2,'2012-03-21',2,'2012-07-29',NULL),(124,4,6,2,'2012-04-25',2,'2012-07-28',NULL),(127,5,6,2,'2012-04-26',2,'2012-07-28',NULL),(135,25,3,2,'2012-05-08',2,'2012-05-08','Y'),(136,26,3,2,'2012-05-08',2,'2012-05-08','Y'),(137,27,3,2,'2012-05-08',2,'2012-05-08','Y'),(138,28,3,2,'2012-05-08',2,'2012-05-08','Y'),(139,29,3,2,'2012-05-08',2,'2012-05-08','Y'),(140,28,6,2,'2012-05-08',2,'2012-05-08','Y'),(141,29,6,2,'2012-05-08',2,'2012-05-08','Y'),(142,25,5,2,'2012-05-08',2,'2012-05-08','Y'),(143,26,5,2,'2012-05-08',2,'2012-05-08','Y'),(144,27,5,2,'2012-05-08',2,'2012-05-08','Y'),(145,29,5,2,'2012-05-22',2,'2012-07-29',NULL),(159,1,7,2,'2012-08-27',2,'2012-09-02','N'),(160,33,3,2,'2013-06-06',2,'2013-06-06','Y'),(161,34,3,2,'2013-06-06',2,'2013-06-06','Y'),(162,35,3,2,'2013-06-06',2,'2013-06-06','Y'),(163,36,3,2,'2013-06-06',2,'2013-06-06','Y'),(164,37,3,2,'2013-06-06',2,'2013-06-06','Y'),(166,39,3,2,'2013-06-06',2,'2013-06-06','Y'),(171,44,3,2,'2013-06-09',2,'2013-06-09','Y'),(172,45,3,2,'2013-06-09',2,'2013-06-09','Y'),(173,46,3,2,'2013-06-26',2,'2013-06-26','Y'),(174,47,3,2,'2013-07-18',2,'2013-07-18','Y'),(177,48,3,2,'2014-04-30',2,'2014-04-30','Y'),(178,49,3,2,'2014-04-30',2,'2014-04-30','Y'),(179,50,3,2,'2014-04-30',2,'2014-04-30','Y'),(180,51,3,2,'2014-04-30',2,'2014-04-30','Y'),(181,54,3,2,'2014-04-30',2,'2014-04-30','Y'),(182,55,3,2,'2014-04-30',2,'2014-04-30','Y'),(184,57,3,2,'2014-07-23',2,'2014-07-23','Y'),(186,60,3,2,'2014-08-19',2,'2014-08-19','Y');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(100) NOT NULL,
  `role_description` varchar(200) NOT NULL,
  `create_by` int(11) NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `last_update_date` date NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_code`,`role_description`,`create_by`,`last_update_by`,`create_date`,`last_update_date`) values (3,'ADMIN','系统管理员',2,2,'2011-12-29','2014-08-14'),(5,'TEACHER','授课教师',2,2,'2012-03-21','2013-10-17'),(6,'STUDENT','学生',2,2,'2012-04-12','2013-10-17'),(7,'JWCADMIN','教务处管理员',2,2,'2012-08-27','2013-05-31');

/*Table structure for table `sys_upload_file` */

DROP TABLE IF EXISTS `sys_upload_file`;

CREATE TABLE `sys_upload_file` (
  `file_id` char(24) NOT NULL,
  `file_name` varchar(1000) DEFAULT NULL,
  `file_content` longblob,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` varchar(100) DEFAULT NULL,
  `table_name` varchar(200) DEFAULT NULL,
  `pk_value` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `table_name` (`table_name`,`pk_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_upload_file` */

insert  into `sys_upload_file`(`file_id`,`file_name`,`file_content`,`file_type`,`file_size`,`table_name`,`pk_value`) values ('15WAS558F3C1S7WCQ6BQ0YE3','u14.png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0=\0\0\0\'3�C\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��o�d\0\0MIDATx^�ݻ��@P3�M�!⫝̸m�W񆏚,�]$g��� ���W�ӕ���Lڶ�nz>���l6}��7 @�\0(,p:�����+0y\r����<J\'@�\0 @�\0���~�o������e�S @�\0j��p~�&P= @�\0$�IMY @�\0(.`�,�\0�\'@�\0 @�@R���ԔE�\0 @�\0����?���8��	 @�\0 @`���|v��PD� @�\0 @��?�eu @�\0��1JA @�\0 �L� @�\0 @�\0���3�F! @�\0 ��]V/ @�\0 @�@L���D�\0 @�\0ݙ��jE�\0 @�\0�\\.~\'s���	 @�\0 @�C�vY\rA�\0 @�\01Cf�R @�\08�� @�\0 @ \"�Lf�Q @�\0�l�� @�\0 0d�( @�\0 @�@w&s�\\� @�\0 @�\0��׫��$�a @�\0��]VC @�\0 @�@L���D�\0 @�\0�L=@�\0 @�\01��( @�\0 @����j���	 @�\0 �]6N*�\0 @�\0u�u�^� @�\0�tg2�E<X  @�\0���n�7���\\� @�\0U��9*�p @�\0�0d�Zo� @�\0 @`TC樼�	 @�\0 PK��?��[� @�\0M��?��\n&@�\0 @�@M�ek���	 @�\0 0��!sV� @�\0�)Нɜ��5�W5 @�\0���{�Mf�S @�\02�\0 @�\0��1JA @�\0 �L� @�\0 @�\0���3�F! @�\0 ��]V/ @�\0 @�@L���D�\0 @�\0ݙ��lF�\0 @�\0x<~\'s���	 @�\0 @�C�vY\rA�\0 @�\01Cf�R @�\08�� @�\0 @ \"�Lf�Q @�\0�l�� @�\0 0d�( @�\0 @��!S @�\0 @�@L���g:�� @�\0 @�@M����x�Ys�UM�\0 @�\0�Q&m�~�%�v����!@�\0 @�\0�������\0q�Q��w�\0\0\0\0IEND�B`�','image/png','1.43KB','job_headers','XSF060BUDZNTYVAU1VALQ89S'),('6VW1RBG21QM44V67BTHJ1F4S','RankTransform.class','����\0\0\01\0�\0\0!com/nfwork/erp/core/RankTransform\0\0)com/nfwork/dbfound/model/base/JavaSupport\0<init>\0()V\0Code\n\0\0	\0\0\0LineNumberTable\0LocalVariableTable\0this\0#Lcom/nfwork/erp/core/RankTransform;\0execute\0\nExceptions\0\0java/lang/Exception	\0\0\0\0\0context\0!Lcom/nfwork/dbfound/core/Context;\n\0\0\0\0com/nfwork/dbfound/core/Context\0\Z\0\0getCurrentModel\0()Ljava/lang/String;	\0\0\0\0\0params\0Ljava/util/Map;\0!\0\nquery_name\0#\0%\0$\0\rjava/util/Map\0&\0\'\0get\0&(Ljava/lang/Object;)Ljava/lang/Object;\0)\0#com/nfwork/dbfound/model/bean/Param\n\0(\0+\0,\0\0getStringValue\0.\0base_column\00\0transform_column\n\02\04\03\0$com/nfwork/dbfound/model/ModelEngine\05\06\0query\0s(Lcom/nfwork/dbfound/core/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/nfwork/dbfound/dto/QueryResponseObject;\n\08\0:\09\0*com/nfwork/dbfound/dto/QueryResponseObject\0;\0<\0getDatas\0()Ljava/util/List;\0>\0java/util/ArrayList\n\0=\0	\0A\0java/util/HashMap\n\0@\0	\0D\0F\0E\0java/util/List\0G\0H\0iterator\0()Ljava/util/Iterator;\0J\0L\0K\0java/util/Iterator\0M\0N\0next\0()Ljava/lang/Object;\n\0P\0R\0Q\0java/lang/Object\0S\0\0toString\0D\0U\0V\0W\0add\0(Ljava/lang/Object;)Z\0#\0Y\0Z\0[\0put\08(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\0J\0]\0^\0_\0hasNext\0()Z\0D\0a\0&\0b\0(I)Ljava/lang/Object;\0#\0d\0e\0f\0keySet\0()Ljava/util/Set;\0h\0F\0i\0\rjava/util/Set\n\0k\0m\0l\0java/lang/String\0n\0W\0equals\n\0\0p\0q\0r\0getValue\0G(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;	\0\0t\0u\0v\0\noutMessage\0Z\n\08\0	\n\08\0y\0z\0{\0\nsetSuccess\0(Z)V\n\08\0}\0~\0\0setDatas\0(Ljava/util/List;)V\0D\0�\0�\0�\0size\0()I\n\08\0�\0�\0�\0setTotalCounts\0(J)V	\0\0�\0�\0�\0response\0(Ljavax/servlet/http/HttpServletResponse;\n\0�\0�\0�\0 com/nfwork/dbfound/util/JsonUtil\0�\0�\0\nbeanToJson\0&(Ljava/lang/Object;)Ljava/lang/String;\n\0�\0�\0�\0 com/nfwork/dbfound/web/WebWriter\0�\0�\0\njsonWriter\0=(Ljavax/servlet/http/HttpServletResponse;Ljava/lang/String;)V\0	modelName\0Ljava/lang/String;\0	queryName\0\nbaseColumn\0transformColumn\0datas\0Ljava/util/List;\0rows\0bufferDatas\0map\0row\0columns\0Ljava/util/Iterator;\0key\0newDatas\0column\0newData\0value\0Ljava/lang/Object;\0object\0,Lcom/nfwork/dbfound/dto/QueryResponseObject;\0LocalVariableTypeTable\0!Ljava/util/List<Ljava/util/Map;>;\0$Ljava/util/List<Ljava/lang/String;>;\02Ljava/util/Map<Ljava/lang/String;Ljava/util/Map;>;\0	Signature\0j(Ljava/util/Map<Ljava/lang/String;Ljava/util/Map;>;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;\0\nSourceFile\0RankTransform.java\0!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0/\0\0\0\0\0*�\0�\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0f\0\0\0\0�*�\0�\0L*�\0 �\0\"\0�\0(�\0*M*�\0-�\0\"\0�\0(�\0*N*�\0/�\0\"\0�\0(�\0*:*�\0+,�\01�\07:�\0=Y�\0?:�\0@Y�\0B:�\0C\0:	�\02	�\0I\0�\0#:-�\0\"\0�\0O:\n\n�\0T\0W\n�\0X\0W	�\0\\\0��ʻ\0=Y�\0?:�\0`\0�\0#�\0c\0�\0g\0:	�\0%	�\0I\0�\0O:\n\n-�\0j�\0�\0\r\n�\0T\0W	�\0\\\0��׻\0=Y�\0?:	�\0C\0:�\0h�\0I\0�\0k:\n�\0@Y�\0B:\n�\0X\0W	�\0T\0W�\0C\0:�\0\'�\0I\0�\0k:\r*\r\n�\0o:\r�\0X\0W�\0\\\0����\0\\\0���*�\0�\0s�\08Y�\0w:\n\n�\0x\n	�\0|\n	�\0�\0��\0�*�\0�\0�\n�\0��\0��\0\0\0\0\n\0\0\0�\0(\0\0\0\0\0\0\Z\0\0,\0\0?\0\0H\0\Z\0K\0\0M\0\0V\0\0_\0 \0w\0!\0�\0\"\0�\0#\0�\0 \0�\0\'\0�\0)\0�\0+\0�\0,\0�\0-\0�\0/\0�\0)\0�\0*\0�\0)\0�\03\0�\04\05\06)\073\08K\09W\0:c\08m\04w\0>\0?�\0@�\0A�\0B�\0C�\0D\0\0\0\0�\0\0\0�\0\0\r\0\0\0�\0�\0�\0\0\Z�\0�\0�\0\0,�\0�\0�\0\0?s\0�\0�\0\0Me\0�\0�\0\0V\\\0�\0�\0\0_S\0�\0\0\0w\0#\0�\0\0\0�\0\0�\0�\0\n\0�\0�\0�\0\0�\0/\0G\0�\0	\0�\0\0�\0�\0\n\0�\0�\0�\0�\0	\0Y\0�\0�\0\n\0P\0�\0\0K\0\0�\0�\0\rW\0\0�\0�\0�\0*\0�\0�\0\n\0�\0\0\04\0\0Me\0�\0�\0\0V\\\0�\0�\0\0_S\0�\0�\0\0�\0�\0�\0\0�\0�\0�\0�\0	\0\0q\0r\0\0�\0\0\0\0�\0\0\0\0k\0\0\0\0\0+,�\0\"\0�\0#-�\0\"\0�\0\0\0\0\n\0\0\0\0\0\0\0G\0\0\0\0*\0\0\0\0\0\0\r\0\0\0\0\0\0�\0\0\0\0\0\0�\0�\0\0\0\0\0�\0�\0\0�\0\0\0\0\0\0\0\0�\0�\0\0\0�\0\0\0\0�','application/octet-stream','3.58KB','job_headers','8VQ7YJTF2KF0NR35F9FB6ATX'),('BL5Z5UWSRJRCM66FYOSDYO6W','2014-05-15 14:22:07的屏幕截图.png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�<�\0\0\0sBIT��O�\0\0\0tEXtSoftware\0gnome-screenshot��>\0\0 \0IDATx���wx���睙��\0I�i�wQ�Xѣ�QV�(\n�+Ui*E��	����^6�wf��M��\0ǅ�w�./ܝ��.!�;oy�q�	\0\0\0���s�\0\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��I�\0���R����\r�*�Kcz�����EpJ���|kb�%��Q�T$Q�5����Fa@�qT\\`�As��\0�\0�9?�m\08s��7�W}��(1������{�_� ݹm�,�¹�H��|�[VUε�K�^��p)V���p�\\Lv��\Ztߨ�N�s�^\0�����WY]y�bю��b��͜��Ls���m�2��.9X�g�E�F�kH$���V�L�ˊ���c�v+���ޕ}���N�1\np�B���S�˒˿�^T\\��3��JD�8�T�<��Z��M*��_�3�Ԫu�V#I� �	�O\"�V������@�j���[�����y��dB��y	�.��DQ�ʣ��,L}k}^q��#bD�y��{f�9�]3�Ye6���\n̲����Z-6��d��Ģ�~:��T��<�%eloJ��ﮱ:]��\0�@�7��X��R�^`�@aD����`FT��#���͑U����c���J�é��/#F�(��G�EFGsI�UN����e��d?���=xչ{\0p�8�<p��������դrƈs\"����[���UV٥�Z��%�6ڸi\'4L�H��@ޮ)N2$&���L�\"�B��Q��]���ㆎ��2���i�n���e?쯐�\nc���#N�x�N���V���r)U%��J�P��]Y̤5�2Z߲8ݟ�vH��$� \n���1F����kR����ٹ��Z�T����J�Z����>�$}�����ac-_\0�h��gY��VRV�&���Ӆq^�*�R���QΩ�.���)�����϶��$q���4�3_����[�hMb�š2�F%&��(zGBD�Ww��7�_��{H�q����rov��TO/��Iu��\"������ݮ�ͤ�L���;\0�.h�\nm򜝥�3-��N��vf��L�jz5�i��#\"�r*���݊u��ʷs�=qr��m[w8��>~[mEEy�F����;�ݘ��I�$y2��N+ͻuH����{���S>���J\\%.sU֘¹[�mɚ��V;�J���tB�Q�똠���У��SWB�@��m����w��\nc��:#&ި�Iޮ�������Q?p�j���+_Y�>V���Ν�tʁ����� ��r�DFF�t��P�b��l6Q%�|.�꫕+Wh4�zx�رg��U�(��F�$&I�$2Q�\'�chK��\'��:�R�U��2c$�UYI6;���(\n�T���]re�Hw�Z~[-�N��x����\0�UІ�9�Ww�oϲ��kz5X����R����Q\'��ܪw��ϭt�i����ŧ�����o�^|01��v{�����]Í=z�h����������{gaa�,�Dd2�u��}��1�q�p:�۷o3\Z�.\Z�jY�X,yyy�Tu`���j����/_�9�W_.�h�p��x\n���t+f�,J� I��8$AŅ�z��N!�G�*s�-��p�)��IaD�U����\\̠av\'�i�Q�.�-~�5C�Aa�=%�g#e��p�EQd褁�ʜ�m+-���eĈ	�kBF�Oٓ]�38X��\"\"���31��厍G[���S�j�n�����\\��@���]��{׮�o���;�h|������/_���jٷo�}{۷o?�\'�v�Z��y��u�\"���I�ϘADYYY��z�b�4׼	WL|��G\Zl�6�KJK�O��jATU%\"����w�]6f��o-2\"��q��	�@�D&I�F�$�i4\Z������7W�LE]����[Qݜ3\"F\\%&�d��\"�$8\\���Lz\np�v�̿���O���Ɯn�����JK�v�(I�AA�aa�����j������tJ�\Z\Zr�a�믛���/��lT�����i6=7G��ݻ��Q\0�hVdY��[!˜c�j��g5�*�^�Y%�c�2[�ÿ�?�Ʃ��\r�%.+L����������c����\Zz��n���o�y=���.���3����!!!ލG��<X��/qqqWL��u�_-�\r\"ڴq�ӧ��z����k���CV�X�r�r�Ӏ��9o�����UΌV����Q��0��$ͱ�r�ס�c�f�q�I�H�0��D�rntZ�e�A4�1�\\&���p��2�\"� hTŠ!Ca~�OD-�D\nk�+��ǖ��ڶmk^n�\'�y\r6��+�\n\n\nj|�|��o��Gff����(*2j�������\Zt��(���|q�kq\Zt�]wQjj��~x���E�˅O�(�\n�{K�-�$V�j�)5�6���w��j�1���ʛ��*�O�\r�ʥZ]b�����z�7m0&1�g�^�997m�v]|�d�ر�kj�J����ܹ\r҆�`\nv���eeޏ4�͖��Y7pL�b��~�y���t�ĉ=z�l�-���(���5kZH�����>��?s�>�CN�(�����f&\nL�(�(�$�:����>zM�9��Һ�@&qE4�\'�r�*�Z�_�Ȳ\"\Z�X�pU:�.E!N�,�%E�2Wc�%]�~��W��ֺ(Nde�=wnQQ!q����ةS``����9�����bٲ\r��1��g���$�X,�>� ��~�\ZڭW����՚���������n�ڧg��С�\\�e�X-��ݺv�6�)���BڵkwÍ76x�1�f���EŽ��<dH�3�b��\0g�c��\\���Z?<4�a�8Y��1n�(�7+�y�)2b�x7dN�Z�l!p���y���O^z�e��;w���=���˳23�����~��ݻ�g����{�=�\r���[TT�~ݺ_Y�t:���\Z|��|�-��e�֮�j���KD��y�?sOd���#ڸañcǚyS�}/�G�DEG�\Z�%�p��	EE�h����1i`�����ow��\"\Z�J�8SUq)2/�R���t��QVf>pК��9P�\\夨ܭ�NY������?u��������ԓOT��q��?�X�>}꾚������NNzq�_|��w���t>���=�0���ǌ[w:Nrr���OK=��������v�\Z\\��r���6�h�6WW�����������Cpp��qdd�UW_������}8O�{�־������α�r�c\"g�15㰺;)*�{���|��~�7�8Ω���MDԳg����JMo�����%�흻ty}�&�����wO�r�ĉ���\r\ZT�%\"b�=���W_}���_Hh�p@�޽{��ݠaG�m.pxf�z����/�ͮٷw�O?�HD����T_����.؞E���\'L4AA+����1��~�ϩ���j���\n}���䊋sœ9H���%��\\�40���O՞�����q\"�WU�p��[Q\r\Z%�E]o�AhfY�|�k����w�����?h�`�}��͙3��rss���<�پx�½{����{q��\r��ݻ��������/����4������#7h���=S�4��q�%��y�M�S�R��w��b�|��<d�P�ݑ����]��\'h��&�\0�8Ǯ�`X{�v��Ysӌ�ᣉ8x���;����3�\Z5���tW�=z,�j!��x��Ç��%I����<޻w_eE�DT�V�̬gD\n�������&�XRR����V��O@Թs�&�xDEEyUT���[b��\'���/�8�6$T�V��}����h?�SL��P�t��)ڙQl��Z� ;k������;�Rh4@8dp�o�<>�aGz�J�r�(�-�.Qt����;b��&۶o��C�	�0{��͕\'1\Z�wO�����,h����������h�6<^�=��i�9rx��]�_��Y�ݿ������_�ѣG?���w���K/�n��ݻ���|��%;uj�B\0>���N`�yzgفGMt�D�;v����x�G�Q�Z-oXI��iC��\ZS�V�6���j�nڸ��ŋ�[���?����>rԨ�:}EEE���u߉�h������b��ŋI��̳�vѩ���\\�%B�5?TU��b�KO^���������_�4���S�h�Ȭ�Pe��@5[��F-�\nq\'���#��ۛ���]�8mxH��q���~�4AQ�qU \r�\n��B��f�o��Q�~��v��B��O�0v�X]�ܝ;v��v���`�p�{��۷�������EM�q:��%\rVꪪ�j���Yү_�+����-\\XTT��̙F�����Җ��s��}��t\r}��7y��(���{�\Z�Qas+W�T�� ��5^���7�\'_�D[���\'r�\Z�<հS���]�:Ô�\'\'��ګu��DFE=���U��yy������|ٲ�/��£s�.o�g�����_~QU��r�[�����d�8��f?ov���M!!����D���\\��_����%�����Wh$?��\n��2i��(�.	$2g����\"ryz/Yoзp}�N~�Xw���D\"�1A����M��9?x� \r:���K�T�Fu�ܹ�ʠ&\r6������d�yㅲ))G_y�����c��^}�$\"Z��Ң��q��{�ylݲe��?G��x^�e�/y��-7��8�M�����}C�o�*�9���uq^5��Z�σ3Ap��J���!�H��<��@5�!��/�j�H�l6o����o���RwyH�^��;v4ND����߾�#j��z����8�6���_z�T�{�j2gb��wo�u�A#�?�+��gM� �n.1.\n�$pQP%�%&��ܧM$9��g���ի{�����]1-c1Ku�;;��Ғ\"j�hRg�\n�(22��=cbb������v7�E1|Ĉ�^~����DD�����Y�Ҥ��T��]N�iW�\0�5hC��3����^�T`\'\"R�T�;�Bu�<<r�\n{(\'�S��:Wͽ�lTj�\\;U�Sw?j��I\r~7�|�6�u������@d�ٖ����q��R��QV���^~yzzZ�1��2g�n���!�����g��@L�����RI�V�SU�(\\Y#��k���%�KL�.	\\H�Dcyn���L�S��2�\"cj�}x8\'���(Ȳ[Q\"��\ZF����_�������N���viN�q\Z���dYn2kKI���k-tcTVT�z	\"�?>�S���@�������p|��G�_�-w*�w$����U�;9C�M�ƫ;6�[*˘N���UN�nrxf��q�m��4�� ��׋m߶M��?��=z�\"\"��8m��iӧ��ʚ��ii5�֯[7i�d�X\\\\�޽{<��{�k����8q�Ez>`����䤤�K��S(\\.W�i&�������lCc�e[�f|ƘĘ̘�I����**��$�$�\"� J\"�4�����>|��.���$&��VnS~��O\"��e�׎�ijה6���4Z�,��*s��\\.WNv��)c̓<Y<}	NW��RmV�\r�����������`b��j�ӧ���n�#F�ly~��ys�|�S��pr�/>o�a\0g�9cS{�io|m[��V�:��ΐJ�\"v��Lʖ�d�&۫�����*Lϙ]dQ��^iB3���ݻr�\n�������𣺯���O��?���iII���|�!˖-�lܿo����~��{�{*������x���Ӧ��j�1�L>��J������U��**�*g�J��T��\nWAY�\r����^��[�q��;1V��]0i�E���Z�mӴ�ͮ��:�T�x�Cd ]ܮ�N�S��еK��k��ؘ�����FKI�u����5ާ��շ�z��+\"�c¶m[O�8A�IKK\'���Xo�-�yrR�,˷�ް~nn��j�b���7�9�tLLTT��t}����~��h���5_N�Y�^=o[q��]�{�;�B��Y8����۔]�R�(.=�V�z�bT�;\\%�Mv-5]�B06�7^��)�)))\rnH��ur6� �����z%$t��� \"�������K/wkt\'����$����Sw8��zݎ;�����\'?3���h%AU��㬦���M]��G�u։�¬⤝{���J���7�;� Ό�hE�ٖ��k�{Sh���������1�(��ȸ�&IP2)�?�ٛ�><==}�֭?�h�i��$�-����z�E�G|��7Ǐ���o߾��˲�m�V\"\Z2d�w#���\'�Z������4�}��{��w_sG���a�YЦM��i�{ʖ&��n��ۨ�h�v1�}��y�\"���Vᆦ�j���\\�`Ʀk\"Ŷ��>朿�Ɯ�3�ۯ�(�n�{ǎ��~�w��;z��A�vｳ_x���d6�������/;���x�FSVV�f���{�QLl,�>�h�G�u�N�F��VT}�`�6��8W9g�H\\��efG���W����Ԕy��Ӯ��7�z����/^�[�Svr��iDA#���\\�ɝ�p�S�\Z��,��e�l�G�x��D~����\'QP%�$�$&EFk{�\Z�tͤ�����������;�ۭ���}�v��9==����_�3���V�ZYP�/I������^�M��#�����9��j��1��~^^�Ï>\Z���/�\\�����-_�l	Q��6�ں@���Ȉz���pWF5���F\rAq��W��8r���CPx� ��\\]��x��L�u5��Ӌ:v��=%%�󴼬���/����UU\r~I����w��׿�M7���?�\\Z�[�����%I�h4���<����.]���o�/�V�]�F�e����\"���G��DI��u;��ݗ���V9\'Ι�\nS���ꑝo�����7��O�=��@��ߵZOaR�DF�8��ȱ�<����ѝ�L������9����yh�p��DE�\\$	a�Nm�^*�ڷ���;����/,����4yr��1\"r:��V�c��\"� <��O�|l�_~>����k|G��۶}��\'�(�r�-�u%cl�К�M7䇇�?�裁��_-X �b�^����{��q����n����Uc�(z�(��F�ޜ;��Ñ��4����څТ(���*pn!p���K��k�f[>��0�������^��U��g!\'U#O�v>�/��Y�ɓ0\"�܌X�`�I+�5}KO���O<9뙧++O.0�͍?����C�����;�Te��?��(�r�U*O>�tݏ���[}�`A�\Zv���;�߳W�j��5���nι磜����Ö���{F?��!��.O��ܲKWj%F�g\\�S�y<�~<S%�VT�[v(��-��i�.2�#I\"���!��i�y�N�^YY��M�?���M�<w��� ?��}��[ii��h�٫WDD�B���|��?��r����c7�|K�=�&���:���n��\r�����Q#GM���ٸ��͛7���aa�������Ao0��(�&\n;\0\0 \0IDAT�)Srsr�޹��W^~�Yu���(��FCm	��`4�z���9��f3�z�����hl��\0�&8����7�N��T��V�[�t���J���\Z�\r�w�s�2���kՔ``*5]���Y��,������;��nJ��&w�����v������i�{��=z~�����&��?`�C?�`&`HppyY��6Q�K�$A�^N``������:�x�Mͽ��F�JvY�[���cw�}G-�N�{�$��SHgH�k`Ϗ�H\n�כ��jF��;eա(�␕~Ar��9�����:mL���ZhE�Y����맟~������O��	�ɑ;�qq��p�������|�u1��>�<--m�믉�h0\Z]N�gꏟ��k\'�|˭���z�СŋOO�OH�9��=�%�F��y�M/J��g�俿��˃̸��K��{o͘�(hu��c�>�7��*++5:�/����(--��t���WKKK�:]��\0�8��M�tE�ݍ�~�=���S���b\"܊�8#�4澎t������TR��#��J@tt��w�IL<�ן���U����n�N=pР�&���5w��a�\Z�{׮�۷effZ��A�޳��ѣ���ē�-4MS��������\'�|������iu7�r��Sm�����ۗ��3����[;܊\\esq\"���cV�Q�:���n��x���:��jb��{é(�bu�qA�ʫ�ܭ2Y�Fu��I�Ԗ1Ʈ�4i���{v�N<p //�Rma��\'�\Z<�w�>MV�2dh�~�w�ڵwϞ��<�զ�j###{��3j��溗rsr����|�-��G�\"�UE��H�t��S&L�b��Mɇ��n�\'p�u�ؘvD�r�(��f�����~&?��?;+�t���	\0��\n����؜�Qb�a����B=	u�%�챛��\"�tfH$d��c\n���԰���a��N=�6(��(����t��d}��Kvݹ�Z\"�^C%�N��a��z�����um�-��o�?�eۧbM�_���R�؊w0��v�nI�30�KD:�����C��+�Z�;\0gz8�<�W�nW�LEu��7�>��=�X�=) )�h��D �G��Ei��vd{��r:��8@����7;��I�(6�$?E���i%�A\\i-��TV�40I��O���j�ȷ�	\n�:��	�����!e����)6���w4��ĉ�����j�ݻ�3�ل��\n���3Uy���B���[ǔ�xIYN���B�1���nb=M���u��?��������~��_�qAcqa���f�(�$�����nɮ8�!��\Z�Ǌw�ZR��5Z����\"��sKh�x��T�Μy�]^)�J\\hhxT�&��a�\0ӥ��N/>�Y����3�A��RTb�:��;����UL%\"�v�\n��搷��o:�ؐ*���9�\Zp�Ft���f�M��II=so��۞~��O���(��Q����9�(��)H�U��d������������eY�j���EF\0�F p���]��n��-:�30:9\"��������O4�<�(���K;�|G�T��H����EF�*{�\'[�\rj7eX�Ĉ����UEk�V�K�I+9L�jd~zY�#��\"��;��!\"bL4|�r\0�G p�y�őMԡ��*o�l-cO�߷w�Y��偁A����Əou6FfF���ۂCBz��n�ژ��I�\'�z��{�:xPs8���SS���RRR�*+Od��ۧoDddBBB���l�����7�|c�w7v!\"��}`��7~�-0�b���D�\\�%�h������N�U���h5�IG&=SURURUQU�� K:��ǌƅ�\0��C8�t	���.ߛt1gp�Ț�_~*\"##E?�\n���v��Vy������NN�eժԴԽ{����z���lYv{\n����5��Ѥ�6h4������]���W��k�����|�x�o�ק����~���+7m���Q����_1��hb�y#�&2�=Z�kTɤ�y]�+�4��Ū�Te�VVa,�+z\r\r��=>�\"��\0|=p^\n5\r�mݡ��2J��ց�p�wCUU599�ĉ,���G������-F�5e\n�ٽ��ѣ3�]�v-_��v��XPPHD*Wr��;v��Z�G�HD�Q�������l���ݻ[,�7�x������[=��{��Wg.���z̳E`L`$1���X��%�,n�kv�Ze��D�t�\"WU5ܯ��3|�H\0�8_iĀA��nt����g��Z)��.\'�ŗ\\R\\\\Ti��޽GVV�]w���ԇ.]�~>�3��u�-�\Z�F�����OH0��,Ֆ�ƌ�$)0(�գDQ?�\n��c�jժS9��_V�ܱ�СC�~�v����[=������s�=�Z��q�qQP%�k�\n\\\'2�[��)*W�zf$F����ǅ��1��z�y	��o������[J�G��=�9Z��BZݧ97n0�͓�����0==��r�����\n��޹s����?��<`�����ҲҡC��p�(�cUfshH���A6lXS���Qu���EQ\"\"bTZR���Q�I��w�xѢ)S����\0C��k?[������s���N�$�+�.����p&0F�iÀv7����,4\0|s8�\'	��ѳ�w_tY�;��>�����v��^PPйK�o�^��!I�:��������{��m��y����h۶m������1�N����ꅌF���r{�ܞj�,�?`Ƕmk֬���\\�f��տ\Z\rg8�t�$A�y����.��ˍ&���T����jա�U��-;܊[Q$��G��I�?B�\08ߡ�9\\PJ,��Un=��c��b|f\'///+).�ڭcL����쎵7�jAaaADD$�\\E���ʘ����h4��\Z���t:Al5�p���%\"�V��]?\Zp�\\�:랟�sQ�¥8r+�U\'r5G/٪�N�[/�!�Ƅ���Q����aa\0�p���U�>R�a��x����[�?tr\0\0��A���J^��c�_�[��������\n\0��-���Ywg��TT��%Wu���+��s�\"\0���8\0��23��!��ZE��Z�����t�흛��!Wݺi����wN������Zm���(/+)u�\r�-���������\Z5W��T�aa�!h{�,��qf�����K)����x�W��\n���Rlt�@�m�GRҪ1��;��8�b��c|�8|�#=��MG�|��Dk�_FİKf��Ƅ��/��%�����S{��x�oJ8�jF.�k���\nlN���p��v��n��l6��Y�������߾���a|pg���?T�]����yU)���S�n)\n��Å3��Fn\0m��\'[K���o9gݖR\"�����u�4��au�=x埳n�{�����^�ΨV�\"�����B��YADT�f��\'b�H�3�<)5�AA��N�:�B�f\'K��+J�֋%RX���K�����t~�!�aa��a��UuT���y��\r�D��md�8�v��.��I�B��8x��5ɉD�� ���-@�\08������ӰX�|裇�4�}��S�,e�DT��[#�K�=�pd���H��<zX���_�������Z��?T�>/MM*%\"\"?c�8\"\"����N���_�I��+�qq��I�����O��ng���y�ri��3���=���=+׾��O��#\'�zE�Y��t:V���o�Z��F>���!�AR���T��p��=´M%^���J�����U�O���9g����ͳo�\\�������[��)C�\08��1��p�;s����~л����W��y����&z�}�f~�����q�74�����w��Q��ۮ�۳���⇍���yDdy�����)Jּ���U�$��%Oݳ�S�C9�鬙Z�R�t����WL\"������^�]��c�X��}��%)n��4���u��3c�W;�DA�_����U���מ�Y)\0P��������\\��\0�u���z�Щ��i\"�.We�����U,U�Q𞝙F�����KJSmgNj�>��#\"bѣ/���f/�d���.��q7��o�e�����5�-��J{�{q��eo��`���0`Ɯ{�;R�/������ެ�횚�����s��^��=�hn�q䋋g������vة�7�:��?�G>�����2@ہ��f�~��sk���T*�5�h?��]�ln|_ؐ��.��7?��;��d	��7Ov/_���/���\'�s��}��{�Ćm�_S��63���Bz��?��p��ɓ\Z,t��_vq��Tg�S�,�̳����\0O����i`TƪM,B�y���k�k_�9ogmR9������P�:]���w�WY�ڱ�:�~���|x���Dĺ�qϰ@�ڵ�v���S\'�\n^�#*���āO���\r�����pe\'h��)u����͞{�r��ADZ����JD�F��\0vf����{+�2\"���Y[�ۈH�_��3k*S\"\"W��͹DһWhßrU�ь����\'2Jk�d�\"\"힝Y�w�Qo�	��{�E4Zr{:Cb�=�ʔȿ?���]�]n�?w�0����.���d���:V�\\���*��}o�:47)S�1�N�T����?�3u���6#b����6��u|��\nl��z����q�lx���f�i�s�M�#b�1TGJqa�LD����\r�ǪU�{Ռz�����5��*��I���kz���h�����̟ѻ&483~|���E�Ȉ�ڕ��]UR�$\"�������p�)JJ^��wκ����A�y�f�ven[�lc*���ቧ�\Z�S�3�*������c�pyDݟQR����ʢ�/>�(U��럹���8��/���\\�>|F��s�}�gҋ#���& p\0�C����9[\Z�\r���/=�?���]xbǚ��n�q����(������E�S&\"Q\'�Sh;�����M��s�����D���旞=~��[�V~��՟��^\"�	+��L!h\rF�N#�S&���?�5��lr��[J#E\r�ӗ�����\r�דwO�/�ٱv{NΉe�*��|���]߽�C��1Lr\'-xyQ�J8x�~�{/��;�U׾�\0�eV(p�-����r������\0m@�q�뗟���OG�2��c���+�p��Q�t��x��v?��Q���Z�(�;�춹�H��~ǋ�	�+?�Q�4<�:���Q\"�*DDB��iwt�:�x���9�{���{>�����B��ūO�e��%5�B�Ы_�h��f�Z�V�_{���au��\\���>:`\'\"\n��e�{w��&�t�Wo-���q�ڿ��=���2\"\"����D:焅�֘R߿��\r��K������ow���T���kT8�@���f�sjX��e�zx��L\"����ѱ~�F���`��{���y�|\"\n�;T$r��v\"Қt\'?sڞ�\ZO9���k��y*��\ZE��;(ACĭY�W,�s���\\K㣝��7g�|�3�ۡ}��\"�?�X۵b.,oT�U�$\n�����:�DD���b��W���{s|�@D�$2״�t�3h�E�5�W�^�=r�BĢ�F�<W�x�ܹ�a4��@�\0h3\"���nM��p��4M�\ZZ�����$����gٶ�v\'V�|p͎�~�!��Q�v��b)��>@��#�4dʃc�D\"\"�pç����Zy�X�%!A㲹�����&LR2�ܒ䭀}ݬ4ZR\"m����M��0\r|l���Y��O^�^�����~�/���NE��S��o��w�o�ﰔ�����ho�����?7�ߵs��,-�`�e�ٟ��eC����@;�oL}\'7~��Θ���\0m\0@�>h��f�pln8x��ߟ \"r%}5;��j҇�%%\\{uG�U������0��\\|Yg-�3-uq���:���?4�IvE���Y��4aL���ã��6�\nV��ʯ�+^pEn4\\S�I��^��W�D_~�<�ږ[�~_��	\'?��S�؇��ݮnqSg�ޝI�G����QOU\"�\0cb/�\"�72J�\r��R^�Q�gbٽ\0m@��<w�\r�p5�`~������D����v�ٷo��-�]ĉ(h��A�[6���\'��Tp�^�Y]UU��\\�Y�\'��!��r�E&��QS��P{���}Ad�9�ǵy�4}5AI�Z�MMJU�S~�7糭�D��q�+�3�}�����ߝ+>��O�����<꓇�L`����O�j�	����9�c��y�-D�w���<�J�궖W�Ddn�\0��@�\0h;�VK��5�!F]���	\Z?����,�Yn�DD�㟼�?-��֏E5�i�i�|g����k��7\r~z�CթYBT�C;759�fs��~iY���(�\'^�#4c�^%�Ȫ#F̿�Է^�~x����կ��{�����\\X�{��)ۤ�}��د[��P���i�u�>���`攴����G�����\r����͈��G�����\'}���Fe��d���=,��藠�s���7\Z�����\rN��/~����Nk%��2��D+�4FE0����\\�I���o|Y[���\'�4�צ�T[����\'�ԼI!t�#/��s���Ml�u��9��E�D��7�<�����\"b�=o�{X0&��\r\0m�_��z53��|j�<e��7�:�=�s����<����xD�\r�|5�v���<����ݛ��-`��%�M�&��V)j��\'u����\r��O�ҤR��A7_߭��=���H��K;7�p~3����W�bB=c:̯��o~}��\08�MW�\0\0\0�����yK������\0�k��$u����.?�S�M8M�su���穪�-\n\0�AX-ι�5;\0�q�[�lᡪj�؁�pvxG��Q7���|ȓ6�!CUպ�9�,�z\0��I��I��z2� � 2��+uӆZ��(�n�锝\0�3���<!CEO��D�cd88�\'ꎤxC��(���p8EA�նz*\0��Y,ιF���t�$��(I\'�#s�Y�������\rY�eY��l����� �5 ���QYYYVV&��d\"\"o�h�z�P��y���D�M��Ȳ�t:G```tt�g�\0�>EQrrrl6��d�h4�$�g!\"�s�F�0��>�D�Y����p8\"##ccc�6\0�!Q����V�,˞Ⱥ��|C*�\r��f\r\r=��\0\"���X��e��=��b�\Z~ׄ^݅��������s�.\0��k׮����zz�[�u��������8���0��\0�)Z�600��t6(�w��,|�?�n!QOG@@��n\04�v�1�������z��n\04d4\Z���%�O|	��yu+��\\.�Nw�[\0M�h4�qOo��s�\"��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0\0\0��!p\0������y�(�9n\0�?$��\0�?��3�X���]o�j+��+st��CS�X�>-�_��\'�ί��Ⱥ_��)͝���N�|QD�?/TK��U����F\r��:�8|��pMk\rV����eOe������_�\0.`\0wyڡ��\r6�c�I�����7=�+�mک�dX���\0�Y|,�hI�5F]sQ+�f�%+�h�����7�<!\'��^��O \"R-�ǲ�d^gwѯCׄ@�,NM>Z\Z}�D�\Z������te�W�J�]{i������P��ko	���G�Dژ�=���w�^|$ﶇo������@��7>!����zcQ��J��uӬ���K�ș�R,RI�����+&_�A��y��,9V���M��`��<\0�e\0n��,v��߿9Fb�F\n\0\0 \0IDATĉL�n���v��_�f.�U��?��ODRt��a:Vs������+\Z��P�&.�Z�$Z�l�%��1ϣ��)eW^�AGb�����:�;we9�qCGtҗ\\���WT\"*�4勵Os�ȱ=pY+�7\0p���4����*r����cI%*y�x��E��$\"R�\'������j��3x�1�����l9�����I���gr��.=d���z�{N���FFDRh�KǑR��𮬒�.#/R*K�P�M8\\Uj:@��Y�\0��g����,����]:̴��ME奶�{D^��ޅn>Z��������O�jpUUT��aĴǚ�����~�b}�j�,+-�0�p��;�B0�Ƕo��}�b�萍�a�b�]��~��v�L̐\"�Μ3��?>�`SYĄ\'�4�J���ߊ��������C�9a¥Y�@���*gN�#�o����,+?^�K��q��|Ӱ�]M�W\'/ygiN+gv��ãD3y�C�f5gӏ��+z�hۏlbD�r�l�L�,��������[����N\"������JD���p�A�\0��0C���]?�[u���^��^}�U�k���ċn�Q�[almH��f��DDRX�v~��(+S��M�� �np��},)C&v����꒲��ù�(�G�������\"MP�^ �U�BD�$���\0\0�U\0(1aҴ�:h�m�7-^z�Yw3v��N�����Tuj#/�����µ�|�����_�릍��ݸ����7�vi{=#\"�S&b	7<vsg�%雏���	����.>�{{�LַgH+��Ut�����KD�e�BD�FD�����$�ؖ]�[\\��w5�4��]51)sű=K���k���Us��5�?;(��V��i��=TvX�DZ����@Ia����h��JY�i;3�(rp���ꬶ���9��;u��+.��$���p�A�\0�PY2�Oyg)l�M�f�}r�څ�{���NGR*�s����3����.���r�U\"�?�Hu��D���11�[��?�U������\rs����ˬ��]h%���?JCD��v7��3 p\0\\x8\0.8������ߵi��a��:(�f�5e�כ�)h���$�i�9\'y���;+�D��I0�gV��ӕ��3-�~_9�\'���x͘>Qz������\n\"md��jqj�\"2��D\"m�?�*N���}��t�\0ݕ���bE�v����U�5[UjԪM�v��(�_��h�\njզf��ID��In���7��u�x=�A���瞓{���|�C���_���S�E+�{w	�u\'$��N�y@�����`��E�y�d0��ζ�r�(�a� �sT�|%���=p�T�ـ�&�*8�\0sԑ�\0\\+��[0�_�ԛ�^r�:��s�7��Ӳ���n��8@�V����6���b܍�k�?�W�Vv��?���0@[��˕�S�\0�w�:�i���	\0$]8p�b�#��Dj1t@C{��sWC,�q-Z�ۻ��OI�[[~�up�պ����\Z����h7!�<���(1�ڲtC�A\0�1@���sg��U��+\0��:��\n\0�%��}��V_�vu��\0�\Z~�ߪdsd����ha��Ѩ��-Z�۰�w����u�}�R�lRo<���-���^1ǈ�]�judˏ���\n�VP^��yE �|�|�4*�O�~�\n��j\0KB������\0��][	^��� ��F�f4N%K�0p�=Dy��Fߋ���%��}\nrSBLt���)\0�j2h|S�Z���S�����P�V�]:��V�.Ŗ}��\r��,��x5z�Q�I}��v6����6\0X��أ�����.���޸q���2M;��`[�X�*�l��9��_�{���m%����+��f��X���>�;f��գ���������X��d6�SSS���U*����ˮ)ND�z�)�L	��|�:�}��z�N��j�Z�����eW��&�p����a\0�N����\n��p08)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������AyQJ,n\\��P�ˮ	#�?�!:�)�}�Ғ��s�=�ˮ\0�3�]�ega0����D$&\">����FL�߳�X}\n]��m��o��b%�_��ea�0�\'D���s{A�`~�e��e�t��G�C��e��L� -��#�P�}\\�����M�:aN7��������xw��y����:,��7���XhƖ���6>������Sy�Rn����H˹�R��Tu�Z��:��W+����N��y�S�xOAVlP����\"-9��Ĵ(�϶H� \Z����q`<l��g�����|3k��϶о�O�}n{0�c�\0�>��#ϑ�8ZG��������z����W�=o111aaa�o�\n\nz�e����vs�\'�|�~3��[��M��me8)� (\"�\rY#6�3%�l�CňH�tv@6DK�N�˵��r�,\"�tL<Q�n^�%��DD̲��\0���#�~�q)\rd�>��#e�JٲR�G\\ �8ye,)+�V��irfd.�TW]\Z� 5fH����k7��(�Ne�o�Yxz�r�<�!�32���@�7��]s�z��;9V~�t�DB�����I���$앒.��us�=�`��l�:#�}��8�4ˍ�H���� #��\"��Zʳ���;w�ܵk��޽�\\Y��c��\\\Z�i�ބ�=�.�-qr=|��e ����p�(U�m��@��𸏛G�l\0̈p\rJ�I\0���8<T�}u�n���@��X�: �:\r�2p��;�o#j3��XR.��\n\0B���9v�r��~f�� �4\0�퍳.Y��ꅟ��\0�P�G��,��\r[O��a�d.p�y�Έ�-��@L߁Qh�\0c-h9�U�{����}��\Z;:��\0x��2�}�S	\0�o��g��g�y�k��\n8���W`��H��\0�ȃX����@��Z\n|��a9�F=�:���i��h�1R2ZR�䜛ל���`>�w������0�ß��[:�Z�7\r�.�Bw8�q�/\0��{GL܄\r��,8�\n%l�1ѫ���^Qjx�G�8�~��\0/�[�2i��.�셶\Z�pz�O��\nƬl0�M�(���v�p	�5�`v�lkDZ�f��=�ӡ�\0耸8��\Z�*\\�ⵐ���0�/�|\0�&�2��`�B�U\0�p��rM1�q�\'�2�e�ZY=*�\Z���æ|��=��X ��8����\0@S{��W�S��-\noW\0(��\Z�T{\\Z��a��+b�H���5���/�@�g9�V:W��E�s�E�(�[T&�\0��-��K\"���\0N�\n�D,�+nB]\r]}r)%�\0�J��#Y]0	\'0y��6\08��Ap�?�,B��8�y����=\0�Û��TP�NV�2���\r��?�M��\0����6A���S�U�W��nb�<�Et��H��X<����(7P�*,����S��m�ō���dJC��$I��N (%�\"�*�%�[����Z�{��*��߉\"��<G�Gz����_.:�˙��5���RI�\'.T��A$A�eJE��:	\n�� �=&�&)�r�\\�(��I@����[v�h�/\"��<[)\Z\n Ј�F\0A\ri���N��;��]*Z)QJ\n��u��I�5�b#n�H�^Yg3񄔅@\'���j3N��EZ@PX��}��\\z�*ɯSz.]*\"\"�2�G\0�t!k?�^���O\\ v�$�s����ࠗ?��T��إB/[8����?�o���m��-\0\0��X�sށ�8Lm�̏�)0m/\0���\0�c�@h���HZMA�Z(����X�#��S3Db��hk$�as?荘2g���<\Z���=ڔ�Y�̟�4��@��6������j�~G�%�=#x����v\0��\0�y�X��:3��\"mQ9�����GxV�wƐ�	}�p��h�y\"��\r�\0̀�\'�V\0���bot.\0\Zd��}�S�ń[7\\��D��8{�ǰ�Y�b5�c��Eǂ��-�:�m�`��1O�:��>�+��8y�������]�c�Q�:��CW����{Vs��:V_J����t����Z\\6=n=[^SH�:zE�м7N���G��ޘ���aG,�8���P3�5^_~�q֌s��\\4���X��I�n!�@,���Q���.8��K%v~�Ͻ���wŸ��mF�ǟ��7G-��u��;�dME�\\\0@֭|d�J��(h�^۴4\0X\\˴\0`�y�[U|�qװ�<LQ�}��C��\",�b�x����;�Ă�M��C���@���Z�m�sGOy*3�tE�jz-�e,��Qc��a�����}G����u\nW�pqFG��,��QI���Z5P�\nj��qy���C�l%���X�i��\0*,\0Π͛Щ�x\r��p~9�\0$b|h���`�c���2.Y�l*&T���1������^E/����ԥb��\r���^�\"͔�+rx�,�+#?���V����^�\rRdQĩ��J��9�4\\�!�LL�\"���d[�^]�5����,+���Y,%dv��$ʰ�H�qOܥ���/@�\'H\\���P:v���c��?�5*�Tʃ]*nҪ��l)-[HE;$\ri�RZ��V��t�%$O{*�V\n .]%AĿM�.��n�6��\\�6�B]i�EV������ki]-ǅ\'lK?��?��n��&n.ٶ��}p7��[���\"b��NO�?�Օ`s�C�=�O+:]Λ�L����㣱K�^z�^D�0�I[���nO/��\r��F\0ql#�ֿ�F��G�C����t��%�* ���Ue]?��J1��Y�$�x{ ��@��Y~m�QP9�m�Df��9;Z\0)�X� (/�� ��e��,�.M�H楎遣�D�?�/���K��(	W��Qز/x&O[Jz��G\r��6(�?�N�����8\n�[E����\"�RX\0~*�����Á2w���-&�̩$�����NIr~��4K��+)\"	��[d����T̟^J��&ë p�=d�BٺO.ݖT��.��4{�5C�@l�D�QIی�bk\'�Kh��a��/J��k��w\"���^v�ЫI�z��Ol�*���;\"P�+��I�(�f�8�\r�1�bw���m����/�(�i���\r����qz7��#�c\0�V�\Z�܉ޫ�R�_���4�l��\r�R��(�߁H��8�|���dĥ�b��/�]OL_���pO�Е���cb�l[�C߮Ы\0A�%\0��n�����\n\rZ�5c���>�O<ۡ}�tކYa��T�����&�n�Kg�c�4t�J�r��ӟJ\0Q7\0N(S	�������|���K��pB3o\0PķS��S�:�Us���%]��.�ں�y5�� t\ZM�z�JG����P����\\���+���K��Q�&\nD�RXx��B�:\"t=NtB����\r[���0���߳�}\0���0�V�����0\Z������F�>�R�YN���N<���.	�)U4��Jn$���H��2��\0R{��_\"�/��c�%R���dޯpO�/ɞ�b�����܍R��r=D̑]�%5IF�@:m�%5�\r��&ˢ��;55�\\RV}������֋H���Z^�������o�T������-OX�� ?T@��Y���.f��蕵��XI�<XГ�J��J\0��XLt�T�V�H�~���u�z�Ot���t�!N����8�y�+;JA�^���A>Y\'i\"\"}O�5���?���Q�SdtId���:<p��X�����O�ʴ7M%� ��@�!�\"��Y�����^�{�W�	g�Rs�5���*�.x�\\�c_aTZ����7i�{����/x��h97a}4�\Zyf�5s�@��8�¸M�7Z#1�d�(Lm����x��д�?4w�u���_`z�\0I�\r���ҟ����.��������\\\Z\0Z̆�?���s�G��?�U3\\�B�Vx��[�Z��������Z#�iF�>Q)�np\n\0,����]K\\]�~���PG��)�5k0�ӞJ�`�y\0(W��KW�1}�_#\r>\Z��yj#��_G�a�q�����u\\����qy;���m�[�ME[\0�h����D�!%����4I_ٱ�� }�����X���\0��SXq(���R/8�-\Z�B*Pof�ƈ-��y�_��z|���?�\"�/c�\n��bN`�gXv\Z\0��e�Q(�[IԨ:G4�=�Ƣo9��\0\rpg��ڃg5�{� h�%Jf��hI��#�p��EU�T�Z/j� h#����h�~݇���\07�z��G�̿\n~�W\0@�~�8���B\0\0�Wa����%�o��s�#�ڶ�����u���� �\0Bía�߽R�,�pOpp�c��9�1\0sO{���KQ�^?T���m���E�H4a�dt�����l��g��p,�?tF�ӟʴ��\0M������|5Q�{�{��a���&����[V��p�\0�z��?�i��@�i�#�DaY\\��.��C\\�X�5A�����r�lF�\0v�\0���!��\n������84�\nP�kl{.�<�U�\'�W^	9�(��^v�A�w�D�)n���ub0�ϵ�Z�[o�.����H1��U�UO��F.GJZ�t-$���JP�$�/�EWD�P�g��dp�a��ސ�r<&���;��&�5�`|�A�V��;����\n������{��R��S򶫸������+��reUz�< ��H�ɢ��,Nև�J���{���X���lO��I�R�l���Uɒ;�r*�~\'����n\'��+�w\'�6�wm=�wR�S	N�MiQ k�ޝ�t�H�|�)P���h ��\"���I[[��S\nYǍ��?f �I����,���dn�\"cK	le�x�e��+�)\"�K�J�1�[@>Z*�fH���Ψ��t,o{f���.+�ȓ����.za8��S~�Q6|\'�#��]�%�6���+c�$��Y�O�#��&�ۋ�[�X/�L�Y�3��p�a{���\'JOwd�t�,)c7IR��	���2Rj�$J.�#-T�הJ~2�k�~VR,\"	Z+\rߐ��Q�\'\"b���T1Z�)%)\"\"����S\0��)�%{e-�ҫ�\02��<4�⹕b�8\\�t��p�/�3ʦ~��Gb,�r*�.���Ra�\\�Ql�1���&.�E\r�7B�$�����Z�D�$��8K����1���C��Cd�dKH��8�n��#�-G�0ȀBW�!�K;q,)�B��u��(b�?;gDR_0W��ED,)r�GiU6�����}x&�¨D�e7�P^k2��fsjjjrr�J�����[*^.K���f&��܆=�����_v�p�G��\Z3��c��]q�T3��ڥkN@��x�oQ�ܽ�\r�B���S��ށM1ث\0@L�hs����!���B�&�Q\"�J��Öch���\'x@@����^���tZ�V�պ��<~3����A�߫8^C�Wp%>U��k���04J��p�An��\0�,������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD����D��#1=\0-���ǯl��7�o0���w_`�����㖡��>�iÃ��7��!Y_\'	��\'�0�����c`��	��_�q#YK�#8eK�W��DL?�Du��S��Cѫ����U$��[��\'���`�Z`-6Nį�P�_�&و���5-س�Z���dݍ܅)k��O�±i3�6c�(��\r[7�N&�G�N��V����I�m�o8�^D���k0�O�2�n��=�ЭP���h���ȹ�\nM������B�3�k5*;��*���?\"�u2a��x���/ᐹR\ZV|�d�Î�!�}�b]n�wˑ��-�\n�n����-bR�G}yz����\'�����Uq+��<dX���� M��kP}��E���\n\'v���ST a7ʶF�i&\0x�:>ٍ�B���c�x\0n���Pelu�9TE����BH��Q���\0��i������s�\'t�9תء}���9�70p�:JR���\0\0VIDAT~��� ��f�o��\0�`����f�������(]a�xG�P(�U@!=`F�Q�ՆǓ�X�bDZ�]�LH� �\ZF���*܆9ͳr�)��8�F-�Y\0C�`�@�Sm�p�`�Z����(-%wCQ\r�*<A��迅��D��Jh�-Z�ET�\0^���h��n9�6`Xyi�=�KTxcN�c��O��j(�\0Ӟl��S3D�v�	\0�}3L&�>��>��P\0��bn���Ǳ9\0N���p~����8Z�]��Ǫ��Wr��/�Če5`�%&)�T������A�GYbp&�ba�e[�B�\0\0A�@\0V��W���d�<�?$\0\0Vv�K?,��1�\"#jcD�j�����p��������\0*L���F�p��)c�xlZ\0���\'���K�;�f@p�\0��g\\\0��:�>ݑ ���<�pW�D�\\�j��7\0.���c����;4�b�ƌ;F��|J#-7�����#B��A�J�?0�&v���i	�@[;�btk�cl1j%�GA�e����\r�˶��^\\���^U�� ��T�^��@�\"(RE���\0��]�.)�a�s�|�0b�\Z(d���\\�DK ?\0�5��\n����6�\\[p|�J��=\0�]�G�Y80\rz@��o@��\0��C \rkzcF�F�P���\0@����\0���c�^9�������p�Ν���\0�A8�\r�{iz��R��A�\n1�^Ή�$����i���\0P�	rm����xtm��[�{5�#�/tퟵh͖TO��< ?�{a�i|���aVM���T��>��/`���qfl��-���+��pBt�Db�X\n�j��x������]ˬ! \Z��{�\0*|��;1� �Ǹg8tD�������Qu����dV�����l]���z�Y�h�㏳\0Тz��s_���J���J�m�L)��\rA�[_��\0l�a�,,}�F¥=�;��pm�7U\0`�5�Y@�\n�4+v#:\n��@���hT�\r�4�.V|X��A��ިSu�N]|u\Z\0��n\0���ǟ�����WA�Y�����5\0h��͘E����є��p�\0@����\\v�\0�:(�7\\���A>{D�4~��^��G\0�DaX[̽T��N��3�¸IP	\0�nP�\rp����~��M>Dr�����aJL�h�z~o��ms\\�vǮ����\0����> �W\rѫ@cW�ǯ�)�oG\\n�\n��,Y�h���=\0\0*���Q�.��Y�967��M\0�z¾�3\0Ӻ�Pc*��ʻ\0P�\r\0���O�Lp�N�/�صũ9(a�h\0���>x��\"Mи�#+��=��Q^��1���l��T�\0��\n��+٣Me���4�5��Q��z�fS�\0\nwA���8�d\0�Z\0�� 0pD-?4m�V�P�6�7B�?:\\b� �T����?��@��!����\"��a� ʣ�Ψ�\0����/&���l�K����L�~����8\0\0nu1��za���!p\Z\0jA��\0��o��2�I\n�����Y;�r\0�ܳMc\n�\Z�~�Y��������9�d*y�ZDO#66�d2��������d�J���N�������_]z�^��i�Z�V����+Ey�\'���`� �\'·\n\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)�����Kj��d�ɔfyɕ!���ˮ\0=W����νP����8d|��$^����_S�̝м`n/z��}?��]�^�&�\n�a�p6�L�ڛ������A#��9��m��=mՀğZ4m����0���|7��\r���.���x�?Oj��Z����o��M{T��nu|ٱ��s8\nD����A����m��ͦ�M�w�����>�*@RCO���jʸa%J/��p��k��Y�2��^ن����Ӽ����Y;�@�޿��=z�w�ۑ�&zt����� �!��:p遽8������Im[Y�i�]����Hf���{�zt흝��X�\"��a� �K4�ޝ��~��q��9lI�\rC|�P��t����?]�}����|mslc����5�\0��ۡ�V�L��;y|ő�\0`��?国���?���\0�������oV�lt�R���R\ZJw=�Ĳ���ؕ��+�Ϧ��<}���vm�6S�WK���-	ǧYrC�CD/Qޢ��j���R�S�\\�\n��}�����\Zhc�k�m��?~�*_Ď��N\0���h@��ɨ�NۣO�J4�����llK��^^cب\0Kl����:�p�a@\0�F_���[X3n��k�6�$��`�S����*�j6.86j��jmN�P���K��A����O�q�L��|�C�ѡM�Ds<���k����7S\0x4�ج���r��@��E\0�r`�r\0���o��K����mr襫��UK�}�k��-�y9\0�\rY8�+_X�hvp�尤Fݽ���\'��.�H.�D�Fll��d2�ͩ�����*�����eW�`����\'I�*��>��Z��x}N�o;h���ԝ?�9�/Siu:uZ������\\��܋��Cҝ$�jm[��v*)7�?��zɟ_UӇo����3\0���׻�����r����=����t ��P�y+G�uI	�L�ɘf~�=G�L�;��}��?\r�h���+\\�A��Z����\0�^���Z�V�uqqyٕ���-Dy��`�o7��4������ԭN��UL:\r\0�t6669.�)�r��7Zn]0vƮ�����Լ�w����7��GF���u��c�w����~笣gB���I�%�nڤT��R��c_���Ϝ���������{D��SÁ	]\0(;j۪�=y�>Q���A������j��\'Kt�����U�����v®h��u�\Z��,pyQ��k3� �q7��W;W��yUéq��L|�^յ�\r]8�Ez6+ծ�K�$޾���㪁9���;F\0����,��wM��]|\n��X�<���(���ZB/�iV�e���S��m\0pzB�fvj\0�zuY��W)����\\}66��=\0��Λ�x�\0Ą�2�{B���{�V���Jv9��.<y�!�\"���Ը�eX��f��w���8^����_���cv����?�W�ˤ�*:�@DyQ^c�8����/�M�Z\\662::�D[ɱ��\0\0��uNд�#6�Ho�H:�����c�X��K��&c��R����u�t9���s��XS��Ё{�L=���cJ��s�Z����q���KQP�.W��=�Q��A�ǘB�l�\0h���.�l��.֥�ƴ�l��ڬ}K�vʾ��O���\Z¶O��-�hש�j�����=�.��iI{Dqѧ��x��x��<��G��\\���3\0�ӯ��ؼ1hټ�;p�Q^��A��on]h�����$-j��Uj�L�u��t.U�f��@W \Z��s�.��6�-���!�#��/�޴��J��5���C�݄�;_�f�}}1F\\����5k�C\r\0��Us\n<\n�Cf6w0zK��V�]Zp��M��9������I8��`���{�ݞ��}kØZ�Y���?>|�����>�}����/Z�m��܁�;��*�[�bŊ˹��\r����o���NO{�e�qK�/ţ@��ƭ����F\0�BM���rX��@�_�vn���_�&?� ��(�p�!��[�87��ʹm�ޞz6���Lf\0�G4���h�p�;��\r�\0@���0�M��V�[g�f89��;\r�v����F\r ���O�:g ��\0����Ԯ��\n0Ǉ�Y\0D���o\08T�dB-G�\n�Sr׮Bm{}ܳ��ڮ]ޚi#\0��N��o���[2m���}��9��^}Dy�9*��m\0E��^�	\ZSM��f7g-2�Y2�=�m7qd�1�F��.�����g���/������J���X㾝|�\0,���wCr�E�Ą��d�o�\n\rI��#�\0z�~���L�V0ԭ[z���IPjܱFzK��֫Ѡ��;_\r�{���m/D�p�Qz�8��Kd�8�n��e��O:	��8�(�0l� �S�����eW���!�DDDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8��@���OF��w��\'^�4>�f��������V5\'ܽ�,���D�����򾔠ճ�:~פF��g��))}�|\\�\0T��*z٫bw}�d̹�-l\Z��kN]�5�?�i>���Y��)��|!�g�\ry����<5�6v�Zï\\N�\\Sg�c��L�v�3b˪N�5 �����(�K����~|r��ZGϚu����h?̉�.�t�zӠ�6�M�o���yݾ��|꺹h�0\Z3\Z94:��pbL����<P��ޞ�u�ԠMk���gٴ%\'�.�-�t��Gl�W1�o�����LD���.��������N�_iwb�QGO�ַ猡�#~��~�����\0�Zoo\0���T\0`?s<,�ڄV�&d�ʭ��c+�)��ʵ�xŝ=z˽t��ы���V5uςU	�?+4��|\0�x�����Ƶ���׾�t\0��n������%lR��ƺ�)�{���^�� ��,�{�+�UA��l��u��������[��6߰�����m�uz�ݢ��<~���?���7o��ʶ�Ϋ���\\��\Z�h�w�����:h�^4�O�\"*�p585��[5W�n���:���WԚ+�pe���P��ૉ���S�끁�(/������4�\Z}���œ��rNUܷrI���2��w�d�������MH�,�\'�^0�u�k4\Zu�k	�e=m�\0����Osל��\0c̭���agN�4��fJ㸟����\\���\Z�$��xȦa=פ���D��ݿxO�]�C�ݿ�X��V���\r�P�pA��%n9��W�x�z�xw�������/d�Ɲ��_=~(�\r�Z0������������;c��ܪ�W��c�l�}�im���DD�5�E���k\rW�wjcW�Y�q�g���4��NCL�0iK�E\n�����3�y@筚�x����m/ǸհO��L��c流��svs��g�����(/�cȂY��zϱ�u�Թ��ߎ����R�E��Z�i�����\0h����yB;\0i�[g�?���K~9�a�����>��m\0��S[v�va�o�=uHKs,d��sސ-S#����-�Z�̬顅=40��qq�G�>k�{Ln�?�E\\�J���g�E��;߽��\n�n[���(�c� �Ӵ�E\\��e�����w����}�}��;��۪��������M]�w���ۉ>��cɲ;*��>*C�R��O�jX�l>U�ݛ�1�&�4Z���{��4@źn\0�.�΀�o��&c�z�O��4����˻�8���\r��\0��D����[�>��Ѐ���z�t5<��#׋Et�?�eˇ����ai}��X��x�m�cגL�g�R�ǥX����|_a�~l\0K��cA��5K9�ծU��=s2�y�rkת?B�2�^�~�X���3߇�^�`A�\Z�D��k��[�~_,߾ezk�����c2QI\r��d\0Krt�@Z�ݨl�.?kwx�`T1�����R���4m[h�ٽ,���˷�0��86���QQ!I���ye,�k��,�^���n����t�T��3��=�������}���6�.j��1��o��o���4]W��Y���3O�өǌ	����hp���=���J1\'\\;���[Z\0H>��t����ԫ�R�#{�i��Ν�I�tx��̷�\0$-1&.�d�����t��|\"z\r��N�zP�ml�����m�S�\noT��}����3�J�:pH���~�v}�oZ�.pA�>+��}���.����zu��bY��ǥm�q��qlۊeۖ-�r\0�n&�ً֗�hY[ۘ$��Q 0�]��K�\0��]P���\"z�T\"��%z�bccM&��lNMMMNNV�T>>>/�R�x��d���6=����9�T�FI���`I�q.��R���K�z�N��j�Z�����eW��&�pQ:��.[��yT���Q�RU_t��(��g\"\"\"R[8��S�Tj��b�h�Z�^��� \"*��&�1\Z�AAA...666���F��))�-����Q��*��`0��JQ���\Z���\neΠ�����6�j�V����{�5\"�bccu:��E��A/\0=��6�j���mtttZZ��$�\"))�`0��ب�j�l�|�U�<����bM\Z���=|��]^�M�_`6��޽kccc�Ra����\Z����>%%%88�����2�ͷn�;;;�V����Ey�H��Z9nܸ����kG��JJJ�z���htpp�l���Uyٵ�<�3��󗘘(�f��b�X,&��d2%\'\'�FgggWWW[[[�^��+K�Z��������۰���~�~��R�fGG��F�`���\Z8\0��%s���Դ�4���_?�C���t:븍̞�.�e� Eq�/R�J��N��}<�̷9k�0�L��=�R�@� R)%{氶d�T*��b}_��F�I�Z��j #�?Ѝ´A/\0)(3s\0�Ǝ�����ˮ#�k�:my�Pndkwdڠ������9�?d���`�X^v�^�j�`ڠ���g}Gˌ֟�������x�1�Q�^0^�BDDD���K\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��������ADDD�c� \"\"\"�1p��8���HqDDD�8\"\"\"R)��\0�7��BاR\0\0\0\0IEND�B`�','image/png','31.48KB','job_headers','NH7NGCC7441061F336TWI4FH'),('FFZJ67EJI5ATHHHG7939QBSX','u4.png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0�\0\0\0�8�\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��o�d\0\0IDATx^��;R$I�b�L���8Zi�\n	�ˡfmm���(�]m�6xN�H�-駷��_Ӄ�1������o�� @�\0 @��I���k���|����S6��y�� @�\0 @������_X @�\0 @�\0�ʆJMY @�\0 @���\r�\0 @�\0 P+0����ŗ=֢J#@�\0 @�\0�?_*��(R�on @�\0 �$�lh�K�\0 @�\0R�\r��77 @�\0hP64��%@�\0 @�\0�ʆ�͛�\0 @�\04	(�`� @�\0 @�\0�TeC���M�\0 @�\0��\rM�b	 @�\0 @�@��<�X��c���&@�\0 @�\0\nN���eC!�( @�\0 @`R6� @�\0 @�@���\r��� @�\0 @�@���!�\n\0 @�\0 @�\0�ʆZOi @�\0 @ ^@�\0 @�\0 @�\0�ZeC��4 @�\0 /�l��\0 @�\0 @�@��<�X��cm�4 @�\0 @ R�t:M^6D��� @�\0 @�O@��g+�\0 @�\0D\n(\"�nh @�\0 �\'�l賕L�\0 @�\0\"�\r�k74 @�\0�P6��J&@�\0 @�\0�ʆȵ�\0 @�\0�	(�l% @�\0 @�\0�HeC��\rM�\0 @�\0��1�r8�N�L�\0 @�\0�����ˆ�u�\0 @�\0�#�lX��) @�\0 @ F@��j� @�\0 @�\0�u�\r�8;�\0 @�\0�(bVmP @�\0 ����ag� @�\0 @�\0�eC̪\rJ�\0 @�\0�P6��� @�\0 #0�1���3�A	 @�\0 @�\0�>���<y���+�\0 @�\0D\n(\"�nh @�\0 �\'�l賕L�\0 @�\0\"�\r�k74 @�\0�P6��J&@�\0 @�\0�ʆȵ�\0 @�\0�	(�l% @�\0 @�\0�HeC��\rM�\0 @�\0��1Ʋ���N�L�\0 @�\0�\\.��ˆ�u�\0 @�\0�#�lX��) @�\0 @ F@��j� @�\0 @�\0�u�\r�8;�\0 @�\0�(bVmP @�\0 ����ag� @�\0 @�\0�eC̪\rJ�\0 @�\0�P6��� @�\0 #0�1��~3�A	 @�\0 @�\0�>���2y���+�\0 @�\0D\n(\"�nh @�\0 �\'�l賕L�\0 @�\0\"�\r�k74 @�\0�P6��J&@�\0 @�\0�ʆȵ�\0 @�\0�	(�l% @�\0 @�\0�HeC��\rM�\0 @�\0��\r}��	 @�\0 @�@��<�Xv�]���&@�\0 @�\0j����eC��4 @�\0 /�l��\0 @�\0 @�@�����S\Z @�\0�P6�_\0 @�\0 @�V@�P�)�\0 @�\0�(�\0\0 @�\0 P+�l���F�\0 @�\0��\r�W\0\0 @�\0����n��M�F�\0 @�\0D\n\\���ˆ���\0 @�\0�	(�l% @�\0 @�\0�HeC��\rM�\0 @�\0��\r}��	 @�\0 @�@���!r�&@�\0 @�\0}ʆ>[� @�\0 @ R@��vC @�\0 @�\0�>eC��d @�\0 )0�1��v9��	 @�\0 @�\0�Z���6y�Pk*�\0 @�\0�(�\0\0 @�\0 P+�l���F�\0 @�\0��\r�W\0\0 @�\0�P6�zJ#@�\0 @�\0�ʆ�+\0�\0 @�\0�\n(j=� @�\0 @�\0�xeC�\0@�\0 @�\0j�\r��� @�\0 @�@��<�X��m<\0 @�\0 @��n���eß;J @�\0 @�\0�!�lp @�\0 @�\0�ReC)�0 @�\0 @@�� @�\0 @�\0�ʆRNa @�\0 @���� @�\0 @�\0J�\r��� @�\0 @�\0e�;@�\0 @�\0�\n�c�e�ٔ�\n#@�\0 @�\02����eC��MM�\0 @�\0��\rm��	 @�\0 @�@���!s�&@�\0 @�\0mʆ6Z� @�\0 @ S@ِ�wS @�\0 @�\0�6eC�` @�\0 �)�l�ܻ�	 @�\0 @�@�����V0 @�\0����f�ɜ�� @�\0 @�@���~��l(%F�\0 @�\0(� @�\0 @�T@�P�)�\0 @�\0P6� @�\0 @�@�����S @�\0 �lp @�\0 @�\0�ReC)�0 @�\0 @@�� @�\0 @�\0��cy~~.\rF�\0 @�\0d\n|O^6d��� @�\0 @�M@��F+�\0 @�\0d\n(2�nj @�\0 �&�lh�L�\0 @�\02����~=:�������C�\0 @�\0�>>>���G?��RRRw@\0\0\0\0IEND�B`�','image/png','3.13KB','job_headers','EGI1BF81XF2Q34AFV9XX1PVK'),('ST12PBWTETRJAHZ7MCSECN68','u4.png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0�\0\0\0�8�\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��o�d\0\0IDATx^��;R$I�b�L���8Zi�\n	�ˡfmm���(�]m�6xN�H�-駷��_Ӄ�1������o�� @�\0 @��I���k���|����S6��y�� @�\0 @������_X @�\0 @�\0�ʆJMY @�\0 @���\r�\0 @�\0 P+0����ŗ=֢J#@�\0 @�\0�?_*��(R�on @�\0 �$�lh�K�\0 @�\0R�\r��77 @�\0hP64��%@�\0 @�\0�ʆ�͛�\0 @�\04	(�`� @�\0 @�\0�TeC���M�\0 @�\0��\rM�b	 @�\0 @�@��<�X��c���&@�\0 @�\0\nN���eC!�( @�\0 @`R6� @�\0 @�@���\r��� @�\0 @�@���!�\n\0 @�\0 @�\0�ʆZOi @�\0 @ ^@�\0 @�\0 @�\0�ZeC��4 @�\0 /�l��\0 @�\0 @�@��<�X��cm�4 @�\0 @ R�t:M^6D��� @�\0 @�O@��g+�\0 @�\0D\n(\"�nh @�\0 �\'�l賕L�\0 @�\0\"�\r�k74 @�\0�P6��J&@�\0 @�\0�ʆȵ�\0 @�\0�	(�l% @�\0 @�\0�HeC��\rM�\0 @�\0��1�r8�N�L�\0 @�\0�����ˆ�u�\0 @�\0�#�lX��) @�\0 @ F@��j� @�\0 @�\0�u�\r�8;�\0 @�\0�(bVmP @�\0 ����ag� @�\0 @�\0�eC̪\rJ�\0 @�\0�P6��� @�\0 #0�1���3�A	 @�\0 @�\0�>���<y���+�\0 @�\0D\n(\"�nh @�\0 �\'�l賕L�\0 @�\0\"�\r�k74 @�\0�P6��J&@�\0 @�\0�ʆȵ�\0 @�\0�	(�l% @�\0 @�\0�HeC��\rM�\0 @�\0��1Ʋ���N�L�\0 @�\0�\\.��ˆ�u�\0 @�\0�#�lX��) @�\0 @ F@��j� @�\0 @�\0�u�\r�8;�\0 @�\0�(bVmP @�\0 ����ag� @�\0 @�\0�eC̪\rJ�\0 @�\0�P6��� @�\0 #0�1��~3�A	 @�\0 @�\0�>���2y���+�\0 @�\0D\n(\"�nh @�\0 �\'�l賕L�\0 @�\0\"�\r�k74 @�\0�P6��J&@�\0 @�\0�ʆȵ�\0 @�\0�	(�l% @�\0 @�\0�HeC��\rM�\0 @�\0��\r}��	 @�\0 @�@��<�Xv�]���&@�\0 @�\0j����eC��4 @�\0 /�l��\0 @�\0 @�@�����S\Z @�\0�P6�_\0 @�\0 @�V@�P�)�\0 @�\0�(�\0\0 @�\0 P+�l���F�\0 @�\0��\r�W\0\0 @�\0����n��M�F�\0 @�\0D\n\\���ˆ���\0 @�\0�	(�l% @�\0 @�\0�HeC��\rM�\0 @�\0��\r}��	 @�\0 @�@���!r�&@�\0 @�\0}ʆ>[� @�\0 @ R@��vC @�\0 @�\0�>eC��d @�\0 )0�1��v9��	 @�\0 @�\0�Z���6y�Pk*�\0 @�\0�(�\0\0 @�\0 P+�l���F�\0 @�\0��\r�W\0\0 @�\0�P6�zJ#@�\0 @�\0�ʆ�+\0�\0 @�\0�\n(j=� @�\0 @�\0�xeC�\0@�\0 @�\0j�\r��� @�\0 @�@��<�X��m<\0 @�\0 @��n���eß;J @�\0 @�\0�!�lp @�\0 @�\0�ReC)�0 @�\0 @@�� @�\0 @�\0�ʆRNa @�\0 @���� @�\0 @�\0J�\r��� @�\0 @�\0e�;@�\0 @�\0�\n�c�e�ٔ�\n#@�\0 @�\02����eC��MM�\0 @�\0��\rm��	 @�\0 @�@���!s�&@�\0 @�\0mʆ6Z� @�\0 @ S@ِ�wS @�\0 @�\0�6eC�` @�\0 �)�l�ܻ�	 @�\0 @�@�����V0 @�\0����f�ɜ�� @�\0 @�@���~��l(%F�\0 @�\0(� @�\0 @�T@�P�)�\0 @�\0P6� @�\0 @�@�����S @�\0 �lp @�\0 @�\0�ReC)�0 @�\0 @@�� @�\0 @�\0��cy~~.\rF�\0 @�\0d\n|O^6d��� @�\0 @�M@��F+�\0 @�\0d\n(2�nj @�\0 �&�lh�L�\0 @�\02����~=:�������C�\0 @�\0�>>>���G?��RRRw@\0\0\0\0IEND�B`�','image/png','3.13KB','job_headers','EGI1BF81XF2Q34AFV9XX1PVK'),('T0ZEHQO1KHFG2X77J2304PQV','u8.png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0)\0\0\08_�|\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��o�d\0\0WIDATx^��A\n�@��iϥ+/�7�R��^�r���R^a�O�^V}LӴ����}�����\\ض�����{�5���	���<#?�E B@sEhцh�.��ws������8��sEF�6D�sq�[듂�+4��Qb1J����X�b�z\\�! ���|�bQ,���q.�Ź��y�\n-���4W3W�� v.;��+�\\篈sq.Ε��Uh��w��T�����|�sٹ�\\��:E��sq��s��B}�;m�\"�(�b3�� ��b5*�(�(�btj��O�sq.���9t�(}�}5�U��0J��e��������sG�P�׃@���,�x��R��%�m�\0\0\0\0IEND�B`�','image/png','450B','job_headers','XSF060BUDZNTYVAU1VALQ89S');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `status` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `create_date` date NOT NULL,
  `create_by` int(11) NOT NULL,
  `last_update_date` date NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_code` (`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`user_code`,`user_name`,`status`,`password`,`create_date`,`create_by`,`last_update_date`,`last_update_by`,`role_id`) values (2,'ADMIN','管理员','Y','admin','2011-11-26',1,'2012-09-02',2,3),(4,'07420207','小杨123','Y','123','2012-04-11',2,'2014-09-30',2,6),(5,'07420205','小毛','Y','123456','2012-04-12',2,'2012-05-08',2,6),(6,'07420206','小徐','Y','123456','2012-05-06',2,'2012-05-23',2,6),(7,'07420101','小明','Y','123456','2012-05-22',2,'2012-08-23',2,6),(8,'07420102','小王','Y','123456','2012-07-07',2,'2012-08-23',2,6),(9,'10010','杨永','Y','123456','2012-07-07',2,'2012-09-02',2,5),(10,'07420103','小军','Y','123456','2012-07-07',2,'2012-08-23',2,6),(11,'10020','尹小军','Y','123456','2012-07-27',2,'2012-09-02',2,5),(12,'07420221','小黄','Y','123456','2012-07-28',2,'2012-07-28',2,6),(13,'07420104','小海','Y','123456','2012-07-28',2,'2012-08-06',2,6),(14,'07420105','小朱','Y','123456','2012-07-28',2,'2012-08-06',2,6),(15,'07420106','小李','Y','123456','2012-07-28',2,'2014-07-03',2,6),(16,'07420201','小郑','Y','123456','2012-07-29',2,'2012-08-06',2,6),(17,'07420203','张三','Y','123456','2012-07-29',2,'2012-08-06',2,6),(18,'07420202','小曾','Y','123456','2012-07-29',2,'2012-08-06',2,6),(19,'07420204','小牛','Y','123456','2012-07-29',2,'2012-08-06',2,6),(21,'20000','教务处老师','Y','123456','2012-08-27',2,'2013-02-26',2,7),(22,'07400102','小明','Y','123456','2012-08-30',21,'2015-01-07',2,6),(23,'07400103','小胡','Y','huangjiong','2012-08-30',2,'2013-04-19',2,6),(24,'07400104','小马','Y','123456','2012-08-30',2,'2012-08-30',2,6),(25,'07440101','小段','Y','123456','2012-09-22',21,'2012-09-22',21,6),(26,'07440201','小毛','Y','123456','2012-09-27',2,'2012-09-27',2,6),(27,'07420107','满1','Y','123','2014-07-03',2,'2014-07-03',2,5),(28,'123','123','Y','213','2014-07-03',2,'2014-07-03',2,NULL),(32,'10086','test_1234','Y','123456','2014-07-29',29,'2014-07-29',29,3);

/* Function  structure for function  `nvl` */

/*!50003 DROP FUNCTION IF EXISTS `nvl` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `nvl`(param1  VARCHAR(255),param2   VARCHAR(255)) RETURNS varchar(255) CHARSET utf8
BEGIN
  
 RETURN(IFNULL(param1,param2));
 END */$$
DELIMITER ;

/* Function  structure for function  `to_char` */

/*!50003 DROP FUNCTION IF EXISTS `to_char` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `to_char`(p_date DATETIME,p_format varchar(255)) RETURNS varchar(255) CHARSET utf8
BEGIN
    
    set p_format = UPPER(p_format);
    
    set p_format = REPLACE(p_format,'YYYY','%Y');
    
    SET p_format = REPLACE(p_format,'MM','%m');
    
    SET p_format = REPLACE(p_format,'DD','%d');
    
    SET p_format = REPLACE(p_format,'HH','%H');
    
    SET p_format = REPLACE(p_format,'MI','%i');
    
    SET p_format = REPLACE(p_format,'SS','%s');
    return date_format(p_date,p_format);
    END */$$
DELIMITER ;

/* Function  structure for function  `to_date` */

/*!50003 DROP FUNCTION IF EXISTS `to_date` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `to_date`(p_value varchar(255),p_format varchar(255)) RETURNS datetime
BEGIN
	SET p_format = UPPER(p_format);
    
	SET p_format = REPLACE(p_format,'YYYY','%Y');
    
	SET p_format = REPLACE(p_format,'MM','%m');
    
	SET p_format = REPLACE(p_format,'DD','%d');
    
	SET p_format = REPLACE(p_format,'HH','%H');
    
	SET p_format = REPLACE(p_format,'MI','%i');
    
	SET p_format = REPLACE(p_format,'SS','%s');
    
	return str_to_date(p_value, p_format); 
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
