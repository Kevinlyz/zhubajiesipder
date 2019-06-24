/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : lxq

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 24/06/2019 18:16:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `series` varchar(255) NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`series`) USING BTREE,
  UNIQUE KEY `UK_bqa9l0go97v49wwyx4c0u3kpd` (`token`) USING BTREE,
  UNIQUE KEY `UK_f8t9fsfwc17s6qcbx0ath6l3h` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fenlei` varchar(255) DEFAULT NULL COMMENT '分类',
  `addr` bigint(20) DEFAULT NULL COMMENT '所属地区',
  `creatdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sort
-- ----------------------------
BEGIN;
INSERT INTO `sort` VALUES (12, '网站开发', 3571, '2019-05-24 23:37:48');
INSERT INTO `sort` VALUES (13, '软件开发', 3571, '2019-05-27 10:33:43');
INSERT INTO `sort` VALUES (14, '营销', 3571, '2019-05-27 12:11:23');
COMMIT;

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKmeds2u6ae5usj0ko0bqj3k0eo` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_num` int(11) NOT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK3fekum3ead5klp7y4lckn5ohi` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
BEGIN;
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
INSERT INTO `sys_resource` VALUES (153, NULL, '猪八戒信息管理', 1, '', 0, '', 1);
INSERT INTO `sys_resource` VALUES (154, NULL, '爬取猪八戒信息', 2, '/admin/sort', 0, '/admin/sort', 153);
INSERT INTO `sys_resource` VALUES (155, NULL, '爬取一品威客信息', 3, '/admin/vksort', 0, '/admin/vksort', 153);
INSERT INTO `sys_resource` VALUES (156, NULL, '公司管理', 1, '/admin/tCompany', 0, '/admin/tCompany', 153);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, NULL, '管理员', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `sys_role_id` bigint(20) NOT NULL,
  `resources_id` bigint(20) NOT NULL,
  KEY `FKog6jj4v6yh9e1ilxk2mwuk75a` (`resources_id`) USING BTREE,
  KEY `FKsqkqfd2hpr5cc2kbrtgoced2w` (`sys_role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `sex_type` int(11) DEFAULT NULL COMMENT '性别(0.男,1.女)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, '2017-07-11 17:42:18', '$2a$10$SIU57gfkh/TsIVYALXBNAeDnQzkm652FT9cg4h8wtEfC306uliyYa', '2019-01-11 07:34:38', 'admin', b'1', '1191134106@qq.com', '15030103078', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles` (
  `sys_user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  KEY `FKdpvc6d7xqpqr43dfuk1s27cqh` (`roles_id`) USING BTREE,
  KEY `FKd0ut7sloes191bygyf7a3pk52` (`sys_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_roles` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `company_name` varchar(80) DEFAULT NULL COMMENT '公司名称',
  `company_url` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `credit` int(20) DEFAULT NULL COMMENT '信誉度',
  `score` varchar(255) DEFAULT NULL COMMENT '评分',
  `num` int(20) DEFAULT NULL COMMENT '成交量',
  `company_states` int(2) DEFAULT NULL COMMENT '1：等待处理\r\n2：正在联系\r\n3：联系成功\r\n4：无法联系\r\n5：已废弃',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `my_marks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_company
-- ----------------------------
BEGIN;
INSERT INTO `t_company` VALUES (487, '梵熙网络科技-互联网服务商', 'https://shop.zbj.com/22002131/?fr=yd', 5000, '0', 0, 1, '2019-06-24 18:06:49', NULL);
INSERT INTO `t_company` VALUES (488, '河北领行网络科技有限公司', 'https://shop.zbj.com/13563290/?fr=yd', 10000, '100', 0, 1, '2019-06-24 18:06:49', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `code` varchar(100) DEFAULT NULL COMMENT '编号',
  `content` text COMMENT '内容',
  `file_path` varchar(100) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_person
-- ----------------------------
BEGIN;
INSERT INTO `t_person` VALUES (2, '2342342', '23423', NULL, NULL);
INSERT INTO `t_person` VALUES (3, '123', '123', '<p><img src=\"http://localhost:8080/fileSuffix/20190401/20190401093914676_KY6JV8.png\" title=\"upfile\" alt=\"系统快捷键.png\"/></p>', NULL);
INSERT INTO `t_person` VALUES (4, '123', '123', '<p>123123<br/></p>', '/fileSuffix/20190401/20190401094629111_8CNQSC.jpg');
COMMIT;

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for vk
-- ----------------------------
DROP TABLE IF EXISTS `vk`;
CREATE TABLE `vk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort_id` bigint(20) DEFAULT NULL COMMENT '分类',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `title` varchar(80) DEFAULT NULL COMMENT '名称',
  `price` varchar(80) DEFAULT NULL COMMENT '价格',
  `num` int(20) DEFAULT NULL COMMENT '成交量',
  `score` varchar(20) DEFAULT NULL COMMENT '评分',
  `company` varchar(150) DEFAULT NULL COMMENT '公司',
  `link` varchar(255) DEFAULT NULL COMMENT '公司链接',
  `company_type` varchar(80) DEFAULT NULL COMMENT '个人/公司/工作室',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2482 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vk
-- ----------------------------
BEGIN;
INSERT INTO `vk` VALUES (2439, 2, '微信小程序', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (2440, 2, '微信小程序', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (2441, 2, '微信小程序', '河北省|石家', '小程序', '￥1000元/起', 0, '100.0%', '河北万中科技有限公司', 'http://shop.epwk.com/4180838/', '企业');
INSERT INTO `vk` VALUES (2442, 2, '微信小程序', '河北省|石家', '小程序开发', '￥1500元/套', 3, '100.0%', '数谷网络科技', 'http://shop.epwk.com/4172271/', '企业');
INSERT INTO `vk` VALUES (2443, 2, '微信小程序', '河北省|唐山', '微信小程序定制', '￥998元/起', 0, '100.0%', '极上科技', 'http://shop.epwk.com/4192977/', '企业');
INSERT INTO `vk` VALUES (2444, 2, '微信小程序', '河北省|衡水', '四合一服务：网站建设+小', '￥10000元/年', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', '企业');
INSERT INTO `vk` VALUES (2445, 2, '微信小程序', '河北省|衡水', '多门店小程序', '￥8000元/一口价', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', '企业');
INSERT INTO `vk` VALUES (2446, 2, '微信小程序', '河北省|石家', '微信小程序 定制 开发', '价格面议', 0, '100.0%', '河北异想科技有限公司', 'http://shop.epwk.com/4181252/', '企业');
INSERT INTO `vk` VALUES (2447, 2, '微信小程序', '河北省|保定', '微信门户小程序制作源码', '￥4999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/', '企业');
INSERT INTO `vk` VALUES (2448, 2, '微信小程序', '河北省|保定', '微商城小程序开发源码定', '￥12999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/', '企业');
INSERT INTO `vk` VALUES (2449, 2, '微信小程序', '河北省|石家', '微信公众号开发公众平台', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', '企业');
INSERT INTO `vk` VALUES (2450, 2, '微信小程序', '河北省|石家', '小程序开发，会员，分销，门店', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', '企业');
INSERT INTO `vk` VALUES (2451, 2, '微信小程序', '河北省|石家', '微信小程序开发——商城', '￥30000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/', '企业');
INSERT INTO `vk` VALUES (2452, 2, '微信小程序', '河北省|石家', '微信小程序开发——信息', '￥18000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/', '企业');
INSERT INTO `vk` VALUES (2453, 2, '微信小程序', '河北省|廊坊', '软件开发', '￥1000元/起', 0, '%', '初八信珩传媒科技', 'http://shop.epwk.com/4197470/', '工作室');
INSERT INTO `vk` VALUES (2454, 2, '微信小程序', '河北省|邯郸', '微信开发小程序公众号', '￥3999元/起', 0, '%', '博跃软件科技', 'http://shop.epwk.com/4196005/', '企业');
INSERT INTO `vk` VALUES (2455, 2, '微信小程序', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (2456, 2, '微信小程序', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (2457, 2, '微信小程序', '河北省|石家', '小程序', '￥1000元/起', 0, '100.0%', '河北万中科技有限公司', 'http://shop.epwk.com/4180838/', '企业');
INSERT INTO `vk` VALUES (2458, 2, '微信小程序', '河北省|石家', '小程序开发', '￥1500元/套', 3, '100.0%', '数谷网络科技', 'http://shop.epwk.com/4172271/', '企业');
INSERT INTO `vk` VALUES (2459, 2, '微信小程序', '河北省|唐山', '微信小程序定制', '￥998元/起', 0, '100.0%', '极上科技', 'http://shop.epwk.com/4192977/', '企业');
INSERT INTO `vk` VALUES (2460, 2, '微信小程序', '河北省|衡水', '四合一服务：网站建设+小', '￥10000元/年', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', '企业');
INSERT INTO `vk` VALUES (2461, 2, '微信小程序', '河北省|衡水', '多门店小程序', '￥8000元/一口价', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', '企业');
INSERT INTO `vk` VALUES (2462, 2, '微信小程序', '河北省|石家', '微信小程序 定制 开发', '价格面议', 0, '100.0%', '河北异想科技有限公司', 'http://shop.epwk.com/4181252/', '企业');
INSERT INTO `vk` VALUES (2463, 2, '微信小程序', '河北省|保定', '微信门户小程序制作源码', '￥4999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/', '企业');
INSERT INTO `vk` VALUES (2464, 2, '微信小程序', '河北省|保定', '微商城小程序开发源码定', '￥12999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/', '企业');
INSERT INTO `vk` VALUES (2465, 2, '微信小程序', '河北省|石家', '微信公众号开发公众平台', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', '企业');
INSERT INTO `vk` VALUES (2466, 2, '微信小程序', '河北省|石家', '小程序开发，会员，分销，门店', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', '企业');
INSERT INTO `vk` VALUES (2467, 2, '微信小程序', '河北省|石家', '微信小程序开发——商城', '￥30000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/', '企业');
INSERT INTO `vk` VALUES (2468, 2, '微信小程序', '河北省|石家', '微信小程序开发——信息', '￥18000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/', '企业');
INSERT INTO `vk` VALUES (2469, 2, '微信小程序', '河北省|廊坊', '软件开发', '￥1000元/起', 0, '%', '初八信珩传媒科技', 'http://shop.epwk.com/4197470/', '工作室');
INSERT INTO `vk` VALUES (2470, 2, '微信小程序', '河北省|邯郸', '微信开发小程序公众号', '￥3999元/起', 0, '%', '博跃软件科技', 'http://shop.epwk.com/4196005/', '企业');
INSERT INTO `vk` VALUES (2471, 2, '微信小程序', '河北省|石家', '微信公众号/小程序开发', '￥3000元/起', 0, '%', '河北神光勇安网络科技有限公司', 'http://shop.epwk.com/4195184/', '企业');
INSERT INTO `vk` VALUES (2472, 2, '微信小程序', '河北省|唐山', '小程序定制开发', '价格面议', 0, '%', '优享科技', 'http://shop.epwk.com/4183437/', '企业');
INSERT INTO `vk` VALUES (2473, 2, '微信小程序', '河北省|石家', '人人商城-小程序前端+后', '￥100元/次', 0, '%', '小杨php定制', 'http://shop.epwk.com/4176463/', '工作室');
INSERT INTO `vk` VALUES (2474, 2, '微信小程序', '河北省|秦皇', '微信小程序开发', '￥5000元/起', 0, '%', '聚享时空网络', 'http://shop.epwk.com/4167353/', '工作室');
INSERT INTO `vk` VALUES (2475, 2, '微信小程序', '河北省|石家', '小程序开发', '￥10元/件', 0, '%', '垚梦网络', 'http://shop.epwk.com/4185034/', '企业');
INSERT INTO `vk` VALUES (2476, 2, '微信小程序', '河北省|沧州', '微信公众号小程序开发/', '￥5000元/起', 0, '%', '软星科技', 'http://shop.epwk.com/4176687/', '工作室');
INSERT INTO `vk` VALUES (2477, 2, '微信小程序', '河北省|秦皇', '小程序搭建', '￥1200元/年', 0, '%', '蓝七大法师', 'http://shop.epwk.com/4184856/', '个人');
INSERT INTO `vk` VALUES (2478, 2, '微信小程序', '河北省|保定', '公众号开发', '￥4000元/次', 0, '%', '铭恩计算机信息技术服务有限公司', 'http://shop.epwk.com/4180929/', '企业');
INSERT INTO `vk` VALUES (2479, 2, '微信小程序', '河北省|保定', '先试用|微信小程序开发|', '价格面议', 0, '%', '保定市讯辰网络科技有限公司', 'http://shop.epwk.com/4185596/', '企业');
INSERT INTO `vk` VALUES (2480, 2, '微信小程序', '河北省|唐山', '小程序', '￥540元/年', 0, '%', '子牛科技', 'http://shop.epwk.com/4187962/', '企业');
INSERT INTO `vk` VALUES (2481, 2, '微信小程序', '河北省|唐山', '微信小程序开发 小程序', '价格面议', 0, '%', '兴通科技', 'http://shop.epwk.com/4185887/', '工作室');
COMMIT;

-- ----------------------------
-- Table structure for vksort
-- ----------------------------
DROP TABLE IF EXISTS `vksort`;
CREATE TABLE `vksort` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort` varchar(20) DEFAULT NULL COMMENT '分类',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `creatdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vksort
-- ----------------------------
BEGIN;
INSERT INTO `vksort` VALUES (1, '软件开发', '河北省', '2019-06-05 14:36:08');
INSERT INTO `vksort` VALUES (2, '微信小程序', '河北省', '2019-05-31 17:24:35');
COMMIT;

-- ----------------------------
-- Table structure for zbj
-- ----------------------------
DROP TABLE IF EXISTS `zbj`;
CREATE TABLE `zbj` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fenlei_id` bigint(20) DEFAULT NULL COMMENT '分类',
  `name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `addr` varchar(255) DEFAULT NULL COMMENT '地区',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `credit` int(20) DEFAULT NULL COMMENT '信誉度',
  `score` varchar(255) DEFAULT NULL COMMENT '综合评分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=975 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of zbj
-- ----------------------------
BEGIN;
INSERT INTO `zbj` VALUES (954, 14, '艺点品牌策划有限公司', '保定', 'https://shop.zbj.com/7163110/?fr=yd', '企业', 20000, '100%');
INSERT INTO `zbj` VALUES (955, 14, '梵熙网络科技-互联网服务商', '保定', 'https://shop.zbj.com/22002131/?fr=yd', '企业', 5000, '0%');
INSERT INTO `zbj` VALUES (956, 14, '怀风文化', '保定', 'https://shop.zbj.com/1240897/', '企业', 5000, '100%');
INSERT INTO `zbj` VALUES (957, 14, '微辰淘宝托管微信开发团队', '保定', 'https://shop.zbj.com/18672341/', '企业', 9000, '100%');
INSERT INTO `zbj` VALUES (958, 14, '久念软件', '保定', 'https://shop.zbj.com/21706405/', '个人', 1000, '0%');
INSERT INTO `zbj` VALUES (959, 14, '慧海新软', '重庆', 'https://shop.zbj.com/21052109/?fr=djwy', '企业', 5000, '83%');
INSERT INTO `zbj` VALUES (960, 14, '不落窠臼品牌设计旗舰店', '保定', 'https://shop.zbj.com/17959634/', '企业', 1000, '86%');
INSERT INTO `zbj` VALUES (961, 14, '专业前后端团队', '保定', 'https://shop.zbj.com/15034919/', '企业', 1000, '0%');
INSERT INTO `zbj` VALUES (962, 14, '潜龙文丰', '保定', 'https://shop.zbj.com/10576915/', '个人', 0, '98%');
INSERT INTO `zbj` VALUES (963, 14, '慧狼谷企业营销策划', '保定', 'https://shop.zbj.com/14511438/', '企业', 0, '98%');
INSERT INTO `zbj` VALUES (964, 14, '专业营销发帖团队', '保定', 'https://shop.zbj.com/16638063/', '个人', 0, '0%');
INSERT INTO `zbj` VALUES (965, 14, '卓越启创Qx1024', '武汉', 'https://shop.zbj.com/7573904/?fr=djwy', '企业', 9000, '100%');
INSERT INTO `zbj` VALUES (966, 14, 'V8网络营销', '保定', 'https://shop.zbj.com/11302164/', '个人', 0, '0%');
INSERT INTO `zbj` VALUES (967, 14, '青峰营销推广', '保定', 'https://shop.zbj.com/5287102/', '企业', 0, '90%');
INSERT INTO `zbj` VALUES (968, 14, '营销推广策划', '保定', 'https://shop.zbj.com/14549877/', '个人', 0, '0%');
INSERT INTO `zbj` VALUES (969, 14, '瑞杰营销', '保定', 'https://shop.zbj.com/4100300/', '个人', 0, '100%');
INSERT INTO `zbj` VALUES (970, 14, '微阳光营销工作室', '保定', 'https://shop.zbj.com/6026581/', '个人', 0, '0%');
INSERT INTO `zbj` VALUES (971, 14, '天子科技有限公司', '宜昌', 'https://shop.zbj.com/7108974/?fr=djwy', '企业', 0, '100%');
INSERT INTO `zbj` VALUES (972, 14, '专注营销力', '保定', 'https://shop.zbj.com/15245139/', '个人', 0, '0%');
INSERT INTO `zbj` VALUES (973, 14, '优品网络营销', '保定', 'https://shop.zbj.com/5241628/', '个人', 0, '100%');
INSERT INTO `zbj` VALUES (974, 14, '微帮客营销', '保定', 'https://shop.zbj.com/13243411/', '企业', 0, '0%');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
