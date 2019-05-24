/*
 Navicat Premium Data Transfer

 Source Server         : 刘雪奇的库库
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : byte_easy

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 24/05/2019 23:28:38
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES (9, '软件开发', 0, '2019-05-23 15:08:55');
INSERT INTO `sort` VALUES (11, '网站开发', 3571, '2019-05-24 20:47:39');

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
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `sys_resource` VALUES (154, NULL, '爬取猪八戒信息', 1, '/admin/sort', 0, '/admin/sort', 153);

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
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `credit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信誉度',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '综合评分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7131 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zbj
-- ----------------------------
INSERT INTO `zbj` VALUES (6946, 11, '河北伟湃网络科技有限公司', '保定', 'https://shop.zbj.com/15419032/?fr=yd', '企业', '7000', '5.00');
INSERT INTO `zbj` VALUES (6947, 11, '河北雄安桃李科技有限公司', '保定', 'https://shop.zbj.com/21465026/', '企业', '4500', '0.00');
INSERT INTO `zbj` VALUES (6948, 11, '久念软件', '保定', 'https://shop.zbj.com/21706405/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (6949, 11, '保定凌众科技', '保定', 'https://shop.zbj.com/14017496/', '企业', '', '4.81');
INSERT INTO `zbj` VALUES (6950, 11, '智雅科技网络有限公司', '保定', 'https://shop.zbj.com/10521947/', '企业', '', '4.69');
INSERT INTO `zbj` VALUES (6951, 11, '志进信息科技', '上海', 'https://shop.zbj.com/14395711/?fr=djwy', '企业', '10000', '5.00');
INSERT INTO `zbj` VALUES (6952, 11, '纤羽工作室', '保定', 'https://shop.zbj.com/19802860/', '个人', '2000', '0.00');
INSERT INTO `zbj` VALUES (6953, 11, '如夏网络工作室', '保定', 'https://shop.zbj.com/685846/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (6954, 11, '小崔前端', '保定', 'https://shop.zbj.com/21537300/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (6955, 11, '小额网站相关', '保定', 'https://shop.zbj.com/19239358/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (6956, 11, 'VB软件开发定制EXCEL管理软件SSC', '保定', 'https://shop.zbj.com/2699026/', '个人', '5000', '4.95');
INSERT INTO `zbj` VALUES (6957, 11, '码谷科技', '深圳', 'https://shop.zbj.com/8641107/?fr=djwy', '企业', '12000', '5.00');
INSERT INTO `zbj` VALUES (6958, 11, '流浪的喵', '保定', 'https://shop.zbj.com/18669648/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6959, 11, '网尚网络有限公司', '保定', 'https://shop.zbj.com/3043786/', '企业', '', '4.95');
INSERT INTO `zbj` VALUES (6960, 11, '开发PHP开发', '保定', 'https://shop.zbj.com/15175254/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6961, 11, '鱼为情网络', '保定', 'https://shop.zbj.com/3539838/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6962, 11, '云浔小说系统-专注文学原创系统开发', '保定', 'https://shop.zbj.com/14145126/', '企业', '', '4.89');
INSERT INTO `zbj` VALUES (6963, 11, '聚红网络旗舰店', '保定', 'https://shop.zbj.com/17631482/', '企业', '', '5.00');
INSERT INTO `zbj` VALUES (6964, 11, '保定网商互通网络科技有限公司', '保定', 'https://shop.zbj.com/12675115/', '企业', '', '5.00');
INSERT INTO `zbj` VALUES (6965, 11, '来采网络', '保定', 'https://shop.zbj.com/2340166/', '企业', '', '5.00');
INSERT INTO `zbj` VALUES (6966, 11, 'blueseaworld', '保定', 'https://shop.zbj.com/8775581/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6967, 11, '筑梦网站开发', '保定', 'https://shop.zbj.com/13138452/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (6968, 11, '切图前端4年经验', '保定', 'https://shop.zbj.com/8211437/', '个人', '', '4.98');
INSERT INTO `zbj` VALUES (6969, 11, '海文极客', '保定', 'https://shop.zbj.com/18463135/', '企业', '', '5.00');
INSERT INTO `zbj` VALUES (6970, 11, '坊正网络', '保定', 'https://shop.zbj.com/17755769/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (6971, 11, '保定市恒江网络科技有限公司', '保定', 'https://shop.zbj.com/19680780/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (6972, 11, '创宏软件工作室', '保定', 'https://shop.zbj.com/12177140/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (6973, 11, '睿策高端包装策划', '保定', 'https://shop.zbj.com/12331439/', '个人', '', '4.78');
INSERT INTO `zbj` VALUES (6974, 11, '蜜罐大师', '保定', 'https://shop.zbj.com/13710524/', '个人', '', '4.87');
INSERT INTO `zbj` VALUES (6975, 11, '保定云上网络科技', '保定', 'https://shop.zbj.com/14108023/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (6976, 11, '北京动力网络设计', '保定', 'https://shop.zbj.com/11658393/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6977, 11, '金博软件刘颖', '保定', 'https://shop.zbj.com/10939037/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6978, 11, '鼎和工作室', '保定', 'https://shop.zbj.com/9870452/', '个人', '', '4.72');
INSERT INTO `zbj` VALUES (6979, 11, 'czhqjh_@Zbj', '保定', 'https://shop.zbj.com/8193939/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6980, 11, 'i文峰工作室', '保定', 'https://shop.zbj.com/4860178/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6981, 11, '慧狼谷企业营销策划', '保定', 'https://shop.zbj.com/14511438/', '企业', '', '4.87');
INSERT INTO `zbj` VALUES (6982, 11, '中子科技工作室', '保定', 'https://shop.zbj.com/12088851/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6983, 11, '麦可科技', '保定', 'https://shop.zbj.com/18156625/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6984, 11, '蛙塞科技', '保定', 'https://shop.zbj.com/19115235/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6985, 11, '辰凯网络', '保定', 'https://shop.zbj.com/7875891/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6986, 11, '云蛛网络科技有限公司', '保定', 'https://shop.zbj.com/8382059/', '个人', '1000', '4.83');
INSERT INTO `zbj` VALUES (6987, 11, '静宇网络', '保定', 'https://shop.zbj.com/8839963/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6988, 11, '蝴蝶飞飞', '保定', 'https://shop.zbj.com/26270/', '个人', '', '4.82');
INSERT INTO `zbj` VALUES (6989, 11, '不凑活', '保定', 'https://shop.zbj.com/17378621/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6990, 11, '倬威达软件有限公司', '保定', 'https://shop.zbj.com/14607626/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (6991, 11, '云韶工作室', '保定', 'https://shop.zbj.com/10999554/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6992, 11, 'buzhidaoyy', '保定', 'https://shop.zbj.com/5748569/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6993, 11, '飞龙测试', '保定', 'https://shop.zbj.com/21307729/', '个人', '500', '0.00');
INSERT INTO `zbj` VALUES (6994, 11, '白马网络', '保定', 'https://shop.zbj.com/17821380/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (6995, 11, '久念软件开发', '保定', 'https://shop.zbj.com/17400696/', '企业', '1000', '0.00');
INSERT INTO `zbj` VALUES (6996, 11, '孙小胖的小铺', '保定', 'https://shop.zbj.com/19742974/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (6997, 11, '米饭直播', '保定', 'https://shop.zbj.com/12428455/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (6998, 11, '福居天下网络科技', '保定', 'https://shop.zbj.com/2750129/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (6999, 11, '逅雨阁', '保定', 'https://shop.zbj.com/14102572/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (7000, 11, '点动软件', '保定', 'https://shop.zbj.com/21337688/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (7001, 11, '乐建', '保定', 'https://shop.zbj.com/21030448/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (7002, 11, '亚帝鼎科技', '保定', 'https://shop.zbj.com/18835882/', '企业', '1000', '0.00');
INSERT INTO `zbj` VALUES (7003, 11, 'okcms', '保定', 'https://shop.zbj.com/20640596/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (7004, 11, '保定保定保定', '保定', 'https://shop.zbj.com/21830177/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (7005, 11, '异度网络', '保定', 'https://shop.zbj.com/10704134/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7006, 11, '张旭乾', '保定', 'https://shop.zbj.com/5534366/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (7007, 11, '如意金铺', '保定', 'https://shop.zbj.com/4522856/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7008, 11, 'GJHGJKL', '保定', 'https://shop.zbj.com/21270150/', '个人', '1000', '0.00');
INSERT INTO `zbj` VALUES (7009, 11, '小正网站开发2年经验', '保定', 'https://shop.zbj.com/15325834/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7010, 11, '涂鸦计划', '保定', 'https://shop.zbj.com/17807506/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7011, 11, '小强网络服务工作室', '保定', 'https://shop.zbj.com/17946136/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7012, 11, '开心的店', '保定', 'https://shop.zbj.com/18182967/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7013, 11, '创宇技术', '保定', 'https://shop.zbj.com/18730403/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7014, 11, 'php小帅666', '保定', 'https://shop.zbj.com/16747937/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7015, 11, '腾骏科技', '保定', 'https://shop.zbj.com/19974117/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (7016, 11, '天津华泰科技', '保定', 'https://shop.zbj.com/17020264/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7017, 11, '石头的故事啊', '保定', 'https://shop.zbj.com/16011217/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7018, 11, 'LAMP p工作室', '保定', 'https://shop.zbj.com/12322789/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7019, 11, '专注营销力', '保定', 'https://shop.zbj.com/15245139/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7020, 11, 'laravel灬极客', '保定', 'https://shop.zbj.com/15512084/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7021, 11, '专业网站价格质量没得说', '保定', 'https://shop.zbj.com/15171308/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7022, 11, '前端myworld', '保定', 'https://shop.zbj.com/15434820/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7023, 11, '遨游互联', '保定', 'https://shop.zbj.com/14432722/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7024, 11, 'yatian9', '保定', 'https://shop.zbj.com/13264984/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7025, 11, '病乌鸦', '保定', 'https://shop.zbj.com/13377043/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7026, 11, '丹华抱一鷇音子', '保定', 'https://shop.zbj.com/12951522/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7027, 11, '云朵朵网络', '保定', 'https://shop.zbj.com/12854237/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7028, 11, 'zozoyoyo', '保定', 'https://shop.zbj.com/12654579/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7029, 11, '小黑被晒黑了', '保定', 'https://shop.zbj.com/12588562/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7030, 11, '博尚易创软件开发有限公司', '保定', 'https://shop.zbj.com/13957994/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (7031, 11, '『天玖昊利』品牌创意设计', '保定', 'https://shop.zbj.com/11952018/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7032, 11, '专业网站搭建', '保定', 'https://shop.zbj.com/11727108/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7033, 11, '五折建站', '保定', 'https://shop.zbj.com/13492722/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7034, 11, 'ly_help', '保定', 'https://shop.zbj.com/14905713/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7035, 11, '金纯.com', '保定', 'https://shop.zbj.com/14569518/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (7036, 11, '缘分统领时尚', '保定', 'https://shop.zbj.com/11715125/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7037, 11, '八号CODE', '保定', 'https://shop.zbj.com/11701086/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7038, 11, 'HTML+CSS+PHP+MYSQL', '保定', 'https://shop.zbj.com/11047095/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7039, 11, '无言小市民', '保定', 'https://shop.zbj.com/11305284/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7040, 11, '网站制作div+css网页制作', '保定', 'https://shop.zbj.com/11211685/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7041, 11, 'xiaozhao0109', '保定', 'https://shop.zbj.com/10326341/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7042, 11, '亲亲宝妮', '保定', 'https://shop.zbj.com/10618661/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7043, 11, '明智远达', '保定', 'https://shop.zbj.com/12094240/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7044, 11, 'aiyahacke', '保定', 'https://shop.zbj.com/12045930/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7045, 11, '因拓本', '保定', 'https://shop.zbj.com/11945465/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7046, 11, 'down010', '保定', 'https://shop.zbj.com/6473308/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7047, 11, 'xelloss86', '保定', 'https://shop.zbj.com/6631931/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7048, 11, 'LinkNet企业信息化建设', '保定', 'https://shop.zbj.com/5489380/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7049, 11, '小兰兰的家', '保定', 'https://shop.zbj.com/5498649/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7050, 11, '起源高端设计', '保定', 'https://shop.zbj.com/7376466/', '个人', '', '4.87');
INSERT INTO `zbj` VALUES (7051, 11, '宇腾网络', '保定', 'https://shop.zbj.com/7239266/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7052, 11, '豆腐馒头花', '保定', 'https://shop.zbj.com/5886921/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7053, 11, '追梦-000', '保定', 'https://shop.zbj.com/5516313/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7054, 11, '9507', '保定', 'https://shop.zbj.com/10168616/', '企业', '', '4.47');
INSERT INTO `zbj` VALUES (7055, 11, '三间北房', '保定', 'https://shop.zbj.com/9732708/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7056, 11, 'AirTeams', '保定', 'https://shop.zbj.com/8707503/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7057, 11, 'bdbuy', '保定', 'https://shop.zbj.com/8576470/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7058, 11, 'PS制图', '保定', 'https://shop.zbj.com/8947403/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7059, 11, '漫步云端0219', '保定', 'https://shop.zbj.com/9182309/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7060, 11, 'sain工作室', '保定', 'https://shop.zbj.com/4059529/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7061, 11, '兔子虎', '保定', 'https://shop.zbj.com/4949663/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7062, 11, '努力的小盼盼', '保定', 'https://shop.zbj.com/4313257/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7063, 11, 'whoisdr', '保定', 'https://shop.zbj.com/4780947/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7064, 11, '海月网络工作室', '保定', 'https://shop.zbj.com/4791332/', '个人', '', '4.92');
INSERT INTO `zbj` VALUES (7065, 11, '豆包炒豆芽', '保定', 'https://shop.zbj.com/1377502/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7066, 11, '暮雨晨风', '保定', 'https://shop.zbj.com/352513/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7067, 11, '墨点工作室', '保定', 'https://shop.zbj.com/4744551/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7068, 11, '心中火', '保定', 'https://shop.zbj.com/15708001/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7069, 11, 'PHP世界上__语言', '保定', 'https://shop.zbj.com/15677784/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7070, 11, '默mo小店', '保定', 'https://shop.zbj.com/14601817/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7071, 11, '云梯科技', '保定', 'https://shop.zbj.com/15046714/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (7072, 11, '子非鱼sama', '保定', 'https://shop.zbj.com/15034077/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7073, 11, '服务百分百满意', '保定', 'https://shop.zbj.com/14279670/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7074, 11, '单人丶影', '保定', 'https://shop.zbj.com/14233369/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7075, 11, '杰创Saidea', '保定', 'https://shop.zbj.com/12273802/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7076, 11, '杨义彪', '保定', 'https://shop.zbj.com/11942129/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7077, 11, '中国微积分', '保定', 'https://shop.zbj.com/11925041/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (7078, 11, 'missbbs', '保定', 'https://shop.zbj.com/11920803/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7079, 11, '绿芙', '保定', 'https://shop.zbj.com/12114734/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7080, 11, '保定市翃飏计算机信息技术服务有限公司', '保定', 'https://shop.zbj.com/18005780/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (7081, 11, '小八杂货铺', '保定', 'https://shop.zbj.com/17666972/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7082, 11, '大白科技', '保定', 'https://shop.zbj.com/18111398/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (7083, 11, '飞翔软文工作室', '保定', 'https://shop.zbj.com/12637206/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7084, 11, '红创网络', '保定', 'https://shop.zbj.com/11705655/', '个人', '', '4.54');
INSERT INTO `zbj` VALUES (7085, 11, '魔方-工作室', '保定', 'https://shop.zbj.com/11168912/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7086, 11, '三滴水network888', '保定', 'https://shop.zbj.com/10821986/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7087, 11, '做最好的自己@', '保定', 'https://shop.zbj.com/11569160/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7088, 11, '龙生2010', '保定', 'https://shop.zbj.com/11708477/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7089, 11, '陨石软件工作室', '保定', 'https://shop.zbj.com/11275028/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7090, 11, 'RaeMu', '保定', 'https://shop.zbj.com/11587288/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7091, 11, '落雪封疆', '保定', 'https://shop.zbj.com/11145019/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7092, 11, '旮旯的蛋蛋', '保定', 'https://shop.zbj.com/10481625/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7093, 11, '小猪儿不会飞', '保定', 'https://shop.zbj.com/9818448/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7094, 11, '星儿丫头', '保定', 'https://shop.zbj.com/9720225/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7095, 11, '韵龙工作室', '保定', 'https://shop.zbj.com/10261247/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7096, 11, 'MJ云途', '保定', 'https://shop.zbj.com/10131845/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7097, 11, 'qubor', '保定', 'https://shop.zbj.com/11753814/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7098, 11, '研究生创业联盟', '保定', 'https://shop.zbj.com/11745410/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7099, 11, 'bitQ', '保定', 'https://shop.zbj.com/6135884/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7100, 11, '青峰营销推广', '保定', 'https://shop.zbj.com/5287102/', '企业', '', '5.00');
INSERT INTO `zbj` VALUES (7101, 11, 'axdyf', '保定', 'https://shop.zbj.com/4864701/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7102, 11, '多彩阳光设计坊', '保定', 'https://shop.zbj.com/6028203/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7103, 11, 'yuyebing', '保定', 'https://shop.zbj.com/1650035/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7104, 11, '龙儿87', '保定', 'https://shop.zbj.com/3898529/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7105, 11, '织梦二次开发', '保定', 'https://shop.zbj.com/3329739/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7106, 11, '织梦二次开发', '保定', 'https://shop.zbj.com/3329739/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7107, 11, '小科比科比', '保定', 'https://shop.zbj.com/6548973/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7108, 11, '多彩阳光设计坊', '保定', 'https://shop.zbj.com/6028203/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7109, 11, 'bitQ', '保定', 'https://shop.zbj.com/6135884/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7110, 11, 'loveyoully', '保定', 'https://shop.zbj.com/1046756/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7111, 11, 'yuyebing', '保定', 'https://shop.zbj.com/1650035/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7112, 11, '智诚网络服务', '保定', 'https://shop.zbj.com/940007/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7113, 11, '汇官网', '保定', 'https://shop.zbj.com/18474660/', '企业', '', '0.00');
INSERT INTO `zbj` VALUES (7114, 11, 'web前端开发家', '保定', 'https://shop.zbj.com/17738976/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7115, 11, '坏波波', '保定', 'https://shop.zbj.com/17681993/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7116, 11, '懒人519', '保定', 'https://shop.zbj.com/14684694/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7117, 11, '第二杯半价吗', '保定', 'https://shop.zbj.com/14647744/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7118, 11, 'siying580', '保定', 'https://shop.zbj.com/12950918/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7119, 11, 'putishu112', '保定', 'https://shop.zbj.com/14720813/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7120, 11, '更优质的服务', '保定', 'https://shop.zbj.com/12013290/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7121, 11, 'ctsd', '保定', 'https://shop.zbj.com/9638519/', '个人', '', '5.00');
INSERT INTO `zbj` VALUES (7122, 11, '文非水镜', '保定', 'https://shop.zbj.com/6293798/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7123, 11, '易托360', '保定', 'https://shop.zbj.com/10814625/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7124, 11, '正大服务', '保定', 'https://shop.zbj.com/9415042/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7125, 11, '四海天下科技', '保定', 'https://shop.zbj.com/14317460/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7126, 11, '穿青人', '保定', 'https://shop.zbj.com/14391891/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7127, 11, '吴霸哥', '保定', 'https://shop.zbj.com/17408062/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7128, 11, '邻家小明', '保定', 'https://shop.zbj.com/15393167/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7129, 11, '悠悠公主2013', '保定', 'https://shop.zbj.com/9431593/', '个人', '', '0.00');
INSERT INTO `zbj` VALUES (7130, 11, '聆听花雨', '保定', 'https://shop.zbj.com/5810155/', '个人', '', '0.00');

SET FOREIGN_KEY_CHECKS = 1;
