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

 Date: 18/12/2023 23:42:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `bookNum` int(12) NOT NULL,
  `bookName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bookNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (2, '水浒传', '施耐庵', '65');
INSERT INTO `books` VALUES (3, '红楼梦', '曹雪芹', '83');
INSERT INTO `books` VALUES (4, '西游记', '吴承恩', '68');
INSERT INTO `books` VALUES (5, '聊斋志异', '蒲松龄', '87');
INSERT INTO `books` VALUES (6, '儒林外史', '吴敬梓', '57');
INSERT INTO `books` VALUES (7, '封神演义', '许仲琳', '72');
INSERT INTO `books` VALUES (8, '吕氏春秋', '吕不韦', '88');
INSERT INTO `books` VALUES (9, '东周列国志', '梦龙著', '68');
INSERT INTO `books` VALUES (10, '基督山伯爵', '大仲马', '93');
INSERT INTO `books` VALUES (11, '战争与和平', '列夫•托尔斯泰', '126');
INSERT INTO `books` VALUES (12, '悲惨世界', '雨果', '79');
INSERT INTO `books` VALUES (13, '呐喊', '鲁迅', '100');

SET FOREIGN_KEY_CHECKS = 1;
