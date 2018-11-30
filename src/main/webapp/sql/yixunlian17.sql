/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : yixunlian

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 29/11/2018 18:42:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for db_fhdb
-- ----------------------------
DROP TABLE IF EXISTS `db_fhdb`;
CREATE TABLE `db_fhdb`  (
  `FHDB_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_timingbackup
-- ----------------------------
DROP TABLE IF EXISTS `db_timingbackup`;
CREATE TABLE `db_timingbackup`  (
  `TIMINGBACKUP_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOBNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_timingbackup
-- ----------------------------
INSERT INTO `db_timingbackup` VALUES ('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', 2, '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务');
INSERT INTO `db_timingbackup` VALUES ('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', 2, '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');

-- ----------------------------
-- Table structure for oa_datajur
-- ----------------------------
DROP TABLE IF EXISTS `oa_datajur`;
CREATE TABLE `oa_datajur`  (
  `DATAJUR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DEPARTMENT_IDS` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID组合',
  `STAFF_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工ID',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DATAJUR_ID`) USING BTREE,
  INDEX `FSTAFF`(`STAFF_ID`) USING BTREE,
  CONSTRAINT `FSTAFF` FOREIGN KEY (`STAFF_ID`) REFERENCES `oa_staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_datajur
-- ----------------------------
INSERT INTO `oa_datajur` VALUES ('4d70e7aa68b04941a8187c2be871bf8f', '(\'cbbc84eddde947ba8af7d509e430eb70\',\'8f8b045470f342fdbc4c312ab881d62b\',\'83a25761c618457cae2fa1211bd8696d\',\'a0982dea52554225ab682cd4b421de47\',\'fh\')', '4d70e7aa68b04941a8187c2be871bf8f', '5cccdb7c432449d8b853c52880058140');
INSERT INTO `oa_datajur` VALUES ('9fd17463ffd7487ab90e683c76026655', '(\'cbbc84eddde947ba8af7d509e430eb70\',\'8f8b045470f342fdbc4c312ab881d62b\',\'83a25761c618457cae2fa1211bd8696d\',\'a0982dea52554225ab682cd4b421de47\',\'fh\')', '9fd17463ffd7487ab90e683c76026655', '5cccdb7c432449d8b853c52880058140');
INSERT INTO `oa_datajur` VALUES ('c9f05f925dfc485b9e352916612ab669', '(\'a0982dea52554225ab682cd4b421de47\',\'fh\')', 'c9f05f925dfc485b9e352916612ab669', '8f8b045470f342fdbc4c312ab881d62b');

-- ----------------------------
-- Table structure for oa_department
-- ----------------------------
DROP TABLE IF EXISTS `oa_department`;
CREATE TABLE `oa_department`  (
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_department
-- ----------------------------
INSERT INTO `oa_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `oa_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `oa_department` VALUES ('43196481371d4edf9ebe3f1ef3346ca2', '萨芬的', 'asd', '322332', '0', '323232', '232', '3232323232', '232332', '323232');
INSERT INTO `oa_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B公司', 'b', '002', '0', '冶铁', '李四', '112', '冶铁', '河北');
INSERT INTO `oa_department` VALUES ('83a25761c618457cae2fa1211bd8696d', '销售B组', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '李四', '', '', '');
INSERT INTO `oa_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', '销售A组', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '张三', '0201212', '', '');
INSERT INTO `oa_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1队', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', '小王', '12356989', '', '');
INSERT INTO `oa_department` VALUES ('a3907c8580bb4824b62744219faa49f9', 'sadf', 'asdfasdf', 'asdfas', '0', '32232332', 'asdfasdf', '322323', '32323', '232323');
INSERT INTO `oa_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', '挖煤', '张三', '110', '洼煤矿', '山西');
INSERT INTO `oa_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', '销售部', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '推销商品', '小明', '11236', '推销商品', '909办公室');
INSERT INTO `oa_department` VALUES ('d41af567914a409893d011aa53eda797', '财务部', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '负责发工资', '王武', '11236', '管理财务', '308办公室');

-- ----------------------------
-- Table structure for oa_fhfile
-- ----------------------------
DROP TABLE IF EXISTS `oa_fhfile`;
CREATE TABLE `oa_fhfile`  (
  `FHFILE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  `BZ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长传者',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `FILESIZE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`FHFILE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_fhfile
-- ----------------------------
INSERT INTO `oa_fhfile` VALUES ('315ca5f8a0b642d0a5e67bf80289469f', '3', '2017092409452826393.xlsx', '2017-09-24 21:45:28', '3', 'admin', '0', '0.0');
INSERT INTO `oa_fhfile` VALUES ('a72da452434a4856b771b58dc13348b6', '33', '2017092409431277394.xlsx', '2017-09-24 21:43:12', '23', 'admin', '0', '0.0');

-- ----------------------------
-- Table structure for oa_staff
-- ----------------------------
DROP TABLE IF EXISTS `oa_staff`;
CREATE TABLE `oa_staff`  (
  `STAFF_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `FUNCTIONS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职责',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `SEX` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `JOBTYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位类别',
  `JOBJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参加工作时间',
  `FADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `POLITICAL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `PJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入团时间',
  `SFID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `MARITAL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `DJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进本单位时间',
  `POST` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现岗位',
  `POJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上岗时间',
  `EDUCATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `SCHOOL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `MAJOR` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `FTITLE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `CERTIFICATE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业资格证',
  `CONTRACTLENGTH` int(2) NOT NULL COMMENT '劳动合同时长',
  `CSTARTTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签订日期',
  `CENDTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终止日期',
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现住址',
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账号ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`STAFF_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_staff
-- ----------------------------
INSERT INTO `oa_staff` VALUES ('4d70e7aa68b04941a8187c2be871bf8f', 'liwei', 'asdfas', '0002', '5cccdb7c432449d8b853c52880058140', 'asdfasdf', '15985255468', 'asdf', '男', '2017-08-17', '汉族', 'asdf', '2017-08-23', 'asdf', 'asdf ', '2017-08-01', '513022198510200756', '已婚', '2017-08-14', 'asdf', '2017-08-21', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 3, '2017-08-30', '2017-08-21', 'asdf', '', 'asdfasdfasdf');
INSERT INTO `oa_staff` VALUES ('9fd17463ffd7487ab90e683c76026655', 'www', 'www', 'ww', '5cccdb7c432449d8b853c52880058140', 'ww', 'ww', 'www', '男', '2016-04-27', 'ww', 'ww', '2016-05-03', 'ww', 'ww', '2016-04-25', 'ww', '未婚', '2016-05-09', 'ww', '2016-05-17', 'w', 'w', 'w', 'w', 'www', 2, '2016-05-23', '2016-05-16', 'w', 'san', 'www');
INSERT INTO `oa_staff` VALUES ('c9f05f925dfc485b9e352916612ab669', 'fw', 'y', 'y', '8f8b045470f342fdbc4c312ab881d62b', 'y', 'y', 'y', '男', '2016-06-08', 'y', 'y', '2016-06-03', 'y', 'y', '2016-05-31', 'y', '已婚', '2016-06-07', 'y', '2016-06-08', 'y', 'y', 'y', 'y', 'y', 4, '2016-06-21', '2016-06-21', 'y', 'lisi', 'y');

-- ----------------------------
-- Table structure for sys_activity_sign
-- ----------------------------
DROP TABLE IF EXISTS `sys_activity_sign`;
CREATE TABLE `sys_activity_sign`  (
  `activity_signid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台设置必填的活动报名填写项表',
  `activity_sign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填写项名称',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_signid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_activity_sign
-- ----------------------------
INSERT INTO `sys_activity_sign` VALUES ('1', 'activity_signname', '2018-10-19 16:14:23', '2018-10-19 16:14:28', '姓名');
INSERT INTO `sys_activity_sign` VALUES ('2', 'activity_signsex', '2018-10-19 16:14:47', '2018-10-19 16:14:50', '性别');
INSERT INTO `sys_activity_sign` VALUES ('3', 'activity_signphone', '2018-10-19 16:15:09', '2018-10-19 16:15:12', '手机号');
INSERT INTO `sys_activity_sign` VALUES ('4', 'citycode', '2018-10-19 16:16:20', '2018-10-19 16:16:24', '区域');

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user`  (
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '111',
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '12345',
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '12345',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '12345',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `sex` int(2) NULL DEFAULT NULL COMMENT '用户性别;1为男；0为女；',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode`  (
  `CREATECODE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PACKAGENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790', '2016-01-16 23:20:36', '按钮权限', 'single');
INSERT INTO `sys_createcode` VALUES ('043843a286f84549ad3fa71aac827f6f', 'system', 'FHlog', 'SYS_,fh,FHLOG', 'USERNAME,fh,String,fh,用户名,fh,是,fh,无,fh,100,fh,0Q313596790CZTIME,fh,Date,fh,操作时间,fh,否,fh,无,fh,32,fh,0Q313596790CONTENT,fh,String,fh,事件,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-05-10 21:10:16', '操作日志记录', 'single');
INSERT INTO `sys_createcode` VALUES ('0ee023606efb45b9a3baaa072e502161', 'information', 'FtestMx', 'FH_,fh,FTESTMX', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0Q313596790CHANGDU,fh,Integer,fh,长度,fh,是,fh,无,fh,11,fh,0Q313596790', '2016-04-21 01:52:11', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('1be959583e82473b82f6e62087bd0d38', 'information', 'Attached', 'TB_,fh,ATTACHED', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790FDESCRIBE,fh,String,fh,FDESCRIBE,fh,是,fh,无,fh,255,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790', '2016-04-21 17:07:59', '主表测试', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('3da8e8bd757c44148d89931a54d29c88', 'system', 'UserPhoto', 'SYS_,fh,USERPHOTO', 'USERNAME,fh,String,fh,用户名,fh,否,fh,无,fh,30,fh,0Q313596790PHOTO0,fh,String,fh,原图,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO1,fh,String,fh,头像1,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO2,fh,String,fh,头像2,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO3,fh,String,fh,头像3,fh,否,fh,无,fh,100,fh,0Q313596790', '2016-06-05 17:54:25', '用户头像', 'single');
INSERT INTO `sys_createcode` VALUES ('4173a8c56a504dd6b6213d2b9cd3e91b', 'information', 'AttachedMx', 'TB_,fh,ATTACHEDMX', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790TITLE,fh,String,fh,TITLE,fh,是,fh,无,fh,255,fh,0Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790', '2016-04-21 17:09:40', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('41e07fb03763434daef41cd99d0406c3', 'system', 'LogInImg', 'SYS_,fh,LOGINIMG', 'NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790TYPE,fh,Integer,fh,状态,fh,是,fh,无,fh,2,fh,0Q313596790FORDER,fh,Integer,fh,排序,fh,是,fh,无,fh,3,fh,0Q313596790', '2016-06-03 17:53:22', '登录页面背景图片', 'single');
INSERT INTO `sys_createcode` VALUES ('49d985e081ed44e6b34ba1b8c5466e39', 'fhdb', 'TimingBackUp', 'DB_,fh,TIMINGBACKUP', 'JOBNAME,fh,String,fh,任务名称,fh,否,fh,无,fh,50Q313596790CREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790TYPE,fh,Integer,fh,类型,fh,否,fh,无,fh,1Q313596790FHTIME,fh,String,fh,时间规则,fh,是,fh,无,fh,30Q313596790TIMEEXPLAIN,fh,String,fh,规则说明,fh,是,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-04-09 11:53:38', '定时备份', 'single');
INSERT INTO `sys_createcode` VALUES ('4def60c58aa148b7998270978660ef30', 'fhoa', 'Fhfile', 'OA_,fh,FHFILE', 'NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790CTIME,fh,Date,fh,上传时间,fh,否,fh,无,fh,32,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,100,fh,0Q313596790USERNAME,fh,String,fh,长传者,fh,否,fh,无,fh,50,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,否,fh,无,fh,100,fh,0Q313596790FILESIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10,fh,0Q313596790', '2016-05-27 20:52:01', '文件管理', 'single');
INSERT INTO `sys_createcode` VALUES ('6171984f03a34d9c94a3492ba819e4ff', 'pdt', 'Product', 'PRODUCT,fh,PRODUCT', 'PDT_ID,fh,Integer,fh,备注1,fh,是,fh,无,fh,33,fh,0Q313596790PDT_TITLE,fh,String,fh,备注2,fh,是,fh,无,fh,50,fh,0Q313596790PDT_SC_PRICE,fh,Integer,fh,备注3,fh,是,fh,无,fh,10,fh,0Q313596790PDT_MY_PRICE,fh,Integer,fh,备注4,fh,是,fh,无,fh,10,fh,0Q313596790PDT_MIN_IMG,fh,String,fh,备注5,fh,是,fh,无,fh,150,fh,0Q313596790PDT_MSG,fh,String,fh,备注6,fh,是,fh,无,fh,21845,fh,0Q313596790PDT_TYPE_ID,fh,Integer,fh,备注7,fh,是,fh,无,fh,22,fh,0Q313596790PDT_BANNER_ID,fh,Integer,fh,备注8,fh,是,fh,无,fh,22,fh,0Q313596790PDT_IMG_LIST,fh,String,fh,备注9,fh,是,fh,无,fh,21845,fh,0Q313596790PDT_CREATED,fh,Date,fh,备注10,fh,是,fh,无,fh,19,fh,0Q313596790PDT_UPDATED,fh,Date,fh,备注11,fh,是,fh,无,fh,19,fh,0Q313596790', '2017-07-31 21:21:36', '商品操作模块', 'single');
INSERT INTO `sys_createcode` VALUES ('6988981a2e5c4ad3988abf4c9a30ab68', 'banner', 'Banner', 'TB_BANNER,fh,BANNER', 'BANNER_NAME,fh,String,fh,品牌名称,fh,是,fh,无,fh,50,fh,0Q313596790BANNER_IMG,fh,String,fh,品牌图片,fh,是,fh,无,fh,150,fh,0Q313596790', '2017-07-31 19:17:28', '商品品牌', 'single');
INSERT INTO `sys_createcode` VALUES ('91af9fe509704fa68f6bca121359e3ec', 'fhoa', 'Staff', 'OA_,fh,STAFF', 'NAME,fh,String,fh,姓名,fh,是,fh,无,fh,50,fh,0Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50,fh,0Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门,fh,是,fh,无,fh,100,fh,0Q313596790FUNCTIONS,fh,String,fh,职责,fh,是,fh,无,fh,255,fh,0Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,20,fh,0Q313596790EMAIL,fh,String,fh,邮箱,fh,是,fh,无,fh,50,fh,0Q313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,10,fh,0Q313596790BIRTHDAY,fh,Date,fh,出生日期,fh,是,fh,无,fh,32,fh,0Q313596790NATION,fh,String,fh,民族,fh,是,fh,无,fh,10,fh,0Q313596790JOBTYPE,fh,String,fh,岗位类别,fh,是,fh,无,fh,30,fh,0Q313596790JOBJOINTIME,fh,Date,fh,参加工作时间,fh,是,fh,无,fh,32,fh,0Q313596790FADDRESS,fh,String,fh,籍贯,fh,是,fh,无,fh,100,fh,0Q313596790POLITICAL,fh,String,fh,政治面貌,fh,是,fh,无,fh,30,fh,0Q313596790PJOINTIME,fh,Date,fh,入团时间,fh,是,fh,无,fh,32,fh,0Q313596790SFID,fh,String,fh,身份证号,fh,是,fh,无,fh,20,fh,0Q313596790MARITAL,fh,String,fh,婚姻状况,fh,是,fh,无,fh,10,fh,0Q313596790DJOINTIME,fh,Date,fh,进本单位时间,fh,是,fh,无,fh,32,fh,0Q313596790POST,fh,String,fh,现岗位,fh,是,fh,无,fh,30,fh,0Q313596790POJOINTIME,fh,Date,fh,上岗时间,fh,是,fh,无,fh,32,fh,0Q313596790EDUCATION,fh,String,fh,学历,fh,是,fh,无,fh,10,fh,0Q313596790SCHOOL,fh,String,fh,毕业学校,fh,是,fh,无,fh,30,fh,0Q313596790MAJOR,fh,String,fh,专业,fh,是,fh,无,fh,30,fh,0Q313596790FTITLE,fh,String,fh,职称,fh,是,fh,无,fh,30,fh,0Q313596790CERTIFICATE,fh,String,fh,职业资格证,fh,是,fh,无,fh,30,fh,0Q313596790CONTRACTLENGTH,fh,Integer,fh,劳动合同时长,fh,是,fh,无,fh,2,fh,0Q313596790CSTARTTIME,fh,Date,fh,签订日期,fh,是,fh,无,fh,32,fh,0Q313596790CENDTIME,fh,Date,fh,终止日期,fh,是,fh,无,fh,32,fh,0Q313596790ADDRESS,fh,String,fh,现住址,fh,是,fh,无,fh,100,fh,0Q313596790USER_ID,fh,String,fh,绑定账号ID,fh,否,fh,无,fh,100,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-04-23 20:44:31', '员工管理', 'single');
INSERT INTO `sys_createcode` VALUES ('aabd0f7054b14028b9d094586756dfa7', 'pdt', 'Product', ',fh,PRODUCT', 'PDT_ID,fh,Integer,fh,备注1,fh,是,fh,无,fh,33,fh,0Q313596790PDT_TITLE,fh,String,fh,备注2,fh,是,fh,无,fh,50,fh,0Q313596790PDT_SC_PRICE,fh,Integer,fh,备注3,fh,是,fh,无,fh,10,fh,0Q313596790PDT_MY_PRICE,fh,Integer,fh,备注4,fh,是,fh,无,fh,10,fh,0Q313596790PDT_MIN_IMG,fh,String,fh,备注5,fh,是,fh,无,fh,150,fh,0Q313596790PDT_MSG,fh,String,fh,备注6,fh,是,fh,无,fh,21845,fh,0Q313596790PDT_TYPE_ID,fh,Integer,fh,备注7,fh,是,fh,无,fh,22,fh,0Q313596790PDT_BANNER_ID,fh,Integer,fh,备注8,fh,是,fh,无,fh,22,fh,0Q313596790PDT_IMG_LIST,fh,String,fh,备注9,fh,是,fh,无,fh,21845,fh,0Q313596790PDT_CREATED,fh,Date,fh,备注10,fh,是,fh,无,fh,19,fh,0Q313596790PDT_UPDATED,fh,Date,fh,备注11,fh,是,fh,无,fh,19,fh,0Q313596790', '2017-07-31 19:48:13', '商品操作模块', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('ae92803163ff44539e91711cfbe35411', 'fhoa', 'Datajur', 'OA_,fh,DATAJUR', 'DEPARTMENT_IDS,fh,String,fh,部门ID组合,fh,否,fh,无,fh,5000,fh,0Q313596790STAFF_ID,fh,String,fh,员工ID,fh,否,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,是,fh,无,fh,100,fh,0Q313596790', '2016-04-27 03:49:39', '数据权限表', 'single');
INSERT INTO `sys_createcode` VALUES ('bf35ab8b2d064bf7928a04bba5e5a6dd', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790', '2016-03-27 21:39:45', '站内信', 'single');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790', '2015-12-20 01:49:25', '组织机构', 'tree');
INSERT INTO `sys_createcode` VALUES ('c937e21208914e5b8fb1202c685bbf2f', 'fhdb', 'Fhdb', 'DB_,fh,FHDB', 'USERNAME,fh,String,fh,操作用户,fh,否,fh,无,fh,50Q313596790BACKUP_TIME,fh,Date,fh,备份时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790SQLPATH,fh,String,fh,存储位置,fh,否,fh,无,fh,300Q313596790TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,1Q313596790DBSIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10Q313596790BZ,fh,String,fh,备注,fh,否,fh,无,fh,255Q313596790', '2016-03-30 13:46:54', '数据库管理', 'single');
INSERT INTO `sys_createcode` VALUES ('dd143deaf19b4d089e110167fee1a939', 'product', 'Product', 'TB_PRODUCT,fh,PRODUCT', 'PDT_TITLE,fh,String,fh,商品名称,fh,是,fh,无,fh,100,fh,0Q313596790PDT_NO,fh,String,fh,商品编号,fh,是,fh,无,fh,100,fh,0Q313596790PDT_BRAND,fh,Integer,fh,商品品牌,fh,否,fh,1,fh,5,fh,0Q313596790PDT_MIN_IMG,fh,String,fh,商品小图,fh,是,fh,无,fh,150,fh,0Q313596790PDT_DETAIL,fh,String,fh,商品详情,fh,是,fh,无,fh,500,fh,0Q313596790PDT_SC_PRICE,fh,Integer,fh,商品市场价,fh,是,fh,无,fh,11,fh,0Q313596790PDT_MY_PRICE,fh,Integer,fh,我们的价格,fh,是,fh,无,fh,11,fh,0Q313596790PDT_TAG,fh,String,fh,商品标签,fh,是,fh,无,fh,50,fh,0Q313596790PDT_TYPE,fh,Integer,fh,商品类别,fh,否,fh,0,fh,5,fh,0Q313596790PDT_CREATED,fh,Date,fh,发布时间,fh,是,fh,无,fh,32,fh,0Q313596790PDT_UPDATED,fh,Date,fh,更新时间,fh,是,fh,无,fh,32,fh,0Q313596790', '2017-07-31 19:14:47', '商品管理', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('fbc700144f94493ca07623066db0c802', 'type', 'TYPE', 'TB_TYPE,fh,TYPE', 'TYEP_NAME,fh,String,fh,类别名称,fh,是,fh,无,fh,50,fh,0Q313596790TYPE_PARENT_ID,fh,Integer,fh,商品父类id,fh,否,fh,0,fh,11,fh,0Q313596790TYPE_CHILD_ID,fh,Integer,fh,子类id,fh,是,fh,无,fh,5,fh,0Q313596790', '2017-07-31 19:13:24', '商品类别', 'tree');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-01-15 18:38:40', '按钮管理', 'single');
INSERT INTO `sys_createcode` VALUES ('ff6e6cdc87ba42579b033cf4925d4d70', 'dst', 'DataSource2', 'DS_,fh,DATASOURCE2', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,100,fh,0Q313596790CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-05-23 15:51:46', '第2数据源例子', 'single');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries`  (
  `DICTIONARIES_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('00ef925d227444859eef2057693722ae', '达州', 'dazhou', '0032504', 4, 'd3538add7125404aba4b0007ef9fde50', '达州市', '');
INSERT INTO `sys_dictionaries` VALUES ('010692054ac24eeebf5b8067f0f0521a', '安庆', 'anqing', '0030401', 1, '249999f296d14f95b8138a30bbb2c374', '安庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('023473e9e6204583a110531036357514', '山西', 'shanxi', '00323', 23, '1', '山西省', '');
INSERT INTO `sys_dictionaries` VALUES ('02e5eb8f50bd4824ad97427e2b372d14', '绥化', 'suihua', '0031312', 12, 'b2d4133b5dbf4599ada940620d2ab250', '绥化市', '');
INSERT INTO `sys_dictionaries` VALUES ('035fe989f54742ac8b64b80b24213442', '来宾', 'laibin', '0030809', 9, 'c5f3d426c582410281f89f1451e1d854', '来宾市', '');
INSERT INTO `sys_dictionaries` VALUES ('055273fe79f94e09a64698dab8d30ea8', '揭阳', 'jieyang', '0030708', 8, '0dd1f40bcb9d46aeba015dc19645a5b9', '揭阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('05ab2921b64d4f5c935c35228cc49ecb', '大同', 'datong', '0032302', 2, '023473e9e6204583a110531036357514', '大同市', '');
INSERT INTO `sys_dictionaries` VALUES ('05ed855479d94b139c77ae82452bb39c', '涪陵区', 'fulingqu', '0033102', 2, '1c85fbd06cf840d093f3640aca1b6b2d', '涪陵区', '');
INSERT INTO `sys_dictionaries` VALUES ('076995f7d0034b32a94e0130d406d137', '湖州', 'huzhou', '0033002', 2, '6d846178376549ed878d11d109819f25', '湖州市', '');
INSERT INTO `sys_dictionaries` VALUES ('076a163af6814f93954a543bd3b2fa4d', '广州', 'guangzhou', '0030704', 4, '0dd1f40bcb9d46aeba015dc19645a5b9', '广州市', '');
INSERT INTO `sys_dictionaries` VALUES ('085ebd2776384eff842de8b61b781a7e', '潼南区', 'tongnanqu', '0033122', 22, '1c85fbd06cf840d093f3640aca1b6b2d', '潼南区', '');
INSERT INTO `sys_dictionaries` VALUES ('0953fe05e34642169c4cf24492b163b9', '湘西', 'xiangxi', '0031514', 14, 'c59f91630bef4289b71fcb2a48994582', '湘西市', '');
INSERT INTO `sys_dictionaries` VALUES ('098bf5e3603e44889a2c4bb25e350400', '阿坝', 'a\'ba', '0032501', 1, 'd3538add7125404aba4b0007ef9fde50', '阿坝市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a2561ec256b4f46b4fa76c621256595', '鹤岗', 'hegang', '0031304', 4, 'b2d4133b5dbf4599ada940620d2ab250', '鹤岗市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a65f2ef68d54b7c8772e1d916684c4a', '岳阳', 'yueyang', '0031506', 6, 'c59f91630bef4289b71fcb2a48994582', '岳阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a754e878c304b99bf5d34a82ca3705c', '吉林', 'jilin', '0031604', 4, '857be71b0d6d4a40a2c83476824206d1', '吉林市', '');
INSERT INTO `sys_dictionaries` VALUES ('0b08e52f2b264d0da66d37e718e32aba', '常德', 'changde', '0031507', 7, 'c59f91630bef4289b71fcb2a48994582', '常德市', '');
INSERT INTO `sys_dictionaries` VALUES ('0c908137935946ac885cb56e55ff4f5d', '北碚区', 'beibeiqu', '0033109', 9, '1c85fbd06cf840d093f3640aca1b6b2d', '北碚区', '');
INSERT INTO `sys_dictionaries` VALUES ('0dba32de24014bcab807fd0fc51953aa', '北海', 'beihai', '0030802', 2, 'c5f3d426c582410281f89f1451e1d854', '北海市', '');
INSERT INTO `sys_dictionaries` VALUES ('0dd1f40bcb9d46aeba015dc19645a5b9', '广东', 'guangdong', '00307', 7, '1', '广东省', '');
INSERT INTO `sys_dictionaries` VALUES ('0e18ab3edf5e43ee8737c156b0b50692', '吉安', 'ji\'an', '0031803', 3, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '吉安市', '');
INSERT INTO `sys_dictionaries` VALUES ('0eb279a28a0d43c7a075d58c6cfc3e02', '长寿区', 'changshouqu', '0033115', 15, '1c85fbd06cf840d093f3640aca1b6b2d', '长寿区', '');
INSERT INTO `sys_dictionaries` VALUES ('0efda23d751b42cb9472ca4f80cdf6c5', '德州', 'dezhou', '0030303', 3, '10f46a521ea0471f8d71ee75ac3b5f3a', '德州市', '');
INSERT INTO `sys_dictionaries` VALUES ('0f975f2f51e245439b7d759f822a4a43', '嘉定区', 'jiadingqu', '0030210', 10, 'f1ea30ddef1340609c35c88fb2919bee', '嘉定区', '');
INSERT INTO `sys_dictionaries` VALUES ('1', '地区', 'diqu', '003', 3, '0', '地区', '');
INSERT INTO `sys_dictionaries` VALUES ('10a2b2b54bce432baf603c7fa4b45de0', '淮北', 'huaibei', '0030409', 9, '249999f296d14f95b8138a30bbb2c374', '淮北市', '');
INSERT INTO `sys_dictionaries` VALUES ('10c14cd82df9496bb86c5681ddfb92fb', '本溪', 'benxi', '0031902', 2, 'b3366626c66c4b61881f09e1722e8495', '本溪市', '');
INSERT INTO `sys_dictionaries` VALUES ('10f46a521ea0471f8d71ee75ac3b5f3a', '山东', 'shandong', '00303', 3, '1', '山东省', '');
INSERT INTO `sys_dictionaries` VALUES ('10f5278b19824877988e8baa5a1b58f4', '邯郸', 'handan', '0031104', 4, '75362368f22f4d60a810c2a45cced487', '邯郸市', '');
INSERT INTO `sys_dictionaries` VALUES ('11ab8df614c14451bb08a91fbe05162e', '防城港', 'fangchenggang', '0030804', 4, 'c5f3d426c582410281f89f1451e1d854', '防城港市', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', 1, '1', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('13b4d440cdd043378c2bbd0b797bc7b7', '黄石', 'huangshi', '0031404', 4, '312b80775e104ba08c8244a042a658df', '黄石市', '');
INSERT INTO `sys_dictionaries` VALUES ('13e9e380abed4def837bea1671b92633', '大兴安岭', 'daxinganling', '0031302', 2, 'b2d4133b5dbf4599ada940620d2ab250', '大兴安岭市', '');
INSERT INTO `sys_dictionaries` VALUES ('14452abafbef4cadbb05a5a74a61eb6f', '广安', 'guang\'an', '0032507', 7, 'd3538add7125404aba4b0007ef9fde50', '广安市', '');
INSERT INTO `sys_dictionaries` VALUES ('158588bf48464dcca0e656968b8e09c0', '密云区', 'miyunqu', '0030115', 15, '12a62a3e5bed44bba0412b7e6b733c93', '密云区', '');
INSERT INTO `sys_dictionaries` VALUES ('159d49075827476490aee58956fb159c', '潜江', 'qianjiang', '0031406', 6, '312b80775e104ba08c8244a042a658df', '潜江市', '');
INSERT INTO `sys_dictionaries` VALUES ('15da226f465b4dac95c8333fd3d81747', '淮安', 'huaian', '0031702', 2, '577405ff648240959b3765c950598ab0', '淮安市', '');
INSERT INTO `sys_dictionaries` VALUES ('16535e38a2534f4781353e7570831ea1', '丽江', 'lijiang', '0032909', 9, '510607a1836e4079b3103e14ec5864ed', '丽江', '');
INSERT INTO `sys_dictionaries` VALUES ('165fd1c02d98439d8d7cc2e81def88d6', '陇南', 'longnan', '0030609', 9, '3283f1a77180495f9a0b192d0f9cdd35', '陇南市', '');
INSERT INTO `sys_dictionaries` VALUES ('16a1eb63489e4d28827fc16a90e2ed61', '贵港', 'guigang', '0030805', 5, 'c5f3d426c582410281f89f1451e1d854', '贵港市', '');
INSERT INTO `sys_dictionaries` VALUES ('1895a514cda74329817bce6a5fe918f4', '济源', 'jiyuan', '0031203', 3, '7336944efb4b40fcae9118fc9a970d2d', '济源市', '');
INSERT INTO `sys_dictionaries` VALUES ('1929f99821f2484fa33991233c1555e9', '大理', 'dali', '0032904', 4, '510607a1836e4079b3103e14ec5864ed', '大理', '');
INSERT INTO `sys_dictionaries` VALUES ('192a36eb3d234a909e339c06b9cf723a', '许昌', 'xuchang', '0031215', 15, '7336944efb4b40fcae9118fc9a970d2d', '许昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('19cf8222eac9457280ebb40f14052590', '南岸区', 'nan\'anqu', '0033108', 8, '1c85fbd06cf840d093f3640aca1b6b2d', '南岸区', '');
INSERT INTO `sys_dictionaries` VALUES ('1a99e7e302ce4f24b4b5d5d4b20a75fe', '清远', 'qingyuan', '0030711', 11, '0dd1f40bcb9d46aeba015dc19645a5b9', '清远市', '');
INSERT INTO `sys_dictionaries` VALUES ('1ac809034f3d471592a5c74e19c7f1bc', '烟台', 'yantai', '0030315', 15, '10f46a521ea0471f8d71ee75ac3b5f3a', '烟台市', '');
INSERT INTO `sys_dictionaries` VALUES ('1b65dd2a2057489c9598c789b4114d24', '孝感', 'xiaogan', '0031415', 15, '312b80775e104ba08c8244a042a658df', '孝感市', '');
INSERT INTO `sys_dictionaries` VALUES ('1b79421601744059a4ef6b0ca9be32f9', '上学期', 'shangxueqi', '0010101', 1, '5b1905ef82bf48039a96cd5dd1d8da10', '上学期', '');
INSERT INTO `sys_dictionaries` VALUES ('1b8b44f0c4384a09987ab0c5d9ceedd2', '神农架林区', 'shennongjialinqu', '0031407', 7, '312b80775e104ba08c8244a042a658df', '神农架林区', '');
INSERT INTO `sys_dictionaries` VALUES ('1c4313525bdc4d4b9f7849dfb614cfb3', '柳州', 'liuzhou', '0030810', 10, 'c5f3d426c582410281f89f1451e1d854', '柳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('1c85fbd06cf840d093f3640aca1b6b2d', '重庆', 'chongqing', '00331', 31, '1', '重庆', '');
INSERT INTO `sys_dictionaries` VALUES ('1cf92384c7ee46faa91acface462b32f', '沧州', 'cangzhou', '0031102', 2, '75362368f22f4d60a810c2a45cced487', '沧州市', '');
INSERT INTO `sys_dictionaries` VALUES ('1d0deff7da2745cc960cfa9ae07bdd13', '抚顺', 'fushun', '0031906', 6, 'b3366626c66c4b61881f09e1722e8495', '抚顺市', '');
INSERT INTO `sys_dictionaries` VALUES ('1d6d2d9af05849da9807d4cba0144695', '南通', 'nantong', '0031705', 5, '577405ff648240959b3765c950598ab0', '南通市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e228d052ec24bb7ba64524f51689cef', '鄂尔多斯', 'eerduosi', '0032005', 5, 'c072c248c7ab47dda7bf24f5e577925c', '鄂尔多斯市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e429ce404794a30aad09bc592d0f5ce', '荆门', 'jingmen', '0031405', 5, '312b80775e104ba08c8244a042a658df', '荆门市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e89ca839dbf46a3bc8c02b7d55802c5', '长沙', 'changsha', '0031501', 1, 'c59f91630bef4289b71fcb2a48994582', '长沙市', '');
INSERT INTO `sys_dictionaries` VALUES ('2087851693514e3c9c98fd843fb5b32c', '河西区', 'hexiqu', '0032603', 3, '2c254799d3454f2cbc338ef5712548e9', '河西区', '');
INSERT INTO `sys_dictionaries` VALUES ('20a08ca32856488dad122529f901fb9b', '固原', 'guyuan', '0032101', 1, '5690b0534fe745e5ba0f504f0c260559', '固原市', '');
INSERT INTO `sys_dictionaries` VALUES ('20f6d6c3b3234c21b52755ab6b690ffe', '杭州', 'hangzhou', '0033001', 1, '6d846178376549ed878d11d109819f25', '杭州市', '');
INSERT INTO `sys_dictionaries` VALUES ('212dbe5474304ad8b5f6e6049a72da46', '包头', 'baotou', '0032003', 3, 'c072c248c7ab47dda7bf24f5e577925c', '包头市', '');
INSERT INTO `sys_dictionaries` VALUES ('217c993dce9544c89279e88bdd60e7a8', '黄冈', 'huanggang', '0031403', 3, '312b80775e104ba08c8244a042a658df', '黄冈市', '');
INSERT INTO `sys_dictionaries` VALUES ('22ef24142b0a4d6e9f05582e3c8790a9', '济南', 'jinan', '0030301', 1, '10f46a521ea0471f8d71ee75ac3b5f3a', '济南市', '');
INSERT INTO `sys_dictionaries` VALUES ('2303cab27d704a259d7b0c42a687f3db', '马鞍山', 'maanshan', '0030413', 13, '249999f296d14f95b8138a30bbb2c374', '马鞍山市', '');
INSERT INTO `sys_dictionaries` VALUES ('23aff8da2e6c4513be3155f372c45046', '石嘴山', 'shizuishan', '0032103', 3, '5690b0534fe745e5ba0f504f0c260559', '石嘴山市', '');
INSERT INTO `sys_dictionaries` VALUES ('23caa037fe8c4283b7a7fc42da4a45a9', '武威', 'wuwei', '0030613', 13, '3283f1a77180495f9a0b192d0f9cdd35', '武威市', '');
INSERT INTO `sys_dictionaries` VALUES ('23f71d660bb94d239dde6738b73d3905', '延边', 'yanbian', '0031609', 9, '857be71b0d6d4a40a2c83476824206d1', '延边市', '');
INSERT INTO `sys_dictionaries` VALUES ('24007511f8ec42da8c6555305afe56ce', '青岛', 'qindao', '0030310', 10, '10f46a521ea0471f8d71ee75ac3b5f3a', '青岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('2431e2f471624fd9bf0f76b7049b1296', '驻马店', 'zhumadian', '0031218', 18, '7336944efb4b40fcae9118fc9a970d2d', '驻马店市', '');
INSERT INTO `sys_dictionaries` VALUES ('244ffa16c2cd4594af2dfed2f7257d24', '德阳', 'deyang', '0032505', 5, 'd3538add7125404aba4b0007ef9fde50', '德阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('2477f3e5e2c94c73844b060d9dc82316', '深圳', 'shenzhen', '0030715', 15, '0dd1f40bcb9d46aeba015dc19645a5b9', '深圳市', '');
INSERT INTO `sys_dictionaries` VALUES ('249999f296d14f95b8138a30bbb2c374', '安徽', 'anhui', '00304', 4, '1', '安徽省', '');
INSERT INTO `sys_dictionaries` VALUES ('25892ce9cba1429fb1b45d4aaeaf3bca', '石家庄', 'shijiazhuang', '0031108', 8, '75362368f22f4d60a810c2a45cced487', '石家庄市', '');
INSERT INTO `sys_dictionaries` VALUES ('2627d3e9f98a4cdfbe0f59a4c5d3772a', '白银', 'baiyin', '0030601', 1, '3283f1a77180495f9a0b192d0f9cdd35', '白银市', '');
INSERT INTO `sys_dictionaries` VALUES ('26a79d023ad7483194241cddf97f3689', '莱芜', 'laiwu', '0030307', 7, '10f46a521ea0471f8d71ee75ac3b5f3a', '莱芜市', '');
INSERT INTO `sys_dictionaries` VALUES ('26b093ae7635474d8da8162efe7e4035', '合川区', 'hechuanqu', '0033117', 17, '1c85fbd06cf840d093f3640aca1b6b2d', '合川区', '');
INSERT INTO `sys_dictionaries` VALUES ('26d4e79797d34b11b58eb12e5c0c55ae', '抚州', 'fuzhou', '0031801', 1, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '抚州市', '');
INSERT INTO `sys_dictionaries` VALUES ('273f2c545056473abaf320327073b48b', '无锡', 'wuxi', '0031709', 9, '577405ff648240959b3765c950598ab0', '无锡市', '');
INSERT INTO `sys_dictionaries` VALUES ('27927fbc83154894b096221da15b326a', '保定', 'baoding', '0031101', 1, '75362368f22f4d60a810c2a45cced487', '保定市', '');
INSERT INTO `sys_dictionaries` VALUES ('287baf1c903444359971b0ce8d58dce2', '普洱', 'pu\'er', '0032912', 12, '510607a1836e4079b3103e14ec5864ed', '普洱', '');
INSERT INTO `sys_dictionaries` VALUES ('29a4dbca082b49078af67caf5fd28f4f', '漳州', 'zhangzhou', '0030509', 9, 'd4066f6f425a4894a77f49f539f2a34f', '漳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2a4c3b9f024743d19907b36ab4a43499', '宣城', 'xuancheng', '0030417', 17, '249999f296d14f95b8138a30bbb2c374', '宣城市', '');
INSERT INTO `sys_dictionaries` VALUES ('2a4f0cb0748645bab53b94b62412df04', '黔西南', 'qianxinan', '0030907', 7, '592f6fcf45a74524aa8ea853fc9761d5', '黔西南市', '');
INSERT INTO `sys_dictionaries` VALUES ('2ae081dd5d3c47b584fdaf24769e49e1', '玉溪', 'yuxi', '0032915', 15, '510607a1836e4079b3103e14ec5864ed', '玉溪', '');
INSERT INTO `sys_dictionaries` VALUES ('2ba8e6d0fd944983aa19b781c6b53477', '海南', 'hainan', '00310', 10, '1', '海南省', '');
INSERT INTO `sys_dictionaries` VALUES ('2bd0431e3566451297ecd194287a878a', '甘孜', 'ganzi', '0032506', 6, 'd3538add7125404aba4b0007ef9fde50', '甘孜', '');
INSERT INTO `sys_dictionaries` VALUES ('2c0da3154cc74d7990c597bed6ebf2d6', '大兴区', 'daxingqu', '0030112', 12, '12a62a3e5bed44bba0412b7e6b733c93', '大兴区', '');
INSERT INTO `sys_dictionaries` VALUES ('2c254799d3454f2cbc338ef5712548e9', '天津', 'tianjin', '00326', 26, '1', '天津', '');
INSERT INTO `sys_dictionaries` VALUES ('2d0e4687904b48738ac6bd6a42e7f32d', '忻州', 'xinzhou', '0032309', 9, '023473e9e6204583a110531036357514', '忻州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2d0ff92556b544c19dbfc8b8b055e19a', '常州', 'changzhou', '0031701', 1, '577405ff648240959b3765c950598ab0', '常州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2e3c279cf0a44115869049e4a6d9ed08', '西宁', 'xining', '0032207', 7, '5a80e3435c0e4dc09bafceeadb38e5f0', '西宁', '');
INSERT INTO `sys_dictionaries` VALUES ('2f097a8914de4b01a04bf61852435672', '阿勒泰', 'a\'letai', '0032802', 2, '2fabed91c6d94e698ed449165cd250ca', '阿勒泰', '');
INSERT INTO `sys_dictionaries` VALUES ('2f5e433682f24e20b600532062ff0bcb', '白山', 'baishan', '0031602', 2, '857be71b0d6d4a40a2c83476824206d1', '白山市', '');
INSERT INTO `sys_dictionaries` VALUES ('2f7f68eb9be845be90e74a0763de2c7f', '平谷区', 'pingguqu', '0030114', 14, '12a62a3e5bed44bba0412b7e6b733c93', '平谷区', '');
INSERT INTO `sys_dictionaries` VALUES ('2f8e7a55eaab4649b9abe43ade744e58', '大庆', 'daqing', '0031301', 1, 'b2d4133b5dbf4599ada940620d2ab250', '大庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('2fabed91c6d94e698ed449165cd250ca', '新疆', 'xinjiang', '00328', 28, '1', '新疆', '');
INSERT INTO `sys_dictionaries` VALUES ('30d424f63bf44e8391683f371ed3552f', '秦皇岛', 'qinhuangdao', '0031107', 7, '75362368f22f4d60a810c2a45cced487', '秦皇岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('312b80775e104ba08c8244a042a658df', '湖北', 'hubei', '00314', 14, '1', '湖北省', '');
INSERT INTO `sys_dictionaries` VALUES ('3186f859efa246f793401c475d3d0090', '阿里', 'a\'li', '0032701', 1, '3e846b08dbbe495e93bc93f8f202de79', '阿里', '');
INSERT INTO `sys_dictionaries` VALUES ('325e45e49c1849efb7fea2296f686210', '赣州', 'ganzhou', '0031802', 2, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '赣州市', '');
INSERT INTO `sys_dictionaries` VALUES ('3283f1a77180495f9a0b192d0f9cdd35', '甘肃', 'gansu', '00306', 6, '1', '甘肃省', '');
INSERT INTO `sys_dictionaries` VALUES ('329838f633f340779483910f33387ccd', '通州区', 'tongzhouqu', '0030109', 9, '12a62a3e5bed44bba0412b7e6b733c93', '通州区', '');
INSERT INTO `sys_dictionaries` VALUES ('3326f321dfe54e5292e94a9f2a518723', '乌鲁木齐', 'wulumuqi', '0032812', 12, '2fabed91c6d94e698ed449165cd250ca', '乌鲁木齐', '');
INSERT INTO `sys_dictionaries` VALUES ('33fe30734ed84994bdd46ebe69aac088', '朝阳区', 'chaoyangqu', '0030103', 3, '12a62a3e5bed44bba0412b7e6b733c93', '朝阳区', '');
INSERT INTO `sys_dictionaries` VALUES ('34bc05269e304e2e99c9ded314a12321', '石景山区', 'shijingshanqu', '0030105', 5, '12a62a3e5bed44bba0412b7e6b733c93', '石景山区', '');
INSERT INTO `sys_dictionaries` VALUES ('34d6634b8baa47a3b1c0d0346d93873b', '和平区', 'hepingqu', '0032601', 1, '2c254799d3454f2cbc338ef5712548e9', '和平区', '');
INSERT INTO `sys_dictionaries` VALUES ('3521e41344aa42aaa1cd212482992055', '漯河', 'luohe', '0031207', 7, '7336944efb4b40fcae9118fc9a970d2d', '漯河市', '');
INSERT INTO `sys_dictionaries` VALUES ('38bc876c1cab4434af9d14be194463c8', '南充', 'nanchong', '0032514', 14, 'd3538add7125404aba4b0007ef9fde50', '南充市', '');
INSERT INTO `sys_dictionaries` VALUES ('39595ea4b765445dae9c26ae870b3a0f', '克州', 'kezhou', '0032809', 9, '2fabed91c6d94e698ed449165cd250ca', '克州', '');
INSERT INTO `sys_dictionaries` VALUES ('3a3b4ea7445a4aec80083e5957028990', '汕头', 'shantou', '0030712', 12, '0dd1f40bcb9d46aeba015dc19645a5b9', '汕头市', '');
INSERT INTO `sys_dictionaries` VALUES ('3a5d1b6e800541c683724672cae3e0f6', '泰安', 'taian', '0030312', 12, '10f46a521ea0471f8d71ee75ac3b5f3a', '泰安市', '');
INSERT INTO `sys_dictionaries` VALUES ('3ad7c52e9a7044a1a9ab00f29f8cef7c', '阿克苏', 'a\'kesu', '0032801', 1, '2fabed91c6d94e698ed449165cd250ca', '阿克苏', '');
INSERT INTO `sys_dictionaries` VALUES ('3ae7c64c40c147eeb3898883e20a7fe0', '山南', 'shannan', '0032707', 7, '3e846b08dbbe495e93bc93f8f202de79', '山南', '');
INSERT INTO `sys_dictionaries` VALUES ('3d2a8f11e6d345b5af2f8e5d8bb6bb7a', '鹰潭', 'yingtan', '0031811', 11, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '鹰潭市', '');
INSERT INTO `sys_dictionaries` VALUES ('3dbed4444dfc4884ab57d769ceac9507', '松江区', 'songjiangqu', '0030213', 13, 'f1ea30ddef1340609c35c88fb2919bee', '松江区', '');
INSERT INTO `sys_dictionaries` VALUES ('3e846b08dbbe495e93bc93f8f202de79', '西藏', 'xizang', '00327', 27, '1', '西藏', '');
INSERT INTO `sys_dictionaries` VALUES ('3eed1c5fb2c9420dbe6e76fdb0f9c4cb', '眉山', 'meishan', '0032511', 11, 'd3538add7125404aba4b0007ef9fde50', '眉山市', '');
INSERT INTO `sys_dictionaries` VALUES ('3ef5fb1ad8e24696a9de78b987847238', '中学', 'zhongxue', '00102', 2, 'b602b0bc378a46629cc37dc037eb9684', '中学', '');
INSERT INTO `sys_dictionaries` VALUES ('3f7c5e8ba51849549f5e5dfee72566cc', '呼伦贝尔', 'hulunbeier', '0032007', 7, 'c072c248c7ab47dda7bf24f5e577925c', '呼伦贝尔市', '');
INSERT INTO `sys_dictionaries` VALUES ('3fb6c72b11124211a22d9f8f40715737', '辽阳', 'liaoyang', '0031910', 10, 'b3366626c66c4b61881f09e1722e8495', '辽阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('3fffacbb502d4647bd358ff00412f536', '长治', 'changzhi', '0032301', 1, '023473e9e6204583a110531036357514', '长治市', '');
INSERT INTO `sys_dictionaries` VALUES ('407fa7f152f4461582cfd6904b2c454a', '晋城', 'jincheng', '0032303', 3, '023473e9e6204583a110531036357514', '晋城市', '');
INSERT INTO `sys_dictionaries` VALUES ('415fe5fbf3054a3ea2ebdbe24ce4c49f', '永川区', 'yongchuanqu', '0033118', 18, '1c85fbd06cf840d093f3640aca1b6b2d', '永川区', '');
INSERT INTO `sys_dictionaries` VALUES ('417d25314a9e43c6b7b725db160db360', '延安', 'yan\'an', '0032409', 9, '534850c72ceb4a57b7dc269da63c330a', '延安市', '');
INSERT INTO `sys_dictionaries` VALUES ('4266f08d4bc24321bba7ea3a83a8ba95', '永州', 'yongzhou', '0031511', 11, 'c59f91630bef4289b71fcb2a48994582', '永州市', '');
INSERT INTO `sys_dictionaries` VALUES ('429dc62e0f6641b8b2ddced272d5d087', '遵义', 'zunyi', '0030909', 9, '592f6fcf45a74524aa8ea853fc9761d5', '遵义市', '');
INSERT INTO `sys_dictionaries` VALUES ('432c0a1be10143beba6de15ad8811b64', '安顺', 'anshun', '0030901', 1, '592f6fcf45a74524aa8ea853fc9761d5', '安顺市', '');
INSERT INTO `sys_dictionaries` VALUES ('44fee1b9a9e141f9bdf90053f4972d2e', '北辰区', 'beichenqu', '0032610', 10, '2c254799d3454f2cbc338ef5712548e9', '北辰区', '');
INSERT INTO `sys_dictionaries` VALUES ('458411aef2d34ccd99ab5976f0f1f030', '金华', 'jinhua', '0033004', 4, '6d846178376549ed878d11d109819f25', '金华市', '');
INSERT INTO `sys_dictionaries` VALUES ('45a5be4b22ec494c99b112a7c96bca47', '钦州', 'qinzhou', '0030812', 12, 'c5f3d426c582410281f89f1451e1d854', '钦州市', '');
INSERT INTO `sys_dictionaries` VALUES ('4795a00ae89441ce82bcabdf086e8316', '宝鸡', 'baoji', '0032402', 2, '534850c72ceb4a57b7dc269da63c330a', '宝鸡市', '');
INSERT INTO `sys_dictionaries` VALUES ('480875fd43a947119e24c2302eeead53', '伊春', 'yichun', '0031313', 13, 'b2d4133b5dbf4599ada940620d2ab250', '伊春市', '');
INSERT INTO `sys_dictionaries` VALUES ('4921e0e6f9d445cdb6a4b3da98ab3555', '林芝', 'linzhi', '0032704', 4, '3e846b08dbbe495e93bc93f8f202de79', '林芝', '');
INSERT INTO `sys_dictionaries` VALUES ('4972af008f074efd91ea8312587afb42', '牡丹江', 'mudanjiang', '0031308', 8, 'b2d4133b5dbf4599ada940620d2ab250', '牡丹江市', '');
INSERT INTO `sys_dictionaries` VALUES ('49b4639e83e441c581bfdefda3a9ac27', '宜春', 'yichun', '0031810', 10, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '宜春市', '');
INSERT INTO `sys_dictionaries` VALUES ('4b41fbe4cdae414a91af371e3105ebe5', '景德镇', 'jingdezhen', '0031804', 4, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '景德镇市', '');
INSERT INTO `sys_dictionaries` VALUES ('4b72f022312e4664ae7863b343239ff0', '淄博', 'zibo', '0030317', 17, '10f46a521ea0471f8d71ee75ac3b5f3a', '淄博市', '');
INSERT INTO `sys_dictionaries` VALUES ('4be3e0a560a2486eae928b44110e971e', '白城', 'baicheng', '0031601', 1, '857be71b0d6d4a40a2c83476824206d1', '白城市', '');
INSERT INTO `sys_dictionaries` VALUES ('4c5dbcb293bf40f8837c0acec1ad67eb', '佳木斯', 'jiamusi', '0031307', 7, 'b2d4133b5dbf4599ada940620d2ab250', '佳木斯市', '');
INSERT INTO `sys_dictionaries` VALUES ('4cee922697a64ec78de69210e8e40af1', '昌都', 'changdu', '0032702', 2, '3e846b08dbbe495e93bc93f8f202de79', '昌都', '');
INSERT INTO `sys_dictionaries` VALUES ('50b42656af3f4068984fa042e81d7d22', '威海', 'weihai', '0030313', 13, '10f46a521ea0471f8d71ee75ac3b5f3a', '威海市', '');
INSERT INTO `sys_dictionaries` VALUES ('510607a1836e4079b3103e14ec5864ed', '云南', 'yunnan', '00329', 29, '1', '云南省', '');
INSERT INTO `sys_dictionaries` VALUES ('512a316326984ed8aa32d7f610b7604f', '玉树', 'yushu', '0032208', 8, '5a80e3435c0e4dc09bafceeadb38e5f0', '玉树', '');
INSERT INTO `sys_dictionaries` VALUES ('51f23688604848809184ec828f89cfca', '嘉兴', 'jiaxing', '0033003', 3, '6d846178376549ed878d11d109819f25', '嘉兴市', '');
INSERT INTO `sys_dictionaries` VALUES ('5259c4093aa84f7c88a367685581fbc6', '门头沟区', 'mentougouqu', '0030107', 7, '12a62a3e5bed44bba0412b7e6b733c93', '门头沟区', '');
INSERT INTO `sys_dictionaries` VALUES ('52630830669149edba48a7bb9b06e297', '中卫', 'zhongwei', '0032106', 6, '5690b0534fe745e5ba0f504f0c260559', '中卫市', '');
INSERT INTO `sys_dictionaries` VALUES ('534850c72ceb4a57b7dc269da63c330a', '陕西', 'shanxi', '00324', 24, '1', '陕西省', '');
INSERT INTO `sys_dictionaries` VALUES ('537974fdf5f54b8f99452bb8a03cf37b', '厦门', 'xiamen', '0030508', 8, 'd4066f6f425a4894a77f49f539f2a34f', '厦门市', '');
INSERT INTO `sys_dictionaries` VALUES ('53ca3f5aede8420b835b38bbc542da81', '松源', 'songyuan', '0031607', 7, '857be71b0d6d4a40a2c83476824206d1', '松源市', '');
INSERT INTO `sys_dictionaries` VALUES ('558d920174014b4cb5a0c8f518b5819b', '东城区', 'dongchengqu', '0030101', 1, '12a62a3e5bed44bba0412b7e6b733c93', '东城区', '');
INSERT INTO `sys_dictionaries` VALUES ('56103b0e83a44d07a6025061fab4cebc', '运城', 'yuncheng', '0032311', 11, '023473e9e6204583a110531036357514', '运城市', '');
INSERT INTO `sys_dictionaries` VALUES ('5690b0534fe745e5ba0f504f0c260559', '宁夏', 'ningxia', '00321', 21, '1', '宁夏', '');
INSERT INTO `sys_dictionaries` VALUES ('576fa3bd7d294f61af1315e95f70d44c', '九龙坡区', 'jiulongpoqu', '0033107', 7, '1c85fbd06cf840d093f3640aca1b6b2d', '九龙坡区', '');
INSERT INTO `sys_dictionaries` VALUES ('577405ff648240959b3765c950598ab0', '江苏', 'jiangsu', '00317', 17, '1', '江苏省', '');
INSERT INTO `sys_dictionaries` VALUES ('58ed29aefce044339ecf067f514c43cb', '宁德', 'ningde', '0030504', 4, 'd4066f6f425a4894a77f49f539f2a34f', '宁德市', '');
INSERT INTO `sys_dictionaries` VALUES ('5908fbf750a347b8a6b82af7778bb866', '商洛', 'shangluo', '0032404', 4, '534850c72ceb4a57b7dc269da63c330a', '商洛市', '');
INSERT INTO `sys_dictionaries` VALUES ('592f6fcf45a74524aa8ea853fc9761d5', '贵州', 'guizhou', '00309', 9, '1', '贵州省', '');
INSERT INTO `sys_dictionaries` VALUES ('59dbb93b007d44a6ae97744ac14e642c', '龙岩', 'longyan', '0030502', 2, 'd4066f6f425a4894a77f49f539f2a34f', '龙岩市', '');
INSERT INTO `sys_dictionaries` VALUES ('5a80e3435c0e4dc09bafceeadb38e5f0', '青海', 'qinghai', '00322', 22, '1', '青海', '');
INSERT INTO `sys_dictionaries` VALUES ('5b1905ef82bf48039a96cd5dd1d8da10', '小学', 'xiaoxue', '00101', 1, 'b602b0bc378a46629cc37dc037eb9684', '小学', '');
INSERT INTO `sys_dictionaries` VALUES ('5b5747166f714882b5cdfbeb7856f965', '周口', 'zhoukou', '0031217', 17, '7336944efb4b40fcae9118fc9a970d2d', '周口市', '');
INSERT INTO `sys_dictionaries` VALUES ('5c91965168eb4deaab99266bbb4b64e1', '朝阳', 'chaoyang', '0031903', 3, 'b3366626c66c4b61881f09e1722e8495', '朝阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('5d2d367b0aee49449e65d0dd7601ee29', '巴中', 'bazhong', '0032502', 2, 'd3538add7125404aba4b0007ef9fde50', '巴中市', '');
INSERT INTO `sys_dictionaries` VALUES ('5ddde49610d4433eb157897d01ba6838', '东莞', 'dongguan', '0030702', 2, '0dd1f40bcb9d46aeba015dc19645a5b9', '东莞市', '');
INSERT INTO `sys_dictionaries` VALUES ('5e85d09db1054472bcca22d82da6ec5d', '乐山', 'leshan', '0032509', 9, 'd3538add7125404aba4b0007ef9fde50', '乐山市', '');
INSERT INTO `sys_dictionaries` VALUES ('60c96ec0debf4cc4bf5974c93d4f638c', '阳泉', 'yangquan', '0032310', 10, '023473e9e6204583a110531036357514', '阳泉市', '');
INSERT INTO `sys_dictionaries` VALUES ('61c3711334fe44b0806e717e6fb238b0', '滨海新区', 'binhaixinqu', '0032613', 13, '2c254799d3454f2cbc338ef5712548e9', '滨海新区', '');
INSERT INTO `sys_dictionaries` VALUES ('6214f40ad2704fb6af0ded59420ca958', '安康', 'ankang', '0032401', 1, '534850c72ceb4a57b7dc269da63c330a', '安康市', '');
INSERT INTO `sys_dictionaries` VALUES ('62ed6854726c4674ae2f5b676ddec7fb', '新乡', 'xinxiang', '0031213', 13, '7336944efb4b40fcae9118fc9a970d2d', '新乡市', '');
INSERT INTO `sys_dictionaries` VALUES ('6303e3eeffb441018044b039063e3f96', '丹东', 'dandong', '0031905', 5, 'b3366626c66c4b61881f09e1722e8495', '丹东市', '');
INSERT INTO `sys_dictionaries` VALUES ('644316de71f942f9a90eb1f810eca872', '怀柔区', 'huairouqu', '0030113', 13, '12a62a3e5bed44bba0412b7e6b733c93', '怀柔区', '');
INSERT INTO `sys_dictionaries` VALUES ('64a03236dd084d09ada9a1ca22b3815f', '长春', 'changchun', '0031603', 3, '857be71b0d6d4a40a2c83476824206d1', '长春市', '');
INSERT INTO `sys_dictionaries` VALUES ('65629a05de764a19b66b752726f5cdbd', '海淀区', 'haidianqu', '0030106', 6, '12a62a3e5bed44bba0412b7e6b733c93', '海淀区', '');
INSERT INTO `sys_dictionaries` VALUES ('6567a081f5d142779e17edbda3da9a04', '宁波', 'ningbo', '0033006', 6, '6d846178376549ed878d11d109819f25', '宁波市', '');
INSERT INTO `sys_dictionaries` VALUES ('6624ad3b318149f3a8ee5beef1b8b38f', '肇庆', 'zhaoqing', '0030719', 19, '0dd1f40bcb9d46aeba015dc19645a5b9', '肇庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('66d9ddeebbea43f4b52cd33964c4c429', '语文', 'yuwen', '001010101', 1, '1b79421601744059a4ef6b0ca9be32f9', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('674ec37e9641450dadc9798df10c58bc', '静安区', 'jing\'anqu', '0030204', 4, 'f1ea30ddef1340609c35c88fb2919bee', '静安区', '');
INSERT INTO `sys_dictionaries` VALUES ('67cba9a4ca4c4c38ac3ba2c21dd191e6', '南昌', 'nanchang', '0031806', 6, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '南昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('68a8f7a8337141d3a092fadfd2457970', '鸡西', 'jixi', '0031306', 6, 'b2d4133b5dbf4599ada940620d2ab250', '鸡西市', '');
INSERT INTO `sys_dictionaries` VALUES ('6932b6b7b5124bef8385fb8e5b5c2568', '通化', 'tonghua', '0031608', 8, '857be71b0d6d4a40a2c83476824206d1', '通化市', '');
INSERT INTO `sys_dictionaries` VALUES ('694348f8e1c0444e8e0b2c2caf4de1a6', '榆林', 'yulin', '0032410', 10, '534850c72ceb4a57b7dc269da63c330a', '榆林市', '');
INSERT INTO `sys_dictionaries` VALUES ('697141b58ada46518bc8ec0cc3d64b31', '博州', 'bozhou', '032804', 4, '2fabed91c6d94e698ed449165cd250ca', '博州', '');
INSERT INTO `sys_dictionaries` VALUES ('6a2226c73bc745faa6973dd3af3e274a', '吐鲁番', 'tulufan', '0032811', 11, '2fabed91c6d94e698ed449165cd250ca', '吐鲁番', '');
INSERT INTO `sys_dictionaries` VALUES ('6b2b1d55b06b44cd8a487d327397b69b', '徐汇区', 'xuhuiqu', '0030202', 2, 'f1ea30ddef1340609c35c88fb2919bee', '徐汇区', '');
INSERT INTO `sys_dictionaries` VALUES ('6d1e9b9c9c334448878312d589eeaeac', '荣昌区', 'rongchangqu', '0033123', 23, '1c85fbd06cf840d093f3640aca1b6b2d', '荣昌区', '');
INSERT INTO `sys_dictionaries` VALUES ('6d846178376549ed878d11d109819f25', '浙江', 'zhejiang', '00330', 30, '1', '浙江省', '');
INSERT INTO `sys_dictionaries` VALUES ('6daab50a4a1048f993f348a66dcfa83d', '喀什', 'kashi', '0032807', 7, '2fabed91c6d94e698ed449165cd250ca', '喀什', '');
INSERT INTO `sys_dictionaries` VALUES ('6dc38f66c86a4f32ac9d585e668c110e', '怒江', 'nujiang', '0032911', 11, '510607a1836e4079b3103e14ec5864ed', '怒江', '');
INSERT INTO `sys_dictionaries` VALUES ('6e1f1c6d82704e5cadcd0bc8ef2ab79f', '昆明', 'kunming', '0032908', 8, '510607a1836e4079b3103e14ec5864ed', '昆明', '');
INSERT INTO `sys_dictionaries` VALUES ('6e639147d90943c38490cafe223985ce', '梅州', 'meizhou', '0030710', 10, '0dd1f40bcb9d46aeba015dc19645a5b9', '梅州市', '');
INSERT INTO `sys_dictionaries` VALUES ('6e67518f1da44dbaa8cf95920779f188', '汕尾', 'shanwei', '0030713', 13, '0dd1f40bcb9d46aeba015dc19645a5b9', '汕尾市', '');
INSERT INTO `sys_dictionaries` VALUES ('6eaa823330da42b6b5783e389707853c', '四平', 'siping', '0031606', 6, '857be71b0d6d4a40a2c83476824206d1', '四平市', '');
INSERT INTO `sys_dictionaries` VALUES ('6ecc40e527404bba89207cc158ef3994', '河源', 'heyuan', '0030705', 5, '0dd1f40bcb9d46aeba015dc19645a5b9', '河源市', '');
INSERT INTO `sys_dictionaries` VALUES ('6ee20f02066e43a29f10ca6dbd0b7c71', '普陀区', 'putuoqu', '0030205', 5, 'f1ea30ddef1340609c35c88fb2919bee', '普陀区', '');
INSERT INTO `sys_dictionaries` VALUES ('6f5749ab2b5d4cbea1655e9a5197096d', '湛江', 'zhanjiang', '0030718', 18, '0dd1f40bcb9d46aeba015dc19645a5b9', '湛江市', '');
INSERT INTO `sys_dictionaries` VALUES ('6f8c18c8b3a54bc287c1dfc5642be577', '三明', 'sanming', '0030507', 7, 'd4066f6f425a4894a77f49f539f2a34f', '三明市', '');
INSERT INTO `sys_dictionaries` VALUES ('6f9601270aca46519e7f8836e0d2446c', '广元', 'guangyuan', '0032508', 8, 'd3538add7125404aba4b0007ef9fde50', '广元市', '');
INSERT INTO `sys_dictionaries` VALUES ('6fd083505ab24086b234c032dab3c2a7', '海口', 'haikou', '0031001', 1, '2ba8e6d0fd944983aa19b781c6b53477', '海口市', '');
INSERT INTO `sys_dictionaries` VALUES ('70733399b60d4b058c255fa9fff2eee0', '莆田', 'putian', '0030505', 5, 'd4066f6f425a4894a77f49f539f2a34f', '莆田市', '');
INSERT INTO `sys_dictionaries` VALUES ('70c1525174a04767865d0e6b7ed01f5a', '七台河', 'qitaihe', '0031309', 9, 'b2d4133b5dbf4599ada940620d2ab250', '七台河市', '');
INSERT INTO `sys_dictionaries` VALUES ('70c41ec5cb9e4aec98bd2357702c4082', '江门', 'jiangmen', '0030707', 7, '0dd1f40bcb9d46aeba015dc19645a5b9', '江门市', '');
INSERT INTO `sys_dictionaries` VALUES ('71aba068cd5b4588a03be75e2e49f496', '鄂州', 'ezhou', '0031401', 1, '312b80775e104ba08c8244a042a658df', '鄂州市', '');
INSERT INTO `sys_dictionaries` VALUES ('7336944efb4b40fcae9118fc9a970d2d', '河南', 'henan', '00312', 12, '1', '河南省', '');
INSERT INTO `sys_dictionaries` VALUES ('748623f3282b4ca7ace0e73303327310', '巴南区', 'bananqu', '0033113', 13, '1c85fbd06cf840d093f3640aca1b6b2d', '巴南区', '');
INSERT INTO `sys_dictionaries` VALUES ('74d2aaddaf294355b01970d52e303a1a', '资阳', 'ziyang', '0032519', 19, 'd3538add7125404aba4b0007ef9fde50', '资阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('75362368f22f4d60a810c2a45cced487', '河北', 'hebei', '00311', 11, '1', '河北省', '');
INSERT INTO `sys_dictionaries` VALUES ('755e2d15540c49dbad6be564f694a4af', '曲靖', 'qujing', '0032913', 13, '510607a1836e4079b3103e14ec5864ed', '曲靖', '');
INSERT INTO `sys_dictionaries` VALUES ('75b889c8e86c4d518a1fb74b089ceae8', '攀枝花', 'panzhihua', '0032515', 15, 'd3538add7125404aba4b0007ef9fde50', '攀枝花市', '');
INSERT INTO `sys_dictionaries` VALUES ('75e0334ad60b41a1b42ae6724b06c874', '镇江', 'zhenjiang', '0031713', 13, '577405ff648240959b3765c950598ab0', '镇江市', '');
INSERT INTO `sys_dictionaries` VALUES ('762bc3b1443e4ea98ab051b4007c0238', '邢台', 'xingtai', '0031110', 10, '75362368f22f4d60a810c2a45cced487', '邢台市', '');
INSERT INTO `sys_dictionaries` VALUES ('76d023f160e448c8bcb78598bf246a44', '黔南', 'qiannan', '0030906', 6, '592f6fcf45a74524aa8ea853fc9761d5', '黔南市', '');
INSERT INTO `sys_dictionaries` VALUES ('773cb4f25b9d4ebcba2953570da776c9', '吴忠', 'wuzhong', '0032104', 4, '5690b0534fe745e5ba0f504f0c260559', '吴忠市', '');
INSERT INTO `sys_dictionaries` VALUES ('776b55acb6804296a00c9f97723633ba', '舟山', 'zhoushan', '0033011', 11, '6d846178376549ed878d11d109819f25', '舟山市', '');
INSERT INTO `sys_dictionaries` VALUES ('79b98f7f0c054fa0ab2a3a2cb75d1b87', '邵阳', 'shaoyang', '0031505', 5, 'c59f91630bef4289b71fcb2a48994582', '邵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('7a8097646dc8419284201db66dd6eda1', '芜湖', 'wuhu', '0030416', 16, '249999f296d14f95b8138a30bbb2c374', '芜湖市', '');
INSERT INTO `sys_dictionaries` VALUES ('7ab1618b70354ee2ab49e8fd5cbca27f', '哈密', 'hami', '0032806', 6, '2fabed91c6d94e698ed449165cd250ca', '哈密', '');
INSERT INTO `sys_dictionaries` VALUES ('7bed9f7f137e4048bbfd0d564283312d', '日照', 'rizhao', '0030311', 11, '10f46a521ea0471f8d71ee75ac3b5f3a', '日照市', '');
INSERT INTO `sys_dictionaries` VALUES ('7c6addc8becd4e759479228f6dd38bb2', '通辽', 'tongliao', '0032008', 8, 'c072c248c7ab47dda7bf24f5e577925c', '通辽市', '');
INSERT INTO `sys_dictionaries` VALUES ('7f69cfd9e1ae4c92b4ddf13b9f78cb6c', '保山', 'baoshan', '0032902', 2, '510607a1836e4079b3103e14ec5864ed', '保山', '');
INSERT INTO `sys_dictionaries` VALUES ('802ef5c62bbb47e3a026e3c92989f53e', '临夏', 'linxia', '0030608', 8, '3283f1a77180495f9a0b192d0f9cdd35', '临夏市', '');
INSERT INTO `sys_dictionaries` VALUES ('8114568fa8a34c6e878ff13d5ba59006', '齐齐哈尔', 'qiqihaer', '0031310', 10, 'b2d4133b5dbf4599ada940620d2ab250', '齐齐哈尔市', '');
INSERT INTO `sys_dictionaries` VALUES ('8127fbeb13a44c3284dfa8e2326ce19a', '茂名', 'maoming', '0030709', 9, '0dd1f40bcb9d46aeba015dc19645a5b9', '茂名市', '');
INSERT INTO `sys_dictionaries` VALUES ('813ff1376c0445c6a64b9f00452c2427', '成都', 'chengdu', '0032503', 3, 'd3538add7125404aba4b0007ef9fde50', '成都市', '');
INSERT INTO `sys_dictionaries` VALUES ('81443e6b687349c6ae3231aff5e038ba', '铜陵', 'tongling', '0030415', 15, '249999f296d14f95b8138a30bbb2c374', '铜陵市', '');
INSERT INTO `sys_dictionaries` VALUES ('8170c3271bc840d78e92ed355851aa5e', '西城区', 'xichengqu', '0030102', 2, '12a62a3e5bed44bba0412b7e6b733c93', '西城区', '');
INSERT INTO `sys_dictionaries` VALUES ('8346ebddc2464a9bbb99f7b0794da39c', '韶关', 'shaoguan', '0030714', 14, '0dd1f40bcb9d46aeba015dc19645a5b9', '韶关市', '');
INSERT INTO `sys_dictionaries` VALUES ('8362c89358c748a5907b44de500a1333', '泰州', 'taizhou', '0031708', 8, '577405ff648240959b3765c950598ab0', '泰州市', '');
INSERT INTO `sys_dictionaries` VALUES ('83e9fbd9e7fa4d878575088df7798b5e', '泸州', 'luzhou', '0032510', 10, 'd3538add7125404aba4b0007ef9fde50', '泸州市', '');
INSERT INTO `sys_dictionaries` VALUES ('857be71b0d6d4a40a2c83476824206d1', '吉林', 'jilin', '00316', 16, '1', '吉林省', '');
INSERT INTO `sys_dictionaries` VALUES ('85b8accc31b34d70bce548a9d42767dd', '汉中', 'hanzhong', '0032403', 3, '534850c72ceb4a57b7dc269da63c330a', '汉中市', '');
INSERT INTO `sys_dictionaries` VALUES ('85c0cb3849bc4d79b9c2fa2b63b2c858', '福州', 'fuzhou', '0030501', 1, 'd4066f6f425a4894a77f49f539f2a34f', '福州市', '');
INSERT INTO `sys_dictionaries` VALUES ('85da31513d984f3e8a179b764efb3a22', '太原', 'taiyuan', '0032308', 8, '023473e9e6204583a110531036357514', '太原市', '');
INSERT INTO `sys_dictionaries` VALUES ('863205a0ac1d4c50b19bb79f602dbea7', '张家口', 'zhangjiakou', '0031111', 11, '75362368f22f4d60a810c2a45cced487', '张家口市', '');
INSERT INTO `sys_dictionaries` VALUES ('8636d6e9bdb34510bcb528159ca4f29d', '辽源', 'liaoyuan', '0031605', 5, '857be71b0d6d4a40a2c83476824206d1', '辽源市', '');
INSERT INTO `sys_dictionaries` VALUES ('866bf0b4a8cc41dfb5071f8edb271934', '佛山', 'foshan', '0030703', 3, '0dd1f40bcb9d46aeba015dc19645a5b9', '佛山市', '');
INSERT INTO `sys_dictionaries` VALUES ('86b85d3d8ddc4632946bdc4cdf642504', '虹口区', 'hongkouqu', '0030206', 6, 'f1ea30ddef1340609c35c88fb2919bee', '虹口区', '');
INSERT INTO `sys_dictionaries` VALUES ('871c4e3b4a044b2e8235d731835db559', '酒泉', 'jiuquan', '0030606', 6, '3283f1a77180495f9a0b192d0f9cdd35', '酒泉市', '');
INSERT INTO `sys_dictionaries` VALUES ('87563959aa914187a0b5af82f862a0f0', '金昌', 'jinchang', '0030605', 5, '3283f1a77180495f9a0b192d0f9cdd35', '金昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('886a63c7def64cdfad1cfc0a2de8a1e0', '崇左', 'chongzuo', '0030803', 3, 'c5f3d426c582410281f89f1451e1d854', '崇左市', '');
INSERT INTO `sys_dictionaries` VALUES ('89341f9a48444d258609e87cf40604fa', '伊犁州直', 'yilizhouzhi', '0032813', 13, '2fabed91c6d94e698ed449165cd250ca', '伊犁州直', '');
INSERT INTO `sys_dictionaries` VALUES ('89461222215e40f7b8067c7b791a9c2c', '南平', 'nanping', '0030503', 3, 'd4066f6f425a4894a77f49f539f2a34f', '南平市', '');
INSERT INTO `sys_dictionaries` VALUES ('895262136b904f4888aa5af2f89dc967', '洛阳', 'luoyang', '0031206', 6, '7336944efb4b40fcae9118fc9a970d2d', '洛阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('896bce499bd740ffb9f745a4782a7886', '青浦区', 'qingpuqu', '0030214', 14, 'f1ea30ddef1340609c35c88fb2919bee', '青浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('8a7265e11f0141ba808c0410b76d415b', '临沂', 'linyi', '0030309', 9, '10f46a521ea0471f8d71ee75ac3b5f3a', '临沂市', '');
INSERT INTO `sys_dictionaries` VALUES ('8a79e7d2af7244b0b543492374ec6549', '兴安盟', 'xinganmeng', '0032012', 12, 'c072c248c7ab47dda7bf24f5e577925c', '兴安盟', '');
INSERT INTO `sys_dictionaries` VALUES ('8abbfbb071f34df4b77e2828f53ef99b', '怀化', 'huaihua', '0031512', 12, 'c59f91630bef4289b71fcb2a48994582', '怀化市', '');
INSERT INTO `sys_dictionaries` VALUES ('8af40c23c6fe4ed8819dbe99f1f125f0', '奉贤区', 'fengxianqu', '0030215', 15, 'f1ea30ddef1340609c35c88fb2919bee', '奉贤区', '');
INSERT INTO `sys_dictionaries` VALUES ('8b336fb55c2346a2b5ec13f578c627ef', '苏州', 'suzhou', '0031706', 6, '577405ff648240959b3765c950598ab0', '苏州市', '');
INSERT INTO `sys_dictionaries` VALUES ('8b5512281c364e09a67d8e81a5bd7ce9', '南川区', 'nanchuanqu', '0033119', 19, '1c85fbd06cf840d093f3640aca1b6b2d', '南川区', '');
INSERT INTO `sys_dictionaries` VALUES ('8b95528d20c44f86adf1e64009ce317b', '贵阳', 'guiyang', '0030903', 3, '592f6fcf45a74524aa8ea853fc9761d5', '贵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('8bfd173e34704a7f978c539f87a511a8', '宝山区', 'baoshanqu', '0030209', 9, 'f1ea30ddef1340609c35c88fb2919bee', '宝山区', '');
INSERT INTO `sys_dictionaries` VALUES ('8c64bc307e894223a429a4f50a0cd387', '唐山', 'tangshan', '0031109', 9, '75362368f22f4d60a810c2a45cced487', '唐山市', '');
INSERT INTO `sys_dictionaries` VALUES ('8d10532fba444c66bead45a6d9e13b6a', '延庆区', 'yanqingqu', '0030116', 16, '12a62a3e5bed44bba0412b7e6b733c93', '延庆区', '');
INSERT INTO `sys_dictionaries` VALUES ('8e35c978f8b248cb93863818be6be56b', '大足区', 'dazuqu', '0033111', 11, '1c85fbd06cf840d093f3640aca1b6b2d', '大足区', '');
INSERT INTO `sys_dictionaries` VALUES ('8f617ff8e61c49689cb26540a618a80c', '宁河区', 'ninghequ', '0032614', 14, '2c254799d3454f2cbc338ef5712548e9', '宁河区', '');
INSERT INTO `sys_dictionaries` VALUES ('8fa97a231db54e879ece49d566f0561d', '天门', 'tianmen', '0031410', 10, '312b80775e104ba08c8244a042a658df', '天门市', '');
INSERT INTO `sys_dictionaries` VALUES ('9068c4ec7d1a4de69339fb61654cb3d9', '温州', 'wenzhou', '0033010', 10, '6d846178376549ed878d11d109819f25', '温州市', '');
INSERT INTO `sys_dictionaries` VALUES ('921a9e3d2c434cca943aca4f3e5087b5', '渝中区', 'yuzhongqu', '0033103', 3, '1c85fbd06cf840d093f3640aca1b6b2d', '渝中区', '');
INSERT INTO `sys_dictionaries` VALUES ('923ca61a8fdb4357a5220763fdbd7c37', '台州', 'taizhou', '0033009', 9, '6d846178376549ed878d11d109819f25', '台州市', '');
INSERT INTO `sys_dictionaries` VALUES ('92800c5b33df4f15a689ceda6bd23f2b', '信阳', 'xinyang', '0031214', 14, '7336944efb4b40fcae9118fc9a970d2d', '信阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('9381ab9da4b64001b289252ee21d1157', '河东区', 'hedongqu', '0032602', 2, '2c254799d3454f2cbc338ef5712548e9', '河东区', '');
INSERT INTO `sys_dictionaries` VALUES ('95a7fd77484f4ef39e9ed4596556a93c', '海西', 'haixi', '0032205', 5, '5a80e3435c0e4dc09bafceeadb38e5f0', '海西', '');
INSERT INTO `sys_dictionaries` VALUES ('9795de38301642539aefda61adf595a4', '江津区', 'jiangjinqu', '0033116', 16, '1c85fbd06cf840d093f3640aca1b6b2d', '江津区', '');
INSERT INTO `sys_dictionaries` VALUES ('97c543ee46e84586998554f5f745fcc6', '杨浦区', 'yangpuqu', '0030207', 7, 'f1ea30ddef1340609c35c88fb2919bee', '杨浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('983eaae633244ecea99d11a804b1c736', '万州区', 'wanzhouqu', '0033101', 1, '1c85fbd06cf840d093f3640aca1b6b2d', '万州区', '');
INSERT INTO `sys_dictionaries` VALUES ('9a7465597dda46c8bb4c5c98aabfb4b9', '阳江', 'yangjiang', '0030716', 16, '0dd1f40bcb9d46aeba015dc19645a5b9', '阳江市', '');
INSERT INTO `sys_dictionaries` VALUES ('9b483ad27bc14af2a47d8facdf8fafca', '嘉峪关', 'jiayuguan', '0030604', 4, '3283f1a77180495f9a0b192d0f9cdd35', '嘉峪关市', '');
INSERT INTO `sys_dictionaries` VALUES ('9bb5220b50dd4def87ffbf6444a28c58', '黄浦区', 'huangpuqu', '0030201', 1, 'f1ea30ddef1340609c35c88fb2919bee', '黄浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('9c8a7d5f3423458eb9e6ef68f6185fca', '黄山', 'huangshan', '0030411', 11, '249999f296d14f95b8138a30bbb2c374', '黄山市', '');
INSERT INTO `sys_dictionaries` VALUES ('9d9700b28ae347bca4db9f592c78eb02', '百色', 'baise', '0030801', 1, 'c5f3d426c582410281f89f1451e1d854', '百色市', '');
INSERT INTO `sys_dictionaries` VALUES ('9e4d7c5d9d86458d8c8d8a644e7eec9a', '阿拉善盟', 'alashanmeng', '0032001', 1, 'c072c248c7ab47dda7bf24f5e577925c', '阿拉善盟', '');
INSERT INTO `sys_dictionaries` VALUES ('9e833df814a74d1690f8039782ddf914', '昭通', 'zhaotong', '0032916', 16, '510607a1836e4079b3103e14ec5864ed', '昭通', '');
INSERT INTO `sys_dictionaries` VALUES ('9e9d0ad23c9e45df9dd9c269c0e4fdfa', '昌平区', 'changpingqu', '0030111', 11, '12a62a3e5bed44bba0412b7e6b733c93', '昌平区', '');
INSERT INTO `sys_dictionaries` VALUES ('9fc24347a7ca4a34bdea408dad223348', '闵行区', 'minhangqu', '0030208', 8, 'f1ea30ddef1340609c35c88fb2919bee', '闵行区', '');
INSERT INTO `sys_dictionaries` VALUES ('a013e3db1b384beb843959c33f361203', '静海区', 'jinghaiqu', '0032615', 15, '2c254799d3454f2cbc338ef5712548e9', '静海区', '');
INSERT INTO `sys_dictionaries` VALUES ('a0d5b55e48c945faad1d7bb624de7de8', '九江', 'jiujiang', '0031805', 5, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '九江市', '');
INSERT INTO `sys_dictionaries` VALUES ('a165da9b81b940fe9764fc7f5d41232d', '银川', 'yinchuan', '0032105', 5, '5690b0534fe745e5ba0f504f0c260559', '银川市', '');
INSERT INTO `sys_dictionaries` VALUES ('a268c4b698274f12a64ba48db568d057', '潮州', 'chaozhou', '0030701', 1, '0dd1f40bcb9d46aeba015dc19645a5b9', '潮州市', '');
INSERT INTO `sys_dictionaries` VALUES ('a34815cb348d4598a6fac4ece3baa0cd', '衡阳', 'hengyang', '0031504', 4, 'c59f91630bef4289b71fcb2a48994582', '衡阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('a39af97e7ad04ebfb530f49b05c7b146', '阜阳', 'fuyang', '0030407', 7, '249999f296d14f95b8138a30bbb2c374', '阜阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('a405680276e645188a122e8933f77a38', '乌兰察布', 'wulanchabu', '0032010', 10, 'c072c248c7ab47dda7bf24f5e577925c', '乌兰察布市', '');
INSERT INTO `sys_dictionaries` VALUES ('a46bb0749dac4627b9a7d465dc75aca5', '武汉', 'wuhan', '0031411', 11, '312b80775e104ba08c8244a042a658df', '武汉市', '');
INSERT INTO `sys_dictionaries` VALUES ('a4d4d8f678dd4dba958f466bbc581c5f', '菏泽', 'heze', '0030305', 5, '10f46a521ea0471f8d71ee75ac3b5f3a', '菏泽市', '');
INSERT INTO `sys_dictionaries` VALUES ('a6898561d8664f6dad7a32f63ab64e19', '铁岭', 'tieling', '0031913', 13, 'b3366626c66c4b61881f09e1722e8495', '铁岭市', '');
INSERT INTO `sys_dictionaries` VALUES ('a76ed518fb584442aaf1769fd2583677', '兰州', 'lanzhou', '0030607', 7, '3283f1a77180495f9a0b192d0f9cdd35', '兰州市', '');
INSERT INTO `sys_dictionaries` VALUES ('a7d500ab05844c45b839f4a30c1d7643', '宜昌', 'yichang', '0031416', 16, '312b80775e104ba08c8244a042a658df', '宜昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('a9093795a013403e869a4308f17c7588', '海东', 'haidong', '0032203', 3, '5a80e3435c0e4dc09bafceeadb38e5f0', '海东', '');
INSERT INTO `sys_dictionaries` VALUES ('aa4b703a13dc4116bea578295efd9ea0', '赤峰', 'chifeng', '0032004', 4, 'c072c248c7ab47dda7bf24f5e577925c', '赤峰市', '');
INSERT INTO `sys_dictionaries` VALUES ('aab8d56a03de4bbc84d433bc24748730', '贺州', 'hezhou', '0030808', 8, 'c5f3d426c582410281f89f1451e1d854', '贺州市', '');
INSERT INTO `sys_dictionaries` VALUES ('ac1aa3c1b928467ebfa261cfaeb77be9', '葫芦岛', 'huludao', '0031908', 8, 'b3366626c66c4b61881f09e1722e8495', '葫芦岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('ac23d537ccd64827ab44007c5503bd58', '安阳', 'anyang', '0031201', 1, '7336944efb4b40fcae9118fc9a970d2d', '安阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('acd9f9b8fb8a4e47bd1e5d4eea45809c', '滁州', 'chuzhou', '0030406', 6, '249999f296d14f95b8138a30bbb2c374', '滁州市', '');
INSERT INTO `sys_dictionaries` VALUES ('acf5c250d6614fb9920e442a3b178b86', '东营', 'dongying', '0030304', 4, '10f46a521ea0471f8d71ee75ac3b5f3a', '东营市', '');
INSERT INTO `sys_dictionaries` VALUES ('adfac2a66ce04767bdbabbd8c115cd5d', '黄南', 'huangnan', '0032206', 6, '5a80e3435c0e4dc09bafceeadb38e5f0', '黄南', '');
INSERT INTO `sys_dictionaries` VALUES ('ae2c4a00360442f29ce8b0c284525ded', '崇明县', 'chongmingxian', '0030216', 16, 'f1ea30ddef1340609c35c88fb2919bee', '崇明县', '');
INSERT INTO `sys_dictionaries` VALUES ('ae384d9313e448949c8ed9c565e5cade', '扬州', 'yangzhou', '0031712', 12, '577405ff648240959b3765c950598ab0', '扬州市', '');
INSERT INTO `sys_dictionaries` VALUES ('affc6a796b524efdb006bd1730003df7', '西青区', 'xiqingqu', '0032608', 8, '2c254799d3454f2cbc338ef5712548e9', '西青区', '');
INSERT INTO `sys_dictionaries` VALUES ('b0251d85679b40dca30ee83af80838bb', '拉萨', 'lasa', '0032703', 3, '3e846b08dbbe495e93bc93f8f202de79', '拉萨市', '');
INSERT INTO `sys_dictionaries` VALUES ('b041a523ae214f03969454aa8c180ced', '房山区', 'fangshanqu', '0030108', 8, '12a62a3e5bed44bba0412b7e6b733c93', '房山区', '');
INSERT INTO `sys_dictionaries` VALUES ('b08ccea3cf89458e97b346546221e4ae', '凉山', 'liangshan', '0032102', 2, '5690b0534fe745e5ba0f504f0c260559', '凉山市', '');
INSERT INTO `sys_dictionaries` VALUES ('b1d50a7eb21f44389733e17831fd121d', '盘锦', 'panjin', '0031911', 11, 'b3366626c66c4b61881f09e1722e8495', '盘锦市', '');
INSERT INTO `sys_dictionaries` VALUES ('b21a81793ca6459f97c246ccbd543c67', '张掖', 'zhangye', '0030614', 14, '3283f1a77180495f9a0b192d0f9cdd35', '张掖市', '');
INSERT INTO `sys_dictionaries` VALUES ('b2356bf7a1d546709ac296de1bf2a9eb', '连云港', 'lianyungang', '0031703', 3, '577405ff648240959b3765c950598ab0', '连云港市', '');
INSERT INTO `sys_dictionaries` VALUES ('b2409f9c928f4dd1bd224809f54a1225', '宝坻区', 'baodiqu', '0032612', 12, '2c254799d3454f2cbc338ef5712548e9', '宝坻区', '');
INSERT INTO `sys_dictionaries` VALUES ('b2d4133b5dbf4599ada940620d2ab250', '黑龙江', 'heilongjiang', '00313', 13, '1', '黑龙江省', '');
INSERT INTO `sys_dictionaries` VALUES ('b3221428d30249d8acbb40f0f38d7a5c', '南宁', 'nanning', '0030811', 11, 'c5f3d426c582410281f89f1451e1d854', '南宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('b3366626c66c4b61881f09e1722e8495', '辽宁', 'liaoning', '00319', 19, '1', '辽宁省', '');
INSERT INTO `sys_dictionaries` VALUES ('b38f0725533a47cea5d0f5f520ad72c7', '沙坪坝区', 'shapingbaqu', '0033106', 6, '1c85fbd06cf840d093f3640aca1b6b2d', '沙坪坝区', '');
INSERT INTO `sys_dictionaries` VALUES ('b4736703fc064dbe8b8440c79991a1ed', '大连', 'dalian', '0031904', 4, 'b3366626c66c4b61881f09e1722e8495', '大连市', '');
INSERT INTO `sys_dictionaries` VALUES ('b5329030086d470fa8cf6b38aaafb320', '随州', 'suizhou', '0031409', 9, '312b80775e104ba08c8244a042a658df', '随州市', '');
INSERT INTO `sys_dictionaries` VALUES ('b602b0bc378a46629cc37dc037eb9684', '课程', 'kecheng', '001', 1, '0', '课程', '');
INSERT INTO `sys_dictionaries` VALUES ('b68e669c229945ae86e053d15c277a6a', '惠州', 'huizhou', '0030706', 6, '0dd1f40bcb9d46aeba015dc19645a5b9', '惠州市', '');
INSERT INTO `sys_dictionaries` VALUES ('b7785f96730e4a35820e08da1c200c4d', '璧山区', 'bishanqu', '0033120', 20, '1c85fbd06cf840d093f3640aca1b6b2d', '璧山区', '');
INSERT INTO `sys_dictionaries` VALUES ('b84acd830f3b4c65bd82c97cc925badf', '自贡', 'zigong', '0032520', 20, 'd3538add7125404aba4b0007ef9fde50', '自贡市', '');
INSERT INTO `sys_dictionaries` VALUES ('b8e203af46924284a9a8be9851a557a2', '南开区', 'nankaiqu', '0032604', 4, '2c254799d3454f2cbc338ef5712548e9', '南开区', '');
INSERT INTO `sys_dictionaries` VALUES ('b908e46ac1544cb6a26f1e1fb22f2a94', '宜宾', 'yibin', '0032518', 18, 'd3538add7125404aba4b0007ef9fde50', '宜宾市', '');
INSERT INTO `sys_dictionaries` VALUES ('b9c02b885a4a49719b1000110ed47df4', '毕节', 'bijie', '0030902', 2, '592f6fcf45a74524aa8ea853fc9761d5', '毕节市', '');
INSERT INTO `sys_dictionaries` VALUES ('b9c8e39d06c24e0c92c0be41a5c6d1e1', '红色', 'red', '00201', 1, 'ce174640544549f1b31c8f66e01c111b', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('ba821dcfd50d4f64af1cd3eecc5f54e0', '海北', 'haibei', '0032202', 2, '5a80e3435c0e4dc09bafceeadb38e5f0', '海北', '');
INSERT INTO `sys_dictionaries` VALUES ('bbf9ff3b0fa444f18d70f2a4a9e45609', '绵阳', 'mianyang', '0032512', 12, 'd3538add7125404aba4b0007ef9fde50', '绵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('bc2ec49f78204ea29cd666e2dc6583a2', '临沧', 'lincang', '0032910', 10, '510607a1836e4079b3103e14ec5864ed', '临沧', '');
INSERT INTO `sys_dictionaries` VALUES ('bc97087ea25547a794cec553d03c1abc', '那曲', 'naqu', '0032705', 5, '3e846b08dbbe495e93bc93f8f202de79', '那曲', '');
INSERT INTO `sys_dictionaries` VALUES ('bd1efd2194724213b72efa91fe3d5ddc', '浦东新区', 'pudongxinqu', '0030211', 11, 'f1ea30ddef1340609c35c88fb2919bee', '浦东新区', '');
INSERT INTO `sys_dictionaries` VALUES ('bdb65b22a7c447dcadbc6328292e5aef', '中山', 'zhongshan', '0030720', 20, '0dd1f40bcb9d46aeba015dc19645a5b9', '中山市', '');
INSERT INTO `sys_dictionaries` VALUES ('bdce443b39ba4cef8c0c0b75bdc8e253', '沈阳', 'shenyang', '0031912', 12, 'b3366626c66c4b61881f09e1722e8495', '沈阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('be33f1cad2954520bbf033e4198890f7', '亳州', 'bozhou', '0030403', 3, '249999f296d14f95b8138a30bbb2c374', '亳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('be359cbd02944e1da5997ae560831db1', '定西', 'dingxi', '0030602', 2, '3283f1a77180495f9a0b192d0f9cdd35', '定西市', '');
INSERT INTO `sys_dictionaries` VALUES ('beaf0090ebf94ad9af5dd78e372611fe', '咸阳', 'xianyang', '0032408', 8, '534850c72ceb4a57b7dc269da63c330a', '咸阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('bff8ba692e4c4d78a23309ec0ad745c7', '桂林', 'guilin', '0030806', 6, 'c5f3d426c582410281f89f1451e1d854', '桂林市', '');
INSERT INTO `sys_dictionaries` VALUES ('c0170db89f2e48fe99bfdcd857fe2016', '承德', 'chengde', '0031103', 3, '75362368f22f4d60a810c2a45cced487', '承德市', '');
INSERT INTO `sys_dictionaries` VALUES ('c072c248c7ab47dda7bf24f5e577925c', '内蒙古', 'neimenggu', '00320', 20, '1', '内蒙古', '');
INSERT INTO `sys_dictionaries` VALUES ('c0e55c6a60564359859d87d25c249ac4', '锦州', 'jinzhou', '0031909', 9, 'b3366626c66c4b61881f09e1722e8495', '锦州市', '');
INSERT INTO `sys_dictionaries` VALUES ('c1875ba50f6d4e61870be000be8ee78e', '东丽区', 'dongliqu', '0032607', 7, '2c254799d3454f2cbc338ef5712548e9', '东丽区', '');
INSERT INTO `sys_dictionaries` VALUES ('c22083b403ba4ea698ba4dfc7245a317', '平凉', 'pingliang', '0030610', 10, '3283f1a77180495f9a0b192d0f9cdd35', '平凉市', '');
INSERT INTO `sys_dictionaries` VALUES ('c256624d6caa49979ebc4dce35006945', '武清区', 'wuqingqu', '0032611', 11, '2c254799d3454f2cbc338ef5712548e9', '武清区', '');
INSERT INTO `sys_dictionaries` VALUES ('c2e0fca8943d41ba8ec5d013e9bc3f41', '日喀则', 'rikaze', '0032706', 6, '3e846b08dbbe495e93bc93f8f202de79', '日喀则', '');
INSERT INTO `sys_dictionaries` VALUES ('c3717fb4891148a0bef623dbd746e7e6', '开封', 'kaifeng', '0031205', 5, '7336944efb4b40fcae9118fc9a970d2d', '开封市', '');
INSERT INTO `sys_dictionaries` VALUES ('c4817fc49be444e491920112aa9a3e32', '淮南', 'huainan', '0030410', 10, '249999f296d14f95b8138a30bbb2c374', '淮南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c59f91630bef4289b71fcb2a48994582', '湖南', 'hunan', '00315', 15, '1', '湖南省', '');
INSERT INTO `sys_dictionaries` VALUES ('c5f3d426c582410281f89f1451e1d854', '广西', 'guangxi', '00308', 8, '1', '广西省', '');
INSERT INTO `sys_dictionaries` VALUES ('c7852784049a473c917863c5bc84dd95', '甘南', 'gannan', '0030603', 3, '3283f1a77180495f9a0b192d0f9cdd35', '甘南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c7a5ba87961742f3b242ee4d30a55921', '营口', 'yingkou', '0031914', 14, 'b3366626c66c4b61881f09e1722e8495', '营口市', '');
INSERT INTO `sys_dictionaries` VALUES ('c8342c1dcf584cbf92f20d90a62a34bf', '平顶山', 'pingdingshan', '0031209', 9, '7336944efb4b40fcae9118fc9a970d2d', '平顶山市', '');
INSERT INTO `sys_dictionaries` VALUES ('c8d4119e57f84e71815769f03935e471', '黔东南', 'qiandongnan', '0030905', 5, '592f6fcf45a74524aa8ea853fc9761d5', '黔东南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c928e9192e2f4f5ca06c6599371ff83c', '六安', 'lu\'an', '0030412', 12, '249999f296d14f95b8138a30bbb2c374', '六安市', '');
INSERT INTO `sys_dictionaries` VALUES ('c9811aef284b4ae8b8bf7698e90d8b3b', '泉州', 'quanzhou', '0030506', 6, 'd4066f6f425a4894a77f49f539f2a34f', '泉州市', '');
INSERT INTO `sys_dictionaries` VALUES ('c9df1fd73d0642eea8b050738f6ed9fa', '聊城', 'liaocheng', '0030308', 8, '10f46a521ea0471f8d71ee75ac3b5f3a', '聊城市', '');
INSERT INTO `sys_dictionaries` VALUES ('ca2e3717bb734c4b9142f29e36a31989', '株洲', 'zhuzhou', '0031502', 2, 'c59f91630bef4289b71fcb2a48994582', '株洲市', '');
INSERT INTO `sys_dictionaries` VALUES ('cabe896dba3a4a21ba194f8839a3eb98', '大渡口区', 'dadukouqu', '0033104', 4, '1c85fbd06cf840d093f3640aca1b6b2d', '大渡口区', '');
INSERT INTO `sys_dictionaries` VALUES ('caeba09845bf4a29960a840d4f436f09', '上饶', 'shangrao', '0031808', 8, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '上饶市', '');
INSERT INTO `sys_dictionaries` VALUES ('cb3008cbd6ae4b5f8cebd2254ccb8603', '江西', 'jiangxi', '00318', 18, '1', '江西省', '');
INSERT INTO `sys_dictionaries` VALUES ('cc2aaa3ed3904d66a2f79676b14a1b49', '黔江区', 'qianjiangqu', '0033114', 14, '1c85fbd06cf840d093f3640aca1b6b2d', '黔江区', '');
INSERT INTO `sys_dictionaries` VALUES ('cd66a360619847d2b17989643f03dc8f', '济宁', 'jining', '0030306', 6, '10f46a521ea0471f8d71ee75ac3b5f3a', '济宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('cd87ffcb742744d18bbce6928922a5be', '衡州', 'hengzhou', '0033007', 7, '6d846178376549ed878d11d109819f25', '衡州市', '');
INSERT INTO `sys_dictionaries` VALUES ('cdc1df5961994a9d94751003edd0fc58', '宿州', 'suzhou', '0030414', 14, '249999f296d14f95b8138a30bbb2c374', '宿州市', '');
INSERT INTO `sys_dictionaries` VALUES ('cddd155314404710bd1ab3fa51d80cf2', '天水', 'tianshui', '0030612', 12, '3283f1a77180495f9a0b192d0f9cdd35', '天水市', '');
INSERT INTO `sys_dictionaries` VALUES ('ce0dcc5a66dd44b3b9a42aef4aa8b4ba', '蚌埠', 'bengbu', '0030402', 2, '249999f296d14f95b8138a30bbb2c374', '蚌埠市', '');
INSERT INTO `sys_dictionaries` VALUES ('ce174640544549f1b31c8f66e01c111b', '颜色', 'yanse', '002', 2, '0', '颜色', '');
INSERT INTO `sys_dictionaries` VALUES ('cf632a4f4de54b619ad5cb6835f35434', '玉林', 'yulin', '0030814', 14, 'c5f3d426c582410281f89f1451e1d854', '玉林市', '');
INSERT INTO `sys_dictionaries` VALUES ('cf7d29feb2c34cbfaf4e28896ca577e4', '巴彦淖尔', 'bayannaoer', '0032002', 2, 'c072c248c7ab47dda7bf24f5e577925c', '巴彦淖尔', '');
INSERT INTO `sys_dictionaries` VALUES ('cfb2df83812d4fabb10ba91e98be9467', '黑河', 'heihe', '0031305', 5, 'b2d4133b5dbf4599ada940620d2ab250', '黑河市', '');
INSERT INTO `sys_dictionaries` VALUES ('cfee5c9833664e0aba76267389e4adbd', '丰台区', 'fengtaiqu', '0030104', 4, '12a62a3e5bed44bba0412b7e6b733c93', '丰台区', '');
INSERT INTO `sys_dictionaries` VALUES ('d13b01a607e34fdfa16deb7292a0f299', '鹤壁', 'hebi', '0031202', 2, '7336944efb4b40fcae9118fc9a970d2d', '鹤壁市', '');
INSERT INTO `sys_dictionaries` VALUES ('d1646344b9cc45018c3a347f6dc6c77b', '红桥区', 'hongqiaoqu', '0032606', 6, '2c254799d3454f2cbc338ef5712548e9', '红桥区', '');
INSERT INTO `sys_dictionaries` VALUES ('d26fc248d49c4a71b2a003033adc88de', '娄底', 'loudi', '0031513', 13, 'c59f91630bef4289b71fcb2a48994582', '娄底市', '');
INSERT INTO `sys_dictionaries` VALUES ('d3538add7125404aba4b0007ef9fde50', '四川', 'sichuan', '00325', 25, '1', '四川省', '');
INSERT INTO `sys_dictionaries` VALUES ('d3c2d3b9184b4e3185ca6bdbe73c5cff', '襄樊', 'xiangfan', '0031414', 14, '312b80775e104ba08c8244a042a658df', '襄樊市', '');
INSERT INTO `sys_dictionaries` VALUES ('d3c76818757942fba8ebf8246fa257a9', '咸宁', 'xianning', '0031413', 13, '312b80775e104ba08c8244a042a658df', '咸宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('d4066f6f425a4894a77f49f539f2a34f', '福建', 'fujian', '00305', 5, '1', '福建省', '');
INSERT INTO `sys_dictionaries` VALUES ('d4131ecb91d3435db1dbd770ac39221f', '鞍山', 'anshan', '0031901', 1, 'b3366626c66c4b61881f09e1722e8495', '鞍山市', '');
INSERT INTO `sys_dictionaries` VALUES ('d42e09432d10454caecf1d4335aca1da', '合肥', 'hefei', '0030408', 8, '249999f296d14f95b8138a30bbb2c374', '合肥市', '');
INSERT INTO `sys_dictionaries` VALUES ('d4f8ba23c3ef4fbaa00c8f8a7c047bf1', '商丘', 'shangqiu', '0031212', 12, '7336944efb4b40fcae9118fc9a970d2d', '商丘市', '');
INSERT INTO `sys_dictionaries` VALUES ('d5f5462779bc4976a3fbcbdeba45ed00', '丽水', 'lishui', '0033005', 5, '6d846178376549ed878d11d109819f25', '丽水市', '');
INSERT INTO `sys_dictionaries` VALUES ('d5f621c6fab44d1eab1bdafd9d08e042', '绍兴', 'shaoxing', '0033008', 8, '6d846178376549ed878d11d109819f25', '绍兴市', '');
INSERT INTO `sys_dictionaries` VALUES ('d7443dcd45704a27981810fc32b93390', '潍坊', 'weifang', '0030314', 14, '10f46a521ea0471f8d71ee75ac3b5f3a', '潍坊市', '');
INSERT INTO `sys_dictionaries` VALUES ('d7c388a2ed58414a9bd4dfbedf6858b3', '顺义区', 'shunyiqu', '0030110', 10, '12a62a3e5bed44bba0412b7e6b733c93', '顺义区', '');
INSERT INTO `sys_dictionaries` VALUES ('d7e006b55b96491282e9c2e672d35a34', '克拉玛依', 'kelamayi', '0032808', 8, '2fabed91c6d94e698ed449165cd250ca', '克拉玛依', '');
INSERT INTO `sys_dictionaries` VALUES ('d7e25a4040694008b4cb8aa322f77ad9', '张家界', 'zhangjiajie', '0031508', 8, 'c59f91630bef4289b71fcb2a48994582', '张家界市', '');
INSERT INTO `sys_dictionaries` VALUES ('d80455402bc44d2ca15e905913301fb2', '焦作', 'jiaozuo', '0031204', 4, '7336944efb4b40fcae9118fc9a970d2d', '焦作市', '');
INSERT INTO `sys_dictionaries` VALUES ('d90a14bfbfe44a3e8d60bda8f8f362a6', '铜仁', 'tongren', '0030908', 8, '592f6fcf45a74524aa8ea853fc9761d5', '铜仁市', '');
INSERT INTO `sys_dictionaries` VALUES ('da583c36f6754d498176755c93db8d7c', '遂宁', 'suining', '0032516', 16, 'd3538add7125404aba4b0007ef9fde50', '遂宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('db3b9c7116bc49e3a65fa641dd82155d', '红河', 'honghe', '0032907', 7, '510607a1836e4079b3103e14ec5864ed', '红河', '');
INSERT INTO `sys_dictionaries` VALUES ('db6336fcf27f4c00b37513ff0e368ae6', '长宁区', 'changningqu', '0030203', 3, 'f1ea30ddef1340609c35c88fb2919bee', '长宁区', '');
INSERT INTO `sys_dictionaries` VALUES ('db77fd88654c4014a71d541171d2795b', '西安', 'xi\'an', '0032407', 7, '534850c72ceb4a57b7dc269da63c330a', '西安市', '');
INSERT INTO `sys_dictionaries` VALUES ('dc022922169446549dfac0de221d2a4d', '雅安', 'ya\'an', '0032517', 17, 'd3538add7125404aba4b0007ef9fde50', '雅安市', '');
INSERT INTO `sys_dictionaries` VALUES ('dc9b2098188f4b5c93aec5c9bbfb895d', '吕梁', 'lvliang', '0032306', 6, '023473e9e6204583a110531036357514', '吕梁市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcbcde16e75643f9b8dd4b6293c87dd5', '滨州', 'binzhou', '0030302', 2, '10f46a521ea0471f8d71ee75ac3b5f3a', '滨州市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcd0ca1cde8f420dbfecbac4cf1506ee', '巴州', 'bazhou', '0032803', 3, '2fabed91c6d94e698ed449165cd250ca', '巴州', '');
INSERT INTO `sys_dictionaries` VALUES ('dcd445ef42c9484bbd14bacd02bebf37', '郑州', 'zhengzhou', '0031216', 16, '7336944efb4b40fcae9118fc9a970d2d', '郑州市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcf99d941ca44b30915e16a4048d5004', '益阳', 'yiyang', '0031509', 9, 'c59f91630bef4289b71fcb2a48994582', '益阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('dee1fa3295ec42219815769d00fabe70', '迪庆', 'diqing', '0032906', 6, '510607a1836e4079b3103e14ec5864ed', '迪庆', '');
INSERT INTO `sys_dictionaries` VALUES ('e06c4a42478b4853827911b8adac6def', '庆阳', 'qingyang', '0030611', 11, '3283f1a77180495f9a0b192d0f9cdd35', '庆阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('e1204d4286834046886f26ae6af0722a', '湘潭', 'xiangtan', '0031503', 3, 'c59f91630bef4289b71fcb2a48994582', '湘潭市', '');
INSERT INTO `sys_dictionaries` VALUES ('e15cb9bb072248628b7ec481b6337229', '六盘水', 'liupanshui', '0030904', 4, '592f6fcf45a74524aa8ea853fc9761d5', '六盘水市', '');
INSERT INTO `sys_dictionaries` VALUES ('e1bbd9b635e140ee8fcf0dc06743519b', '廊坊', 'langfang', '0031106', 6, '75362368f22f4d60a810c2a45cced487', '廊坊市', '');
INSERT INTO `sys_dictionaries` VALUES ('e384a07d11bf413eb83cd490939ca7a2', '綦江区', 'qijiangqu', '0033110', 10, '1c85fbd06cf840d093f3640aca1b6b2d', '綦江区', '');
INSERT INTO `sys_dictionaries` VALUES ('e3ca4d54f3354ba5b17e1f93415ceb1a', '云浮', 'yunfu', '0030717', 17, '0dd1f40bcb9d46aeba015dc19645a5b9', '云浮市', '');
INSERT INTO `sys_dictionaries` VALUES ('e4adf72e96ee4b7fa3528ee5ba4eb5cf', '梧州', 'wuzhou', '0030813', 13, 'c5f3d426c582410281f89f1451e1d854', '梧州市', '');
INSERT INTO `sys_dictionaries` VALUES ('e556d8e5e148406883e1a83d6595e406', '铜梁区', 'tongliangqu', '0033121', 21, '1c85fbd06cf840d093f3640aca1b6b2d', '铜梁区', '');
INSERT INTO `sys_dictionaries` VALUES ('e7200f8c6dce4ea193bf33f55d9fd192', '池州', 'chizhou', '0030405', 5, '249999f296d14f95b8138a30bbb2c374', '池州市', '');
INSERT INTO `sys_dictionaries` VALUES ('e7de6c7b752040b2bd3175641d83d128', '哈尔滨', 'haerbin', '0031303', 3, 'b2d4133b5dbf4599ada940620d2ab250', '哈尔滨市', '');
INSERT INTO `sys_dictionaries` VALUES ('e8311a6f0ab4495484fdf24902ee97cc', '新余', 'xinyu', '0031809', 9, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '新余市', '');
INSERT INTO `sys_dictionaries` VALUES ('e9a653c9850c46bc9e2e1916de643a52', '楚雄', 'chuxiong', '0032903', 3, '510607a1836e4079b3103e14ec5864ed', '楚雄', '');
INSERT INTO `sys_dictionaries` VALUES ('ec0eed6293294d58aa56f6c381263288', '郴州', 'chenzhou', '0031510', 10, 'c59f91630bef4289b71fcb2a48994582', '郴州市', '');
INSERT INTO `sys_dictionaries` VALUES ('ec107e60189346adb2b5749d6f6fe074', '德宏', 'dehong', '0032905', 5, '510607a1836e4079b3103e14ec5864ed', '德宏', '');
INSERT INTO `sys_dictionaries` VALUES ('ec892838cf4944cc8b330216f02de1e6', '津南区', 'jinnanqu', '0032609', 9, '2c254799d3454f2cbc338ef5712548e9', '津南区', '');
INSERT INTO `sys_dictionaries` VALUES ('ec96c3771161459c99eb01124db7aa8a', '三门峡', 'sanmenxia', '0031211', 11, '7336944efb4b40fcae9118fc9a970d2d', '三门峡市', '');
INSERT INTO `sys_dictionaries` VALUES ('eca8a2f4e2534f77b7bccf263139d8c7', '内江', 'neijiang', '0032513', 13, 'd3538add7125404aba4b0007ef9fde50', '内江市', '');
INSERT INTO `sys_dictionaries` VALUES ('ecb8f08c1408495bb31842c221d3edb4', '渝北区', 'yubeiqu', '0033112', 12, '1c85fbd06cf840d093f3640aca1b6b2d', '渝北区', '');
INSERT INTO `sys_dictionaries` VALUES ('ed5391a7608b4a61a24d95f2384f2131', '阜新', 'fuxin', '0031907', 7, 'b3366626c66c4b61881f09e1722e8495', '阜新市', '');
INSERT INTO `sys_dictionaries` VALUES ('ed5b3d39695f496d88c37f56508d6447', '仙桃', 'xiantao', '0031412', 12, '312b80775e104ba08c8244a042a658df', '仙桃市', '');
INSERT INTO `sys_dictionaries` VALUES ('ed97335f8b3d42fabfd89993bc68475d', '海南', 'hainan', '0032204', 4, '5a80e3435c0e4dc09bafceeadb38e5f0', '海南', '');
INSERT INTO `sys_dictionaries` VALUES ('ede65c49ae624ef8900414298f79a438', '乌海', 'wuhai', '0032009', 9, 'c072c248c7ab47dda7bf24f5e577925c', '乌海市', '');
INSERT INTO `sys_dictionaries` VALUES ('f0570e2fe4644e32af5c5401e8c371ba', '盐城', 'yancheng', '0031711', 11, '577405ff648240959b3765c950598ab0', '盐城市', '');
INSERT INTO `sys_dictionaries` VALUES ('f0eb076930844fe18fdd8dcf5fc1f56e', '塔城', 'tacheng', '0032810', 10, '2fabed91c6d94e698ed449165cd250ca', '塔城', '');
INSERT INTO `sys_dictionaries` VALUES ('f16ddc177870477685297a6abb157637', '朔州', 'shuozhou', '0032307', 7, '023473e9e6204583a110531036357514', '朔州市', '');
INSERT INTO `sys_dictionaries` VALUES ('f1e2cdd9518c4ac2b5e1ea52985b9771', '果洛', 'guoluo', '0032201', 1, '5a80e3435c0e4dc09bafceeadb38e5f0', '果洛', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', 2, '1', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('f260eee573dc48fca1572b228d280849', '版纳', 'banna', '0032901', 1, '510607a1836e4079b3103e14ec5864ed', '版纳', '');
INSERT INTO `sys_dictionaries` VALUES ('f389ad0eb7884c4d91d4f31312bc8771', '萍乡', 'pingxiang', '0031807', 7, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '萍乡市', '');
INSERT INTO `sys_dictionaries` VALUES ('f416737f56924f7cb642a75f57b1530a', '渭南', 'weinan', '0032406', 6, '534850c72ceb4a57b7dc269da63c330a', '渭南市', '');
INSERT INTO `sys_dictionaries` VALUES ('f498d09200ba48df9d6e281776eba4f8', '徐州', 'xuzhou', '0031710', 10, '577405ff648240959b3765c950598ab0', '徐州市', '');
INSERT INTO `sys_dictionaries` VALUES ('f4bdd6b8f0704479a6d051f52d62d693', '河池', 'hechi', '0030807', 7, 'c5f3d426c582410281f89f1451e1d854', '河池市', '');
INSERT INTO `sys_dictionaries` VALUES ('f4f2434769b842afbbf1791018b69800', '河北区', 'hebeiqu', '0032605', 5, '2c254799d3454f2cbc338ef5712548e9', '河北区', '');
INSERT INTO `sys_dictionaries` VALUES ('f57d2b8d983f43d5a035a596b690445b', '金山区', 'jinshanqu', '0030212', 12, 'f1ea30ddef1340609c35c88fb2919bee', '金山区', '');
INSERT INTO `sys_dictionaries` VALUES ('f6337bdeefa44b0db9f35fe2fe7d6d6f', '十堰', 'shiyan', '0031408', 8, '312b80775e104ba08c8244a042a658df', '十堰市', '');
INSERT INTO `sys_dictionaries` VALUES ('f661c388a73d478699a2c1c5909b45f1', '三亚', 'sanya', '0031002', 2, '2ba8e6d0fd944983aa19b781c6b53477', '三亚市', '');
INSERT INTO `sys_dictionaries` VALUES ('f6ff36eb35414a5dacf7ccc0c479d2ea', '宿迁', 'suqian', '0031707', 7, '577405ff648240959b3765c950598ab0', '宿迁市', '');
INSERT INTO `sys_dictionaries` VALUES ('f775a440cb004c63b0b3d3429b58a1e6', '衡水', 'hengshui', '0031105', 5, '75362368f22f4d60a810c2a45cced487', '衡水市', '');
INSERT INTO `sys_dictionaries` VALUES ('f845a1c0a62b45bfbf358688eec3680d', '巢湖', 'chaohu', '0030404', 4, '249999f296d14f95b8138a30bbb2c374', '巢湖市', '');
INSERT INTO `sys_dictionaries` VALUES ('f9565fe7c0a348ba949131645d20e8fa', '恩施', 'enshi', '0031402', 2, '312b80775e104ba08c8244a042a658df', '恩施市', '');
INSERT INTO `sys_dictionaries` VALUES ('f970bd1da8f94bfa92206fa94d595cbb', '锡林郭勒盟', 'xilinguolemeng', '0032011', 11, 'c072c248c7ab47dda7bf24f5e577925c', '锡林郭勒盟', '');
INSERT INTO `sys_dictionaries` VALUES ('f9a9156f0e9e41438e823f93070248bd', '濮阳', 'puyang', '0031210', 10, '7336944efb4b40fcae9118fc9a970d2d', '濮阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('f9ceff59e02c4be3a4b20aa806c1ec0d', '呼和浩特', 'huhehaote', '0032006', 6, 'c072c248c7ab47dda7bf24f5e577925c', '呼和浩特市', '');
INSERT INTO `sys_dictionaries` VALUES ('fa2ff170919e406d9d5547ff09d14d0d', '双鸭山', 'shuangyashan', '0031311', 11, 'b2d4133b5dbf4599ada940620d2ab250', '双鸭山市', '');
INSERT INTO `sys_dictionaries` VALUES ('fa3446ef035546c09c1f27268b43b937', '南京', 'nanjing', '0031704', 4, '577405ff648240959b3765c950598ab0', '南京市', '');
INSERT INTO `sys_dictionaries` VALUES ('fc70429d9b8146e0ac31ce38410e2cb7', '南阳', 'nanyang', '0031208', 8, '7336944efb4b40fcae9118fc9a970d2d', '南阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd06b72a41654fcfbfe2c3327ca4e9fc', '珠海', 'zhuhai', '0030721', 21, '0dd1f40bcb9d46aeba015dc19645a5b9', '珠海市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd1d83119c414e56b3a35052c9d6dd0f', '文山', 'wenshan', '0032914', 14, '510607a1836e4079b3103e14ec5864ed', '文山', '');
INSERT INTO `sys_dictionaries` VALUES ('fd2a0cad70c643528587d1ccde4c5530', '铜川', 'tongchuan', '0032405', 5, '534850c72ceb4a57b7dc269da63c330a', '铜川市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd79801a69ad4ec5857df82358c26368', '江北区', 'jiangbeiqu', '0033105', 5, '1c85fbd06cf840d093f3640aca1b6b2d', '江北区', '');
INSERT INTO `sys_dictionaries` VALUES ('ff880943e156482ea50d1ece4ff233a6', '昌吉州', 'changjizhou', '0032805', 5, '2fabed91c6d94e698ed449165cd250ca', '昌吉州', '');
INSERT INTO `sys_dictionaries` VALUES ('ffb2cc1e96fe485b94335589315ab38c', '临汾', 'linfen', '0032305', 5, '023473e9e6204583a110531036357514', '临汾市', '');
INSERT INTO `sys_dictionaries` VALUES ('ffd838f71da648319bfe4f176e0e209f', '晋中', 'jinzhong', '0032304', 4, '023473e9e6204583a110531036357514', '晋中市', '');
INSERT INTO `sys_dictionaries` VALUES ('ffeaa196501d4f35a486e42be17f2986', '枣庄', 'zaozhuang', '0030316', 16, '10f46a521ea0471f8d71ee75ac3b5f3a', '枣庄市', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton`  (
  `FHBUTTON_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4c7f34b9eed54683957f356afcda24df', '组织机构数据权限', 'Datajur', '组织机构数据权限按钮');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
INSERT INTO `sys_fhbutton` VALUES ('fc5e8767b4564f34a0d2ce2375fcc92e', '绑定用户', 'userBinding', '绑定用户');

-- ----------------------------
-- Table structure for sys_fhlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhlog`;
CREATE TABLE `sys_fhlog`  (
  `FHLOG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fhlog
-- ----------------------------
INSERT INTO `sys_fhlog` VALUES ('006bac031e80493fabc96834b32720fa', 'admin', '2018-09-27 14:36:44', '解封用户张三');
INSERT INTO `sys_fhlog` VALUES ('00aedb1bf251499d9d87c47120728690', 'admin', '2018-09-29 16:33:46', '添加兴趣爱好类型音乐剧22');
INSERT INTO `sys_fhlog` VALUES ('0138d79a7c9e4c42a19f9a3c6929c223', 'admin', '2018-09-28 10:28:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('017918d75a7f4e459def20221015773a', 'admin', '2018-09-27 14:34:50', '查封用户凌2');
INSERT INTO `sys_fhlog` VALUES ('04ccd663c5ee453b97a06ef27a76518a', 'admin', '2018-09-28 10:28:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('07b01f86ddeb40fdb1f8c17de1c62632', 'admin', '2018-09-28 17:21:25', '修改兴趣爱好国学文化2的信息');
INSERT INTO `sys_fhlog` VALUES ('07b2a74dd6fa47a380e08657433b0c16', 'admin', '2018-09-27 10:14:31', '修改23活动状态:下架活动');
INSERT INTO `sys_fhlog` VALUES ('08644b79c947454bb343da23e3512b4e', 'admin', '2018-09-28 10:27:49', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0b837bfe30db4228bb89d51ad0b447a7', 'admin', '2018-09-28 10:28:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0ca98f93bdc9422eafa6c74ea5b5f189', 'admin', '2018-09-27 12:18:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('10d1e86027314a0688ca00062589cab6', 'admin', '2018-09-28 10:28:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1173adee58d94edcbd86f6358c99492b', 'admin', '2018-09-29 14:46:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11b856055c11472bb8d04cf8f556b26b', 'admin', '2018-09-27 09:57:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1326e1d07a834b57bc472597ae036ba6', 'admin', '2018-09-29 15:46:20', '添加兴趣爱好类型古道西风');
INSERT INTO `sys_fhlog` VALUES ('1406b00571704d39b9cdd2091728de20', 'admin', '2018-09-28 17:03:20', '修改用户凌222资源锁定的信息');
INSERT INTO `sys_fhlog` VALUES ('145c068bdd914b3ebf54b093be5d81ed', 'admin', '2018-09-26 19:01:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1566e40830d14589bc19a4323a942725', 'admin', '2018-09-28 10:28:51', '修改菜单会员管理');
INSERT INTO `sys_fhlog` VALUES ('18309dc32aa944a48becc18c974dd3d3', 'admin', '2018-09-28 11:22:46', '查封用户凌222');
INSERT INTO `sys_fhlog` VALUES ('197e67ce6fa342b18d0914b421c8a5fa', 'admin', '2018-09-28 10:27:49', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('19bb3119cf764ef698f716c7289715dd', 'admin', '2018-09-29 15:34:20', '添加兴趣爱好类型null');
INSERT INTO `sys_fhlog` VALUES ('1b0ee3f4ba524823af6f83ff4ab5a14f', 'admin', '2018-09-28 10:27:51', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1b2bdec1c2dc4ec89b211462a270d50e', 'admin', '2018-09-28 10:27:46', '新增菜单资源锁定管理');
INSERT INTO `sys_fhlog` VALUES ('1b85a88ca1c54ac4a03b9a11b0c1d38a', 'admin', '2018-09-26 18:20:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1bed9a2bed1e43528dcdf0a5bf12d26b', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f4ca01df9374934bff03dcb1c087e42', 'admin', '2018-09-28 17:19:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('22bdcba6eec146f08afb9089300dfdab', 'admin', '2018-09-28 18:07:39', '修改会员VIP试用客户经理等级的信息');
INSERT INTO `sys_fhlog` VALUES ('24156b4812394c349abc1f500bed2e9a', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('25338130d47a4b758c885e0d3e740508', 'admin', '2018-09-28 18:34:09', '查封用户李四');
INSERT INTO `sys_fhlog` VALUES ('25846ba13fc14d1999053b9deedde3c0', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('267950a790184b83b09631b5afcfe490', 'admin', '2018-09-27 17:43:34', '修改用户凌222的信息');
INSERT INTO `sys_fhlog` VALUES ('275d6e004b2d46378c635f8f7a2dc50b', 'admin', '2018-09-28 10:27:52', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('27c646e5025743f9aa08f50d473d7805', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('283ff5724e7241a696ec966b1089b737', 'admin', '2018-09-28 10:28:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2abb174a92404c79aca0a900fd300522', 'admin', '2018-09-27 16:20:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2c22aefb8108415885671626f9512607', 'admin', '2018-09-28 10:27:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3033afc5aa5f4fb7a097f22d0a5fb680', 'admin', '2018-09-28 16:59:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('31e0ee6ae7184ee1b7c6faae050bc254', 'admin', '2018-09-27 15:22:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('34576e4f751e4f3d98b27c4bf0f5cb0a', 'admin', '2018-09-27 14:31:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('364a5bd798ce4644bb0d056fb2117e00', 'admin', '2018-09-29 15:49:50', '添加兴趣爱好类型浩瀚');
INSERT INTO `sys_fhlog` VALUES ('386a5eb6515747febb77daf24f05b4f9', 'admin', '2018-09-27 17:45:35', '修改用户凌222的信息');
INSERT INTO `sys_fhlog` VALUES ('39bd57fd32d6423daac547cb4761fb60', 'admin', '2018-09-28 10:28:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3df360d329534bdaab6d45333b6ded0d', 'admin', '2018-09-29 16:30:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('420927f8272942a4a5140cd002267b2e', 'admin', '2018-09-29 14:49:53', '添加兴趣爱好类型null');
INSERT INTO `sys_fhlog` VALUES ('442e92c527074615af8ee7d24509ecc9', 'admin', '2018-09-29 16:09:35', '删除活动类型null');
INSERT INTO `sys_fhlog` VALUES ('45413e9d04734b0e8d6a33d89a1ae029', 'admin', '2018-09-28 14:40:00', '修改角色菜单权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('49328b2e025c4b94a9b61ae3f0d8e689', 'admin', '2018-09-28 10:28:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4e6fd9c9203345b99ba3bc3a62af1d5f', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4f9b454c8f204529b73870745c2a843a', 'admin', '2018-09-28 10:28:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4fc34fc5b1f744fcbc8e625b5a959471', 'admin', '2018-09-28 17:13:40', '修改用户凌222资源锁定的信息');
INSERT INTO `sys_fhlog` VALUES ('5750b69ef60449329f3ad12c0d10c934', 'admin', '2018-09-28 17:19:52', '修改用户凌222资源锁定的信息');
INSERT INTO `sys_fhlog` VALUES ('580f32e895624cf9b5fdc284123aa34d', 'admin', '2018-09-28 10:28:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('58de8e3bb7ba41f38ff65b63ae1ec2ca', 'admin', '2018-09-28 10:28:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5e01b7d005ac40fbb1da82549677d431', 'admin', '2018-09-28 10:28:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5f478c94aa1f4ebab6a3048b24c75d9d', 'admin', '2018-09-27 17:43:00', '修改用户凌222的信息');
INSERT INTO `sys_fhlog` VALUES ('6006e1055c7b4a2bb7264863d30ee821', 'admin', '2018-09-27 17:45:20', '修改用户张三的信息');
INSERT INTO `sys_fhlog` VALUES ('642ccf54aca74f43b91cfb112eef8f4f', 'admin', '2018-09-27 17:38:56', '修改用户凌222的信息');
INSERT INTO `sys_fhlog` VALUES ('65783db4e9a44f6a9ee62e724cfe5a3d', 'admin', '2018-09-28 10:27:48', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('66ba1c7c4f5e4becb8947196412d7ade', 'admin', '2018-09-28 10:28:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6a5cab5fc9bf4f06adf75aec1cfd1d6e', 'admin', '2018-09-27 17:38:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6b6dd34f396d43ada61a41bc5778f72e', 'admin', '2018-09-29 09:50:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6c9b0dcb852d4538ad3c14dad60b4592', 'admin', '2018-09-27 10:23:30', '修改23活动状态:下架活动');
INSERT INTO `sys_fhlog` VALUES ('6ea22ee5a62242f4882187ad04478a11', 'admin', '2018-09-29 14:46:46', '添加兴趣爱好类型null');
INSERT INTO `sys_fhlog` VALUES ('6fa6a610ecac433fa4d3bd219a661e10', 'admin', '2018-09-27 13:38:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('755b970f88194c47a0c4f56f38960b49', 'admin', '2018-09-28 10:28:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('75679c9179ba41fc90271da2beb470f4', 'admin', '2018-09-27 11:50:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('76c1809056ea43a98a76ba62213caceb', 'admin', '2018-09-28 10:28:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('76f9c9ca830c478d94c211a3d02efd7e', 'admin', '2018-09-28 10:27:52', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('795782b85c6d45fa98c5caea5d3d6d16', 'admin', '2018-09-27 14:36:40', '查封用户张三');
INSERT INTO `sys_fhlog` VALUES ('7a203078e23342e282a46d27b94bf88e', 'admin', '2018-09-28 18:06:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a6a9311fa664168a390a6a90a4078b4', 'admin', '2018-09-28 10:27:49', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7b1e0294885e4e00b1946b4933855912', 'admin', '2018-09-27 16:39:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7ea383be1f2f4b49a6be2721fcd35d54', 'admin', '2018-09-28 17:21:54', '删除活动类型大国崛起');
INSERT INTO `sys_fhlog` VALUES ('8129c304268e4d2eb04097a3bd7cd8c5', 'admin', '2018-09-28 17:13:16', '修改用户凌222资源锁定的信息');
INSERT INTO `sys_fhlog` VALUES ('83b34dce72e840c7b0a249efc74f7660', 'admin', '2018-09-28 10:27:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8554838933d1476180958f56f566c5c0', 'admin', '2018-09-29 16:32:51', '添加兴趣爱好类型');
INSERT INTO `sys_fhlog` VALUES ('873b15da5d5a4a1097dc153f3db8f854', 'admin', '2018-09-27 16:40:14', '修改用户凌2的信息');
INSERT INTO `sys_fhlog` VALUES ('8814f68e82c54a749f06e35d3acd5e2d', 'admin', '2018-09-27 14:36:48', '解封用户凌2');
INSERT INTO `sys_fhlog` VALUES ('88aa998efbc24365be179ba11e90f20a', 'admin', '2018-09-28 10:27:51', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8a967cd23fee4d20904c00252e54be87', 'admin', '2018-09-28 10:28:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8e21a727ab8a4c2e9d1aa76d55d0a404', 'admin', '2018-09-27 09:31:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8e7aca8aef004f15832fa5a330e875dc', 'admin', '2018-09-28 17:13:26', '修改用户凌222资源锁定的信息');
INSERT INTO `sys_fhlog` VALUES ('906e950c5a0e474cade1824f2342e46b', 'admin', '2018-09-28 10:28:27', '修改菜单资源锁定管理');
INSERT INTO `sys_fhlog` VALUES ('90aae796467846eab8dad4ec80d8c5b4', 'admin', '2018-09-29 16:09:31', '删除活动类型国学文化2');
INSERT INTO `sys_fhlog` VALUES ('92be3f62675c4fa9b6935ae677c9e01f', 'admin', '2018-09-28 10:27:51', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('96db2d802969451c91f87d5c74256824', 'admin', '2018-09-27 15:51:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('97c56efa9a50410a9f724a0aca5d7fc6', 'admin', '2018-09-28 17:13:32', '修改用户凌222资源锁定的信息');
INSERT INTO `sys_fhlog` VALUES ('98eb420d5d6c4509928779b97af45ee9', 'admin', '2018-09-29 15:36:04', '添加兴趣爱好类型政治风云');
INSERT INTO `sys_fhlog` VALUES ('99e2c86fa544456d83254a6655cafd1f', 'admin', '2018-09-29 16:21:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9a0e0604378f47738ef4f92ed3e985ad', 'admin', '2018-09-29 16:04:11', '添加兴趣爱好类型大国崛起2');
INSERT INTO `sys_fhlog` VALUES ('9ad7b9d2e46c4fbcbec20cf270441824', 'admin', '2018-09-28 17:21:50', '添加兴趣爱好类型大国崛起');
INSERT INTO `sys_fhlog` VALUES ('9af6077ac79548ffb38ab931a45681d7', 'admin', '2018-09-28 10:28:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9ce22b2ea8104976b74b7498349edc61', 'admin', '2018-09-28 10:27:51', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9f65120574f14259b0c22214fdd95957', 'admin', '2018-09-28 10:27:52', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a1015e76c00e40a79a6b4c6e362a26ea', 'admin', '2018-09-28 10:28:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a1bc82ba871b45049800b4e239731b2f', 'admin', '2018-09-28 10:27:51', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a32668d88f5c4d928ea307cf77adabb2', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a3b9d6e5fea2499fbfddfc9ad44ec31f', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a5466bb8ae404a23921849b38a0c6368', 'admin', '2018-09-29 11:44:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a60ddf449c3848309d7183261aa73984', 'admin', '2018-09-28 18:25:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a814e3eb68c4432dbc6691795e7f3ea3', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad9f48b585e54659b6259f3b66af7cfd', 'admin', '2018-09-27 13:51:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ade587d8308b4b4d91f7100dc4c238a8', 'admin', '2018-09-28 10:28:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b05da031afe74af4a6a5db483cbdc5ff', 'admin', '2018-09-28 10:28:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b1815f14aea741a2b8aaf4bc26be0a52', 'admin', '2018-09-28 10:27:50', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b1f85cdaca314eab8b126c89f906fac7', 'admin', '2018-09-27 17:43:51', '修改用户凌222的信息');
INSERT INTO `sys_fhlog` VALUES ('b328746e76c9488cb1d2b843659c752e', 'admin', '2018-09-29 11:30:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b97f404e10904dacb0c8192f1eacf14b', 'admin', '2018-09-26 17:41:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c1838a84751140d389168bda7871f415', 'admin', '2018-09-27 16:21:08', '修改用户凌2的信息');
INSERT INTO `sys_fhlog` VALUES ('c267292e6aaa49e0b200ab7f2722b2b4', 'admin', '2018-09-28 10:28:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c2988da012b74369b3aaf5ce0e858bc8', 'admin', '2018-09-28 10:28:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c425bbda79b5479188a6ce8ea1c3170a', 'admin', '2018-09-28 09:42:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c52a44df889f42c3a6ef8bec3020343c', 'admin', '2018-09-27 10:21:26', '修改23活动状态:上架活动');
INSERT INTO `sys_fhlog` VALUES ('c625ae45fa114cabb603f50f957149b1', 'admin', '2018-09-27 17:45:02', '修改用户张三的信息');
INSERT INTO `sys_fhlog` VALUES ('cb2e58e34ae847e7bf744b997ab725eb', 'admin', '2018-09-27 12:24:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cbf2834e537d423c8ebbf48b9998b311', 'admin', '2018-09-28 10:28:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cd78940f04a440c2bc6645b83c25f951', 'admin', '2018-09-26 19:11:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cdb226de010b46709374299867224127', 'admin', '2018-09-26 18:31:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cdd7d1ee60f6427a8a541f2a4db2a4e1', 'admin', '2018-09-27 17:43:21', '修改用户凌222的信息');
INSERT INTO `sys_fhlog` VALUES ('cfe529027d17489eb8e92c30fe1f5b1b', 'admin', '2018-09-29 15:48:22', '添加兴趣爱好类型裂变指数');
INSERT INTO `sys_fhlog` VALUES ('d1063442a0b04a70abc3a4be5ebe3334', 'admin', '2018-09-28 17:20:10', '修改用户凌222资源锁定的信息');
INSERT INTO `sys_fhlog` VALUES ('d17f7519abcb42f6ade0843ebb360805', 'admin', '2018-09-27 12:12:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d1f7b5f6096448b18afeee55130c5d4d', 'admin', '2018-09-29 15:40:52', '添加兴趣爱好类型小竹清风');
INSERT INTO `sys_fhlog` VALUES ('d261bb03ff2e4755bb2f64b6ca1699ff', 'admin', '2018-09-28 10:28:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d390f24ed55e4a15b16cc2d9df68edba', 'admin', '2018-09-28 10:27:50', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d3e394a033e7450d9ae5a0d42b53b829', 'admin', '2018-09-28 10:28:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d4dc162cee59477489b94c8cc871f4d5', 'admin', '2018-09-29 15:55:18', '添加兴趣爱好类型杀杀杀');
INSERT INTO `sys_fhlog` VALUES ('d8e59f01d1eb4b1abcc26747469143ad', 'admin', '2018-09-28 17:57:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('db78393ae7f241aba42feb82a69a9614', 'admin', '2018-09-27 09:41:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('df1f1e0013a24ef68694dbef0b23ad12', 'admin', '2018-09-29 10:18:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e0a27197e2574c649b6ec01c0701269e', 'admin', '2018-09-28 10:28:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e23332e836354e9787592533a3ea44f4', 'admin', '2018-09-28 10:27:50', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e913d38de7734986b2a7990c0f4293fd', 'admin', '2018-09-28 10:28:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e927881ca9d54cf080a26d625c5d2969', 'admin', '2018-09-27 18:16:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e942a8eba97b4144a8283c7e57a7d263', 'admin', '2018-09-26 18:13:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea8b4e9734d441cab5a2e6933e17b2d0', 'admin', '2018-09-28 17:19:45', '修改用户凌222资源锁定的信息');
INSERT INTO `sys_fhlog` VALUES ('eabc7387564340cc8f24a794fe5930dc', 'admin', '2018-09-28 10:28:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eaef6f2567424f2d91b6b0edaed52a14', 'admin', '2018-09-28 10:28:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ebfa3b990dea4b4eb91aa017da701c01', 'admin', '2018-09-28 10:28:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef52e43b4344414aad05a1d213560e5c', 'admin', '2018-09-27 14:03:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f0803cd70b594f6286381583ce3809a4', 'admin', '2018-09-28 17:02:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f25054071c2d4711bc7183ba7444683d', 'admin', '2018-09-28 10:27:49', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f46818a02db442459756999e1e2b1f10', 'admin', '2018-09-29 16:09:28', '删除活动类型null');
INSERT INTO `sys_fhlog` VALUES ('f5c379bda5a84b36a27ce089750905db', 'admin', '2018-09-29 16:09:25', '删除活动类型null');
INSERT INTO `sys_fhlog` VALUES ('f61e516277b24ec994a4a7a22c515fd8', 'admin', '2018-09-28 10:28:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f7de2b0d61984b9b97b4e67e3a16951f', 'admin', '2018-09-27 17:44:11', '修改用户凌222的信息');
INSERT INTO `sys_fhlog` VALUES ('f836f72aa4ec476c9950af771f5f2b74', 'admin', '2018-09-29 16:02:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f9ba0a106afc4345bfd8552be86cf810', 'admin', '2018-09-28 10:27:52', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb26dab082d247f0a13bf816ea0128ad', 'admin', '2018-09-28 18:18:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fffd7be7dd1f4cabad79c2f003502be8', 'admin', '2018-09-27 17:42:42', '登录系统');

-- ----------------------------
-- Table structure for sys_fhlog_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhlog_copy`;
CREATE TABLE `sys_fhlog_copy`  (
  `FHLOG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms`  (
  `FHSMS_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for sys_leave_word
-- ----------------------------
DROP TABLE IF EXISTS `sys_leave_word`;
CREATE TABLE `sys_leave_word`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `leave_word` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户留言',
  `time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_loginimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginimg`;
CREATE TABLE `sys_loginimg`  (
  `LOGINIMG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ORDER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ICON` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_STATE` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', 1);
INSERT INTO `sys_menu` VALUES (2, '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', 1);
INSERT INTO `sys_menu` VALUES (3, '日志管理', 'fhlog/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', 0);
INSERT INTO `sys_menu` VALUES (8, '性能监控', 'druid/index.html', '9', '9', 'menu-icon fa fa-tachometer red', '1', 1);
INSERT INTO `sys_menu` VALUES (9, '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', 0);
INSERT INTO `sys_menu` VALUES (10, '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', 1);
INSERT INTO `sys_menu` VALUES (11, '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', 1);
INSERT INTO `sys_menu` VALUES (12, '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', 1);
INSERT INTO `sys_menu` VALUES (14, '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', 1);
INSERT INTO `sys_menu` VALUES (20, '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', 0);
INSERT INTO `sys_menu` VALUES (21, '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', 1);
INSERT INTO `sys_menu` VALUES (22, '一级菜单', '#', '0', '10', 'menu-icon fa fa-fire orange', '2', 0);
INSERT INTO `sys_menu` VALUES (23, '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (24, '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (30, '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (31, '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (32, '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (33, '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (34, '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (35, '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (36, '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', 1);
INSERT INTO `sys_menu` VALUES (37, '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', 1);
INSERT INTO `sys_menu` VALUES (38, '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', 1);
INSERT INTO `sys_menu` VALUES (39, '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', 1);
INSERT INTO `sys_menu` VALUES (40, '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', 1);
INSERT INTO `sys_menu` VALUES (41, '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', 1);
INSERT INTO `sys_menu` VALUES (43, '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', 0);
INSERT INTO `sys_menu` VALUES (44, '代码生成器', '#', '9', '0', 'menu-icon fa fa-cogs brown', '1', 1);
INSERT INTO `sys_menu` VALUES (45, '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (46, '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (47, '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (48, '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', 1);
INSERT INTO `sys_menu` VALUES (53, '表单构建器', 'tool/goFormbuilder.do', '9', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (54, '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '2', 0);
INSERT INTO `sys_menu` VALUES (55, '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', 1);
INSERT INTO `sys_menu` VALUES (56, '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', 1);
INSERT INTO `sys_menu` VALUES (57, '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', 1);
INSERT INTO `sys_menu` VALUES (58, 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', 1);
INSERT INTO `sys_menu` VALUES (61, '反向生成', 'recreateCode/list.do', '44', '2', 'menu-icon fa fa-cogs blue', '1', 1);
INSERT INTO `sys_menu` VALUES (62, '正向生成', 'createCode/list.do', '44', '1', 'menu-icon fa fa-cogs green', '1', 1);
INSERT INTO `sys_menu` VALUES (68, '快递查询', 'tool/queryExpress.do', '9', '8', 'menu-icon fa fa-fighter-jet green', '1', 1);
INSERT INTO `sys_menu` VALUES (82, 'utils', '#', '9', '10', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (83, '富文本编辑', 'tool/uediter.do', '82', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (98, '财务管理', '#', '0', '15', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (105, '参数设置', '#', '0', '19', 'menu-icon fa fa-info-circle black', '1', 1);
INSERT INTO `sys_menu` VALUES (111, '会员类别', 'memberType/goListUtype.do', '105', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (115, '系统管理', '#', '0', '20', 'menu-icon fa fa-globe black', '1', 1);
INSERT INTO `sys_menu` VALUES (116, '广告列表', 'advertisement/listAdvertisement.do', '115', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (119, '系统公告', 'systemNotice/listsystemNotice.do', '115', '3', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (122, '活动管理', '#', '0', '14', 'menu-icon fa fa-cog black', '1', 1);
INSERT INTO `sys_menu` VALUES (124, '活动列表', 'activity/goListactivity.do', '122', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (126, '活动提成角色比例设置', 'aSponsorDisExt/goListASponsorDisEx.do', '105', '4', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (129, '个税+手续费设置', 'taxrevenue/goListTaxrevenue.do', '105', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (131, '会员升级角色提成', 'mUpExtract/goListMUpExtract.do', '105', '3', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (132, '会员管理', '#', '0', '18', 'menu-icon fa fa-users black', '1', 1);
INSERT INTO `sys_menu` VALUES (153, '会员列表', 'clientUser/goListClientUser.do', '132', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (226, '活动类别', 'activityType/goListactivityType.do', '122', '3', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (247, '福利管理', '#', '0', '17', 'menu-icon fa fa-book black', '1', 1);
INSERT INTO `sys_menu` VALUES (268, '福利列表', 'welfare/goListwelfare.do', '247', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (344, '新闻管理', '#', '0', '16', 'menu-icon fa fa-fighter-jet black', '1', 1);
INSERT INTO `sys_menu` VALUES (364, '新闻列表', 'news/listnews.do', '344', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (405, '平台收入记录', 'backgroundTransferRecordinput/goListbackgroundTransferRecordinput.do', '98', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (406, '活动音乐', 'activityMusic/goListactivityMusic.do', '122', '4', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (426, '兴趣爱好', 'hobby/listHobbyType.do', '132', '3', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (438, '系统基本信息', 'systembulletin/listSystembulletin.do', '115', '8', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (454, '反馈建议', 'feedbackadvice/goListfeedbackadvice.do', '115', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (474, '系统日志', 'systemLog/goListSystemLog.do', '115', '4', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (494, '系统帮助', 'systemHelp/goListSystemHelp.do', '115', '6', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (514, '敏感词管理', 'sensitiveWords/goListSensitiveWords.do', '115', '7', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (554, '资源锁定管理', 'clientUser/listResourceLocking.do', '132', '6', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (555, '从事行业类型', 'engageIndustry/goListEngageIndustry.do', '132', '5', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (556, '平台支出记录', 'backgroundTransferRecordout/goListbackgroundTransferRecordout.do', '98', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (557, '助创基金', '#', '0', '21', 'menu-icon fa fa-flag black', '1', 1);
INSERT INTO `sys_menu` VALUES (558, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (559, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (560, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (561, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (562, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (563, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (564, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (565, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (566, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (567, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (568, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (569, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (570, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (571, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (572, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (573, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (574, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (575, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (576, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (577, '助创基金财务表', 'aidFund/listAidFund.do', '557', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (578, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (579, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (580, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (581, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (582, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (583, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (584, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (585, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (586, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (587, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (588, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (589, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (590, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (591, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (592, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (593, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (594, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (595, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (596, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (597, '投诉列表', 'complaint/goListComplaint.do', '122', '5', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (598, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (599, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (600, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (601, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (602, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (603, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (604, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (605, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (606, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (607, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (608, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (609, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (610, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (611, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (612, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (613, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (614, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (615, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (616, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (617, '举报列表', 'report/goListReport.do', '122', '6', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (618, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (619, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (620, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (621, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (622, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (623, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (624, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (625, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (626, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (627, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (628, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (629, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (630, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (631, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (632, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (633, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (634, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (635, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (636, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (637, '合伙人分红收入账单', 'partnerBonusInput/goListPartnerBonusInput.do', '98', '3', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (638, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (639, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (640, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (641, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (642, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (643, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (644, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (645, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (646, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (647, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (648, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (649, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (650, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (651, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (652, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (653, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (654, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (655, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (656, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (657, '主办方列表', 'organizerInfo/goListOrganizerInfo.do', '132', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (658, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (659, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (660, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (661, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (662, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (663, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (664, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (665, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (666, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (667, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (668, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (669, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (670, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (671, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (672, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (673, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (674, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (675, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (676, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (677, '财务报表', 'financialStatements/goListFinancialStatements.do', '98', '4', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (678, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (679, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (680, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (681, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (682, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (683, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (684, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (685, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (686, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (687, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (688, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (689, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (690, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (691, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (692, '会员报表', 'membershipStatements/goListmembershipStatements.do', '132', '8', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (693, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (694, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (695, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (696, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (697, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (698, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (699, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (700, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (701, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (702, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (703, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (704, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (705, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (706, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (707, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (708, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (709, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (710, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (711, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADD_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEL_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EDIT_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CHA_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '1435524697389753514192875308520056030750', '0', '1', '1', '1', '1', NULL, NULL);
INSERT INTO `sys_role` VALUES ('2', '运行中心组', '', '0', '0', '0', '0', '1', NULL, NULL);
INSERT INTO `sys_role` VALUES ('2a49ab085c6242d081f643aae225e950', '合作伙伴', '', '7fc49b6754db4bc088ab71d854134a9d', '0', '0', '0', '0', NULL, NULL);
INSERT INTO `sys_role` VALUES ('3', '超级管理员', '176904488663563382169189418397968234156389862581620814815908914830258934910814420261885052575967158911898667473855513278579507688488718992387766244006247033132241936142', '1', '170133435896927794283287654431693233950', '170133435896927794283287654431693233950', '1690739109293720343919471748414432108318', '2707100065570761643238545221881290579742', NULL, NULL);
INSERT INTO `sys_role` VALUES ('3f9660f63a6b4d4cbf51a2bc455ca497', '运营中心', '42535295865117307932921827028482654208', '1', '1430249323464569479244496397961162391552', '0', '0', '42535295865117307932921827028482654208', NULL, NULL);
INSERT INTO `sys_role` VALUES ('4a525a16517a46a8831406bef482327e', '二级管理员', '39402006196430315128153884968507179354388633819650449125391876139085128992277894834580032503864249908866488389861376', '1', '31776856774233145086606637534826987520', '30946089276867572666041758122151772160', '31112242776340687150154734004686815232', '372059223695171608549981244966595198976', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton`  (
  `RB_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BUTTON_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RB_ID`) USING BTREE,
  INDEX `角色表外键`(`ROLE_ID`) USING BTREE,
  INDEX `fbutton`(`BUTTON_ID`) USING BTREE,
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SKIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `school_id` int(2) NULL DEFAULT 0 COMMENT '学校id',
  `citycode` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联区域表',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0e4b4720dec04b2788b6d425690791ec', '999', '1f5523a8f535289b3401b29958d01b2966ed61d2', '999', '', '4a525a16517a46a8831406bef482327e', '2018-09-06 11:53:24', '0', 'default', NULL, '999', '999', '999', '2018-09-06 11:48:47', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('0fdcce5f1d43428b88e97aa80a232301', 'sc028003', 'ed6488c68ebb17b58fbfc92e7ed8400e42737bcc', '五冶-龙泉', '', '4a525a16517a46a8831406bef482327e', '2018-06-11 19:04:28', '0', 'default', NULL, 'sc028003', '男', '', '2018-05-20 00:20:19', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '易讯连', '1133671055321055258374707980945218933803269864762743594642571294', '3', '2018-09-29 16:30:42', '0', 'default', '001', '187888888883', '男', NULL, NULL, NULL, 0, '');
INSERT INTO `sys_user` VALUES ('151124f375ae4710bdd301d3beed0247', 'sc028008', '4ca337751ea3189d2c1864c266ce668141123f81', '科华技工校（川大科技园）', '', '4a525a16517a46a8831406bef482327e', '2018-06-05 22:57:43', '0', 'default', NULL, 'sc028008', '男', '', '2018-05-30 20:10:10', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('237f421a71a548cbae0c68aa3bff3eb7', '13608136358', 'd4a2f4d88217dd2aecc732c9e80c0fa1866147f3', '陈华坤', '', '3f9660f63a6b4d4cbf51a2bc455ca497', '2018-07-03 13:31:01', '0', 'default', NULL, '13608136358', '男', '', '2018-05-23 13:39:32', NULL, 0, '');
INSERT INTO `sys_user` VALUES ('27fb666376ab4e2d99dc94bb16f487e1', 'sc028002', 'dab2392f7c1537f833cb0a2d2272039f2a750347', '五冶-崇州', '', '4a525a16517a46a8831406bef482327e', '2018-05-30 11:16:25', '0', 'default', NULL, 'sc028002', '男', '', '2018-05-19 13:17:27', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('328c44f345574d8c974430f87745bc2d', '13678182345', '094be446c155eb1a2ccfb2794902d20f92a5d424', '郭芳', '', '4a525a16517a46a8831406bef482327e', '', '0', 'default', NULL, '13678182345', '女', '学校', '2018-08-16 18:37:59', NULL, 0, '');
INSERT INTO `sys_user` VALUES ('380b3c3bb31d4593a42d5e3086e90d0e', 'sc028007', '25719d752caeb43832644bdc60c87ad7a245d3c9', '华夏', '', '4a525a16517a46a8831406bef482327e', '2018-05-30 11:19:12', '0', 'default', NULL, 'sc028007', '男', '', '2018-05-24 12:55:43', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('39a6499146724ed7902ac5476e751e3b', 'sc028011', '40b50bc5a825f364b48877a71ce1f128da368579', '机电工程学校', '', '4a525a16517a46a8831406bef482327e', '2018-06-14 10:36:22', '0', 'default', NULL, 'sc028011', '男', '', '2018-05-30 20:14:24', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('47881e25e0554db585b436c77a3dd015', '13258378795', '99105a24315e9b1583e7fd405721bfaa66395526', '袁浩', '', '3f9660f63a6b4d4cbf51a2bc455ca497', '2018-06-25 12:01:55', '0', 'default', NULL, '13258378795', '男', '', '2018-05-21 21:41:45', NULL, 0, '');
INSERT INTO `sys_user` VALUES ('5659f40802be47e39284f5719e2bcac5', 'sc028009', '33a0705532f59117e0b2d7b3ddb2de06b7a60768', '东星航空', '', '4a525a16517a46a8831406bef482327e', '2018-06-11 18:04:58', '0', 'default', NULL, 'sc028009', '男', '', '2018-05-30 20:12:03', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('72fbd5caa42642c5b0fdb0c0cc9c6c58', 'sc028015', 'b8f0ea20d0d62a0b8c4baa716e6a47f63af6885e', '指南针', '', '4a525a16517a46a8831406bef482327e', '2018-06-23 15:47:47', '0', 'default', NULL, 'sc028015', '男', '', '2018-06-15 12:01:31', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('7ab2a2dc8e52496696ec637ae4414ac9', '15865656565', '549dbfa80e017dd63af74463da5d9c775e952745', '北京大学', '', '4a525a16517a46a8831406bef482327e', '2018-05-22 16:35:35', '0', 'default', NULL, '15865656565', '的', '23 ', '2018-05-16 16:13:09', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('8a5241226bdf4525b69b6ce830d52067', '15808330290', '0d277062f47b9d77300447fcb3a9729bf0df73de', '程国利', '', '3f9660f63a6b4d4cbf51a2bc455ca497', '2018-06-26 15:55:04', '0', 'default', NULL, '15808330290', '男', '乐山', '2018-06-04 15:06:35', NULL, 0, '');
INSERT INTO `sys_user` VALUES ('9e7474292a9143adb77138593894d3ce', 'sc028013', '5794c3a3f6ba1a7a8c07feead1fbdf11320d7b79', '仁寿华达高中', '', '4a525a16517a46a8831406bef482327e', '2018-06-12 14:28:50', '0', 'default', NULL, 'sc028013', '男', '', '2018-06-12 13:25:20', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('a620e6d488c5420580f173980953241e', 'sc028010', '8db291f3768d654fc67864255330757a74f2ce8d', '新华电脑', '', '4a525a16517a46a8831406bef482327e', '2018-06-07 00:25:27', '0', 'default', NULL, 'sc028010', '男', '', '2018-05-30 17:07:22', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('baf00d9d812945f8ad6fbd01d0a68741', '222', '273a0c7bd3c679ba9a6f5d99078e36e85d02b952', '222', '', '4a525a16517a46a8831406bef482327e', '2018-09-18 10:47:49', '0', 'default', NULL, '222', '男', '西南', '2018-08-18 14:59:59', NULL, 16, '');
INSERT INTO `sys_user` VALUES ('baf81f8edbfd4f18810929fc8e769406', 'sc028001', 'a51965dbfe5e02eb5e322960c42226f9e9c379cb', '希望汽车', '', '4a525a16517a46a8831406bef482327e', '2018-06-06 00:10:27', '0', 'default', NULL, 'sc028001', '女', '', '2018-05-19 12:40:35', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('c377e50234cc47bd9298e0f57487dd16', '18081336798', 'dc7d511c12a706a2b6354322ef0dbcace32a6f4b', '王建平', '', '3f9660f63a6b4d4cbf51a2bc455ca497', '2018-06-17 19:57:40', '0', 'default', NULL, '18081336798', '男', '', '2018-06-15 13:25:01', NULL, 0, '');
INSERT INTO `sys_user` VALUES ('c53f4d6668a245f782d2fcd6c1dd275a', '111', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '111', '', '4a525a16517a46a8831406bef482327e', '2018-08-18 14:51:56', '0', 'default', NULL, '111', '11', '11', '2018-08-17 10:25:48', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('c57d1644197344b797ac5be40a33c4a9', '333', '77bce9fb18f977ea576bbcd143b2b521073f0cd6', '333', '', '4a525a16517a46a8831406bef482327e', '2018-08-24 11:03:51', '0', 'default', NULL, '333', '男', '学校管理', '2018-08-24 10:01:42', NULL, 0, '');
INSERT INTO `sys_user` VALUES ('ccc7dae4f85e4877989642c770470013', 'sc028004', '622e7413bfaee9c59760fdbeb35e83c30dce43bd', '核工业-成都', '', '4a525a16517a46a8831406bef482327e', '2018-06-10 01:51:40', '0', 'default', NULL, 'sc028004', '男', '', '2018-05-20 00:35:44', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('d7369f18d9c04fe19e643db3e41f06e8', '888', '1f82c942befda29b6ed487a51da199f78fce7f05', '888', '', '3f9660f63a6b4d4cbf51a2bc455ca497', '2018-09-06 14:05:21', '0', 'default', NULL, '888', '888', '888', '2018-09-06 14:05:01', NULL, 0, '');
INSERT INTO `sys_user` VALUES ('e91fb0c19d4f44aab7b1e80cf9f89c13', 'sc028005', '3c9913e7fc94b87513bb6b19eabcd875e37340bf', '五月花', '', '4a525a16517a46a8831406bef482327e', '2018-06-10 10:14:12', '0', 'default', NULL, 'sc028005', '男', '', '2018-05-19 12:35:56', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('ef03d9bb00994fbc9bc8c2516787a6cd', 'sc028012', 'd5a03c078bb532c9cf4dd37cb8cba519e554357a', '城市建设技工校', '', '4a525a16517a46a8831406bef482327e', '2018-06-02 12:28:21', '0', 'default', NULL, 'sc028012', '男', '', '2018-05-30 20:33:19', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('f709c4ea23234aa5bc8785619183eed7', 'sc028006', 'b8fea87ff438ecd2506d8785a7fbca829471f676', '爱华学院', '', '4a525a16517a46a8831406bef482327e', '2018-05-30 09:33:49', '0', 'default', NULL, 'sc028006', '男', '', '2018-05-20 00:40:55', NULL, 1, '');
INSERT INTO `sys_user` VALUES ('fc0f6d0cb711425092f5980a8fdc4ca6', '15198091531', '081739dc90bd13956ca08f1778a98925d6755221', '王燕华', '', '3f9660f63a6b4d4cbf51a2bc455ca497', '2018-06-13 15:18:11', '0', 'default', NULL, '15198091531', '男', '', '2018-05-21 19:28:53', NULL, 0, '');

-- ----------------------------
-- Table structure for sys_userphoto
-- ----------------------------
DROP TABLE IF EXISTS `sys_userphoto`;
CREATE TABLE `sys_userphoto`  (
  `USERPHOTO_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_userphoto
-- ----------------------------
INSERT INTO `sys_userphoto` VALUES ('7ca8fa2a950d4700b0579bbf8f32f2ea', 'admin', '', 'uploadFiles/uploadUserPhoto/jsp_avatar1_20180414170234767fngqy1w3.jpg', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20180414170234767fngqy1w3.jpg', 'uploadFiles/uploadUserPhoto/jsp_avatar3_20180414170234767fngqy1w3.jpg');

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address`  (
  `citycode` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cityname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pidcode` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simplename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `citylevel` int(4) NULL DEFAULT NULL,
  `areacode` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postcode` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `py` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`citycode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES ('110000', '北京', '100000', '北京', 1, '', '', 'Beijing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110100', '北京市', '110000', '北京', 2, '010', '100000', 'Beijing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110101', '东城区', '110100', '东城', 3, '010', '100010', 'Dongcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110102', '西城区', '110100', '西城', 3, '010', '100032', 'Xicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110105', '朝阳区', '110100', '朝阳', 3, '010', '100020', 'Chaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110106', '丰台区', '110100', '丰台', 3, '010', '100071', 'Fengtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110107', '石景山区', '110100', '石景山', 3, '010', '100043', 'Shijingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110108', '海淀区', '110100', '海淀', 3, '010', '100089', 'Haidian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110109', '门头沟区', '110100', '门头沟', 3, '010', '102300', 'Mentougou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110111', '房山区', '110100', '房山', 3, '010', '102488', 'Fangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110112', '通州区', '110100', '通州', 3, '010', '101149', 'Tongzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110113', '顺义区', '110100', '顺义', 3, '010', '101300', 'Shunyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110114', '昌平区', '110100', '昌平', 3, '010', '102200', 'Changping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110115', '大兴区', '110100', '大兴', 3, '010', '102600', 'Daxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110116', '怀柔区', '110100', '怀柔', 3, '010', '101400', 'Huairou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110117', '平谷区', '110100', '平谷', 3, '010', '101200', 'Pinggu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110228', '密云县', '110100', '密云', 3, '010', '101500', 'Miyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('110229', '延庆县', '110100', '延庆', 3, '010', '102100', 'Yanqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120000', '天津', '100000', '天津', 1, '', '', 'Tianjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120100', '天津市', '120000', '天津', 2, '022', '300000', 'Tianjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120101', '和平区', '120100', '和平', 3, '022', '300041', 'Heping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120102', '河东区', '120100', '河东', 3, '022', '300171', 'Hedong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120103', '河西区', '120100', '河西', 3, '022', '300202', 'Hexi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120104', '南开区', '120100', '南开', 3, '022', '300110', 'Nankai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120105', '河北区', '120100', '河北', 3, '022', '300143', 'Hebei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120106', '红桥区', '120100', '红桥', 3, '022', '300131', 'Hongqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120110', '东丽区', '120100', '东丽', 3, '022', '300300', 'Dongli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120111', '西青区', '120100', '西青', 3, '022', '300380', 'Xiqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120112', '津南区', '120100', '津南', 3, '022', '300350', 'Jinnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120113', '北辰区', '120100', '北辰', 3, '022', '300400', 'Beichen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120114', '武清区', '120100', '武清', 3, '022', '301700', 'Wuqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120115', '宝坻区', '120100', '宝坻', 3, '022', '301800', 'Baodi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120116', '滨海新区', '120100', '滨海新区', 3, '022', '300451', 'Binhaixinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120221', '宁河县', '120100', '宁河', 3, '022', '301500', 'Ninghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120223', '静海县', '120100', '静海', 3, '022', '301600', 'Jinghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('120225', '蓟县', '120100', '蓟县', 3, '022', '301900', 'Jixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130000', '河北省', '100000', '河北', 1, '', '', 'Hebei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130100', '石家庄市', '130000', '石家庄', 2, '0311', '050011', 'Shijiazhuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130102', '长安区', '130100', '长安', 3, '0311', '050011', 'Changan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130104', '桥西区', '130100', '桥西', 3, '0311', '050091', 'Qiaoxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130105', '新华区', '130100', '新华', 3, '0311', '050051', 'Xinhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130107', '井陉矿区', '130100', '井陉矿区', 3, '0311', '050100', 'Jingxingkuangqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130108', '裕华区', '130100', '裕华', 3, '0311', '050031', 'Yuhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130109', '藁城区', '130100', '藁城', 3, '0311', '052160', 'Gaocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130110', '鹿泉区', '130100', '鹿泉', 3, '0311', '050200', 'Luquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130111', '栾城区', '130100', '栾城', 3, '0311', '051430', 'Luancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130121', '井陉县', '130100', '井陉', 3, '0311', '050300', 'Jingxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130123', '正定县', '130100', '正定', 3, '0311', '050800', 'Zhengding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130125', '行唐县', '130100', '行唐', 3, '0311', '050600', 'Xingtang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130126', '灵寿县', '130100', '灵寿', 3, '0311', '050500', 'Lingshou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130127', '高邑县', '130100', '高邑', 3, '0311', '051330', 'Gaoyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130128', '深泽县', '130100', '深泽', 3, '0311', '052560', 'Shenze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130129', '赞皇县', '130100', '赞皇', 3, '0311', '051230', 'Zanhuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130130', '无极县', '130100', '无极', 3, '0311', '052460', 'Wuji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130131', '平山县', '130100', '平山', 3, '0311', '050400', 'Pingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130132', '元氏县', '130100', '元氏', 3, '0311', '051130', 'Yuanshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130133', '赵县', '130100', '赵县', 3, '0311', '051530', 'Zhaoxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130181', '辛集市', '130100', '辛集', 3, '0311', '052360', 'Xinji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130183', '晋州市', '130100', '晋州', 3, '0311', '052260', 'Jinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130184', '新乐市', '130100', '新乐', 3, '0311', '050700', 'Xinle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130200', '唐山市', '130000', '唐山', 2, '0315', '063000', 'Tangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130202', '路南区', '130200', '路南', 3, '0315', '063000', 'Lunan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130203', '路北区', '130200', '路北', 3, '0315', '063000', 'Lubei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130204', '古冶区', '130200', '古冶', 3, '0315', '063100', 'Guye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130205', '开平区', '130200', '开平', 3, '0315', '063021', 'Kaiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130207', '丰南区', '130200', '丰南', 3, '0315', '063300', 'Fengnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130208', '丰润区', '130200', '丰润', 3, '0315', '064000', 'Fengrun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130209', '曹妃甸区', '130200', '曹妃甸', 3, '0315', '063200', 'Caofeidian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130223', '滦县', '130200', '滦县', 3, '0315', '063700', 'Luanxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130224', '滦南县', '130200', '滦南', 3, '0315', '063500', 'Luannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130225', '乐亭县', '130200', '乐亭', 3, '0315', '063600', 'Laoting', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130227', '迁西县', '130200', '迁西', 3, '0315', '064300', 'Qianxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130229', '玉田县', '130200', '玉田', 3, '0315', '064100', 'Yutian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130281', '遵化市', '130200', '遵化', 3, '0315', '064200', 'Zunhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130283', '迁安市', '130200', '迁安', 3, '0315', '064400', 'Qianan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130300', '秦皇岛市', '130000', '秦皇岛', 2, '0335', '066000', 'Qinhuangdao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130302', '海港区', '130300', '海港', 3, '0335', '066000', 'Haigang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130303', '山海关区', '130300', '山海关', 3, '0335', '066200', 'Shanhaiguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130304', '北戴河区', '130300', '北戴河', 3, '0335', '066100', 'Beidaihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130321', '青龙满族自治县', '130300', '青龙', 3, '0335', '066500', 'Qinglong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130322', '昌黎县', '130300', '昌黎', 3, '0335', '066600', 'Changli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130323', '抚宁县', '130300', '抚宁', 3, '0335', '066300', 'Funing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130324', '卢龙县', '130300', '卢龙', 3, '0335', '066400', 'Lulong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130400', '邯郸市', '130000', '邯郸', 2, '0310', '056002', 'Handan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130402', '邯山区', '130400', '邯山', 3, '0310', '056001', 'Hanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130403', '丛台区', '130400', '丛台', 3, '0310', '056002', 'Congtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130404', '复兴区', '130400', '复兴', 3, '0310', '056003', 'Fuxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130406', '峰峰矿区', '130400', '峰峰矿区', 3, '0310', '056200', 'Fengfengkuangqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130421', '邯郸县', '130400', '邯郸', 3, '0310', '056101', 'Handan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130423', '临漳县', '130400', '临漳', 3, '0310', '056600', 'Linzhang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130424', '成安县', '130400', '成安', 3, '0310', '056700', 'Chengan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130425', '大名县', '130400', '大名', 3, '0310', '056900', 'Daming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130426', '涉县', '130400', '涉县', 3, '0310', '056400', 'Shexian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130427', '磁县', '130400', '磁县', 3, '0310', '056500', 'Cixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130428', '肥乡县', '130400', '肥乡', 3, '0310', '057550', 'Feixiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130429', '永年县', '130400', '永年', 3, '0310', '057150', 'Yongnian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130430', '邱县', '130400', '邱县', 3, '0310', '057450', 'Qiuxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130431', '鸡泽县', '130400', '鸡泽', 3, '0310', '057350', 'Jize', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130432', '广平县', '130400', '广平', 3, '0310', '057650', 'Guangping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130433', '馆陶县', '130400', '馆陶', 3, '0310', '057750', 'Guantao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130434', '魏县', '130400', '魏县', 3, '0310', '056800', 'Weixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130435', '曲周县', '130400', '曲周', 3, '0310', '057250', 'Quzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130481', '武安市', '130400', '武安', 3, '0310', '056300', 'Wuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130500', '邢台市', '130000', '邢台', 2, '0319', '054001', 'Xingtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130502', '桥东区', '130500', '桥东', 3, '0319', '054001', 'Qiaodong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130503', '桥西区', '130500', '桥西', 3, '0319', '054000', 'Qiaoxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130521', '邢台县', '130500', '邢台', 3, '0319', '054001', 'Xingtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130522', '临城县', '130500', '临城', 3, '0319', '054300', 'Lincheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130523', '内丘县', '130500', '内丘', 3, '0319', '054200', 'Neiqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130524', '柏乡县', '130500', '柏乡', 3, '0319', '055450', 'Baixiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130525', '隆尧县', '130500', '隆尧', 3, '0319', '055350', 'Longyao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130526', '任县', '130500', '任县', 3, '0319', '055150', 'Renxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130527', '南和县', '130500', '南和', 3, '0319', '054400', 'Nanhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130528', '宁晋县', '130500', '宁晋', 3, '0319', '055550', 'Ningjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130529', '巨鹿县', '130500', '巨鹿', 3, '0319', '055250', 'Julu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130530', '新河县', '130500', '新河', 3, '0319', '055650', 'Xinhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130531', '广宗县', '130500', '广宗', 3, '0319', '054600', 'Guangzong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130532', '平乡县', '130500', '平乡', 3, '0319', '054500', 'Pingxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130533', '威县', '130500', '威县', 3, '0319', '054700', 'Weixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130534', '清河县', '130500', '清河', 3, '0319', '054800', 'Qinghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130535', '临西县', '130500', '临西', 3, '0319', '054900', 'Linxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130581', '南宫市', '130500', '南宫', 3, '0319', '055750', 'Nangong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130582', '沙河市', '130500', '沙河', 3, '0319', '054100', 'Shahe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130600', '保定市', '130000', '保定', 2, '0312', '071052', 'Baoding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130602', '新市区', '130600', '新市', 3, '0312', '071051', 'Xinshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130603', '北市区', '130600', '北市', 3, '0312', '071000', 'Beishi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130604', '南市区', '130600', '南市', 3, '0312', '071001', 'Nanshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130621', '满城县', '130600', '满城', 3, '0312', '072150', 'Mancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130622', '清苑县', '130600', '清苑', 3, '0312', '071100', 'Qingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130623', '涞水县', '130600', '涞水', 3, '0312', '074100', 'Laishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130624', '阜平县', '130600', '阜平', 3, '0312', '073200', 'Fuping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130625', '徐水县', '130600', '徐水', 3, '0312', '072550', 'Xushui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130626', '定兴县', '130600', '定兴', 3, '0312', '072650', 'Dingxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130627', '唐县', '130600', '唐县', 3, '0312', '072350', 'Tangxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130628', '高阳县', '130600', '高阳', 3, '0312', '071500', 'Gaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130629', '容城县', '130600', '容城', 3, '0312', '071700', 'Rongcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130630', '涞源县', '130600', '涞源', 3, '0312', '074300', 'Laiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130631', '望都县', '130600', '望都', 3, '0312', '072450', 'Wangdu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130632', '安新县', '130600', '安新', 3, '0312', '071600', 'Anxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130633', '易县', '130600', '易县', 3, '0312', '074200', 'Yixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130634', '曲阳县', '130600', '曲阳', 3, '0312', '073100', 'Quyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130635', '蠡县', '130600', '蠡县', 3, '0312', '071400', 'Lixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130636', '顺平县', '130600', '顺平', 3, '0312', '072250', 'Shunping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130637', '博野县', '130600', '博野', 3, '0312', '071300', 'Boye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130638', '雄县', '130600', '雄县', 3, '0312', '071800', 'Xiongxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130681', '涿州市', '130600', '涿州', 3, '0312', '072750', 'Zhuozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130682', '定州市', '130600', '定州', 3, '0312', '073000', 'Dingzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130683', '安国市', '130600', '安国', 3, '0312', '071200', 'Anguo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130684', '高碑店市', '130600', '高碑店', 3, '0312', '074000', 'Gaobeidian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130700', '张家口市', '130000', '张家口', 2, '0313', '075000', 'Zhangjiakou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130702', '桥东区', '130700', '桥东', 3, '0313', '075000', 'Qiaodong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130703', '桥西区', '130700', '桥西', 3, '0313', '075061', 'Qiaoxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130705', '宣化区', '130700', '宣化', 3, '0313', '075100', 'Xuanhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130706', '下花园区', '130700', '下花园', 3, '0313', '075300', 'Xiahuayuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130721', '宣化县', '130700', '宣化', 3, '0313', '075100', 'Xuanhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130722', '张北县', '130700', '张北', 3, '0313', '076450', 'Zhangbei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130723', '康保县', '130700', '康保', 3, '0313', '076650', 'Kangbao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130724', '沽源县', '130700', '沽源', 3, '0313', '076550', 'Guyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130725', '尚义县', '130700', '尚义', 3, '0313', '076750', 'Shangyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130726', '蔚县', '130700', '蔚县', 3, '0313', '075700', 'Yuxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130727', '阳原县', '130700', '阳原', 3, '0313', '075800', 'Yangyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130728', '怀安县', '130700', '怀安', 3, '0313', '076150', 'Huaian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130729', '万全县', '130700', '万全', 3, '0313', '076250', 'Wanquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130730', '怀来县', '130700', '怀来', 3, '0313', '075400', 'Huailai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130731', '涿鹿县', '130700', '涿鹿', 3, '0313', '075600', 'Zhuolu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130732', '赤城县', '130700', '赤城', 3, '0313', '075500', 'Chicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130733', '崇礼县', '130700', '崇礼', 3, '0313', '076350', 'Chongli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130800', '承德市', '130000', '承德', 2, '0314', '067000', 'Chengde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130802', '双桥区', '130800', '双桥', 3, '0314', '067000', 'Shuangqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130803', '双滦区', '130800', '双滦', 3, '0314', '067001', 'Shuangluan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130804', '鹰手营子矿区', '130800', '鹰手营子矿区', 3, '0314', '067200', 'Yingshouyingzikuangqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130821', '承德县', '130800', '承德', 3, '0314', '067400', 'Chengde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130822', '兴隆县', '130800', '兴隆', 3, '0314', '067300', 'Xinglong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130823', '平泉县', '130800', '平泉', 3, '0314', '067500', 'Pingquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130824', '滦平县', '130800', '滦平', 3, '0314', '068250', 'Luanping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130825', '隆化县', '130800', '隆化', 3, '0314', '068150', 'Longhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130826', '丰宁满族自治县', '130800', '丰宁', 3, '0314', '068350', 'Fengning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130827', '宽城满族自治县', '130800', '宽城', 3, '0314', '067600', 'Kuancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130828', '围场满族蒙古族自治县', '130800', '围场', 3, '0314', '068450', 'Weichang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130900', '沧州市', '130000', '沧州', 2, '0317', '061001', 'Cangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130902', '新华区', '130900', '新华', 3, '0317', '061000', 'Xinhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130903', '运河区', '130900', '运河', 3, '0317', '061001', 'Yunhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130921', '沧县', '130900', '沧县', 3, '0317', '061000', 'Cangxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130922', '青县', '130900', '青县', 3, '0317', '062650', 'Qingxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130923', '东光县', '130900', '东光', 3, '0317', '061600', 'Dongguang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130924', '海兴县', '130900', '海兴', 3, '0317', '061200', 'Haixing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130925', '盐山县', '130900', '盐山', 3, '0317', '061300', 'Yanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130926', '肃宁县', '130900', '肃宁', 3, '0317', '062350', 'Suning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130927', '南皮县', '130900', '南皮', 3, '0317', '061500', 'Nanpi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130928', '吴桥县', '130900', '吴桥', 3, '0317', '061800', 'Wuqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130929', '献县', '130900', '献县', 3, '0317', '062250', 'Xianxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130930', '孟村回族自治县', '130900', '孟村', 3, '0317', '061400', 'Mengcun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130981', '泊头市', '130900', '泊头', 3, '0317', '062150', 'Botou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130982', '任丘市', '130900', '任丘', 3, '0317', '062550', 'Renqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130983', '黄骅市', '130900', '黄骅', 3, '0317', '061100', 'Huanghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('130984', '河间市', '130900', '河间', 3, '0317', '062450', 'Hejian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131000', '廊坊市', '130000', '廊坊', 2, '0316', '065000', 'Langfang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131002', '安次区', '131000', '安次', 3, '0316', '065000', 'Anci', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131003', '广阳区', '131000', '广阳', 3, '0316', '065000', 'Guangyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131022', '固安县', '131000', '固安', 3, '0316', '065500', 'Guan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131023', '永清县', '131000', '永清', 3, '0316', '065600', 'Yongqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131024', '香河县', '131000', '香河', 3, '0316', '065400', 'Xianghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131025', '大城县', '131000', '大城', 3, '0316', '065900', 'Daicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131026', '文安县', '131000', '文安', 3, '0316', '065800', 'Wenan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131028', '大厂回族自治县', '131000', '大厂', 3, '0316', '065300', 'Dachang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131081', '霸州市', '131000', '霸州', 3, '0316', '065700', 'Bazhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131082', '三河市', '131000', '三河', 3, '0316', '065200', 'Sanhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131100', '衡水市', '130000', '衡水', 2, '0318', '053000', 'Hengshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131102', '桃城区', '131100', '桃城', 3, '0318', '053000', 'Taocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131121', '枣强县', '131100', '枣强', 3, '0318', '053100', 'Zaoqiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131122', '武邑县', '131100', '武邑', 3, '0318', '053400', 'Wuyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131123', '武强县', '131100', '武强', 3, '0318', '053300', 'Wuqiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131124', '饶阳县', '131100', '饶阳', 3, '0318', '053900', 'Raoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131125', '安平县', '131100', '安平', 3, '0318', '053600', 'Anping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131126', '故城县', '131100', '故城', 3, '0318', '053800', 'Gucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131127', '景县', '131100', '景县', 3, '0318', '053500', 'Jingxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131128', '阜城县', '131100', '阜城', 3, '0318', '053700', 'Fucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131181', '冀州市', '131100', '冀州', 3, '0318', '053200', 'Jizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('131182', '深州市', '131100', '深州', 3, '0318', '053800', 'Shenzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140000', '山西省', '100000', '山西', 1, '', '', 'Shanxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140100', '太原市', '140000', '太原', 2, '0351', '030082', 'Taiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140105', '小店区', '140100', '小店', 3, '0351', '030032', 'Xiaodian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140106', '迎泽区', '140100', '迎泽', 3, '0351', '030002', 'Yingze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140107', '杏花岭区', '140100', '杏花岭', 3, '0351', '030009', 'Xinghualing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140108', '尖草坪区', '140100', '尖草坪', 3, '0351', '030023', 'Jiancaoping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140109', '万柏林区', '140100', '万柏林', 3, '0351', '030024', 'Wanbailin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140110', '晋源区', '140100', '晋源', 3, '0351', '030025', 'Jinyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140121', '清徐县', '140100', '清徐', 3, '0351', '030400', 'Qingxu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140122', '阳曲县', '140100', '阳曲', 3, '0351', '030100', 'Yangqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140123', '娄烦县', '140100', '娄烦', 3, '0351', '030300', 'Loufan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140181', '古交市', '140100', '古交', 3, '0351', '030200', 'Gujiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140200', '大同市', '140000', '大同', 2, '0352', '037008', 'Datong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140202', '城区', '140200', '城区', 3, '0352', '037008', 'Chengqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140203', '矿区', '140200', '矿区', 3, '0352', '037003', 'Kuangqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140211', '南郊区', '140200', '南郊', 3, '0352', '037001', 'Nanjiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140212', '新荣区', '140200', '新荣', 3, '0352', '037002', 'Xinrong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140221', '阳高县', '140200', '阳高', 3, '0352', '038100', 'Yanggao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140222', '天镇县', '140200', '天镇', 3, '0352', '038200', 'Tianzhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140223', '广灵县', '140200', '广灵', 3, '0352', '037500', 'Guangling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140224', '灵丘县', '140200', '灵丘', 3, '0352', '034400', 'Lingqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140225', '浑源县', '140200', '浑源', 3, '0352', '037400', 'Hunyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140226', '左云县', '140200', '左云', 3, '0352', '037100', 'Zuoyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140227', '大同县', '140200', '大同', 3, '0352', '037300', 'Datong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140300', '阳泉市', '140000', '阳泉', 2, '0353', '045000', 'Yangquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140302', '城区', '140300', '城区', 3, '0353', '045000', 'Chengqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140303', '矿区', '140300', '矿区', 3, '0353', '045000', 'Kuangqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140311', '郊区', '140300', '郊区', 3, '0353', '045011', 'Jiaoqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140321', '平定县', '140300', '平定', 3, '0353', '045200', 'Pingding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140322', '盂县', '140300', '盂县', 3, '0353', '045100', 'Yuxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140400', '长治市', '140000', '长治', 2, '0355', '046000', 'Changzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140402', '城区', '140400', '城区', 3, '0355', '046011', 'Chengqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140411', '郊区', '140400', '郊区', 3, '0355', '046011', 'Jiaoqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140421', '长治县', '140400', '长治', 3, '0355', '047100', 'Changzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140423', '襄垣县', '140400', '襄垣', 3, '0355', '046200', 'Xiangyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140424', '屯留县', '140400', '屯留', 3, '0355', '046100', 'Tunliu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140425', '平顺县', '140400', '平顺', 3, '0355', '047400', 'Pingshun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140426', '黎城县', '140400', '黎城', 3, '0355', '047600', 'Licheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140427', '壶关县', '140400', '壶关', 3, '0355', '047300', 'Huguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140428', '长子县', '140400', '长子', 3, '0355', '046600', 'Zhangzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140429', '武乡县', '140400', '武乡', 3, '0355', '046300', 'Wuxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140430', '沁县', '140400', '沁县', 3, '0355', '046400', 'Qinxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140431', '沁源县', '140400', '沁源', 3, '0355', '046500', 'Qinyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140481', '潞城市', '140400', '潞城', 3, '0355', '047500', 'Lucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140500', '晋城市', '140000', '晋城', 2, '0356', '048000', 'Jincheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140502', '城区', '140500', '城区', 3, '0356', '048000', 'Chengqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140521', '沁水县', '140500', '沁水', 3, '0356', '048200', 'Qinshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140522', '阳城县', '140500', '阳城', 3, '0356', '048100', 'Yangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140524', '陵川县', '140500', '陵川', 3, '0356', '048300', 'Lingchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140525', '泽州县', '140500', '泽州', 3, '0356', '048012', 'Zezhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140581', '高平市', '140500', '高平', 3, '0356', '048400', 'Gaoping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140600', '朔州市', '140000', '朔州', 2, '0349', '038500', 'Shuozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140602', '朔城区', '140600', '朔城', 3, '0349', '036000', 'Shuocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140603', '平鲁区', '140600', '平鲁', 3, '0349', '038600', 'Pinglu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140621', '山阴县', '140600', '山阴', 3, '0349', '036900', 'Shanyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140622', '应县', '140600', '应县', 3, '0349', '037600', 'Yingxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140623', '右玉县', '140600', '右玉', 3, '0349', '037200', 'Youyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140624', '怀仁县', '140600', '怀仁', 3, '0349', '038300', 'Huairen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140700', '晋中市', '140000', '晋中', 2, '0354', '030600', 'Jinzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140702', '榆次区', '140700', '榆次', 3, '0354', '030600', 'Yuci', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140721', '榆社县', '140700', '榆社', 3, '0354', '031800', 'Yushe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140722', '左权县', '140700', '左权', 3, '0354', '032600', 'Zuoquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140723', '和顺县', '140700', '和顺', 3, '0354', '032700', 'Heshun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140724', '昔阳县', '140700', '昔阳', 3, '0354', '045300', 'Xiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140725', '寿阳县', '140700', '寿阳', 3, '0354', '045400', 'Shouyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140726', '太谷县', '140700', '太谷', 3, '0354', '030800', 'Taigu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140727', '祁县', '140700', '祁县', 3, '0354', '030900', 'Qixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140728', '平遥县', '140700', '平遥', 3, '0354', '031100', 'Pingyao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140729', '灵石县', '140700', '灵石', 3, '0354', '031300', 'Lingshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140781', '介休市', '140700', '介休', 3, '0354', '032000', 'Jiexiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140800', '运城市', '140000', '运城', 2, '0359', '044000', 'Yuncheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140802', '盐湖区', '140800', '盐湖', 3, '0359', '044000', 'Yanhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140821', '临猗县', '140800', '临猗', 3, '0359', '044100', 'Linyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140822', '万荣县', '140800', '万荣', 3, '0359', '044200', 'Wanrong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140823', '闻喜县', '140800', '闻喜', 3, '0359', '043800', 'Wenxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140824', '稷山县', '140800', '稷山', 3, '0359', '043200', 'Jishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140825', '新绛县', '140800', '新绛', 3, '0359', '043100', 'Xinjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140826', '绛县', '140800', '绛县', 3, '0359', '043600', 'Jiangxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140827', '垣曲县', '140800', '垣曲', 3, '0359', '043700', 'Yuanqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140828', '夏县', '140800', '夏县', 3, '0359', '044400', 'Xiaxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140829', '平陆县', '140800', '平陆', 3, '0359', '044300', 'Pinglu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140830', '芮城县', '140800', '芮城', 3, '0359', '044600', 'Ruicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140881', '永济市', '140800', '永济', 3, '0359', '044500', 'Yongji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140882', '河津市', '140800', '河津', 3, '0359', '043300', 'Hejin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140900', '忻州市', '140000', '忻州', 2, '0350', '034000', 'Xinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140902', '忻府区', '140900', '忻府', 3, '0350', '034000', 'Xinfu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140921', '定襄县', '140900', '定襄', 3, '0350', '035400', 'Dingxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140922', '五台县', '140900', '五台', 3, '0350', '035500', 'Wutai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140923', '代县', '140900', '代县', 3, '0350', '034200', 'Daixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140924', '繁峙县', '140900', '繁峙', 3, '0350', '034300', 'Fanshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140925', '宁武县', '140900', '宁武', 3, '0350', '036700', 'Ningwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140926', '静乐县', '140900', '静乐', 3, '0350', '035100', 'Jingle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140927', '神池县', '140900', '神池', 3, '0350', '036100', 'Shenchi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140928', '五寨县', '140900', '五寨', 3, '0350', '036200', 'Wuzhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140929', '岢岚县', '140900', '岢岚', 3, '0350', '036300', 'Kelan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140930', '河曲县', '140900', '河曲', 3, '0350', '036500', 'Hequ', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140931', '保德县', '140900', '保德', 3, '0350', '036600', 'Baode', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140932', '偏关县', '140900', '偏关', 3, '0350', '036400', 'Pianguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('140981', '原平市', '140900', '原平', 3, '0350', '034100', 'Yuanping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141000', '临汾市', '140000', '临汾', 2, '0357', '041000', 'Linfen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141002', '尧都区', '141000', '尧都', 3, '0357', '041000', 'Yaodu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141021', '曲沃县', '141000', '曲沃', 3, '0357', '043400', 'Quwo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141022', '翼城县', '141000', '翼城', 3, '0357', '043500', 'Yicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141023', '襄汾县', '141000', '襄汾', 3, '0357', '041500', 'Xiangfen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141024', '洪洞县', '141000', '洪洞', 3, '0357', '041600', 'Hongtong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141025', '古县', '141000', '古县', 3, '0357', '042400', 'Guxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141026', '安泽县', '141000', '安泽', 3, '0357', '042500', 'Anze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141027', '浮山县', '141000', '浮山', 3, '0357', '042600', 'Fushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141028', '吉县', '141000', '吉县', 3, '0357', '042200', 'Jixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141029', '乡宁县', '141000', '乡宁', 3, '0357', '042100', 'Xiangning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141030', '大宁县', '141000', '大宁', 3, '0357', '042300', 'Daning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141031', '隰县', '141000', '隰县', 3, '0357', '041300', 'Xixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141032', '永和县', '141000', '永和', 3, '0357', '041400', 'Yonghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141033', '蒲县', '141000', '蒲县', 3, '0357', '041200', 'Puxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141034', '汾西县', '141000', '汾西', 3, '0357', '031500', 'Fenxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141081', '侯马市', '141000', '侯马', 3, '0357', '043000', 'Houma', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141082', '霍州市', '141000', '霍州', 3, '0357', '031400', 'Huozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141100', '吕梁市', '140000', '吕梁', 2, '0358', '033000', 'Lvliang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141102', '离石区', '141100', '离石', 3, '0358', '033000', 'Lishi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141121', '文水县', '141100', '文水', 3, '0358', '032100', 'Wenshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141122', '交城县', '141100', '交城', 3, '0358', '030500', 'Jiaocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141123', '兴县', '141100', '兴县', 3, '0358', '033600', 'Xingxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141124', '临县', '141100', '临县', 3, '0358', '033200', 'Linxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141125', '柳林县', '141100', '柳林', 3, '0358', '033300', 'Liulin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141126', '石楼县', '141100', '石楼', 3, '0358', '032500', 'Shilou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141127', '岚县', '141100', '岚县', 3, '0358', '033500', 'Lanxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141128', '方山县', '141100', '方山', 3, '0358', '033100', 'Fangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141129', '中阳县', '141100', '中阳', 3, '0358', '033400', 'Zhongyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141130', '交口县', '141100', '交口', 3, '0358', '032400', 'Jiaokou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141181', '孝义市', '141100', '孝义', 3, '0358', '032300', 'Xiaoyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('141182', '汾阳市', '141100', '汾阳', 3, '0358', '032200', 'Fenyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150000', '内蒙古自治区', '100000', '内蒙古', 1, '', '', 'Inner Mongolia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150100', '呼和浩特市', '150000', '呼和浩特', 2, '0471', '010000', 'Hohhot', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150102', '新城区', '150100', '新城', 3, '0471', '010050', 'Xincheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150103', '回民区', '150100', '回民', 3, '0471', '010030', 'Huimin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150104', '玉泉区', '150100', '玉泉', 3, '0471', '010020', 'Yuquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150105', '赛罕区', '150100', '赛罕', 3, '0471', '010020', 'Saihan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150121', '土默特左旗', '150100', '土默特左旗', 3, '0471', '010100', 'Tumotezuoqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150122', '托克托县', '150100', '托克托', 3, '0471', '010200', 'Tuoketuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150123', '和林格尔县', '150100', '和林格尔', 3, '0471', '011500', 'Helingeer', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150124', '清水河县', '150100', '清水河', 3, '0471', '011600', 'Qingshuihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150125', '武川县', '150100', '武川', 3, '0471', '011700', 'Wuchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150200', '包头市', '150000', '包头', 2, '0472', '014025', 'Baotou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150202', '东河区', '150200', '东河', 3, '0472', '014040', 'Donghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150203', '昆都仑区', '150200', '昆都仑', 3, '0472', '014010', 'Kundulun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150204', '青山区', '150200', '青山', 3, '0472', '014030', 'Qingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150205', '石拐区', '150200', '石拐', 3, '0472', '014070', 'Shiguai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150206', '白云鄂博矿区', '150200', '白云鄂博矿区', 3, '0472', '014080', 'Baiyunebokuangqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150207', '九原区', '150200', '九原', 3, '0472', '014060', 'Jiuyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150221', '土默特右旗', '150200', '土默特右旗', 3, '0472', '014100', 'Tumoteyouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150222', '固阳县', '150200', '固阳', 3, '0472', '014200', 'Guyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '达茂旗', 3, '0472', '014500', 'Damaoqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150300', '乌海市', '150000', '乌海', 2, '0473', '016000', 'Wuhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150302', '海勃湾区', '150300', '海勃湾', 3, '0473', '016000', 'Haibowan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150303', '海南区', '150300', '海南', 3, '0473', '016030', 'Hainan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150304', '乌达区', '150300', '乌达', 3, '0473', '016040', 'Wuda', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150400', '赤峰市', '150000', '赤峰', 2, '0476', '024000', 'Chifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150402', '红山区', '150400', '红山', 3, '0476', '024020', 'Hongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150403', '元宝山区', '150400', '元宝山', 3, '0476', '024076', 'Yuanbaoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150404', '松山区', '150400', '松山', 3, '0476', '024005', 'Songshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150421', '阿鲁科尔沁旗', '150400', '阿鲁科尔沁旗', 3, '0476', '025550', 'Alukeerqinqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150422', '巴林左旗', '150400', '巴林左旗', 3, '0476', '025450', 'Balinzuoqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150423', '巴林右旗', '150400', '巴林右旗', 3, '0476', '025150', 'Balinyouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150424', '林西县', '150400', '林西', 3, '0476', '025250', 'Linxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150425', '克什克腾旗', '150400', '克什克腾旗', 3, '0476', '025350', 'Keshiketengqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150426', '翁牛特旗', '150400', '翁牛特旗', 3, '0476', '024500', 'Wengniuteqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150428', '喀喇沁旗', '150400', '喀喇沁旗', 3, '0476', '024400', 'Kalaqinqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150429', '宁城县', '150400', '宁城', 3, '0476', '024200', 'Ningcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150430', '敖汉旗', '150400', '敖汉旗', 3, '0476', '024300', 'Aohanqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150500', '通辽市', '150000', '通辽', 2, '0475', '028000', 'Tongliao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150502', '科尔沁区', '150500', '科尔沁', 3, '0475', '028000', 'Keerqin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150521', '科尔沁左翼中旗', '150500', '科尔沁左翼中旗', 3, '0475', '029300', 'Keerqinzuoyizhongqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150522', '科尔沁左翼后旗', '150500', '科尔沁左翼后旗', 3, '0475', '028100', 'Keerqinzuoyihouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150523', '开鲁县', '150500', '开鲁', 3, '0475', '028400', 'Kailu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150524', '库伦旗', '150500', '库伦旗', 3, '0475', '028200', 'Kulunqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150525', '奈曼旗', '150500', '奈曼旗', 3, '0475', '028300', 'Naimanqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150526', '扎鲁特旗', '150500', '扎鲁特旗', 3, '0475', '029100', 'Zhaluteqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150581', '霍林郭勒市', '150500', '霍林郭勒', 3, '0475', '029200', 'Huolinguole', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150600', '鄂尔多斯市', '150000', '鄂尔多斯', 2, '0477', '017004', 'Ordos', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150602', '东胜区', '150600', '东胜', 3, '0477', '017000', 'Dongsheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150621', '达拉特旗', '150600', '达拉特旗', 3, '0477', '014300', 'Dalateqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150622', '准格尔旗', '150600', '准格尔旗', 3, '0477', '017100', 'Zhungeerqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150623', '鄂托克前旗', '150600', '鄂托克前旗', 3, '0477', '016200', 'Etuokeqianqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150624', '鄂托克旗', '150600', '鄂托克旗', 3, '0477', '016100', 'Etuokeqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150625', '杭锦旗', '150600', '杭锦旗', 3, '0477', '017400', 'Hangjinqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150626', '乌审旗', '150600', '乌审旗', 3, '0477', '017300', 'Wushenqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150627', '伊金霍洛旗', '150600', '伊金霍洛旗', 3, '0477', '017200', 'Yijinhuoluoqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150700', '呼伦贝尔市', '150000', '呼伦贝尔', 2, '0470', '021008', 'Hulunber', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150702', '海拉尔区', '150700', '海拉尔', 3, '0470', '021000', 'Hailaer', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150703', '扎赉诺尔区', '150700', '扎赉诺尔', 3, '0470', '021410', 'Zhalainuoer', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150721', '阿荣旗', '150700', '阿荣旗', 3, '0470', '162750', 'Arongqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '莫旗', 3, '0470', '162850', 'Moqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150723', '鄂伦春自治旗', '150700', '鄂伦春', 3, '0470', '165450', 'Elunchun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150724', '鄂温克族自治旗', '150700', '鄂温', 3, '0470', '021100', 'Ewen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150725', '陈巴尔虎旗', '150700', '陈巴尔虎旗', 3, '0470', '021500', 'Chenbaerhuqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150726', '新巴尔虎左旗', '150700', '新巴尔虎左旗', 3, '0470', '021200', 'Xinbaerhuzuoqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150727', '新巴尔虎右旗', '150700', '新巴尔虎右旗', 3, '0470', '021300', 'Xinbaerhuyouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150781', '满洲里市', '150700', '满洲里', 3, '0470', '021400', 'Manzhouli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150782', '牙克石市', '150700', '牙克石', 3, '0470', '022150', 'Yakeshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150783', '扎兰屯市', '150700', '扎兰屯', 3, '0470', '162650', 'Zhalantun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150784', '额尔古纳市', '150700', '额尔古纳', 3, '0470', '022250', 'Eerguna', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150785', '根河市', '150700', '根河', 3, '0470', '022350', 'Genhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150800', '巴彦淖尔市', '150000', '巴彦淖尔', 2, '0478', '015001', 'Bayan Nur', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150802', '临河区', '150800', '临河', 3, '0478', '015001', 'Linhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150821', '五原县', '150800', '五原', 3, '0478', '015100', 'Wuyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150822', '磴口县', '150800', '磴口', 3, '0478', '015200', 'Dengkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150823', '乌拉特前旗', '150800', '乌拉特前旗', 3, '0478', '014400', 'Wulateqianqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150824', '乌拉特中旗', '150800', '乌拉特中旗', 3, '0478', '015300', 'Wulatezhongqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150825', '乌拉特后旗', '150800', '乌拉特后旗', 3, '0478', '015500', 'Wulatehouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150826', '杭锦后旗', '150800', '杭锦后旗', 3, '0478', '015400', 'Hangjinhouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150900', '乌兰察布市', '150000', '乌兰察布', 2, '0474', '012000', 'Ulanqab', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150902', '集宁区', '150900', '集宁', 3, '0474', '012000', 'Jining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150921', '卓资县', '150900', '卓资', 3, '0474', '012300', 'Zhuozi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150922', '化德县', '150900', '化德', 3, '0474', '013350', 'Huade', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150923', '商都县', '150900', '商都', 3, '0474', '013450', 'Shangdu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150924', '兴和县', '150900', '兴和', 3, '0474', '013650', 'Xinghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150925', '凉城县', '150900', '凉城', 3, '0474', '013750', 'Liangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150926', '察哈尔右翼前旗', '150900', '察右前旗', 3, '0474', '012200', 'Chayouqianqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150927', '察哈尔右翼中旗', '150900', '察右中旗', 3, '0474', '013550', 'Chayouzhongqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150928', '察哈尔右翼后旗', '150900', '察右后旗', 3, '0474', '012400', 'Chayouhouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150929', '四子王旗', '150900', '四子王旗', 3, '0474', '011800', 'Siziwangqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('150981', '丰镇市', '150900', '丰镇', 3, '0474', '012100', 'Fengzhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152200', '兴安盟', '150000', '兴安盟', 2, '0482', '137401', 'Hinggan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152201', '乌兰浩特市', '152200', '乌兰浩特', 3, '0482', '137401', 'Wulanhaote', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152202', '阿尔山市', '152200', '阿尔山', 3, '0482', '137800', 'Aershan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152221', '科尔沁右翼前旗', '152200', '科右前旗', 3, '0482', '137423', 'Keyouqianqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152222', '科尔沁右翼中旗', '152200', '科右中旗', 3, '0482', '029400', 'Keyouzhongqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152223', '扎赉特旗', '152200', '扎赉特旗', 3, '0482', '137600', 'Zhalaiteqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152224', '突泉县', '152200', '突泉', 3, '0482', '137500', 'Tuquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152500', '锡林郭勒盟', '150000', '锡林郭勒盟', 2, '0479', '026000', 'Xilin Gol', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152501', '二连浩特市', '152500', '二连浩特', 3, '0479', '011100', 'Erlianhaote', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152502', '锡林浩特市', '152500', '锡林浩特', 3, '0479', '026021', 'Xilinhaote', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152522', '阿巴嘎旗', '152500', '阿巴嘎旗', 3, '0479', '011400', 'Abagaqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152523', '苏尼特左旗', '152500', '苏尼特左旗', 3, '0479', '011300', 'Sunitezuoqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152524', '苏尼特右旗', '152500', '苏尼特右旗', 3, '0479', '011200', 'Suniteyouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152525', '东乌珠穆沁旗', '152500', '东乌旗', 3, '0479', '026300', 'Dongwuqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152526', '西乌珠穆沁旗', '152500', '西乌旗', 3, '0479', '026200', 'Xiwuqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152527', '太仆寺旗', '152500', '太仆寺旗', 3, '0479', '027000', 'Taipusiqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152528', '镶黄旗', '152500', '镶黄旗', 3, '0479', '013250', 'Xianghuangqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152529', '正镶白旗', '152500', '正镶白旗', 3, '0479', '013800', 'Zhengxiangbaiqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152530', '正蓝旗', '152500', '正蓝旗', 3, '0479', '027200', 'Zhenglanqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152531', '多伦县', '152500', '多伦', 3, '0479', '027300', 'Duolun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152900', '阿拉善盟', '150000', '阿拉善盟', 2, '0483', '750306', 'Alxa', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152921', '阿拉善左旗', '152900', '阿拉善左旗', 3, '0483', '750306', 'Alashanzuoqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152922', '阿拉善右旗', '152900', '阿拉善右旗', 3, '0483', '737300', 'Alashanyouqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('152923', '额济纳旗', '152900', '额济纳旗', 3, '0483', '735400', 'Ejinaqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210000', '辽宁省', '100000', '辽宁', 1, '', '', 'Liaoning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210100', '沈阳市', '210000', '沈阳', 2, '024', '110013', 'Shenyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210102', '和平区', '210100', '和平', 3, '024', '110001', 'Heping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210103', '沈河区', '210100', '沈河', 3, '024', '110011', 'Shenhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210104', '大东区', '210100', '大东', 3, '024', '110041', 'Dadong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210105', '皇姑区', '210100', '皇姑', 3, '024', '110031', 'Huanggu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210106', '铁西区', '210100', '铁西', 3, '024', '110021', 'Tiexi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210111', '苏家屯区', '210100', '苏家屯', 3, '024', '110101', 'Sujiatun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210112', '浑南区', '210100', '浑南', 3, '024', '110015', 'Hunnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210113', '沈北新区', '210100', '沈北新区', 3, '024', '110121', 'Shenbeixinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210114', '于洪区', '210100', '于洪', 3, '024', '110141', 'Yuhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210122', '辽中县', '210100', '辽中', 3, '024', '110200', 'Liaozhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210123', '康平县', '210100', '康平', 3, '024', '110500', 'Kangping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210124', '法库县', '210100', '法库', 3, '024', '110400', 'Faku', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210181', '新民市', '210100', '新民', 3, '024', '110300', 'Xinmin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210200', '大连市', '210000', '大连', 2, '0411', '116011', 'Dalian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210202', '中山区', '210200', '中山', 3, '0411', '116001', 'Zhongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210203', '西岗区', '210200', '西岗', 3, '0411', '116011', 'Xigang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210204', '沙河口区', '210200', '沙河口', 3, '0411', '116021', 'Shahekou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210211', '甘井子区', '210200', '甘井子', 3, '0411', '116033', 'Ganjingzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210212', '旅顺口区', '210200', '旅顺口', 3, '0411', '116041', 'Lvshunkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210213', '金州区', '210200', '金州', 3, '0411', '116100', 'Jinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210224', '长海县', '210200', '长海', 3, '0411', '116500', 'Changhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210281', '瓦房店市', '210200', '瓦房店', 3, '0411', '116300', 'Wafangdian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210282', '普兰店市', '210200', '普兰店', 3, '0411', '116200', 'Pulandian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210283', '庄河市', '210200', '庄河', 3, '0411', '116400', 'Zhuanghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210300', '鞍山市', '210000', '鞍山', 2, '0412', '114001', 'Anshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210302', '铁东区', '210300', '铁东', 3, '0412', '114001', 'Tiedong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210303', '铁西区', '210300', '铁西', 3, '0413', '114013', 'Tiexi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210304', '立山区', '210300', '立山', 3, '0414', '114031', 'Lishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210311', '千山区', '210300', '千山', 3, '0415', '114041', 'Qianshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210321', '台安县', '210300', '台安', 3, '0417', '114100', 'Taian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210323', '岫岩满族自治县', '210300', '岫岩', 3, '0418', '114300', 'Xiuyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210381', '海城市', '210300', '海城', 3, '0416', '114200', 'Haicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210400', '抚顺市', '210000', '抚顺', 2, '024', '113008', 'Fushun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210402', '新抚区', '210400', '新抚', 3, '024', '113008', 'Xinfu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210403', '东洲区', '210400', '东洲', 3, '024', '113003', 'Dongzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210404', '望花区', '210400', '望花', 3, '024', '113001', 'Wanghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210411', '顺城区', '210400', '顺城', 3, '024', '113006', 'Shuncheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210421', '抚顺县', '210400', '抚顺', 3, '024', '113006', 'Fushun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210422', '新宾满族自治县', '210400', '新宾', 3, '024', '113200', 'Xinbin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210423', '清原满族自治县', '210400', '清原', 3, '024', '113300', 'Qingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210500', '本溪市', '210000', '本溪', 2, '0414', '117000', 'Benxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210502', '平山区', '210500', '平山', 3, '0414', '117000', 'Pingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210503', '溪湖区', '210500', '溪湖', 3, '0414', '117002', 'Xihu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210504', '明山区', '210500', '明山', 3, '0414', '117021', 'Mingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210505', '南芬区', '210500', '南芬', 3, '0414', '117014', 'Nanfen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210521', '本溪满族自治县', '210500', '本溪', 3, '0414', '117100', 'Benxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210522', '桓仁满族自治县', '210500', '桓仁', 3, '0414', '117200', 'Huanren', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210600', '丹东市', '210000', '丹东', 2, '0415', '118000', 'Dandong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210602', '元宝区', '210600', '元宝', 3, '0415', '118000', 'Yuanbao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210603', '振兴区', '210600', '振兴', 3, '0415', '118002', 'Zhenxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210604', '振安区', '210600', '振安', 3, '0415', '118001', 'Zhenan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210624', '宽甸满族自治县', '210600', '宽甸', 3, '0415', '118200', 'Kuandian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210681', '东港市', '210600', '东港', 3, '0415', '118300', 'Donggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210682', '凤城市', '210600', '凤城', 3, '0415', '118100', 'Fengcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210700', '锦州市', '210000', '锦州', 2, '0416', '121000', 'Jinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210702', '古塔区', '210700', '古塔', 3, '0416', '121001', 'Guta', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210703', '凌河区', '210700', '凌河', 3, '0416', '121000', 'Linghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210711', '太和区', '210700', '太和', 3, '0416', '121011', 'Taihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210726', '黑山县', '210700', '黑山', 3, '0416', '121400', 'Heishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210727', '义县', '210700', '义县', 3, '0416', '121100', 'Yixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210781', '凌海市', '210700', '凌海', 3, '0416', '121200', 'Linghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210782', '北镇市', '210700', '北镇', 3, '0416', '121300', 'Beizhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210800', '营口市', '210000', '营口', 2, '0417', '115003', 'Yingkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210802', '站前区', '210800', '站前', 3, '0417', '115002', 'Zhanqian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210803', '西市区', '210800', '西市', 3, '0417', '115004', 'Xishi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210804', '鲅鱼圈区', '210800', '鲅鱼圈', 3, '0417', '115007', 'Bayuquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210811', '老边区', '210800', '老边', 3, '0417', '115005', 'Laobian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210881', '盖州市', '210800', '盖州', 3, '0417', '115200', 'Gaizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210882', '大石桥市', '210800', '大石桥', 3, '0417', '115100', 'Dashiqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210900', '阜新市', '210000', '阜新', 2, '0418', '123000', 'Fuxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210902', '海州区', '210900', '海州', 3, '0418', '123000', 'Haizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210903', '新邱区', '210900', '新邱', 3, '0418', '123005', 'Xinqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210904', '太平区', '210900', '太平', 3, '0418', '123003', 'Taiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210905', '清河门区', '210900', '清河门', 3, '0418', '123006', 'Qinghemen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210911', '细河区', '210900', '细河', 3, '0418', '123000', 'Xihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210921', '阜新蒙古族自治县', '210900', '阜新', 3, '0418', '123100', 'Fuxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('210922', '彰武县', '210900', '彰武', 3, '0418', '123200', 'Zhangwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211000', '辽阳市', '210000', '辽阳', 2, '0419', '111000', 'Liaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211002', '白塔区', '211000', '白塔', 3, '0419', '111000', 'Baita', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211003', '文圣区', '211000', '文圣', 3, '0419', '111000', 'Wensheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211004', '宏伟区', '211000', '宏伟', 3, '0419', '111003', 'Hongwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211005', '弓长岭区', '211000', '弓长岭', 3, '0419', '111008', 'Gongchangling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211011', '太子河区', '211000', '太子河', 3, '0419', '111000', 'Taizihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211021', '辽阳县', '211000', '辽阳', 3, '0419', '111200', 'Liaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211081', '灯塔市', '211000', '灯塔', 3, '0419', '111300', 'Dengta', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211100', '盘锦市', '210000', '盘锦', 2, '0427', '124010', 'Panjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211102', '双台子区', '211100', '双台子', 3, '0427', '124000', 'Shuangtaizi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211103', '兴隆台区', '211100', '兴隆台', 3, '0427', '124010', 'Xinglongtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211121', '大洼县', '211100', '大洼', 3, '0427', '124200', 'Dawa', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211122', '盘山县', '211100', '盘山', 3, '0427', '124000', 'Panshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211200', '铁岭市', '210000', '铁岭', 2, '024', '112000', 'Tieling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211202', '银州区', '211200', '银州', 3, '024', '112000', 'Yinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211204', '清河区', '211200', '清河', 3, '024', '112003', 'Qinghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211221', '铁岭县', '211200', '铁岭', 3, '024', '112000', 'Tieling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211223', '西丰县', '211200', '西丰', 3, '024', '112400', 'Xifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211224', '昌图县', '211200', '昌图', 3, '024', '112500', 'Changtu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211281', '调兵山市', '211200', '调兵山', 3, '024', '112700', 'Diaobingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211282', '开原市', '211200', '开原', 3, '024', '112300', 'Kaiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211300', '朝阳市', '210000', '朝阳', 2, '0421', '122000', 'Chaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211302', '双塔区', '211300', '双塔', 3, '0421', '122000', 'Shuangta', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211303', '龙城区', '211300', '龙城', 3, '0421', '122000', 'Longcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211321', '朝阳县', '211300', '朝阳', 3, '0421', '122000', 'Chaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211322', '建平县', '211300', '建平', 3, '0421', '122400', 'Jianping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '喀喇沁左翼', 3, '0421', '122300', 'Kalaqinzuoyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211381', '北票市', '211300', '北票', 3, '0421', '122100', 'Beipiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211382', '凌源市', '211300', '凌源', 3, '0421', '122500', 'Lingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211400', '葫芦岛市', '210000', '葫芦岛', 2, '0429', '125000', 'Huludao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211402', '连山区', '211400', '连山', 3, '0429', '125001', 'Lianshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211403', '龙港区', '211400', '龙港', 3, '0429', '125003', 'Longgang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211404', '南票区', '211400', '南票', 3, '0429', '125027', 'Nanpiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211421', '绥中县', '211400', '绥中', 3, '0429', '125200', 'Suizhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211422', '建昌县', '211400', '建昌', 3, '0429', '125300', 'Jianchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211481', '兴城市', '211400', '兴城', 3, '0429', '125100', 'Xingcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211500', '金普新区', '210000', '金普新区', 2, '0411', '116100', 'Jinpuxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211501', '金州新区', '211500', '金州新区', 3, '0411', '116100', 'Jinzhouxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211502', '普湾新区', '211500', '普湾新区', 3, '0411', '116200', 'Puwanxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('211503', '保税区', '211500', '保税区', 3, '0411', '116100', 'Baoshuiqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220000', '吉林省', '100000', '吉林', 1, '', '', 'Jilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220100', '长春市', '220000', '长春', 2, '0431', '130022', 'Changchun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220102', '南关区', '220100', '南关', 3, '0431', '130022', 'Nanguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220103', '宽城区', '220100', '宽城', 3, '0431', '130051', 'Kuancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220104', '朝阳区', '220100', '朝阳', 3, '0431', '130012', 'Chaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220105', '二道区', '220100', '二道', 3, '0431', '130031', 'Erdao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220106', '绿园区', '220100', '绿园', 3, '0431', '130062', 'Lvyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220112', '双阳区', '220100', '双阳', 3, '0431', '130600', 'Shuangyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220113', '九台区', '220100', '九台', 3, '0431', '130500', 'Jiutai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220122', '农安县', '220100', '农安', 3, '0431', '130200', 'Nongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220182', '榆树市', '220100', '榆树', 3, '0431', '130400', 'Yushu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220183', '德惠市', '220100', '德惠', 3, '0431', '130300', 'Dehui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220200', '吉林市', '220000', '吉林', 2, '0432', '132011', 'Jilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220202', '昌邑区', '220200', '昌邑', 3, '0432', '132002', 'Changyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220203', '龙潭区', '220200', '龙潭', 3, '0432', '132021', 'Longtan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220204', '船营区', '220200', '船营', 3, '0432', '132011', 'Chuanying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220211', '丰满区', '220200', '丰满', 3, '0432', '132013', 'Fengman', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220221', '永吉县', '220200', '永吉', 3, '0432', '132200', 'Yongji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220281', '蛟河市', '220200', '蛟河', 3, '0432', '132500', 'Jiaohe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220282', '桦甸市', '220200', '桦甸', 3, '0432', '132400', 'Huadian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220283', '舒兰市', '220200', '舒兰', 3, '0432', '132600', 'Shulan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220284', '磐石市', '220200', '磐石', 3, '0432', '132300', 'Panshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220300', '四平市', '220000', '四平', 2, '0434', '136000', 'Siping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220302', '铁西区', '220300', '铁西', 3, '0434', '136000', 'Tiexi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220303', '铁东区', '220300', '铁东', 3, '0434', '136001', 'Tiedong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220322', '梨树县', '220300', '梨树', 3, '0434', '136500', 'Lishu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220323', '伊通满族自治县', '220300', '伊通', 3, '0434', '130700', 'Yitong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220381', '公主岭市', '220300', '公主岭', 3, '0434', '136100', 'Gongzhuling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220382', '双辽市', '220300', '双辽', 3, '0434', '136400', 'Shuangliao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220400', '辽源市', '220000', '辽源', 2, '0437', '136200', 'Liaoyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220402', '龙山区', '220400', '龙山', 3, '0437', '136200', 'Longshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220403', '西安区', '220400', '西安', 3, '0437', '136201', 'Xian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220421', '东丰县', '220400', '东丰', 3, '0437', '136300', 'Dongfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220422', '东辽县', '220400', '东辽', 3, '0437', '136600', 'Dongliao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220500', '通化市', '220000', '通化', 2, '0435', '134001', 'Tonghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220502', '东昌区', '220500', '东昌', 3, '0435', '134001', 'Dongchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220503', '二道江区', '220500', '二道江', 3, '0435', '134003', 'Erdaojiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220521', '通化县', '220500', '通化', 3, '0435', '134100', 'Tonghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220523', '辉南县', '220500', '辉南', 3, '0435', '135100', 'Huinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220524', '柳河县', '220500', '柳河', 3, '0435', '135300', 'Liuhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220581', '梅河口市', '220500', '梅河口', 3, '0435', '135000', 'Meihekou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220582', '集安市', '220500', '集安', 3, '0435', '134200', 'Jian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220600', '白山市', '220000', '白山', 2, '0439', '134300', 'Baishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220602', '浑江区', '220600', '浑江', 3, '0439', '134300', 'Hunjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220605', '江源区', '220600', '江源', 3, '0439', '134700', 'Jiangyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220621', '抚松县', '220600', '抚松', 3, '0439', '134500', 'Fusong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220622', '靖宇县', '220600', '靖宇', 3, '0439', '135200', 'Jingyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220623', '长白朝鲜族自治县', '220600', '长白', 3, '0439', '134400', 'Changbai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220681', '临江市', '220600', '临江', 3, '0439', '134600', 'Linjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220700', '松原市', '220000', '松原', 2, '0438', '138000', 'Songyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220702', '宁江区', '220700', '宁江', 3, '0438', '138000', 'Ningjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '前郭尔罗斯', 3, '0438', '138000', 'Qianguoerluosi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220722', '长岭县', '220700', '长岭', 3, '0438', '131500', 'Changling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220723', '乾安县', '220700', '乾安', 3, '0438', '131400', 'Qianan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220781', '扶余市', '220700', '扶余', 3, '0438', '131200', 'Fuyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220800', '白城市', '220000', '白城', 2, '0436', '137000', 'Baicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220802', '洮北区', '220800', '洮北', 3, '0436', '137000', 'Taobei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220821', '镇赉县', '220800', '镇赉', 3, '0436', '137300', 'Zhenlai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220822', '通榆县', '220800', '通榆', 3, '0436', '137200', 'Tongyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220881', '洮南市', '220800', '洮南', 3, '0436', '137100', 'Taonan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('220882', '大安市', '220800', '大安', 3, '0436', '131300', 'Daan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222400', '延边朝鲜族自治州', '220000', '延边', 2, '0433', '133000', 'Yanbian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222401', '延吉市', '222400', '延吉', 3, '0433', '133000', 'Yanji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222402', '图们市', '222400', '图们', 3, '0433', '133100', 'Tumen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222403', '敦化市', '222400', '敦化', 3, '0433', '133700', 'Dunhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222404', '珲春市', '222400', '珲春', 3, '0433', '133300', 'Hunchun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222405', '龙井市', '222400', '龙井', 3, '0433', '133400', 'Longjing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222406', '和龙市', '222400', '和龙', 3, '0433', '133500', 'Helong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222424', '汪清县', '222400', '汪清', 3, '0433', '133200', 'Wangqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('222426', '安图县', '222400', '安图', 3, '0433', '133600', 'Antu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230000', '黑龙江省', '100000', '黑龙江', 1, '', '', 'Heilongjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230100', '哈尔滨市', '230000', '哈尔滨', 2, '0451', '150010', 'Harbin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230102', '道里区', '230100', '道里', 3, '0451', '150010', 'Daoli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230103', '南岗区', '230100', '南岗', 3, '0451', '150006', 'Nangang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230104', '道外区', '230100', '道外', 3, '0451', '150020', 'Daowai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230108', '平房区', '230100', '平房', 3, '0451', '150060', 'Pingfang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230109', '松北区', '230100', '松北', 3, '0451', '150028', 'Songbei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230110', '香坊区', '230100', '香坊', 3, '0451', '150036', 'Xiangfang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230111', '呼兰区', '230100', '呼兰', 3, '0451', '150500', 'Hulan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230112', '阿城区', '230100', '阿城', 3, '0451', '150300', 'Acheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230113', '双城区', '230100', '双城', 3, '0451', '150100', 'Shuangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230123', '依兰县', '230100', '依兰', 3, '0451', '154800', 'Yilan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230124', '方正县', '230100', '方正', 3, '0451', '150800', 'Fangzheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230125', '宾县', '230100', '宾县', 3, '0451', '150400', 'Binxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230126', '巴彦县', '230100', '巴彦', 3, '0451', '151800', 'Bayan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230127', '木兰县', '230100', '木兰', 3, '0451', '151900', 'Mulan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230128', '通河县', '230100', '通河', 3, '0451', '150900', 'Tonghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230129', '延寿县', '230100', '延寿', 3, '0451', '150700', 'Yanshou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230183', '尚志市', '230100', '尚志', 3, '0451', '150600', 'Shangzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230184', '五常市', '230100', '五常', 3, '0451', '150200', 'Wuchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230200', '齐齐哈尔市', '230000', '齐齐哈尔', 2, '0452', '161005', 'Qiqihar', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230202', '龙沙区', '230200', '龙沙', 3, '0452', '161000', 'Longsha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230203', '建华区', '230200', '建华', 3, '0452', '161006', 'Jianhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230204', '铁锋区', '230200', '铁锋', 3, '0452', '161000', 'Tiefeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230205', '昂昂溪区', '230200', '昂昂溪', 3, '0452', '161031', 'Angangxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230206', '富拉尔基区', '230200', '富拉尔基', 3, '0452', '161041', 'Fulaerji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230207', '碾子山区', '230200', '碾子山', 3, '0452', '161046', 'Nianzishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230208', '梅里斯达斡尔族区', '230200', '梅里斯', 3, '0452', '161021', 'Meilisi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230221', '龙江县', '230200', '龙江', 3, '0452', '161100', 'Longjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230223', '依安县', '230200', '依安', 3, '0452', '161500', 'Yian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230224', '泰来县', '230200', '泰来', 3, '0452', '162400', 'Tailai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230225', '甘南县', '230200', '甘南', 3, '0452', '162100', 'Gannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230227', '富裕县', '230200', '富裕', 3, '0452', '161200', 'Fuyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230229', '克山县', '230200', '克山', 3, '0452', '161600', 'Keshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230230', '克东县', '230200', '克东', 3, '0452', '164800', 'Kedong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230231', '拜泉县', '230200', '拜泉', 3, '0452', '164700', 'Baiquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230281', '讷河市', '230200', '讷河', 3, '0452', '161300', 'Nehe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230300', '鸡西市', '230000', '鸡西', 2, '0467', '158100', 'Jixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230302', '鸡冠区', '230300', '鸡冠', 3, '0467', '158100', 'Jiguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230303', '恒山区', '230300', '恒山', 3, '0467', '158130', 'Hengshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230304', '滴道区', '230300', '滴道', 3, '0467', '158150', 'Didao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230305', '梨树区', '230300', '梨树', 3, '0467', '158160', 'Lishu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230306', '城子河区', '230300', '城子河', 3, '0467', '158170', 'Chengzihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230307', '麻山区', '230300', '麻山', 3, '0467', '158180', 'Mashan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230321', '鸡东县', '230300', '鸡东', 3, '0467', '158200', 'Jidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230381', '虎林市', '230300', '虎林', 3, '0467', '158400', 'Hulin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230382', '密山市', '230300', '密山', 3, '0467', '158300', 'Mishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230400', '鹤岗市', '230000', '鹤岗', 2, '0468', '154100', 'Hegang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230402', '向阳区', '230400', '向阳', 3, '0468', '154100', 'Xiangyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230403', '工农区', '230400', '工农', 3, '0468', '154101', 'Gongnong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230404', '南山区', '230400', '南山', 3, '0468', '154104', 'Nanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230405', '兴安区', '230400', '兴安', 3, '0468', '154102', 'Xingan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230406', '东山区', '230400', '东山', 3, '0468', '154106', 'Dongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230407', '兴山区', '230400', '兴山', 3, '0468', '154105', 'Xingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230421', '萝北县', '230400', '萝北', 3, '0468', '154200', 'Luobei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230422', '绥滨县', '230400', '绥滨', 3, '0468', '156200', 'Suibin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230500', '双鸭山市', '230000', '双鸭山', 2, '0469', '155100', 'Shuangyashan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230502', '尖山区', '230500', '尖山', 3, '0469', '155100', 'Jianshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230503', '岭东区', '230500', '岭东', 3, '0469', '155120', 'Lingdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230505', '四方台区', '230500', '四方台', 3, '0469', '155130', 'Sifangtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230506', '宝山区', '230500', '宝山', 3, '0469', '155131', 'Baoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230521', '集贤县', '230500', '集贤', 3, '0469', '155900', 'Jixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230522', '友谊县', '230500', '友谊', 3, '0469', '155800', 'Youyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230523', '宝清县', '230500', '宝清', 3, '0469', '155600', 'Baoqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230524', '饶河县', '230500', '饶河', 3, '0469', '155700', 'Raohe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230600', '大庆市', '230000', '大庆', 2, '0459', '163000', 'Daqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230602', '萨尔图区', '230600', '萨尔图', 3, '0459', '163001', 'Saertu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230603', '龙凤区', '230600', '龙凤', 3, '0459', '163711', 'Longfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230604', '让胡路区', '230600', '让胡路', 3, '0459', '163712', 'Ranghulu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230605', '红岗区', '230600', '红岗', 3, '0459', '163511', 'Honggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230606', '大同区', '230600', '大同', 3, '0459', '163515', 'Datong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230621', '肇州县', '230600', '肇州', 3, '0459', '166400', 'Zhaozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230622', '肇源县', '230600', '肇源', 3, '0459', '166500', 'Zhaoyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230623', '林甸县', '230600', '林甸', 3, '0459', '166300', 'Lindian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '杜尔伯特', 3, '0459', '166200', 'Duerbote', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230700', '伊春市', '230000', '伊春', 2, '0458', '153000', 'Yichun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230702', '伊春区', '230700', '伊春', 3, '0458', '153000', 'Yichun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230703', '南岔区', '230700', '南岔', 3, '0458', '153100', 'Nancha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230704', '友好区', '230700', '友好', 3, '0458', '153031', 'Youhao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230705', '西林区', '230700', '西林', 3, '0458', '153025', 'Xilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230706', '翠峦区', '230700', '翠峦', 3, '0458', '153013', 'Cuiluan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230707', '新青区', '230700', '新青', 3, '0458', '153036', 'Xinqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230708', '美溪区', '230700', '美溪', 3, '0458', '153021', 'Meixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230709', '金山屯区', '230700', '金山屯', 3, '0458', '153026', 'Jinshantun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230710', '五营区', '230700', '五营', 3, '0458', '153033', 'Wuying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230711', '乌马河区', '230700', '乌马河', 3, '0458', '153011', 'Wumahe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230712', '汤旺河区', '230700', '汤旺河', 3, '0458', '153037', 'Tangwanghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230713', '带岭区', '230700', '带岭', 3, '0458', '153106', 'Dailing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230714', '乌伊岭区', '230700', '乌伊岭', 3, '0458', '153038', 'Wuyiling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230715', '红星区', '230700', '红星', 3, '0458', '153035', 'Hongxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230716', '上甘岭区', '230700', '上甘岭', 3, '0458', '153032', 'Shangganling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230722', '嘉荫县', '230700', '嘉荫', 3, '0458', '153200', 'Jiayin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230781', '铁力市', '230700', '铁力', 3, '0458', '152500', 'Tieli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230800', '佳木斯市', '230000', '佳木斯', 2, '0454', '154002', 'Jiamusi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230803', '向阳区', '230800', '向阳', 3, '0454', '154002', 'Xiangyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230804', '前进区', '230800', '前进', 3, '0454', '154002', 'Qianjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230805', '东风区', '230800', '东风', 3, '0454', '154005', 'Dongfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230811', '郊区', '230800', '郊区', 3, '0454', '154004', 'Jiaoqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230822', '桦南县', '230800', '桦南', 3, '0454', '154400', 'Huanan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230826', '桦川县', '230800', '桦川', 3, '0454', '154300', 'Huachuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230828', '汤原县', '230800', '汤原', 3, '0454', '154700', 'Tangyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230833', '抚远县', '230800', '抚远', 3, '0454', '156500', 'Fuyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230881', '同江市', '230800', '同江', 3, '0454', '156400', 'Tongjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230882', '富锦市', '230800', '富锦', 3, '0454', '156100', 'Fujin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230900', '七台河市', '230000', '七台河', 2, '0464', '154600', 'Qitaihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230902', '新兴区', '230900', '新兴', 3, '0464', '154604', 'Xinxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230903', '桃山区', '230900', '桃山', 3, '0464', '154600', 'Taoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230904', '茄子河区', '230900', '茄子河', 3, '0464', '154622', 'Qiezihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('230921', '勃利县', '230900', '勃利', 3, '0464', '154500', 'Boli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231000', '牡丹江市', '230000', '牡丹江', 2, '0453', '157000', 'Mudanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231002', '东安区', '231000', '东安', 3, '0453', '157000', 'Dongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231003', '阳明区', '231000', '阳明', 3, '0453', '157013', 'Yangming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231004', '爱民区', '231000', '爱民', 3, '0453', '157009', 'Aimin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231005', '西安区', '231000', '西安', 3, '0453', '157000', 'Xian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231024', '东宁县', '231000', '东宁', 3, '0453', '157200', 'Dongning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231025', '林口县', '231000', '林口', 3, '0453', '157600', 'Linkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231081', '绥芬河市', '231000', '绥芬河', 3, '0453', '157300', 'Suifenhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231083', '海林市', '231000', '海林', 3, '0453', '157100', 'Hailin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231084', '宁安市', '231000', '宁安', 3, '0453', '157400', 'Ningan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231085', '穆棱市', '231000', '穆棱', 3, '0453', '157500', 'Muling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231100', '黑河市', '230000', '黑河', 2, '0456', '164300', 'Heihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231102', '爱辉区', '231100', '爱辉', 3, '0456', '164300', 'Aihui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231121', '嫩江县', '231100', '嫩江', 3, '0456', '161400', 'Nenjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231123', '逊克县', '231100', '逊克', 3, '0456', '164400', 'Xunke', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231124', '孙吴县', '231100', '孙吴', 3, '0456', '164200', 'Sunwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231181', '北安市', '231100', '北安', 3, '0456', '164000', 'Beian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231182', '五大连池市', '231100', '五大连池', 3, '0456', '164100', 'Wudalianchi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231200', '绥化市', '230000', '绥化', 2, '0455', '152000', 'Suihua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231202', '北林区', '231200', '北林', 3, '0455', '152000', 'Beilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231221', '望奎县', '231200', '望奎', 3, '0455', '152100', 'Wangkui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231222', '兰西县', '231200', '兰西', 3, '0455', '151500', 'Lanxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231223', '青冈县', '231200', '青冈', 3, '0455', '151600', 'Qinggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231224', '庆安县', '231200', '庆安', 3, '0455', '152400', 'Qingan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231225', '明水县', '231200', '明水', 3, '0455', '151700', 'Mingshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231226', '绥棱县', '231200', '绥棱', 3, '0455', '152200', 'Suileng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231281', '安达市', '231200', '安达', 3, '0455', '151400', 'Anda', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231282', '肇东市', '231200', '肇东', 3, '0455', '151100', 'Zhaodong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('231283', '海伦市', '231200', '海伦', 3, '0455', '152300', 'Hailun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('232700', '大兴安岭地区', '230000', '大兴安岭', 2, '0457', '165000', 'DaXingAnLing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('232701', '加格达奇区', '232700', '加格达奇', 3, '0457', '165000', 'Jiagedaqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('232702', '新林区', '232700', '新林', 3, '0457', '165000', 'Xinlin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('232703', '松岭区', '232700', '松岭', 3, '0457', '165000', 'Songling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('232704', '呼中区', '232700', '呼中', 3, '0457', '165000', 'Huzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('232721', '呼玛县', '232700', '呼玛', 3, '0457', '165100', 'Huma', NULL, NULL);
INSERT INTO `tb_address` VALUES ('232722', '塔河县', '232700', '塔河', 3, '0457', '165200', 'Tahe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('232723', '漠河县', '232700', '漠河', 3, '0457', '165300', 'Mohe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310000', '上海', '100000', '上海', 1, '', '', 'Shanghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310100', '上海市', '310000', '上海', 2, '021', '200000', 'Shanghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310101', '黄浦区', '310100', '黄浦', 3, '021', '200001', 'Huangpu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310104', '徐汇区', '310100', '徐汇', 3, '021', '200030', 'Xuhui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310105', '长宁区', '310100', '长宁', 3, '021', '200050', 'Changning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310106', '静安区', '310100', '静安', 3, '021', '200040', 'Jingan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310107', '普陀区', '310100', '普陀', 3, '021', '200333', 'Putuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310108', '闸北区', '310100', '闸北', 3, '021', '200070', 'Zhabei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310109', '虹口区', '310100', '虹口', 3, '021', '200086', 'Hongkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310110', '杨浦区', '310100', '杨浦', 3, '021', '200082', 'Yangpu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310112', '闵行区', '310100', '闵行', 3, '021', '201100', 'Minhang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310113', '宝山区', '310100', '宝山', 3, '021', '201900', 'Baoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310114', '嘉定区', '310100', '嘉定', 3, '021', '201800', 'Jiading', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310115', '浦东新区', '310100', '浦东', 3, '021', '200135', 'Pudong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310116', '金山区', '310100', '金山', 3, '021', '200540', 'Jinshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310117', '松江区', '310100', '松江', 3, '021', '201600', 'Songjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310118', '青浦区', '310100', '青浦', 3, '021', '201700', 'Qingpu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310120', '奉贤区', '310100', '奉贤', 3, '021', '201400', 'Fengxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('310230', '崇明县', '310100', '崇明', 3, '021', '202150', 'Chongming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320000', '江苏省', '100000', '江苏', 1, '', '', 'Jiangsu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320100', '南京市', '320000', '南京', 2, '025', '210008', 'Nanjing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320102', '玄武区', '320100', '玄武', 3, '025', '210018', 'Xuanwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320104', '秦淮区', '320100', '秦淮', 3, '025', '210001', 'Qinhuai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320105', '建邺区', '320100', '建邺', 3, '025', '210004', 'Jianye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320106', '鼓楼区', '320100', '鼓楼', 3, '025', '210009', 'Gulou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320111', '浦口区', '320100', '浦口', 3, '025', '211800', 'Pukou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320113', '栖霞区', '320100', '栖霞', 3, '025', '210046', 'Qixia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320114', '雨花台区', '320100', '雨花台', 3, '025', '210012', 'Yuhuatai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320115', '江宁区', '320100', '江宁', 3, '025', '211100', 'Jiangning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320116', '六合区', '320100', '六合', 3, '025', '211500', 'Luhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320117', '溧水区', '320100', '溧水', 3, '025', '211200', 'Lishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320118', '高淳区', '320100', '高淳', 3, '025', '211300', 'Gaochun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320200', '无锡市', '320000', '无锡', 2, '0510', '214000', 'Wuxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320202', '崇安区', '320200', '崇安', 3, '0510', '214001', 'Chongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320203', '南长区', '320200', '南长', 3, '0510', '214021', 'Nanchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320204', '北塘区', '320200', '北塘', 3, '0510', '214044', 'Beitang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320205', '锡山区', '320200', '锡山', 3, '0510', '214101', 'Xishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320206', '惠山区', '320200', '惠山', 3, '0510', '214174', 'Huishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320211', '滨湖区', '320200', '滨湖', 3, '0510', '214123', 'Binhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320281', '江阴市', '320200', '江阴', 3, '0510', '214431', 'Jiangyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320282', '宜兴市', '320200', '宜兴', 3, '0510', '214200', 'Yixing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320300', '徐州市', '320000', '徐州', 2, '0516', '221003', 'Xuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320302', '鼓楼区', '320300', '鼓楼', 3, '0516', '221005', 'Gulou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320303', '云龙区', '320300', '云龙', 3, '0516', '221007', 'Yunlong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320305', '贾汪区', '320300', '贾汪', 3, '0516', '221003', 'Jiawang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320311', '泉山区', '320300', '泉山', 3, '0516', '221006', 'Quanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320312', '铜山区', '320300', '铜山', 3, '0516', '221106', 'Tongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320321', '丰县', '320300', '丰县', 3, '0516', '221700', 'Fengxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320322', '沛县', '320300', '沛县', 3, '0516', '221600', 'Peixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320324', '睢宁县', '320300', '睢宁', 3, '0516', '221200', 'Suining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320381', '新沂市', '320300', '新沂', 3, '0516', '221400', 'Xinyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320382', '邳州市', '320300', '邳州', 3, '0516', '221300', 'Pizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320400', '常州市', '320000', '常州', 2, '0519', '213000', 'Changzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320402', '天宁区', '320400', '天宁', 3, '0519', '213000', 'Tianning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320404', '钟楼区', '320400', '钟楼', 3, '0519', '213023', 'Zhonglou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320405', '戚墅堰区', '320400', '戚墅堰', 3, '0519', '213025', 'Qishuyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320411', '新北区', '320400', '新北', 3, '0519', '213022', 'Xinbei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320412', '武进区', '320400', '武进', 3, '0519', '213100', 'Wujin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320481', '溧阳市', '320400', '溧阳', 3, '0519', '213300', 'Liyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320482', '金坛市', '320400', '金坛', 3, '0519', '213200', 'Jintan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320500', '苏州市', '320000', '苏州', 2, '0512', '215002', 'Suzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320505', '虎丘区', '320500', '虎丘', 3, '0512', '215004', 'Huqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320506', '吴中区', '320500', '吴中', 3, '0512', '215128', 'Wuzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320507', '相城区', '320500', '相城', 3, '0512', '215131', 'Xiangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320508', '姑苏区', '320500', '姑苏', 3, '0512', '215031', 'Gusu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320509', '吴江区', '320500', '吴江', 3, '0512', '215200', 'Wujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320581', '常熟市', '320500', '常熟', 3, '0512', '215500', 'Changshu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320582', '张家港市', '320500', '张家港', 3, '0512', '215600', 'Zhangjiagang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320583', '昆山市', '320500', '昆山', 3, '0512', '215300', 'Kunshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320585', '太仓市', '320500', '太仓', 3, '0512', '215400', 'Taicang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320600', '南通市', '320000', '南通', 2, '0513', '226001', 'Nantong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320602', '崇川区', '320600', '崇川', 3, '0513', '226001', 'Chongchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320611', '港闸区', '320600', '港闸', 3, '0513', '226001', 'Gangzha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320612', '通州区', '320600', '通州', 3, '0513', '226300', 'Tongzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320621', '海安县', '320600', '海安', 3, '0513', '226600', 'Haian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320623', '如东县', '320600', '如东', 3, '0513', '226400', 'Rudong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320681', '启东市', '320600', '启东', 3, '0513', '226200', 'Qidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320682', '如皋市', '320600', '如皋', 3, '0513', '226500', 'Rugao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320684', '海门市', '320600', '海门', 3, '0513', '226100', 'Haimen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320700', '连云港市', '320000', '连云港', 2, '0518', '222002', 'Lianyungang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320703', '连云区', '320700', '连云', 3, '0518', '222042', 'Lianyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320706', '海州区', '320700', '海州', 3, '0518', '222003', 'Haizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320707', '赣榆区', '320700', '赣榆', 3, '0518', '222100', 'Ganyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320722', '东海县', '320700', '东海', 3, '0518', '222300', 'Donghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320723', '灌云县', '320700', '灌云', 3, '0518', '222200', 'Guanyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320724', '灌南县', '320700', '灌南', 3, '0518', '222500', 'Guannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320800', '淮安市', '320000', '淮安', 2, '0517', '223001', 'Huaian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320802', '清河区', '320800', '清河', 3, '0517', '223001', 'Qinghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320803', '淮安区', '320800', '淮安', 3, '0517', '223200', 'Huaian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320804', '淮阴区', '320800', '淮阴', 3, '0517', '223300', 'Huaiyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320811', '清浦区', '320800', '清浦', 3, '0517', '223002', 'Qingpu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320826', '涟水县', '320800', '涟水', 3, '0517', '223400', 'Lianshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320829', '洪泽县', '320800', '洪泽', 3, '0517', '223100', 'Hongze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320830', '盱眙县', '320800', '盱眙', 3, '0517', '211700', 'Xuyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320831', '金湖县', '320800', '金湖', 3, '0517', '211600', 'Jinhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320900', '盐城市', '320000', '盐城', 2, '0515', '224005', 'Yancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320902', '亭湖区', '320900', '亭湖', 3, '0515', '224005', 'Tinghu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320903', '盐都区', '320900', '盐都', 3, '0515', '224055', 'Yandu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320921', '响水县', '320900', '响水', 3, '0515', '224600', 'Xiangshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320922', '滨海县', '320900', '滨海', 3, '0515', '224500', 'Binhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320923', '阜宁县', '320900', '阜宁', 3, '0515', '224400', 'Funing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320924', '射阳县', '320900', '射阳', 3, '0515', '224300', 'Sheyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320925', '建湖县', '320900', '建湖', 3, '0515', '224700', 'Jianhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320981', '东台市', '320900', '东台', 3, '0515', '224200', 'Dongtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('320982', '大丰市', '320900', '大丰', 3, '0515', '224100', 'Dafeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321000', '扬州市', '320000', '扬州', 2, '0514', '225002', 'Yangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321002', '广陵区', '321000', '广陵', 3, '0514', '225002', 'Guangling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321003', '邗江区', '321000', '邗江', 3, '0514', '225002', 'Hanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321012', '江都区', '321000', '江都', 3, '0514', '225200', 'Jiangdu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321023', '宝应县', '321000', '宝应', 3, '0514', '225800', 'Baoying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321081', '仪征市', '321000', '仪征', 3, '0514', '211400', 'Yizheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321084', '高邮市', '321000', '高邮', 3, '0514', '225600', 'Gaoyou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321100', '镇江市', '320000', '镇江', 2, '0511', '212004', 'Zhenjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321102', '京口区', '321100', '京口', 3, '0511', '212003', 'Jingkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321111', '润州区', '321100', '润州', 3, '0511', '212005', 'Runzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321112', '丹徒区', '321100', '丹徒', 3, '0511', '212028', 'Dantu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321181', '丹阳市', '321100', '丹阳', 3, '0511', '212300', 'Danyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321182', '扬中市', '321100', '扬中', 3, '0511', '212200', 'Yangzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321183', '句容市', '321100', '句容', 3, '0511', '212400', 'Jurong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321200', '泰州市', '320000', '泰州', 2, '0523', '225300', 'Taizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321202', '海陵区', '321200', '海陵', 3, '0523', '225300', 'Hailing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321203', '高港区', '321200', '高港', 3, '0523', '225321', 'Gaogang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321204', '姜堰区', '321200', '姜堰', 3, '0523', '225500', 'Jiangyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321281', '兴化市', '321200', '兴化', 3, '0523', '225700', 'Xinghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321282', '靖江市', '321200', '靖江', 3, '0523', '214500', 'Jingjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321283', '泰兴市', '321200', '泰兴', 3, '0523', '225400', 'Taixing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321300', '宿迁市', '320000', '宿迁', 2, '0527', '223800', 'Suqian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321302', '宿城区', '321300', '宿城', 3, '0527', '223800', 'Sucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321311', '宿豫区', '321300', '宿豫', 3, '0527', '223800', 'Suyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321322', '沭阳县', '321300', '沭阳', 3, '0527', '223600', 'Shuyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321323', '泗阳县', '321300', '泗阳', 3, '0527', '223700', 'Siyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('321324', '泗洪县', '321300', '泗洪', 3, '0527', '223900', 'Sihong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330000', '浙江省', '100000', '浙江', 1, '', '', 'Zhejiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330100', '杭州市', '330000', '杭州', 2, '0571', '310026', 'Hangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330102', '上城区', '330100', '上城', 3, '0571', '310002', 'Shangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330103', '下城区', '330100', '下城', 3, '0571', '310006', 'Xiacheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330104', '江干区', '330100', '江干', 3, '0571', '310016', 'Jianggan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330105', '拱墅区', '330100', '拱墅', 3, '0571', '310011', 'Gongshu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330106', '西湖区', '330100', '西湖', 3, '0571', '310013', 'Xihu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330108', '滨江区', '330100', '滨江', 3, '0571', '310051', 'Binjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330109', '萧山区', '330100', '萧山', 3, '0571', '311200', 'Xiaoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330110', '余杭区', '330100', '余杭', 3, '0571', '311100', 'Yuhang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330122', '桐庐县', '330100', '桐庐', 3, '0571', '311500', 'Tonglu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330127', '淳安县', '330100', '淳安', 3, '0571', '311700', 'Chunan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330182', '建德市', '330100', '建德', 3, '0571', '311600', 'Jiande', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330183', '富阳区', '330100', '富阳', 3, '0571', '311400', 'Fuyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330185', '临安市', '330100', '临安', 3, '0571', '311300', 'Linan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330200', '宁波市', '330000', '宁波', 2, '0574', '315000', 'Ningbo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330203', '海曙区', '330200', '海曙', 3, '0574', '315000', 'Haishu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330204', '江东区', '330200', '江东', 3, '0574', '315040', 'Jiangdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330205', '江北区', '330200', '江北', 3, '0574', '315020', 'Jiangbei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330206', '北仑区', '330200', '北仑', 3, '0574', '315800', 'Beilun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330211', '镇海区', '330200', '镇海', 3, '0574', '315200', 'Zhenhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330212', '鄞州区', '330200', '鄞州', 3, '0574', '315100', 'Yinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330225', '象山县', '330200', '象山', 3, '0574', '315700', 'Xiangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330226', '宁海县', '330200', '宁海', 3, '0574', '315600', 'Ninghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330281', '余姚市', '330200', '余姚', 3, '0574', '315400', 'Yuyao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330282', '慈溪市', '330200', '慈溪', 3, '0574', '315300', 'Cixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330283', '奉化市', '330200', '奉化', 3, '0574', '315500', 'Fenghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330300', '温州市', '330000', '温州', 2, '0577', '325000', 'Wenzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330302', '鹿城区', '330300', '鹿城', 3, '0577', '325000', 'Lucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330303', '龙湾区', '330300', '龙湾', 3, '0577', '325013', 'Longwan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330304', '瓯海区', '330300', '瓯海', 3, '0577', '325005', 'Ouhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330322', '洞头县', '330300', '洞头', 3, '0577', '325700', 'Dongtou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330324', '永嘉县', '330300', '永嘉', 3, '0577', '325100', 'Yongjia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330326', '平阳县', '330300', '平阳', 3, '0577', '325400', 'Pingyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330327', '苍南县', '330300', '苍南', 3, '0577', '325800', 'Cangnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330328', '文成县', '330300', '文成', 3, '0577', '325300', 'Wencheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330329', '泰顺县', '330300', '泰顺', 3, '0577', '325500', 'Taishun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330381', '瑞安市', '330300', '瑞安', 3, '0577', '325200', 'Ruian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330382', '乐清市', '330300', '乐清', 3, '0577', '325600', 'Yueqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330400', '嘉兴市', '330000', '嘉兴', 2, '0573', '314000', 'Jiaxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330402', '南湖区', '330400', '南湖', 3, '0573', '314051', 'Nanhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330411', '秀洲区', '330400', '秀洲', 3, '0573', '314031', 'Xiuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330421', '嘉善县', '330400', '嘉善', 3, '0573', '314100', 'Jiashan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330424', '海盐县', '330400', '海盐', 3, '0573', '314300', 'Haiyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330481', '海宁市', '330400', '海宁', 3, '0573', '314400', 'Haining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330482', '平湖市', '330400', '平湖', 3, '0573', '314200', 'Pinghu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330483', '桐乡市', '330400', '桐乡', 3, '0573', '314500', 'Tongxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330500', '湖州市', '330000', '湖州', 2, '0572', '313000', 'Huzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330502', '吴兴区', '330500', '吴兴', 3, '0572', '313000', 'Wuxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330503', '南浔区', '330500', '南浔', 3, '0572', '313009', 'Nanxun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330521', '德清县', '330500', '德清', 3, '0572', '313200', 'Deqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330522', '长兴县', '330500', '长兴', 3, '0572', '313100', 'Changxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330523', '安吉县', '330500', '安吉', 3, '0572', '313300', 'Anji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330600', '绍兴市', '330000', '绍兴', 2, '0575', '312000', 'Shaoxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330602', '越城区', '330600', '越城', 3, '0575', '312000', 'Yuecheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330603', '柯桥区', '330600', '柯桥', 3, '0575', '312030', 'Keqiao ', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330604', '上虞区', '330600', '上虞', 3, '0575', '312300', 'Shangyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330624', '新昌县', '330600', '新昌', 3, '0575', '312500', 'Xinchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330681', '诸暨市', '330600', '诸暨', 3, '0575', '311800', 'Zhuji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330683', '嵊州市', '330600', '嵊州', 3, '0575', '312400', 'Shengzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330700', '金华市', '330000', '金华', 2, '0579', '321000', 'Jinhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330702', '婺城区', '330700', '婺城', 3, '0579', '321000', 'Wucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330703', '金东区', '330700', '金东', 3, '0579', '321000', 'Jindong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330723', '武义县', '330700', '武义', 3, '0579', '321200', 'Wuyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330726', '浦江县', '330700', '浦江', 3, '0579', '322200', 'Pujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330727', '磐安县', '330700', '磐安', 3, '0579', '322300', 'Panan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330781', '兰溪市', '330700', '兰溪', 3, '0579', '321100', 'Lanxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330782', '义乌市', '330700', '义乌', 3, '0579', '322000', 'Yiwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330783', '东阳市', '330700', '东阳', 3, '0579', '322100', 'Dongyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330784', '永康市', '330700', '永康', 3, '0579', '321300', 'Yongkang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330800', '衢州市', '330000', '衢州', 2, '0570', '324002', 'Quzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330802', '柯城区', '330800', '柯城', 3, '0570', '324100', 'Kecheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330803', '衢江区', '330800', '衢江', 3, '0570', '324022', 'Qujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330822', '常山县', '330800', '常山', 3, '0570', '324200', 'Changshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330824', '开化县', '330800', '开化', 3, '0570', '324300', 'Kaihua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330825', '龙游县', '330800', '龙游', 3, '0570', '324400', 'Longyou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330881', '江山市', '330800', '江山', 3, '0570', '324100', 'Jiangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330900', '舟山市', '330000', '舟山', 2, '0580', '316000', 'Zhoushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330902', '定海区', '330900', '定海', 3, '0580', '316000', 'Dinghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330903', '普陀区', '330900', '普陀', 3, '0580', '316100', 'Putuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330921', '岱山县', '330900', '岱山', 3, '0580', '316200', 'Daishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('330922', '嵊泗县', '330900', '嵊泗', 3, '0580', '202450', 'Shengsi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331000', '台州市', '330000', '台州', 2, '0576', '318000', 'Taizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331002', '椒江区', '331000', '椒江', 3, '0576', '318000', 'Jiaojiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331003', '黄岩区', '331000', '黄岩', 3, '0576', '318020', 'Huangyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331004', '路桥区', '331000', '路桥', 3, '0576', '318050', 'Luqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331021', '玉环县', '331000', '玉环', 3, '0576', '317600', 'Yuhuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331022', '三门县', '331000', '三门', 3, '0576', '317100', 'Sanmen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331023', '天台县', '331000', '天台', 3, '0576', '317200', 'Tiantai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331024', '仙居县', '331000', '仙居', 3, '0576', '317300', 'Xianju', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331081', '温岭市', '331000', '温岭', 3, '0576', '317500', 'Wenling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331082', '临海市', '331000', '临海', 3, '0576', '317000', 'Linhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331100', '丽水市', '330000', '丽水', 2, '0578', '323000', 'Lishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331102', '莲都区', '331100', '莲都', 3, '0578', '323000', 'Liandu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331121', '青田县', '331100', '青田', 3, '0578', '323900', 'Qingtian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331122', '缙云县', '331100', '缙云', 3, '0578', '321400', 'Jinyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331123', '遂昌县', '331100', '遂昌', 3, '0578', '323300', 'Suichang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331124', '松阳县', '331100', '松阳', 3, '0578', '323400', 'Songyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331125', '云和县', '331100', '云和', 3, '0578', '323600', 'Yunhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331126', '庆元县', '331100', '庆元', 3, '0578', '323800', 'Qingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331127', '景宁畲族自治县', '331100', '景宁', 3, '0578', '323500', 'Jingning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331181', '龙泉市', '331100', '龙泉', 3, '0578', '323700', 'Longquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331200', '舟山群岛新区', '330000', '舟山新区', 2, '0580', '316000', 'Zhoushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331201', '金塘岛', '331200', '金塘', 3, '0580', '316000', 'Jintang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331202', '六横岛', '331200', '六横', 3, '0580', '316000', 'Liuheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331203', '衢山岛', '331200', '衢山', 3, '0580', '316000', 'Qushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331204', '舟山本岛西北部', '331200', '舟山', 3, '0580', '316000', 'Zhoushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331205', '岱山岛西南部', '331200', '岱山', 3, '0580', '316000', 'Daishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331206', '泗礁岛', '331200', '泗礁', 3, '0580', '316000', 'Sijiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331207', '朱家尖岛', '331200', '朱家尖', 3, '0580', '316000', 'Zhujiajian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331208', '洋山岛', '331200', '洋山', 3, '0580', '316000', 'Yangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331209', '长涂岛', '331200', '长涂', 3, '0580', '316000', 'Changtu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('331210', '虾峙岛', '331200', '虾峙', 3, '0580', '316000', 'Xiazhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340000', '安徽省', '100000', '安徽', 1, '', '', 'Anhui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340100', '合肥市', '340000', '合肥', 2, '0551', '230001', 'Hefei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340102', '瑶海区', '340100', '瑶海', 3, '0551', '230011', 'Yaohai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340103', '庐阳区', '340100', '庐阳', 3, '0551', '230001', 'Luyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340104', '蜀山区', '340100', '蜀山', 3, '0551', '230031', 'Shushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340111', '包河区', '340100', '包河', 3, '0551', '230041', 'Baohe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340121', '长丰县', '340100', '长丰', 3, '0551', '231100', 'Changfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340122', '肥东县', '340100', '肥东', 3, '0551', '231600', 'Feidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340123', '肥西县', '340100', '肥西', 3, '0551', '231200', 'Feixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340124', '庐江县', '340100', '庐江', 3, '0565', '231500', 'Lujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340181', '巢湖市', '340100', '巢湖', 3, '0565', '238000', 'Chaohu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340200', '芜湖市', '340000', '芜湖', 2, '0551', '241000', 'Wuhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340202', '镜湖区', '340200', '镜湖', 3, '0553', '241000', 'Jinghu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340203', '弋江区', '340200', '弋江', 3, '0553', '241000', 'Yijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340207', '鸠江区', '340200', '鸠江', 3, '0553', '241000', 'Jiujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340208', '三山区', '340200', '三山', 3, '0553', '241000', 'Sanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340221', '芜湖县', '340200', '芜湖', 3, '0553', '241100', 'Wuhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340222', '繁昌县', '340200', '繁昌', 3, '0553', '241200', 'Fanchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340223', '南陵县', '340200', '南陵', 3, '0553', '242400', 'Nanling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340225', '无为县', '340200', '无为', 3, '0565', '238300', 'Wuwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340300', '蚌埠市', '340000', '蚌埠', 2, '0552', '233000', 'Bengbu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340302', '龙子湖区', '340300', '龙子湖', 3, '0552', '233000', 'Longzihu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340303', '蚌山区', '340300', '蚌山', 3, '0552', '233000', 'Bengshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340304', '禹会区', '340300', '禹会', 3, '0552', '233010', 'Yuhui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340311', '淮上区', '340300', '淮上', 3, '0552', '233002', 'Huaishang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340321', '怀远县', '340300', '怀远', 3, '0552', '233400', 'Huaiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340322', '五河县', '340300', '五河', 3, '0552', '233300', 'Wuhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340323', '固镇县', '340300', '固镇', 3, '0552', '233700', 'Guzhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340400', '淮南市', '340000', '淮南', 2, '0554', '232001', 'Huainan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340402', '大通区', '340400', '大通', 3, '0554', '232033', 'Datong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340403', '田家庵区', '340400', '田家庵', 3, '0554', '232000', 'Tianjiaan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340404', '谢家集区', '340400', '谢家集', 3, '0554', '232052', 'Xiejiaji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340405', '八公山区', '340400', '八公山', 3, '0554', '232072', 'Bagongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340406', '潘集区', '340400', '潘集', 3, '0554', '232082', 'Panji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340421', '凤台县', '340400', '凤台', 3, '0554', '232100', 'Fengtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340500', '马鞍山市', '340000', '马鞍山', 2, '0555', '243001', 'Maanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340503', '花山区', '340500', '花山', 3, '0555', '243000', 'Huashan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340504', '雨山区', '340500', '雨山', 3, '0555', '243071', 'Yushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340506', '博望区', '340500', '博望', 3, '0555', '243131', 'Bowang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340521', '当涂县', '340500', '当涂', 3, '0555', '243100', 'Dangtu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340522', '含山县', '340500', '含山', 3, '0555', '238100', 'Hanshan ', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340523', '和县', '340500', '和县', 3, '0555', '238200', 'Hexian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340600', '淮北市', '340000', '淮北', 2, '0561', '235000', 'Huaibei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340602', '杜集区', '340600', '杜集', 3, '0561', '235000', 'Duji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340603', '相山区', '340600', '相山', 3, '0561', '235000', 'Xiangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340604', '烈山区', '340600', '烈山', 3, '0561', '235000', 'Lieshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340621', '濉溪县', '340600', '濉溪', 3, '0561', '235100', 'Suixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340700', '铜陵市', '340000', '铜陵', 2, '0562', '244000', 'Tongling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340702', '铜官山区', '340700', '铜官山', 3, '0562', '244000', 'Tongguanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340703', '狮子山区', '340700', '狮子山', 3, '0562', '244000', 'Shizishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340711', '郊区', '340700', '郊区', 3, '0562', '244000', 'Jiaoqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340721', '铜陵县', '340700', '铜陵', 3, '0562', '244100', 'Tongling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340800', '安庆市', '340000', '安庆', 2, '0556', '246001', 'Anqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340802', '迎江区', '340800', '迎江', 3, '0556', '246001', 'Yingjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340803', '大观区', '340800', '大观', 3, '0556', '246002', 'Daguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340811', '宜秀区', '340800', '宜秀', 3, '0556', '246003', 'Yixiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340822', '怀宁县', '340800', '怀宁', 3, '0556', '246100', 'Huaining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340823', '枞阳县', '340800', '枞阳', 3, '0556', '246700', 'Zongyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340824', '潜山县', '340800', '潜山', 3, '0556', '246300', 'Qianshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340825', '太湖县', '340800', '太湖', 3, '0556', '246400', 'Taihu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340826', '宿松县', '340800', '宿松', 3, '0556', '246500', 'Susong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340827', '望江县', '340800', '望江', 3, '0556', '246200', 'Wangjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340828', '岳西县', '340800', '岳西', 3, '0556', '246600', 'Yuexi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('340881', '桐城市', '340800', '桐城', 3, '0556', '231400', 'Tongcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341000', '黄山市', '340000', '黄山', 2, '0559', '245000', 'Huangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341002', '屯溪区', '341000', '屯溪', 3, '0559', '245000', 'Tunxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341003', '黄山区', '341000', '黄山', 3, '0559', '242700', 'Huangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341004', '徽州区', '341000', '徽州', 3, '0559', '245061', 'Huizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341021', '歙县', '341000', '歙县', 3, '0559', '245200', 'Shexian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341022', '休宁县', '341000', '休宁', 3, '0559', '245400', 'Xiuning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341023', '黟县', '341000', '黟县', 3, '0559', '245500', 'Yixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341024', '祁门县', '341000', '祁门', 3, '0559', '245600', 'Qimen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341100', '滁州市', '340000', '滁州', 2, '0550', '239000', 'Chuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341102', '琅琊区', '341100', '琅琊', 3, '0550', '239000', 'Langya', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341103', '南谯区', '341100', '南谯', 3, '0550', '239000', 'Nanqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341122', '来安县', '341100', '来安', 3, '0550', '239200', 'Laian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341124', '全椒县', '341100', '全椒', 3, '0550', '239500', 'Quanjiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341125', '定远县', '341100', '定远', 3, '0550', '233200', 'Dingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341126', '凤阳县', '341100', '凤阳', 3, '0550', '233100', 'Fengyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341181', '天长市', '341100', '天长', 3, '0550', '239300', 'Tianchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341182', '明光市', '341100', '明光', 3, '0550', '239400', 'Mingguang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341200', '阜阳市', '340000', '阜阳', 2, '0558', '236033', 'Fuyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341202', '颍州区', '341200', '颍州', 3, '0558', '236001', 'Yingzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341203', '颍东区', '341200', '颍东', 3, '0558', '236058', 'Yingdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341204', '颍泉区', '341200', '颍泉', 3, '0558', '236045', 'Yingquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341221', '临泉县', '341200', '临泉', 3, '0558', '236400', 'Linquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341222', '太和县', '341200', '太和', 3, '0558', '236600', 'Taihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341225', '阜南县', '341200', '阜南', 3, '0558', '236300', 'Funan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341226', '颍上县', '341200', '颍上', 3, '0558', '236200', 'Yingshang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341282', '界首市', '341200', '界首', 3, '0558', '236500', 'Jieshou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341300', '宿州市', '340000', '宿州', 2, '0557', '234000', 'Suzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341302', '埇桥区', '341300', '埇桥', 3, '0557', '234000', 'Yongqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341321', '砀山县', '341300', '砀山', 3, '0557', '235300', 'Dangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341322', '萧县', '341300', '萧县', 3, '0557', '235200', 'Xiaoxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341323', '灵璧县', '341300', '灵璧', 3, '0557', '234200', 'Lingbi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341324', '泗县', '341300', '泗县', 3, '0557', '234300', 'Sixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341500', '六安市', '340000', '六安', 2, '0564', '237000', 'Luan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341502', '金安区', '341500', '金安', 3, '0564', '237005', 'Jinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341503', '裕安区', '341500', '裕安', 3, '0564', '237010', 'Yuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341521', '寿县', '341500', '寿县', 3, '0564', '232200', 'Shouxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341522', '霍邱县', '341500', '霍邱', 3, '0564', '237400', 'Huoqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341523', '舒城县', '341500', '舒城', 3, '0564', '231300', 'Shucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341524', '金寨县', '341500', '金寨', 3, '0564', '237300', 'Jinzhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341525', '霍山县', '341500', '霍山', 3, '0564', '237200', 'Huoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341600', '亳州市', '340000', '亳州', 2, '0558', '236802', 'Bozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341602', '谯城区', '341600', '谯城', 3, '0558', '236800', 'Qiaocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341621', '涡阳县', '341600', '涡阳', 3, '0558', '233600', 'Guoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341622', '蒙城县', '341600', '蒙城', 3, '0558', '233500', 'Mengcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341623', '利辛县', '341600', '利辛', 3, '0558', '236700', 'Lixin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341700', '池州市', '340000', '池州', 2, '0566', '247100', 'Chizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341702', '贵池区', '341700', '贵池', 3, '0566', '247100', 'Guichi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341721', '东至县', '341700', '东至', 3, '0566', '247200', 'Dongzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341722', '石台县', '341700', '石台', 3, '0566', '245100', 'Shitai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341723', '青阳县', '341700', '青阳', 3, '0566', '242800', 'Qingyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341800', '宣城市', '340000', '宣城', 2, '0563', '242000', 'Xuancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341802', '宣州区', '341800', '宣州', 3, '0563', '242000', 'Xuanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341821', '郎溪县', '341800', '郎溪', 3, '0563', '242100', 'Langxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341822', '广德县', '341800', '广德', 3, '0563', '242200', 'Guangde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341823', '泾县', '341800', '泾县', 3, '0563', '242500', 'Jingxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341824', '绩溪县', '341800', '绩溪', 3, '0563', '245300', 'Jixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341825', '旌德县', '341800', '旌德', 3, '0563', '242600', 'Jingde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('341881', '宁国市', '341800', '宁国', 3, '0563', '242300', 'Ningguo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350000', '福建省', '100000', '福建', 1, '', '', 'Fujian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350100', '福州市', '350000', '福州', 2, '0591', '350001', 'Fuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350102', '鼓楼区', '350100', '鼓楼', 3, '0591', '350001', 'Gulou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350103', '台江区', '350100', '台江', 3, '0591', '350004', 'Taijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350104', '仓山区', '350100', '仓山', 3, '0591', '350007', 'Cangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350105', '马尾区', '350100', '马尾', 3, '0591', '350015', 'Mawei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350111', '晋安区', '350100', '晋安', 3, '0591', '350011', 'Jinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350121', '闽侯县', '350100', '闽侯', 3, '0591', '350100', 'Minhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350122', '连江县', '350100', '连江', 3, '0591', '350500', 'Lianjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350123', '罗源县', '350100', '罗源', 3, '0591', '350600', 'Luoyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350124', '闽清县', '350100', '闽清', 3, '0591', '350800', 'Minqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350125', '永泰县', '350100', '永泰', 3, '0591', '350700', 'Yongtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350128', '平潭县', '350100', '平潭', 3, '0591', '350400', 'Pingtan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350181', '福清市', '350100', '福清', 3, '0591', '350300', 'Fuqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350182', '长乐市', '350100', '长乐', 3, '0591', '350200', 'Changle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350200', '厦门市', '350000', '厦门', 2, '0592', '361003', 'Xiamen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350203', '思明区', '350200', '思明', 3, '0592', '361001', 'Siming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350205', '海沧区', '350200', '海沧', 3, '0592', '361026', 'Haicang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350206', '湖里区', '350200', '湖里', 3, '0592', '361006', 'Huli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350211', '集美区', '350200', '集美', 3, '0592', '361021', 'Jimei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350212', '同安区', '350200', '同安', 3, '0592', '361100', 'Tongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350213', '翔安区', '350200', '翔安', 3, '0592', '361101', 'Xiangan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350300', '莆田市', '350000', '莆田', 2, '0594', '351100', 'Putian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350302', '城厢区', '350300', '城厢', 3, '0594', '351100', 'Chengxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350303', '涵江区', '350300', '涵江', 3, '0594', '351111', 'Hanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350304', '荔城区', '350300', '荔城', 3, '0594', '351100', 'Licheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350305', '秀屿区', '350300', '秀屿', 3, '0594', '351152', 'Xiuyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350322', '仙游县', '350300', '仙游', 3, '0594', '351200', 'Xianyou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350400', '三明市', '350000', '三明', 2, '0598', '365000', 'Sanming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350402', '梅列区', '350400', '梅列', 3, '0598', '365000', 'Meilie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350403', '三元区', '350400', '三元', 3, '0598', '365001', 'Sanyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350421', '明溪县', '350400', '明溪', 3, '0598', '365200', 'Mingxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350423', '清流县', '350400', '清流', 3, '0598', '365300', 'Qingliu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350424', '宁化县', '350400', '宁化', 3, '0598', '365400', 'Ninghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350425', '大田县', '350400', '大田', 3, '0598', '366100', 'Datian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350426', '尤溪县', '350400', '尤溪', 3, '0598', '365100', 'Youxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350427', '沙县', '350400', '沙县', 3, '0598', '365500', 'Shaxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350428', '将乐县', '350400', '将乐', 3, '0598', '353300', 'Jiangle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350429', '泰宁县', '350400', '泰宁', 3, '0598', '354400', 'Taining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350430', '建宁县', '350400', '建宁', 3, '0598', '354500', 'Jianning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350481', '永安市', '350400', '永安', 3, '0598', '366000', 'Yongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350500', '泉州市', '350000', '泉州', 2, '0595', '362000', 'Quanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350502', '鲤城区', '350500', '鲤城', 3, '0595', '362000', 'Licheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350503', '丰泽区', '350500', '丰泽', 3, '0595', '362000', 'Fengze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350504', '洛江区', '350500', '洛江', 3, '0595', '362011', 'Luojiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350505', '泉港区', '350500', '泉港', 3, '0595', '362114', 'Quangang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350521', '惠安县', '350500', '惠安', 3, '0595', '362100', 'Huian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350524', '安溪县', '350500', '安溪', 3, '0595', '362400', 'Anxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350525', '永春县', '350500', '永春', 3, '0595', '362600', 'Yongchun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350526', '德化县', '350500', '德化', 3, '0595', '362500', 'Dehua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350527', '金门县', '350500', '金门', 3, '', '', 'Jinmen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350581', '石狮市', '350500', '石狮', 3, '0595', '362700', 'Shishi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350582', '晋江市', '350500', '晋江', 3, '0595', '362200', 'Jinjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350583', '南安市', '350500', '南安', 3, '0595', '362300', 'Nanan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350600', '漳州市', '350000', '漳州', 2, '0596', '363005', 'Zhangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350602', '芗城区', '350600', '芗城', 3, '0596', '363000', 'Xiangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350603', '龙文区', '350600', '龙文', 3, '0596', '363005', 'Longwen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350622', '云霄县', '350600', '云霄', 3, '0596', '363300', 'Yunxiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350623', '漳浦县', '350600', '漳浦', 3, '0596', '363200', 'Zhangpu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350624', '诏安县', '350600', '诏安', 3, '0596', '363500', 'Zhaoan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350625', '长泰县', '350600', '长泰', 3, '0596', '363900', 'Changtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350626', '东山县', '350600', '东山', 3, '0596', '363400', 'Dongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350627', '南靖县', '350600', '南靖', 3, '0596', '363600', 'Nanjing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350628', '平和县', '350600', '平和', 3, '0596', '363700', 'Pinghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350629', '华安县', '350600', '华安', 3, '0596', '363800', 'Huaan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350681', '龙海市', '350600', '龙海', 3, '0596', '363100', 'Longhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350700', '南平市', '350000', '南平', 2, '0599', '353000', 'Nanping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350702', '延平区', '350700', '延平', 3, '0600', '353000', 'Yanping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350703', '建阳区', '350700', '建阳', 3, '0599', '354200', 'Jianyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350721', '顺昌县', '350700', '顺昌', 3, '0605', '353200', 'Shunchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350722', '浦城县', '350700', '浦城', 3, '0606', '353400', 'Pucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350723', '光泽县', '350700', '光泽', 3, '0607', '354100', 'Guangze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350724', '松溪县', '350700', '松溪', 3, '0608', '353500', 'Songxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350725', '政和县', '350700', '政和', 3, '0609', '353600', 'Zhenghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350781', '邵武市', '350700', '邵武', 3, '0601', '354000', 'Shaowu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350782', '武夷山市', '350700', '武夷山', 3, '0602', '354300', 'Wuyishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350783', '建瓯市', '350700', '建瓯', 3, '0603', '353100', 'Jianou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350800', '龙岩市', '350000', '龙岩', 2, '0597', '364000', 'Longyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350802', '新罗区', '350800', '新罗', 3, '0597', '364000', 'Xinluo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350821', '长汀县', '350800', '长汀', 3, '0597', '366300', 'Changting', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350822', '永定区', '350800', '永定', 3, '0597', '364100', 'Yongding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350823', '上杭县', '350800', '上杭', 3, '0597', '364200', 'Shanghang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350824', '武平县', '350800', '武平', 3, '0597', '364300', 'Wuping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350825', '连城县', '350800', '连城', 3, '0597', '366200', 'Liancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350881', '漳平市', '350800', '漳平', 3, '0597', '364400', 'Zhangping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350900', '宁德市', '350000', '宁德', 2, '0593', '352100', 'Ningde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350902', '蕉城区', '350900', '蕉城', 3, '0593', '352100', 'Jiaocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350921', '霞浦县', '350900', '霞浦', 3, '0593', '355100', 'Xiapu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350922', '古田县', '350900', '古田', 3, '0593', '352200', 'Gutian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350923', '屏南县', '350900', '屏南', 3, '0593', '352300', 'Pingnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350924', '寿宁县', '350900', '寿宁', 3, '0593', '355500', 'Shouning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350925', '周宁县', '350900', '周宁', 3, '0593', '355400', 'Zhouning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350926', '柘荣县', '350900', '柘荣', 3, '0593', '355300', 'Zherong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350981', '福安市', '350900', '福安', 3, '0593', '355000', 'Fuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('350982', '福鼎市', '350900', '福鼎', 3, '0593', '355200', 'Fuding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360000', '江西省', '100000', '江西', 1, '', '', 'Jiangxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360100', '南昌市', '360000', '南昌', 2, '0791', '330008', 'Nanchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360102', '东湖区', '360100', '东湖', 3, '0791', '330006', 'Donghu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360103', '西湖区', '360100', '西湖', 3, '0791', '330009', 'Xihu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360104', '青云谱区', '360100', '青云谱', 3, '0791', '330001', 'Qingyunpu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360105', '湾里区', '360100', '湾里', 3, '0791', '330004', 'Wanli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360111', '青山湖区', '360100', '青山湖', 3, '0791', '330029', 'Qingshanhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360121', '南昌县', '360100', '南昌', 3, '0791', '330200', 'Nanchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360122', '新建县', '360100', '新建', 3, '0791', '330100', 'Xinjian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360123', '安义县', '360100', '安义', 3, '0791', '330500', 'Anyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360124', '进贤县', '360100', '进贤', 3, '0791', '331700', 'Jinxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360200', '景德镇市', '360000', '景德镇', 2, '0798', '333000', 'Jingdezhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360202', '昌江区', '360200', '昌江', 3, '0799', '333000', 'Changjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360203', '珠山区', '360200', '珠山', 3, '0800', '333000', 'Zhushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360222', '浮梁县', '360200', '浮梁', 3, '0802', '333400', 'Fuliang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360281', '乐平市', '360200', '乐平', 3, '0801', '333300', 'Leping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360300', '萍乡市', '360000', '萍乡', 2, '0799', '337000', 'Pingxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360302', '安源区', '360300', '安源', 3, '0800', '337000', 'Anyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360313', '湘东区', '360300', '湘东', 3, '0801', '337016', 'Xiangdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360321', '莲花县', '360300', '莲花', 3, '0802', '337100', 'Lianhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360322', '上栗县', '360300', '上栗', 3, '0803', '337009', 'Shangli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360323', '芦溪县', '360300', '芦溪', 3, '0804', '337053', 'Luxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360400', '九江市', '360000', '九江', 2, '0792', '332000', 'Jiujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360402', '庐山区', '360400', '庐山', 3, '0792', '332005', 'Lushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360403', '浔阳区', '360400', '浔阳', 3, '0792', '332000', 'Xunyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360421', '九江县', '360400', '九江', 3, '0792', '332100', 'Jiujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360423', '武宁县', '360400', '武宁', 3, '0792', '332300', 'Wuning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360424', '修水县', '360400', '修水', 3, '0792', '332400', 'Xiushui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360425', '永修县', '360400', '永修', 3, '0792', '330300', 'Yongxiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360426', '德安县', '360400', '德安', 3, '0792', '330400', 'Dean', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360427', '星子县', '360400', '星子', 3, '0792', '332800', 'Xingzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360428', '都昌县', '360400', '都昌', 3, '0792', '332600', 'Duchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360429', '湖口县', '360400', '湖口', 3, '0792', '332500', 'Hukou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360430', '彭泽县', '360400', '彭泽', 3, '0792', '332700', 'Pengze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360481', '瑞昌市', '360400', '瑞昌', 3, '0792', '332200', 'Ruichang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360482', '共青城市', '360400', '共青城', 3, '0792', '332020', 'Gongqingcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360500', '新余市', '360000', '新余', 2, '0790', '338025', 'Xinyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360502', '渝水区', '360500', '渝水', 3, '0790', '338025', 'Yushui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360521', '分宜县', '360500', '分宜', 3, '0790', '336600', 'Fenyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360600', '鹰潭市', '360000', '鹰潭', 2, '0701', '335000', 'Yingtan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360602', '月湖区', '360600', '月湖', 3, '0701', '335000', 'Yuehu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360622', '余江县', '360600', '余江', 3, '0701', '335200', 'Yujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360681', '贵溪市', '360600', '贵溪', 3, '0701', '335400', 'Guixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360700', '赣州市', '360000', '赣州', 2, '0797', '341000', 'Ganzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360702', '章贡区', '360700', '章贡', 3, '0797', '341000', 'Zhanggong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360703', '南康区', '360700', '南康', 3, '0797', '341400', 'Nankang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360721', '赣县', '360700', '赣县', 3, '0797', '341100', 'Ganxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360722', '信丰县', '360700', '信丰', 3, '0797', '341600', 'Xinfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360723', '大余县', '360700', '大余', 3, '0797', '341500', 'Dayu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360724', '上犹县', '360700', '上犹', 3, '0797', '341200', 'Shangyou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360725', '崇义县', '360700', '崇义', 3, '0797', '341300', 'Chongyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360726', '安远县', '360700', '安远', 3, '0797', '342100', 'Anyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360727', '龙南县', '360700', '龙南', 3, '0797', '341700', 'Longnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360728', '定南县', '360700', '定南', 3, '0797', '341900', 'Dingnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360729', '全南县', '360700', '全南', 3, '0797', '341800', 'Quannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360730', '宁都县', '360700', '宁都', 3, '0797', '342800', 'Ningdu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360731', '于都县', '360700', '于都', 3, '0797', '342300', 'Yudu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360732', '兴国县', '360700', '兴国', 3, '0797', '342400', 'Xingguo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360733', '会昌县', '360700', '会昌', 3, '0797', '342600', 'Huichang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360734', '寻乌县', '360700', '寻乌', 3, '0797', '342200', 'Xunwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360735', '石城县', '360700', '石城', 3, '0797', '342700', 'Shicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360781', '瑞金市', '360700', '瑞金', 3, '0797', '342500', 'Ruijin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360800', '吉安市', '360000', '吉安', 2, '0796', '343000', 'Jian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360802', '吉州区', '360800', '吉州', 3, '0796', '343000', 'Jizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360803', '青原区', '360800', '青原', 3, '0796', '343009', 'Qingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360821', '吉安县', '360800', '吉安', 3, '0796', '343100', 'Jian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360822', '吉水县', '360800', '吉水', 3, '0796', '331600', 'Jishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360823', '峡江县', '360800', '峡江', 3, '0796', '331409', 'Xiajiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360824', '新干县', '360800', '新干', 3, '0796', '331300', 'Xingan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360825', '永丰县', '360800', '永丰', 3, '0796', '331500', 'Yongfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360826', '泰和县', '360800', '泰和', 3, '0796', '343700', 'Taihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360827', '遂川县', '360800', '遂川', 3, '0796', '343900', 'Suichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360828', '万安县', '360800', '万安', 3, '0796', '343800', 'Wanan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360829', '安福县', '360800', '安福', 3, '0796', '343200', 'Anfu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360830', '永新县', '360800', '永新', 3, '0796', '343400', 'Yongxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360881', '井冈山市', '360800', '井冈山', 3, '0796', '343600', 'Jinggangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360900', '宜春市', '360000', '宜春', 2, '0795', '336000', 'Yichun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360902', '袁州区', '360900', '袁州', 3, '0795', '336000', 'Yuanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360921', '奉新县', '360900', '奉新', 3, '0795', '330700', 'Fengxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360922', '万载县', '360900', '万载', 3, '0795', '336100', 'Wanzai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360923', '上高县', '360900', '上高', 3, '0795', '336400', 'Shanggao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360924', '宜丰县', '360900', '宜丰', 3, '0795', '336300', 'Yifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360925', '靖安县', '360900', '靖安', 3, '0795', '330600', 'Jingan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360926', '铜鼓县', '360900', '铜鼓', 3, '0795', '336200', 'Tonggu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360981', '丰城市', '360900', '丰城', 3, '0795', '331100', 'Fengcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360982', '樟树市', '360900', '樟树', 3, '0795', '331200', 'Zhangshu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('360983', '高安市', '360900', '高安', 3, '0795', '330800', 'Gaoan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361000', '抚州市', '360000', '抚州', 2, '0794', '344000', 'Fuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361002', '临川区', '361000', '临川', 3, '0794', '344000', 'Linchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361021', '南城县', '361000', '南城', 3, '0794', '344700', 'Nancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361022', '黎川县', '361000', '黎川', 3, '0794', '344600', 'Lichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361023', '南丰县', '361000', '南丰', 3, '0794', '344500', 'Nanfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361024', '崇仁县', '361000', '崇仁', 3, '0794', '344200', 'Chongren', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361025', '乐安县', '361000', '乐安', 3, '0794', '344300', 'Lean', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361026', '宜黄县', '361000', '宜黄', 3, '0794', '344400', 'Yihuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361027', '金溪县', '361000', '金溪', 3, '0794', '344800', 'Jinxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361028', '资溪县', '361000', '资溪', 3, '0794', '335300', 'Zixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361029', '东乡县', '361000', '东乡', 3, '0794', '331800', 'Dongxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361030', '广昌县', '361000', '广昌', 3, '0794', '344900', 'Guangchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361100', '上饶市', '360000', '上饶', 2, '0793', '334000', 'Shangrao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361102', '信州区', '361100', '信州', 3, '0793', '334000', 'Xinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361121', '上饶县', '361100', '上饶', 3, '0793', '334100', 'Shangrao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361122', '广丰县', '361100', '广丰', 3, '0793', '334600', 'Guangfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361123', '玉山县', '361100', '玉山', 3, '0793', '334700', 'Yushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361124', '铅山县', '361100', '铅山', 3, '0793', '334500', 'Yanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361125', '横峰县', '361100', '横峰', 3, '0793', '334300', 'Hengfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361126', '弋阳县', '361100', '弋阳', 3, '0793', '334400', 'Yiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361127', '余干县', '361100', '余干', 3, '0793', '335100', 'Yugan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361128', '鄱阳县', '361100', '鄱阳', 3, '0793', '333100', 'Poyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361129', '万年县', '361100', '万年', 3, '0793', '335500', 'Wannian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361130', '婺源县', '361100', '婺源', 3, '0793', '333200', 'Wuyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('361181', '德兴市', '361100', '德兴', 3, '0793', '334200', 'Dexing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370000', '山东省', '100000', '山东', 1, '', '', 'Shandong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370100', '济南市', '370000', '济南', 2, '0531', '250001', 'Jinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370102', '历下区', '370100', '历下', 3, '0531', '250014', 'Lixia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370103', '市中区', '370100', '市中区', 3, '0531', '250001', 'Shizhongqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370104', '槐荫区', '370100', '槐荫', 3, '0531', '250117', 'Huaiyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370105', '天桥区', '370100', '天桥', 3, '0531', '250031', 'Tianqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370112', '历城区', '370100', '历城', 3, '0531', '250100', 'Licheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370113', '长清区', '370100', '长清', 3, '0531', '250300', 'Changqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370124', '平阴县', '370100', '平阴', 3, '0531', '250400', 'Pingyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370125', '济阳县', '370100', '济阳', 3, '0531', '251400', 'Jiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370126', '商河县', '370100', '商河', 3, '0531', '251600', 'Shanghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370181', '章丘市', '370100', '章丘', 3, '0531', '250200', 'Zhangqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370200', '青岛市', '370000', '青岛', 2, '0532', '266001', 'Qingdao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370202', '市南区', '370200', '市南', 3, '0532', '266001', 'Shinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370203', '市北区', '370200', '市北', 3, '0532', '266011', 'Shibei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370211', '黄岛区', '370200', '黄岛', 3, '0532', '266500', 'Huangdao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370212', '崂山区', '370200', '崂山', 3, '0532', '266100', 'Laoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370213', '李沧区', '370200', '李沧', 3, '0532', '266021', 'Licang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370214', '城阳区', '370200', '城阳', 3, '0532', '266041', 'Chengyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370281', '胶州市', '370200', '胶州', 3, '0532', '266300', 'Jiaozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370282', '即墨市', '370200', '即墨', 3, '0532', '266200', 'Jimo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370283', '平度市', '370200', '平度', 3, '0532', '266700', 'Pingdu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370285', '莱西市', '370200', '莱西', 3, '0532', '266600', 'Laixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370286', '西海岸新区', '370200', '西海岸', 3, '0532', '266500', 'Xihaian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370300', '淄博市', '370000', '淄博', 2, '0533', '255039', 'Zibo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370302', '淄川区', '370300', '淄川', 3, '0533', '255100', 'Zichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370303', '张店区', '370300', '张店', 3, '0533', '255022', 'Zhangdian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370304', '博山区', '370300', '博山', 3, '0533', '255200', 'Boshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370305', '临淄区', '370300', '临淄', 3, '0533', '255400', 'Linzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370306', '周村区', '370300', '周村', 3, '0533', '255300', 'Zhoucun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370321', '桓台县', '370300', '桓台', 3, '0533', '256400', 'Huantai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370322', '高青县', '370300', '高青', 3, '0533', '256300', 'Gaoqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370323', '沂源县', '370300', '沂源', 3, '0533', '256100', 'Yiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370400', '枣庄市', '370000', '枣庄', 2, '0632', '277101', 'Zaozhuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370402', '市中区', '370400', '市中区', 3, '0632', '277101', 'Shizhongqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370403', '薛城区', '370400', '薛城', 3, '0632', '277000', 'Xuecheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370404', '峄城区', '370400', '峄城', 3, '0632', '277300', 'Yicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370405', '台儿庄区', '370400', '台儿庄', 3, '0632', '277400', 'Taierzhuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370406', '山亭区', '370400', '山亭', 3, '0632', '277200', 'Shanting', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370481', '滕州市', '370400', '滕州', 3, '0632', '277500', 'Tengzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370500', '东营市', '370000', '东营', 2, '0546', '257093', 'Dongying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370502', '东营区', '370500', '东营', 3, '0546', '257029', 'Dongying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370503', '河口区', '370500', '河口', 3, '0546', '257200', 'Hekou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370521', '垦利县', '370500', '垦利', 3, '0546', '257500', 'Kenli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370522', '利津县', '370500', '利津', 3, '0546', '257400', 'Lijin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370523', '广饶县', '370500', '广饶', 3, '0546', '257300', 'Guangrao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370600', '烟台市', '370000', '烟台', 2, '0635', '264010', 'Yantai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370602', '芝罘区', '370600', '芝罘', 3, '0635', '264001', 'Zhifu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370611', '福山区', '370600', '福山', 3, '0635', '265500', 'Fushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370612', '牟平区', '370600', '牟平', 3, '0635', '264100', 'Muping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370613', '莱山区', '370600', '莱山', 3, '0635', '264600', 'Laishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370634', '长岛县', '370600', '长岛', 3, '0635', '265800', 'Changdao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370681', '龙口市', '370600', '龙口', 3, '0635', '265700', 'Longkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370682', '莱阳市', '370600', '莱阳', 3, '0635', '265200', 'Laiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370683', '莱州市', '370600', '莱州', 3, '0635', '261400', 'Laizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370684', '蓬莱市', '370600', '蓬莱', 3, '0635', '265600', 'Penglai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370685', '招远市', '370600', '招远', 3, '0635', '265400', 'Zhaoyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370686', '栖霞市', '370600', '栖霞', 3, '0635', '265300', 'Qixia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370687', '海阳市', '370600', '海阳', 3, '0635', '265100', 'Haiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370700', '潍坊市', '370000', '潍坊', 2, '0536', '261041', 'Weifang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370702', '潍城区', '370700', '潍城', 3, '0536', '261021', 'Weicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370703', '寒亭区', '370700', '寒亭', 3, '0536', '261100', 'Hanting', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370704', '坊子区', '370700', '坊子', 3, '0536', '261200', 'Fangzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370705', '奎文区', '370700', '奎文', 3, '0536', '261031', 'Kuiwen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370724', '临朐县', '370700', '临朐', 3, '0536', '262600', 'Linqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370725', '昌乐县', '370700', '昌乐', 3, '0536', '262400', 'Changle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370781', '青州市', '370700', '青州', 3, '0536', '262500', 'Qingzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370782', '诸城市', '370700', '诸城', 3, '0536', '262200', 'Zhucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370783', '寿光市', '370700', '寿光', 3, '0536', '262700', 'Shouguang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370784', '安丘市', '370700', '安丘', 3, '0536', '262100', 'Anqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370785', '高密市', '370700', '高密', 3, '0536', '261500', 'Gaomi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370786', '昌邑市', '370700', '昌邑', 3, '0536', '261300', 'Changyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370800', '济宁市', '370000', '济宁', 2, '0537', '272119', 'Jining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370811', '任城区', '370800', '任城', 3, '0537', '272113', 'Rencheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370812', '兖州区', '370800', '兖州', 3, '0537', '272000', 'Yanzhou ', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370826', '微山县', '370800', '微山', 3, '0537', '277600', 'Weishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370827', '鱼台县', '370800', '鱼台', 3, '0537', '272300', 'Yutai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370828', '金乡县', '370800', '金乡', 3, '0537', '272200', 'Jinxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370829', '嘉祥县', '370800', '嘉祥', 3, '0537', '272400', 'Jiaxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370830', '汶上县', '370800', '汶上', 3, '0537', '272501', 'Wenshang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370831', '泗水县', '370800', '泗水', 3, '0537', '273200', 'Sishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370832', '梁山县', '370800', '梁山', 3, '0537', '272600', 'Liangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370881', '曲阜市', '370800', '曲阜', 3, '0537', '273100', 'Qufu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370883', '邹城市', '370800', '邹城', 3, '0537', '273500', 'Zoucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370900', '泰安市', '370000', '泰安', 2, '0538', '271000', 'Taian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370902', '泰山区', '370900', '泰山', 3, '0538', '271000', 'Taishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370911', '岱岳区', '370900', '岱岳', 3, '0538', '271000', 'Daiyue', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370921', '宁阳县', '370900', '宁阳', 3, '0538', '271400', 'Ningyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370923', '东平县', '370900', '东平', 3, '0538', '271500', 'Dongping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370982', '新泰市', '370900', '新泰', 3, '0538', '271200', 'Xintai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('370983', '肥城市', '370900', '肥城', 3, '0538', '271600', 'Feicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371000', '威海市', '370000', '威海', 2, '0631', '264200', 'Weihai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371002', '环翠区', '371000', '环翠', 3, '0631', '264200', 'Huancui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371003', '文登区', '371000', '文登', 3, '0631', '266440', 'Wendeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371082', '荣成市', '371000', '荣成', 3, '0631', '264300', 'Rongcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371083', '乳山市', '371000', '乳山', 3, '0631', '264500', 'Rushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371100', '日照市', '370000', '日照', 2, '0633', '276800', 'Rizhao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371102', '东港区', '371100', '东港', 3, '0633', '276800', 'Donggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371103', '岚山区', '371100', '岚山', 3, '0633', '276808', 'Lanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371121', '五莲县', '371100', '五莲', 3, '0633', '262300', 'Wulian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371122', '莒县', '371100', '莒县', 3, '0633', '276500', 'Juxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371200', '莱芜市', '370000', '莱芜', 2, '0634', '271100', 'Laiwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371202', '莱城区', '371200', '莱城', 3, '0634', '271199', 'Laicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371203', '钢城区', '371200', '钢城', 3, '0634', '271100', 'Gangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371300', '临沂市', '370000', '临沂', 2, '0539', '253000', 'Linyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371302', '兰山区', '371300', '兰山', 3, '0539', '276002', 'Lanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371311', '罗庄区', '371300', '罗庄', 3, '0539', '276022', 'Luozhuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371312', '河东区', '371300', '河东', 3, '0539', '276034', 'Hedong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371321', '沂南县', '371300', '沂南', 3, '0539', '276300', 'Yinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371322', '郯城县', '371300', '郯城', 3, '0539', '276100', 'Tancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371323', '沂水县', '371300', '沂水', 3, '0539', '276400', 'Yishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371324', '兰陵县', '371300', '兰陵', 3, '0539', '277700', 'Lanling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371325', '费县', '371300', '费县', 3, '0539', '273400', 'Feixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371326', '平邑县', '371300', '平邑', 3, '0539', '273300', 'Pingyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371327', '莒南县', '371300', '莒南', 3, '0539', '276600', 'Junan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371328', '蒙阴县', '371300', '蒙阴', 3, '0539', '276200', 'Mengyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371329', '临沭县', '371300', '临沭', 3, '0539', '276700', 'Linshu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371400', '德州市', '370000', '德州', 2, '0534', '253000', 'Dezhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371402', '德城区', '371400', '德城', 3, '0534', '253012', 'Decheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371403', '陵城区', '371400', '陵城', 3, '0534', '253500', 'Lingcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371422', '宁津县', '371400', '宁津', 3, '0534', '253400', 'Ningjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371423', '庆云县', '371400', '庆云', 3, '0534', '253700', 'Qingyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371424', '临邑县', '371400', '临邑', 3, '0534', '251500', 'Linyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371425', '齐河县', '371400', '齐河', 3, '0534', '251100', 'Qihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371426', '平原县', '371400', '平原', 3, '0534', '253100', 'Pingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371427', '夏津县', '371400', '夏津', 3, '0534', '253200', 'Xiajin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371428', '武城县', '371400', '武城', 3, '0534', '253300', 'Wucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371481', '乐陵市', '371400', '乐陵', 3, '0534', '253600', 'Leling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371482', '禹城市', '371400', '禹城', 3, '0534', '251200', 'Yucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371500', '聊城市', '370000', '聊城', 2, '0635', '252052', 'Liaocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371502', '东昌府区', '371500', '东昌府', 3, '0635', '252000', 'Dongchangfu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371521', '阳谷县', '371500', '阳谷', 3, '0635', '252300', 'Yanggu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371522', '莘县', '371500', '莘县', 3, '0635', '252400', 'Shenxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371523', '茌平县', '371500', '茌平', 3, '0635', '252100', 'Chiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371524', '东阿县', '371500', '东阿', 3, '0635', '252200', 'Donge', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371525', '冠县', '371500', '冠县', 3, '0635', '252500', 'Guanxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371526', '高唐县', '371500', '高唐', 3, '0635', '252800', 'Gaotang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371581', '临清市', '371500', '临清', 3, '0635', '252600', 'Linqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371600', '滨州市', '370000', '滨州', 2, '0543', '256619', 'Binzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371602', '滨城区', '371600', '滨城', 3, '0543', '256613', 'Bincheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371603', '沾化区', '371600', '沾化', 3, '0543', '256800', 'Zhanhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371621', '惠民县', '371600', '惠民', 3, '0543', '251700', 'Huimin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371622', '阳信县', '371600', '阳信', 3, '0543', '251800', 'Yangxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371623', '无棣县', '371600', '无棣', 3, '0543', '251900', 'Wudi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371625', '博兴县', '371600', '博兴', 3, '0543', '256500', 'Boxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371626', '邹平县', '371600', '邹平', 3, '0543', '256200', 'Zouping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371627', '北海新区', '371600', '北海新区', 3, '0543', '256200', 'Beihaixinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371700', '菏泽市', '370000', '菏泽', 2, '0530', '274020', 'Heze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371702', '牡丹区', '371700', '牡丹', 3, '0530', '274009', 'Mudan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371721', '曹县', '371700', '曹县', 3, '0530', '274400', 'Caoxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371722', '单县', '371700', '单县', 3, '0530', '273700', 'Shanxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371723', '成武县', '371700', '成武', 3, '0530', '274200', 'Chengwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371724', '巨野县', '371700', '巨野', 3, '0530', '274900', 'Juye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371725', '郓城县', '371700', '郓城', 3, '0530', '274700', 'Yuncheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371726', '鄄城县', '371700', '鄄城', 3, '0530', '274600', 'Juancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371727', '定陶县', '371700', '定陶', 3, '0530', '274100', 'Dingtao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('371728', '东明县', '371700', '东明', 3, '0530', '274500', 'Dongming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410000', '河南省', '100000', '河南', 1, '', '', 'Henan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410100', '郑州市', '410000', '郑州', 2, '0371', '450000', 'Zhengzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410102', '中原区', '410100', '中原', 3, '0371', '450007', 'Zhongyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410103', '二七区', '410100', '二七', 3, '0371', '450052', 'Erqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410104', '管城回族区', '410100', '管城', 3, '0371', '450000', 'Guancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410105', '金水区', '410100', '金水', 3, '0371', '450003', 'Jinshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410106', '上街区', '410100', '上街', 3, '0371', '450041', 'Shangjie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410108', '惠济区', '410100', '惠济', 3, '0371', '450053', 'Huiji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410122', '中牟县', '410100', '中牟', 3, '0371', '451450', 'Zhongmu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410181', '巩义市', '410100', '巩义', 3, '0371', '451200', 'Gongyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410182', '荥阳市', '410100', '荥阳', 3, '0371', '450100', 'Xingyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410183', '新密市', '410100', '新密', 3, '0371', '452300', 'Xinmi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410184', '新郑市', '410100', '新郑', 3, '0371', '451100', 'Xinzheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410185', '登封市', '410100', '登封', 3, '0371', '452470', 'Dengfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410200', '开封市', '410000', '开封', 2, '0378', '475001', 'Kaifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410202', '龙亭区', '410200', '龙亭', 3, '0378', '475100', 'Longting', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410203', '顺河回族区', '410200', '顺河', 3, '0378', '475000', 'Shunhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410204', '鼓楼区', '410200', '鼓楼', 3, '0378', '475000', 'Gulou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410205', '禹王台区', '410200', '禹王台', 3, '0378', '475003', 'Yuwangtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410212', '祥符区', '410200', '祥符', 3, '0378', '475100', 'Xiangfu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410221', '杞县', '410200', '杞县', 3, '0378', '475200', 'Qixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410222', '通许县', '410200', '通许', 3, '0378', '475400', 'Tongxu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410223', '尉氏县', '410200', '尉氏', 3, '0378', '475500', 'Weishi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410225', '兰考县', '410200', '兰考', 3, '0378', '475300', 'Lankao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410300', '洛阳市', '410000', '洛阳', 2, '0379', '471000', 'Luoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410302', '老城区', '410300', '老城', 3, '0379', '471002', 'Laocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410303', '西工区', '410300', '西工', 3, '0379', '471000', 'Xigong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410304', '瀍河回族区', '410300', '瀍河', 3, '0379', '471002', 'Chanhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410305', '涧西区', '410300', '涧西', 3, '0379', '471003', 'Jianxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410306', '吉利区', '410300', '吉利', 3, '0379', '471012', 'Jili', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410311', '洛龙区', '410300', '洛龙', 3, '0379', '471000', 'Luolong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410322', '孟津县', '410300', '孟津', 3, '0379', '471100', 'Mengjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410323', '新安县', '410300', '新安', 3, '0379', '471800', 'Xinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410324', '栾川县', '410300', '栾川', 3, '0379', '471500', 'Luanchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410325', '嵩县', '410300', '嵩县', 3, '0379', '471400', 'Songxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410326', '汝阳县', '410300', '汝阳', 3, '0379', '471200', 'Ruyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410327', '宜阳县', '410300', '宜阳', 3, '0379', '471600', 'Yiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410328', '洛宁县', '410300', '洛宁', 3, '0379', '471700', 'Luoning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410329', '伊川县', '410300', '伊川', 3, '0379', '471300', 'Yichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410381', '偃师市', '410300', '偃师', 3, '0379', '471900', 'Yanshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410400', '平顶山市', '410000', '平顶山', 2, '0375', '467000', 'Pingdingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410402', '新华区', '410400', '新华', 3, '0375', '467002', 'Xinhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410403', '卫东区', '410400', '卫东', 3, '0375', '467021', 'Weidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410404', '石龙区', '410400', '石龙', 3, '0375', '467045', 'Shilong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410411', '湛河区', '410400', '湛河', 3, '0375', '467000', 'Zhanhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410421', '宝丰县', '410400', '宝丰', 3, '0375', '467400', 'Baofeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410422', '叶县', '410400', '叶县', 3, '0375', '467200', 'Yexian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410423', '鲁山县', '410400', '鲁山', 3, '0375', '467300', 'Lushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410425', '郏县', '410400', '郏县', 3, '0375', '467100', 'Jiaxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410481', '舞钢市', '410400', '舞钢', 3, '0375', '462500', 'Wugang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410482', '汝州市', '410400', '汝州', 3, '0375', '467500', 'Ruzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410500', '安阳市', '410000', '安阳', 2, '0372', '455000', 'Anyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410502', '文峰区', '410500', '文峰', 3, '0372', '455000', 'Wenfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410503', '北关区', '410500', '北关', 3, '0372', '455001', 'Beiguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410505', '殷都区', '410500', '殷都', 3, '0372', '455004', 'Yindu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410506', '龙安区', '410500', '龙安', 3, '0372', '455001', 'Longan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410522', '安阳县', '410500', '安阳', 3, '0372', '455000', 'Anyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410523', '汤阴县', '410500', '汤阴', 3, '0372', '456150', 'Tangyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410526', '滑县', '410500', '滑县', 3, '0372', '456400', 'Huaxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410527', '内黄县', '410500', '内黄', 3, '0372', '456350', 'Neihuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410581', '林州市', '410500', '林州', 3, '0372', '456550', 'Linzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410600', '鹤壁市', '410000', '鹤壁', 2, '0392', '458030', 'Hebi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410602', '鹤山区', '410600', '鹤山', 3, '0392', '458010', 'Heshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410603', '山城区', '410600', '山城', 3, '0392', '458000', 'Shancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410611', '淇滨区', '410600', '淇滨', 3, '0392', '458000', 'Qibin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410621', '浚县', '410600', '浚县', 3, '0392', '456250', 'Xunxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410622', '淇县', '410600', '淇县', 3, '0392', '456750', 'Qixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410700', '新乡市', '410000', '新乡', 2, '0373', '453000', 'Xinxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410702', '红旗区', '410700', '红旗', 3, '0373', '453000', 'Hongqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410703', '卫滨区', '410700', '卫滨', 3, '0373', '453000', 'Weibin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410704', '凤泉区', '410700', '凤泉', 3, '0373', '453011', 'Fengquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410711', '牧野区', '410700', '牧野', 3, '0373', '453002', 'Muye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410721', '新乡县', '410700', '新乡', 3, '0373', '453700', 'Xinxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410724', '获嘉县', '410700', '获嘉', 3, '0373', '453800', 'Huojia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410725', '原阳县', '410700', '原阳', 3, '0373', '453500', 'Yuanyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410726', '延津县', '410700', '延津', 3, '0373', '453200', 'Yanjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410727', '封丘县', '410700', '封丘', 3, '0373', '453300', 'Fengqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410728', '长垣县', '410700', '长垣', 3, '0373', '453400', 'Changyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410781', '卫辉市', '410700', '卫辉', 3, '0373', '453100', 'Weihui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410782', '辉县市', '410700', '辉县', 3, '0373', '453600', 'Huixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410800', '焦作市', '410000', '焦作', 2, '0391', '454002', 'Jiaozuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410802', '解放区', '410800', '解放', 3, '0391', '454000', 'Jiefang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410803', '中站区', '410800', '中站', 3, '0391', '454191', 'Zhongzhan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410804', '马村区', '410800', '马村', 3, '0391', '454171', 'Macun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410811', '山阳区', '410800', '山阳', 3, '0391', '454002', 'Shanyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410821', '修武县', '410800', '修武', 3, '0391', '454350', 'Xiuwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410822', '博爱县', '410800', '博爱', 3, '0391', '454450', 'Boai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410823', '武陟县', '410800', '武陟', 3, '0391', '454950', 'Wuzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410825', '温县', '410800', '温县', 3, '0391', '454850', 'Wenxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410882', '沁阳市', '410800', '沁阳', 3, '0391', '454550', 'Qinyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410883', '孟州市', '410800', '孟州', 3, '0391', '454750', 'Mengzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410900', '濮阳市', '410000', '濮阳', 2, '0393', '457000', 'Puyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410902', '华龙区', '410900', '华龙', 3, '0393', '457001', 'Hualong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410922', '清丰县', '410900', '清丰', 3, '0393', '457300', 'Qingfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410923', '南乐县', '410900', '南乐', 3, '0393', '457400', 'Nanle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410926', '范县', '410900', '范县', 3, '0393', '457500', 'Fanxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410927', '台前县', '410900', '台前', 3, '0393', '457600', 'Taiqian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('410928', '濮阳县', '410900', '濮阳', 3, '0393', '457100', 'Puyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411000', '许昌市', '410000', '许昌', 2, '0374', '461000', 'Xuchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411002', '魏都区', '411000', '魏都', 3, '0374', '461000', 'Weidu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411023', '许昌县', '411000', '许昌', 3, '0374', '461100', 'Xuchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411024', '鄢陵县', '411000', '鄢陵', 3, '0374', '461200', 'Yanling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411025', '襄城县', '411000', '襄城', 3, '0374', '461700', 'Xiangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411081', '禹州市', '411000', '禹州', 3, '0374', '461670', 'Yuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411082', '长葛市', '411000', '长葛', 3, '0374', '461500', 'Changge', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411100', '漯河市', '410000', '漯河', 2, '0395', '462000', 'Luohe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411102', '源汇区', '411100', '源汇', 3, '0395', '462000', 'Yuanhui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411103', '郾城区', '411100', '郾城', 3, '0395', '462300', 'Yancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411104', '召陵区', '411100', '召陵', 3, '0395', '462300', 'Zhaoling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411121', '舞阳县', '411100', '舞阳', 3, '0395', '462400', 'Wuyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411122', '临颍县', '411100', '临颍', 3, '0395', '462600', 'Linying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411200', '三门峡市', '410000', '三门峡', 2, '0398', '472000', 'Sanmenxia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411202', '湖滨区', '411200', '湖滨', 3, '0398', '472000', 'Hubin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411221', '渑池县', '411200', '渑池', 3, '0398', '472400', 'Mianchi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411222', '陕县', '411200', '陕县', 3, '0398', '472100', 'Shanxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411224', '卢氏县', '411200', '卢氏', 3, '0398', '472200', 'Lushi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411281', '义马市', '411200', '义马', 3, '0398', '472300', 'Yima', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411282', '灵宝市', '411200', '灵宝', 3, '0398', '472500', 'Lingbao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411300', '南阳市', '410000', '南阳', 2, '0377', '473002', 'Nanyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411302', '宛城区', '411300', '宛城', 3, '0377', '473001', 'Wancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411303', '卧龙区', '411300', '卧龙', 3, '0377', '473003', 'Wolong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411321', '南召县', '411300', '南召', 3, '0377', '474650', 'Nanzhao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411322', '方城县', '411300', '方城', 3, '0377', '473200', 'Fangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411323', '西峡县', '411300', '西峡', 3, '0377', '474550', 'Xixia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411324', '镇平县', '411300', '镇平', 3, '0377', '474250', 'Zhenping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411325', '内乡县', '411300', '内乡', 3, '0377', '474350', 'Neixiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411326', '淅川县', '411300', '淅川', 3, '0377', '474450', 'Xichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411327', '社旗县', '411300', '社旗', 3, '0377', '473300', 'Sheqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411328', '唐河县', '411300', '唐河', 3, '0377', '473400', 'Tanghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411329', '新野县', '411300', '新野', 3, '0377', '473500', 'Xinye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411330', '桐柏县', '411300', '桐柏', 3, '0377', '474750', 'Tongbai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411381', '邓州市', '411300', '邓州', 3, '0377', '474150', 'Dengzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411400', '商丘市', '410000', '商丘', 2, '0370', '476000', 'Shangqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411402', '梁园区', '411400', '梁园', 3, '0370', '476000', 'Liangyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411403', '睢阳区', '411400', '睢阳', 3, '0370', '476100', 'Suiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411421', '民权县', '411400', '民权', 3, '0370', '476800', 'Minquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411422', '睢县', '411400', '睢县', 3, '0370', '476900', 'Suixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411423', '宁陵县', '411400', '宁陵', 3, '0370', '476700', 'Ningling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411424', '柘城县', '411400', '柘城', 3, '0370', '476200', 'Zhecheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411425', '虞城县', '411400', '虞城', 3, '0370', '476300', 'Yucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411426', '夏邑县', '411400', '夏邑', 3, '0370', '476400', 'Xiayi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411481', '永城市', '411400', '永城', 3, '0370', '476600', 'Yongcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411500', '信阳市', '410000', '信阳', 2, '0376', '464000', 'Xinyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411502', '浉河区', '411500', '浉河', 3, '0376', '464000', 'Shihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411503', '平桥区', '411500', '平桥', 3, '0376', '464100', 'Pingqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411521', '罗山县', '411500', '罗山', 3, '0376', '464200', 'Luoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411522', '光山县', '411500', '光山', 3, '0376', '465450', 'Guangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411523', '新县', '411500', '新县', 3, '0376', '465550', 'Xinxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411524', '商城县', '411500', '商城', 3, '0376', '465350', 'Shangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411525', '固始县', '411500', '固始', 3, '0376', '465250', 'Gushi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411526', '潢川县', '411500', '潢川', 3, '0376', '465150', 'Huangchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411527', '淮滨县', '411500', '淮滨', 3, '0376', '464400', 'Huaibin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411528', '息县', '411500', '息县', 3, '0376', '464300', 'Xixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411600', '周口市', '410000', '周口', 2, '0394', '466000', 'Zhoukou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411602', '川汇区', '411600', '川汇', 3, '0394', '466000', 'Chuanhui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411621', '扶沟县', '411600', '扶沟', 3, '0394', '461300', 'Fugou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411622', '西华县', '411600', '西华', 3, '0394', '466600', 'Xihua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411623', '商水县', '411600', '商水', 3, '0394', '466100', 'Shangshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411624', '沈丘县', '411600', '沈丘', 3, '0394', '466300', 'Shenqiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411625', '郸城县', '411600', '郸城', 3, '0394', '477150', 'Dancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411626', '淮阳县', '411600', '淮阳', 3, '0394', '466700', 'Huaiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411627', '太康县', '411600', '太康', 3, '0394', '461400', 'Taikang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411628', '鹿邑县', '411600', '鹿邑', 3, '0394', '477200', 'Luyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411681', '项城市', '411600', '项城', 3, '0394', '466200', 'Xiangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411700', '驻马店市', '410000', '驻马店', 2, '0396', '463000', 'Zhumadian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411702', '驿城区', '411700', '驿城', 3, '0396', '463000', 'Yicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411721', '西平县', '411700', '西平', 3, '0396', '463900', 'Xiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411722', '上蔡县', '411700', '上蔡', 3, '0396', '463800', 'Shangcai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411723', '平舆县', '411700', '平舆', 3, '0396', '463400', 'Pingyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411724', '正阳县', '411700', '正阳', 3, '0396', '463600', 'Zhengyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411725', '确山县', '411700', '确山', 3, '0396', '463200', 'Queshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411726', '泌阳县', '411700', '泌阳', 3, '0396', '463700', 'Biyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411727', '汝南县', '411700', '汝南', 3, '0396', '463300', 'Runan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411728', '遂平县', '411700', '遂平', 3, '0396', '463100', 'Suiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('411729', '新蔡县', '411700', '新蔡', 3, '0396', '463500', 'Xincai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('419000', '直辖县级', '410000', ' ', 2, '', '', '', NULL, NULL);
INSERT INTO `tb_address` VALUES ('419001', '济源市', '419000', '济源', 3, '0391', '454650', 'Jiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420000', '湖北省', '100000', '湖北', 1, '', '', 'Hubei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420100', '武汉市', '420000', '武汉', 2, '', '430014', 'Wuhan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420102', '江岸区', '420100', '江岸', 3, '027', '430014', 'Jiangan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420103', '江汉区', '420100', '江汉', 3, '027', '430021', 'Jianghan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420104', '硚口区', '420100', '硚口', 3, '027', '430033', 'Qiaokou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420105', '汉阳区', '420100', '汉阳', 3, '027', '430050', 'Hanyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420106', '武昌区', '420100', '武昌', 3, '027', '430061', 'Wuchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420107', '青山区', '420100', '青山', 3, '027', '430080', 'Qingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420111', '洪山区', '420100', '洪山', 3, '027', '430070', 'Hongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420112', '东西湖区', '420100', '东西湖', 3, '027', '430040', 'Dongxihu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420113', '汉南区', '420100', '汉南', 3, '027', '430090', 'Hannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420114', '蔡甸区', '420100', '蔡甸', 3, '027', '430100', 'Caidian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420115', '江夏区', '420100', '江夏', 3, '027', '430200', 'Jiangxia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420116', '黄陂区', '420100', '黄陂', 3, '027', '432200', 'Huangpi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420117', '新洲区', '420100', '新洲', 3, '027', '431400', 'Xinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420200', '黄石市', '420000', '黄石', 2, '0714', '435003', 'Huangshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420202', '黄石港区', '420200', '黄石港', 3, '0714', '435000', 'Huangshigang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420203', '西塞山区', '420200', '西塞山', 3, '0714', '435001', 'Xisaishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420204', '下陆区', '420200', '下陆', 3, '0714', '435005', 'Xialu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420205', '铁山区', '420200', '铁山', 3, '0714', '435006', 'Tieshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420222', '阳新县', '420200', '阳新', 3, '0714', '435200', 'Yangxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420281', '大冶市', '420200', '大冶', 3, '0714', '435100', 'Daye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420300', '十堰市', '420000', '十堰', 2, '0719', '442000', 'Shiyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420302', '茅箭区', '420300', '茅箭', 3, '0719', '442012', 'Maojian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420303', '张湾区', '420300', '张湾', 3, '0719', '442001', 'Zhangwan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420304', '郧阳区', '420300', '郧阳', 3, '0719', '442500', 'Yunyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420322', '郧西县', '420300', '郧西', 3, '0719', '442600', 'Yunxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420323', '竹山县', '420300', '竹山', 3, '0719', '442200', 'Zhushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420324', '竹溪县', '420300', '竹溪', 3, '0719', '442300', 'Zhuxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420325', '房县', '420300', '房县', 3, '0719', '442100', 'Fangxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420381', '丹江口市', '420300', '丹江口', 3, '0719', '442700', 'Danjiangkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420500', '宜昌市', '420000', '宜昌', 2, '0717', '443000', 'Yichang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420502', '西陵区', '420500', '西陵', 3, '0717', '443000', 'Xiling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420503', '伍家岗区', '420500', '伍家岗', 3, '0717', '443001', 'Wujiagang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420504', '点军区', '420500', '点军', 3, '0717', '443006', 'Dianjun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420505', '猇亭区', '420500', '猇亭', 3, '0717', '443007', 'Xiaoting', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420506', '夷陵区', '420500', '夷陵', 3, '0717', '443100', 'Yiling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420525', '远安县', '420500', '远安', 3, '0717', '444200', 'Yuanan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420526', '兴山县', '420500', '兴山', 3, '0717', '443711', 'Xingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420527', '秭归县', '420500', '秭归', 3, '0717', '443600', 'Zigui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420528', '长阳土家族自治县', '420500', '长阳', 3, '0717', '443500', 'Changyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420529', '五峰土家族自治县', '420500', '五峰', 3, '0717', '443413', 'Wufeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420581', '宜都市', '420500', '宜都', 3, '0717', '443300', 'Yidu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420582', '当阳市', '420500', '当阳', 3, '0717', '444100', 'Dangyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420583', '枝江市', '420500', '枝江', 3, '0717', '443200', 'Zhijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420600', '襄阳市', '420000', '襄阳', 2, '0710', '441021', 'Xiangyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420602', '襄城区', '420600', '襄城', 3, '0710', '441021', 'Xiangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420606', '樊城区', '420600', '樊城', 3, '0710', '441001', 'Fancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420607', '襄州区', '420600', '襄州', 3, '0710', '441100', 'Xiangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420624', '南漳县', '420600', '南漳', 3, '0710', '441500', 'Nanzhang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420625', '谷城县', '420600', '谷城', 3, '0710', '441700', 'Gucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420626', '保康县', '420600', '保康', 3, '0710', '441600', 'Baokang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420682', '老河口市', '420600', '老河口', 3, '0710', '441800', 'Laohekou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420683', '枣阳市', '420600', '枣阳', 3, '0710', '441200', 'Zaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420684', '宜城市', '420600', '宜城', 3, '0710', '441400', 'Yicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420700', '鄂州市', '420000', '鄂州', 2, '0711', '436000', 'Ezhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420702', '梁子湖区', '420700', '梁子湖', 3, '0711', '436064', 'Liangzihu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420703', '华容区', '420700', '华容', 3, '0711', '436030', 'Huarong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420704', '鄂城区', '420700', '鄂城', 3, '0711', '436000', 'Echeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420800', '荆门市', '420000', '荆门', 2, '0724', '448000', 'Jingmen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420802', '东宝区', '420800', '东宝', 3, '0724', '448004', 'Dongbao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420804', '掇刀区', '420800', '掇刀', 3, '0724', '448124', 'Duodao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420821', '京山县', '420800', '京山', 3, '0724', '431800', 'Jingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420822', '沙洋县', '420800', '沙洋', 3, '0724', '448200', 'Shayang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420881', '钟祥市', '420800', '钟祥', 3, '0724', '431900', 'Zhongxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420900', '孝感市', '420000', '孝感', 2, '0712', '432100', 'Xiaogan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420902', '孝南区', '420900', '孝南', 3, '0712', '432100', 'Xiaonan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420921', '孝昌县', '420900', '孝昌', 3, '0712', '432900', 'Xiaochang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420922', '大悟县', '420900', '大悟', 3, '0712', '432800', 'Dawu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420923', '云梦县', '420900', '云梦', 3, '0712', '432500', 'Yunmeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420981', '应城市', '420900', '应城', 3, '0712', '432400', 'Yingcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420982', '安陆市', '420900', '安陆', 3, '0712', '432600', 'Anlu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('420984', '汉川市', '420900', '汉川', 3, '0712', '432300', 'Hanchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421000', '荆州市', '420000', '荆州', 2, '0716', '434000', 'Jingzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421002', '沙市区', '421000', '沙市', 3, '0716', '434000', 'Shashi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421003', '荆州区', '421000', '荆州', 3, '0716', '434020', 'Jingzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421022', '公安县', '421000', '公安', 3, '0716', '434300', 'Gongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421023', '监利县', '421000', '监利', 3, '0716', '433300', 'Jianli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421024', '江陵县', '421000', '江陵', 3, '0716', '434101', 'Jiangling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421081', '石首市', '421000', '石首', 3, '0716', '434400', 'Shishou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421083', '洪湖市', '421000', '洪湖', 3, '0716', '433200', 'Honghu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421087', '松滋市', '421000', '松滋', 3, '0716', '434200', 'Songzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421100', '黄冈市', '420000', '黄冈', 2, '0713', '438000', 'Huanggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421102', '黄州区', '421100', '黄州', 3, '0713', '438000', 'Huangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421121', '团风县', '421100', '团风', 3, '0713', '438800', 'Tuanfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421122', '红安县', '421100', '红安', 3, '0713', '438401', 'Hongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421123', '罗田县', '421100', '罗田', 3, '0713', '438600', 'Luotian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421124', '英山县', '421100', '英山', 3, '0713', '438700', 'Yingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421125', '浠水县', '421100', '浠水', 3, '0713', '438200', 'Xishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421126', '蕲春县', '421100', '蕲春', 3, '0713', '435300', 'Qichun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421127', '黄梅县', '421100', '黄梅', 3, '0713', '435500', 'Huangmei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421181', '麻城市', '421100', '麻城', 3, '0713', '438300', 'Macheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421182', '武穴市', '421100', '武穴', 3, '0713', '435400', 'Wuxue', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421200', '咸宁市', '420000', '咸宁', 2, '0715', '437000', 'Xianning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421202', '咸安区', '421200', '咸安', 3, '0715', '437000', 'Xianan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421221', '嘉鱼县', '421200', '嘉鱼', 3, '0715', '437200', 'Jiayu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421222', '通城县', '421200', '通城', 3, '0715', '437400', 'Tongcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421223', '崇阳县', '421200', '崇阳', 3, '0715', '437500', 'Chongyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421224', '通山县', '421200', '通山', 3, '0715', '437600', 'Tongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421281', '赤壁市', '421200', '赤壁', 3, '0715', '437300', 'Chibi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421300', '随州市', '420000', '随州', 2, '0722', '441300', 'Suizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421303', '曾都区', '421300', '曾都', 3, '0722', '441300', 'Zengdu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421321', '随县', '421300', '随县', 3, '0722', '441309', 'Suixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('421381', '广水市', '421300', '广水', 3, '0722', '432700', 'Guangshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422800', '恩施土家族苗族自治州', '420000', '恩施', 2, '0718', '445000', 'Enshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422801', '恩施市', '422800', '恩施', 3, '0718', '445000', 'Enshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422802', '利川市', '422800', '利川', 3, '0718', '445400', 'Lichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422822', '建始县', '422800', '建始', 3, '0718', '445300', 'Jianshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422823', '巴东县', '422800', '巴东', 3, '0718', '444300', 'Badong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422825', '宣恩县', '422800', '宣恩', 3, '0718', '445500', 'Xuanen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422826', '咸丰县', '422800', '咸丰', 3, '0718', '445600', 'Xianfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422827', '来凤县', '422800', '来凤', 3, '0718', '445700', 'Laifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('422828', '鹤峰县', '422800', '鹤峰', 3, '0718', '445800', 'Hefeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('429000', '直辖县级', '420000', ' ', 2, '', '', '', NULL, NULL);
INSERT INTO `tb_address` VALUES ('429004', '仙桃市', '429000', '仙桃', 3, '0728', '433000', 'Xiantao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('429005', '潜江市', '429000', '潜江', 3, '0728', '433100', 'Qianjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('429006', '天门市', '429000', '天门', 3, '0728', '431700', 'Tianmen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('429021', '神农架林区', '429000', '神农架', 3, '0719', '442400', 'Shennongjia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430000', '湖南省', '100000', '湖南', 1, '', '', 'Hunan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430100', '长沙市', '430000', '长沙', 2, '0731', '410005', 'Changsha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430102', '芙蓉区', '430100', '芙蓉', 3, '0731', '410011', 'Furong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430103', '天心区', '430100', '天心', 3, '0731', '410004', 'Tianxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430104', '岳麓区', '430100', '岳麓', 3, '0731', '410013', 'Yuelu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430105', '开福区', '430100', '开福', 3, '0731', '410008', 'Kaifu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430111', '雨花区', '430100', '雨花', 3, '0731', '410011', 'Yuhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430112', '望城区', '430100', '望城', 3, '0731', '410200', 'Wangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430121', '长沙县', '430100', '长沙', 3, '0731', '410100', 'Changsha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430124', '宁乡县', '430100', '宁乡', 3, '0731', '410600', 'Ningxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430181', '浏阳市', '430100', '浏阳', 3, '0731', '410300', 'Liuyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430200', '株洲市', '430000', '株洲', 2, '0731', '412000', 'Zhuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430202', '荷塘区', '430200', '荷塘', 3, '0731', '412000', 'Hetang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430203', '芦淞区', '430200', '芦淞', 3, '0731', '412000', 'Lusong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430204', '石峰区', '430200', '石峰', 3, '0731', '412005', 'Shifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430211', '天元区', '430200', '天元', 3, '0731', '412007', 'Tianyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430221', '株洲县', '430200', '株洲', 3, '0731', '412100', 'Zhuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430223', '攸县', '430200', '攸县', 3, '0731', '412300', 'Youxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430224', '茶陵县', '430200', '茶陵', 3, '0731', '412400', 'Chaling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430225', '炎陵县', '430200', '炎陵', 3, '0731', '412500', 'Yanling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430281', '醴陵市', '430200', '醴陵', 3, '0731', '412200', 'Liling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430300', '湘潭市', '430000', '湘潭', 2, '0731', '411100', 'Xiangtan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430302', '雨湖区', '430300', '雨湖', 3, '0731', '411100', 'Yuhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430304', '岳塘区', '430300', '岳塘', 3, '0731', '411101', 'Yuetang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430321', '湘潭县', '430300', '湘潭', 3, '0731', '411228', 'Xiangtan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430381', '湘乡市', '430300', '湘乡', 3, '0731', '411400', 'Xiangxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430382', '韶山市', '430300', '韶山', 3, '0731', '411300', 'Shaoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430400', '衡阳市', '430000', '衡阳', 2, '0734', '421001', 'Hengyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430405', '珠晖区', '430400', '珠晖', 3, '0734', '421002', 'Zhuhui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430406', '雁峰区', '430400', '雁峰', 3, '0734', '421001', 'Yanfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430407', '石鼓区', '430400', '石鼓', 3, '0734', '421005', 'Shigu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430408', '蒸湘区', '430400', '蒸湘', 3, '0734', '421001', 'Zhengxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430412', '南岳区', '430400', '南岳', 3, '0734', '421900', 'Nanyue', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430421', '衡阳县', '430400', '衡阳', 3, '0734', '421200', 'Hengyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430422', '衡南县', '430400', '衡南', 3, '0734', '421131', 'Hengnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430423', '衡山县', '430400', '衡山', 3, '0734', '421300', 'Hengshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430424', '衡东县', '430400', '衡东', 3, '0734', '421400', 'Hengdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430426', '祁东县', '430400', '祁东', 3, '0734', '421600', 'Qidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430481', '耒阳市', '430400', '耒阳', 3, '0734', '421800', 'Leiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430482', '常宁市', '430400', '常宁', 3, '0734', '421500', 'Changning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430500', '邵阳市', '430000', '邵阳', 2, '0739', '422000', 'Shaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430502', '双清区', '430500', '双清', 3, '0739', '422001', 'Shuangqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430503', '大祥区', '430500', '大祥', 3, '0739', '422000', 'Daxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430511', '北塔区', '430500', '北塔', 3, '0739', '422007', 'Beita', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430521', '邵东县', '430500', '邵东', 3, '0739', '422800', 'Shaodong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430522', '新邵县', '430500', '新邵', 3, '0739', '422900', 'Xinshao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430523', '邵阳县', '430500', '邵阳', 3, '0739', '422100', 'Shaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430524', '隆回县', '430500', '隆回', 3, '0739', '422200', 'Longhui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430525', '洞口县', '430500', '洞口', 3, '0739', '422300', 'Dongkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430527', '绥宁县', '430500', '绥宁', 3, '0739', '422600', 'Suining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430528', '新宁县', '430500', '新宁', 3, '0739', '422700', 'Xinning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430529', '城步苗族自治县', '430500', '城步', 3, '0739', '422500', 'Chengbu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430581', '武冈市', '430500', '武冈', 3, '0739', '422400', 'Wugang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430600', '岳阳市', '430000', '岳阳', 2, '0730', '414000', 'Yueyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430602', '岳阳楼区', '430600', '岳阳楼', 3, '0730', '414000', 'Yueyanglou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430603', '云溪区', '430600', '云溪', 3, '0730', '414009', 'Yunxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430611', '君山区', '430600', '君山', 3, '0730', '414005', 'Junshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430621', '岳阳县', '430600', '岳阳', 3, '0730', '414100', 'Yueyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430623', '华容县', '430600', '华容', 3, '0730', '414200', 'Huarong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430624', '湘阴县', '430600', '湘阴', 3, '0730', '414600', 'Xiangyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430626', '平江县', '430600', '平江', 3, '0730', '414500', 'Pingjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430681', '汨罗市', '430600', '汨罗', 3, '0730', '414400', 'Miluo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430682', '临湘市', '430600', '临湘', 3, '0730', '414300', 'Linxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430700', '常德市', '430000', '常德', 2, '0736', '415000', 'Changde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430702', '武陵区', '430700', '武陵', 3, '0736', '415000', 'Wuling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430703', '鼎城区', '430700', '鼎城', 3, '0736', '415101', 'Dingcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430721', '安乡县', '430700', '安乡', 3, '0736', '415600', 'Anxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430722', '汉寿县', '430700', '汉寿', 3, '0736', '415900', 'Hanshou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430723', '澧县', '430700', '澧县', 3, '0736', '415500', 'Lixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430724', '临澧县', '430700', '临澧', 3, '0736', '415200', 'Linli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430725', '桃源县', '430700', '桃源', 3, '0736', '415700', 'Taoyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430726', '石门县', '430700', '石门', 3, '0736', '415300', 'Shimen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430781', '津市市', '430700', '津市', 3, '0736', '415400', 'Jinshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430800', '张家界市', '430000', '张家界', 2, '0744', '427000', 'Zhangjiajie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430802', '永定区', '430800', '永定', 3, '0744', '427000', 'Yongding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430811', '武陵源区', '430800', '武陵源', 3, '0744', '427400', 'Wulingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430821', '慈利县', '430800', '慈利', 3, '0744', '427200', 'Cili', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430822', '桑植县', '430800', '桑植', 3, '0744', '427100', 'Sangzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430900', '益阳市', '430000', '益阳', 2, '0737', '413000', 'Yiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430902', '资阳区', '430900', '资阳', 3, '0737', '413001', 'Ziyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430903', '赫山区', '430900', '赫山', 3, '0737', '413002', 'Heshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430921', '南县', '430900', '南县', 3, '0737', '413200', 'Nanxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430922', '桃江县', '430900', '桃江', 3, '0737', '413400', 'Taojiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430923', '安化县', '430900', '安化', 3, '0737', '413500', 'Anhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('430981', '沅江市', '430900', '沅江', 3, '0737', '413100', 'Yuanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431000', '郴州市', '430000', '郴州', 2, '0735', '423000', 'Chenzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431002', '北湖区', '431000', '北湖', 3, '0735', '423000', 'Beihu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431003', '苏仙区', '431000', '苏仙', 3, '0735', '423000', 'Suxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431021', '桂阳县', '431000', '桂阳', 3, '0735', '424400', 'Guiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431022', '宜章县', '431000', '宜章', 3, '0735', '424200', 'Yizhang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431023', '永兴县', '431000', '永兴', 3, '0735', '423300', 'Yongxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431024', '嘉禾县', '431000', '嘉禾', 3, '0735', '424500', 'Jiahe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431025', '临武县', '431000', '临武', 3, '0735', '424300', 'Linwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431026', '汝城县', '431000', '汝城', 3, '0735', '424100', 'Rucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431027', '桂东县', '431000', '桂东', 3, '0735', '423500', 'Guidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431028', '安仁县', '431000', '安仁', 3, '0735', '423600', 'Anren', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431081', '资兴市', '431000', '资兴', 3, '0735', '423400', 'Zixing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431100', '永州市', '430000', '永州', 2, '0746', '425000', 'Yongzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431102', '零陵区', '431100', '零陵', 3, '0746', '425100', 'Lingling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431103', '冷水滩区', '431100', '冷水滩', 3, '0746', '425100', 'Lengshuitan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431121', '祁阳县', '431100', '祁阳', 3, '0746', '426100', 'Qiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431122', '东安县', '431100', '东安', 3, '0746', '425900', 'Dongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431123', '双牌县', '431100', '双牌', 3, '0746', '425200', 'Shuangpai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431124', '道县', '431100', '道县', 3, '0746', '425300', 'Daoxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431125', '江永县', '431100', '江永', 3, '0746', '425400', 'Jiangyong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431126', '宁远县', '431100', '宁远', 3, '0746', '425600', 'Ningyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431127', '蓝山县', '431100', '蓝山', 3, '0746', '425800', 'Lanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431128', '新田县', '431100', '新田', 3, '0746', '425700', 'Xintian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431129', '江华瑶族自治县', '431100', '江华', 3, '0746', '425500', 'Jianghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431200', '怀化市', '430000', '怀化', 2, '0745', '418000', 'Huaihua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431202', '鹤城区', '431200', '鹤城', 3, '0745', '418000', 'Hecheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431221', '中方县', '431200', '中方', 3, '0745', '418005', 'Zhongfang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431222', '沅陵县', '431200', '沅陵', 3, '0745', '419600', 'Yuanling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431223', '辰溪县', '431200', '辰溪', 3, '0745', '419500', 'Chenxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431224', '溆浦县', '431200', '溆浦', 3, '0745', '419300', 'Xupu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431225', '会同县', '431200', '会同', 3, '0745', '418300', 'Huitong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431226', '麻阳苗族自治县', '431200', '麻阳', 3, '0745', '419400', 'Mayang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431227', '新晃侗族自治县', '431200', '新晃', 3, '0745', '419200', 'Xinhuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431228', '芷江侗族自治县', '431200', '芷江', 3, '0745', '419100', 'Zhijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431229', '靖州苗族侗族自治县', '431200', '靖州', 3, '0745', '418400', 'Jingzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431230', '通道侗族自治县', '431200', '通道', 3, '0745', '418500', 'Tongdao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431281', '洪江市', '431200', '洪江', 3, '0745', '418100', 'Hongjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431300', '娄底市', '430000', '娄底', 2, '0738', '417000', 'Loudi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431302', '娄星区', '431300', '娄星', 3, '0738', '417000', 'Louxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431321', '双峰县', '431300', '双峰', 3, '0738', '417700', 'Shuangfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431322', '新化县', '431300', '新化', 3, '0738', '417600', 'Xinhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431381', '冷水江市', '431300', '冷水江', 3, '0738', '417500', 'Lengshuijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('431382', '涟源市', '431300', '涟源', 3, '0738', '417100', 'Lianyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433100', '湘西土家族苗族自治州', '430000', '湘西', 2, '0743', '416000', 'Xiangxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433101', '吉首市', '433100', '吉首', 3, '0743', '416000', 'Jishou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433122', '泸溪县', '433100', '泸溪', 3, '0743', '416100', 'Luxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433123', '凤凰县', '433100', '凤凰', 3, '0743', '416200', 'Fenghuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433124', '花垣县', '433100', '花垣', 3, '0743', '416400', 'Huayuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433125', '保靖县', '433100', '保靖', 3, '0743', '416500', 'Baojing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433126', '古丈县', '433100', '古丈', 3, '0743', '416300', 'Guzhang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433127', '永顺县', '433100', '永顺', 3, '0743', '416700', 'Yongshun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('433130', '龙山县', '433100', '龙山', 3, '0743', '416800', 'Longshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440000', '广东省', '100000', '广东', 1, '', '', 'Guangdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440100', '广州市', '440000', '广州', 2, '020', '510032', 'Guangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440103', '荔湾区', '440100', '荔湾', 3, '020', '510170', 'Liwan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440104', '越秀区', '440100', '越秀', 3, '020', '510030', 'Yuexiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440105', '海珠区', '440100', '海珠', 3, '020', '510300', 'Haizhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440106', '天河区', '440100', '天河', 3, '020', '510665', 'Tianhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440111', '白云区', '440100', '白云', 3, '020', '510405', 'Baiyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440112', '黄埔区', '440100', '黄埔', 3, '020', '510700', 'Huangpu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440113', '番禺区', '440100', '番禺', 3, '020', '511400', 'Panyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440114', '花都区', '440100', '花都', 3, '020', '510800', 'Huadu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440115', '南沙区', '440100', '南沙', 3, '020', '511458', 'Nansha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440117', '从化区', '440100', '从化', 3, '020', '510900', 'Conghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440118', '增城区', '440100', '增城', 3, '020', '511300', 'Zengcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440200', '韶关市', '440000', '韶关', 2, '0751', '512002', 'Shaoguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440203', '武江区', '440200', '武江', 3, '0751', '512026', 'Wujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440204', '浈江区', '440200', '浈江', 3, '0751', '512023', 'Zhenjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440205', '曲江区', '440200', '曲江', 3, '0751', '512101', 'Qujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440222', '始兴县', '440200', '始兴', 3, '0751', '512500', 'Shixing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440224', '仁化县', '440200', '仁化', 3, '0751', '512300', 'Renhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440229', '翁源县', '440200', '翁源', 3, '0751', '512600', 'Wengyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440232', '乳源瑶族自治县', '440200', '乳源', 3, '0751', '512700', 'Ruyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440233', '新丰县', '440200', '新丰', 3, '0751', '511100', 'Xinfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440281', '乐昌市', '440200', '乐昌', 3, '0751', '512200', 'Lechang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440282', '南雄市', '440200', '南雄', 3, '0751', '512400', 'Nanxiong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440300', '深圳市', '440000', '深圳', 2, '0755', '518035', 'Shenzhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440303', '罗湖区', '440300', '罗湖', 3, '0755', '518021', 'Luohu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440304', '福田区', '440300', '福田', 3, '0755', '518048', 'Futian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440305', '南山区', '440300', '南山', 3, '0755', '518051', 'Nanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440306', '宝安区', '440300', '宝安', 3, '0755', '518101', 'Baoan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440307', '龙岗区', '440300', '龙岗', 3, '0755', '518172', 'Longgang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440308', '盐田区', '440300', '盐田', 3, '0755', '518081', 'Yantian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440309', '光明新区', '440300', '光明新区', 3, '0755', '518100', 'Guangmingxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440310', '坪山新区', '440300', '坪山新区', 3, '0755', '518000', 'Pingshanxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440311', '大鹏新区', '440300', '大鹏新区', 3, '0755', '518000', 'Dapengxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440312', '龙华新区', '440300', '龙华新区', 3, '0755', '518100', 'Longhuaxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440400', '珠海市', '440000', '珠海', 2, '0756', '519000', 'Zhuhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440402', '香洲区', '440400', '香洲', 3, '0756', '519000', 'Xiangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440403', '斗门区', '440400', '斗门', 3, '0756', '519110', 'Doumen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440404', '金湾区', '440400', '金湾', 3, '0756', '519040', 'Jinwan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440500', '汕头市', '440000', '汕头', 2, '0754', '515041', 'Shantou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440507', '龙湖区', '440500', '龙湖', 3, '0754', '515041', 'Longhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440511', '金平区', '440500', '金平', 3, '0754', '515041', 'Jinping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440512', '濠江区', '440500', '濠江', 3, '0754', '515071', 'Haojiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440513', '潮阳区', '440500', '潮阳', 3, '0754', '515100', 'Chaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440514', '潮南区', '440500', '潮南', 3, '0754', '515144', 'Chaonan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440515', '澄海区', '440500', '澄海', 3, '0754', '515800', 'Chenghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440523', '南澳县', '440500', '南澳', 3, '0754', '515900', 'Nanao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440600', '佛山市', '440000', '佛山', 2, '0757', '528000', 'Foshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440604', '禅城区', '440600', '禅城', 3, '0757', '528000', 'Chancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440605', '南海区', '440600', '南海', 3, '0757', '528251', 'Nanhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440606', '顺德区', '440600', '顺德', 3, '0757', '528300', 'Shunde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440607', '三水区', '440600', '三水', 3, '0757', '528133', 'Sanshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440608', '高明区', '440600', '高明', 3, '0757', '528500', 'Gaoming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440700', '江门市', '440000', '江门', 2, '0750', '529000', 'Jiangmen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440703', '蓬江区', '440700', '蓬江', 3, '0750', '529000', 'Pengjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440704', '江海区', '440700', '江海', 3, '0750', '529040', 'Jianghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440705', '新会区', '440700', '新会', 3, '0750', '529100', 'Xinhui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440781', '台山市', '440700', '台山', 3, '0750', '529200', 'Taishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440783', '开平市', '440700', '开平', 3, '0750', '529337', 'Kaiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440784', '鹤山市', '440700', '鹤山', 3, '0750', '529700', 'Heshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440785', '恩平市', '440700', '恩平', 3, '0750', '529400', 'Enping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440800', '湛江市', '440000', '湛江', 2, '0759', '524047', 'Zhanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440802', '赤坎区', '440800', '赤坎', 3, '0759', '524033', 'Chikan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440803', '霞山区', '440800', '霞山', 3, '0759', '524011', 'Xiashan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440804', '坡头区', '440800', '坡头', 3, '0759', '524057', 'Potou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440811', '麻章区', '440800', '麻章', 3, '0759', '524094', 'Mazhang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440823', '遂溪县', '440800', '遂溪', 3, '0759', '524300', 'Suixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440825', '徐闻县', '440800', '徐闻', 3, '0759', '524100', 'Xuwen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440881', '廉江市', '440800', '廉江', 3, '0759', '524400', 'Lianjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440882', '雷州市', '440800', '雷州', 3, '0759', '524200', 'Leizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440883', '吴川市', '440800', '吴川', 3, '0759', '524500', 'Wuchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440900', '茂名市', '440000', '茂名', 2, '0668', '525000', 'Maoming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440902', '茂南区', '440900', '茂南', 3, '0668', '525000', 'Maonan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440904', '电白区', '440900', '电白', 3, '0668', '525400', 'Dianbai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440981', '高州市', '440900', '高州', 3, '0668', '525200', 'Gaozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440982', '化州市', '440900', '化州', 3, '0668', '525100', 'Huazhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('440983', '信宜市', '440900', '信宜', 3, '0668', '525300', 'Xinyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441200', '肇庆市', '440000', '肇庆', 2, '0758', '526040', 'Zhaoqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441202', '端州区', '441200', '端州', 3, '0758', '526060', 'Duanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441203', '鼎湖区', '441200', '鼎湖', 3, '0758', '526070', 'Dinghu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441223', '广宁县', '441200', '广宁', 3, '0758', '526300', 'Guangning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441224', '怀集县', '441200', '怀集', 3, '0758', '526400', 'Huaiji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441225', '封开县', '441200', '封开', 3, '0758', '526500', 'Fengkai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441226', '德庆县', '441200', '德庆', 3, '0758', '526600', 'Deqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441283', '高要市', '441200', '高要', 3, '0758', '526100', 'Gaoyao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441284', '四会市', '441200', '四会', 3, '0758', '526200', 'Sihui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441300', '惠州市', '440000', '惠州', 2, '0752', '516000', 'Huizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441302', '惠城区', '441300', '惠城', 3, '0752', '516008', 'Huicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441303', '惠阳区', '441300', '惠阳', 3, '0752', '516211', 'Huiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441322', '博罗县', '441300', '博罗', 3, '0752', '516100', 'Boluo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441323', '惠东县', '441300', '惠东', 3, '0752', '516300', 'Huidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441324', '龙门县', '441300', '龙门', 3, '0752', '516800', 'Longmen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441400', '梅州市', '440000', '梅州', 2, '0753', '514021', 'Meizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441402', '梅江区', '441400', '梅江', 3, '0753', '514000', 'Meijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441403', '梅县区', '441400', '梅县', 3, '0753', '514787', 'Meixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441422', '大埔县', '441400', '大埔', 3, '0753', '514200', 'Dabu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441423', '丰顺县', '441400', '丰顺', 3, '0753', '514300', 'Fengshun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441424', '五华县', '441400', '五华', 3, '0753', '514400', 'Wuhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441426', '平远县', '441400', '平远', 3, '0753', '514600', 'Pingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441427', '蕉岭县', '441400', '蕉岭', 3, '0753', '514100', 'Jiaoling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441481', '兴宁市', '441400', '兴宁', 3, '0753', '514500', 'Xingning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441500', '汕尾市', '440000', '汕尾', 2, '0660', '516600', 'Shanwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441502', '城区', '441500', '城区', 3, '0660', '516600', 'Chengqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441521', '海丰县', '441500', '海丰', 3, '0660', '516400', 'Haifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441523', '陆河县', '441500', '陆河', 3, '0660', '516700', 'Luhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441581', '陆丰市', '441500', '陆丰', 3, '0660', '516500', 'Lufeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441600', '河源市', '440000', '河源', 2, '0762', '517000', 'Heyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441602', '源城区', '441600', '源城', 3, '0762', '517000', 'Yuancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441621', '紫金县', '441600', '紫金', 3, '0762', '517400', 'Zijin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441622', '龙川县', '441600', '龙川', 3, '0762', '517300', 'Longchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441623', '连平县', '441600', '连平', 3, '0762', '517100', 'Lianping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441624', '和平县', '441600', '和平', 3, '0762', '517200', 'Heping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441625', '东源县', '441600', '东源', 3, '0762', '517583', 'Dongyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441700', '阳江市', '440000', '阳江', 2, '0662', '529500', 'Yangjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441702', '江城区', '441700', '江城', 3, '0662', '529500', 'Jiangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441704', '阳东区', '441700', '阳东', 3, '0662', '529900', 'Yangdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441721', '阳西县', '441700', '阳西', 3, '0662', '529800', 'Yangxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441781', '阳春市', '441700', '阳春', 3, '0662', '529600', 'Yangchun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441800', '清远市', '440000', '清远', 2, '0763', '511500', 'Qingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441802', '清城区', '441800', '清城', 3, '0763', '511515', 'Qingcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441803', '清新区', '441800', '清新', 3, '0763', '511810', 'Qingxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441821', '佛冈县', '441800', '佛冈', 3, '0763', '511600', 'Fogang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441823', '阳山县', '441800', '阳山', 3, '0763', '513100', 'Yangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441825', '连山壮族瑶族自治县', '441800', '连山', 3, '0763', '513200', 'Lianshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441826', '连南瑶族自治县', '441800', '连南', 3, '0763', '513300', 'Liannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441881', '英德市', '441800', '英德', 3, '0763', '513000', 'Yingde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441882', '连州市', '441800', '连州', 3, '0763', '513400', 'Lianzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441900', '东莞市', '440000', '东莞', 2, '0769', '523888', 'Dongguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441901', '莞城区', '441900', '莞城', 3, '0769', '523128', 'Guancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441902', '南城区', '441900', '南城', 3, '0769', '523617', 'Nancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441904', '万江区', '441900', '万江', 3, '0769', '523039', 'Wanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441905', '石碣镇', '441900', '石碣', 3, '0769', '523290', 'Shijie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441906', '石龙镇', '441900', '石龙', 3, '0769', '523326', 'Shilong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441907', '茶山镇', '441900', '茶山', 3, '0769', '523380', 'Chashan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441908', '石排镇', '441900', '石排', 3, '0769', '523346', 'Shipai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441909', '企石镇', '441900', '企石', 3, '0769', '523507', 'Qishi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441910', '横沥镇', '441900', '横沥', 3, '0769', '523471', 'Hengli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441911', '桥头镇', '441900', '桥头', 3, '0769', '523520', 'Qiaotou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441912', '谢岗镇', '441900', '谢岗', 3, '0769', '523592', 'Xiegang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441913', '东坑镇', '441900', '东坑', 3, '0769', '523451', 'Dongkeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441914', '常平镇', '441900', '常平', 3, '0769', '523560', 'Changping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441915', '寮步镇', '441900', '寮步', 3, '0769', '523411', 'Liaobu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441916', '大朗镇', '441900', '大朗', 3, '0769', '523770', 'Dalang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441917', '麻涌镇', '441900', '麻涌', 3, '0769', '523143', 'Machong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441918', '中堂镇', '441900', '中堂', 3, '0769', '523233', 'Zhongtang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441919', '高埗镇', '441900', '高埗', 3, '0769', '523282', 'Gaobu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441920', '樟木头镇', '441900', '樟木头', 3, '0769', '523619', 'Zhangmutou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441921', '大岭山镇', '441900', '大岭山', 3, '0769', '523835', 'Dalingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441922', '望牛墩镇', '441900', '望牛墩', 3, '0769', '523203', 'Wangniudun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441923', '黄江镇', '441900', '黄江', 3, '0769', '523755', 'Huangjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441924', '洪梅镇', '441900', '洪梅', 3, '0769', '523163', 'Hongmei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441925', '清溪镇', '441900', '清溪', 3, '0769', '523660', 'Qingxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441926', '沙田镇', '441900', '沙田', 3, '0769', '523988', 'Shatian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441927', '道滘镇', '441900', '道滘', 3, '0769', '523171', 'Daojiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441928', '塘厦镇', '441900', '塘厦', 3, '0769', '523713', 'Tangxia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441929', '虎门镇', '441900', '虎门', 3, '0769', '523932', 'Humen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441930', '厚街镇', '441900', '厚街', 3, '0769', '523960', 'Houjie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441931', '凤岗镇', '441900', '凤岗', 3, '0769', '523690', 'Fenggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('441932', '长安镇', '441900', '长安', 3, '0769', '523850', 'Changan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442000', '中山市', '440000', '中山', 2, '0760', '528403', 'Zhongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442001', '石岐区', '442000', '石岐', 3, '0760', '528400', 'Shiqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442004', '南区', '442000', '南区', 3, '0760', '528400', 'Nanqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442005', '五桂山区', '442000', '五桂山', 3, '0760', '528458', 'Wuguishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442006', '火炬开发区', '442000', '火炬', 3, '0760', '528437', 'Huoju', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442007', '黄圃镇', '442000', '黄圃', 3, '0760', '528429', 'Huangpu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442008', '南头镇', '442000', '南头', 3, '0760', '528421', 'Nantou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442009', '东凤镇', '442000', '东凤', 3, '0760', '528425', 'Dongfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442010', '阜沙镇', '442000', '阜沙', 3, '0760', '528434', 'Fusha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442011', '小榄镇', '442000', '小榄', 3, '0760', '528415', 'Xiaolan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442012', '东升镇', '442000', '东升', 3, '0760', '528400', 'Dongsheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442013', '古镇镇', '442000', '古镇', 3, '0760', '528422', 'Guzhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442014', '横栏镇', '442000', '横栏', 3, '0760', '528478', 'Henglan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442015', '三角镇', '442000', '三角', 3, '0760', '528422', 'Sanjiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442016', '民众镇', '442000', '民众', 3, '0760', '528441', 'Minzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442017', '南朗镇', '442000', '南朗', 3, '0760', '528454', 'Nanlang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442018', '港口镇', '442000', '港口', 3, '0760', '528447', 'Gangkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442019', '大涌镇', '442000', '大涌', 3, '0760', '528476', 'Dayong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442020', '沙溪镇', '442000', '沙溪', 3, '0760', '528471', 'Shaxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442021', '三乡镇', '442000', '三乡', 3, '0760', '528463', 'Sanxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442022', '板芙镇', '442000', '板芙', 3, '0760', '528459', 'Banfu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442023', '神湾镇', '442000', '神湾', 3, '0760', '528462', 'Shenwan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('442024', '坦洲镇', '442000', '坦洲', 3, '0760', '528467', 'Tanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445100', '潮州市', '440000', '潮州', 2, '0768', '521000', 'Chaozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445102', '湘桥区', '445100', '湘桥', 3, '0768', '521000', 'Xiangqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445103', '潮安区', '445100', '潮安', 3, '0768', '515638', 'Chaoan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445122', '饶平县', '445100', '饶平', 3, '0768', '515700', 'Raoping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445200', '揭阳市', '440000', '揭阳', 2, '0633', '522000', 'Jieyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445202', '榕城区', '445200', '榕城', 3, '0633', '522000', 'Rongcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445203', '揭东区', '445200', '揭东', 3, '0633', '515500', 'Jiedong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445222', '揭西县', '445200', '揭西', 3, '0633', '515400', 'Jiexi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445224', '惠来县', '445200', '惠来', 3, '0633', '515200', 'Huilai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445281', '普宁市', '445200', '普宁', 3, '0633', '515300', 'Puning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445300', '云浮市', '440000', '云浮', 2, '0766', '527300', 'Yunfu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445302', '云城区', '445300', '云城', 3, '0766', '527300', 'Yuncheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445303', '云安区', '445300', '云安', 3, '0766', '527500', 'Yunan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445321', '新兴县', '445300', '新兴', 3, '0766', '527400', 'Xinxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445322', '郁南县', '445300', '郁南', 3, '0766', '527100', 'Yunan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('445381', '罗定市', '445300', '罗定', 3, '0766', '527200', 'Luoding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450000', '广西壮族自治区', '100000', '广西', 1, '', '', 'Guangxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450100', '南宁市', '450000', '南宁', 2, '0771', '530028', 'Nanning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450102', '兴宁区', '450100', '兴宁', 3, '0771', '530023', 'Xingning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450103', '青秀区', '450100', '青秀', 3, '0771', '530213', 'Qingxiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450105', '江南区', '450100', '江南', 3, '0771', '530031', 'Jiangnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450107', '西乡塘区', '450100', '西乡塘', 3, '0771', '530001', 'Xixiangtang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450108', '良庆区', '450100', '良庆', 3, '0771', '530219', 'Liangqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450109', '邕宁区', '450100', '邕宁', 3, '0771', '530200', 'Yongning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450122', '武鸣县', '450100', '武鸣', 3, '0771', '530100', 'Wuming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450123', '隆安县', '450100', '隆安', 3, '0771', '532700', 'Longan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450124', '马山县', '450100', '马山', 3, '0771', '530600', 'Mashan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450125', '上林县', '450100', '上林', 3, '0771', '530500', 'Shanglin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450126', '宾阳县', '450100', '宾阳', 3, '0771', '530400', 'Binyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450127', '横县', '450100', '横县', 3, '0771', '530300', 'Hengxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450128', '埌东新区', '450100', '埌东', 3, '0771', '530000', 'Langdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450200', '柳州市', '450000', '柳州', 2, '0772', '545001', 'Liuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450202', '城中区', '450200', '城中', 3, '0772', '545001', 'Chengzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450203', '鱼峰区', '450200', '鱼峰', 3, '0772', '545005', 'Yufeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450204', '柳南区', '450200', '柳南', 3, '0772', '545007', 'Liunan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450205', '柳北区', '450200', '柳北', 3, '0772', '545002', 'Liubei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450221', '柳江县', '450200', '柳江', 3, '0772', '545100', 'Liujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450222', '柳城县', '450200', '柳城', 3, '0772', '545200', 'Liucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450223', '鹿寨县', '450200', '鹿寨', 3, '0772', '545600', 'Luzhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450224', '融安县', '450200', '融安', 3, '0772', '545400', 'Rongan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450225', '融水苗族自治县', '450200', '融水', 3, '0772', '545300', 'Rongshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450226', '三江侗族自治县', '450200', '三江', 3, '0772', '545500', 'Sanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450227', '柳东新区', '450200', '柳东', 3, '0772', '545000', 'Liudong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450300', '桂林市', '450000', '桂林', 2, '0773', '541100', 'Guilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450302', '秀峰区', '450300', '秀峰', 3, '0773', '541001', 'Xiufeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450303', '叠彩区', '450300', '叠彩', 3, '0773', '541001', 'Diecai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450304', '象山区', '450300', '象山', 3, '0773', '541002', 'Xiangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450305', '七星区', '450300', '七星', 3, '0773', '541004', 'Qixing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450311', '雁山区', '450300', '雁山', 3, '0773', '541006', 'Yanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450312', '临桂区', '450300', '临桂', 3, '0773', '541100', 'Lingui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450321', '阳朔县', '450300', '阳朔', 3, '0773', '541900', 'Yangshuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450323', '灵川县', '450300', '灵川', 3, '0773', '541200', 'Lingchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450324', '全州县', '450300', '全州', 3, '0773', '541503', 'Quanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450325', '兴安县', '450300', '兴安', 3, '0773', '541300', 'Xingan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450326', '永福县', '450300', '永福', 3, '0773', '541800', 'Yongfu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450327', '灌阳县', '450300', '灌阳', 3, '0773', '541600', 'Guanyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450328', '龙胜各族自治县', '450300', '龙胜', 3, '0773', '541700', 'Longsheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450329', '资源县', '450300', '资源', 3, '0773', '541400', 'Ziyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450330', '平乐县', '450300', '平乐', 3, '0773', '542400', 'Pingle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450331', '荔浦县', '450300', '荔浦', 3, '0773', '546600', 'Lipu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450332', '恭城瑶族自治县', '450300', '恭城', 3, '0773', '542500', 'Gongcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450400', '梧州市', '450000', '梧州', 2, '0774', '543002', 'Wuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450403', '万秀区', '450400', '万秀', 3, '0774', '543000', 'Wanxiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450405', '长洲区', '450400', '长洲', 3, '0774', '543003', 'Changzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450406', '龙圩区', '450400', '龙圩', 3, '0774', '543002', 'Longxu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450421', '苍梧县', '450400', '苍梧', 3, '0774', '543100', 'Cangwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450422', '藤县', '450400', '藤县', 3, '0774', '543300', 'Tengxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450423', '蒙山县', '450400', '蒙山', 3, '0774', '546700', 'Mengshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450481', '岑溪市', '450400', '岑溪', 3, '0774', '543200', 'Cenxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450500', '北海市', '450000', '北海', 2, '0779', '536000', 'Beihai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450502', '海城区', '450500', '海城', 3, '0779', '536000', 'Haicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450503', '银海区', '450500', '银海', 3, '0779', '536000', 'Yinhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450512', '铁山港区', '450500', '铁山港', 3, '0779', '536017', 'Tieshangang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450521', '合浦县', '450500', '合浦', 3, '0779', '536100', 'Hepu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450600', '防城港市', '450000', '防城港', 2, '0770', '538001', 'Fangchenggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450602', '港口区', '450600', '港口', 3, '0770', '538001', 'Gangkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450603', '防城区', '450600', '防城', 3, '0770', '538021', 'Fangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450621', '上思县', '450600', '上思', 3, '0770', '535500', 'Shangsi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450681', '东兴市', '450600', '东兴', 3, '0770', '538100', 'Dongxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450700', '钦州市', '450000', '钦州', 2, '0777', '535099', 'Qinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450702', '钦南区', '450700', '钦南', 3, '0777', '535099', 'Qinnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450703', '钦北区', '450700', '钦北', 3, '0777', '535099', 'Qinbei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450721', '灵山县', '450700', '灵山', 3, '0777', '535099', 'Lingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450722', '浦北县', '450700', '浦北', 3, '0777', '535099', 'Pubei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450800', '贵港市', '450000', '贵港', 2, '0775', '537100', 'Guigang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450802', '港北区', '450800', '港北', 3, '0775', '537100', 'Gangbei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450803', '港南区', '450800', '港南', 3, '0775', '537100', 'Gangnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450804', '覃塘区', '450800', '覃塘', 3, '0775', '537121', 'Qintang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450821', '平南县', '450800', '平南', 3, '0775', '537300', 'Pingnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450881', '桂平市', '450800', '桂平', 3, '0775', '537200', 'Guiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450900', '玉林市', '450000', '玉林', 2, '0775', '537000', 'Yulin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450902', '玉州区', '450900', '玉州', 3, '0775', '537000', 'Yuzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450903', '福绵区', '450900', '福绵', 3, '0775', '537023', 'Fumian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450904', '玉东新区', '450900', '玉东', 3, '0775', '537000', 'Yudong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450921', '容县', '450900', '容县', 3, '0775', '537500', 'Rongxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450922', '陆川县', '450900', '陆川', 3, '0775', '537700', 'Luchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450923', '博白县', '450900', '博白', 3, '0775', '537600', 'Bobai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450924', '兴业县', '450900', '兴业', 3, '0775', '537800', 'Xingye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('450981', '北流市', '450900', '北流', 3, '0775', '537400', 'Beiliu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451000', '百色市', '450000', '百色', 2, '0776', '533000', 'Baise', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451002', '右江区', '451000', '右江', 3, '0776', '533000', 'Youjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451021', '田阳县', '451000', '田阳', 3, '0776', '533600', 'Tianyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451022', '田东县', '451000', '田东', 3, '0776', '531500', 'Tiandong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451023', '平果县', '451000', '平果', 3, '0776', '531400', 'Pingguo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451024', '德保县', '451000', '德保', 3, '0776', '533700', 'Debao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451025', '靖西县', '451000', '靖西', 3, '0776', '533800', 'Jingxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451026', '那坡县', '451000', '那坡', 3, '0776', '533900', 'Napo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451027', '凌云县', '451000', '凌云', 3, '0776', '533100', 'Lingyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451028', '乐业县', '451000', '乐业', 3, '0776', '533200', 'Leye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451029', '田林县', '451000', '田林', 3, '0776', '533300', 'Tianlin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451030', '西林县', '451000', '西林', 3, '0776', '533500', 'Xilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451031', '隆林各族自治县', '451000', '隆林', 3, '0776', '533400', 'Longlin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451100', '贺州市', '450000', '贺州', 2, '0774', '542800', 'Hezhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451102', '八步区', '451100', '八步', 3, '0774', '542800', 'Babu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451121', '昭平县', '451100', '昭平', 3, '0774', '546800', 'Zhaoping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451122', '钟山县', '451100', '钟山', 3, '0774', '542600', 'Zhongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451123', '富川瑶族自治县', '451100', '富川', 3, '0774', '542700', 'Fuchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451124', '平桂管理区', '451100', '平桂', 3, '0774', '542800', 'Pingui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451200', '河池市', '450000', '河池', 2, '0778', '547000', 'Hechi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451202', '金城江区', '451200', '金城江', 3, '0779', '547000', 'Jinchengjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451221', '南丹县', '451200', '南丹', 3, '0781', '547200', 'Nandan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451222', '天峨县', '451200', '天峨', 3, '0782', '547300', 'Tiane', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451223', '凤山县', '451200', '凤山', 3, '0783', '547600', 'Fengshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451224', '东兰县', '451200', '东兰', 3, '0784', '547400', 'Donglan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451225', '罗城仫佬族自治县', '451200', '罗城', 3, '0785', '546400', 'Luocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451226', '环江毛南族自治县', '451200', '环江', 3, '0786', '547100', 'Huanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451227', '巴马瑶族自治县', '451200', '巴马', 3, '0787', '547500', 'Bama', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451228', '都安瑶族自治县', '451200', '都安', 3, '0788', '530700', 'Duan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451229', '大化瑶族自治县', '451200', '大化', 3, '0789', '530800', 'Dahua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451281', '宜州市', '451200', '宜州', 3, '0780', '546300', 'Yizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451300', '来宾市', '450000', '来宾', 2, '0772', '546100', 'Laibin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451302', '兴宾区', '451300', '兴宾', 3, '0772', '546100', 'Xingbin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451321', '忻城县', '451300', '忻城', 3, '0772', '546200', 'Xincheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451322', '象州县', '451300', '象州', 3, '0772', '545800', 'Xiangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451323', '武宣县', '451300', '武宣', 3, '0772', '545900', 'Wuxuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451324', '金秀瑶族自治县', '451300', '金秀', 3, '0772', '545799', 'Jinxiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451381', '合山市', '451300', '合山', 3, '0772', '546500', 'Heshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451400', '崇左市', '450000', '崇左', 2, '0771', '532299', 'Chongzuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451402', '江州区', '451400', '江州', 3, '0771', '532299', 'Jiangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451421', '扶绥县', '451400', '扶绥', 3, '0771', '532199', 'Fusui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451422', '宁明县', '451400', '宁明', 3, '0771', '532599', 'Ningming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451423', '龙州县', '451400', '龙州', 3, '0771', '532499', 'Longzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451424', '大新县', '451400', '大新', 3, '0771', '532399', 'Daxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451425', '天等县', '451400', '天等', 3, '0771', '532899', 'Tiandeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('451481', '凭祥市', '451400', '凭祥', 3, '0771', '532699', 'Pingxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460000', '海南省', '100000', '海南', 1, '', '', 'Hainan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460100', '海口市', '460000', '海口', 2, '0898', '570000', 'Haikou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460105', '秀英区', '460100', '秀英', 3, '0898', '570311', 'Xiuying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460106', '龙华区', '460100', '龙华', 3, '0898', '570145', 'Longhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460107', '琼山区', '460100', '琼山', 3, '0898', '571100', 'Qiongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460108', '美兰区', '460100', '美兰', 3, '0898', '570203', 'Meilan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460200', '三亚市', '460000', '三亚', 2, '0898', '572000', 'Sanya', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460202', '海棠区', '460200', '海棠', 3, '0898', '572000', 'Haitang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460203', '吉阳区', '460200', '吉阳', 3, '0898', '572000', 'Jiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460204', '天涯区', '460200', '天涯', 3, '0898', '572000', 'Tianya', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460205', '崖州区', '460200', '崖州', 3, '0898', '572000', 'Yazhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460300', '三沙市', '460000', '三沙', 2, '0898', '573199', 'Sansha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460321', '西沙群岛', '460300', '西沙', 3, '0898', '572000', 'Xisha Islands', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460322', '南沙群岛', '460300', '南沙', 3, '0898', '573100', 'Nansha Islands', NULL, NULL);
INSERT INTO `tb_address` VALUES ('460323', '中沙群岛', '460300', '中沙', 3, '0898', '573100', 'Zhongsha Islands', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469000', '直辖县级', '460000', ' ', 2, '', '', '', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469001', '五指山市', '469000', '五指山', 3, '0898', '572200', 'Wuzhishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469002', '琼海市', '469000', '琼海', 3, '0898', '571400', 'Qionghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469003', '儋州市', '469000', '儋州', 3, '0898', '571700', 'Danzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469005', '文昌市', '469000', '文昌', 3, '0898', '571339', 'Wenchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469006', '万宁市', '469000', '万宁', 3, '0898', '571500', 'Wanning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469007', '东方市', '469000', '东方', 3, '0898', '572600', 'Dongfang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469021', '定安县', '469000', '定安', 3, '0898', '571200', 'Dingan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469022', '屯昌县', '469000', '屯昌', 3, '0898', '571600', 'Tunchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469023', '澄迈县', '469000', '澄迈', 3, '0898', '571900', 'Chengmai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469024', '临高县', '469000', '临高', 3, '0898', '571800', 'Lingao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469025', '白沙黎族自治县', '469000', '白沙', 3, '0898', '572800', 'Baisha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469026', '昌江黎族自治县', '469000', '昌江', 3, '0898', '572700', 'Changjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469027', '乐东黎族自治县', '469000', '乐东', 3, '0898', '572500', 'Ledong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469028', '陵水黎族自治县', '469000', '陵水', 3, '0898', '572400', 'Lingshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469029', '保亭黎族苗族自治县', '469000', '保亭', 3, '0898', '572300', 'Baoting', NULL, NULL);
INSERT INTO `tb_address` VALUES ('469030', '琼中黎族苗族自治县', '469000', '琼中', 3, '0898', '572900', 'Qiongzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500000', '重庆', '100000', '重庆', 1, '', '', 'Chongqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500100', '重庆市', '500000', '重庆', 2, '023', '400000', 'Chongqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500101', '万州区', '500100', '万州', 3, '023', '404000', 'Wanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500102', '涪陵区', '500100', '涪陵', 3, '023', '408000', 'Fuling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500103', '渝中区', '500100', '渝中', 3, '023', '400010', 'Yuzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500104', '大渡口区', '500100', '大渡口', 3, '023', '400080', 'Dadukou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500105', '江北区', '500100', '江北', 3, '023', '400020', 'Jiangbei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500106', '沙坪坝区', '500100', '沙坪坝', 3, '023', '400030', 'Shapingba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500107', '九龙坡区', '500100', '九龙坡', 3, '023', '400050', 'Jiulongpo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500108', '南岸区', '500100', '南岸', 3, '023', '400064', 'Nanan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500109', '北碚区', '500100', '北碚', 3, '023', '400700', 'Beibei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500110', '綦江区', '500100', '綦江', 3, '023', '400800', 'Qijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500111', '大足区', '500100', '大足', 3, '023', '400900', 'Dazu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500112', '渝北区', '500100', '渝北', 3, '023', '401120', 'Yubei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500113', '巴南区', '500100', '巴南', 3, '023', '401320', 'Banan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500114', '黔江区', '500100', '黔江', 3, '023', '409700', 'Qianjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500115', '长寿区', '500100', '长寿', 3, '023', '401220', 'Changshou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500116', '江津区', '500100', '江津', 3, '023', '402260', 'Jiangjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500117', '合川区', '500100', '合川', 3, '023', '401520', 'Hechuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500118', '永川区', '500100', '永川', 3, '023', '402160', 'Yongchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500119', '南川区', '500100', '南川', 3, '023', '408400', 'Nanchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500120', '璧山区', '500100', '璧山', 3, '023', '402760', 'Bishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500151', '铜梁区', '500100', '铜梁', 3, '023', '402560', 'Tongliang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500223', '潼南县', '500100', '潼南', 3, '023', '402660', 'Tongnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500226', '荣昌县', '500100', '荣昌', 3, '023', '402460', 'Rongchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500228', '梁平县', '500100', '梁平', 3, '023', '405200', 'Liangping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500229', '城口县', '500100', '城口', 3, '023', '405900', 'Chengkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500230', '丰都县', '500100', '丰都', 3, '023', '408200', 'Fengdu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500231', '垫江县', '500100', '垫江', 3, '023', '408300', 'Dianjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500232', '武隆县', '500100', '武隆', 3, '023', '408500', 'Wulong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500233', '忠县', '500100', '忠县', 3, '023', '404300', 'Zhongxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500234', '开县', '500100', '开县', 3, '023', '405400', 'Kaixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500235', '云阳县', '500100', '云阳', 3, '023', '404500', 'Yunyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500236', '奉节县', '500100', '奉节', 3, '023', '404600', 'Fengjie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500237', '巫山县', '500100', '巫山', 3, '023', '404700', 'Wushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500238', '巫溪县', '500100', '巫溪', 3, '023', '405800', 'Wuxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500240', '石柱土家族自治县', '500100', '石柱', 3, '023', '409100', 'Shizhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500241', '秀山土家族苗族自治县', '500100', '秀山', 3, '023', '409900', 'Xiushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500242', '酉阳土家族苗族自治县', '500100', '酉阳', 3, '023', '409800', 'Youyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500243', '彭水苗族土家族自治县', '500100', '彭水', 3, '023', '409600', 'Pengshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500300', '两江新区', '500000', '两江新区', 2, '023', '400000', 'Liangjiangxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500301', '北部新区', '500300', '北部新区', 3, '023', '400000', 'Beibuxinqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500302', '保税港区', '500300', '保税港区', 3, '023', '400000', 'Baoshuigangqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('500303', '工业园区', '500300', '工业园区', 3, '023', '400000', 'Gongyeyuanqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510000', '四川省', '100000', '四川', 1, '', '', 'Sichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510100', '成都市', '510000', '成都', 2, '028', '610015', 'Chengdu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510104', '锦江区', '510100', '锦江', 3, '028', '610021', 'Jinjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510105', '青羊区', '510100', '青羊', 3, '028', '610031', 'Qingyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510106', '金牛区', '510100', '金牛', 3, '028', '610036', 'Jinniu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510107', '武侯区', '510100', '武侯', 3, '028', '610041', 'Wuhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510108', '成华区', '510100', '成华', 3, '028', '610066', 'Chenghua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510112', '龙泉驿区', '510100', '龙泉驿', 3, '028', '610100', 'Longquanyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510113', '青白江区', '510100', '青白江', 3, '028', '610300', 'Qingbaijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510114', '新都区', '510100', '新都', 3, '028', '610500', 'Xindu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510115', '温江区', '510100', '温江', 3, '028', '611130', 'Wenjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510121', '金堂县', '510100', '金堂', 3, '028', '610400', 'Jintang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510122', '双流县', '510100', '双流', 3, '028', '610200', 'Shuangliu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510124', '郫县', '510100', '郫县', 3, '028', '611730', 'Pixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510129', '大邑县', '510100', '大邑', 3, '028', '611330', 'Dayi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510131', '蒲江县', '510100', '蒲江', 3, '028', '611630', 'Pujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510132', '新津县', '510100', '新津', 3, '028', '611430', 'Xinjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510181', '都江堰市', '510100', '都江堰', 3, '028', '611830', 'Dujiangyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510182', '彭州市', '510100', '彭州', 3, '028', '611930', 'Pengzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510183', '邛崃市', '510100', '邛崃', 3, '028', '611530', 'Qionglai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510184', '崇州市', '510100', '崇州', 3, '028', '611230', 'Chongzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510300', '自贡市', '510000', '自贡', 2, '0813', '643000', 'Zigong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510302', '自流井区', '510300', '自流井', 3, '0813', '643000', 'Ziliujing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510303', '贡井区', '510300', '贡井', 3, '0813', '643020', 'Gongjing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510304', '大安区', '510300', '大安', 3, '0813', '643010', 'Daan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510311', '沿滩区', '510300', '沿滩', 3, '0813', '643030', 'Yantan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510321', '荣县', '510300', '荣县', 3, '0813', '643100', 'Rongxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510322', '富顺县', '510300', '富顺', 3, '0813', '643200', 'Fushun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510400', '攀枝花市', '510000', '攀枝花', 2, '0812', '617000', 'Panzhihua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510402', '东区', '510400', '东区', 3, '0812', '617067', 'Dongqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510403', '西区', '510400', '西区', 3, '0812', '617068', 'Xiqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510411', '仁和区', '510400', '仁和', 3, '0812', '617061', 'Renhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510421', '米易县', '510400', '米易', 3, '0812', '617200', 'Miyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510422', '盐边县', '510400', '盐边', 3, '0812', '617100', 'Yanbian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510500', '泸州市', '510000', '泸州', 2, '0830', '646000', 'Luzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510502', '江阳区', '510500', '江阳', 3, '0830', '646000', 'Jiangyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510503', '纳溪区', '510500', '纳溪', 3, '0830', '646300', 'Naxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510504', '龙马潭区', '510500', '龙马潭', 3, '0830', '646000', 'Longmatan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510521', '泸县', '510500', '泸县', 3, '0830', '646106', 'Luxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510522', '合江县', '510500', '合江', 3, '0830', '646200', 'Hejiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510524', '叙永县', '510500', '叙永', 3, '0830', '646400', 'Xuyong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510525', '古蔺县', '510500', '古蔺', 3, '0830', '646500', 'Gulin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510600', '德阳市', '510000', '德阳', 2, '0838', '618000', 'Deyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510603', '旌阳区', '510600', '旌阳', 3, '0838', '618000', 'Jingyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510623', '中江县', '510600', '中江', 3, '0838', '618100', 'Zhongjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510626', '罗江县', '510600', '罗江', 3, '0838', '618500', 'Luojiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510681', '广汉市', '510600', '广汉', 3, '0838', '618300', 'Guanghan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510682', '什邡市', '510600', '什邡', 3, '0838', '618400', 'Shifang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510683', '绵竹市', '510600', '绵竹', 3, '0838', '618200', 'Mianzhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510700', '绵阳市', '510000', '绵阳', 2, '0816', '621000', 'Mianyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510703', '涪城区', '510700', '涪城', 3, '0816', '621000', 'Fucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510704', '游仙区', '510700', '游仙', 3, '0816', '621022', 'Youxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510722', '三台县', '510700', '三台', 3, '0816', '621100', 'Santai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510723', '盐亭县', '510700', '盐亭', 3, '0816', '621600', 'Yanting', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510724', '安县', '510700', '安县', 3, '0816', '622650', 'Anxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510725', '梓潼县', '510700', '梓潼', 3, '0816', '622150', 'Zitong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510726', '北川羌族自治县', '510700', '北川', 3, '0816', '622750', 'Beichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510727', '平武县', '510700', '平武', 3, '0816', '622550', 'Pingwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510781', '江油市', '510700', '江油', 3, '0816', '621700', 'Jiangyou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510800', '广元市', '510000', '广元', 2, '0839', '628000', 'Guangyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510802', '利州区', '510800', '利州', 3, '0839', '628017', 'Lizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510811', '昭化区', '510800', '昭化', 3, '0839', '628017', 'Zhaohua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510812', '朝天区', '510800', '朝天', 3, '0839', '628017', 'Chaotian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510821', '旺苍县', '510800', '旺苍', 3, '0839', '628200', 'Wangcang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510822', '青川县', '510800', '青川', 3, '0839', '628100', 'Qingchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510823', '剑阁县', '510800', '剑阁', 3, '0839', '628300', 'Jiange', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510824', '苍溪县', '510800', '苍溪', 3, '0839', '628400', 'Cangxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510900', '遂宁市', '510000', '遂宁', 2, '0825', '629000', 'Suining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510903', '船山区', '510900', '船山', 3, '0825', '629000', 'Chuanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510904', '安居区', '510900', '安居', 3, '0825', '629000', 'Anju', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510921', '蓬溪县', '510900', '蓬溪', 3, '0825', '629100', 'Pengxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510922', '射洪县', '510900', '射洪', 3, '0825', '629200', 'Shehong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('510923', '大英县', '510900', '大英', 3, '0825', '629300', 'Daying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511000', '内江市', '510000', '内江', 2, '0832', '641000', 'Neijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511002', '市中区', '511000', '市中区', 3, '0832', '641000', 'Shizhongqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511011', '东兴区', '511000', '东兴', 3, '0832', '641100', 'Dongxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511024', '威远县', '511000', '威远', 3, '0832', '642450', 'Weiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511025', '资中县', '511000', '资中', 3, '0832', '641200', 'Zizhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511028', '隆昌县', '511000', '隆昌', 3, '0832', '642150', 'Longchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511100', '乐山市', '510000', '乐山', 2, '0833', '614000', 'Leshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511102', '市中区', '511100', '市中区', 3, '0833', '614000', 'Shizhongqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511111', '沙湾区', '511100', '沙湾', 3, '0833', '614900', 'Shawan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511112', '五通桥区', '511100', '五通桥', 3, '0833', '614800', 'Wutongqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511113', '金口河区', '511100', '金口河', 3, '0833', '614700', 'Jinkouhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511123', '犍为县', '511100', '犍为', 3, '0833', '614400', 'Qianwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511124', '井研县', '511100', '井研', 3, '0833', '613100', 'Jingyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511126', '夹江县', '511100', '夹江', 3, '0833', '614100', 'Jiajiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511129', '沐川县', '511100', '沐川', 3, '0833', '614500', 'Muchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511132', '峨边彝族自治县', '511100', '峨边', 3, '0833', '614300', 'Ebian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511133', '马边彝族自治县', '511100', '马边', 3, '0833', '614600', 'Mabian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511181', '峨眉山市', '511100', '峨眉山', 3, '0833', '614200', 'Emeishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511300', '南充市', '510000', '南充', 2, '0817', '637000', 'Nanchong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511302', '顺庆区', '511300', '顺庆', 3, '0817', '637000', 'Shunqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511303', '高坪区', '511300', '高坪', 3, '0817', '637100', 'Gaoping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511304', '嘉陵区', '511300', '嘉陵', 3, '0817', '637100', 'Jialing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511321', '南部县', '511300', '南部', 3, '0817', '637300', 'Nanbu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511322', '营山县', '511300', '营山', 3, '0817', '637700', 'Yingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511323', '蓬安县', '511300', '蓬安', 3, '0817', '637800', 'Pengan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511324', '仪陇县', '511300', '仪陇', 3, '0817', '637600', 'Yilong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511325', '西充县', '511300', '西充', 3, '0817', '637200', 'Xichong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511381', '阆中市', '511300', '阆中', 3, '0817', '637400', 'Langzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511400', '眉山市', '510000', '眉山', 2, '028', '620020', 'Meishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511402', '东坡区', '511400', '东坡', 3, '028', '620010', 'Dongpo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511403', '彭山区', '511400', '彭山', 3, '028', '620860', 'Pengshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511421', '仁寿县', '511400', '仁寿', 3, '028', '620500', 'Renshou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511423', '洪雅县', '511400', '洪雅', 3, '028', '620360', 'Hongya', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511424', '丹棱县', '511400', '丹棱', 3, '028', '620200', 'Danling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511425', '青神县', '511400', '青神', 3, '028', '620460', 'Qingshen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511500', '宜宾市', '510000', '宜宾', 2, '0831', '644000', 'Yibin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511502', '翠屏区', '511500', '翠屏', 3, '0831', '644000', 'Cuiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511503', '南溪区', '511500', '南溪', 3, '0831', '644100', 'Nanxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511521', '宜宾县', '511500', '宜宾', 3, '0831', '644600', 'Yibin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511523', '江安县', '511500', '江安', 3, '0831', '644200', 'Jiangan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511524', '长宁县', '511500', '长宁', 3, '0831', '644300', 'Changning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511525', '高县', '511500', '高县', 3, '0831', '645150', 'Gaoxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511526', '珙县', '511500', '珙县', 3, '0831', '644500', 'Gongxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511527', '筠连县', '511500', '筠连', 3, '0831', '645250', 'Junlian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511528', '兴文县', '511500', '兴文', 3, '0831', '644400', 'Xingwen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511529', '屏山县', '511500', '屏山', 3, '0831', '645350', 'Pingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511600', '广安市', '510000', '广安', 2, '0826', '638000', 'Guangan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511602', '广安区', '511600', '广安', 3, '0826', '638000', 'Guangan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511603', '前锋区', '511600', '前锋', 3, '0826', '638019', 'Qianfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511621', '岳池县', '511600', '岳池', 3, '0826', '638300', 'Yuechi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511622', '武胜县', '511600', '武胜', 3, '0826', '638400', 'Wusheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511623', '邻水县', '511600', '邻水', 3, '0826', '638500', 'Linshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511681', '华蓥市', '511600', '华蓥', 3, '0826', '638600', 'Huaying', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511700', '达州市', '510000', '达州', 2, '0818', '635000', 'Dazhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511702', '通川区', '511700', '通川', 3, '0818', '635000', 'Tongchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511703', '达川区', '511700', '达川', 3, '0818', '635000', 'Dachuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511722', '宣汉县', '511700', '宣汉', 3, '0818', '636150', 'Xuanhan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511723', '开江县', '511700', '开江', 3, '0818', '636250', 'Kaijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511724', '大竹县', '511700', '大竹', 3, '0818', '635100', 'Dazhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511725', '渠县', '511700', '渠县', 3, '0818', '635200', 'Quxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511781', '万源市', '511700', '万源', 3, '0818', '636350', 'Wanyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511800', '雅安市', '510000', '雅安', 2, '0835', '625000', 'Yaan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511802', '雨城区', '511800', '雨城', 3, '0835', '625000', 'Yucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511803', '名山区', '511800', '名山', 3, '0835', '625100', 'Mingshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511822', '荥经县', '511800', '荥经', 3, '0835', '625200', 'Yingjing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511823', '汉源县', '511800', '汉源', 3, '0835', '625300', 'Hanyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511824', '石棉县', '511800', '石棉', 3, '0835', '625400', 'Shimian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511825', '天全县', '511800', '天全', 3, '0835', '625500', 'Tianquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511826', '芦山县', '511800', '芦山', 3, '0835', '625600', 'Lushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511827', '宝兴县', '511800', '宝兴', 3, '0835', '625700', 'Baoxing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511900', '巴中市', '510000', '巴中', 2, '0827', '636000', 'Bazhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511902', '巴州区', '511900', '巴州', 3, '0827', '636001', 'Bazhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511903', '恩阳区', '511900', '恩阳', 3, '0827', '636064', 'Enyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511921', '通江县', '511900', '通江', 3, '0827', '636700', 'Tongjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511922', '南江县', '511900', '南江', 3, '0827', '636600', 'Nanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('511923', '平昌县', '511900', '平昌', 3, '0827', '636400', 'Pingchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('512000', '资阳市', '510000', '资阳', 2, '028', '641300', 'Ziyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('512002', '雁江区', '512000', '雁江', 3, '028', '641300', 'Yanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('512021', '安岳县', '512000', '安岳', 3, '028', '642350', 'Anyue', NULL, NULL);
INSERT INTO `tb_address` VALUES ('512022', '乐至县', '512000', '乐至', 3, '028', '641500', 'Lezhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('512081', '简阳市', '512000', '简阳', 3, '028', '641400', 'Jianyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '阿坝', 2, '0837', '624000', 'Aba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513221', '汶川县', '513200', '汶川', 3, '0837', '623000', 'Wenchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513222', '理县', '513200', '理县', 3, '0837', '623100', 'Lixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513223', '茂县', '513200', '茂县', 3, '0837', '623200', 'Maoxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513224', '松潘县', '513200', '松潘', 3, '0837', '623300', 'Songpan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513225', '九寨沟县', '513200', '九寨沟', 3, '0837', '623400', 'Jiuzhaigou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513226', '金川县', '513200', '金川', 3, '0837', '624100', 'Jinchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513227', '小金县', '513200', '小金', 3, '0837', '624200', 'Xiaojin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513228', '黑水县', '513200', '黑水', 3, '0837', '623500', 'Heishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513229', '马尔康县', '513200', '马尔康', 3, '0837', '624000', 'Maerkang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513230', '壤塘县', '513200', '壤塘', 3, '0837', '624300', 'Rangtang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513231', '阿坝县', '513200', '阿坝', 3, '0837', '624600', 'Aba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513232', '若尔盖县', '513200', '若尔盖', 3, '0837', '624500', 'Ruoergai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513233', '红原县', '513200', '红原', 3, '0837', '624400', 'Hongyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513300', '甘孜藏族自治州', '510000', '甘孜', 2, '0836', '626000', 'Garze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513321', '康定县', '513300', '康定', 3, '0836', '626000', 'Kangding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513322', '泸定县', '513300', '泸定', 3, '0836', '626100', 'Luding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513323', '丹巴县', '513300', '丹巴', 3, '0836', '626300', 'Danba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513324', '九龙县', '513300', '九龙', 3, '0836', '626200', 'Jiulong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513325', '雅江县', '513300', '雅江', 3, '0836', '627450', 'Yajiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513326', '道孚县', '513300', '道孚', 3, '0836', '626400', 'Daofu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513327', '炉霍县', '513300', '炉霍', 3, '0836', '626500', 'Luhuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513328', '甘孜县', '513300', '甘孜', 3, '0836', '626700', 'Ganzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513329', '新龙县', '513300', '新龙', 3, '0836', '626800', 'Xinlong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513330', '德格县', '513300', '德格', 3, '0836', '627250', 'Dege', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513331', '白玉县', '513300', '白玉', 3, '0836', '627150', 'Baiyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513332', '石渠县', '513300', '石渠', 3, '0836', '627350', 'Shiqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513333', '色达县', '513300', '色达', 3, '0836', '626600', 'Seda', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513334', '理塘县', '513300', '理塘', 3, '0836', '627550', 'Litang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513335', '巴塘县', '513300', '巴塘', 3, '0836', '627650', 'Batang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513336', '乡城县', '513300', '乡城', 3, '0836', '627850', 'Xiangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513337', '稻城县', '513300', '稻城', 3, '0836', '627750', 'Daocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513338', '得荣县', '513300', '得荣', 3, '0836', '627950', 'Derong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513400', '凉山彝族自治州', '510000', '凉山', 2, '0834', '615000', 'Liangshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513401', '西昌市', '513400', '西昌', 3, '0835', '615000', 'Xichang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513422', '木里藏族自治县', '513400', '木里', 3, '0851', '615800', 'Muli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513423', '盐源县', '513400', '盐源', 3, '0836', '615700', 'Yanyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513424', '德昌县', '513400', '德昌', 3, '0837', '615500', 'Dechang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513425', '会理县', '513400', '会理', 3, '0838', '615100', 'Huili', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513426', '会东县', '513400', '会东', 3, '0839', '615200', 'Huidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513427', '宁南县', '513400', '宁南', 3, '0840', '615400', 'Ningnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513428', '普格县', '513400', '普格', 3, '0841', '615300', 'Puge', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513429', '布拖县', '513400', '布拖', 3, '0842', '616350', 'Butuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513430', '金阳县', '513400', '金阳', 3, '0843', '616250', 'Jinyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513431', '昭觉县', '513400', '昭觉', 3, '0844', '616150', 'Zhaojue', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513432', '喜德县', '513400', '喜德', 3, '0845', '616750', 'Xide', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513433', '冕宁县', '513400', '冕宁', 3, '0846', '615600', 'Mianning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513434', '越西县', '513400', '越西', 3, '0847', '616650', 'Yuexi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513435', '甘洛县', '513400', '甘洛', 3, '0848', '616850', 'Ganluo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513436', '美姑县', '513400', '美姑', 3, '0849', '616450', 'Meigu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('513437', '雷波县', '513400', '雷波', 3, '0850', '616550', 'Leibo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520000', '贵州省', '100000', '贵州', 1, '', '', 'Guizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520100', '贵阳市', '520000', '贵阳', 2, '0851', '550001', 'Guiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520102', '南明区', '520100', '南明', 3, '0851', '550001', 'Nanming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520103', '云岩区', '520100', '云岩', 3, '0851', '550001', 'Yunyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520111', '花溪区', '520100', '花溪', 3, '0851', '550025', 'Huaxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520112', '乌当区', '520100', '乌当', 3, '0851', '550018', 'Wudang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520113', '白云区', '520100', '白云', 3, '0851', '550014', 'Baiyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520115', '观山湖区', '520100', '观山湖', 3, '0851', '550009', 'Guanshanhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520121', '开阳县', '520100', '开阳', 3, '0851', '550300', 'Kaiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520122', '息烽县', '520100', '息烽', 3, '0851', '551100', 'Xifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520123', '修文县', '520100', '修文', 3, '0851', '550200', 'Xiuwen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520181', '清镇市', '520100', '清镇', 3, '0851', '551400', 'Qingzhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520200', '六盘水市', '520000', '六盘水', 2, '0858', '553400', 'Liupanshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520201', '钟山区', '520200', '钟山', 3, '0858', '553000', 'Zhongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520203', '六枝特区', '520200', '六枝', 3, '0858', '553400', 'Liuzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520221', '水城县', '520200', '水城', 3, '0858', '553000', 'Shuicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520222', '盘县', '520200', '盘县', 3, '0858', '561601', 'Panxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520300', '遵义市', '520000', '遵义', 2, '0852', '563000', 'Zunyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520302', '红花岗区', '520300', '红花岗', 3, '0852', '563000', 'Honghuagang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520303', '汇川区', '520300', '汇川', 3, '0852', '563000', 'Huichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520321', '遵义县', '520300', '遵义', 3, '0852', '563100', 'Zunyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520322', '桐梓县', '520300', '桐梓', 3, '0852', '563200', 'Tongzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520323', '绥阳县', '520300', '绥阳', 3, '0852', '563300', 'Suiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520324', '正安县', '520300', '正安', 3, '0852', '563400', 'Zhengan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '道真', 3, '0852', '563500', 'Daozhen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '务川', 3, '0852', '564300', 'Wuchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520327', '凤冈县', '520300', '凤冈', 3, '0852', '564200', 'Fenggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520328', '湄潭县', '520300', '湄潭', 3, '0852', '564100', 'Meitan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520329', '余庆县', '520300', '余庆', 3, '0852', '564400', 'Yuqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520330', '习水县', '520300', '习水', 3, '0852', '564600', 'Xishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520381', '赤水市', '520300', '赤水', 3, '0852', '564700', 'Chishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520382', '仁怀市', '520300', '仁怀', 3, '0852', '564500', 'Renhuai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520400', '安顺市', '520000', '安顺', 2, '0853', '561000', 'Anshun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520402', '西秀区', '520400', '西秀', 3, '0853', '561000', 'Xixiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520421', '平坝区', '520400', '平坝', 3, '0853', '561100', 'Pingba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520422', '普定县', '520400', '普定', 3, '0853', '562100', 'Puding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '镇宁', 3, '0853', '561200', 'Zhenning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520424', '关岭布依族苗族自治县', '520400', '关岭', 3, '0853', '561300', 'Guanling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520425', '紫云苗族布依族自治县', '520400', '紫云', 3, '0853', '550800', 'Ziyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520500', '毕节市', '520000', '毕节', 2, '0857', '551700', 'Bijie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520502', '七星关区', '520500', '七星关', 3, '0857', '551700', 'Qixingguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520521', '大方县', '520500', '大方', 3, '0857', '551600', 'Dafang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520522', '黔西县', '520500', '黔西', 3, '0857', '551500', 'Qianxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520523', '金沙县', '520500', '金沙', 3, '0857', '551800', 'Jinsha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520524', '织金县', '520500', '织金', 3, '0857', '552100', 'Zhijin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520525', '纳雍县', '520500', '纳雍', 3, '0857', '553300', 'Nayong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520526', '威宁彝族回族苗族自治县', '520500', '威宁', 3, '0857', '553100', 'Weining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520527', '赫章县', '520500', '赫章', 3, '0857', '553200', 'Hezhang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520600', '铜仁市', '520000', '铜仁', 2, '0856', '554300', 'Tongren', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520602', '碧江区', '520600', '碧江', 3, '0856', '554300', 'Bijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520603', '万山区', '520600', '万山', 3, '0856', '554200', 'Wanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520621', '江口县', '520600', '江口', 3, '0856', '554400', 'Jiangkou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520622', '玉屏侗族自治县', '520600', '玉屏', 3, '0856', '554004', 'Yuping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520623', '石阡县', '520600', '石阡', 3, '0856', '555100', 'Shiqian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520624', '思南县', '520600', '思南', 3, '0856', '565100', 'Sinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520625', '印江土家族苗族自治县', '520600', '印江', 3, '0856', '555200', 'Yinjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520626', '德江县', '520600', '德江', 3, '0856', '565200', 'Dejiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520627', '沿河土家族自治县', '520600', '沿河', 3, '0856', '565300', 'Yuanhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('520628', '松桃苗族自治县', '520600', '松桃', 3, '0856', '554100', 'Songtao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '黔西南', 2, '0859', '562400', 'Qianxinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522301', '兴义市 ', '522300', '兴义', 3, '0859', '562400', 'Xingyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522322', '兴仁县', '522300', '兴仁', 3, '0859', '562300', 'Xingren', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522323', '普安县', '522300', '普安', 3, '0859', '561500', 'Puan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522324', '晴隆县', '522300', '晴隆', 3, '0859', '561400', 'Qinglong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522325', '贞丰县', '522300', '贞丰', 3, '0859', '562200', 'Zhenfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522326', '望谟县', '522300', '望谟', 3, '0859', '552300', 'Wangmo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522327', '册亨县', '522300', '册亨', 3, '0859', '552200', 'Ceheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522328', '安龙县', '522300', '安龙', 3, '0859', '552400', 'Anlong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '黔东南', 2, '0855', '556000', 'Qiandongnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522601', '凯里市', '522600', '凯里', 3, '0855', '556000', 'Kaili', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522622', '黄平县', '522600', '黄平', 3, '0855', '556100', 'Huangping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522623', '施秉县', '522600', '施秉', 3, '0855', '556200', 'Shibing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522624', '三穗县', '522600', '三穗', 3, '0855', '556500', 'Sansui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522625', '镇远县', '522600', '镇远', 3, '0855', '557700', 'Zhenyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522626', '岑巩县', '522600', '岑巩', 3, '0855', '557800', 'Cengong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522627', '天柱县', '522600', '天柱', 3, '0855', '556600', 'Tianzhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522628', '锦屏县', '522600', '锦屏', 3, '0855', '556700', 'Jinping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522629', '剑河县', '522600', '剑河', 3, '0855', '556400', 'Jianhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522630', '台江县', '522600', '台江', 3, '0855', '556300', 'Taijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522631', '黎平县', '522600', '黎平', 3, '0855', '557300', 'Liping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522632', '榕江县', '522600', '榕江', 3, '0855', '557200', 'Rongjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522633', '从江县', '522600', '从江', 3, '0855', '557400', 'Congjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522634', '雷山县', '522600', '雷山', 3, '0855', '557100', 'Leishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522635', '麻江县', '522600', '麻江', 3, '0855', '557600', 'Majiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522636', '丹寨县', '522600', '丹寨', 3, '0855', '557500', 'Danzhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522700', '黔南布依族苗族自治州', '520000', '黔南', 2, '0854', '558000', 'Qiannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522701', '都匀市', '522700', '都匀', 3, '0854', '558000', 'Duyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522702', '福泉市', '522700', '福泉', 3, '0854', '550500', 'Fuquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522722', '荔波县', '522700', '荔波', 3, '0854', '558400', 'Libo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522723', '贵定县', '522700', '贵定', 3, '0854', '551300', 'Guiding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522725', '瓮安县', '522700', '瓮安', 3, '0854', '550400', 'Wengan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522726', '独山县', '522700', '独山', 3, '0854', '558200', 'Dushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522727', '平塘县', '522700', '平塘', 3, '0854', '558300', 'Pingtang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522728', '罗甸县', '522700', '罗甸', 3, '0854', '550100', 'Luodian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522729', '长顺县', '522700', '长顺', 3, '0854', '550700', 'Changshun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522730', '龙里县', '522700', '龙里', 3, '0854', '551200', 'Longli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522731', '惠水县', '522700', '惠水', 3, '0854', '550600', 'Huishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('522732', '三都水族自治县', '522700', '三都', 3, '0854', '558100', 'Sandu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530000', '云南省', '100000', '云南', 1, '', '', 'Yunnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530100', '昆明市', '530000', '昆明', 2, '0871', '650500', 'Kunming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530102', '五华区', '530100', '五华', 3, '0871', '650021', 'Wuhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530103', '盘龙区', '530100', '盘龙', 3, '0871', '650051', 'Panlong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530111', '官渡区', '530100', '官渡', 3, '0871', '650200', 'Guandu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530112', '西山区', '530100', '西山', 3, '0871', '650118', 'Xishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530113', '东川区', '530100', '东川', 3, '0871', '654100', 'Dongchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530114', '呈贡区', '530100', '呈贡', 3, '0871', '650500', 'Chenggong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530122', '晋宁县', '530100', '晋宁', 3, '0871', '650600', 'Jinning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530124', '富民县', '530100', '富民', 3, '0871', '650400', 'Fumin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530125', '宜良县', '530100', '宜良', 3, '0871', '652100', 'Yiliang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530126', '石林彝族自治县', '530100', '石林', 3, '0871', '652200', 'Shilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530127', '嵩明县', '530100', '嵩明', 3, '0871', '651700', 'Songming', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '禄劝', 3, '0871', '651500', 'Luquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530129', '寻甸回族彝族自治县 ', '530100', '寻甸', 3, '0871', '655200', 'Xundian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530181', '安宁市', '530100', '安宁', 3, '0871', '650300', 'Anning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530300', '曲靖市', '530000', '曲靖', 2, '0874', '655000', 'Qujing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530302', '麒麟区', '530300', '麒麟', 3, '0874', '655000', 'Qilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530321', '马龙县', '530300', '马龙', 3, '0874', '655100', 'Malong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530322', '陆良县', '530300', '陆良', 3, '0874', '655600', 'Luliang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530323', '师宗县', '530300', '师宗', 3, '0874', '655700', 'Shizong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530324', '罗平县', '530300', '罗平', 3, '0874', '655800', 'Luoping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530325', '富源县', '530300', '富源', 3, '0874', '655500', 'Fuyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530326', '会泽县', '530300', '会泽', 3, '0874', '654200', 'Huize', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530328', '沾益县', '530300', '沾益', 3, '0874', '655331', 'Zhanyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530381', '宣威市', '530300', '宣威', 3, '0874', '655400', 'Xuanwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530400', '玉溪市', '530000', '玉溪', 2, '0877', '653100', 'Yuxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530402', '红塔区', '530400', '红塔', 3, '0877', '653100', 'Hongta', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530421', '江川县', '530400', '江川', 3, '0877', '652600', 'Jiangchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530422', '澄江县', '530400', '澄江', 3, '0877', '652500', 'Chengjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530423', '通海县', '530400', '通海', 3, '0877', '652700', 'Tonghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530424', '华宁县', '530400', '华宁', 3, '0877', '652800', 'Huaning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530425', '易门县', '530400', '易门', 3, '0877', '651100', 'Yimen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530426', '峨山彝族自治县', '530400', '峨山', 3, '0877', '653200', 'Eshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530427', '新平彝族傣族自治县', '530400', '新平', 3, '0877', '653400', 'Xinping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '元江', 3, '0877', '653300', 'Yuanjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530500', '保山市', '530000', '保山', 2, '0875', '678000', 'Baoshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530502', '隆阳区', '530500', '隆阳', 3, '0875', '678000', 'Longyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530521', '施甸县', '530500', '施甸', 3, '0875', '678200', 'Shidian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530522', '腾冲县', '530500', '腾冲', 3, '0875', '679100', 'Tengchong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530523', '龙陵县', '530500', '龙陵', 3, '0875', '678300', 'Longling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530524', '昌宁县', '530500', '昌宁', 3, '0875', '678100', 'Changning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530600', '昭通市', '530000', '昭通', 2, '0870', '657000', 'Zhaotong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530602', '昭阳区', '530600', '昭阳', 3, '0870', '657000', 'Zhaoyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530621', '鲁甸县', '530600', '鲁甸', 3, '0870', '657100', 'Ludian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530622', '巧家县', '530600', '巧家', 3, '0870', '654600', 'Qiaojia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530623', '盐津县', '530600', '盐津', 3, '0870', '657500', 'Yanjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530624', '大关县', '530600', '大关', 3, '0870', '657400', 'Daguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530625', '永善县', '530600', '永善', 3, '0870', '657300', 'Yongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530626', '绥江县', '530600', '绥江', 3, '0870', '657700', 'Suijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530627', '镇雄县', '530600', '镇雄', 3, '0870', '657200', 'Zhenxiong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530628', '彝良县', '530600', '彝良', 3, '0870', '657600', 'Yiliang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530629', '威信县', '530600', '威信', 3, '0870', '657900', 'Weixin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530630', '水富县', '530600', '水富', 3, '0870', '657800', 'Shuifu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530700', '丽江市', '530000', '丽江', 2, '0888', '674100', 'Lijiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530702', '古城区', '530700', '古城', 3, '0888', '674100', 'Gucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530721', '玉龙纳西族自治县', '530700', '玉龙', 3, '0888', '674100', 'Yulong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530722', '永胜县', '530700', '永胜', 3, '0888', '674200', 'Yongsheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530723', '华坪县', '530700', '华坪', 3, '0888', '674800', 'Huaping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530724', '宁蒗彝族自治县', '530700', '宁蒗', 3, '0888', '674300', 'Ninglang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530800', '普洱市', '530000', '普洱', 2, '0879', '665000', 'Puer', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530802', '思茅区', '530800', '思茅', 3, '0879', '665000', 'Simao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530821', '宁洱哈尼族彝族自治县', '530800', '宁洱', 3, '0879', '665100', 'Ninger', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530822', '墨江哈尼族自治县', '530800', '墨江', 3, '0879', '654800', 'Mojiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530823', '景东彝族自治县', '530800', '景东', 3, '0879', '676200', 'Jingdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530824', '景谷傣族彝族自治县', '530800', '景谷', 3, '0879', '666400', 'Jinggu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '镇沅', 3, '0879', '666500', 'Zhenyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '江城', 3, '0879', '665900', 'Jiangcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '孟连', 3, '0879', '665800', 'Menglian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530828', '澜沧拉祜族自治县', '530800', '澜沧', 3, '0879', '665600', 'Lancang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530829', '西盟佤族自治县', '530800', '西盟', 3, '0879', '665700', 'Ximeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530900', '临沧市', '530000', '临沧', 2, '0883', '677000', 'Lincang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530902', '临翔区', '530900', '临翔', 3, '0883', '677000', 'Linxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530921', '凤庆县', '530900', '凤庆', 3, '0883', '675900', 'Fengqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530922', '云县', '530900', '云县', 3, '0883', '675800', 'Yunxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530923', '永德县', '530900', '永德', 3, '0883', '677600', 'Yongde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530924', '镇康县', '530900', '镇康', 3, '0883', '677704', 'Zhenkang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '双江', 3, '0883', '677300', 'Shuangjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530926', '耿马傣族佤族自治县', '530900', '耿马', 3, '0883', '677500', 'Gengma', NULL, NULL);
INSERT INTO `tb_address` VALUES ('530927', '沧源佤族自治县', '530900', '沧源', 3, '0883', '677400', 'Cangyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532300', '楚雄彝族自治州', '530000', '楚雄', 2, '0878', '675000', 'Chuxiong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532301', '楚雄市', '532300', '楚雄', 3, '0878', '675000', 'Chuxiong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532322', '双柏县', '532300', '双柏', 3, '0878', '675100', 'Shuangbai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532323', '牟定县', '532300', '牟定', 3, '0878', '675500', 'Mouding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532324', '南华县', '532300', '南华', 3, '0878', '675200', 'Nanhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532325', '姚安县', '532300', '姚安', 3, '0878', '675300', 'Yaoan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532326', '大姚县', '532300', '大姚', 3, '0878', '675400', 'Dayao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532327', '永仁县', '532300', '永仁', 3, '0878', '651400', 'Yongren', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532328', '元谋县', '532300', '元谋', 3, '0878', '651300', 'Yuanmou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532329', '武定县', '532300', '武定', 3, '0878', '651600', 'Wuding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532331', '禄丰县', '532300', '禄丰', 3, '0878', '651200', 'Lufeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '红河', 2, '0873', '661400', 'Honghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532501', '个旧市', '532500', '个旧', 3, '0873', '661000', 'Gejiu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532502', '开远市', '532500', '开远', 3, '0873', '661600', 'Kaiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532503', '蒙自市', '532500', '蒙自', 3, '0873', '661101', 'Mengzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532504', '弥勒市', '532500', '弥勒', 3, '0873', '652300', 'Mile ', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532523', '屏边苗族自治县', '532500', '屏边', 3, '0873', '661200', 'Pingbian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532524', '建水县', '532500', '建水', 3, '0873', '654300', 'Jianshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532525', '石屏县', '532500', '石屏', 3, '0873', '662200', 'Shiping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532527', '泸西县', '532500', '泸西', 3, '0873', '652400', 'Luxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532528', '元阳县', '532500', '元阳', 3, '0873', '662400', 'Yuanyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532529', '红河县', '532500', '红河县', 3, '0873', '654400', 'Honghexian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '金平', 3, '0873', '661500', 'Jinping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532531', '绿春县', '532500', '绿春', 3, '0873', '662500', 'Lvchun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532532', '河口瑶族自治县', '532500', '河口', 3, '0873', '661300', 'Hekou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532600', '文山壮族苗族自治州', '530000', '文山', 2, '0876', '663000', 'Wenshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532601', '文山市', '532600', '文山', 3, '0876', '663000', 'Wenshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532622', '砚山县', '532600', '砚山', 3, '0876', '663100', 'Yanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532623', '西畴县', '532600', '西畴', 3, '0876', '663500', 'Xichou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532624', '麻栗坡县', '532600', '麻栗坡', 3, '0876', '663600', 'Malipo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532625', '马关县', '532600', '马关', 3, '0876', '663700', 'Maguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532626', '丘北县', '532600', '丘北', 3, '0876', '663200', 'Qiubei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532627', '广南县', '532600', '广南', 3, '0876', '663300', 'Guangnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532628', '富宁县', '532600', '富宁', 3, '0876', '663400', 'Funing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532800', '西双版纳傣族自治州', '530000', '西双版纳', 2, '0691', '666100', 'Xishuangbanna', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532801', '景洪市', '532800', '景洪', 3, '0691', '666100', 'Jinghong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532822', '勐海县', '532800', '勐海', 3, '0691', '666200', 'Menghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532823', '勐腊县', '532800', '勐腊', 3, '0691', '666300', 'Mengla', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532900', '大理白族自治州', '530000', '大理', 2, '0872', '671000', 'Dali', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532901', '大理市', '532900', '大理', 3, '0872', '671000', 'Dali', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532922', '漾濞彝族自治县', '532900', '漾濞', 3, '0872', '672500', 'Yangbi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532923', '祥云县', '532900', '祥云', 3, '0872', '672100', 'Xiangyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532924', '宾川县', '532900', '宾川', 3, '0872', '671600', 'Binchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532925', '弥渡县', '532900', '弥渡', 3, '0872', '675600', 'Midu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532926', '南涧彝族自治县', '532900', '南涧', 3, '0872', '675700', 'Nanjian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532927', '巍山彝族回族自治县', '532900', '巍山', 3, '0872', '672400', 'Weishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532928', '永平县', '532900', '永平', 3, '0872', '672600', 'Yongping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532929', '云龙县', '532900', '云龙', 3, '0872', '672700', 'Yunlong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532930', '洱源县', '532900', '洱源', 3, '0872', '671200', 'Eryuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532931', '剑川县', '532900', '剑川', 3, '0872', '671300', 'Jianchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('532932', '鹤庆县', '532900', '鹤庆', 3, '0872', '671500', 'Heqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '德宏', 2, '0692', '678400', 'Dehong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533102', '瑞丽市', '533100', '瑞丽', 3, '0692', '678600', 'Ruili', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533103', '芒市', '533100', '芒市', 3, '0692', '678400', 'Mangshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533122', '梁河县', '533100', '梁河', 3, '0692', '679200', 'Lianghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533123', '盈江县', '533100', '盈江', 3, '0692', '679300', 'Yingjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533124', '陇川县', '533100', '陇川', 3, '0692', '678700', 'Longchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533300', '怒江傈僳族自治州', '530000', '怒江', 2, '0886', '673100', 'Nujiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533321', '泸水县', '533300', '泸水', 3, '0886', '673100', 'Lushui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533323', '福贡县', '533300', '福贡', 3, '0886', '673400', 'Fugong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '贡山', 3, '0886', '673500', 'Gongshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533325', '兰坪白族普米族自治县', '533300', '兰坪', 3, '0886', '671400', 'Lanping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533400', '迪庆藏族自治州', '530000', '迪庆', 2, '0887', '674400', 'Deqen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533421', '香格里拉市', '533400', '香格里拉', 3, '0887', '674400', 'Xianggelila', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533422', '德钦县', '533400', '德钦', 3, '0887', '674500', 'Deqin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('533423', '维西傈僳族自治县', '533400', '维西', 3, '0887', '674600', 'Weixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('53bba08ff88a42f8985d6c299b969bd9', 'cvxzv', '110101', NULL, 4, '010', '100010', NULL, NULL, NULL);
INSERT INTO `tb_address` VALUES ('540000', '西藏自治区', '100000', '西藏', 1, '', '', 'Tibet', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540100', '拉萨市', '540000', '拉萨', 2, '0891', '850000', 'Lhasa', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540102', '城关区', '540100', '城关', 3, '0891', '850000', 'Chengguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540121', '林周县', '540100', '林周', 3, '0891', '851600', 'Linzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540122', '当雄县', '540100', '当雄', 3, '0891', '851500', 'Dangxiong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540123', '尼木县', '540100', '尼木', 3, '0891', '851300', 'Nimu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540124', '曲水县', '540100', '曲水', 3, '0891', '850600', 'Qushui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540125', '堆龙德庆县', '540100', '堆龙德庆', 3, '0891', '851400', 'Duilongdeqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540126', '达孜县', '540100', '达孜', 3, '0891', '850100', 'Dazi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540127', '墨竹工卡县', '540100', '墨竹工卡', 3, '0891', '850200', 'Mozhugongka', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540200', '日喀则市', '540000', '日喀则', 2, '0892', '857000', 'Rikaze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540202', '桑珠孜区', '540200', '桑珠孜', 3, '0892', '857000', 'Sangzhuzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540221', '南木林县', '540200', '南木林', 3, '0892', '857100', 'Nanmulin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540222', '江孜县', '540200', '江孜', 3, '0892', '857400', 'Jiangzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540223', '定日县', '540200', '定日', 3, '0892', '858200', 'Dingri', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540224', '萨迦县', '540200', '萨迦', 3, '0892', '857800', 'Sajia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540225', '拉孜县', '540200', '拉孜', 3, '0892', '858100', 'Lazi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540226', '昂仁县', '540200', '昂仁', 3, '0892', '858500', 'Angren', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540227', '谢通门县', '540200', '谢通门', 3, '0892', '858900', 'Xietongmen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540228', '白朗县', '540200', '白朗', 3, '0892', '857300', 'Bailang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540229', '仁布县', '540200', '仁布', 3, '0892', '857200', 'Renbu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540230', '康马县', '540200', '康马', 3, '0892', '857500', 'Kangma', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540231', '定结县', '540200', '定结', 3, '0892', '857900', 'Dingjie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540232', '仲巴县', '540200', '仲巴', 3, '0892', '858800', 'Zhongba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540233', '亚东县', '540200', '亚东', 3, '0892', '857600', 'Yadong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540234', '吉隆县', '540200', '吉隆', 3, '0892', '858700', 'Jilong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540235', '聂拉木县', '540200', '聂拉木', 3, '0892', '858300', 'Nielamu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540236', '萨嘎县', '540200', '萨嘎', 3, '0892', '857800', 'Saga', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540237', '岗巴县', '540200', '岗巴', 3, '0892', '857700', 'Gangba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540300', '昌都市', '540000', '昌都', 2, '0895', '854000', 'Qamdo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540302', '卡若区', '540300', '昌都', 3, '0895', '854000', 'Karuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540321', '江达县', '540300', '江达', 3, '0895', '854100', 'Jiangda', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540322', '贡觉县', '540300', '贡觉', 3, '0895', '854200', 'Gongjue', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540323', '类乌齐县', '540300', '类乌齐', 3, '0895', '855600', 'Leiwuqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540324', '丁青县', '540300', '丁青', 3, '0895', '855700', 'Dingqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540325', '察雅县', '540300', '察雅', 3, '0895', '854300', 'Chaya', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540326', '八宿县', '540300', '八宿', 3, '0895', '854600', 'Basu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540327', '左贡县', '540300', '左贡', 3, '0895', '854400', 'Zuogong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540328', '芒康县', '540300', '芒康', 3, '0895', '854500', 'Mangkang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540329', '洛隆县', '540300', '洛隆', 3, '0895', '855400', 'Luolong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('540330', '边坝县', '540300', '边坝', 3, '0895', '855500', 'Bianba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542200', '山南地区', '540000', '山南', 2, '0893', '856000', 'Shannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542221', '乃东县', '542200', '乃东', 3, '0893', '856100', 'Naidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542222', '扎囊县', '542200', '扎囊', 3, '0893', '850800', 'Zhanang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542223', '贡嘎县', '542200', '贡嘎', 3, '0893', '850700', 'Gongga', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542224', '桑日县', '542200', '桑日', 3, '0893', '856200', 'Sangri', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542225', '琼结县', '542200', '琼结', 3, '0893', '856800', 'Qiongjie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542226', '曲松县', '542200', '曲松', 3, '0893', '856300', 'Qusong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542227', '措美县', '542200', '措美', 3, '0893', '856900', 'Cuomei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542228', '洛扎县', '542200', '洛扎', 3, '0893', '856600', 'Luozha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542229', '加查县', '542200', '加查', 3, '0893', '856400', 'Jiacha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542231', '隆子县', '542200', '隆子', 3, '0893', '856600', 'Longzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542232', '错那县', '542200', '错那', 3, '0893', '856700', 'Cuona', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542233', '浪卡子县', '542200', '浪卡子', 3, '0893', '851100', 'Langkazi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542400', '那曲地区', '540000', '那曲', 2, '0896', '852000', 'Nagqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542421', '那曲县', '542400', '那曲', 3, '0896', '852000', 'Naqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542422', '嘉黎县', '542400', '嘉黎', 3, '0896', '852400', 'Jiali', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542423', '比如县', '542400', '比如', 3, '0896', '852300', 'Biru', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542424', '聂荣县', '542400', '聂荣', 3, '0896', '853500', 'Nierong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542425', '安多县', '542400', '安多', 3, '0896', '853400', 'Anduo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542426', '申扎县', '542400', '申扎', 3, '0896', '853100', 'Shenzha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542427', '索县', '542400', '索县', 3, '0896', '852200', 'Suoxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542428', '班戈县', '542400', '班戈', 3, '0896', '852500', 'Bange', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542429', '巴青县', '542400', '巴青', 3, '0896', '852100', 'Baqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542430', '尼玛县', '542400', '尼玛', 3, '0896', '852600', 'Nima', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542431', '双湖县', '542400', '双湖', 3, '0896', '852600', 'Shuanghu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542500', '阿里地区', '540000', '阿里', 2, '0897', '859000', 'Ngari', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542521', '普兰县', '542500', '普兰', 3, '0897', '859500', 'Pulan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542522', '札达县', '542500', '札达', 3, '0897', '859600', 'Zhada', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542523', '噶尔县', '542500', '噶尔', 3, '0897', '859400', 'Gaer', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542524', '日土县', '542500', '日土', 3, '0897', '859700', 'Ritu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542525', '革吉县', '542500', '革吉', 3, '0897', '859100', 'Geji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542526', '改则县', '542500', '改则', 3, '0897', '859200', 'Gaize', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542527', '措勤县', '542500', '措勤', 3, '0897', '859300', 'Cuoqin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542600', '林芝地区', '540000', '林芝', 2, '0894', '850400', 'Nyingchi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542621', '林芝县', '542600', '林芝', 3, '0894', '850400', 'Linzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542622', '工布江达县', '542600', '工布江达', 3, '0894', '850300', 'Gongbujiangda', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542623', '米林县', '542600', '米林', 3, '0894', '850500', 'Milin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542624', '墨脱县', '542600', '墨脱', 3, '0894', '855300', 'Motuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542625', '波密县', '542600', '波密', 3, '0894', '855200', 'Bomi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542626', '察隅县', '542600', '察隅', 3, '0894', '855100', 'Chayu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('542627', '朗县', '542600', '朗县', 3, '0894', '856500', 'Langxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610000', '陕西省', '100000', '陕西', 1, '', '', 'Shaanxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610100', '西安市', '610000', '西安', 2, '029', '710003', 'Xian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610102', '新城区', '610100', '新城', 3, '029', '710004', 'Xincheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610103', '碑林区', '610100', '碑林', 3, '029', '710001', 'Beilin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610104', '莲湖区', '610100', '莲湖', 3, '029', '710003', 'Lianhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610111', '灞桥区', '610100', '灞桥', 3, '029', '710038', 'Baqiao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610112', '未央区', '610100', '未央', 3, '029', '710014', 'Weiyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610113', '雁塔区', '610100', '雁塔', 3, '029', '710061', 'Yanta', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610114', '阎良区', '610100', '阎良', 3, '029', '710087', 'Yanliang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610115', '临潼区', '610100', '临潼', 3, '029', '710600', 'Lintong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610116', '长安区', '610100', '长安', 3, '029', '710100', 'Changan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610122', '蓝田县', '610100', '蓝田', 3, '029', '710500', 'Lantian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610124', '周至县', '610100', '周至', 3, '029', '710400', 'Zhouzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610125', '户县', '610100', '户县', 3, '029', '710300', 'Huxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610126', '高陵区', '610100', '高陵', 3, '029', '710200', 'Gaoling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610200', '铜川市', '610000', '铜川', 2, '0919', '727100', 'Tongchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610202', '王益区', '610200', '王益', 3, '0919', '727000', 'Wangyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610203', '印台区', '610200', '印台', 3, '0919', '727007', 'Yintai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610204', '耀州区', '610200', '耀州', 3, '0919', '727100', 'Yaozhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610222', '宜君县', '610200', '宜君', 3, '0919', '727200', 'Yijun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610300', '宝鸡市', '610000', '宝鸡', 2, '0917', '721000', 'Baoji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610302', '渭滨区', '610300', '渭滨', 3, '0917', '721000', 'Weibin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610303', '金台区', '610300', '金台', 3, '0917', '721000', 'Jintai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610304', '陈仓区', '610300', '陈仓', 3, '0917', '721300', 'Chencang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610322', '凤翔县', '610300', '凤翔', 3, '0917', '721400', 'Fengxiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610323', '岐山县', '610300', '岐山', 3, '0917', '722400', 'Qishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610324', '扶风县', '610300', '扶风', 3, '0917', '722200', 'Fufeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610326', '眉县', '610300', '眉县', 3, '0917', '722300', 'Meixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610327', '陇县', '610300', '陇县', 3, '0917', '721200', 'Longxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610328', '千阳县', '610300', '千阳', 3, '0917', '721100', 'Qianyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610329', '麟游县', '610300', '麟游', 3, '0917', '721500', 'Linyou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610330', '凤县', '610300', '凤县', 3, '0917', '721700', 'Fengxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610331', '太白县', '610300', '太白', 3, '0917', '721600', 'Taibai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610400', '咸阳市', '610000', '咸阳', 2, '029', '712000', 'Xianyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610402', '秦都区', '610400', '秦都', 3, '029', '712000', 'Qindu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610403', '杨陵区', '610400', '杨陵', 3, '029', '712100', 'Yangling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610404', '渭城区', '610400', '渭城', 3, '029', '712000', 'Weicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610422', '三原县', '610400', '三原', 3, '029', '713800', 'Sanyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610423', '泾阳县', '610400', '泾阳', 3, '029', '713700', 'Jingyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610424', '乾县', '610400', '乾县', 3, '029', '713300', 'Qianxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610425', '礼泉县', '610400', '礼泉', 3, '029', '713200', 'Liquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610426', '永寿县', '610400', '永寿', 3, '029', '713400', 'Yongshou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610427', '彬县', '610400', '彬县', 3, '029', '713500', 'Binxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610428', '长武县', '610400', '长武', 3, '029', '713600', 'Changwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610429', '旬邑县', '610400', '旬邑', 3, '029', '711300', 'Xunyi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610430', '淳化县', '610400', '淳化', 3, '029', '711200', 'Chunhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610431', '武功县', '610400', '武功', 3, '029', '712200', 'Wugong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610481', '兴平市', '610400', '兴平', 3, '029', '713100', 'Xingping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610500', '渭南市', '610000', '渭南', 2, '0913', '714000', 'Weinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610502', '临渭区', '610500', '临渭', 3, '0913', '714000', 'Linwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610521', '华县', '610500', '华县', 3, '0913', '714100', 'Huaxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610522', '潼关县', '610500', '潼关', 3, '0913', '714300', 'Tongguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610523', '大荔县', '610500', '大荔', 3, '0913', '715100', 'Dali', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610524', '合阳县', '610500', '合阳', 3, '0913', '715300', 'Heyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610525', '澄城县', '610500', '澄城', 3, '0913', '715200', 'Chengcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610526', '蒲城县', '610500', '蒲城', 3, '0913', '715500', 'Pucheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610527', '白水县', '610500', '白水', 3, '0913', '715600', 'Baishui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610528', '富平县', '610500', '富平', 3, '0913', '711700', 'Fuping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610581', '韩城市', '610500', '韩城', 3, '0913', '715400', 'Hancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610582', '华阴市', '610500', '华阴', 3, '0913', '714200', 'Huayin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610600', '延安市', '610000', '延安', 2, '0911', '716000', 'Yanan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610602', '宝塔区', '610600', '宝塔', 3, '0911', '716000', 'Baota', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610621', '延长县', '610600', '延长', 3, '0911', '717100', 'Yanchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610622', '延川县', '610600', '延川', 3, '0911', '717200', 'Yanchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610623', '子长县', '610600', '子长', 3, '0911', '717300', 'Zichang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610624', '安塞县', '610600', '安塞', 3, '0911', '717400', 'Ansai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610625', '志丹县', '610600', '志丹', 3, '0911', '717500', 'Zhidan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610626', '吴起县', '610600', '吴起', 3, '0911', '717600', 'Wuqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610627', '甘泉县', '610600', '甘泉', 3, '0911', '716100', 'Ganquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610628', '富县', '610600', '富县', 3, '0911', '727500', 'Fuxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610629', '洛川县', '610600', '洛川', 3, '0911', '727400', 'Luochuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610630', '宜川县', '610600', '宜川', 3, '0911', '716200', 'Yichuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610631', '黄龙县', '610600', '黄龙', 3, '0911', '715700', 'Huanglong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610632', '黄陵县', '610600', '黄陵', 3, '0911', '727300', 'Huangling', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610700', '汉中市', '610000', '汉中', 2, '0916', '723000', 'Hanzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610702', '汉台区', '610700', '汉台', 3, '0916', '723000', 'Hantai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610721', '南郑县', '610700', '南郑', 3, '0916', '723100', 'Nanzheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610722', '城固县', '610700', '城固', 3, '0916', '723200', 'Chenggu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610723', '洋县', '610700', '洋县', 3, '0916', '723300', 'Yangxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610724', '西乡县', '610700', '西乡', 3, '0916', '723500', 'Xixiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610725', '勉县', '610700', '勉县', 3, '0916', '724200', 'Mianxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610726', '宁强县', '610700', '宁强', 3, '0916', '724400', 'Ningqiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610727', '略阳县', '610700', '略阳', 3, '0916', '724300', 'Lueyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610728', '镇巴县', '610700', '镇巴', 3, '0916', '723600', 'Zhenba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610729', '留坝县', '610700', '留坝', 3, '0916', '724100', 'Liuba', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610730', '佛坪县', '610700', '佛坪', 3, '0916', '723400', 'Foping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610800', '榆林市', '610000', '榆林', 2, '0912', '719000', 'Yulin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610802', '榆阳区', '610800', '榆阳', 3, '0912', '719000', 'Yuyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610821', '神木县', '610800', '神木', 3, '0912', '719300', 'Shenmu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610822', '府谷县', '610800', '府谷', 3, '0912', '719400', 'Fugu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610823', '横山县', '610800', '横山', 3, '0912', '719100', 'Hengshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610824', '靖边县', '610800', '靖边', 3, '0912', '718500', 'Jingbian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610825', '定边县', '610800', '定边', 3, '0912', '718600', 'Dingbian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610826', '绥德县', '610800', '绥德', 3, '0912', '718000', 'Suide', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610827', '米脂县', '610800', '米脂', 3, '0912', '718100', 'Mizhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610828', '佳县', '610800', '佳县', 3, '0912', '719200', 'Jiaxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610829', '吴堡县', '610800', '吴堡', 3, '0912', '718200', 'Wubu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610830', '清涧县', '610800', '清涧', 3, '0912', '718300', 'Qingjian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610831', '子洲县', '610800', '子洲', 3, '0912', '718400', 'Zizhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610900', '安康市', '610000', '安康', 2, '0915', '725000', 'Ankang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610902', '汉滨区', '610900', '汉滨', 3, '0915', '725000', 'Hanbin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610921', '汉阴县', '610900', '汉阴', 3, '0915', '725100', 'Hanyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610922', '石泉县', '610900', '石泉', 3, '0915', '725200', 'Shiquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610923', '宁陕县', '610900', '宁陕', 3, '0915', '711600', 'Ningshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610924', '紫阳县', '610900', '紫阳', 3, '0915', '725300', 'Ziyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610925', '岚皋县', '610900', '岚皋', 3, '0915', '725400', 'Langao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610926', '平利县', '610900', '平利', 3, '0915', '725500', 'Pingli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610927', '镇坪县', '610900', '镇坪', 3, '0915', '725600', 'Zhenping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610928', '旬阳县', '610900', '旬阳', 3, '0915', '725700', 'Xunyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('610929', '白河县', '610900', '白河', 3, '0915', '725800', 'Baihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611000', '商洛市', '610000', '商洛', 2, '0914', '726000', 'Shangluo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611002', '商州区', '611000', '商州', 3, '0914', '726000', 'Shangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611021', '洛南县', '611000', '洛南', 3, '0914', '726100', 'Luonan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611022', '丹凤县', '611000', '丹凤', 3, '0914', '726200', 'Danfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611023', '商南县', '611000', '商南', 3, '0914', '726300', 'Shangnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611024', '山阳县', '611000', '山阳', 3, '0914', '726400', 'Shanyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611025', '镇安县', '611000', '镇安', 3, '0914', '711500', 'Zhenan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611026', '柞水县', '611000', '柞水', 3, '0914', '711400', 'Zhashui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611100', '西咸新区', '610000', '西咸', 2, '029', '712000', 'Xixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611101', '空港新城', '611100', '空港', 3, '0374', '461000', 'Konggang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611102', '沣东新城', '611100', '沣东', 3, '029', '710000', 'Fengdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611103', '秦汉新城', '611100', '秦汉', 3, '029', '712000', 'Qinhan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611104', '沣西新城', '611100', '沣西', 3, '029', '710000', 'Fengxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('611105', '泾河新城', '611100', '泾河', 3, '029', '713700', 'Jinghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620000', '甘肃省', '100000', '甘肃', 1, '', '', 'Gansu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620100', '兰州市', '620000', '兰州', 2, '0931', '730030', 'Lanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620102', '城关区', '620100', '城关', 3, '0931', '730030', 'Chengguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620103', '七里河区', '620100', '七里河', 3, '0931', '730050', 'Qilihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620104', '西固区', '620100', '西固', 3, '0931', '730060', 'Xigu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620105', '安宁区', '620100', '安宁', 3, '0931', '730070', 'Anning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620111', '红古区', '620100', '红古', 3, '0931', '730084', 'Honggu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620121', '永登县', '620100', '永登', 3, '0931', '730300', 'Yongdeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620122', '皋兰县', '620100', '皋兰', 3, '0931', '730200', 'Gaolan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620123', '榆中县', '620100', '榆中', 3, '0931', '730100', 'Yuzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620200', '嘉峪关市', '620000', '嘉峪关', 2, '0937', '735100', 'Jiayuguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620201', '雄关区', '620200', '雄关', 3, '0937', '735100', 'Xiongguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620202', '长城区', '620200', '长城', 3, '0937', '735106', 'Changcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620203', '镜铁区', '620200', '镜铁', 3, '0937', '735100', 'Jingtie', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620300', '金昌市', '620000', '金昌', 2, '0935', '737100', 'Jinchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620302', '金川区', '620300', '金川', 3, '0935', '737100', 'Jinchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620321', '永昌县', '620300', '永昌', 3, '0935', '737200', 'Yongchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620400', '白银市', '620000', '白银', 2, '0943', '730900', 'Baiyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620402', '白银区', '620400', '白银', 3, '0943', '730900', 'Baiyin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620403', '平川区', '620400', '平川', 3, '0943', '730913', 'Pingchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620421', '靖远县', '620400', '靖远', 3, '0943', '730600', 'Jingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620422', '会宁县', '620400', '会宁', 3, '0943', '730700', 'Huining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620423', '景泰县', '620400', '景泰', 3, '0943', '730400', 'Jingtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620500', '天水市', '620000', '天水', 2, '0938', '741000', 'Tianshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620502', '秦州区', '620500', '秦州', 3, '0938', '741000', 'Qinzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620503', '麦积区', '620500', '麦积', 3, '0938', '741020', 'Maiji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620521', '清水县', '620500', '清水', 3, '0938', '741400', 'Qingshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620522', '秦安县', '620500', '秦安', 3, '0938', '741600', 'Qinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620523', '甘谷县', '620500', '甘谷', 3, '0938', '741200', 'Gangu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620524', '武山县', '620500', '武山', 3, '0938', '741300', 'Wushan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620525', '张家川回族自治县', '620500', '张家川', 3, '0938', '741500', 'Zhangjiachuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620600', '武威市', '620000', '武威', 2, '0935', '733000', 'Wuwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620602', '凉州区', '620600', '凉州', 3, '0935', '733000', 'Liangzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620621', '民勤县', '620600', '民勤', 3, '0935', '733300', 'Minqin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620622', '古浪县', '620600', '古浪', 3, '0935', '733100', 'Gulang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620623', '天祝藏族自治县', '620600', '天祝', 3, '0935', '733200', 'Tianzhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620700', '张掖市', '620000', '张掖', 2, '0936', '734000', 'Zhangye', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620702', '甘州区', '620700', '甘州', 3, '0936', '734000', 'Ganzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620721', '肃南裕固族自治县', '620700', '肃南', 3, '0936', '734400', 'Sunan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620722', '民乐县', '620700', '民乐', 3, '0936', '734500', 'Minle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620723', '临泽县', '620700', '临泽', 3, '0936', '734200', 'Linze', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620724', '高台县', '620700', '高台', 3, '0936', '734300', 'Gaotai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620725', '山丹县', '620700', '山丹', 3, '0936', '734100', 'Shandan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620800', '平凉市', '620000', '平凉', 2, '0933', '744000', 'Pingliang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620802', '崆峒区', '620800', '崆峒', 3, '0933', '744000', 'Kongtong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620821', '泾川县', '620800', '泾川', 3, '0933', '744300', 'Jingchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620822', '灵台县', '620800', '灵台', 3, '0933', '744400', 'Lingtai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620823', '崇信县', '620800', '崇信', 3, '0933', '744200', 'Chongxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620824', '华亭县', '620800', '华亭', 3, '0933', '744100', 'Huating', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620825', '庄浪县', '620800', '庄浪', 3, '0933', '744600', 'Zhuanglang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620826', '静宁县', '620800', '静宁', 3, '0933', '743400', 'Jingning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620900', '酒泉市', '620000', '酒泉', 2, '0937', '735000', 'Jiuquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620902', '肃州区', '620900', '肃州', 3, '0937', '735000', 'Suzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620921', '金塔县', '620900', '金塔', 3, '0937', '735300', 'Jinta', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620922', '瓜州县', '620900', '瓜州', 3, '0937', '736100', 'Guazhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620923', '肃北蒙古族自治县', '620900', '肃北', 3, '0937', '736300', 'Subei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '阿克塞', 3, '0937', '736400', 'Akesai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620981', '玉门市', '620900', '玉门', 3, '0937', '735200', 'Yumen', NULL, NULL);
INSERT INTO `tb_address` VALUES ('620982', '敦煌市', '620900', '敦煌', 3, '0937', '736200', 'Dunhuang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621000', '庆阳市', '620000', '庆阳', 2, '0934', '745000', 'Qingyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621002', '西峰区', '621000', '西峰', 3, '0934', '745000', 'Xifeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621021', '庆城县', '621000', '庆城', 3, '0934', '745100', 'Qingcheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621022', '环县', '621000', '环县', 3, '0934', '745700', 'Huanxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621023', '华池县', '621000', '华池', 3, '0934', '745600', 'Huachi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621024', '合水县', '621000', '合水', 3, '0934', '745400', 'Heshui', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621025', '正宁县', '621000', '正宁', 3, '0934', '745300', 'Zhengning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621026', '宁县', '621000', '宁县', 3, '0934', '745200', 'Ningxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621027', '镇原县', '621000', '镇原', 3, '0934', '744500', 'Zhenyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621100', '定西市', '620000', '定西', 2, '0932', '743000', 'Dingxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621102', '安定区', '621100', '安定', 3, '0932', '743000', 'Anding', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621121', '通渭县', '621100', '通渭', 3, '0932', '743300', 'Tongwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621122', '陇西县', '621100', '陇西', 3, '0932', '748100', 'Longxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621123', '渭源县', '621100', '渭源', 3, '0932', '748200', 'Weiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621124', '临洮县', '621100', '临洮', 3, '0932', '730500', 'Lintao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621125', '漳县', '621100', '漳县', 3, '0932', '748300', 'Zhangxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621126', '岷县', '621100', '岷县', 3, '0932', '748400', 'Minxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621200', '陇南市', '620000', '陇南', 2, '0939', '746000', 'Longnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621202', '武都区', '621200', '武都', 3, '0939', '746000', 'Wudu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621221', '成县', '621200', '成县', 3, '0939', '742500', 'Chengxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621222', '文县', '621200', '文县', 3, '0939', '746400', 'Wenxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621223', '宕昌县', '621200', '宕昌', 3, '0939', '748500', 'Dangchang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621224', '康县', '621200', '康县', 3, '0939', '746500', 'Kangxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621225', '西和县', '621200', '西和', 3, '0939', '742100', 'Xihe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621226', '礼县', '621200', '礼县', 3, '0939', '742200', 'Lixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621227', '徽县', '621200', '徽县', 3, '0939', '742300', 'Huixian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('621228', '两当县', '621200', '两当', 3, '0939', '742400', 'Liangdang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622900', '临夏回族自治州', '620000', '临夏', 2, '0930', '731100', 'Linxia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622901', '临夏市', '622900', '临夏', 3, '0930', '731100', 'Linxia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622921', '临夏县', '622900', '临夏', 3, '0930', '731800', 'Linxia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622922', '康乐县', '622900', '康乐', 3, '0930', '731500', 'Kangle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622923', '永靖县', '622900', '永靖', 3, '0930', '731600', 'Yongjing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622924', '广河县', '622900', '广河', 3, '0930', '731300', 'Guanghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622925', '和政县', '622900', '和政', 3, '0930', '731200', 'Hezheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622926', '东乡族自治县', '622900', '东乡族', 3, '0930', '731400', 'Dongxiangzu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '积石山', 3, '0930', '731700', 'Jishishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623000', '甘南藏族自治州', '620000', '甘南', 2, '0941', '747000', 'Gannan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623001', '合作市', '623000', '合作', 3, '0941', '747000', 'Hezuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623021', '临潭县', '623000', '临潭', 3, '0941', '747500', 'Lintan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623022', '卓尼县', '623000', '卓尼', 3, '0941', '747600', 'Zhuoni', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623023', '舟曲县', '623000', '舟曲', 3, '0941', '746300', 'Zhouqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623024', '迭部县', '623000', '迭部', 3, '0941', '747400', 'Diebu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623025', '玛曲县', '623000', '玛曲', 3, '0941', '747300', 'Maqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623026', '碌曲县', '623000', '碌曲', 3, '0941', '747200', 'Luqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('623027', '夏河县', '623000', '夏河', 3, '0941', '747100', 'Xiahe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630000', '青海省', '100000', '青海', 1, '', '', 'Qinghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630100', '西宁市', '630000', '西宁', 2, '0971', '810000', 'Xining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630102', '城东区', '630100', '城东', 3, '0971', '810007', 'Chengdong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630103', '城中区', '630100', '城中', 3, '0971', '810000', 'Chengzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630104', '城西区', '630100', '城西', 3, '0971', '810001', 'Chengxi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630105', '城北区', '630100', '城北', 3, '0971', '810003', 'Chengbei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630121', '大通回族土族自治县', '630100', '大通', 3, '0971', '810100', 'Datong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630122', '湟中县', '630100', '湟中', 3, '0971', '811600', 'Huangzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630123', '湟源县', '630100', '湟源', 3, '0971', '812100', 'Huangyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630200', '海东市', '630000', '海东', 2, '0972', '810700', 'Haidong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630202', '乐都区', '630200', '乐都', 3, '0972', '810700', 'Ledu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630221', '平安县', '630200', '平安', 3, '0972', '810600', 'Pingan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630222', '民和回族土族自治县', '630200', '民和', 3, '0972', '810800', 'Minhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630223', '互助土族自治县', '630200', '互助', 3, '0972', '810500', 'Huzhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630224', '化隆回族自治县', '630200', '化隆', 3, '0972', '810900', 'Hualong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('630225', '循化撒拉族自治县', '630200', '循化', 3, '0972', '811100', 'Xunhua', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632200', '海北藏族自治州', '630000', '海北', 2, '0970', '812200', 'Haibei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632221', '门源回族自治县', '632200', '门源', 3, '0970', '810300', 'Menyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632222', '祁连县', '632200', '祁连', 3, '0970', '810400', 'Qilian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632223', '海晏县', '632200', '海晏', 3, '0970', '812200', 'Haiyan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632224', '刚察县', '632200', '刚察', 3, '0970', '812300', 'Gangcha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632300', '黄南藏族自治州', '630000', '黄南', 2, '0973', '811300', 'Huangnan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632321', '同仁县', '632300', '同仁', 3, '0973', '811300', 'Tongren', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632322', '尖扎县', '632300', '尖扎', 3, '0973', '811200', 'Jianzha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632323', '泽库县', '632300', '泽库', 3, '0973', '811400', 'Zeku', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632324', '河南蒙古族自治县', '632300', '河南', 3, '0973', '811500', 'Henan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632500', '海南藏族自治州', '630000', '海南', 2, '0974', '813000', 'Hainan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632521', '共和县', '632500', '共和', 3, '0974', '813000', 'Gonghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632522', '同德县', '632500', '同德', 3, '0974', '813200', 'Tongde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632523', '贵德县', '632500', '贵德', 3, '0974', '811700', 'Guide', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632524', '兴海县', '632500', '兴海', 3, '0974', '813300', 'Xinghai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632525', '贵南县', '632500', '贵南', 3, '0974', '813100', 'Guinan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632600', '果洛藏族自治州', '630000', '果洛', 2, '0975', '814000', 'Golog', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632621', '玛沁县', '632600', '玛沁', 3, '0975', '814000', 'Maqin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632622', '班玛县', '632600', '班玛', 3, '0975', '814300', 'Banma', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632623', '甘德县', '632600', '甘德', 3, '0975', '814100', 'Gande', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632624', '达日县', '632600', '达日', 3, '0975', '814200', 'Dari', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632625', '久治县', '632600', '久治', 3, '0975', '624700', 'Jiuzhi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632626', '玛多县', '632600', '玛多', 3, '0975', '813500', 'Maduo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632700', '玉树藏族自治州', '630000', '玉树', 2, '0976', '815000', 'Yushu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632701', '玉树市', '632700', '玉树', 3, '0976', '815000', 'Yushu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632722', '杂多县', '632700', '杂多', 3, '0976', '815300', 'Zaduo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632723', '称多县', '632700', '称多', 3, '0976', '815100', 'Chenduo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632724', '治多县', '632700', '治多', 3, '0976', '815400', 'Zhiduo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632725', '囊谦县', '632700', '囊谦', 3, '0976', '815200', 'Nangqian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632726', '曲麻莱县', '632700', '曲麻莱', 3, '0976', '815500', 'Qumalai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '海西', 2, '0977', '817000', 'Haixi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632801', '格尔木市', '632800', '格尔木', 3, '0977', '816000', 'Geermu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632802', '德令哈市', '632800', '德令哈', 3, '0977', '817000', 'Delingha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632821', '乌兰县', '632800', '乌兰', 3, '0977', '817100', 'Wulan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632822', '都兰县', '632800', '都兰', 3, '0977', '816100', 'Dulan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('632823', '天峻县', '632800', '天峻', 3, '0977', '817200', 'Tianjun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640000', '宁夏回族自治区', '100000', '宁夏', 1, '', '', 'Ningxia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640100', '银川市', '640000', '银川', 2, '0951', '750004', 'Yinchuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640104', '兴庆区', '640100', '兴庆', 3, '0951', '750001', 'Xingqing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640105', '西夏区', '640100', '西夏', 3, '0951', '750021', 'Xixia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640106', '金凤区', '640100', '金凤', 3, '0951', '750011', 'Jinfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640121', '永宁县', '640100', '永宁', 3, '0951', '750100', 'Yongning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640122', '贺兰县', '640100', '贺兰', 3, '0951', '750200', 'Helan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640181', '灵武市', '640100', '灵武', 3, '0951', '750004', 'Lingwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640200', '石嘴山市', '640000', '石嘴山', 2, '0952', '753000', 'Shizuishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640202', '大武口区', '640200', '大武口', 3, '0952', '753000', 'Dawukou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640205', '惠农区', '640200', '惠农', 3, '0952', '753600', 'Huinong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640221', '平罗县', '640200', '平罗', 3, '0952', '753400', 'Pingluo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640300', '吴忠市', '640000', '吴忠', 2, '0953', '751100', 'Wuzhong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640302', '利通区', '640300', '利通', 3, '0953', '751100', 'Litong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640303', '红寺堡区', '640300', '红寺堡', 3, '0953', '751900', 'Hongsibao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640323', '盐池县', '640300', '盐池', 3, '0953', '751500', 'Yanchi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640324', '同心县', '640300', '同心', 3, '0953', '751300', 'Tongxin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640381', '青铜峡市', '640300', '青铜峡', 3, '0953', '751600', 'Qingtongxia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640400', '固原市', '640000', '固原', 2, '0954', '756000', 'Guyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640402', '原州区', '640400', '原州', 3, '0954', '756000', 'Yuanzhou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640422', '西吉县', '640400', '西吉', 3, '0954', '756200', 'Xiji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640423', '隆德县', '640400', '隆德', 3, '0954', '756300', 'Longde', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640424', '泾源县', '640400', '泾源', 3, '0954', '756400', 'Jingyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640425', '彭阳县', '640400', '彭阳', 3, '0954', '756500', 'Pengyang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640500', '中卫市', '640000', '中卫', 2, '0955', '751700', 'Zhongwei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640502', '沙坡头区', '640500', '沙坡头', 3, '0955', '755000', 'Shapotou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640521', '中宁县', '640500', '中宁', 3, '0955', '751200', 'Zhongning', NULL, NULL);
INSERT INTO `tb_address` VALUES ('640522', '海原县', '640500', '海原', 3, '0955', '751800', 'Haiyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650000', '新疆维吾尔自治区', '100000', '新疆', 1, '', '', 'Xinjiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650100', '乌鲁木齐市', '650000', '乌鲁木齐', 2, '0991', '830002', 'Urumqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650102', '天山区', '650100', '天山', 3, '0991', '830002', 'Tianshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650103', '沙依巴克区', '650100', '沙依巴克', 3, '0991', '830000', 'Shayibake', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650104', '新市区', '650100', '新市', 3, '0991', '830011', 'Xinshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650105', '水磨沟区', '650100', '水磨沟', 3, '0991', '830017', 'Shuimogou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650106', '头屯河区', '650100', '头屯河', 3, '0991', '830022', 'Toutunhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650107', '达坂城区', '650100', '达坂城', 3, '0991', '830039', 'Dabancheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650109', '米东区', '650100', '米东', 3, '0991', '830019', 'Midong', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650121', '乌鲁木齐县', '650100', '乌鲁木齐', 3, '0991', '830063', 'Wulumuqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650200', '克拉玛依市', '650000', '克拉玛依', 2, '0990', '834000', 'Karamay', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650202', '独山子区', '650200', '独山子', 3, '0992', '834021', 'Dushanzi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650203', '克拉玛依区', '650200', '克拉玛依', 3, '0990', '834000', 'Kelamayi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650204', '白碱滩区', '650200', '白碱滩', 3, '0990', '834008', 'Baijiantan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('650205', '乌尔禾区', '650200', '乌尔禾', 3, '0990', '834012', 'Wuerhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652100', '吐鲁番地区', '650000', '吐鲁番', 2, '0995', '838000', 'Turpan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652101', '吐鲁番市', '652100', '吐鲁番', 3, '0995', '838000', 'Tulufan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652122', '鄯善县', '652100', '鄯善', 3, '0995', '838200', 'Shanshan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652123', '托克逊县', '652100', '托克逊', 3, '0995', '838100', 'Tuokexun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652200', '哈密地区', '650000', '哈密', 2, '0902', '839000', 'Hami', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652201', '哈密市', '652200', '哈密', 3, '0902', '839000', 'Hami', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '巴里坤', 3, '0902', '839200', 'Balikun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652223', '伊吾县', '652200', '伊吾', 3, '0902', '839300', 'Yiwu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652300', '昌吉回族自治州', '650000', '昌吉', 2, '0994', '831100', 'Changji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652301', '昌吉市', '652300', '昌吉', 3, '0994', '831100', 'Changji', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652302', '阜康市', '652300', '阜康', 3, '0994', '831500', 'Fukang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652323', '呼图壁县', '652300', '呼图壁', 3, '0994', '831200', 'Hutubi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652324', '玛纳斯县', '652300', '玛纳斯', 3, '0994', '832200', 'Manasi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652325', '奇台县', '652300', '奇台', 3, '0994', '831800', 'Qitai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652327', '吉木萨尔县', '652300', '吉木萨尔', 3, '0994', '831700', 'Jimusaer', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652328', '木垒哈萨克自治县', '652300', '木垒', 3, '0994', '831900', 'Mulei', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '博尔塔拉', 2, '0909', '833400', 'Bortala', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652701', '博乐市', '652700', '博乐', 3, '0909', '833400', 'Bole', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652702', '阿拉山口市', '652700', '阿拉山口', 3, '0909', '833400', 'Alashankou', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652722', '精河县', '652700', '精河', 3, '0909', '833300', 'Jinghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652723', '温泉县', '652700', '温泉', 3, '0909', '833500', 'Wenquan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '巴音郭楞', 2, '0996', '841000', 'Bayingol', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652801', '库尔勒市', '652800', '库尔勒', 3, '0996', '841000', 'Kuerle', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652822', '轮台县', '652800', '轮台', 3, '0996', '841600', 'Luntai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652823', '尉犁县', '652800', '尉犁', 3, '0996', '841500', 'Yuli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652824', '若羌县', '652800', '若羌', 3, '0996', '841800', 'Ruoqiang', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652825', '且末县', '652800', '且末', 3, '0996', '841900', 'Qiemo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652826', '焉耆回族自治县', '652800', '焉耆', 3, '0996', '841100', 'Yanqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652827', '和静县', '652800', '和静', 3, '0996', '841300', 'Hejing', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652828', '和硕县', '652800', '和硕', 3, '0996', '841200', 'Heshuo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652829', '博湖县', '652800', '博湖', 3, '0996', '841400', 'Bohu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652900', '阿克苏地区', '650000', '阿克苏', 2, '0997', '843000', 'Aksu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652901', '阿克苏市', '652900', '阿克苏', 3, '0997', '843000', 'Akesu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652922', '温宿县', '652900', '温宿', 3, '0997', '843100', 'Wensu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652923', '库车县', '652900', '库车', 3, '0997', '842000', 'Kuche', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652924', '沙雅县', '652900', '沙雅', 3, '0997', '842200', 'Shaya', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652925', '新和县', '652900', '新和', 3, '0997', '842100', 'Xinhe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652926', '拜城县', '652900', '拜城', 3, '0997', '842300', 'Baicheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652927', '乌什县', '652900', '乌什', 3, '0997', '843400', 'Wushi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652928', '阿瓦提县', '652900', '阿瓦提', 3, '0997', '843200', 'Awati', NULL, NULL);
INSERT INTO `tb_address` VALUES ('652929', '柯坪县', '652900', '柯坪', 3, '0997', '843600', 'Keping', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '克孜勒苏', 2, '0908', '845350', 'Kizilsu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653001', '阿图什市', '653000', '阿图什', 3, '0908', '845350', 'Atushi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653022', '阿克陶县', '653000', '阿克陶', 3, '0908', '845550', 'Aketao', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653023', '阿合奇县', '653000', '阿合奇', 3, '0997', '843500', 'Aheqi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653024', '乌恰县', '653000', '乌恰', 3, '0908', '845450', 'Wuqia', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653100', '喀什地区', '650000', '喀什', 2, '0998', '844000', 'Kashgar', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653101', '喀什市', '653100', '喀什', 3, '0998', '844000', 'Kashi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653121', '疏附县', '653100', '疏附', 3, '0998', '844100', 'Shufu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653122', '疏勒县', '653100', '疏勒', 3, '0998', '844200', 'Shule', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653123', '英吉沙县', '653100', '英吉沙', 3, '0998', '844500', 'Yingjisha', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653124', '泽普县', '653100', '泽普', 3, '0998', '844800', 'Zepu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653125', '莎车县', '653100', '莎车', 3, '0998', '844700', 'Shache', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653126', '叶城县', '653100', '叶城', 3, '0998', '844900', 'Yecheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653127', '麦盖提县', '653100', '麦盖提', 3, '0998', '844600', 'Maigaiti', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653128', '岳普湖县', '653100', '岳普湖', 3, '0998', '844400', 'Yuepuhu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653129', '伽师县', '653100', '伽师', 3, '0998', '844300', 'Jiashi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653130', '巴楚县', '653100', '巴楚', 3, '0998', '843800', 'Bachu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '塔什库尔干塔吉克', 3, '0998', '845250', 'Tashikuergantajike', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653200', '和田地区', '650000', '和田', 2, '0903', '848000', 'Hotan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653201', '和田市', '653200', '和田市', 3, '0903', '848000', 'Hetianshi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653221', '和田县', '653200', '和田县', 3, '0903', '848000', 'Hetianxian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653222', '墨玉县', '653200', '墨玉', 3, '0903', '848100', 'Moyu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653223', '皮山县', '653200', '皮山', 3, '0903', '845150', 'Pishan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653224', '洛浦县', '653200', '洛浦', 3, '0903', '848200', 'Luopu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653225', '策勒县', '653200', '策勒', 3, '0903', '848300', 'Cele', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653226', '于田县', '653200', '于田', 3, '0903', '848400', 'Yutian', NULL, NULL);
INSERT INTO `tb_address` VALUES ('653227', '民丰县', '653200', '民丰', 3, '0903', '848500', 'Minfeng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654000', '伊犁哈萨克自治州', '650000', '伊犁', 2, '0999', '835100', 'Ili', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654002', '伊宁市', '654000', '伊宁', 3, '0999', '835000', 'Yining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654003', '奎屯市', '654000', '奎屯', 3, '0992', '833200', 'Kuitun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654004', '霍尔果斯市', '654000', '霍尔果斯', 3, '0999', '835221', 'Huoerguosi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654021', '伊宁县', '654000', '伊宁', 3, '0999', '835100', 'Yining', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654022', '察布查尔锡伯自治县', '654000', '察布查尔锡伯', 3, '0999', '835300', 'Chabuchaerxibo', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654023', '霍城县', '654000', '霍城', 3, '0999', '835200', 'Huocheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654024', '巩留县', '654000', '巩留', 3, '0999', '835400', 'Gongliu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654025', '新源县', '654000', '新源', 3, '0999', '835800', 'Xinyuan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654026', '昭苏县', '654000', '昭苏', 3, '0999', '835600', 'Zhaosu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654027', '特克斯县', '654000', '特克斯', 3, '0999', '835500', 'Tekesi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654028', '尼勒克县', '654000', '尼勒克', 3, '0999', '835700', 'Nileke', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654200', '塔城地区', '650000', '塔城', 2, '0901', '834700', 'Qoqek', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654201', '塔城市', '654200', '塔城', 3, '0901', '834700', 'Tacheng', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654202', '乌苏市', '654200', '乌苏', 3, '0992', '833000', 'Wusu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654221', '额敏县', '654200', '额敏', 3, '0901', '834600', 'Emin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654223', '沙湾县', '654200', '沙湾', 3, '0993', '832100', 'Shawan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654224', '托里县', '654200', '托里', 3, '0901', '834500', 'Tuoli', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654225', '裕民县', '654200', '裕民', 3, '0901', '834800', 'Yumin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '和布克赛尔', 3, '0990', '834400', 'Hebukesaier', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654300', '阿勒泰地区', '650000', '阿勒泰', 2, '0906', '836500', 'Altay', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654301', '阿勒泰市', '654300', '阿勒泰', 3, '0906', '836500', 'Aletai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654321', '布尔津县', '654300', '布尔津', 3, '0906', '836600', 'Buerjin', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654322', '富蕴县', '654300', '富蕴', 3, '0906', '836100', 'Fuyun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654323', '福海县', '654300', '福海', 3, '0906', '836400', 'Fuhai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654324', '哈巴河县', '654300', '哈巴河', 3, '0906', '836700', 'Habahe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654325', '青河县', '654300', '青河', 3, '0906', '836200', 'Qinghe', NULL, NULL);
INSERT INTO `tb_address` VALUES ('654326', '吉木乃县', '654300', '吉木乃', 3, '0906', '836800', 'Jimunai', NULL, NULL);
INSERT INTO `tb_address` VALUES ('659000', '直辖县级', '650000', ' ', 2, '', '', '', NULL, NULL);
INSERT INTO `tb_address` VALUES ('659001', '石河子市', '659000', '石河子', 3, '0993', '832000', 'Shihezi', NULL, NULL);
INSERT INTO `tb_address` VALUES ('659002', '阿拉尔市', '659000', '阿拉尔', 3, '0997', '843300', 'Aral', NULL, NULL);
INSERT INTO `tb_address` VALUES ('659003', '图木舒克市', '659000', '图木舒克', 3, '0998', '843806', 'Tumxuk', NULL, NULL);
INSERT INTO `tb_address` VALUES ('659004', '五家渠市', '659000', '五家渠', 3, '0994', '831300', 'Wujiaqu', NULL, NULL);
INSERT INTO `tb_address` VALUES ('659005', '北屯市', '659000', '北屯', 3, '0906', '836000', 'Beitun', NULL, NULL);
INSERT INTO `tb_address` VALUES ('659006', '铁门关市', '659000', '铁门关', 3, '0906', '836000', 'Tiemenguan', NULL, NULL);
INSERT INTO `tb_address` VALUES ('659007', '双河市', '659000', '双河', 3, '0909', '833408', 'Shuanghe', NULL, NULL);

-- ----------------------------
-- Table structure for td_activity
-- ----------------------------
DROP TABLE IF EXISTS `td_activity`;
CREATE TABLE `td_activity`  (
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `user_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主办方名称',
  `activity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `activitycategory_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动类别表id',
  `activitycategory_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动类别名称',
  `activitysign_starttime` datetime(0) NULL DEFAULT NULL COMMENT '活动报名开始时间',
  `activitysign_endtime` datetime(0) NULL DEFAULT NULL COMMENT '活动结束报名时间',
  `activitystart_time` datetime(0) NULL DEFAULT NULL COMMENT '活动开始时间',
  `activityend_time` datetime(0) NULL DEFAULT NULL COMMENT '活动结束时间',
  `activity_countpersons` int(11) NULL DEFAULT NULL COMMENT '活动人数',
  `activity_chargestatus` int(11) NULL DEFAULT NULL COMMENT '活动费用，0为免费，1，收费',
  `activity_chargemethod` int(11) NULL DEFAULT NULL COMMENT '0为平台代收，1为线下支付',
  `activity_type` int(255) NULL DEFAULT NULL COMMENT '0为线上，1线下',
  `province_citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '匹配区域—省',
  `city_citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动地址详情名称',
  `area_citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `precision_demand_province_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\r\n系统自动匹配精准客户的区域省',
  `precision_demand_city_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统自动匹配精准客户的区域市',
  `precision_demand_area_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统自动匹配精准客户的区域区',
  `address_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动举办地址名称',
  `precision_demand_address_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动匹配地址名称',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址经度',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址纬度',
  `activity_coverImgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动封面图',
  `activity_isextract` int(11) NULL DEFAULT NULL COMMENT '是否设置提成0，为否，1为是',
  `activity_detailsurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动详情，上传h5',
  `activitymusic_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动音乐表',
  `online_status` int(11) NULL DEFAULT NULL COMMENT '活动上下架情况，活动发布者上架为0，下架为1，草稿为4，管理员上架为2，下架为3',
  `activity_signupstatus` int(11) NULL DEFAULT NULL COMMENT '活动报名状态，0为未开始，1为报名中，2为已经报名结束',
  `activity_status` int(11) NULL DEFAULT NULL COMMENT '活动状态，0为活动未开始，1为活动进行中，2活动已经结束',
  `activity_qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动二维码路径',
  `undercarriage_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '下架原因：只有平台下架才显示的下架原因',
  `share_abstract` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分享摘要',
  `views` int(255) NULL DEFAULT NULL COMMENT '活动浏览量',
  `join_num` int(255) NULL DEFAULT NULL COMMENT '报名人数',
  `payment_result` int(2) NULL DEFAULT NULL COMMENT '活动支付状态 0未支付 ,1 未支付',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_activity
-- ----------------------------
INSERT INTO `td_activity` VALUES ('1', '1', NULL, '22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 555, NULL, NULL, '2018-09-23 18:03:59', '2018-09-25 09:57:58', NULL);
INSERT INTO `td_activity` VALUES ('22', '2', NULL, '23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 123, NULL, NULL, '2018-09-23 18:03:59', '2018-09-27 10:23:31', NULL);
INSERT INTO `td_activity` VALUES ('55d22ae778af44b8ae0222980170fb25', '9fe8168b046a4e03b754426b8d932fbf', '所得到的', '易迅连资源共享', '2', '户外', '2018-11-29 11:41:00', '2018-11-30 11:41:00', '2018-11-30 13:41:00', '2018-12-18 11:41:00', 50, 0, NULL, 0, '', '', '', '', '11', '2801', '2799', '', '天津 全部 全部', NULL, NULL, '/file/img/activity/20181129121107lg0a.png', 0, '<p>活动详情活动详情<img src=\"https://yxl58.com/file/img/activity/201811291145427uya.png\" style=\"font-size: 0.28rem; max-width: 100%;\"></p>', '1', 0, 0, 0, NULL, NULL, '我要分享易迅连的活动', 0, NULL, NULL, '2018-11-29 12:11:10', '2018-11-29 12:11:10', NULL);

-- ----------------------------
-- Table structure for td_activity_charge_item
-- ----------------------------
DROP TABLE IF EXISTS `td_activity_charge_item`;
CREATE TABLE `td_activity_charge_item`  (
  `activity_charge_item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动收费项目id',
  `activity_charge_item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动收费项目名称',
  `activity_charge_item_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '活动收费金额',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定活动id',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主办方id',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_charge_item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_activity_charge_item
-- ----------------------------
INSERT INTO `td_activity_charge_item` VALUES ('1', '1', 12121212.21, '1', '1', '2018-10-23 11:37:32', '2018-10-23 11:37:35', NULL);

-- ----------------------------
-- Table structure for td_activity_fill_in_item
-- ----------------------------
DROP TABLE IF EXISTS `td_activity_fill_in_item`;
CREATE TABLE `td_activity_fill_in_item`  (
  `fill_in_item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填写项目id(活动报名填写项)',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动id',
  `fill_in_item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填写项目名称',
  `created` datetime(0) NULL DEFAULT NULL,
  `type` int(2) NULL DEFAULT NULL COMMENT ' 报名填写项类型  0 后台设置必填项 ， 1 活动关联的填写项',
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`fill_in_item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_activity_fill_in_item
-- ----------------------------
INSERT INTO `td_activity_fill_in_item` VALUES ('1', NULL, '订单', '2018-11-19 18:32:02', 0, '2018-11-19 18:32:05', NULL);

-- ----------------------------
-- Table structure for td_activity_sponsor_distribute_extract
-- ----------------------------
DROP TABLE IF EXISTS `td_activity_sponsor_distribute_extract`;
CREATE TABLE `td_activity_sponsor_distribute_extract`  (
  `activity_sponsor_distribute_extract_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动主办方发放每笔提成金额去向比率表',
  `activity_sponsor_distribute_extract_type` int(11) NULL DEFAULT NULL COMMENT '活动主办方分发提成对象：0为主办方推荐人（注册时的推荐人）1为（活动分享人）普通会员分享二选一，2（活动分享人）拥有资源库的人分享或输出资源二选一，3，公益基金',
  `activity_sponsor_distribute_extract_rate` decimal(10, 4) NULL DEFAULT NULL COMMENT '分发比率',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_activity_sponsor_distribute_extract
-- ----------------------------
INSERT INTO `td_activity_sponsor_distribute_extract` VALUES ('1', 0, 0.9900, NULL, NULL, NULL);
INSERT INTO `td_activity_sponsor_distribute_extract` VALUES ('2', 1, 0.5600, NULL, '2018-10-14 10:43:36', '');
INSERT INTO `td_activity_sponsor_distribute_extract` VALUES ('3', 2, NULL, NULL, NULL, NULL);
INSERT INTO `td_activity_sponsor_distribute_extract` VALUES ('4', 3, 0.6600, NULL, '2018-10-14 10:43:52', '');

-- ----------------------------
-- Table structure for td_activitycategory
-- ----------------------------
DROP TABLE IF EXISTS `td_activitycategory`;
CREATE TABLE `td_activitycategory`  (
  `activitycategory_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动类别表',
  `activitycategory_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动类别',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `readingsurvey_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联调研表',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activitycategory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_activitycategory
-- ----------------------------
INSERT INTO `td_activitycategory` VALUES ('1', '国学', '2018-09-26 09:34:19', '2018-09-26 09:34:22', NULL, NULL);
INSERT INTO `td_activitycategory` VALUES ('2', '户外', '2018-09-26 09:35:04', '2018-09-26 09:35:06', NULL, NULL);
INSERT INTO `td_activitycategory` VALUES ('3', '户内', '2018-09-26 09:35:23', '2018-09-26 09:35:26', NULL, NULL);
INSERT INTO `td_activitycategory` VALUES ('4', '种植', '2018-09-26 09:35:42', '2018-09-26 09:35:44', NULL, NULL);
INSERT INTO `td_activitycategory` VALUES ('8bafb8d5865d4a769c81810784608b32', '文学2', '2018-09-26 12:19:26', '2018-09-26 12:26:29', NULL, 's');

-- ----------------------------
-- Table structure for td_activitymusicurl
-- ----------------------------
DROP TABLE IF EXISTS `td_activitymusicurl`;
CREATE TABLE `td_activitymusicurl`  (
  `activitymusic_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布活动设置音乐表',
  `activity_musicurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动音乐路径',
  `activitymusic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动音乐类别名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`activitymusic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_activitysign
-- ----------------------------
DROP TABLE IF EXISTS `td_activitysign`;
CREATE TABLE `td_activitysign`  (
  `activity_signid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动报名填写项表',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动id',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `fill_in_item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填写项id',
  `fill_in_item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填写项名称',
  `fill_in_item_val` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户填写的内容',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_signid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_advertisementimage
-- ----------------------------
DROP TABLE IF EXISTS `td_advertisementimage`;
CREATE TABLE `td_advertisementimage`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '首页广告图片轮播图id',
  `img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图名字',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图路径',
  `is_online_status` int(2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '0为下架 表示首页不展示，1为上线',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `advertisement_detailsurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情文件路径',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_advertisementimage
-- ----------------------------
INSERT INTO `td_advertisementimage` VALUES ('1', '图1', '1', NULL, '2018-09-10 11:48:31', '2018-09-10 11:48:34', NULL, NULL);
INSERT INTO `td_advertisementimage` VALUES ('2', '图2', '2', NULL, '2018-09-10 11:48:44', '2018-09-10 11:48:47', NULL, NULL);
INSERT INTO `td_advertisementimage` VALUES ('3', '图3', '3', NULL, '2018-09-10 11:48:57', '2018-09-10 11:49:01', NULL, NULL);
INSERT INTO `td_advertisementimage` VALUES ('4', '图4', '4', NULL, '2018-09-10 11:49:16', '2018-09-10 11:49:18', NULL, NULL);

-- ----------------------------
-- Table structure for td_affectingcreditvalue
-- ----------------------------
DROP TABLE IF EXISTS `td_affectingcreditvalue`;
CREATE TABLE `td_affectingcreditvalue`  (
  `affectingcreditvalue_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信用值影响记录表',
  `affectingcreditvalue_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信用值影响因素',
  `affectingcreditvalue_num` int(11) NULL DEFAULT NULL COMMENT '信用值影响值',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`affectingcreditvalue_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_aid_fund
-- ----------------------------
DROP TABLE IF EXISTS `td_aid_fund`;
CREATE TABLE `td_aid_fund`  (
  `af_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '助创基金记录表',
  `background_transfer_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '支出金额',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付给谁',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提成活动id',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `transfer_type` int(2) NULL DEFAULT NULL COMMENT '转账类型  1 等级升级  2 活动提成',
  `transfer_single_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转账单号',
  `transf_time` datetime(0) NULL DEFAULT NULL COMMENT '转账时间',
  `payment_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `payment_status` int(2) NULL DEFAULT NULL COMMENT '支付状态 1 支付成功 ，2 支付失败',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`af_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_background_operation_record
-- ----------------------------
DROP TABLE IF EXISTS `td_background_operation_record`;
CREATE TABLE `td_background_operation_record`  (
  `background_operation_record_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台人员操作记录表',
  `background_operation_record_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台管理员操作内容',
  `USER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联系统用户表',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`background_operation_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_background_publishing_activities
-- ----------------------------
DROP TABLE IF EXISTS `td_background_publishing_activities`;
CREATE TABLE `td_background_publishing_activities`  (
  `background_activities_typeid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理人员发布活动时，选择发布活动的类别表',
  `publishing_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别:选择判断，插入到那个表中',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`background_activities_typeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_background_publishing_activities
-- ----------------------------
INSERT INTO `td_background_publishing_activities` VALUES ('1', '活动专区', '2018-09-20 14:05:23', '2018-09-20 14:05:26', NULL);
INSERT INTO `td_background_publishing_activities` VALUES ('2', '商学院', '2018-09-20 14:05:37', '2018-09-20 14:05:41', NULL);

-- ----------------------------
-- Table structure for td_background_publishing_journalism
-- ----------------------------
DROP TABLE IF EXISTS `td_background_publishing_journalism`;
CREATE TABLE `td_background_publishing_journalism`  (
  `background_journalism_typeid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台人员选择发送新闻发送到那个模块的新闻表',
  `journalism_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻类型',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`background_journalism_typeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_background_publishing_journalism
-- ----------------------------
INSERT INTO `td_background_publishing_journalism` VALUES ('1', '易商学院', '2018-09-20 14:08:15', '2018-09-20 14:08:18', NULL);
INSERT INTO `td_background_publishing_journalism` VALUES ('2', '最新资讯', '2018-09-20 14:08:43', '2018-09-20 14:08:48', NULL);

-- ----------------------------
-- Table structure for td_background_transfer_recordinput
-- ----------------------------
DROP TABLE IF EXISTS `td_background_transfer_recordinput`;
CREATE TABLE `td_background_transfer_recordinput`  (
  `background_transfer_record_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户支付给后台系统的的收入表',
  `background_transfer_record_money` decimal(10, 4) NULL DEFAULT NULL COMMENT '支付给平台的金额',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谁支付的（用户id）',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提成活动id',
  `transfer_type` int(2) NULL DEFAULT NULL COMMENT '转账类型  1 会员升级  2 活动提成',
  `transfer_single_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转账单号',
  `transf_time` datetime(0) NULL DEFAULT NULL COMMENT '转账时间',
  `payment_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `payment_status` int(2) NULL DEFAULT NULL COMMENT '支付状态 1 支付成功 ，2 支付失败',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`background_transfer_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_background_transfer_recordout
-- ----------------------------
DROP TABLE IF EXISTS `td_background_transfer_recordout`;
CREATE TABLE `td_background_transfer_recordout`  (
  `background_transfer_record_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台支付提成给的支出表',
  `background_transfer_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '支出金额',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付给谁',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提成活动id',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `transfer_type` int(2) NULL DEFAULT NULL COMMENT '转账类型  1 等级升级  2 活动提成',
  `transfer_single_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转账单号',
  `transf_time` datetime(0) NULL DEFAULT NULL COMMENT '转账时间',
  `payment_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `payment_status` int(2) NULL DEFAULT NULL COMMENT '支付状态 1 支付成功 ，2 支付失败',
  PRIMARY KEY (`background_transfer_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_backstage_setting_extract
-- ----------------------------
DROP TABLE IF EXISTS `td_backstage_setting_extract`;
CREATE TABLE `td_backstage_setting_extract`  (
  `backstage_setting_extract_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台设置提成分类明细表',
  `extract_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提成类型',
  `extract_rete` decimal(10, 4) NULL DEFAULT NULL COMMENT '提成比率',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`backstage_setting_extract_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_browse_records
-- ----------------------------
DROP TABLE IF EXISTS `td_browse_records`;
CREATE TABLE `td_browse_records`  (
  `browse_records_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '浏览记录表',
  `journalism_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联新闻表，',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动表',
  `browse_records_status` int(11) NULL DEFAULT NULL COMMENT '浏览记录类型，0为新闻，1为活动',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`browse_records_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_collection
-- ----------------------------
DROP TABLE IF EXISTS `td_collection`;
CREATE TABLE `td_collection`  (
  `collection_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`collection_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_complaint
-- ----------------------------
DROP TABLE IF EXISTS `td_complaint`;
CREATE TABLE `td_complaint`  (
  `complaint_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户表',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动',
  `complaint_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉内容',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`complaint_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_creditrating
-- ----------------------------
DROP TABLE IF EXISTS `td_creditrating`;
CREATE TABLE `td_creditrating`  (
  `creditrd_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信用值',
  `credit_rating` int(11) NULL DEFAULT NULL COMMENT '信用值等级:0~10为分数，10~50为十字星，50~250为五角星，250~1250为月亮，以上为太阳',
  `creditrating_max` int(11) NULL DEFAULT NULL COMMENT '等级区间最大值',
  `creditrating_mix` int(11) NULL DEFAULT NULL COMMENT '等级区间最小值',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`creditrd_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_engagendustry
-- ----------------------------
DROP TABLE IF EXISTS `td_engagendustry`;
CREATE TABLE `td_engagendustry`  (
  `egid_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行业类型',
  `egid_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业名字',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`egid_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_engagendustry
-- ----------------------------
INSERT INTO `td_engagendustry` VALUES ('1', '建筑', NULL, NULL, NULL);
INSERT INTO `td_engagendustry` VALUES ('2', '餐饮', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for td_everjoin
-- ----------------------------
DROP TABLE IF EXISTS `td_everjoin`;
CREATE TABLE `td_everjoin`  (
  `everjoin_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '曾经参与表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表，那个用户的曾经参与的活动',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '曾经参与的那个活动',
  `activitycategory_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '曾经参与的那个活动的类别id',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否逻辑删除 0未删除 1已删',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`everjoin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_experience_days
-- ----------------------------
DROP TABLE IF EXISTS `td_experience_days`;
CREATE TABLE `td_experience_days`  (
  `experience_days_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '普通客户和客户经理体验vip客户经理天数',
  `experience_days` int(11) NULL DEFAULT NULL COMMENT '体验天数',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`experience_days_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_extractproject
-- ----------------------------
DROP TABLE IF EXISTS `td_extractproject`;
CREATE TABLE `td_extractproject`  (
  `extractproject_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布设置提成项目表',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提成项目',
  `project_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '提成比列',
  `project_money` decimal(20, 4) NULL DEFAULT NULL COMMENT '提成金额',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`extractproject_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_feedbackadvice
-- ----------------------------
DROP TABLE IF EXISTS `td_feedbackadvice`;
CREATE TABLE `td_feedbackadvice`  (
  `feedbackadvice_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈建议',
  `feedbackadvice_context` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '建议内容',
  `feedbackadvice_imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建议图片',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '那个建议的',
  `advice_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈建议联系方式',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_already_consulted` int(255) NULL DEFAULT NULL COMMENT '0未查阅，1已经查阅',
  `is_adopt` int(2) NULL DEFAULT NULL COMMENT '反馈建议是否采纳,默认0为未采纳，1为已经采纳',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_homekeywordslog
-- ----------------------------
DROP TABLE IF EXISTS `td_homekeywordslog`;
CREATE TABLE `td_homekeywordslog`  (
  `homekeywords_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '首页关键词log图片',
  `homekeywords_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词名字',
  `homekeywords_imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词log图片',
  `homekeywords_order` int(11) NULL DEFAULT NULL COMMENT '关键词顺序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`homekeywords_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_journalism
-- ----------------------------
DROP TABLE IF EXISTS `td_journalism`;
CREATE TABLE `td_journalism`  (
  `journalism_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻表',
  `journalism_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `journalism_date` datetime(0) NULL DEFAULT NULL COMMENT '新闻发布时间',
  `journalism_syso_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统发布名字',
  `journalism_browsingtimes` int(11) NULL DEFAULT NULL COMMENT '浏览次数',
  `journalism_sharetimes` int(11) NULL DEFAULT NULL COMMENT '分享次数',
  `share_summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻分享摘要',
  `journalism_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `readingsurvey_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联阅读调研表',
  `is_online` int(2) NULL DEFAULT NULL COMMENT '是否在线，后台操作，0为下架，1为上架',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `journalism_show_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻封面图片',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`journalism_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_journalism
-- ----------------------------
INSERT INTO `td_journalism` VALUES ('a', 'a', '2018-10-14 18:21:54', 'a', 1, 1, NULL, 'ad', 'ad', NULL, '2018-10-17 18:22:10', '2018-10-17 18:22:17', 'daa', 'aaa');
INSERT INTO `td_journalism` VALUES ('d', 'd', '2018-10-16 18:20:43', 'dd', 10, 10, NULL, 'd', 'd', NULL, '2018-10-15 18:21:05', '2018-10-16 18:21:01', 'd', 'd');

-- ----------------------------
-- Table structure for td_membershipwelfare
-- ----------------------------
DROP TABLE IF EXISTS `td_membershipwelfare`;
CREATE TABLE `td_membershipwelfare`  (
  `welfare_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员福利表',
  `welfare_imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员福利图片路径',
  `welfare_sharecount` int(11) NULL DEFAULT NULL COMMENT '设置分享次数条件',
  `welfare_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '福利标题',
  `welfare_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员福利详情',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `welfare_condition` int(11) NULL DEFAULT NULL COMMENT '分享条件，分享活动需要报名并签到成功几个人限定',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`welfare_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_memberupdateextract
-- ----------------------------
DROP TABLE IF EXISTS `td_memberupdateextract`;
CREATE TABLE `td_memberupdateextract`  (
  `memberupdateextract_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员升级归属人所得提成表',
  `member_update_extract_type` int(11) NULL DEFAULT NULL COMMENT '会员升级时归属人为以下角色时： 0为VIP客户经理，1为助创/公益基金',
  `type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色类型id',
  `member_update_money` decimal(10, 4) NULL DEFAULT NULL COMMENT '归属人提成金额',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`memberupdateextract_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_memberupdateextract
-- ----------------------------
INSERT INTO `td_memberupdateextract` VALUES ('1', 0, '0', 100.0000, '2018-10-14 10:29:30', '2018-10-14 10:28:27', '');
INSERT INTO `td_memberupdateextract` VALUES ('2', 0, '1', 200.0000, '2018-10-14 10:29:33', '2018-10-14 10:28:39', '');
INSERT INTO `td_memberupdateextract` VALUES ('3', 1, '0', 300.0000, '2018-10-14 10:29:38', '2018-10-14 10:28:49', '');
INSERT INTO `td_memberupdateextract` VALUES ('4', 1, '1', 400.0000, '2018-10-14 10:29:43', '2018-10-14 10:29:13', '');

-- ----------------------------
-- Table structure for td_myparticipatein
-- ----------------------------
DROP TABLE IF EXISTS `td_myparticipatein`;
CREATE TABLE `td_myparticipatein`  (
  `myparticipatein_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '我的参与表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `myparticipatein_status` int(11) NULL DEFAULT NULL COMMENT '我的参与活动列表的显示状态，1为删除不显示(逻辑删除）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`myparticipatein_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_organizer_info
-- ----------------------------
DROP TABLE IF EXISTS `td_organizer_info`;
CREATE TABLE `td_organizer_info`  (
  `organizer_info_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主办方信息表',
  `head_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `memberid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员号',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定用户表',
  `creditrd_num` int(11) NULL DEFAULT NULL COMMENT '信用值分数',
  `detail_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`organizer_info_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_partner_bonus_transfer_recordinput
-- ----------------------------
DROP TABLE IF EXISTS `td_partner_bonus_transfer_recordinput`;
CREATE TABLE `td_partner_bonus_transfer_recordinput`  (
  `partner_bonus_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合伙人分红池转账收入表',
  `partner_bonus_transfer_record_money` decimal(10, 4) NULL DEFAULT NULL COMMENT '支付给合伙人分红池的金额',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谁支付的（用户id）',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提成活动id',
  `transfer_type` int(2) NULL DEFAULT NULL COMMENT '转账类型  1 会员升级  2 活动提成',
  `transfer_single_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转账单号',
  `transf_time` datetime(0) NULL DEFAULT NULL COMMENT '转账时间',
  `payment_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `payment_status` int(2) NULL DEFAULT NULL COMMENT '支付状态 1 支付成功 ，2 支付失败',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`partner_bonus_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_partner_bonus_transfer_recordinput
-- ----------------------------
INSERT INTO `td_partner_bonus_transfer_recordinput` VALUES ('1', 1400.0000, '1', '1', 1, '123123123', '2018-10-29 13:36:12', '1', 1, '2018-10-29 13:36:21', '2018-10-29 13:36:26', NULL);
INSERT INTO `td_partner_bonus_transfer_recordinput` VALUES ('2', 670.0000, NULL, '1', NULL, '23234', '2018-10-30 16:13:03', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `td_partner_bonus_transfer_recordinput` VALUES ('5', 780.0000, NULL, NULL, NULL, NULL, '2018-08-01 16:13:16', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for td_paymentflow
-- ----------------------------
DROP TABLE IF EXISTS `td_paymentflow`;
CREATE TABLE `td_paymentflow`  (
  `paymentflow_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户支付流水表',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `put_money` decimal(20, 4) NULL DEFAULT NULL COMMENT '本次支付金额',
  `put_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `payment_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付成功微信返回的订单号',
  `status` int(2) NULL DEFAULT NULL COMMENT '支付类型 0 : 1元认证，1:支付给平台 ',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`paymentflow_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_personalneeds
-- ----------------------------
DROP TABLE IF EXISTS `td_personalneeds`;
CREATE TABLE `td_personalneeds`  (
  `personalneeds_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '个人需求',
  `personalneeds_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人需求类型',
  `activitycategoryId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动类别表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`personalneeds_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `td_qrcode`;
CREATE TABLE `td_qrcode`  (
  `qrcode_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码id',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码存放路径',
  `qrcode_type` int(2) NULL DEFAULT NULL COMMENT '二维码类型 0 活动分享 1 VIP客户体验邀请',
  `qrcode_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户id',
  `qrcode_activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动id',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`qrcode_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_readingsurvey
-- ----------------------------
DROP TABLE IF EXISTS `td_readingsurvey`;
CREATE TABLE `td_readingsurvey`  (
  `readingsurvey_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '阅读调研表',
  `readingsurvey_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读调研内容',
  `readingsurvey_status` int(11) NULL DEFAULT NULL COMMENT '调研选择状态0为，不参加调研，1表示参加调研',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`readingsurvey_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_recordingtime_account
-- ----------------------------
DROP TABLE IF EXISTS `td_recordingtime_account`;
CREATE TABLE `td_recordingtime_account`  (
  `recordingtime_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台支付提成给用户可提现，时间金额记录表,进账表',
  `recordingtime_start` datetime(0) NULL DEFAULT NULL,
  `recordingtime_end` datetime(0) NULL DEFAULT NULL,
  `account_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '进账金额',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`recordingtime_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_refereelockinguser
-- ----------------------------
DROP TABLE IF EXISTS `td_refereelockinguser`;
CREATE TABLE `td_refereelockinguser`  (
  `userLocking_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享活动链接给未注册用户，用户没有马上注册激活，但锁定该用户，该用户下次注册激活时即还是当前推荐人为该用户推荐人',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表，推荐人id',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '锁定用户的open_id',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`userLocking_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_report
-- ----------------------------
DROP TABLE IF EXISTS `td_report`;
CREATE TABLE `td_report`  (
  `report_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报活动',
  `report_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报内容',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_resource_upgrading
-- ----------------------------
DROP TABLE IF EXISTS `td_resource_upgrading`;
CREATE TABLE `td_resource_upgrading`  (
  `ru_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属人的资源升级记录（判断是否是第一次升级，以便设置归属人提成）',
  `ascription_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属人id',
  `resource_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源用户id',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ru_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `td_schedule_job`;
CREATE TABLE `td_schedule_job`  (
  `job_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `job_status` int(2) NULL DEFAULT NULL COMMENT '任务状态 0禁用 1启用 2删除',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务运行时间表达式cron表达式',
  `job_dec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_sendgetmail
-- ----------------------------
DROP TABLE IF EXISTS `td_sendgetmail`;
CREATE TABLE `td_sendgetmail`  (
  `mail_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站内信表',
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站内信内容',
  `senduser_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站内信发送者，暂时不用，都是平台发送，不用显示谁发送的',
  `getuser_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站内信接受者,暂时不用',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`mail_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_sendgetmail_anduser
-- ----------------------------
DROP TABLE IF EXISTS `td_sendgetmail_anduser`;
CREATE TABLE `td_sendgetmail_anduser`  (
  `userandmail_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户与站内信的第三方表',
  `mail_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联站内信表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表,站内信接受者',
  `is_readstatus` int(11) NULL DEFAULT NULL COMMENT '站内信阅读状态',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `senduser_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站内信发送者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`userandmail_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_sensitive_words
-- ----------------------------
DROP TABLE IF EXISTS `td_sensitive_words`;
CREATE TABLE `td_sensitive_words`  (
  `sensitive_words_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '敏感词库表',
  `sensitive_words_context` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '敏感词库内容',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sensitive_words_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_share
-- ----------------------------
DROP TABLE IF EXISTS `td_share`;
CREATE TABLE `td_share`  (
  `share_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享表，配置记录',
  `shareid_status` int(11) NULL DEFAULT NULL COMMENT '分享状态id,0为新闻分享，1为分享活动',
  `sharesend_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表    分享者',
  `shareget_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表     分享接收者',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动表',
  `journalism_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联新闻表',
  `sharing_records_delete` int(11) NULL DEFAULT NULL COMMENT '分享记录删除，1为删除',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`share_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_student_remittance
-- ----------------------------
DROP TABLE IF EXISTS `td_student_remittance`;
CREATE TABLE `td_student_remittance`  (
  `student_remittance_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '同学汇表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`student_remittance_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_system_help
-- ----------------------------
DROP TABLE IF EXISTS `td_system_help`;
CREATE TABLE `td_system_help`  (
  `system_help_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统帮助表',
  `system_help_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助类型',
  `system_help_context` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助内容',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`system_help_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_systembulletin
-- ----------------------------
DROP TABLE IF EXISTS `td_systembulletin`;
CREATE TABLE `td_systembulletin`  (
  `systembulletin_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统信息表(活动功能介绍和了解我们，1收益攻略，2用户协议)',
  `systembulletin_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '系统公告路径，上传h5',
  `system_status` int(11) NULL DEFAULT NULL COMMENT '系统发布的h5文件，类型0活动功能介绍和了解我们，1会员收益攻略，2用户协议,3资源攻略',
  `resource_strategy_qrcodeurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源攻略二维码存放路径',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`systembulletin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_systembulletin
-- ----------------------------
INSERT INTO `td_systembulletin` VALUES ('1', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `td_systembulletin` VALUES ('2', '收益是成千上万的  撒花是的asdasdasaa123', 1, NULL, NULL, '2018-10-17 15:40:16', NULL);
INSERT INTO `td_systembulletin` VALUES ('3', NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `td_systembulletin` VALUES ('4', '晨风:\n在近几年国家提出的“大众创业，万众创新”的政策引导下，五花八门的商业模式，层出不穷的各种项目，在有限的市场空间\n中激烈角逐拼杀，同时给市场带来了空前的竞争压力。面对身边众多资源因信息不对称，无法有效利用，使得各种行业都面临客户稀缺的困境。\n\n晨风:\n鉴于此，易迅连以大数据分析为依托，开发出了资源精准配置系统，实现需求精准配置，资源有效共享，轻松突破因个人能力制约、有效资源匮乏\n而导致的业务瓶颈。\n\n晨风:\n避免无效社交，节约宝贵时间；提高工作效率，降低业务成本。\n', 3, '', '2018-10-31 16:52:51', '2018-10-31 16:52:53', NULL);

-- ----------------------------
-- Table structure for td_systembulletin_notice
-- ----------------------------
DROP TABLE IF EXISTS `td_systembulletin_notice`;
CREATE TABLE `td_systembulletin_notice`  (
  `notice_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统公告表',
  `notice_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `notice_status` int(2) NULL DEFAULT NULL COMMENT '公告状态，0为下架，1为上架',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_systembulletin_userandnotice
-- ----------------------------
DROP TABLE IF EXISTS `td_systembulletin_userandnotice`;
CREATE TABLE `td_systembulletin_userandnotice`  (
  `user_andnotice_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统公告和用户的第三方表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notice_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `notice_status` int(11) NULL DEFAULT NULL COMMENT '阅读状态：0为未阅读，1为已经阅读',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_andnotice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_sysuser_and_feedbackadvice
-- ----------------------------
DROP TABLE IF EXISTS `td_sysuser_and_feedbackadvice`;
CREATE TABLE `td_sysuser_and_feedbackadvice`  (
  `sysuser_andfeedbackadvice_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复和反馈建议的第三方表',
  `sysuser_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联系统管理员表，谁处理的即回复反馈建议',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复那个，关联用户表',
  `feedbackadvice_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联反馈建议表',
  `reply_context` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '系统管理员回复内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sysuser_andfeedbackadvice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_taxrevenue
-- ----------------------------
DROP TABLE IF EXISTS `td_taxrevenue`;
CREATE TABLE `td_taxrevenue`  (
  `taxrevenue_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台设置税收表',
  `taxrevenue_rate` decimal(10, 4) NULL DEFAULT NULL COMMENT '税率小数',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `taxrevenue_status` int(11) NULL DEFAULT NULL COMMENT '税收状态：为1是为当前税率，其他未往期汇率',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`taxrevenue_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_try_usemanagervip
-- ----------------------------
DROP TABLE IF EXISTS `td_try_usemanagervip`;
CREATE TABLE `td_try_usemanagervip`  (
  `try_useVip_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户试用vip表',
  `try_useVip_days` int(11) NULL DEFAULT NULL COMMENT '试用天数',
  `try_useVip_startDay` date NULL DEFAULT NULL COMMENT '试用vip客户经理天数',
  `utype_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '6' COMMENT '关联用户类型表的体验vip客户经理',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`try_useVip_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_uenrollandactivity
-- ----------------------------
DROP TABLE IF EXISTS `td_uenrollandactivity`;
CREATE TABLE `td_uenrollandactivity`  (
  `uAndactivityEnroll_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动报名表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名用户id',
  `u_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名用户昵称',
  `u_sex` int(2) NULL DEFAULT 0 COMMENT '报名用户性别（0为女1为男）',
  `u_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名用户电话号码',
  `head_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名用户微信头像',
  `change_head_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名用户更改过后的头像',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动id',
  `organizer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动主办方id',
  `activitycategory_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动类别id',
  `deal_status` int(11) NULL DEFAULT NULL COMMENT '用户每个活动收费对应的支付状态0，为未成交，1为已成交',
  `usersign_status` int(11) NULL DEFAULT 0 COMMENT '签到状态，0为未签到，1表示已签到',
  `payment_status` int(11) NULL DEFAULT NULL COMMENT '支付提成给经理人的支付状态',
  `payment_num` decimal(11, 2) NULL DEFAULT NULL COMMENT '提交提成给系统平台的金额，每个客户经理的提成金额',
  `remar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主办方对每个活动的每个报名用户的备注',
  `status` int(2) NULL DEFAULT NULL COMMENT '数据状态，0 正常 ，1 不能使用',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uAndactivityEnroll_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_uhobby
-- ----------------------------
DROP TABLE IF EXISTS `td_uhobby`;
CREATE TABLE `td_uhobby`  (
  `hobby_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兴趣爱好',
  `hobby_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兴趣爱好',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`hobby_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_uhobby
-- ----------------------------
INSERT INTO `td_uhobby` VALUES ('01f769c6b3454c2c843d7839881df2de', '浩瀚', '2018-09-29 15:49:51', '2018-09-29 15:49:51', NULL);
INSERT INTO `td_uhobby` VALUES ('1', '养生', '2018-09-20 14:10:06', '2018-09-20 14:10:09', NULL);
INSERT INTO `td_uhobby` VALUES ('2', '美容', '2018-09-20 14:10:20', '2018-09-20 14:10:23', NULL);
INSERT INTO `td_uhobby` VALUES ('3941699f2f184e389042722040c62050', '大国崛起2', '2018-09-29 16:04:11', '2018-09-29 16:04:11', NULL);
INSERT INTO `td_uhobby` VALUES ('4bd89de82214428e92387260fdb5eb06', '裂变指数', '2018-09-29 15:48:23', '2018-09-29 15:48:23', NULL);
INSERT INTO `td_uhobby` VALUES ('6ac47b658ded48118e0d1081b19a535d', '', '2018-09-29 16:32:51', '2018-09-29 16:32:51', NULL);
INSERT INTO `td_uhobby` VALUES ('7dc8ed9e26a14acd8a548824ddaa9f18', '小竹清风', '2018-09-29 15:40:53', '2018-09-29 15:40:53', NULL);
INSERT INTO `td_uhobby` VALUES ('809be9eed33e428c95b7c1cdbdf68082', '杀杀杀', '2018-09-29 15:55:18', '2018-09-29 15:55:18', NULL);
INSERT INTO `td_uhobby` VALUES ('a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '2018-09-29 16:33:46', '2018-09-29 16:33:46', NULL);
INSERT INTO `td_uhobby` VALUES ('cd7db8bdbe3c4d02987e5cf7fc087624', '政治风云', '2018-09-29 15:36:04', '2018-09-29 15:36:04', NULL);
INSERT INTO `td_uhobby` VALUES ('fdcf973e8d9c482e9cbb9a7f9d90c83e', '古道西风', '2018-09-29 15:46:20', '2018-09-29 15:46:20', NULL);

-- ----------------------------
-- Table structure for td_uhobbyandactivitycategory
-- ----------------------------
DROP TABLE IF EXISTS `td_uhobbyandactivitycategory`;
CREATE TABLE `td_uhobbyandactivitycategory`  (
  `uhobby_and_activitycategory_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兴趣爱好和活动类型的第三方表',
  `activitycategory_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动类型表',
  `hobby_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联兴趣爱好表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uhobby_and_activitycategory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_uhobbyandactivitycategory
-- ----------------------------
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('03e0ba6e500b4573a25810b64899c80d', '1', '6ac47b658ded48118e0d1081b19a535d', '2018-09-29 16:32:50', '2018-09-29 16:32:50', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('0ba7a81742d14c588a624dfce1acbc9e', '2', '809be9eed33e428c95b7c1cdbdf68082', '2018-09-29 15:55:18', '2018-09-29 15:55:18', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('12648405cd344075945b37b32bf2810c', '3', '7dc8ed9e26a14acd8a548824ddaa9f18', '2018-09-29 15:40:53', '2018-09-29 15:40:53', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('18ed677a6f9a4ee692d88fa0313e988a', '8bafb8d5865d4a769c81810784608b32', 'de0d3807ab3b4f768228d9cbf934776f', '2018-09-29 14:49:53', '2018-09-29 14:49:53', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('2', '2', '1', '2018-10-31 16:36:20', '2018-10-31 16:36:23', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('23e59b510b7c4a7e953d00ade9694317', '3', '01f769c6b3454c2c843d7839881df2de', '2018-09-29 15:49:51', '2018-09-29 15:49:51', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('263ca82c9786405c8c4e77e923b403c1', '2', 'a97e15324a894a839f7f5238bb7b74b3', '2018-09-29 14:46:46', '2018-09-29 14:46:46', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('272e4f9040ad42dfb019940a92cde197', '3', 'fdcf973e8d9c482e9cbb9a7f9d90c83e', '2018-09-29 15:46:20', '2018-09-29 15:46:20', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('2a6103c7048046529871902ff7d86127', '1', 'a69315ae842249ffb11c34e93f3a58aa', '2018-09-29 16:33:46', '2018-09-29 16:33:46', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('3', '1', '2', '2018-10-31 16:36:40', '2018-10-31 16:36:43', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('36ae339c33534c7886d25bc9be5ddf75', '3', '7811fdb817ac464891bc9f6672bb67c0', '2018-09-29 15:34:20', '2018-09-29 15:34:20', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('3afc38e9e5cd454f857fea502bb632a5', '2', '4bd89de82214428e92387260fdb5eb06', '2018-09-29 15:48:22', '2018-09-29 15:48:22', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('4eff6dc7ca8f46c39120991258ebde27', '2', '3941699f2f184e389042722040c62050', '2018-09-29 16:04:11', '2018-09-29 16:04:11', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('5081f954efc645d698e3ed72d59e802d', '2', 'fdcf973e8d9c482e9cbb9a7f9d90c83e', '2018-09-29 15:46:20', '2018-09-29 15:46:20', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('71c6355e5fc34d6aae0b9af906519c05', '3', 'a97e15324a894a839f7f5238bb7b74b3', '2018-09-29 14:46:47', '2018-09-29 14:46:47', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('74f6c18aee5b4899b9105102ab745e3f', '1', 'de0d3807ab3b4f768228d9cbf934776f', '2018-09-29 14:49:53', '2018-09-29 14:49:53', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('7d71bcf5354c4fd6bd3b680675f6bf26', '1', 'cd7db8bdbe3c4d02987e5cf7fc087624', '2018-09-29 15:36:04', '2018-09-29 15:36:04', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('8ab745f6009b48d0bd60d224e1cd91ae', '3', '809be9eed33e428c95b7c1cdbdf68082', '2018-09-29 15:55:18', '2018-09-29 15:55:18', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('9e3f2c2995ab4b0190fa0d6c2fe1e913', '2', 'a69315ae842249ffb11c34e93f3a58aa', '2018-09-29 16:33:46', '2018-09-29 16:33:46', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('a4cc52f1e4c64b8ca3ab825396c72bb2', '2', 'cd7db8bdbe3c4d02987e5cf7fc087624', '2018-09-29 15:36:04', '2018-09-29 15:36:04', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('ad885e46b20140e98ce9b85bed28edc0', '2', '6ac47b658ded48118e0d1081b19a535d', '2018-09-29 16:32:51', '2018-09-29 16:32:51', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('cbe1439d88734ff7b82a755de4b72660', '2', '01f769c6b3454c2c843d7839881df2de', '2018-09-29 15:49:50', '2018-09-29 15:49:50', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('d3b08ff647834feeb0c024fd8fc0bf81', '3', '4bd89de82214428e92387260fdb5eb06', '2018-09-29 15:48:23', '2018-09-29 15:48:23', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('dd6a0d96aa0c4301a94bbc4d46bd8c61', '2', '7811fdb817ac464891bc9f6672bb67c0', '2018-09-29 15:34:20', '2018-09-29 15:34:20', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('ef3de0de725c4b8d95118c18eb927744', '3', '3941699f2f184e389042722040c62050', '2018-09-29 16:04:11', '2018-09-29 16:04:11', NULL);
INSERT INTO `td_uhobbyandactivitycategory` VALUES ('f0697c7a0d4547828e3dc3a22f411efd', '2', '7dc8ed9e26a14acd8a548824ddaa9f18', '2018-09-29 15:40:53', '2018-09-29 15:40:53', NULL);

-- ----------------------------
-- Table structure for td_umoney
-- ----------------------------
DROP TABLE IF EXISTS `td_umoney`;
CREATE TABLE `td_umoney`  (
  `umoney_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户提现流水表',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `put_money` decimal(20, 4) NULL DEFAULT NULL COMMENT '本次提现金额',
  `actualarrival_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '实际到账金额',
  `put_time` datetime(0) NULL DEFAULT NULL COMMENT '提现时间',
  `taxrevenue_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本次提现的税率，关联税率表',
  `payment_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提现成功微信返回的订单号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `put_status` int(2) NOT NULL COMMENT '提现状态： 0 提现成功 ，1 提现失败',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`umoney_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_user
-- ----------------------------
DROP TABLE IF EXISTS `td_user`;
CREATE TABLE `td_user`  (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '好友id',
  `open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信id',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `u_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `wx_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信头像',
  `change_head_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户更改过后的头像',
  `u_sex` int(2) NULL DEFAULT 0 COMMENT '性别（0为女1为男）',
  `ubirthday` date NULL DEFAULT NULL,
  `u_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `u_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号码',
  `u_balance` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '我的余额',
  `is_put_forward` int(2) NULL DEFAULT NULL COMMENT '0 不允许提现，1 可进行提现操作',
  `is_pay` int(2) NOT NULL DEFAULT 0 COMMENT '缴费状态（0未交费，1已缴费）',
  `is_vip` int(2) NULL DEFAULT 0 COMMENT '是否是vip（0普通用户，1普通客户经理，2vip客户经理）',
  `is_authentication` int(5) NULL DEFAULT 0 COMMENT '是否实名认证（0未认证，1已认证）',
  `utype_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联用户类型表',
  `egid_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联行业类型表',
  `egid_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业名称',
  `address_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户省市县区域名称',
  `province_citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city_citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `area_citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `memberid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员号',
  `member_start_time` datetime(0) NULL DEFAULT NULL COMMENT '会员开始时间',
  `member_end_time` datetime(0) NULL DEFAULT NULL COMMENT '会员结束时间',
  `creditrd_num` int(11) NULL DEFAULT NULL COMMENT '信用值分数',
  `userReferee_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐人id',
  `userReferee_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐人名称',
  `userManager_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经理人',
  `userManager_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经理人名称',
  `introduction_idfront` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主办方简介--身份证正面',
  `introduction_idback` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主办方简介--身份证反面',
  `introduction_license` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主办方简介--营业执照',
  `u_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户真实名称',
  `user_type` int(11) NULL DEFAULT NULL COMMENT '主办方发布活动简介类型0，为个人，1为企业',
  `pubactivities_ispay` int(11) NULL DEFAULT NULL COMMENT '发布活动支付认证状态0，为未支付1，为已经支付',
  `user_isactivation` int(11) NULL DEFAULT NULL COMMENT '用户是否已经激活，0未注册（即微信授权未注册的游客)，1为已经注册（未激活），2为已经激活,',
  `member_days` int(11) NULL DEFAULT NULL COMMENT '会员天数',
  `resource_strategy_isexperience` int(255) NULL DEFAULT NULL COMMENT '资源攻略表：是否体验，0为未体验，1为体验，2体验结束',
  `experience_time` datetime(0) NULL DEFAULT NULL COMMENT '体验VIP客户经理，体验开始时间',
  `experience_end_time` datetime(0) NULL DEFAULT NULL COMMENT '体验VIP客户经理，体验结束时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `utype_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户等级名称',
  `professional_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业职称',
  `can_provide` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '我能提供',
  `need` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '我需要什么',
  `belief_in_life` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人生信念',
  `closed_user_status` int(11) NULL DEFAULT 0 COMMENT '是否封户，默认0，未封户，1为封户',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `experienceutype_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户类型表',
  `resource_add_time` datetime(0) NULL DEFAULT NULL COMMENT '资源被锁定的时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of td_user
-- ----------------------------
INSERT INTO `td_user` VALUES ('141617d257734fd882b7047b5b7ec691', 'o_yTvvrlaNxntFxL4UDDhFbu8Rbg', NULL, NULL, '旗开得胜', 'http://thirdwx.qlogo.cn/mmopen/vi_32/lWAXPNLqcJ9Ft0OiaxezBh6UGZC8USllm3YVDmBGYsPaMY3JC2TRArJqqUxUeozr1g0rG72QiaQ632FibXvtDsQYA/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-14 14:07:51', '2018-11-14 14:10:11', NULL, '2018-11-15 13:53:38');
INSERT INTO `td_user` VALUES ('2b6ded221211423195b052a57daf27d0', 'o_yTvvhsMWANIBglqWjIAfLA00jk', NULL, NULL, '大鱼爱吃肉', 'http://thirdwx.qlogo.cn/mmopen/vi_32/TWzEt9HvxDGib9II99OAoEx60l0qlwf9dkYonv1vlU0ia9FNrDNTYX3RDxZcNNn2rIVNfd73JqQEpVdXO0Aw4ibvQ/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-14 11:53:38', '2018-11-14 11:53:38', NULL, '2018-11-15 13:53:35');
INSERT INTO `td_user` VALUES ('2fe3ba971f924ee6b9c165f23acab258', 'o_yTvvn8zwgIsodtgGSVMrr-WqDA', NULL, NULL, '润养', 'http://thirdwx.qlogo.cn/mmopen/vi_32/sycN6siaKJbWhcKFmUWqDYn9HKwXUXWEl2CjlBuP9uicl3K2uXHPlz6NZibLlfQyoic2QDLPENa4rpyEqX7t0dwG4Q/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-17 12:01:53', '2018-11-17 12:01:53', NULL, NULL);
INSERT INTO `td_user` VALUES ('309448055fa541f4996696f2e311eeb7', 'o_yTvvnhQSopiYMXo8WNbkau0Wc4', NULL, NULL, '徐梓娣', 'http://thirdwx.qlogo.cn/mmopen/vi_32/EGmhfBYyUXCxickdld4BRlWfHnDeGBC9pAwVGNOWtysDwj3ZLkW1l2jY4Qmp8JORCosicgF80QWGLgmNp3q0ca8Q/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-12 21:12:33', '2018-11-12 21:12:33', NULL, '2018-11-15 13:53:31');
INSERT INTO `td_user` VALUES ('3734ac2d273241568d68b9aa780de8ed', 'o_yTvvvzmCTg4f7GfOGOg6qf-kJ8', '06e977c4639e1f68733538e96cb6a822', '金林淑', '魅力金姐13232010000', 'http://thirdwx.qlogo.cn/mmopen/vi_32/RicItbYMjSmw1KJDB4NCWLHtE6NTG7TUBicxRxSESAV2uNPI28aO9SfPoaMjdV8QSautibmzG4gQoC7icCh2ia1v6pA/132', NULL, 0, '2018-11-16', NULL, '13232010000', 0.0000, 0, 0, 1, 0, '4', NULL, NULL, '四川省 成都市 龙泉驿区', '510000', '510100', '510112', 'jls8881', NULL, NULL, NULL, '6c92abad16614aaa89a301f9bd5530b0', '福客', '86e04d7dd79f4096b3aab8a71c20ca00', '韩府罡', NULL, NULL, NULL, NULL, NULL, 0, 2, 5, 1, '2018-11-16 14:09:26', '2018-11-23 14:09:26', NULL, 'VIP体验客户经理', NULL, NULL, NULL, NULL, 0, '2018-11-16 14:07:46', '2018-11-17 00:00:00', NULL, '2018-11-16 14:07:46');
INSERT INTO `td_user` VALUES ('64058acf26a0443e95f27244a2de210a', 'o_yTvvjNCTu4g2K-HlolYAaFuEpA', NULL, NULL, '李少鹏', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ibg0zqwLUgDy8ic7lj5vMfIzxJAib3NszIzUgspwRQIUGhI0uePQITCUZ5Pic2LibWnic1A9nWDujiagRbWVWK3nzepHA/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-16 16:33:54', '2018-11-16 16:33:54', NULL, NULL);
INSERT INTO `td_user` VALUES ('6c92abad16614aaa89a301f9bd5530b0', 'o_yTvvrsfIj9P3Xs_SrYKkcPgJzg', 'c183ae470186c5a7696840462350bddd', '福客', '福客', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq52CUsNENeNZsygGhdnx0ZAC3a59CiaEUymtRXZCbILI0mibfkibMgBYZEwWVUWZqbYQr1ZQ88lB7Hg/132', NULL, 1, '2018-11-16', NULL, '17828132939', 0.0000, 0, 0, 0, 0, '1', NULL, NULL, '四川省 成都市 青羊区', '510000', '510100', '510105', 'fk01', NULL, NULL, NULL, '86e04d7dd79f4096b3aab8a71c20ca00', '韩府罡', '86e04d7dd79f4096b3aab8a71c20ca00', '韩府罡', NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, '2018-11-16 01:00:37', '2018-11-23 01:00:37', NULL, '普通用户', NULL, NULL, NULL, NULL, 0, '2018-11-16 00:59:34', '2018-11-16 14:07:46', NULL, '2018-11-16 00:59:34');
INSERT INTO `td_user` VALUES ('75eb6c00e6f14e1d9bb3dbe24ca27eff', 'o_yTvvr03FDbEhZmiErBZ2NIgFDg', NULL, NULL, '顺其自然', 'http://thirdwx.qlogo.cn/mmopen/vi_32/MF7PLicF44H0sQ12lOJwPYPPz0pJfzBqttficbbpgT3wXws8V7tvc1YHCkYq6pKfL7RFe9sC4h3PfkmpK808hnzQ/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-16 16:33:03', '2018-11-16 16:33:03', NULL, NULL);
INSERT INTO `td_user` VALUES ('75f47129c5dd45ca870f46d4cc5a0d62', 'o_yTvvlk8DdEw-kRprJEbavpUXio', 'f5c36c5a8938535d9f27fd50b0e70c64', '贤彬', '贤彬', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKZ3pebzKBy8e3wIYFZ0tDN697mBBa4dIewH3LLsMXoTx3UAwulYHuHkibHcV5zPZibjIHVEibDibicQsA/132', NULL, 1, NULL, NULL, '13088010400', 0.0000, 0, 0, 0, 0, '1', NULL, NULL, '四川省 成都市 锦江区', '510000', '510100', '510104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, '普通用户', NULL, NULL, NULL, NULL, 0, '2018-11-16 16:34:15', '2018-11-16 16:35:23', NULL, NULL);
INSERT INTO `td_user` VALUES ('86101f281fb241959f866086a9547fda', 'o_yTvvgj8cWjsz4QrfoIIhQ2BmO0', 'bd8396403adb3e391b363266f6c10aca', '回老家了', '晨风', 'http://thirdwx.qlogo.cn/mmopen/vi_32/PW5w9ORxjwPuiaZzGXvJkLQvXS6wlYDSPHYbKK0I5JGt6TLwKa0evvLR7liaotZNJYDUh4oCNhRuEBTQ7KB6XYwg/132', NULL, 1, '2018-11-15', NULL, '18080791926', 0.0000, 0, 0, 0, 0, '1', '1', '建筑', '河北省 石家庄市 长安区', '130000', '130100', '130102', 'jhj123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, NULL, NULL, NULL, '普通用户', NULL, NULL, NULL, NULL, 0, '2018-11-13 16:12:09', '2018-11-16 14:02:17', NULL, '2018-11-15 13:53:28');
INSERT INTO `td_user` VALUES ('86e04d7dd79f4096b3aab8a71c20ca00', 'o_yTvvu13Xg1iKap2QZLh9HSO7TQ', 'cecaf994f665fa89b8d794d9474fa6ea', '韩府罡', '韩府罡-团队倍增导师18144381064', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epj3aZ1XC6Q8wVEVpvWC4aHbWDQelpfjxdK2T3AHSOAxqJn1eJiclz9rgJicTvHu3ZE1zOiaNZaKaRhQ/132', NULL, 1, '2018-11-16', NULL, '18144381064', 0.0000, 0, 0, 1, 0, '4', NULL, NULL, '四川省 成都市 锦江区', '510000', '510100', '510104', 'hfg430', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 5, 1, '2018-11-16 00:58:23', '2018-11-23 00:58:23', NULL, 'VIP体验客户经理', NULL, NULL, NULL, NULL, 0, '2018-11-16 00:54:39', '2018-11-17 00:00:00', NULL, '2018-11-16 00:59:34');
INSERT INTO `td_user` VALUES ('92be28997c2e4a6bb6f74402893b753c', 'o_yTvvgCrL8bDTXK9JNDHqzBpKxo', '33d3b2bd92177caaf3caa4298c02dfce', '会更后悔', '云海', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJQkRgwVegFeG8aTDlxJeonFGt5FEwU2pz4edKXibI267F8uAEich1bCMIMicpuvic60pk8nIm7aLrm1w/132', NULL, 1, '2018-11-12', NULL, '13477777767', 0.0000, 0, 0, 1, 0, '4', NULL, NULL, '山西省 太原市 小店区', '140000', '140100', '140105', 'yuanyuan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 4, 1, '2018-11-15 14:05:30', '2018-11-22 14:05:30', NULL, 'VIP体验客户经理', NULL, NULL, NULL, NULL, 0, '2018-11-12 16:26:22', '2018-11-17 00:00:00', NULL, '2018-11-15 13:53:24');
INSERT INTO `td_user` VALUES ('9fe8168b046a4e03b754426b8d932fbf', 'o_yTvvvS0LJ8UAgLE7v1mbZJhM3o', '2946b65b2d059ba5098bc7c77b5c723b', 'test', '远远啊i', '', NULL, 1, '2018-11-12', NULL, '17777777777', 0.0000, 0, 0, 0, 0, '1', NULL, NULL, '江苏省 南京市 玄武区', '320000', '320100', '320102', 'test', NULL, NULL, NULL, '92be28997c2e4a6bb6f74402893b753c', 'yuanyuan', '92be28997c2e4a6bb6f74402893b753c', 'yuanyuan', NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, '2018-11-12 16:57:53', '2018-11-19 16:57:53', NULL, '普通用户', NULL, NULL, NULL, NULL, 0, '2018-11-12 16:56:55', '2018-11-16 00:00:00', NULL, '2018-11-15 13:53:12');
INSERT INTO `td_user` VALUES ('aa53d9b5e0f546a8bbaea267d7f9a8a6', 'o_yTvvi3cUtCK0MXbgPjhOu_PI7Q', NULL, NULL, '中辉人力资源管理有限责任公司', 'http://thirdwx.qlogo.cn/mmopen/vi_32/rkcBicHnGU459Fslicd9oHwMbq2OVickdibttPy4pzzcQfxMydQHcSAdNfibwBBWXZ40oic54WzrAvPArgZcThudDdjQ/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-17 09:01:23', '2018-11-17 09:02:09', NULL, NULL);
INSERT INTO `td_user` VALUES ('e33f93c5d03f4f49b68fdb185e4baab8', 'o_yTvvmVZui4h8htbiw-fHLAUQ5c', NULL, NULL, '大米先生', 'http://thirdwx.qlogo.cn/mmopen/vi_32/JZ69SwQqoIm7PIWolx5gxrtKVeGyOpibPCed7XnLVVqVkxSm2PpjfZ2JNummoCJGfcibQtTpXU43uz3uT9EqBtng/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-17 09:02:23', '2018-11-17 09:02:23', NULL, NULL);
INSERT INTO `td_user` VALUES ('fe002c00fad64a70bb6d6bf58daf3f93', 'o_yTvvqhfCYBkZ-qDkbxIpmiPk8A', NULL, NULL, 'TOM', 'http://thirdwx.qlogo.cn/mmopen/vi_32/oS1cVXlibzxZI6x6iaxibZbbw0FuPibwbebvnggNh90kM52vGR75eHPicRv1nAMT3PbI70GZj3DaTYHLKFNP8JJ5Imw/132', NULL, 0, NULL, NULL, NULL, 0.0000, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-13 20:54:57', '2018-11-13 20:54:57', NULL, '2018-11-15 13:53:20');

-- ----------------------------
-- Table structure for td_user_experience_vip
-- ----------------------------
DROP TABLE IF EXISTS `td_user_experience_vip`;
CREATE TABLE `td_user_experience_vip`  (
  `experience_vip_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '体验vip客户经理表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表，体验人',
  `utype_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '5' COMMENT '关联用户类型，默认为5，体验vip用户类型',
  `experience_vip_starttime` date NULL DEFAULT NULL COMMENT '体验VIP客户经理开始时间',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`experience_vip_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_user_experience_vip
-- ----------------------------
INSERT INTO `td_user_experience_vip` VALUES ('bf124142d08e4cf390dd490af0a5608d', '180c0c8f6adf4cbbb97e798ffe653cb3', '4', '2018-10-17', '2018-10-17 11:37:00', '2018-10-17 11:37:00', NULL);

-- ----------------------------
-- Table structure for td_userandhobby
-- ----------------------------
DROP TABLE IF EXISTS `td_userandhobby`;
CREATE TABLE `td_userandhobby`  (
  `uAndh_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户表和兴趣爱好第三方关联表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `hobby_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兴趣爱好id',
  `hobby_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activitycategory_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动类型表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uAndh_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_userandhobby
-- ----------------------------
INSERT INTO `td_userandhobby` VALUES ('05db5a8bda564c7eb8618336eed061cf', 'af58acd7dfb1421bb4baa138837ec441', '01f769c6b3454c2c843d7839881df2de', '浩瀚', '3', '2018-11-04 20:52:10', '2018-11-04 20:52:10', NULL);
INSERT INTO `td_userandhobby` VALUES ('109d8ce8551e4226a6d75160316ed76f', 'dfc83dda4d9248a883b49ca091d4b844', 'fdcf973e8d9c482e9cbb9a7f9d90c83e', '古道西风', '2', '2018-10-30 18:30:18', '2018-10-30 18:30:18', NULL);
INSERT INTO `td_userandhobby` VALUES ('11e70b04a13648bd97c7c53eecbec5d5', '260265d69d844ea58c82dc3b1f2f989f', '3941699f2f184e389042722040c62050', '大国崛起2', 'ef3de0de725c4b8d95118c18eb927744', '2018-11-05 11:53:59', '2018-11-05 11:53:59', NULL);
INSERT INTO `td_userandhobby` VALUES ('1266f290c37a41cfbe396702f7242276', 'e6c402b8793149f1bfe5e3bc2c51e8a3', 'a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '2', '2018-11-05 09:54:17', '2018-11-05 09:54:17', NULL);
INSERT INTO `td_userandhobby` VALUES ('157ff0212e1c4631a213a6b7bb92c5f1', 'e6c402b8793149f1bfe5e3bc2c51e8a3', 'a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '2', '2018-11-05 09:54:32', '2018-11-05 09:54:32', NULL);
INSERT INTO `td_userandhobby` VALUES ('16638793e99046a4ae434e7efc6da2d0', 'ef24ca784469432296934ad5c9ecdee5', '4bd89de82214428e92387260fdb5eb06', '裂变指数', 'd3b08ff647834feeb0c024fd8fc0bf81', '2018-11-02 22:42:43', '2018-11-02 22:42:43', NULL);
INSERT INTO `td_userandhobby` VALUES ('1816df4cff2246f5bd2882fc355c18f0', 'af58acd7dfb1421bb4baa138837ec441', '809be9eed33e428c95b7c1cdbdf68082', '杀杀杀', '2', '2018-11-04 20:52:15', '2018-11-04 20:52:15', NULL);
INSERT INTO `td_userandhobby` VALUES ('214d39d566c641ebbe494439e8db5774', 'af58acd7dfb1421bb4baa138837ec441', '809be9eed33e428c95b7c1cdbdf68082', '杀杀杀', '3', '2018-11-04 20:52:10', '2018-11-04 20:52:10', NULL);
INSERT INTO `td_userandhobby` VALUES ('2906a95e19a64085900598540cc227ec', 'af58acd7dfb1421bb4baa138837ec441', '01f769c6b3454c2c843d7839881df2de', '浩瀚', '2', '2018-11-04 20:52:15', '2018-11-04 20:52:15', NULL);
INSERT INTO `td_userandhobby` VALUES ('2b782daaa6e44d2fb84e330cc38a82fc', '260265d69d844ea58c82dc3b1f2f989f', '809be9eed33e428c95b7c1cdbdf68082', '杀杀杀', '8ab745f6009b48d0bd60d224e1cd91ae', '2018-11-05 11:53:59', '2018-11-05 11:53:59', NULL);
INSERT INTO `td_userandhobby` VALUES ('400d04333b9749ad921c001bcd0e9c40', '260265d69d844ea58c82dc3b1f2f989f', 'a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '2a6103c7048046529871902ff7d86127', '2018-11-05 11:53:59', '2018-11-05 11:53:59', NULL);
INSERT INTO `td_userandhobby` VALUES ('42aac2a5be734ef68351d052e2828db5', '1dbadc95575e4eca91b7375bf61dc0eb', '1', '养生', '2', '2018-11-02 14:53:21', '2018-11-02 14:53:21', NULL);
INSERT INTO `td_userandhobby` VALUES ('59db4af24fa54af19c5b08392526d123', 'e6c402b8793149f1bfe5e3bc2c51e8a3', '2', '美容', '1', '2018-11-05 09:54:32', '2018-11-05 09:54:32', NULL);
INSERT INTO `td_userandhobby` VALUES ('6cb18d7aeb1d4136a13ed222dfcc9300', 'af58acd7dfb1421bb4baa138837ec441', '809be9eed33e428c95b7c1cdbdf68082', '杀杀杀', '3', '2018-11-04 20:52:15', '2018-11-04 20:52:15', NULL);
INSERT INTO `td_userandhobby` VALUES ('74f24cd2e2d44f1a87e4a9400bf49802', 'dfc83dda4d9248a883b49ca091d4b844', 'fdcf973e8d9c482e9cbb9a7f9d90c83e', '古道西风', '3', '2018-10-30 18:30:18', '2018-10-30 18:30:18', NULL);
INSERT INTO `td_userandhobby` VALUES ('7f10a4ee4820411a852bf466b382f2d6', 'ef24ca784469432296934ad5c9ecdee5', '1', '养生', '2', '2018-11-02 22:42:43', '2018-11-02 22:42:43', NULL);
INSERT INTO `td_userandhobby` VALUES ('8120246f179a4e7591f8215226de2c19', 'e6c402b8793149f1bfe5e3bc2c51e8a3', '1', '养生', '2', '2018-11-05 09:53:25', '2018-11-05 09:53:25', NULL);
INSERT INTO `td_userandhobby` VALUES ('8712f208ffb643e8aa587515f7d192b9', '260265d69d844ea58c82dc3b1f2f989f', 'a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '9e3f2c2995ab4b0190fa0d6c2fe1e913', '2018-11-05 11:53:59', '2018-11-05 11:53:59', NULL);
INSERT INTO `td_userandhobby` VALUES ('893f984040e34a27a02b1948bc9834e8', 'e6c402b8793149f1bfe5e3bc2c51e8a3', '2', '美容', '1', '2018-11-05 09:53:25', '2018-11-05 09:53:25', NULL);
INSERT INTO `td_userandhobby` VALUES ('8b3ba055cc4b41bea1ab5b6f42e358df', 'af58acd7dfb1421bb4baa138837ec441', '7dc8ed9e26a14acd8a548824ddaa9f18', '小竹清风', '2', '2018-11-04 20:52:15', '2018-11-04 20:52:15', NULL);
INSERT INTO `td_userandhobby` VALUES ('9db191536b794a6ab38adceb932f9e4b', 'e6c402b8793149f1bfe5e3bc2c51e8a3', '1', '养生', '2', '2018-11-05 09:54:17', '2018-11-05 09:54:17', NULL);
INSERT INTO `td_userandhobby` VALUES ('a79ffb8425874468903bbbfbc18d2670', 'e6c402b8793149f1bfe5e3bc2c51e8a3', '2', '美容', '1', '2018-11-05 09:54:17', '2018-11-05 09:54:17', NULL);
INSERT INTO `td_userandhobby` VALUES ('b2981ec546214f71a43f3da78f5deb2e', 'e6c402b8793149f1bfe5e3bc2c51e8a3', 'a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '2', '2018-11-05 09:53:25', '2018-11-05 09:53:25', NULL);
INSERT INTO `td_userandhobby` VALUES ('b7701491942e435e96446a175a7ea834', 'af58acd7dfb1421bb4baa138837ec441', '7dc8ed9e26a14acd8a548824ddaa9f18', '小竹清风', '3', '2018-11-04 20:52:15', '2018-11-04 20:52:15', NULL);
INSERT INTO `td_userandhobby` VALUES ('c157c19efe8f4e1bac88f5b9bc8407c8', '260265d69d844ea58c82dc3b1f2f989f', '809be9eed33e428c95b7c1cdbdf68082', '杀杀杀', '0ba7a81742d14c588a624dfce1acbc9e', '2018-11-05 11:53:59', '2018-11-05 11:53:59', NULL);
INSERT INTO `td_userandhobby` VALUES ('cbc54534e51648e4992b056b15f1dd8d', 'e6c402b8793149f1bfe5e3bc2c51e8a3', '1', '养生', '2', '2018-11-05 09:54:32', '2018-11-05 09:54:32', NULL);
INSERT INTO `td_userandhobby` VALUES ('d585e150be44464cbb5c7cfed5bbfe2c', 'af58acd7dfb1421bb4baa138837ec441', '7dc8ed9e26a14acd8a548824ddaa9f18', '小竹清风', '3', '2018-11-04 20:52:10', '2018-11-04 20:52:10', NULL);
INSERT INTO `td_userandhobby` VALUES ('d5dfaf8e32164432bc65178a5bfa37e1', 'e6c402b8793149f1bfe5e3bc2c51e8a3', 'a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '1', '2018-11-05 09:54:32', '2018-11-05 09:54:32', NULL);
INSERT INTO `td_userandhobby` VALUES ('d5f66195a8b0457dbfc0be8a5aaf84c8', 'af58acd7dfb1421bb4baa138837ec441', '809be9eed33e428c95b7c1cdbdf68082', '杀杀杀', '2', '2018-11-04 20:52:10', '2018-11-04 20:52:10', NULL);
INSERT INTO `td_userandhobby` VALUES ('df72c1be4fd842bd91cc36c1dba6b8b0', 'af58acd7dfb1421bb4baa138837ec441', '7dc8ed9e26a14acd8a548824ddaa9f18', '小竹清风', '2', '2018-11-04 20:52:10', '2018-11-04 20:52:10', NULL);
INSERT INTO `td_userandhobby` VALUES ('e29dc25a61374782ba06f259495f6ed0', 'ef24ca784469432296934ad5c9ecdee5', '4bd89de82214428e92387260fdb5eb06', '裂变指数', '3afc38e9e5cd454f857fea502bb632a5', '2018-11-02 22:42:43', '2018-11-02 22:42:43', NULL);
INSERT INTO `td_userandhobby` VALUES ('e676e1bef4ac47d98b52653286b42c59', '1dbadc95575e4eca91b7375bf61dc0eb', '2', '美容', '3', '2018-11-02 14:53:21', '2018-11-02 14:53:21', NULL);
INSERT INTO `td_userandhobby` VALUES ('e816257207d1464cac9c281a39dfafc3', 'e6c402b8793149f1bfe5e3bc2c51e8a3', 'a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '1', '2018-11-05 09:53:25', '2018-11-05 09:53:25', NULL);
INSERT INTO `td_userandhobby` VALUES ('ec15d617adbb478e8860df1ce07c0349', '260265d69d844ea58c82dc3b1f2f989f', '3941699f2f184e389042722040c62050', '大国崛起2', '4eff6dc7ca8f46c39120991258ebde27', '2018-11-05 11:53:59', '2018-11-05 11:53:59', NULL);
INSERT INTO `td_userandhobby` VALUES ('ecb8363641c5425ea0ec488f97729e3c', 'af58acd7dfb1421bb4baa138837ec441', '01f769c6b3454c2c843d7839881df2de', '浩瀚', '2', '2018-11-04 20:52:10', '2018-11-04 20:52:10', NULL);
INSERT INTO `td_userandhobby` VALUES ('f11655d43ff74c86b63b7e5a24041aa9', 'e6c402b8793149f1bfe5e3bc2c51e8a3', 'a69315ae842249ffb11c34e93f3a58aa', '音乐剧22', '1', '2018-11-05 09:54:17', '2018-11-05 09:54:17', NULL);
INSERT INTO `td_userandhobby` VALUES ('f64a971848e24e4280f66030e778cd87', 'af58acd7dfb1421bb4baa138837ec441', '01f769c6b3454c2c843d7839881df2de', '浩瀚', '3', '2018-11-04 20:52:15', '2018-11-04 20:52:15', NULL);

-- ----------------------------
-- Table structure for td_userandpersonalneeds
-- ----------------------------
DROP TABLE IF EXISTS `td_userandpersonalneeds`;
CREATE TABLE `td_userandpersonalneeds`  (
  `userAndpersonalneeds_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户和个人需求的第三方表，多对多',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personalneeds_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联个人需求表',
  `activitycategory_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联活动类型表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`userAndpersonalneeds_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_userandreadingsurvey
-- ----------------------------
DROP TABLE IF EXISTS `td_userandreadingsurvey`;
CREATE TABLE `td_userandreadingsurvey`  (
  `ureadingsurvey_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调研与用户的第三方关联表',
  `readingsurvey_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联调研表',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联用户表',
  `journalism_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联新闻表',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ureadingsurvey_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_userprofit
-- ----------------------------
DROP TABLE IF EXISTS `td_userprofit`;
CREATE TABLE `td_userprofit`  (
  `profit_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的提成表，',
  `ac_money` decimal(11, 2) NOT NULL COMMENT '提成金额',
  `activity_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提成活动,关联活动表',
  `payment_time` datetime(0) NOT NULL COMMENT '支付时间即到待提现时间，待提现到可提现的开始冻结时间',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联用户表id',
  `upgrade_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升级用户的id',
  `recordingtime_end` datetime(0) NULL DEFAULT NULL COMMENT '待提现到可提现冻结时间的结束时间',
  `profit_status` int(2) NULL DEFAULT NULL COMMENT '0 活动提成  1 资源用户升级vip所得提成',
  `money_status` int(2) NOT NULL COMMENT '当前款项的状态（0 待提现 ，1 可提现 ，2 已提现）',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`profit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_utype
-- ----------------------------
DROP TABLE IF EXISTS `td_utype`;
CREATE TABLE `td_utype`  (
  `utype_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户等级',
  `user_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户充值等级',
  `user_day` int(255) NULL DEFAULT NULL COMMENT 'de等级使用天数',
  `utype_charge` decimal(11, 0) NULL DEFAULT NULL COMMENT '等级金额',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`utype_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of td_utype
-- ----------------------------
INSERT INTO `td_utype` VALUES ('1', '普通用户', NULL, NULL, '2018-09-20 14:12:05', '2018-09-20 14:12:08', NULL);
INSERT INTO `td_utype` VALUES ('2', '普通客户经理', 90, 749, '2018-09-20 14:12:23', '2018-10-15 11:34:41', '');
INSERT INTO `td_utype` VALUES ('3', 'VIP客户经理', 365, 1064, '2018-09-20 14:15:35', '2018-09-20 14:15:37', NULL);
INSERT INTO `td_utype` VALUES ('4', 'VIP体验客户经理', 7, NULL, '2018-09-20 14:19:45', '2018-09-20 14:19:47', NULL);
INSERT INTO `td_utype` VALUES ('5', 'VIP试用客户经理', 50, 100, '2018-09-20 14:53:49', '2018-09-28 18:07:39', '2');
INSERT INTO `td_utype` VALUES ('6', '钻石客户经理', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for td_utype_andvipmember_curriculum
-- ----------------------------
DROP TABLE IF EXISTS `td_utype_andvipmember_curriculum`;
CREATE TABLE `td_utype_andvipmember_curriculum`  (
  `utype_andvipmember_curriculum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vip_member_curriculum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升级为易商同学汇+Vip客户经理的课程表',
  `utype_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户等级',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`utype_andvipmember_curriculum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for td_vip_member_curriculum
-- ----------------------------
DROP TABLE IF EXISTS `td_vip_member_curriculum`;
CREATE TABLE `td_vip_member_curriculum`  (
  `vip_member_curriculum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '升级为易商同学汇+Vip客户经理的课程表',
  `vip_member_curriculum_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名字',
  `vip_member_curriculum_introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程介绍',
  `vip_member_curriculum_price` decimal(10, 4) NULL DEFAULT NULL COMMENT '价格',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`vip_member_curriculum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command`  (
  `COMMAND_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', 1, '锁定计算机');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', 1, '打开浏览器操作');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', 2, '关闭浏览器操作');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', 1, '关闭QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', 1, '打开QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg`  (
  `IMGMSG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', 1, '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_key
-- ----------------------------
DROP TABLE IF EXISTS `weixin_key`;
CREATE TABLE `weixin_key`  (
  `KEY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `APPID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appid',
  `APPSECRET` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appsecret',
  `ACCESS_TOKEN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'access_token',
  `CREATETIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `WXUSERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号',
  PRIMARY KEY (`KEY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_key
-- ----------------------------
INSERT INTO `weixin_key` VALUES ('58510f788aea4924b4a5438ecda5f749', 'itFteacher', '11111112222', '1111222333', '', '2017-03-29 02:31:03', 'itFteacher', 'itFteacher');

-- ----------------------------
-- Table structure for weixin_mymenu
-- ----------------------------
DROP TABLE IF EXISTS `weixin_mymenu`;
CREATE TABLE `weixin_mymenu`  (
  `MYMENU_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `WXUSERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号',
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `TITLE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指向',
  `XID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'XID',
  PRIMARY KEY (`MYMENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_mymenu
-- ----------------------------
INSERT INTO `weixin_mymenu` VALUES ('00ca43bbba2746429c8a6e0028a2f197', 'itFteacher', 'itFteacher', '', '', '', 'M33');
INSERT INTO `weixin_mymenu` VALUES ('02c67417e56f43a6be5356d5c5201ef7', 'itFteacher', 'itFteacher', '', '', '', 'M21');
INSERT INTO `weixin_mymenu` VALUES ('13e5b9a51f87430dabe2d8cc998d297c', 'itFteacher', 'itFteacher', '一级菜单', '', '', 'M1');
INSERT INTO `weixin_mymenu` VALUES ('14e68258190b45cba4d21e132508252d', 'itFteacher', 'itFteacher', '', '', '', 'M13');
INSERT INTO `weixin_mymenu` VALUES ('16230e4149134556ac5edf691d25be2a', 'itFteacher', 'itFteacher', '', '', '', 'M24');
INSERT INTO `weixin_mymenu` VALUES ('19353267c4ea43fb903b88f6401ea41a', 'itFteacher', 'itFteacher', '', '', '', 'M25');
INSERT INTO `weixin_mymenu` VALUES ('230f6447fee84bcd827de0ec73970660', 'itFteacher', 'itFteacher', '', '', '', 'M2');
INSERT INTO `weixin_mymenu` VALUES ('24315e33166647198dcbd31a44a1a866', 'itFteacher', 'itFteacher', '', '', '', 'M14');
INSERT INTO `weixin_mymenu` VALUES ('3daed1d236224a729860e77fe7295ea7', 'itFteacher', 'itFteacher', '', '', '', 'M32');
INSERT INTO `weixin_mymenu` VALUES ('3fbae4e173de4f36a6d721ca77b6480c', 'itFteacher', 'itFteacher', '', '', '', 'M34');
INSERT INTO `weixin_mymenu` VALUES ('4532044ae6cd4c7cb1c89e2cfdb0d812', 'itFteacher', 'itFteacher', '', '', '', 'M22');
INSERT INTO `weixin_mymenu` VALUES ('5fb159eb85a049ef9e0f7b56c2c8538e', 'itFteacher', 'itFteacher', '', '', '', 'M12');
INSERT INTO `weixin_mymenu` VALUES ('656c281ed7a142d6907baa6b36e93347', 'itFteacher', 'itFteacher', '', '', '', 'M23');
INSERT INTO `weixin_mymenu` VALUES ('679127c586784974a18e64a3660e0d11', 'itFteacher', 'itFteacher', '', '', '', 'M35');
INSERT INTO `weixin_mymenu` VALUES ('999a8965d4484facaaeb2768471207c5', 'itFteacher', 'itFteacher', '', '', '', 'M3');
INSERT INTO `weixin_mymenu` VALUES ('aa09cedf69e04eda9bb3a0f3b77db46c', 'itFteacher', 'itFteacher', '', '', '', 'M15');
INSERT INTO `weixin_mymenu` VALUES ('c193c0f155034d68a79c662b4046699f', 'itFteacher', 'itFteacher', '', '', '', 'M11');
INSERT INTO `weixin_mymenu` VALUES ('e940253208d84c81ae8fbec4f5f299a9', 'itFteacher', 'itFteacher', '', '', '', 'M31');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg`  (
  `TEXTMSG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) NULL DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', 1, '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', 1, '关注回复');

SET FOREIGN_KEY_CHECKS = 1;
