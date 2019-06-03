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

 Date: 03/06/2019 09:49:54
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48394 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vk
-- ----------------------------
BEGIN;
INSERT INTO `vk` VALUES (47942, 1, '软件开发', '河北省|保定', '多商户主题商城小程序，拼', '￥20000元/件', 40, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47943, 1, '软件开发', '河北省|唐山', '货运物流软件/同城快递', '￥45800元/一口价', 6, '100.0%', '追梦创软科技有限公司', 'http://shop.epwk.com/4152928/');
INSERT INTO `vk` VALUES (47944, 1, '软件开发', '河北省|保定', '微信视频小程序开发', '￥100元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47945, 1, '软件开发', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47946, 1, '软件开发', '河北省|保定', '同城多商户入驻活动', '￥6310元/次', 7, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47947, 1, '软件开发', '河北省|唐山', 'APP开发', '价格面议', 0, '100.0%', '富联工作室', 'http://shop.epwk.com/4150426/');
INSERT INTO `vk` VALUES (47948, 1, '软件开发', '河北省|唐山', '软件开发', '价格面议', 0, '100.0%', '富联工作室', 'http://shop.epwk.com/4150426/');
INSERT INTO `vk` VALUES (47949, 1, '软件开发', '河北省|保定', '微信扫码挪车公众号开发', '￥6000元/件', 6, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47950, 1, '软件开发', '河北省|秦皇', '程序开发', '价格面议', 0, '100.0%', '建宁科技工作室', 'http://shop.epwk.com/4143126/');
INSERT INTO `vk` VALUES (47951, 1, '软件开发', '河北省|保定', '餐饮外卖分销', '￥6600元/件', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47952, 1, '软件开发', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47953, 1, '软件开发', '河北省|沧州', '2016—2017新款原油、黄', '￥26800元/件', 0, '100.0%', '程序世界', 'http://shop.epwk.com/4161131/');
INSERT INTO `vk` VALUES (47954, 1, '软件开发', '河北省|沧州', '外汇期货智能交易程序编', '￥38000元/件', 0, '100.0%', '程序世界', 'http://shop.epwk.com/4161131/');
INSERT INTO `vk` VALUES (47955, 1, '软件开发', '河北省|廊坊', 'iOS APP开发', '￥9000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/');
INSERT INTO `vk` VALUES (47956, 1, '软件开发', '河北省|廊坊', 'Android APP', '￥9000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/');
INSERT INTO `vk` VALUES (47957, 1, '软件开发', '河北省|廊坊', '微信公众号', '￥8000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/');
INSERT INTO `vk` VALUES (47958, 1, '软件开发', '河北省|保定', '多商户主题商城小程序，拼', '￥20000元/件', 40, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47959, 1, '软件开发', '河北省|唐山', '货运物流软件/同城快递', '￥45800元/一口价', 6, '100.0%', '追梦创软科技有限公司', 'http://shop.epwk.com/4152928/');
INSERT INTO `vk` VALUES (47960, 1, '软件开发', '河北省|保定', '微信视频小程序开发', '￥100元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47961, 1, '软件开发', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47962, 1, '软件开发', '河北省|保定', '同城多商户入驻活动', '￥6310元/次', 7, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47963, 1, '软件开发', '河北省|唐山', 'APP开发', '价格面议', 0, '100.0%', '富联工作室', 'http://shop.epwk.com/4150426/');
INSERT INTO `vk` VALUES (47964, 1, '软件开发', '河北省|唐山', '软件开发', '价格面议', 0, '100.0%', '富联工作室', 'http://shop.epwk.com/4150426/');
INSERT INTO `vk` VALUES (47965, 1, '软件开发', '河北省|保定', '微信扫码挪车公众号开发', '￥6000元/件', 6, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47966, 1, '软件开发', '河北省|秦皇', '程序开发', '价格面议', 0, '100.0%', '建宁科技工作室', 'http://shop.epwk.com/4143126/');
INSERT INTO `vk` VALUES (47967, 1, '软件开发', '河北省|保定', '餐饮外卖分销', '￥6600元/件', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47968, 1, '软件开发', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47969, 1, '软件开发', '河北省|沧州', '2016—2017新款原油、黄', '￥26800元/件', 0, '100.0%', '程序世界', 'http://shop.epwk.com/4161131/');
INSERT INTO `vk` VALUES (47970, 1, '软件开发', '河北省|沧州', '外汇期货智能交易程序编', '￥38000元/件', 0, '100.0%', '程序世界', 'http://shop.epwk.com/4161131/');
INSERT INTO `vk` VALUES (47971, 1, '软件开发', '河北省|廊坊', 'iOS APP开发', '￥9000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/');
INSERT INTO `vk` VALUES (47972, 1, '软件开发', '河北省|廊坊', 'Android APP', '￥9000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/');
INSERT INTO `vk` VALUES (47973, 1, '软件开发', '河北省|廊坊', '微信公众号', '￥8000元/起', 0, '100.0%', '嘉跃网络', 'http://shop.epwk.com/4175974/');
INSERT INTO `vk` VALUES (47974, 1, '软件开发', '河北省|保定', '建材多商户分销小程序', '￥6900元/年', 1, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47975, 1, '软件开发', '河北省|保定', '建材商城开发小程序开发', '￥12000元/次', 1, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47976, 1, '软件开发', '河北省|保定', '一套39800，包上线，超市商', '￥39800元/次', 0, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (47977, 1, '软件开发', '河北省|唐山', 'IOS与Android在线服务类', '￥28000元/其他', 0, '100.0%', '大治中承·君如意科技', 'http://shop.epwk.com/4139525/');
INSERT INTO `vk` VALUES (47978, 1, '软件开发', '河北省|唐山', '微信开发', '价格面议', 0, '100.0%', '大治中承·君如意科技', 'http://shop.epwk.com/4139525/');
INSERT INTO `vk` VALUES (47979, 1, '软件开发', '河北省|石家', 'APP定制开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47980, 1, '软件开发', '河北省|石家', '微信公众平台开发', '￥2000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47981, 1, '软件开发', '河北省|石家', '小程序定制开发', '￥2000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47982, 1, '软件开发', '河北省|石家', '教育类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47983, 1, '软件开发', '河北省|石家', '美容类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47984, 1, '软件开发', '河北省|石家', '物业类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47985, 1, '软件开发', '河北省|石家', '购物类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47986, 1, '软件开发', '河北省|石家', '直播类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47987, 1, '软件开发', '河北省|石家', '社交类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47988, 1, '软件开发', '河北省|石家', 'O2O电商平台APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47989, 1, '软件开发', '河北省|石家', '外卖类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47990, 1, '软件开发', '河北省|石家', '夺宝类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47991, 1, '软件开发', '河北省|石家', '智能家居类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47992, 1, '软件开发', '河北省|石家', '物联网类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47993, 1, '软件开发', '河北省|石家', '生活类APP开发', '￥20000元/起', 0, '100.0%', '河北领行网络科技有限公司', 'http://shop.epwk.com/4185461/');
INSERT INTO `vk` VALUES (47994, 1, '软件开发', '河北省|石家', 'APP定制开发', '￥10000元/起', 1, '100.0%', '康业科技', 'http://shop.epwk.com/4195067/');
INSERT INTO `vk` VALUES (47995, 1, '软件开发', '河北省|唐山', 'IOS-APP高端定制、APP开', '￥20000元/起', 0, '100.0%', '唐山徕思歌科技有限公司', 'http://shop.epwk.com/4162937/');
INSERT INTO `vk` VALUES (47996, 1, '软件开发', '河北省|唐山', '企业系统开发', '￥10000元/起', 0, '100.0%', '唐山徕思歌科技有限公司', 'http://shop.epwk.com/4162937/');
INSERT INTO `vk` VALUES (47997, 1, '软件开发', '河北省|唐山', '微信小程序', '￥2000元/起', 0, '100.0%', '唐山徕思歌科技有限公司', 'http://shop.epwk.com/4162937/');
INSERT INTO `vk` VALUES (47998, 1, '软件开发', '河北省|唐山', 'Android-APP高端定制、A', '￥20000元/起', 0, '100.0%', '唐山徕思歌科技有限公司', 'http://shop.epwk.com/4162937/');
INSERT INTO `vk` VALUES (47999, 1, '软件开发', '河北省|石家', 'APP开发', '￥20000元/起', 0, '100.0%', '河北万中科技有限公司', 'http://shop.epwk.com/4180838/');
INSERT INTO `vk` VALUES (48000, 1, '软件开发', '河北省|石家', '小程序', '￥1000元/起', 0, '100.0%', '河北万中科技有限公司', 'http://shop.epwk.com/4180838/');
INSERT INTO `vk` VALUES (48001, 1, '软件开发', '河北省|石家', '商城APP开发', '￥20000元/起', 0, '100.0%', '康业科技', 'http://shop.epwk.com/4195067/');
INSERT INTO `vk` VALUES (48002, 1, '软件开发', '河北省|石家', '家政服务APP开发', '￥30000元/起', 0, '100.0%', '康业科技', 'http://shop.epwk.com/4195067/');
INSERT INTO `vk` VALUES (48003, 1, '软件开发', '河北省|石家', '社交聊天APP开发', '￥30000元/起', 0, '100.0%', '康业科技', 'http://shop.epwk.com/4195067/');
INSERT INTO `vk` VALUES (48004, 1, '软件开发', '河北省|石家', '微信定制开发', '￥5000元/起', 0, '100.0%', '康业科技', 'http://shop.epwk.com/4195067/');
INSERT INTO `vk` VALUES (48005, 1, '软件开发', '河北省|石家', '约车/代驾APP开发', '￥20000元/起', 0, '100.0%', '康业科技', 'http://shop.epwk.com/4195067/');
INSERT INTO `vk` VALUES (48006, 1, '软件开发', '河北省|石家', '分销/直销系统开发', '￥8000元/起', 0, '100.0%', '康业科技', 'http://shop.epwk.com/4195067/');
INSERT INTO `vk` VALUES (48007, 1, '软件开发', '河北省|沧州', '微信开发 三级分销 餐饮', '￥1000元/起', 4, '100.0%', '沧州微艾薇信息技术有限公司', 'http://shop.epwk.com/4150282/');
INSERT INTO `vk` VALUES (48008, 1, '软件开发', '河北省|石家', '软件美工服务', '价格面议', 0, '100.0%', '启帆网络', 'http://shop.epwk.com/4132168/');
INSERT INTO `vk` VALUES (48009, 1, '软件开发', '河北省|石家', '微信分销拼团系统、三级', '￥8600元/起', 0, '100.0%', '河北宝网璎珞教育科技有限公司', 'http://shop.epwk.com/4162448/');
INSERT INTO `vk` VALUES (48010, 1, '软件开发', '河北省|石家', '微信公众号外卖人订餐系', '￥8800元/起', 0, '100.0%', '河北宝网璎珞教育科技有限公司', 'http://shop.epwk.com/4162448/');
INSERT INTO `vk` VALUES (48011, 1, '软件开发', '河北省|石家', '小程序开发', '￥1500元/套', 3, '100.0%', '数谷网络科技', 'http://shop.epwk.com/4172271/');
INSERT INTO `vk` VALUES (48012, 1, '软件开发', '河北省|廊坊', '微信平台开发', '价格面议', 1, '100.0%', '北京方达众信网络科技有限公司', 'http://shop.epwk.com/4170174/');
INSERT INTO `vk` VALUES (48013, 1, '软件开发', '河北省|廊坊', '安卓开发', '价格面议', 1, '100.0%', '北京方达众信网络科技有限公司', 'http://shop.epwk.com/4170174/');
INSERT INTO `vk` VALUES (48014, 1, '软件开发', '河北省|廊坊', 'iOS移动应用', '价格面议', 0, '100.0%', '北京方达众信网络科技有限公司', 'http://shop.epwk.com/4170174/');
INSERT INTO `vk` VALUES (48015, 1, '软件开发', '河北省|石家', '办公软件开发', '价格面议', 0, '100.0%', '乐朋网络', 'http://shop.epwk.com/4145546/');
INSERT INTO `vk` VALUES (48016, 1, '软件开发', '河北省|石家', '网站开发', '￥3000元/一口价', 3, '100.0%', '河北野马网络科技有限公司', 'http://shop.epwk.com/4178707/');
INSERT INTO `vk` VALUES (48017, 1, '软件开发', '河北省|石家', '微信平台二次开发', '￥2000元/件', 0, '100.0%', '睿扬文化传播公司', 'http://shop.epwk.com/4135809/');
INSERT INTO `vk` VALUES (48018, 1, '软件开发', '河北省|沧州', '【微信外卖】 微外卖 微', '￥5000元/年', 0, '100.0%', '沧州微艾薇信息技术有限公司', 'http://shop.epwk.com/4150282/');
INSERT INTO `vk` VALUES (48019, 1, '软件开发', '河北省|沧州', '【生活O2O】城市O2O团购', '￥5500元/年', 0, '100.0%', '沧州微艾薇信息技术有限公司', 'http://shop.epwk.com/4150282/');
INSERT INTO `vk` VALUES (48020, 1, '软件开发', '河北省|沧州', '【微信商城】三级分销商', '￥3800元/起', 0, '100.0%', '沧州微艾薇信息技术有限公司', 'http://shop.epwk.com/4150282/');
INSERT INTO `vk` VALUES (48021, 1, '软件开发', '河北省|沧州', '【微信教育】学校在线教', '￥6000元/年', 0, '100.0%', '沧州微艾薇信息技术有限公司', 'http://shop.epwk.com/4150282/');
INSERT INTO `vk` VALUES (48022, 1, '软件开发', '河北省|石家', '手机APP开发', '价格面议', 0, '100.0%', '构众网络技术服务有限公司', 'http://shop.epwk.com/4153501/');
INSERT INTO `vk` VALUES (48023, 1, '软件开发', '河北省|石家', '微信平台二次开发', '价格面议', 0, '100.0%', '构众网络技术服务有限公司', 'http://shop.epwk.com/4153501/');
INSERT INTO `vk` VALUES (48024, 1, '软件开发', '河北省|石家', '数据库设计', '价格面议', 0, '100.0%', '构众网络技术服务有限公司', 'http://shop.epwk.com/4153501/');
INSERT INTO `vk` VALUES (48025, 1, '软件开发', '河北省|保定', 'B2B机票分销系统', '￥20000元/年', 0, '100.0%', '推广之星', 'http://shop.epwk.com/4130015/');
INSERT INTO `vk` VALUES (48026, 1, '软件开发', '河北省|保定', 'B2C酒店系统', '价格面议', 0, '100.0%', '推广之星', 'http://shop.epwk.com/4130015/');
INSERT INTO `vk` VALUES (48027, 1, '软件开发', '河北省|唐山', '微信公共平台开发', '￥2000元/次', 0, '94.1%', '唐山佳协网络广告', 'http://shop.epwk.com/4122074/');
INSERT INTO `vk` VALUES (48028, 1, '软件开发', '河北省|承德', '微信小程序', '￥6000元/起', 0, '75.0%', '承德启程网络科技有限公司', 'http://shop.epwk.com/4178849/');
INSERT INTO `vk` VALUES (48029, 1, '软件开发', '河北省|承德', '微信公众号开发', '￥5000元/起', 0, '75.0%', '承德启程网络科技有限公司', 'http://shop.epwk.com/4178849/');
INSERT INTO `vk` VALUES (48030, 1, '软件开发', '河北省|承德', 'IOS原生定制开发', '￥70000元/起', 0, '75.0%', '承德启程网络科技有限公司', 'http://shop.epwk.com/4178849/');
INSERT INTO `vk` VALUES (48031, 1, '软件开发', '河北省|承德', 'Android原生定制开发', '￥60000元/起', 0, '75.0%', '承德启程网络科技有限公司', 'http://shop.epwk.com/4178849/');
INSERT INTO `vk` VALUES (48032, 1, '软件开发', '河北省|承德', 'WEB网站/系统定制开发', '￥3000元/起', 0, '75.0%', '承德启程网络科技有限公司', 'http://shop.epwk.com/4178849/');
INSERT INTO `vk` VALUES (48033, 1, '软件开发', '河北省|石家', '安卓应用开发', '￥50元/件', 1, '%', '三石软件工作室', 'http://shop.epwk.com/4122910/');
INSERT INTO `vk` VALUES (48034, 1, '软件开发', '河北省|石家', 'Android安卓反编译、汉', '￥50元/件', 1, '%', '三石软件工作室', 'http://shop.epwk.com/4122910/');
INSERT INTO `vk` VALUES (48035, 1, '软件开发', '河北省|廊坊', '软件开发', '￥100元/次', 1, '%', '合顺团队工作室', 'http://shop.epwk.com/4146073/');
INSERT INTO `vk` VALUES (48036, 1, '软件开发', '河北省|邯郸', '个人支付+个人支付源码+', '￥5000元/一口价', 1, '%', '个人支付源码', 'http://shop.epwk.com/4188000/');
INSERT INTO `vk` VALUES (48037, 1, '软件开发', '河北省|石家', '微信公众号/小程序开发', '￥3000元/起', 0, '%', '河北神光勇安网络科技有限公司', 'http://shop.epwk.com/4195184/');
INSERT INTO `vk` VALUES (48038, 1, '软件开发', '河北省|石家', 'APP开发', '￥50000元/起', 0, '%', '河北神光勇安网络科技有限公司', 'http://shop.epwk.com/4195184/');
INSERT INTO `vk` VALUES (48039, 1, '软件开发', '河北省|邯郸', '微信开发小程序公众号', '￥3999元/起', 0, '%', '博跃软件科技', 'http://shop.epwk.com/4196005/');
INSERT INTO `vk` VALUES (48040, 1, '软件开发', '河北省|邯郸', 'app订制开发', '￥10000元/起', 0, '%', '博跃软件科技', 'http://shop.epwk.com/4196005/');
INSERT INTO `vk` VALUES (48041, 1, '软件开发', '河北省|石家', '移动APP-IOS/Android', '价格面议', 0, '%', '三秒软件开发', 'http://shop.epwk.com/4180874/');
INSERT INTO `vk` VALUES (48042, 1, '软件开发', '河北省|石家', '棋牌游戏', '￥20000元/款', 0, '%', '创灵网络科技', 'http://shop.epwk.com/4188485/');
INSERT INTO `vk` VALUES (48043, 1, '软件开发', '河北省|石家', '商城分销APP', '￥20000元/款', 0, '%', '创灵网络科技', 'http://shop.epwk.com/4188485/');
INSERT INTO `vk` VALUES (48044, 1, '软件开发', '河北省|石家', '微信平台定制开发', '价格面议', 0, '%', '三秒软件开发', 'http://shop.epwk.com/4180874/');
INSERT INTO `vk` VALUES (48045, 1, '软件开发', '河北省|石家', '办公软件定制开发', '价格面议', 0, '%', '三秒软件开发', 'http://shop.epwk.com/4180874/');
INSERT INTO `vk` VALUES (48046, 1, '软件开发', '河北省|石家', '管理软件定制开发', '价格面议', 0, '%', '三秒软件开发', 'http://shop.epwk.com/4180874/');
INSERT INTO `vk` VALUES (48047, 1, '软件开发', '河北省|石家', 'APP定制开发', '价格面议', 0, '%', '三秒软件开发', 'http://shop.epwk.com/4180874/');
INSERT INTO `vk` VALUES (48048, 1, '软件开发', '河北省|石家', 'APP开发', '价格面议', 0, '%', '豆豆网络', 'http://shop.epwk.com/4130422/');
INSERT INTO `vk` VALUES (48049, 1, '软件开发', '河北省|石家', 'ios应用开发', '价格面议', 0, '%', '河北红珊瑚科技有限公司', 'http://shop.epwk.com/4133401/');
INSERT INTO `vk` VALUES (48050, 1, '软件开发', '河北省|石家', 'Android移动端智能应用', '￥30000元/件', 0, '%', '河北红珊瑚科技有限公司', 'http://shop.epwk.com/4133401/');
INSERT INTO `vk` VALUES (48051, 1, '软件开发', '河北省|石家', 'OA软件系统开发', '价格面议', 0, '%', '豆豆网络', 'http://shop.epwk.com/4130422/');
INSERT INTO `vk` VALUES (48052, 1, '软件开发', '河北省|石家', '网站程序设计开发', '价格面议', 0, '%', '豆豆网络', 'http://shop.epwk.com/4130422/');
INSERT INTO `vk` VALUES (48053, 1, '软件开发', '河北省|石家', 'C/S模式数据管理类程序', '价格面议', 0, '%', '梦想奇迹工作室', 'http://shop.epwk.com/4149154/');
INSERT INTO `vk` VALUES (48054, 1, '软件开发', '河北省|石家', 'APP', '价格面议', 0, '%', '石家庄市朝翔科技有限公司', 'http://shop.epwk.com/4136803/');
INSERT INTO `vk` VALUES (48055, 1, '软件开发', '河北省|石家', '单片机程序设计', '价格面议', 0, '%', '流浪者电子工作室', 'http://shop.epwk.com/4154011/');
INSERT INTO `vk` VALUES (48056, 1, '软件开发', '河北省|石家', 'C/S模式数据管理类程序', '价格面议', 0, '%', '梦想奇迹工作室', 'http://shop.epwk.com/4149154/');
INSERT INTO `vk` VALUES (48057, 1, '软件开发', '河北省|石家', 'wfcomctl.ocx', '价格面议', 0, '%', '梦想奇迹工作室', 'http://shop.epwk.com/4149154/');
INSERT INTO `vk` VALUES (48058, 1, '软件开发', '河北省|石家', '行业软件定制开发', '价格面议', 0, '%', '光步科技', 'http://shop.epwk.com/4141846/');
INSERT INTO `vk` VALUES (48059, 1, '软件开发', '河北省|石家', 'APP开发', '价格面议', 0, '%', '光步科技', 'http://shop.epwk.com/4141846/');
INSERT INTO `vk` VALUES (48060, 1, '软件开发', '河北省|石家', '移动端应用软件开发', '价格面议', 0, '%', '河北万腾科技有限公司', 'http://shop.epwk.com/4161853/');
INSERT INTO `vk` VALUES (48061, 1, '软件开发', '河北省|石家', '微信公众号开发', '价格面议', 0, '%', '河北万腾科技有限公司', 'http://shop.epwk.com/4161853/');
INSERT INTO `vk` VALUES (48062, 1, '软件开发', '河北省|石家', '手机游戏开发', '价格面议', 0, '%', '掌悦科技', 'http://shop.epwk.com/4160707/');
INSERT INTO `vk` VALUES (48063, 1, '软件开发', '河北省|石家', '应用软件开发', '价格面议', 0, '%', '掌悦科技', 'http://shop.epwk.com/4160707/');
INSERT INTO `vk` VALUES (48064, 1, '软件开发', '河北省|石家', '手机APP开发', '价格面议', 0, '%', '掌悦科技', 'http://shop.epwk.com/4160707/');
INSERT INTO `vk` VALUES (48065, 1, '软件开发', '河北省|唐山', '微信公众号开发', '价格面议', 0, '%', '亚和冀鼎网络科技', 'http://shop.epwk.com/4167158/');
INSERT INTO `vk` VALUES (48066, 1, '软件开发', '河北省|邯郸', '微信企业号开发', '￥3000元/次', 0, '%', '雷鸥然科技', 'http://shop.epwk.com/4167161/');
INSERT INTO `vk` VALUES (48067, 1, '软件开发', '河北省|石家', '教育类APP', '价格面议', 0, '%', '微动力科技', 'http://shop.epwk.com/4162581/');
INSERT INTO `vk` VALUES (48068, 1, '软件开发', '河北省|石家', '商城类APP', '价格面议', 0, '%', '微动力科技', 'http://shop.epwk.com/4162581/');
INSERT INTO `vk` VALUES (48069, 1, '软件开发', '河北省|石家', '智能硬件类APP', '价格面议', 0, '%', '微动力科技', 'http://shop.epwk.com/4162581/');
INSERT INTO `vk` VALUES (48070, 1, '软件开发', '河北省|唐山', '微信公众号开发', '价格面议', 0, '%', '亚和冀鼎网络科技', 'http://shop.epwk.com/4167158/');
INSERT INTO `vk` VALUES (48071, 1, '软件开发', '河北省|石家', 'ASP、C#、asp.net、winf', '￥500元/件', 0, '%', 'qingyu201111的店铺', 'http://shop.epwk.com/4098429/');
INSERT INTO `vk` VALUES (48072, 1, '软件开发', '河北省|邯郸', '本地商城APP定制', '￥3000元/月', 0, '%', '天地风云', 'http://shop.epwk.com/4153233/');
INSERT INTO `vk` VALUES (48073, 1, '软件开发', '河北省|保定', '微官网', '价格面议', 0, '%', '问鼎微信服务中心', 'http://shop.epwk.com/4149040/');
INSERT INTO `vk` VALUES (48074, 1, '软件开发', '河北省|保定', '微商城', '价格面议', 0, '%', '问鼎微信服务中心', 'http://shop.epwk.com/4149040/');
INSERT INTO `vk` VALUES (48075, 1, '软件开发', '河北省|保定', '微信会员卡', '价格面议', 0, '%', '问鼎微信服务中心', 'http://shop.epwk.com/4149040/');
INSERT INTO `vk` VALUES (48076, 1, '软件开发', '河北省|保定', '微餐厅', '价格面议', 0, '%', '问鼎微信服务中心', 'http://shop.epwk.com/4149040/');
INSERT INTO `vk` VALUES (48077, 1, '软件开发', '河北省|保定', '微名片', '价格面议', 0, '%', '问鼎微信服务中心', 'http://shop.epwk.com/4149040/');
INSERT INTO `vk` VALUES (48078, 1, '软件开发', '河北省|保定', 'KTV', '￥2500元/年', 0, '%', '问鼎微信服务中心', 'http://shop.epwk.com/4149040/');
INSERT INTO `vk` VALUES (48079, 1, '软件开发', '河北省|石家', '移动应用APP开发_ios/an', '价格面议', 0, '%', 'APP移动应用开发、全领域网站专属定制 QQ812317984', 'http://shop.epwk.com/4137788/');
INSERT INTO `vk` VALUES (48080, 1, '软件开发', '河北省|石家', '移动应用APP开发_ios/an', '价格面议', 0, '%', 'APP移动应用开发、全领域网站专属定制 QQ812317984', 'http://shop.epwk.com/4137788/');
INSERT INTO `vk` VALUES (48081, 1, '软件开发', '河北省|保定', '机票B2B商旅平台', '价格面议', 0, '%', '三滴水网络科技有限公司-www.sandishui.net', 'http://shop.epwk.com/4158469/');
INSERT INTO `vk` VALUES (48082, 1, '软件开发', '河北省|保定', '中航信BIE接口对接', '￥3000元/件', 0, '%', '三滴水网络科技有限公司-www.sandishui.net', 'http://shop.epwk.com/4158469/');
INSERT INTO `vk` VALUES (48083, 1, '软件开发', '河北省|保定', '火车票接口对接', '￥2500元/次', 0, '%', '三滴水网络科技有限公司-www.sandishui.net', 'http://shop.epwk.com/4158469/');
INSERT INTO `vk` VALUES (48084, 1, '软件开发', '河北省|保定', '旅游分销PC+微信+手机版', '￥2000元/件', 0, '%', '三滴水网络科技有限公司-www.sandishui.net', 'http://shop.epwk.com/4158469/');
INSERT INTO `vk` VALUES (48085, 1, '软件开发', '河北省|唐山', 'unity3d VR开发', '￥2000元/其他', 0, '%', '双贝科技', 'http://shop.epwk.com/4153802/');
INSERT INTO `vk` VALUES (48102, 1, '软件开发', '河北省|石家', 'C/S软件开发', '价格面议', 0, '%', '科元恩特软件', 'http://shop.epwk.com/4156744/');
INSERT INTO `vk` VALUES (48103, 1, '软件开发', '河北省|石家', 'B/S软件开发', '价格面议', 0, '%', '科元恩特软件', 'http://shop.epwk.com/4156744/');
INSERT INTO `vk` VALUES (48104, 1, '软件开发', '河北省|石家', '手机APP软件卡发', '价格面议', 0, '%', '科元恩特软件', 'http://shop.epwk.com/4156744/');
INSERT INTO `vk` VALUES (48105, 1, '软件开发', '河北省|石家', '软件开发、企业管理系统', '价格面议', 0, '%', '华弈网络', 'http://shop.epwk.com/4164074/');
INSERT INTO `vk` VALUES (48106, 1, '软件开发', '河北省|石家', '直播平台开发--安卓ios', '价格面议', 0, '%', '石家庄顽石教育科技有限公司', 'http://shop.epwk.com/4162173/');
INSERT INTO `vk` VALUES (48107, 1, '软件开发', '河北省|秦皇', 'App开发', '价格面议', 0, '%', '聚享时空网络', 'http://shop.epwk.com/4167353/');
INSERT INTO `vk` VALUES (48108, 1, '软件开发', '河北省|唐山', '小程序定制开发', '价格面议', 0, '%', '优享科技', 'http://shop.epwk.com/4183437/');
INSERT INTO `vk` VALUES (48109, 1, '软件开发', '河北省|唐山', '公众号开发', '价格面议', 0, '%', '优享科技', 'http://shop.epwk.com/4183437/');
INSERT INTO `vk` VALUES (48110, 1, '软件开发', '河北省|石家', '人人商城-小程序前端+后', '￥100元/次', 0, '%', '小杨php定制', 'http://shop.epwk.com/4176463/');
INSERT INTO `vk` VALUES (48111, 1, '软件开发', '河北省|秦皇', '微信小程序开发', '￥5000元/起', 0, '%', '聚享时空网络', 'http://shop.epwk.com/4167353/');
INSERT INTO `vk` VALUES (48112, 1, '软件开发', '河北省|邯郸', '物联网应用开发/软件开', '价格面议', 0, '%', '三卓物联网科技', 'http://shop.epwk.com/4184282/');
INSERT INTO `vk` VALUES (48113, 1, '软件开发', '河北省|沧州', 'APP开发', '￥50000元/起', 0, '%', '河北宏腾科技', 'http://shop.epwk.com/4173301/');
INSERT INTO `vk` VALUES (48114, 1, '软件开发', '河北省|石家', '软件定制', '￥1000元/件', 0, '%', '百软工作室', 'http://shop.epwk.com/4118581/');
INSERT INTO `vk` VALUES (48115, 1, '软件开发', '河北省|石家', '微网站开发', '价格面议', 0, '%', '网络科技有限公司', 'http://shop.epwk.com/4126152/');
INSERT INTO `vk` VALUES (48116, 1, '软件开发', '河北省|保定', '逐梦软件软件开发', '价格面议', 0, '%', 'XX软件', 'http://shop.epwk.com/4143749/');
INSERT INTO `vk` VALUES (48117, 1, '软件开发', '河北省|保定', '逐梦软件APP、android移', '价格面议', 0, '%', 'XX软件', 'http://shop.epwk.com/4143749/');
INSERT INTO `vk` VALUES (48128, 1, '软件开发', '河北省|保定', '逐梦软件APP、android移', '价格面议', 0, '%', 'XX软件', 'http://shop.epwk.com/4143749/');
INSERT INTO `vk` VALUES (48129, 1, '软件开发', '河北省|石家', '微网站开发', '价格面议', 0, '%', '网络科技有限公司', 'http://shop.epwk.com/4126152/');
INSERT INTO `vk` VALUES (48130, 1, '软件开发', '河北省|唐山', '微信吸粉神奇 花样投票', '价格面议', 0, '%', '华展科技', 'http://shop.epwk.com/4158044/');
INSERT INTO `vk` VALUES (48131, 1, '软件开发', '河北省|唐山', '微信开发 微信互动吸粉', '价格面议', 0, '%', '华展科技', 'http://shop.epwk.com/4158044/');
INSERT INTO `vk` VALUES (48132, 1, '软件开发', '河北省|石家', '微信开发、代运营、998', '￥998元/年', 0, '%', '北京明信安软件有限公司', 'http://shop.epwk.com/4153798/');
INSERT INTO `vk` VALUES (48133, 1, '软件开发', '河北省|石家', '龙擎华娱乐 捕鱼游戏 棋', '价格面议', 0, '%', '棋牌游戏001', 'http://shop.epwk.com/4155948/');
INSERT INTO `vk` VALUES (48134, 1, '软件开发', '河北省|石家', '龙擎华娱乐 金蟾捕鱼 ap', '价格面议', 0, '%', '棋牌游戏001', 'http://shop.epwk.com/4155948/');
INSERT INTO `vk` VALUES (48135, 1, '软件开发', '河北省|石家', '龙擎华娱乐 捕鱼游戏 三', '价格面议', 0, '%', '棋牌游戏001', 'http://shop.epwk.com/4155948/');
INSERT INTO `vk` VALUES (48136, 1, '软件开发', '河北省|石家', '软件开发', '价格面议', 0, '%', '领加网络', 'http://shop.epwk.com/4161953/');
INSERT INTO `vk` VALUES (48137, 1, '软件开发', '河北省|石家', '微信平台', '价格面议', 0, '%', '领加网络', 'http://shop.epwk.com/4161953/');
INSERT INTO `vk` VALUES (48138, 1, '软件开发', '河北省|石家', '服务端维护', '￥500元/次', 0, '%', '领加网络', 'http://shop.epwk.com/4161953/');
INSERT INTO `vk` VALUES (48139, 1, '软件开发', '河北省|石家', '产品修改及维护', '价格面议', 0, '%', '领加网络', 'http://shop.epwk.com/4161953/');
INSERT INTO `vk` VALUES (48140, 1, '软件开发', '河北省|石家', '微信开发、公众号开发、', '￥3800元/年', 0, '%', '微信开发微信运营网络推广公众号开发微商城二级分销朋友圈广告', 'http://shop.epwk.com/4165715/');
INSERT INTO `vk` VALUES (48141, 1, '软件开发', '河北省|唐山', 'delphi程序定制开发', '￥1000元/起', 0, '%', '唐山中凯科技工作室', 'http://shop.epwk.com/4163326/');
INSERT INTO `vk` VALUES (48142, 1, '软件开发', '河北省|石家', 'app定制', '￥10元/件', 0, '%', '垚梦网络', 'http://shop.epwk.com/4185034/');
INSERT INTO `vk` VALUES (48143, 1, '软件开发', '河北省|石家', '公众号开发', '￥10元/件', 0, '%', '垚梦网络', 'http://shop.epwk.com/4185034/');
INSERT INTO `vk` VALUES (48160, 1, '软件开发', '河北省|石家', '小程序开发', '￥10元/件', 0, '%', '垚梦网络', 'http://shop.epwk.com/4185034/');
INSERT INTO `vk` VALUES (48161, 1, '软件开发', '河北省|廊坊', '微信平台', '￥1500元/起', 0, '%', '果孜网络技术有限公司', 'http://shop.epwk.com/4170550/');
INSERT INTO `vk` VALUES (48162, 1, '软件开发', '河北省|石家', '软件开发', '价格面议', 0, '%', '梦成科技', 'http://shop.epwk.com/4194880/');
INSERT INTO `vk` VALUES (48163, 1, '软件开发', '河北省|石家', '小程序公众号开发', '价格面议', 0, '%', '梦成科技', 'http://shop.epwk.com/4194880/');
INSERT INTO `vk` VALUES (48164, 1, '软件开发', '河北省|保定', 'Office VBA 及 插件开发', '价格面议', 0, '%', 'bdwjh的商铺', 'http://shop.epwk.com/4029957/');
INSERT INTO `vk` VALUES (48165, 1, '软件开发', '河北省|邯郸', '全国车辆违章批量查询系', '￥600元/套', 0, '%', '邯郸丁丁软件工作室', 'http://shop.epwk.com/4000258/');
INSERT INTO `vk` VALUES (48166, 1, '软件开发', '河北省|石家', '7年J2ee开发经验，全职做', '￥800元/日', 0, '%', 'java高级开发', 'http://shop.epwk.com/4131380/');
INSERT INTO `vk` VALUES (48167, 1, '软件开发', '河北省|邢台', '提供定制化进销存财务一', '价格面议', 0, '%', '邢台优卡必软件开发有限公司', 'http://shop.epwk.com/4153273/');
INSERT INTO `vk` VALUES (48168, 1, '软件开发', '河北省|秦皇', 'asp.net 在线考试系统+A', '￥12000元/次', 0, '%', '秦皇岛伟宸科技开发有限公司', 'http://shop.epwk.com/4153592/');
INSERT INTO `vk` VALUES (48169, 1, '软件开发', '河北省|石家', '网站建设', '￥1000元/次', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48170, 1, '软件开发', '河北省|石家', '手机APP', '￥5000元/次', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48171, 1, '软件开发', '河北省|石家', '电脑客户端', '￥10000元/次', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48172, 1, '软件开发', '河北省|石家', '茶码头', '￥18999元/其他', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48173, 1, '软件开发', '河北省|石家', '微信商城公众号', '￥5000元/其他', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48174, 1, '软件开发', '河北省|石家', '购物APP', '价格面议', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48175, 1, '软件开发', '河北省|石家', '化妆品APP', '价格面议', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48176, 1, '软件开发', '河北省|石家', '永衣坊', '￥39999元/年', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48177, 1, '软件开发', '河北省|石家', '好抵拉', '￥38888元/年', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48178, 1, '软件开发', '河北省|石家', '一城管家', '￥19999元/年', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48179, 1, '软件开发', '河北省|石家', '车壹家', '价格面议', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48180, 1, '软件开发', '河北省|石家', '医疗保健', '￥28888元/年', 0, '%', '三秒科技', 'http://shop.epwk.com/4152552/');
INSERT INTO `vk` VALUES (48181, 1, '软件开发', '河北省|石家', 'APP苹果+安卓定制开发', '￥30000元/套', 0, '%', '正诺科技', 'http://shop.epwk.com/4162250/');
INSERT INTO `vk` VALUES (48182, 1, '软件开发', '河北省|保定', '动漫(棋牌）游戏开发～单挑', '￥50000元/件', 0, '%', '阿凡提软件开发', 'http://shop.epwk.com/4165277/');
INSERT INTO `vk` VALUES (48183, 1, '软件开发', '河北省|保定', '北京赛车/香港赛马软件', '￥50000元/件', 0, '%', '阿凡提软件开发', 'http://shop.epwk.com/4165277/');
INSERT INTO `vk` VALUES (48184, 1, '软件开发', '河北省|廊坊', '【大蓝鲸】微信开发-小', '￥1500元/起', 0, '%', '大蓝鲸科技', 'http://shop.epwk.com/4166343/');
INSERT INTO `vk` VALUES (48185, 1, '软件开发', '河北省|保定', '软件开发', '￥50000元/件', 0, '%', '阿凡提软件开发', 'http://shop.epwk.com/4165277/');
INSERT INTO `vk` VALUES (48186, 1, '软件开发', '河北省|保定', '地方房卡类棋牌游戏开发', '￥50000元/件', 0, '%', '阿凡提软件开发', 'http://shop.epwk.com/4165277/');
INSERT INTO `vk` VALUES (48187, 1, '软件开发', '河北省|邢台', '上位机软件MES开发工业', '￥500元/起', 0, '%', 'PLC上位机编程', 'http://shop.epwk.com/4183633/');
INSERT INTO `vk` VALUES (48188, 1, '软件开发', '河北省|沧州', 'GPRS远程数据采集系统开', '￥5000元/起', 0, '%', '软星科技', 'http://shop.epwk.com/4176687/');
INSERT INTO `vk` VALUES (48189, 1, '软件开发', '河北省|沧州', '微信公众号小程序开发/', '￥5000元/起', 0, '%', '软星科技', 'http://shop.epwk.com/4176687/');
INSERT INTO `vk` VALUES (48190, 1, '软件开发', '河北省|秦皇', '小程序搭建', '￥1200元/年', 0, '%', '蓝七大法师', 'http://shop.epwk.com/4184856/');
INSERT INTO `vk` VALUES (48191, 1, '软件开发', '河北省|石家', '公众号小程序微商城开发', '￥1500元/一口价', 0, '%', '开源建站', 'http://shop.epwk.com/4195189/');
INSERT INTO `vk` VALUES (48192, 1, '软件开发', '河北省|石家', '公众号微课堂开发', '￥1500元/一口价', 0, '%', '开源建站', 'http://shop.epwk.com/4195189/');
INSERT INTO `vk` VALUES (48193, 1, '软件开发', '河北省|石家', '三级分销系统/ 电脑+', '￥3000元/一口价', 0, '%', '微聚互动', 'http://shop.epwk.com/4134834/');
INSERT INTO `vk` VALUES (48194, 1, '软件开发', '河北省|唐山', '微信公众平台', '￥5000元/年', 0, '%', '唐山点客网络科技有限公司', 'http://shop.epwk.com/4153611/');
INSERT INTO `vk` VALUES (48195, 1, '软件开发', '河北省|唐山', '微信分销商城开发', '￥26000元/年', 0, '%', '唐山点客网络科技有限公司', 'http://shop.epwk.com/4153611/');
INSERT INTO `vk` VALUES (48196, 1, '软件开发', '河北省|石家', '微巴为您提供最专业的服', '价格面议', 0, '%', '微信公众平台搭建+运营+推广+营销+微信支付', 'http://shop.epwk.com/4140126/');
INSERT INTO `vk` VALUES (48197, 1, '软件开发', '河北省|石家', '微信公众平台公众号二次', '￥1688元/年', 0, '%', 'ITS网络技术服务工作室', 'http://shop.epwk.com/4147623/');
INSERT INTO `vk` VALUES (48198, 1, '软件开发', '河北省|沧州', '微信企业号，服务号开发，二', '价格面议', 0, '%', 'APP 创客', 'http://shop.epwk.com/4147734/');
INSERT INTO `vk` VALUES (48199, 1, '软件开发', '河北省|唐山', '一元云购源码、1元云购', '￥10000元/起', 0, '%', '北京追梦科技', 'http://shop.epwk.com/4136471/');
INSERT INTO `vk` VALUES (48200, 1, '软件开发', '河北省|唐山', '直播源码/仿花椒直播/视', '￥30000元/起', 0, '%', '北京追梦科技', 'http://shop.epwk.com/4136471/');
INSERT INTO `vk` VALUES (48201, 1, '软件开发', '河北省|唐山', '商城源码、电商APP源码', '￥15000元/起', 0, '%', '北京追梦科技', 'http://shop.epwk.com/4136471/');
INSERT INTO `vk` VALUES (48202, 1, '软件开发', '河北省|唐山', '行业交流APP源码、供求', '￥10000元/起', 0, '%', '北京追梦科技', 'http://shop.epwk.com/4136471/');
INSERT INTO `vk` VALUES (48203, 1, '软件开发', '河北省|唐山', '网络电话源码、网络通讯', '￥6000元/起', 0, '%', '北京追梦科技', 'http://shop.epwk.com/4136471/');
INSERT INTO `vk` VALUES (48204, 1, '软件开发', '河北省|邢台', '微信分销商城搭建', '￥16800元/年', 0, '%', '宇微网络-企业互联网转型定制专家', 'http://shop.epwk.com/4160903/');
INSERT INTO `vk` VALUES (48205, 1, '软件开发', '河北省|石家', '网站建设 微网站 微商城', '￥2400元/套', 0, '%', '网人互联', 'http://shop.epwk.com/4166501/');
INSERT INTO `vk` VALUES (48206, 1, '软件开发', '河北省|保定', '先试用|微信小程序开发|', '价格面议', 0, '%', '保定市讯辰网络科技有限公司', 'http://shop.epwk.com/4185596/');
INSERT INTO `vk` VALUES (48207, 1, '软件开发', '河北省|保定', '源生app开发综合商城app', '价格面议', 0, '%', '保定市讯辰网络科技有限公司', 'http://shop.epwk.com/4185596/');
INSERT INTO `vk` VALUES (48208, 1, '软件开发', '河北省|保定', '先试用|微信小程序开发|', '价格面议', 0, '%', '保定市讯辰网络科技有限公司', 'http://shop.epwk.com/4185596/');
INSERT INTO `vk` VALUES (48209, 1, '软件开发', '河北省|保定', '源生app开发综合商城app', '价格面议', 0, '%', '保定市讯辰网络科技有限公司', 'http://shop.epwk.com/4185596/');
INSERT INTO `vk` VALUES (48210, 1, '软件开发', '河北省|唐山', '微信小程序开发 小程序', '价格面议', 0, '%', '兴通科技', 'http://shop.epwk.com/4185887/');
INSERT INTO `vk` VALUES (48211, 1, '软件开发', '河北省|唐山', '微信开发 商城 餐饮 营', '价格面议', 0, '%', '兴通科技', 'http://shop.epwk.com/4185887/');
INSERT INTO `vk` VALUES (48212, 1, '软件开发', '河北省|石家', 'APP定制开发', '￥50000元/月', 0, '%', '时代赢信石家庄网络科技有限公司', 'http://shop.epwk.com/4195831/');
INSERT INTO `vk` VALUES (48213, 1, '软件开发', '河北省|保定', '软件培训', '价格面议', 0, '%', '倬威达软件', 'http://shop.epwk.com/4120987/');
INSERT INTO `vk` VALUES (48214, 1, '软件开发', '河北省|石家', '英文网站开发', '￥0元/小时', 0, '%', '石家庄凤凰网络', 'http://shop.epwk.com/4120834/');
INSERT INTO `vk` VALUES (48215, 1, '软件开发', '河北省|石家', '淘速打快递单打印软件', '￥0元/件', 0, '%', '拓友科技', 'http://shop.epwk.com/4120839/');
INSERT INTO `vk` VALUES (48216, 1, '软件开发', '河北省|石家', '石家庄在线考试软件系统', '￥1000元/件', 0, '%', '凹凸网络', 'http://shop.epwk.com/4120835/');
INSERT INTO `vk` VALUES (48217, 1, '软件开发', '河北省|石家', 'tysoft 驾校管理系统', '￥0元/件', 0, '%', '拓友科技', 'http://shop.epwk.com/4120839/');
INSERT INTO `vk` VALUES (48218, 1, '软件开发', '河北省|邢台', '农村财务管理软件', '￥0元/件', 0, '%', '鼎鑫软件', 'http://shop.epwk.com/4121608/');
INSERT INTO `vk` VALUES (48219, 1, '软件开发', '河北省|邢台', '百度防恶意点击软件', '￥0元/件', 0, '%', '鼎鑫软件', 'http://shop.epwk.com/4121608/');
INSERT INTO `vk` VALUES (48220, 1, '软件开发', '河北省|邢台', '邢税通智能手机系统', '￥0元/件', 0, '%', '永翔科技', 'http://shop.epwk.com/4121616/');
INSERT INTO `vk` VALUES (48221, 1, '软件开发', '河北省|邢台', '纳税评估系统软件', '￥0元/件', 0, '%', '永翔科技', 'http://shop.epwk.com/4121616/');
INSERT INTO `vk` VALUES (48222, 1, '软件开发', '河北省|邢台', '供应服装进销存软件', '￥0元/件', 0, '%', '新海科技', 'http://shop.epwk.com/4121624/');
INSERT INTO `vk` VALUES (48223, 1, '软件开发', '河北省|邢台', '医药管理软件', '￥0元/件', 0, '%', '新海科技', 'http://shop.epwk.com/4121624/');
INSERT INTO `vk` VALUES (48240, 1, '软件开发', '河北省|邯郸', '软件开发，区块链相关开发', '价格面议', 0, '%', '聚合未来区块链软件开发科技有限公司', 'http://shop.epwk.com/4190391/');
INSERT INTO `vk` VALUES (48241, 1, '软件开发', '河北省|秦皇', '软件开发', '价格面议', 0, '%', '杰诚网络科技有限公司', 'http://shop.epwk.com/4121659/');
INSERT INTO `vk` VALUES (48352, 2, '微信小程序', '河北省|保定', '微信视频小程序开发', '￥100元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (48353, 2, '微信小程序', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (48354, 2, '微信小程序', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (48355, 2, '微信小程序', '河北省|石家', '小程序', '￥1000元/起', 0, '100.0%', '河北万中科技有限公司', 'http://shop.epwk.com/4180838/');
INSERT INTO `vk` VALUES (48356, 2, '微信小程序', '河北省|石家', '小程序开发', '￥1500元/套', 3, '100.0%', '数谷网络科技', 'http://shop.epwk.com/4172271/');
INSERT INTO `vk` VALUES (48357, 2, '微信小程序', '河北省|唐山', '微信小程序定制', '￥998元/起', 0, '100.0%', '极上科技', 'http://shop.epwk.com/4192977/');
INSERT INTO `vk` VALUES (48358, 2, '微信小程序', '河北省|衡水', '四合一服务：网站建设+小', '￥10000元/年', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/');
INSERT INTO `vk` VALUES (48359, 2, '微信小程序', '河北省|衡水', '多门店小程序', '￥8000元/一口价', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/');
INSERT INTO `vk` VALUES (48360, 2, '微信小程序', '河北省|石家', '微信小程序 定制 开发', '价格面议', 0, '100.0%', '河北异想科技有限公司', 'http://shop.epwk.com/4181252/');
INSERT INTO `vk` VALUES (48361, 2, '微信小程序', '河北省|保定', '微信门户小程序制作源码', '￥4999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/');
INSERT INTO `vk` VALUES (48362, 2, '微信小程序', '河北省|保定', '微商城小程序开发源码定', '￥12999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/');
INSERT INTO `vk` VALUES (48363, 2, '微信小程序', '河北省|石家', '微信公众号开发公众平台', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/');
INSERT INTO `vk` VALUES (48364, 2, '微信小程序', '河北省|石家', '小程序开发，会员，分销，门店', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/');
INSERT INTO `vk` VALUES (48365, 2, '微信小程序', '河北省|石家', '微信小程序开发——商城', '￥30000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/');
INSERT INTO `vk` VALUES (48366, 2, '微信小程序', '河北省|石家', '微信小程序开发——信息', '￥18000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/');
INSERT INTO `vk` VALUES (48367, 2, '微信小程序', '河北省|石家', '微信公众号/小程序开发', '￥3000元/起', 0, '%', '河北神光勇安网络科技有限公司', 'http://shop.epwk.com/4195184/');
INSERT INTO `vk` VALUES (48368, 2, '微信小程序', '河北省|保定', '微信视频小程序开发', '￥100元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (48369, 2, '微信小程序', '河北省|保定', '微信公众号商城开发', '￥7800元/件', 15, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (48370, 2, '微信小程序', '河北省|保定', '社区购物-源生开发—超', '￥13400元/次', 3, '99.3%', '大芬科技', 'http://shop.epwk.com/4163750/');
INSERT INTO `vk` VALUES (48371, 2, '微信小程序', '河北省|石家', '小程序', '￥1000元/起', 0, '100.0%', '河北万中科技有限公司', 'http://shop.epwk.com/4180838/');
INSERT INTO `vk` VALUES (48372, 2, '微信小程序', '河北省|石家', '小程序开发', '￥1500元/套', 3, '100.0%', '数谷网络科技', 'http://shop.epwk.com/4172271/');
INSERT INTO `vk` VALUES (48373, 2, '微信小程序', '河北省|唐山', '微信小程序定制', '￥998元/起', 0, '100.0%', '极上科技', 'http://shop.epwk.com/4192977/');
INSERT INTO `vk` VALUES (48374, 2, '微信小程序', '河北省|衡水', '四合一服务：网站建设+小', '￥10000元/年', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/');
INSERT INTO `vk` VALUES (48375, 2, '微信小程序', '河北省|衡水', '多门店小程序', '￥8000元/一口价', 0, '100.0%', '云翼信息技术有限公司', 'http://shop.epwk.com/4175650/');
INSERT INTO `vk` VALUES (48376, 2, '微信小程序', '河北省|石家', '微信小程序 定制 开发', '价格面议', 0, '100.0%', '河北异想科技有限公司', 'http://shop.epwk.com/4181252/');
INSERT INTO `vk` VALUES (48377, 2, '微信小程序', '河北省|保定', '微信门户小程序制作源码', '￥4999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/');
INSERT INTO `vk` VALUES (48378, 2, '微信小程序', '河北省|保定', '微商城小程序开发源码定', '￥12999元/起', 0, '100.0%', '六面体科技', 'http://shop.epwk.com/4185836/');
INSERT INTO `vk` VALUES (48379, 2, '微信小程序', '河北省|石家', '微信公众号开发公众平台', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/');
INSERT INTO `vk` VALUES (48380, 2, '微信小程序', '河北省|石家', '小程序开发，会员，分销，门店', '￥100元/件', 0, '100.0%', '石家庄奇思妙想网络科技有限公司', 'http://shop.epwk.com/4132464/');
INSERT INTO `vk` VALUES (48381, 2, '微信小程序', '河北省|石家', '微信小程序开发——商城', '￥30000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/');
INSERT INTO `vk` VALUES (48382, 2, '微信小程序', '河北省|石家', '微信小程序开发——信息', '￥18000元/款', 0, '100.0%', '宝寰科技', 'http://shop.epwk.com/4173257/');
INSERT INTO `vk` VALUES (48383, 2, '微信小程序', '河北省|石家', '微信公众号/小程序开发', '￥3000元/起', 0, '%', '河北神光勇安网络科技有限公司', 'http://shop.epwk.com/4195184/');
INSERT INTO `vk` VALUES (48384, 2, '微信小程序', '河北省|邯郸', '微信开发小程序公众号', '￥3999元/起', 0, '%', '博跃软件科技', 'http://shop.epwk.com/4196005/');
INSERT INTO `vk` VALUES (48385, 2, '微信小程序', '河北省|石家', '人人商城-小程序前端+后', '￥100元/次', 0, '%', '小杨php定制', 'http://shop.epwk.com/4176463/');
INSERT INTO `vk` VALUES (48386, 2, '微信小程序', '河北省|唐山', '小程序定制开发', '价格面议', 0, '%', '优享科技', 'http://shop.epwk.com/4183437/');
INSERT INTO `vk` VALUES (48387, 2, '微信小程序', '河北省|秦皇', '微信小程序开发', '￥5000元/起', 0, '%', '聚享时空网络', 'http://shop.epwk.com/4167353/');
INSERT INTO `vk` VALUES (48388, 2, '微信小程序', '河北省|石家', '小程序开发', '￥10元/件', 0, '%', '垚梦网络', 'http://shop.epwk.com/4185034/');
INSERT INTO `vk` VALUES (48389, 2, '微信小程序', '河北省|沧州', '微信公众号小程序开发/', '￥5000元/起', 0, '%', '软星科技', 'http://shop.epwk.com/4176687/');
INSERT INTO `vk` VALUES (48390, 2, '微信小程序', '河北省|秦皇', '小程序搭建', '￥1200元/年', 0, '%', '蓝七大法师', 'http://shop.epwk.com/4184856/');
INSERT INTO `vk` VALUES (48391, 2, '微信小程序', '河北省|保定', '先试用|微信小程序开发|', '价格面议', 0, '%', '保定市讯辰网络科技有限公司', 'http://shop.epwk.com/4185596/');
INSERT INTO `vk` VALUES (48392, 2, '微信小程序', '河北省|唐山', '小程序', '￥540元/年', 0, '%', '子牛科技', 'http://shop.epwk.com/4187962/');
INSERT INTO `vk` VALUES (48393, 2, '微信小程序', '河北省|唐山', '微信小程序开发 小程序', '价格面议', 0, '%', '兴通科技', 'http://shop.epwk.com/4185887/');
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
INSERT INTO `vksort` VALUES (1, '软件开发', '河北省', '2019-05-31 13:32:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=9767 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of zbj
-- ----------------------------
BEGIN;
INSERT INTO `zbj` VALUES (8241, 14, '微辰淘宝托管微信开发团队', '保定', 'https://shop.zbj.com/18672341/', '企业', 9000, '5.00');
INSERT INTO `zbj` VALUES (8242, 14, '艺点品牌策划有限公司', '保定', 'https://shop.zbj.com/7163110/?fr=yd', '企业', 20000, '4.97');
INSERT INTO `zbj` VALUES (8243, 14, '怀风文化', '保定', 'https://shop.zbj.com/1240897/', '企业', 5000, '4.93');
INSERT INTO `zbj` VALUES (8244, 14, '久念软件', '保定', 'https://shop.zbj.com/21706405/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (8245, 14, '不落窠臼品牌设计旗舰店', '保定', 'https://shop.zbj.com/17959634/', '企业', 1000, '4.45');
INSERT INTO `zbj` VALUES (8246, 14, '深圳市全能广告', '深圳', 'https://shop.zbj.com/18835317/?fr=djwy', '企业', 4000, '5.00');
INSERT INTO `zbj` VALUES (8247, 14, '专业前后端团队', '保定', 'https://shop.zbj.com/15034919/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (8248, 14, '潜龙文丰', '保定', 'https://shop.zbj.com/10576915/', '个人', 0, '4.94');
INSERT INTO `zbj` VALUES (8249, 14, '慧狼谷企业营销策划', '保定', 'https://shop.zbj.com/14511438/', '企业', 0, '4.87');
INSERT INTO `zbj` VALUES (8250, 14, '专业营销发帖团队', '保定', 'https://shop.zbj.com/16638063/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (8251, 14, 'V8网络营销', '保定', 'https://shop.zbj.com/11302164/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (8252, 14, '千佰特网络推广', '重庆', 'https://shop.zbj.com/11095334/?fr=djwy', '企业', 5000, '0.00');
INSERT INTO `zbj` VALUES (8253, 14, '青峰营销推广', '保定', 'https://shop.zbj.com/5287102/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (8254, 14, '营销推广策划', '保定', 'https://shop.zbj.com/14549877/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (8255, 14, '瑞杰营销', '保定', 'https://shop.zbj.com/4100300/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (8256, 14, '微阳光营销工作室', '保定', 'https://shop.zbj.com/6026581/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (8257, 14, '专注营销力', '保定', 'https://shop.zbj.com/15245139/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (8258, 14, '书尧传媒', '北京', 'https://shop.zbj.com/13276206/?fr=djwy', '个人', 5000, '5.00');
INSERT INTO `zbj` VALUES (8259, 14, '优品网络营销', '保定', 'https://shop.zbj.com/5241628/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (8260, 14, '微帮客营销', '保定', 'https://shop.zbj.com/13243411/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9202, 12, '河北伟湃网络科技有限公司', '保定', 'https://shop.zbj.com/15419032/?fr=yd', '企业', 7000, '5.00');
INSERT INTO `zbj` VALUES (9203, 12, '久念软件', '保定', 'https://shop.zbj.com/21706405/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9204, 12, '河北雄安桃李科技有限公司', '保定', 'https://shop.zbj.com/21465026/', '企业', 4500, '0.00');
INSERT INTO `zbj` VALUES (9205, 12, '保定凌众科技', '保定', 'https://shop.zbj.com/14017496/', '企业', 0, '4.81');
INSERT INTO `zbj` VALUES (9206, 12, '智雅科技网络有限公司', '保定', 'https://shop.zbj.com/10521947/', '企业', 0, '4.69');
INSERT INTO `zbj` VALUES (9207, 12, '上海泰闻信息科技有限公司', '上海', 'https://shop.zbj.com/14903609/?fr=djwy', '企业', 12000, '4.98');
INSERT INTO `zbj` VALUES (9208, 12, '纤羽工作室', '保定', 'https://shop.zbj.com/19802860/', '个人', 2000, '0.00');
INSERT INTO `zbj` VALUES (9209, 12, '如夏网络工作室', '保定', 'https://shop.zbj.com/685846/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9210, 12, '小额网站相关', '保定', 'https://shop.zbj.com/19239358/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9211, 12, '小崔前端', '保定', 'https://shop.zbj.com/21537300/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9212, 12, 'VB软件开发定制EXCEL管理软件SSC', '保定', 'https://shop.zbj.com/2699026/', '个人', 5000, '4.95');
INSERT INTO `zbj` VALUES (9213, 12, '博创明志信息科技', '长沙', 'https://shop.zbj.com/14598266/?fr=djwy', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9214, 12, '流浪的喵', '保定', 'https://shop.zbj.com/18669648/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9215, 12, '网尚网络有限公司', '保定', 'https://shop.zbj.com/3043786/', '企业', 0, '4.95');
INSERT INTO `zbj` VALUES (9216, 12, '开发PHP开发', '保定', 'https://shop.zbj.com/15175254/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9217, 12, '鱼为情网络', '保定', 'https://shop.zbj.com/3539838/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9218, 12, '云浔小说系统-专注文学原创系统开发', '保定', 'https://shop.zbj.com/14145126/', '企业', 0, '4.89');
INSERT INTO `zbj` VALUES (9219, 12, '红石互联', '贵阳', 'https://shop.zbj.com/14186110/?fr=djwy', '企业', 11000, '4.98');
INSERT INTO `zbj` VALUES (9220, 12, '聚红网络旗舰店', '保定', 'https://shop.zbj.com/17631482/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9221, 12, '保定网商互通网络科技有限公司', '保定', 'https://shop.zbj.com/12675115/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9222, 12, '来采网络', '保定', 'https://shop.zbj.com/2340166/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9223, 12, 'blueseaworld', '保定', 'https://shop.zbj.com/8775581/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9224, 12, '筑梦网站开发', '保定', 'https://shop.zbj.com/13138452/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9225, 12, '河北领行网络科技有限公司', '保定', 'https://shop.zbj.com/13563290/?fr=djwy', '企业', 10000, '5.00');
INSERT INTO `zbj` VALUES (9226, 12, '切图前端4年经验', '保定', 'https://shop.zbj.com/8211437/', '个人', 0, '4.98');
INSERT INTO `zbj` VALUES (9227, 12, '坊正网络', '保定', 'https://shop.zbj.com/17755769/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9228, 12, '保定市恒江网络科技有限公司', '保定', 'https://shop.zbj.com/19680780/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9229, 12, '保定云上网络科技', '保定', 'https://shop.zbj.com/14108023/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9230, 12, '创宏软件工作室', '保定', 'https://shop.zbj.com/12177140/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9231, 12, '牵亿网讯', '北京', 'https://shop.zbj.com/18407564/?fr=djwy', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9232, 12, '睿策高端包装策划', '保定', 'https://shop.zbj.com/12331439/', '个人', 0, '4.78');
INSERT INTO `zbj` VALUES (9233, 12, '海文极客', '保定', 'https://shop.zbj.com/18463135/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9234, 12, '蜜罐大师', '保定', 'https://shop.zbj.com/13710524/', '个人', 0, '4.87');
INSERT INTO `zbj` VALUES (9235, 12, '北京动力网络设计', '保定', 'https://shop.zbj.com/11658393/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9236, 12, '金博软件刘颖', '保定', 'https://shop.zbj.com/10939037/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9237, 12, '半刻网络', '宁波', 'https://shop.zbj.com/20595136/?fr=djwy', '企业', 10000, '0.00');
INSERT INTO `zbj` VALUES (9238, 12, 'czhqjh_@Zbj', '保定', 'https://shop.zbj.com/8193939/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9239, 12, '鼎和工作室', '保定', 'https://shop.zbj.com/9870452/', '个人', 0, '4.72');
INSERT INTO `zbj` VALUES (9240, 12, 'i文峰工作室', '保定', 'https://shop.zbj.com/4860178/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9241, 12, '慧狼谷企业营销策划', '保定', 'https://shop.zbj.com/14511438/', '企业', 0, '4.87');
INSERT INTO `zbj` VALUES (9242, 12, '蛙塞科技', '保定', 'https://shop.zbj.com/19115235/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9243, 12, '麦可科技', '保定', 'https://shop.zbj.com/18156625/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9244, 12, '中子科技工作室', '保定', 'https://shop.zbj.com/12088851/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9245, 12, '辰凯网络', '保定', 'https://shop.zbj.com/7875891/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9246, 12, '云蛛网络科技有限公司', '保定', 'https://shop.zbj.com/8382059/', '个人', 1000, '4.83');
INSERT INTO `zbj` VALUES (9247, 12, '静宇网络', '保定', 'https://shop.zbj.com/8839963/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9248, 12, '蝴蝶飞飞', '保定', 'https://shop.zbj.com/26270/', '个人', 0, '4.82');
INSERT INTO `zbj` VALUES (9249, 12, '倬威达软件有限公司', '保定', 'https://shop.zbj.com/14607626/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9250, 12, '不凑活', '保定', 'https://shop.zbj.com/17378621/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9251, 12, '云韶工作室', '保定', 'https://shop.zbj.com/10999554/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9252, 12, 'buzhidaoyy', '保定', 'https://shop.zbj.com/5748569/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9253, 12, '白马网络', '保定', 'https://shop.zbj.com/17821380/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9254, 12, '久念软件开发', '保定', 'https://shop.zbj.com/17400696/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (9255, 12, '孙小胖的小铺', '保定', 'https://shop.zbj.com/19742974/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9256, 12, '飞龙测试', '保定', 'https://shop.zbj.com/21307729/', '个人', 500, '0.00');
INSERT INTO `zbj` VALUES (9257, 12, '米饭直播', '保定', 'https://shop.zbj.com/12428455/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9258, 12, '福居天下网络科技', '保定', 'https://shop.zbj.com/2750129/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9259, 12, '点动软件', '保定', 'https://shop.zbj.com/21337688/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9260, 12, '亚帝鼎科技', '保定', 'https://shop.zbj.com/18835882/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (9261, 12, '逅雨阁', '保定', 'https://shop.zbj.com/14102572/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9262, 12, '保定保定保定', '保定', 'https://shop.zbj.com/21830177/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9263, 12, '乐建', '保定', 'https://shop.zbj.com/21030448/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9264, 12, 'okcms', '保定', 'https://shop.zbj.com/20640596/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9265, 12, '异度网络', '保定', 'https://shop.zbj.com/10704134/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9266, 12, '张旭乾', '保定', 'https://shop.zbj.com/5534366/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9267, 12, '如意金铺', '保定', 'https://shop.zbj.com/4522856/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9268, 12, 'GJHGJKL', '保定', 'https://shop.zbj.com/21270150/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9269, 12, '小正网站开发2年经验', '保定', 'https://shop.zbj.com/15325834/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9270, 12, '腾骏科技', '保定', 'https://shop.zbj.com/19974117/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9271, 12, '金纯.com', '保定', 'https://shop.zbj.com/14569518/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9272, 12, 'ly_help', '保定', 'https://shop.zbj.com/14905713/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9273, 12, '天津华泰科技', '保定', 'https://shop.zbj.com/17020264/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9274, 12, '小强网络服务工作室', '保定', 'https://shop.zbj.com/17946136/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9275, 12, '涂鸦计划', '保定', 'https://shop.zbj.com/17807506/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9276, 12, '石头的故事啊', '保定', 'https://shop.zbj.com/16011217/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9277, 12, 'php小帅666', '保定', 'https://shop.zbj.com/16747937/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9278, 12, '遨游互联', '保定', 'https://shop.zbj.com/14432722/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9279, 12, 'laravel灬极客', '保定', 'https://shop.zbj.com/15512084/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9280, 12, '专注营销力', '保定', 'https://shop.zbj.com/15245139/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9281, 12, '专业网站价格质量没得说', '保定', 'https://shop.zbj.com/15171308/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9282, 12, '前端myworld', '保定', 'https://shop.zbj.com/15434820/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9283, 12, '明智远达', '保定', 'https://shop.zbj.com/12094240/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9284, 12, 'zozoyoyo', '保定', 'https://shop.zbj.com/12654579/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9285, 12, '小黑被晒黑了', '保定', 'https://shop.zbj.com/12588562/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9286, 12, 'aiyahacke', '保定', 'https://shop.zbj.com/12045930/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9287, 12, 'LAMP p工作室', '保定', 'https://shop.zbj.com/12322789/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9288, 12, '创宇技术', '保定', 'https://shop.zbj.com/18730403/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9289, 12, '开心的店', '保定', 'https://shop.zbj.com/18182967/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9290, 12, '病乌鸦', '保定', 'https://shop.zbj.com/13377043/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9291, 12, '博尚易创软件开发有限公司', '保定', 'https://shop.zbj.com/13957994/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9292, 12, '云朵朵网络', '保定', 'https://shop.zbj.com/12854237/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9293, 12, '丹华抱一鷇音子', '保定', 'https://shop.zbj.com/12951522/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9294, 12, '五折建站', '保定', 'https://shop.zbj.com/13492722/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9295, 12, 'yatian9', '保定', 'https://shop.zbj.com/13264984/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9296, 12, '专业网站搭建', '保定', 'https://shop.zbj.com/11727108/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9297, 12, '缘分统领时尚', '保定', 'https://shop.zbj.com/11715125/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9298, 12, '八号CODE', '保定', 'https://shop.zbj.com/11701086/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9299, 12, '『天玖昊利』品牌创意设计', '保定', 'https://shop.zbj.com/11952018/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9300, 12, '因拓本', '保定', 'https://shop.zbj.com/11945465/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9301, 12, 'xiaozhao0109', '保定', 'https://shop.zbj.com/10326341/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9302, 12, '亲亲宝妮', '保定', 'https://shop.zbj.com/10618661/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9303, 12, '网站制作div+css网页制作', '保定', 'https://shop.zbj.com/11211685/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9304, 12, 'HTML+CSS+PHP+MYSQL', '保定', 'https://shop.zbj.com/11047095/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9305, 12, '无言小市民', '保定', 'https://shop.zbj.com/11305284/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9306, 12, '三间北房', '保定', 'https://shop.zbj.com/9732708/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9307, 12, 'bdbuy', '保定', 'https://shop.zbj.com/8576470/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9308, 12, '追梦-000', '保定', 'https://shop.zbj.com/5516313/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9309, 12, '小兰兰的家', '保定', 'https://shop.zbj.com/5498649/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9310, 12, 'LinkNet企业信息化建设', '保定', 'https://shop.zbj.com/5489380/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9311, 12, '海月网络工作室', '保定', 'https://shop.zbj.com/4791332/', '个人', 0, '4.92');
INSERT INTO `zbj` VALUES (9312, 12, 'whoisdr', '保定', 'https://shop.zbj.com/4780947/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9313, 12, '墨点工作室', '保定', 'https://shop.zbj.com/4744551/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9314, 12, '豆腐馒头花', '保定', 'https://shop.zbj.com/5886921/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9315, 12, '豆包炒豆芽', '保定', 'https://shop.zbj.com/1377502/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9316, 12, 'AirTeams', '保定', 'https://shop.zbj.com/8707503/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9317, 12, '9507', '保定', 'https://shop.zbj.com/10168616/', '企业', 0, '4.47');
INSERT INTO `zbj` VALUES (9318, 12, '漫步云端0219', '保定', 'https://shop.zbj.com/9182309/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9319, 12, 'PS制图', '保定', 'https://shop.zbj.com/8947403/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9320, 12, '宇腾网络', '保定', 'https://shop.zbj.com/7239266/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9321, 12, 'down010', '保定', 'https://shop.zbj.com/6473308/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9322, 12, '起源高端设计', '保定', 'https://shop.zbj.com/7376466/', '个人', 0, '4.87');
INSERT INTO `zbj` VALUES (9323, 12, 'xelloss86', '保定', 'https://shop.zbj.com/6631931/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9324, 12, 'sain工作室', '保定', 'https://shop.zbj.com/4059529/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9325, 12, '兔子虎', '保定', 'https://shop.zbj.com/4949663/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9326, 12, '努力的小盼盼', '保定', 'https://shop.zbj.com/4313257/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9327, 12, '暮雨晨风', '保定', 'https://shop.zbj.com/352513/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9328, 12, '服务百分百满意', '保定', 'https://shop.zbj.com/14279670/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9329, 12, '单人丶影', '保定', 'https://shop.zbj.com/14233369/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9330, 12, '默mo小店', '保定', 'https://shop.zbj.com/14601817/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9331, 12, '大白科技', '保定', 'https://shop.zbj.com/18111398/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9332, 12, '保定市翃飏计算机信息技术服务有限公司', '保定', 'https://shop.zbj.com/18005780/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9333, 12, '小八杂货铺', '保定', 'https://shop.zbj.com/17666972/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9334, 12, '心中火', '保定', 'https://shop.zbj.com/15708001/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9335, 12, 'PHP世界上__语言', '保定', 'https://shop.zbj.com/15677784/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9336, 12, '云梯科技', '保定', 'https://shop.zbj.com/15046714/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9337, 12, '子非鱼sama', '保定', 'https://shop.zbj.com/15034077/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9338, 12, '飞翔软文工作室', '保定', 'https://shop.zbj.com/12637206/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9339, 12, '杰创Saidea', '保定', 'https://shop.zbj.com/12273802/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9340, 12, '做最好的自己@', '保定', 'https://shop.zbj.com/11569160/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9341, 12, '杨义彪', '保定', 'https://shop.zbj.com/11942129/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9342, 12, 'RaeMu', '保定', 'https://shop.zbj.com/11587288/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9343, 12, 'missbbs', '保定', 'https://shop.zbj.com/11920803/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9344, 12, '中国微积分', '保定', 'https://shop.zbj.com/11925041/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9345, 12, '龙生2010', '保定', 'https://shop.zbj.com/11708477/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9346, 12, '红创网络', '保定', 'https://shop.zbj.com/11705655/', '个人', 0, '4.54');
INSERT INTO `zbj` VALUES (9347, 12, '绿芙', '保定', 'https://shop.zbj.com/12114734/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9348, 12, '研究生创业联盟', '保定', 'https://shop.zbj.com/11745410/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9349, 12, 'qubor', '保定', 'https://shop.zbj.com/11753814/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9350, 12, '陨石软件工作室', '保定', 'https://shop.zbj.com/11275028/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9351, 12, '落雪封疆', '保定', 'https://shop.zbj.com/11145019/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9352, 12, '魔方-工作室', '保定', 'https://shop.zbj.com/11168912/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9353, 12, '旮旯的蛋蛋', '保定', 'https://shop.zbj.com/10481625/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9354, 12, '三滴水network888', '保定', 'https://shop.zbj.com/10821986/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9355, 12, 'MJ云途', '保定', 'https://shop.zbj.com/10131845/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9356, 12, '韵龙工作室', '保定', 'https://shop.zbj.com/10261247/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9357, 12, '小猪儿不会飞', '保定', 'https://shop.zbj.com/9818448/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9358, 12, '小科比科比', '保定', 'https://shop.zbj.com/6548973/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9359, 12, 'bitQ', '保定', 'https://shop.zbj.com/6135884/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9360, 12, '多彩阳光设计坊', '保定', 'https://shop.zbj.com/6028203/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9361, 12, '青峰营销推广', '保定', 'https://shop.zbj.com/5287102/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9362, 12, 'axdyf', '保定', 'https://shop.zbj.com/4864701/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9363, 12, '瑞杰营销', '保定', 'https://shop.zbj.com/4100300/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9364, 12, '织梦二次开发', '保定', 'https://shop.zbj.com/3329739/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9365, 12, '龙儿87', '保定', 'https://shop.zbj.com/3898529/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9366, 12, 'qijinwen', '保定', 'https://shop.zbj.com/3983793/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9367, 12, '星儿丫头', '保定', 'https://shop.zbj.com/9720225/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9368, 12, '古城科技', '保定', 'https://shop.zbj.com/9378000/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9369, 12, '渺渺网路', '保定', 'https://shop.zbj.com/9480075/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9370, 12, 'yuyebing', '保定', 'https://shop.zbj.com/1650035/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9371, 12, '智诚网络服务', '保定', 'https://shop.zbj.com/940007/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9372, 12, 'loveyoully', '保定', 'https://shop.zbj.com/1046756/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9373, 12, '第二杯半价吗', '保定', 'https://shop.zbj.com/14647744/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9374, 12, 'putishu112', '保定', 'https://shop.zbj.com/14720813/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9375, 12, '懒人519', '保定', 'https://shop.zbj.com/14684694/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9376, 12, '坏波波', '保定', 'https://shop.zbj.com/17681993/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9377, 12, 'web前端开发家', '保定', 'https://shop.zbj.com/17738976/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9378, 12, '更优质的服务', '保定', 'https://shop.zbj.com/12013290/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9379, 12, '汇官网', '保定', 'https://shop.zbj.com/18474660/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9380, 12, 'siying580', '保定', 'https://shop.zbj.com/12950918/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9381, 12, '易托360', '保定', 'https://shop.zbj.com/10814625/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9382, 12, '文非水镜', '保定', 'https://shop.zbj.com/6293798/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9383, 12, 'ctsd', '保定', 'https://shop.zbj.com/9638519/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9384, 12, '正大服务', '保定', 'https://shop.zbj.com/9415042/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9385, 12, '四海天下科技', '保定', 'https://shop.zbj.com/14317460/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9386, 12, '吴霸哥', '保定', 'https://shop.zbj.com/17408062/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9387, 12, '邻家小明', '保定', 'https://shop.zbj.com/15393167/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9388, 12, '穿青人', '保定', 'https://shop.zbj.com/14391891/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9389, 12, '聆听花雨', '保定', 'https://shop.zbj.com/5810155/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9390, 12, '悠悠公主2013', '保定', 'https://shop.zbj.com/9431593/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9673, 13, '河北领行网络科技有限公司', '保定', 'https://shop.zbj.com/13563290/?fr=yd', '企业', 10000, '5.00');
INSERT INTO `zbj` VALUES (9674, 13, '宜高云科技', '保定', 'https://shop.zbj.com/19149212/', '个人', 1000, '5.00');
INSERT INTO `zbj` VALUES (9675, 13, '河北雄安桃李科技有限公司', '保定', 'https://shop.zbj.com/21465026/', '企业', 4500, '0.00');
INSERT INTO `zbj` VALUES (9676, 13, '科技猫工作室', '保定', 'https://shop.zbj.com/14621562/', '个人', 9000, '4.99');
INSERT INTO `zbj` VALUES (9677, 13, 'VB软件开发定制EXCEL管理软件SSC', '保定', 'https://shop.zbj.com/2699026/', '个人', 5000, '4.95');
INSERT INTO `zbj` VALUES (9678, 13, '深圳市一七网络科技有限公司', '深圳', 'https://shop.zbj.com/16884525/?fr=djwy', '企业', 10000, '4.99');
INSERT INTO `zbj` VALUES (9679, 13, 'gch_ling', '保定', 'https://shop.zbj.com/4766974/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (9680, 13, '颖慧软件开发有限公司', '保定', 'https://shop.zbj.com/13146151/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (9681, 13, '厚普机电', '保定', 'https://shop.zbj.com/18767189/', '企业', 1000, '0.00');
INSERT INTO `zbj` VALUES (9682, 13, '以梦为马。。', '保定', 'https://shop.zbj.com/10815179/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9683, 13, '聚红网络旗舰店', '保定', 'https://shop.zbj.com/17631482/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9684, 13, '宝宏科技', '合肥', 'https://shop.zbj.com/4985869/?fr=djwy', '企业', 5000, '5.00');
INSERT INTO `zbj` VALUES (9685, 13, '专业的网络科技公司', '保定', 'https://shop.zbj.com/10871074/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9686, 13, '金博软件刘颖', '保定', 'https://shop.zbj.com/10939037/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9687, 13, '博睿智软件', '保定', 'https://shop.zbj.com/9639287/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9688, 13, '来采网络', '保定', 'https://shop.zbj.com/2340166/', '企业', 0, '5.00');
INSERT INTO `zbj` VALUES (9689, 13, '加贝软件', '保定', 'https://shop.zbj.com/89251/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9690, 13, '汇创软件', '北京', 'https://shop.zbj.com/15682682/?fr=djwy', '企业', 5000, '0.00');
INSERT INTO `zbj` VALUES (9691, 13, '晨讯科技网络有限公司', '保定', 'https://shop.zbj.com/20961271/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9692, 13, '麦可科技', '保定', 'https://shop.zbj.com/18156625/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9693, 13, '金博软件888', '保定', 'https://shop.zbj.com/15871617/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9694, 13, '网尚网络有限公司', '保定', 'https://shop.zbj.com/3043786/', '企业', 0, '4.95');
INSERT INTO `zbj` VALUES (9695, 13, '蝴蝶飞飞', '保定', 'https://shop.zbj.com/26270/', '个人', 0, '4.82');
INSERT INTO `zbj` VALUES (9696, 13, '广东嘉讯云计算科技有限公司', '东莞', 'https://shop.zbj.com/21127314/?fr=djwy', '企业', 5000, '0.00');
INSERT INTO `zbj` VALUES (9697, 13, '露雨科技', '保定', 'https://shop.zbj.com/21364166/', '个人', 500, '0.00');
INSERT INTO `zbj` VALUES (9698, 13, '微交易平台', '保定', 'https://shop.zbj.com/16634529/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9699, 13, '米饭直播', '保定', 'https://shop.zbj.com/12428455/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9700, 13, '易触即联', '保定', 'https://shop.zbj.com/13265611/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9701, 13, '有梦想的小狐狸', '保定', 'https://shop.zbj.com/21540070/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9702, 13, '美联互动', '上海', 'https://shop.zbj.com/20717907/?fr=djwy', '企业', 7000, '5.00');
INSERT INTO `zbj` VALUES (9703, 13, '大裂谷', '保定', 'https://shop.zbj.com/21736976/', '个人', 1000, '0.00');
INSERT INTO `zbj` VALUES (9704, 13, 'zozoyoyo', '保定', 'https://shop.zbj.com/12654579/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9705, 13, 'AU3脚本 平面设计', '保定', 'https://shop.zbj.com/12466193/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9706, 13, '更优质的服务', '保定', 'https://shop.zbj.com/12013290/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9707, 13, '麻雀400', '保定', 'https://shop.zbj.com/11812767/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9708, 13, '一零零一科技', '武汉', 'https://shop.zbj.com/15385787/?fr=djwy', '企业', 5000, '5.00');
INSERT INTO `zbj` VALUES (9709, 13, 'zh星魂', '保定', 'https://shop.zbj.com/10436608/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9710, 13, 'DemoHunter2014', '保定', 'https://shop.zbj.com/10227609/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9711, 13, '同心网盟', '保定', 'https://shop.zbj.com/10991667/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9712, 13, 'LinkNet企业信息化建设', '保定', 'https://shop.zbj.com/5489380/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9713, 13, '海月网络工作室', '保定', 'https://shop.zbj.com/4791332/', '个人', 0, '4.92');
INSERT INTO `zbj` VALUES (9714, 13, '起源高端设计', '保定', 'https://shop.zbj.com/7376466/', '个人', 0, '4.87');
INSERT INTO `zbj` VALUES (9715, 13, 'hejianheng88', '保定', 'https://shop.zbj.com/3360143/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9716, 13, '舞步的完美', '保定', 'https://shop.zbj.com/14363226/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9717, 13, '金博企业管理软件', '保定', 'https://shop.zbj.com/18657088/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9718, 13, '7cu', '保定', 'https://shop.zbj.com/15221653/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9719, 13, 'oceanwave1976', '保定', 'https://shop.zbj.com/14803968/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9720, 13, '子非鱼sama', '保定', 'https://shop.zbj.com/15034077/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9721, 13, 'PBDesigner', '保定', 'https://shop.zbj.com/12328352/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9722, 13, 'yejinmo', '保定', 'https://shop.zbj.com/12929521/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9723, 13, '13463231652', '保定', 'https://shop.zbj.com/12088515/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9724, 13, '红创网络', '保定', 'https://shop.zbj.com/11705655/', '个人', 0, '4.54');
INSERT INTO `zbj` VALUES (9725, 13, '源满软件工作室', '保定', 'https://shop.zbj.com/11138742/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9726, 13, 'zhu1ba0jie', '保定', 'https://shop.zbj.com/6728180/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9727, 13, '后崖工作室', '保定', 'https://shop.zbj.com/10295634/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9728, 13, 'zkimpulse', '保定', 'https://shop.zbj.com/10039682/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9729, 13, '龙辰软件', '保定', 'https://shop.zbj.com/7961573/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9730, 13, '尧帝', '保定', 'https://shop.zbj.com/6798307/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9731, 13, 'mj_beijing', '保定', 'https://shop.zbj.com/5860016/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9732, 13, '杨广慧', '保定', 'https://shop.zbj.com/5994826/', '企业', 0, '0.00');
INSERT INTO `zbj` VALUES (9733, 13, 'axdyf', '保定', 'https://shop.zbj.com/4864701/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9734, 13, '瑞杰营销', '保定', 'https://shop.zbj.com/4100300/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9735, 13, '织梦二次开发', '保定', 'https://shop.zbj.com/3329739/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9736, 13, '晶税数据', '保定', 'https://shop.zbj.com/9769570/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9737, 13, 'free小软', '保定', 'https://shop.zbj.com/8942007/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9738, 13, 'yuyebing', '保定', 'https://shop.zbj.com/1650035/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9739, 13, '华语科技', '保定', 'https://shop.zbj.com/13880621/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9740, 13, '赛扬电子', '保定', 'https://shop.zbj.com/18439480/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9741, 13, '十点x十分', '保定', 'https://shop.zbj.com/12967278/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9742, 13, 'pinbozhong', '保定', 'https://shop.zbj.com/5901208/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9743, 13, '达科电子', '保定', 'https://shop.zbj.com/8656056/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9744, 13, '辉煌尛希', '保定', 'https://shop.zbj.com/8735479/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9745, 13, 'ctsd', '保定', 'https://shop.zbj.com/9638519/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9746, 13, '战狼股票期货指标工作室', '保定', 'https://shop.zbj.com/13444095/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9747, 13, '晓风网络科技', '保定', 'https://shop.zbj.com/13430106/', '个人', 1000, '5.00');
INSERT INTO `zbj` VALUES (9748, 13, '智达电子开发', '保定', 'https://shop.zbj.com/14893220/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9749, 13, '凌卓设计', '保定', 'https://shop.zbj.com/12813197/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9750, 13, '危楼望月', '保定', 'https://shop.zbj.com/10465603/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9751, 13, '名字长了好注册', '保定', 'https://shop.zbj.com/10896360/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9752, 13, '猪小宝工作室', '保定', 'https://shop.zbj.com/7132643/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9753, 13, '旭日照四方1982', '保定', 'https://shop.zbj.com/6545327/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9754, 13, '悠哉网虫工作室', '保定', 'https://shop.zbj.com/7851686/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9755, 13, '智胜网际软件工作室', '保定', 'https://shop.zbj.com/4174449/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9756, 13, 'hanohdy', '保定', 'https://shop.zbj.com/4721287/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9757, 13, 'guoshengjunv7', '保定', 'https://shop.zbj.com/5249340/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9758, 13, '王河顺', '保定', 'https://shop.zbj.com/4267654/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9759, 13, '冷酷死神', '保定', 'https://shop.zbj.com/9221143/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9760, 13, '向着自由奔去', '保定', 'https://shop.zbj.com/8603003/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9761, 13, '李珍1021', '保定', 'https://shop.zbj.com/8791428/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9762, 13, '标标必达', '保定', 'https://shop.zbj.com/9471818/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9763, 13, '兮洛0', '保定', 'https://shop.zbj.com/8807755/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9764, 13, '那片云226', '保定', 'https://shop.zbj.com/8235149/', '个人', 0, '0.00');
INSERT INTO `zbj` VALUES (9765, 13, 'csbn211', '保定', 'https://shop.zbj.com/6418757/', '个人', 0, '5.00');
INSERT INTO `zbj` VALUES (9766, 13, '成石个人工作室', '保定', 'https://shop.zbj.com/6450171/', '个人', 0, '5.00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
