/*
SQLyog v10.2 
MySQL - 5.5.46 : Database - stuattendance
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stuattendance` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stuattendance`;

/*Table structure for table `admininfo` */

DROP TABLE IF EXISTS `admininfo`;

CREATE TABLE `admininfo` (
  `admin_id` varchar(32) NOT NULL,
  `admin_name` varchar(32) DEFAULT NULL,
  `admin_pwd` varchar(32) DEFAULT NULL,
  `admin_email` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admininfo` */

/*Table structure for table `attendanceinfo` */

DROP TABLE IF EXISTS `attendanceinfo`;

CREATE TABLE `attendanceinfo` (
  `att_id` varchar(36) NOT NULL,
  `selectcourse_id` varchar(36) DEFAULT NULL,
  `recordtime` varchar(20) DEFAULT NULL,
  `recordstatus` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`att_id`),
  KEY `selectcourse_id` (`selectcourse_id`),
  CONSTRAINT `attendanceinfo_ibfk_1` FOREIGN KEY (`selectcourse_id`) REFERENCES `selectcourse` (`selectcourse_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `attendanceinfo` */

insert  into `attendanceinfo`(`att_id`,`selectcourse_id`,`recordtime`,`recordstatus`) values ('09ceea4a-e959-48a9-9144-9ca4688ef83d','aaa','2016年09月13日',4),('10d141e3-3d35-4080-b194-ca73a82761cb','aar','2016年09月04日',0),('2557ee55-3a62-494f-9a4b-2f03157f661b','aar','2016年09月04日',0),('4548015d-2dcf-4509-ba74-f744664c299d','tt','2016年09月04日',0),('45787c48-5414-4d6c-90aa-4d4a149e7f73','bbb','2016年08月05日',0),('51060379-76c8-48ec-9a0a-832aefd9ef84','tt','2016年09月04日',0),('57ad8d45-17a0-4290-b1bc-fc9573598140','tt','2016年09月04日',0),('5e98c26c-652f-41a9-8f5b-30c3d1a5baf4','abc','2016年09月15日',0),('61761b80-e761-47e8-ab20-3062a4792f93','18863d2c-d04f-45eb-afba-5f4eb62daef0','2016年09月14日',0),('921f5825-eef2-4882-b19c-f2e7202a2ee3','aar','2016年09月02日',0),('990041af-0250-4c2e-8ee4-4eea2925ccd7','abc','2016年09月15日',0),('a01ed22f-c338-4b05-8949-206e228bedae','aar','2016年09月27日',1),('a63b77c5-4c25-4f52-ac76-b530895b60f9','aaa','2016年09月06日',4),('b4d48ffc-2aeb-43a2-a2fd-e55732af9640','tt','2016年09月04日',0),('b5bc53bd-ff03-44d2-9c6c-c1d3661c0e04','021bc45c-b40d-4fd9-ac02-bf9efa3a2a39','2016年09月20日',0),('b74af5f1-0dea-4c12-a5df-67fa48b8f3f1','cccc','2016年09月04日',1),('c82087dd-1562-42e1-a63d-9b337bc2a83d','bbb','2016年09月04日',0),('d37d6b88-e776-45bb-8673-fa98b0001d40','aar','2016年09月08日',1),('d8e5da0e-487f-4eed-8ef0-d30fb8a23314','bbb','2016年08月05日',0),('e06a5d8f-e834-4441-84af-23e98b859438','aaa','2016年09月27日',0),('e3c418e0-3dd9-4096-8a5a-bbc312058234','bbb','2016年09月04日',0),('f5e68aa6-e64b-4c2a-8eb3-8ecd89262ff4','aar','2016年09月04日',0);

/*Table structure for table `classinfo` */

DROP TABLE IF EXISTS `classinfo`;

CREATE TABLE `classinfo` (
  `class_id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) DEFAULT NULL,
  `course_name` varchar(32) DEFAULT NULL,
  `class_start_week` int(11) DEFAULT NULL,
  `class_end_week` int(11) DEFAULT NULL,
  `class_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `classinfo_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacherinfo` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classinfo` */

insert  into `classinfo`(`class_id`,`teacher_id`,`course_name`,`class_start_week`,`class_end_week`,`class_time`) values ('222','001','数据库',1,18,'2月3日'),('223','001','数据结构',1,17,'1月'),('224','002','高等数学',2,16,'2月');

/*Table structure for table `collegefaculty` */

DROP TABLE IF EXISTS `collegefaculty`;

CREATE TABLE `collegefaculty` (
  `college_name` varchar(32) DEFAULT NULL,
  `faculty_name` varchar(32) DEFAULT NULL,
  KEY `college_name` (`college_name`),
  KEY `faculty_name` (`faculty_name`),
  CONSTRAINT `collegefaculty_ibfk_1` FOREIGN KEY (`college_name`) REFERENCES `collegeinfo` (`college_name`),
  CONSTRAINT `collegefaculty_ibfk_2` FOREIGN KEY (`faculty_name`) REFERENCES `facultyinfo` (`faculty_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collegefaculty` */

insert  into `collegefaculty`(`college_name`,`faculty_name`) values ('重庆邮电大学','软件工程'),('重庆邮电大学','自动化学院'),('西南大学','软件工程');

/*Table structure for table `collegeinfo` */

DROP TABLE IF EXISTS `collegeinfo`;

CREATE TABLE `collegeinfo` (
  `college_name` varchar(32) NOT NULL,
  `college_addr` varchar(32) DEFAULT NULL,
  `college_contact` varchar(32) DEFAULT NULL,
  `college_tel` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`college_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collegeinfo` */

insert  into `collegeinfo`(`college_name`,`college_addr`,`college_contact`,`college_tel`) values ('西南大学',NULL,NULL,NULL),('重庆邮电大学',NULL,NULL,NULL);

/*Table structure for table `facultyinfo` */

DROP TABLE IF EXISTS `facultyinfo`;

CREATE TABLE `facultyinfo` (
  `faculty_name` varchar(32) NOT NULL COMMENT '院系名称',
  `faculty_addr` varchar(32) DEFAULT NULL,
  `faculty_contact` varchar(32) DEFAULT NULL,
  `faculty_tel` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`faculty_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `facultyinfo` */

insert  into `facultyinfo`(`faculty_name`,`faculty_addr`,`faculty_contact`,`faculty_tel`) values ('自动化学院',NULL,NULL,NULL),('软件工程',NULL,NULL,NULL);

/*Table structure for table `selectcourse` */

DROP TABLE IF EXISTS `selectcourse`;

CREATE TABLE `selectcourse` (
  `selectcourse_id` varchar(36) NOT NULL,
  `class_id` varchar(32) DEFAULT NULL,
  `stu_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`selectcourse_id`),
  KEY `class_id` (`class_id`),
  KEY `stu_id` (`stu_id`),
  CONSTRAINT `selectcourse_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classinfo` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selectcourse_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `studentinfo` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `selectcourse` */

insert  into `selectcourse`(`selectcourse_id`,`class_id`,`stu_id`) values ('021bc45c-b40d-4fd9-ac02-bf9efa3a2a39','222','201654'),('0649e573-2ad8-4c93-b490-5e6fed7ed5db','222','201694'),('0653ffc6-7eb3-4538-a02b-da842698eced','222','20164'),('07069a78-8444-4a03-b97e-1a19d7a657d7','222','201685'),('0a66f12a-3cc7-434d-8a0c-921ad127fa7d','222','201656'),('0c0c942c-78b0-4f4c-9090-8665b2a97337','222','201623'),('0ebe6d49-0b35-4282-8f3b-5d6ed7d79137','222','201612'),('16dfacb5-c7fa-474b-be22-e69d1344329b','222','201688'),('1797105b-9f60-43e7-83c8-549443b77b4f','222','201649'),('17fd30e1-cd15-4910-876d-6a0c0567300d','222','201682'),('18863d2c-d04f-45eb-afba-5f4eb62daef0','222','201669'),('1b2386f2-59f7-42b9-b617-5399a572d3d9','222','201647'),('1d4380ac-ee99-44ba-abe5-fda7d57d4cc1','222','201655'),('1d62d771-e7fb-427d-8ac7-9802fc6db6f2','222','201637'),('1e65254e-938d-4140-9491-275259bbd29b','222','201638'),('1f37229f-e9be-4fa0-8c80-3f7601440f40','222','201616'),('222','222','11111'),('2287e24b-69f4-46f1-8b47-e082b64d1843','222','201686'),('22f0a8ab-2c58-4ebc-b463-a17127fba2fc','222','201692'),('2bae8486-edf3-45ed-854f-715ca50906e3','222','201628'),('2c2a98d1-c79c-43e3-8e5c-6989cfe9b50a','222','201632'),('2e4f009d-542d-4245-9270-0cf3a26d4a4e','222','201643'),('333','222','999999'),('33944bf5-a2a8-481c-ba57-9fec2e17f7b8','222','201690'),('34963881-e38e-4478-9a8e-4302e704abbc','222','201630'),('39052272-0048-40e4-a3d1-b75eba014e1f','222','201681'),('3d84e0f9-4055-4dde-b83c-7f3937a081df','222','201678'),('47970486-baf4-4e7e-affe-1829ca784685','222','201625'),('4a09aa96-784e-47cf-9168-c0f92b1bdfef','222','201663'),('52139025-8665-4891-be5f-1540f5e5493c','222','201615'),('533a26ae-1494-4077-8a87-51c60fdc2b6d','222','201672'),('555','222','222222'),('55648082-ffbf-4b34-9b57-4c030ad95e55','222','201680'),('55c45091-a2ba-48f9-b9b3-d62e3439dd3a','222','201650'),('57ecfbd6-37f2-4ade-826d-5e1f91074af1','222','201635'),('592ff98e-8d18-49cc-af7e-15bb68343619','222','201662'),('599f2dfa-3b01-4f30-9351-8e71de045823','222','201676'),('5efb32f2-ba14-439b-8ed3-a6fd4f5bae3e','222','201659'),('61f0f954-0481-4d82-87fa-4787115aa5d8','222','201617'),('62091fd8-d481-4b4d-908d-dbe25cf4fb9e','222','20166'),('62d3d881-29b9-4d0e-a102-098c9dc4f07d','222','201693'),('63e189df-9bfd-4d46-8d73-c19d8ee59009','222','20167'),('6fd9df74-4ef9-49c0-a794-cef6f5d387fc','222','201691'),('797d1613-9a3b-4e11-a098-ae447458f95d','222','201699'),('7b358462-2bce-4726-9d30-bf8111168f2f','222','20160'),('7cee9fca-840f-4027-bbc4-d5e46ae47a80','222','201665'),('7e6cd653-bb3d-4aee-b8c2-2bf577f1f64d','222','20169'),('81260e8c-c04b-438b-9d98-6ff18347c000','222','201627'),('82c4e1c8-d67d-4736-af7e-8d8d2a45f355','222','201677'),('840736ec-acdd-4dd1-9338-68e102ba1dca','222','201626'),('848d7fe3-37d0-4c2c-bf85-6e93af63820f','222','20165'),('8b5a94f1-5020-447b-a4d4-cf0901a20b1a','222','201646'),('8ce414d5-b136-446e-b8ec-1e77f74e12d0','222','20168'),('9153e3ac-6133-43a5-8fc6-44ef68815866','222','201658'),('91f3f125-f0dc-4930-8c75-6374fe12647f','222','20163'),('944c37c9-4c6a-4a20-b085-f1f0bd9ce1b4','222','201624'),('9464aeed-67bb-41de-a6cd-0fb8d9ecc749','222','201668'),('95dd04a9-d0d8-4f2a-85fa-547d6dc7806e','222','201634'),('98a01e43-47b6-4ffd-82a8-077044eac7fc','222','201618'),('9b5e5017-f52c-47d5-80b6-cb9d9219b341','222','201679'),('9b990aee-b8fc-4e21-bdfa-45dfdf05e147','222','201697'),('9c9b8a5c-8c96-4b08-a6bf-d93157aab459','222','201652'),('9ccda0ac-f1d5-46ef-85c2-06821d5b416d','222','201614'),('9e0a417c-18f1-4306-8275-9bd7c9b5aee7','222','20162'),('9f5eeb7d-5842-43b6-ae64-2453b7db65dd','222','201687'),('a49100bd-6bab-4e51-ba0b-5db112d04b2a','222','201641'),('a5c7842b-c204-471e-a011-c0cd080427cd','222','201675'),('a6d49797-9117-41d5-938d-41fb5816e35c','222','201666'),('aaa','222','122'),('aar','222','123'),('abc','224','122'),('ac99cfbb-e2aa-4c4b-8f7e-4b5837fbb64a','222','201674'),('acc','223','122'),('b1284105-7c30-402e-98c3-d1cbef6bc13d','222','201651'),('b2ed39ba-1ce5-4ab3-803c-a52a12380f7d','222','201673'),('b641337b-7fe4-4af7-9bcc-6e6d1d54b6e8','222','201653'),('bbb','224','123'),('bd5f3c19-d9d3-408b-97a3-3ebaf23d0a94','222','201631'),('bfeec796-14ac-4707-9bd7-50b814738f51','222','201689'),('c','222','123456'),('c1376e8d-4a35-48b4-ba67-d7a7b725338e','222','201670'),('c91651b2-cbb2-428a-bb6d-7e2cf08bc7b5','222','201621'),('cc','222','77777777777'),('cccc','222','222'),('ccf29729-1116-44a1-a6bd-ce07a0ff2d8a','222','201613'),('cd27638e-7792-4253-900b-8dfe39741885','222','201610'),('ce340528-61b2-45f3-a360-f3bbe4cb6fe3','222','20161'),('cee16d0b-46ac-47bb-bec3-6b995811e450','222','201639'),('cr','222','124'),('d373743d-3449-46a5-bf3d-90b2647dea5b','222','201642'),('d4d12c97-3531-4000-8b68-116742d8e78e','222','201671'),('d6161a1a-b606-4496-857a-fff37212700e','222','201633'),('d73965ef-06c0-4f75-b1a4-c94c367a9eb4','222','201660'),('d8bdacb5-6b3e-4baa-b7a0-37cfff5d88b8','222','201664'),('dbbdab7c-8cc7-4460-98fd-57051a8ad706','222','201644'),('e0ebdf85-7417-411b-b3ec-b0d3b2976deb','222','201619'),('e29fdc7e-119e-4726-944f-172f27915aee','222','201684'),('e7975a2c-88d7-47e3-b872-d118d2a7105a','222','201611'),('e852bd0f-7a91-4365-a19e-9af0b19415b2','222','201695'),('e8985aab-4011-41bc-95e8-058b039905d8','222','201640'),('ea8a7e43-1795-4143-94e8-8ec57a473c82','222','201683'),('ee5e95ee-76e3-490f-8fc3-3dba15ded67e','222','201667'),('efac62b1-6eb5-44ff-ae0c-c62e741a1ce7','222','201657'),('f0e86f46-b6af-45ad-b632-2a423d98f880','222','201629'),('f14963ac-1e25-471a-9133-9dce1136e154','222','201636'),('f172aade-f5cd-433b-8182-b9fb36b5f502','222','201620'),('f1f912eb-79f9-4d4c-b677-d33f0a144e06','222','201698'),('f52d703a-3033-480d-bb67-cb25e315b53a','222','201622'),('f5d66c47-5652-4421-9cd9-eeee7bbaabaf','222','201696'),('f89004f6-16c0-44ca-9e34-8493e0088af0','222','201661'),('f8aedb72-03e4-438e-8b74-b173b7447e22','222','201645'),('fe35ce00-29e8-4c39-9e64-2dfdc4be4c6c','222','201648'),('r','222','00000'),('rr','222','3333'),('tt','224','20160');

/*Table structure for table `studentinfo` */

DROP TABLE IF EXISTS `studentinfo`;

CREATE TABLE `studentinfo` (
  `stu_id` varchar(32) NOT NULL,
  `college_name` varchar(32) DEFAULT NULL,
  `faculty_name` varchar(32) DEFAULT NULL,
  `stu_name` varchar(32) DEFAULT NULL,
  `stu_pwd` varchar(32) DEFAULT NULL,
  `stu_email` varchar(32) DEFAULT NULL,
  `stu_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `college_name` (`college_name`),
  KEY `faculty_name` (`faculty_name`),
  CONSTRAINT `studentinfo_ibfk_1` FOREIGN KEY (`college_name`) REFERENCES `collegeinfo` (`college_name`),
  CONSTRAINT `studentinfo_ibfk_2` FOREIGN KEY (`faculty_name`) REFERENCES `facultyinfo` (`faculty_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `studentinfo` */

insert  into `studentinfo`(`stu_id`,`college_name`,`faculty_name`,`stu_name`,`stu_pwd`,`stu_email`,`stu_photo`) values ('00000','重庆邮电大学','软件工程','222',NULL,NULL,NULL),('11111','重庆邮电大学','软件工程','2222222',NULL,NULL,NULL),('122','重庆邮电大学','自动化学院','Mr.wang','123','10000@qq.com','d82e9890-c98d-421d-a082-8c6ffbf73703.png'),('123','西南大学','软件工程','隔壁老王','123','222@qq.com','cd39c439-922b-400b-80fd-5ca08eae2ce0.png'),('123456','重庆邮电大学','软件工程','老王','123',NULL,NULL),('124','重庆邮电大学','软件工程','小王小王','123','123@qq.com',NULL),('20160','重庆邮电大学','自动化学院','王尼玛','123','1453878150@qq.com','babef46f-3327-4d82-be71-407339516583.png'),('20161','重庆邮电大学','软件工程','test','123','1453878150@qq.com','e95df34f-d3cd-4514-baab-db6d6f624c48.png'),('201610','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201611','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201612','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201613','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201614','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201615','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201616','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201617','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201618','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201619','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('20162','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201620','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201621','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201622','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201623','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201624','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201625','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201626','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201627','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201628','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201629','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('20163','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201630','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201631','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201632','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201633','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201634','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201635','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201636','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201637','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201638','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201639','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('20164','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201640','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201641','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201642','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201643','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201644','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201645','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201646','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201647','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201648','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201649','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('20165','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201650','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201651','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201652','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201653','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201654','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201655','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201656','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201657','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201658','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201659','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('20166','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201660','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201661','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201662','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201663','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201664','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201665','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201666','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201667','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201668','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201669','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('20167','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201670','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201671','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201672','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201673','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201674','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201675','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201676','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201677','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201678','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201679','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('20168','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201680','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201681','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201682','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201683','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201684','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201685','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201686','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201687','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201688','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201689','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('20169','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201690','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201691','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201692','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201693','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201694','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201695','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201696','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201697','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201698','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('201699','重庆邮电大学','软件工程','test','123','1453878150@qq.com',''),('222','重庆邮电大学','软件工程','222222',NULL,NULL,NULL),('222222','重庆邮电大学','软件工程','333',NULL,NULL,NULL),('3333','重庆邮电大学','软件工程','yyyyy',NULL,NULL,NULL),('6666','重庆邮电大学','软件工程','88888',NULL,NULL,NULL),('77777777777','重庆邮电大学','软件工程','222',NULL,NULL,NULL),('999999','重庆邮电大学','软件工程','8888888',NULL,NULL,NULL);

/*Table structure for table `teacherinfo` */

DROP TABLE IF EXISTS `teacherinfo`;

CREATE TABLE `teacherinfo` (
  `teacher_id` varchar(32) NOT NULL,
  `faculty_name` varchar(32) DEFAULT NULL COMMENT '所属院系',
  `college_name` varchar(32) DEFAULT NULL,
  `teacher_name` varchar(32) DEFAULT NULL,
  `teacher_pwd` varchar(32) DEFAULT NULL,
  `teacher_email` varchar(32) DEFAULT NULL,
  `teacher_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `faculty_name` (`faculty_name`),
  KEY `college_name` (`college_name`),
  CONSTRAINT `teacherinfo_ibfk_1` FOREIGN KEY (`faculty_name`) REFERENCES `facultyinfo` (`faculty_name`),
  CONSTRAINT `teacherinfo_ibfk_2` FOREIGN KEY (`college_name`) REFERENCES `collegeinfo` (`college_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacherinfo` */

insert  into `teacherinfo`(`teacher_id`,`faculty_name`,`college_name`,`teacher_name`,`teacher_pwd`,`teacher_email`,`teacher_photo`) values ('001','软件工程','重庆邮电大学','范时平','222','123@163.com','454058d0-e85c-471a-8db4-45539e309d4f.png'),('002','软件工程','重庆邮电大学','李辉','222','123123@qq.com','65ebe9c3-77c1-4c8e-83b7-edc7aacce921.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
