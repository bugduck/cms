/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : czjszzs.cn

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 12/07/2019 17:55:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tp_ad
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad`;
CREATE TABLE `tp_ad`  (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `type_id` mediumint(8) NOT NULL COMMENT '类型ID',
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告名称',
  `image` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `thumb` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `url` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` tinyint(5) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_ad
-- ----------------------------
INSERT INTO `tp_ad` VALUES (1, 1, 'banner_1 ', '/uploads/20181225/b671c6f234a72c2e6560c63ddd9dc0ff.jpg', '/uploads/20181225/b671c6f234a72c2e6560c63ddd9dc0ff.jpg', '', '免费、开源\r\n快速、简单', 1, 1, 1541128222, 1553154525);
INSERT INTO `tp_ad` VALUES (4, 1, 'banner_2', '/uploads/20181225/25670f5712b4acfb61c5d2a1bce79225.jpg', '/uploads/20181225/25670f5712b4acfb61c5d2a1bce79225.jpg', '', 'banner_2', 2, 1, 1545719151, 1551937531);

-- ----------------------------
-- Table structure for tp_ad_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad_type`;
CREATE TABLE `tp_ad_type`  (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` tinyint(5) NULL DEFAULT NULL COMMENT '排序',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_ad_type
-- ----------------------------
INSERT INTO `tp_ad_type` VALUES (1, '【首页】顶部通栏', '导航下的焦点图', 1, 1, NULL, 1551936878);
INSERT INTO `tp_ad_type` VALUES (2, '【内页】顶部通栏', '内页顶部通栏', 2, 1, NULL, 1551936840);

-- ----------------------------
-- Table structure for tp_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '时间',
  `loginip` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态（1 正常，0 锁定）',
  `nickname` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin
-- ----------------------------
INSERT INTO `tp_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1562925237, '127.0.0.1', 1, '小二', '/uploads/20190712/33584b60a08b2ce5313e3f8f12785f85.jpg', 0, 1562923556);

-- ----------------------------
-- Table structure for tp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_log`;
CREATE TABLE `tp_admin_log`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '管理员',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_admin_log
-- ----------------------------
INSERT INTO `tp_admin_log` VALUES (1, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922614);
INSERT INTO `tp_admin_log` VALUES (2, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922614);
INSERT INTO `tp_admin_log` VALUES (3, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922617);
INSERT INTO `tp_admin_log` VALUES (4, 1, 'admin', '/admin/page/index/catid/6.html', '', '{\"catid\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922619);
INSERT INTO `tp_admin_log` VALUES (5, 1, 'admin', '/admin/page/edit/catid/6/id/2.html', '', '{\"catid\":\"6\",\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922619);
INSERT INTO `tp_admin_log` VALUES (6, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922623);
INSERT INTO `tp_admin_log` VALUES (7, 1, 'admin', '/admin/article/index/catid/8.html', '', '{\"catid\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922626);
INSERT INTO `tp_admin_log` VALUES (8, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922628);
INSERT INTO `tp_admin_log` VALUES (9, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922629);
INSERT INTO `tp_admin_log` VALUES (10, 1, 'admin', '/admin/article/edit/catid/9/id/16.html', '', '{\"catid\":\"9\",\"id\":\"16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922636);
INSERT INTO `tp_admin_log` VALUES (11, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922642);
INSERT INTO `tp_admin_log` VALUES (12, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922661);
INSERT INTO `tp_admin_log` VALUES (13, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922667);
INSERT INTO `tp_admin_log` VALUES (14, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922671);
INSERT INTO `tp_admin_log` VALUES (15, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922675);
INSERT INTO `tp_admin_log` VALUES (16, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922693);
INSERT INTO `tp_admin_log` VALUES (17, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922699);
INSERT INTO `tp_admin_log` VALUES (18, 1, 'admin', '/admin/system/email.html', '[系统设置] -> [邮箱配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922702);
INSERT INTO `tp_admin_log` VALUES (19, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922704);
INSERT INTO `tp_admin_log` VALUES (20, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922711);
INSERT INTO `tp_admin_log` VALUES (21, 1, 'admin', '/admin/auth/ruledel.html', '[权限管理] -> [菜单规则] -> [操作-删除]', '{\"id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922779);
INSERT INTO `tp_admin_log` VALUES (22, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922781);
INSERT INTO `tp_admin_log` VALUES (23, 1, 'admin', '/admin/auth/ruledel.html', '[权限管理] -> [菜单规则] -> [操作-删除]', '{\"id\":\"107\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922784);
INSERT INTO `tp_admin_log` VALUES (24, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922787);
INSERT INTO `tp_admin_log` VALUES (25, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922792);
INSERT INTO `tp_admin_log` VALUES (26, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922793);
INSERT INTO `tp_admin_log` VALUES (27, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922794);
INSERT INTO `tp_admin_log` VALUES (28, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922826);
INSERT INTO `tp_admin_log` VALUES (29, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922833);
INSERT INTO `tp_admin_log` VALUES (30, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [用户组列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922834);
INSERT INTO `tp_admin_log` VALUES (31, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922835);
INSERT INTO `tp_admin_log` VALUES (32, 1, 'admin', '/admin/admin_log/index.html', '[权限管理] -> [管理员日志]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922836);
INSERT INTO `tp_admin_log` VALUES (33, 1, 'admin', '/admin/database/database.html', '[数据库管理] -> [数据库备份]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922843);
INSERT INTO `tp_admin_log` VALUES (34, 1, 'admin', '/admin/database/optimize.html', '[数据库管理] -> [数据库备份] -> [操作-优化]', '{\"id\":\"tp_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922854);
INSERT INTO `tp_admin_log` VALUES (35, 1, 'admin', '/admin/database/database.html', '[数据库管理] -> [数据库备份]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922856);
INSERT INTO `tp_admin_log` VALUES (36, 1, 'admin', '/admin/database/restore.html', '[数据库管理] -> [还原数据库]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922862);
INSERT INTO `tp_admin_log` VALUES (37, 1, 'admin', '/admin/database/database.html', '[数据库管理] -> [数据库备份]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922866);
INSERT INTO `tp_admin_log` VALUES (38, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922875);
INSERT INTO `tp_admin_log` VALUES (39, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922878);
INSERT INTO `tp_admin_log` VALUES (40, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922880);
INSERT INTO `tp_admin_log` VALUES (41, 1, 'admin', '/admin/article/add/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922882);
INSERT INTO `tp_admin_log` VALUES (42, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922891);
INSERT INTO `tp_admin_log` VALUES (43, 1, 'admin', '/admin/link/index.html', '[网站功能] -> [友情链接]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922893);
INSERT INTO `tp_admin_log` VALUES (44, 1, 'admin', '/admin/addons/index.html', '[插件管理] -> [插件管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922897);
INSERT INTO `tp_admin_log` VALUES (45, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922901);
INSERT INTO `tp_admin_log` VALUES (46, 1, 'admin', '/admin/auth/ruledel.html', '[权限管理] -> [菜单规则] -> [操作-删除]', '{\"id\":\"109\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922980);
INSERT INTO `tp_admin_log` VALUES (47, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922982);
INSERT INTO `tp_admin_log` VALUES (48, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922983);
INSERT INTO `tp_admin_log` VALUES (49, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562922984);
INSERT INTO `tp_admin_log` VALUES (50, 1, 'admin', '/admin/template/index.html', '[模板管理] -> [模板管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923001);
INSERT INTO `tp_admin_log` VALUES (51, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923006);
INSERT INTO `tp_admin_log` VALUES (52, 1, 'admin', '/admin/auth/ruledel.html', '[权限管理] -> [菜单规则] -> [操作-删除]', '{\"id\":\"81\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923062);
INSERT INTO `tp_admin_log` VALUES (53, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923064);
INSERT INTO `tp_admin_log` VALUES (54, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923065);
INSERT INTO `tp_admin_log` VALUES (55, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923066);
INSERT INTO `tp_admin_log` VALUES (56, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923068);
INSERT INTO `tp_admin_log` VALUES (57, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923112);
INSERT INTO `tp_admin_log` VALUES (58, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923113);
INSERT INTO `tp_admin_log` VALUES (59, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923145);
INSERT INTO `tp_admin_log` VALUES (60, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923147);
INSERT INTO `tp_admin_log` VALUES (61, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923147);
INSERT INTO `tp_admin_log` VALUES (62, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923174);
INSERT INTO `tp_admin_log` VALUES (63, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923176);
INSERT INTO `tp_admin_log` VALUES (64, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923199);
INSERT INTO `tp_admin_log` VALUES (65, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923281);
INSERT INTO `tp_admin_log` VALUES (66, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923311);
INSERT INTO `tp_admin_log` VALUES (67, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923314);
INSERT INTO `tp_admin_log` VALUES (68, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923398);
INSERT INTO `tp_admin_log` VALUES (69, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923415);
INSERT INTO `tp_admin_log` VALUES (70, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923421);
INSERT INTO `tp_admin_log` VALUES (71, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923422);
INSERT INTO `tp_admin_log` VALUES (72, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923425);
INSERT INTO `tp_admin_log` VALUES (73, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923426);
INSERT INTO `tp_admin_log` VALUES (74, 1, 'admin', '/admin/database/restore.html', '[数据库管理] -> [还原数据库]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923433);
INSERT INTO `tp_admin_log` VALUES (75, 1, 'admin', '/admin/database/database.html', '[数据库管理] -> [数据库备份]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923435);
INSERT INTO `tp_admin_log` VALUES (76, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923438);
INSERT INTO `tp_admin_log` VALUES (77, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"30\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923444);
INSERT INTO `tp_admin_log` VALUES (78, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923446);
INSERT INTO `tp_admin_log` VALUES (79, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923448);
INSERT INTO `tp_admin_log` VALUES (80, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923449);
INSERT INTO `tp_admin_log` VALUES (81, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923451);
INSERT INTO `tp_admin_log` VALUES (82, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923453);
INSERT INTO `tp_admin_log` VALUES (83, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923455);
INSERT INTO `tp_admin_log` VALUES (84, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923457);
INSERT INTO `tp_admin_log` VALUES (85, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923459);
INSERT INTO `tp_admin_log` VALUES (86, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923461);
INSERT INTO `tp_admin_log` VALUES (87, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923462);
INSERT INTO `tp_admin_log` VALUES (88, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923464);
INSERT INTO `tp_admin_log` VALUES (89, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923466);
INSERT INTO `tp_admin_log` VALUES (90, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923467);
INSERT INTO `tp_admin_log` VALUES (91, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"31\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923469);
INSERT INTO `tp_admin_log` VALUES (92, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923471);
INSERT INTO `tp_admin_log` VALUES (93, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923472);
INSERT INTO `tp_admin_log` VALUES (94, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923473);
INSERT INTO `tp_admin_log` VALUES (95, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923480);
INSERT INTO `tp_admin_log` VALUES (96, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923493);
INSERT INTO `tp_admin_log` VALUES (97, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923494);
INSERT INTO `tp_admin_log` VALUES (98, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"30\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923497);
INSERT INTO `tp_admin_log` VALUES (99, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923498);
INSERT INTO `tp_admin_log` VALUES (100, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923500);
INSERT INTO `tp_admin_log` VALUES (101, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923501);
INSERT INTO `tp_admin_log` VALUES (102, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923503);
INSERT INTO `tp_admin_log` VALUES (103, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923504);
INSERT INTO `tp_admin_log` VALUES (104, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923506);
INSERT INTO `tp_admin_log` VALUES (105, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923508);
INSERT INTO `tp_admin_log` VALUES (106, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"31\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923509);
INSERT INTO `tp_admin_log` VALUES (107, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923511);
INSERT INTO `tp_admin_log` VALUES (108, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923513);
INSERT INTO `tp_admin_log` VALUES (109, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923514);
INSERT INTO `tp_admin_log` VALUES (110, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923516);
INSERT INTO `tp_admin_log` VALUES (111, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923517);
INSERT INTO `tp_admin_log` VALUES (112, 1, 'admin', '/admin/auth/ruleopen.html', '[权限管理] -> [菜单规则] -> [ 操作-是否验证]', '{\"id\":\"37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923519);
INSERT INTO `tp_admin_log` VALUES (113, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923520);
INSERT INTO `tp_admin_log` VALUES (114, 1, 'admin', '/admin/auth/rulestate.html', '[权限管理] -> [菜单规则] -> [操作-菜单状态]', '{\"id\":\"29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923523);
INSERT INTO `tp_admin_log` VALUES (115, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923524);
INSERT INTO `tp_admin_log` VALUES (116, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923527);
INSERT INTO `tp_admin_log` VALUES (117, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923528);
INSERT INTO `tp_admin_log` VALUES (118, 1, 'admin', '/admin/auth/adminedit/id/1.html', '[权限管理] -> [管理员列表] -> [操作-修改]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923544);
INSERT INTO `tp_admin_log` VALUES (119, 1, 'admin', '/admin/index/upload.html', '', '{\"id\":\"WU_FILE_0\",\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20190628145737.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Jun 28 2019 14:57:38 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"97856\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923554);
INSERT INTO `tp_admin_log` VALUES (120, 1, 'admin', '/admin/auth/adminedit.html', '[权限管理] -> [管理员列表] -> [操作-修改]', '{\"id\":\"1\",\"group_id\":\"1\",\"username\":\"admin\",\"image\":\"\\/uploads\\/20190712\\/33584b60a08b2ce5313e3f8f12785f85.jpg\",\"file\":\"\",\"nickname\":\"\\u5c0f\\u4e8c\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923556);
INSERT INTO `tp_admin_log` VALUES (121, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923558);
INSERT INTO `tp_admin_log` VALUES (122, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923574);
INSERT INTO `tp_admin_log` VALUES (123, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923575);
INSERT INTO `tp_admin_log` VALUES (124, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923605);
INSERT INTO `tp_admin_log` VALUES (125, 1, 'admin', '/admin/page/index/catid/6.html', '', '{\"catid\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923607);
INSERT INTO `tp_admin_log` VALUES (126, 1, 'admin', '/admin/page/edit/catid/6/id/2.html', '', '{\"catid\":\"6\",\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923608);
INSERT INTO `tp_admin_log` VALUES (127, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923610);
INSERT INTO `tp_admin_log` VALUES (128, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923704);
INSERT INTO `tp_admin_log` VALUES (129, 1, 'admin', '/admin/module/del.html', '[模型管理] -> [模型列表] -> [操作-删除]', '{\"id\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923711);
INSERT INTO `tp_admin_log` VALUES (130, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923712);
INSERT INTO `tp_admin_log` VALUES (131, 1, 'admin', '/admin/module/del.html', '[模型管理] -> [模型列表] -> [操作-删除]', '{\"id\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923716);
INSERT INTO `tp_admin_log` VALUES (132, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923717);
INSERT INTO `tp_admin_log` VALUES (133, 1, 'admin', '/admin/module/del.html', '[模型管理] -> [模型列表] -> [操作-删除]', '{\"id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923720);
INSERT INTO `tp_admin_log` VALUES (134, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923721);
INSERT INTO `tp_admin_log` VALUES (135, 1, 'admin', '/admin/module/del.html', '[模型管理] -> [模型列表] -> [操作-删除]', '{\"id\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923761);
INSERT INTO `tp_admin_log` VALUES (136, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923762);
INSERT INTO `tp_admin_log` VALUES (137, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923767);
INSERT INTO `tp_admin_log` VALUES (138, 1, 'admin', '/admin/module/field/id/1.html', '[模型管理] -> [模型列表] -> [模型字段]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923774);
INSERT INTO `tp_admin_log` VALUES (139, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923777);
INSERT INTO `tp_admin_log` VALUES (140, 1, 'admin', '/admin/module/field/id/26.html', '[模型管理] -> [模型列表] -> [模型字段]', '{\"id\":\"26\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923778);
INSERT INTO `tp_admin_log` VALUES (141, 1, 'admin', '/admin/module/field/id/26.html', '[模型管理] -> [模型列表] -> [模型字段]', '{\"id\":\"26\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923822);
INSERT INTO `tp_admin_log` VALUES (142, 1, 'admin', '/admin/module/fielddel.html', '[模型管理] -> [模型列表] -> [模型字段] -> [操作-删除]', '{\"id\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923827);
INSERT INTO `tp_admin_log` VALUES (143, 1, 'admin', '/admin/module/fielddel.html', '[模型管理] -> [模型列表] -> [模型字段] -> [操作-删除]', '{\"id\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923832);
INSERT INTO `tp_admin_log` VALUES (144, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923835);
INSERT INTO `tp_admin_log` VALUES (145, 1, 'admin', '/admin/module/field/id/1.html', '[模型管理] -> [模型列表] -> [模型字段]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923838);
INSERT INTO `tp_admin_log` VALUES (146, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923840);
INSERT INTO `tp_admin_log` VALUES (147, 1, 'admin', '/admin/module/field/id/26.html', '[模型管理] -> [模型列表] -> [模型字段]', '{\"id\":\"26\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923842);
INSERT INTO `tp_admin_log` VALUES (148, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923848);
INSERT INTO `tp_admin_log` VALUES (149, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923850);
INSERT INTO `tp_admin_log` VALUES (150, 1, 'admin', '/admin/module/field/id/26.html', '[模型管理] -> [模型列表] -> [模型字段]', '{\"id\":\"26\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923917);
INSERT INTO `tp_admin_log` VALUES (151, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923922);
INSERT INTO `tp_admin_log` VALUES (152, 1, 'admin', '/admin/module/field/id/26.html', '[模型管理] -> [模型列表] -> [模型字段]', '{\"id\":\"26\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923923);
INSERT INTO `tp_admin_log` VALUES (153, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923924);
INSERT INTO `tp_admin_log` VALUES (154, 1, 'admin', '/admin/category/del.html', '[栏目管理] -> [栏目列表] -> [操作-删除]', '{\"id\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923935);
INSERT INTO `tp_admin_log` VALUES (155, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923937);
INSERT INTO `tp_admin_log` VALUES (156, 1, 'admin', '/admin/category/del.html', '[栏目管理] -> [栏目列表] -> [操作-删除]', '{\"id\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923940);
INSERT INTO `tp_admin_log` VALUES (157, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923941);
INSERT INTO `tp_admin_log` VALUES (158, 1, 'admin', '/admin/category/del.html', '[栏目管理] -> [栏目列表] -> [操作-删除]', '{\"id\":\"17\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923944);
INSERT INTO `tp_admin_log` VALUES (159, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923946);
INSERT INTO `tp_admin_log` VALUES (160, 1, 'admin', '/admin/category/del.html', '[栏目管理] -> [栏目列表] -> [操作-删除]', '{\"id\":\"18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923949);
INSERT INTO `tp_admin_log` VALUES (161, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923950);
INSERT INTO `tp_admin_log` VALUES (162, 1, 'admin', '/admin/page/index/catid/6.html', '', '{\"catid\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923953);
INSERT INTO `tp_admin_log` VALUES (163, 1, 'admin', '/admin/page/edit/catid/6/id/2.html', '', '{\"catid\":\"6\",\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923954);
INSERT INTO `tp_admin_log` VALUES (164, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562923970);
INSERT INTO `tp_admin_log` VALUES (165, 1, 'admin', '/admin/page/index/catid/6.html', '', '{\"catid\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924010);
INSERT INTO `tp_admin_log` VALUES (166, 1, 'admin', '/admin/page/edit/catid/6/id/2.html', '', '{\"catid\":\"6\",\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924011);
INSERT INTO `tp_admin_log` VALUES (167, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924014);
INSERT INTO `tp_admin_log` VALUES (168, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924017);
INSERT INTO `tp_admin_log` VALUES (169, 1, 'admin', '/admin/page/index/catid/6.html', '', '{\"catid\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924019);
INSERT INTO `tp_admin_log` VALUES (170, 1, 'admin', '/admin/page/edit/catid/6/id/2.html', '', '{\"catid\":\"6\",\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924020);
INSERT INTO `tp_admin_log` VALUES (171, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924025);
INSERT INTO `tp_admin_log` VALUES (172, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924028);
INSERT INTO `tp_admin_log` VALUES (173, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924035);
INSERT INTO `tp_admin_log` VALUES (174, 1, 'admin', '/admin/article/index/catid/8.html', '', '{\"catid\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924075);
INSERT INTO `tp_admin_log` VALUES (175, 1, 'admin', '/admin/article/index/catid/8.html', '', '{\"catid\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924206);
INSERT INTO `tp_admin_log` VALUES (176, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924209);
INSERT INTO `tp_admin_log` VALUES (177, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924209);
INSERT INTO `tp_admin_log` VALUES (178, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924211);
INSERT INTO `tp_admin_log` VALUES (179, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924213);
INSERT INTO `tp_admin_log` VALUES (180, 1, 'admin', '/admin/article/index/catid/13.html', '', '{\"catid\":\"13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924215);
INSERT INTO `tp_admin_log` VALUES (181, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924234);
INSERT INTO `tp_admin_log` VALUES (182, 1, 'admin', '/admin/message/index/catid/19.html', '', '{\"catid\":\"19\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924236);
INSERT INTO `tp_admin_log` VALUES (183, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924238);
INSERT INTO `tp_admin_log` VALUES (184, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924243);
INSERT INTO `tp_admin_log` VALUES (185, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924257);
INSERT INTO `tp_admin_log` VALUES (186, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924259);
INSERT INTO `tp_admin_log` VALUES (187, 1, 'admin', '/admin/article/add/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924262);
INSERT INTO `tp_admin_log` VALUES (188, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924409);
INSERT INTO `tp_admin_log` VALUES (189, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924420);
INSERT INTO `tp_admin_log` VALUES (190, 1, 'admin', '/admin/category/add/id/6/moduleid/1.html', '[栏目管理] -> [栏目列表] -> [操作-添加]', '{\"id\":\"6\",\"moduleid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924427);
INSERT INTO `tp_admin_log` VALUES (191, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924447);
INSERT INTO `tp_admin_log` VALUES (192, 1, 'admin', '/admin/page/index/catid/6.html', '', '{\"catid\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924448);
INSERT INTO `tp_admin_log` VALUES (193, 1, 'admin', '/admin/page/edit/catid/6/id/2.html', '', '{\"catid\":\"6\",\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924449);
INSERT INTO `tp_admin_log` VALUES (194, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924453);
INSERT INTO `tp_admin_log` VALUES (195, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924507);
INSERT INTO `tp_admin_log` VALUES (196, 1, 'admin', '/admin/article/index/catid/8.html', '', '{\"catid\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924582);
INSERT INTO `tp_admin_log` VALUES (197, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924588);
INSERT INTO `tp_admin_log` VALUES (198, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924590);
INSERT INTO `tp_admin_log` VALUES (199, 1, 'admin', '/admin/article/add/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924593);
INSERT INTO `tp_admin_log` VALUES (200, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924599);
INSERT INTO `tp_admin_log` VALUES (201, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924601);
INSERT INTO `tp_admin_log` VALUES (202, 1, 'admin', '/admin/link/index.html', '[网站功能] -> [友情链接]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924642);
INSERT INTO `tp_admin_log` VALUES (203, 1, 'admin', '/admin/ad/index.html', '[网站功能] -> [ 广告管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924645);
INSERT INTO `tp_admin_log` VALUES (204, 1, 'admin', '/admin/ad_type/index.html', '[网站功能] -> [广告位管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562924646);
INSERT INTO `tp_admin_log` VALUES (205, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925082);
INSERT INTO `tp_admin_log` VALUES (206, 1, 'admin', '/admin/article/index/catid/8.html', '', '{\"catid\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925084);
INSERT INTO `tp_admin_log` VALUES (207, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925086);
INSERT INTO `tp_admin_log` VALUES (208, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925087);
INSERT INTO `tp_admin_log` VALUES (209, 1, 'admin', '/admin/article/add/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925090);
INSERT INTO `tp_admin_log` VALUES (210, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925093);
INSERT INTO `tp_admin_log` VALUES (211, 1, 'admin', '/admin/article/edit/catid/9/id/16.html', '', '{\"catid\":\"9\",\"id\":\"16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925094);
INSERT INTO `tp_admin_log` VALUES (212, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925101);
INSERT INTO `tp_admin_log` VALUES (213, 1, 'admin', '/admin/article/add/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925102);
INSERT INTO `tp_admin_log` VALUES (214, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925112);
INSERT INTO `tp_admin_log` VALUES (215, 1, 'admin', '/admin/article/edit/catid/9/id/16.html', '', '{\"catid\":\"9\",\"id\":\"16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925118);
INSERT INTO `tp_admin_log` VALUES (216, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925125);
INSERT INTO `tp_admin_log` VALUES (217, 1, 'admin', '/admin/article/del.html', '', '{\"id\":\"16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925174);
INSERT INTO `tp_admin_log` VALUES (218, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925176);
INSERT INTO `tp_admin_log` VALUES (219, 1, 'admin', '/admin/article/edit/catid/9/id/15.html', '', '{\"catid\":\"9\",\"id\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925179);
INSERT INTO `tp_admin_log` VALUES (220, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925181);
INSERT INTO `tp_admin_log` VALUES (221, 1, 'admin', '/admin/article/index/catid/9.html?page=2', '', '{\"page\":\"2\",\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925182);
INSERT INTO `tp_admin_log` VALUES (222, 1, 'admin', '/admin/article/index/catid/9.html?page=1', '', '{\"page\":\"1\",\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925184);
INSERT INTO `tp_admin_log` VALUES (223, 1, 'admin', '/admin/article/index/catid/9.html?title=%E5%AD%A6%E4%B9%A0', '', '{\"title\":\"\\u5b66\\u4e60\",\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925199);
INSERT INTO `tp_admin_log` VALUES (224, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925203);
INSERT INTO `tp_admin_log` VALUES (225, 1, 'admin', '/admin/article/edit/catid/9/id/15.html', '', '{\"catid\":\"9\",\"id\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925205);
INSERT INTO `tp_admin_log` VALUES (226, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925207);
INSERT INTO `tp_admin_log` VALUES (227, 1, 'admin', '/admin/article/add/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925209);
INSERT INTO `tp_admin_log` VALUES (228, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925225);
INSERT INTO `tp_admin_log` VALUES (229, 1, 'admin', '/admin/index/index.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925238);
INSERT INTO `tp_admin_log` VALUES (230, 1, 'admin', '/admin/index/main.html', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925239);
INSERT INTO `tp_admin_log` VALUES (231, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925240);
INSERT INTO `tp_admin_log` VALUES (232, 1, 'admin', '/admin/article/index/catid/8.html', '', '{\"catid\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925242);
INSERT INTO `tp_admin_log` VALUES (233, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925244);
INSERT INTO `tp_admin_log` VALUES (234, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925246);
INSERT INTO `tp_admin_log` VALUES (235, 1, 'admin', '/admin/article/edit/catid/9/id/15.html', '', '{\"catid\":\"9\",\"id\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925247);
INSERT INTO `tp_admin_log` VALUES (236, 1, 'admin', '/admin/article/index/catid/9.html', '', '{\"catid\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925249);
INSERT INTO `tp_admin_log` VALUES (237, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925250);
INSERT INTO `tp_admin_log` VALUES (238, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925252);
INSERT INTO `tp_admin_log` VALUES (239, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925254);
INSERT INTO `tp_admin_log` VALUES (240, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [用户组列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925255);
INSERT INTO `tp_admin_log` VALUES (241, 1, 'admin', '/admin/category/index.html', '[栏目管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925263);
INSERT INTO `tp_admin_log` VALUES (242, 1, 'admin', '/admin/link/index.html', '[网站功能] -> [友情链接]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925265);
INSERT INTO `tp_admin_log` VALUES (243, 1, 'admin', '/admin/ad/index.html', '[网站功能] -> [ 广告管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925267);
INSERT INTO `tp_admin_log` VALUES (244, 1, 'admin', '/admin/template/index.html', '[模板管理] -> [模板管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925270);
INSERT INTO `tp_admin_log` VALUES (245, 1, 'admin', '/admin/template/edit/file/article_list.html/type/html.html', '[模板管理] -> [模板管理] -> [操作-修改]', '{\"file\":\"article_list.html\",\"type\":\"html\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925279);
INSERT INTO `tp_admin_log` VALUES (246, 1, 'admin', '/admin/template/index.html', '[模板管理] -> [模板管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925287);
INSERT INTO `tp_admin_log` VALUES (247, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1562925289);

-- ----------------------------
-- Table structure for tp_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `catid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `template` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Admin' COMMENT '作者',
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '摘要',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '点击次数',
  `image` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`id`, `status`, `sort`) USING BTREE,
  INDEX `catid`(`id`, `catid`, `status`) USING BTREE,
  INDEX `sort`(`id`, `catid`, `status`, `sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES (5, 9, 'PHP是什么', '', '', '', '<p>PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。</p><p>用PHP做出的动态页面与其他的编程语言相比，PHP是将程序嵌入到HTML（标准通用标记语言下的一个应用）文档中去执行，执行效率比完全生成HTML标记的CGI要高许多；PHP还可以执行编译后代码，编译可以达到加密和优化代码运行，使代码运行更快。</p><p>全球市场分析</p><p>目前PHP在全球网页市场、手机网页市场还有为手机提供API（程序接口）排名第一。</p><p>在中国微信开发大量使用PHP来进行开发。</p><p>北京、上海的用人需求</p><p style=\"text-align: center;\">上海2016年11月份中某一天用人低峰的招聘量：</p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20181224/1545620471.png\" title=\"1545620471.png\" alt=\"2.png\"/></p><p><br/></p><p style=\"text-align: center;\">北京2016年11月份中某一天用人低峰的招聘量：</p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20181224/1545620478.png\" title=\"1545620478.png\" alt=\"1.png\"/></p>', '', 1, 100, 1540451280, 0, '未知', 'PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。', 100, '');
INSERT INTO `tp_article` VALUES (4, 9, '为什么学习PHP？', '', '', '', '<p>回答本书的几个问题吧。你到底，为什么要学习PHP？</p><p>全国都缺PHP人才，非常好就业，PHP现在的工资水平很高，刚毕业可以拿到5000-9000每个月，特别优秀还可以破万。并且有非常多的就业机会。</p><p>PHP入门简单，学习入门易入手。</p><p>很多人反馈上完大学的C语言课程、java课程不会写任何东西。<br/>诚然，中国的大学都以C语言作为主要的入门语言。但是，我们认为PHP是最简单入门，也是最合适入门的语言。</p><p>你将学习到编程的思路，更加程序化的去处理问题。处理问题，将会更加规范化。</p><p>如果你要创业，如果你要与互联网人沟通。未来互联网、移动互联网、信息化将会进一步围绕在你身边。你需要与人沟通，与人打交道。</p><p>还有机会进入BAT（百度、阿里、腾讯），BAT这些企业他们在用PHP。国内和国外超一线的互联网公司，在超过90%在使用PHP来做手机API或者是网站。连微信等开放平台中的公众号的服务端也可以使用到PHP。</p><p>大并发，还能免费。一天1个亿的访问量怎么办？PHP拥有大量优秀的开发者，在一定数据量的情况下完全能满足你的需求。国内外一线的互联网公司，很多将自己的大并发方案进行开源了。你可以免费获得很多成熟的、免费的、开源的大并发解决方案。</p><p>开源更加节约成本也更加安全。windows很多都要收取授权费用，而使用linux的LAMP架构或者LNMP架构会更加安全。全球的黑客在帮你找漏洞。全球的工程师在帮忙修复漏洞。你发现一个他人已经消灭10个。</p>', '', 1, 100, 1539850020, 0, '未知', '回答本书的几个问题吧。你到底，为什么要学习PHP？\r\n全国都缺PHP人才，非常好就业，PHP现在的工资水平很高，刚毕业可以拿到5000-9000每个月，特别优秀还可以破万。并且有非常多的就业机会。', 100, '');
INSERT INTO `tp_article` VALUES (6, 9, '零基础也能学习', '', '', '', '<p>学习PHP前很多人担心PHP是不是能真的学会。</p><p>学习PHP学历要求不高，数学水平要求也不高，只需要会下面这些，你就可以跟着PHP中文网，开始愉快、高薪的PHP学习之旅：</p><p>有一台电脑</p><p>初中及以上文化水平</p><p>必须会打字（五笔、拼音均可）</p><p>会word（微软的office办公软件中的文字编辑软件）</p><p>会上网（QQ，写邮件，玩微信，看小说，看电影，注册网站帐号，网上购物等）</p><p>有一颗坚持的心</p><p>如果会一点html就更好了.学习HTML可以去看我们开源的另外一本HTML入门书籍。</p><p>不会HTML怎么办？也可以学习我们免费的HTML入门视频。</p>', '', 1, 100, 1540452240, 0, '未知', '学习PHP前很多人担心PHP是不是能真的学会。\r\n\r\n学习PHP学历要求不高，数学水平要求也不高，只需要会下面这些，你就可以跟着PHP中文网，开始愉快、高薪的PHP学习之旅：\r\n有一台电脑', 100, '');
INSERT INTO `tp_article` VALUES (7, 9, '为什么有些人学不会', '', '', '', '<p>互联网进入到人们生活中的方方面面了，世界首富比尔盖茨多次提到青少年编程，而编程是一种思维习惯的转化。</p><p>作为写了10几年程序的人，我听到过一些说编程不好学的抱怨。</p><p>从目前见到的数据统计，主要是因为在大学学习时遇到了C语言，学完后还不知道能干什么。很多人大学上完也就这么糊涂、恐惧的就过来了。</p><p>只有很少的不到1%的人学不会，这部份往往是专业的艺术家，在艺术家里面极少一部份人外，他们的思维模式和我们遇到的大多数人不太一样，并且不进行编程思维的训练，所以学不会。</p><p>而造成这个原因主要是因为社会、文化、背景、生活圈子多方面造成的。而不是因为笨。</p><p>那我们绝大多数的人是哪些原因学不会的呢？</p><p>1. 不相信自己能学会</p><p>这一块很多人可能不相信，涉及到很深的心理学知识。与心理暗示、诅咒的原理一样。</p><p>如果不相信自己能够学好，心里潜意识的念头里如果总是：PHP很难，我学不会。那么这个人肯定很难学会。</p><p>把不相信自己能学会的负面情绪和观念给抛掉。</p><p>只要你每天练习代码并相信自己。你肯定能学会，并且能学得很好，代码写的很成功，成为大牛！</p><p>2. 懒</p><p>人的天性有善有恶，而学不好程序的人，身上的一个通病，只有一个字就是————懒！<br/>基本语法，需要去背<br/>函数需要去默写</p><p>3. 自以为是</p><p>一看就会，一写就错。以为自己是神童。</p><p>4. 英文单词</p><p>计算机里面常用的英文单词就那么一些。</p><p>不要找英语的借口。本书会把英语单词都会跟你标注出来。看到不会的，就去翻一翻。</p><p>5. 不坚持</p><p>学着学着就放弃了。</p><p>6. 不去提问，不会提问，不去思考</p><p>解决问题前，先去搜索</p><p>搜索解决不了再去提问</p><p>PHP学院为大家准备了视频，也为大家准备了问答中心。</p><p>大多数的人，不把问题详述清楚，不把错误代码贴完整。</p><p>张嘴就来提问。我想神仙也不知道你的问题是什么吧？问题发出来前。换位思考一下自己看不看得懂这个问题。</p><p>7. 你还需要自我鼓励</p><p>在学习过程中，你会否定自己。其实任何人都会。大多数人都会遇到跟你一样的困难。只不过他们在克服困难，而一些人在逃避困难。</p><p>学累的时候，放松一会儿。再去多读几遍。不断的告诉自己，你就是最棒的！</p><p>学会交流和倾诉而非抱怨，并且不断的自我鼓励</p>', '', 1, 100, 1540452720, 0, '未知', '互联网进入到人们生活中的方方面面了，世界首富比尔盖茨多次提到青少年编程，而编程是一种思维习惯的转化。\r\n作为写了10几年程序的人，我听到过一些说编程不好学的抱怨。', 100, '');
INSERT INTO `tp_article` VALUES (8, 9, '开发环境是什么？', '', '', '', '<p>PHP是一门开发语言。而开发语言写出来的代码，通常需要在指定的软件下才能运行。因此，我们写好的代码需要（运行）显示出来看到，就需要安装这几个软件来运行代码。</p><p>我们把运行我们写代码的几个软件和运行代码的软件统一都可称为开发环境。</p><p>新手学习前常遇到的环境问题</p><p>很多朋友最开始学习的时候，听说某个环境好就安装某些软件。由于缺乏相关知识，所以没有主见。陷入人云即云的怪圈里。今天换这个，明天换那个。</p><p>当前验证真理的唯一标准，请始终保证一点：</p><p>环境能满足你的学习需求。不要在环境上面反复纠结，耽误宝贵的学习时间。</p><p>我们认为环境只要能满足学习要求即可。等学会了后，再去着磨一些更加复杂的互联网线上的、生产环境中的具体配置。</p>', '', 1, 100, 1540605000, 0, '未知', 'PHP是一门开发语言。而开发语言写出来的代码，通常需要在指定的软件下才能运行。因此，我们写好的代码需要（运行）显示出来看到，就需要安装这几个软件来运行代码。', 100, '');
INSERT INTO `tp_article` VALUES (9, 9, 'windows环境安装', '', '', '', '<p>所谓服务器：不要把它想的太过于高深，不过就是提供一项特殊功能（服务）的电脑而已。</p><p>显示网页的叫网页(web)服务器（server）。</p><p>帮我们代为收发电子邮件(Email)的服务器叫邮件服务器。</p><p>帮我们把各个游戏玩家连接在一起的叫游戏服务器。</p><p>帮我们存储数据的叫数据库服务器</p><p>... ...等等</p><p>我们现在使用的一部手机的性能比10年前的一台电脑和服务器的性能还要强劲、给力。</p><p>而我们的学习过程当中完全可以把自己使用的这一台windows电脑作为服务器来使用。</p><p>原来如此，一讲就通了吧？</p><p>我们大多数人使用的电脑通常是windows操作系统的电脑。而我们的讲解主要在windows电脑上进行。</p><p>你不需要去理解所谓高深的电脑知识、操作系统原型等。在这一章节当中，你只需要会安装QQ、杀毒软件一样，点击：下一步、下一步即可完成本章的学习。</p><p>在最开始学习时，我们强烈建议初学者使用集成环境包进行安装。</p><p>什么是集成环境包？</p><p>我们学习PHP要安装的东西有很多。例如：网页服务器、数据库服务器和PHP语言核心的解释器。</p><p>我们可以分开安装各部份，也可以合在一起安装一个集成好的软件。</p><p>将这些合在一起的一个软件我们就叫作：集成环境包。</p><p>这个过程需要修改很多配置文件才能完成。并且每个人的电脑情况，权限，经常容易操作出错。</p><p>很容易因为环境问题影响到心情，我们的学习计划在初期非常绝对化：</p><p>请使用集成环境包完成最开始的学习。</p><p>等你学好PHP NB后，你爱用啥用啥，网上成堆的文章教你配置各种环境。</p><p>选用什么样的集成环境包？</p><p>集成环境包比较多。以下的这些全是各种英文名。只不过代表的是不同集成环境包的名字，不用去深纠。如下所示：</p><p>AppServ</p><p>PHPStudy</p><p>APMserv</p><p>XAMPP</p><p>WAMPServer<br/>... ...等等</p><p>对于我们才入门的学习者来说，选择集成环境包的原则：</p><p>更新快，版本比较新</p><p>操作简单易于上手</p><p>选择项不要过多</p><p>因此，我们下面使用的集成环境包是：PHPstudy。当然，如果你对此块很熟悉了，也可以自行选择选择集成环境包。</p><p>可以以在官方网址下载：<br/>http://www.phpstudy.net/&nbsp;</p><p>也可以在百度中搜索：*PHPstudy *&nbsp;&nbsp;这个5个字文字母进行下载。</p><p>对学习PHP的新手来说，WINDOWS下PHP环境配置是一件很困难的事，就是老手也是一件烦琐的事。因此，无论你是新手还是老手，phpStudy 2016都是一个不错的选择，该程序集成Apache+PHP+MySQL+phpMyAdmin+ZendOptimizer，最新版本已集成最新的&nbsp;PHP7。</p>', '', 1, 100, 1544593260, 0, '未知', '所谓服务器：不要把它想的太过于高深，不过就是提供一项特殊功能（服务）的电脑而已。\r\n显示网页的叫网页(web)服务器（server）。', 100, '');
INSERT INTO `tp_article` VALUES (13, 9, 'php中的变量－读过初中你就会变量', '', '', '', '<p>大家在读初中的时候呀。老师经常会这么教大家。</p><p>请问，李磊和韩梅梅同学，假如：</p><p>x&nbsp;=&nbsp;5<br/>y&nbsp;=&nbsp;6<br/></p><p>那么x + y 等于多少呢？大家会义无反顾的回答。x + y 等于11。</p><p>接下来我们看下面的初中的数学知识，请问x + y 的结果是多少？</p><p>x&nbsp;=&nbsp;5<br/>y&nbsp;=&nbsp;6<br/>x&nbsp;＝&nbsp;8<br/></p><p>我估计大家也会义无反顾的回答：x + y 的结果为14。</p><p>这就是变量！</p><p>变量的几个特点：</p><p>1.x = 5 将右边值5，赋值给左边的x</p><p>2.第二段x ＝ 8，最后x + y 的结果等于14，说明x在从上到下的运算（执行）中，可以被重新赋值。</p><p>我们在PHP中的变量也是如此。不过有几个特点：</p><p>1.必须要以$开始。如变量x必须要写成$x</p><p>2.变量的首字母不能以数字开始</p><p>3.变量的名字区分大小写</p><p>4.变量不要用特殊符号、中文，_不算特殊符号</p><p>5.变量命名要有意义（别写xxx，aaa，ccc这种 变量名）</p><p>错误举列：</p><p>错误：变量以数字开始</p><p>&lt;?php<br/>$123&nbsp;=&nbsp;345;<br/>?&gt;<br/></p><p>错误：变量中有特殊字符，中文</p><p>&lt;?php<br/>//$a*d&nbsp;=&nbsp;345;<br/><br/>//$中国&nbsp;=&nbsp;123;<br/>?&gt;<br/></p><p>错误：变量命名没有意义aaa容易数错，也没有含意</p><p>&lt;?php<br/>$aaaaaaa&nbsp;=&nbsp;345;<br/>?&gt;<br/></p><p>错误：变量严格区分大小写 $dog 和 $Dog是PHP学院的变量,尝试将$dog的值改为8.结果D写成了大写。</p><p>&lt;?php<br/>$dog&nbsp;=&nbsp;5;<br/>//重新修改$dog的值，将$dog改为8<br/>$Dog&nbsp;=&nbsp;8;<br/>?&gt;<br/></p><p>正确举例：</p><p>正确：变量不能以数字开始,但是数字可以夹在变量名中间和结尾</p><p>&lt;?php<br/>$iphone6&nbsp;=&nbsp;5880;<br/>$iphone6plus&nbsp;=&nbsp;6088;<br/>?&gt;<br/></p><p>正确：变量不能有特殊符号，但是_(下划线不算特殊符号)</p><p>&lt;?php<br/>$_cup&nbsp;=&nbsp;123;<br/>?&gt;<br/></p><p>注：你会发现代码是从上向下执行的。</p><p>$ 叫作美元符，英文单词：dollar。PHP的变量必须以美元符开始。说明搞PHP有“钱”途。</p><p>dollar<br/>读音：[&#39;dɒlə(r)]<br/>解释：美元</p><p><br/></p>', '', 1, 100, 1545620940, 0, '未知', '大家在读初中的时候呀。老师经常会这么教大家。\r\n请问，李磊和韩梅梅同学，假如：', 100, '');
INSERT INTO `tp_article` VALUES (10, 9, 'Linux环境安装', '', '', '', '<p>这一个章节是本书中永远不会写的一个章节，很多人被一些市面上的书籍误导，认为学习PHP前要学习Linux。结果，一看Linux，就对人生和学习失去了希望。我们作为有过10年以上开发经验和内部训经验的专业人士告戒各位：</p><p>Linux学习与PHP学习没有必然的联系，这是两个不同的知识体系。</p><p>作为有多年开发经验和教学经验的我们。</p><p>我们强烈不建议没有接触过Linux的学生，为了学习PHP而去安装Linux环境</p><p>如果您有经验，我们相信你一定能解决，如果解决不了。</p><p>请加QQ群和访问官网：PHP中文网&nbsp;学习视频和提问。</p>', '', 1, 100, 1545620820, 0, '未知', '这一个章节是本书中永远不会写的一个章节，很多人被一些市面上的书籍误导，认为学习PHP前要学习Linux。结果，一看Linux，就对人生和学习失去了希望。我们作为有过10年以上开发经验和内部训经验的专业人士告戒各位：', 100, '');
INSERT INTO `tp_article` VALUES (11, 9, '其他开发环境', '', '', '', '<p>对本章不感兴趣，可以略过，只是介绍和说明。</p><p>其他开发环境有很多：</p><p>1，比如 苹果电脑的系统 Mac os</p><p>2，比如 &nbsp;在线环境（你使用了百度、新浪、阿里等云计算环境）</p><p>3，其他更多... ...</p><p>当然，你甚至可以使用安卓手机和苹果手机来部署你的开发环境。就像有些人可以在各种复杂的环境，甚至U衣酷的试衣间里M..L。我想，这应该不是正常人类该进行的尝试吧。</p><p>如果你在使用这些环境遇到了问题，相信你已经有过一定的开发经验和处理问题的经验了，这不是刚开始学习编程该掌握的内容。</p><p>但是，如果你真遇到了这些问题。你可以上PHP中文网来提问。</p>', '', 1, 100, 1545620880, 0, '未知', '对本章不感兴趣，可以略过，只是介绍和说明。\r\n其他开发环境有很多：\r\n1，比如 苹果电脑的系统 Mac os\r\n2，比如  在线环境（你使用了百度、新浪、阿里等云计算环境）\r\n3，其他更多... ...', 100, '');
INSERT INTO `tp_article` VALUES (12, 9, '写代码的工具选择', '', '', '', '<p>写代码的工具有很多。对于刚开始学习PHP的朋友来说。选择工具有几个原则：</p><p>1，不要使用带自动提示的工具（例如eclipse、zend studio等PHP开发工具集）</p><p>2，写完的代码必须要有颜色高亮显示。（不能使用：txt文本编辑器等无代码颜色显示的编辑器）</p><p>你可能想问，为什么呀？</p><p>我们发现电视、电影和现实生活中的编程高手，噼里哗啦就写一堆代码，一点都不报错，点击就能运行。而我们对着他们的代码抄袭反倒抄错。这种感觉特别不好！！！</p><p>——传说中的这些高手，他们都曾经在基础代码上反复练习过，所以他们不会写错。</p><p>而我们需要高手之境界，在学习初期就不能使用先进的工具。这样会浪费我们保贵的练习代码的机会、调试错误的机会。</p><p>因为先进的编辑器通常有很多先进的功能，例如：</p><p>代码自动显示错误</p><p>代码自动换行</p><p>这些先进的工具，对于开始入门学习的你，不利于新手产生独立解决问题的能力！</p><p>推荐的开发工具</p><p>1. NotePad++&nbsp;</p><p>https://notepad-plus-plus.org/&nbsp;由于某些不可抗的原因，请使用百度搜索NotePad++&nbsp;</p><p>2.phpstorm（强烈推荐）</p><p>https://www.jetbrains.com/phpstorm/&nbsp;</p><p>这些工具，你只需要下载下来，一直点击下一步，安装到你的电脑上即可。</p>', '', 1, 100, 1545620880, 0, '未知', '写代码的工具有很多。对于刚开始学习PHP的朋友来说。选择工具有几个原则：\r\n1，不要使用带自动提示的工具（例如eclipse、zend studio等PHP开发工具集）\r\n2，写完的代码必须要有颜色高亮显示。（不能使用：txt文本编辑器等无代码颜色显示的编辑器）', 100, '');
INSERT INTO `tp_article` VALUES (14, 9, 'echo 显示命令', '', '', '', '<p>echo 是在PHP里面最常用的一个输出、显示功能的命令。</p><p>我们可以让他显示任何可见的字符。</p><p>&lt;?php<br/><br/>echo&nbsp;123;<br/><br/>?&gt;<br/>&lt;?php<br/><br/>$iphone&nbsp;=&nbsp;6088;<br/><br/>echo&nbsp;$iphone;<br/><br/>?&gt;<br/></p><p>你可以对着做做实验。等下一章，我们讲数据类型的时候，我教大家输出中文和用PHP显示网页内容。</p><p>单词：</p><p>*echo *&nbsp;读音： [&#39;ekoʊ]<br/>解释：发出回声；回响。<br/>功能解释：输出、显示</p>', '', 1, 100, 1545621000, 0, '未知', 'echo 是在PHP里面最常用的一个输出、显示功能的命令。\r\n我们可以让他显示任何可见的字符。', 100, '');
INSERT INTO `tp_article` VALUES (15, 9, 'php注释的学习', '', '', '', '<p>注释的功能很强大</p><p>所谓注释，汉语解释可以为：注解。更为准确一些。<br/>因为代码是英文的、并且代码很长，时间长了人会忘。<br/>所以我们会加上注释。</p><p>注释的功能有很多：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.对重点进行标注</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2.时间长了容易忘快速回忆，方便查找</p><p>&nbsp;&nbsp;&nbsp;&nbsp;3.让其他人看的时候快速看懂</p><p>&nbsp;&nbsp;&nbsp;&nbsp;4.还可以生成文档，代码写完相关的文档就写完了，提高工作效率</p><p>&nbsp;&nbsp;&nbsp;&nbsp;5.注释、空行、回车之后的代码看起来更优美</p><p>&nbsp;&nbsp;&nbsp;&nbsp;6.注释可用来排错。不确定代码中哪一块写错了，可以将一大段注释，确定错误区间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;7.注释中间的部份的内容，电脑不会执行它</p><p>先给大家看看我们觉得优美的代码，整齐、规范、说明清楚、一看就懂。（不需要理解代码的含义）：</p><p><br/></p><p>再看看我们眼中觉得丑陋的代码，对齐丑陋不说，并且没有功能说明（不需要理解代码的含义）：</p><p><br/></p><p>我们了解了注释的好处，接下来我们来说PHP的注释，注释分别：</p><p>单行注释（只注释一行）</p><p>多行注释（注释多行）</p><p>单行注释</p><p>//&nbsp;&nbsp;&nbsp;表示单行注释<br/>#&nbsp;&nbsp;&nbsp;&nbsp;#号也表示单行注释，用的比较少<br/></p><p>多行注释</p><p>/*&nbsp;<br/>多行注释&nbsp;这里是注释区域代码<br/>&nbsp;*/<br/></p><p>单行注释举例：</p><p>&lt;?php<br/><br/>//声明一部iphone6手机的价格变量<br/>$iphone6_price&nbsp;=&nbsp;6088;<br/><br/>//显示输出手机价格<br/>echo&nbsp;$iphone6_price;<br/>?&gt;<br/></p><p>注：通过上例我们知道，注释通常写代码上面。</p><p>多行注释举例：</p><p>&lt;?php<br/>/*<br/>作者：PHP中文网<br/>时间：2048.12.23<br/>功能：这是一个假的多行注释的例子<br/>*/<br/><br/>/*<br/>&nbsp;&nbsp;声明一个爱情变量<br/>&nbsp;&nbsp;$love&nbsp;是指爱情<br/>&nbsp;&nbsp;爱情是一个变量，因为人的爱总是在发生变化<br/>&nbsp;&nbsp;所以，爱情变量的值为250<br/>*/<br/>$love&nbsp;=&nbsp;250;<br/><br/>?&gt;<br/></p><p>注：通过上面的例子我们发现，我们要写上很多注释的时候，释用多行注释。</p><p>注：暂进不讲解如何通过专门的工具生成注释</p><p><br/></p>', '', 1, 100, 1545621060, 0, '', '注释的功能很强大\r\n所谓注释，汉语解释可以为：注解。更为准确一些。\r\n因为代码是英文的、并且代码很长，时间长了人会忘。', 100, '');
INSERT INTO `tp_article` VALUES (17, 13, 'PHP中的流程控制', '', '', '', '<p>流程控制就是人类社会的做事和思考和处理问题的方式和方法。通过本章，你将会发现采用计算机的思维去考虑问题，我们在做事的过程当中会更加严谨。</p><p>我们通过一个一个的场景来去推理流程：</p><p>有一个高富帅，他姓王。他的名字叫——王。王同学计划要投资一个项目。如果这个项目计划开始，为了这个投资项目每周往返一次北京和大连。什么时候王思总同学不再往返呢？项目失败后或者万（da）集团临时除知除外，他就可以不再这么每周往返了。</p><p>王同学呢，有一个好习惯，就是每次往返的时候，害怕自己到底一年往返了多少次。王同学都会在自己的记事本上记上往返的次数，第一次就写上一，第2次就写上2... ...直至最后项目停止。</p><p>王同学家里头特别有钱，所以他的行程方式和正常人的又有些不同。不仅有更多的方式，而且王同学还迷信。</p><p>他的出行方式呢有6种，如下：</p><p>1，司机开车<br/>2，民航<br/>3，自己家的专机<br/>4，火车动车<br/>5，骑马<br/>6，游轮</p><p>每次王同学，都自己会在骰子上写上1，2，3，4，5，6。摇到哪种方式，王同学就会采用哪种方式进行往返两地。</p><p>并且呢，王同学是生活极度充满娱乐化和享受生活的人。他抵达北京或者大连的时候不同，他抵达后做的事情都不同，如下：</p><p>半夜到达，先去夜店参加假面舞会<br/>早上抵达，爱在酒店泡个澡<br/>中午到达，会吃上一份神户牛肉<br/>晚上到达，总爱去找朋友去述说一下心中的寂寞</p><p>王同学在出行和项目中也是极度有计划性。他给自己的生活秘书和工作秘书分别指派了出差的行程：</p><p>生活上：<br/>先查天气，下雨带雨具和毛巾。不下雨要带防晒霜<br/>雨具、毛巾和防晒霜的情况要提前检查，如果没有要及时买</p><p>工作上：<br/>要提前沟通去大连前的工作计划，准备好了要及时检查，检查合格，要提前打印现来。<br/>及时没有及时准备好的情况下，要列出主要的项目沟通议题。</p>', '', 1, 100, 1545628260, 0, '未知', '流程控制就是人类社会的做事和思考和处理问题的方式和方法。通过本章，你将会发现采用计算机的思维去考虑问题，我们在做事的过程当中会更加严谨。我们通过一个一个的场景来去推理流程：', 100, '');
INSERT INTO `tp_article` VALUES (18, 13, 'php流程控制之if条件结构流程', '', '', '', '<p>if条件结构流程</p><p>if和else 语句，在之前的3.2.5章节中已经做了说明。我们配合王思总同学的例子，再次进行说明，方便大家对此章节的理解。</p><p>本章的知识点为：【默写级】</p><p>基本语法，不能有半点马乎，完全是语法规范规定的，不这么写就错！</p><p>&lt;?php&nbsp;<br/>$week=date(&quot;4&quot;);<br/>//判断星期小于6，则输出：还没到周末，继续上班.....<br/>if&nbsp;($week&lt;&quot;6&quot;)&nbsp;{<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&quot;还没到周末，继续上班.....&quot;;<br/>}&nbsp;<br/>?&gt;<br/></p><p>在之前我们也讲过，因此if的结构可以根据人类思维推理出来两种结构：</p><p>//if单行判断<br/>if(布尔值判断)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;只写一句话;<br/>后续代码<br/>//if多行判断<br/>if(布尔值判断){<br/>&nbsp;&nbsp;&nbsp;&nbsp;可以写多句话;<br/>}<br/>后续代码<br/></p><p><br/></p>', '', 1, 100, 1545628260, 0, '未知', 'if条件结构流程\r\nif和else 语句，在之前的3.2.5章节中已经做了说明。我们配合王思总同学的例子，再次进行说明，方便大家对此章节的理解。\r\n本章的知识点为：【默写级】', 100, '');
INSERT INTO `tp_article` VALUES (19, 13, 'PHP流程控制之if语句', '', '', '', '<p>我们为了加强大家对代码的理解，我们串了一个故事恶搞了一个王思总同学。</p><p>在4.1和3.2.5这两个章节中我们都介绍到了if和if...else结构。并且我们讲解的很清楚。</p><p>我们现在来用if...else结构来写一个小东西，加强大家对逻辑的理解。</p><p>我们配合之前的知识点来写一个计算器：</p><p>&lt;form&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;num1&quot;&gt;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;select&nbsp;name=&quot;fh&quot;&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;jia&quot;&gt;&nbsp;+&nbsp;&lt;/option&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;jian&quot;&gt;&nbsp;-&nbsp;&lt;/option&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;c&quot;&gt;&nbsp;x&nbsp;&lt;/option&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;chu&quot;&gt;&nbsp;/&nbsp;&lt;/option&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;qy&quot;&gt;&nbsp;%&nbsp;&lt;/option&gt;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/select&gt;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;num2&quot;&gt;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;submit&quot;&nbsp;value=&quot;运算&quot;&nbsp;/&gt;<br/><br/><br/>&lt;/form&gt;<br/><br/>&lt;?php<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;$num1&nbsp;=&nbsp;$_GET[&#39;num1&#39;];<br/>&nbsp;&nbsp;&nbsp;&nbsp;$num2&nbsp;=&nbsp;$_GET[&#39;num2&#39;];<br/>&nbsp;&nbsp;&nbsp;&nbsp;$fh&nbsp;=&nbsp;$_GET[&#39;fh&#39;];<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;if(!is_numeric($num1)&nbsp;||&nbsp;!is_numeric($num2)){<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;请输入数值类型&#39;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh&nbsp;==&nbsp;&#39;jia&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;+&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1+$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh==&#39;jian&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;-&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1-$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh==&#39;c&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;x&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1*$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh==&#39;chu&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;/&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1/$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh==&#39;qy&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;%&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1%$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/><br/>?&gt;<br/></p><p>作业：<br/>写一个平年、闰年计算器。写一个form表单，通过get将年份给传来过来，判断传进来的年份是否为数值类型。并且要求，如果是闰年就提示这是闰年，如果是平年就提示这一年是平年。</p><p>平年闰年规则：年份能被4整除，但是不能被100整除。 &nbsp;或者能被400整除，即为闰年，其他情况全为平年</p>', '', 1, 100, 1545628320, 0, '未知', '我们为了加强大家对代码的理解，我们串了一个故事恶搞了一个王思总同学。\r\n在4.1和3.2.5这两个章节中我们都介绍到了if和if...else结构。并且我们讲解的很清楚。\r\n我们现在来用if...else结构来写一个小东西，加强大家对逻辑的理解。', 100, '');
INSERT INTO `tp_article` VALUES (20, 13, 'PHP流程控制之嵌套if...else...elseif结构', '', '', '', '<p>还记得本章开篇我们讲了一个王思总同学的例子：</p><p>王同学是生活极度充满娱乐化和享受生活的人。他抵达北京或者大连的时候做的事，他抵达后做的事情，如下：</p><p>半夜到达，先去夜店参加假面舞会<br/>&nbsp;早上抵达，爱在酒店泡个澡<br/>&nbsp;中午到达，会吃上一份神户牛肉<br/>&nbsp;晚上到达，总爱去找朋友去述说一下心中的寂寞</p><p>我们来了解一下他的语法规则【知识点要求：默写】</p><p>&lt;?php<br/>if（判断语句1）{<br/>&nbsp;&nbsp;&nbsp;&nbsp;执行语句体1<br/>}elseif(判断语句2){<br/>&nbsp;&nbsp;&nbsp;&nbsp;执行语句体2<br/>}else&nbsp;if(判断语句n){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;执行语句体n<br/>}else{<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最后的else语句可选<br/>}<br/><br/>//后续代码<br/>?&gt;<br/></p><p>上述结构表示：<br/>如果判断语句1的值为真，则执行语句体 1。执行完成后进入后续代码段。<br/>否则转入后面的判断语句2（elsif），判断语句2若为真，则执行语句体 2。<br/>否则转入后面的判断语句n（elsif），判断语句2若为真，则执行语句体 n。<br/>如果均不匹配则执行else语句。这种循环嵌套可以不含else语句，即只含有if、elseif语句。</p><p>注：elseif()也可以写成else if()</p><p>我们把上面的代码用流程图的形式表示清楚就如下图了：<br/></p><p>我们可以把王思总同学的例子通过PHP代码表示出来，代码表示结果如下：</p><p>&lt;?php<br/>//定义一个随机变量，抵达时间,随机0点至23点<br/>$dida&nbsp;=&nbsp;rand(0,23);<br/><br/>if($dida&nbsp;&gt;&nbsp;6&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;&nbsp;10){<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;我爱泡澡&#39;;<br/>}else&nbsp;if($dida&nbsp;&gt;10&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;&nbsp;14){<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;吃神户牛肉&#39;;<br/>}else&nbsp;if($dida&nbsp;&gt;=19&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;&nbsp;22){<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;找一个朋友聊聊内心的寂寞&#39;;<br/>}elseif($dida&nbsp;&gt;&nbsp;22&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;=&nbsp;23){<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;泡澡&#39;;<br/><br/>}elseif($dida&nbsp;&gt;=&nbsp;1&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;3){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;泡澡&#39;;<br/>}else{<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;睡觉或者工作&#39;;<br/>}<br/><br/><br/>?&gt;<br/></p><p>作业：<br/>写一个网页cj.html，向panduan.php页面以post方式提交分数段。分数段和显示的结果如下，要求如下：</p><p>0----60以下，不及格</p><p>60---70及格了，要努力</p><p>70---80 &nbsp;还不错</p><p>80---90 &nbsp; 上清华有希望</p><p>90---100 &nbsp; 你这辈子没希望了</p><p>100 &nbsp; &nbsp; &nbsp; &nbsp; 更没希望了</p><p>100分以上 &nbsp; &nbsp;爱因斯坦转世啊，思密达！</p><p>不是一个数值类型或者小于0 &nbsp;请输入正确的分数。</p>', '', 1, 100, 1545628380, 0, '未知', '还记得本章开篇我们讲了一个王思总同学的例子：\r\n王同学是生活极度充满娱乐化和享受生活的人。他抵达北京或者大连的时候做的事，他抵达后做的事情，如下：\r\n半夜到达，先去夜店参加假面舞会', 100, '');

-- ----------------------------
-- Table structure for tp_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_group`;
CREATE TABLE `tp_auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '时间',
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_auth_group
-- ----------------------------
INSERT INTO `tp_auth_group` VALUES (1, '超级管理员', 1, '0,1,4,5,38,6,7,10,11,12,14,13,8,15,16,17,18,19,20,21,9,22,23,24,25,28,27,26,29,3', 0, 1537944508);
INSERT INTO `tp_auth_group` VALUES (5, '测试组', 1, '0,1,4,5,107,6,152,153,154,155,29,30,34,32,33,31,35,36,39,40,41,42,44,45,46,47,48,49,51,52,53,54,57,58,59,60,61,62,63,64,67,68,70,71,74,73,69,76,77,137,80,95,96,97,131,132,109,138,139,140,141,143,110,111,113,117,118,100,101,102,103,105,81,82,84,85,88,94,83,89,91,120,121,', 1536304526, 1553848122);

-- ----------------------------
-- Table structure for tp_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_group_access`;
CREATE TABLE `tp_auth_group_access`  (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tp_auth_group_access
-- ----------------------------
INSERT INTO `tp_auth_group_access` VALUES (1, 1, 0, 1562923556);
INSERT INTO `tp_auth_group_access` VALUES (12, 1, 1536456218, 1536467724);
INSERT INTO `tp_auth_group_access` VALUES (13, 1, 1536467738, 1536468155);
INSERT INTO `tp_auth_group_access` VALUES (14, 1, 1536468227, 1536468284);

-- ----------------------------
-- Table structure for tp_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_rule`;
CREATE TABLE `tp_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) NOT NULL DEFAULT 0 COMMENT '父栏目ID',
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort` mediumint(8) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `auth_open` tinyint(2) NULL DEFAULT 1,
  `icon` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tp_auth_rule
-- ----------------------------
INSERT INTO `tp_auth_rule` VALUES (1, 0, 'System', '系统设置', 1, 1, '', 1, 0, 1536819134, 1, 'fa fa-cogs');
INSERT INTO `tp_auth_rule` VALUES (4, 1, 'System/system', '系统设置', 1, 1, '', 11, 1536327129, 1547520976, 1, 'fa fa-cog');
INSERT INTO `tp_auth_rule` VALUES (6, 0, 'Auth', '权限管理', 1, 1, '', 2, 1536327468, 1547520856, 1, 'fa fa-group');
INSERT INTO `tp_auth_rule` VALUES (7, 6, 'Auth/adminList', '管理员列表', 1, 1, '', 21, 1536327753, 1547523425, 1, 'fa fa-user');
INSERT INTO `tp_auth_rule` VALUES (8, 6, 'Auth/adminGroup', '用户组列表', 1, 1, '', 22, 1536327787, 1547520881, 1, 'fa fa-group');
INSERT INTO `tp_auth_rule` VALUES (9, 6, 'Auth/adminRule', '菜单规则', 1, 1, '', 23, 1536327826, 1547520923, 1, 'fa fa-bars');
INSERT INTO `tp_auth_rule` VALUES (10, 7, 'Auth/adminAdd', '操作-添加', 1, 1, '', 211, 1536327882, 1536327952, 1, '');
INSERT INTO `tp_auth_rule` VALUES (11, 7, 'Auth/adminEdit', '操作-修改', 1, 1, '', 212, 1536327906, 1536327955, 1, '');
INSERT INTO `tp_auth_rule` VALUES (12, 7, 'Auth/adminDel', '操作-删除', 1, 1, '', 213, 1536327924, 1536327959, 1, '');
INSERT INTO `tp_auth_rule` VALUES (13, 7, 'Auth/adminState', '操作-状态', 1, 1, '', 215, 1536327944, 1536328025, 1, '');
INSERT INTO `tp_auth_rule` VALUES (14, 7, 'Auth/adminSelectDel', '操作-批量删除', 1, 1, '', 214, 1536328014, 1536328028, 1, '');
INSERT INTO `tp_auth_rule` VALUES (15, 8, 'Auth/groupAdd', '操作-添加', 1, 1, '', 221, 1536329901, 1536329910, 1, '');
INSERT INTO `tp_auth_rule` VALUES (16, 8, 'Auth/groupEdit', '操作-修改', 1, 1, '', 222, 1536329944, 1536329944, 1, '');
INSERT INTO `tp_auth_rule` VALUES (17, 8, 'Auth/groupDel', ' 操作-删除', 1, 1, '', 223, 1536329962, 1536329986, 1, '');
INSERT INTO `tp_auth_rule` VALUES (18, 8, 'Auth/groupSelectDel', '操作-批量删除', 1, 1, '', 224, 1536330024, 1536330033, 1, '');
INSERT INTO `tp_auth_rule` VALUES (19, 8, 'Auth/groupState', '操作-状态', 1, 1, '', 225, 1536330069, 1536330069, 1, '');
INSERT INTO `tp_auth_rule` VALUES (20, 8, 'Auth/groupAccess', '操作-权限', 1, 1, '', 226, 1536330111, 1536330111, 1, '');
INSERT INTO `tp_auth_rule` VALUES (21, 8, 'Auth/groupRunaccess', '操作-保存权限', 1, 1, '', 227, 1536330174, 1536330179, 1, '');
INSERT INTO `tp_auth_rule` VALUES (22, 9, 'Auth/ruleAdd', '操作-添加', 1, 1, '', 231, 1536330209, 1536330455, 1, '');
INSERT INTO `tp_auth_rule` VALUES (23, 9, 'Auth/ruleEdit', '操作-修改', 1, 1, '', 232, 1536330222, 1536330462, 1, '');
INSERT INTO `tp_auth_rule` VALUES (24, 9, 'Auth/ruleDel', '操作-删除', 1, 1, '', 233, 1536330236, 1536330463, 1, '');
INSERT INTO `tp_auth_rule` VALUES (25, 9, 'Auth/ruleSelectDel', '操作-批量删除', 1, 1, '', 234, 1536330261, 1536330465, 1, '');
INSERT INTO `tp_auth_rule` VALUES (26, 9, 'Auth/ruleState', '操作-菜单状态', 1, 1, '', 237, 1536330275, 1536330933, 1, '');
INSERT INTO `tp_auth_rule` VALUES (27, 9, 'Auth/ruleOpen', ' 操作-是否验证', 1, 1, '', 236, 1536330318, 1536330480, 1, '');
INSERT INTO `tp_auth_rule` VALUES (28, 9, 'Auth/ruleSort', '操作-排序', 1, 1, '', 235, 1536330434, 1536330478, 1, '');
INSERT INTO `tp_auth_rule` VALUES (29, 0, 'Database', '数据库管理', 1, 0, '', 3, 1536635655, 1562923523, 1, 'fa fa-database');
INSERT INTO `tp_auth_rule` VALUES (30, 29, 'Database/database', '数据库备份', 1, 1, '', 31, 1536635724, 1562923497, 1, '');
INSERT INTO `tp_auth_rule` VALUES (31, 29, 'Database/restore', '还原数据库', 1, 1, '', 32, 1536635740, 1562923509, 1, '');
INSERT INTO `tp_auth_rule` VALUES (32, 30, 'Database/repair', '操作-修复', 1, 1, '', 311, 1536635767, 1562923503, 1, '');
INSERT INTO `tp_auth_rule` VALUES (33, 30, 'Database/optimize', '操作-优化', 1, 1, '', 312, 1536635780, 1562923506, 1, '');
INSERT INTO `tp_auth_rule` VALUES (34, 30, 'Database/backup', '操作-备份', 1, 1, '', 50, 1536635798, 1562923500, 1, '');
INSERT INTO `tp_auth_rule` VALUES (35, 31, 'Database/import', '操作-还原', 1, 1, '', 321, 1536635831, 1562923513, 1, '');
INSERT INTO `tp_auth_rule` VALUES (36, 31, 'Database/downFile', '操作-下载', 1, 1, '', 322, 1536635860, 1562923516, 1, '');
INSERT INTO `tp_auth_rule` VALUES (37, 31, 'Database/delSqlFiles', '操作-删除', 1, 1, '', 323, 1536635871, 1562923519, 1, '');
INSERT INTO `tp_auth_rule` VALUES (38, 5, 'System/trySend', '操作-测试邮件发送', 1, 1, '', 122, 1536653622, 1551863852, 1, '');
INSERT INTO `tp_auth_rule` VALUES (39, 0, 'Module', '模型管理', 1, 1, '', 4, 1536806647, 1536807712, 1, 'fa fa-th-list');
INSERT INTO `tp_auth_rule` VALUES (40, 39, 'Module/index', '模型列表', 1, 1, '', 41, 1536806669, 1536806669, 1, '');
INSERT INTO `tp_auth_rule` VALUES (41, 40, 'Module/add', '操作-添加', 1, 1, '', 411, 1536806738, 1536806738, 1, '');
INSERT INTO `tp_auth_rule` VALUES (42, 40, 'Module/edit', '操作-修改', 1, 1, '', 413, 1536806774, 1553760852, 1, '');
INSERT INTO `tp_auth_rule` VALUES (43, 40, 'Module/del', '操作-删除', 1, 1, '', 415, 1536806788, 1553760858, 1, '');
INSERT INTO `tp_auth_rule` VALUES (44, 40, 'Module/moduleState', '操作-状态', 1, 1, '', 416, 1536806809, 1553760862, 1, '');
INSERT INTO `tp_auth_rule` VALUES (45, 40, 'Module/field', '模型字段', 1, 1, '', 417, 1536806827, 1553760866, 1, '');
INSERT INTO `tp_auth_rule` VALUES (46, 45, 'Module/fieldAdd', '操作-添加', 1, 1, '', 4171, 1536806876, 1553761041, 1, '');
INSERT INTO `tp_auth_rule` VALUES (47, 45, 'Module/fieldEdit', '操作-修改', 1, 1, '', 4173, 1536806894, 1553761048, 1, '');
INSERT INTO `tp_auth_rule` VALUES (48, 45, 'Module/listOrder', '操作-排序', 1, 1, '', 4175, 1536806907, 1553761056, 1, '');
INSERT INTO `tp_auth_rule` VALUES (49, 45, 'Module/fieldStatus', '操作-状态', 1, 1, '', 4176, 1536806921, 1553761059, 1, '');
INSERT INTO `tp_auth_rule` VALUES (50, 45, 'Module/fieldDel', '操作-删除', 1, 1, '', 4177, 1536806938, 1553761061, 1, '');
INSERT INTO `tp_auth_rule` VALUES (51, 0, 'Category', '栏目管理', 1, 1, '', 5, 1537932344, 1537932720, 1, 'fa fa-th');
INSERT INTO `tp_auth_rule` VALUES (52, 51, 'Category/index', '栏目列表', 1, 1, '', 51, 1537932760, 1537932760, 1, '');
INSERT INTO `tp_auth_rule` VALUES (53, 52, 'Category/add', '操作-添加', 1, 1, '', 511, 1537932869, 1537932869, 1, '');
INSERT INTO `tp_auth_rule` VALUES (54, 52, 'Category/edit', '操作-修改', 1, 1, '', 513, 1537932909, 1553760586, 1, '');
INSERT INTO `tp_auth_rule` VALUES (55, 52, 'Category/del', '操作-删除', 1, 1, '', 515, 1537932950, 1553760595, 1, '');
INSERT INTO `tp_auth_rule` VALUES (56, 52, 'Category/selectDel', '操作-批量删除', 1, 1, '', 516, 1537932981, 1553760597, 1, '');
INSERT INTO `tp_auth_rule` VALUES (57, 52, 'Category/sort', '操作-排序', 1, 1, '', 517, 1537933010, 1553760598, 1, '');
INSERT INTO `tp_auth_rule` VALUES (58, 52, 'Category/isMenu', '操作-导航显示', 1, 1, '', 518, 1537933076, 1553760602, 1, '');
INSERT INTO `tp_auth_rule` VALUES (59, 52, 'Category/isNext', '操作-跳转下级', 1, 1, '', 519, 1537933111, 1553760603, 1, '');
INSERT INTO `tp_auth_rule` VALUES (60, 0, 'Function', '网站功能', 1, 1, '', 6, 1540965627, 1540966350, 1, 'fa fa-gear');
INSERT INTO `tp_auth_rule` VALUES (61, 60, 'Link/index', '友情链接', 1, 1, '', 61, 1540966407, 1540966418, 1, '');
INSERT INTO `tp_auth_rule` VALUES (62, 61, 'Link/add', '操作-添加', 1, 1, '', 611, 1540966465, 1540966465, 1, '');
INSERT INTO `tp_auth_rule` VALUES (63, 61, 'Link/edit', '操作-修改', 1, 1, '', 613, 1540966488, 1551929946, 1, '');
INSERT INTO `tp_auth_rule` VALUES (64, 61, 'Link/state', '操作-状态', 1, 1, '', 615, 1540966534, 1551930026, 1, '');
INSERT INTO `tp_auth_rule` VALUES (65, 61, 'Link/del', '操作-删除', 1, 1, '', 616, 1540966564, 1551930029, 1, '');
INSERT INTO `tp_auth_rule` VALUES (66, 61, 'Link/selectDel', '操作-批量删除', 1, 1, '', 617, 1540966605, 1551930033, 1, '');
INSERT INTO `tp_auth_rule` VALUES (67, 61, 'Link/sort', '操作-排序', 1, 1, '', 616, 1540967631, 1540967631, 1, '');
INSERT INTO `tp_auth_rule` VALUES (68, 60, 'Ad/index', ' 广告管理', 1, 1, '', 62, 1541120280, 1551936480, 1, '');
INSERT INTO `tp_auth_rule` VALUES (69, 60, 'AdType/index', '广告位管理', 1, 1, '', 63, 1541120316, 1551936598, 1, '');
INSERT INTO `tp_auth_rule` VALUES (70, 68, 'Ad/add', '操作-添加', 1, 1, '', 621, 1541120344, 1551936492, 1, '');
INSERT INTO `tp_auth_rule` VALUES (71, 68, 'Ad/edit', '操作-修改', 1, 1, '', 623, 1541120377, 1551936511, 1, '');
INSERT INTO `tp_auth_rule` VALUES (72, 68, 'Ad/del', '操作-删除', 1, 1, '', 625, 1541120423, 1551936530, 1, '');
INSERT INTO `tp_auth_rule` VALUES (73, 68, 'Ad/sort', '操作-排序', 1, 1, '', 628, 1541120532, 1551936356, 1, '');
INSERT INTO `tp_auth_rule` VALUES (74, 68, 'Ad/state', '操作-状态', 1, 1, '', 627, 1541120573, 1551936544, 1, '');
INSERT INTO `tp_auth_rule` VALUES (75, 68, 'Ad/selectDel', '操作-批量删除', 1, 1, '', 626, 1541120586, 1551936538, 1, '');
INSERT INTO `tp_auth_rule` VALUES (76, 69, 'AdType/add', '操作-添加', 1, 1, '', 631, 1541120670, 1551936612, 1, '');
INSERT INTO `tp_auth_rule` VALUES (77, 69, 'AdType/edit', '操作-修改', 1, 1, '', 633, 1541120703, 1551936647, 1, '');
INSERT INTO `tp_auth_rule` VALUES (78, 69, 'AdType/del', '操作-删除', 1, 1, '', 635, 1541120724, 1551936721, 1, '');
INSERT INTO `tp_auth_rule` VALUES (79, 69, 'AdType/selectDel', '操作-批量删除', 1, 1, '', 636, 1541120754, 1551936734, 1, '');
INSERT INTO `tp_auth_rule` VALUES (80, 69, 'AdType/sort', '操作-排序', 1, 1, '', 638, 1541120809, 1551936816, 1, '');
INSERT INTO `tp_auth_rule` VALUES (82, 81, 'Users/index', '会员列表', 1, 1, '', 91, 1541399506, 1551774272, 1, '');
INSERT INTO `tp_auth_rule` VALUES (83, 81, 'UsersType/index', '会员组', 1, 1, '', 92, 1541399529, 1551835915, 1, '');
INSERT INTO `tp_auth_rule` VALUES (84, 82, 'Users/add', '操作-添加', 1, 1, '', 911, 1541399593, 1551774275, 1, '');
INSERT INTO `tp_auth_rule` VALUES (85, 82, 'Users/edit', '操作-修改', 1, 1, '', 913, 1541399618, 1551849024, 1, '');
INSERT INTO `tp_auth_rule` VALUES (86, 82, 'Users/del', '操作-删除', 1, 1, '', 915, 1541399639, 1551849072, 1, '');
INSERT INTO `tp_auth_rule` VALUES (87, 82, 'Users/selectDel', '操作-批量删除', 1, 1, '', 916, 1541399652, 1551849077, 1, '');
INSERT INTO `tp_auth_rule` VALUES (88, 82, 'Users/state', '操作-状态', 1, 1, '', 915, 1541399712, 1551774281, 1, '');
INSERT INTO `tp_auth_rule` VALUES (89, 83, 'UsersType/add	', '操作-添加', 1, 1, '', 921, 1541399760, 1551835957, 1, '');
INSERT INTO `tp_auth_rule` VALUES (90, 83, 'UsersType/addPost', '操作-添加保存', 1, 1, '', 922, 1541399771, 1551835996, 1, '');
INSERT INTO `tp_auth_rule` VALUES (91, 83, 'UsersType/edit', '操作-修改', 1, 1, '', 923, 1541399787, 1551836024, 1, '');
INSERT INTO `tp_auth_rule` VALUES (92, 83, 'UsersType/editPost', '操作-修改保存', 1, 1, '', 924, 1541399799, 1551836049, 1, '');
INSERT INTO `tp_auth_rule` VALUES (93, 83, 'UsersType/del', '操作-删除', 1, 1, '', 925, 1541399809, 1551836070, 1, '');
INSERT INTO `tp_auth_rule` VALUES (94, 82, 'Users/download', '操作-下载', 1, 1, '', 917, 1541482111, 1551849111, 1, '');
INSERT INTO `tp_auth_rule` VALUES (95, 60, 'Debris/index', '碎片管理', 1, 1, '', 64, 1545728477, 1545728477, 1, '');
INSERT INTO `tp_auth_rule` VALUES (96, 95, 'Debris/add', '操作-添加', 1, 1, '', 641, 1545728513, 1545728513, 1, '');
INSERT INTO `tp_auth_rule` VALUES (97, 95, 'Debris/edit', '  操作-修改', 1, 1, '', 643, 1545728548, 1551930413, 1, '');
INSERT INTO `tp_auth_rule` VALUES (98, 95, 'Debris/del', '操作-删除', 1, 1, '', 645, 1545728564, 1551930402, 1, '');
INSERT INTO `tp_auth_rule` VALUES (99, 95, 'Debris/selectDel', '操作-批量删除', 1, 1, '', 646, 1545728706, 1551930405, 1, '');
INSERT INTO `tp_auth_rule` VALUES (100, 0, 'Template', '模板管理', 1, 1, '', 8, 1545898118, 1551774253, 1, 'fa fa-code');
INSERT INTO `tp_auth_rule` VALUES (101, 100, 'Template/index', '模板管理', 1, 1, '', 81, 1545898150, 1551774256, 1, '');
INSERT INTO `tp_auth_rule` VALUES (102, 101, 'Template/add', '  操作-添加', 1, 1, '', 811, 1545898173, 1553760044, 1, '');
INSERT INTO `tp_auth_rule` VALUES (103, 101, 'Template/edit', '操作-修改', 1, 1, '', 813, 1545898195, 1553760052, 1, '');
INSERT INTO `tp_auth_rule` VALUES (104, 101, 'Template/delete', '操作-删除', 1, 1, '', 815, 1545898234, 1553760059, 1, '');
INSERT INTO `tp_auth_rule` VALUES (105, 101, 'Template/img', '媒体文件-列表', 1, 1, '', 816, 1545962259, 1553760061, 1, '');
INSERT INTO `tp_auth_rule` VALUES (106, 101, 'Template/imgDel', '媒体文件-删除', 1, 1, '', 817, 1545962287, 1553760065, 1, '');
INSERT INTO `tp_auth_rule` VALUES (108, 107, 'System/trySms', '操作-测试短信发送', 1, 1, '', 132, 1548401007, 1551864103, 1, '');
INSERT INTO `tp_auth_rule` VALUES (110, 109, 'Hooks/index', '钩子管理', 1, 1, '', 72, 1551774594, 1551774594, 1, '');
INSERT INTO `tp_auth_rule` VALUES (111, 110, 'Hooks/add', '操作-添加', 1, 1, '', 721, 1551774664, 1551774664, 1, '');
INSERT INTO `tp_auth_rule` VALUES (112, 110, 'Hooks/addPost', '操作-添加保存', 1, 1, '', 722, 1551774677, 1551774677, 1, '');
INSERT INTO `tp_auth_rule` VALUES (113, 110, 'Hooks/edit', '操作-修改', 1, 1, '', 723, 1551774690, 1551774690, 1, '');
INSERT INTO `tp_auth_rule` VALUES (114, 110, 'Hooks/editPost', '操作-修改保存', 1, 1, '', 724, 1551774707, 1551774707, 1, '');
INSERT INTO `tp_auth_rule` VALUES (115, 110, 'Hooks/del', '操作-删除', 1, 1, '', 725, 1551774721, 1551774721, 1, '');
INSERT INTO `tp_auth_rule` VALUES (116, 110, 'Hooks/selectDel', '操作-批量删除', 1, 1, '', 726, 1551774734, 1551774734, 1, '');
INSERT INTO `tp_auth_rule` VALUES (117, 110, 'Hooks/sort', '操作-排序', 1, 1, '', 727, 1551774749, 1551774749, 1, '');
INSERT INTO `tp_auth_rule` VALUES (118, 110, 'Hooks/state', '操作-状态', 1, 1, '', 728, 1551774814, 1551774814, 1, '');
INSERT INTO `tp_auth_rule` VALUES (119, 83, 'UsersType/selectDel', '操作-批量删除', 1, 1, '', 926, 1551836092, 1551836092, 1, '');
INSERT INTO `tp_auth_rule` VALUES (120, 83, 'UsersType/sort', '操作-排序', 1, 1, '', 927, 1551836104, 1551836104, 1, '');
INSERT INTO `tp_auth_rule` VALUES (121, 83, 'UsersType/state', '操作-状态', 1, 1, '', 928, 1551836132, 1551836132, 1, '');
INSERT INTO `tp_auth_rule` VALUES (122, 82, 'Users/addPost', '操作-添加保存', 1, 1, '', 912, 1551848993, 1551848993, 1, '');
INSERT INTO `tp_auth_rule` VALUES (123, 82, 'Users/editPost', '操作-修改保存', 1, 1, '', 914, 1551849010, 1551849040, 1, '');
INSERT INTO `tp_auth_rule` VALUES (124, 4, 'System/systemPost', '操作-修改保存', 1, 1, '', 111, 1551863272, 1551863272, 1, '');
INSERT INTO `tp_auth_rule` VALUES (125, 5, 'System/emailPost', '操作-修改保存', 1, 1, '', 121, 1551863826, 1551863826, 1, '');
INSERT INTO `tp_auth_rule` VALUES (126, 107, 'System/smsPost', '操作-修改保存', 1, 1, '', 131, 1551864090, 1551864090, 1, '');
INSERT INTO `tp_auth_rule` VALUES (127, 61, 'Link/addPost', '操作-添加保存', 1, 1, '', 612, 1551929778, 1551929778, 1, '');
INSERT INTO `tp_auth_rule` VALUES (128, 61, 'Link/editPost', '操作-修改保存', 1, 1, '', 614, 1551930004, 1551930017, 1, '');
INSERT INTO `tp_auth_rule` VALUES (129, 95, 'Debris/addPost', '操作-添加保存', 1, 1, '', 642, 1551930385, 1551930385, 1, '');
INSERT INTO `tp_auth_rule` VALUES (130, 95, 'Debris/editPost', '操作-修改保存', 1, 1, '', 644, 1551930435, 1551930435, 1, '');
INSERT INTO `tp_auth_rule` VALUES (131, 95, 'Debris/sort', '操作-排序', 1, 1, '', 647, 1551930477, 1551930477, 1, '');
INSERT INTO `tp_auth_rule` VALUES (132, 95, 'Debris/state', '操作-状态', 1, 1, '', 648, 1551930531, 1551930531, 1, '');
INSERT INTO `tp_auth_rule` VALUES (133, 68, 'Ad/addPost', '操作-添加保存', 1, 1, '', 622, 1551936291, 1551936504, 1, '');
INSERT INTO `tp_auth_rule` VALUES (134, 68, 'Ad/editPost', '操作-修改保存', 1, 1, '', 624, 1551936330, 1551936518, 1, '');
INSERT INTO `tp_auth_rule` VALUES (135, 69, 'AdType/addPost', '操作-添加保存', 1, 1, '', 632, 1551936630, 1551936630, 1, '');
INSERT INTO `tp_auth_rule` VALUES (136, 69, 'AdType/editPost', '操作-修改保存', 1, 1, '', 634, 1551936663, 1551936663, 1, '');
INSERT INTO `tp_auth_rule` VALUES (137, 69, 'AdType/state', '操作-状态', 1, 1, '', 637, 1551936803, 1551936814, 1, '');
INSERT INTO `tp_auth_rule` VALUES (138, 109, 'Addons/index', '插件管理', 1, 1, '', 71, 1552455295, 1552455295, 1, '');
INSERT INTO `tp_auth_rule` VALUES (139, 138, 'Addons/install', '操作-安装', 1, 1, '', 711, 1552455347, 1552455347, 1, '');
INSERT INTO `tp_auth_rule` VALUES (140, 138, 'Addons/uninstall', '操作-卸载', 1, 1, '', 712, 1552455359, 1552455359, 1, '');
INSERT INTO `tp_auth_rule` VALUES (141, 138, 'Addons/config', '操作-配置', 1, 1, '', 713, 1552455388, 1552455388, 1, '');
INSERT INTO `tp_auth_rule` VALUES (142, 138, 'Addons/configPost', '操作-配置保存', 1, 1, '', 714, 1552455400, 1552455400, 1, '');
INSERT INTO `tp_auth_rule` VALUES (143, 138, 'Addons/state', '操作-状态', 1, 1, '', 715, 1552455414, 1552455414, 1, '');
INSERT INTO `tp_auth_rule` VALUES (144, 101, 'Template/addPost', '操作-添加保存', 1, 1, '', 812, 1553759995, 1553760047, 1, '');
INSERT INTO `tp_auth_rule` VALUES (145, 101, 'Template/editPost', '操作-修改保存', 1, 1, '', 814, 1553760016, 1553760056, 1, '');
INSERT INTO `tp_auth_rule` VALUES (146, 52, 'Category/addPost', '操作-添加保存', 1, 1, '', 512, 1553760556, 1553760556, 1, '');
INSERT INTO `tp_auth_rule` VALUES (147, 52, 'Category/editPost', '操作-修改保存', 1, 1, '', 514, 1553760573, 1553760589, 1, '');
INSERT INTO `tp_auth_rule` VALUES (148, 40, 'Module/addPost', '操作-添加保存', 1, 1, '', 412, 1553760823, 1553760823, 1, '');
INSERT INTO `tp_auth_rule` VALUES (149, 40, 'Module/editPost', '操作-修改保存', 1, 1, '', 414, 1553760841, 1553760855, 1, '');
INSERT INTO `tp_auth_rule` VALUES (150, 45, 'Module/fieldAddPost', '操作-添加保存', 1, 1, '', 4172, 1553761010, 1553761046, 1, '');
INSERT INTO `tp_auth_rule` VALUES (151, 45, 'Module/fieldEditPost', '操作-修改保存', 1, 1, '', 4174, 1553761029, 1553761053, 1, '');
INSERT INTO `tp_auth_rule` VALUES (152, 6, 'AdminLog/index', '管理员日志', 1, 1, '', 24, 1553845141, 1553845141, 1, '');
INSERT INTO `tp_auth_rule` VALUES (153, 152, 'AdminLog/del', '操作-删除', 1, 1, '', 241, 1553845181, 1553845181, 1, '');
INSERT INTO `tp_auth_rule` VALUES (154, 152, 'AdminLog/selectDel', '操作-批量删除', 1, 1, '', 242, 1553845204, 1553845204, 1, '');
INSERT INTO `tp_auth_rule` VALUES (155, 152, 'AdminLog/edit', '操作-查看', 1, 1, '', 243, 1553848110, 1553848110, 1, '');

-- ----------------------------
-- Table structure for tp_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_cate`;
CREATE TABLE `tp_cate`  (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `catname` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `enname` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目英文名称',
  `catdir` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录',
  `parentid` int(20) NOT NULL DEFAULT 0 COMMENT '父栏目ID',
  `moduleid` int(20) NULL DEFAULT 1 COMMENT '类型',
  `sort` int(20) NOT NULL DEFAULT 50 COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转链接',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `image` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `icoimage` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图片',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `description` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `summary` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `template_list` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template_show` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pagesize` int(4) NULL DEFAULT 20 COMMENT '分页显示数量',
  `is_menu` int(2) NOT NULL DEFAULT 1 COMMENT '是否导航显示',
  `is_next` int(2) NOT NULL DEFAULT 0 COMMENT '是否跳转到下级栏目',
  `is_blank` int(2) NULL DEFAULT 0 COMMENT '是否新窗口打开',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态（前后台状态）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`parentid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_cate
-- ----------------------------
INSERT INTO `tp_cate` VALUES (6, '关于我们', 'About Us', 'about', 0, 1, 1, '', NULL, '/uploads/20181224/65ea8dcb1cbd16c8dc46144069afeaf5.jpg', '', '', '', '', '', 'page_list.html', '', 0, 1, 0, 0, 1);
INSERT INTO `tp_cate` VALUES (7, '公司介绍', 'Company Introduction', 'introduction', 6, 1, 11, '', NULL, '', '', '', '', '', '', 'page_list.html', '', 0, 1, 0, 0, 1);
INSERT INTO `tp_cate` VALUES (8, '新闻中心', 'News Center', 'news', 0, 26, 2, '', NULL, '/uploads/20181224/65ea8dcb1cbd16c8dc46144069afeaf5.jpg', '', '', '', '', '', '', '', 0, 1, 0, 0, 1);
INSERT INTO `tp_cate` VALUES (9, '公司新闻', '', '', 8, 26, 21, '', NULL, '', '', '', '', '', '', NULL, NULL, 0, 1, 0, 0, 1);
INSERT INTO `tp_cate` VALUES (10, '公司文化', '', 'culture', 6, 1, 12, '', NULL, '', '', '', '', '', '', NULL, NULL, 0, 1, 0, 0, 1);
INSERT INTO `tp_cate` VALUES (13, '行业资讯', 'Industry Information', 'information', 8, 26, 22, '', NULL, '', '', '', '', '', '', 'article_list.html', 'article_show.html', 0, 1, 0, 0, 1);
INSERT INTO `tp_cate` VALUES (15, '精选产品', '', '', 14, 4, 41, '', NULL, '', '', '', '', '', '', 'product_list.html', 'product_show.html', 0, 1, 0, 0, 1);
INSERT INTO `tp_cate` VALUES (16, '热销产品', '', '', 14, 4, 42, '', NULL, '', '', '', '', '', '', 'product_list.html', 'product_show.html', 0, 1, 0, 0, 1);
INSERT INTO `tp_cate` VALUES (19, '联系我们', 'Contact Us', 'contact', 0, 27, 7, '', NULL, '/uploads/20181224/65ea8dcb1cbd16c8dc46144069afeaf5.jpg', '', '', '', '', '', 'message_list.html', '', 0, 1, 0, 0, 1);

-- ----------------------------
-- Table structure for tp_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_config
-- ----------------------------
INSERT INTO `tp_config` VALUES (60, 'smtp_server', 'smtp.qq.com', 'smtp', '0');
INSERT INTO `tp_config` VALUES (61, 'smtp_port', '465', 'smtp', '0');
INSERT INTO `tp_config` VALUES (62, 'smtp_user', '407593529@qq.com', 'smtp', '0');
INSERT INTO `tp_config` VALUES (63, 'smtp_pwd', '', 'smtp', '0');
INSERT INTO `tp_config` VALUES (64, 'regis_smtp_enable', '1', 'smtp', '0');
INSERT INTO `tp_config` VALUES (65, 'test_eamil', '', 'smtp', '0');
INSERT INTO `tp_config` VALUES (94, 'test_mobile', '', 'sms', NULL);
INSERT INTO `tp_config` VALUES (93, 'signName', '', 'sms', NULL);
INSERT INTO `tp_config` VALUES (92, 'templateCode', '', 'sms', NULL);
INSERT INTO `tp_config` VALUES (91, 'accessKeySecret', '', 'sms', NULL);
INSERT INTO `tp_config` VALUES (90, 'accessKeyId', 'LTAIqinwPNwEawUK', 'sms', NULL);
INSERT INTO `tp_config` VALUES (88, 'email_id', 'SIYUCMS', 'smtp', '0');
INSERT INTO `tp_config` VALUES (89, 'test_eamil_info', ' 您好！这是一封来自SIYUCMS的测试邮件！', 'smtp', '0');

-- ----------------------------
-- Table structure for tp_debris
-- ----------------------------
DROP TABLE IF EXISTS `tp_debris`;
CREATE TABLE `tp_debris`  (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` mediumint(8) NULL DEFAULT 50 COMMENT '排序',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态（1 正常，0 锁定）',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_debris
-- ----------------------------
INSERT INTO `tp_debris` VALUES (1, '关于我们', 'AboutUs', '<p>SIYUCMS内容管理系统，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。<br>SIYUCMS内容管理系统，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。&nbsp;&nbsp;</p><p><br></p>', '12', '', '3', 1, 1, 1545729604, 1551930573);

-- ----------------------------
-- Table structure for tp_field
-- ----------------------------
DROP TABLE IF EXISTS `tp_field`;
CREATE TABLE `tp_field`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `field` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tips` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `required` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `minlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pattern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `errormsg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `class` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `setup` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ispost` tinyint(1) NOT NULL DEFAULT 0,
  `unpostgroup` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_field
-- ----------------------------
INSERT INTO `tp_field` VALUES (1, 26, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `tp_field` VALUES (2, 26, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1);
INSERT INTO `tp_field` VALUES (3, 26, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1);
INSERT INTO `tp_field` VALUES (4, 26, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1);
INSERT INTO `tp_field` VALUES (5, 26, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'wangEditor\',\n)', 1, '', 5, 1, 1);
INSERT INTO `tp_field` VALUES (6, 26, 'create_time', '发布时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1);
INSERT INTO `tp_field` VALUES (7, 26, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1);
INSERT INTO `tp_field` VALUES (8, 26, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1);
INSERT INTO `tp_field` VALUES (10, 26, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1);
INSERT INTO `tp_field` VALUES (13, 26, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0);
INSERT INTO `tp_field` VALUES (15, 26, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0);
INSERT INTO `tp_field` VALUES (29, 26, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0);
INSERT INTO `tp_field` VALUES (28, 26, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0);
INSERT INTO `tp_field` VALUES (21, 26, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1);
INSERT INTO `tp_field` VALUES (22, 1, 'catid', '栏目', '', 1, 0, 0, '', '', '', 'catid', NULL, 0, '', 0, 1, 0);
INSERT INTO `tp_field` VALUES (23, 1, 'title', '标题', '', 1, 0, 0, '', '', '', 'title', NULL, 0, '', 0, 1, 0);
INSERT INTO `tp_field` VALUES (24, 1, 'keywords', '关键词', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 0, 1, 0);
INSERT INTO `tp_field` VALUES (25, 1, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 0, 1, 0);
INSERT INTO `tp_field` VALUES (26, 1, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', 0, '', 0, 1, 0);
INSERT INTO `tp_field` VALUES (27, 1, 'hits', '点击次数', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 0, 1, 0);
INSERT INTO `tp_field` VALUES (30, 3, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `tp_field` VALUES (31, 3, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1);
INSERT INTO `tp_field` VALUES (32, 3, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1);
INSERT INTO `tp_field` VALUES (33, 3, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1);
INSERT INTO `tp_field` VALUES (34, 3, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', 1, '', 5, 1, 1);
INSERT INTO `tp_field` VALUES (35, 3, 'create_time', '发布时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1);
INSERT INTO `tp_field` VALUES (36, 3, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1);
INSERT INTO `tp_field` VALUES (37, 3, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1);
INSERT INTO `tp_field` VALUES (38, 3, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1);
INSERT INTO `tp_field` VALUES (39, 3, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0);
INSERT INTO `tp_field` VALUES (40, 3, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0);
INSERT INTO `tp_field` VALUES (41, 3, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0);
INSERT INTO `tp_field` VALUES (42, 3, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0);
INSERT INTO `tp_field` VALUES (43, 3, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0);
INSERT INTO `tp_field` VALUES (44, 3, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1);
INSERT INTO `tp_field` VALUES (45, 4, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `tp_field` VALUES (46, 4, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1);
INSERT INTO `tp_field` VALUES (47, 4, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1);
INSERT INTO `tp_field` VALUES (48, 4, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1);
INSERT INTO `tp_field` VALUES (49, 4, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', 1, '', 5, 1, 1);
INSERT INTO `tp_field` VALUES (50, 4, 'create_time', '发布时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1);
INSERT INTO `tp_field` VALUES (51, 4, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1);
INSERT INTO `tp_field` VALUES (52, 4, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1);
INSERT INTO `tp_field` VALUES (53, 4, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1);
INSERT INTO `tp_field` VALUES (54, 4, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0);
INSERT INTO `tp_field` VALUES (55, 4, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0);
INSERT INTO `tp_field` VALUES (56, 4, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0);
INSERT INTO `tp_field` VALUES (57, 4, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0);
INSERT INTO `tp_field` VALUES (58, 4, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0);
INSERT INTO `tp_field` VALUES (59, 4, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1);
INSERT INTO `tp_field` VALUES (60, 5, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `tp_field` VALUES (61, 5, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1);
INSERT INTO `tp_field` VALUES (62, 5, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1);
INSERT INTO `tp_field` VALUES (63, 5, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1);
INSERT INTO `tp_field` VALUES (64, 5, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', 1, '', 5, 1, 1);
INSERT INTO `tp_field` VALUES (65, 5, 'create_time', '发布时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1);
INSERT INTO `tp_field` VALUES (66, 5, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1);
INSERT INTO `tp_field` VALUES (67, 5, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1);
INSERT INTO `tp_field` VALUES (68, 5, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1);
INSERT INTO `tp_field` VALUES (69, 5, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0);
INSERT INTO `tp_field` VALUES (70, 5, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0);
INSERT INTO `tp_field` VALUES (71, 5, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0);
INSERT INTO `tp_field` VALUES (72, 5, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0);
INSERT INTO `tp_field` VALUES (73, 5, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0);
INSERT INTO `tp_field` VALUES (74, 5, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1);
INSERT INTO `tp_field` VALUES (75, 6, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `tp_field` VALUES (76, 6, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1);
INSERT INTO `tp_field` VALUES (77, 6, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1);
INSERT INTO `tp_field` VALUES (78, 6, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1);
INSERT INTO `tp_field` VALUES (79, 6, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', 1, '', 5, 1, 1);
INSERT INTO `tp_field` VALUES (80, 6, 'create_time', '发布时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1);
INSERT INTO `tp_field` VALUES (81, 6, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1);
INSERT INTO `tp_field` VALUES (82, 6, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1);
INSERT INTO `tp_field` VALUES (83, 6, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1);
INSERT INTO `tp_field` VALUES (84, 6, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0);
INSERT INTO `tp_field` VALUES (85, 6, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0);
INSERT INTO `tp_field` VALUES (86, 6, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0);
INSERT INTO `tp_field` VALUES (87, 6, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0);
INSERT INTO `tp_field` VALUES (88, 6, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0);
INSERT INTO `tp_field` VALUES (89, 6, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1);
INSERT INTO `tp_field` VALUES (90, 26, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0);
INSERT INTO `tp_field` VALUES (91, 3, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0);
INSERT INTO `tp_field` VALUES (92, 4, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0);
INSERT INTO `tp_field` VALUES (93, 5, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0);
INSERT INTO `tp_field` VALUES (94, 6, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0);
INSERT INTO `tp_field` VALUES (95, 27, 'catid', '栏目', '', 0, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `tp_field` VALUES (96, 27, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1);
INSERT INTO `tp_field` VALUES (106, 27, 'contact', '联系方式', '', 1, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 9, 1, 0);
INSERT INTO `tp_field` VALUES (99, 27, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', 1, '', 3, 1, 1);
INSERT INTO `tp_field` VALUES (100, 27, 'create_time', '添加时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 4, 1, 1);
INSERT INTO `tp_field` VALUES (101, 27, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'已处理|1\r\n未处理|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'default\' => \'1\',\n)', 1, '', 5, 1, 1);
INSERT INTO `tp_field` VALUES (104, 27, 'name', '姓名', '', 1, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 8, 1, 0);
INSERT INTO `tp_field` VALUES (105, 27, 'hits', '点击次数', '', 0, 0, 0, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 0, '', 7, 1, 0);
INSERT INTO `tp_field` VALUES (103, 27, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 6, 1, 1);

-- ----------------------------
-- Table structure for tp_link
-- ----------------------------
DROP TABLE IF EXISTS `tp_link`;
CREATE TABLE `tp_link`  (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站地址',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站logo',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` mediumint(8) NULL DEFAULT 50 COMMENT '排序',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态（1 正常，0 锁定）',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_link
-- ----------------------------
INSERT INTO `tp_link` VALUES (2, '百度', 'http://www.baidu.com', '', '联系人：XXX', 1, 1, NULL, 1553837737);
INSERT INTO `tp_link` VALUES (5, 'SIYUCMS', 'http://www.siyucms.com', '', '', 2, 1, 1548727536, 1551930738);

-- ----------------------------
-- Table structure for tp_message
-- ----------------------------
DROP TABLE IF EXISTS `tp_message`;
CREATE TABLE `tp_message`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `catid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题样式',
  `thumb` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `template` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`id`, `status`, `sort`) USING BTREE,
  INDEX `catid`(`id`, `catid`, `status`) USING BTREE,
  INDEX `sort`(`id`, `catid`, `status`, `sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tp_module
-- ----------------------------
DROP TABLE IF EXISTS `tp_module`;
CREATE TABLE `tp_module`  (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表名',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `listfields` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表页字段',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_module
-- ----------------------------
INSERT INTO `tp_module` VALUES (1, '单页模型', 'page', '单页面', 1, 0, '*', 0, 1);
INSERT INTO `tp_module` VALUES (26, '文章模型', 'article', '新闻文章', 1, 0, '*', 0, 1);
INSERT INTO `tp_module` VALUES (27, '在线留言', 'message', '在线留言', 1, 0, '*', 0, 1);

-- ----------------------------
-- Table structure for tp_page
-- ----------------------------
DROP TABLE IF EXISTS `tp_page`;
CREATE TABLE `tp_page`  (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键词',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SEO简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '点击次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_page
-- ----------------------------
INSERT INTO `tp_page` VALUES (1, 7, '公司介绍', 'asdf ', '', '', 100);
INSERT INTO `tp_page` VALUES (2, 6, '关于我们', '', '', '<p>ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。ThinkPHP从诞生以来一直秉承简洁实用的设计原则，在保持出色的性能和至简的代码的同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用ThinkPHP，甚至允许把你基于ThinkPHP开发的应用开源或商业产品发布/销售。</p><p>ThinkPHP5.1在5.0的基础上对底层架构做了进一步的改进，引入新特性，并提升版本要求。另外一个事实是，5.1版本看起来对开发者更加友好，表现在目录结构更直观、调试输出更直观和代码提示更直观。</p><p>ThinkPHP5.1运行环境要求PHP5.6+，虽然不支持5.0的无缝升级，但升级过程并不复杂（请参考升级指导），5.1.*版本基本上可以支持无缝升级。</p><p><br/></p>', 100);
INSERT INTO `tp_page` VALUES (3, 10, '公司文化', '', '', '', 100);

-- ----------------------------
-- Table structure for tp_system
-- ----------------------------
DROP TABLE IF EXISTS `tp_system`;
CREATE TABLE `tp_system`  (
  `id` int(8) UNSIGNED NOT NULL,
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网址',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `des` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `bah` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'copyright',
  `address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `fax` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司邮箱',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `logo` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码',
  `mobile` tinyint(2) NULL DEFAULT 0 COMMENT '是否开启手机端 1 开启0 关闭',
  `code` tinyint(2) NULL DEFAULT 0 COMMENT '是否开启后台验证码 1 开启 0 关闭',
  `message_code` tinyint(2) NULL DEFAULT 0 COMMENT '是否开启前台验证码 1 开启 0 关闭',
  `message_send_mail` tinyint(2) NULL DEFAULT 0 COMMENT '留言是否发送邮件',
  `template` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模版选择',
  `html` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Html目录',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_system
-- ----------------------------
INSERT INTO `tp_system` VALUES (1, 'SIYUCMS', 'www.xxx.com', 'SIYUCMS 官网', 'SIYUCMS，SIYUCMS内容管理系统，php，ThinkPHP CMS，ThinkPHP建站系统', 'SIYUCMS 是一款基于 ThinkPHP5 + AdminLTE 的内容管理系统。后台界面采用响应式布局，清爽、极简、简单、易用，是做开发的最佳选择。', '辽ICP备12345678号-1', 'Copyright © SIYUCMS 2019.All right reserved.Powered by SIYUCMS', '辽宁省沈阳市铁西区重工街XX路XX号1-1-1', 'X先生', '158 4018 8888', '010-8888 9999', '010-8888 7777', '407593529@qq.com', '407593529', '/uploads/20181226/a3a4245ec095da4903c6c81123fd480d.png', '/uploads/20181226/cb7a4c21d6443bc5e7a8d16ac2cbe242.png', 0, 1, 0, 0, 'default', 'html');

SET FOREIGN_KEY_CHECKS = 1;
