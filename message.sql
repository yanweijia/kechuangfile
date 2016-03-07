/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : message

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-03-05 12:57:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `content` varchar(140) NOT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `favoritelist`
-- ----------------------------
DROP TABLE IF EXISTS `favoritelist`;
CREATE TABLE `favoritelist` (
  `uid` int(10) unsigned NOT NULL,
  `mid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favoritelist
-- ----------------------------

-- ----------------------------
-- Table structure for `likelist`
-- ----------------------------
DROP TABLE IF EXISTS `likelist`;
CREATE TABLE `likelist` (
  `uid` int(10) unsigned NOT NULL,
  `mid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likelist
-- ----------------------------

-- ----------------------------
-- Table structure for `msg_comment`
-- ----------------------------
DROP TABLE IF EXISTS `msg_comment`;
CREATE TABLE `msg_comment` (
  `mid` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`mid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `msg_count`
-- ----------------------------
DROP TABLE IF EXISTS `msg_count`;
CREATE TABLE `msg_count` (
  `mid` bigint(20) NOT NULL,
  `count_view` int(11) NOT NULL DEFAULT '0',
  `count_like` int(11) NOT NULL DEFAULT '0',
  `count_comment` mediumint(9) NOT NULL DEFAULT '0',
  `count_repost` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg_count
-- ----------------------------
INSERT INTO `msg_count` VALUES ('1', '1', '0', '0', '1');
INSERT INTO `msg_count` VALUES ('3', '0', '0', '0', '0');
INSERT INTO `msg_count` VALUES ('4', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `msg_info`
-- ----------------------------
DROP TABLE IF EXISTS `msg_info`;
CREATE TABLE `msg_info` (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `mcontent` varchar(140) NOT NULL,
  `mtype` tinyint(4) NOT NULL DEFAULT '0',
  `mstate` tinyint(4) NOT NULL DEFAULT '0',
  `mtime` datetime DEFAULT NULL,
  `mattach` varchar(296) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg_info
-- ----------------------------
INSERT INTO `msg_info` VALUES ('1', '10016', '这是一条测试消息,123456hello', '0', '0', '2016-03-01 17:50:27', 'null');
INSERT INTO `msg_info` VALUES ('3', '10016', '转发消息测试', '3', '0', '2016-03-02 19:59:48', '1');
INSERT INTO `msg_info` VALUES ('4', '10016', '转发消息测试', '3', '0', '2016-03-02 20:05:43', '1');
