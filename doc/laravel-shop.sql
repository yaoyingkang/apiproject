/*
Navicat MySQL Data Transfer

Source Server         : varg
Source Server Version : 50722
Source Host           : 192.168.10.10:3306
Source Database       : laravel-shop

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-12-09 11:17:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', '首页', 'fa-bar-chart', '/', null, null, '2019-07-25 06:00:08');
INSERT INTO `admin_menu` VALUES ('2', '0', '6', 'Admin', 'fa-tasks', '', null, null, '2019-08-23 08:11:00');
INSERT INTO `admin_menu` VALUES ('3', '2', '7', '管理员', 'fa-users', 'auth/users', null, null, '2019-08-23 08:11:00');
INSERT INTO `admin_menu` VALUES ('4', '2', '8', '角色', 'fa-user', 'auth/roles', null, null, '2019-08-23 08:11:00');
INSERT INTO `admin_menu` VALUES ('5', '2', '9', '权限', 'fa-ban', 'auth/permissions', null, null, '2019-08-23 08:11:00');
INSERT INTO `admin_menu` VALUES ('6', '2', '10', '菜单', 'fa-bars', 'auth/menu', null, null, '2019-08-23 08:11:00');
INSERT INTO `admin_menu` VALUES ('7', '2', '11', '操作日志', 'fa-history', 'auth/logs', null, null, '2019-08-23 08:11:00');
INSERT INTO `admin_menu` VALUES ('8', '0', '2', '用户管理', 'fa-users', '/users', null, '2019-07-25 06:57:01', '2019-07-25 06:57:34');
INSERT INTO `admin_menu` VALUES ('9', '0', '5', '商品管理', 'fa-cubes', '/products', null, '2019-07-25 07:53:58', '2019-08-23 08:11:00');
INSERT INTO `admin_menu` VALUES ('10', '0', '3', '订单管理', 'fa-rmb', '/orders', null, '2019-08-20 08:32:15', '2019-08-20 08:32:58');
INSERT INTO `admin_menu` VALUES ('11', '0', '4', '优惠券管理', 'fa-tags', '/coupon_codes', null, '2019-08-23 08:09:50', '2019-08-23 08:11:00');

-- ----------------------------
-- Table structure for `admin_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-07-25 05:55:53', '2019-07-25 05:55:53');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 05:57:11', '2019-07-25 05:57:11');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 05:57:11', '2019-07-25 05:57:11');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 05:59:12', '2019-07-25 05:59:12');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 05:59:24', '2019-07-25 05:59:24');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-07-25 06:00:07', '2019-07-25 06:00:07');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:00:09', '2019-07-25 06:00:09');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:00:16', '2019-07-25 06:00:16');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-07-25 06:00:29', '2019-07-25 06:00:29');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:00:31', '2019-07-25 06:00:31');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:00:37', '2019-07-25 06:00:37');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-07-25 06:00:47', '2019-07-25 06:00:47');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:00:49', '2019-07-25 06:00:49');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:00:54', '2019-07-25 06:00:54');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-07-25 06:01:04', '2019-07-25 06:01:04');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:01:07', '2019-07-25 06:01:07');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:01:13', '2019-07-25 06:01:13');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-07-25 06:01:22', '2019-07-25 06:01:22');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:01:26', '2019-07-25 06:01:26');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:01:38', '2019-07-25 06:01:38');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-07-25 06:01:52', '2019-07-25 06:01:52');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:01:55', '2019-07-25 06:01:55');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:02:32', '2019-07-25 06:02:32');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:55:52', '2019-07-25 06:55:52');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\"}', '2019-07-25 06:57:00', '2019-07-25 06:57:00');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:57:04', '2019-07-25 06:57:04');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-07-25 06:57:33', '2019-07-25 06:57:33');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:57:35', '2019-07-25 06:57:35');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 06:57:52', '2019-07-25 06:57:52');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:58:02', '2019-07-25 06:58:02');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:00:23', '2019-07-25 07:00:23');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:00:31', '2019-07-25 07:00:31');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"users\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/users*\",\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/permissions\"}', '2019-07-25 07:01:26', '2019-07-25 07:01:26');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-07-25 07:01:29', '2019-07-25 07:01:29');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:02:58', '2019-07-25 07:02:58');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:03:03', '2019-07-25 07:03:03');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/auth/roles', 'POST', '192.168.10.1', '{\"slug\":\"operation\",\"name\":\"\\u8fd0\\u8425\",\"permissions\":[\"6\",\"2\",\"3\",\"4\",null],\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/roles\"}', '2019-07-25 07:04:49', '2019-07-25 07:04:49');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-07-25 07:04:51', '2019-07-25 07:04:51');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/auth/roles/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:05:00', '2019-07-25 07:05:00');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:05:33', '2019-07-25 07:05:33');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:05:39', '2019-07-25 07:05:39');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/auth/users', 'POST', '192.168.10.1', '{\"username\":\"operator\",\"name\":\"\\u8fd0\\u8425\",\"password\":\"admin\",\"password_confirmation\":\"admin\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/users\"}', '2019-07-25 07:06:49', '2019-07-25 07:06:49');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2019-07-25 07:06:53', '2019-07-25 07:06:53');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2019-07-25 07:11:05', '2019-07-25 07:11:05');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:11:14', '2019-07-25 07:11:14');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:53:29', '2019-07-25 07:53:29');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\"}', '2019-07-25 07:53:57', '2019-07-25 07:53:57');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 07:54:02', '2019-07-25 07:54:02');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/auth/menu/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:54:17', '2019-07-25 07:54:17');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/auth/menu/9', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":\"\\/products\",\"roles\":[null],\"permission\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-07-25 07:54:31', '2019-07-25 07:54:31');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 07:54:33', '2019-07-25 07:54:33');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-07-25 07:54:49', '2019-07-25 07:54:49');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:54:51', '2019-07-25 07:54:51');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:54:57', '2019-07-25 07:54:57');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:55:04', '2019-07-25 07:55:04');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:55:10', '2019-07-25 07:55:10');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:55:19', '2019-07-25 07:55:19');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:55:40', '2019-07-25 07:55:40');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-07-25 07:55:44', '2019-07-25 07:55:44');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:55:49', '2019-07-25 07:55:49');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:03:54', '2019-07-25 08:03:54');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-25 08:05:30', '2019-07-25 08:05:30');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-25 08:06:11', '2019-07-25 08:06:11');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/products', 'POST', '192.168.10.1', '{\"title\":\"\\u83dc\\u5355\",\"description\":\"<p>\\u58c1\\u7eb8<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"new_1\":{\"title\":\"\\u5ea7\\u6905\",\"description\":\"\\u5ea7\\u6905\",\"price\":\"11\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\"}', '2019-07-25 08:07:47', '2019-07-25 08:07:47');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-25 08:07:52', '2019-07-25 08:07:52');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:12:35', '2019-07-25 08:12:35');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2019-07-25 08:13:13', '2019-07-25 08:13:13');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u83dc\\u5355\",\"description\":\"<p>\\u58c1\\u7eb8<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5ea7\\u6905\",\"description\":\"\\u5ea7\\u6905\",\"price\":\"11.00\",\"stock\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"}},\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\"}', '2019-07-25 08:14:41', '2019-07-25 08:14:41');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-25 08:14:44', '2019-07-25 08:14:44');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:49:32', '2019-07-25 08:49:32');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"key\":null,\"image\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\"}', '2019-07-25 08:49:41', '2019-07-25 08:49:41');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u83dc\\u5355\",\"description\":\"<p>\\u58c1\\u7eb8<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5ea7\\u6905\",\"description\":\"\\u5ea7\\u6905\",\"price\":\"11.00\",\"stock\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"}},\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2019-07-25 08:50:13', '2019-07-25 08:50:13');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-25 08:50:16', '2019-07-25 08:50:16');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 09:59:15', '2019-07-25 09:59:15');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u83dc\\u5355\",\"description\":\"<p>\\u58c1\\u7eb8<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"\\u5ea7\\u6905\",\"description\":\"\\u5ea7\\u6905\",\"price\":\"11.00\",\"stock\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"}},\"_token\":\"I8OmgETwp77Qdk3weNGXutmIaaCND8zzPmhFjDjK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2019-07-25 10:01:54', '2019-07-25 10:01:54');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-25 10:01:59', '2019-07-25 10:01:59');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-31 08:08:49', '2019-07-31 08:08:49');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-31 08:08:56', '2019-07-31 08:08:56');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-31 08:09:03', '2019-07-31 08:09:03');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-08-20 08:31:25', '2019-08-20 08:31:25');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/orders\",\"roles\":[null],\"permission\":null,\"_token\":\"ShkQ1wfzJnpazOw6CpjtUAJdPvkV9KfpkKaQEhH3\"}', '2019-08-20 08:32:14', '2019-08-20 08:32:14');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-08-20 08:32:18', '2019-08-20 08:32:18');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-08-20 08:32:41', '2019-08-20 08:32:41');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"ShkQ1wfzJnpazOw6CpjtUAJdPvkV9KfpkKaQEhH3\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":10},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-08-20 08:32:57', '2019-08-20 08:32:57');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-20 08:32:59', '2019-08-20 08:32:59');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-20 08:33:05', '2019-08-20 08:33:05');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-08-20 08:33:16', '2019-08-20 08:33:16');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-20 08:33:21', '2019-08-20 08:33:21');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/orders/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-20 08:36:19', '2019-08-20 08:36:19');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin/orders', 'GET', '192.168.10.1', '[]', '2019-08-20 08:36:25', '2019-08-20 08:36:25');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin/orders', 'GET', '192.168.10.1', '[]', '2019-08-20 08:37:10', '2019-08-20 08:37:10');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/orders/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-20 08:37:16', '2019-08-20 08:37:16');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-20 08:37:48', '2019-08-20 08:37:48');
INSERT INTO `admin_operation_log` VALUES ('94', '1', 'admin/orders', 'GET', '192.168.10.1', '[]', '2019-08-20 08:43:44', '2019-08-20 08:43:44');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin/orders/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-20 08:43:56', '2019-08-20 08:43:56');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin/orders/1/ship', 'POST', '192.168.10.1', '{\"_token\":\"ShkQ1wfzJnpazOw6CpjtUAJdPvkV9KfpkKaQEhH3\",\"express_company\":null,\"express_no\":null}', '2019-08-20 08:45:03', '2019-08-20 08:45:03');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin/orders/1', 'GET', '192.168.10.1', '[]', '2019-08-20 08:45:09', '2019-08-20 08:45:09');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/orders/1/ship', 'POST', '192.168.10.1', '{\"_token\":\"ShkQ1wfzJnpazOw6CpjtUAJdPvkV9KfpkKaQEhH3\",\"express_company\":null,\"express_no\":null}', '2019-08-20 08:46:09', '2019-08-20 08:46:09');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-08-23 02:19:02', '2019-08-23 02:19:02');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:20:29', '2019-08-23 02:20:29');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin/orders/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:20:50', '2019-08-23 02:20:50');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:21:00', '2019-08-23 02:21:00');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin/orders', 'GET', '192.168.10.1', '[]', '2019-08-23 02:34:58', '2019-08-23 02:34:58');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin/orders/7', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:35:08', '2019-08-23 02:35:08');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/orders/7/ship', 'POST', '192.168.10.1', '{\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"express_company\":\"fsdfsdffsd\",\"express_no\":\"324234324\"}', '2019-08-23 02:35:21', '2019-08-23 02:35:21');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/orders/7', 'GET', '192.168.10.1', '[]', '2019-08-23 02:36:21', '2019-08-23 02:36:21');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/orders/7', 'GET', '192.168.10.1', '[]', '2019-08-23 02:38:11', '2019-08-23 02:38:11');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/orders/7/ship', 'POST', '192.168.10.1', '{\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"express_company\":null,\"express_no\":null}', '2019-08-23 02:39:51', '2019-08-23 02:39:51');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/orders/7/ship', 'POST', '192.168.10.1', '{\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"express_company\":null,\"express_no\":null}', '2019-08-23 02:40:05', '2019-08-23 02:40:05');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin/orders/7/ship', 'POST', '192.168.10.1', '{\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"express_company\":\"tefesfsd\",\"express_no\":\"1111\"}', '2019-08-23 02:41:05', '2019-08-23 02:41:05');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:42:20', '2019-08-23 02:42:20');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:42:45', '2019-08-23 02:42:45');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:43:08', '2019-08-23 02:43:08');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/auth/roles/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:43:22', '2019-08-23 02:43:22');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:43:53', '2019-08-23 02:43:53');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 02:44:09', '2019-08-23 02:44:09');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":null,\"name\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/admin\\/order*\",\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/permissions\"}', '2019-08-23 02:44:42', '2019-08-23 02:44:42');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '[]', '2019-08-23 02:44:49', '2019-08-23 02:44:49');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"open\",\"name\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/admin\\/order*\",\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\"}', '2019-08-23 02:59:25', '2019-08-23 02:59:25');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-08-23 02:59:34', '2019-08-23 02:59:34');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/auth/permissions/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:02:58', '2019-08-23 03:02:58');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/auth/permissions/7', 'PUT', '192.168.10.1', '{\"slug\":\"open\",\"name\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/order*\",\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/permissions\"}', '2019-08-23 03:03:16', '2019-08-23 03:03:16');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-08-23 03:03:25', '2019-08-23 03:03:25');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:04:09', '2019-08-23 03:04:09');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/auth/roles/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:04:21', '2019-08-23 03:04:21');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin/auth/roles/2', 'PUT', '192.168.10.1', '{\"slug\":\"operation\",\"name\":\"\\u8fd0\\u8425\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",\"7\",null],\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/roles\"}', '2019-08-23 03:04:31', '2019-08-23 03:04:31');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-08-23 03:04:35', '2019-08-23 03:04:35');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:04:49', '2019-08-23 03:04:49');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:05:03', '2019-08-23 03:05:03');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:05:25', '2019-08-23 03:05:25');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/orders/7', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:05:41', '2019-08-23 03:05:41');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/orders/7/ship', 'POST', '192.168.10.1', '{\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"express_company\":\"fsdfsdffsd\",\"express_no\":\"1111\"}', '2019-08-23 03:05:55', '2019-08-23 03:05:55');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/orders/7/ship', 'POST', '192.168.10.1', '{\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"express_company\":\"fsdfsdffsd\",\"express_no\":\"1111\"}', '2019-08-23 03:07:00', '2019-08-23 03:07:00');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin/orders/7', 'GET', '192.168.10.1', '[]', '2019-08-23 03:07:04', '2019-08-23 03:07:04');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:40:46', '2019-08-23 03:40:46');
INSERT INTO `admin_operation_log` VALUES ('136', '1', 'admin/orders/8', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 03:41:03', '2019-08-23 03:41:03');
INSERT INTO `admin_operation_log` VALUES ('137', '1', 'admin/orders/8/ship', 'POST', '192.168.10.1', '{\"_token\":\"GiVNbV0t7hEyWjYIwfIAIRyjfJrUgqPkiDXzmyK2\",\"express_company\":\"151112\",\"express_no\":\"111212\"}', '2019-08-23 03:41:17', '2019-08-23 03:41:17');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/orders/8', 'GET', '192.168.10.1', '[]', '2019-08-23 03:41:21', '2019-08-23 03:41:21');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 07:33:11', '2019-08-23 07:33:11');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin/orders/8', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 07:33:38', '2019-08-23 07:33:38');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin/orders/8', 'GET', '192.168.10.1', '[]', '2019-08-23 07:40:12', '2019-08-23 07:40:12');
INSERT INTO `admin_operation_log` VALUES ('142', '1', 'admin/orders/8/refund', 'POST', '192.168.10.1', '{\"agree\":false,\"reason\":\"202022020\",\"_token\":\"OsIwV4WAYZsxczFl62YJPe5KHpWsqKOJB0iNbZY5\"}', '2019-08-23 07:43:41', '2019-08-23 07:43:41');
INSERT INTO `admin_operation_log` VALUES ('143', '1', 'admin/orders/8', 'GET', '192.168.10.1', '[]', '2019-08-23 07:43:54', '2019-08-23 07:43:54');
INSERT INTO `admin_operation_log` VALUES ('144', '1', 'admin/orders/8', 'GET', '192.168.10.1', '[]', '2019-08-23 07:48:48', '2019-08-23 07:48:48');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:08:41', '2019-08-23 08:08:41');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:08:56', '2019-08-23 08:08:56');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"icon\":\"fa-tags\",\"uri\":\"\\/coupon_codes\",\"roles\":[null],\"permission\":null,\"_token\":\"OsIwV4WAYZsxczFl62YJPe5KHpWsqKOJB0iNbZY5\"}', '2019-08-23 08:09:48', '2019-08-23 08:09:48');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-08-23 08:09:53', '2019-08-23 08:09:53');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"OsIwV4WAYZsxczFl62YJPe5KHpWsqKOJB0iNbZY5\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-08-23 08:10:58', '2019-08-23 08:10:58');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"OsIwV4WAYZsxczFl62YJPe5KHpWsqKOJB0iNbZY5\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-08-23 08:11:03', '2019-08-23 08:11:03');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:11:08', '2019-08-23 08:11:08');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:11:10', '2019-08-23 08:11:10');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:11:18', '2019-08-23 08:11:18');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-08-23 08:17:05', '2019-08-23 08:17:05');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:17:23', '2019-08-23 08:17:23');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-08-23 08:19:33', '2019-08-23 08:19:33');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-08-23 08:20:24', '2019-08-23 08:20:24');
INSERT INTO `admin_operation_log` VALUES ('158', '1', 'admin/coupon_codes/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:25:58', '2019-08-23 08:25:58');
INSERT INTO `admin_operation_log` VALUES ('159', '1', 'admin/coupon_codes', 'POST', '192.168.10.1', '{\"name\":null,\"code\":null,\"type\":\"fixed\",\"value\":null,\"total\":null,\"min_amount\":null,\"not_before\":null,\"not_after\":null,\"enabled\":\"0\",\"_token\":\"OsIwV4WAYZsxczFl62YJPe5KHpWsqKOJB0iNbZY5\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/coupon_codes\"}', '2019-08-23 08:26:32', '2019-08-23 08:26:32');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin/coupon_codes/create', 'GET', '192.168.10.1', '[]', '2019-08-23 08:26:40', '2019-08-23 08:26:40');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:28:05', '2019-08-23 08:28:05');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/coupon_codes/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:28:13', '2019-08-23 08:28:13');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin/coupon_codes/1/edit', 'GET', '192.168.10.1', '[]', '2019-08-23 08:29:46', '2019-08-23 08:29:46');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:30:09', '2019-08-23 08:30:09');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/coupon_codes/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-23 08:30:18', '2019-08-23 08:30:18');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/coupon_codes/1', 'PUT', '192.168.10.1', '{\"name\":\"quo sit suscipit\",\"code\":\"EJXMRITME4B1CEGS\",\"type\":\"fixed\",\"value\":\"173.00\",\"total\":\"1000\",\"min_amount\":\"173.01\",\"not_before\":\"2019-08-23 00:00:00\",\"not_after\":\"2019-08-31 00:00:00\",\"enabled\":\"1\",\"_token\":\"OsIwV4WAYZsxczFl62YJPe5KHpWsqKOJB0iNbZY5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/coupon_codes\"}', '2019-08-23 08:31:06', '2019-08-23 08:31:06');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-08-23 08:31:11', '2019-08-23 08:31:11');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-08-26 07:33:09', '2019-08-26 07:33:09');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-26 07:33:42', '2019-08-26 07:33:42');

-- ----------------------------
-- Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', '用户管理', 'users', '', '/users*', '2019-07-25 07:01:27', '2019-07-25 07:01:27');
INSERT INTO `admin_permissions` VALUES ('7', '订单管理', 'open', '', '/order*', '2019-08-23 02:59:27', '2019-08-23 03:03:18');

-- ----------------------------
-- Table structure for `admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for `admin_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '6', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '2', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '3', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '4', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '7', null, null);

-- ----------------------------
-- Table structure for `admin_role_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_users` VALUES ('2', '2', null, null);

-- ----------------------------
-- Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2019-07-25 05:49:19', '2019-07-25 05:49:19');
INSERT INTO `admin_roles` VALUES ('2', '运营', 'operation', '2019-07-25 07:04:50', '2019-07-25 07:04:50');

-- ----------------------------
-- Table structure for `admin_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$h.Vq421T8qx5U4ZmqDFUAu4ciXmd.eKyHJVln1hMlVDzB7vm1QZOm', 'Administrator', null, 'sBtod4mDElw1qN378O0tczQt7qWG9KyEBbLhX0OZIIuYnfQ8wxhsU74jJfag', '2019-07-25 05:49:19', '2019-07-25 05:49:19');
INSERT INTO `admin_users` VALUES ('2', 'operator', '$2y$10$08kpX6YpD/iAQW1KG5AhluUM3iDx/yV.5Pp2d3tYtf3mFrE.5r4ze', '运营', null, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVfdGltZSI6IjE1NzU2MDQwNjMiLCJ0b2tlbkVTIjoiZXMiLCJ1aWQiOiIyIiwidXNlcm5hbWUiOiJvcGVyYXRvciJ9.BVNKReZeeerAKAf49wmRdNGzZzrzRd7l-H1G5lE4zCY', '2019-07-25 07:06:49', '2019-12-06 10:47:43');
INSERT INTO `admin_users` VALUES ('3', 'test', 'test', 'test', null, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVfdGltZSI6IjE1NzU2NDAxMjIiLCJ0b2tlbkVTIjoiZXMiLCJ1aWQiOiIzIiwidXNlcm5hbWUiOiJ0ZXN0In0.aH5lewVYsFrjTDKRZKGh8H_pDp_cpwDZuO4xoAIzPwc', '2019-07-25 05:49:19', '2019-12-06 20:48:42');

-- ----------------------------
-- Table structure for `cart_items`
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_items
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_codes`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_codes`;
CREATE TABLE `coupon_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) NOT NULL,
  `not_before` datetime DEFAULT NULL,
  `not_after` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_codes
-- ----------------------------
INSERT INTO `coupon_codes` VALUES ('1', 'quo sit suscipit', 'EJXMRITME4B1CEGS', 'fixed', '173.00', '1000', '0', '173.01', '2019-08-23 00:00:00', '2019-08-31 00:00:00', '1', '2019-08-23 08:16:42', '2019-08-23 08:31:08');
INSERT INTO `coupon_codes` VALUES ('2', 'ex earum eius', 'K2ZOETYPQZDBQ23W', 'fixed', '107.00', '1000', '0', '107.01', null, null, '1', '2019-08-23 08:16:42', '2019-08-23 08:16:42');
INSERT INTO `coupon_codes` VALUES ('3', 'minus dolor et', '6VRG2USMYCWYWT2S', 'percent', '9.00', '1000', '0', '558.00', null, null, '1', '2019-08-23 08:16:42', '2019-08-23 08:16:42');
INSERT INTO `coupon_codes` VALUES ('4', 'dolores praesentium repellendus', 'S51E3VBVI34RBKHP', 'fixed', '78.00', '1000', '0', '78.01', null, null, '1', '2019-08-23 08:16:42', '2019-08-23 08:16:42');
INSERT INTO `coupon_codes` VALUES ('5', 'nemo incidunt tempora', 'XGP3KQYAANVPKTLA', 'fixed', '127.00', '1000', '0', '127.01', null, null, '1', '2019-08-23 08:16:42', '2019-08-23 08:16:42');
INSERT INTO `coupon_codes` VALUES ('6', 'sed consequatur rerum', 'LABLR4QNOFTPSKTT', 'fixed', '81.00', '1000', '0', '81.01', null, null, '1', '2019-08-23 08:16:42', '2019-08-23 08:16:42');
INSERT INTO `coupon_codes` VALUES ('7', 'quibusdam quisquam sed', 'MGBO4QTGEPQD4YB7', 'fixed', '156.00', '1000', '0', '156.01', null, null, '1', '2019-08-23 08:16:42', '2019-08-23 08:16:42');
INSERT INTO `coupon_codes` VALUES ('8', 'itaque blanditiis nesciunt', 'TGJ9NPEPUXBWYRC2', 'fixed', '169.00', '1000', '0', '169.01', null, null, '1', '2019-08-23 08:16:42', '2019-08-23 08:16:42');
INSERT INTO `coupon_codes` VALUES ('9', 'quia provident aut', 'PEMZH5YF0GI0B2B9', 'fixed', '174.00', '1000', '0', '174.01', null, null, '1', '2019-08-23 08:16:42', '2019-08-23 08:16:42');
INSERT INTO `coupon_codes` VALUES ('10', 'rerum minima aliquid', 'EYWPACFU8JL4AKG9', 'percent', '48.00', '1000', '1', '715.00', null, null, '1', '2019-08-23 08:16:42', '2019-08-26 08:05:37');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_07_24_083211_create_user_addresses_table', '2');
INSERT INTO `migrations` VALUES ('4', '2016_01_04_173148_create_admin_tables', '3');
INSERT INTO `migrations` VALUES ('5', '2019_07_25_073232_create_products_table', '4');
INSERT INTO `migrations` VALUES ('6', '2019_07_25_074746_create_product_skus_table', '4');
INSERT INTO `migrations` VALUES ('7', '2019_07_25_100603_create_user_favorite_products_table', '5');
INSERT INTO `migrations` VALUES ('8', '2019_07_26_060157_create_cart_items_table', '6');
INSERT INTO `migrations` VALUES ('9', '2019_07_26_075648_create_orders_table', '7');
INSERT INTO `migrations` VALUES ('10', '2019_07_26_080000_create_order_items_table', '7');
INSERT INTO `migrations` VALUES ('11', '2019_08_23_075004_create_coupon_codes_table', '8');
INSERT INTO `migrations` VALUES ('12', '2019_08_23_075825_orders_add_coupon_code_id', '8');

-- ----------------------------
-- Table structure for `order_items`
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES ('1', '1', '2', '2', '10', '7953.00', null, null, null);
INSERT INTO `order_items` VALUES ('2', '2', '3', '6', '1', '3266.00', null, null, null);
INSERT INTO `order_items` VALUES ('3', '3', '2', '4', '17', '1050.00', null, null, null);
INSERT INTO `order_items` VALUES ('4', '4', '2', '2', '1', '7953.00', null, null, null);
INSERT INTO `order_items` VALUES ('5', '5', '4', '9', '1', '3024.00', null, null, null);
INSERT INTO `order_items` VALUES ('6', '6', '4', '9', '1', '3024.00', null, null, null);
INSERT INTO `order_items` VALUES ('7', '7', '7', '17', '1', '698.00', '5', '515115', '2019-08-23 03:08:22');
INSERT INTO `order_items` VALUES ('8', '8', '2', '2', '1', '7953.00', '5', '111221123213', '2019-08-23 03:42:13');
INSERT INTO `order_items` VALUES ('9', '9', '4', '8', '1', '4433.00', null, null, null);

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `paid_at` datetime DEFAULT NULL,
  `coupon_code_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text COLLATE utf8mb4_unicode_ci,
  `extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  UNIQUE KEY `orders_refund_no_unique` (`refund_no`),
  KEY `orders_coupon_code_id_foreign` (`coupon_code_id`),
  CONSTRAINT `orders_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '20190726083125735974', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '79530.00', null, '2019-08-20 16:54:51', null, null, null, 'pending', null, '0', '0', 'received', null, null, '2019-07-26 08:31:25', '2019-08-20 08:55:50');
INSERT INTO `orders` VALUES ('2', '20190726083340349619', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '3266.00', null, null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2019-07-26 08:33:40', '2019-07-26 08:33:40');
INSERT INTO `orders` VALUES ('3', '20190726084546305299', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '17850.00', null, null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2019-07-26 08:45:46', '2019-07-26 08:45:46');
INSERT INTO `orders` VALUES ('4', '20190819083538316001', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '7953.00', null, null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2019-08-19 08:35:38', '2019-08-19 08:35:39');
INSERT INTO `orders` VALUES ('5', '20190820074110539635', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '3024.00', '999', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2019-08-20 07:41:10', '2019-08-20 07:41:10');
INSERT INTO `orders` VALUES ('6', '20190820074240488478', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '3024.00', '55', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2019-08-20 07:42:40', '2019-08-20 07:42:41');
INSERT INTO `orders` VALUES ('7', '20190820074414987394', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '698.00', '2012120', '2019-08-20 16:54:51', null, null, null, 'pending', null, '0', '1', 'received', '{\"express_company\":\"fsdfsdffsd\",\"express_no\":\"1111\"}', null, '2019-08-20 07:44:14', '2019-08-23 03:08:23');
INSERT INTO `orders` VALUES ('8', '20190823033954526801', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '7953.00', null, '2019-08-20 16:54:51', null, null, null, 'pending', null, '0', '1', 'received', '{\"express_company\":\"151112\",\"express_no\":\"111212\"}', '{\"refund_reason\":\"\\u8ba9\\u4ed6\\u6eda\\u5165\\u6d1e\\u623f\\u521a\\u521a\\u53d1\\u7684\",\"refund_disagree_reason\":\"202022020\"}', '2019-08-23 03:39:54', '2019-08-23 07:43:43');
INSERT INTO `orders` VALUES ('9', '20190826080537951393', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c537\\u53f7\",\"zip\":194200,\"contact_name\":\"\\u7eaa\\u654f\",\"contact_phone\":\"13838880083\"}', '2305.16', null, null, '10', null, null, 'pending', null, '0', '0', 'pending', null, null, '2019-08-26 08:05:37', '2019-08-26 08:05:37');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `product_skus`
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES ('1', '座椅', '座椅', '11.00', '11', '1', '2019-07-25 08:07:48', '2019-07-25 08:07:48');
INSERT INTO `product_skus` VALUES ('2', 'similique', 'Nobis sequi enim ut ipsam est nulla.', '7953.00', '37005', '2', '2019-07-25 08:30:47', '2019-08-23 03:39:54');
INSERT INTO `product_skus` VALUES ('3', 'sit', 'Enim ut dicta reiciendis.', '5148.00', '35829', '2', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('4', 'delectus', 'Sint et excepturi et exercitationem voluptatum omnis.', '1050.00', '74141', '2', '2019-07-25 08:30:47', '2019-07-26 08:45:46');
INSERT INTO `product_skus` VALUES ('5', 'ut', 'Non sit ut et quia eveniet voluptatibus.', '3963.00', '57589', '3', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('6', 'labore', 'Eaque blanditiis voluptas perspiciatis illum deserunt quia nemo.', '3266.00', '97458', '3', '2019-07-25 08:30:47', '2019-07-26 08:33:40');
INSERT INTO `product_skus` VALUES ('7', 'laudantium', 'Facere recusandae voluptatem voluptatem.', '4027.00', '59639', '3', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('8', 'non', 'Et rerum voluptatem est facilis et molestiae.', '4433.00', '77759', '4', '2019-07-25 08:30:47', '2019-08-26 08:05:37');
INSERT INTO `product_skus` VALUES ('9', 'aspernatur', 'Voluptatem vel labore quidem quis unde.', '3024.00', '33612', '4', '2019-07-25 08:30:47', '2019-08-20 07:42:41');
INSERT INTO `product_skus` VALUES ('10', 'veniam', 'Quia omnis dolores voluptate libero et sint est.', '6933.00', '60948', '4', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('11', 'tenetur', 'Molestiae et et mollitia voluptate architecto ut vitae.', '2660.00', '95339', '5', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('12', 'voluptatibus', 'Ea architecto voluptas ut temporibus consequatur libero.', '259.00', '44931', '5', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('13', 'vero', 'Consequatur non animi quo recusandae ipsum.', '6860.00', '31063', '5', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('14', 'perferendis', 'Ullam expedita necessitatibus harum porro ut numquam.', '9636.00', '9934', '6', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('15', 'et', 'Voluptatum soluta alias dolores occaecati expedita soluta ipsam.', '4568.00', '20368', '6', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('16', 'totam', 'Nulla quo sit repellat quis et a totam.', '6426.00', '49574', '6', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('17', 'voluptas', 'Delectus eveniet non culpa nulla iure et.', '698.00', '37473', '7', '2019-07-25 08:30:47', '2019-08-20 07:44:14');
INSERT INTO `product_skus` VALUES ('18', 'sit', 'Quam debitis illo unde dolorem cum.', '8302.00', '28334', '7', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('19', 'omnis', 'Quibusdam deserunt necessitatibus eligendi assumenda voluptatem error.', '115.00', '33528', '7', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('20', 'architecto', 'Voluptas pariatur qui nobis voluptates aliquid facere.', '904.00', '23920', '8', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('21', 'libero', 'Porro est maxime nesciunt quam asperiores laboriosam velit.', '4300.00', '56457', '8', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('22', 'possimus', 'Illum quae odio earum sint.', '6514.00', '73685', '8', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('23', 'dignissimos', 'Repudiandae quibusdam omnis id ipsa modi nemo ullam.', '440.00', '49376', '9', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('24', 'neque', 'Id et facere quis necessitatibus.', '5183.00', '92666', '9', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('25', 'non', 'Qui velit similique excepturi veritatis dignissimos reprehenderit sit.', '999.00', '39323', '9', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('26', 'aliquam', 'Eos et sunt omnis nobis laborum sed error.', '8996.00', '69462', '10', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('27', 'harum', 'Ut distinctio voluptatem veritatis voluptatem temporibus placeat.', '5559.00', '8218', '10', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('28', 'excepturi', 'Molestiae similique est reprehenderit eaque eos aut.', '1753.00', '14545', '10', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('29', 'quo', 'Exercitationem dignissimos dolores ut qui.', '8542.00', '31472', '11', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('30', 'tenetur', 'Libero harum reprehenderit qui sed.', '1220.00', '43657', '11', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('31', 'fugiat', 'Inventore consequatur delectus eligendi.', '9783.00', '86675', '11', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('32', 'necessitatibus', 'Est ullam laboriosam et dignissimos rerum assumenda sed.', '4256.00', '14893', '12', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('33', 'ducimus', 'Exercitationem adipisci saepe aut possimus enim.', '2792.00', '90513', '12', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('34', 'eligendi', 'Illo dolorem modi dolorem odio.', '8512.00', '35187', '12', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('35', 'quo', 'Quasi aut accusantium sapiente ut rerum nostrum.', '6893.00', '83322', '13', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('36', 'impedit', 'Atque est nisi quasi atque iusto nesciunt a.', '9804.00', '61199', '13', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('37', 'aut', 'Amet sit impedit neque.', '5439.00', '52461', '13', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('38', 'eos', 'Est illum molestiae nulla iusto quia beatae cum.', '1219.00', '71553', '14', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('39', 'aliquam', 'Aut esse et eius distinctio.', '1146.00', '71867', '14', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('40', 'nam', 'Quos at praesentium quam soluta.', '5999.00', '30176', '14', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('41', 'eum', 'Et repellendus quibusdam fugit praesentium.', '8395.00', '52122', '15', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('42', 'maxime', 'Mollitia modi debitis sint aperiam dignissimos aliquid libero dicta.', '2329.00', '63471', '15', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('43', 'maxime', 'Sunt tempora ad magnam quam.', '7642.00', '13925', '15', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('44', 'at', 'Ut architecto perferendis in fugiat voluptatem similique perferendis.', '6759.00', '3639', '16', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('45', 'consequatur', 'Ratione corrupti accusamus dolores quis commodi.', '1012.00', '84711', '16', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('46', 'et', 'Nemo a totam non vero voluptatem eos.', '9523.00', '88200', '16', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('47', 'cupiditate', 'Soluta laboriosam inventore praesentium similique dolores veniam voluptatem.', '572.00', '79912', '17', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('48', 'ea', 'Omnis ea modi sapiente rerum occaecati.', '3989.00', '70231', '17', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('49', 'aliquam', 'Velit tenetur qui et officiis.', '6853.00', '45614', '17', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('50', 'tempora', 'Culpa nemo est rerum voluptate.', '4376.00', '83731', '18', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('51', 'sint', 'Aut eius odit adipisci dolorem alias asperiores praesentium.', '528.00', '64393', '18', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('52', 'reiciendis', 'Ab cupiditate sed ipsum eos debitis porro.', '6085.00', '3278', '18', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('53', 'iure', 'Modi dignissimos sapiente vero eius sed distinctio occaecati quo.', '7529.00', '17998', '19', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('54', 'a', 'Commodi omnis atque voluptas ab laboriosam et perspiciatis.', '990.00', '68383', '19', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('55', 'debitis', 'Nulla corrupti reprehenderit est tempora nesciunt voluptatum.', '5806.00', '5526', '19', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('56', 'dolores', 'Aut rerum est quia qui est est.', '2432.00', '79130', '20', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('57', 'earum', 'A voluptatum corrupti nobis sint dignissimos voluptatem.', '1986.00', '14211', '20', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('58', 'corrupti', 'Eligendi sit quia facilis animi molestiae quia quis.', '1346.00', '46097', '20', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('59', 'sed', 'Explicabo sed et quia quas saepe rerum eos.', '7239.00', '29896', '21', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('60', 'alias', 'Ipsam ea sapiente est eum.', '9739.00', '5369', '21', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('61', 'distinctio', 'Quo dignissimos ratione sequi ducimus reiciendis et assumenda.', '981.00', '56330', '21', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('62', 'vel', 'Quam iure sed delectus excepturi quia animi.', '9545.00', '15096', '22', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('63', 'fugit', 'Dolor tempore nemo tenetur voluptas voluptatum dolor voluptatibus.', '4304.00', '27332', '22', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('64', 'et', 'Et aliquid eius doloremque vero.', '6239.00', '98502', '22', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('65', 'ducimus', 'Deserunt accusamus dolor corporis omnis.', '2450.00', '35860', '23', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('66', 'minus', 'Sint voluptatem eius dolor et.', '3803.00', '18282', '23', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('67', 'voluptatem', 'Porro in modi ut eius.', '1946.00', '94122', '23', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('68', 'quaerat', 'Porro est fuga id velit voluptatem ducimus ex.', '5370.00', '26178', '24', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('69', 'accusamus', 'Et fugit incidunt ut nesciunt.', '5530.00', '90506', '24', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('70', 'nam', 'Non voluptas minus aut laborum sint placeat.', '4657.00', '107', '24', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('71', 'nostrum', 'Inventore repellendus accusamus non necessitatibus.', '7053.00', '67410', '25', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('72', 'reiciendis', 'Asperiores eum vitae eveniet tempore et.', '846.00', '53793', '25', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('73', 'odit', 'Maiores alias voluptates porro eaque temporibus.', '3091.00', '6365', '25', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('74', 'molestiae', 'Illo rerum modi voluptatem.', '2039.00', '45782', '26', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('75', 'consequatur', 'Et laudantium aut dolor odit sit similique nihil reprehenderit.', '2832.00', '26361', '26', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('76', 'voluptatem', 'Ratione ab nisi necessitatibus rerum natus deserunt dicta.', '3361.00', '3184', '26', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('77', 'sit', 'Sit non aut perspiciatis at labore possimus.', '5826.00', '69288', '27', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('78', 'dolorem', 'Rerum tempore et enim nobis aut nisi eligendi.', '6011.00', '97984', '27', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('79', 'laboriosam', 'Vitae reiciendis nihil facere sed voluptate.', '1450.00', '28680', '27', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('80', 'harum', 'Sit qui fugit voluptatem quas eum perspiciatis quos.', '3289.00', '4379', '28', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('81', 'reiciendis', 'Ut sunt dolor praesentium doloremque ut.', '7046.00', '11799', '28', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('82', 'ex', 'Eligendi et et minima.', '9476.00', '7263', '28', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('83', 'ad', 'Animi dolore consequatur fugit ut officia ea.', '7231.00', '18896', '29', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('84', 'molestiae', 'Cum doloremque laborum ut modi aperiam.', '3992.00', '70655', '29', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('85', 'minus', 'Cum exercitationem porro quos culpa.', '2741.00', '57931', '29', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('86', 'voluptas', 'Officiis omnis nesciunt inventore quo hic.', '3812.00', '22595', '30', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('87', 'quia', 'Dolorem beatae sint molestiae.', '6870.00', '91484', '30', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('88', 'corrupti', 'Qui vitae non sed dignissimos dolorum.', '5465.00', '79368', '30', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('89', 'magni', 'Officiis qui eligendi nesciunt necessitatibus ipsam.', '5578.00', '1284', '31', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('90', 'reiciendis', 'Quia mollitia qui alias mollitia corporis.', '5574.00', '40425', '31', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `product_skus` VALUES ('91', 'laboriosam', 'Dolor iure cumque inventore id eum qui.', '3387.00', '90590', '31', '2019-07-25 08:30:47', '2019-07-25 08:30:47');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `rating` double(8,2) NOT NULL DEFAULT '5.00',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '菜单', '<p>壁纸</p>', 'images/bizhi.jpg', '0', '5.00', '0', '0', '11.00', '2019-07-25 08:07:48', '2019-07-25 10:01:55');
INSERT INTO `products` VALUES ('2', 'tempore', 'Commodi sit et sit natus et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '5.00', '0', '2', '1050.00', '2019-07-25 08:30:46', '2019-08-23 03:42:14');
INSERT INTO `products` VALUES ('3', 'repudiandae', 'Omnis et dolore cum doloremque id amet sit eaque.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '3.00', '0', '0', '3266.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('4', 'illum', 'Exercitationem fugit consequuntur quo maxime rerum in odit earum.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '3.00', '0', '0', '3024.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('5', 'voluptatibus', 'Quam beatae dolor iusto laudantium et sit.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '4.00', '0', '0', '259.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('6', 'ipsam', 'Minima veniam eius in aliquid eos.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '3.00', '0', '0', '4568.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('7', 'et', 'Ratione molestiae soluta sunt quo iure doloremque ullam.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '1.00', '0', '0', '115.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('8', 'esse', 'Odit dignissimos quis dignissimos quia corporis vero eum vitae.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '5.00', '0', '0', '904.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('9', 'ea', 'Aperiam velit ut provident expedita aut culpa ipsa.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '0.00', '0', '0', '440.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('10', 'qui', 'Est veniam at neque reprehenderit.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '2.00', '0', '0', '1753.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('11', 'quo', 'Ipsa atque dolorum placeat laboriosam ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '5.00', '0', '0', '1220.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('12', 'voluptatem', 'Aut quaerat repellat et incidunt repudiandae quisquam neque.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '0.00', '0', '0', '2792.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('13', 'cum', 'Vitae dolorum recusandae quas voluptatibus saepe.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '2.00', '0', '0', '5439.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('14', 'praesentium', 'Quas incidunt et ut rerum sed vel ratione maxime.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '0.00', '0', '0', '1146.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('15', 'fugiat', 'Quo asperiores ab quo quis ex aut a quis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '4.00', '0', '0', '2329.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('16', 'est', 'Alias deserunt sunt numquam hic est dolorum.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '5.00', '0', '0', '1012.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('17', 'dolor', 'Sequi magni laboriosam dolores nihil aut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '1.00', '0', '0', '572.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('18', 'cumque', 'Alias ex vitae et maiores et temporibus facilis repellendus.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '5.00', '0', '0', '528.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('19', 'autem', 'Aspernatur dolores enim ducimus possimus ducimus.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '4.00', '0', '0', '990.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('20', 'sit', 'Officiis repellendus a iste ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '1.00', '0', '0', '1346.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('21', 'et', 'Ratione incidunt sed pariatur distinctio aspernatur unde a.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '4.00', '0', '0', '981.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('22', 'architecto', 'Placeat odio quas alias praesentium commodi.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.00', '0', '0', '4304.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('23', 'voluptates', 'Voluptas temporibus praesentium quibusdam consequatur nulla sapiente similique.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '0.00', '0', '0', '1946.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('24', 'aut', 'Quasi voluptatem deleniti excepturi repellendus sunt.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '4.00', '0', '0', '4657.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('25', 'enim', 'Non libero est qui sint alias maiores.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '1.00', '0', '0', '846.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('26', 'quod', 'Et repudiandae voluptatibus sunt sit rem accusamus consequatur.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '3.00', '0', '0', '2039.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('27', 'saepe', 'Qui qui est et autem repellendus.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '2.00', '0', '0', '1450.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('28', 'ex', 'Quia occaecati praesentium maiores est.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '1.00', '0', '0', '3289.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('29', 'ut', 'Ipsam recusandae explicabo adipisci aut sit minus est.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '4.00', '0', '0', '2741.00', '2019-07-25 08:30:46', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('30', 'sequi', 'Adipisci autem iure qui et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '0.00', '0', '0', '3812.00', '2019-07-25 08:30:47', '2019-07-25 08:30:47');
INSERT INTO `products` VALUES ('31', 'saepe', 'Eos modi facere omnis eos consequatur.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '5.00', '0', '0', '3387.00', '2019-07-25 08:30:47', '2019-07-25 08:30:47');

-- ----------------------------
-- Table structure for `user_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) unsigned NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES ('1', '1', '江苏省', '苏州市', '相城区', '第72街道第537号', '194200', '纪敏', '13838880083', '2019-08-26 08:05:37', '2019-07-24 08:40:15', '2019-08-26 08:05:37');
INSERT INTO `user_addresses` VALUES ('2', '1', '北京市', '市辖区', '东城区', '第95街道第666号', '581200', '仲冬梅', '15067230432', null, '2019-07-24 08:40:15', '2019-07-24 08:40:15');
INSERT INTO `user_addresses` VALUES ('3', '1', '北京市', '市辖区', '东城区', '第11街道第118号', '165800', '宫学明', '15712105180', null, '2019-07-24 08:40:15', '2019-07-24 08:40:15');

-- ----------------------------
-- Table structure for `user_favorite_products`
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite_products`;
CREATE TABLE `user_favorite_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_favorite_products
-- ----------------------------
INSERT INTO `user_favorite_products` VALUES ('3', '1', '2', '2019-07-26 03:53:41', '2019-07-26 03:53:41');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'yaoyingkang', '504735321@qq.com', '2019-07-24 08:29:41', '$2y$10$y.S0rl3/0WLOVpu0YQC5B.FlRgCyOmkocYndK6y6.1y4rWLh.EYYS', '0NnJvKDsZq1lJA10iOF56CxPp7w3zlDhxOHQaB3XorWTkrcB4ydl1CEFSIZf', '2019-07-24 08:10:13', '2019-07-24 08:29:41');
