/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 30/07/2019 11:47:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `heardimage` varchar(1000) DEFAULT NULL,
  `lastchoose` varchar(1024) DEFAULT NULL,
  `lastchoosehelp` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (1, '123', '123', '123', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', NULL, NULL);
INSERT INTO `admin` VALUES (2, '1234', '1234', '1234', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', NULL, NULL);
INSERT INTO `admin` VALUES (3, '12345', '12345', '12345', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', NULL, NULL);
INSERT INTO `admin` VALUES (4, '123456', '123456', '123456', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', '[\'已完成\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `admin` VALUES (5, '123456', 'trait', '123123', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_phtml
-- ----------------------------
DROP TABLE IF EXISTS `admin_phtml`;
CREATE TABLE `admin_phtml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(1000) NOT NULL,
  `date` varchar(1025) NOT NULL,
  `statistics` int(11) DEFAULT NULL,
  `file` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for catalogue
-- ----------------------------
DROP TABLE IF EXISTS `catalogue`;
CREATE TABLE `catalogue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(100) NOT NULL,
  `alias` varchar(1000) NOT NULL,
  `childs` varchar(1000) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `c_sort` int(11) DEFAULT NULL,
  `path` varchar(1000) NOT NULL,
  `parent` varchar(1000) NOT NULL,
  `sheet_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '1' COMMENT '为1是文件，为2是文件夹',
  `date` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalogue
-- ----------------------------
BEGIN;
INSERT INTO `catalogue` VALUES (1, 'aaa', 'el-icon-folder', '万科财务分析2', NULL, 1, 1, '/tt', '/', 1, 2, '');
INSERT INTO `catalogue` VALUES (2, 'aa', 'el-icon-folder', 'hide', NULL, 1, 1, '/tt/2', '/tt', 1, 1, NULL);
INSERT INTO `catalogue` VALUES (80, NULL, 'el-icon-document', 'dd', NULL, 1, NULL, '/tt/dd', '/tt', 85, 1, NULL);
INSERT INTO `catalogue` VALUES (81, NULL, 'el-icon-document', 'xx', NULL, 1, NULL, '/tt/xx', '/tt', 86, 1, NULL);
INSERT INTO `catalogue` VALUES (82, NULL, 'el-icon-document', '00', NULL, 1, NULL, '/tt/00', '/tt', 87, 1, NULL);
INSERT INTO `catalogue` VALUES (83, NULL, 'el-icon-document', '111', NULL, 1, NULL, '/tt/111', '/tt', 88, 1, NULL);
INSERT INTO `catalogue` VALUES (84, NULL, 'el-icon-document', 'xxzz', NULL, 1, NULL, '/tt/xxzz', '/tt', 89, 1, NULL);
INSERT INTO `catalogue` VALUES (85, NULL, 'el-icon-document', 'fffff', NULL, 1, NULL, '/tt/fffff', '/tt', 90, 1, NULL);
INSERT INTO `catalogue` VALUES (86, NULL, 'el-icon-document', 'zx', NULL, 1, NULL, '/tt/zx', '/tt', 91, 1, NULL);
INSERT INTO `catalogue` VALUES (87, NULL, 'el-icon-document', 'asdasd', NULL, 1, NULL, '/tt/asdasd', '/tt', 92, 1, NULL);
INSERT INTO `catalogue` VALUES (88, NULL, 'el-icon-document', 'zxczxc', NULL, 1, NULL, '/tt/zxczxc', '/tt', 93, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for filtrate
-- ----------------------------
DROP TABLE IF EXISTS `filtrate`;
CREATE TABLE `filtrate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `thing` varchar(1024) NOT NULL,
  `username` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filtrate
-- ----------------------------
BEGIN;
INSERT INTO `filtrate` VALUES (27, 'name', 2, '不包含', '1010120180131479064', 'trait');
INSERT INTO `filtrate` VALUES (28, 'wash', 2, '包含', '123132', 'trait');
COMMIT;

-- ----------------------------
-- Table structure for filtrate_copy1
-- ----------------------------
DROP TABLE IF EXISTS `filtrate_copy1`;
CREATE TABLE `filtrate_copy1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `thing` varchar(1024) NOT NULL,
  `username` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for minapp
-- ----------------------------
DROP TABLE IF EXISTS `minapp`;
CREATE TABLE `minapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(102) NOT NULL,
  `app_url` varchar(1024) NOT NULL,
  `app_headimage` varchar(1024) NOT NULL,
  `date` varchar(1024) NOT NULL,
  `visible` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of minapp
-- ----------------------------
BEGIN;
INSERT INTO `minapp` VALUES (1, '明读数据', 'http://180.169.75.199:5007/s/', '/static/Images/mindu.png', '2019-07-18', 1);
INSERT INTO `minapp` VALUES (2, 'es的图形化操作', 'http://192.168.31.9:5601', 'https://raw.githubusercontent.com/elastic/kibana/12b93bcdd1054a34f3e336ecc9217fc8ff9c6883/x-pack/test_utils/chrome_extension/test_subjects_finder/images/kibana128.png', '2019-07-18', 2);
INSERT INTO `minapp` VALUES (3, '校正平台', 'http://192.168.31.9:8023', '/static/Images/mindu.png', '2019-07-18', 1);
COMMIT;

-- ----------------------------
-- Table structure for phtml
-- ----------------------------
DROP TABLE IF EXISTS `phtml`;
CREATE TABLE `phtml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL COMMENT '状态',
  `date` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `wash` varchar(1024) DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `username` varchar(1000) DEFAULT NULL,
  `root` varchar(1000) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `dialog` varchar(1024) DEFAULT NULL,
  `dialog_help` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dd` (`path`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phtml
-- ----------------------------
BEGIN;
INSERT INTO `phtml` VALUES (1, '1010120180131479064.html', 2, '2019-07-12 17:19:59', '/Volumes/d/working_dir/html_check/19_06_24/2018/01/31/1010120180131479064.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180131479064.html', '[]', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/01/31/', 14, '[\'已完成\', \'列标题\', \'线框图文字\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (2, '1010120180210349268.html', 2, '2019-07-09 17:05:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/02/10/1010120180210349268.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180210349268.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/02/10/', 35, '[\'已完成\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (3, '1010120180316505490.html', 2, '2019-07-10 16:04:33', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/16/1010120180316505490.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180316505490.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/16/', 10, '[\'已完成\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (4, '1010120180320476219.html', 2, '2019-07-10 16:08:43', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/20/1010120180320476219.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180320476219.html', '[]', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/20/', 1, '[\'已完成\', \'线框图文字\', \'列标题\', \'已完成\', \'行标题\', \'冗余\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (5, '1020120180321949971.html', 2, '2019-07-04 15:04:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/21/1020120180321949971.html', '\\\\192.168.31.99\\d\\working_dir\\html_check\\19_06_24\\2018\\10\\31\\10101201810311296.html', '', 'trait', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/21/', 4, '[\'页眉\', \'分块行\', \'头部附注\', \'数据单位\', \'中部附注\', \'章节\', \'有编附注\', \'跨页单元格\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': True, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': True, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (6, '1010120180322892705.html', 2, '2019-07-05 10:07:49', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/22/1010120180322892705.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180322892705.html', '', 'trait', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/22/', 5, '[\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\', \'其他 \', \'中部附注\', \'跨页单元格\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': True, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (7, '10201201803221478001.html', 2, '2019-07-11 11:02:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/22/10201201803221478001.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_10201201803221478001.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/22/', 1, '[\'已完成\', \'线框图文字\', \'列标题\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (8, '1010120180323316400.html', 2, '2019-07-10 16:46:48', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/23/1010120180323316400.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180323316400.html', '[]', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/23/', 1, '[\'已完成\', \'线框图文字\', \'列标题\', \'已完成\', \'行标题\', \'冗余\', \'其他 \', \'内容\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (9, '1010120180324474256.html', 2, '2019-07-10 16:54:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/24/1010120180324474256.html', '\\\\192.168.31.99\\d\\working_dir\\html_check\\19_06_24\\2018\\10\\31\\10101201810311296.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/24/', 1, '[\'已完成\', \'线框图文字\', \'列标题\', \'已完成\', \'行标题\', \'冗余\', \'其他 \', \'内容\', \'中部附注\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (10, '1010120180324474613.html', 2, '2019-07-05 10:08:48', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/24/1010120180324474613.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180324474613.html', '[ \"大面积标注不清\", null]', 'trait', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/24/', 4, '[\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\', \'其他 \', \'中部附注\', \'跨页单元格\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (11, '1010120180327668305.html', 2, '2019-07-05 17:39:29', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/27/1010120180327668305.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180327668305.html', '', 'trait', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/27/', 1, '[\'行标题\', \'已完成\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (12, '1010120180327668699.html', 2, '2019-07-11 10:59:53', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/27/1010120180327668699.html', '\\\\192.168.31.99\\d\\working_dir\\html_check\\19_06_24\\2018\\10\\31\\10101201810311296.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/27/', 1, '[\'已完成\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (13, '10201201803271315727.html', 1, '2019-07-03 15:45:12', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/27/10201201803271315727.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/03/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (14, '1020120180328856925.html', 2, '2019-07-10 17:12:43', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/28/1020120180328856925.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1020120180328856925.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/28/', 1, '[\'已完成\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (15, '101012018032925184.html', 2, '2019-07-10 17:02:31', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/29/101012018032925184.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_101012018032925184.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/29/', 1, '[\'已完成\', \'线框图文字\', \'已完成\', \'行标题\', \'冗余\', \'其他 \', \'中部附注\', \'子标题\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (16, '1010120180329256414.html', 2, '2019-07-11 11:02:32', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/29/1010120180329256414.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180329256414.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/29/', 1, '[\'已完成\', \'线框图文字\', \'列标题\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (18, '1020120180329333332.html', 2, '2019-07-10 17:03:01', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/29/1020120180329333332.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1020120180329333332.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/29/', 1, '[\'已完成\', \'线框图文字\', \'已完成\', \'行标题\', \'冗余\', \'其他 \', \'中部附注\', \'子标题\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (20, '1010120180330756843.html', 2, '2019-07-11 11:09:43', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/30/1010120180330756843.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180330756843.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/30/', 1, '[\'已完成\', \'线框图文字\', \'列标题\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (21, '1010120180330885393.html', 2, '2019-07-11 16:09:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/30/1010120180330885393.html', '/Users/wen/Desktop/work/phtml_draw/dist/new_1010120180330885393.html', '', '123456', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/30/', 1, '[\'已完成\']', '[{\'title\': \'表格外文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'页眉\', \'页脚\', \'文字行\', \'线框图文字\', \'冗余\', \'其他 \']}, {\'title\': \'表格内文字\', \'checkAll\': False, \'isIndeterminate\': True, \'checkedCities\': [], \'content\': [\'分块行\', \'子标题\', \'内容\', \'列标题\', \'行标题\', \'其他\']}, {\'title\': \'表格相关文字\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'头部附注\', \'数据单位\', \'中部附注\']}, {\'title\': \'高级\', \'checkAll\': False, \'isIndeterminate\': False, \'checkedCities\': [], \'content\': [\'章节\', \'有编附注\', \'跨页单元格\']}]');
INSERT INTO `phtml` VALUES (22, '1010120180331669887.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/31/1010120180331669887.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/03/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (23, '10201201803311525613.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/03/31/10201201803311525613.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/03/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (24, '101012018040479610.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/04/101012018040479610.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/04/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (25, '1010120180411274303.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/11/1010120180411274303.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/11/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (26, '1010120180411617026.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/11/1010120180411617026.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/11/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (27, '1020120180411215665.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/11/1020120180411215665.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/11/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (28, '101012018041326892.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/13/101012018041326892.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/13/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (29, '1010120180417874292.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/17/1010120180417874292.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/17/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (30, '10201201804171802522.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/17/10201201804171802522.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/17/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (31, '1010120180418733217.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/18/1010120180418733217.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/18/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (32, '1010120180420345131.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/1010120180420345131.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (33, '1010120180420662001.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/1010120180420662001.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (34, '1010120180420736884.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/1010120180420736884.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (35, '1010120180420888163.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/1010120180420888163.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (36, '1010120180420888293.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/1010120180420888293.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (37, '10201201804201444053.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/10201201804201444053.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (38, '1010120180421546254.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/21/1010120180421546254.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/21/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (39, '1010120180421563412.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/21/1010120180421563412.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/21/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (40, '1010120180421563901.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/21/1010120180421563901.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/21/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (41, '1020120180421761415.html', 1, '2019-07-03 15:45:13', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/21/1020120180421761415.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/21/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (42, '1010120180424730315.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/1010120180424730315.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (43, '1010120180424872633.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/1010120180424872633.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (44, '1010120180424872647.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/1010120180424872647.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (45, '10201201804241702209.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/10201201804241702209.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (46, '10201201804241707367.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/10201201804241707367.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (47, '1010120180425210732.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/1010120180425210732.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (48, '1010120180425210738.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/1010120180425210738.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (49, '101012018042576905.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/101012018042576905.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (50, '1010120180425770204.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/1010120180425770204.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (51, '101012018042581078.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/101012018042581078.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (52, '1010120180426432535.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426432535.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (53, '1010120180426432550.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426432550.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (54, '1010120180426433908.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426433908.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (55, '1010120180426489789.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426489789.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (56, '1010120180426491104.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426491104.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (57, '1010120180426491229.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426491229.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (58, '1010120180426491482.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426491482.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (59, '1010120180426542655.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426542655.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (60, '1010120180426542765.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426542765.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (61, '1010120180426556192.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426556192.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (62, '1010120180426556301.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426556301.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (63, '1010120180426556643.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/1010120180426556643.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (64, '1010120180427428197.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427428197.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (65, '1010120180427428299.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427428299.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (66, '1010120180427429049.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427429049.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (67, '1010120180427430601.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427430601.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (68, '1010120180427486719.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427486719.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (69, '1010120180427487269.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427487269.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (70, '1010120180427488753.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427488753.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (71, '1010120180427538540.html', 1, '2019-07-03 15:45:14', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427538540.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (72, '1010120180427538645.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427538645.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (73, '1010120180427538769.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427538769.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (74, '1010120180427539343.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427539343.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (75, '1010120180427539565.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427539565.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (76, '1010120180427539579.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427539579.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (77, '1010120180427539667.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427539667.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (78, '1010120180427540118.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427540118.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (79, '1010120180427559660.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/1010120180427559660.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (80, '10201201804271080366.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/10201201804271080366.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (81, '1010120180428350224.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428350224.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (82, '1010120180428350344.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428350344.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (83, '1010120180428351197.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428351197.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (84, '1010120180428351207.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428351207.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (85, '1010120180428351568.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428351568.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (86, '1010120180428351799.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428351799.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (87, '1010120180428352043.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428352043.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (88, '1010120180428352284.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428352284.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (89, '1010120180428352547.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428352547.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (90, '1010120180428353880.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428353880.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (91, '1010120180428689286.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428689286.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (92, '1010120180428689392.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428689392.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (93, '1010120180428689642.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428689642.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (94, '1010120180428690918.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428690918.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (95, '1010120180428696120.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428696120.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (96, '1010120180428696727.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428696727.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (97, '1010120180428697486.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428697486.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (98, '1010120180428697615.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428697615.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (99, '1010120180428697860.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428697860.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (100, '1010120180428697862.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428697862.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (101, '1010120180428698091.html', 1, '2019-07-03 15:45:15', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428698091.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (102, '1010120180428698343.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428698343.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (103, '1010120180428698348.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428698348.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (104, '1010120180428700595.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428700595.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (105, '1010120180428700716.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428700716.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (106, '1010120180428701316.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428701316.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (107, '1010120180428701429.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428701429.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (108, '1010120180428701813.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428701813.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (109, '1010120180428702437.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428702437.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (110, '1010120180428703296.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428703296.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (111, '1010120180428703427.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428703427.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (112, '1010120180428703791.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428703791.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (113, '1010120180428703803.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428703803.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (114, '1010120180428705499.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428705499.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (115, '1010120180428894958.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428894958.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (116, '1010120180428894964.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428894964.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (117, '1010120180428895102.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428895102.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (118, '1010120180428895823.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428895823.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (119, '1010120180428896072.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428896072.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (120, '1010120180428896460.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/1010120180428896460.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/04/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (121, '10201201807261520807.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/07/26/10201201807261520807.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/07/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (122, '1010120180803245691.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/03/1010120180803245691.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/03/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (123, '1020120180804317155.html', 1, '2019-07-03 15:45:16', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/04/1020120180804317155.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/04/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (124, '10201201808101520952.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/10/10201201808101520952.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/10/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (125, '1020120180815333983.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/15/1020120180815333983.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/15/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (126, '1020120180815719031.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/15/1020120180815719031.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/15/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (127, '1010120180817576762.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/17/1010120180817576762.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/17/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (128, '1020120180817997038.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/17/1020120180817997038.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/17/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (129, '1020120180818452203.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/18/1020120180818452203.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/18/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (130, '101012018082115708.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/21/101012018082115708.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/21/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (131, '1010120180821447204.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/21/1010120180821447204.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/21/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (132, '10201201808211008558.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/21/10201201808211008558.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/21/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (133, '1020120180821987754.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/21/1020120180821987754.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/21/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (134, '101012018082232264.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/101012018082232264.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (135, '1010120180822577616.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/1010120180822577616.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (136, '10201201808221011220.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/10201201808221011220.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (137, '1020120180822988441.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/1020120180822988441.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (138, '1020120180822993680.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/1020120180822993680.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/22/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (139, '101012018082315048.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/23/101012018082315048.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/23/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (140, '101012018082315141.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/23/101012018082315141.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/23/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (141, '1010120180823743144.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/23/1010120180823743144.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/23/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (142, '1010120180823880918.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/23/1010120180823880918.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/23/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (143, '101012018082410732.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/24/101012018082410732.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (144, '101012018082435992.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/24/101012018082435992.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (145, '1020120180824332390.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/24/1020120180824332390.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (146, '101012018082517632.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/25/101012018082517632.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (147, '1010120180825505434.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/25/1010120180825505434.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (148, '1020120180825980441.html', 1, '2019-07-03 15:45:17', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/25/1020120180825980441.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (149, '1010120180828317183.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/1010120180828317183.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (150, '10101201808285972.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/10101201808285972.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (151, '10101201808286484.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/10101201808286484.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (152, '1010120180828782981.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/1010120180828782981.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (153, '101012018082891962.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/101012018082891962.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (154, '10101201808289521.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/10101201808289521.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (155, '1020120180828447703.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/1020120180828447703.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (156, '1020120180828772797.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/1020120180828772797.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/28/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (157, '1010120180829578111.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/29/1010120180829578111.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/29/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (158, '10101201808296898.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/29/10101201808296898.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/29/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (159, '10201201808291403706.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/29/10201201808291403706.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/29/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (160, '10201201808291403819.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/29/10201201808291403819.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/29/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (161, '1010120180830241525.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/1010120180830241525.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (162, '101012018083027581.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/101012018083027581.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (163, '101012018083029316.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/101012018083029316.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (164, '1010120180830590564.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/1010120180830590564.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (165, '1020120180830225458.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/1020120180830225458.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (166, '1020120180830225756.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/1020120180830225756.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (167, '10201201808311181469.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/10201201808311181469.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (168, '10201201808311181557.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/10201201808311181557.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (169, '1020120180831979537.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/1020120180831979537.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (170, '1020120180831979852.html', 1, '2019-07-03 15:45:18', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/1020120180831979852.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (171, '1020120180831989076.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/1020120180831989076.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/08/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (172, '10201201809011169478.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/09/01/10201201809011169478.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/09/01/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (173, '101012018092011840.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/09/20/101012018092011840.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/09/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (174, '10101201809203884.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/09/20/10101201809203884.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/09/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (175, '1010120181012198.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/12/1010120181012198.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/12/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (176, '101012018101222405.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/12/101012018101222405.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/12/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (177, '10101201810181.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/18/10101201810181.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/18/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (178, '10101201810184194.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/18/10101201810184194.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/18/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (179, '1010120181019188.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/19/1010120181019188.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/19/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (180, '101012018101936755.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/19/101012018101936755.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/19/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (181, '101012018102015203.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/20/101012018102015203.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (182, '1010120181020164.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/20/1010120181020164.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/20/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (183, '1010120181024221.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/24/1010120181024221.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (184, '101012018102423267.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/24/101012018102423267.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/24/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (185, '101012018102525282.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/25/101012018102525282.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (186, '1010120181025319.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/25/1010120181025319.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/25/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (187, '10101201810261067.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/10101201810261067.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (188, '1010120181026109.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/1010120181026109.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (189, '1010120181026176.html', 1, '2019-07-03 15:45:19', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/1010120181026176.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (190, '1010120181026224.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/1010120181026224.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (191, '1010120181026229.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/1010120181026229.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (192, '101012018102630767.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/101012018102630767.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (193, '101012018102632476.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/101012018102632476.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (194, '101012018102633366.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/101012018102633366.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (195, '101012018102633880.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/101012018102633880.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (196, '101012018102634326.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/101012018102634326.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (197, '101012018102634461.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/101012018102634461.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (198, '101012018102634602.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/101012018102634602.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (199, '101012018102634702.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/101012018102634702.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (200, '1010120181026403.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/1010120181026403.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (201, '1010120181026488.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/1010120181026488.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (202, '1010120181026541.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/1010120181026541.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/26/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (203, '10101201810271003.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/10101201810271003.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (204, '1010120181027103.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/1010120181027103.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (205, '10101201810271160.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/10101201810271160.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (206, '1010120181027128.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/1010120181027128.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (207, '1010120181027249.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/1010120181027249.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (208, '101012018102729391.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102729391.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (209, '101012018102729641.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102729641.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (210, '101012018102730034.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102730034.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (211, '101012018102731148.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102731148.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (212, '101012018102731155.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102731155.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (213, '101012018102731761.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102731761.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (214, '101012018102731884.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102731884.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (215, '101012018102733216.html', 1, '2019-07-03 15:45:20', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102733216.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (216, '101012018102734834.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102734834.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (217, '101012018102734846.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102734846.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (218, '1010120181027357.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/1010120181027357.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (219, '1010120181027726.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/1010120181027726.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (220, '1010120181027752.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/1010120181027752.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (221, '101012018102782.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102782.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (222, '101012018102794.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/101012018102794.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/27/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (223, '10101201810301062.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/10101201810301062.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (224, '1010120181030123.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030123.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (225, '1010120181030145.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030145.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (226, '10101201810301897.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/10101201810301897.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (227, '10101201810301911.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/10101201810301911.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (228, '1010120181030215.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030215.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (229, '1010120181030225.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030225.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (230, '101012018103023726.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103023726.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (231, '101012018103023728.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103023728.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (232, '101012018103023969.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103023969.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (233, '101012018103024095.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103024095.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (234, '101012018103024217.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103024217.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (235, '101012018103024224.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103024224.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (236, '101012018103024591.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103024591.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (237, '101012018103024706.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103024706.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (238, '101012018103024714.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103024714.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (239, '101012018103024717.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103024717.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (240, '101012018103025811.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103025811.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (241, '101012018103026272.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026272.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (242, '101012018103026344.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026344.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (243, '101012018103026448.html', 1, '2019-07-03 15:45:21', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026448.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (244, '101012018103026526.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026526.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (245, '101012018103026606.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026606.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (246, '101012018103026659.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026659.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (247, '101012018103026730.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026730.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (248, '101012018103026761.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026761.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (249, '101012018103026973.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103026973.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (250, '101012018103027145.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103027145.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (251, '101012018103027154.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103027154.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (252, '101012018103027381.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103027381.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (253, '101012018103028132.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103028132.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (254, '1010120181030283.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030283.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (255, '1010120181030342.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030342.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (256, '101012018103036.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/101012018103036.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (257, '10101201810304.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/10101201810304.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (258, '1010120181030468.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030468.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (259, '1010120181030500.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030500.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (260, '1010120181030545.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030545.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (261, '10101201810306.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/10101201810306.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (262, '1010120181030619.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030619.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (263, '1010120181030690.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030690.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (264, '1010120181030697.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030697.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (265, '1010120181030732.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030732.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (266, '1010120181030740.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030740.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (267, '1010120181030743.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030743.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (268, '1010120181030834.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030834.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (269, '1010120181030843.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030843.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (270, '1010120181030964.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/1010120181030964.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/30/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (271, '10101201810311006.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311006.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (272, '10101201810311059.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311059.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (273, '1010120181031110.html', 1, '2019-07-03 15:45:22', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031110.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (274, '10101201810311117.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311117.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (275, '10101201810311172.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311172.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (276, '10101201810311173.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311173.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (277, '10101201810311177.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311177.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (278, '10101201810311183.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311183.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (279, '10101201810311296.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311296.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (280, '10101201810311317.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311317.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (281, '10101201810311446.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311446.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (282, '10101201810311553.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810311553.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (283, '1010120181031246.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031246.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (284, '1010120181031352.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031352.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (285, '1010120181031358.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031358.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (286, '1010120181031376.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031376.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (287, '1010120181031389.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031389.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (288, '1010120181031414.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031414.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (289, '1010120181031432.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031432.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (290, '101012018103160.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/101012018103160.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (291, '1010120181031601.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031601.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (292, '1010120181031614.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031614.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (293, '1010120181031696.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031696.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (294, '10101201810316997.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810316997.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (295, '10101201810316998.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810316998.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (296, '10101201810317004.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/10101201810317004.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (297, '1010120181031818.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031818.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (298, '1010120181031906.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/1010120181031906.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/10/31/', NULL, NULL, NULL);
INSERT INTO `phtml` VALUES (299, '10201201812291463.html', 1, '2019-07-03 15:45:23', '/Volumes/d/working_dir/html_check/19_06_24/2018/12/29/10201201812291463.html', NULL, '', NULL, '/Volumes/d/working_dir/html_check/19_06_24/2018/12/29/', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for recently_file
-- ----------------------------
DROP TABLE IF EXISTS `recently_file`;
CREATE TABLE `recently_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` varchar(1024) NOT NULL,
  `date` varchar(1024) NOT NULL,
  `user_id` int(124) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recently_file
-- ----------------------------
BEGIN;
INSERT INTO `recently_file` VALUES (44, '/home/tt/xx', '2019-07-30 11:27:10', 123456);
INSERT INTO `recently_file` VALUES (45, '/home/tt/dd', '2019-07-30 11:27:23', 123456);
INSERT INTO `recently_file` VALUES (46, '/home/tt/00', '2019-07-30 11:27:00', 123456);
INSERT INTO `recently_file` VALUES (47, '/home/tt/111', '2019-07-30 11:27:02', 123456);
INSERT INTO `recently_file` VALUES (48, '/home/tt/xxzz', '2019-07-30 11:27:03', 123456);
INSERT INTO `recently_file` VALUES (49, '/home/tt/fffff', '2019-07-26 20:45:28', 123456);
INSERT INTO `recently_file` VALUES (50, '/home/tt/zx', '2019-07-30 11:27:03', 123456);
INSERT INTO `recently_file` VALUES (51, '/home/tt/asdasd', '2019-07-30 11:27:04', 123456);
INSERT INTO `recently_file` VALUES (52, '/home/tt/zxczxc', '2019-07-30 11:27:04', 123456);
COMMIT;

-- ----------------------------
-- Table structure for sheet
-- ----------------------------
DROP TABLE IF EXISTS `sheet`;
CREATE TABLE `sheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_date` varchar(1024) NOT NULL,
  `sheet_last` int(11) NOT NULL COMMENT '为1表示最后一次编辑表格',
  `trade_code` varchar(1000) DEFAULT NULL,
  `sheet_name` varchar(1024) NOT NULL,
  `sheet_path` varchar(500) NOT NULL COMMENT '映射到本地下的一个目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sheet
-- ----------------------------
BEGIN;
INSERT INTO `sheet` VALUES (1, '2019-05-18 09:20:24', 0, '600548.SH', '..', '');
INSERT INTO `sheet` VALUES (73, '2019-07-26 19:22:14', 1, '', '00', 'tmp638145367.json');
INSERT INTO `sheet` VALUES (85, '2019-07-26 20:37:54', 1, '', 'dd', 'tmp739517247.json');
INSERT INTO `sheet` VALUES (86, '2019-07-26 20:34:27', 1, '', 'xx', 'tmp277960799.json');
INSERT INTO `sheet` VALUES (87, '2019-07-26 20:34:04', 1, '', '00', 'tmp526794659.json');
INSERT INTO `sheet` VALUES (88, '2019-07-26 20:41:15', 1, '', '111', 'tmp708376244.json');
INSERT INTO `sheet` VALUES (89, '2019-07-26 20:45:17', 1, '', 'xxzz', 'tmp320080686.json');
INSERT INTO `sheet` VALUES (90, '2019-07-26 20:44:47', 1, '', 'fffff', 'tmp804478357.json');
INSERT INTO `sheet` VALUES (91, '2019-07-26 20:45:42', 1, '', 'zx', 'tmp72742409.json');
INSERT INTO `sheet` VALUES (92, '2019-07-26 20:46:57', 1, '', 'asdasd', 'tmp95579021.json');
INSERT INTO `sheet` VALUES (93, '2019-07-26 20:49:57', 1, '', 'zxczxc', 'tmp68956240.json');
COMMIT;

-- ----------------------------
-- Table structure for user_app
-- ----------------------------
DROP TABLE IF EXISTS `user_app`;
CREATE TABLE `user_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_app
-- ----------------------------
BEGIN;
INSERT INTO `user_app` VALUES (1, 4, 1);
INSERT INTO `user_app` VALUES (4, 11, 1);
INSERT INTO `user_app` VALUES (5, 4, 2);
INSERT INTO `user_app` VALUES (6, 12, 1);
INSERT INTO `user_app` VALUES (7, 1, 2);
INSERT INTO `user_app` VALUES (8, 1, 1);
INSERT INTO `user_app` VALUES (9, 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user`;
CREATE TABLE `weixin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(102) NOT NULL,
  `nickname` varchar(102) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `city` varchar(102) DEFAULT NULL,
  `province` varchar(102) DEFAULT NULL,
  `headimage` varchar(1024) DEFAULT NULL,
  `unionid` varchar(102) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user
-- ----------------------------
BEGIN;
INSERT INTO `weixin_user` VALUES (11, 'o8FUd6INgyPD8oTQkmKWjojBYFsA', 'trait', 1, 'Yangzhou', 'Jiangsu', 'http://thirdwx.qlogo.cn/mmopen/vi_32/QD6bf8hkS5cH9oAdVNOXnLTOce6lCTlInPwOh6bN8gZngo1gAwQYy6yyibU8QPWyriaBhX4Q12vxaOA0WwOw5ZhQ/132', 'oBrBh1a3lo_zBPzifcx7VwhxS5F8');
INSERT INTO `weixin_user` VALUES (12, 'o8FUd6KKS5x6VJeyXerMZ1ODK2fk', 'å¯æ­¤', 1, 'Baoshan', 'Shanghai', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erRsvrHQDtIzxDIOYeoCy7yicG19LRHiaov1BG0z0S28s7U5iaIEgbSYhFdGK1gRcp6H3UhibNicEXmEuw/132', 'oBrBh1aPhVxArHELufoMpz9CqCDY');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
