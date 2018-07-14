/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 120.79.147.88:8001
 Source Schema         : museum_of_art_Test

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 06/07/2018 12:24:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '编号',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登入名',
  `hashed_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `bank_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bid
-- ----------------------------
DROP TABLE IF EXISTS `bid`;
CREATE TABLE `bid`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) UNSIGNED NOT NULL COMMENT '项目id',
  `works_id` bigint(20) UNSIGNED NOT NULL COMMENT '作品id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投标表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hashed_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `avatar` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `business_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `representation_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合法代表人姓名',
  `representation_idcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合法代表人身份证号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `introduction` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近登入时间',
  `is_verified` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否通过审核',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `follower_count` int(11) NULL DEFAULT NULL COMMENT '粉丝人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业信息表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for email_activation
-- ----------------------------
DROP TABLE IF EXISTS `email_activation`;
CREATE TABLE `email_activation`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '编号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `state` tinyint(3) NOT NULL DEFAULT 0 COMMENT '激活状态',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '激活令牌',
  `token_expried_time` datetime(0) NULL DEFAULT NULL COMMENT '令牌过期时间',
  `gmt_registered` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `gmt_activated` datetime(0) NULL DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮箱验证表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for business_attachment
-- ----------------------------
DROP TABLE IF EXISTS `business_attachment`;
CREATE TABLE `business_attachment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attachment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attachment_path` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件路径',
  `attachment_size` decimal(10, 0) NULL DEFAULT NULL COMMENT '附件大小',
  `business_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '企业id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for complaint_attachment
-- ----------------------------
DROP TABLE IF EXISTS `complaint_attachment`;
CREATE TABLE `complaint_attachment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attachment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attachment_path` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件路径',
  `attachment_size` decimal(10, 0) NULL DEFAULT NULL COMMENT '附件大小',
  `complaint_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '申诉id',
  `complaint_type` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '申诉的类型(订单：0 or项目：1 or作品：2)',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申诉附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for favorite_project
-- ----------------------------
DROP TABLE IF EXISTS `favorite_project`;
CREATE TABLE `favorite_project`  (
  `project_id` bigint(20) UNSIGNED NOT NULL COMMENT '项目id',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `is_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否喜欢',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for favorite_works
-- ----------------------------
DROP TABLE IF EXISTS `favorite_works`;
CREATE TABLE `favorite_works`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `works_id` bigint(20) UNSIGNED NOT NULL COMMENT '作品id',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `is_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否喜欢',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏作品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_form
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form`  (
  `id` bigint(20) NOT NULL COMMENT '订单id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '项目id',
  `seller_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '卖家id',
  `works_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '作品id',
  `buyer_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '买家id',
  `price` decimal(10, 0) NULL DEFAULT NULL COMMENT '成交价格',
  `finish_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `comment` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家评论',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders_complaint
-- ----------------------------
DROP TABLE IF EXISTS `orders_complaint`;
CREATE TABLE `orders_complaint`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单申诉id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `complaint_description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申诉内容',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单申诉' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for private_message
-- ----------------------------
DROP TABLE IF EXISTS `private_message`;
CREATE TABLE `private_message`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sender_id` bigint(20) NULL DEFAULT NULL COMMENT '发送者id',
  `receiver_id` bigint(20) NULL DEFAULT NULL COMMENT '接收者id',
  `message_type` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '信息类型',
  `message_content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息内容',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '信息状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '私信表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'id',
  `business_id` bigint(20) NOT NULL COMMENT '企业id',
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `project_description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `is_verified` tinyint(3) NOT NULL DEFAULT 0 COMMENT '项目状态',
  `budget` decimal(10, 0) NULL DEFAULT NULL COMMENT '预算',
  `tender_period` int(11) NULL DEFAULT NULL COMMENT '投标时间',
  `expected_time` int(11) NULL DEFAULT NULL COMMENT '预计完成时间',
  `finish_time` datetime(0) NULL DEFAULT NULL COMMENT '实际完成时间',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `skill` json NULL COMMENT '项目需要的技能',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project_attachment
-- ----------------------------
DROP TABLE IF EXISTS `project_attachment`;
CREATE TABLE `project_attachment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attachment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attachment_path` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件路径',
  `attachment_size` decimal(10, 0) NULL DEFAULT NULL COMMENT '附件大小',
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '项目id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project_complaint
-- ----------------------------
DROP TABLE IF EXISTS `project_complaint`;
CREATE TABLE `project_complaint`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` bigint(20) NULL DEFAULT NULL COMMENT '项目id',
  `complaint_description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申诉内容',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目申诉' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `resource_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `resource_path` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单父节点id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resource_role
-- ----------------------------
DROP TABLE IF EXISTS `resource_role`;
CREATE TABLE `resource_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) NOT NULL COMMENT '菜单id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与资源关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `skill_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技能名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '技能表' ROW_FORMAT = Dynamic;
-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'id',
  `student_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登入名称(昵称)',
  `hashed_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `avatar` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `bank_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `introduction` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `transaction_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '交易总次数',
  `break_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '毁约次数',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登入时间',
  `is_verified` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否是第一次登入',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `follower_count` int(11) NULL DEFAULT NULL COMMENT '粉丝总数',
  `skill` json NULL COMMENT '学生有的技能',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation`  (
  `follow_id` bigint(20) NOT NULL COMMENT '用户id',
  `relation` tinyint(4) NOT NULL DEFAULT 0 COMMENT '两个用户关系',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与用户关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for works
-- ----------------------------
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'id',
  `student_id` bigint(20) NULL DEFAULT NULL COMMENT '学生id',
  `works_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作品名称',
  `works_describe` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作品描述',
  `works_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '作品状态',
  `price` decimal(10, 0) NULL DEFAULT NULL COMMENT '学生报价',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for works_attachment
-- ----------------------------
DROP TABLE IF EXISTS `works_attachment`;
CREATE TABLE `works_attachment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attachment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attachment_path` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件路径',
  `attachment_size` decimal(10, 0) NULL DEFAULT NULL COMMENT '附件大小',
  `works_id` bigint(20) NULL DEFAULT NULL COMMENT '作品id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作品附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for works_comment
-- ----------------------------
DROP TABLE IF EXISTS `works_comment`;
CREATE TABLE `works_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `works_id` bigint(20) NULL DEFAULT NULL COMMENT '作品id',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '评论的用户id',
  `comment` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作品评论',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作品评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for works_complaint
-- ----------------------------
DROP TABLE IF EXISTS `works_complaint`;
CREATE TABLE `works_complaint`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `works_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '作品id',
  `complaint_description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申诉描述',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作品申诉表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
