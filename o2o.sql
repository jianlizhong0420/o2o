/*
 Navicat Premium Data Transfer

 Source Server         : root3307
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3307
 Source Schema         : o2o

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 09/12/2019 08:10:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area`  (
  `area_id` int(2) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_edit_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`area_id`) USING BTREE,
  UNIQUE INDEX `UK_AREA`(`area_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES (1, '东苑', 4, NULL, NULL);
INSERT INTO `tb_area` VALUES (2, '西苑', 3, NULL, NULL);
INSERT INTO `tb_area` VALUES (3, '南苑', 2, NULL, NULL);
INSERT INTO `tb_area` VALUES (4, '北苑', 1, NULL, NULL);

-- ----------------------------
-- Table structure for tb_head_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line`  (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `line_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `line_img` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` int(2) NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_edit_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`line_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth`  (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_edit_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`) USING BTREE,
  UNIQUE INDEX `uk_localauth_profile`(`username`) USING BTREE,
  INDEX `fk_localauth_profile`(`user_id`) USING BTREE,
  CONSTRAINT `fk_localauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_person_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0 COMMENT '0:禁止使用本商城，1:允许使用本商城',
  `user_type` int(2) NOT NULL DEFAULT 1 COMMENT '1:顾客，2:店家，3:超级管理员',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_edit_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES (1, '张三', NULL, '888888@qq.com', '男', 1, 1, '2019-04-22 11:38:09', '2019-04-22 11:38:12');
INSERT INTO `tb_person_info` VALUES (2, '李四', NULL, NULL, '女', 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product`  (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_addr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT ' ',
  `normal_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_edit_time` datetime(0) NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `product_category_id` int(11) NULL DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `fk_product_procate`(`product_category_id`) USING BTREE,
  INDEX `fk_product_shop`(`shop_id`) USING BTREE,
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category`  (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` int(2) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_category_id`) USING BTREE,
  INDEX `fk_productcategory_shop`(`shop_id`) USING BTREE,
  CONSTRAINT `fk_productcategory_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_product_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img`  (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `product_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`product_img_id`) USING BTREE,
  INDEX `fk_productimg_product`(`product_id`) USING BTREE,
  CONSTRAINT `fk_productimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop`  (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL COMMENT '店铺创建人',
  `area_id` int(5) NULL DEFAULT NULL,
  `shop_category_id` int(11) NULL DEFAULT NULL,
  `shop_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shop_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(3) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_edit_time` datetime(0) NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE,
  INDEX `fk_shop_area`(`area_id`) USING BTREE,
  INDEX `fk_shop_profile`(`owner_id`) USING BTREE,
  INDEX `fk_shop_shopcategory`(`shop_category_id`) USING BTREE,
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_shop_shopcategory` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES (1, 1, 1, 2, '李四的小店', '李四小店的店铺描述', '李四小店的店铺地址', '222222222', '/user/22222.jpg', 5, '2019-04-22 12:04:54', '2019-04-22 12:57:18', 0, '店铺申请通过啦');
INSERT INTO `tb_shop` VALUES (3, 1, 2, 2, '张三的小店', '张三小店的店铺描述', '\\upload\\item\\shop\\3\\2019042219121046620.png', '88555666', NULL, 3, '2019-04-22 19:12:11', '2019-04-22 19:12:11', 0, '店铺申请通过');
INSERT INTO `tb_shop` VALUES (4, 1, 1, 2, '测试店铺', '好店铺', '\\upload\\item\\shop\\4\\2019043022360141692.png', '123123123', NULL, NULL, '2019-04-30 22:36:02', '2019-04-30 22:36:02', 0, NULL);
INSERT INTO `tb_shop` VALUES (5, 1, 3, 2, 'ceshidianpu2', 'ceshidianpujianjei', '\\upload\\item\\shop\\5\\2019043022420677039.png', '12314566666', NULL, NULL, '2019-04-30 22:42:07', '2019-04-30 22:42:07', 0, NULL);

-- ----------------------------
-- Table structure for tb_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category`  (
  `shop_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ',
  `shop_category_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT ' ',
  `shop_category_img` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_edit_time` datetime(0) NULL DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`) USING BTREE,
  INDEX `fk_shop_category_self`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
INSERT INTO `tb_shop_category` VALUES (1, '服饰', '衣服、裤子等', '', NULL, NULL, 5, NULL);
INSERT INTO `tb_shop_category` VALUES (2, '箱包', '行李箱、包包等', NULL, NULL, NULL, 4, 1);
INSERT INTO `tb_shop_category` VALUES (3, '食品', '零食等', NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for tb_wechat_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth`  (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `open_id` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`) USING BTREE,
  UNIQUE INDEX `open_id`(`open_id`) USING BTREE,
  INDEX `fk_wechatauth_profile`(`user_id`) USING BTREE,
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
