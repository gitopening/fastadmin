-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: atamm
-- ------------------------------------------------------
-- Server version	5.7.41-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `IMAdmin`
--

DROP TABLE IF EXISTS `IMAdmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMAdmin` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(40) NOT NULL COMMENT '用户名',
  `pwd` char(32) NOT NULL COMMENT '密码',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '用户状态 0 :正常 1:删除 可扩展',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间´',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMAdmin`
--

LOCK TABLES `IMAdmin` WRITE;
/*!40000 ALTER TABLE `IMAdmin` DISABLE KEYS */;
INSERT INTO `IMAdmin` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',0,0,0);
/*!40000 ALTER TABLE `IMAdmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMAudio`
--

DROP TABLE IF EXISTS `IMAudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMAudio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromId` int(11) unsigned NOT NULL COMMENT '发送者Id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收者Id',
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '语音存储的地址',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `duration` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '语音时长',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_fromId_toId` (`fromId`,`toId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMAudio`
--

LOCK TABLES `IMAudio` WRITE;
/*!40000 ALTER TABLE `IMAudio` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMAudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMDepart`
--

DROP TABLE IF EXISTS `IMDepart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMDepart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `departName` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '部门名称',
  `priority` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '显示优先级',
  `parentId` int(11) unsigned NOT NULL COMMENT '上级部门id',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_departName` (`departName`),
  KEY `idx_priority_status` (`priority`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMDepart`
--

LOCK TABLES `IMDepart` WRITE;
/*!40000 ALTER TABLE `IMDepart` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMDepart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMDiscovery`
--

DROP TABLE IF EXISTS `IMDiscovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMDiscovery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `itemName` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '名称',
  `itemUrl` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'URL',
  `itemPriority` int(11) unsigned NOT NULL COMMENT '显示优先级',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_itemName` (`itemName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMDiscovery`
--

LOCK TABLES `IMDiscovery` WRITE;
/*!40000 ALTER TABLE `IMDiscovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMDiscovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroup`
--

DROP TABLE IF EXISTS `IMGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '群名称',
  `avatar` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '群头像',
  `creator` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者用户id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '群组类型，1-固定;2-临时群',
  `userCnt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '成员人数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否删除,0-正常，1-删除',
  `version` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '群版本号',
  `lastChated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后聊天时间',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(191)),
  KEY `idx_creator` (`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroup`
--

LOCK TABLES `IMGroup` WRITE;
/*!40000 ALTER TABLE `IMGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMember`
--

DROP TABLE IF EXISTS `IMGroupMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '群Id',
  `userId` int(11) unsigned NOT NULL COMMENT '用户id',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否退出群，0-正常，1-已退出',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_userId_status` (`groupId`,`userId`,`status`),
  KEY `idx_userId_status_updated` (`userId`,`status`,`updated`),
  KEY `idx_groupId_updated` (`groupId`,`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和群的关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMember`
--

LOCK TABLES `IMGroupMember` WRITE;
/*!40000 ALTER TABLE `IMGroupMember` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMessage_0`
--

DROP TABLE IF EXISTS `IMGroupMessage_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMessage_0` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `userId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMessage_0`
--

LOCK TABLES `IMGroupMessage_0` WRITE;
/*!40000 ALTER TABLE `IMGroupMessage_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMessage_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMessage_1`
--

DROP TABLE IF EXISTS `IMGroupMessage_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMessage_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `userId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMessage_1`
--

LOCK TABLES `IMGroupMessage_1` WRITE;
/*!40000 ALTER TABLE `IMGroupMessage_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMessage_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMessage_2`
--

DROP TABLE IF EXISTS `IMGroupMessage_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMessage_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `userId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMessage_2`
--

LOCK TABLES `IMGroupMessage_2` WRITE;
/*!40000 ALTER TABLE `IMGroupMessage_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMessage_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMessage_3`
--

DROP TABLE IF EXISTS `IMGroupMessage_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMessage_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `userId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMessage_3`
--

LOCK TABLES `IMGroupMessage_3` WRITE;
/*!40000 ALTER TABLE `IMGroupMessage_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMessage_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMessage_4`
--

DROP TABLE IF EXISTS `IMGroupMessage_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMessage_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `userId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMessage_4`
--

LOCK TABLES `IMGroupMessage_4` WRITE;
/*!40000 ALTER TABLE `IMGroupMessage_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMessage_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMessage_5`
--

DROP TABLE IF EXISTS `IMGroupMessage_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMessage_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `userId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMessage_5`
--

LOCK TABLES `IMGroupMessage_5` WRITE;
/*!40000 ALTER TABLE `IMGroupMessage_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMessage_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMessage_6`
--

DROP TABLE IF EXISTS `IMGroupMessage_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMessage_6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `userId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMessage_6`
--

LOCK TABLES `IMGroupMessage_6` WRITE;
/*!40000 ALTER TABLE `IMGroupMessage_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMessage_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMGroupMessage_7`
--

DROP TABLE IF EXISTS `IMGroupMessage_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMGroupMessage_7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `userId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMGroupMessage_7`
--

LOCK TABLES `IMGroupMessage_7` WRITE;
/*!40000 ALTER TABLE `IMGroupMessage_7` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMGroupMessage_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMMessage_0`
--

DROP TABLE IF EXISTS `IMMessage_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMMessage_0` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMMessage_0`
--

LOCK TABLES `IMMessage_0` WRITE;
/*!40000 ALTER TABLE `IMMessage_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMMessage_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMMessage_1`
--

DROP TABLE IF EXISTS `IMMessage_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMMessage_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMMessage_1`
--

LOCK TABLES `IMMessage_1` WRITE;
/*!40000 ALTER TABLE `IMMessage_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMMessage_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMMessage_2`
--

DROP TABLE IF EXISTS `IMMessage_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMMessage_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMMessage_2`
--

LOCK TABLES `IMMessage_2` WRITE;
/*!40000 ALTER TABLE `IMMessage_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMMessage_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMMessage_3`
--

DROP TABLE IF EXISTS `IMMessage_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMMessage_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMMessage_3`
--

LOCK TABLES `IMMessage_3` WRITE;
/*!40000 ALTER TABLE `IMMessage_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMMessage_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMMessage_4`
--

DROP TABLE IF EXISTS `IMMessage_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMMessage_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMMessage_4`
--

LOCK TABLES `IMMessage_4` WRITE;
/*!40000 ALTER TABLE `IMMessage_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMMessage_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMMessage_5`
--

DROP TABLE IF EXISTS `IMMessage_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMMessage_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMMessage_5`
--

LOCK TABLES `IMMessage_5` WRITE;
/*!40000 ALTER TABLE `IMMessage_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMMessage_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMMessage_6`
--

DROP TABLE IF EXISTS `IMMessage_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMMessage_6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMMessage_6`
--

LOCK TABLES `IMMessage_6` WRITE;
/*!40000 ALTER TABLE `IMMessage_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMMessage_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMMessage_7`
--

DROP TABLE IF EXISTS `IMMessage_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMMessage_7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) unsigned NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) unsigned NOT NULL COMMENT '发送用户的id',
  `toId` int(11) unsigned NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) unsigned NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMMessage_7`
--

LOCK TABLES `IMMessage_7` WRITE;
/*!40000 ALTER TABLE `IMMessage_7` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMMessage_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMRecentSession`
--

DROP TABLE IF EXISTS `IMRecentSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMRecentSession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL COMMENT '用户id',
  `peerId` int(11) unsigned NOT NULL COMMENT '对方id',
  `type` tinyint(1) unsigned DEFAULT '0' COMMENT '类型，1-用户,2-群组',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '用户:0-正常, 1-用户A删除,群组:0-正常, 1-被删除',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_userId_peerId_status_updated` (`userId`,`peerId`,`status`,`updated`),
  KEY `idx_userId_peerId_type` (`userId`,`peerId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMRecentSession`
--

LOCK TABLES `IMRecentSession` WRITE;
/*!40000 ALTER TABLE `IMRecentSession` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMRecentSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMRelationShip`
--

DROP TABLE IF EXISTS `IMRelationShip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMRelationShip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smallId` int(11) unsigned NOT NULL COMMENT '用户A的id',
  `bigId` int(11) unsigned NOT NULL COMMENT '用户B的id',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '用户:0-正常, 1-用户A删除,群组:0-正常, 1-被删除',
  `created` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_smallId_bigId_status_updated` (`smallId`,`bigId`,`status`,`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMRelationShip`
--

LOCK TABLES `IMRelationShip` WRITE;
/*!40000 ALTER TABLE `IMRelationShip` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMRelationShip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMUser`
--

DROP TABLE IF EXISTS `IMUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMUser` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1男2女0未知',
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `domain` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '拼音',
  `nick` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '花名,绰号等',
  `password` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(4) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '混淆码',
  `phone` varchar(11) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'email',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '自定义用户头像',
  `departId` int(11) unsigned NOT NULL COMMENT '所属部门Id',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '1. 试用期 2. 正式 3. 离职 4.实习',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  `updated` int(11) unsigned NOT NULL COMMENT '更新时间',
  `push_shield_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0关闭勿扰 1开启勿扰',
  `sign_info` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '个性签名',
  PRIMARY KEY (`id`),
  KEY `idx_domain` (`domain`),
  KEY `idx_name` (`name`),
  KEY `idx_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMUser`
--

LOCK TABLES `IMUser` WRITE;
/*!40000 ALTER TABLE `IMUser` DISABLE KEYS */;
INSERT INTO `IMUser` VALUES (1,0,'test','test','test','41f61f6b38c7adbb266bd5f73c147d66','7605','18657139000','test@test.com','',1,0,1428416403,1428416403,0,'时间'),(2,0,'testa','testa','testa','41f61f6b38c7adbb266bd5f73c147d66','7605','18657139000','test@test.com','',1,0,1428416403,1428416403,0,'时间'),(3,0,'testb','testb','testb','41f61f6b38c7adbb266bd5f73c147d66','7605','18657139000','test@test.com','',1,0,1428416403,1428416403,0,'时间'),(4,0,'testc','testc','testc','41f61f6b38c7adbb266bd5f73c147d66','7605','18657139000','test@test.com','',1,0,1428416403,1428416403,0,'时间');
/*!40000 ALTER TABLE `IMUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'atamm'
--

--
-- Dumping routines for database 'atamm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-22 16:19:10
