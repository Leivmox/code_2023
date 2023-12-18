/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50724 (5.7.24)
 Source Host           : localhost:3306
 Source Schema         : myweb

 Target Server Type    : MySQL
 Target Server Version : 50724 (5.7.24)
 File Encoding         : 65001

 Date: 18/12/2023 23:04:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_vote
-- ----------------------------
DROP TABLE IF EXISTS `t_vote`;
CREATE TABLE `t_vote`  (
  `teacherno` int(11) NOT NULL,
  `teachername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`teacherno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_vote
-- ----------------------------
INSERT INTO `t_vote` VALUES (1, '郭克华', '22');
INSERT INTO `t_vote` VALUES (2, '李亚', '8');
INSERT INTO `t_vote` VALUES (3, '刘璐', '7');
INSERT INTO `t_vote` VALUES (4, '王刚', '19');
INSERT INTO `t_vote` VALUES (5, '刘宇', '10');
INSERT INTO `t_vote` VALUES (6, '朱芳', '9');
INSERT INTO `t_vote` VALUES (7, '陈飞', '7');
INSERT INTO `t_vote` VALUES (8, '王晓', '4');
INSERT INTO `t_vote` VALUES (9, '周云', '10');

SET FOREIGN_KEY_CHECKS = 1;
