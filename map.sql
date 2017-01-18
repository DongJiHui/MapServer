/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : map

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-01-18 12:36:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `a_username` varchar(30) NOT NULL,
  `a_password` varchar(30) NOT NULL,
  `a_email` varchar(30) DEFAULT NULL,
  `a_addTime` datetime DEFAULT NULL,
  `a_updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`a_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('root', '123456', null, null, null);
INSERT INTO `admin` VALUES ('ruanshanshan', 'ruanshanshan', null, null, null);
INSERT INTO `admin` VALUES ('wangqianyun', 'wangqianyun', null, null, null);
INSERT INTO `admin` VALUES ('zhangyunteng', 'zhangyunteng', null, null, null);
INSERT INTO `admin` VALUES ('zhangzhongjun', 'zhangzhongjun', null, null, null);

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `d_id` varchar(50) NOT NULL,
  `d_name` varchar(30) NOT NULL,
  `d_addTime` datetime DEFAULT NULL,
  `d_addAdmin` varchar(30) DEFAULT NULL,
  `d_updateTime` datetime DEFAULT NULL,
  `d_upadateAdmin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '西城区', '2016-04-29 17:38:05', 'hunter', '2016-04-29 17:38:05', 'hunter');
INSERT INTO `district` VALUES ('36b5044a-0354-47fd-afe5-b2ecd8d2da90', '朝阳区', '2016-04-30 23:41:12', 'hunter', '2016-04-30 23:41:12', 'hunter');
INSERT INTO `district` VALUES ('40dd81c4-185d-4ecf-a1da-9d442b15a82b', '平谷区', '2016-05-26 14:23:05', 'ruanshanshan', '2016-05-26 14:23:05', 'ruanshanshan');
INSERT INTO `district` VALUES ('4acb0f43-f662-49eb-bd3f-82cdff423622', '石景山区', '2016-05-19 08:50:40', 'root', '2016-05-19 08:50:40', 'root');
INSERT INTO `district` VALUES ('93683218-0eaa-4ca6-a6cf-956810dc9f16', '怀柔区', '2016-05-12 12:59:51', 'hunter', '2016-05-12 12:59:51', 'hunter');
INSERT INTO `district` VALUES ('bd12beab-5326-4398-92a8-e8d796a8f6d1', '房山区', '2016-04-29 17:38:19', 'hunter', '2016-04-29 17:38:19', 'hunter');
INSERT INTO `district` VALUES ('e862948e-f4a7-4566-829d-73782896a824', '海淀区', '2016-04-28 21:39:27', 'hunter', '2016-05-17 13:38:10', 'wangqianyun');

-- ----------------------------
-- Table structure for `district_schoolarea_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `district_schoolarea_mapping`;
CREATE TABLE `district_schoolarea_mapping` (
  `d_id` varchar(50) NOT NULL,
  `sa_id` varchar(50) NOT NULL,
  `m_addTime` datetime DEFAULT NULL,
  `m_addAdmin` varchar(30) DEFAULT NULL,
  `m_upadateTime` datetime DEFAULT NULL,
  `m_updateAdmin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`d_id`,`sa_id`),
  KEY `schoolArea_fk` (`sa_id`),
  CONSTRAINT `district_fk` FOREIGN KEY (`d_id`) REFERENCES `district` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schoolArea_fk` FOREIGN KEY (`sa_id`) REFERENCES `schoolarea` (`sa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of district_schoolarea_mapping
-- ----------------------------
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '018f1ed7-d684-4399-94e5-d4aa42fe721b', '2016-05-27 14:37:31', 'zhangyunteng', '2016-05-27 14:37:31', 'zhangyunteng');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '04ca4371-324d-4683-a24b-305a1e2d42d3', '2016-05-27 14:16:48', 'zhangyunteng', '2016-05-27 15:50:55', 'root');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '06ac2ff2-9656-4906-ab72-9fd1233d4d52', '2016-05-27 14:44:57', 'zhangyunteng', '2016-05-27 14:44:57', 'zhangyunteng');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '4504c9a6-53ba-4180-9791-49909d453662', '2016-05-27 14:53:21', 'zhangyunteng', '2016-05-27 15:29:57', 'root');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '54581c6c-c423-45be-af5e-b8a727f07e01', '2016-05-27 14:34:03', 'zhangyunteng', '2016-05-27 15:51:29', 'root');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '57ea4899-3bb9-4a40-9f7b-088943f8982c', '2016-05-27 15:07:07', 'zhangyunteng', '2016-05-27 15:51:56', 'root');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '5cfd202e-084a-4c3b-97ac-e540143f2ee1', '2016-05-27 14:25:39', 'zhangyunteng', '2016-05-27 15:52:25', 'root');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', '8ed32491-cb1c-47dd-b913-37b24a26f83e', '2016-05-27 14:57:28', 'zhangyunteng', '2016-05-27 14:57:28', 'zhangyunteng');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', 'cab61196-6fc8-4473-b754-0abff62f92a2', '2016-05-27 14:20:26', 'zhangyunteng', '2016-05-27 14:20:26', 'zhangyunteng');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', 'd4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '2016-05-27 15:12:27', 'zhangyunteng', '2016-05-27 15:21:07', 'zhangyunteng');
INSERT INTO `district_schoolarea_mapping` VALUES ('31b187da-e4fc-44db-aa2c-70dd1acd2630', 'e8040dab-9ef4-4698-a2fe-b84636ef883e', '2016-05-27 14:11:49', 'zhangyunteng', '2016-05-27 15:53:06', 'root');
INSERT INTO `district_schoolarea_mapping` VALUES ('e862948e-f4a7-4566-829d-73782896a824', '4eda427b-e418-4a8c-baa8-096c0b76030c', '2016-05-05 14:53:11', 'hunter', '2016-05-11 22:45:26', 'hunter');
INSERT INTO `district_schoolarea_mapping` VALUES ('e862948e-f4a7-4566-829d-73782896a824', 'e4e767b9-4abf-4b1f-a24a-d96109c69672', '2016-07-08 15:03:50', null, '2016-07-08 15:08:00', null);
INSERT INTO `district_schoolarea_mapping` VALUES ('e862948e-f4a7-4566-829d-73782896a824', 'f2c4d944-8e2f-462f-b729-db4efcb96d00', '2016-05-07 14:01:36', 'hunter', '2016-06-02 14:42:51', 'zhangyunteng');

-- ----------------------------
-- Table structure for `my_union`
-- ----------------------------
DROP TABLE IF EXISTS `my_union`;
CREATE TABLE `my_union` (
  `un_id` varchar(50) NOT NULL,
  `un_name` varchar(50) NOT NULL,
  `un_type` smallint(10) NOT NULL,
  PRIMARY KEY (`un_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_union
-- ----------------------------
INSERT INTO `my_union` VALUES ('09fa87e9-1d43-4046-8d3f-17b571499268', 'dfss', '2');
INSERT INTO `my_union` VALUES ('3a970996-764c-4121-91f3-d662459fe36d', 'dfsdgssss', '3');
INSERT INTO `my_union` VALUES ('949fd1bf-59f9-447f-9f0e-9e4e902edd9d', '北京市某区', '0');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `r_id` varchar(50) NOT NULL,
  `r_name` varchar(30) NOT NULL,
  `r_address` varchar(100) DEFAULT NULL,
  `r_type` varchar(10) DEFAULT NULL,
  `r_score` varchar(10) DEFAULT NULL,
  `r_description` varchar(200) DEFAULT NULL,
  `r_points` longtext,
  `r_scaleParam` int(11) DEFAULT NULL,
  `r_middlePoint` varchar(50) DEFAULT NULL,
  `r_url` varchar(200) DEFAULT NULL,
  `r_phone` varchar(20) DEFAULT NULL,
  `r_addTime` datetime DEFAULT NULL,
  `r_addAdmin` varchar(30) DEFAULT NULL,
  `r_updateTime` datetime DEFAULT NULL,
  `r_updateAdmin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `s_id` varchar(50) NOT NULL,
  `s_name` varchar(30) NOT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_character` varchar(10) DEFAULT NULL,
  `s_type` varchar(10) DEFAULT NULL,
  `s_score` varchar(10) DEFAULT NULL,
  `s_description` varchar(200) DEFAULT NULL,
  `s_points` longtext,
  `s_scaleParam` int(11) DEFAULT NULL,
  `s_middlePoint` varchar(50) DEFAULT NULL,
  `s_url` varchar(200) DEFAULT NULL,
  `s_phone` varchar(20) DEFAULT NULL,
  `s_addTime` datetime DEFAULT NULL,
  `s_addAdmin` varchar(30) DEFAULT NULL,
  `s_updateTime` datetime DEFAULT NULL,
  `s_updateAdmin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('048aaccb-09fb-4a83-99e1-2433d46efbf4', '新街口东街小学', '新街口东街5号', '公立', '小学', '3', '测试-新街口东街小学', null, null, '{\"lng\":116.37839,\"lat\":39.942711}', 'http://www.xjxjkdjxx.org/', '66161132', '2016-05-31 18:26:54', 'zhangyunteng', '2016-05-31 18:26:54', 'zhangyunteng');
INSERT INTO `school` VALUES ('04b7226b-bdb6-484a-ab60-a309629d378c', '北京四中（合并六十三中）', '', '公立', '初中', '2.5', '测试-北京四中（合并六十三中）', null, null, '{\"lng\":116.358314,\"lat\":39.880439}', '', '', '2016-05-31 19:55:45', 'zhangyunteng', '2016-05-31 19:55:45', 'zhangyunteng');
INSERT INTO `school` VALUES ('07adc245-fc7b-40d5-9e9f-3b06e8acfbce', '西城区师范学校附属小学', '德外安德路六铺炕', '公立', '小学', '3.2', '测试-西城区师范学校附属小学', null, null, '{\"lng\":116.390986,\"lat\":39.955632}', 'http://www.bjxsfx.org', '62071890', '2016-05-31 18:41:02', 'zhangyunteng', '2016-05-31 18:41:02', 'zhangyunteng');
INSERT INTO `school` VALUES ('09568c4c-b406-4b23-8beb-3146fbf82ba7', '西城区实验小学', '南菜园街35-2', '公立', '小学', '4', '测试-西城区实验小学', null, null, '{\"lng\":116.353217,\"lat\":39.874194}', '', '52990909', '2016-05-27 16:26:11', 'zhangyunteng', '2016-05-27 16:26:11', 'zhangyunteng');
INSERT INTO `school` VALUES ('09ff316f-d5ee-489f-aa7f-06d374846bd8', '育民小学', '真武庙头条8号（近复兴商业城）', '公立', '小学', '3', '测试-育民小学', null, null, '{\"lng\":116.349916,\"lat\":39.905786}', '', '68013581', '2016-05-27 18:59:04', 'zhangyunteng', '2016-05-27 18:59:04', 'zhangyunteng');
INSERT INTO `school` VALUES ('0b268843-2e0d-4b46-96e6-4dd3e6e498cf', '北京小学', '北线阁12号', '公立', '小学', '4', '测试-北京小学', null, null, '{\"lng\":116.360646,\"lat\":39.896908}', 'http://bjxx.xchjw.cn/', '', '2016-05-30 22:22:03', 'zhangyunteng', '2016-05-30 22:22:03', 'zhangyunteng');
INSERT INTO `school` VALUES ('0be461f1-e4d3-48b5-bdc1-5683e69d867b', '北京宣武外国语实验学校', '广外莲花河胡同4号', '公立', '初中', '3.2', '测试-北京宣武外国语实验学校', null, null, '{\"lng\":116.328404,\"lat\":39.891656}', 'http://www.flesedu.com/', '63517673', '2016-05-31 20:00:14', 'zhangyunteng', '2016-05-31 20:00:14', 'zhangyunteng');
INSERT INTO `school` VALUES ('1010de96-514d-472a-ae60-57a207ccd392', '西外附小', '西城区北礼士路133号', '公立', '小学', '2', '测试-西外附小', null, null, '{\"lng\":116.352949,\"lat\":39.929881}', '', '68355412', '2016-05-27 18:51:23', 'zhangyunteng', '2016-05-27 18:51:23', 'zhangyunteng');
INSERT INTO `school` VALUES ('10208cc8-aafc-4bb8-9961-e29d503feb2e', '西四北四条小学', '西四北四条47号', '公立', '小学', '', '测试-西四北四条小学', null, null, '{\"lng\":116.36854,\"lat\":39.928703}', 'http://www.xjxsb4txx.org/', '66181672', '2016-05-31 11:14:33', 'zhangyunteng', '2016-05-31 11:14:33', 'zhangyunteng');
INSERT INTO `school` VALUES ('1131ec58-35d3-4f54-b901-dbb9a261bbab', '北京师范大学第二附属中学', '北京市西城区新街口外大街12号', '公立', '高中', '7.7', '示例学校', null, null, '{\"lng\":116.373996,\"lat\":39.961417}', 'http://www.shsbnu.net/', '123456', '2016-05-07 14:03:33', 'hunter', '2016-05-07 14:03:33', 'hunter');
INSERT INTO `school` VALUES ('15ab7d54-aa2d-4600-9296-5d322e55a750', '测试学校', '', '公立', '小学', '', '', null, null, '{\"lng\":116.370178,\"lat\":39.880163}', '', '', '2016-05-12 13:19:50', 'hunter', '2016-05-12 13:19:50', 'hunter');
INSERT INTO `school` VALUES ('161af7a0-aeca-4887-aa89-94cc10128dd6', '一六一中附小', '北长街71号', '公立', '小学', '3', '测试-一六一中附小', null, null, '{\"lng\":116.390973,\"lat\":39.918182}', '', '', '2016-05-31 11:42:18', 'zhangyunteng', '2016-05-31 11:42:18', 'zhangyunteng');
INSERT INTO `school` VALUES ('16af60ec-0acc-4ce6-ba05-ebc5d4779733', '北京回民学校', '广安门内大街223号', '公立', '初中', '3.2', '测试-北京回民学校', null, null, '{\"lng\":116.366259,\"lat\":39.890405}', '', '63046958', '2016-05-31 20:20:28', 'zhangyunteng', '2016-05-31 20:20:28', 'zhangyunteng');
INSERT INTO `school` VALUES ('1a62932b-2df3-432d-8772-8f57ac804371', '陶然亭小学', '龙爪槐胡同6号', '公立', '小学', '3', '测试-陶然亭小学', null, null, '{\"lng\":116.378585,\"lat\":39.877774}', '', '83512703', '2016-05-27 16:23:05', 'zhangyunteng', '2016-05-27 16:23:05', 'zhangyunteng');
INSERT INTO `school` VALUES ('1cf50b1c-4161-4575-9af0-553ad0fb4265', '进步小学', '西直门外南大街榆树馆胡同1号', '公立', '小学', '3', '测试-进步小学', null, null, '{\"lng\":116.34798,\"lat\":39.936507}', '', '68351098', '2016-05-27 18:47:53', 'zhangyunteng', '2016-05-27 18:47:53', 'zhangyunteng');
INSERT INTO `school` VALUES ('1d693538-27d6-47f8-b625-ce79978a625d', '三义里小学', '广外三义里四号', '公立', '小学', '4', '测试-三义里小学', null, null, '{\"lng\":116.328544,\"lat\":39.88688}', 'www.xcqsylxx.com', '63464375', '2016-05-27 16:40:04', 'zhangyunteng', '2016-05-27 16:40:04', 'zhangyunteng');
INSERT INTO `school` VALUES ('20d38531-96a1-419f-856d-62b76893e8ff', '实验二小长安校区', '东绒线胡同41号', '公立', '小学', '3', '测试-实验二小长安校区', null, null, '{\"lng\":116.386459,\"lat\":39.90462}', '', '66054186', '2016-05-31 11:47:54', 'zhangyunteng', '2016-05-31 11:47:54', 'zhangyunteng');
INSERT INTO `school` VALUES ('29eeb5c1-98b4-4f13-ba50-c5fca9d558bc', '第十三中学附属小学', '西煤场胡同7号', '公立', '小学', '3.2', '测试-第十三中学附属小学', null, null, '{\"lng\":116.389732,\"lat\":39.938843}', 'http://www.xjlyjxx.org/', '', '2016-05-31 18:36:33', 'zhangyunteng', '2016-05-31 18:36:33', 'zhangyunteng');
INSERT INTO `school` VALUES ('2db0b6ef-e5fe-40ef-a0b0-61d710635e16', '复兴门外第一小学', '复兴门外大街地藏庵23号', '公立', '小学', '3', '测试-复兴门外第一小学', null, null, '{\"lng\":116.347939,\"lat\":39.912889}', 'http://www.xjfxmw1x.org/', '68027807', '2016-05-27 19:14:29', 'zhangyunteng', '2016-05-27 19:14:29', 'zhangyunteng');
INSERT INTO `school` VALUES ('2fd901ca-24e8-498f-abb2-c53b757f617d', 'test', '', '公立', '小学', '', '', null, null, '{\"lng\":116.355501,\"lat\":39.873708}', '', '', '2016-05-12 13:27:03', 'hunter', '2016-05-12 13:27:03', 'hunter');
INSERT INTO `school` VALUES ('30b27fd7-d8b9-4fc2-bde6-6d95316fe766', '假学校1', '', '公立', '小学', '', '', null, null, '{\"lng\":116.363473,\"lat\":39.977676}', '', '', '2016-05-20 19:27:27', 'wangqianyun', '2016-05-20 19:27:27', 'wangqianyun');
INSERT INTO `school` VALUES ('31ab7050-6389-493e-8ac0-085c9d9b60e7', '鸦儿胡同小学', '西城区鸦儿胡同25号', '公立', '小学', '2.5', '测试-鸦儿胡同小学', null, null, '{\"lng\":116.391814,\"lat\":39.940715}', 'http://www.xjyexx.org', '64040172', '2016-05-31 18:25:36', 'zhangyunteng', '2016-05-31 18:25:36', 'zhangyunteng');
INSERT INTO `school` VALUES ('3362fe1a-c6d5-48b2-bd99-a17651c92b44', '北京十五中（合并一四零中）', '盆儿胡同58号', '公立', '初中', '3.2', '测试-北京十五中（合并一四零中）', null, null, '{\"lng\":116.371637,\"lat\":39.880568}', '', '', '2016-05-31 19:38:53', 'zhangyunteng', '2016-05-31 19:38:53', 'zhangyunteng');
INSERT INTO `school` VALUES ('35693d44-460b-4f22-887b-5948e9f932dc', '西单小学', '中京畿道1号', '公立', '小学', '3.4', '测试-西单小学', null, null, '{\"lng\":116.369564,\"lat\":39.909399}', '', '66071253', '2016-05-30 22:48:40', 'zhangyunteng', '2016-05-30 22:48:40', 'zhangyunteng');
INSERT INTO `school` VALUES ('369fe3c5-4599-4de3-b106-1edfacbbf46b', '香厂路小学', '香厂路31号', '公立', '小学', '3.2', '测试-香厂路小学', null, null, '{\"lng\":116.392614,\"lat\":39.888133}', 'http://www.xclxx.org/', '52990929', '2016-05-27 15:38:28', 'zhangyunteng', '2016-05-27 15:38:28', 'zhangyunteng');
INSERT INTO `school` VALUES ('370023ad-aa6d-4436-ab6a-1702ea6054d5', '北京十三中', '鼓楼西大街148号', '公立', '初中', '3.4', '测试-北京十三中', null, null, '{\"lng\":116.383673,\"lat\":39.93735}', 'http://www.bj13zhx.com/', '', '2016-05-31 20:07:35', 'zhangyunteng', '2016-05-31 20:07:35', 'zhangyunteng');
INSERT INTO `school` VALUES ('37e02a66-2d35-45a8-ac74-3406d0e319c8', '北京教育学院附属中学', '东新开胡同甲31附近', '公立', '初中', '3.2', '测试-北京教育学院附属中学', null, null, '{\"lng\":116.368214,\"lat\":39.943618}', 'http://www.bjjyfzh.org/', '62252385', '2016-05-31 20:32:51', 'zhangyunteng', '2016-05-31 20:32:51', 'zhangyunteng');
INSERT INTO `school` VALUES ('3b1a1e1a-fd7d-4129-88a4-e27875c47c0d', '顺城街一小', '前门西大街135号', '公立', '小学', '2', '测试-顺城街一小', null, null, '{\"lng\":116.377609,\"lat\":39.900424}', '', '66016151', '2016-05-31 11:45:26', 'zhangyunteng', '2016-05-31 11:45:26', 'zhangyunteng');
INSERT INTO `school` VALUES ('3b6ef49f-0ad8-47e5-9f38-10b79776fb1d', '北京三中', '大红罗厂街甲25', '公立', '初中', '3.2', '测试-北京三中', null, null, '{\"lng\":116.366709,\"lat\":39.931639}', 'http://www.bj3zhx.org/', '66181586', '2016-05-31 20:03:37', 'zhangyunteng', '2016-05-31 20:03:37', 'zhangyunteng');
INSERT INTO `school` VALUES ('3f7da527-20b2-469e-bd5a-81d5a0036dbc', '雷锋小学', '旧鼓楼大街西绦胡同甲2号', '公立', '小学', '3.4', '测试-雷锋小学', null, null, '{\"lng\":116.391765,\"lat\":39.947678}', 'http://www.xjlfxx.org/', '64043695', '2016-05-31 18:28:36', 'zhangyunteng', '2016-05-31 18:28:36', 'zhangyunteng');
INSERT INTO `school` VALUES ('43291fe4-4171-4f25-b0c1-63a847b8c99a', '北京市第四十三中学', '后孙公园37号', '公立', '初中', '2', '测试-北京市第四十三中学', null, null, '{\"lng\":116.381989,\"lat\":39.894143}', 'http://www.bj43zx.com/', '63033002', '2016-05-27 15:53:39', 'zhangyunteng', '2016-05-27 15:53:39', 'zhangyunteng');
INSERT INTO `school` VALUES ('43cbf9e4-8b12-4396-b3e4-aac02e37e1d3', '厂桥小学', '地安门西大街167号', '公立', '小学', '3.4', '测试-厂桥小学', null, null, '{\"lng\":116.377888,\"lat\":39.933302}', 'http://www.bjcqxx.com', '66182708', '2016-05-31 18:23:50', 'zhangyunteng', '2016-05-31 18:23:50', 'zhangyunteng');
INSERT INTO `school` VALUES ('457a7643-a375-4bc3-a046-88624ed1a884', '北京建筑大学附属小学', '', '公立', '小学', '2', '测试-北京建筑大学附属小学', null, null, '{\"lng\":116.336362,\"lat\":39.935409}', '', '', '2016-05-27 18:54:35', 'zhangyunteng', '2016-05-27 18:54:35', 'zhangyunteng');
INSERT INTO `school` VALUES ('4856adbd-425d-4b3b-a9b3-da52591008f0', '力学小学', '力学胡同47号', '公立', '小学', '3', '测试-力学小学', null, null, '{\"lng\":116.378368,\"lat\":39.911523}', 'http://www.bjlxps.com', '66036949', '2016-05-31 11:43:43', 'zhangyunteng', '2016-05-31 11:43:43', 'zhangyunteng');
INSERT INTO `school` VALUES ('49534cd6-2c84-460c-b84e-4a3eaffe9530', '奋斗小学(银河校区)', '阜城门外北营房中街57号', '公立', '小学', '3.2', '测试-西城区奋斗小学', null, null, '{\"lng\":116.348654,\"lat\":39.925363}', '', '68351077', '2016-05-27 18:42:42', 'zhangyunteng', '2016-05-27 18:42:42', 'zhangyunteng');
INSERT INTO `school` VALUES ('4cb8670e-77b7-432d-a4e1-7d16f9d58beb', '北京四中', '西黄城北街太平仓胡同2号', '公立', '初中', '3.6', '测试-北京四中', null, null, '{\"lng\":116.378166,\"lat\":39.93194}', 'http://www.bhsf.cn/', '66175061', '2016-05-31 19:19:01', 'zhangyunteng', '2016-05-31 19:19:01', 'zhangyunteng');
INSERT INTO `school` VALUES ('51ada001-eef0-4af4-8218-9c4cda927f45', '北京四十四中', '三里河南横街1号', '公立', '初中', '3.6', '测试-北京四十四中', null, null, '{\"lng\":116.340733,\"lat\":39.912038}', '', '68527920', '2016-05-31 20:37:42', 'zhangyunteng', '2016-05-31 20:37:42', 'zhangyunteng');
INSERT INTO `school` VALUES ('540befed-23a7-42c4-88ae-913dd4e37477', '炭儿胡同小学', '西城区炭儿胡同11号', '公立', '小学', '3', '测试-炭儿胡同小学', null, null, '{\"lng\":116.390947,\"lat\":39.895975}', '', '63030545', '2016-05-27 15:31:16', 'zhangyunteng', '2016-05-27 15:31:16', 'zhangyunteng');
INSERT INTO `school` VALUES ('57b6a4d5-0806-4d1e-b9be-3949652bb685', '北京四十一中', '赵登禹路丙186', '公立', '初中', '2.7', '测试-北京四十一中', null, null, '{\"lng\":116.367113,\"lat\":39.925973}', '', '66161424', '2016-05-31 20:30:50', 'zhangyunteng', '2016-05-31 20:30:50', 'zhangyunteng');
INSERT INTO `school` VALUES ('591a2638-9e0b-4bbe-beba-4684d2c74956', '北京十五中', '育新街2号', '公立', '初中', '2', '测试-北京十五中', null, null, '{\"lng\":116.375825,\"lat\":39.876949}', 'http://www.bj15.cn', '', '2016-05-31 19:09:51', 'zhangyunteng', '2016-05-31 19:09:51', 'zhangyunteng');
INSERT INTO `school` VALUES ('594779fe-e6f8-48ed-b63c-ce2c65a32d62', '北京第二实验小学', '德胜门安德路142号', '公立', '小学', '2.5', '测试-北京第二实验小学', null, null, '{\"lng\":116.382175,\"lat\":39.951029}', '', '', '2016-05-31 18:47:46', 'zhangyunteng', '2016-05-31 18:47:46', 'zhangyunteng');
INSERT INTO `school` VALUES ('5b3e9385-fd3f-4c74-9971-15bbd4d5aa0a', '北师大二附中西城实验学校', '安德路116号', '公立', '初中', '3.6', '测试-北师大二附中西城实验学校', null, null, '{\"lng\":116.386896,\"lat\":39.95068}', 'http://www.bjxcsy.net/', '62053478', '2016-05-31 20:28:54', 'zhangyunteng', '2016-05-31 20:28:54', 'zhangyunteng');
INSERT INTO `school` VALUES ('5c610f1a-ef38-4927-b2c7-2acfef52eb1a', '北京第一实验小学', '北京市宣武区南新华街17号', '公立', '小学', '4', '测试-北京第一实验小学', null, null, '{\"lng\":116.382553,\"lat\":39.891151}', 'http://www.bjdysyxx.com/', '63037631', '2016-05-27 15:28:48', 'zhangyunteng', '2016-05-27 15:28:48', 'zhangyunteng');
INSERT INTO `school` VALUES ('5ce7f443-9c39-4e03-afdf-41b6b96e88fb', '北京小学走读部', '北线阁街2号', '公立', '小学', '3', '测试-北京小学走读部', null, null, '{\"lng\":116.353707,\"lat\":39.891435}', '', '', '2016-05-30 22:25:55', 'zhangyunteng', '2016-05-30 22:25:55', 'zhangyunteng');
INSERT INTO `school` VALUES ('5f27faf3-912b-4e48-84c8-5232ab607de3', '北京三十九中', '西黄城根北街6号', '公立', '初中', '2', '测试-北京三十九中', null, null, '{\"lng\":116.378203,\"lat\":39.92662}', '', '66175798', '2016-05-31 20:09:14', 'zhangyunteng', '2016-05-31 20:09:14', 'zhangyunteng');
INSERT INTO `school` VALUES ('61f7c758-2fb7-4f2a-9836-983407363bcd', '北师大附属实验中学分校', '', '公立', '初中', '2.5', '测试-北师大附属实验中学分校', null, null, '{\"lng\":116.366415,\"lat\":39.913888}', '', '', '2016-05-31 19:34:58', 'zhangyunteng', '2016-05-31 19:34:58', 'zhangyunteng');
INSERT INTO `school` VALUES ('636161bd-9f1d-4be1-b5c5-1c3f0d0eee1c', '四根柏小学', '赵登禹路58号', '公立', '小学', '', '测试-四根柏小学', null, null, '{\"lng\":116.369004,\"lat\":39.935874}', 'http://www.sgbxx.org/', '66160988', '2016-05-31 11:10:55', 'zhangyunteng', '2016-05-31 11:10:55', 'zhangyunteng');
INSERT INTO `school` VALUES ('6e2d6465-9937-4589-9877-a1b830a79d44', '半步桥小学', '白纸坊东街临27号', '公立', '小学', '', '测试-半步桥小学', null, null, '{\"lng\":116.369073,\"lat\":39.878927}', '', '63540029', '2016-05-27 16:24:10', 'zhangyunteng', '2016-05-27 16:24:10', 'zhangyunteng');
INSERT INTO `school` VALUES ('702066b1-d108-4533-acf1-45e623ab30e2', '什刹海小学', '地安门内大街恭俭胡同41号', '公立', '小学', '3.2', '测试-什刹海小学', null, null, '{\"lng\":116.393369,\"lat\":39.929295}', 'http://www.schhxx.com/', '64042613', '2016-05-31 18:38:01', 'zhangyunteng', '2016-05-31 18:38:01', 'zhangyunteng');
INSERT INTO `school` VALUES ('7178e8ae-fa91-42f5-85f9-225611b5d838', '登莱小学', '登莱胡同29', '公立', '小学', '3', '测试-登莱小学', null, null, '{\"lng\":116.354004,\"lat\":39.888144}', '', '', '2016-05-30 22:35:17', 'zhangyunteng', '2016-05-30 22:35:17', 'zhangyunteng');
INSERT INTO `school` VALUES ('7242f467-14fa-48b8-9fe5-8618d3d19262', '北京小学广外分校', '马连道中街35号', '公立', '小学', '3.2', '测试-北京小学广外分校', null, null, '{\"lng\":116.331844,\"lat\":39.885683}', '', '', '2016-05-27 16:32:14', 'zhangyunteng', '2016-05-27 16:32:14', 'zhangyunteng');
INSERT INTO `school` VALUES ('77ae0d33-f816-4d29-b535-57f9b4cebc08', '中华路小学', '前半壁街48号', '公立', '小学', '3.2', '测试-中华路小学', null, null, '{\"lng\":116.360783,\"lat\":39.937988}', 'http://www.bjzhhlxx.org/', '', '2016-05-31 11:13:04', 'zhangyunteng', '2016-05-31 11:13:04', 'zhangyunteng');
INSERT INTO `school` VALUES ('77e63171-3479-4ef0-937f-84094a151919', '三里河第三小学', '三里河三区36号', '公立', '小学', '3', '测试-三里河第三小学', null, null, '{\"lng\":116.337724,\"lat\":39.910752}', 'http://www.slhsx.cn', '68527953', '2016-05-27 19:12:54', 'zhangyunteng', '2016-05-27 19:12:54', 'zhangyunteng');
INSERT INTO `school` VALUES ('78658714-4171-41ba-9d83-14a9314397fe', '实验二小浸水河分校', '涭水河胡同45号', '公立', '小学', '2', '测试-实验二小浸水河分校', null, null, '{\"lng\":116.370183,\"lat\":39.903404}', '', '', '2016-05-31 10:54:56', 'zhangyunteng', '2016-05-31 10:54:56', 'zhangyunteng');
INSERT INTO `school` VALUES ('798859ed-98b4-47a7-a853-9d13b448d83d', '北京第二实验小学广外分校', '广安门外红居南街2号', '公立', '小学', '4', '测试-北京第二实验小学广外分校', null, null, '{\"lng\":116.339886,\"lat\":39.882741}', 'http://www.bjgwyx.com/', '63366418', '2016-05-27 16:30:56', 'zhangyunteng', '2016-05-27 16:30:56', 'zhangyunteng');
INSERT INTO `school` VALUES ('7e90f06e-c0f7-452f-9a25-df9631782f1c', '北京十三中分校', '西绦胡同59号', '公立', '初中', '3.4', '测试-北京十三中分校', null, null, '{\"lng\":116.387294,\"lat\":39.94841}', 'http://www.bj13zfx.com/', '', '2016-05-31 20:06:11', 'zhangyunteng', '2016-05-31 20:06:11', 'zhangyunteng');
INSERT INTO `school` VALUES ('7ec1c147-f1c1-4be6-a5de-cbcb3e71d882', '裕中小学', '裕中西里29号楼', '公立', '小学', '3.2', '测试-裕中小学', null, null, '{\"lng\":116.385758,\"lat\":39.972004}', '', '62382998', '2016-05-31 18:48:58', 'zhangyunteng', '2016-05-31 18:48:58', 'zhangyunteng');
INSERT INTO `school` VALUES ('8111c18e-1eef-4188-b800-74facc1c546e', '北京六十六中', '枣林前街111号', '公立', '初中', '3.4', '测试-北京六十六中（合并广安中学）', null, null, '{\"lng\":116.355506,\"lat\":39.883979}', 'http://www.bj66zx.com/', '', '2016-05-31 19:41:13', 'zhangyunteng', '2016-05-31 19:41:13', 'zhangyunteng');
INSERT INTO `school` VALUES ('81de2f42-8e38-4f9b-a617-46f5fee0f42a', '北京五十六中', '文兴街3号', '公立', '初中', '3.2', '测试-北京五十六中', null, null, '{\"lng\":116.336156,\"lat\":39.936219}', 'http://www.bj56zhx.org/', '68351207', '2016-05-31 19:22:53', 'zhangyunteng', '2016-05-31 19:22:53', 'zhangyunteng');
INSERT INTO `school` VALUES ('86d24695-aa50-4367-a133-42666ad0722f', '西城外国语学校', '西直门外南路6号', '公立', '初中', '3.2', '测试-西城外国语学校', null, null, '{\"lng\":116.350296,\"lat\":39.936309}', 'http://www.xjfls.org', '68336198', '2016-05-31 19:26:25', 'zhangyunteng', '2016-05-31 19:26:25', 'zhangyunteng');
INSERT INTO `school` VALUES ('87991fa6-8b37-4bea-a44e-43c28137911c', '北京鲁迅中学', '新文化街45', '公立', '初中', '3.4', '测试-北京鲁迅中学', null, null, '{\"lng\":116.370915,\"lat\":39.904502}', '', '66035483', '2016-05-31 20:11:57', 'zhangyunteng', '2016-05-31 20:11:57', 'zhangyunteng');
INSERT INTO `school` VALUES ('8aa2b2bf-ca37-4c6c-8b3a-2c8d8cf4f309', '北京八中（合并八中分校）', '白云观街北里12', '公立', '初中', '3', '测试-北京八中（合并八中分校）', null, null, '{\"lng\":116.345302,\"lat\":39.900735}', '', '', '2016-05-31 20:36:25', 'zhangyunteng', '2016-05-31 20:36:25', 'zhangyunteng');
INSERT INTO `school` VALUES ('8b757586-442d-435b-8381-9e8fd7496720', '皇城根小学', '官园胡同1号', '公立', '小学', '2', '测试-皇城根小学', null, null, '{\"lng\":116.361134,\"lat\":39.932019}', 'http://hcgxx.30edu.com.cn/', '', '2016-05-31 11:07:53', 'zhangyunteng', '2016-05-31 11:07:53', 'zhangyunteng');
INSERT INTO `school` VALUES ('8d991a8f-974a-4fef-a8f9-e0a0dd52562c', '三帆中学', '德外新风街7号', '公立', '初中', '4', '测试-三帆中学', null, null, '{\"lng\":116.374864,\"lat\":39.963388}', 'http://www.sanfan.cn/', '82078324', '2016-05-31 19:24:29', 'zhangyunteng', '2016-05-31 19:24:29', 'zhangyunteng');
INSERT INTO `school` VALUES ('9210725b-0171-49ff-bbce-411baab6cc18', '白纸坊小学', '西城区白广路乙27号', '公立', '小学', '3', '测试-白纸坊小学', null, null, '{\"lng\":116.35747,\"lat\":39.881332}', 'http://bzfxx.edutao.com/', '63548961', '2016-05-27 16:18:54', 'zhangyunteng', '2016-05-27 16:18:54', 'zhangyunteng');
INSERT INTO `school` VALUES ('928368b0-babe-4af9-bbdc-dc9d61e6a78f', '展览路一小', '百万庄中里七号', '公立', '小学', '2', '测试-展览路一小', null, null, '{\"lng\":116.339212,\"lat\":39.930221}', '', '68351125', '2016-05-27 18:46:40', 'zhangyunteng', '2016-05-27 18:46:40', 'zhangyunteng');
INSERT INTO `school` VALUES ('941b1a6b-e186-4102-973c-ab5ac8def6db', '宏庙小学', '西单北大街宏庙胡同13号', '公立', '小学', '3.4', '测试-宏庙小学', null, null, '{\"lng\":116.370489,\"lat\":39.915776}', '', '66179839', '2016-05-30 22:44:09', 'zhangyunteng', '2016-05-30 22:44:09', 'zhangyunteng');
INSERT INTO `school` VALUES ('94908a97-8435-4887-8d18-ef13de3e3f2b', '椿树馆小学', '广安门外南街43号', '公立', '小学', '3', '测试-椿树馆小学', null, null, '{\"lng\":116.346074,\"lat\":39.886737}', '63289074', '', '2016-05-27 16:38:29', 'zhangyunteng', '2016-05-27 16:38:29', 'zhangyunteng');
INSERT INTO `school` VALUES ('970cc243-5b8a-4701-b610-542e4c5e09bd', '北师大实验中学二龙路中学', '大木仓胡同39号', '公立', '初中', '3.5', '测试-北师大实验中学二龙路中学', null, null, '{\"lng\":116.368316,\"lat\":39.91235}', '', '66020463', '2016-05-31 20:14:19', 'zhangyunteng', '2016-05-31 20:14:19', 'zhangyunteng');
INSERT INTO `school` VALUES ('997829b4-0cb0-42e7-a209-8c03eedaced0', '外交学院月坛中学', '南礼市路二条1号', '公立', '初中', '3.6', '测试-外交学院月坛中学', null, null, '{\"lng\":116.3503,\"lat\":39.911736}', 'http://www.bjytzhx.com', '68045321', '2016-05-31 20:44:24', 'zhangyunteng', '2016-05-31 20:44:24', 'zhangyunteng');
INSERT INTO `school` VALUES ('9e5f3b94-abbc-4511-8abb-801ec32a204e', '北京育才学校（合并宣武分院附中）', '永定门内西街甲2号', '公立', '初中', '3.4', '测试-北京育才学校，原宣武教育学院分院附中正式并入北京育才学校。', null, null, '{\"lng\":116.362352,\"lat\":39.876433}', '', '', '2016-05-31 19:45:53', 'zhangyunteng', '2016-05-31 19:47:45', 'zhangyunteng');
INSERT INTO `school` VALUES ('9e7191e2-3110-4495-9ce0-ee1f5e722312', '新世纪实验小学', '南纬路2号院', '公立', '小学', '3', '测试-新世纪实验小学', null, null, '{\"lng\":116.395187,\"lat\":39.878503}', '', '63032072', '2016-05-27 15:36:15', 'zhangyunteng', '2016-05-27 15:36:15', 'zhangyunteng');
INSERT INTO `school` VALUES ('a65cfc11-717a-490b-9d6d-377ac837992a', '自忠小学', '府右街丙27号', '公立', '小学', '3.2', '测试-自忠小学', null, null, '{\"lng\":116.381276,\"lat\":39.917204}', 'http://www.xjzzhxx.org/', '', '2016-05-31 11:32:13', 'zhangyunteng', '2016-05-31 11:32:13', 'zhangyunteng');
INSERT INTO `school` VALUES ('a66fb6c3-b24a-403d-ad0f-f2dbd66db223', '奋斗小学', '二龙路闹市口大街月台胡同15号', '公立', '小学', '3', '测试-奋斗小学', null, null, '{\"lng\":116.361777,\"lat\":39.901535}', '', '66012277', '2016-05-30 22:41:16', 'zhangyunteng', '2016-05-30 22:41:16', 'zhangyunteng');
INSERT INTO `school` VALUES ('aa88de1c-6aed-42da-86b0-c93049991715', '红莲小学', '广安门外红莲中里14号', '公立', '小学', '3', '测试-红莲小学', null, null, '{\"lng\":116.334579,\"lat\":39.88213}', 'http://www.xchlxx.com', '63487162', '2016-05-27 16:41:23', 'zhangyunteng', '2016-05-27 16:41:23', 'zhangyunteng');
INSERT INTO `school` VALUES ('ac9d65e6-46f8-493b-9231-a9ea9cb5ed17', '青年湖小学', '鸭子桥路13号', '公立', '小学', '2', '测试-青年湖小学', null, null, '{\"lng\":116.348139,\"lat\":39.878115}', '63260885', '', '2016-05-27 16:36:22', 'zhangyunteng', '2016-05-27 16:36:22', 'zhangyunteng');
INSERT INTO `school` VALUES ('ad98a759-6fef-4537-81f8-4c3b5b3da006', '实验一小前门分校', '和平门外东街甲5号', '公立', '小学', '4', '测试-实验一小前门分校', null, null, '{\"lng\":116.388575,\"lat\":39.899328}', 'http://www.bjdysyxxqmfx.com/', '63179191', '2016-05-27 15:41:16', 'zhangyunteng', '2016-05-27 15:41:16', 'zhangyunteng');
INSERT INTO `school` VALUES ('af1677e9-74c1-4ae8-b7ca-548acc54e516', '', '', null, null, '', '', null, null, '', '', '', '2016-05-05 19:29:07', 'hunter', '2016-05-05 19:29:07', 'hunter');
INSERT INTO `school` VALUES ('b06af3b5-2751-42d2-813e-96657afdc06f', '假学校3', '', '公立', '高中', '', '', null, null, '{\"lng\":116.344462,\"lat\":39.967519}', '', '', '2016-05-20 19:28:26', 'wangqianyun', '2016-05-20 19:28:26', 'wangqianyun');
INSERT INTO `school` VALUES ('b07c61ac-f9ae-4e13-a14f-2ed307465bff', '黄城根小学', '黄城根北街3号', '公立', '小学', '3.2', '测试-黄城根小学', null, null, '{\"lng\":116.376372,\"lat\":39.930779}', '', '66168064', '2016-05-31 18:22:13', 'zhangyunteng', '2016-05-31 18:22:13', 'zhangyunteng');
INSERT INTO `school` VALUES ('b37c9762-981c-4210-875e-8ff9ed988366', '阜成门外一小', '阜成门外大街甲10号', '公立', '小学', '2', '测试-阜成门外一小', null, null, '{\"lng\":116.350788,\"lat\":39.921948}', '', '68047867', '2016-05-27 18:44:40', 'zhangyunteng', '2016-05-27 18:44:40', 'zhangyunteng');
INSERT INTO `school` VALUES ('b43dd56e-e85b-4db8-9785-e53d759ddc66', '中央美术学院徐悲鸿中学', '永安路寿长街1号', '公立', '初中', '3', '测试-中央美术学院徐悲鸿中学', null, null, '{\"lng\":116.388005,\"lat\":39.885231}', '', '63047408', '2016-05-27 16:00:37', 'zhangyunteng', '2016-05-27 16:00:37', 'zhangyunteng');
INSERT INTO `school` VALUES ('b4be2554-a66b-4662-a676-6271bccebb68', '北京第二实验小学白云路分校', '', '公立', '小学', '3', '测试-北京第二实验小学白云路分校', null, null, '{\"lng\":116.343761,\"lat\":39.90473}', '', '68017178', '2016-05-27 18:57:38', 'zhangyunteng', '2016-05-27 18:57:38', 'zhangyunteng');
INSERT INTO `school` VALUES ('b505037d-6ef9-4622-8bf4-52b48614b624', '北京三十一中', '西城区西绒线胡同33号', '公立', '初中', '3.2', '测试-北京三十一中', null, null, '{\"lng\":116.379575,\"lat\":39.904626}', 'http://www.bj31.org/', '66055746', '2016-05-31 19:28:09', 'zhangyunteng', '2016-05-31 19:28:09', 'zhangyunteng');
INSERT INTO `school` VALUES ('b6981c27-e8da-4589-9065-cd6fe0c991f4', '北京一五六中', '太平仓胡同16号', '公立', '初中', '2.5', '测试-北京一五六中', null, null, '{\"lng\":116.374471,\"lat\":39.931127}', '', '', '2016-05-31 20:10:45', 'zhangyunteng', '2016-05-31 20:10:45', 'zhangyunteng');
INSERT INTO `school` VALUES ('bf2a7eb3-e218-4064-939d-b48d89d65ac6', '西什库小学', '刘兰塑胡同14号', '公立', '小学', '3.2', '测试-西什库小学', null, null, '{\"lng\":116.381205,\"lat\":39.924045}', 'http://www.bjxskxx.com', '66177182', '2016-05-31 18:30:35', 'zhangyunteng', '2016-05-31 18:30:35', 'zhangyunteng');
INSERT INTO `school` VALUES ('bf7ccb55-7bf6-47ee-8229-c513285e9e38', '华嘉小学', '西廊下胡同34号', '公立', '小学', '3', '测试-华嘉小学', null, null, '{\"lng\":116.361758,\"lat\":39.928049}', '', '', '2016-05-31 11:04:51', 'zhangyunteng', '2016-05-31 11:04:51', 'zhangyunteng');
INSERT INTO `school` VALUES ('c21f57d9-4564-4e17-acae-2d778b5a7952', '北京七中', '安德路69号', '公立', '初中', '3.4', '测试-北京七中', null, null, '{\"lng\":116.383787,\"lat\":39.952205}', 'http://www.bj7zhx.org/', '62016185', '2016-05-31 20:22:14', 'zhangyunteng', '2016-05-31 20:22:14', 'zhangyunteng');
INSERT INTO `school` VALUES ('c46eea16-7031-4e6d-98b4-eefce5ee392d', '北京三十五中', '赵登禹路8号', '公立', '初中', '3.2', '测试-北京三十五中', null, null, '{\"lng\":116.369834,\"lat\":39.939377}', '', '', '2016-05-31 19:20:41', 'zhangyunteng', '2016-05-31 19:20:41', 'zhangyunteng');
INSERT INTO `school` VALUES ('c52a55c1-d052-41e8-8ce6-fdeed3315459', '北京八中百万庄校区（合并第一五四中学）', '百万庄南街14号', '公立', '初中', '3.2', '测试-北京八中百万庄校区（合并第一五四中学）', null, null, '{\"lng\":116.33814,\"lat\":39.924858}', '', '', '2016-05-31 19:17:26', 'zhangyunteng', '2016-05-31 19:17:26', 'zhangyunteng');
INSERT INTO `school` VALUES ('c63e319c-019b-4f8b-a671-4e9af6a88878', '康乐里小学', '康乐里2号', '公立', '小学', '2', '测试-康乐里小学', null, null, '{\"lng\":116.368274,\"lat\":39.896163}', 'http://www.kllxx.com', '63031856', '2016-05-30 22:23:58', 'zhangyunteng', '2016-05-30 22:23:58', 'zhangyunteng');
INSERT INTO `school` VALUES ('c75465ed-bfd5-4bd0-96c6-c1d1445a2bcd', '实验二小', '新文化街(新文化街与佟麟阁路的交汇处)', '公立', '小学', '3', '测试-实验二小', null, null, '{\"lng\":116.367754,\"lat\":39.904751}', '', '62914379', '2016-05-30 22:36:45', 'zhangyunteng', '2016-05-30 22:36:45', 'zhangyunteng');
INSERT INTO `school` VALUES ('ca82a479-f3ef-48d1-b010-44ab41734a97', '北京三帆中学裕中学校', '裕中西里21', '公立', '初中', '3', '测试-北京三帆中学裕中学校', null, null, '{\"lng\":116.386183,\"lat\":39.972332}', '', '', '2016-05-31 20:26:11', 'zhangyunteng', '2016-05-31 20:26:11', 'zhangyunteng');
INSERT INTO `school` VALUES ('cad51057-d9c3-4220-8fc7-5ab18da5c9e4', '北京铁路二中', '月坛西街5号', '公立', '初中', '3.4', '测试-北京铁路二中', null, null, '{\"lng\":116.348403,\"lat\":39.915607}', 'http://www.bjt2z.org', '', '2016-05-31 19:13:54', 'zhangyunteng', '2016-05-31 19:13:54', 'zhangyunteng');
INSERT INTO `school` VALUES ('cb18d12b-31f2-4268-bc4f-3ca455b30c94', '', '', null, null, '', '', null, null, '', '', '', '2016-05-05 19:37:52', 'hunter', '2016-05-05 19:37:52', 'hunter');
INSERT INTO `school` VALUES ('cc4aeb0e-6c04-409d-b128-dd4359f1425f', '假学校4', '', '公立', '初中', '', '', null, null, '{\"lng\":116.356135,\"lat\":39.96344}', '', '', '2016-05-20 19:28:56', 'wangqianyun', '2016-05-20 19:28:56', 'wangqianyun');
INSERT INTO `school` VALUES ('ce99ff7c-e5bd-409f-8854-72652f96d7ac', '宣师一附小', '里仁街10号', '公立', '小学', '3', '测试-宣师一附小', null, null, '{\"lng\":116.369341,\"lat\":39.875571}', '', '', '2016-05-27 16:16:15', 'zhangyunteng', '2016-05-27 16:16:15', 'zhangyunteng');
INSERT INTO `school` VALUES ('d5f7a63e-39a1-4927-a2b3-0250a10f2178', '北京二一四中', '月坛北街18号', '公立', '初中', '3.4', '测试-北京二一四中', null, null, '{\"lng\":116.336866,\"lat\":39.917738}', 'http://www.bj214zx.cn/', '68522558', '2016-05-31 20:42:24', 'zhangyunteng', '2016-05-31 20:42:24', 'zhangyunteng');
INSERT INTO `school` VALUES ('d71de222-cbd8-4f4a-b2fc-a8a268a3c0b7', '清华附中', '北京市海淀区中关村北大街', '公立', '高中', '8.9', '示例学校', null, null, '{\"lng\":116.31588,\"lat\":40.035575}', 'http://www.qhfz.edu.cn/index.html', '123456', '2016-05-07 14:05:12', 'hunter', '2016-05-12 13:27:30', 'hunter');
INSERT INTO `school` VALUES ('d84f93a1-6afe-4e91-bc2e-29cfc10287e0', '北京实验一小广外分校', '西城区茶源路', '公立', '小学', '3', '测试-北京实验一小广外分校', null, null, '{\"lng\":116.323499,\"lat\":39.880738}', '', '', '2016-05-27 16:29:19', 'zhangyunteng', '2016-05-27 16:29:19', 'zhangyunteng');
INSERT INTO `school` VALUES ('ddd5dadb-22da-4b6a-aebb-060320405d00', '假学校2', '', '公立', '初中', '', '', null, null, '{\"lng\":116.370383,\"lat\":39.971465}', '', '', '2016-05-20 19:28:00', 'wangqianyun', '2016-05-20 19:28:00', 'wangqianyun');
INSERT INTO `school` VALUES ('ddf8d89d-a21f-44c0-a38e-da88ae95fa56', '北京小学天宁寺分校', '天宁寺前街35号', '公立', '小学', '', '测试- 北京小学天宁寺分校', null, null, '{\"lng\":116.345539,\"lat\":39.893509}', '', '63466381', '2016-05-27 16:34:10', 'zhangyunteng', '2016-05-27 16:34:10', 'zhangyunteng');
INSERT INTO `school` VALUES ('de3ce613-41f5-46a5-a8f7-2e50f523f946', '北京小学红山分校', '广安门外大街305号', '公立', '小学', '3', '测试-北京小学红山分校', null, null, '{\"lng\":116.33209,\"lat\":39.893548}', '', '58371560', '2016-05-27 16:35:10', 'zhangyunteng', '2016-05-27 16:35:10', 'zhangyunteng');
INSERT INTO `school` VALUES ('dea9205b-867d-4da1-b929-9083daaee25b', '育翔小学', '黄寺大街23号院-8', '公立', '小学', '3.6', '测试-育翔小学', null, null, '{\"lng\":116.386993,\"lat\":39.966353}', 'http://yxxx.xchjw.cn', '62053495', '2016-05-31 18:39:30', 'zhangyunteng', '2016-05-31 18:39:30', 'zhangyunteng');
INSERT INTO `school` VALUES ('df145d7b-01d6-4cd4-a3df-6028341aa675', '北京八中', '学院小街2号', '公立', '初中', '3.2', '测试-北京八中', null, null, '{\"lng\":116.361771,\"lat\":39.91104}', '', '', '2016-05-31 19:03:21', 'zhangyunteng', '2016-05-31 19:05:42', 'zhangyunteng');
INSERT INTO `school` VALUES ('e267e959-94a1-4d63-8d4f-228529ae01c3', '中古友谊小学', '三里河一区39', '公立', '小学', '3.2', '测试-中古友谊小学', null, null, '{\"lng\":116.340233,\"lat\":39.916125}', 'http://www.xjzhgyyxx.org', '68580077', '2016-05-27 19:11:15', 'zhangyunteng', '2016-05-27 19:11:15', 'zhangyunteng');
INSERT INTO `school` VALUES ('e4f3c6a7-0570-4d7a-be5a-946aa630d051', '五路通小学', '德外什坊街甲6号', '公立', '小学', '3.6', '测试-五路通小学', null, null, '{\"lng\":116.383289,\"lat\":39.960771}', 'http://www.xcqwltxx.com/', '62018331', '2016-05-31 18:50:02', 'zhangyunteng', '2016-05-31 18:50:02', 'zhangyunteng');
INSERT INTO `school` VALUES ('eef258d0-572a-49f5-8684-0147bf15a7b0', '北京十四中', '莲花河南街2号', '公立', '初中', '3', '测试-北京十四中', null, null, '{\"lng\":116.338228,\"lat\":39.891118}', '', '', '2016-05-31 19:05:32', 'zhangyunteng', '2016-05-31 19:05:32', 'zhangyunteng');
INSERT INTO `school` VALUES ('f0812480-c918-45da-be45-89dcfe37df3d', '第八中学附属小学', '福州馆街3号', '公立', '小学', '4', '测试-第八中学附属小学', null, null, '{\"lng\":116.382813,\"lat\":39.887893}', 'http://www.fzgxx.com/', '63533362', '2016-05-27 16:21:29', 'zhangyunteng', '2016-05-27 16:21:29', 'zhangyunteng');
INSERT INTO `school` VALUES ('f82875f1-377a-440e-a6fe-80c08a2a6438', '北京一六一中', '大宴乐胡同11号', '公立', '初中', '3.2', '测试-北京一六一中', null, null, '{\"lng\":116.39065,\"lat\":39.908094}', '', '', '2016-05-31 19:12:04', 'zhangyunteng', '2016-05-31 19:12:04', 'zhangyunteng');
INSERT INTO `school` VALUES ('f8990802-f588-4ce8-b22e-1272dff91380', '北师大附中南校区（合并六十二中）', '太平街西巷4号', '公立', '初中', '3.4', '测试-北师大附中南校区（合并六十二中）', null, null, '{\"lng\":116.386107,\"lat\":39.880468}', '', '', '2016-05-31 19:52:34', 'zhangyunteng', '2016-05-31 19:52:34', 'zhangyunteng');
INSERT INTO `school` VALUES ('f8ee57de-df0c-4d7f-b50f-7bd29299ec3f', '北京师范大学', '', null, null, '', '', null, null, '', '', '', '2016-05-07 10:17:57', 'hunter', '2016-05-07 10:17:57', 'hunter');
INSERT INTO `school` VALUES ('fb267ad8-feef-4033-9a86-391fb4e7dd38', '实验二小玉桃园分校', '玉桃园三区10号', '公立', '小学', '2', '测试-实验二小玉桃园分校', null, null, '{\"lng\":116.362825,\"lat\":39.942341}', '', '', '2016-05-31 11:09:41', 'zhangyunteng', '2016-05-31 11:09:41', 'zhangyunteng');
INSERT INTO `school` VALUES ('fcee02cd-ffa4-4c68-8614-ca9751beecd9', '', '', '公立', '小学', '', '', null, null, '{\"lng\":116.327514,\"lat\":39.882261}', '', '', '2016-05-19 08:52:49', 'root', '2016-05-19 08:52:49', 'root');
INSERT INTO `school` VALUES ('fd025c80-91d2-4582-b8ed-58ab55057772', '北京师范大学第二附属中学', '', '公立', '小学', '', '', null, null, '{\"lng\":116.323948,\"lat\":40.035312}', '', '', '2016-05-07 13:04:39', 'hunter', '2016-05-12 13:27:43', 'hunter');
INSERT INTO `school` VALUES ('fd2f4ce1-2999-4351-b922-396ed9fa9327', '回民小学', '牛街西里一区5号', '公立', '小学', '2', '测试-回民小学', null, null, '{\"lng\":116.362681,\"lat\":39.887061}', '', '', '2016-05-30 22:27:51', 'zhangyunteng', '2016-05-30 22:27:51', 'zhangyunteng');
INSERT INTO `school` VALUES ('fdc50387-b81f-451e-85d5-4f861b410aaf', '北京师范大学附属中学', '和平门南新华街18号', '公立', '初中', '4', '测试-北京师范大学附属中学', null, null, '{\"lng\":116.385449,\"lat\":39.897906}', 'http://www.bjsdfz.com/', '83193000', '2016-05-27 15:56:11', 'zhangyunteng', '2016-05-27 15:56:11', 'zhangyunteng');

-- ----------------------------
-- Table structure for `schoolarea`
-- ----------------------------
DROP TABLE IF EXISTS `schoolarea`;
CREATE TABLE `schoolarea` (
  `sa_id` varchar(50) NOT NULL,
  `sa_name` varchar(30) NOT NULL,
  `sa_description` varchar(100) DEFAULT NULL,
  `sa_points` longtext,
  `sa_middlePoint` varchar(50) DEFAULT NULL,
  `sa_scaleParam` int(11) DEFAULT NULL,
  `sa_addTime` datetime DEFAULT NULL,
  `sa_addAdmin` varchar(30) DEFAULT NULL,
  `sa_updateTime` datetime DEFAULT NULL,
  `sa_updateAdmin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolarea
-- ----------------------------
INSERT INTO `schoolarea` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', '金融街学区', '测试-金融街学区', '[{\"lng\":116.363353,\"lat\":39.899511},{\"lng\":116.361449,\"lat\":39.899462},{\"lng\":116.36036,\"lat\":39.899495},{\"lng\":116.359792,\"lat\":39.89961},{\"lng\":116.359266,\"lat\":39.899849},{\"lng\":116.358713,\"lat\":39.900145},{\"lng\":116.358139,\"lat\":39.900614},{\"lng\":116.357517,\"lat\":39.901235},{\"lng\":116.357158,\"lat\":39.901807},{\"lng\":116.356981,\"lat\":39.902141},{\"lng\":116.356879,\"lat\":39.902441},{\"lng\":116.356798,\"lat\":39.90312},{\"lng\":116.356771,\"lat\":39.903873},{\"lng\":116.356712,\"lat\":39.904984},{\"lng\":116.356643,\"lat\":39.906215},{\"lng\":116.356616,\"lat\":39.906955},{\"lng\":116.356546,\"lat\":39.908445},{\"lng\":116.356578,\"lat\":39.909885},{\"lng\":116.356728,\"lat\":39.911103},{\"lng\":116.356809,\"lat\":39.912231},{\"lng\":116.356757,\"lat\":39.915373},{\"lng\":116.3565,\"lat\":39.920902},{\"lng\":116.356414,\"lat\":39.923667},{\"lng\":116.364954,\"lat\":39.923864},{\"lng\":116.37328,\"lat\":39.924103},{\"lng\":116.373408,\"lat\":39.921733},{\"lng\":116.37358,\"lat\":39.917586},{\"lng\":116.373773,\"lat\":39.91334},{\"lng\":116.373816,\"lat\":39.910015},{\"lng\":116.373923,\"lat\":39.906575},{\"lng\":116.374095,\"lat\":39.900979},{\"lng\":116.374138,\"lat\":39.899843},{\"lng\":116.372271,\"lat\":39.899876},{\"lng\":116.369074,\"lat\":39.899761},{\"lng\":116.365233,\"lat\":39.89958}]', '{\"lng\":116.366551,\"lat\":39.911471}', '14', '2016-05-27 14:37:31', 'zhangyunteng', '2016-05-27 14:37:31', 'zhangyunteng');
INSERT INTO `schoolarea` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', '新街口学区', '测试-新街口学区', '[{\"lng\":116.373372,\"lat\":39.924034},{\"lng\":116.36496,\"lat\":39.923919},{\"lng\":116.356356,\"lat\":39.923689},{\"lng\":116.355926,\"lat\":39.932426},{\"lng\":116.355583,\"lat\":39.940455},{\"lng\":116.355776,\"lat\":39.94266},{\"lng\":116.356549,\"lat\":39.943713},{\"lng\":116.357407,\"lat\":39.944157},{\"lng\":116.359102,\"lat\":39.944667},{\"lng\":116.360368,\"lat\":39.944963},{\"lng\":116.364531,\"lat\":39.946114},{\"lng\":116.366484,\"lat\":39.946838},{\"lng\":116.368951,\"lat\":39.947842},{\"lng\":116.370367,\"lat\":39.948237},{\"lng\":116.371569,\"lat\":39.948516},{\"lng\":116.371998,\"lat\":39.948549},{\"lng\":116.37202,\"lat\":39.948204},{\"lng\":116.372191,\"lat\":39.947842},{\"lng\":116.372191,\"lat\":39.94725},{\"lng\":116.372256,\"lat\":39.945884},{\"lng\":116.372406,\"lat\":39.942726},{\"lng\":116.372685,\"lat\":39.94057},{\"lng\":116.372792,\"lat\":39.93802},{\"lng\":116.372857,\"lat\":39.935306},{\"lng\":116.372985,\"lat\":39.931456},{\"lng\":116.373136,\"lat\":39.928543},{\"lng\":116.373243,\"lat\":39.926355}]', '{\"lng\":116.365078,\"lat\":39.935919}', '14', '2016-05-27 14:16:48', 'zhangyunteng', '2016-05-27 15:50:55', 'root');
INSERT INTO `schoolarea` VALUES ('06ac2ff2-9656-4906-ab72-9fd1233d4d52', '西长安街学区', '测试-西长安街', '[{\"lng\":116.374137,\"lat\":39.907343},{\"lng\":116.373987,\"lat\":39.910899},{\"lng\":116.374001,\"lat\":39.911783},{\"lng\":116.373947,\"lat\":39.912598},{\"lng\":116.373888,\"lat\":39.913651},{\"lng\":116.373808,\"lat\":39.91477},{\"lng\":116.373748,\"lat\":39.916174},{\"lng\":116.373716,\"lat\":39.917289},{\"lng\":116.373647,\"lat\":39.918395},{\"lng\":116.37363,\"lat\":39.919708},{\"lng\":116.373566,\"lat\":39.921489},{\"lng\":116.373529,\"lat\":39.922468},{\"lng\":116.375787,\"lat\":39.922509},{\"lng\":116.37731,\"lat\":39.922546},{\"lng\":116.377402,\"lat\":39.922505},{\"lng\":116.379574,\"lat\":39.922559},{\"lng\":116.381774,\"lat\":39.922588},{\"lng\":116.383388,\"lat\":39.922604},{\"lng\":116.383581,\"lat\":39.922592},{\"lng\":116.384214,\"lat\":39.922452},{\"lng\":116.384729,\"lat\":39.922423},{\"lng\":116.386441,\"lat\":39.92246},{\"lng\":116.386881,\"lat\":39.922386},{\"lng\":116.388308,\"lat\":39.922456},{\"lng\":116.388442,\"lat\":39.922431},{\"lng\":116.388946,\"lat\":39.92223},{\"lng\":116.389515,\"lat\":39.922193},{\"lng\":116.390502,\"lat\":39.922197},{\"lng\":116.390759,\"lat\":39.92216},{\"lng\":116.392283,\"lat\":39.922378},{\"lng\":116.392218,\"lat\":39.919909},{\"lng\":116.392454,\"lat\":39.915943},{\"lng\":116.392615,\"lat\":39.912931},{\"lng\":116.392063,\"lat\":39.912902},{\"lng\":116.392068,\"lat\":39.912438},{\"lng\":116.39195,\"lat\":39.912413},{\"lng\":116.391961,\"lat\":39.912104},{\"lng\":116.391869,\"lat\":39.912063},{\"lng\":116.391821,\"lat\":39.911244},{\"lng\":116.392658,\"lat\":39.911203},{\"lng\":116.392588,\"lat\":39.908726},{\"lng\":116.392331,\"lat\":39.908315},{\"lng\":116.392224,\"lat\":39.907854},{\"lng\":116.395507,\"lat\":39.907919},{\"lng\":116.395957,\"lat\":39.900298},{\"lng\":116.395963,\"lat\":39.900216},{\"lng\":116.394203,\"lat\":39.90036},{\"lng\":116.393071,\"lat\":39.900438},{\"lng\":116.3918,\"lat\":39.900426},{\"lng\":116.390249,\"lat\":39.900385},{\"lng\":116.38879,\"lat\":39.900331},{\"lng\":116.386779,\"lat\":39.900253},{\"lng\":116.384445,\"lat\":39.900191},{\"lng\":116.382192,\"lat\":39.900125},{\"lng\":116.378376,\"lat\":39.899994},{\"lng\":116.376321,\"lat\":39.899928},{\"lng\":116.37446,\"lat\":39.899866},{\"lng\":116.374412,\"lat\":39.900998},{\"lng\":116.374363,\"lat\":39.902171},{\"lng\":116.374294,\"lat\":39.903632},{\"lng\":116.374267,\"lat\":39.905722}]', '{\"lng\":116.382189,\"lat\":39.910352}', '13', '2016-05-27 14:44:57', 'zhangyunteng', '2016-05-27 14:44:57', 'zhangyunteng');
INSERT INTO `schoolarea` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', '广安门外学区', '测试-广安门外学区', '[{\"lng\":116.343655,\"lat\":39.89763},{\"lng\":116.345876,\"lat\":39.897737},{\"lng\":116.347281,\"lat\":39.897749},{\"lng\":116.347641,\"lat\":39.897622},{\"lng\":116.347973,\"lat\":39.897465},{\"lng\":116.348108,\"lat\":39.897329},{\"lng\":116.34821,\"lat\":39.897214},{\"lng\":116.348317,\"lat\":39.896996},{\"lng\":116.348365,\"lat\":39.896646},{\"lng\":116.348387,\"lat\":39.895798},{\"lng\":116.34844,\"lat\":39.895004},{\"lng\":116.348585,\"lat\":39.894321},{\"lng\":116.348585,\"lat\":39.893024},{\"lng\":116.348612,\"lat\":39.891662},{\"lng\":116.348633,\"lat\":39.890431},{\"lng\":116.348655,\"lat\":39.889332},{\"lng\":116.348666,\"lat\":39.888258},{\"lng\":116.348671,\"lat\":39.887283},{\"lng\":116.348687,\"lat\":39.886035},{\"lng\":116.348708,\"lat\":39.884648},{\"lng\":116.34873,\"lat\":39.883413},{\"lng\":116.348741,\"lat\":39.882347},{\"lng\":116.348821,\"lat\":39.881236},{\"lng\":116.348907,\"lat\":39.88005},{\"lng\":116.348998,\"lat\":39.87893},{\"lng\":116.349127,\"lat\":39.877539},{\"lng\":116.349197,\"lat\":39.876316},{\"lng\":116.349143,\"lat\":39.875048},{\"lng\":116.348987,\"lat\":39.87411},{\"lng\":116.348923,\"lat\":39.873616},{\"lng\":116.344299,\"lat\":39.873669},{\"lng\":116.344245,\"lat\":39.873805},{\"lng\":116.344304,\"lat\":39.87383},{\"lng\":116.344283,\"lat\":39.874176},{\"lng\":116.3441,\"lat\":39.874163},{\"lng\":116.34402,\"lat\":39.875052},{\"lng\":116.343902,\"lat\":39.875291},{\"lng\":116.343757,\"lat\":39.875448},{\"lng\":116.343618,\"lat\":39.875546},{\"lng\":116.343424,\"lat\":39.875674},{\"lng\":116.342679,\"lat\":39.876032},{\"lng\":116.342266,\"lat\":39.876135},{\"lng\":116.341869,\"lat\":39.876176},{\"lng\":116.34145,\"lat\":39.876152},{\"lng\":116.337679,\"lat\":39.875859},{\"lng\":116.336832,\"lat\":39.875691},{\"lng\":116.336295,\"lat\":39.875579},{\"lng\":116.335464,\"lat\":39.875258},{\"lng\":116.335233,\"lat\":39.875201},{\"lng\":116.3346,\"lat\":39.875151},{\"lng\":116.333157,\"lat\":39.875246},{\"lng\":116.329139,\"lat\":39.875954},{\"lng\":116.326623,\"lat\":39.876864},{\"lng\":116.326366,\"lat\":39.876868},{\"lng\":116.324864,\"lat\":39.876255},{\"lng\":116.323453,\"lat\":39.875999},{\"lng\":116.32135,\"lat\":39.874991},{\"lng\":116.321704,\"lat\":39.881577},{\"lng\":116.322637,\"lat\":39.881589},{\"lng\":116.322653,\"lat\":39.882001},{\"lng\":116.322584,\"lat\":39.882095},{\"lng\":116.322659,\"lat\":39.882145},{\"lng\":116.322653,\"lat\":39.884294},{\"lng\":116.323421,\"lat\":39.88431},{\"lng\":116.323447,\"lat\":39.88706},{\"lng\":116.324424,\"lat\":39.887047},{\"lng\":116.324209,\"lat\":39.889673},{\"lng\":116.325428,\"lat\":39.889767},{\"lng\":116.326678,\"lat\":39.889726},{\"lng\":116.326597,\"lat\":39.889895},{\"lng\":116.326597,\"lat\":39.890023},{\"lng\":116.326501,\"lat\":39.890055},{\"lng\":116.32627,\"lat\":39.890479},{\"lng\":116.325851,\"lat\":39.891064},{\"lng\":116.325755,\"lat\":39.891336},{\"lng\":116.325723,\"lat\":39.892315},{\"lng\":116.32576,\"lat\":39.892632},{\"lng\":116.325819,\"lat\":39.892649},{\"lng\":116.325835,\"lat\":39.892805},{\"lng\":116.325932,\"lat\":39.893105},{\"lng\":116.326002,\"lat\":39.893299},{\"lng\":116.326082,\"lat\":39.893356},{\"lng\":116.325975,\"lat\":39.893402},{\"lng\":116.325948,\"lat\":39.894369},{\"lng\":116.325825,\"lat\":39.897056},{\"lng\":116.331511,\"lat\":39.897077},{\"lng\":116.335915,\"lat\":39.897275},{\"lng\":116.341623,\"lat\":39.897538}]', '{\"lng\":116.336821,\"lat\":39.886065}', '14', '2016-05-27 14:53:21', 'zhangyunteng', '2016-05-27 15:29:57', 'root');
INSERT INTO `schoolarea` VALUES ('4eda427b-e418-4a8c-baa8-096c0b76030c', '上地学区', '我所创建的第一个学区', '[{\"lng\":116.330214,\"lat\":40.035707},{\"lng\":116.32103,\"lat\":40.027623},{\"lng\":116.308198,\"lat\":40.033472},{\"lng\":116.313777,\"lat\":40.039255},{\"lng\":116.318112,\"lat\":40.040998},{\"lng\":116.322103,\"lat\":40.040799}]', '{\"lng\":116.316524,\"lat\":40.033801}', '14', '2016-05-05 14:53:11', 'hunter', '2016-05-11 22:45:26', 'hunter');
INSERT INTO `schoolarea` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', '月坛学区', '测试-月坛学区', '[{\"lng\":116.334624,\"lat\":39.918244},{\"lng\":116.339323,\"lat\":39.918342},{\"lng\":116.344698,\"lat\":39.918392},{\"lng\":116.346039,\"lat\":39.918441},{\"lng\":116.346404,\"lat\":39.918375},{\"lng\":116.349247,\"lat\":39.918384},{\"lng\":116.349419,\"lat\":39.918441},{\"lng\":116.352337,\"lat\":39.918458},{\"lng\":116.353914,\"lat\":39.918474},{\"lng\":116.356328,\"lat\":39.918466},{\"lng\":116.356478,\"lat\":39.914936},{\"lng\":116.356564,\"lat\":39.912763},{\"lng\":116.356435,\"lat\":39.910476},{\"lng\":116.356296,\"lat\":39.909151},{\"lng\":116.356371,\"lat\":39.907208},{\"lng\":116.356478,\"lat\":39.90506},{\"lng\":116.356559,\"lat\":39.901562},{\"lng\":116.356548,\"lat\":39.901439},{\"lng\":116.35452,\"lat\":39.901381},{\"lng\":116.352718,\"lat\":39.901291},{\"lng\":116.351001,\"lat\":39.901192},{\"lng\":116.349853,\"lat\":39.901159},{\"lng\":116.349649,\"lat\":39.901101},{\"lng\":116.349435,\"lat\":39.900986},{\"lng\":116.348373,\"lat\":39.900213},{\"lng\":116.348308,\"lat\":39.89971},{\"lng\":116.348351,\"lat\":39.899101},{\"lng\":116.348501,\"lat\":39.898402},{\"lng\":116.348501,\"lat\":39.898105},{\"lng\":116.344532,\"lat\":39.897891},{\"lng\":116.337365,\"lat\":39.89748},{\"lng\":116.337284,\"lat\":39.89748},{\"lng\":116.337247,\"lat\":39.898377},{\"lng\":116.337193,\"lat\":39.898546},{\"lng\":116.337075,\"lat\":39.898669},{\"lng\":116.336995,\"lat\":39.898739},{\"lng\":116.336936,\"lat\":39.898768},{\"lng\":116.336866,\"lat\":39.898776},{\"lng\":116.33677,\"lat\":39.89878},{\"lng\":116.336716,\"lat\":39.898772},{\"lng\":116.336619,\"lat\":39.898739},{\"lng\":116.336587,\"lat\":39.89871},{\"lng\":116.33655,\"lat\":39.898686},{\"lng\":116.336512,\"lat\":39.898636},{\"lng\":116.336485,\"lat\":39.898608},{\"lng\":116.336448,\"lat\":39.898566},{\"lng\":116.336415,\"lat\":39.898517},{\"lng\":116.336383,\"lat\":39.898468},{\"lng\":116.336362,\"lat\":39.898422},{\"lng\":116.335369,\"lat\":39.898455},{\"lng\":116.335444,\"lat\":39.89962},{\"lng\":116.335466,\"lat\":39.900994},{\"lng\":116.335487,\"lat\":39.901994},{\"lng\":116.335947,\"lat\":39.903049},{\"lng\":116.335985,\"lat\":39.903436},{\"lng\":116.335561,\"lat\":39.903765},{\"lng\":116.3354,\"lat\":39.90393},{\"lng\":116.335229,\"lat\":39.904119},{\"lng\":116.335003,\"lat\":39.904481},{\"lng\":116.334907,\"lat\":39.904724},{\"lng\":116.334848,\"lat\":39.90502},{\"lng\":116.33481,\"lat\":39.905193},{\"lng\":116.334826,\"lat\":39.905423},{\"lng\":116.334842,\"lat\":39.906374},{\"lng\":116.334864,\"lat\":39.907407},{\"lng\":116.335175,\"lat\":39.907629},{\"lng\":116.335304,\"lat\":39.907691},{\"lng\":116.335363,\"lat\":39.907798},{\"lng\":116.335352,\"lat\":39.909139},{\"lng\":116.335282,\"lat\":39.909625},{\"lng\":116.335116,\"lat\":39.910156},{\"lng\":116.334799,\"lat\":39.910884},{\"lng\":116.334569,\"lat\":39.911485},{\"lng\":116.334478,\"lat\":39.911892},{\"lng\":116.334488,\"lat\":39.912596},{\"lng\":116.334542,\"lat\":39.913307},{\"lng\":116.334542,\"lat\":39.914529},{\"lng\":116.334558,\"lat\":39.915904},{\"lng\":116.334569,\"lat\":39.91713}]', '{\"lng\":116.346761,\"lat\":39.908571}', '14', '2016-05-27 14:34:03', 'zhangyunteng', '2016-05-27 15:51:29', 'root');
INSERT INTO `schoolarea` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', '大栅栏-椿街-天桥学区', '测试-大栅栏-椿街-天桥学区', '[{\"lng\":116.397719,\"lat\":39.898457},{\"lng\":116.398491,\"lat\":39.885203},{\"lng\":116.398599,\"lat\":39.881816},{\"lng\":116.398609,\"lat\":39.881071},{\"lng\":116.398454,\"lat\":39.881112},{\"lng\":116.398465,\"lat\":39.880202},{\"lng\":116.398733,\"lat\":39.88021},{\"lng\":116.398915,\"lat\":39.87646},{\"lng\":116.398985,\"lat\":39.874397},{\"lng\":116.399049,\"lat\":39.874224},{\"lng\":116.399039,\"lat\":39.874019},{\"lng\":116.399006,\"lat\":39.873912},{\"lng\":116.399065,\"lat\":39.872644},{\"lng\":116.399082,\"lat\":39.872211},{\"lng\":116.392725,\"lat\":39.871939},{\"lng\":116.387838,\"lat\":39.871651},{\"lng\":116.38773,\"lat\":39.875027},{\"lng\":116.387516,\"lat\":39.878963},{\"lng\":116.387494,\"lat\":39.880445},{\"lng\":116.387473,\"lat\":39.883343},{\"lng\":116.38522,\"lat\":39.883376},{\"lng\":116.385027,\"lat\":39.886175},{\"lng\":116.384791,\"lat\":39.889369},{\"lng\":116.374706,\"lat\":39.889237},{\"lng\":116.374663,\"lat\":39.896234},{\"lng\":116.374534,\"lat\":39.899691},{\"lng\":116.384083,\"lat\":39.899988},{\"lng\":116.391679,\"lat\":39.900234},{\"lng\":116.395992,\"lat\":39.90002},{\"lng\":116.396013,\"lat\":39.899679},{\"lng\":116.396072,\"lat\":39.899477},{\"lng\":116.396179,\"lat\":39.899276},{\"lng\":116.396383,\"lat\":39.899049},{\"lng\":116.396769,\"lat\":39.898897},{\"lng\":116.397612,\"lat\":39.898658},{\"lng\":116.397687,\"lat\":39.898634}]', '{\"lng\":116.389484,\"lat\":39.886231}', '13', '2016-05-27 15:07:07', 'zhangyunteng', '2016-05-27 15:51:56', 'root');
INSERT INTO `schoolarea` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '什刹海学区', '测试-什刹海', '[{\"lng\":116.399516,\"lat\":39.923506},{\"lng\":116.396941,\"lat\":39.923407},{\"lng\":116.391705,\"lat\":39.923078},{\"lng\":116.390718,\"lat\":39.922321},{\"lng\":116.389559,\"lat\":39.922288},{\"lng\":116.388272,\"lat\":39.922584},{\"lng\":116.384324,\"lat\":39.922452},{\"lng\":116.381749,\"lat\":39.92265},{\"lng\":116.377371,\"lat\":39.922617},{\"lng\":116.373616,\"lat\":39.922469},{\"lng\":116.373552,\"lat\":39.923884},{\"lng\":116.373423,\"lat\":39.926583},{\"lng\":116.373209,\"lat\":39.930203},{\"lng\":116.373015,\"lat\":39.934168},{\"lng\":116.372887,\"lat\":39.937903},{\"lng\":116.372565,\"lat\":39.942263},{\"lng\":116.37235,\"lat\":39.946573},{\"lng\":116.372093,\"lat\":39.948399},{\"lng\":116.379109,\"lat\":39.948646},{\"lng\":116.385826,\"lat\":39.948777},{\"lng\":116.393958,\"lat\":39.948843},{\"lng\":116.39413,\"lat\":39.944401},{\"lng\":116.394216,\"lat\":39.940634},{\"lng\":116.394967,\"lat\":39.940667},{\"lng\":116.395632,\"lat\":39.940371},{\"lng\":116.39619,\"lat\":39.940091},{\"lng\":116.396383,\"lat\":39.936735},{\"lng\":116.396555,\"lat\":39.932786},{\"lng\":116.396769,\"lat\":39.928393},{\"lng\":116.398636,\"lat\":39.928409},{\"lng\":116.398979,\"lat\":39.92836},{\"lng\":116.399092,\"lat\":39.92829},{\"lng\":116.399231,\"lat\":39.92815},{\"lng\":116.399323,\"lat\":39.926517},{\"lng\":116.399408,\"lat\":39.924871}]', '{\"lng\":116.385397,\"lat\":39.937007}', '13', '2016-05-27 14:25:39', 'zhangyunteng', '2016-05-27 15:52:25', 'root');
INSERT INTO `schoolarea` VALUES ('8ed32491-cb1c-47dd-b913-37b24a26f83e', '广安门内-牛街学区', '测试-广安门内-牛街学区', '[{\"lng\":116.363341,\"lat\":39.899363},{\"lng\":116.366303,\"lat\":39.899445},{\"lng\":116.368561,\"lat\":39.899523},{\"lng\":116.371635,\"lat\":39.899622},{\"lng\":116.374317,\"lat\":39.899704},{\"lng\":116.374301,\"lat\":39.898066},{\"lng\":116.374312,\"lat\":39.897116},{\"lng\":116.374322,\"lat\":39.895832},{\"lng\":116.374349,\"lat\":39.894564},{\"lng\":116.374344,\"lat\":39.893309},{\"lng\":116.374312,\"lat\":39.89195},{\"lng\":116.374333,\"lat\":39.889641},{\"lng\":116.374328,\"lat\":39.887044},{\"lng\":116.374285,\"lat\":39.884583},{\"lng\":116.374296,\"lat\":39.883257},{\"lng\":116.368695,\"lat\":39.883372},{\"lng\":116.363738,\"lat\":39.88334},{\"lng\":116.358964,\"lat\":39.883356},{\"lng\":116.353525,\"lat\":39.88334},{\"lng\":116.348986,\"lat\":39.883307},{\"lng\":116.348976,\"lat\":39.886715},{\"lng\":116.348911,\"lat\":39.889349},{\"lng\":116.348879,\"lat\":39.892354},{\"lng\":116.348836,\"lat\":39.894939},{\"lng\":116.348825,\"lat\":39.896519},{\"lng\":116.349029,\"lat\":39.896939},{\"lng\":116.34934,\"lat\":39.897326},{\"lng\":116.349941,\"lat\":39.897745},{\"lng\":116.350574,\"lat\":39.897976},{\"lng\":116.351207,\"lat\":39.898058},{\"lng\":116.352055,\"lat\":39.898124},{\"lng\":116.353675,\"lat\":39.898231},{\"lng\":116.355241,\"lat\":39.898404},{\"lng\":116.355595,\"lat\":39.898519},{\"lng\":116.356604,\"lat\":39.898964},{\"lng\":116.357956,\"lat\":39.899252},{\"lng\":116.359565,\"lat\":39.899383},{\"lng\":116.361764,\"lat\":39.899342}]', '{\"lng\":116.365841,\"lat\":39.891355}', '14', '2016-05-27 14:57:28', 'zhangyunteng', '2016-05-27 14:57:28', 'zhangyunteng');
INSERT INTO `schoolarea` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', '德胜学区', '测试-德胜学区', '[{\"lng\":116.372118,\"lat\":39.948656},{\"lng\":116.37126,\"lat\":39.957933},{\"lng\":116.370659,\"lat\":39.964018},{\"lng\":116.370273,\"lat\":39.967406},{\"lng\":116.370745,\"lat\":39.967998},{\"lng\":116.380358,\"lat\":39.968064},{\"lng\":116.381045,\"lat\":39.972603},{\"lng\":116.394005,\"lat\":39.972734},{\"lng\":116.394134,\"lat\":39.969182},{\"lng\":116.392289,\"lat\":39.968985},{\"lng\":116.391817,\"lat\":39.968754},{\"lng\":116.391902,\"lat\":39.968393},{\"lng\":116.3901,\"lat\":39.968294},{\"lng\":116.390358,\"lat\":39.966288},{\"lng\":116.388233,\"lat\":39.965564},{\"lng\":116.388212,\"lat\":39.964462},{\"lng\":116.389092,\"lat\":39.964479},{\"lng\":116.389092,\"lat\":39.963097},{\"lng\":116.388062,\"lat\":39.963146},{\"lng\":116.387461,\"lat\":39.959561},{\"lng\":116.386731,\"lat\":39.956979},{\"lng\":116.393641,\"lat\":39.957324},{\"lng\":116.394048,\"lat\":39.949692},{\"lng\":116.394113,\"lat\":39.949215},{\"lng\":116.384821,\"lat\":39.949133},{\"lng\":116.382225,\"lat\":39.949199},{\"lng\":116.376582,\"lat\":39.949083}]', '{\"lng\":116.38201,\"lat\":39.961824}', '14', '2016-05-27 14:20:26', 'zhangyunteng', '2016-05-27 14:20:26', 'zhangyunteng');
INSERT INTO `schoolarea` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '陶然亭-白纸坊学区', '测试-陶然亭-白纸坊学区', '[{\"lng\":116.34937,\"lat\":39.873612},{\"lng\":116.349509,\"lat\":39.874757},{\"lng\":116.349461,\"lat\":39.876103},{\"lng\":116.349353,\"lat\":39.877614},{\"lng\":116.349235,\"lat\":39.878894},{\"lng\":116.348978,\"lat\":39.883299},{\"lng\":116.350045,\"lat\":39.883348},{\"lng\":116.351997,\"lat\":39.883323},{\"lng\":116.353542,\"lat\":39.883262},{\"lng\":116.356165,\"lat\":39.883258},{\"lng\":116.359052,\"lat\":39.883266},{\"lng\":116.362549,\"lat\":39.883245},{\"lng\":116.363601,\"lat\":39.883249},{\"lng\":116.367216,\"lat\":39.883249},{\"lng\":116.374168,\"lat\":39.883179},{\"lng\":116.374619,\"lat\":39.883212},{\"lng\":116.374608,\"lat\":39.885855},{\"lng\":116.374748,\"lat\":39.888563},{\"lng\":116.374705,\"lat\":39.889206},{\"lng\":116.383138,\"lat\":39.889378},{\"lng\":116.384608,\"lat\":39.88942},{\"lng\":116.384683,\"lat\":39.887164},{\"lng\":116.384811,\"lat\":39.885056},{\"lng\":116.384876,\"lat\":39.883402},{\"lng\":116.387065,\"lat\":39.883402},{\"lng\":116.387258,\"lat\":39.883319},{\"lng\":116.387322,\"lat\":39.883081},{\"lng\":116.387301,\"lat\":39.879771},{\"lng\":116.387333,\"lat\":39.877597},{\"lng\":116.38744,\"lat\":39.87479},{\"lng\":116.387633,\"lat\":39.872245},{\"lng\":116.387676,\"lat\":39.871669},{\"lng\":116.383545,\"lat\":39.871405},{\"lng\":116.370714,\"lat\":39.870442},{\"lng\":116.363762,\"lat\":39.869923},{\"lng\":116.359534,\"lat\":39.869643},{\"lng\":116.353741,\"lat\":39.869166},{\"lng\":116.351874,\"lat\":39.868976},{\"lng\":116.350994,\"lat\":39.869009},{\"lng\":116.350576,\"lat\":39.868721},{\"lng\":116.350072,\"lat\":39.868968},{\"lng\":116.349846,\"lat\":39.869112},{\"lng\":116.349675,\"lat\":39.86924},{\"lng\":116.349455,\"lat\":39.869454},{\"lng\":116.349143,\"lat\":39.869862},{\"lng\":116.349063,\"lat\":39.869997},{\"lng\":116.349176,\"lat\":39.870985},{\"lng\":116.34931,\"lat\":39.872048},{\"lng\":116.349487,\"lat\":39.873604}]', '{\"lng\":116.371082,\"lat\":39.878416}', '13', '2016-05-27 15:12:27', 'zhangyunteng', '2016-05-27 15:21:07', 'zhangyunteng');
INSERT INTO `schoolarea` VALUES ('e4e767b9-4abf-4b1f-a24a-d96109c69672', 'dfdf', '', '[{\"lng\":116.193486,\"lat\":39.975008},{\"lng\":116.227818,\"lat\":40.055468},{\"lng\":116.27451,\"lat\":40.061775},{\"lng\":116.309662,\"lat\":40.01932},{\"lng\":116.27533,\"lat\":39.967241},{\"lng\":116.218892,\"lat\":39.95501}]', '{\"lng\":116.261464,\"lat\":39.999887}', '11', '2016-07-08 15:03:50', null, '2016-07-08 15:08:00', null);
INSERT INTO `schoolarea` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', '展览路学区', '测试---展览路学区', '[{\"lng\":116.356283,\"lat\":39.918481},{\"lng\":116.352217,\"lat\":39.918481},{\"lng\":116.349374,\"lat\":39.91844},{\"lng\":116.349256,\"lat\":39.918407},{\"lng\":116.347346,\"lat\":39.918374},{\"lng\":116.346058,\"lat\":39.918432},{\"lng\":116.344792,\"lat\":39.918391},{\"lng\":116.342121,\"lat\":39.918374},{\"lng\":116.339342,\"lat\":39.918325},{\"lng\":116.33681,\"lat\":39.918308},{\"lng\":116.334589,\"lat\":39.918234},{\"lng\":116.334622,\"lat\":39.920448},{\"lng\":116.334643,\"lat\":39.922834},{\"lng\":116.33445,\"lat\":39.925245},{\"lng\":116.334139,\"lat\":39.928058},{\"lng\":116.333871,\"lat\":39.930609},{\"lng\":116.333656,\"lat\":39.932509},{\"lng\":116.333377,\"lat\":39.935306},{\"lng\":116.333141,\"lat\":39.93756},{\"lng\":116.333087,\"lat\":39.938548},{\"lng\":116.330952,\"lat\":39.93872},{\"lng\":116.33077,\"lat\":39.939971},{\"lng\":116.330614,\"lat\":39.940082},{\"lng\":116.330464,\"lat\":39.940102},{\"lng\":116.329965,\"lat\":39.940135},{\"lng\":116.329579,\"lat\":39.940078},{\"lng\":116.329128,\"lat\":39.940131},{\"lng\":116.328855,\"lat\":39.940843},{\"lng\":116.328662,\"lat\":39.941386},{\"lng\":116.328554,\"lat\":39.941542},{\"lng\":116.328565,\"lat\":39.941834},{\"lng\":116.327975,\"lat\":39.942369},{\"lng\":116.329252,\"lat\":39.942985},{\"lng\":116.329799,\"lat\":39.943183},{\"lng\":116.331022,\"lat\":39.943417},{\"lng\":116.331339,\"lat\":39.943524},{\"lng\":116.332149,\"lat\":39.944047},{\"lng\":116.332529,\"lat\":39.944112},{\"lng\":116.332867,\"lat\":39.944084},{\"lng\":116.333329,\"lat\":39.943915},{\"lng\":116.333935,\"lat\":39.943504},{\"lng\":116.334139,\"lat\":39.943454},{\"lng\":116.334664,\"lat\":39.943532},{\"lng\":116.334874,\"lat\":39.943528},{\"lng\":116.335947,\"lat\":39.943146},{\"lng\":116.336783,\"lat\":39.943175},{\"lng\":116.33799,\"lat\":39.942903},{\"lng\":116.338355,\"lat\":39.942257},{\"lng\":116.338672,\"lat\":39.942031},{\"lng\":116.338908,\"lat\":39.941937},{\"lng\":116.339219,\"lat\":39.942122},{\"lng\":116.339342,\"lat\":39.942237},{\"lng\":116.33939,\"lat\":39.942447},{\"lng\":116.339294,\"lat\":39.942841},{\"lng\":116.339353,\"lat\":39.942977},{\"lng\":116.339686,\"lat\":39.943043},{\"lng\":116.3399,\"lat\":39.943018},{\"lng\":116.340211,\"lat\":39.94278},{\"lng\":116.340544,\"lat\":39.942311},{\"lng\":116.340882,\"lat\":39.942023},{\"lng\":116.341139,\"lat\":39.941949},{\"lng\":116.341408,\"lat\":39.941961},{\"lng\":116.343221,\"lat\":39.942677},{\"lng\":116.343425,\"lat\":39.943121},{\"lng\":116.343666,\"lat\":39.943273},{\"lng\":116.347029,\"lat\":39.943639},{\"lng\":116.350093,\"lat\":39.942928},{\"lng\":116.350371,\"lat\":39.94292},{\"lng\":116.350672,\"lat\":39.943027},{\"lng\":116.351704,\"lat\":39.943761},{\"lng\":116.35172,\"lat\":39.944148},{\"lng\":116.351618,\"lat\":39.944576},{\"lng\":116.351157,\"lat\":39.945797},{\"lng\":116.350856,\"lat\":39.946858},{\"lng\":116.350926,\"lat\":39.948199},{\"lng\":116.351414,\"lat\":39.95051},{\"lng\":116.35157,\"lat\":39.950699},{\"lng\":116.351806,\"lat\":39.950839},{\"lng\":116.355271,\"lat\":39.951781},{\"lng\":116.355529,\"lat\":39.951727},{\"lng\":116.35613,\"lat\":39.949844},{\"lng\":116.356199,\"lat\":39.949412},{\"lng\":116.356221,\"lat\":39.94882},{\"lng\":116.356226,\"lat\":39.947833},{\"lng\":116.356286,\"lat\":39.945743},{\"lng\":116.356254,\"lat\":39.944846},{\"lng\":116.355879,\"lat\":39.943078},{\"lng\":116.355407,\"lat\":39.9414},{\"lng\":116.35546,\"lat\":39.938825},{\"lng\":116.355578,\"lat\":39.935946},{\"lng\":116.355793,\"lat\":39.930171},{\"lng\":116.356093,\"lat\":39.922568}]', '{\"lng\":116.344413,\"lat\":39.936018}', '13', '2016-05-27 14:11:49', 'zhangyunteng', '2016-05-27 15:53:06', 'root');
INSERT INTO `schoolarea` VALUES ('f2c4d944-8e2f-462f-b729-db4efcb96d00', '北太平庄学区', '我所创建的第二个学区', '[{\"lng\":116.350899,\"lat\":40.034602},{\"lng\":116.315365,\"lat\":40.047105},{\"lng\":116.264553,\"lat\":40.033437},{\"lng\":116.25494,\"lat\":39.977686},{\"lng\":116.270046,\"lat\":39.917675},{\"lng\":116.357765,\"lat\":39.956561},{\"lng\":116.370983,\"lat\":39.953797},{\"lng\":116.369953,\"lat\":39.967218},{\"lng\":116.373902,\"lat\":39.977216},{\"lng\":116.357765,\"lat\":40.016199}]', '{\"lng\":116.360512,\"lat\":39.96874}', '13', '2016-05-07 14:01:36', 'hunter', '2016-06-02 14:42:51', 'zhangyunteng');

-- ----------------------------
-- Table structure for `schoolarea_resource_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `schoolarea_resource_mapping`;
CREATE TABLE `schoolarea_resource_mapping` (
  `sa_id` varchar(50) NOT NULL,
  `r_id` varchar(50) NOT NULL,
  `m_addTime` datetime DEFAULT NULL,
  `m_addAdmin` varchar(30) DEFAULT NULL,
  `m_updateTime` datetime DEFAULT NULL,
  `m_updateAdmin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sa_id`,`r_id`),
  KEY `school_fk` (`r_id`),
  CONSTRAINT `schoolarea_resource_mapping_ibfk_1` FOREIGN KEY (`sa_id`) REFERENCES `schoolarea` (`sa_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schoolarea_resource_mapping_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `resource` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolarea_resource_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for `schoolarea_school_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `schoolarea_school_mapping`;
CREATE TABLE `schoolarea_school_mapping` (
  `sa_id` varchar(50) NOT NULL,
  `s_id` varchar(50) NOT NULL,
  `m_addTime` datetime DEFAULT NULL,
  `m_addAdmin` varchar(30) DEFAULT NULL,
  `m_updateTime` datetime DEFAULT NULL,
  `m_updateAdmin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sa_id`,`s_id`),
  KEY `school_fk` (`s_id`),
  CONSTRAINT `schoolArea2_fk` FOREIGN KEY (`sa_id`) REFERENCES `schoolarea` (`sa_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `school_fk` FOREIGN KEY (`s_id`) REFERENCES `school` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolarea_school_mapping
-- ----------------------------
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', '35693d44-460b-4f22-887b-5948e9f932dc', '2016-05-30 22:48:40', 'zhangyunteng', '2016-05-30 22:48:40', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', '61f7c758-2fb7-4f2a-9836-983407363bcd', '2016-05-31 19:34:58', 'zhangyunteng', '2016-05-31 19:34:58', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', '78658714-4171-41ba-9d83-14a9314397fe', '2016-05-31 10:54:56', 'zhangyunteng', '2016-05-31 10:54:56', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', '87991fa6-8b37-4bea-a44e-43c28137911c', '2016-05-31 20:11:57', 'zhangyunteng', '2016-05-31 20:11:57', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', '941b1a6b-e186-4102-973c-ab5ac8def6db', '2016-05-30 22:44:09', 'zhangyunteng', '2016-05-30 22:44:09', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', '970cc243-5b8a-4701-b610-542e4c5e09bd', '2016-05-31 20:14:19', 'zhangyunteng', '2016-05-31 20:14:19', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', 'a66fb6c3-b24a-403d-ad0f-f2dbd66db223', '2016-05-30 22:41:16', 'zhangyunteng', '2016-05-30 22:41:16', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', 'bf7ccb55-7bf6-47ee-8229-c513285e9e38', '2016-05-31 11:04:51', 'zhangyunteng', '2016-05-31 11:04:51', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', 'c75465ed-bfd5-4bd0-96c6-c1d1445a2bcd', '2016-05-30 22:36:45', 'zhangyunteng', '2016-05-30 22:36:45', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('018f1ed7-d684-4399-94e5-d4aa42fe721b', 'df145d7b-01d6-4cd4-a3df-6028341aa675', '2016-05-31 19:03:21', 'zhangyunteng', '2016-05-31 19:05:42', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', '10208cc8-aafc-4bb8-9961-e29d503feb2e', '2016-05-31 11:14:33', 'zhangyunteng', '2016-05-31 11:14:33', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', '37e02a66-2d35-45a8-ac74-3406d0e319c8', '2016-05-31 20:32:51', 'zhangyunteng', '2016-05-31 20:32:51', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', '3b6ef49f-0ad8-47e5-9f38-10b79776fb1d', '2016-05-31 20:03:37', 'zhangyunteng', '2016-05-31 20:03:37', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', '57b6a4d5-0806-4d1e-b9be-3949652bb685', '2016-05-31 20:30:50', 'zhangyunteng', '2016-05-31 20:30:50', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', '636161bd-9f1d-4be1-b5c5-1c3f0d0eee1c', '2016-05-31 11:10:55', 'zhangyunteng', '2016-05-31 11:10:55', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', '77ae0d33-f816-4d29-b535-57f9b4cebc08', '2016-05-31 11:13:04', 'zhangyunteng', '2016-05-31 11:13:04', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', '8b757586-442d-435b-8381-9e8fd7496720', '2016-05-31 11:07:53', 'zhangyunteng', '2016-05-31 11:07:53', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', 'c46eea16-7031-4e6d-98b4-eefce5ee392d', '2016-05-31 19:20:41', 'zhangyunteng', '2016-05-31 19:20:41', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('04ca4371-324d-4683-a24b-305a1e2d42d3', 'fb267ad8-feef-4033-9a86-391fb4e7dd38', '2016-05-31 11:09:41', 'zhangyunteng', '2016-05-31 11:09:41', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('06ac2ff2-9656-4906-ab72-9fd1233d4d52', '161af7a0-aeca-4887-aa89-94cc10128dd6', '2016-05-31 11:42:18', 'zhangyunteng', '2016-05-31 11:42:18', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('06ac2ff2-9656-4906-ab72-9fd1233d4d52', '20d38531-96a1-419f-856d-62b76893e8ff', '2016-05-31 11:47:54', 'zhangyunteng', '2016-05-31 11:47:54', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('06ac2ff2-9656-4906-ab72-9fd1233d4d52', '3b1a1e1a-fd7d-4129-88a4-e27875c47c0d', '2016-05-31 11:45:26', 'zhangyunteng', '2016-05-31 11:45:26', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('06ac2ff2-9656-4906-ab72-9fd1233d4d52', '4856adbd-425d-4b3b-a9b3-da52591008f0', '2016-05-31 11:43:43', 'zhangyunteng', '2016-05-31 11:43:43', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('06ac2ff2-9656-4906-ab72-9fd1233d4d52', 'a65cfc11-717a-490b-9d6d-377ac837992a', '2016-05-31 11:32:13', 'zhangyunteng', '2016-05-31 11:32:13', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('06ac2ff2-9656-4906-ab72-9fd1233d4d52', 'b505037d-6ef9-4622-8bf4-52b48614b624', '2016-05-31 19:28:09', 'zhangyunteng', '2016-05-31 19:28:09', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('06ac2ff2-9656-4906-ab72-9fd1233d4d52', 'f82875f1-377a-440e-a6fe-80c08a2a6438', '2016-05-31 19:12:04', 'zhangyunteng', '2016-05-31 19:12:04', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', '0be461f1-e4d3-48b5-bdc1-5683e69d867b', '2016-05-31 20:00:14', 'zhangyunteng', '2016-05-31 20:00:14', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', '1d693538-27d6-47f8-b625-ce79978a625d', '2016-05-27 16:40:04', 'zhangyunteng', '2016-05-27 16:40:04', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', '7242f467-14fa-48b8-9fe5-8618d3d19262', '2016-05-27 16:32:14', 'zhangyunteng', '2016-05-27 16:32:14', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', '798859ed-98b4-47a7-a853-9d13b448d83d', '2016-05-27 16:30:56', 'zhangyunteng', '2016-05-27 16:30:56', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', '94908a97-8435-4887-8d18-ef13de3e3f2b', '2016-05-27 16:38:29', 'zhangyunteng', '2016-05-27 16:38:29', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', 'aa88de1c-6aed-42da-86b0-c93049991715', '2016-05-27 16:41:23', 'zhangyunteng', '2016-05-27 16:41:23', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', 'ac9d65e6-46f8-493b-9231-a9ea9cb5ed17', '2016-05-27 16:36:22', 'zhangyunteng', '2016-05-27 16:36:22', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', 'd84f93a1-6afe-4e91-bc2e-29cfc10287e0', '2016-05-27 16:29:19', 'zhangyunteng', '2016-05-27 16:29:19', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', 'ddf8d89d-a21f-44c0-a38e-da88ae95fa56', '2016-05-27 16:34:10', 'zhangyunteng', '2016-05-27 16:34:10', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', 'de3ce613-41f5-46a5-a8f7-2e50f523f946', '2016-05-27 16:35:10', 'zhangyunteng', '2016-05-27 16:35:10', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4504c9a6-53ba-4180-9791-49909d453662', 'eef258d0-572a-49f5-8684-0147bf15a7b0', '2016-05-31 19:05:32', 'zhangyunteng', '2016-05-31 19:05:32', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('4eda427b-e418-4a8c-baa8-096c0b76030c', 'd71de222-cbd8-4f4a-b2fc-a8a268a3c0b7', '2016-05-07 14:05:12', 'hunter', '2016-05-12 13:27:31', 'hunter');
INSERT INTO `schoolarea_school_mapping` VALUES ('4eda427b-e418-4a8c-baa8-096c0b76030c', 'fd025c80-91d2-4582-b8ed-58ab55057772', '2016-05-07 13:04:39', 'hunter', '2016-05-12 13:27:43', 'hunter');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', '09ff316f-d5ee-489f-aa7f-06d374846bd8', '2016-05-27 18:59:04', 'zhangyunteng', '2016-05-27 18:59:04', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', '2db0b6ef-e5fe-40ef-a0b0-61d710635e16', '2016-05-27 19:14:29', 'zhangyunteng', '2016-05-27 19:14:29', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', '51ada001-eef0-4af4-8218-9c4cda927f45', '2016-05-31 20:37:42', 'zhangyunteng', '2016-05-31 20:37:42', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', '77e63171-3479-4ef0-937f-84094a151919', '2016-05-27 19:12:54', 'zhangyunteng', '2016-05-27 19:12:54', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', '8aa2b2bf-ca37-4c6c-8b3a-2c8d8cf4f309', '2016-05-31 20:36:25', 'zhangyunteng', '2016-05-31 20:36:25', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', '997829b4-0cb0-42e7-a209-8c03eedaced0', '2016-05-31 20:44:24', 'zhangyunteng', '2016-05-31 20:44:24', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', 'b4be2554-a66b-4662-a676-6271bccebb68', '2016-05-27 18:57:38', 'zhangyunteng', '2016-05-27 18:57:38', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', 'cad51057-d9c3-4220-8fc7-5ab18da5c9e4', '2016-05-31 19:13:54', 'zhangyunteng', '2016-05-31 19:13:54', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', 'd5f7a63e-39a1-4927-a2b3-0250a10f2178', '2016-05-31 20:42:24', 'zhangyunteng', '2016-05-31 20:42:24', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('54581c6c-c423-45be-af5e-b8a727f07e01', 'e267e959-94a1-4d63-8d4f-228529ae01c3', '2016-05-27 19:11:15', 'zhangyunteng', '2016-05-27 19:11:15', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', '369fe3c5-4599-4de3-b106-1edfacbbf46b', '2016-05-27 15:38:28', 'zhangyunteng', '2016-05-27 15:38:28', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', '43291fe4-4171-4f25-b0c1-63a847b8c99a', '2016-05-27 15:53:39', 'zhangyunteng', '2016-05-27 15:53:39', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', '540befed-23a7-42c4-88ae-913dd4e37477', '2016-05-27 15:31:16', 'zhangyunteng', '2016-05-27 15:31:16', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', '5c610f1a-ef38-4927-b2c7-2acfef52eb1a', '2016-05-27 15:28:48', 'zhangyunteng', '2016-05-27 15:28:48', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', '9e7191e2-3110-4495-9ce0-ee1f5e722312', '2016-05-27 15:36:15', 'zhangyunteng', '2016-05-27 15:36:15', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', 'ad98a759-6fef-4537-81f8-4c3b5b3da006', '2016-05-27 15:41:16', 'zhangyunteng', '2016-05-27 15:41:16', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', 'b43dd56e-e85b-4db8-9785-e53d759ddc66', '2016-05-27 16:00:37', 'zhangyunteng', '2016-05-27 16:00:37', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('57ea4899-3bb9-4a40-9f7b-088943f8982c', 'fdc50387-b81f-451e-85d5-4f861b410aaf', '2016-05-27 15:56:11', 'zhangyunteng', '2016-05-27 15:56:11', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '048aaccb-09fb-4a83-99e1-2433d46efbf4', '2016-05-31 18:26:54', 'zhangyunteng', '2016-05-31 18:26:54', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '29eeb5c1-98b4-4f13-ba50-c5fca9d558bc', '2016-05-31 18:36:33', 'zhangyunteng', '2016-05-31 18:36:33', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '31ab7050-6389-493e-8ac0-085c9d9b60e7', '2016-05-31 18:25:36', 'zhangyunteng', '2016-05-31 18:25:36', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '370023ad-aa6d-4436-ab6a-1702ea6054d5', '2016-05-31 20:07:35', 'zhangyunteng', '2016-05-31 20:07:35', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '3f7da527-20b2-469e-bd5a-81d5a0036dbc', '2016-05-31 18:28:36', 'zhangyunteng', '2016-05-31 18:28:36', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '43cbf9e4-8b12-4396-b3e4-aac02e37e1d3', '2016-05-31 18:23:50', 'zhangyunteng', '2016-05-31 18:23:50', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '4cb8670e-77b7-432d-a4e1-7d16f9d58beb', '2016-05-31 19:19:01', 'zhangyunteng', '2016-05-31 19:19:01', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '5f27faf3-912b-4e48-84c8-5232ab607de3', '2016-05-31 20:09:14', 'zhangyunteng', '2016-05-31 20:09:14', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '702066b1-d108-4533-acf1-45e623ab30e2', '2016-05-31 18:38:01', 'zhangyunteng', '2016-05-31 18:38:01', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', '7e90f06e-c0f7-452f-9a25-df9631782f1c', '2016-05-31 20:06:11', 'zhangyunteng', '2016-05-31 20:06:11', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', 'b07c61ac-f9ae-4e13-a14f-2ed307465bff', '2016-05-31 18:22:13', 'zhangyunteng', '2016-05-31 18:22:13', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', 'b6981c27-e8da-4589-9065-cd6fe0c991f4', '2016-05-31 20:10:45', 'zhangyunteng', '2016-05-31 20:10:45', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('5cfd202e-084a-4c3b-97ac-e540143f2ee1', 'bf2a7eb3-e218-4064-939d-b48d89d65ac6', '2016-05-31 18:30:35', 'zhangyunteng', '2016-05-31 18:30:35', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('8ed32491-cb1c-47dd-b913-37b24a26f83e', '0b268843-2e0d-4b46-96e6-4dd3e6e498cf', '2016-05-30 22:22:03', 'zhangyunteng', '2016-05-30 22:22:03', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('8ed32491-cb1c-47dd-b913-37b24a26f83e', '16af60ec-0acc-4ce6-ba05-ebc5d4779733', '2016-05-31 20:20:28', 'zhangyunteng', '2016-05-31 20:20:28', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('8ed32491-cb1c-47dd-b913-37b24a26f83e', '5ce7f443-9c39-4e03-afdf-41b6b96e88fb', '2016-05-30 22:25:55', 'zhangyunteng', '2016-05-30 22:25:55', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('8ed32491-cb1c-47dd-b913-37b24a26f83e', '7178e8ae-fa91-42f5-85f9-225611b5d838', '2016-05-30 22:35:17', 'zhangyunteng', '2016-05-30 22:35:17', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('8ed32491-cb1c-47dd-b913-37b24a26f83e', '8111c18e-1eef-4188-b800-74facc1c546e', '2016-05-31 19:41:13', 'zhangyunteng', '2016-05-31 19:41:13', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('8ed32491-cb1c-47dd-b913-37b24a26f83e', 'c63e319c-019b-4f8b-a671-4e9af6a88878', '2016-05-30 22:23:58', 'zhangyunteng', '2016-05-30 22:23:58', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('8ed32491-cb1c-47dd-b913-37b24a26f83e', 'fd2f4ce1-2999-4351-b922-396ed9fa9327', '2016-05-30 22:27:51', 'zhangyunteng', '2016-05-30 22:27:51', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', '07adc245-fc7b-40d5-9e9f-3b06e8acfbce', '2016-05-31 18:41:02', 'zhangyunteng', '2016-05-31 18:41:02', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', '594779fe-e6f8-48ed-b63c-ce2c65a32d62', '2016-05-31 18:47:46', 'zhangyunteng', '2016-05-31 18:47:46', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', '5b3e9385-fd3f-4c74-9971-15bbd4d5aa0a', '2016-05-31 20:28:54', 'zhangyunteng', '2016-05-31 20:28:54', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', '7ec1c147-f1c1-4be6-a5de-cbcb3e71d882', '2016-05-31 18:48:58', 'zhangyunteng', '2016-05-31 18:48:58', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', '8d991a8f-974a-4fef-a8f9-e0a0dd52562c', '2016-05-31 19:24:29', 'zhangyunteng', '2016-05-31 19:24:29', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', 'c21f57d9-4564-4e17-acae-2d778b5a7952', '2016-05-31 20:22:14', 'zhangyunteng', '2016-05-31 20:22:14', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', 'ca82a479-f3ef-48d1-b010-44ab41734a97', '2016-05-31 20:26:11', 'zhangyunteng', '2016-05-31 20:26:11', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', 'dea9205b-867d-4da1-b929-9083daaee25b', '2016-05-31 18:39:30', 'zhangyunteng', '2016-05-31 18:39:30', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('cab61196-6fc8-4473-b754-0abff62f92a2', 'e4f3c6a7-0570-4d7a-be5a-946aa630d051', '2016-05-31 18:50:02', 'zhangyunteng', '2016-05-31 18:50:02', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '04b7226b-bdb6-484a-ab60-a309629d378c', '2016-05-31 19:55:45', 'zhangyunteng', '2016-05-31 19:55:45', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '09568c4c-b406-4b23-8beb-3146fbf82ba7', '2016-05-27 16:26:11', 'zhangyunteng', '2016-05-27 16:26:11', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '1a62932b-2df3-432d-8772-8f57ac804371', '2016-05-27 16:23:05', 'zhangyunteng', '2016-05-27 16:23:05', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '3362fe1a-c6d5-48b2-bd99-a17651c92b44', '2016-05-31 19:38:53', 'zhangyunteng', '2016-05-31 19:38:53', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '591a2638-9e0b-4bbe-beba-4684d2c74956', '2016-05-31 19:09:51', 'zhangyunteng', '2016-05-31 19:09:51', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '6e2d6465-9937-4589-9877-a1b830a79d44', '2016-05-27 16:24:10', 'zhangyunteng', '2016-05-27 16:24:10', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '9210725b-0171-49ff-bbce-411baab6cc18', '2016-05-27 16:18:54', 'zhangyunteng', '2016-05-27 16:18:54', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', '9e5f3b94-abbc-4511-8abb-801ec32a204e', '2016-05-31 19:45:53', 'zhangyunteng', '2016-05-31 19:47:45', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', 'ce99ff7c-e5bd-409f-8854-72652f96d7ac', '2016-05-27 16:16:15', 'zhangyunteng', '2016-05-27 16:16:15', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', 'f0812480-c918-45da-be45-89dcfe37df3d', '2016-05-27 16:21:29', 'zhangyunteng', '2016-05-27 16:21:29', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('d4fd1f3d-6224-4db6-bb18-bd91de9b43bd', 'f8990802-f588-4ce8-b22e-1272dff91380', '2016-05-31 19:52:34', 'zhangyunteng', '2016-05-31 19:52:34', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', '1010de96-514d-472a-ae60-57a207ccd392', '2016-05-27 18:51:23', 'zhangyunteng', '2016-05-27 18:51:23', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', '1cf50b1c-4161-4575-9af0-553ad0fb4265', '2016-05-27 18:47:53', 'zhangyunteng', '2016-05-27 18:47:53', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', '457a7643-a375-4bc3-a046-88624ed1a884', '2016-05-27 18:54:35', 'zhangyunteng', '2016-05-27 18:54:35', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', '49534cd6-2c84-460c-b84e-4a3eaffe9530', '2016-05-27 18:42:42', 'zhangyunteng', '2016-05-27 18:42:42', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', '81de2f42-8e38-4f9b-a617-46f5fee0f42a', '2016-05-31 19:22:53', 'zhangyunteng', '2016-05-31 19:22:53', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', '86d24695-aa50-4367-a133-42666ad0722f', '2016-05-31 19:26:25', 'zhangyunteng', '2016-05-31 19:26:25', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', '928368b0-babe-4af9-bbdc-dc9d61e6a78f', '2016-05-27 18:46:40', 'zhangyunteng', '2016-05-27 18:46:40', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', 'b37c9762-981c-4210-875e-8ff9ed988366', '2016-05-27 18:44:40', 'zhangyunteng', '2016-05-27 18:44:40', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('e8040dab-9ef4-4698-a2fe-b84636ef883e', 'c52a55c1-d052-41e8-8ce6-fdeed3315459', '2016-05-31 19:17:26', 'zhangyunteng', '2016-05-31 19:17:26', 'zhangyunteng');
INSERT INTO `schoolarea_school_mapping` VALUES ('f2c4d944-8e2f-462f-b729-db4efcb96d00', '1131ec58-35d3-4f54-b901-dbb9a261bbab', '2016-05-07 14:03:33', 'hunter', '2016-05-07 14:03:33', 'hunter');
INSERT INTO `schoolarea_school_mapping` VALUES ('f2c4d944-8e2f-462f-b729-db4efcb96d00', '30b27fd7-d8b9-4fc2-bde6-6d95316fe766', '2016-05-20 19:27:27', 'wangqianyun', '2016-05-20 19:27:27', 'wangqianyun');
INSERT INTO `schoolarea_school_mapping` VALUES ('f2c4d944-8e2f-462f-b729-db4efcb96d00', 'b06af3b5-2751-42d2-813e-96657afdc06f', '2016-05-20 19:28:26', 'wangqianyun', '2016-05-20 19:28:26', 'wangqianyun');
INSERT INTO `schoolarea_school_mapping` VALUES ('f2c4d944-8e2f-462f-b729-db4efcb96d00', 'cc4aeb0e-6c04-409d-b128-dd4359f1425f', '2016-05-20 19:28:56', 'wangqianyun', '2016-05-20 19:28:56', 'wangqianyun');
INSERT INTO `schoolarea_school_mapping` VALUES ('f2c4d944-8e2f-462f-b729-db4efcb96d00', 'ddd5dadb-22da-4b6a-aebb-060320405d00', '2016-05-20 19:28:00', 'wangqianyun', '2016-05-20 19:28:00', 'wangqianyun');

-- ----------------------------
-- Table structure for `school_school_connect`
-- ----------------------------
DROP TABLE IF EXISTS `school_school_connect`;
CREATE TABLE `school_school_connect` (
  `s_id1` varchar(50) NOT NULL,
  `s_id2` varchar(50) NOT NULL,
  `c_type` varchar(5) NOT NULL,
  `c_addTime` datetime DEFAULT NULL,
  `c_addAdmin` varchar(30) DEFAULT NULL,
  `c_updateTime` datetime DEFAULT NULL,
  `c_updateAdmin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`s_id1`,`s_id2`),
  KEY `s_id2_fk` (`s_id2`),
  CONSTRAINT `s_id1_fk` FOREIGN KEY (`s_id1`) REFERENCES `school` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_id2_fk` FOREIGN KEY (`s_id2`) REFERENCES `school` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_school_connect
-- ----------------------------
INSERT INTO `school_school_connect` VALUES ('4856adbd-425d-4b3b-a9b3-da52591008f0', 'df145d7b-01d6-4cd4-a3df-6028341aa675', 'pm', '2016-06-19 21:55:35', 'root', '2016-06-19 21:55:35', 'root');
INSERT INTO `school_school_connect` VALUES ('4856adbd-425d-4b3b-a9b3-da52591008f0', 'f82875f1-377a-440e-a6fe-80c08a2a6438', 'pm', '2016-06-19 21:55:08', 'root', '2016-06-19 21:55:08', 'root');
INSERT INTO `school_school_connect` VALUES ('bf2a7eb3-e218-4064-939d-b48d89d65ac6', '57b6a4d5-0806-4d1e-b9be-3949652bb685', 'pm', '2016-09-27 19:39:14', 'root', '2016-09-27 19:39:14', 'root');
INSERT INTO `school_school_connect` VALUES ('df145d7b-01d6-4cd4-a3df-6028341aa675', '1131ec58-35d3-4f54-b901-dbb9a261bbab', 'mh', '2016-06-19 22:15:24', 'root', '2016-06-19 22:15:24', 'root');

-- ----------------------------
-- Table structure for `union_school_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `union_school_mapping`;
CREATE TABLE `union_school_mapping` (
  `un_id` varchar(50) NOT NULL,
  `s_id` varchar(50) NOT NULL,
  `priority` int(10) DEFAULT NULL,
  PRIMARY KEY (`un_id`,`s_id`),
  KEY `union_school_mapping_fk2` (`s_id`),
  CONSTRAINT `union_school_mapping_fk1` FOREIGN KEY (`un_id`) REFERENCES `my_union` (`un_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `union_school_mapping_fk2` FOREIGN KEY (`s_id`) REFERENCES `school` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of union_school_mapping
-- ----------------------------
INSERT INTO `union_school_mapping` VALUES ('09fa87e9-1d43-4046-8d3f-17b571499268', '09568c4c-b406-4b23-8beb-3146fbf82ba7', '0');
INSERT INTO `union_school_mapping` VALUES ('09fa87e9-1d43-4046-8d3f-17b571499268', '591a2638-9e0b-4bbe-beba-4684d2c74956', '2');
INSERT INTO `union_school_mapping` VALUES ('09fa87e9-1d43-4046-8d3f-17b571499268', 'ce99ff7c-e5bd-409f-8854-72652f96d7ac', '1');
INSERT INTO `union_school_mapping` VALUES ('3a970996-764c-4121-91f3-d662459fe36d', '7e90f06e-c0f7-452f-9a25-df9631782f1c', '0');
INSERT INTO `union_school_mapping` VALUES ('3a970996-764c-4121-91f3-d662459fe36d', 'c21f57d9-4564-4e17-acae-2d778b5a7952', '1');
INSERT INTO `union_school_mapping` VALUES ('3a970996-764c-4121-91f3-d662459fe36d', 'e4f3c6a7-0570-4d7a-be5a-946aa630d051', '2');
INSERT INTO `union_school_mapping` VALUES ('949fd1bf-59f9-447f-9f0e-9e4e902edd9d', '04b7226b-bdb6-484a-ab60-a309629d378c', '1');
INSERT INTO `union_school_mapping` VALUES ('949fd1bf-59f9-447f-9f0e-9e4e902edd9d', '09568c4c-b406-4b23-8beb-3146fbf82ba7', '2');
INSERT INTO `union_school_mapping` VALUES ('949fd1bf-59f9-447f-9f0e-9e4e902edd9d', 'ac9d65e6-46f8-493b-9231-a9ea9cb5ed17', '0');
