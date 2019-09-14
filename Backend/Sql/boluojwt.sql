/*
 Navicat Premium Data Transfer

 Source Server         : 开发
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : 127.0.0.1:3306
 Source Schema         : boluojwt

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 08/09/2019 17:00:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for persinesss
-- ----------------------------
DROP TABLE IF EXISTS `persinesss`;
CREATE TABLE `persinesss`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `names` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限路由',
  `pid` int(11) NULL DEFAULT 0 COMMENT '无限极分类列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `names` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色名称',
  `level` int(255) NULL DEFAULT NULL COMMENT '角色等级（可后续迭代）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_pers
-- ----------------------------
DROP TABLE IF EXISTS `role_pers`;
CREATE TABLE `role_pers`  (
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `pers_id` int(11) NULL DEFAULT NULL COMMENT '权限id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `names` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '账号',
  `sex` int(2) NULL DEFAULT NULL COMMENT '性别',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `api_token` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '用户token',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 1, '21232f297a57a5a743894a0e4a801fc3', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwibmFtZXMiOiJhZG1pbiIsInNleCI6MSwicGFzc3dvcmQiOiIyMTIzMmYyOTdhNTdhNWE3NDM4OTRhMGU0YTgwMWZjMyIsImFwaV90b2tlbiI6ImV5SjBlWEFpT2lKS1YxUWlMQ0poYkdjaU9pSklVekkxTmlKOS5leUpwWkNJNk1Td2libUZ0WlhNaU9pSmhaRzFwYmlJc0luTmxlQ0k2TVN3aWNHRnpjM2R2Y21RaU9pSXlNVEl6TW1ZeU9UZGhOVGRoTldFM05ETTRPVFJoTUdVMFlUZ3dNV1pqTXlJc0ltRndhVjkwYjJ0bGJpSTZJbVY1U2pCbFdFRnBUMmxLUzFZeFVXbE1RMHBvWWtkamFVOXBTa2xWZWtreFRtbEtPUzVsZVVwd1drTkpOazFUZDJsaWJVWjBXbGhOYVU5cFNtaGFSekZ3WW1sSmMwbHVUbXhsUTBrMlRWTjNhV05IUm5wak0yUjJZMjFSYVU5cFNYbE5WRWw2VFcxWmVVOVVaR2hPVkdSb1RsZEZNMDVFVFRSUFZGSm9UVWRWTUZsVVozZE5WMXBxVFhsSmMwbHRSbmRoVmprd1lqSjBiR0pwU1RaSmJWWTFVMnBDYkZkRlJuQlVNbXhMVXpGWmVGVlhiRTFSTUhCdldXdGthbUZWT1hCVGEyeFdaV3RyZUZSdGJFdFBVelZzWlZWd2QxZHJUa3BPYXpGVVpESnNhV0pWV2pCWGJHaE9ZVlU1Y0ZOdGFHRlNla1ozV1cxc1NtTXdiSFZVYlhoc1VUQnJNbFJXVGpOaFYwNUlVbTV3YWsweVVqSlpNakZTWVZVNWNGTlliRTVXUld3MlZGY3hXbVZWT1ZWYVIyaFBWa2RTYjFSc1pFWk5NRFZGVkZSU1VGWkdTbTlVVldSV1RVWnNWVm96WkU1V01YQnhWRmhzU21Nd2JIUlNibVJvVm1wcmQxbHFTakJpUjBwd1UxUmFTbUpXV1RGVk1uQkRZa1prUmxKdVFsVk5iWGhNVlhwR1dtVkdWbGhpUlRGU1RVaENkbGRYZEd0aGJVWldUMWhDVkdFeWVGZGFWM1J5WlVaU2RHSkZkRkJWZWxaeldsWldkMlF4WkhKVWEzQlBZWHBHVlZwRVNuTmhWMHBXVjJwQ1dHSkhhRTlaVmxVMVkwWk9kR0ZIUmxObGExb3pWMWN4YzFOdFRYZGlTRlpWWWxob2MxVlVRbkpOYkZKWFZHcE9hRll3TlVsVmJUVjNZV3N3ZVZWcVNscE5ha1pUV1ZaVk5XTkdUbGxpUlRWWFVsZDNNbFpHWTNoWGJWWldUMVpXWVZJeWFGQldhMlJUWWpGU2MxcEZXazVOUkZaR1ZrWlNVMVZHV2tkVGJUbFZWbGRTVjFSVlduTldWbTk2V2tVMVYwMVlRbmhXUm1oelUyMU5kMkpJVWxOaWJWSnZWbTF3Y21ReGJIRlRha0pwVWpCd2QxVXhVbUZoVjBwelYyNXdXbUV3TkhwWlZscHpWMVphZEdSRmNHaGlWR3gzVlRGa2MwMHlSbGRqUm14b1UwZFNTMWxYTURWT1JsSnpWV3h3VGsxRWJGWldSbWh2VkRGYVIySkVUbFZTVlRWTVdUQmFjMWRXVmxoaVJrSm9ZVEZXTkZaSE1YZGhhelZXVFZSYVUxWkZXazlWYTFaSFpXeE9XRTFZVG14aVZUUXhWVEZTWVZOdFJsWmlTSEJVVm5wR00xUlZaRWRXUms1VlYydHdhR0V5ZERWV1JFWnJWRzFXVmsxV1ZtRlNNMmhvV1ZkMFlXTXhVbk5WYkZwc1ZsUkZNbFpITVhkWGJVcFhVbGhzVlUxV1NuRlVWM2gzVWxad05sWnJOVk5OVlZZelZqRmFhMUpyTlVaaVNFSnJUVzE0Y0Zsc1ZuZGtSazVZWTBoYWJGSlVWbFpXTVZKUFZVWmFSazFVVWxWaVJrcERXa1JDTkZKR1RuVmpSM1JYVFVkNGQxWkVTbk5UYlVaWVYyeEtUV0ZyTldGVk1GazFUa1pSZVZOcmRGVldNSEJaV1cweFQxSlZPVWxUYkVKUFlsUkdTbGRzVlhoaE1EbFhXWHBTVldKdGVGRlZNM0JyVWpGU2RGUnJUbFZoYkVWNVZsWldSMUV4Y0ZkU1YyeE5VVEJ3YjFwR1pGSmhWVGx3VTFkc1RWRXdjSE5hVldoQ1lWVTVjVkpVUms5aGJVMHhWRmh3Umswd01VVldXRTVLWWxkNGIxcEZUa3BPYXpGVlZsUktUMlZ0ZERaVVZsSmFUVVUxVkdReWJHaFhSVFUyVTFkd2RtRlZiSEJrTW14b1lteEtkMU5YY0haaFZURjBWRzEwVUZJeFZUQlhiVEZMWVZac1ZWRlVTazlOYkZwdlYxaHdXazVGTlZWVGJYaE9UV3RhY2xkV1VsSmxSVEI1VW0xMFRtSlZWbkJVUlU1TFpGWnNkRmRYYkZCaGExVjRWRzF3YWs1Vk1UWlNWRXBQVWtaV2VsTlhOVTlOVm14d1UxUmFTbUZWYnpWTWFtaHRaREpXZVZwVWFGZFZSbVJzVFZWME1rMVlhRXhXUjBac1RVZDRiVlpZY0hSU2JUbEZZVVpvUWsxR1ZUUmhSemg2WWxaR1ZGTkdWV2xNUTBwb1pGZFJhVTlwU1dsTVEwcHNaVWhCYVU5cVJURk9hbU0xVFhwRk0wNXFVWE5KYld4b1pFTkpOazFVVlRKT2VtdDZUVlJqZDA1RGQybGhXRTU2U1dwdmFVbHBkMmxoYmxKd1NXcHZhVTFIU1hsT01sVjNUMGRaZVU1cVRURlpWRnBxV1hwYWFFNTZUbTFaZWtsNlRtMWFiVTFFVlRSUFJHdHBURU5LZFZsdFdXbFBha1V4VG1wak5VMTZSVE5OUkZGelNXNU9NVmxwU1RaSmFVbzVMa2xtYmtkNWFtRXpPR2xUVG1SS1ptdzJXR3BtYW5nMmFUWnlTMUpRTFZCc1ExRndSVE5oZFROcFMyOGlMQ0poZFdRaU9pSWlMQ0psZUhBaU9qRTFOamM1TXpFNE1UUXNJbWxoZENJNk1UVTJOemt6TVRjMU5Dd2lhWE56SWpvaUlpd2lhblJwSWpvaU1EZ3hZMkV6TWpsaFpqTXdOemN5WlRjeU1XTTBNV0UxWWpKa1ptRmpPREFpTENKdVltWWlPakUxTmpjNU16RTNOVFFzSW5OMVlpSTZJaUo5LmFRc0ZMMHpHdHdwczhzeFZOUF9jaTB5VGRLM1dFRzJCMVI5MTM4NlFjWlEiLCJhdWQiOiIiLCJleHAiOjE1Njc5MzE4NTQsImlhdCI6MTU2NzkzMTc5NCwiaXNzIjoiIiwianRpIjoiYTYwYTIxYzE5NDNlNDZmNDI4ZjIzZGIwY2FkNGUwNmIiLCJuYmYiOjE1Njc5MzE3OTQsInN1YiI6IiJ9.N6hdjwv68LU9sliuKpEJ_4ttDUSb_JiiLjDZpoZcUjE');
INSERT INTO `users` VALUES (2, 'admins', 1, '2aefc34200a294a3cc7db81b43a81873', NULL);
INSERT INTO `users` VALUES (3, 'testadmin', 1, '9283a03246ef2dacdc21a9b137817ec1', NULL);

SET FOREIGN_KEY_CHECKS = 1;
