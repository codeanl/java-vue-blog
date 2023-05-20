/*
 Navicat Premium Data Transfer

 Source Server         : lja
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : javaweb-blog

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 20/05/2023 19:03:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_blog
-- ----------------------------
DROP TABLE IF EXISTS `m_blog`;
CREATE TABLE `m_blog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` longtext,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of m_blog
-- ----------------------------
BEGIN;
INSERT INTO `m_blog` (`id`, `user_id`, `title`, `description`, `content`, `gmt_create`, `gmt_modified`, `status`, `deleted`, `author`) VALUES (18, 1, '4444', '44444', '444444', '2020-07-20 22:35:21', '2023-05-20 18:54:28', 0, 1, NULL);
INSERT INTO `m_blog` (`id`, `user_id`, `title`, `description`, `content`, `gmt_create`, `gmt_modified`, `status`, `deleted`, `author`) VALUES (19, 1, '11111', '111', '11111', '2020-07-20 22:36:10', '2023-05-20 18:56:22', 0, 1, NULL);
INSERT INTO `m_blog` (`id`, `user_id`, `title`, `description`, `content`, `gmt_create`, `gmt_modified`, `status`, `deleted`, `author`) VALUES (20, 1, '33333', '3333', '33333', '2020-07-20 23:52:50', '2023-05-20 18:56:24', 0, 1, NULL);
INSERT INTO `m_blog` (`id`, `user_id`, `title`, `description`, `content`, `gmt_create`, `gmt_modified`, `status`, `deleted`, `author`) VALUES (21, 1, '4444', '44444', '44444', '2020-07-20 23:52:58', '2023-05-20 18:56:25', 0, 1, NULL);
INSERT INTO `m_blog` (`id`, `user_id`, `title`, `description`, `content`, `gmt_create`, `gmt_modified`, `status`, `deleted`, `author`) VALUES (22, 1, '5555', '55555', '555555', '2020-07-20 23:53:07', '2020-07-21 21:25:15', 0, 1, NULL);
INSERT INTO `m_blog` (`id`, `user_id`, `title`, `description`, `content`, `gmt_create`, `gmt_modified`, `status`, `deleted`, `author`) VALUES (23, 1, 'LeetCode9-回文数', 'LeetCode9-回文数', '## 题目\n### 题目\n\n>给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。\n### 示例 1\n```\n输入：x = 121\n输出：true\n```\n### 示例 2：\n```\n输入：x = -121\n输出：false\n解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。\n```\n### 提示\n```\n-231 <= x <= 231 - 1\n```\n## 解题\n```\nfunc isPalindrome(x int) bool {\n    if x < 0 || (x % 10 == 0 && x != 0) {\n        return false\n    }\n    d := 0\n    //迭代\n    for x > d {\n        d = d * 10 + x % 10\n        x =x / 10\n    }\n    return x == d || x == d /10   // 当数字长度为奇数时，我们可以通过 revertedNumber/10 去除处于中位的数字。\n}\n```', '2023-05-20 09:15:38', NULL, 0, 0, 'admin');
INSERT INTO `m_blog` (`id`, `user_id`, `title`, `description`, `content`, `gmt_create`, `gmt_modified`, `status`, `deleted`, `author`) VALUES (24, 1, 'LeetCode1-两数之和', 'LeetCode1-两数之和', '# 题目\n\n#### 题目\n>给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那两个整数，并返回它们的数组下标。\n>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。你可以按任意顺序返回答案。\n\n#### 示例 :\n```\n输入：nums = [2,7,11,15], target = 9\n输出：[0,1]\n解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\n```\n#### 提示：\n```\n2 <= nums.length <= 104\n-109 <= nums[i] <= 109\n-109 <= target <= 109\n只会存在一个有效答案\n```\n# 解题\n>#### 方法一 穷举法\n通过两次遍历整个数组，时间复杂度为O(n2)，\n```\nfunc twoSum(nums []int, target int) []int {\n    var i,j int\n    var res []int   //用于存储结果\n    for i=0;i<len(nums);i++{\n        for j=i+1;j<len(nums);j++{\n            if nums[i]+nums[j]==target{\n                res=append(res,i)\n                res=append(res,j)\n                return res\n            }\n        }\n    }\n    return res\n}\n```\n>#### 方法二 map哈希表\n第一次遍历数组，将数组中的元素作为 key，下标作为 value。第二次遍历数组中的每个元素 nums[i]，判断 target- nums [i] 是否存在在哈希表里。 整个过程通过利用哈希表只需要两次遍历数组，时间复杂度为O(n)。做到了用空间换时间。\n\n```\nfunc twoSum(nums []int, target int) []int {\n    var mapper map[int]int  //定义一个map\n	var res []int\n	mapper = make(map[int]int) //使用map，一定要make\n	var i int\n	//第一次遍历整个数组\n	for i = 0; i < len(nums); i++ {\n		mapper[nums[i]] = i //将数组中的元素作为key，下标作为value\n	}\n	//第二次遍历整个数组\n	for i = 0; i < len(nums); i++ {  \n	    /*对于每个元素nums[i]*，判断target-nums[i]是否存在在数组中*/\n		index, ok := mapper[target-nums[i]] \n		if i != index {  //为了保证不取同一个元素\n			if ok == true {\n				res = append(res, i)\n				res = append(res, index)\n				return res\n			}\n		}\n	}\n	return res\n}\n```', '2023-05-20 18:56:54', NULL, 0, 0, 'admin');
INSERT INTO `m_blog` (`id`, `user_id`, `title`, `description`, `content`, `gmt_create`, `gmt_modified`, `status`, `deleted`, `author`) VALUES (25, 1, '进入Linux世界大门的第一步——安装系统', '进入Linux世界大门的第一步——安装系统', '# 前言\n## 简介\nLinux 内核最初只是由芬兰人林纳斯·托瓦兹（Linus Torvalds）在赫尔辛基大学上学时出于个人爱好而编写的。\n\nLinux 是一套免费使用和自由传播的类 Unix 操作系统，是一个基于 POSIX 和 UNIX 的多用户、多任务、支持多线程和多 CPU 的操作系统。\n\nLinux 能运行主要的 UNIX 工具软件、应用程序和网络协议。它支持 32 位和 64 位硬件。Linux 继承了 Unix 以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。\n## 发行版\nLinux 的发行版说简单点就是将 Linux 内核与应用软件做一个打包。\n![1511849829609658](/upload/2022/08/1511849829609658.jpg)\n目前市面上较知名的发行版有：Ubuntu、RedHat、CentOS、Debian、Fedora、SuSE、OpenSUSE、Arch Linux、SolusOS 等。\n![wKioL1bvVPWAu7hqAAEyirVUn3c446.jpg-wh_651x-s_3197843091](/upload/2022/08/wKioL1bvVPWAu7hqAAEyirVUn3c446.jpg-wh_651x-s_3197843091.jpg)\n\n## linux的特点\n- Linux是Unix在PC计算机上的克隆版，仿Unix内核构建，同Unix指令集向下几乎完全兼容。\n- 是一个完善的多用户、多任务，支持多进程、多CPU的系统。\n- 具有很高的系统稳定性与可靠性。\n- 具有很高的系统安全性。\n- 有完善的网络服务，支持HTTP、FTP、SMTP、POP、SAMBA、SNMP、DNS、DHCP、SSH、TELNET等。\n- 是基于GNU许可，自由开放的系统。\n- 有大量第三方免费应用程序。\n- 得到了众多业界厂商支持，如IBM、ORACLE、INTEL、HP、MOTO、Google等。\n- 有完善的大型数据库平台，包括Oracle、DB2、Sybase、MySQL、Postgres等。\n- 有完善的图形用户界面，包括GNOME、KDE等。\n\n# 虚拟机安装Linux\n## 介绍\n虚拟机（Virtual Machine）指通过软件模拟的具有完整硬件系统功能的、运行在一个完全隔离环境中的完整计算机系统。相对于直接安装在终端上的操作系统，虚拟机对于终端机影响更小，更利于迁移。\n\nVMware作为一款稳定的虚拟机运行工具，具有安装简便，ui精练，更新持久的优点。本文将简述其安装与配置，帮助对虚拟机感兴趣的爱好者安装并入门这款软件。\n\n本文实例使用的是VMware 15.5.0 PRO以及CentOS7.6 64位桌面版。\n\n\n## 安装虚拟机\n进入官网下载软件 https://www.vmware.com/cn.html\n\n下载完成一路next安装\n\n![image-1661942545479](/upload/2022/08/image-1661942545479.png)\n\n## 配置虚拟机\n### 激活虚拟机\n![image-1661942705275](/upload/2022/08/image-1661942705275.png)\n初次安装需要密钥，这里给大家发了许多密钥，随便复制一个激活即可\n\nVMware15密钥更新：\n\nYG5H2-ANZ0H-M8ERY-TXZZZ-YKRV8\n\nUG5J2-0ME12-M89WY-NPWXX-WQH88\n\nUA5DR-2ZD4H-089FY-6YQ5T-YPRX6\n\nGA590-86Y05-4806Y-X4PEE-ZV8E0\n\nZF582-0NW5N-H8D2P-0XZEE-Z22VA\n\nYA18K-0WY8P-H85DY-L4NZG-X7RAD\n\nVMware Workstation Pro 15 激活许可证\n\nUY758-0RXEQ-M81WP-8ZM7Z-Y3HDA\n\nVF750-4MX5Q-488DQ-9WZE9-ZY2D6\n\nUU54R-FVD91-488PP-7NNGC-ZFAX6\n\nYC74H-FGF92-081VZ-R5QNG-P6RY4\n\nYC34H-6WWDK-085MQ-JYPNX-NZRA2\n\nCG392-4PX5J-H816Z-HYZNG-PQRG2\n\n\n\n### 创建虚拟机 安装镜像\n\n![image-1661942796467](/upload/2022/08/image-1661942796467.png)\n![image-1661942814779](/upload/2022/08/image-1661942814779.png)\n\n选择下好的镜像包\n![image-1661942908231](/upload/2022/08/image-1661942908231.png)\n\n配置账户\n\n\n![image-1661942928747](/upload/2022/08/image-1661942928747.png)\n\n选择安装位置\n![image-1661942971216](/upload/2022/08/image-1661942971216.png)\n\n设置磁盘容量\n推荐大家选择40G，方便下载应用安装\n![image-1661943042778](/upload/2022/08/image-1661943042778.png)\n![image-1661943097977](/upload/2022/08/image-1661943097977.png)\n\n\n等待安装\n![image-1661943153767](/upload/2022/08/image-1661943153767.png)\n![image-1661943398627](/upload/2022/08/image-1661943398627.png)\n\n在安装过程中可以先设置账户\n![image-1661943252988](/upload/2022/08/image-1661943252988.png)\n![image-1661943277121](/upload/2022/08/image-1661943277121.png)\n\n设置centos主目录 默认直接点击save保存,点击DONE重新回到安装界面\n\n![image-1661943312667](/upload/2022/08/image-1661943312667.png)\n![image-1661943398627](/upload/2022/08/image-1661943398627.png)\n安装完成进入系统\n![image-1661943729427](/upload/2022/08/image-1661943729427.png)\n\n安装完成\n![image-1661943750460](/upload/2022/08/image-1661943750460.png)\n\n成功进入系统\n![image-1661943826921](/upload/2022/08/image-1661943826921.png)\n\n# 双系统安装\n## 工具\n1、一台能上网的电脑，或者可以先把软件下载好\n2、两个U盘，8G以上最好（一个U盘要来回做系统盘，比较麻烦）\n3、需要的文件：CentOS7（这里以centos7.6演示）\n4、需要的软件：UltraISO\n\n## 设置磁盘分区\n右键选择磁盘管理\n![image-1661945081249](/upload/2022/08/image-1661945081249.png)\n\n![image-1661945128175](/upload/2022/08/image-1661945128175.png)\n\n## 制作U盘启动盘\n打开UltralSO\n![image-1661945354818](/upload/2022/08/image-1661945354818.png)\n\n选择下载好的镜像\n![image-1661945396042](/upload/2022/08/image-1661945396042.png)\n\n进行安装\n![image-1661945465532](/upload/2022/08/image-1661945465532.png)\n\n在U盘写入系统\n![image-1661945511601](/upload/2022/08/image-1661945511601.png)\n\n## U盘启动\n重启电脑一直按F12，选择u盘启动进行安装\n![image-1661945627093](/upload/2022/08/image-1661945627093.png)\n按照系统指引一直安装即可\n\n安装成功，进入桌面\n![image-1661943826921](/upload/2022/08/image-1661943826921.png)\n', '2023-05-20 18:58:47', NULL, 0, 0, 'admin');
COMMIT;

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_USERNAME` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of m_user
-- ----------------------------
BEGIN;
INSERT INTO `m_user` (`id`, `username`, `avatar`, `email`, `password`, `status`, `created`, `last_login`) VALUES (1, 'admin', 'https://an23.co/upload/2022/07/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220722020131.jpg', 'admin@qq.com', '96e79218965eb72c92a549dd5a330112', 0, '2020-07-19 22:00:00', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
