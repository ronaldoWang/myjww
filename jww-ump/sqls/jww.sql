/*
Navicat MySQL Data Transfer

Source Server         : jww
Source Server Version : 50626
Source Host           : 47.99.90.68:3306
Source Database       : jww

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-11-10 11:17:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('AHSScheduler', 'TASK_1042246200989245442', 'DEFAULT', '0/5 * * * * ? ', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1042246200989245442', 'DEFAULT', '0/5 * * * * ? ', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
INSERT INTO `qrtz_fired_triggers` VALUES ('RenrenScheduler', 'DESKTOP-D3LUKQA15373354379901537335438164', 'TASK_1042246200989245442', 'DEFAULT', 'DESKTOP-D3LUKQA1537335437990', '1537336595056', '1537336595000', '5', 'EXECUTING', 'TASK_1042246200989245442', 'DEFAULT', '0', '0');
INSERT INTO `qrtz_fired_triggers` VALUES ('RenrenScheduler', 'DESKTOP-D3LUKQA15373354379901537335438165', 'TASK_1042246200989245442', 'DEFAULT', 'DESKTOP-D3LUKQA1537335437990', '1537336595197', '1537336600000', '5', 'ACQUIRED', null, null, '0', '0');

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('AHSScheduler', 'TASK_1042246200989245442', 'DEFAULT', null, 'com.jww.quartz.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400EA7B226265616E4E616D65223A22746573745461736B222C226372656174654279223A312C2263726561746554696D65223A22323031382D30392D31392031303A35373A3133222C2263726F6E45787072657373696F6E223A22302F35202A202A202A202A203F20222C226964223A313034323234363230303938393234353434322C22697344656C223A302C226D6574686F644E616D65223A2274657374222C22706172616D73223A22313233222C22737461747573223A302C227570646174654279223A312C2275706461746554696D65223A22323031382D30392D31392031313A30303A3238227D7800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1042246200989245442', 'DEFAULT', null, 'com.jww.quartz.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400FB7B226265616E4E616D65223A22636F6D2E6A77772E636F6D6D6F6E2E71756172747A2E7461736B2E546573745461736B222C226372656174654279223A312C2263726561746554696D65223A22323031382D30392D31392031303A35373A3132222C2263726F6E45787072657373696F6E223A22302F35202A202A202A202A203F20222C226964223A313034323234363230303938393234353434322C226D6574686F644E616D65223A2274657374222C22706172616D73223A22313233222C22737461747573223A302C227570646174654279223A312C2275706461746554696D65223A22323031382D30392D31392031303A35373A3132227D7800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('AHSScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('AHSScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('AHSScheduler', 'LAPTOP-L065DKAP1541818413580', '1541819819830', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-D3LUKQA1537335437990', '1537336582400', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerFactoryBean', 'LAPTOP-L065DKAP1537285614612', '1537286115997', '20000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('AHSScheduler', 'TASK_1042246200989245442', 'DEFAULT', 'TASK_1042246200989245442', 'DEFAULT', null, '1537349625000', '-1', '5', 'PAUSED', 'CRON', '1537349623000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597401057B226265616E4E616D65223A22746573745461736B222C226372656174654279223A312C2263726561746554696D65223A22323031382D30392D31392031303A35373A3133222C2263726F6E45787072657373696F6E223A22302F35202A202A202A202A203F20222C226964223A313034323234363230303938393234353434322C22697344656C223A302C226D6574686F644E616D65223A2274657374222C22706172616D73223A2231323332222C22737461747573223A312C227461736B4E616D65223A22E6B58BE8AF95E4BBBBE58AA1222C227570646174654279223A312C2275706461746554696D65223A22323031382D30392D32312031333A32313A3432227D7800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1042246200989245442', 'DEFAULT', 'TASK_1042246200989245442', 'DEFAULT', null, '1537336600000', '1537336595000', '5', 'ACQUIRED', 'CRON', '1537325833000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597401047B226265616E4E616D65223A22746573745461736B222C226372656174654279223A312C2263726561746554696D65223A22323031382D30392D31392031303A35373A3133222C2263726F6E45787072657373696F6E223A22302F35202A202A202A202A203F20222C226964223A313034323234363230303938393234353434322C22697344656C223A302C226D6574686F644E616D65223A2274657374222C22706172616D73223A22313233222C22737461747573223A302C227461736B4E616D65223A22E6B58BE8AF95E4BBBBE58AA1222C227570646174654279223A312C2275706461746554696D65223A22323031382D30392D31392031313A30303A3238227D7800);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `unit_id` bigint(20) NOT NULL COMMENT '隶属单位',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门编号',
  `sort_no` int(3) DEFAULT NULL COMMENT '排序号',
  `leaf_` int(1) DEFAULT NULL COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=947126071521034243 DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '1', 'JWW', '0', '1', '0', '0', '1', 'qw', '1', '2016-06-28 18:04:06', '1', '2017-12-30 23:34:59');

-- ----------------------------
-- Table structure for sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_` varchar(50) NOT NULL,
  `code_` varchar(50) DEFAULT NULL,
  `code_text` varchar(100) DEFAULT NULL,
  `parent_type` varchar(50) DEFAULT NULL,
  `parent_code` varchar(50) DEFAULT NULL,
  `sort_no` int(2) DEFAULT NULL,
  `editable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `type__code_` (`type_`,`code_`,`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1046060701123510275 DEFAULT CHARSET=utf8 COMMENT='数据字典明细表';

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES ('1', 'SEX', '0', '未知', null, null, '1', '0', '0', '0', '', '1', '2016-06-28 18:04:06', '1', '2018-09-20 21:17:44');
INSERT INTO `sys_dic` VALUES ('2', 'SEX', '1', '男', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:12');
INSERT INTO `sys_dic` VALUES ('3', 'SEX', '2', '女', null, null, '3', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2017-12-30 23:35:11');
INSERT INTO `sys_dic` VALUES ('4', 'LOCKED', '0', '激活', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:11');
INSERT INTO `sys_dic` VALUES ('5', 'LOCKED', '1', '锁定', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:10');
INSERT INTO `sys_dic` VALUES ('6', 'ROLETYPE', '1', '业务角色', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES ('7', 'ROLETYPE', '2', '管理角色', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES ('8', 'ROLETYPE', '3', '系统内置角色', null, null, '3', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:08');
INSERT INTO `sys_dic` VALUES ('9', 'LEAF', '0', '树枝节点', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2017-12-27 15:24:38');
INSERT INTO `sys_dic` VALUES ('10', 'LEAF', '1', '叶子节点', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:07');
INSERT INTO `sys_dic` VALUES ('11', 'EDITABLE', '0', '只读', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES ('12', 'EDITABLE', '1', '可编辑', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES ('13', 'ENABLE', '0', '禁用', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:05');
INSERT INTO `sys_dic` VALUES ('14', 'ENABLE', '1', '启用', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:04');
INSERT INTO `sys_dic` VALUES ('15', 'AUTHORIZELEVEL', '1', '访问权限', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES ('16', 'AUTHORIZELEVEL', '2', '管理权限', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:02');
INSERT INTO `sys_dic` VALUES ('17', 'MENUTYPE', '1', '系统菜单', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES ('18', 'MENUTYPE', '2', '业务菜单', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('19', 'USERTYPE', '1', '经办员', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:50');
INSERT INTO `sys_dic` VALUES ('20', 'USERTYPE', '2', '管理员', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:48');
INSERT INTO `sys_dic` VALUES ('21', 'USERTYPE', '3', '系统内置用户', null, null, '3', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES ('22', 'EXPAND', '0', '收缩', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES ('23', 'EXPAND', '1', '展开', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:46');
INSERT INTO `sys_dic` VALUES ('24', 'CRUD', 'add', '新增', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:56');
INSERT INTO `sys_dic` VALUES ('25', 'CRUD', 'read', '查询', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:58');
INSERT INTO `sys_dic` VALUES ('26', 'CRUD', 'update', '修改', null, null, '3', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES ('27', 'CRUD', 'delete', '删除', null, null, '4', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES ('28', 'CRUD', 'open', '打开', null, null, '5', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:00');
INSERT INTO `sys_dic` VALUES ('29', 'CRUD', 'close', '关闭', null, null, '6', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('30', 'CRUD', 'run', '执行', null, null, '7', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('1042979489576296449', 'TASK_STATUS', '0', '正常', null, null, '1', '1', '0', '1', '定时任务', '1', '2018-09-21 11:31:03', '1', '2018-09-21 11:31:03');
INSERT INTO `sys_dic` VALUES ('1042979620140785666', 'TASK_STATUS', '1', '暂停', null, null, '2', '1', '0', '1', '定时任务', '1', '2018-09-21 11:31:34', '1', '2018-09-21 11:31:34');
INSERT INTO `sys_dic` VALUES ('1046060588879740930', 'TASK_RESULT', '0', '成功', null, null, '1', '1', '0', '1', '任务执行结果', '1', '2018-09-29 23:34:14', '1', '2018-09-29 23:34:48');
INSERT INTO `sys_dic` VALUES ('1046060701123510274', 'TASK_RESULT', '1', '失败', null, null, '2', '1', '0', '1', '任务执行结果', '1', '2018-09-29 23:34:41', '1', '2018-09-29 23:34:41');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `operation_` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `operation_type` tinyint(1) DEFAULT NULL COMMENT '操作类型',
  `method_` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params_` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `result_` tinyint(1) DEFAULT NULL COMMENT '操作结果',
  `time_` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip_` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `remark_` varchar(500) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=1061092781004451842 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `menu_name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `menu_type` smallint(2) DEFAULT '2' COMMENT '菜单类型(0：目录1：菜单2：按钮)',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级菜单编号',
  `iconcls_` varchar(50) DEFAULT NULL COMMENT '节点图标CSS类名',
  `request_` varchar(100) DEFAULT NULL COMMENT '请求地址',
  `expand_` tinyint(1) NOT NULL DEFAULT '0' COMMENT '展开状态(1:展开;0:收缩)',
  `sort_no` int(2) DEFAULT NULL COMMENT '排序号',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `permission_` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) DEFAULT '1',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=1042721453079252994 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '0', 'icon-xitongguanli', '#', '1', '1', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-30 23:35:04');
INSERT INTO `sys_menu` VALUES ('2', '用户管理', '1', '1', 'icon-yonghuguanli', 'page/sys/user/userList.html', '0', '1', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2018-10-06 09:21:07');
INSERT INTO `sys_menu` VALUES ('3', '部门管理', '1', '1', 'icon-bumenguanli', 'page/sys/dept/deptList.html', '0', '2', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-28 22:41:08');
INSERT INTO `sys_menu` VALUES ('4', '菜单管理', '1', '1', 'icon-caidanguanli', 'page/sys/menu/menuList.html', '0', '3', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-28 22:41:28');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', '1', '1', 'icon-jiaoseguanli', 'page/sys/role/roleList.html', '0', '4', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-29 15:51:49');
INSERT INTO `sys_menu` VALUES ('7', '字典管理', '1', '1', 'icon-ccgl-shujuzidian-1', 'page/sys/dic/dicList.html', '0', '7', '1', 'sys:dic', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-29 23:10:16');
INSERT INTO `sys_menu` VALUES ('8', '参数管理', '1', '1', 'icon-xitongcanshuguanli', 'page/sys/param/paramList.html', '0', '8', '1', '', '', '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-28 22:42:19');
INSERT INTO `sys_menu` VALUES ('9', '日志管理', '1', '1', 'icon-ccgl-shujuzidian-1', 'page/sys/log/logList.html', '0', '9', '1', 'sys:log:read', '', '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-29 23:07:05');
INSERT INTO `sys_menu` VALUES ('18', '新增', '2', '2', null, null, '0', '2', '1', 'sys:user:add,sys:role:read,sys:user:read', null, '0', '1', '1', '2017-12-19 11:22:58', '1', '2017-12-30 14:46:41');
INSERT INTO `sys_menu` VALUES ('19', '修改', '2', '2', null, null, '0', '3', '1', 'sys:user:update,sys:role:read,sys:user:read', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2017-12-30 15:14:57');
INSERT INTO `sys_menu` VALUES ('21', '删除', '2', '2', null, null, '0', '4', '1', 'sys:user:delete', null, '0', '1', '1', '2017-12-19 12:37:20', '1', '2017-12-19 12:37:23');
INSERT INTO `sys_menu` VALUES ('22', '应用监控', '1', '1', 'icon-jiaoseguanli', 'druid/webapp.html', '0', '12', '1', 'sys:sql:read', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-28 22:44:36');
INSERT INTO `sys_menu` VALUES ('945569164808769538', '新增', '2', '5', null, null, '0', '2', '1', 'sys:role:add,sys:menu:read', null, '0', '1', '1', '2017-12-26 16:17:11', '1', '2017-12-29 15:49:48');
INSERT INTO `sys_menu` VALUES ('945569292122673153', '修改', '2', '5', null, null, '0', '3', '1', 'sys:role:update,sys:role:read,sys:menu:read', null, '0', '1', '1', '2017-12-26 16:17:42', '1', '2017-12-29 15:49:57');
INSERT INTO `sys_menu` VALUES ('945569401908580354', '删除', '2', '5', null, null, '0', '4', '1', 'sys:role:delete', null, '0', '1', '1', '2017-12-26 16:18:08', '1', '2017-12-26 16:20:08');
INSERT INTO `sys_menu` VALUES ('945570894350995458', '新增', '2', '3', null, null, '0', '2', '1', 'sys:dept:add', null, '0', '1', '1', '2017-12-26 16:24:04', '1', '2017-12-26 16:24:53');
INSERT INTO `sys_menu` VALUES ('945570988546674689', '修改', '2', '3', null, null, '0', '3', '1', 'sys:dept:update,sys:dept:read', null, '0', '1', '1', '2017-12-26 16:24:26', '1', '2017-12-26 16:24:54');
INSERT INTO `sys_menu` VALUES ('945571061959577601', '删除', '2', '3', null, null, '0', '4', '1', 'sys:dept:delete', null, '0', '1', '1', '2017-12-26 16:24:44', '1', '2017-12-26 16:24:56');
INSERT INTO `sys_menu` VALUES ('945571423827349506', '新增', '2', '4', null, null, '0', '2', '1', 'sys:menu:add', null, '0', '1', '1', '2017-12-26 16:26:10', '1', '2017-12-26 16:26:51');
INSERT INTO `sys_menu` VALUES ('945571487333306370', '修改', '2', '4', null, null, '0', '3', '1', 'sys:menu:update,sys:menu:read', null, '0', '1', '1', '2017-12-26 16:26:25', '1', '2017-12-26 16:26:53');
INSERT INTO `sys_menu` VALUES ('945571554194706434', '删除', '2', '4', null, null, '0', '4', '1', 'sys:menu:delete', null, '0', '1', '1', '2017-12-26 16:26:41', '1', '2017-12-30 23:33:32');
INSERT INTO `sys_menu` VALUES ('946651550468222977', '新增', '2', '8', null, null, '0', '2', '1', 'sys:param:add', null, '0', '1', '1', '2017-12-29 15:58:12', '1', '2017-12-29 23:34:44');
INSERT INTO `sys_menu` VALUES ('946651788901822466', '修改', '2', '8', null, null, '0', '3', '1', 'sys:param:update,sys:param:read', null, '0', '1', '1', '2017-12-29 15:59:09', '1', '2017-12-30 15:07:09');
INSERT INTO `sys_menu` VALUES ('946651900851990530', '删除', '2', '8', null, null, '0', '4', '1', 'sys:param:delete', null, '0', '1', '1', '2017-12-29 15:59:36', '1', '2017-12-29 23:34:48');
INSERT INTO `sys_menu` VALUES ('946748446155739137', '查看', '2', '2', null, null, '0', '1', '1', 'sys:user:read,sys:role:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2017-12-30 23:25:49');
INSERT INTO `sys_menu` VALUES ('946758013140967425', '查看', '2', '3', null, null, '0', '1', '1', 'sys:dept:read', null, '0', '1', '1', '2017-12-29 23:01:15', '1', '2017-12-30 23:24:45');
INSERT INTO `sys_menu` VALUES ('946758083039043585', '查看', '2', '4', null, null, '0', '1', '1', 'sys:menu:read', null, '0', '1', '1', '2017-12-29 23:01:32', '1', '2017-12-29 23:35:15');
INSERT INTO `sys_menu` VALUES ('946758190165762049', '查看', '2', '5', null, null, '0', '1', '1', 'sys:role:read', null, '0', '1', '1', '2017-12-29 23:01:57', '1', '2017-12-29 23:35:13');
INSERT INTO `sys_menu` VALUES ('946758477211344898', '查看', '2', '7', null, null, '0', null, '1', 'sys:dic:read', null, '1', '1', '1', '2017-12-29 23:03:06', '1', '2017-12-29 23:07:17');
INSERT INTO `sys_menu` VALUES ('946758541132537857', '查看', '2', '8', null, null, '0', '1', '1', 'sys:param:read', null, '0', '1', '1', '2017-12-29 23:03:21', '1', '2017-12-29 23:35:09');
INSERT INTO `sys_menu` VALUES ('946758603266957313', '查看', '2', '9', null, null, '0', null, '1', 'sys:log:read', null, '1', '1', '1', '2017-12-29 23:03:36', '1', '2017-12-29 23:07:01');
INSERT INTO `sys_menu` VALUES ('1038283192852840449', '客户管理', '1', '1042659061347561474', 'icon-yonghuguanli', 'page/customer/developcustomer/developCustomerList.html', '0', '1', '1', 'customer:developcustomer:read,customer:developcustomer:edit', null, '0', '1', '1', '2018-09-08 12:29:38', '1', '2018-11-10 11:06:46');
INSERT INTO `sys_menu` VALUES ('1042243569684242433', '任务管理', '1', '1', 'icon-yonghuguanli', 'page/sys/job/sysScheduleJobList.html', '0', '1', '1', 'ump:job:edit,ump:job:read,ump:jobLog:edit,ump:jobLog:read', null, '0', '1', '1', '2018-09-19 10:46:46', '1', '2018-09-29 23:54:22');
INSERT INTO `sys_menu` VALUES ('1042659061347561474', '测试', '0', '0', 'icon-xitongguanli', '', '0', '2', '1', '', null, '0', '1', '1', '2018-09-20 14:17:47', '1', '2018-09-20 14:20:47');
INSERT INTO `sys_menu` VALUES ('1042659385772781570', '测试菜单', '1', '1042659061347561474', '', 'page/sys/menu/menuList2.html', '0', null, '1', '', null, '1', '1', '1', '2018-09-20 14:19:04', '1', '2018-09-20 17:38:33');
INSERT INTO `sys_menu` VALUES ('1042721299416731649', '编辑', '2', '1038283192852840449', '', '', '0', null, '1', 'customer:developcustomer:edit', null, '0', '1', '1', '2018-09-20 18:25:05', '1', '2018-09-20 18:25:05');
INSERT INTO `sys_menu` VALUES ('1042721453079252993', '查看', '2', '1038283192852840449', '', '', '0', null, '1', 'customer:developcustomer:read', null, '0', '1', '1', '2018-09-20 18:25:42', '1', '2018-09-20 18:25:42');

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数编号',
  `param_type` varchar(50) DEFAULT '' COMMENT '参数类型',
  `param_key` varchar(50) NOT NULL COMMENT '参数键名',
  `param_value` varchar(100) NOT NULL COMMENT '参数键值',
  `param_value_extend` varchar(1000) DEFAULT '' COMMENT '参数扩展键值',
  `param_url` varchar(2000) DEFAULT '' COMMENT '参数附件url,逗号分隔',
  `remark_` varchar(100) DEFAULT '' COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=1060741308406484995 DEFAULT CHARSET=utf8 COMMENT='全局参数表';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES ('1058239961133129729', 'app_update', 'self', '11', '', 'https://aihuishou-1251883742.cos.ap-shanghai.myqcloud.com/param/app_update/20181109170653garbage_recycle_10.apk', '自助机APP最新版V4', '1', '0', '1', '2018-11-02 14:10:43', '1060739952140537858', '2018-11-09 17:06:57');
INSERT INTO `sys_param` VALUES ('1059678593735860225', 'app_update', 'hsy', '101', '', 'https://aihuishou-1251883742.cos.ap-shanghai.myqcloud.com/huishouyuan-1.0.1.apk', '回收员APP最新V1.0.1', '1', '0', '1', '2018-11-06 13:27:19', '1060739952140537858', '2018-11-09 11:53:49');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_type` int(1) NOT NULL DEFAULT '1' COMMENT '角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=1060739864781574147 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '1', '1', '0', null, '1', '2016-06-20 09:16:56', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role` VALUES ('1042721077013762050', '普通用户1', '1', '1', '0', '普通用户', '1', '2018-09-20 18:24:12', '1', '2018-09-20 18:25:56');
INSERT INTO `sys_role` VALUES ('1060739864781574146', '测试组', '1', '1', '0', '', '1', '2018-11-09 11:44:26', '1', '2018-11-09 11:44:26');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_role_menu_key1` (`role_id`,`menu_id`,`permission_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060739864911597573 DEFAULT CHARSET=utf8 COMMENT='角色授权表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1039764988869668866', '1039764988773199873', '1', null, '1', '0', null, '1', '2018-09-12 14:37:45', '1', '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES ('1039764988890640386', '1039764988773199873', '1038283192852840449', null, '1', '0', null, '1', '2018-09-12 14:37:45', '1', '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES ('1039764988890640387', '1039764988773199873', '2', null, '1', '0', null, '1', '2018-09-12 14:37:45', '1', '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES ('1039764988890640388', '1039764988773199873', '946748446155739137', null, '1', '0', null, '1', '2018-09-12 14:37:45', '1', '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES ('1039764988890640389', '1039764988773199873', '18', null, '1', '0', null, '1', '2018-09-12 14:37:45', '1', '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES ('1039764988928389121', '1039764988773199873', '19', null, '1', '0', null, '1', '2018-09-12 14:37:45', '1', '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES ('1039764988936777730', '1039764988773199873', '21', null, '1', '0', null, '1', '2018-09-12 14:37:45', '1', '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES ('1042244092483264513', '1', '1', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092491653121', '1', '1042243569684242433', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092500041730', '1', '2', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092512624642', '1', '946748446155739137', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092521013250', '1', '18', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092521013251', '1', '19', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092529401858', '1', '21', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092537790466', '1', '3', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092546179073', '1', '946758013140967425', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092546179074', '1', '945570894350995458', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092554567682', '1', '945570988546674689', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092562956289', '1', '945571061959577601', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092571344897', '1', '4', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092575539201', '1', '946758083039043585', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092588122113', '1', '945571423827349506', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092596510722', '1', '945571487333306370', null, '1', '0', null, '1', '2018-09-19 10:48:50', '1', '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES ('1042244092604899329', '1', '945571554194706434', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092604899330', '1', '5', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092613287937', '1', '946758190165762049', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092621676545', '1', '945569164808769538', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092625870850', '1', '945569292122673153', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092625870851', '1', '945569401908580354', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092634259458', '1', '7', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092642648066', '1', '8', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092655230978', '1', '946758541132537857', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092663619586', '1', '9', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042244092672008193', '1', '22', null, '1', '0', null, '1', '2018-09-19 10:48:51', '1', '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES ('1042721511531073537', '1042721077013762050', '1042659061347561474', null, '1', '0', null, '1', '2018-09-20 18:25:54', '1', '2018-09-20 18:25:54');
INSERT INTO `sys_role_menu` VALUES ('1042721511539462146', '1042721077013762050', '1038283192852840449', null, '1', '0', null, '1', '2018-09-20 18:25:54', '1', '2018-09-20 18:25:54');
INSERT INTO `sys_role_menu` VALUES ('1042721511560433666', '1042721077013762050', '1042721453079252993', null, '1', '0', null, '1', '2018-09-20 18:25:54', '1', '2018-09-20 18:25:54');
INSERT INTO `sys_role_menu` VALUES ('1042721511568822273', '1042721077013762050', '1042721299416731649', null, '1', '0', null, '1', '2018-09-20 18:25:54', '1', '2018-09-20 18:25:54');
INSERT INTO `sys_role_menu` VALUES ('1044769181661589505', '1044769181514788866', '1', null, '1', '0', null, '1', '2018-09-26 10:02:38', '1', '2018-09-26 10:02:38');
INSERT INTO `sys_role_menu` VALUES ('1044769181678366721', '1044769181514788866', '1042243569684242433', null, '1', '0', null, '1', '2018-09-26 10:02:38', '1', '2018-09-26 10:02:38');
INSERT INTO `sys_role_menu` VALUES ('1044769181686755329', '1044769181514788866', '2', null, '1', '0', null, '1', '2018-09-26 10:02:38', '1', '2018-09-26 10:02:38');
INSERT INTO `sys_role_menu` VALUES ('1044769181695143938', '1044769181514788866', '946748446155739137', null, '1', '0', null, '1', '2018-09-26 10:02:38', '1', '2018-09-26 10:02:38');
INSERT INTO `sys_role_menu` VALUES ('1044769181703532546', '1044769181514788866', '18', null, '1', '0', null, '1', '2018-09-26 10:02:38', '1', '2018-09-26 10:02:38');
INSERT INTO `sys_role_menu` VALUES ('1044769181711921154', '1044769181514788866', '19', null, '1', '0', null, '1', '2018-09-26 10:02:38', '1', '2018-09-26 10:02:38');
INSERT INTO `sys_role_menu` VALUES ('1044769181724504066', '1044769181514788866', '21', null, '1', '0', null, '1', '2018-09-26 10:02:38', '1', '2018-09-26 10:02:38');
INSERT INTO `sys_role_menu` VALUES ('1060739864848683009', '1060739864781574146', '1', null, '1', '0', null, '1', '2018-11-09 11:44:26', '1', '2018-11-09 11:44:26');
INSERT INTO `sys_role_menu` VALUES ('1060739864848683010', '1060739864781574146', '8', null, '1', '0', null, '1', '2018-11-09 11:44:26', '1', '2018-11-09 11:44:26');
INSERT INTO `sys_role_menu` VALUES ('1060739864848683011', '1060739864781574146', '946758541132537857', null, '1', '0', null, '1', '2018-11-09 11:44:26', '1', '2018-11-09 11:44:26');
INSERT INTO `sys_role_menu` VALUES ('1060739864911597570', '1060739864781574146', '946651550468222977', null, '1', '0', null, '1', '2018-11-09 11:44:26', '1', '2018-11-09 11:44:26');
INSERT INTO `sys_role_menu` VALUES ('1060739864911597571', '1060739864781574146', '946651788901822466', null, '1', '0', null, '1', '2018-11-09 11:44:26', '1', '2018-11-09 11:44:26');
INSERT INTO `sys_role_menu` VALUES ('1060739864911597572', '1060739864781574146', '946651900851990530', null, '1', '0', null, '1', '2018-11-09 11:44:26', '1', '2018-11-09 11:44:26');

-- ----------------------------
-- Table structure for sys_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_job`;
CREATE TABLE `sys_schedule_job` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL DEFAULT '' COMMENT '任务名称\r\n',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=1042246200989245443 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of sys_schedule_job
-- ----------------------------
INSERT INTO `sys_schedule_job` VALUES ('1042246200989245442', '测试任务', 'testTask', 'test', '1232', '0/5 * * * * ? ', '1', '0', '1', null, '1', '2018-09-19 10:57:13', '1', '2018-09-21 13:21:42');

-- ----------------------------
-- Table structure for sys_schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_job_log`;
CREATE TABLE `sys_schedule_job_log` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1046270758608773122 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of sys_schedule_job_log
-- ----------------------------
INSERT INTO `sys_schedule_job_log` VALUES ('1046042409990283265', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1002', '0', '1', null, null, '2018-09-29 22:21:59', null, '2018-09-29 22:22:00');
INSERT INTO `sys_schedule_job_log` VALUES ('1046269610212532226', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1002', '0', '1', null, null, '2018-09-30 13:24:47', null, '2018-09-30 13:24:56');
INSERT INTO `sys_schedule_job_log` VALUES ('1046269624963899393', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1002', '0', '1', null, null, '2018-09-30 13:24:51', null, '2018-09-30 13:25:00');
INSERT INTO `sys_schedule_job_log` VALUES ('1046269645394354178', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1002', '0', '1', null, null, '2018-09-30 13:24:56', null, '2018-09-30 13:25:05');
INSERT INTO `sys_schedule_job_log` VALUES ('1046270678594035713', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1000', '0', '1', null, null, '2018-09-30 13:29:02', null, '2018-09-30 13:29:11');
INSERT INTO `sys_schedule_job_log` VALUES ('1046270700970647553', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1001', '0', '1', null, null, '2018-09-30 13:29:07', null, '2018-09-30 13:29:16');
INSERT INTO `sys_schedule_job_log` VALUES ('1046270716309217281', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1001', '0', '1', null, null, '2018-09-30 13:29:11', null, '2018-09-30 13:29:20');
INSERT INTO `sys_schedule_job_log` VALUES ('1046270736932610049', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1002', '0', '1', null, null, '2018-09-30 13:29:16', null, '2018-09-30 13:29:25');
INSERT INTO `sys_schedule_job_log` VALUES ('1046270758608773121', '1042246200989245442', 'testTask', 'test', '1232', '0', null, '1001', '0', '1', null, null, '2018-09-30 13:29:21', null, '2018-09-30 13:29:30');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_` varchar(20) DEFAULT NULL COMMENT '登陆帐户',
  `password_` varchar(50) DEFAULT NULL COMMENT '密码',
  `user_type` varchar(2) DEFAULT '1' COMMENT '用户类型(1普通用户2管理员3系统用户)',
  `user_name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `name_pinyin` varchar(64) DEFAULT NULL COMMENT '姓名拼音',
  `sex_` int(1) NOT NULL DEFAULT '0' COMMENT '性别(0:未知;1:男;2:女)',
  `avatar_` varchar(500) DEFAULT NULL COMMENT '头像',
  `phone_` varchar(50) DEFAULT NULL COMMENT '电话',
  `email_` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `wei_xin` varchar(32) DEFAULT NULL COMMENT '微信',
  `wei_bo` varchar(32) DEFAULT NULL COMMENT '微博',
  `qq_` varchar(32) DEFAULT NULL COMMENT 'QQ',
  `birth_day` date DEFAULT NULL COMMENT '出生日期',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门编号',
  `position_` varchar(64) DEFAULT NULL COMMENT '职位',
  `address_` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `staff_no` varchar(32) DEFAULT NULL COMMENT '工号',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) DEFAULT '1',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `account` (`account_`)
) ENGINE=InnoDB AUTO_INCREMENT=1060739952140537859 DEFAULT CHARSET=utf8 COMMENT='用户管理';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'YzlhZGMyNGYwNTk3NjA1NWQ4ZjdlZWI2NzlkNzIxZDk=', '3', '管理员', 'GUANLIYUAN', '0', 'http://118.190.43.148/group1/M00/00/00/dr4rlFjNBguAfJl7AAcOE67NTFk744.png', '', '', '', '', null, null, '0000-00-00', '1', '', null, null, '1', '1', '', '2016-05-06 10:06:52', '1', '2017-12-31 22:28:48', '1');
INSERT INTO `sys_user` VALUES ('1037520425622949889', 'wanghaoxi', 'YzlhZGMyNGYwNTk3NjA1NWQ4ZjdlZWI2NzlkNzIxZDk=', '1', '王浩锡', null, '1', null, '15801866071', 'ronaldo_wang@163.com', '430503198810181011', '', '', '', '2018-09-06', '1', '', null, null, '0', '1', null, '2018-09-06 09:58:40', '1', '2018-09-20 18:28:48', null);
INSERT INTO `sys_user` VALUES ('1039765487257841666', 'wang', 'MzIxMjlmMGMxZTg1YzJlYjNhNTFiMzYzOTIxMDE1MWI=', '1', '123', null, '1', null, '15801866071', 'ronaldo_wang@163.com', '430503198810181011', '123', null, null, '1988-10-18', '1', '123', null, null, '0', '1', null, '2018-09-12 14:39:45', '1', '2018-09-12 14:41:54', null);
INSERT INTO `sys_user` VALUES ('1044765143532478466', 'wanghaoxi1', 'YzlhZGMyNGYwNTk3NjA1NWQ4ZjdlZWI2NzlkNzIxZDk=', '1', '王浩锡', null, '1', null, '15801866071', 'ronaldo_wang@163.com', '430503198810181011', '', '', '', '2018-09-26', '1', '', null, null, '1', '1', null, '2018-09-26 09:46:35', '1', '2018-09-26 09:46:35', null);
INSERT INTO `sys_user` VALUES ('1044765318648864770', 'wanghaoxi2', 'YzlhZGMyNGYwNTk3NjA1NWQ4ZjdlZWI2NzlkNzIxZDk=', '1', '王浩锡', null, '1', null, '15801866071', 'ronaldo_wang@163.com', '430503198810181011', '', '', '', '2018-09-26', '1', '', null, null, '1', '1', null, '2018-09-26 09:47:17', '1', '2018-09-26 09:47:17', null);
INSERT INTO `sys_user` VALUES ('1044772879666192386', 'wanghaoxi5', 'YzlhZGMyNGYwNTk3NjA1NWQ4ZjdlZWI2NzlkNzIxZDk=', '1', '王浩锡', null, '1', null, '', '', '', '', '', '', null, null, '', null, null, '1', '1', null, '2018-09-26 10:17:20', '1', '2018-09-26 10:17:27', null);
INSERT INTO `sys_user` VALUES ('1060739952140537858', 'test', 'YzlhZGMyNGYwNTk3NjA1NWQ4ZjdlZWI2NzlkNzIxZDk=', '1', 'test', null, '1', null, '', '', '', '', '', '', null, null, '', null, null, '0', '1', null, '2018-11-09 11:44:47', '1', '2018-11-09 11:44:47', null);

-- ----------------------------
-- Table structure for sys_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(50) NOT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_user_menu_key1` (`user_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of sys_user_menu
-- ----------------------------
INSERT INTO `sys_user_menu` VALUES ('1', '1', '1', 'read', '1', '0', null, '0', '2017-08-28 16:24:01', '0', '2017-08-28 16:24:01');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_id_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1060739952207646723 DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '1', '1', null, '1', '2017-12-30 15:38:21', '1', '2018-09-08 13:39:38');
INSERT INTO `sys_user_role` VALUES ('1039765732314247170', '1039765487257841666', '1039764988773199873', '1', '0', null, '1', '2018-09-12 14:40:43', '1', '2018-09-12 14:40:43');
INSERT INTO `sys_user_role` VALUES ('1042722233580507138', '1037520425622949889', '1', '1', '0', null, '1', '2018-09-20 18:28:48', '1', '2018-09-20 18:28:48');
INSERT INTO `sys_user_role` VALUES ('1044765143708639234', '1044765143532478466', '1', '1', '1', null, '1', '2018-09-26 09:46:36', '1', '2018-09-26 09:47:27');
INSERT INTO `sys_user_role` VALUES ('1044765318745333762', '1044765318648864770', '1', '1', '1', null, '1', '2018-09-26 09:47:17', '1', '2018-09-26 09:47:30');
INSERT INTO `sys_user_role` VALUES ('1044772910485938178', '1044772879666192386', '1', '1', '1', null, '1', '2018-09-26 10:17:27', '1', '2018-11-09 11:43:55');
INSERT INTO `sys_user_role` VALUES ('1060739952207646722', '1060739952140537858', '1060739864781574146', '1', '0', null, '1', '2018-11-09 11:44:47', '1', '2018-11-09 11:44:47');

-- ----------------------------
-- Table structure for t_develop_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_develop_customer`;
CREATE TABLE `t_develop_customer` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `customer_no` varchar(32) NOT NULL DEFAULT '' COMMENT '客户编号',
  `sex` char(1) NOT NULL DEFAULT '' COMMENT '性别',
  `type` char(1) DEFAULT '' COMMENT '客户类型',
  `mobile_phone` varchar(15) DEFAULT '' COMMENT '手机',
  `summary` varchar(1000) DEFAULT '' COMMENT '概况',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `editable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1045201910815506434 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='待开发客户表';

-- ----------------------------
-- Records of t_develop_customer
-- ----------------------------
INSERT INTO `t_develop_customer` VALUES ('1045201910815506433', '谭先生2', '2', '1', '1', '2', '2', '2', '1', '0', '1', null, '1', '2018-09-27 14:42:09', '1', '2018-09-27 14:42:09');

-- ----------------------------
-- Table structure for t_develop_customer_0
-- ----------------------------
DROP TABLE IF EXISTS `t_develop_customer_0`;
CREATE TABLE `t_develop_customer_0` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `customer_no` varchar(32) NOT NULL DEFAULT '' COMMENT '客户编号',
  `sex` char(1) NOT NULL DEFAULT '' COMMENT '性别',
  `type` char(1) DEFAULT '' COMMENT '客户类型',
  `mobile_phone` varchar(15) DEFAULT '' COMMENT '手机',
  `summary` varchar(1000) DEFAULT '' COMMENT '概况',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `editable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1045201699867181059 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='待开发客户表';

-- ----------------------------
-- Records of t_develop_customer_0
-- ----------------------------
INSERT INTO `t_develop_customer_0` VALUES ('1045201699867181058', '谭先生', '1', '1', '1', '1', '1', '1', '1', '0', '1', null, '1', '2018-09-27 14:41:19', '1', '2018-09-27 14:41:25');

-- ----------------------------
-- Table structure for t_develop_customer_1
-- ----------------------------
DROP TABLE IF EXISTS `t_develop_customer_1`;
CREATE TABLE `t_develop_customer_1` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `customer_no` varchar(32) NOT NULL DEFAULT '' COMMENT '客户编号',
  `sex` char(1) NOT NULL DEFAULT '' COMMENT '性别',
  `type` char(1) DEFAULT '' COMMENT '客户类型',
  `mobile_phone` varchar(15) DEFAULT '' COMMENT '手机',
  `summary` varchar(1000) DEFAULT '' COMMENT '概况',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `editable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1045201910815506434 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='待开发客户表';

-- ----------------------------
-- Records of t_develop_customer_1
-- ----------------------------
INSERT INTO `t_develop_customer_1` VALUES ('1045201910815506433', '谭先生2', '2', '1', '1', '2', '2', '2', '1', '0', '1', null, '1', '2018-09-27 14:42:09', '1', '2018-09-27 14:42:09');
