/*
 Navicat Premium Data Transfer

 Source Server         : jww
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : 47.99.90.68:3306
 Source Schema         : jww

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 21/09/2018 11:26:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('AHSScheduler', 'TASK_1042246200989245442', 'DEFAULT', '0/5 * * * * ? ', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1042246200989245442', 'DEFAULT', '0/5 * * * * ? ', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
INSERT INTO `qrtz_fired_triggers` VALUES ('RenrenScheduler', 'DESKTOP-D3LUKQA15373354379901537335438164', 'TASK_1042246200989245442', 'DEFAULT', 'DESKTOP-D3LUKQA1537335437990', 1537336595056, 1537336595000, 5, 'EXECUTING', 'TASK_1042246200989245442', 'DEFAULT', '0', '0');
INSERT INTO `qrtz_fired_triggers` VALUES ('RenrenScheduler', 'DESKTOP-D3LUKQA15373354379901537335438165', 'TASK_1042246200989245442', 'DEFAULT', 'DESKTOP-D3LUKQA1537335437990', 1537336595197, 1537336600000, 5, 'ACQUIRED', NULL, NULL, '0', '0');

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('AHSScheduler', 'TASK_1042246200989245442', 'DEFAULT', NULL, 'com.jww.quartz.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400EA7B226265616E4E616D65223A22746573745461736B222C226372656174654279223A312C2263726561746554696D65223A22323031382D30392D31392031303A35373A3133222C2263726F6E45787072657373696F6E223A22302F35202A202A202A202A203F20222C226964223A313034323234363230303938393234353434322C22697344656C223A302C226D6574686F644E616D65223A2274657374222C22706172616D73223A22313233222C22737461747573223A302C227570646174654279223A312C2275706461746554696D65223A22323031382D30392D31392031313A30303A3238227D7800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1042246200989245442', 'DEFAULT', NULL, 'com.jww.quartz.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400FB7B226265616E4E616D65223A22636F6D2E6A77772E636F6D6D6F6E2E71756172747A2E7461736B2E546573745461736B222C226372656174654279223A312C2263726561746554696D65223A22323031382D30392D31392031303A35373A3132222C2263726F6E45787072657373696F6E223A22302F35202A202A202A202A203F20222C226964223A313034323234363230303938393234353434322C226D6574686F644E616D65223A2274657374222C22706172616D73223A22313233222C22737461747573223A302C227570646174654279223A312C2275706461746554696D65223A22323031382D30392D31392031303A35373A3132227D7800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('AHSScheduler', 'DESKTOP-D3LUKQA1537412682448', 1537431048047, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-D3LUKQA1537335437990', 1537336582400, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerFactoryBean', 'LAPTOP-L065DKAP1537285614612', 1537286115997, 20000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('AHSScheduler', 'TASK_1042246200989245442', 'DEFAULT', 'TASK_1042246200989245442', 'DEFAULT', NULL, 1537349625000, -1, 5, 'PAUSED', 'CRON', 1537349623000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597401047B226265616E4E616D65223A22746573745461736B222C226372656174654279223A312C2263726561746554696D65223A22323031382D30392D31392031303A35373A3133222C2263726F6E45787072657373696F6E223A22302F35202A202A202A202A203F20222C226964223A313034323234363230303938393234353434322C22697344656C223A302C226D6574686F644E616D65223A2274657374222C22706172616D73223A22313233222C22737461747573223A312C227461736B4E616D65223A22E6B58BE8AF95E4BBBBE58AA1222C227570646174654279223A312C2275706461746554696D65223A22323031382D30392D31392031373A34363A3338227D7800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1042246200989245442', 'DEFAULT', 'TASK_1042246200989245442', 'DEFAULT', NULL, 1537336600000, 1537336595000, 5, 'ACQUIRED', 'CRON', 1537325833000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597401047B226265616E4E616D65223A22746573745461736B222C226372656174654279223A312C2263726561746554696D65223A22323031382D30392D31392031303A35373A3133222C2263726F6E45787072657373696F6E223A22302F35202A202A202A202A203F20222C226964223A313034323234363230303938393234353434322C22697344656C223A302C226D6574686F644E616D65223A2274657374222C22706172616D73223A22313233222C22737461747573223A302C227461736B4E616D65223A22E6B58BE8AF95E4BBBBE58AA1222C227570646174654279223A312C2275706461746554696D65223A22323031382D30392D31392031313A30303A3238227D7800);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `unit_id` bigint(20) NOT NULL COMMENT '隶属单位',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门编号',
  `sort_no` int(3) NULL DEFAULT NULL COMMENT '排序号',
  `leaf_` int(1) NULL DEFAULT NULL COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable_` tinyint(1) NULL DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 947126071521034243 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 1, 'JWW', 0, 1, 0, 0, 1, 'qw', 1, '2016-06-28 18:04:06', 1, '2017-12-30 23:34:59');

-- ----------------------------
-- Table structure for sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_no` int(2) NULL DEFAULT NULL,
  `editable_` tinyint(1) NOT NULL DEFAULT 1,
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT 1,
  `remark_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `type__code_`(`type_`, `code_`, `is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 947147856354037763 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES (1, 'SEX', '0', '未知', NULL, NULL, 1, 0, 0, 0, '', 1, '2016-06-28 18:04:06', 1, '2018-09-20 21:17:44');
INSERT INTO `sys_dic` VALUES (2, 'SEX', '1', '男', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:12');
INSERT INTO `sys_dic` VALUES (3, 'SEX', '2', '女', NULL, NULL, 3, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2017-12-30 23:35:11');
INSERT INTO `sys_dic` VALUES (4, 'LOCKED', '0', '激活', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:11');
INSERT INTO `sys_dic` VALUES (5, 'LOCKED', '1', '锁定', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:10');
INSERT INTO `sys_dic` VALUES (6, 'ROLETYPE', '1', '业务角色', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES (7, 'ROLETYPE', '2', '管理角色', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES (8, 'ROLETYPE', '3', '系统内置角色', NULL, NULL, 3, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:08');
INSERT INTO `sys_dic` VALUES (9, 'LEAF', '0', '树枝节点', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2017-12-27 15:24:38');
INSERT INTO `sys_dic` VALUES (10, 'LEAF', '1', '叶子节点', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:07');
INSERT INTO `sys_dic` VALUES (11, 'EDITABLE', '0', '只读', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES (12, 'EDITABLE', '1', '可编辑', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES (13, 'ENABLE', '0', '禁用', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:05');
INSERT INTO `sys_dic` VALUES (14, 'ENABLE', '1', '启用', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:04');
INSERT INTO `sys_dic` VALUES (15, 'AUTHORIZELEVEL', '1', '访问权限', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES (16, 'AUTHORIZELEVEL', '2', '管理权限', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:02');
INSERT INTO `sys_dic` VALUES (17, 'MENUTYPE', '1', '系统菜单', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES (18, 'MENUTYPE', '2', '业务菜单', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES (19, 'USERTYPE', '1', '经办员', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:50');
INSERT INTO `sys_dic` VALUES (20, 'USERTYPE', '2', '管理员', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:48');
INSERT INTO `sys_dic` VALUES (21, 'USERTYPE', '3', '系统内置用户', NULL, NULL, 3, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES (22, 'EXPAND', '0', '收缩', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES (23, 'EXPAND', '1', '展开', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:46');
INSERT INTO `sys_dic` VALUES (24, 'CRUD', 'add', '新增', NULL, NULL, 1, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:56');
INSERT INTO `sys_dic` VALUES (25, 'CRUD', 'read', '查询', NULL, NULL, 2, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:58');
INSERT INTO `sys_dic` VALUES (26, 'CRUD', 'update', '修改', NULL, NULL, 3, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES (27, 'CRUD', 'delete', '删除', NULL, NULL, 4, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES (28, 'CRUD', 'open', '打开', NULL, NULL, 5, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:00');
INSERT INTO `sys_dic` VALUES (29, 'CRUD', 'close', '关闭', NULL, NULL, 6, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES (30, 'CRUD', 'run', '执行', NULL, NULL, 7, 0, 0, 1, NULL, 1, '2016-06-28 18:04:06', 1, '2016-06-28 18:04:01');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `operation_type` tinyint(1) NULL DEFAULT NULL COMMENT '操作类型',
  `method_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params_` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `result_` tinyint(1) NULL DEFAULT NULL COMMENT '操作结果',
  `time_` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `remark_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT 1,
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1042948464867459075 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1037519578092486658, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"537c0c96-e384-4708-a6f2-b578bca3b1b0\",\"captchaValue\":\"CEQI\",\"password\":\"****\"}]', 1, 1449, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-06 09:55:18', 0, '2018-09-06 09:55:18');
INSERT INTO `sys_log` VALUES (1037520426407284737, '管理员', '用户新增', 1, 'com.jww.ump.server.controller.SysUserController.add', '[{\"account\":\"wanghaoxi\",\"birthDay\":\"2018-09-06\",\"deptId\":\"1\",\"deptName\":\"JWW\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"\",\"qq\":\"\",\"role\":[],\"sex\":1,\"userName\":\"王浩锡\",\"weiBo\":\"\",\"weiXin\":\"\"}]', 1, 5944, '127.0.0.1', NULL, 1, 0, 0, '2018-09-06 09:58:40', 0, '2018-09-06 09:58:40');
INSERT INTO `sys_log` VALUES (1037530732206477313, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"80e62b89-45b4-4954-a7fc-ef89a85fe666\",\"captchaValue\":\"mi71\",\"password\":\"****\"}]', 1, 172, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-06 10:39:37', 0, '2018-09-06 10:39:37');
INSERT INTO `sys_log` VALUES (1037580033641086977, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"126b8aca-ba61-4894-97d7-3abc24fff46f\",\"captchaValue\":\"j3h2\",\"password\":\"****\"}]', 1, 912, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-06 13:55:32', 0, '2018-09-06 13:55:32');
INSERT INTO `sys_log` VALUES (1037644672974385154, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"8e3ce27f-b71f-464c-ba49-c9080ef2f773\",\"captchaValue\":\"UP9X\",\"password\":\"****\"}]', 1, 1137, '127.0.0.1', NULL, 1, 0, 0, '2018-09-06 18:12:23', 0, '2018-09-06 18:12:23');
INSERT INTO `sys_log` VALUES (1038282833191272450, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"711ef41a-c932-4169-b36d-8f1387a44d4a\",\"captchaValue\":\"PTW4\",\"password\":\"****\"}]', 1, 986, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-08 12:28:12', 0, '2018-09-08 12:28:12');
INSERT INTO `sys_log` VALUES (1038283193372934145, '管理员', '菜单新增', 1, 'com.jww.ump.server.controller.SysMenuController.add', '[{\"iconcls\":\"\",\"leaf\":1,\"menuName\":\"客户管理\",\"menuType\":1,\"parentId\":\"1\",\"parentName\":\"系统管理\",\"permission\":\"\",\"request\":\"page/customer/DevelopCustomerList.html\"}]', 1, 210, '127.0.0.1', NULL, 1, 0, 0, '2018-09-08 12:29:38', 0, '2018-09-08 12:29:38');
INSERT INTO `sys_log` VALUES (1038283239057293314, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 111, '127.0.0.1', NULL, 1, 0, 0, '2018-09-08 12:29:49', 0, '2018-09-08 12:29:49');
INSERT INTO `sys_log` VALUES (1038283310796668930, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"f60ab4d1-0bd2-4b78-a53e-ac66be7b6b10\",\"captchaValue\":\"52ZV\",\"password\":\"****\"}]', 1, 52, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-08 12:30:06', 0, '2018-09-08 12:30:06');
INSERT INTO `sys_log` VALUES (1038283579601223681, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"iconcls\":\"icon-yonghuguanli\",\"id\":\"1038283192852840449\",\"leaf\":1,\"menuName\":\"客户管理\",\"menuType\":1,\"parentId\":\"1\",\"parentName\":\"系统管理\",\"permission\":\"\",\"request\":\"page/customer/DevelopCustomerList.html\"}]', 1, 168, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-08 12:31:10', 0, '2018-09-08 12:31:10');
INSERT INTO `sys_log` VALUES (1038283605203255298, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 102, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-08 12:31:17', 0, '2018-09-08 12:31:17');
INSERT INTO `sys_log` VALUES (1038283664477159426, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"c85c096d-73d2-4354-ab4d-d5bc2983bfab\",\"captchaValue\":\"in3c\",\"password\":\"****\"}]', 1, 46, '127.0.0.1', NULL, 1, 0, 0, '2018-09-08 12:31:31', 0, '2018-09-08 12:31:31');
INSERT INTO `sys_log` VALUES (1038300810674470914, '管理员', '用户批量删除', 3, 'com.jww.ump.server.controller.SysUserController.delBatchByIds', '[[1]]', 1, 162, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-08 13:39:39', 0, '2018-09-08 13:39:39');
INSERT INTO `sys_log` VALUES (1038313667382247426, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"3f46df7f-8d04-483b-a8e2-77669b2dd847\",\"captchaValue\":\"K85M\",\"password\":\"****\"}]', 1, 83, '127.0.0.1', NULL, 1, 0, 0, '2018-09-08 14:30:44', 0, '2018-09-08 14:30:44');
INSERT INTO `sys_log` VALUES (1039763081690279937, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"eaaf631b-f5d7-40af-9e96-64e71bb45728\",\"captchaValue\":\"SD6N\",\"password\":\"****\"}]', 1, 1418, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 14:30:11', 0, '2018-09-12 14:30:11');
INSERT INTO `sys_log` VALUES (1039763518883557378, '管理员', '参数新增', 1, 'com.jww.ump.server.controller.SysParamController.add', '[{\"enable\":1,\"paramKey\":\"123\",\"paramValue\":\"123\",\"remark\":\"123\"}]', 1, 120, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:31:55', 0, '2018-09-12 14:31:55');
INSERT INTO `sys_log` VALUES (1039764670538772482, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"95dd7152-aa7d-4196-834f-f2a1e5e3723a\",\"captchaValue\":\"9GMC\",\"password\":\"****\"}]', 1, 159, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 14:36:30', 0, '2018-09-12 14:36:30');
INSERT INTO `sys_log` VALUES (1039764989716918273, '管理员', '角色新增', 1, 'com.jww.ump.server.controller.SysRoleController.add', '[{\"deptId\":\"1\",\"menuIdList\":[1,1038283192852840449,2,946748446155739137,18,19,21],\"remark\":\"123123\",\"roleName\":\"普通用户\"}]', 1, 250, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:37:46', 0, '2018-09-12 14:37:46');
INSERT INTO `sys_log` VALUES (1039765087079297025, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 97, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:38:09', 0, '2018-09-12 14:38:09');
INSERT INTO `sys_log` VALUES (1039765186077454338, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"ff96086b-f2a7-4e85-89ca-91edfef4e52b\",\"captchaValue\":\"e0mk\",\"password\":\"****\"}]', 1, 58, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 14:38:33', 0, '2018-09-12 14:38:33');
INSERT INTO `sys_log` VALUES (1039765241203191809, '管理员', '角色批量删除', 3, 'com.jww.ump.server.controller.SysRoleController.delBatchByIds', '[[1039764988773199873]]', 1, 92, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:38:46', 0, '2018-09-12 14:38:46');
INSERT INTO `sys_log` VALUES (1039765487874404353, '管理员', '用户新增', 1, 'com.jww.ump.server.controller.SysUserController.add', '[{\"account\":\"123213\",\"birthDay\":\"1988-10-18\",\"deptName\":\"\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"123\",\"qq\":\"\",\"role\":[],\"sex\":1,\"userName\":\"123\",\"weiBo\":\"\",\"weiXin\":\"123\"}]', 1, 204, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:39:45', 0, '2018-09-12 14:39:45');
INSERT INTO `sys_log` VALUES (1039765576315498498, '管理员', '用户修改', 2, 'com.jww.ump.server.controller.SysUserController.modify', '[{\"account\":\"123213\",\"birthDay\":\"1988-10-18\",\"deptName\":\"\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"id\":\"1039765487257841666\",\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"123\",\"qq\":\"\",\"role\":[],\"sex\":1,\"userName\":\"123\",\"weiBo\":\"\",\"weiXin\":\"123\"}]', 1, 217, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:40:06', 0, '2018-09-12 14:40:06');
INSERT INTO `sys_log` VALUES (1039765659194945537, '管理员', '用户修改', 2, 'com.jww.ump.server.controller.SysUserController.modify', '[{\"account\":\"123213\",\"birthDay\":\"1988-10-18\",\"deptId\":\"1\",\"deptName\":\"JWW\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"id\":\"1039765487257841666\",\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"123\",\"qq\":\"\",\"role\":[\"1039764988773199873\"],\"sex\":1,\"userName\":\"123\",\"weiBo\":\"\",\"weiXin\":\"123\"}]', 1, 151, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:40:26', 0, '2018-09-12 14:40:26');
INSERT INTO `sys_log` VALUES (1039765732893061121, '管理员', '用户修改', 2, 'com.jww.ump.server.controller.SysUserController.modify', '[{\"account\":\"wang\",\"birthDay\":\"1988-10-18\",\"deptId\":\"1\",\"deptName\":\"JWW\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"id\":\"1039765487257841666\",\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"123\",\"qq\":\"\",\"role\":[\"1039764988773199873\"],\"sex\":1,\"userName\":\"123\",\"weiBo\":\"\",\"weiXin\":\"123\"}]', 1, 158, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 14:40:43', 0, '2018-09-12 14:40:43');
INSERT INTO `sys_log` VALUES (1039765868331331586, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 95, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:41:16', 0, '2018-09-12 14:41:16');
INSERT INTO `sys_log` VALUES (1039765910156931074, '123', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"wang\",\"captchaId\":\"7051ea58-4e8d-4f07-ab41-2453bc7853ec\",\"captchaValue\":\"ttj6\",\"password\":\"****\"}]', 1, 44, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:41:26', 0, '2018-09-12 14:41:26');
INSERT INTO `sys_log` VALUES (1039766029493268482, '123', '修改密码', 2, 'com.jww.ump.server.controller.SysUserController.modifyPassword', '[{\"oldPassword\":\"****\",\"password\":\"****\"}]', 1, 43, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 14:41:54', 0, '2018-09-12 14:41:54');
INSERT INTO `sys_log` VALUES (1039766045494538242, '123', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 93, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 14:41:58', 0, '2018-09-12 14:41:58');
INSERT INTO `sys_log` VALUES (1039766131880423426, '123', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"wang\",\"captchaId\":\"564cf887-0bd7-49bb-a372-a4561c53c879\",\"captchaValue\":\"69gd\",\"password\":\"****\"}]', 1, 38, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 14:42:18', 0, '2018-09-12 14:42:18');
INSERT INTO `sys_log` VALUES (1039766331151806465, '123', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 90, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 14:43:06', 0, '2018-09-12 14:43:06');
INSERT INTO `sys_log` VALUES (1039766406225653761, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"bd9cd4dd-8e71-479d-a642-b147606a9e03\",\"captchaValue\":\"m0un\",\"password\":\"****\"}]', 1, 43, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 14:43:24', 0, '2018-09-12 14:43:24');
INSERT INTO `sys_log` VALUES (1039777374439608322, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"443ff48b-ef55-4ec9-8dc4-27ecce698099\",\"captchaValue\":\"p3e7\",\"password\":\"****\"}]', 1, 1224, '127.0.0.1', NULL, 1, 0, 0, '2018-09-12 15:26:59', 0, '2018-09-12 15:26:59');
INSERT INTO `sys_log` VALUES (1039814679212724226, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"0fba8d39-dccf-4512-a171-868fbdbf2d4b\",\"captchaValue\":\"1IU5\",\"password\":\"****\"}]', 1, 201, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-12 17:55:13', 0, '2018-09-12 17:55:13');
INSERT INTO `sys_log` VALUES (1040215799790374914, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"a53f7227-ca07-4fe2-81f5-90bf54b09dfc\",\"captchaValue\":\"06XW\",\"password\":\"****\"}]', 1, 1091, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-13 20:29:07', 0, '2018-09-13 20:29:07');
INSERT INTO `sys_log` VALUES (1040226848606326786, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"4739240a-919a-4d2e-9528-779462ced90a\",\"captchaValue\":\"6z3k\",\"password\":\"****\"}]', 1, 108, '127.0.0.1', NULL, 1, 0, 0, '2018-09-13 21:13:02', 0, '2018-09-13 21:13:02');
INSERT INTO `sys_log` VALUES (1040447187499593730, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"dfffcd02-445e-4bd1-b3e2-8bf8312c14c4\",\"captchaValue\":\"8Y6Y\",\"password\":\"****\"}]', 1, 1151, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-14 11:48:34', 0, '2018-09-14 11:48:34');
INSERT INTO `sys_log` VALUES (1040459804930715649, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"d76fda7a-522a-4624-9f64-79455b1b0c50\",\"captchaValue\":\"hwqe\",\"password\":\"****\"}]', 1, 172, '127.0.0.1', NULL, 1, 0, 0, '2018-09-14 12:38:43', 0, '2018-09-14 12:38:43');
INSERT INTO `sys_log` VALUES (1040469113106288642, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"2060c3e0-0be6-481d-bf7d-3b820da51ed6\",\"captchaValue\":\"8IV8\",\"password\":\"****\"}]', 1, 868, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-14 13:15:42', 0, '2018-09-14 13:15:42');
INSERT INTO `sys_log` VALUES (1040521084488040449, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"00433381-3e26-4b1b-9677-40ccbd46a963\",\"captchaValue\":\"d79c\",\"password\":\"****\"}]', 1, 923, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-14 16:42:13', 0, '2018-09-14 16:42:13');
INSERT INTO `sys_log` VALUES (1040862416881176578, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"71ecd910-470c-448c-a1d8-ad716d3f3599\",\"captchaValue\":\"GX90\",\"password\":\"****\"}]', 1, 4382, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-15 15:18:31', 0, '2018-09-15 15:18:31');
INSERT INTO `sys_log` VALUES (1040923563659374593, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"27c3d49d-326c-4e0e-90b1-1adf3bec2b97\",\"captchaValue\":\"z7kx\",\"password\":\"****\"}]', 1, 1072, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-15 19:21:31', 0, '2018-09-15 19:21:31');
INSERT INTO `sys_log` VALUES (1040944379113631746, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"ac43ff47-eafa-45aa-8bf5-49020b984174\",\"captchaValue\":\"7G74\",\"password\":\"****\"}]', 1, 101, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-15 20:44:14', 0, '2018-09-15 20:44:14');
INSERT INTO `sys_log` VALUES (1040968587558383618, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"0146e92c-ee59-41a8-9c53-63772b0ae9fb\",\"captchaValue\":\"67dq\",\"password\":\"****\"}]', 1, 60, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-15 22:20:26', 0, '2018-09-15 22:20:26');
INSERT INTO `sys_log` VALUES (1040968608353742849, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 106, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-15 22:20:31', 0, '2018-09-15 22:20:31');
INSERT INTO `sys_log` VALUES (1040972611300945921, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"c636a959-d47c-4001-9e84-df769d1f37cc\",\"captchaValue\":\"hn45\",\"password\":\"****\"}]', 1, 2276, '127.0.0.1', NULL, 1, 0, 0, '2018-09-15 22:36:25', 0, '2018-09-15 22:36:25');
INSERT INTO `sys_log` VALUES (1041003736668917761, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"ffdefc51-9d38-4854-803e-7b0b4f1448fc\",\"captchaValue\":\"9hur\",\"password\":\"****\"}]', 1, 1247, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-16 00:40:06', 0, '2018-09-16 00:40:06');
INSERT INTO `sys_log` VALUES (1041003933008482305, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"iconcls\":\"icon-yonghuguanli\",\"id\":\"1038283192852840449\",\"leaf\":1,\"menuName\":\"客户管理\",\"menuType\":1,\"parentId\":\"1\",\"parentName\":\"系统管理\",\"permission\":\"customer:developcustomer:read,customer:developcustomer:edit\",\"request\":\"page/customer/DevelopCustomerList.html\"}]', 0, 183, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-16 00:40:53', 0, '2018-09-16 00:40:53');
INSERT INTO `sys_log` VALUES (1041004073094041602, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"iconcls\":\"icon-yonghuguanli\",\"id\":\"1038283192852840449\",\"leaf\":1,\"menuName\":\"客户管理\",\"menuType\":1,\"parentId\":\"1\",\"parentName\":\"系统管理\",\"permission\":\"customer:developcustomer:read,customer:developcustomer:edit\",\"request\":\"page/customer/DevelopCustomerList.html\"}]', 1, 133, '127.0.0.1', NULL, 1, 0, 0, '2018-09-16 00:41:27', 0, '2018-09-16 00:41:27');
INSERT INTO `sys_log` VALUES (1041004121550835714, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 118, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-16 00:41:38', 0, '2018-09-16 00:41:38');
INSERT INTO `sys_log` VALUES (1041004163187691522, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"c77428ab-8f73-4e62-bafe-9d8778f816b9\",\"captchaValue\":\"FV7C\",\"password\":\"****\"}]', 1, 50, '127.0.0.1', NULL, 1, 0, 0, '2018-09-16 00:41:48', 0, '2018-09-16 00:41:48');
INSERT INTO `sys_log` VALUES (1041127405059657729, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"f1225843-6782-43a0-a5e9-25894ba30ef1\",\"captchaValue\":\"SI7M\",\"password\":\"****\"}]', 1, 174, '127.0.0.1', NULL, 1, 0, 0, '2018-09-16 08:51:31', 0, '2018-09-16 08:51:31');
INSERT INTO `sys_log` VALUES (1041203921655255041, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"3ead5e07-0908-4149-ab38-f2bb7607570a\",\"captchaValue\":\"71mn\",\"password\":\"****\"}]', 1, 159, '127.0.0.1', NULL, 1, 0, 0, '2018-09-16 13:55:34', 0, '2018-09-16 13:55:34');
INSERT INTO `sys_log` VALUES (1041224368136474626, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"2d0e66ec-5b2b-41b2-bd35-d3d365d2a78b\",\"captchaValue\":\"tqek\",\"password\":\"****\"}]', 1, 1060, '127.0.0.1', NULL, 1, 0, 0, '2018-09-16 15:16:48', 0, '2018-09-16 15:16:48');
INSERT INTO `sys_log` VALUES (1041225242703384577, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 837, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-16 15:20:17', 0, '2018-09-16 15:20:17');
INSERT INTO `sys_log` VALUES (1041225462686240770, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"bc8a3646-9c73-4d63-a8cd-17b2f6691f8d\",\"captchaValue\":\"zpz9\",\"password\":\"****\"}]', 1, 43430, '127.0.0.1', NULL, 1, 0, 0, '2018-09-16 15:21:10', 0, '2018-09-16 15:21:10');
INSERT INTO `sys_log` VALUES (1041226029462540290, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 760, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-16 15:23:25', 0, '2018-09-16 15:23:25');
INSERT INTO `sys_log` VALUES (1041226121003225089, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"2e8081ba-88ca-4b4e-a1c0-3578d0f8dbfa\",\"captchaValue\":\"cn5m\",\"password\":\"****\"}]', 1, 9762, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-16 15:23:47', 0, '2018-09-16 15:23:47');
INSERT INTO `sys_log` VALUES (1041226335663509506, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 802, '127.0.0.1', NULL, 1, 0, 0, '2018-09-16 15:24:38', 0, '2018-09-16 15:24:38');
INSERT INTO `sys_log` VALUES (1041226727822544898, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"7261d053-4682-49f6-95f7-dcc9bb0358a0\",\"captchaValue\":\"pcz2\",\"password\":\"****\"}]', 1, 87873, '127.0.0.1', NULL, 1, 0, 0, '2018-09-16 15:26:11', 0, '2018-09-16 15:26:11');
INSERT INTO `sys_log` VALUES (1041227207483150338, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"541426ec-883c-4d39-b804-876bdbb76e9a\",\"captchaValue\":\"hhjd\",\"password\":\"****\"}]', 1, 322, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-16 15:28:06', 0, '2018-09-16 15:28:06');
INSERT INTO `sys_log` VALUES (1041324137307455489, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"963ac381-33b5-4b8d-aa44-b7fed619d64a\",\"captchaValue\":\"11qy\",\"password\":\"****\"}]', 1, 1164, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-16 21:53:15', 0, '2018-09-16 21:53:15');
INSERT INTO `sys_log` VALUES (1041620933644070914, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"f62ff523-ab94-43d8-be2b-ecef4fe9285c\",\"captchaValue\":\"AJ1V\",\"password\":\"****\"}]', 1, 4229, '127.0.0.1', NULL, 1, 0, 0, '2018-09-17 17:32:37', 0, '2018-09-17 17:32:37');
INSERT INTO `sys_log` VALUES (1041677575891464194, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"0d01abeb-e64b-45df-b89e-a359ee58430e\",\"captchaValue\":\"MN7I\",\"password\":\"****\"}]', 1, 1168, '127.0.0.1', NULL, 1, 0, 0, '2018-09-17 21:17:41', 0, '2018-09-17 21:17:41');
INSERT INTO `sys_log` VALUES (1041677970483195905, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 144, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-17 21:19:16', 0, '2018-09-17 21:19:16');
INSERT INTO `sys_log` VALUES (1041678045431214081, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"0f309de3-56e2-4aa5-a3a6-89e01a0004fa\",\"captchaValue\":\"HGDM\",\"password\":\"****\"}]', 1, 58, '127.0.0.1', NULL, 1, 0, 0, '2018-09-17 21:19:34', 0, '2018-09-17 21:19:34');
INSERT INTO `sys_log` VALUES (1041875120415977473, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"2d33ae47-82d7-494a-87b4-ff369c055132\",\"captchaValue\":\"DW61\",\"password\":\"****\"}]', 1, 1160, '127.0.0.1', NULL, 1, 0, 0, '2018-09-18 10:22:40', 0, '2018-09-18 10:22:40');
INSERT INTO `sys_log` VALUES (1041886584870760450, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"5a9e779a-b749-45a7-8f5d-69f6f8c4ad57\",\"captchaValue\":\"TVWF\",\"password\":\"****\"}]', 1, 934, '127.0.0.1', NULL, 1, 0, 0, '2018-09-18 11:08:14', 0, '2018-09-18 11:08:14');
INSERT INTO `sys_log` VALUES (1041920240398008321, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"06f5ca72-3309-458f-ab47-232fc99a4c70\",\"captchaValue\":\"8hj6\",\"password\":\"****\"}]', 1, 173, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-18 13:21:57', 0, '2018-09-18 13:21:57');
INSERT INTO `sys_log` VALUES (1041920277333049346, '管理员', '参数修改', 2, 'com.jww.ump.server.controller.SysParamController.modify', '[{\"enable\":0,\"id\":\"1039763518355075073\"}]', 1, 151, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-18 13:22:07', 0, '2018-09-18 13:22:07');
INSERT INTO `sys_log` VALUES (1041920285172203522, '管理员', '参数修改', 2, 'com.jww.ump.server.controller.SysParamController.modify', '[{\"enable\":1,\"id\":\"1039763518355075073\"}]', 1, 29, '127.0.0.1', NULL, 1, 0, 0, '2018-09-18 13:22:09', 0, '2018-09-18 13:22:09');
INSERT INTO `sys_log` VALUES (1041920834143682562, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 110, '127.0.0.1', NULL, 1, 0, 0, '2018-09-18 13:24:19', 0, '2018-09-18 13:24:19');
INSERT INTO `sys_log` VALUES (1041920850656657409, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"74cdde70-4837-4e6c-8a62-eb6226211718\",\"captchaValue\":\"IUDO\",\"password\":\"****\"}]', 1, 41, '127.0.0.1', NULL, 1, 0, 0, '2018-09-18 13:24:23', 0, '2018-09-18 13:24:23');
INSERT INTO `sys_log` VALUES (1041943100541833218, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"c65aa6f9-b6c4-43e5-a8a7-42cfb225466f\",\"captchaValue\":\"j5ro\",\"password\":\"****\"}]', 1, 5530, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-18 14:52:46', 0, '2018-09-18 14:52:46');
INSERT INTO `sys_log` VALUES (1042243228553109506, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"1cfd19fe-d599-4a10-8817-fbd8df1699c4\",\"captchaValue\":\"czhv\",\"password\":\"****\"}]', 1, 202, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:45:24', 0, '2018-09-19 10:45:24');
INSERT INTO `sys_log` VALUES (1042243570195947522, '管理员', '菜单新增', 1, 'com.jww.ump.server.controller.SysMenuController.add', '[{\"iconcls\":\"\",\"leaf\":1,\"menuName\":\"任务管理\",\"menuType\":1,\"parentId\":\"1\",\"parentName\":\"系统管理\",\"permission\":\"ump:job:edit,ump:job:read\",\"request\":\"/page/sysScheduleJobList.html\"}]', 1, 231, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 10:46:46', 0, '2018-09-19 10:46:46');
INSERT INTO `sys_log` VALUES (1042243685094711297, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 102, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:47:13', 0, '2018-09-19 10:47:13');
INSERT INTO `sys_log` VALUES (1042243737657729026, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"abbe170d-f681-4ea9-9b04-8dbb71d1ca30\",\"captchaValue\":\"9U48\",\"password\":\"****\"}]', 1, 212, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:47:26', 0, '2018-09-19 10:47:26');
INSERT INTO `sys_log` VALUES (1042243871372140546, '管理员', '角色修改', 2, 'com.jww.ump.server.controller.SysRoleController.modify', '[{\"deptId\":\"1\",\"id\":\"1\",\"menuIdList\":[1,1042243569684242433,2,946748446155739137,18,19,21,3,946758013140967425,945570894350995458,945570988546674689,945571061959577601,4,946758083039043585,945571423827349506,945571487333306370,945571554194706434,5,946758190165762049,945569164808769538,945569292122673153,945569401908580354,7,8,946758541132537857,9,22],\"remark\":\"\",\"roleName\":\"管理员\"}]', 1, 578, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:47:58', 0, '2018-09-19 10:47:58');
INSERT INTO `sys_log` VALUES (1042243892658233346, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 380, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:48:03', 0, '2018-09-19 10:48:03');
INSERT INTO `sys_log` VALUES (1042243908097466370, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"8e1c168c-38a7-484d-96c9-ce765d6a0c84\",\"captchaValue\":\"91nq\",\"password\":\"****\"}]', 1, 71, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:48:06', 0, '2018-09-19 10:48:06');
INSERT INTO `sys_log` VALUES (1042244099592609793, '管理员', '角色修改', 2, 'com.jww.ump.server.controller.SysRoleController.modify', '[{\"deptId\":\"1\",\"id\":\"1\",\"menuIdList\":[1,1042243569684242433,2,946748446155739137,18,19,21,3,946758013140967425,945570894350995458,945570988546674689,945571061959577601,4,946758083039043585,945571423827349506,945571487333306370,945571554194706434,5,946758190165762049,945569164808769538,945569292122673153,945569401908580354,7,8,946758541132537857,9,22],\"remark\":\"\",\"roleName\":\"管理员\"}]', 1, 1832, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:48:52', 0, '2018-09-19 10:48:52');
INSERT INTO `sys_log` VALUES (1042244127975464962, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 529, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:48:59', 0, '2018-09-19 10:48:59');
INSERT INTO `sys_log` VALUES (1042244165589983234, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"9dbbfc1d-7b39-4fb2-934e-1c362bc2ee1b\",\"captchaValue\":\"ZUIZ\",\"password\":\"****\"}]', 1, 144, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:49:08', 0, '2018-09-19 10:49:08');
INSERT INTO `sys_log` VALUES (1042244549180055554, '管理员', '用户修改', 2, 'com.jww.ump.server.controller.SysUserController.modify', '[{\"account\":\"wanghaoxi\",\"birthDay\":\"2018-09-06\",\"deptId\":\"1\",\"deptName\":\"JWW\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"id\":\"1037520425622949889\",\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"\",\"qq\":\"\",\"role\":[\"1\"],\"sex\":1,\"userName\":\"王浩锡\",\"weiBo\":\"\",\"weiXin\":\"\"}]', 1, 1596, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 10:50:39', 0, '2018-09-19 10:50:39');
INSERT INTO `sys_log` VALUES (1042244638741028866, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 781, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:51:00', 0, '2018-09-19 10:51:00');
INSERT INTO `sys_log` VALUES (1042244659427336194, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"dbce52e0-93da-408d-b95b-5dbf72d42b74\",\"captchaValue\":\"emay\",\"password\":\"****\"}]', 1, 199, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:51:05', 0, '2018-09-19 10:51:05');
INSERT INTO `sys_log` VALUES (1042244751743967233, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"iconcls\":\"icon-yonghuguanli\",\"id\":\"1042243569684242433\",\"leaf\":1,\"parentId\":\"1\"}]', 1, 554, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 10:51:27', 0, '2018-09-19 10:51:27');
INSERT INTO `sys_log` VALUES (1042244796207783938, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"id\":\"1038283192852840449\",\"leaf\":1,\"parentId\":\"1\",\"sortNo\":1}]', 1, 322, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 10:51:38', 0, '2018-09-19 10:51:38');
INSERT INTO `sys_log` VALUES (1042244809029771266, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"id\":\"1042243569684242433\",\"leaf\":1,\"parentId\":\"1\",\"sortNo\":1}]', 1, 210, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 10:51:41', 0, '2018-09-19 10:51:41');
INSERT INTO `sys_log` VALUES (1042244959005499393, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"iconcls\":\"icon-yonghuguanli\",\"id\":\"1042243569684242433\",\"leaf\":1,\"menuName\":\"任务管理\",\"menuType\":1,\"parentId\":\"1\",\"parentName\":\"系统管理\",\"permission\":\"ump:job:edit,ump:job:read\",\"request\":\"page/job/sysScheduleJobList.html\",\"sortNo\":1}]', 1, 146, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 10:52:17', 0, '2018-09-19 10:52:17');
INSERT INTO `sys_log` VALUES (1042244978353823746, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 99, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 10:52:21', 0, '2018-09-19 10:52:21');
INSERT INTO `sys_log` VALUES (1042244997018476545, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"27aebd65-81c4-438f-b9be-a32b9c83ec26\",\"captchaValue\":\"ED83\",\"password\":\"****\"}]', 1, 37, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 10:52:26', 0, '2018-09-19 10:52:26');
INSERT INTO `sys_log` VALUES (1042246203669405697, '管理员', '定时任务新增', 1, 'com.jww.ump.server.controller.SysScheduleJobController.add', '[{\"beanName\":\"com.jww.common.quartz.task.TestTask\",\"cronExpression\":\"0/5 * * * * ? \",\"methodName\":\"test\",\"params\":\"123\",\"status\":0}]', 1, 605, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 10:57:14', 0, '2018-09-19 10:57:14');
INSERT INTO `sys_log` VALUES (1042247019558006785, '管理员', '定时任务修改', 2, 'com.jww.ump.server.controller.SysScheduleJobController.modify', '[{\"beanName\":\"testTask\",\"cronExpression\":\"0/5 * * * * ? \",\"id\":\"1042246200989245442\",\"methodName\":\"test\",\"params\":\"123\",\"status\":0}]', 1, 192, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 11:00:28', 0, '2018-09-19 11:00:28');
INSERT INTO `sys_log` VALUES (1042287688880128002, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"6c908a31-3d15-41a2-84bc-f3473daeda46\",\"captchaValue\":\"5pgv\",\"password\":\"****\"}]', 1, 360, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 13:42:04', 0, '2018-09-19 13:42:04');
INSERT INTO `sys_log` VALUES (1042349140227784706, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"7ff6cebf-4a59-4391-bc25-3d20adc4cf96\",\"captchaValue\":\"P4EI\",\"password\":\"****\"}]', 1, 1004, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 17:46:15', 0, '2018-09-19 17:46:15');
INSERT INTO `sys_log` VALUES (1042349236239597570, '管理员', '定时任务修改', 2, 'com.jww.ump.server.controller.SysScheduleJobController.modify', '[{\"beanName\":\"testTask\",\"cronExpression\":\"0/5 * * * * ? \",\"id\":\"1042246200989245442\",\"methodName\":\"test\",\"params\":\"123\",\"status\":0}]', 1, 254, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 17:46:38', 0, '2018-09-19 17:46:38');
INSERT INTO `sys_log` VALUES (1042350120533106690, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 147, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 17:50:09', 0, '2018-09-19 17:50:09');
INSERT INTO `sys_log` VALUES (1042356723470770178, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 1, 14941, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 18:16:23', 0, '2018-09-19 18:16:23');
INSERT INTO `sys_log` VALUES (1042356723470770179, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 1, 690, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 18:16:23', 0, '2018-09-19 18:16:23');
INSERT INTO `sys_log` VALUES (1042356920548532226, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 1, 17294, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 18:17:11', 0, '2018-09-19 18:17:11');
INSERT INTO `sys_log` VALUES (1042357374070235137, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 1, 4023, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 18:18:59', 0, '2018-09-19 18:18:59');
INSERT INTO `sys_log` VALUES (1042357545407553537, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 1, 29, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 18:19:40', 0, '2018-09-19 18:19:40');
INSERT INTO `sys_log` VALUES (1042357718565199874, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 1, 14361, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 18:20:21', 0, '2018-09-19 18:20:21');
INSERT INTO `sys_log` VALUES (1042357982944763906, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 1, 4011, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 18:21:24', 0, '2018-09-19 18:21:24');
INSERT INTO `sys_log` VALUES (1042358508046454786, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 0, 4135, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 18:23:29', 0, '2018-09-19 18:23:29');
INSERT INTO `sys_log` VALUES (1042358654708682753, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 0, 25914, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 18:24:04', 0, '2018-09-19 18:24:04');
INSERT INTO `sys_log` VALUES (1042358697838710785, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 0, 122, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 18:24:14', 0, '2018-09-19 18:24:14');
INSERT INTO `sys_log` VALUES (1042358864172224513, '管理员', '待开发客户表批量删除', 3, 'com.jww.customer.server.controller.DevelopCustomerController.delBatchByIds', '[[\"1040216216108601345\"]]', 0, 122, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 18:24:54', 0, '2018-09-19 18:24:54');
INSERT INTO `sys_log` VALUES (1042400605219340289, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"5c37d4a1-b0d1-41cb-9450-b933a171f8b9\",\"captchaValue\":\"c5ht\",\"password\":\"****\"}]', 1, 1137, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:10:45', 0, '2018-09-19 21:10:45');
INSERT INTO `sys_log` VALUES (1042400748240912386, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 164, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:11:20', 0, '2018-09-19 21:11:20');
INSERT INTO `sys_log` VALUES (1042401168732471297, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 141, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:13:00', 0, '2018-09-19 21:13:00');
INSERT INTO `sys_log` VALUES (1042401291147427842, '管理员', '定时任务恢复', 2, 'com.jww.ump.server.controller.SysScheduleJobController.resume', '[[\"1042246200989245442\"]]', 1, 246, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:13:29', 0, '2018-09-19 21:13:29');
INSERT INTO `sys_log` VALUES (1042401353281847298, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 168, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:13:44', 0, '2018-09-19 21:13:44');
INSERT INTO `sys_log` VALUES (1042401388866322434, '管理员', '定时任务执行', 2, 'com.jww.ump.server.controller.SysScheduleJobController.run', '[[\"1042246200989245442\"]]', 1, 180, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:13:53', 0, '2018-09-19 21:13:53');
INSERT INTO `sys_log` VALUES (1042401449021030402, '管理员', '定时任务执行', 2, 'com.jww.ump.server.controller.SysScheduleJobController.run', '[[\"1042246200989245442\"]]', 1, 156, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:14:07', 0, '2018-09-19 21:14:07');
INSERT INTO `sys_log` VALUES (1042401774398357506, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 191, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:15:25', 0, '2018-09-19 21:15:25');
INSERT INTO `sys_log` VALUES (1042401995157159937, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 0, 29704, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:16:17', 0, '2018-09-19 21:16:17');
INSERT INTO `sys_log` VALUES (1042401996604194817, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 0, 30040, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:16:18', 0, '2018-09-19 21:16:18');
INSERT INTO `sys_log` VALUES (1042403876147314690, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 13292, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:23:46', 0, '2018-09-19 21:23:46');
INSERT INTO `sys_log` VALUES (1042403962310901761, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 2728, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:24:06', 0, '2018-09-19 21:24:06');
INSERT INTO `sys_log` VALUES (1042405077337272322, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 2345, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:28:32', 0, '2018-09-19 21:28:32');
INSERT INTO `sys_log` VALUES (1042405131871612930, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 1614, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:28:45', 0, '2018-09-19 21:28:45');
INSERT INTO `sys_log` VALUES (1042405205930438658, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 2938, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:29:03', 0, '2018-09-19 21:29:03');
INSERT INTO `sys_log` VALUES (1042405235026325505, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 161, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:29:10', 0, '2018-09-19 21:29:10');
INSERT INTO `sys_log` VALUES (1042406590365360129, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 188, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:34:32', 0, '2018-09-19 21:34:32');
INSERT INTO `sys_log` VALUES (1042406703208914946, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 9896, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:35:00', 0, '2018-09-19 21:35:00');
INSERT INTO `sys_log` VALUES (1042406931823648770, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 2981, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:35:54', 0, '2018-09-19 21:35:54');
INSERT INTO `sys_log` VALUES (1042407014254305281, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 292, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:36:14', 0, '2018-09-19 21:36:14');
INSERT INTO `sys_log` VALUES (1042407150091034626, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 168, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:36:46', 0, '2018-09-19 21:36:46');
INSERT INTO `sys_log` VALUES (1042407329909235714, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 6441, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:37:29', 0, '2018-09-19 21:37:29');
INSERT INTO `sys_log` VALUES (1042407341749755906, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 0, 9259, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:37:32', 0, '2018-09-19 21:37:32');
INSERT INTO `sys_log` VALUES (1042407348578082817, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 10871, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:37:34', 0, '2018-09-19 21:37:34');
INSERT INTO `sys_log` VALUES (1042407384212889601, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 2946, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:37:42', 0, '2018-09-19 21:37:42');
INSERT INTO `sys_log` VALUES (1042409443213471745, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 7125, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:45:52', 0, '2018-09-19 21:45:52');
INSERT INTO `sys_log` VALUES (1042409514902515713, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 7244, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:46:10', 0, '2018-09-19 21:46:10');
INSERT INTO `sys_log` VALUES (1042409671333277697, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 1907, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:46:47', 0, '2018-09-19 21:46:47');
INSERT INTO `sys_log` VALUES (1042409800748527618, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 19060, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:47:18', 0, '2018-09-19 21:47:18');
INSERT INTO `sys_log` VALUES (1042409843433959425, '管理员', '定时任务恢复', 2, 'com.jww.ump.server.controller.SysScheduleJobController.resume', '[[\"1042246200989245442\"]]', 1, 263, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-19 21:47:28', 0, '2018-09-19 21:47:28');
INSERT INTO `sys_log` VALUES (1042410069074931713, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 1893, '127.0.0.1', NULL, 1, 0, 0, '2018-09-19 21:48:22', 0, '2018-09-19 21:48:22');
INSERT INTO `sys_log` VALUES (1042602128984936450, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"e5e761de-3135-4a5f-b2cc-4d95016b51ec\",\"captchaValue\":\"78GR\",\"password\":\"****\"}]', 1, 1241, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 10:31:33', 0, '2018-09-20 10:31:33');
INSERT INTO `sys_log` VALUES (1042611170746740738, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 422, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 11:07:28', 0, '2018-09-20 11:07:28');
INSERT INTO `sys_log` VALUES (1042611264996945922, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"1140bcf2-ab02-40ef-9f7a-0e4994bc20c7\",\"captchaValue\":\"6P8D\",\"password\":\"****\"}]', 1, 310, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 11:07:51', 0, '2018-09-20 11:07:51');
INSERT INTO `sys_log` VALUES (1042612569257717762, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"72c31075-9cc6-4561-8104-10378d2b4061\",\"captchaValue\":\"9YKF\",\"password\":\"****\"}]', 1, 156, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 11:13:02', 0, '2018-09-20 11:13:02');
INSERT INTO `sys_log` VALUES (1042612753182142465, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 647, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 11:13:46', 0, '2018-09-20 11:13:46');
INSERT INTO `sys_log` VALUES (1042613874701283329, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"a2e13bcc-1d49-4465-b3e1-4a08d75ce90c\",\"captchaValue\":\"6n1t\",\"password\":\"****\"}]', 1, 275, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 11:18:13', 0, '2018-09-20 11:18:13');
INSERT INTO `sys_log` VALUES (1042618708892495874, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 530, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 11:37:25', 0, '2018-09-20 11:37:25');
INSERT INTO `sys_log` VALUES (1042618767302373378, '管理员', '定时任务暂停', 2, 'com.jww.ump.server.controller.SysScheduleJobController.pause', '[[\"1042246200989245442\"]]', 1, 743, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 11:37:40', 0, '2018-09-20 11:37:40');
INSERT INTO `sys_log` VALUES (1042651139179720705, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"5added58-770e-4f8b-89cb-b0ee18494fca\",\"captchaValue\":\"zfdd\",\"password\":\"****\"}]', 1, 481, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 13:46:17', 0, '2018-09-20 13:46:17');
INSERT INTO `sys_log` VALUES (1042659065445396481, '管理员', '菜单新增', 1, 'com.jww.ump.server.controller.SysMenuController.add', '[{\"iconcls\":\"\",\"leaf\":1,\"menuName\":\"测试\",\"menuType\":0,\"parentId\":\"0\",\"parentName\":\"\",\"permission\":\"\",\"request\":\"\",\"sortNo\":2}]', 1, 1106, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 14:17:47', 0, '2018-09-20 14:17:47');
INSERT INTO `sys_log` VALUES (1042659089646530561, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 568, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 14:17:53', 0, '2018-09-20 14:17:53');
INSERT INTO `sys_log` VALUES (1042659146034753538, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"e051daf6-0cab-4e80-a1e3-7f4811e3e56c\",\"captchaValue\":\"ey09\",\"password\":\"****\"}]', 1, 127, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 14:18:07', 0, '2018-09-20 14:18:07');
INSERT INTO `sys_log` VALUES (1042659386229960705, '管理员', '菜单新增', 1, 'com.jww.ump.server.controller.SysMenuController.add', '[{\"iconcls\":\"\",\"leaf\":1,\"menuName\":\"测试菜单\",\"menuType\":1,\"parentId\":\"1042659061347561474\",\"parentName\":\"测试\",\"permission\":\"\",\"request\":\"page/sys/menu/menuList2.html\"}]', 1, 167, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 14:19:04', 0, '2018-09-20 14:19:04');
INSERT INTO `sys_log` VALUES (1042659439938023426, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 339, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 14:19:17', 0, '2018-09-20 14:19:17');
INSERT INTO `sys_log` VALUES (1042659460506890242, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"99758a85-3878-4af9-a95f-a343b36b317d\",\"captchaValue\":\"9OOR\",\"password\":\"****\"}]', 1, 46, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 14:19:22', 0, '2018-09-20 14:19:22');
INSERT INTO `sys_log` VALUES (1042659638181801986, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"a3330c63-8013-484d-9558-6e7be97803a1\",\"captchaValue\":\"9y7z\",\"password\":\"****\"}]', 1, 51, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 14:20:04', 0, '2018-09-20 14:20:04');
INSERT INTO `sys_log` VALUES (1042659818373296130, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"iconcls\":\"icon-xitongguanli\",\"id\":\"1042659061347561474\",\"leaf\":1,\"menuName\":\"测试\",\"menuType\":0,\"parentId\":\"0\",\"parentName\":\"\",\"permission\":\"\",\"request\":\"\",\"sortNo\":2}]', 1, 167, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 14:20:47', 0, '2018-09-20 14:20:47');
INSERT INTO `sys_log` VALUES (1042659841647489025, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 102, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 14:20:53', 0, '2018-09-20 14:20:53');
INSERT INTO `sys_log` VALUES (1042659947000016898, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"77b9a077-2745-43ae-a91d-d4fac74d4655\",\"captchaValue\":\"i6bk\",\"password\":\"****\"}]', 1, 34, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 14:21:18', 0, '2018-09-20 14:21:18');
INSERT INTO `sys_log` VALUES (1042695868336513025, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"feb6c01c-b028-4364-9436-4bbf70ba7217\",\"captchaValue\":\"b8qz\",\"password\":\"****\"}]', 1, 211, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 16:44:02', 0, '2018-09-20 16:44:02');
INSERT INTO `sys_log` VALUES (1042696334399184898, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 523, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 16:45:53', 0, '2018-09-20 16:45:53');
INSERT INTO `sys_log` VALUES (1042696406390218753, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"be5e1c87-1ad8-47b5-983c-c9678e7d1d6d\",\"captchaValue\":\"QASZ\",\"password\":\"****\"}]', 1, 211, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 16:46:10', 0, '2018-09-20 16:46:10');
INSERT INTO `sys_log` VALUES (1042696572253970434, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 184, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 16:46:50', 0, '2018-09-20 16:46:50');
INSERT INTO `sys_log` VALUES (1042696665493348353, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"c36e650e-854b-4900-b1b4-edf194a201eb\",\"captchaValue\":\"2RZK\",\"password\":\"****\"}]', 1, 414, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 16:47:12', 0, '2018-09-20 16:47:12');
INSERT INTO `sys_log` VALUES (1042698624480735234, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"c5790ad0-b255-4f7d-aa77-349331985f8c\",\"captchaValue\":\"6yhy\",\"password\":\"****\"}]', 1, 212, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 16:54:59', 0, '2018-09-20 16:54:59');
INSERT INTO `sys_log` VALUES (1042708988463353857, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"id\":\"1042243569684242433\",\"leaf\":1,\"menuName\":\"任务管理1\",\"parentId\":\"1\"}]', 1, 194, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 17:36:10', 0, '2018-09-20 17:36:10');
INSERT INTO `sys_log` VALUES (1042709054771105793, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"id\":\"1042243569684242433\",\"leaf\":1,\"menuName\":\"任务管理\",\"parentId\":\"1\"}]', 1, 102, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 17:36:26', 0, '2018-09-20 17:36:26');
INSERT INTO `sys_log` VALUES (1042709082650644482, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"id\":\"1042243569684242433\",\"leaf\":1,\"menuName\":\"任务管理1\",\"parentId\":\"1\"}]', 1, 578, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 17:36:32', 0, '2018-09-20 17:36:32');
INSERT INTO `sys_log` VALUES (1042709116515454978, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"id\":\"1042243569684242433\",\"leaf\":1,\"menuName\":\"任务管理\",\"parentId\":\"1\"}]', 1, 1807, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 17:36:40', 0, '2018-09-20 17:36:40');
INSERT INTO `sys_log` VALUES (1042709551913570305, '管理员', '菜单修改', 2, 'com.jww.ump.server.controller.SysMenuController.modify', '[{\"iconcls\":\"icon-yonghuguanli\",\"id\":\"1038283192852840449\",\"leaf\":1,\"menuName\":\"客户管理\",\"menuType\":1,\"parentId\":\"1042659061347561474\",\"parentName\":\"测试\",\"permission\":\"customer:developcustomer:read,customer:developcustomer:edit\",\"request\":\"page/customer/developcustomer/developCustomerList.html\",\"sortNo\":1}]', 1, 607, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 17:38:24', 0, '2018-09-20 17:38:24');
INSERT INTO `sys_log` VALUES (1042709588219465730, '管理员', '菜单删除', 3, 'com.jww.ump.server.controller.SysMenuController.delete', '[\"1042659385772781570\"]', 1, 680, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 17:38:33', 0, '2018-09-20 17:38:33');
INSERT INTO `sys_log` VALUES (1042718562356547585, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 571, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:14:12', 0, '2018-09-20 18:14:12');
INSERT INTO `sys_log` VALUES (1042718621362016257, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"f79f1f6e-8cb8-45e2-a6bc-10d6996bc2a1\",\"captchaValue\":\"x11u\",\"password\":\"****\"}]', 1, 249, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 18:14:27', 0, '2018-09-20 18:14:27');
INSERT INTO `sys_log` VALUES (1042721082541854722, '管理员', '角色新增', 1, 'com.jww.ump.server.controller.SysRoleController.add', '[{\"deptId\":\"1\",\"menuIdList\":[1042659061347561474,1038283192852840449],\"remark\":\"普通用户\",\"roleName\":\"普通用户\"}]', 1, 1484, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 18:24:13', 0, '2018-09-20 18:24:13');
INSERT INTO `sys_log` VALUES (1042721301467746305, '管理员', '菜单新增', 1, 'com.jww.ump.server.controller.SysMenuController.add', '[{\"iconcls\":\"\",\"leaf\":1,\"menuName\":\"编辑\",\"menuType\":2,\"parentId\":\"1038283192852840449\",\"parentName\":\"客户管理\",\"permission\":\"customer:developcustomer:edit\",\"request\":\"\"}]', 1, 731, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 18:25:06', 0, '2018-09-20 18:25:06');
INSERT INTO `sys_log` VALUES (1042721454618562562, '管理员', '菜单新增', 1, 'com.jww.ump.server.controller.SysMenuController.add', '[{\"iconcls\":\"\",\"leaf\":1,\"menuName\":\"查看\",\"menuType\":2,\"parentId\":\"1038283192852840449\",\"parentName\":\"客户管理\",\"permission\":\"customer:developcustomer:read\",\"request\":\"\"}]', 1, 482, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:25:42', 0, '2018-09-20 18:25:42');
INSERT INTO `sys_log` VALUES (1042721514739716098, '管理员', '角色修改', 2, 'com.jww.ump.server.controller.SysRoleController.modify', '[{\"deptId\":\"1\",\"id\":\"1042721077013762050\",\"menuIdList\":[1042659061347561474,1038283192852840449,1042721453079252993,1042721299416731649],\"remark\":\"普通用户\",\"roleName\":\"普通用户\"}]', 1, 1036, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:25:57', 0, '2018-09-20 18:25:57');
INSERT INTO `sys_log` VALUES (1042721672810450946, '管理员', '用户修改', 2, 'com.jww.ump.server.controller.SysUserController.modify', '[{\"account\":\"wanghaoxi\",\"birthDay\":\"2018-09-06\",\"deptId\":\"1\",\"deptName\":\"JWW\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"id\":\"1037520425622949889\",\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"\",\"qq\":\"\",\"role\":[\"1039764988773199873\",\"1042721077013762050\"],\"sex\":1,\"userName\":\"王浩锡\",\"weiBo\":\"\",\"weiXin\":\"\"}]', 1, 1058, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:26:34', 0, '2018-09-20 18:26:34');
INSERT INTO `sys_log` VALUES (1042721747364204546, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 763, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:26:52', 0, '2018-09-20 18:26:52');
INSERT INTO `sys_log` VALUES (1042721842155474945, '王浩锡', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"wanghaoxi\",\"captchaId\":\"edcd6fc1-499b-4c90-b86f-df8e2aa5c70c\",\"captchaValue\":\"Y6VV\",\"password\":\"****\"}]', 1, 105, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:27:15', 0, '2018-09-20 18:27:15');
INSERT INTO `sys_log` VALUES (1042721913534140418, '王浩锡', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 399, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:27:32', 0, '2018-09-20 18:27:32');
INSERT INTO `sys_log` VALUES (1042721939236835329, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"ba34080b-fa39-48f7-86ce-0f44f2220505\",\"captchaValue\":\"vg8g\",\"password\":\"****\"}]', 1, 212, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:27:38', 0, '2018-09-20 18:27:38');
INSERT INTO `sys_log` VALUES (1042722164244467714, '管理员', '用户修改', 2, 'com.jww.ump.server.controller.SysUserController.modify', '[{\"account\":\"wanghaoxi\",\"birthDay\":\"2018-09-06\",\"deptId\":\"1\",\"deptName\":\"JWW\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"id\":\"1037520425622949889\",\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"\",\"qq\":\"\",\"role\":[\"1039764988773199873\"],\"sex\":1,\"userName\":\"王浩锡\",\"weiBo\":\"\",\"weiXin\":\"\"}]', 1, 859, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 18:28:31', 0, '2018-09-20 18:28:31');
INSERT INTO `sys_log` VALUES (1042722236441022466, '管理员', '用户修改', 2, 'com.jww.ump.server.controller.SysUserController.modify', '[{\"account\":\"wanghaoxi\",\"birthDay\":\"2018-09-06\",\"deptId\":\"1\",\"deptName\":\"JWW\",\"email\":\"ronaldo_wang@163.com\",\"enable\":1,\"id\":\"1037520425622949889\",\"idCard\":\"430503198810181011\",\"phone\":\"15801866071\",\"position\":\"\",\"qq\":\"\",\"role\":[\"1\"],\"sex\":1,\"userName\":\"王浩锡\",\"weiBo\":\"\",\"weiXin\":\"\"}]', 1, 710, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 18:28:49', 0, '2018-09-20 18:28:49');
INSERT INTO `sys_log` VALUES (1042754056105254914, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"6d0ec585-8b0a-4e3a-a396-86b1b3ef3a34\",\"captchaValue\":\"2yxk\",\"password\":\"****\"}]', 1, 1271, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 20:35:15', 0, '2018-09-20 20:35:15');
INSERT INTO `sys_log` VALUES (1042754755463503874, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 204, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 20:38:02', 0, '2018-09-20 20:38:02');
INSERT INTO `sys_log` VALUES (1042754802099970050, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"1b8a376f-88b8-40e1-93a0-fa32fac01bc1\",\"captchaValue\":\"C3GQ\",\"password\":\"****\"}]', 1, 80, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 20:38:13', 0, '2018-09-20 20:38:13');
INSERT INTO `sys_log` VALUES (1042755032576974850, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 207, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 20:39:08', 0, '2018-09-20 20:39:08');
INSERT INTO `sys_log` VALUES (1042755151951060994, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"477dbf8c-0ef0-4f78-82e8-1a43fa903241\",\"captchaValue\":\"6YXR\",\"password\":\"****\"}]', 1, 115, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 20:39:36', 0, '2018-09-20 20:39:36');
INSERT INTO `sys_log` VALUES (1042762616419672065, '管理员', '字典修改', 2, 'com.jww.ump.server.controller.SysDicController.modify', '[{\"code\":\"0\",\"codeText\":\"未知\",\"enable\":0,\"id\":\"1\",\"remark\":\"\",\"sortNo\":1,\"type\":\"SEX\"}]', 1, 124, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 21:09:16', 0, '2018-09-20 21:09:16');
INSERT INTO `sys_log` VALUES (1042763721228705793, '管理员', '用户登出', 4, 'com.jww.ump.server.controller.LoginController.logout', '[]', 1, 125, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 21:13:39', 0, '2018-09-20 21:13:39');
INSERT INTO `sys_log` VALUES (1042763756108537858, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"7909cf6f-3b99-435c-bb48-112c49b2c09c\",\"captchaValue\":\"h9uo\",\"password\":\"****\"}]', 1, 52, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 21:13:48', 0, '2018-09-20 21:13:48');
INSERT INTO `sys_log` VALUES (1042764550031564802, '管理员', '字典修改', 2, 'com.jww.ump.server.controller.SysDicController.modify', '[{\"code\":\"0\",\"codeText\":\"未知\",\"enable\":1,\"id\":\"1\",\"remark\":\"\",\"sortNo\":1,\"type\":\"SEX\"}]', 1, 43, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 21:16:57', 0, '2018-09-20 21:16:57');
INSERT INTO `sys_log` VALUES (1042764745943310337, '管理员', '字典修改', 2, 'com.jww.ump.server.controller.SysDicController.modify', '[{\"code\":\"0\",\"codeText\":\"未知\",\"enable\":0,\"id\":\"1\",\"remark\":\"\",\"sortNo\":1,\"type\":\"SEX\"}]', 1, 36, '127.0.0.1', NULL, 1, 0, 0, '2018-09-20 21:17:44', 0, '2018-09-20 21:17:44');
INSERT INTO `sys_log` VALUES (1042778346632536065, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"79e2fcdf-4c71-4540-b259-e187cc775730\",\"captchaValue\":\"09mo\",\"password\":\"****\"}]', 1, 62, '0:0:0:0:0:0:0:1', NULL, 1, 0, 0, '2018-09-20 22:11:44', 0, '2018-09-20 22:11:44');
INSERT INTO `sys_log` VALUES (1042948464867459074, '管理员', '用户登录', 4, 'com.jww.ump.server.controller.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"e570fd60-1ce1-4b29-a8bd-c2231411a66c\",\"captchaValue\":\"nxo1\",\"password\":\"****\"}]', 1, 1303, '127.0.0.1', NULL, 1, 0, 0, '2018-09-21 09:27:45', 0, '2018-09-21 09:27:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menu_type` smallint(2) NULL DEFAULT 2 COMMENT '菜单类型(0：目录1：菜单2：按钮)',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级菜单编号',
  `iconcls_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点图标CSS类名',
  `request_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `expand_` tinyint(1) NOT NULL DEFAULT 0 COMMENT '展开状态(1:展开;0:收缩)',
  `sort_no` int(2) NULL DEFAULT NULL COMMENT '排序号',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `permission_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `remark_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable_` tinyint(1) NULL DEFAULT 1,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1042721453079252994 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 0, 'icon-xitongguanli', '#', 1, 1, 1, '', NULL, 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-30 23:35:04');
INSERT INTO `sys_menu` VALUES (2, '用户管理', 1, 1, 'icon-yonghuguanli', 'page/sys/user/userList.html', 0, 1, 1, '', NULL, 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-30 23:33:43');
INSERT INTO `sys_menu` VALUES (3, '部门管理', 1, 1, 'icon-bumenguanli', 'page/sys/dept/deptList.html', 0, 2, 1, '', NULL, 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-28 22:41:08');
INSERT INTO `sys_menu` VALUES (4, '菜单管理', 1, 1, 'icon-caidanguanli', 'page/sys/menu/menuList.html', 0, 3, 1, '', NULL, 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-28 22:41:28');
INSERT INTO `sys_menu` VALUES (5, '角色管理', 1, 1, 'icon-jiaoseguanli', 'page/sys/role/roleList.html', 0, 4, 1, '', NULL, 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-29 15:51:49');
INSERT INTO `sys_menu` VALUES (7, '字典管理', 1, 1, 'icon-ccgl-shujuzidian-1', 'page/sys/dic/dicList.html', 0, 7, 1, 'sys:dic', NULL, 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-29 23:10:16');
INSERT INTO `sys_menu` VALUES (8, '参数管理', 1, 1, 'icon-xitongcanshuguanli', 'page/sys/param/paramList.html', 0, 8, 1, '', '', 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-28 22:42:19');
INSERT INTO `sys_menu` VALUES (9, '日志管理', 1, 1, 'icon-ccgl-shujuzidian-1', 'page/sys/log/logList.html', 0, 9, 1, 'sys:log:read', '', 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-29 23:07:05');
INSERT INTO `sys_menu` VALUES (18, '新增', 2, 2, NULL, NULL, 0, 2, 1, 'sys:user:add,sys:role:read,sys:user:read', NULL, 0, 1, 1, '2017-12-19 11:22:58', 1, '2017-12-30 14:46:41');
INSERT INTO `sys_menu` VALUES (19, '修改', 2, 2, NULL, NULL, 0, 3, 1, 'sys:user:update,sys:role:read,sys:user:read', NULL, 0, 1, 1, '2017-12-19 12:35:36', 1, '2017-12-30 15:14:57');
INSERT INTO `sys_menu` VALUES (21, '删除', 2, 2, NULL, NULL, 0, 4, 1, 'sys:user:delete', NULL, 0, 1, 1, '2017-12-19 12:37:20', 1, '2017-12-19 12:37:23');
INSERT INTO `sys_menu` VALUES (22, '应用监控', 1, 1, 'icon-jiaoseguanli', 'druid/webapp.html', 0, 12, 1, 'sys:sql:read', NULL, 0, 1, 1, '2016-06-20 09:16:56', 1, '2017-12-28 22:44:36');
INSERT INTO `sys_menu` VALUES (945569164808769538, '新增', 2, 5, NULL, NULL, 0, 2, 1, 'sys:role:add,sys:menu:read', NULL, 0, 1, 1, '2017-12-26 16:17:11', 1, '2017-12-29 15:49:48');
INSERT INTO `sys_menu` VALUES (945569292122673153, '修改', 2, 5, NULL, NULL, 0, 3, 1, 'sys:role:update,sys:role:read,sys:menu:read', NULL, 0, 1, 1, '2017-12-26 16:17:42', 1, '2017-12-29 15:49:57');
INSERT INTO `sys_menu` VALUES (945569401908580354, '删除', 2, 5, NULL, NULL, 0, 4, 1, 'sys:role:delete', NULL, 0, 1, 1, '2017-12-26 16:18:08', 1, '2017-12-26 16:20:08');
INSERT INTO `sys_menu` VALUES (945570894350995458, '新增', 2, 3, NULL, NULL, 0, 2, 1, 'sys:dept:add', NULL, 0, 1, 1, '2017-12-26 16:24:04', 1, '2017-12-26 16:24:53');
INSERT INTO `sys_menu` VALUES (945570988546674689, '修改', 2, 3, NULL, NULL, 0, 3, 1, 'sys:dept:update,sys:dept:read', NULL, 0, 1, 1, '2017-12-26 16:24:26', 1, '2017-12-26 16:24:54');
INSERT INTO `sys_menu` VALUES (945571061959577601, '删除', 2, 3, NULL, NULL, 0, 4, 1, 'sys:dept:delete', NULL, 0, 1, 1, '2017-12-26 16:24:44', 1, '2017-12-26 16:24:56');
INSERT INTO `sys_menu` VALUES (945571423827349506, '新增', 2, 4, NULL, NULL, 0, 2, 1, 'sys:menu:add', NULL, 0, 1, 1, '2017-12-26 16:26:10', 1, '2017-12-26 16:26:51');
INSERT INTO `sys_menu` VALUES (945571487333306370, '修改', 2, 4, NULL, NULL, 0, 3, 1, 'sys:menu:update,sys:menu:read', NULL, 0, 1, 1, '2017-12-26 16:26:25', 1, '2017-12-26 16:26:53');
INSERT INTO `sys_menu` VALUES (945571554194706434, '删除', 2, 4, NULL, NULL, 0, 4, 1, 'sys:menu:delete', NULL, 0, 1, 1, '2017-12-26 16:26:41', 1, '2017-12-30 23:33:32');
INSERT INTO `sys_menu` VALUES (946651550468222977, '新增', 2, 8, NULL, NULL, 0, 2, 1, 'sys:param:add', NULL, 0, 1, 1, '2017-12-29 15:58:12', 1, '2017-12-29 23:34:44');
INSERT INTO `sys_menu` VALUES (946651788901822466, '修改', 2, 8, NULL, NULL, 0, 3, 1, 'sys:param:update,sys:param:read', NULL, 0, 1, 1, '2017-12-29 15:59:09', 1, '2017-12-30 15:07:09');
INSERT INTO `sys_menu` VALUES (946651900851990530, '删除', 2, 8, NULL, NULL, 0, 4, 1, 'sys:param:delete', NULL, 0, 1, 1, '2017-12-29 15:59:36', 1, '2017-12-29 23:34:48');
INSERT INTO `sys_menu` VALUES (946748446155739137, '查看', 2, 2, NULL, NULL, 0, 1, 1, 'sys:user:read,sys:role:read', NULL, 0, 1, 1, '2017-12-29 22:23:13', 1, '2017-12-30 23:25:49');
INSERT INTO `sys_menu` VALUES (946758013140967425, '查看', 2, 3, NULL, NULL, 0, 1, 1, 'sys:dept:read', NULL, 0, 1, 1, '2017-12-29 23:01:15', 1, '2017-12-30 23:24:45');
INSERT INTO `sys_menu` VALUES (946758083039043585, '查看', 2, 4, NULL, NULL, 0, 1, 1, 'sys:menu:read', NULL, 0, 1, 1, '2017-12-29 23:01:32', 1, '2017-12-29 23:35:15');
INSERT INTO `sys_menu` VALUES (946758190165762049, '查看', 2, 5, NULL, NULL, 0, 1, 1, 'sys:role:read', NULL, 0, 1, 1, '2017-12-29 23:01:57', 1, '2017-12-29 23:35:13');
INSERT INTO `sys_menu` VALUES (946758477211344898, '查看', 2, 7, NULL, NULL, 0, NULL, 1, 'sys:dic:read', NULL, 1, 1, 1, '2017-12-29 23:03:06', 1, '2017-12-29 23:07:17');
INSERT INTO `sys_menu` VALUES (946758541132537857, '查看', 2, 8, NULL, NULL, 0, 1, 1, 'sys:param:read', NULL, 0, 1, 1, '2017-12-29 23:03:21', 1, '2017-12-29 23:35:09');
INSERT INTO `sys_menu` VALUES (946758603266957313, '查看', 2, 9, NULL, NULL, 0, NULL, 1, 'sys:log:read', NULL, 1, 1, 1, '2017-12-29 23:03:36', 1, '2017-12-29 23:07:01');
INSERT INTO `sys_menu` VALUES (1038283192852840449, '客户管理', 1, 1042659061347561474, 'icon-yonghuguanli', 'page/customer/developcustomer/developCustomerList.html', 0, 1, 1, 'customer:developcustomer:read,customer:developcustomer:edit', NULL, 0, 1, 1, '2018-09-08 12:29:38', 1, '2018-09-20 17:38:24');
INSERT INTO `sys_menu` VALUES (1042243569684242433, '任务管理', 1, 1, 'icon-yonghuguanli', 'page/sys/job/sysScheduleJobList.html', 0, 1, 1, 'ump:job:edit,ump:job:read', NULL, 0, 1, 1, '2018-09-19 10:46:46', 1, '2018-09-20 17:36:38');
INSERT INTO `sys_menu` VALUES (1042659061347561474, '测试', 0, 0, 'icon-xitongguanli', '', 0, 2, 1, '', NULL, 0, 1, 1, '2018-09-20 14:17:47', 1, '2018-09-20 14:20:47');
INSERT INTO `sys_menu` VALUES (1042659385772781570, '测试菜单', 1, 1042659061347561474, '', 'page/sys/menu/menuList2.html', 0, NULL, 1, '', NULL, 1, 1, 1, '2018-09-20 14:19:04', 1, '2018-09-20 17:38:33');
INSERT INTO `sys_menu` VALUES (1042721299416731649, '编辑', 2, 1038283192852840449, '', '', 0, NULL, 1, 'customer:developcustomer:edit', NULL, 0, 1, 1, '2018-09-20 18:25:05', 1, '2018-09-20 18:25:05');
INSERT INTO `sys_menu` VALUES (1042721453079252993, '查看', 2, 1038283192852840449, '', '', 0, NULL, 1, 'customer:developcustomer:read', NULL, 0, 1, 1, '2018-09-20 18:25:42', 1, '2018-09-20 18:25:42');

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数编号',
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数键名',
  `param_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数键值',
  `catalog_id` bigint(20) NULL DEFAULT NULL,
  `remark_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) NULL DEFAULT 1,
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1039763518355075074 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全局参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES (1039763518355075073, '123', '123', NULL, '123', 1, 0, 1, '2018-09-12 14:31:55', 1, '2018-09-18 13:22:09');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '所属部门编号',
  `role_type` int(1) NOT NULL DEFAULT 1 COMMENT '角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)',
  `enable_` tinyint(1) NOT NULL DEFAULT 1,
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `remark_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1042721077013762051 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 1, 1, 1, 0, NULL, 1, '2016-06-20 09:16:56', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role` VALUES (1042721077013762050, '普通用户1', 1, 1, 1, 0, '普通用户', 1, '2018-09-20 18:24:12', 1, '2018-09-20 18:25:56');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT 1,
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `remark_` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `sys_role_menu_key1`(`role_id`, `menu_id`, `permission_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1042721511568822274 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1039764988869668866, 1039764988773199873, 1, NULL, 1, 0, NULL, 1, '2018-09-12 14:37:45', 1, '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES (1039764988890640386, 1039764988773199873, 1038283192852840449, NULL, 1, 0, NULL, 1, '2018-09-12 14:37:45', 1, '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES (1039764988890640387, 1039764988773199873, 2, NULL, 1, 0, NULL, 1, '2018-09-12 14:37:45', 1, '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES (1039764988890640388, 1039764988773199873, 946748446155739137, NULL, 1, 0, NULL, 1, '2018-09-12 14:37:45', 1, '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES (1039764988890640389, 1039764988773199873, 18, NULL, 1, 0, NULL, 1, '2018-09-12 14:37:45', 1, '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES (1039764988928389121, 1039764988773199873, 19, NULL, 1, 0, NULL, 1, '2018-09-12 14:37:45', 1, '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES (1039764988936777730, 1039764988773199873, 21, NULL, 1, 0, NULL, 1, '2018-09-12 14:37:45', 1, '2018-09-12 14:37:45');
INSERT INTO `sys_role_menu` VALUES (1042244092483264513, 1, 1, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092491653121, 1, 1042243569684242433, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092500041730, 1, 2, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092512624642, 1, 946748446155739137, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092521013250, 1, 18, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092521013251, 1, 19, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092529401858, 1, 21, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092537790466, 1, 3, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092546179073, 1, 946758013140967425, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092546179074, 1, 945570894350995458, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092554567682, 1, 945570988546674689, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092562956289, 1, 945571061959577601, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092571344897, 1, 4, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092575539201, 1, 946758083039043585, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092588122113, 1, 945571423827349506, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092596510722, 1, 945571487333306370, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:50', 1, '2018-09-19 10:48:50');
INSERT INTO `sys_role_menu` VALUES (1042244092604899329, 1, 945571554194706434, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092604899330, 1, 5, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092613287937, 1, 946758190165762049, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092621676545, 1, 945569164808769538, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092625870850, 1, 945569292122673153, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092625870851, 1, 945569401908580354, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092634259458, 1, 7, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092642648066, 1, 8, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092655230978, 1, 946758541132537857, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092663619586, 1, 9, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042244092672008193, 1, 22, NULL, 1, 0, NULL, 1, '2018-09-19 10:48:51', 1, '2018-09-19 10:48:51');
INSERT INTO `sys_role_menu` VALUES (1042721511531073537, 1042721077013762050, 1042659061347561474, NULL, 1, 0, NULL, 1, '2018-09-20 18:25:54', 1, '2018-09-20 18:25:54');
INSERT INTO `sys_role_menu` VALUES (1042721511539462146, 1042721077013762050, 1038283192852840449, NULL, 1, 0, NULL, 1, '2018-09-20 18:25:54', 1, '2018-09-20 18:25:54');
INSERT INTO `sys_role_menu` VALUES (1042721511560433666, 1042721077013762050, 1042721453079252993, NULL, 1, 0, NULL, 1, '2018-09-20 18:25:54', 1, '2018-09-20 18:25:54');
INSERT INTO `sys_role_menu` VALUES (1042721511568822273, 1042721077013762050, 1042721299416731649, NULL, 1, 0, NULL, 1, '2018-09-20 18:25:54', 1, '2018-09-20 18:25:54');

-- ----------------------------
-- Table structure for sys_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_job`;
CREATE TABLE `sys_schedule_job`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称\r\n',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT 1,
  `remark_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1042246200989245443 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_schedule_job
-- ----------------------------
INSERT INTO `sys_schedule_job` VALUES (1042246200989245442, '测试任务', 'testTask', 'test', '123', '0/5 * * * * ? ', 1, 0, 1, NULL, 1, '2018-09-19 10:57:13', 1, '2018-09-19 17:46:38');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆帐户',
  `password_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '用户类型(1普通用户2管理员3系统用户)',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `name_pinyin` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名拼音',
  `sex_` int(1) NOT NULL DEFAULT 0 COMMENT '性别(0:未知;1:男;2:女)',
  `avatar_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `phone_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `wei_xin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `wei_bo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微博',
  `qq_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `birth_day` date NULL DEFAULT NULL COMMENT '出生日期',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门编号',
  `position_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `address_` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `staff_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable_` tinyint(1) NULL DEFAULT 1,
  `remark_` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `account`(`account_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1039765487257841667 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'YzlhZGMyNGYwNTk3NjA1NWQ4ZjdlZWI2NzlkNzIxZDk=', '3', '管理员', 'GUANLIYUAN', 0, 'http://118.190.43.148/group1/M00/00/00/dr4rlFjNBguAfJl7AAcOE67NTFk744.png', '', '', '', '', NULL, NULL, '0000-00-00', 1, '', NULL, NULL, 1, 1, '', '2016-05-06 10:06:52', 1, '2017-12-31 22:28:48', 1);
INSERT INTO `sys_user` VALUES (1037520425622949889, 'wanghaoxi', 'YzlhZGMyNGYwNTk3NjA1NWQ4ZjdlZWI2NzlkNzIxZDk=', '1', '王浩锡', NULL, 1, NULL, '15801866071', 'ronaldo_wang@163.com', '430503198810181011', '', '', '', '2018-09-06', 1, '', NULL, NULL, 0, 1, NULL, '2018-09-06 09:58:40', 1, '2018-09-20 18:28:48', NULL);
INSERT INTO `sys_user` VALUES (1039765487257841666, 'wang', 'MzIxMjlmMGMxZTg1YzJlYjNhNTFiMzYzOTIxMDE1MWI=', '1', '123', NULL, 1, NULL, '15801866071', 'ronaldo_wang@163.com', '430503198810181011', '123', NULL, NULL, '1988-10-18', 1, '123', NULL, NULL, 0, 1, NULL, '2018-09-12 14:39:45', 1, '2018-09-12 14:41:54', NULL);

-- ----------------------------
-- Table structure for sys_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT 1,
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `remark_` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `sys_user_menu_key1`(`user_id`, `menu_id`, `permission_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_menu
-- ----------------------------
INSERT INTO `sys_user_menu` VALUES (1, 1, 1, 'read', 1, 0, NULL, 0, '2017-08-28 16:24:01', 0, '2017-08-28 16:24:01');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT 1,
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `remark_` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `user_id_role_id`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1042722233580507139 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, 1, 1, NULL, 1, '2017-12-30 15:38:21', 1, '2018-09-08 13:39:38');
INSERT INTO `sys_user_role` VALUES (1039765732314247170, 1039765487257841666, 1039764988773199873, 1, 0, NULL, 1, '2018-09-12 14:40:43', 1, '2018-09-12 14:40:43');
INSERT INTO `sys_user_role` VALUES (1042722233580507138, 1037520425622949889, 1, 1, 0, NULL, 1, '2018-09-20 18:28:48', 1, '2018-09-20 18:28:48');

-- ----------------------------
-- Table structure for t_develop_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_develop_customer`;
CREATE TABLE `t_develop_customer`  (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `customer_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户编号',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '性别',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '客户类型',
  `mobile_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机',
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '概况',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `editable_` tinyint(1) NOT NULL DEFAULT 1,
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT 1,
  `remark_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1040216216108601346 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '待开发客户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_develop_customer
-- ----------------------------
INSERT INTO `t_develop_customer` VALUES (1040216216108601345, '谭先生', '00001', '1', '3', '15801866071', '聊天了', '', 1, 0, 1, NULL, 1, '2018-09-13 20:30:47', 1, '2018-09-19 18:21:24');

SET FOREIGN_KEY_CHECKS = 1;
