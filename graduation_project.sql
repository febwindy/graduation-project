/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : graduation_project

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-04-03 10:03:36
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8ua51o2s0mlsg9v6pb3ksg6qp` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gr_user
-- ----------------------------
INSERT INTO `gr_user` VALUES ('402880714c2c520b014c2c62d71f0001', 'admin', '5dbad86ed484048627dbf0c5ce71cba8', 'd44ea472ecb7450d8d202f3959f1ae8e', '', 'perman@163.com', '18883871276', '', null);
INSERT INTO `gr_user` VALUES ('402880a54c703480014c703531df0001', 'liwenhe', 'fc558ed3602f4a1fd62f9087dcc91295', '4ccd4ca0775f4ddcb1e59a26a0bf371d', '', 'perman@163.com', '18883871271', '', '2015-03-31 22:21:17');

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
