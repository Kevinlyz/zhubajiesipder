/*
 Navicat Premium Data Transfer

 Source Server         : 王旭东的数据库
 Source Server Type    : MySQL
 Source Server Version : 50642
 Source Host           : localhost:3306
 Source Schema         : lxq

 Target Server Type    : MySQL
 Target Server Version : 50642
 File Encoding         : 65001

 Date: 05/06/2019 15:30:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `series` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` datetime(0) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`series`) USING BTREE,
  UNIQUE INDEX `UK_bqa9l0go97v49wwyx4c0u3kpd`(`token`) USING BTREE,
  UNIQUE INDEX `UK_f8t9fsfwc17s6qcbx0ath6l3h`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fenlei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `addr` bigint(20) NULL DEFAULT NULL COMMENT '所属地区',
  `creatdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES (12, '网站开发', 3571, '2019-05-24 23:37:48');
INSERT INTO `sort` VALUES (13, '软件开发', 3571, '2019-05-27 10:33:43');
INSERT INTO `sort` VALUES (14, '营销', 3571, '2019-05-27 12:11:23');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKmeds2u6ae5usj0ko0bqj3k0eo`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_num` int(11) NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3fekum3ead5klp7y4lckn5ohi`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1, b'0', '顶级栏目', 100, NULL, 0, NULL, 0);
INSERT INTO `sys_resource` VALUES (2, b'0', '权限配置', 8, '', 0, '', 1);
INSERT INTO `sys_resource` VALUES (3, b'0', '角色管理', 102, '/role', 0, '/role', 2);
INSERT INTO `sys_resource` VALUES (4, b'0', '权限管理', 103, '/resource', 0, '/resource', 2);
INSERT INTO `sys_resource` VALUES (5, b'0', '用户管理', 101, '/user', 0, '/user', 2);
INSERT INTO `sys_resource` VALUES (6, b'0', '编辑', 100, '/role/editor-role', 1, '/role/editor-role', 3);
INSERT INTO `sys_resource` VALUES (7, b'0', '添加权限节点', 100, '/resource/add-permission', 1, '/resource/add-permission', 4);
INSERT INTO `sys_resource` VALUES (8, b'0', '添加管理员', 100, '/user/add-user', 1, '/user/add-user', 5);
INSERT INTO `sys_resource` VALUES (9, b'0', '添加角色', 100, '/role/add-role', 1, '/role/add-role', 3);
INSERT INTO `sys_resource` VALUES (10, b'0', '删除角色', 100, '/role/delete', 1, '/role/delete', 3);
INSERT INTO `sys_resource` VALUES (11, b'0', '删除用户', 100, '/user/delete-user', 1, '/user/delete-user', 5);
INSERT INTO `sys_resource` VALUES (12, b'0', '删除权限', 100, '/resource/delete', 1, '/resource/delete', 4);
INSERT INTO `sys_resource` VALUES (13, b'0', '启用', 100, '/user/available-user', 1, '/user/available-user', 3);
INSERT INTO `sys_resource` VALUES (14, b'0', '修改管理员密码', 100, '/user/modify-password', 1, '/user/modify-password', 5);
INSERT INTO `sys_resource` VALUES (16, NULL, '权限编辑', 100, '/resource/editor-permission', 1, '/resource/editor-permission', 4);
INSERT INTO `sys_resource` VALUES (150, b'0', '编辑管理员信息', 100, '/user/edit-user', 1, '/user/edit-user', 5);
INSERT INTO `sys_resource` VALUES (151, NULL, '人信息管理', 2, '', 0, '', 1);
INSERT INTO `sys_resource` VALUES (152, NULL, '人信息列表', 1, '/admin/person', 0, '/admin/person', 151);
INSERT INTO `sys_resource` VALUES (153, NULL, '爬取信息管理', 1, '', 0, '', 1);
INSERT INTO `sys_resource` VALUES (154, NULL, '爬取猪八戒信息', 2, '/admin/sort', 0, '/admin/sort', 153);
INSERT INTO `sys_resource` VALUES (155, NULL, '爬取一品威客信息', 3, '/admin/vksort', 0, '/admin/vksort', 153);
INSERT INTO `sys_resource` VALUES (156, NULL, '公司管理', 1, '/admin/tCompany', 0, '/admin/tCompany', 153);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, NULL, '管理员', '管理员');

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources`  (
  `sys_role_id` bigint(20) NOT NULL,
  `resources_id` bigint(20) NOT NULL,
  INDEX `FKog6jj4v6yh9e1ilxk2mwuk75a`(`resources_id`) USING BTREE,
  INDEX `FKsqkqfd2hpr5cc2kbrtgoced2w`(`sys_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES (1, 2);
INSERT INTO `sys_role_resources` VALUES (1, 3);
INSERT INTO `sys_role_resources` VALUES (1, 6);
INSERT INTO `sys_role_resources` VALUES (1, 9);
INSERT INTO `sys_role_resources` VALUES (1, 10);
INSERT INTO `sys_role_resources` VALUES (1, 13);
INSERT INTO `sys_role_resources` VALUES (1, 4);
INSERT INTO `sys_role_resources` VALUES (1, 7);
INSERT INTO `sys_role_resources` VALUES (1, 12);
INSERT INTO `sys_role_resources` VALUES (1, 16);
INSERT INTO `sys_role_resources` VALUES (1, 5);
INSERT INTO `sys_role_resources` VALUES (1, 8);
INSERT INTO `sys_role_resources` VALUES (1, 11);
INSERT INTO `sys_role_resources` VALUES (1, 14);
INSERT INTO `sys_role_resources` VALUES (1, 150);
INSERT INTO `sys_role_resources` VALUES (1, 153);
INSERT INTO `sys_role_resources` VALUES (1, 154);
INSERT INTO `sys_role_resources` VALUES (1, 155);
INSERT INTO `sys_role_resources` VALUES (1, 156);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` bit(1) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex_type` int(11) NULL DEFAULT NULL COMMENT '性别(0.男,1.女)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '2017-07-11 17:42:18', '$2a$10$SIU57gfkh/TsIVYALXBNAeDnQzkm652FT9cg4h8wtEfC306uliyYa', '2019-01-11 07:34:38', 'admin', b'1', '1191134106@qq.com', '15030103078', 1);

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles`  (
  `sys_user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  INDEX `FKdpvc6d7xqpqr43dfuk1s27cqh`(`roles_id`) USING BTREE,
  INDEX `FKd0ut7sloes191bygyf7a3pk52`(`sys_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
INSERT INTO `sys_user_roles` VALUES (1, 1);

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `company_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `company_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `company_states` int(2) NULL DEFAULT NULL COMMENT '1：等待处理\r\n2：正在联系\r\n3：联系成功\r\n4：无法联系\r\n5：已废弃',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `my_marks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 858 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES (1, '久念软件', 'https://shop.zbj.com/18672341/', 1, '2019-06-04 19:55:14', 'kkk');
INSERT INTO `t_company` VALUES (2, '天子科技有限公司', 'http://shop.epwk.com/4163750/', 2, '2019-06-04 20:08:18', 'kkk');
INSERT INTO `t_company` VALUES (613, '河北万中科技有限公司', 'http://shop.epwk.com/4180838/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (614, '数谷网络科技', 'http://shop.epwk.com/4172271/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (615, '极上科技', 'http://shop.epwk.com/4192977/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (616, '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (617, '河北异想科技有限公司', 'http://shop.epwk.com/4181252/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (618, '六面体科技', 'http://shop.epwk.com/4185836/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (619, '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (620, '宝寰科技', 'http://shop.epwk.com/4173257/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (621, '河北神光勇安网络科技有限公司', 'http://shop.epwk.com/4195184/', 1, '2019-06-05 10:59:48', NULL);
INSERT INTO `t_company` VALUES (622, '博跃软件科技', 'http://shop.epwk.com/4196005/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (623, '小杨php定制', 'http://shop.epwk.com/4176463/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (624, '优享科技', 'http://shop.epwk.com/4183437/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (625, '聚享时空网络', 'http://shop.epwk.com/4167353/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (626, '垚梦网络', 'http://shop.epwk.com/4185034/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (627, '软星科技', 'http://shop.epwk.com/4176687/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (628, '蓝七大法师', 'http://shop.epwk.com/4184856/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (629, '保定市讯辰网络科技有限公司', 'http://shop.epwk.com/4185596/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (630, '子牛科技', 'http://shop.epwk.com/4187962/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (631, '兴通科技', 'http://shop.epwk.com/4185887/', 1, '2019-06-05 10:59:51', NULL);
INSERT INTO `t_company` VALUES (632, '怀风文化', 'https://shop.zbj.com/1240897/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (633, '微辰淘宝托管微信开发团队', 'https://shop.zbj.com/18672341/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (634, '久念软件', 'https://shop.zbj.com/21706405/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (635, '不落窠臼品牌设计旗舰店', 'https://shop.zbj.com/17959634/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (636, '艺点品牌策划有限公司', 'https://shop.zbj.com/7163110/?fr=yd', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (637, '千佰特网络推广', 'https://shop.zbj.com/11095334/?fr=djwy', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (638, '专业前后端团队', 'https://shop.zbj.com/15034919/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (639, '潜龙文丰', 'https://shop.zbj.com/10576915/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (640, '慧狼谷企业营销策划', 'https://shop.zbj.com/14511438/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (641, '专业营销发帖团队', 'https://shop.zbj.com/16638063/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (642, 'V8网络营销', 'https://shop.zbj.com/11302164/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (643, '深圳市全能广告', 'https://shop.zbj.com/18835317/?fr=djwy', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (644, '青峰营销推广', 'https://shop.zbj.com/5287102/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (645, '营销推广策划', 'https://shop.zbj.com/14549877/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (646, '瑞杰营销', 'https://shop.zbj.com/4100300/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (647, '微阳光营销工作室', 'https://shop.zbj.com/6026581/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (648, '专注营销力', 'https://shop.zbj.com/15245139/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (649, '书尧传媒', 'https://shop.zbj.com/13276206/?fr=djwy', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (650, '优品网络营销', 'https://shop.zbj.com/5241628/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (651, '微帮客营销', 'https://shop.zbj.com/13243411/', 1, '2019-06-05 11:58:40', NULL);
INSERT INTO `t_company` VALUES (652, '怀风文化', 'https://shop.zbj.com/1240897/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (653, '微辰淘宝托管微信开发团队', 'https://shop.zbj.com/18672341/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (654, '久念软件', 'https://shop.zbj.com/21706405/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (655, '不落窠臼品牌设计旗舰店', 'https://shop.zbj.com/17959634/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (656, '艺点品牌策划有限公司', 'https://shop.zbj.com/7163110/?fr=yd', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (657, '千佰特网络推广', 'https://shop.zbj.com/11095334/?fr=djwy', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (658, '专业前后端团队', 'https://shop.zbj.com/15034919/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (659, '潜龙文丰', 'https://shop.zbj.com/10576915/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (660, '慧狼谷企业营销策划', 'https://shop.zbj.com/14511438/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (661, '专业营销发帖团队', 'https://shop.zbj.com/16638063/', 4, '2019-06-05 14:11:31', NULL);
INSERT INTO `t_company` VALUES (662, 'V8网络营销', 'https://shop.zbj.com/11302164/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (663, '深圳市全能广告', 'https://shop.zbj.com/18835317/?fr=djwy', 5, '2019-06-05 14:11:22', NULL);
INSERT INTO `t_company` VALUES (664, '青峰营销推广', 'https://shop.zbj.com/5287102/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (665, '营销推广策划', 'https://shop.zbj.com/14549877/', 5, '2019-06-05 14:11:18', NULL);
INSERT INTO `t_company` VALUES (666, '瑞杰营销', 'https://shop.zbj.com/4100300/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (667, '微阳光营销工作室', 'https://shop.zbj.com/6026581/', 4, '2019-06-05 14:11:26', NULL);
INSERT INTO `t_company` VALUES (668, '专注营销力', 'https://shop.zbj.com/15245139/', 1, '2019-06-05 11:58:41', NULL);
INSERT INTO `t_company` VALUES (669, '书尧传媒', 'https://shop.zbj.com/13276206/?fr=djwy', 4, '2019-06-05 14:11:10', NULL);
INSERT INTO `t_company` VALUES (670, '优品网络营销', 'https://shop.zbj.com/5241628/', 2, '2019-06-05 14:40:09', '');
INSERT INTO `t_company` VALUES (671, '微帮客营销', 'https://shop.zbj.com/13243411/', 2, '2019-06-05 13:53:09', '快快快');
INSERT INTO `t_company` VALUES (672, '河北领行网络科技有限公司', 'https://shop.zbj.com/13563290/?fr=yd', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (673, '宜高云科技', 'https://shop.zbj.com/19149212/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (674, '河北雄安桃李科技有限公司', 'https://shop.zbj.com/21465026/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (675, '科技猫工作室', 'https://shop.zbj.com/14621562/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (676, 'VB软件开发定制EXCEL管理软件SSC', 'https://shop.zbj.com/2699026/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (677, '一零零一科技', 'https://shop.zbj.com/15385787/?fr=djwy', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (678, 'gch_ling', 'https://shop.zbj.com/4766974/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (679, '颖慧软件开发有限公司', 'https://shop.zbj.com/13146151/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (680, '厚普机电', 'https://shop.zbj.com/18767189/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (681, '以梦为马。。', 'https://shop.zbj.com/10815179/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (682, '聚红网络旗舰店', 'https://shop.zbj.com/17631482/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (683, '山东桥通天下网络科技', 'https://shop.zbj.com/19193938/?fr=djwy', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (684, '专业的网络科技公司', 'https://shop.zbj.com/10871074/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (685, '金博软件刘颖', 'https://shop.zbj.com/10939037/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (686, '博睿智软件', 'https://shop.zbj.com/9639287/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (687, '来采网络', 'https://shop.zbj.com/2340166/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (688, '加贝软件', 'https://shop.zbj.com/89251/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (689, '志进信息科技', 'https://shop.zbj.com/14395711/?fr=djwy', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (690, '金博软件888', 'https://shop.zbj.com/15871617/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (691, '麦可科技', 'https://shop.zbj.com/18156625/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (692, '晨讯科技网络有限公司', 'https://shop.zbj.com/20961271/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (693, '网尚网络有限公司', 'https://shop.zbj.com/3043786/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (694, '蝴蝶飞飞', 'https://shop.zbj.com/26270/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (695, '宝宏科技', 'https://shop.zbj.com/4985869/?fr=djwy', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (696, '微交易平台', 'https://shop.zbj.com/16634529/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (697, '米饭直播', 'https://shop.zbj.com/12428455/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (698, '易触即联', 'https://shop.zbj.com/13265611/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (699, '有梦想的小狐狸', 'https://shop.zbj.com/21540070/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (700, '大裂谷', 'https://shop.zbj.com/21736976/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (701, '广东嘉讯云计算科技有限公司', 'https://shop.zbj.com/21127314/?fr=djwy', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (702, '更优质的服务', 'https://shop.zbj.com/12013290/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (703, 'zozoyoyo', 'https://shop.zbj.com/12654579/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (704, 'AU3脚本 平面设计', 'https://shop.zbj.com/12466193/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (705, '同心网盟', 'https://shop.zbj.com/10991667/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (706, 'DemoHunter2014', 'https://shop.zbj.com/10227609/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (707, '美联互动', 'https://shop.zbj.com/20717907/?fr=djwy', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (708, '麻雀400', 'https://shop.zbj.com/11812767/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (709, 'zh星魂', 'https://shop.zbj.com/10436608/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (710, '起源高端设计', 'https://shop.zbj.com/7376466/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (711, 'LinkNet企业信息化建设', 'https://shop.zbj.com/5489380/', 1, '2019-06-05 15:25:04', NULL);
INSERT INTO `t_company` VALUES (712, '海月网络工作室', 'https://shop.zbj.com/4791332/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (713, 'hejianheng88', 'https://shop.zbj.com/3360143/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (714, '7cu', 'https://shop.zbj.com/15221653/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (715, '金博企业管理软件', 'https://shop.zbj.com/18657088/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (716, '子非鱼sama', 'https://shop.zbj.com/15034077/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (717, 'oceanwave1976', 'https://shop.zbj.com/14803968/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (718, '舞步的完美', 'https://shop.zbj.com/14363226/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (719, 'yejinmo', 'https://shop.zbj.com/12929521/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (720, '13463231652', 'https://shop.zbj.com/12088515/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (721, 'PBDesigner', 'https://shop.zbj.com/12328352/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (722, '红创网络', 'https://shop.zbj.com/11705655/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (723, '源满软件工作室', 'https://shop.zbj.com/11138742/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (724, '尧帝', 'https://shop.zbj.com/6798307/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (725, 'zhu1ba0jie', 'https://shop.zbj.com/6728180/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (726, '杨广慧', 'https://shop.zbj.com/5994826/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (727, 'zkimpulse', 'https://shop.zbj.com/10039682/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (728, 'mj_beijing', 'https://shop.zbj.com/5860016/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (729, '瑞杰营销', 'https://shop.zbj.com/4100300/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (730, 'axdyf', 'https://shop.zbj.com/4864701/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (731, '织梦二次开发', 'https://shop.zbj.com/3329739/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (732, '晶税数据', 'https://shop.zbj.com/9769570/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (733, 'free小软', 'https://shop.zbj.com/8942007/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (734, '龙辰软件', 'https://shop.zbj.com/7961573/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (735, 'yuyebing', 'https://shop.zbj.com/1650035/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (736, '后崖工作室', 'https://shop.zbj.com/10295634/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (737, '赛扬电子', 'https://shop.zbj.com/18439480/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (738, '华语科技', 'https://shop.zbj.com/13880621/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (739, '十点x十分', 'https://shop.zbj.com/12967278/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (740, 'ctsd', 'https://shop.zbj.com/9638519/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (741, '辉煌尛希', 'https://shop.zbj.com/8735479/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (742, '达科电子', 'https://shop.zbj.com/8656056/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (743, 'pinbozhong', 'https://shop.zbj.com/5901208/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (744, '智达电子开发', 'https://shop.zbj.com/14893220/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (745, '凌卓设计', 'https://shop.zbj.com/12813197/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (746, '晓风网络科技', 'https://shop.zbj.com/13430106/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (747, '战狼股票期货指标工作室', 'https://shop.zbj.com/13444095/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (748, '名字长了好注册', 'https://shop.zbj.com/10896360/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (749, '冷酷死神', 'https://shop.zbj.com/9221143/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (750, 'csbn211', 'https://shop.zbj.com/6418757/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (751, '旭日照四方1982', 'https://shop.zbj.com/6545327/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (752, '成石个人工作室', 'https://shop.zbj.com/6450171/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (753, 'guoshengjunv7', 'https://shop.zbj.com/5249340/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (754, 'hanohdy', 'https://shop.zbj.com/4721287/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (755, '王河顺', 'https://shop.zbj.com/4267654/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (756, '智胜网际软件工作室', 'https://shop.zbj.com/4174449/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (757, '向着自由奔去', 'https://shop.zbj.com/8603003/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (758, '李珍1021', 'https://shop.zbj.com/8791428/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (759, '兮洛0', 'https://shop.zbj.com/8807755/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (760, '标标必达', 'https://shop.zbj.com/9471818/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (761, '那片云226', 'https://shop.zbj.com/8235149/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (762, '猪小宝工作室', 'https://shop.zbj.com/7132643/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (763, '悠哉网虫工作室', 'https://shop.zbj.com/7851686/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (764, '危楼望月', 'https://shop.zbj.com/10465603/', 1, '2019-06-05 15:25:05', NULL);
INSERT INTO `t_company` VALUES (765, '河北领行网络科技有限公司', 'https://shop.zbj.com/13563290/?fr=yd', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (766, '宜高云科技', 'https://shop.zbj.com/19149212/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (767, '河北雄安桃李科技有限公司', 'https://shop.zbj.com/21465026/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (768, '科技猫工作室', 'https://shop.zbj.com/14621562/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (769, 'VB软件开发定制EXCEL管理软件SSC', 'https://shop.zbj.com/2699026/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (770, '一零零一科技', 'https://shop.zbj.com/15385787/?fr=djwy', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (771, 'gch_ling', 'https://shop.zbj.com/4766974/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (772, '颖慧软件开发有限公司', 'https://shop.zbj.com/13146151/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (773, '厚普机电', 'https://shop.zbj.com/18767189/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (774, '以梦为马。。', 'https://shop.zbj.com/10815179/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (775, '聚红网络旗舰店', 'https://shop.zbj.com/17631482/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (776, '山东桥通天下网络科技', 'https://shop.zbj.com/19193938/?fr=djwy', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (777, '专业的网络科技公司', 'https://shop.zbj.com/10871074/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (778, '金博软件刘颖', 'https://shop.zbj.com/10939037/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (779, '博睿智软件', 'https://shop.zbj.com/9639287/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (780, '来采网络', 'https://shop.zbj.com/2340166/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (781, '加贝软件', 'https://shop.zbj.com/89251/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (782, '志进信息科技', 'https://shop.zbj.com/14395711/?fr=djwy', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (783, '金博软件888', 'https://shop.zbj.com/15871617/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (784, '麦可科技', 'https://shop.zbj.com/18156625/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (785, '晨讯科技网络有限公司', 'https://shop.zbj.com/20961271/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (786, '网尚网络有限公司', 'https://shop.zbj.com/3043786/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (787, '蝴蝶飞飞', 'https://shop.zbj.com/26270/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (788, '宝宏科技', 'https://shop.zbj.com/4985869/?fr=djwy', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (789, '微交易平台', 'https://shop.zbj.com/16634529/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (790, '米饭直播', 'https://shop.zbj.com/12428455/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (791, '易触即联', 'https://shop.zbj.com/13265611/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (792, '有梦想的小狐狸', 'https://shop.zbj.com/21540070/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (793, '大裂谷', 'https://shop.zbj.com/21736976/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (794, '广东嘉讯云计算科技有限公司', 'https://shop.zbj.com/21127314/?fr=djwy', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (795, '更优质的服务', 'https://shop.zbj.com/12013290/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (796, 'zozoyoyo', 'https://shop.zbj.com/12654579/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (797, 'AU3脚本 平面设计', 'https://shop.zbj.com/12466193/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (798, '同心网盟', 'https://shop.zbj.com/10991667/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (799, 'DemoHunter2014', 'https://shop.zbj.com/10227609/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (800, '美联互动', 'https://shop.zbj.com/20717907/?fr=djwy', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (801, '麻雀400', 'https://shop.zbj.com/11812767/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (802, 'zh星魂', 'https://shop.zbj.com/10436608/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (803, '起源高端设计', 'https://shop.zbj.com/7376466/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (804, 'LinkNet企业信息化建设', 'https://shop.zbj.com/5489380/', 1, '2019-06-05 15:25:06', NULL);
INSERT INTO `t_company` VALUES (805, '海月网络工作室', 'https://shop.zbj.com/4791332/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (806, 'hejianheng88', 'https://shop.zbj.com/3360143/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (807, '7cu', 'https://shop.zbj.com/15221653/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (808, '金博企业管理软件', 'https://shop.zbj.com/18657088/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (809, '子非鱼sama', 'https://shop.zbj.com/15034077/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (810, 'oceanwave1976', 'https://shop.zbj.com/14803968/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (811, '舞步的完美', 'https://shop.zbj.com/14363226/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (812, 'yejinmo', 'https://shop.zbj.com/12929521/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (813, '13463231652', 'https://shop.zbj.com/12088515/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (814, 'PBDesigner', 'https://shop.zbj.com/12328352/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (815, '红创网络', 'https://shop.zbj.com/11705655/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (816, '源满软件工作室', 'https://shop.zbj.com/11138742/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (817, '尧帝', 'https://shop.zbj.com/6798307/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (818, 'zhu1ba0jie', 'https://shop.zbj.com/6728180/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (819, '杨广慧', 'https://shop.zbj.com/5994826/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (820, 'zkimpulse', 'https://shop.zbj.com/10039682/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (821, 'mj_beijing', 'https://shop.zbj.com/5860016/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (822, '瑞杰营销', 'https://shop.zbj.com/4100300/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (823, 'axdyf', 'https://shop.zbj.com/4864701/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (824, '织梦二次开发', 'https://shop.zbj.com/3329739/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (825, '晶税数据', 'https://shop.zbj.com/9769570/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (826, 'free小软', 'https://shop.zbj.com/8942007/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (827, '龙辰软件', 'https://shop.zbj.com/7961573/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (828, 'yuyebing', 'https://shop.zbj.com/1650035/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (829, '后崖工作室', 'https://shop.zbj.com/10295634/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (830, '赛扬电子', 'https://shop.zbj.com/18439480/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (831, '华语科技', 'https://shop.zbj.com/13880621/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (832, '十点x十分', 'https://shop.zbj.com/12967278/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (833, 'ctsd', 'https://shop.zbj.com/9638519/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (834, '辉煌尛希', 'https://shop.zbj.com/8735479/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (835, '达科电子', 'https://shop.zbj.com/8656056/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (836, 'pinbozhong', 'https://shop.zbj.com/5901208/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (837, '智达电子开发', 'https://shop.zbj.com/14893220/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (838, '凌卓设计', 'https://shop.zbj.com/12813197/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (839, '晓风网络科技', 'https://shop.zbj.com/13430106/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (840, '战狼股票期货指标工作室', 'https://shop.zbj.com/13444095/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (841, '名字长了好注册', 'https://shop.zbj.com/10896360/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (842, '冷酷死神', 'https://shop.zbj.com/9221143/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (843, 'csbn211', 'https://shop.zbj.com/6418757/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (844, '旭日照四方1982', 'https://shop.zbj.com/6545327/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (845, '成石个人工作室', 'https://shop.zbj.com/6450171/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (846, 'guoshengjunv7', 'https://shop.zbj.com/5249340/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (847, 'hanohdy', 'https://shop.zbj.com/4721287/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (848, '王河顺', 'https://shop.zbj.com/4267654/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (849, '智胜网际软件工作室', 'https://shop.zbj.com/4174449/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (850, '向着自由奔去', 'https://shop.zbj.com/8603003/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (851, '李珍1021', 'https://shop.zbj.com/8791428/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (852, '兮洛0', 'https://shop.zbj.com/8807755/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (853, '标标必达', 'https://shop.zbj.com/9471818/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (854, '那片云226', 'https://shop.zbj.com/8235149/', 2, '2019-06-05 15:28:12', '');
INSERT INTO `t_company` VALUES (855, '猪小宝工作室', 'https://shop.zbj.com/7132643/', 1, '2019-06-05 15:25:07', NULL);
INSERT INTO `t_company` VALUES (856, '悠哉网虫工作室', 'https://shop.zbj.com/7851686/', 4, '2019-06-05 15:28:04', '');
INSERT INTO `t_company` VALUES (857, '危楼望月', 'https://shop.zbj.com/10465603/', 5, '2019-06-05 15:27:43', '');

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES (2, '2342342', '23423', NULL, NULL);
INSERT INTO `t_person` VALUES (3, '123', '123', '<p><img src=\"http://localhost:8080/fileSuffix/20190401/20190401093914676_KY6JV8.png\" title=\"upfile\" alt=\"系统快捷键.png\"/></p>', NULL);
INSERT INTO `t_person` VALUES (4, '123', '123', '<p>123123<br/></p>', '/fileSuffix/20190401/20190401094629111_8CNQSC.jpg');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vk
-- ----------------------------
DROP TABLE IF EXISTS `vk`;
CREATE TABLE `vk`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort_id` bigint(20) NULL DEFAULT NULL COMMENT '分类',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `price` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格',
  `num` int(20) NULL DEFAULT NULL COMMENT '成交量',
  `score` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分',
  `company` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34262 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vksort
-- ----------------------------
DROP TABLE IF EXISTS `vksort`;
CREATE TABLE `vksort`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `creatdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vksort
-- ----------------------------
INSERT INTO `vksort` VALUES (1, '软件开发', '河北省', '2019-05-31 13:32:04');
INSERT INTO `vksort` VALUES (2, '微信小程序', '河北省', '2019-05-31 17:24:35');

-- ----------------------------
-- Table structure for zbj
-- ----------------------------
DROP TABLE IF EXISTS `zbj`;
CREATE TABLE `zbj`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fenlei_id` bigint(20) NULL DEFAULT NULL COMMENT '分类',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `credit` int(20) NULL DEFAULT NULL COMMENT '信誉度',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '综合评分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8500 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
