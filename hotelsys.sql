/*
Navicat MySQL Data Transfer

Source Server         : Demo1
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : hotelsys

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-03-25 19:08:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `Id` int(11) NOT NULL,
  `actname` varchar(255) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `introduction` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `realname` (`realname`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('1', 'tony', '333333', '张三');
INSERT INTO `administrator` VALUES ('2', 'ars', '777777', '五六');
INSERT INTO `administrator` VALUES ('4', 'k', '3123d', 'fd');
INSERT INTO `administrator` VALUES ('5', 'fsf', '342fsdf', '321');
INSERT INTO `administrator` VALUES ('6', 'hjf', '3adff2', 'ghf');
INSERT INTO `administrator` VALUES ('7', 'nfsd', '35ssas', '3gvc');
INSERT INTO `administrator` VALUES ('8', 'mnd', 'asd2', 'ghfgh');
INSERT INTO `administrator` VALUES ('9', 'asdfgh', '444444', '423hg');
INSERT INTO `administrator` VALUES ('10', 'henry', '123456', 'yk');
INSERT INTO `administrator` VALUES ('14', 'queen', 'aaaaaa', 'fgsd23');
INSERT INTO `administrator` VALUES ('15', 'hnm', '333333', 'fsdf');

-- ----------------------------
-- Table structure for duty
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(255) NOT NULL,
  `ondutytime` datetime NOT NULL,
  `offdutytime` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `duty_superuser_realname` (`realname`),
  CONSTRAINT `duty_admin_realname` FOREIGN KEY (`realname`) REFERENCES `administrator` (`realname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of duty
-- ----------------------------
INSERT INTO `duty` VALUES ('7', '张三', '2018-02-28 05:00:00', '2018-02-28 10:00:00');

-- ----------------------------
-- Table structure for meal
-- ----------------------------
DROP TABLE IF EXISTS `meal`;
CREATE TABLE `meal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Order_Id` varchar(100) NOT NULL,
  `createtime` datetime NOT NULL,
  `food` varchar(255) NOT NULL,
  `reservetime` datetime NOT NULL,
  `room` varchar(255) NOT NULL,
  `ok` int(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `trans_order_id` (`Order_Id`),
  KEY `meal_room_number` (`room`),
  CONSTRAINT `meal_room_number` FOREIGN KEY (`room`) REFERENCES `room` (`roomnumber`),
  CONSTRAINT `order_meal_id_fk` FOREIGN KEY (`Order_Id`) REFERENCES `orders` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meal
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(100) NOT NULL,
  `order_username` varchar(12) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `order_createtime` datetime NOT NULL,
  `order_room` varchar(255) NOT NULL,
  `checkintime` date NOT NULL,
  `checkouttime` date DEFAULT NULL,
  `nights` int(11) NOT NULL DEFAULT '1',
  `add_request` varchar(255) DEFAULT NULL,
  `originalprice` double NOT NULL,
  `discount` double NOT NULL DEFAULT '1',
  `price` double NOT NULL,
  `end` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `order_user_username_fk` (`order_username`),
  KEY `orderId` (`orderId`),
  KEY `order_room_number` (`order_room`),
  CONSTRAINT `order_room_number` FOREIGN KEY (`order_room`) REFERENCES `room` (`roomnumber`),
  CONSTRAINT `order_user_username_fk` FOREIGN KEY (`order_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('31', 'tom.264db9a7', 'tom', 'gg', '3123@qq.com', '21323', '2018-02-05 23:39:32', 'A101', '2018-02-09', '2018-02-17', '8', '', '2400', '1', '2400', '1');
INSERT INTO `orders` VALUES ('32', 'tom.21b22a1b', 'tom', 'nvcb', '324@qq.com', '2313', '2018-02-05 23:55:50', 'A234', '2018-02-16', '2018-02-24', '8', '', '3560', '1', '3560', '1');
INSERT INTO `orders` VALUES ('33', 'tom.56850640', 'tom', 'uuu', 'e333@mm.mm', '45898', '2018-02-06 19:56:24', 'B343', '2018-02-17', '2018-02-24', '7', '', '2548', '1', '2548', '1');
INSERT INTO `orders` VALUES ('34', 'tom.681716d1', 'tom', 'jj', '55@mm.nn', '7900', '2018-02-06 19:59:24', 'C234', '2018-02-23', '2018-02-24', '1', '', '3565', '1', '3565', '1');
INSERT INTO `orders` VALUES ('35', 'jenny.e41f7f2a', 'jenny', 'gbbb', '3423@m.mm', '324324', '2018-02-06 20:04:49', 'G4565', '2018-02-23', '2018-02-23', '1', '', '544', '0.9', '489.6', '1');
INSERT INTO `orders` VALUES ('36', 'tony.b238ab49', 'tony', 'oin', '6756@m.hh', '678066', '2018-02-06 20:08:02', 'GG44', '2018-03-22', '2018-03-30', '8', '', '34760', '0.8', '27808', '1');
INSERT INTO `orders` VALUES ('37', 'tony.392d72c4', 'tony', 'fghgh', '43543@gkg.cc', '4324235', '2018-02-06 20:09:25', 'GG44', '2018-03-08', '2018-03-09', '1', '', '4345', '0.8', '3476', '0');
INSERT INTO `orders` VALUES ('38', 'tom.4d6a3ccf', 'tom', 'hgnj', '656@l.cc', '54654', '2018-02-06 20:11:50', 'N354', '2018-03-24', '2018-03-31', '7', '', '3045', '1', '3045', '1');
INSERT INTO `orders` VALUES ('39', 'tom.e52f370d', 'tom', 'nnmn', 'sxd@q.bnf', '5667', '2018-02-06 20:14:40', 'T456', '2018-02-24', '2018-02-28', '4', '', '2692', '1', '2692', '1');
INSERT INTO `orders` VALUES ('40', 'jenny.8c84d075', 'jenny', 'bv', '23@q.dsf', '123231', '2018-02-06 20:42:57', 'M465', '2018-02-23', '2018-02-24', '1', '', '543', '0.9', '488.7', '0');
INSERT INTO `orders` VALUES ('41', 'tom.3954a1ec', 'tom', 'jjk', '35434@a.oo', '368866', '2018-02-07 16:30:18', 'B333', '2018-02-23', '2018-02-24', '1', '', '333', '1', '333', '1');
INSERT INTO `orders` VALUES ('42', 'tom.d0f2c7e9', 'tom', 'mvb', '232@df.hj', '678675', '2018-02-07 16:37:13', 'V321', '2018-02-17', '2018-02-19', '2', '', '642', '1', '642', '1');
INSERT INTO `orders` VALUES ('43', 'tony.5dfaabfa', 'tony', 'm', '22@q.jk', '54', '2018-02-07 16:46:04', 'O213', '2018-02-23', '2018-02-24', '1', '', '838', '0.8', '670.4000000000001', '0');
INSERT INTO `orders` VALUES ('44', 'jenny.f697e997', 'jenny', 'gjhg', '32@cvb.jk', '900000', '2018-02-07 16:52:41', 'B245', '2018-02-15', '2018-02-23', '8', '', '1776', '0.9', '1598.4', '0');
INSERT INTO `orders` VALUES ('45', 'tom.0f195b3c', 'tom', 'gg', '12366@qv.cc', '314234', '2018-02-07 21:10:50', 'A101', '2018-02-09', '2018-02-10', '1', '', '300', '1', '300', '1');
INSERT INTO `orders` VALUES ('46', 'tony.fe99e525', 'tony', 'ggg', '123222@qw.cc', '3422', '2018-02-07 22:11:25', 'A234', '2018-02-16', '2018-02-24', '8', 'dffdsfdsfsdfsdf', '3560', '0.8', '2848', '0');
INSERT INTO `orders` VALUES ('47', 'tom.0a793326', 'tom', 'ghg', '23434@qq.com', '542354', '2018-02-07 22:19:37', 'B343', '2018-02-23', '2018-02-24', '1', '', '364', '1', '364', '1');
INSERT INTO `orders` VALUES ('48', 'tony.799c54f1', 'tony', 'gdf', 'dfs2@qq.com', '2345654', '2018-02-08 02:59:40', 'C234', '2018-02-08', '2018-02-23', '15', '', '53475', '0.8', '42780', '0');
INSERT INTO `orders` VALUES ('49', 'tony.f8d0ea31', 'tony', 'tony', '32143@412.cc', '31234234', '2018-02-12 02:28:50', 'A101', '2018-05-25', '2018-05-31', '6', '12334423', '1800', '0.8', '1440', '0');
INSERT INTO `orders` VALUES ('50', 'jenny.238e243a', 'jenny', 'jennr', '21@q.cqq', '32134234', '2018-02-12 18:45:36', 'A234', '2018-02-23', '2018-02-24', '1', '', '445', '1', '445', '0');
INSERT INTO `orders` VALUES ('51', 'tom.ac6086ac', 'tom', 'g', '435@qq.com', '31234', '2018-02-13 00:45:23', 'B343', '2018-02-23', '2018-02-24', '1', '', '364', '0.8', '291.2', '1');
INSERT INTO `orders` VALUES ('52', 'tom.718eac5d', 'tom', 'ff', '22@qq.com', '3123', '2018-02-14 00:43:11', 'A101', '2018-02-23', '2018-02-24', '1', '', '300', '0.8', '240', '1');
INSERT INTO `orders` VALUES ('54', 'tom.4b7ff1b1', 'tom', 'fdsf', '42q@q.cc', '3213123', '2018-02-23 20:39:47', 'O213', '2018-02-24', '2018-03-19', '23', '', '19274', '0.8', '15419.2', '1');
INSERT INTO `orders` VALUES ('55', 'tom.8936cb38', 'tom', 'gfg', '3213@oc.cmm', '3123', '2018-02-23 20:42:12', 'C234', '2018-02-24', '2018-03-18', '22', '', '78430', '0.8', '62744', '1');
INSERT INTO `orders` VALUES ('56', 'jenny.2fdd1d9d', 'jenny', 'hfgh', '543@rq.kk', '34234342', '2018-02-26 13:39:20', 'GG44', '2018-02-26', '2018-02-26', '1', '', '4345', '0.9', '3910.5', '0');
INSERT INTO `orders` VALUES ('57', 'tom.ed142cef', 'tom', 'gh', 'fds@321.gf', '12334', '2018-02-26 18:18:56', 'G4565', '2018-02-27', '2018-02-28', '1', '', '455', '0.8', '364', '1');
INSERT INTO `orders` VALUES ('58', 'tom.04782c39', 'tom', 'fsdf', '3123@mm.dd', '314234', '2018-02-26 19:52:11', 'T456', '2018-02-27', '2018-02-28', '1', '', '673', '0.8', '538.4', '1');
INSERT INTO `orders` VALUES ('59', 'tom.12ff8e1b', 'tom', 'srewr', 'fd@4fds.cc', '321344', '2018-03-07 21:18:28', 'M465', '2018-03-07', '2018-05-31', '85', 'bvcxfg', '46155', '0.8', '36924', '1');
INSERT INTO `orders` VALUES ('60', 'tom.d317f116', 'tom', '发郭德纲', 'fds@r3.cc', '4325435', '2018-03-08 16:55:11', 'A101', '2018-03-29', '2018-03-30', '1', '', '356', '0.8', '284.8', '0');
INSERT INTO `orders` VALUES ('61', 'tom.726bafef', 'tom', 'fdfdf', 'fdfd@4324.cc', '34214324', '2018-03-17 11:39:02', 'V321', '2018-03-23', '2018-03-31', '8', '', '2568', '0.8', '2054.4', '0');

-- ----------------------------
-- Table structure for orders_service
-- ----------------------------
DROP TABLE IF EXISTS `orders_service`;
CREATE TABLE `orders_service` (
  `Order_Id` varchar(100) NOT NULL,
  `Service_Id` int(2) NOT NULL,
  KEY `orderservice_order_id_fk` (`Order_Id`),
  KEY `orderservice_service_id` (`Service_Id`),
  CONSTRAINT `orderservice_order_id_fk` FOREIGN KEY (`Order_Id`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `orderservice_service_id` FOREIGN KEY (`Service_Id`) REFERENCES `service` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_service
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `roomnumber` varchar(255) NOT NULL,
  `size` int(1) NOT NULL,
  `price` double NOT NULL,
  `book` int(1) NOT NULL DEFAULT '0',
  `computer` int(1) NOT NULL DEFAULT '0',
  `garden` int(1) NOT NULL DEFAULT '0',
  `freebreakfast` int(1) NOT NULL DEFAULT '0',
  `dailyclean` int(1) NOT NULL DEFAULT '0',
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `roomnumber` (`roomnumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', 'A101', '3', '356', '1', '0', '0', '1', '1', 'A101.jpg');
INSERT INTO `room` VALUES ('2', 'A234', '1', '888', '1', '0', '1', '0', '1', 'A234.jpg');
INSERT INTO `room` VALUES ('3', 'B343', '3', '364', '0', '1', '1', '1', '1', 'B343.jpg');
INSERT INTO `room` VALUES ('4', 'C234', '2', '3565', '0', '1', '0', '0', '0', 'C234.jpg');
INSERT INTO `room` VALUES ('5', 'G4565', '3', '455', '0', '0', '0', '1', '0', 'G4565.jpg');
INSERT INTO `room` VALUES ('6', 'GG44', '2', '4345', '1', '1', '0', '0', '0', 'GG44.jpg');
INSERT INTO `room` VALUES ('7', 'N354', '3', '435', '0', '1', '1', '0', '0', 'N354.jpg');
INSERT INTO `room` VALUES ('8', 'T456', '1', '673', '0', '1', '0', '1', '0', 'T456.jpg');
INSERT INTO `room` VALUES ('9', 'M465', '3', '543', '0', '1', '1', '1', '1', 'M465.jpg');
INSERT INTO `room` VALUES ('10', 'O213', '3', '838', '0', '1', '1', '0', '0', 'O213.jpg');
INSERT INTO `room` VALUES ('11', 'B333', '2', '333', '0', '1', '0', '0', '0', 'B333.jpg');
INSERT INTO `room` VALUES ('12', 'B245', '3', '222', '0', '0', '0', '0', '1', 'B245.jpg');
INSERT INTO `room` VALUES ('13', 'V321', '1', '321', '1', '1', '1', '1', '1', 'V321.jpg');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------

-- ----------------------------
-- Table structure for superuser
-- ----------------------------
DROP TABLE IF EXISTS `superuser`;
CREATE TABLE `superuser` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `realname` (`realname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of superuser
-- ----------------------------
INSERT INTO `superuser` VALUES ('1', 'tom', '111111', '欧文');

-- ----------------------------
-- Table structure for transport
-- ----------------------------
DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `order_name` varchar(255) NOT NULL,
  `Order_Id` varchar(100) NOT NULL,
  `airport` varchar(255) NOT NULL,
  `arrivaltime` datetime NOT NULL,
  `people` int(11) NOT NULL,
  `ok` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `trans_order_id` (`Order_Id`) USING BTREE,
  CONSTRAINT `trans_order_id` FOREIGN KEY (`Order_Id`) REFERENCES `orders` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transport
-- ----------------------------
INSERT INTO `transport` VALUES ('8', 'tom', 'tom.ac6086ac', '广州白云机场，3号航站楼', '2018-02-13 00:00:00', '1', '0');
INSERT INTO `transport` VALUES ('9', 'jenny', 'jenny.2fdd1d9d', '广州白云机场，1号航站楼', '2018-03-10 17:00:00', '1', '1');
INSERT INTO `transport` VALUES ('10', 'tom', 'tom.12ff8e1b', '广州白云机场，1号航站楼', '2018-03-07 18:20:00', '4', '0');
INSERT INTO `transport` VALUES ('11', 'tom', 'tom.d317f116', '广州白云机场，1号航站楼', '2018-03-08 00:00:00', '1', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `usertype` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'tom', '999999', 'tom@66.com', '2');
INSERT INTO `user` VALUES ('2', 'jenny', '321', 'jenny@qq.com', '1');
INSERT INTO `user` VALUES ('3', 'tony', '666', 'tony@qq.com', '1');
INSERT INTO `user` VALUES ('4', 'kim', '888', 'kim@qq.com', '0');
INSERT INTO `user` VALUES ('5', 'roy', '555', 'roy@qq.com', '0');
INSERT INTO `user` VALUES ('6', 'vincent', '333', 'vincent@qq.com', '0');
INSERT INTO `user` VALUES ('7', 'zoey', '333', 'zoey@163.com', '0');
INSERT INTO `user` VALUES ('8', 'Yoon123', 'qwer123', 'yoon123@qq.com', '0');
INSERT INTO `user` VALUES ('9', 'uri12345', '55555', '323234@qq.com', '0');
INSERT INTO `user` VALUES ('10', 'harry25333', '1234456566', '24432@qq.com', '0');
INSERT INTO `user` VALUES ('11', 'kszchesf3434', '4324ffds453', 'kszchesf3434@qq.com', '0');
INSERT INTO `user` VALUES ('12', 'sanchez435', 'fhdjj3244', 'sanchez@qq.com', '0');
INSERT INTO `user` VALUES ('13', 'one234j44', '123434545', '34245@qq.com', '0');
INSERT INTO `user` VALUES ('14', 'luis213445', '32134324', '1232343@qq.com', '0');
INSERT INTO `user` VALUES ('15', '12345654', '788667878778', '123234@qq.com', '0');
INSERT INTO `user` VALUES ('16', '23d432', '43sf244', 'fdsg3553@qq.com', '0');
INSERT INTO `user` VALUES ('17', 'knfdfdj22', '543654676gg', 'knfdfdj22@qq.com', '0');
INSERT INTO `user` VALUES ('18', 'tom66666', '435456666', 'fsdf545@qq.com', '0');
