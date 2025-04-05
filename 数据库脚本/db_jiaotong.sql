/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 5.7.18-log : Database - db_jiaotong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_jiaotong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_jiaotong`;

/*Table structure for table `aboutus` */

DROP TABLE IF EXISTS `aboutus`;

CREATE TABLE `aboutus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关于我们';

/*Data for the table `aboutus` */

insert  into `aboutus`(`id`,`addtime`,`title`,`subtitle`,`content`,`picture1`,`picture2`,`picture3`) values 
(1,'2023-03-18 07:02:20','关于我们','ABOUT US','<p>测试000063</p>','upload/aboutus_picture1.jpg','upload/aboutus_picture2.jpg','upload/aboutus_picture3.jpg');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COMMENT '提问',
  `reply` longtext COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1679123386021 DEFAULT CHARSET=utf8 COMMENT='在线提问';

/*Data for the table `chat` */

insert  into `chat`(`id`,`addtime`,`userid`,`adminid`,`ask`,`reply`,`isreply`) values 
(61,'2023-03-18 07:02:20',1,1,'提问1','回复1',1),
(62,'2023-03-18 07:02:20',2,2,'提问2','回复2',2),
(63,'2023-03-18 07:02:20',3,3,'提问3','回复3',3),
(64,'2023-03-18 07:02:20',4,4,'提问4','回复4',4),
(65,'2023-03-18 07:02:20',5,5,'提问5','回复5',5),
(66,'2023-03-18 07:02:20',6,6,'提问6','回复6',6),
(67,'2023-03-18 07:02:20',7,7,'提问7','回复7',7),
(68,'2023-03-18 07:02:20',8,8,'提问8','回复8',8),
(1679123170945,'2023-03-18 07:06:10',1679123112816,NULL,'在线提问的地方',NULL,0),
(1679123386020,'2023-03-18 07:09:45',1679123112816,1,NULL,'回复在线提问',NULL);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values 
(1,'picture1','upload/picture1.jpg'),
(2,'picture2','upload/picture2.jpg'),
(3,'picture3','upload/1679123346341.png');

/*Table structure for table `gongjiaochexinxi` */

DROP TABLE IF EXISTS `gongjiaochexinxi`;

CREATE TABLE `gongjiaochexinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cheliangbianhao` varchar(200) DEFAULT NULL COMMENT '车辆编号',
  `cheliangmingcheng` varchar(200) NOT NULL COMMENT '车辆名称',
  `cheliangtupian` longtext COMMENT '车辆图片',
  `cheliangleixing` varchar(200) DEFAULT NULL COMMENT '车辆类型',
  `chepaihao` varchar(200) NOT NULL COMMENT '车牌号',
  `cheliangyanse` varchar(200) DEFAULT NULL COMMENT '车辆颜色',
  `siji` varchar(200) DEFAULT NULL COMMENT '司机',
  `zuoweishu` int(11) NOT NULL COMMENT '座位数',
  `chuchangriqi` date DEFAULT NULL COMMENT '出厂日期',
  `cheliangxiangqing` longtext COMMENT '车辆详情',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cheliangbianhao` (`cheliangbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1679123257869 DEFAULT CHARSET=utf8 COMMENT='公交车信息';

/*Data for the table `gongjiaochexinxi` */

insert  into `gongjiaochexinxi`(`id`,`addtime`,`cheliangbianhao`,`cheliangmingcheng`,`cheliangtupian`,`cheliangleixing`,`chepaihao`,`cheliangyanse`,`siji`,`zuoweishu`,`chuchangriqi`,`cheliangxiangqing`) values 
(31,'2023-03-18 07:02:20','1111111111','车辆名称1','upload/gongjiaochexinxi_cheliangtupian1.jpg,upload/gongjiaochexinxi_cheliangtupian2.jpg,upload/gongjiaochexinxi_cheliangtupian3.jpg','油电混合类','车牌号1','车辆颜色1','司机1',1,'2023-03-18','车辆详情1'),
(32,'2023-03-18 07:02:20','2222222222','车辆名称2','upload/gongjiaochexinxi_cheliangtupian2.jpg,upload/gongjiaochexinxi_cheliangtupian3.jpg,upload/gongjiaochexinxi_cheliangtupian4.jpg','油电混合类','车牌号2','车辆颜色2','司机2',2,'2023-03-18','车辆详情2'),
(33,'2023-03-18 07:02:20','3333333333','车辆名称3','upload/gongjiaochexinxi_cheliangtupian3.jpg,upload/gongjiaochexinxi_cheliangtupian4.jpg,upload/gongjiaochexinxi_cheliangtupian5.jpg','油电混合类','车牌号3','车辆颜色3','司机3',3,'2023-03-18','车辆详情3'),
(34,'2023-03-18 07:02:20','4444444444','车辆名称4','upload/gongjiaochexinxi_cheliangtupian4.jpg,upload/gongjiaochexinxi_cheliangtupian5.jpg,upload/gongjiaochexinxi_cheliangtupian6.jpg','油电混合类','车牌号4','车辆颜色4','司机4',4,'2023-03-18','车辆详情4'),
(35,'2023-03-18 07:02:20','5555555555','车辆名称5','upload/gongjiaochexinxi_cheliangtupian5.jpg,upload/gongjiaochexinxi_cheliangtupian6.jpg,upload/gongjiaochexinxi_cheliangtupian7.jpg','油电混合类','车牌号5','车辆颜色5','司机5',5,'2023-03-18','车辆详情5'),
(36,'2023-03-18 07:02:20','6666666666','车辆名称6','upload/gongjiaochexinxi_cheliangtupian6.jpg,upload/gongjiaochexinxi_cheliangtupian7.jpg,upload/gongjiaochexinxi_cheliangtupian8.jpg','油电混合类','车牌号6','车辆颜色6','司机6',6,'2023-03-18','车辆详情6'),
(37,'2023-03-18 07:02:20','7777777777','车辆名称7','upload/gongjiaochexinxi_cheliangtupian7.jpg,upload/gongjiaochexinxi_cheliangtupian8.jpg,upload/gongjiaochexinxi_cheliangtupian9.jpg','油电混合类','车牌号7','车辆颜色7','司机7',7,'2023-03-18','车辆详情7'),
(38,'2023-03-18 07:02:20','8888888888','车辆名称8','upload/gongjiaochexinxi_cheliangtupian8.jpg,upload/gongjiaochexinxi_cheliangtupian9.jpg,upload/gongjiaochexinxi_cheliangtupian10.jpg','油电混合类','车牌号8','车辆颜色8','司机8',8,'2023-03-18','车辆详情8'),
(1679123257868,'2023-03-18 07:07:37','1679123225643','某车辆','upload/1679123232615.jpg','油车类','京A6666','蓝色','测试1',30,'2023-02-26','<p>编辑</p><p><img src=\"http://localhost:8080/springboot097f4/upload/1679123256198.jpg\"></p>');

/*Table structure for table `gongjiaoluxian` */

DROP TABLE IF EXISTS `gongjiaoluxian`;

CREATE TABLE `gongjiaoluxian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xianlubianhao` varchar(200) DEFAULT NULL COMMENT '线路编号',
  `xianlumingcheng` varchar(200) DEFAULT NULL COMMENT '线路名称',
  `xianlutupian` longtext COMMENT '线路图片',
  `piaojia` float DEFAULT NULL COMMENT '票价',
  `banci` varchar(200) DEFAULT NULL COMMENT '班次',
  `fachejiange` varchar(200) DEFAULT NULL COMMENT '发车间隔',
  `qishidian` varchar(200) DEFAULT NULL COMMENT '起始点',
  `tujingdi` varchar(200) DEFAULT NULL COMMENT '途径地',
  `zhongzhidian` varchar(200) DEFAULT NULL COMMENT '终止点',
  `cheliangmingcheng` varchar(200) DEFAULT NULL COMMENT '车辆名称',
  `chepaihao` varchar(200) DEFAULT NULL COMMENT '车牌号',
  `luxianxiangqing` longtext COMMENT '路线详情',
  `gengxinshijian` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xianlubianhao` (`xianlubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1679123302354 DEFAULT CHARSET=utf8 COMMENT='公交路线';

/*Data for the table `gongjiaoluxian` */

insert  into `gongjiaoluxian`(`id`,`addtime`,`xianlubianhao`,`xianlumingcheng`,`xianlutupian`,`piaojia`,`banci`,`fachejiange`,`qishidian`,`tujingdi`,`zhongzhidian`,`cheliangmingcheng`,`chepaihao`,`luxianxiangqing`,`gengxinshijian`) values 
(21,'2023-03-18 07:02:20','1111111111','线路名称1','upload/gongjiaoluxian_xianlutupian1.jpg,upload/gongjiaoluxian_xianlutupian2.jpg,upload/gongjiaoluxian_xianlutupian3.jpg',1,'班次1','发车间隔1','起始点1','途径地1','终止点1','车辆名称1','车牌号1','路线详情1','2023-03-18'),
(22,'2023-03-18 07:02:20','2222222222','线路名称2','upload/gongjiaoluxian_xianlutupian2.jpg,upload/gongjiaoluxian_xianlutupian3.jpg,upload/gongjiaoluxian_xianlutupian4.jpg',2,'班次2','发车间隔2','起始点2','途径地2','终止点2','车辆名称2','车牌号2','路线详情2','2023-03-18'),
(23,'2023-03-18 07:02:20','3333333333','线路名称3','upload/gongjiaoluxian_xianlutupian3.jpg,upload/gongjiaoluxian_xianlutupian4.jpg,upload/gongjiaoluxian_xianlutupian5.jpg',3,'班次3','发车间隔3','起始点3','途径地3','终止点3','车辆名称3','车牌号3','路线详情3','2023-03-18'),
(24,'2023-03-18 07:02:20','4444444444','线路名称4','upload/gongjiaoluxian_xianlutupian4.jpg,upload/gongjiaoluxian_xianlutupian5.jpg,upload/gongjiaoluxian_xianlutupian6.jpg',4,'班次4','发车间隔4','起始点4','途径地4','终止点4','车辆名称4','车牌号4','路线详情4','2023-03-18'),
(25,'2023-03-18 07:02:20','5555555555','线路名称5','upload/gongjiaoluxian_xianlutupian5.jpg,upload/gongjiaoluxian_xianlutupian6.jpg,upload/gongjiaoluxian_xianlutupian7.jpg',5,'班次5','发车间隔5','起始点5','途径地5','终止点5','车辆名称5','车牌号5','路线详情5','2023-03-18'),
(26,'2023-03-18 07:02:20','6666666666','线路名称6','upload/gongjiaoluxian_xianlutupian6.jpg,upload/gongjiaoluxian_xianlutupian7.jpg,upload/gongjiaoluxian_xianlutupian8.jpg',6,'班次6','发车间隔6','起始点6','途径地6','终止点6','车辆名称6','车牌号6','路线详情6','2023-03-18'),
(27,'2023-03-18 07:02:20','7777777777','线路名称7','upload/gongjiaoluxian_xianlutupian7.jpg,upload/gongjiaoluxian_xianlutupian8.jpg,upload/gongjiaoluxian_xianlutupian9.jpg',7,'班次7','发车间隔7','起始点7','途径地7','终止点7','车辆名称7','车牌号7','路线详情7','2023-03-18'),
(28,'2023-03-18 07:02:20','8888888888','线路名称8','upload/gongjiaoluxian_xianlutupian8.jpg,upload/gongjiaoluxian_xianlutupian9.jpg,upload/gongjiaoluxian_xianlutupian10.jpg',8,'班次8','发车间隔8','起始点8','途径地8','终止点8','车辆名称8','车牌号8','路线详情8','2023-03-18'),
(1679123302353,'2023-03-18 07:08:22','1679123259451','某线路','upload/1679123276404.png',10,'测试1','15分钟','站点名称2','测试124','某站点','某车辆','京A6666','<p>测试123232</p><p><img src=\"http://localhost:8080/springboot097f4/upload/1679123300575.png\"></p>','2023-03-18');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1679123372798 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`addtime`,`title`,`introduction`,`picture`,`content`) values 
(81,'2023-03-18 07:02:20','有梦想，就要努力去实现','不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。','upload/news_picture1.jpg','<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>'),
(82,'2023-03-18 07:02:20','又是一年毕业季','又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。','upload/news_picture2.jpg','<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>'),
(83,'2023-03-18 07:02:20','挫折路上，坚持常在心间','回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。','upload/news_picture3.jpg','<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>'),
(84,'2023-03-18 07:02:20','挫折是另一个生命的开端','当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。','upload/news_picture4.jpg','<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>'),
(85,'2023-03-18 07:02:20','你要去相信，没有到不了的明天','有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。','upload/news_picture5.jpg','<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>'),
(86,'2023-03-18 07:02:20','离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端','无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。','upload/news_picture6.jpg','<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>'),
(1679123372797,'2023-03-18 07:09:31','某公告','简介','upload/1679123361228.jpg','<p>内容</p><p><img src=\"http://localhost:8080/springboot097f4/upload/1679123371022.jpg\"></p>');

/*Table structure for table `storeup` */

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1679123136929 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `storeup` */

/*Table structure for table `systemintro` */

DROP TABLE IF EXISTS `systemintro`;

CREATE TABLE `systemintro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关于我们';

/*Data for the table `systemintro` */

insert  into `systemintro`(`id`,`addtime`,`title`,`subtitle`,`content`,`picture1`,`picture2`,`picture3`) values 
(1,'2023-03-18 07:02:20','系统简介','SYSTEM INTRODUCTION','<p>测试01</p>','upload/systemintro_picture1.jpg','upload/systemintro_picture2.jpg','upload/systemintro_picture3.jpg');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values 
(1,1679123112816,'11','yonghu','用户','jqnhpqbmqcpk57lk10xgqaobi5ankslz','2023-03-18 07:05:17','2023-03-18 08:10:01'),
(2,1,'admin','users','管理员','3f5j11gl7e1hitnt7prqgliyvnb6t7s2','2023-03-18 07:06:25','2025-03-18 23:26:59'),
(3,11,'账号1','yonghu','用户','sdfbsbpvr4poc25u8dvenxma798al3s5','2025-03-18 22:22:42','2025-03-18 23:22:42');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values 
(1,'java1234','123456','管理员','2023-03-18 07:02:20');

/*Table structure for table `xianluweihu` */

DROP TABLE IF EXISTS `xianluweihu`;

CREATE TABLE `xianluweihu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `xianlumingcheng` varchar(200) DEFAULT NULL COMMENT '线路名称',
  `weihufengmian` longtext COMMENT '维护封面',
  `kaishishijian` datetime DEFAULT NULL COMMENT '开始时间',
  `jieshushijian` datetime DEFAULT NULL COMMENT '结束时间',
  `weihuneirong` longtext COMMENT '维护内容',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1679123324831 DEFAULT CHARSET=utf8 COMMENT='线路维护';

/*Data for the table `xianluweihu` */

insert  into `xianluweihu`(`id`,`addtime`,`biaoti`,`xianlumingcheng`,`weihufengmian`,`kaishishijian`,`jieshushijian`,`weihuneirong`,`faburiqi`) values 
(51,'2023-03-18 07:02:20','标题1','线路名称1','upload/xianluweihu_weihufengmian1.jpg,upload/xianluweihu_weihufengmian2.jpg,upload/xianluweihu_weihufengmian3.jpg','2023-03-18 15:02:20','2023-03-18 15:02:20','维护内容1','2023-03-18'),
(52,'2023-03-18 07:02:20','标题2','线路名称2','upload/xianluweihu_weihufengmian2.jpg,upload/xianluweihu_weihufengmian3.jpg,upload/xianluweihu_weihufengmian4.jpg','2023-03-18 15:02:20','2023-03-18 15:02:20','维护内容2','2023-03-18'),
(53,'2023-03-18 07:02:20','标题3','线路名称3','upload/xianluweihu_weihufengmian3.jpg,upload/xianluweihu_weihufengmian4.jpg,upload/xianluweihu_weihufengmian5.jpg','2023-03-18 15:02:20','2023-03-18 15:02:20','维护内容3','2023-03-18'),
(54,'2023-03-18 07:02:20','标题4','线路名称4','upload/xianluweihu_weihufengmian4.jpg,upload/xianluweihu_weihufengmian5.jpg,upload/xianluweihu_weihufengmian6.jpg','2023-03-18 15:02:20','2023-03-18 15:02:20','维护内容4','2023-03-18'),
(55,'2023-03-18 07:02:20','标题5','线路名称5','upload/xianluweihu_weihufengmian5.jpg,upload/xianluweihu_weihufengmian6.jpg,upload/xianluweihu_weihufengmian7.jpg','2023-03-18 15:02:20','2023-03-18 15:02:20','维护内容5','2023-03-18'),
(56,'2023-03-18 07:02:20','标题6','线路名称6','upload/xianluweihu_weihufengmian6.jpg,upload/xianluweihu_weihufengmian7.jpg,upload/xianluweihu_weihufengmian8.jpg','2023-03-18 15:02:20','2023-03-18 15:02:20','维护内容6','2023-03-18'),
(57,'2023-03-18 07:02:20','标题7','线路名称7','upload/xianluweihu_weihufengmian7.jpg,upload/xianluweihu_weihufengmian8.jpg,upload/xianluweihu_weihufengmian9.jpg','2023-03-18 15:02:20','2023-03-18 15:02:20','维护内容7','2023-03-18'),
(58,'2023-03-18 07:02:20','标题8','线路名称8','upload/xianluweihu_weihufengmian8.jpg,upload/xianluweihu_weihufengmian9.jpg,upload/xianluweihu_weihufengmian10.jpg','2023-03-18 15:02:20','2023-03-18 15:02:20','维护内容8','2023-03-18'),
(1679123324830,'2023-03-18 07:08:44','某某维护信息','某线路','upload/1679123312695.png','2023-03-19 02:00:00','2023-04-08 00:00:00','维护的内容','2023-03-18');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `touxiang` longtext COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1679123112817 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`xingbie`,`youxiang`,`shoujihaoma`,`touxiang`) values 
(11,'2023-03-18 07:02:20','账号1','123456','姓名1','男','773890001@qq.com','13823888881','upload/yonghu_touxiang1.jpg'),
(12,'2023-03-18 07:02:20','账号2','123456','姓名2','男','773890002@qq.com','13823888882','upload/yonghu_touxiang2.jpg'),
(13,'2023-03-18 07:02:20','账号3','123456','姓名3','男','773890003@qq.com','13823888883','upload/yonghu_touxiang3.jpg'),
(14,'2023-03-18 07:02:20','账号4','123456','姓名4','男','773890004@qq.com','13823888884','upload/yonghu_touxiang4.jpg'),
(15,'2023-03-18 07:02:20','账号5','123456','姓名5','男','773890005@qq.com','13823888885','upload/yonghu_touxiang5.jpg'),
(16,'2023-03-18 07:02:20','账号6','123456','姓名6','男','773890006@qq.com','13823888886','upload/yonghu_touxiang6.jpg'),
(17,'2023-03-18 07:02:20','账号7','123456','姓名7','男','773890007@qq.com','13823888887','upload/yonghu_touxiang7.jpg'),
(18,'2023-03-18 07:02:20','账号8','123456','姓名8','男','773890008@qq.com','13823888888','upload/yonghu_touxiang8.jpg'),
(1679123112816,'2023-03-18 07:05:12','11','11','张三','男','131@163.com','13111111111','upload/1679123110057.jpg');

/*Table structure for table `zhandianxinxi` */

DROP TABLE IF EXISTS `zhandianxinxi`;

CREATE TABLE `zhandianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhandianmingcheng` varchar(200) NOT NULL COMMENT '站点名称',
  `zhandiantupian` longtext COMMENT '站点图片',
  `zhandiandizhi` varchar(200) NOT NULL COMMENT '站点地址',
  `tujingcheliang` longtext COMMENT '途径车辆',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1679123221433 DEFAULT CHARSET=utf8 COMMENT='站点信息';

/*Data for the table `zhandianxinxi` */

insert  into `zhandianxinxi`(`id`,`addtime`,`zhandianmingcheng`,`zhandiantupian`,`zhandiandizhi`,`tujingcheliang`,`faburiqi`) values 
(41,'2023-03-18 07:02:20','站点名称1','upload/zhandianxinxi_zhandiantupian1.jpg,upload/zhandianxinxi_zhandiantupian2.jpg,upload/zhandianxinxi_zhandiantupian3.jpg','站点地址1','途径车辆1','2023-03-18'),
(42,'2023-03-18 07:02:20','站点名称2','upload/zhandianxinxi_zhandiantupian2.jpg,upload/zhandianxinxi_zhandiantupian3.jpg,upload/zhandianxinxi_zhandiantupian4.jpg','站点地址2','途径车辆2','2023-03-18'),
(43,'2023-03-18 07:02:20','站点名称3','upload/zhandianxinxi_zhandiantupian3.jpg,upload/zhandianxinxi_zhandiantupian4.jpg,upload/zhandianxinxi_zhandiantupian5.jpg','站点地址3','途径车辆3','2023-03-18'),
(44,'2023-03-18 07:02:20','站点名称4','upload/zhandianxinxi_zhandiantupian4.jpg,upload/zhandianxinxi_zhandiantupian5.jpg,upload/zhandianxinxi_zhandiantupian6.jpg','站点地址4','途径车辆4','2023-03-18'),
(45,'2023-03-18 07:02:20','站点名称5','upload/zhandianxinxi_zhandiantupian5.jpg,upload/zhandianxinxi_zhandiantupian6.jpg,upload/zhandianxinxi_zhandiantupian7.jpg','站点地址5','途径车辆5','2023-03-18'),
(46,'2023-03-18 07:02:20','站点名称6','upload/zhandianxinxi_zhandiantupian6.jpg,upload/zhandianxinxi_zhandiantupian7.jpg,upload/zhandianxinxi_zhandiantupian8.jpg','站点地址6','途径车辆6','2023-03-18'),
(47,'2023-03-18 07:02:20','站点名称7','upload/zhandianxinxi_zhandiantupian7.jpg,upload/zhandianxinxi_zhandiantupian8.jpg,upload/zhandianxinxi_zhandiantupian9.jpg','站点地址7','途径车辆7','2023-03-18'),
(48,'2023-03-18 07:02:20','站点名称8','upload/zhandianxinxi_zhandiantupian8.jpg,upload/zhandianxinxi_zhandiantupian9.jpg,upload/zhandianxinxi_zhandiantupian10.jpg','站点地址8','途径车辆8','2023-03-18'),
(1679123221432,'2023-03-18 07:07:01','某站点','upload/1679123211752.jpg','某地址','编辑站点信息','2023-03-18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
