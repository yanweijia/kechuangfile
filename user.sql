/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : user

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-03-05 12:57:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `pw` varchar(16) NOT NULL,
  `ppw` varchar(6) DEFAULT '000000',
  `status` enum('ok','banned') DEFAULT 'ok',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10017 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('10002', 'yanweijia', '123456', '000000', 'ok');
INSERT INTO `account` VALUES ('10003', 'yanweijia', '123456', '000000', 'ok');
INSERT INTO `account` VALUES ('10004', 'yanweijia1', '123456', '000000', 'ok');
INSERT INTO `account` VALUES ('10005', 'null', 'null', '000000', 'ok');
INSERT INTO `account` VALUES ('10006', 'yanweijia6', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10007', 'yanweijia7', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10008', 'yanweijia8', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10009', 'yanweijia9', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10010', 'yanweijia10', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10011', 'yanweijia11', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10012', 'yanweijia12', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10013', 'yanweijia13', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10014', 'yanweijia14', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10015', 'yanweijia15', 'tsdgasglj', '000000', 'ok');
INSERT INTO `account` VALUES ('10016', 'yanweijiatest', 'passwordtest', '000000', 'ok');

-- ----------------------------
-- Table structure for `user_comment`
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment` (
  `uid` int(10) unsigned NOT NULL,
  `mid` bigint(20) NOT NULL,
  `cuid` int(10) unsigned NOT NULL,
  `cid` bigint(20) NOT NULL,
  `comment_time` date NOT NULL,
  PRIMARY KEY (`uid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `user_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite` (
  `uid` int(10) unsigned NOT NULL,
  `favorite_mid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`favorite_mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `head` varchar(32) DEFAULT NULL,
  `sex` enum('未知','男','女') NOT NULL DEFAULT '未知',
  `qq` varchar(10) DEFAULT NULL,
  `email` varchar(26) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `place` varchar(13) DEFAULT NULL,
  `school` varchar(30) DEFAULT NULL,
  `about` varchar(30) DEFAULT NULL,
  `interest` varchar(20) DEFAULT NULL,
  `blog` varchar(50) DEFAULT NULL,
  `birthdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('10016', '严唯嘉', null, '男', 'null', 'happyboyywj@163.com', '17091952844', '上海', '上海电力学院', '喜欢结交朋友', '计算机', 'www.yanweijia.cn', '19960927');
