/*
 Navicat Premium Data Transfer

 Source Server         : th
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : lxq

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 05/06/2019 18:32:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `series` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
  `fenlei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类',
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_num` int(11) NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK3fekum3ead5klp7y4lckn5ohi` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
INSERT INTO `sys_resource` VALUES (153, NULL, '爬取信息管理', 1, '', 0, '', 1);
INSERT INTO `sys_resource` VALUES (154, NULL, '爬取猪八戒信息', 1, '/admin/sort', 0, '/admin/sort', 153);
INSERT INTO `sys_resource` VALUES (155, NULL, '爬取一品威客信息', 2, '/admin/vksort', 0, '/admin/vksort', 153);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
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
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for vk
-- ----------------------------
DROP TABLE IF EXISTS `vk`;
CREATE TABLE `vk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort_id` bigint(20) DEFAULT NULL COMMENT '分类',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `price` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '价格',
  `num` int(20) DEFAULT NULL COMMENT '成交量',
  `score` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评分',
  `company` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司链接',
  `company_type` varchar(80) DEFAULT NULL COMMENT '个人/公司/工作室',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53852 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vk
-- ----------------------------
BEGIN;
INSERT INTO `vk` VALUES (53566, 1, '软件开发', '河北省|保定', '多商户主题商城小程序，拼', '￥20000元/件', 40, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53567, 1, '软件开发', '河北省|唐山', '货运物流软件/同城快递', '￥45800元/一口价', 6, '100.0%', '追梦创软科技有限公司', 'http://shop.epwk.com/4152928/', '企业');
INSERT INTO `vk` VALUES (53568, 1, '软件开发', '河北省|保定', '微信视频小程序开发', '￥100元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53569, 1, '软件开发', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53570, 1, '软件开发', '河北省|唐山', 'APP开发', '价格面议', 0, '100.0%', '富联工作室', 'http://shop.epwk.com/4150426/', '个人');
INSERT INTO `vk` VALUES (53571, 1, '软件开发', '河北省|唐山', '软件开发', '价格面议', 0, '100.0%', '富联工作室', 'http://shop.epwk.com/4150426/', '个人');
INSERT INTO `vk` VALUES (53572, 1, '软件开发', '河北省|保定', '同城多商户入驻活动', '￥6310元/次', 7, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53573, 1, '软件开发', '河北省|保定', '微信扫码挪车公众号开发', '￥6000元/件', 6, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53574, 1, '软件开发', '河北省|秦皇', '程序开发', '价格面议', 0, '100.0%', '建宁科技工作室', 'http://shop.epwk.com/4143126/', '个人');
INSERT INTO `vk` VALUES (53575, 1, '软件开发', '河北省|保定', '餐饮外卖分销', '￥6600元/件', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53576, 1, '软件开发', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53577, 1, '软件开发', '河北省|沧州', '2016—2017新款原油、黄', '￥26800元/件', 0, '100.0%', '程序世界', 'http://shop.epwk.com/4161131/', '个人');
INSERT INTO `vk` VALUES (53578, 1, '软件开发', '河北省|沧州', '外汇期货智能交易程序编', '￥38000元/件', 0, '100.0%', '程序世界', 'http://shop.epwk.com/4161131/', '个人');
INSERT INTO `vk` VALUES (53579, 1, '软件开发', '河北省|廊坊', 'iOS APP开发', '￥9000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/', '工作室');
INSERT INTO `vk` VALUES (53580, 1, '软件开发', '河北省|廊坊', 'Android APP', '￥9000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/', '工作室');
INSERT INTO `vk` VALUES (53581, 1, '软件开发', '河北省|廊坊', '微信公众号', '￥8000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/', '工作室');
INSERT INTO `vk` VALUES (53582, 1, '软件开发', '河北省|保定', '建材多商户分销小程序', '￥6900元/年', 1, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53583, 1, '软件开发', '河北省|保定', '建材商城开发小程序开发', '￥12000元/次', 1, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53584, 1, '软件开发', '河北省|保定', '一套39800，包上线，超市商', '￥39800元/次', 0, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53585, 1, '软件开发', '河北省|唐山', 'IOS与Android在线服务类', '￥28000元/其他', 0, '100.0%', '大治中承·君如意科技', 'http://shop.epwk.com/4139525/', '企业');
INSERT INTO `vk` VALUES (53586, 1, '软件开发', '河北省|唐山', '微信开发', '价格面议', 0, '100.0%', '大治中承·君如意科技', 'http://shop.epwk.com/4139525/', '企业');
INSERT INTO `vk` VALUES (53587, 1, '软件开发', '河北省|石家', 'APP定制开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53588, 1, '软件开发', '河北省|石家', '微信公众平台开发', '￥2000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53589, 1, '软件开发', '河北省|石家', '小程序定制开发', '￥2000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53590, 1, '软件开发', '河北省|石家', '教育类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53591, 1, '软件开发', '河北省|石家', '美容类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53592, 1, '软件开发', '河北省|石家', '物业类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53593, 1, '软件开发', '河北省|石家', '购物类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53594, 1, '软件开发', '河北省|石家', '直播类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53595, 1, '软件开发', '河北省|石家', '社交类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53596, 1, '软件开发', '河北省|石家', 'O2O电商平台APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53597, 1, '软件开发', '河北省|石家', '外卖类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53598, 1, '软件开发', '河北省|石家', '夺宝类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53599, 1, '软件开发', '河北省|石家', '智能家居类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/', '企业');
INSERT INTO `vk` VALUES (53810, 2, '微信小程序', '河北省|保定', '微信视频小程序开发', '￥100元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53811, 2, '微信小程序', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53812, 2, '微信小程序', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53813, 2, '微信小程序', '河北省|石家', '小程序', '￥1000元/起', 0, '100.0%', '河北万中科技有限公司', 'http://shop.epwk.com/4180838/', '企业');
INSERT INTO `vk` VALUES (53814, 2, '微信小程序', '河北省|石家', '小程序开发', '￥1500元/套', 3, '100.0%', '数谷网络科技', 'http://shop.epwk.com/4172271/', '企业');
INSERT INTO `vk` VALUES (53815, 2, '微信小程序', '河北省|唐山', '微信小程序定制', '￥998元/起', 0, '100.0%', '极上科技', 'http://shop.epwk.com/4192977/', '企业');
INSERT INTO `vk` VALUES (53816, 2, '微信小程序', '河北省|衡水', '四合一服务：网站建设+小', '￥10000元/年', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', '企业');
INSERT INTO `vk` VALUES (53817, 2, '微信小程序', '河北省|衡水', '多门店小程序', '￥8000元/一口价', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', '企业');
INSERT INTO `vk` VALUES (53818, 2, '微信小程序', '河北省|石家', '微信小程序 定制 开发', '价格面议', 0, '100.0%', '河北异想科技有限公司', 'http://shop.epwk.com/4181252/', '企业');
INSERT INTO `vk` VALUES (53819, 2, '微信小程序', '河北省|保定', '微信门户小程序制作源码', '￥4999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/', '企业');
INSERT INTO `vk` VALUES (53820, 2, '微信小程序', '河北省|保定', '微商城小程序开发源码定', '￥12999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/', '企业');
INSERT INTO `vk` VALUES (53821, 2, '微信小程序', '河北省|石家', '微信公众号开发公众平台', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', '企业');
INSERT INTO `vk` VALUES (53822, 2, '微信小程序', '河北省|石家', '小程序开发，会员，分销，门店', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', '企业');
INSERT INTO `vk` VALUES (53823, 2, '微信小程序', '河北省|石家', '微信小程序开发——商城', '￥30000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/', '企业');
INSERT INTO `vk` VALUES (53824, 2, '微信小程序', '河北省|石家', '微信小程序开发——信息', '￥18000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/', '企业');
INSERT INTO `vk` VALUES (53825, 2, '微信小程序', '河北省|石家', '微信公众号/小程序开发', '￥3000元/起', 0, '%', '河北神光勇安网络科技有限公司', 'http://shop.epwk.com/4195184/', '企业');
INSERT INTO `vk` VALUES (53826, 2, '微信小程序', '河北省|保定', '微信视频小程序开发', '￥100元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53827, 2, '微信小程序', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53828, 2, '微信小程序', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/', '企业');
INSERT INTO `vk` VALUES (53829, 2, '微信小程序', '河北省|石家', '小程序', '￥1000元/起', 0, '100.0%', '河北万中科技有限公司', 'http://shop.epwk.com/4180838/', '企业');
INSERT INTO `vk` VALUES (53830, 2, '微信小程序', '河北省|石家', '小程序开发', '￥1500元/套', 3, '100.0%', '数谷网络科技', 'http://shop.epwk.com/4172271/', '企业');
INSERT INTO `vk` VALUES (53831, 2, '微信小程序', '河北省|唐山', '微信小程序定制', '￥998元/起', 0, '100.0%', '极上科技', 'http://shop.epwk.com/4192977/', '企业');
INSERT INTO `vk` VALUES (53832, 2, '微信小程序', '河北省|衡水', '四合一服务：网站建设+小', '￥10000元/年', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', '企业');
INSERT INTO `vk` VALUES (53833, 2, '微信小程序', '河北省|衡水', '多门店小程序', '￥8000元/一口价', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/', '企业');
INSERT INTO `vk` VALUES (53834, 2, '微信小程序', '河北省|石家', '微信小程序 定制 开发', '价格面议', 0, '100.0%', '河北异想科技有限公司', 'http://shop.epwk.com/4181252/', '企业');
INSERT INTO `vk` VALUES (53835, 2, '微信小程序', '河北省|保定', '微信门户小程序制作源码', '￥4999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/', '企业');
INSERT INTO `vk` VALUES (53836, 2, '微信小程序', '河北省|保定', '微商城小程序开发源码定', '￥12999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/', '企业');
INSERT INTO `vk` VALUES (53837, 2, '微信小程序', '河北省|石家', '微信公众号开发公众平台', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', '企业');
INSERT INTO `vk` VALUES (53838, 2, '微信小程序', '河北省|石家', '小程序开发，会员，分销，门店', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/', '企业');
INSERT INTO `vk` VALUES (53839, 2, '微信小程序', '河北省|石家', '微信小程序开发——商城', '￥30000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/', '企业');
INSERT INTO `vk` VALUES (53840, 2, '微信小程序', '河北省|石家', '微信小程序开发——信息', '￥18000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/', '企业');
INSERT INTO `vk` VALUES (53841, 2, '微信小程序', '河北省|石家', '微信公众号/小程序开发', '￥3000元/起', 0, '%', '河北神光勇安网络科技有限公司', 'http://shop.epwk.com/4195184/', '企业');
INSERT INTO `vk` VALUES (53842, 2, '微信小程序', '河北省|邯郸', '微信开发小程序公众号', '￥3999元/起', 0, '%', '博跃软件科技', 'http://shop.epwk.com/4196005/', '企业');
INSERT INTO `vk` VALUES (53843, 2, '微信小程序', '河北省|唐山', '小程序定制开发', '价格面议', 0, '%', '优享科技', 'http://shop.epwk.com/4183437/', '企业');
INSERT INTO `vk` VALUES (53844, 2, '微信小程序', '河北省|石家', '人人商城-小程序前端+后', '￥100元/次', 0, '%', '小杨php定制', 'http://shop.epwk.com/4176463/', '工作室');
INSERT INTO `vk` VALUES (53845, 2, '微信小程序', '河北省|秦皇', '微信小程序开发', '￥5000元/起', 0, '%', '聚享时空网络', 'http://shop.epwk.com/4167353/', '工作室');
INSERT INTO `vk` VALUES (53846, 2, '微信小程序', '河北省|石家', '小程序开发', '￥10元/件', 0, '%', '垚梦网络', 'http://shop.epwk.com/4185034/', '企业');
INSERT INTO `vk` VALUES (53847, 2, '微信小程序', '河北省|沧州', '微信公众号小程序开发/', '￥5000元/起', 0, '%', '软星科技', 'http://shop.epwk.com/4176687/', '工作室');
INSERT INTO `vk` VALUES (53848, 2, '微信小程序', '河北省|秦皇', '小程序搭建', '￥1200元/年', 0, '%', '蓝七大法师', 'http://shop.epwk.com/4184856/', '个人');
INSERT INTO `vk` VALUES (53849, 2, '微信小程序', '河北省|保定', '先试用|微信小程序开发|', '价格面议', 0, '%', '保定市讯辰网络科技有限公司', 'http://shop.epwk.com/4185596/', '企业');
INSERT INTO `vk` VALUES (53850, 2, '微信小程序', '河北省|唐山', '小程序', '￥540元/年', 0, '%', '子牛科技', 'http://shop.epwk.com/4187962/', '企业');
INSERT INTO `vk` VALUES (53851, 2, '微信小程序', '河北省|唐山', '微信小程序开发 小程序', '价格面议', 0, '%', '兴通科技', 'http://shop.epwk.com/4185887/', '工作室');
COMMIT;

-- ----------------------------
-- Table structure for vksort
-- ----------------------------
DROP TABLE IF EXISTS `vksort`;
CREATE TABLE `vksort` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份',
  `creatdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司名称',
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地区',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `credit` int(20) DEFAULT NULL COMMENT '信誉度',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '综合评分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12244 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of zbj
-- ----------------------------
BEGIN;
INSERT INTO `zbj` VALUES (9787, 14, '微辰淘宝托管微信开发团队', '保定', 'https://shop.zbj.com/18672341/', '企业', 9000, '5.00');
INSERT INTO `zbj` VALUES (9788, 14, '艺点品牌策划有限公司', '保定', 'https://shop.zbj.com/7163110/?fr=yd', '企业', 20000, '4.97');
INSERT INTO `zbj` VALUES (9789, 14, '怀风文化', '保定', 'https://shop.zbj.com/1240897/', '企业', 5000, '4.93');
INSERT INTO `zbj` VALUES (9790, 14, '久念软件', '保定', 'https://shop.zbj.com/21706405/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9791, 14, '不落窠臼品牌设计旗舰店', '保定', 'https://shop.zbj.com/17959634/', '企业', 1000, '4.45');
INSERT INTO `zbj` VALUES (9792, 14, '深圳市全能广告', '深圳', 'https://shop.zbj.com/18835317/?fr=djwy', '企业', 4000, '5.00');
INSERT INTO `zbj` VALUES (9793, 14, '专业前后端团队', '保定', 'https://shop.zbj.com/15034919/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (9794, 14, '潜龙文丰', '保定', 'https://shop.zbj.com/10576915/', '个人', 0, '4.94');
INSERT INTO `zbj` VALUES (9795, 14, '慧狼谷企业营销策划', '保定', 'https://shop.zbj.com/14511438/', '企业', 0, '4.87');
INSERT INTO `zbj` VALUES (9796, 14, '专业营销发帖团队', '保定', 'https://shop.zbj.com/16638063/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9797, 14, 'V8网络营销', '保定', 'https://shop.zbj.com/11302164/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9798, 14, '米格传播MIGO', '佛山', 'https://shop.zbj.com/16125627/?fr=djwy', '企业', 4000, '5.00');
INSERT INTO `zbj` VALUES (9799, 14, '青峰营销推广', '保定', 'https://shop.zbj.com/5287102/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9800, 14, '营销推广策划', '保定', 'https://shop.zbj.com/14549877/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9801, 14, '瑞杰营销', '保定', 'https://shop.zbj.com/4100300/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9802, 14, '微阳光营销工作室', '保定', 'https://shop.zbj.com/6026581/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9803, 14, '专注营销力', '保定', 'https://shop.zbj.com/15245139/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9804, 14, '北京启明天创科技有限公司', '北京', 'https://shop.zbj.com/9983138/?fr=djwy', '企业', 10000, '5.00');
INSERT INTO `zbj` VALUES (9805, 14, '优品网络营销', '保定', 'https://shop.zbj.com/5241628/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9806, 14, '微帮客营销', '保定', 'https://shop.zbj.com/13243411/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11682, 12, '河北伟湃网络科技有限公司', '保定', 'https://shop.zbj.com/15419032/?fr=yd', '企业', 7000, '5.00');
INSERT INTO `zbj` VALUES (11683, 12, '河北领行网络科技有限公司', '保定', 'https://shop.zbj.com/13563290/?fr=yd', '企业', 10000, '5.00');
INSERT INTO `zbj` VALUES (11684, 12, '微辰淘宝托管微信开发团队', '保定', 'https://shop.zbj.com/18672341/', '企业', 9000, '5.00');
INSERT INTO `zbj` VALUES (11685, 12, '久念软件', '保定', 'https://shop.zbj.com/21706405/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11686, 12, '河北雄安桃李科技有限公司', '保定', 'https://shop.zbj.com/21465026/', '企业', 4500, '0.00');
INSERT INTO `zbj` VALUES (11687, 12, '上海泰闻信息科技有限公司', '上海', 'https://shop.zbj.com/14903609/?fr=djwy', '企业', 12000, '4.98');
INSERT INTO `zbj` VALUES (11688, 12, '保定凌众科技', '保定', 'https://shop.zbj.com/14017496/', '企业', 0, '4.81');
INSERT INTO `zbj` VALUES (11689, 12, '智雅科技网络有限公司', '保定', 'https://shop.zbj.com/10521947/', '企业', 0, '4.69');
INSERT INTO `zbj` VALUES (11690, 12, '纤羽工作室', '保定', 'https://shop.zbj.com/19802860/', '个人', 2000, '0.00');
INSERT INTO `zbj` VALUES (11691, 12, '如夏网络工作室', '保定', 'https://shop.zbj.com/685846/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11692, 12, '小崔前端', '保定', 'https://shop.zbj.com/21537300/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11693, 12, '权度网络', '武汉', 'https://shop.zbj.com/8150155/?fr=djwy', '企业', 5000, '0.00');
INSERT INTO `zbj` VALUES (11694, 12, '小额网站相关', '保定', 'https://shop.zbj.com/19239358/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11695, 12, 'VB软件开发定制EXCEL管理软件SSC', '保定', 'https://shop.zbj.com/2699026/', '个人', 5000, '4.95');
INSERT INTO `zbj` VALUES (11696, 12, '流浪的喵', '保定', 'https://shop.zbj.com/18669648/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11697, 12, '网尚网络有限公司', '保定', 'https://shop.zbj.com/3043786/', '企业', 0, '4.95');
INSERT INTO `zbj` VALUES (11698, 12, '开发PHP开发', '保定', 'https://shop.zbj.com/15175254/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11699, 12, '牵亿网讯', '北京', 'https://shop.zbj.com/18407564/?fr=djwy', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (11700, 12, '鱼为情网络', '保定', 'https://shop.zbj.com/3539838/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11701, 12, '云浔小说系统-专注文学原创系统开发', '保定', 'https://shop.zbj.com/14145126/', '企业', 0, '4.89');
INSERT INTO `zbj` VALUES (11702, 12, '聚红网络旗舰店', '保定', 'https://shop.zbj.com/17631482/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (11703, 12, '保定网商互通网络科技有限公司', '保定', 'https://shop.zbj.com/12675115/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (11704, 12, '来采网络', '保定', 'https://shop.zbj.com/2340166/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (11705, 12, '博创明志信息科技', '长沙', 'https://shop.zbj.com/14598266/?fr=djwy', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11706, 12, 'blueseaworld', '保定', 'https://shop.zbj.com/8775581/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11707, 12, '筑梦网站开发', '保定', 'https://shop.zbj.com/13138452/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11708, 12, '切图前端4年经验', '保定', 'https://shop.zbj.com/8211437/', '个人', 0, '4.98');
INSERT INTO `zbj` VALUES (11709, 12, '海文极客', '保定', 'https://shop.zbj.com/18463135/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (11710, 12, '坊正网络', '保定', 'https://shop.zbj.com/17755769/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11711, 12, '半刻网络', '宁波', 'https://shop.zbj.com/20595136/?fr=djwy', '企业', 10000, '0.00');
INSERT INTO `zbj` VALUES (11712, 12, '保定市恒江网络科技有限公司', '保定', 'https://shop.zbj.com/19680780/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11713, 12, '蜜罐大师', '保定', 'https://shop.zbj.com/13710524/', '个人', 0, '4.87');
INSERT INTO `zbj` VALUES (11714, 12, '睿策高端包装策划', '保定', 'https://shop.zbj.com/12331439/', '个人', 0, '4.78');
INSERT INTO `zbj` VALUES (11715, 12, '创宏软件工作室', '保定', 'https://shop.zbj.com/12177140/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11716, 12, '保定云上网络科技', '保定', 'https://shop.zbj.com/14108023/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11717, 12, '万选通网络信息技术有限公司', '北京', 'https://shop.zbj.com/20510625/?fr=djwy', '企业', 4500, '5.00');
INSERT INTO `zbj` VALUES (11718, 12, '北京动力网络设计', '保定', 'https://shop.zbj.com/11658393/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11719, 12, 'i文峰工作室', '保定', 'https://shop.zbj.com/4860178/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11720, 12, '金博软件刘颖', '保定', 'https://shop.zbj.com/10939037/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11721, 12, '鼎和工作室', '保定', 'https://shop.zbj.com/9870452/', '个人', 0, '4.72');
INSERT INTO `zbj` VALUES (11722, 12, 'czhqjh_@Zbj', '保定', 'https://shop.zbj.com/8193939/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11723, 12, '麦可科技', '保定', 'https://shop.zbj.com/18156625/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11724, 12, '慧狼谷企业营销策划', '保定', 'https://shop.zbj.com/14511438/', '企业', 0, '4.87');
INSERT INTO `zbj` VALUES (11725, 12, '蛙塞科技', '保定', 'https://shop.zbj.com/19115235/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11726, 12, '中子科技工作室', '保定', 'https://shop.zbj.com/12088851/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11727, 12, '云蛛网络科技有限公司', '保定', 'https://shop.zbj.com/8382059/', '个人', 1000, '4.83');
INSERT INTO `zbj` VALUES (11728, 12, '静宇网络', '保定', 'https://shop.zbj.com/8839963/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11729, 12, '蝴蝶飞飞', '保定', 'https://shop.zbj.com/26270/', '个人', 0, '4.82');
INSERT INTO `zbj` VALUES (11730, 12, '不凑活', '保定', 'https://shop.zbj.com/17378621/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11731, 12, '倬威达软件有限公司', '保定', 'https://shop.zbj.com/14607626/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11732, 12, '云韶工作室', '保定', 'https://shop.zbj.com/10999554/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11733, 12, 'buzhidaoyy', '保定', 'https://shop.zbj.com/5748569/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11734, 12, '久念软件开发', '保定', 'https://shop.zbj.com/17400696/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (11735, 12, '白马网络', '保定', 'https://shop.zbj.com/17821380/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11736, 12, '飞龙测试', '保定', 'https://shop.zbj.com/21307729/', '个人', 500, '0.00');
INSERT INTO `zbj` VALUES (11737, 12, '孙小胖的小铺', '保定', 'https://shop.zbj.com/19742974/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11738, 12, '米饭直播', '保定', 'https://shop.zbj.com/12428455/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11739, 12, '福居天下网络科技', '保定', 'https://shop.zbj.com/2750129/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11740, 12, 'okcms', '保定', 'https://shop.zbj.com/20640596/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11741, 12, '点动软件', '保定', 'https://shop.zbj.com/21337688/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11742, 12, '乐建', '保定', 'https://shop.zbj.com/21030448/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11743, 12, '保定保定保定', '保定', 'https://shop.zbj.com/21830177/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11744, 12, '亚帝鼎科技', '保定', 'https://shop.zbj.com/18835882/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (11745, 12, '逅雨阁', '保定', 'https://shop.zbj.com/14102572/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11746, 12, '异度网络', '保定', 'https://shop.zbj.com/10704134/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11747, 12, '张旭乾', '保定', 'https://shop.zbj.com/5534366/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11748, 12, '如意金铺', '保定', 'https://shop.zbj.com/4522856/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11749, 12, 'GJHGJKL', '保定', 'https://shop.zbj.com/21270150/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (11750, 12, '小正网站开发2年经验', '保定', 'https://shop.zbj.com/15325834/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11751, 12, '腾骏科技', '保定', 'https://shop.zbj.com/19974117/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11752, 12, '开心的店', '保定', 'https://shop.zbj.com/18182967/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11753, 12, '创宇技术', '保定', 'https://shop.zbj.com/18730403/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11754, 12, '小强网络服务工作室', '保定', 'https://shop.zbj.com/17946136/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11755, 12, '涂鸦计划', '保定', 'https://shop.zbj.com/17807506/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11756, 12, 'php小帅666', '保定', 'https://shop.zbj.com/16747937/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11757, 12, '天津华泰科技', '保定', 'https://shop.zbj.com/17020264/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11758, 12, '石头的故事啊', '保定', 'https://shop.zbj.com/16011217/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11759, 12, '专业网站价格质量没得说', '保定', 'https://shop.zbj.com/15171308/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11760, 12, 'ly_help', '保定', 'https://shop.zbj.com/14905713/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11761, 12, 'laravel灬极客', '保定', 'https://shop.zbj.com/15512084/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11762, 12, '前端myworld', '保定', 'https://shop.zbj.com/15434820/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11763, 12, '专注营销力', '保定', 'https://shop.zbj.com/15245139/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11764, 12, '金纯.com', '保定', 'https://shop.zbj.com/14569518/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11765, 12, 'yatian9', '保定', 'https://shop.zbj.com/13264984/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11766, 12, '『天玖昊利』品牌创意设计', '保定', 'https://shop.zbj.com/11952018/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11767, 12, '因拓本', '保定', 'https://shop.zbj.com/11945465/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11768, 12, 'LAMP p工作室', '保定', 'https://shop.zbj.com/12322789/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11769, 12, 'aiyahacke', '保定', 'https://shop.zbj.com/12045930/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11770, 12, '明智远达', '保定', 'https://shop.zbj.com/12094240/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11771, 12, '小黑被晒黑了', '保定', 'https://shop.zbj.com/12588562/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11772, 12, '五折建站', '保定', 'https://shop.zbj.com/13492722/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11773, 12, '丹华抱一鷇音子', '保定', 'https://shop.zbj.com/12951522/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11774, 12, '云朵朵网络', '保定', 'https://shop.zbj.com/12854237/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11775, 12, 'zozoyoyo', '保定', 'https://shop.zbj.com/12654579/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11776, 12, '病乌鸦', '保定', 'https://shop.zbj.com/13377043/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11777, 12, '缘分统领时尚', '保定', 'https://shop.zbj.com/11715125/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11778, 12, '专业网站搭建', '保定', 'https://shop.zbj.com/11727108/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11779, 12, '八号CODE', '保定', 'https://shop.zbj.com/11701086/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11780, 12, '无言小市民', '保定', 'https://shop.zbj.com/11305284/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11781, 12, '遨游互联', '保定', 'https://shop.zbj.com/14432722/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11782, 12, '博尚易创软件开发有限公司', '保定', 'https://shop.zbj.com/13957994/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11783, 12, '亲亲宝妮', '保定', 'https://shop.zbj.com/10618661/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11784, 12, '宇腾网络', '保定', 'https://shop.zbj.com/7239266/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11785, 12, '小兰兰的家', '保定', 'https://shop.zbj.com/5498649/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11786, 12, 'xiaozhao0109', '保定', 'https://shop.zbj.com/10326341/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11787, 12, '网站制作div+css网页制作', '保定', 'https://shop.zbj.com/11211685/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11788, 12, 'HTML+CSS+PHP+MYSQL', '保定', 'https://shop.zbj.com/11047095/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11789, 12, 'sain工作室', '保定', 'https://shop.zbj.com/4059529/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11790, 12, '漫步云端0219', '保定', 'https://shop.zbj.com/9182309/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11791, 12, 'PS制图', '保定', 'https://shop.zbj.com/8947403/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11792, 12, 'AirTeams', '保定', 'https://shop.zbj.com/8707503/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11793, 12, '9507', '保定', 'https://shop.zbj.com/10168616/', '企业', 0, '4.47');
INSERT INTO `zbj` VALUES (11794, 12, '三间北房', '保定', 'https://shop.zbj.com/9732708/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11795, 12, '起源高端设计', '保定', 'https://shop.zbj.com/7376466/', '个人', 0, '4.87');
INSERT INTO `zbj` VALUES (11796, 12, 'bdbuy', '保定', 'https://shop.zbj.com/8576470/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11797, 12, '豆腐馒头花', '保定', 'https://shop.zbj.com/5886921/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11798, 12, 'xelloss86', '保定', 'https://shop.zbj.com/6631931/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11799, 12, 'down010', '保定', 'https://shop.zbj.com/6473308/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11800, 12, '追梦-000', '保定', 'https://shop.zbj.com/5516313/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11801, 12, 'LinkNet企业信息化建设', '保定', 'https://shop.zbj.com/5489380/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11802, 12, '墨点工作室', '保定', 'https://shop.zbj.com/4744551/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11803, 12, '兔子虎', '保定', 'https://shop.zbj.com/4949663/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11804, 12, '海月网络工作室', '保定', 'https://shop.zbj.com/4791332/', '个人', 0, '4.92');
INSERT INTO `zbj` VALUES (11805, 12, 'whoisdr', '保定', 'https://shop.zbj.com/4780947/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11806, 12, '努力的小盼盼', '保定', 'https://shop.zbj.com/4313257/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11807, 12, '豆包炒豆芽', '保定', 'https://shop.zbj.com/1377502/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11808, 12, '暮雨晨风', '保定', 'https://shop.zbj.com/352513/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11809, 12, 'PHP世界上__语言', '保定', 'https://shop.zbj.com/15677784/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11810, 12, '心中火', '保定', 'https://shop.zbj.com/15708001/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11811, 12, '小八杂货铺', '保定', 'https://shop.zbj.com/17666972/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11812, 12, '大白科技', '保定', 'https://shop.zbj.com/18111398/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11813, 12, '云梯科技', '保定', 'https://shop.zbj.com/15046714/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11814, 12, '保定市翃飏计算机信息技术服务有限公司', '保定', 'https://shop.zbj.com/18005780/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11815, 12, '子非鱼sama', '保定', 'https://shop.zbj.com/15034077/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11816, 12, '默mo小店', '保定', 'https://shop.zbj.com/14601817/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11817, 12, '单人丶影', '保定', 'https://shop.zbj.com/14233369/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11818, 12, '飞翔软文工作室', '保定', 'https://shop.zbj.com/12637206/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11819, 12, '研究生创业联盟', '保定', 'https://shop.zbj.com/11745410/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11820, 12, 'qubor', '保定', 'https://shop.zbj.com/11753814/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11821, 12, '杰创Saidea', '保定', 'https://shop.zbj.com/12273802/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11822, 12, '绿芙', '保定', 'https://shop.zbj.com/12114734/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11823, 12, '中国微积分', '保定', 'https://shop.zbj.com/11925041/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11824, 12, 'missbbs', '保定', 'https://shop.zbj.com/11920803/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11825, 12, '杨义彪', '保定', 'https://shop.zbj.com/11942129/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11826, 12, '服务百分百满意', '保定', 'https://shop.zbj.com/14279670/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11827, 12, '做最好的自己@', '保定', 'https://shop.zbj.com/11569160/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11828, 12, 'RaeMu', '保定', 'https://shop.zbj.com/11587288/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11829, 12, '龙生2010', '保定', 'https://shop.zbj.com/11708477/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11830, 12, '红创网络', '保定', 'https://shop.zbj.com/11705655/', '个人', 0, '4.54');
INSERT INTO `zbj` VALUES (11831, 12, '魔方-工作室', '保定', 'https://shop.zbj.com/11168912/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11832, 12, '落雪封疆', '保定', 'https://shop.zbj.com/11145019/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11833, 12, '陨石软件工作室', '保定', 'https://shop.zbj.com/11275028/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11834, 12, '三滴水network888', '保定', 'https://shop.zbj.com/10821986/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11835, 12, '多彩阳光设计坊', '保定', 'https://shop.zbj.com/6028203/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11836, 12, 'bitQ', '保定', 'https://shop.zbj.com/6135884/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11837, 12, '青峰营销推广', '保定', 'https://shop.zbj.com/5287102/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (11838, 12, '小科比科比', '保定', 'https://shop.zbj.com/6548973/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11839, 12, '瑞杰营销', '保定', 'https://shop.zbj.com/4100300/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11840, 12, 'axdyf', '保定', 'https://shop.zbj.com/4864701/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11841, 12, '织梦二次开发', '保定', 'https://shop.zbj.com/3329739/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11842, 12, 'qijinwen', '保定', 'https://shop.zbj.com/3983793/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11843, 12, '龙儿87', '保定', 'https://shop.zbj.com/3898529/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11844, 12, '韵龙工作室', '保定', 'https://shop.zbj.com/10261247/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11845, 12, '星儿丫头', '保定', 'https://shop.zbj.com/9720225/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11846, 12, '小猪儿不会飞', '保定', 'https://shop.zbj.com/9818448/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11847, 12, '古城科技', '保定', 'https://shop.zbj.com/9378000/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11848, 12, '渺渺网路', '保定', 'https://shop.zbj.com/9480075/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11849, 12, 'yuyebing', '保定', 'https://shop.zbj.com/1650035/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11850, 12, '智诚网络服务', '保定', 'https://shop.zbj.com/940007/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11851, 12, 'loveyoully', '保定', 'https://shop.zbj.com/1046756/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11852, 12, '旮旯的蛋蛋', '保定', 'https://shop.zbj.com/10481625/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11853, 12, 'MJ云途', '保定', 'https://shop.zbj.com/10131845/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11854, 12, '汇官网', '保定', 'https://shop.zbj.com/18474660/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (11855, 12, '坏波波', '保定', 'https://shop.zbj.com/17681993/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11856, 12, 'web前端开发家', '保定', 'https://shop.zbj.com/17738976/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11857, 12, '第二杯半价吗', '保定', 'https://shop.zbj.com/14647744/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11858, 12, 'putishu112', '保定', 'https://shop.zbj.com/14720813/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11859, 12, '懒人519', '保定', 'https://shop.zbj.com/14684694/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11860, 12, '更优质的服务', '保定', 'https://shop.zbj.com/12013290/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11861, 12, 'siying580', '保定', 'https://shop.zbj.com/12950918/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11862, 12, '易托360', '保定', 'https://shop.zbj.com/10814625/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11863, 12, 'ctsd', '保定', 'https://shop.zbj.com/9638519/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (11864, 12, '正大服务', '保定', 'https://shop.zbj.com/9415042/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11865, 12, '文非水镜', '保定', 'https://shop.zbj.com/6293798/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11866, 12, '邻家小明', '保定', 'https://shop.zbj.com/15393167/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11867, 12, '吴霸哥', '保定', 'https://shop.zbj.com/17408062/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11868, 12, '四海天下科技', '保定', 'https://shop.zbj.com/14317460/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11869, 12, '穿青人', '保定', 'https://shop.zbj.com/14391891/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11870, 12, '聆听花雨', '保定', 'https://shop.zbj.com/5810155/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (11871, 12, '悠悠公主2013', '保定', 'https://shop.zbj.com/9431593/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12151, 13, '河北领行网络科技有限公司', '保定', 'https://shop.zbj.com/13563290/?fr=yd', '企业', 10000, '5.00');
INSERT INTO `zbj` VALUES (12152, 13, '宜高云科技', '保定', 'https://shop.zbj.com/19149212/', '个人', 1000, '5.00');
INSERT INTO `zbj` VALUES (12153, 13, '河北雄安桃李科技有限公司', '保定', 'https://shop.zbj.com/21465026/', '企业', 4500, '0.00');
INSERT INTO `zbj` VALUES (12154, 13, '科技猫工作室', '保定', 'https://shop.zbj.com/14621562/', '个人', 9000, '4.99');
INSERT INTO `zbj` VALUES (12155, 13, 'VB软件开发定制EXCEL管理软件SSC', '保定', 'https://shop.zbj.com/2699026/', '个人', 5000, '4.95');
INSERT INTO `zbj` VALUES (12156, 13, '一零零一科技', '武汉', 'https://shop.zbj.com/15385787/?fr=djwy', '企业', 5000, '5.00');
INSERT INTO `zbj` VALUES (12157, 13, 'gch_ling', '保定', 'https://shop.zbj.com/4766974/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (12158, 13, '颖慧软件开发有限公司', '保定', 'https://shop.zbj.com/13146151/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (12159, 13, '厚普机电', '保定', 'https://shop.zbj.com/18767189/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (12160, 13, '以梦为马。。', '保定', 'https://shop.zbj.com/10815179/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12161, 13, '聚红网络旗舰店', '保定', 'https://shop.zbj.com/17631482/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (12162, 13, '山东桥通天下网络科技', '潍坊', 'https://shop.zbj.com/19193938/?fr=djwy', '企业', 12000, '5.00');
INSERT INTO `zbj` VALUES (12163, 13, '专业的网络科技公司', '保定', 'https://shop.zbj.com/10871074/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12164, 13, '金博软件刘颖', '保定', 'https://shop.zbj.com/10939037/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12165, 13, '博睿智软件', '保定', 'https://shop.zbj.com/9639287/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12166, 13, '来采网络', '保定', 'https://shop.zbj.com/2340166/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (12167, 13, '加贝软件', '保定', 'https://shop.zbj.com/89251/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (12168, 13, '志进信息科技', '上海', 'https://shop.zbj.com/14395711/?fr=djwy', '企业', 10000, '5.00');
INSERT INTO `zbj` VALUES (12169, 13, '金博软件888', '保定', 'https://shop.zbj.com/15871617/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12170, 13, '麦可科技', '保定', 'https://shop.zbj.com/18156625/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12171, 13, '晨讯科技网络有限公司', '保定', 'https://shop.zbj.com/20961271/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (12172, 13, '网尚网络有限公司', '保定', 'https://shop.zbj.com/3043786/', '企业', 0, '4.95');
INSERT INTO `zbj` VALUES (12173, 13, '蝴蝶飞飞', '保定', 'https://shop.zbj.com/26270/', '个人', 0, '4.82');
INSERT INTO `zbj` VALUES (12174, 13, '宝宏科技', '合肥', 'https://shop.zbj.com/4985869/?fr=djwy', '企业', 5000, '5.00');
INSERT INTO `zbj` VALUES (12175, 13, '微交易平台', '保定', 'https://shop.zbj.com/16634529/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (12176, 13, '米饭直播', '保定', 'https://shop.zbj.com/12428455/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (12177, 13, '易触即联', '保定', 'https://shop.zbj.com/13265611/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (12178, 13, '有梦想的小狐狸', '保定', 'https://shop.zbj.com/21540070/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (12179, 13, '大裂谷', '保定', 'https://shop.zbj.com/21736976/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (12180, 13, '广东嘉讯云计算科技有限公司', '东莞', 'https://shop.zbj.com/21127314/?fr=djwy', '企业', 5000, '0.00');
INSERT INTO `zbj` VALUES (12181, 13, '更优质的服务', '保定', 'https://shop.zbj.com/12013290/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12182, 13, 'zozoyoyo', '保定', 'https://shop.zbj.com/12654579/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12183, 13, 'AU3脚本 平面设计', '保定', 'https://shop.zbj.com/12466193/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12184, 13, '同心网盟', '保定', 'https://shop.zbj.com/10991667/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12185, 13, 'DemoHunter2014', '保定', 'https://shop.zbj.com/10227609/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12186, 13, '美联互动', '上海', 'https://shop.zbj.com/20717907/?fr=djwy', '企业', 7000, '5.00');
INSERT INTO `zbj` VALUES (12187, 13, '麻雀400', '保定', 'https://shop.zbj.com/11812767/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12188, 13, 'zh星魂', '保定', 'https://shop.zbj.com/10436608/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12189, 13, '起源高端设计', '保定', 'https://shop.zbj.com/7376466/', '个人', 0, '4.87');
INSERT INTO `zbj` VALUES (12190, 13, 'LinkNet企业信息化建设', '保定', 'https://shop.zbj.com/5489380/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12191, 13, '海月网络工作室', '保定', 'https://shop.zbj.com/4791332/', '个人', 0, '4.92');
INSERT INTO `zbj` VALUES (12192, 13, 'hejianheng88', '保定', 'https://shop.zbj.com/3360143/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12193, 13, '7cu', '保定', 'https://shop.zbj.com/15221653/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (12194, 13, '金博企业管理软件', '保定', 'https://shop.zbj.com/18657088/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12195, 13, '子非鱼sama', '保定', 'https://shop.zbj.com/15034077/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12196, 13, 'oceanwave1976', '保定', 'https://shop.zbj.com/14803968/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12197, 13, '舞步的完美', '保定', 'https://shop.zbj.com/14363226/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12198, 13, 'yejinmo', '保定', 'https://shop.zbj.com/12929521/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12199, 13, '13463231652', '保定', 'https://shop.zbj.com/12088515/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12200, 13, 'PBDesigner', '保定', 'https://shop.zbj.com/12328352/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12201, 13, '红创网络', '保定', 'https://shop.zbj.com/11705655/', '个人', 0, '4.54');
INSERT INTO `zbj` VALUES (12202, 13, '源满软件工作室', '保定', 'https://shop.zbj.com/11138742/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12203, 13, '尧帝', '保定', 'https://shop.zbj.com/6798307/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12204, 13, 'zhu1ba0jie', '保定', 'https://shop.zbj.com/6728180/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12205, 13, '杨广慧', '保定', 'https://shop.zbj.com/5994826/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (12206, 13, 'zkimpulse', '保定', 'https://shop.zbj.com/10039682/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12207, 13, 'mj_beijing', '保定', 'https://shop.zbj.com/5860016/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12208, 13, '瑞杰营销', '保定', 'https://shop.zbj.com/4100300/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12209, 13, 'axdyf', '保定', 'https://shop.zbj.com/4864701/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12210, 13, '织梦二次开发', '保定', 'https://shop.zbj.com/3329739/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12211, 13, '晶税数据', '保定', 'https://shop.zbj.com/9769570/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12212, 13, 'free小软', '保定', 'https://shop.zbj.com/8942007/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12213, 13, '龙辰软件', '保定', 'https://shop.zbj.com/7961573/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12214, 13, 'yuyebing', '保定', 'https://shop.zbj.com/1650035/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12215, 13, '后崖工作室', '保定', 'https://shop.zbj.com/10295634/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12216, 13, '赛扬电子', '保定', 'https://shop.zbj.com/18439480/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12217, 13, '华语科技', '保定', 'https://shop.zbj.com/13880621/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12218, 13, '十点x十分', '保定', 'https://shop.zbj.com/12967278/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12219, 13, 'ctsd', '保定', 'https://shop.zbj.com/9638519/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12220, 13, '辉煌尛希', '保定', 'https://shop.zbj.com/8735479/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12221, 13, '达科电子', '保定', 'https://shop.zbj.com/8656056/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12222, 13, 'pinbozhong', '保定', 'https://shop.zbj.com/5901208/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12223, 13, '智达电子开发', '保定', 'https://shop.zbj.com/14893220/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12224, 13, '凌卓设计', '保定', 'https://shop.zbj.com/12813197/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12225, 13, '晓风网络科技', '保定', 'https://shop.zbj.com/13430106/', '个人', 1000, '5.00');
INSERT INTO `zbj` VALUES (12226, 13, '战狼股票期货指标工作室', '保定', 'https://shop.zbj.com/13444095/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12227, 13, '名字长了好注册', '保定', 'https://shop.zbj.com/10896360/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12228, 13, '冷酷死神', '保定', 'https://shop.zbj.com/9221143/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12229, 13, 'csbn211', '保定', 'https://shop.zbj.com/6418757/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12230, 13, '旭日照四方1982', '保定', 'https://shop.zbj.com/6545327/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12231, 13, '成石个人工作室', '保定', 'https://shop.zbj.com/6450171/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12232, 13, 'guoshengjunv7', '保定', 'https://shop.zbj.com/5249340/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12233, 13, 'hanohdy', '保定', 'https://shop.zbj.com/4721287/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12234, 13, '王河顺', '保定', 'https://shop.zbj.com/4267654/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12235, 13, '智胜网际软件工作室', '保定', 'https://shop.zbj.com/4174449/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (12236, 13, '向着自由奔去', '保定', 'https://shop.zbj.com/8603003/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12237, 13, '李珍1021', '保定', 'https://shop.zbj.com/8791428/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12238, 13, '兮洛0', '保定', 'https://shop.zbj.com/8807755/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12239, 13, '标标必达', '保定', 'https://shop.zbj.com/9471818/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12240, 13, '那片云226', '保定', 'https://shop.zbj.com/8235149/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12241, 13, '猪小宝工作室', '保定', 'https://shop.zbj.com/7132643/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12242, 13, '悠哉网虫工作室', '保定', 'https://shop.zbj.com/7851686/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (12243, 13, '危楼望月', '保定', 'https://shop.zbj.com/10465603/', '个人', 0, '0.00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
