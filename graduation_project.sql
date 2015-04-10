/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : graduation_project

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-04-10 18:05:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gr_message_board
-- ----------------------------
DROP TABLE IF EXISTS `gr_message_board`;
CREATE TABLE `gr_message_board` (
  `id` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ejy0it95yf0v9guaj6lymgss1` (`user_id`),
  CONSTRAINT `FK_ejy0it95yf0v9guaj6lymgss1` FOREIGN KEY (`user_id`) REFERENCES `gr_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_message_board
-- ----------------------------
INSERT INTO `gr_message_board` VALUES ('402880a54c9bf7ef014c9c1aa5650000', '12312', '<p>123123123</p>', '2015-04-09 13:57:19', '2015-04-09 10:55:34', '402880a54c703480014c703531df0001');
INSERT INTO `gr_message_board` VALUES ('402880a54c9c2ee7014c9c2f84650000', 'dg', '<p>123123123</p>', '2015-04-09 13:57:16', '2015-04-09 11:18:22', '402880a54c703480014c703531df0001');

-- ----------------------------
-- Table structure for gr_permission
-- ----------------------------
DROP TABLE IF EXISTS `gr_permission`;
CREATE TABLE `gr_permission` (
  `id` varchar(32) NOT NULL,
  `resource` varchar(50) DEFAULT NULL,
  `describtion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_permission
-- ----------------------------
INSERT INTO `gr_permission` VALUES ('1', '/index', '首页');
INSERT INTO `gr_permission` VALUES ('402880a54c781297014c7821f9360005', '/user/**', '用户管理所有权限');
INSERT INTO `gr_permission` VALUES ('402880a54c781297014c78221f180006', '/role/**', '角色管理所有权限');
INSERT INTO `gr_permission` VALUES ('402880a54c781297014c782261700007', '/permission/**', '资源管理所有权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78b69a7a0000', '/user/list', '用户列表权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78b6c4f20001', '/user/view/**', '用户查看权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78b700e30002', '/user/edit/**', '用户编辑权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78b747e90003', '/user/delete/**', '用户删除权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78b79fdf0004', '/user/create', '用户创建权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78bb4706000a', '/user/authorization/**', '用户角色授权权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78bb81c9000b', '/role/list', '角色列表权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78bc540f000c', '/role/view/**', '角色查看权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78bc8d99000d', '/role/edit/**', '角色编辑权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78bd0e18000e', '/role/delete/**', '角色删除权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78bd4141000f', '/role/create', '角色创建权限');
INSERT INTO `gr_permission` VALUES ('402880a54c78afeb014c78bd97ce0010', '/role/authorization/**', '角色资源授权权限');
INSERT INTO `gr_permission` VALUES ('402880a54c7cff2c014c7d00c29e0000', '/permission/list', '资源列表权限');
INSERT INTO `gr_permission` VALUES ('402880a54c7cff2c014c7d0108130001', '/permission/view/**', '资源查看权限');
INSERT INTO `gr_permission` VALUES ('402880a54c7cff2c014c7d018b5e0002', '/permission/edit/**', '资源编辑权限');
INSERT INTO `gr_permission` VALUES ('402880a54c7cff2c014c7d01f4230003', '/permission/delete/**', '资源删除权限');
INSERT INTO `gr_permission` VALUES ('402880a54c7cff2c014c7d026c640004', '/permission/create', '资源创建权限');
INSERT INTO `gr_permission` VALUES ('402880a54c9c6c3a014c9c6db0f00000', '/user/person_info', '用户个人信息查看');
INSERT INTO `gr_permission` VALUES ('402880a54c9c75ad014c9c7706aa0000', '/user/person_info/edit/*', '个人信息修改');
INSERT INTO `gr_permission` VALUES ('402880a54ca23b89014ca23d90880002', '/user/verified/*', '用户审核管理');
INSERT INTO `gr_permission` VALUES ('402880a54ca2c814014ca2c8f9300000', '/organization/verified/*', '组织审核管理');

-- ----------------------------
-- Table structure for gr_role
-- ----------------------------
DROP TABLE IF EXISTS `gr_role`;
CREATE TABLE `gr_role` (
  `id` varchar(32) NOT NULL,
  `role` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_role
-- ----------------------------
INSERT INTO `gr_role` VALUES ('1', 'administrator', '超级管理员');
INSERT INTO `gr_role` VALUES ('402880a54c703480014c7034f4140000', 'user', '普通用户');

-- ----------------------------
-- Table structure for gr_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `gr_role_permission`;
CREATE TABLE `gr_role_permission` (
  `permission_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FK_95av2hxwj3idnycgr6coa3e3i` (`permission_id`),
  CONSTRAINT `FK_95av2hxwj3idnycgr6coa3e3i` FOREIGN KEY (`permission_id`) REFERENCES `gr_permission` (`id`),
  CONSTRAINT `FK_rht8qk9vns0is4u0hsac9jlmj` FOREIGN KEY (`role_id`) REFERENCES `gr_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_role_permission
-- ----------------------------
INSERT INTO `gr_role_permission` VALUES ('1', '1');
INSERT INTO `gr_role_permission` VALUES ('1', '402880a54c703480014c7034f4140000');
INSERT INTO `gr_role_permission` VALUES ('402880a54c781297014c7821f9360005', '1');
INSERT INTO `gr_role_permission` VALUES ('402880a54c781297014c78221f180006', '1');
INSERT INTO `gr_role_permission` VALUES ('402880a54c781297014c782261700007', '1');
INSERT INTO `gr_role_permission` VALUES ('402880a54c78afeb014c78b69a7a0000', '402880a54c703480014c7034f4140000');
INSERT INTO `gr_role_permission` VALUES ('402880a54c78afeb014c78b6c4f20001', '402880a54c703480014c7034f4140000');
INSERT INTO `gr_role_permission` VALUES ('402880a54c9c6c3a014c9c6db0f00000', '402880a54c703480014c7034f4140000');
INSERT INTO `gr_role_permission` VALUES ('402880a54c9c75ad014c9c7706aa0000', '402880a54c703480014c7034f4140000');
INSERT INTO `gr_role_permission` VALUES ('402880a54ca23b89014ca23d90880002', '1');
INSERT INTO `gr_role_permission` VALUES ('402880a54ca23b89014ca23d90880002', '402880a54c703480014c7034f4140000');
INSERT INTO `gr_role_permission` VALUES ('402880a54ca2c814014ca2c8f9300000', '1');
INSERT INTO `gr_role_permission` VALUES ('402880a54ca2c814014ca2c8f9300000', '402880a54c703480014c7034f4140000');

-- ----------------------------
-- Table structure for gr_user
-- ----------------------------
DROP TABLE IF EXISTS `gr_user`;
CREATE TABLE `gr_user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `id_card` varchar(18) DEFAULT NULL,
  `organization` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8ua51o2s0mlsg9v6pb3ksg6qp` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_user
-- ----------------------------
INSERT INTO `gr_user` VALUES ('402880714c2c520b014c2c62d71f0001', 'admin', '5dbad86ed484048627dbf0c5ce71cba8', 'd44ea472ecb7450d8d202f3959f1ae8e', '', 'perman@163.com', '18883871276', '', null, null, null, null);
INSERT INTO `gr_user` VALUES ('402880a54c703480014c703531df0001', 'liwenhe', '94da57fb64343da253bc892055463366', '7ab7ff34641a415486dcf62fe8566ceb', '', 'perman@163.com', '18883871271', '', '2015-03-31 22:21:17', '李文禾', '500236199308256878', '北京市');
INSERT INTO `gr_user` VALUES ('402880a54ca2b1be014ca2bc2adb0001', 'xiaoer', '90e6ddcde22ad275338804fd91f737aa', '9edafa73d0454d608ee5666a82dd6e5a', '', 'xer@163.com', '18884444441', null, '2015-04-10 17:49:43', '熊大', '123', '重庆市');

-- ----------------------------
-- Table structure for gr_user_role
-- ----------------------------
DROP TABLE IF EXISTS `gr_user_role`;
CREATE TABLE `gr_user_role` (
  `role_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_3mxegv8idyruvaewhdkvg2y6d` (`role_id`),
  CONSTRAINT `FK_3mxegv8idyruvaewhdkvg2y6d` FOREIGN KEY (`role_id`) REFERENCES `gr_role` (`id`),
  CONSTRAINT `FK_6olbjmdbtnn02i26dqbrvkdv5` FOREIGN KEY (`user_id`) REFERENCES `gr_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_user_role
-- ----------------------------
INSERT INTO `gr_user_role` VALUES ('1', '402880714c2c520b014c2c62d71f0001');
INSERT INTO `gr_user_role` VALUES ('402880a54c703480014c7034f4140000', '402880a54c703480014c703531df0001');
INSERT INTO `gr_user_role` VALUES ('402880a54c703480014c7034f4140000', '402880a54ca2b1be014ca2bc2adb0001');

-- ----------------------------
-- Table structure for gr_verified_organization
-- ----------------------------
DROP TABLE IF EXISTS `gr_verified_organization`;
CREATE TABLE `gr_verified_organization` (
  `id` varchar(32) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `source` varchar(64) DEFAULT NULL,
  `destination` varchar(64) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lx7xufvcpusbcqmte8o27jequ` (`creator`),
  CONSTRAINT `FK_lx7xufvcpusbcqmte8o27jequ` FOREIGN KEY (`creator`) REFERENCES `gr_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_verified_organization
-- ----------------------------
INSERT INTO `gr_verified_organization` VALUES ('402880a54ca2ae8c014ca2af2f480000', '3', '重庆市', '北京市', '<p>123</p>', '2015-04-10 17:38:49', '402880a54c703480014c703531df0001', '');

-- ----------------------------
-- Table structure for gr_verified_user
-- ----------------------------
DROP TABLE IF EXISTS `gr_verified_user`;
CREATE TABLE `gr_verified_user` (
  `id` varchar(32) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3yw83ssaru9f05416l7gwhyyr` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_verified_user
-- ----------------------------
