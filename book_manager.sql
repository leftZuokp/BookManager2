/*
 Navicat Premium Data Transfer
 Source Schema         : book_manager
 Target Server Version : 50735
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type`  (
  `bookTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `bookTypeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookTypeDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书籍类型描述',
  PRIMARY KEY (`bookTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `book_type` VALUES (1, '计算机科学', '计算机相关');
INSERT INTO `book_type` VALUES (2, '历史', '历史相关');
INSERT INTO `book_type` VALUES (3, '文学', '文学相关');
INSERT INTO `book_type` VALUES (4, '科幻', '科幻相关');
INSERT INTO `book_type` VALUES (6, '小说', '小说相关');
INSERT INTO `book_type` VALUES (7, '外语', '外语相关');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isAdmin` tinyint(4) NOT NULL COMMENT '1是管理员，0非管理员',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `user` VALUES (1, 'admin', 'admin', 1);
INSERT INTO `user` VALUES (2, '李明', '123456', 0);
INSERT INTO `user` VALUES (11, 'zhang', '123', 0);
INSERT INTO `user` VALUES (13, 'zhao', 'abc', 1);
INSERT INTO `user` VALUES (14, 'peng', '123456', 0);

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookAuthor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookPrice` decimal(10, 2) NOT NULL,
  `bookTypeId` int(11) NOT NULL,
  `bookDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书籍描述',
  `isBorrowed` tinyint(4) NOT NULL COMMENT '1表示借出，0表示已还',
  `bookImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书籍图片',
  PRIMARY KEY (`bookId`) USING BTREE,
  INDEX `fk_book_info_book_type_1`(`bookTypeId`) USING BTREE,
  CONSTRAINT `book_info_ibfk_1` FOREIGN KEY (`bookTypeId`) REFERENCES `book_type` (`bookTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `book_info` VALUES (1, 'Java程序设计', '耿祥义', 55.50, 1, '《Java2实用教程》可以作为高等院校相关专业的教材。', 0, '');
INSERT INTO `book_info` VALUES (2, '红楼梦', '曹雪芹', 36.00, 3, '《红楼梦》是一部百科全书式的长篇小说。', 0, '');
INSERT INTO `book_info` VALUES (4, '西游记', '吴承恩', 60.00, 3, '《西游记》主要描写的是孙悟空保唐僧西天取经。', 0, '');
INSERT INTO `book_info` VALUES (5, '水浒传', '施耐庵', 50.60, 3, '《水浒传》是我国第一部以农民起义为题材的长篇章回小说。', 0, '');
INSERT INTO `book_info` VALUES (12, '三国演义', '罗贯中', 42.00, 3, '《三国演义》是我国小说史上最著名的历史小说。', 0, '');
INSERT INTO `book_info` VALUES (13, '三体（全集）', '刘慈欣', 92.00, 4, '三体三部曲，是中国著名科幻作家刘慈欣的首个长篇系列。', 0, '');
INSERT INTO `book_info` VALUES (14, '天龙八部', '金庸', 58.00, 6, '天龙八部乃金庸笔下的一部长篇小说。', 0, '');
INSERT INTO `book_info` VALUES (27, '明朝那些事儿', '当年明月', 399.00, 2, '国民史学读本。', 0, '');
INSERT INTO `book_info` VALUES (28, '沙丘', 'Frank Herbert', 394.90, 4, '每个不可不读的书单上都有《沙丘》。', 0, '');
INSERT INTO `book_info` VALUES (30, 'C Primer Plus', '史蒂芬·普拉达', 90.50, 1, 'C语言入门教程。', 0, '');
INSERT INTO `book_info` VALUES (31, '计算机网络：自顶向下方法', 'James', 73.40, 1, '以自顶向下的方式系统展现计算机网络的原理与结构。', 0, '');
INSERT INTO `book_info` VALUES (32, '围城', '钱钟书', 30.20, 3, '《围城》是一幅栩栩如生的世井百态图。', 0, '');
INSERT INTO `book_info` VALUES (33, '平凡的世界', '路遥', 101.80, 3, '在平凡的世界里，照样可以活得丰富而精彩。', 0, '');
INSERT INTO `book_info` VALUES (34, '哈利波特', 'J.K.罗琳', 648.00, 6, '本书生动幽默，感人至深。', 0, '');
INSERT INTO `book_info` VALUES (36, '新概念英语1', '亚历山大', 41.85, 7, '全新的教学理念。', 0, '');
INSERT INTO `book_info` VALUES (37, '新概念英语2', '亚历山大', 47.25, 7, '全新的教学理念。', 0, '');
INSERT INTO `book_info` VALUES (38, '新概念英语3', '亚历山大', 46.50, 7, '全新的教学理念。', 0, '');
INSERT INTO `book_info` VALUES (39, '新概念英语4', '亚历山大', 45.50, 7, '全新的教学理念。', 0, '');
INSERT INTO `book_info` VALUES (40, '数据结构', '严蔚敏', 39.80, 1, '计算机科学教材', 0, '');
INSERT INTO `book_info` VALUES (41, '数据库系统概论', '王珊', 42.00, 1, '数据库经典教材', 0, '');
INSERT INTO `book_info` VALUES (43, '献给阿尔吉侬的花束', '丹尼尔·凯斯', 36.00, 4, '声称能改造智能的科学实验。', 0, '');
INSERT INTO `book_info` VALUES (44, '银河帝国1', 'Foundation', 36.50, 4, '人类蜗居在银河系的一个小角落。', 0, '');
INSERT INTO `book_info` VALUES (45, '中国历代政治得失', '钱穆', 12.00, 2, '中国政治制度史概览。', 0, '');
INSERT INTO `book_info` VALUES (46, '万历十五年', '黄仁宇', 18.00, 2, '万历十五年，亦即公元1587年。', 0, '');
INSERT INTO `book_info` VALUES (47, '红星照耀中国', '埃德加·斯诺', 43.00, 2, '真实记录了斯诺在中国西北革命根据地的采访。', 0, '');
INSERT INTO `book_info` VALUES (48, '鹿鼎记', '金庸', 96.00, 6, '金庸先生最后一部小说。', 0, '');
INSERT INTO `book_info` VALUES (49, '追风筝的人', '卡勒德·胡赛尼', 29.00, 6, '12岁的阿富汗富家少爷阿米尔的故事。', 0, '');
INSERT INTO `book_info` VALUES (50, '白鹿原', '陈忠实', 39.00, 3, '白鹿两大家族的恩怨纷争。', 0, '');
INSERT INTO `book_info` VALUES (51, '巨人的陨落', '肯·福莱特', 35.50, 6, '在第一次世界大战的硝烟中。', 0, '');
INSERT INTO `book_info` VALUES (52, '白夜行', '东野圭吾', 29.80, 6, '只希望能手牵手在太阳下散步。', 0, '');
INSERT INTO `book_info` VALUES (53, '英语语法新思维', '张满胜', 39.00, 7, '英语语法学习参考书。', 0, '');
INSERT INTO `book_info` VALUES (56, 'JavaScript高级程序设计', '泽卡斯', 99.00, 1, 'JavaScript超级畅销书。', 0, '');
INSERT INTO `book_info` VALUES (57, '活着', '余华', 20.00, 3, '讲述了农村人福贵悲惨的人生遭遇。', 0, '');
INSERT INTO `book_info` VALUES (58, '挑战程序设计竞赛', '秋叶拓哉', 79.00, 1, '世界顶级程序设计高手的经验总结。', 0, '');
INSERT INTO `book_info` VALUES (59, '人类简史', '赫拉利', 68.00, 2, '从认知革命到科学革命。', 0, '');
INSERT INTO `book_info` VALUES (61, '中国大历史', '黄仁宇', 19.00, 2, '大历史视角下的中国。', 0, '');
INSERT INTO `book_info` VALUES (62, '危机与重构', '李碧妍', 79.80, 2, '从政治地理学切入研究唐代。', 0, '');
INSERT INTO `book_info` VALUES (63, '笑傲江湖', '金庸', 76.80, 6, '金庸创作的长篇武侠小说。', 0, '');
INSERT INTO `book_info` VALUES (64, '东晋门阀政治', '田余庆', 49.00, 2, '对门阀政治问题的再探索。', 0, '');
INSERT INTO `book_info` VALUES (65, '激荡三十年', '吴晓波', 32.00, 2, '1978-2008中国经济发展。', 0, '');
INSERT INTO `book_info` VALUES (66, '百年孤独', '马尔克斯', 39.50, 3, '魔幻现实主义文学的代表作。', 0, '');
INSERT INTO `book_info` VALUES (67, '长夜难明', '紫金陈', 42.00, 6, '社会派悬疑推理小说。', 0, '');
INSERT INTO `book_info` VALUES (68, '基督山伯爵', '大仲马', 43.90, 6, '一个报恩复仇的故事。', 0, '');
INSERT INTO `book_info` VALUES (69, '福尔摩斯探案全集', '柯南·道尔', 53.00, 6, '最经典的侦探小说。', 0, '');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `borrowId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `borrowTime` datetime NOT NULL,
  `returnTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`borrowId`) USING BTREE,
  INDEX `fk_borrow_user_1`(`userId`) USING BTREE,
  INDEX `fk_borrow_book_info_1`(`bookId`) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `book_info` (`bookId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `borrow` VALUES (26, 11, 2, '2021-11-18 14:24:06', '2021-11-18 16:07:03');
INSERT INTO `borrow` VALUES (27, 11, 1, '2021-11-18 15:01:31', '2021-11-18 16:07:06');
INSERT INTO `borrow` VALUES (28, 11, 4, '2021-11-18 15:22:05', '2021-11-18 16:07:08');
INSERT INTO `borrow` VALUES (30, 14, 2, '2021-11-18 16:52:05', '2021-11-19 20:55:10');
INSERT INTO `borrow` VALUES (32, 14, 4, '2021-11-18 16:52:17', '2021-11-18 16:52:41');
INSERT INTO `borrow` VALUES (38, 14, 1, '2021-11-19 22:19:43', '2021-11-19 22:19:48');
INSERT INTO `borrow` VALUES (39, 14, 1, '2021-11-19 22:46:14', '2021-11-19 22:46:18');
INSERT INTO `borrow` VALUES (40, 14, 1, '2021-11-19 22:57:21', '2021-11-19 22:57:26');

-- ----------------------------
-- Table structure for notice (公告表)
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noticeContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noticeTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`noticeId`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `notice` VALUES (1, '图书馆开放时间通知', '各位读者：图书馆周一至周五开放时间为8:00-22:00，周末开放时间为9:00-21:00。请合理安排借阅时间。', '2026-05-20 09:00:00', 'admin');
INSERT INTO `notice` VALUES (2, '新增图书到馆通知', '本周新增计算机科学类图书50本、文学类图书30本，欢迎广大读者前来借阅。', '2026-05-22 10:30:00', 'admin');
INSERT INTO `notice` VALUES (3, '读书月活动通知', '本月为读书月，图书馆将举办读书分享会活动，详情请关注后续通知。', '2026-05-23 14:00:00', 'admin');

-- ----------------------------
-- Table structure for book_review (图书评论表)
-- ----------------------------
DROP TABLE IF EXISTS `book_review`;
CREATE TABLE `book_review` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `rating` int(11) NOT NULL COMMENT '评分1-5',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reviewTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`reviewId`),
  INDEX `fk_review_book_idx`(`bookId`),
  INDEX `fk_review_user_idx`(`userId`),
  CONSTRAINT `fk_review_book` FOREIGN KEY (`bookId`) REFERENCES `book_info` (`bookId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `book_review` VALUES (1, 1, 14, 5, '非常经典的Java入门教材，讲解清晰，适合初学者。', '2026-05-18 10:00:00');
INSERT INTO `book_review` VALUES (2, 2, 2, 5, '四大名著之一，值得反复品读。', '2026-05-19 14:30:00');
INSERT INTO `book_review` VALUES (3, 13, 14, 5, '中国科幻的巅峰之作，强烈推荐！', '2026-05-20 09:15:00');
INSERT INTO `book_review` VALUES (4, 33, 2, 4, '路遥的文字朴实而有力，读后深受触动。', '2026-05-21 16:00:00');
INSERT INTO `book_review` VALUES (5, 57, 14, 5, '余华用极其平淡的语气写出了最震撼人心的故事。', '2026-05-22 11:00:00');

SET FOREIGN_KEY_CHECKS = 1;
