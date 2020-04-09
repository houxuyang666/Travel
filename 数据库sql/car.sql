/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2019-07-29 11:22:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carID` int(20) NOT NULL auto_increment,
  `customerID` int(10) NOT NULL,
  `linID` varchar(36) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY  (`carID`),
  KEY `customerID` (`customerID`),
  KEY `linID` (`linID`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`linID`) REFERENCES `line` (`lineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerID` int(10) NOT NULL auto_increment,
  `account` varchar(12) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(12) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `identityID` varchar(18) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `type` int(1) default NULL,
  PRIMARY KEY  (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('14', '1546789542', '张继科', '123456', '男', '123456789456123456', '15234593421', null);
INSERT INTO `customer` VALUES ('15', '2331438941', '侯旭阳', '2331438941', '男', '41032319902045089', '15290597459', '1');
INSERT INTO `customer` VALUES ('16', '666666666', '蕲艾', '666666', '男', '410521123456783025', '18818818888', '1');
INSERT INTO `customer` VALUES ('17', '11111111111', '螯合钙', '111111', '男', '410521201423651254', '13332336693', null);
INSERT INTO `customer` VALUES ('18', '333333333', '石金枝', '333333', '女', '410581199903119032', '18564458562', null);
INSERT INTO `customer` VALUES ('19', '777777777', '王老师', '777777', '男', '410521199901244568', '13332336693', '1');
INSERT INTO `customer` VALUES ('20', '927263540', '安抚', '999999', '女', '410528465411116548', '18522226666', '1');
INSERT INTO `customer` VALUES ('21', '2345623456', '萌新', '111111', '女', '410521199902301111', '14412564565', '0');

-- ----------------------------
-- Table structure for `line`
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `lineID` varchar(12) NOT NULL,
  `lineTypeID` varchar(36) NOT NULL,
  `lineName` varchar(15) NOT NULL,
  `days` varchar(12) NOT NULL,
  `vehicle` varchar(20) NOT NULL,
  `introduction` varchar(400) default NULL,
  `reason` varchar(100) default NULL,
  `arrange` varchar(100) default NULL,
  `price` decimal(10,2) NOT NULL,
  `teamBuy` int(10) default NULL,
  `teamBuyPrice` decimal(10,2) default NULL,
  `beginTime` datetime default NULL,
  `endTime` datetime default NULL,
  `onTime` datetime NOT NULL,
  PRIMARY KEY  (`lineID`),
  KEY `lineTypeID` (`lineTypeID`),
  CONSTRAINT `line_ibfk_1` FOREIGN KEY (`lineTypeID`) REFERENCES `linetype` (`lineTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES ('0183ea9f3b82', '24bf4cdfcd2348568aceb3acf3cfb09a', '普吉岛游', '3天', '飞机', '<泰国-普吉岛机票+当地3日游>境外领队,0自费1店,全程五星酒店,3晚泳池别墅,精选2晚海景房,PP岛环游含浮潜,双体帆船蜜月湾,网红夜市,保证拼房', '【设计理念】我们深知您的假期来之不易，带您体验不同的海岛风情与市区繁华\r\n【产品亮点】牛人严选品牌，境外领队保驾护航，0自费仅1店，全程精选五星酒店', '住宿 · 埃勒卡泳池别墅(Areca Pool Villa)豪华型\r\n骑大象游果园“亲手现做泰国代表性小吃(凉拌木瓜色拉)”', '2753.00', '1', '2456.00', '2019-07-28 00:00:00', '2019-07-31 00:00:00', '2019-07-12 14:10:51');
INSERT INTO `line` VALUES ('022f36b74a63', 'd234189f86ca4c17867f0511823ac557', '马尔代夫游', '3天', '飞机', '<马尔代夫莫凡彼岛Movenpick自由行>新开六星，赠暗礁浮潜，巧克力品尝，水屋玻璃地板，第1晚马累，自营', '★所有房型均带私人泳池和大型户外甲板\r\n★入住期间可享受一次免费的暗礁浮潜体验（提前24小时预定）\r\n★提供儿童俱乐部家庭活动，亲子设施丰富，家庭出游省心省力', '住宿 · 水上泳池别墅（泻湖景观）,水上海鲜餐厅,。免费非机动水上运动：起立桨板（SUP）、皮艇、风帆冲浪（经验要求）、双体船航行（需要的经验）；机动水上运动：滑水运动、水上滑板、喷气滑雪、香蕉船等。', '3138.00', '1', '2980.00', '2019-08-05 00:00:00', '2019-08-07 00:00:00', '2019-07-11 09:29:26');
INSERT INTO `line` VALUES ('24c4224ad5e8', '24bf4cdfcd2348568aceb3acf3cfb09a', '德法意瑞游', '15天', '飞机', '<德法意瑞15日游>自营全含，直飞联运，4到5星，8/17日为25人小团，塞纳河法式餐，少女峰，金色山口，双铁，滴滴湖，新天鹅堡，拒签全退，自由活动', '❤全程4-5星酒店，升级六菜一汤1顿德国猪肘餐，1次塞纳河游船法式餐点\r\n❤精华景区：滴滴湖，德国铁路ICE+法拉利快车+金色山口景观列车，新天鹅堡入内，少女峰，贡多拉游船，', '住宿 · 参考酒店： NH POTSDAM CONFERENCE CENTER等\r\n早餐后，一览巴伐利亚的豪迈风情，慕尼黑市区观光（约1.5小时）：\r\n景点 · 新天鹅堡', '18799.00', '1', '16799.00', '2019-08-01 00:00:00', '2019-07-15 00:00:00', '2019-07-12 14:00:27');
INSERT INTO `line` VALUES ('33fefe9a69df', 'd234189f86ca4c17867f0511823ac557', '厦门鼓浪屿', '3天', '飞机', '<厦门-鼓浪屿双飞3日游>1晚鼓浪屿近海磐诺假日+2晚舒适快捷，逛八市自选海鲜加工，游艇环厦门筼筜夜景，打卡四大网红景点，品老别墅下午茶', '近3万人出游，千人点评，途牛自营产品\r\n【胡里山炮台】存放着一座世界较大的古海岸大炮——克虏伯大炮，炮台建于清朝光绪十七年', '乘车前往世界上较大的古炮——【胡里山炮台】胡里山炮台位于厦门东南端海岬突出部，毗邻厦门大学园区，三面环海，交通便利，有着得天独厚的历史和自然旅游资源，素有“八闽门户、天南锁钥”之称。', '1981.00', '1', '1683.00', '2019-07-28 00:00:00', '2019-07-31 00:00:00', '2019-07-15 09:59:36');
INSERT INTO `line` VALUES ('46d482bc1780', '24bf4cdfcd2348568aceb3acf3cfb09a', '日本北海道', '7天', '飞机', '<日本本州+北海道7日游>北海道赏富良野花田 札幌/小樽/洞爷湖/熊牧场/白色恋人工厂 美瑛清池 函馆千万夜景', '经典日本行程，一次饱览东京、北海道', '行程安排：国际段：五星航空全日空\r\n用餐安排：北海道成吉思汗烤肉、相扑火锅、和牛餐+艺伎合影、温泉料理\r\n住宿安排：保证入住两晚温泉酒店：百选名汤万世阁温泉酒店+富士山温泉酒店', '10371.00', '1', '8371.00', '2019-07-14 00:00:00', '2019-07-21 00:00:00', '2019-07-12 13:48:48');
INSERT INTO `line` VALUES ('614a3a1106f6', '24bf4cdfcd2348568aceb3acf3cfb09a', '英德意比', '15天', '飞机', '<英国+德法瑞意比15日游>欧洲自营，一价全含0自费，一次两国指纹，欧洲之星，温莎堡，大英博物馆，牛津，双宫双游船，雪朗峰，罗马深度游，比萨', '精华景点全含：温莎古堡，大英博物馆讲解、巴黎双宫，塞纳河游船，雪朗峰，新天鹅堡，布鲁日深度游，威尼斯黄金大运河，罗马深度游，比萨；', '住宿 · 伦敦雷敦宜必思尚品酒店(ibis Styles London Leyton)舒适型或HOLIDAY INN EXPRESS NEWBURY PARK', '17699.00', '1', '16799.00', '2019-08-04 00:00:00', '2019-08-19 00:00:00', '2019-07-12 14:14:28');
INSERT INTO `line` VALUES ('61cb461c7d09', 'd234189f86ca4c17867f0511823ac557', '墨尔本', '15天', '飞机', '<澳大利亚+新西兰+墨尔本+悉尼+凯恩斯+黄金海岸+南北岛15日游>途牛自营精品小团，蓝山/大堡礁//米佛峡湾/入内库克山/牧场，全国联运，2人WIFI', '可伦宾野生动物园【赠送考拉照片】+黄金海岸直升机，情人港游船(三道式西餐) & 蓝山国家公园(赠送三段美景缆车)', '绿岛大堡礁，十二门徒岩，爱歌顿农庄皇家牧场 & 毛利文化村 & 玛塔玛塔镇 霍比特人村&罗托鲁瓦天空缆车', '27642.00', '1', '25648.00', '2019-07-27 00:00:00', '2019-08-10 00:00:00', '2019-07-12 14:48:51');
INSERT INTO `line` VALUES ('6e1ae8ac53e7', '24bf4cdfcd2348568aceb3acf3cfb09a', '英国游', '15天', '飞机', '非常好', '世界这么大', '爱去哪儿都行', '17699.00', '1', null, '2019-07-27 00:00:00', '2019-08-10 00:00:00', '2019-07-15 10:25:33');
INSERT INTO `line` VALUES ('78671a8581cd', 'd234189f86ca4c17867f0511823ac557', '南宁涠洲岛', '7天', '飞机', '<南宁-北海-涠洲岛双飞7日游>全程蜜月大床/1晚景区内明仕山庄/1晚岛上圣托里尼风格住宿/1分钟步行沙滩/打卡天主教堂/岛上充足自由活动/独享私人时光', '【蜜月、闺蜜出游**，升级4大特色服务】\r\n【海上香格里拉 邂逅网红海岛】', '体验一下不一样的民俗风情。漫步穿梭于古镇的石板路上，在骑楼老巷间寻觅舌尖上的美食……让心情放缓，让脚步慢下来，你会发现，这个包容的城市带来的惊喜。', '3899.00', null, null, '2019-07-21 00:00:00', '2019-07-28 00:00:00', '2019-07-12 14:29:18');
INSERT INTO `line` VALUES ('7a6d04bb01cc', '0396959c98504e83806d0351ad0205cd', '北京游', '3天', '高铁', '京城品牌连锁酒店，暑期特约清华艺术馆，获奖导游带队，观半部清朝史之恭王府，故宫3H深度游赠珍宝馆探秘国家宝藏，含接送', '【寓教于乐】：暑期内观清华艺术馆，专业讲解员带领参观讲解，深入感受高校艺术氛围。', '天安门广场、毛主席纪念堂、故宫3H深度游赠珍宝馆、清华艺术馆（6.25-8.25含）', '2864.00', '1', '2456.00', '2019-07-30 00:00:00', '2019-08-02 00:00:00', '2019-07-12 11:07:09');
INSERT INTO `line` VALUES ('8455f6810b13', '0396959c98504e83806d0351ad0205cd', '西安游', '3天', '火车', '<西安兵马俑+华清宫+黄帝陵+壶口瀑布+延安2晚3日游>含2早4正 2晚酒店住宿 游黄河壶口 穿红军装打卡延安 特色剪纸', '【微笑】导游一站式服务、放心游！\r\n【品质】夜宿壶口高性价比快捷型酒店，游玩更舒心！', '第1天 华清宫景区，秦始皇帝陵兵马俑景区\r\n\r\n第2天 黄帝陵景区，壶口瀑布\r\n\r\n第3天 延安、西安', '3138.00', '0', '2938.00', '2019-07-16 00:00:00', '2019-07-19 00:00:00', '2019-07-09 17:50:26');
INSERT INTO `line` VALUES ('858bb5501446', 'd234189f86ca4c17867f0511823ac557', '希腊西葡牙', '15天', '飞机', '<希腊+西班牙+葡萄牙15日游>欧洲，四星，圣托里尼/米岛，悬崖酒店，升级圣岛飞巴塞，两宫入内，圣家堂/人骨教堂，巴塞一天自由活动，WiFi', 'A.升级圣岛-巴塞罗那段的航线，无须折返雅典再飞西葡段，省时省心\r\nB.西葡段经典景点，巴塞升级一天自由活动', '07:25 乘船赴圣托里尼岛 ，午餐自理\r\n15:10抵达后前往圣托里尼岛悬崖酒店（特色酒店不限星级）办理入住手续，晚餐，安排圣岛特色烤肉餐。', '19399.00', '0', '17499.00', '2019-07-13 00:00:00', '2019-07-28 00:00:00', '2019-07-12 14:23:36');
INSERT INTO `line` VALUES ('927911f9e6f0', '0396959c98504e83806d0351ad0205cd', '西藏游', '7天', '火车', '<西宁-拉萨-布达拉宫-大昭寺-林芝-大峡谷-巴松措-纳木措单卧7日游>错峰出游，畅玩世界第三极，品石锅鸡，火车进藏首先推荐', '★享受日光之城午后的阳光，喝一杯咖啡近距离感受布宫的雄伟恢宏\r\n★享特色风味大餐，领略民族美食文化\r\n★ 西藏景点：布达拉宫+大昭寺+大峡谷+巴松措+苯日神山+卡丁沟+纳木错', '住宿 · 拉萨殿影酒店或拉萨金水酒店,★牦牛肉干：牦牛常年生活在海拔3500 米以上的雪山高原地带，因此牦牛肉被认为是天然无污染、无公害的食品。拉萨藏式餐厅推荐：', '3084.00', '0', '2735.00', '2019-07-10 00:00:00', '2019-07-12 00:00:00', '2019-07-10 20:32:57');
INSERT INTO `line` VALUES ('970f424dbf62', '0396959c98504e83806d0351ad0205cd', '济南游', '1天', '火车', '<济南明府古城+趵突泉+大明湖+曲水亭街+芙蓉街1日游>明星导游深度解读明府城CityWalk城市徒步赠画舫赏荷大碗茶全程耳麦讲解', '情怀--名导·深度解读·明府城的前世今生，一日游也有内涵\r\n优雅--导游老师全程耳麦娓娓道来，您悠然细细品味', '济南、解放阁、黑虎泉、泉城广场、趵突泉、李清照纪念堂、曲水亭街、百花洲历史文化街区、济南明府古城、芙蓉街、大明湖、历下亭', '119.00', '0', '89.00', '2019-07-29 00:00:00', '2019-07-30 00:00:00', '2019-07-09 20:56:27');
INSERT INTO `line` VALUES ('9a95e22a8c1e', 'd234189f86ca4c17867f0511823ac557', '沙巴游', '7天', '飞机', '<沙巴5晚6或7日自由行>精选年度热卖酒店，香格里拉丹绒亚路/希尔顿/麦哲伦/格蓝迪斯/城市快捷，纯玩0购物，省心舒心', '★风下之乡，完美自然环境，让您享受静谧度假时光。\r\n★精选年度热卖Top5酒店，大家都选这些酒店，一定不会让您失望的！', '景点 · 美人鱼岛\r\n景点 · 沙巴回教堂\r\n景点 · 沙巴旅游局', '2864.00', '0', '2456.00', '2019-07-24 00:00:00', '2019-07-31 00:00:00', '2019-07-12 14:44:29');
INSERT INTO `line` VALUES ('9e2b4ab04ec1', '24bf4cdfcd2348568aceb3acf3cfb09a', '巴厘岛游', '15天', '高铁', '<巴厘岛机票+当地5晚6-7日游>臻程牛专,纯玩,独栋泳池别墅,海边国五希尔顿同级,蓝梦岛出海/阿勇河漂流,火山石SPA,峡谷下午茶,可选婚拍旅拍(全国出发)', '★2晚独栋泳池别墅+3晚海边国际5星酒店，私密寂静与国际化的混搭\r\n★蓝梦岛出海、阿勇河漂流、乌布体验、火山石SPA、峡谷景观专属下午茶\r\n★ 随身WIFI—免费赠送“wifi伴侣”。', '巴厘岛、阿勇河漂流、乌布皇宫、乌布苏卡哇地市场、乌布阿丽拉峡谷景观专属下午茶（百味自调茶+美味主厨糕点+JAMU特饮）或皇家彼得曼哈峡谷景观下午茶', '18799.00', '0', '16799.00', '2019-07-16 00:00:00', '2019-07-23 00:00:00', '2019-07-15 09:57:15');
INSERT INTO `line` VALUES ('ab4cc1a70932', '24bf4cdfcd2348568aceb3acf3cfb09a', '意大利游', '15天', '飞机', '<法国意大利瑞士15日游>途牛自营，一价全含，意深5晚，4000人游，铁力士峰，卢浮宫，凡尔赛，双游船，五渔村，巴黎自由活动，MALL，2人WIFI，拒签全退', '全程舒适3-4星酒店，全程用餐升级6菜1汤，特别安排一顿意大利特色餐；\r\n威尼斯DFS +佛罗伦萨The Mall：尽享意大利购物狂欢；\r\n巴黎自由活动：奥斯曼大街购物，巴黎情调。', '比萨斜塔：世界七大奇景之一，让您惊讶此倾斜而不坠之奇景，誉为工程力学的奇迹；\r\n威尼斯贡多拉游船：贡多拉是独具特色的威尼斯尖舟，乘着船身纤巧、船尾镶着金色海马的贡多拉游览威尼斯；', '12299.00', '0', '11299.00', '2019-07-21 00:00:00', '2019-08-05 00:00:00', '2019-07-12 13:54:52');
INSERT INTO `line` VALUES ('b2d5e114c656', 'd234189f86ca4c17867f0511823ac557', '西藏拉萨行', '7天', '高铁', '<西藏拉萨双飞7日自由行>身临日光之城拉萨，心享布达拉宫雄伟，酒店可选，热销酒店集结', '★西藏地区地广人稀，交通不便，您可以根据个人的需求提前预定当地游或增订当地用车，', '布达拉宫（国家AAAAA级景区）\r\n景点 · 纳木错\r\n景点 · 大昭寺', '6235.00', '1', '5935.00', '2019-07-28 00:00:00', '2019-08-04 00:00:00', '2019-07-12 14:34:45');
INSERT INTO `line` VALUES ('b684880df3bc', '0396959c98504e83806d0351ad0205cd', '云南游', '15天', '飞机', '<昆明-石林-大丽-香格里拉-泸沽湖-版纳双飞15日游>纯玩0购物，天下奇观石林，玉龙雪山， 仙境普达措， 神秘女儿国 异国风情，湿身版纳', '❥高效交通：全国飞往昆明，航班时间自由选择，专人免费接送机；\r\n❥艳遇美食：味蕾上的七彩云南，品尝6个民族（彝、白、纳西、摩梭、藏、傣族）的美食享受；', '❥倾情包含：洱海游轮畅游苍洱风光，体验一晚海边客栈；洱海骑行\r\n❥甄选景点：魅力束河古镇，洱海，仙境普达措，神秘女儿国泸沽湖、野象谷保证充分景点游览时间，安排天下奇观石林，版纳探秘', '6235.00', '1', '5935.00', '2019-08-01 00:00:00', '2019-08-15 00:00:00', '2019-07-12 13:38:49');
INSERT INTO `line` VALUES ('b9cbd0c96dcb', '0396959c98504e83806d0351ad0205cd', '成都游', '7天', '高铁', '<成都-九寨沟-黄龙-都江堰-峨眉山-乐山双飞7日游>初春游黄龙逗熊猫，近观大佛登金顶观云海，九寨沟闭园则更换牟尼沟和草原景点 ', '☆四川全景游，拜水都江堰，溜熊猫萌宝，乐山拜大佛，峨眉', ' 全国、 成都、都江堰熊猫乐园、都江堰风景区、茂县\r\n\r\n成都、都江堰熊猫乐园、都江堰风', '2864.00', '1', '2456.00', '2019-07-30 00:00:00', '2019-08-02 00:00:00', '2019-07-12 10:54:35');
INSERT INTO `line` VALUES ('c14562fc5255', 'd234189f86ca4c17867f0511823ac557', '多地游玩', '7天', '飞机', '<桂林-漓江-阳朔-象鼻山-北海-涠洲岛-南宁双飞7日游>0购物，诗意桂林，竹筏漓江，住涠洲岛1晚，专享希腊圣托里尼风格特色住宿，打开房门就看海', '(*^__^*)：广西深度游，线路休闲轻松，适合广大的家庭、老人、小孩等首次去桂林的朋友，一次出游，精华景点全部涵盖！ 北海告别跟团旅游的熙攘与喧闹，体验无拘无束的自在小假期', '“醉美桂林，水墨漓江”\r\n住宿 · 桂林香江大酒店、桂林佰宫酒店，桂林雅斯特，（如遇酒店房间满房，则为您免费升级为戴斯酒店、金皇酒店、瑞吉西山酒店）', '3267.00', '1', '2949.00', '2019-08-02 00:00:00', '2019-07-08 00:00:00', '2019-07-12 14:38:28');
INSERT INTO `line` VALUES ('cbaab2715ea7', '24bf4cdfcd2348568aceb3acf3cfb09a', '大阪游', '3天', '飞机', '<日本名古屋-大阪-箱根-东京3日游>途牛自营/和享系列,5星航司,万人出游,专职领队,螃蟹鳗鱼餐,京都奈良,奥莱嗨购,东京连住享自由,1晚温泉,赠WIFI', '❤住宿保障：全程舒适型住宿，东京地区两晚酒店连住，保证一晚温泉酒店\r\n❤自由活动保障：AB线东京1天自由活动，C线东京1天+大阪1天自由活动', '❤领队保障：途牛专职领队，经验丰富，提供优质舒心的服务\r\n❤机票航司保障：波音787-10梦幻新型客机，五星EY阿提哈德航空，280座大机型更舒适，早去，晚回。', '4864.00', '1', '4522.00', '2019-07-22 00:00:00', '2019-07-25 00:00:00', '2019-07-12 13:51:55');
INSERT INTO `line` VALUES ('d223207cc3d8', '0396959c98504e83806d0351ad0205cd', '上海', '3天', '火车', '<上海迪士尼乐园+苏沪杭+乌镇+南浔双飞3日游>0购物真心纯玩，Disney1日Free，酒店往返迪士尼无忧接送，一天一座城，漫漫游江南', '2、畅游迪士尼、开启绮梦之旅。', ' 上海、苏州、乌镇、 杭州', '1655.00', '0', null, '2019-07-10 00:00:00', '2019-07-12 00:00:00', '2019-07-09 17:51:49');
INSERT INTO `line` VALUES ('e2ab7a5a1884', 'd234189f86ca4c17867f0511823ac557', '湖南游', '3天', '高铁', '<张家界-天门山-凤凰古城3日游>牛专0购，含湘西凤凰9景/沱江泛舟，宿古城赏夜景，高空双玻体验/打卡芙蓉镇，长沙进怀化出/不走回头路，车票自选', '1、大峡谷玻璃桥VS天门山玻璃栈道，两大玻璃桥挑战，惊险刺激；\r\n2、全程舒适旅游大巴接送，景点安排劳逸结合，让您体验一百分的品质线路', '长沙+张家界+凤凰古城全线，高性价比，一次出游走遍知名景点；\r\n行程中景区门票全含，无需二次消费（景区小交通除外），是您出游必选的高性价比产品。', '2202.00', null, null, '2019-07-31 00:00:00', '2019-08-02 00:00:00', '2019-07-12 14:57:01');
INSERT INTO `line` VALUES ('e2fd21a6ce31', '0396959c98504e83806d0351ad0205cd', '乌镇三日游', '3天', '高铁', '<杭州西湖-乌镇西栅-西塘3日游>飞机高铁任选，0购物，枕乌镇赏夜景，送西塘网红小吃，登雷峰塔，品特色御茶宴', '❤游览华东精华四西（西湖、西栅、西塘、西溪），登雷峰塔，让您江南不枉此行。\r\n❤非节假日夜宿乌镇景区外，不限集合时间点，吃喝玩乐不限时，尽情体会西栅美景，做小镇居民，过一段远离城市的田园生活。', '沿途景点：\r\n第1天 全国各地、杭州、乌镇\r\n\r\n第2天 乌镇、西塘、杭州\r\n\r\n第3天 杭州、全国各地', '1344.00', '1', '1240.00', '2019-08-01 00:00:00', '2019-07-03 00:00:00', '2019-07-12 10:22:03');
INSERT INTO `line` VALUES ('ecfbf70034e6', '0396959c98504e83806d0351ad0205cd', '长白山游', '15天', '高铁', '<沈阳+长春+吉林+长白山+镜泊湖+哈尔滨-五大连池-扎龙湿地+呼伦贝尔+海拉尔+北极村双飞14日游>4省连线，0购物，东北特色餐，畅游不停', '❤长白山——中国满族的发祥地和满族文化圣山\r\n❤镜泊湖——北方著名的风景区和避暑胜地，被誉为“北方的西湖”。\r\n❤哈尔滨——北国一颗闪亮的明珠，松花江蜿蜒而过，倒映出她独特的风采。\r\n❤呼伦贝尔草原—', '长春、红旗村（400公里，约5小时）、长白山(70公里，约1.5小时)长白山、敦化（170公里，约2.5小时）\r\n\r\n第5天 敦化、镜泊湖（130公里，约1.5小时）、哈尔滨（420公里，约4.5小时', '2864.00', '1', '2456.00', '2019-07-30 00:00:00', '2019-08-02 00:00:00', '2019-07-12 10:55:41');
INSERT INTO `line` VALUES ('ed98d3f1bd8f', 'd234189f86ca4c17867f0511823ac557', '圣托里尼', '15天', '飞机', '<希腊圣托里尼+法国+瑞士+意大利15日游>超千人出游，内陆加飞，三四星，法瑞意0自费，铁力士，金色山口，庞贝古城，自由活动，特色餐', '【优质行程】希腊半自由行，拥抱圣岛之绝美；法意瑞段全含，轻松体验三国之经典；\r\n【酒店升级】希腊&意大利四星，住的舒心，玩的开心', '参观世界七大人工建筑奇景—雅典卫城（入内）希腊的首都—雅典，也是希腊大的城市和工业中心。山海掩映，阳光璀璨，素以欧洲文明的摇篮、丰富的历史遗迹而著称，清新的空气、宜人的气候也闻名于世', '17899.00', '1', '16799.00', '2019-07-16 00:00:00', '2019-07-31 00:00:00', '2019-07-12 14:41:14');
INSERT INTO `line` VALUES ('ee6c7e8529a5', '24bf4cdfcd2348568aceb3acf3cfb09a', '柬埔寨游', '3天', '高铁', '<柬埔寨暹粒机票+当地3日游>纯玩无购物，全国出发，轻享精致小团，畅游大小吴哥/罗洛士遗址群，三重特色美食满足味蕾', '【纯玩之旅】全程0购物店，真正把时间还给游客，畅游探秘吴哥。\r\n【清凉一夏】市区四星酒店，全部带游泳池，酒店免费WIFI。', '住宿 · 吴哥时代酒店(Angkor Era Hotel)豪华型或巴勇时代酒店 Bayon Era Hotel或太平洋温泉酒店(Pacific Hotel & Spa)豪华型或吴哥奇迹温泉度假村', '2074.00', '1', '1899.00', '2019-07-16 00:00:00', '2019-07-19 00:00:00', '2019-07-12 14:07:12');
INSERT INTO `line` VALUES ('f38638684d91', '24bf4cdfcd2348568aceb3acf3cfb09a', '泰国曼谷游', '7天', '飞机', '<泰国曼谷-芭提雅机票+当地6晚7日游>陈小春推荐万人游+全程5星+A线0购物0自费保证2晚香格里拉或悦榕庄+B线1站店+祈福泼水骑大象+抖音火车夜市', '✔承诺1：A线真纯玩0自费，全程5星，保证1晚香格里拉/万豪/悦榕庄酒店！\r\n✔承诺2：B线仅1站店，全程入住五星酒店，光海鲜咖喱餐，性价比之选！', '♫【舌尖体验】甄选特色餐厅，升级1顿泰式古法圆餐，品味一场舌尖美食。\r\n♫【阳光海滩】出海沙美岛，感受如面粉一样细嫩的海沙，尽享南国热带的海洋魅力。', '3941.00', '1', '3765.00', '2019-07-28 00:00:00', '2019-08-03 00:00:00', '2019-07-12 14:03:51');
INSERT INTO `line` VALUES ('f8deddfcdf7e', '24bf4cdfcd2348568aceb3acf3cfb09a', '新西兰游', '15天', '飞机', '<新西兰北岛+南岛深度15日游>途牛自营纯玩/19人精品团/观星追鲸/入住梯卡坡/双冰川库克山/萤火虫霍比特/缆车农庄/8菜1汤7顿特色餐/全国联运2人WiFi', '❤南岛深度：主打凯库拉追鲸+梯卡坡浪漫观星，双冰川冰湖库克山，6大湖泊\r\n❤北岛精华：萤火虫洞，霍比特村，天空缆车，农庄体验，毛利文化', '奥克兰 【天空塔晚餐】\r\n住宿 · 萨里酒店(The Surrey Hotel)高档型或外埔纳会议酒店(Waipuna Hotel & Conference Centre)高档型', '21199.00', '1', '19888.00', '2019-08-02 00:00:00', '2019-07-16 00:00:00', '2019-07-12 14:19:54');
INSERT INTO `line` VALUES ('fdb1b14498b0', '0396959c98504e83806d0351ad0205cd', '北京游', '7天', '高铁', '<北京双高或双动7日游>自营倾情打造/牛气服务0暗店/热销4年纯玩精品，故宫上新了/深度游3H(含珍宝馆)，获奖导游精讲漫游，网红餐厅特色体验', '❤住的“安心”—安排商业圈附近五星/高档酒店，中西自助高档早餐\r\n❤吃的“欢心”—4顿风味地道的特色餐，餐标新升级', '天安门广场、人民英雄纪念碑、毛主席纪念堂、外观人民大会堂、故宫深度游、王府井 升旗仪式、八达岭长城、外观鸟巢水立方 颐和园、外观清华或北大、、、', '3350.00', '1', '3088.00', '2019-07-28 00:00:00', '2019-08-04 00:00:00', '2019-07-12 10:47:56');

-- ----------------------------
-- Table structure for `linetype`
-- ----------------------------
DROP TABLE IF EXISTS `linetype`;
CREATE TABLE `linetype` (
  `lineTypeID` varchar(36) NOT NULL,
  `typeName` varchar(10) NOT NULL,
  `time` datetime NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY  (`lineTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linetype
-- ----------------------------
INSERT INTO `linetype` VALUES ('0396959c98504e83806d0351ad0205cd', '境内游', '2019-07-09 08:48:33', '无标题.png');
INSERT INTO `linetype` VALUES ('24bf4cdfcd2348568aceb3acf3cfb09a', '境外游', '2019-07-09 08:36:22', '3.jpg');
INSERT INTO `linetype` VALUES ('7000e268790e4e8f87e5fe5b1a867526', '市区游', '2019-07-19 14:53:33', 'con2-r1.jpg');
INSERT INTO `linetype` VALUES ('d234189f86ca4c17867f0511823ac557', '热门游', '2019-07-09 19:44:49', 'bg.jpg');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `odID` varchar(36) NOT NULL,
  `customerID` int(10) NOT NULL,
  `lineName` varchar(15) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `orderDate` datetime NOT NULL,
  `travelDate` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `lineID` varchar(36) NOT NULL,
  `state` int(10) default NULL,
  PRIMARY KEY  (`odID`),
  KEY `customerID` (`customerID`),
  KEY `lineID` (`lineID`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('38cd52089f4b4ebaae', '14', '普吉岛游', '2753.00', '2019-07-24 19:24:46', '2019-07-28 00:00:00', '2456.00', '0183ea9f3b82', '1');
INSERT INTO `orderdetail` VALUES ('4bfa0a6b0c7e4d5f85', '14', '大阪游', '4864.00', '2019-07-24 19:24:46', '2019-07-22 00:00:00', '4522.00', 'cbaab2715ea7', '1');
INSERT INTO `orderdetail` VALUES ('5cf6328daf08492ea5', '14', '厦门鼓浪屿', '1981.00', '2019-07-19 14:58:35', '2019-07-28 00:00:00', '1683.00', '33fefe9a69df', '1');
INSERT INTO `orderdetail` VALUES ('80ee71ad4ad744708b', '14', '墨尔本', '27642.00', '2019-07-24 19:24:46', '2019-07-27 00:00:00', '25648.00', '61cb461c7d09', '1');
INSERT INTO `orderdetail` VALUES ('c58ff3e533184559ae', '14', '英德意比', '17699.00', '2019-07-19 14:58:35', '2019-08-04 00:00:00', '16799.00', '614a3a1106f6', '1');
INSERT INTO `orderdetail` VALUES ('e08481f6b3644fc99c', '14', '普吉岛游', '2753.00', '2019-07-24 19:24:46', '2019-07-28 00:00:00', '2456.00', '0183ea9f3b82', '1');

-- ----------------------------
-- Table structure for `ot_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ot_detail`;
CREATE TABLE `ot_detail` (
  `otID` int(10) NOT NULL auto_increment,
  `odID` varchar(36) NOT NULL,
  `touristID` varchar(36) NOT NULL,
  PRIMARY KEY  (`otID`),
  KEY `odID` (`odID`),
  KEY `touristID` (`touristID`),
  CONSTRAINT `ot_detail_ibfk_1` FOREIGN KEY (`odID`) REFERENCES `orderdetail` (`odID`),
  CONSTRAINT `ot_detail_ibfk_2` FOREIGN KEY (`touristID`) REFERENCES `tourist` (`touristID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `pictyreID` int(10) NOT NULL auto_increment,
  `introduction` varchar(20) default NULL,
  `name` varchar(20) NOT NULL,
  `lineID` varchar(36) NOT NULL,
  PRIMARY KEY  (`pictyreID`),
  KEY `lineID` (`lineID`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('40', '颐和园', '147.jpg', '7a6d04bb01cc');
INSERT INTO `picture` VALUES ('41', '水声潺潺', '124.jpg', '7a6d04bb01cc');
INSERT INTO `picture` VALUES ('42', '小路悠悠', '153.jpg', '7a6d04bb01cc');
INSERT INTO `picture` VALUES ('43', '依山傍水', '111.jpg', '7a6d04bb01cc');
INSERT INTO `picture` VALUES ('44', '山水图', '142.jpg', '022f36b74a63');
INSERT INTO `picture` VALUES ('45', '风景图', '100.jpg', '022f36b74a63');
INSERT INTO `picture` VALUES ('46', '沙滩', '106.jpg', '022f36b74a63');
INSERT INTO `picture` VALUES ('47', '海岸', '102.jpg', '022f36b74a63');
INSERT INTO `picture` VALUES ('48', '风景如画', '107.jpg', 'e2fd21a6ce31');
INSERT INTO `picture` VALUES ('49', '小桥', '140.jpg', 'e2fd21a6ce31');
INSERT INTO `picture` VALUES ('50', '流水', '128.jpg', 'e2fd21a6ce31');
INSERT INTO `picture` VALUES ('51', '人家', '113.jpg', 'e2fd21a6ce31');
INSERT INTO `picture` VALUES ('52', '天安门', '800.jpg', 'fdb1b14498b0');
INSERT INTO `picture` VALUES ('53', '好山好水', 'A.jpg', 'fdb1b14498b0');
INSERT INTO `picture` VALUES ('54', '层峦叠嶂', 'BACK.jpg', 'fdb1b14498b0');
INSERT INTO `picture` VALUES ('55', '湖泊', '150.jpg', 'fdb1b14498b0');
INSERT INTO `picture` VALUES ('56', '住宿', '108.jpg', '970f424dbf62');
INSERT INTO `picture` VALUES ('57', '山水', '127.jpg', '970f424dbf62');
INSERT INTO `picture` VALUES ('58', '山山水水', '132.jpg', '970f424dbf62');
INSERT INTO `picture` VALUES ('59', '风景', '135.jpg', '970f424dbf62');
INSERT INTO `picture` VALUES ('60', '明珠', 'scroll5.jpg', 'd223207cc3d8');
INSERT INTO `picture` VALUES ('61', '夜景', 'scroll7.jpg', 'd223207cc3d8');
INSERT INTO `picture` VALUES ('62', '酒店', 'tg01.jpg', 'd223207cc3d8');
INSERT INTO `picture` VALUES ('63', '海边', 'scroll6.jpg', 'd223207cc3d8');
INSERT INTO `picture` VALUES ('64', '风景', '110.jpg', '8455f6810b13');
INSERT INTO `picture` VALUES ('65', '山峰', '122.jpg', '8455f6810b13');
INSERT INTO `picture` VALUES ('66', '沝水', '126.jpg', '8455f6810b13');
INSERT INTO `picture` VALUES ('67', '奇观', '152.jpg', '8455f6810b13');
INSERT INTO `picture` VALUES ('68', '沙漠', 'a6.jpg', '927911f9e6f0');
INSERT INTO `picture` VALUES ('69', '建筑', 'pic6.jpg', '927911f9e6f0');
INSERT INTO `picture` VALUES ('70', '建筑', 'scroll8.jpg', '927911f9e6f0');
INSERT INTO `picture` VALUES ('71', '建筑', 'pic1.jpg', '927911f9e6f0');
INSERT INTO `picture` VALUES ('72', '山水', '121.jpg', 'b9cbd0c96dcb');
INSERT INTO `picture` VALUES ('73', '房子', '129.jpg', 'b9cbd0c96dcb');
INSERT INTO `picture` VALUES ('74', '风景如画', '134.jpg', 'b9cbd0c96dcb');
INSERT INTO `picture` VALUES ('75', '风景', '137.gif', 'b9cbd0c96dcb');
INSERT INTO `picture` VALUES ('76', '悬崖', '139.jpg', 'ecfbf70034e6');
INSERT INTO `picture` VALUES ('77', '高山', '141.jpg', 'ecfbf70034e6');
INSERT INTO `picture` VALUES ('78', '水', '148.jpg', 'ecfbf70034e6');
INSERT INTO `picture` VALUES ('79', '流水', '149.jpg', 'ecfbf70034e6');
INSERT INTO `picture` VALUES ('80', '住宿', '101.jpg', 'b684880df3bc');
INSERT INTO `picture` VALUES ('81', '风景图', '103.jpg', 'b684880df3bc');
INSERT INTO `picture` VALUES ('82', '高山', '104.jpg', 'b684880df3bc');
INSERT INTO `picture` VALUES ('83', '风景图', '105.jpg', 'b684880df3bc');
INSERT INTO `picture` VALUES ('84', '游玩', '125.jpg', '9e2b4ab04ec1');
INSERT INTO `picture` VALUES ('85', '风景图', '130.jpg', '9e2b4ab04ec1');
INSERT INTO `picture` VALUES ('86', '风景图', '131.jpg', '9e2b4ab04ec1');
INSERT INTO `picture` VALUES ('87', '夜景', '144.jpg', '9e2b4ab04ec1');
INSERT INTO `picture` VALUES ('88', '风景图', '109.jpg', '46d482bc1780');
INSERT INTO `picture` VALUES ('89', '风景图', '112.jpg', '46d482bc1780');
INSERT INTO `picture` VALUES ('90', '风景图', '123.jpg', '46d482bc1780');
INSERT INTO `picture` VALUES ('91', '风景图', '133.jpg', '46d482bc1780');
INSERT INTO `picture` VALUES ('92', '风景图', '136.jpeg', 'cbaab2715ea7');
INSERT INTO `picture` VALUES ('93', '风景图', '138.jpg', 'cbaab2715ea7');
INSERT INTO `picture` VALUES ('94', '风景图', '143.jpg', 'cbaab2715ea7');
INSERT INTO `picture` VALUES ('95', '风景图', '145.jpg', 'cbaab2715ea7');
INSERT INTO `picture` VALUES ('96', '风景图', '146.jpg', 'ab4cc1a70932');
INSERT INTO `picture` VALUES ('97', '风景图', '151.jpg', 'ab4cc1a70932');
INSERT INTO `picture` VALUES ('98', '风景图', '200.jpg', 'ab4cc1a70932');
INSERT INTO `picture` VALUES ('99', '风景图', '201.jpg', 'ab4cc1a70932');
INSERT INTO `picture` VALUES ('100', '风景图', '202.jpg', '24c4224ad5e8');
INSERT INTO `picture` VALUES ('101', '风景图', '203.jpg', '24c4224ad5e8');
INSERT INTO `picture` VALUES ('102', '风景图', '204.jpg', '24c4224ad5e8');
INSERT INTO `picture` VALUES ('103', '风景图', '205.jpg', '24c4224ad5e8');
INSERT INTO `picture` VALUES ('104', '风景图', '206.jpg', 'f38638684d91');
INSERT INTO `picture` VALUES ('105', '拍照', '207.jpg', 'f38638684d91');
INSERT INTO `picture` VALUES ('106', '风景图', '208.jpg', 'f38638684d91');
INSERT INTO `picture` VALUES ('107', '风景图', '209.jpg', 'f38638684d91');
INSERT INTO `picture` VALUES ('108', '风景图', '210.jpg', 'ee6c7e8529a5');
INSERT INTO `picture` VALUES ('109', '风景图', '211.jpg', 'ee6c7e8529a5');
INSERT INTO `picture` VALUES ('110', '风景图', '212.jpg', 'ee6c7e8529a5');
INSERT INTO `picture` VALUES ('111', '风景图', '213.jpg', 'ee6c7e8529a5');
INSERT INTO `picture` VALUES ('112', '风景图', '214.jpg', '0183ea9f3b82');
INSERT INTO `picture` VALUES ('113', '风景图', '215.jpg', '0183ea9f3b82');
INSERT INTO `picture` VALUES ('114', '风景图', '216.jpg', '0183ea9f3b82');
INSERT INTO `picture` VALUES ('115', '风景图', '217.jpg', '0183ea9f3b82');
INSERT INTO `picture` VALUES ('116', '风景图', '218.jpg', '614a3a1106f6');
INSERT INTO `picture` VALUES ('117', '风景图', '219.jpg', '614a3a1106f6');
INSERT INTO `picture` VALUES ('118', '风景图', '230.jpg', '614a3a1106f6');
INSERT INTO `picture` VALUES ('119', '风景图', '231.jpg', '614a3a1106f6');
INSERT INTO `picture` VALUES ('120', '风景图', '232.jpg', 'f8deddfcdf7e');
INSERT INTO `picture` VALUES ('121', '风景图', '234.jpg', 'f8deddfcdf7e');
INSERT INTO `picture` VALUES ('122', '风景图', '235.jpg', 'f8deddfcdf7e');
INSERT INTO `picture` VALUES ('123', '风景图', '236.jpg', 'f8deddfcdf7e');
INSERT INTO `picture` VALUES ('124', '拍照', '237.jpg', '858bb5501446');
INSERT INTO `picture` VALUES ('125', '风景图', '238.jpg', '858bb5501446');
INSERT INTO `picture` VALUES ('126', '游玩', '239.jpg', '858bb5501446');
INSERT INTO `picture` VALUES ('127', '住宿', '240.jpg', '858bb5501446');
INSERT INTO `picture` VALUES ('128', '风景图', '244.jpg', '78671a8581cd');
INSERT INTO `picture` VALUES ('129', '风景图', '243.jpg', '78671a8581cd');
INSERT INTO `picture` VALUES ('130', '风景图', '242.jpg', '78671a8581cd');
INSERT INTO `picture` VALUES ('131', '风景图', '245.jpg', '78671a8581cd');
INSERT INTO `picture` VALUES ('132', '西藏', '241.jpg', 'b2d5e114c656');
INSERT INTO `picture` VALUES ('133', '风景图', '246.jpg', 'b2d5e114c656');
INSERT INTO `picture` VALUES ('134', '风景图', '247.jpg', 'b2d5e114c656');
INSERT INTO `picture` VALUES ('135', '风景图', '248.jpg', 'b2d5e114c656');
INSERT INTO `picture` VALUES ('136', '沙滩', '249.jpg', 'c14562fc5255');
INSERT INTO `picture` VALUES ('137', '风景图', '250.jpg', 'c14562fc5255');
INSERT INTO `picture` VALUES ('138', '风景图', '251.jpg', 'c14562fc5255');
INSERT INTO `picture` VALUES ('139', '风景图', '252.jpg', 'c14562fc5255');
INSERT INTO `picture` VALUES ('141', '风景图', '254.jpg', 'ed98d3f1bd8f');
INSERT INTO `picture` VALUES ('142', '水声潺潺', '255.jpg', 'ed98d3f1bd8f');
INSERT INTO `picture` VALUES ('143', '高山', '256.jpg', 'ed98d3f1bd8f');
INSERT INTO `picture` VALUES ('144', '风景图', '257.jpg', '9a95e22a8c1e');
INSERT INTO `picture` VALUES ('145', '风景图', '258.jpg', '9a95e22a8c1e');
INSERT INTO `picture` VALUES ('146', '风景图', '259.jpg', '9a95e22a8c1e');
INSERT INTO `picture` VALUES ('147', '风景图', '260.jpg', '9a95e22a8c1e');
INSERT INTO `picture` VALUES ('148', '风景图', '262.jpg', '61cb461c7d09');
INSERT INTO `picture` VALUES ('149', '风景图', '261.jpg', '61cb461c7d09');
INSERT INTO `picture` VALUES ('150', '风景图', '263.jpg', '61cb461c7d09');
INSERT INTO `picture` VALUES ('151', '水声潺潺', '264.jpg', '61cb461c7d09');
INSERT INTO `picture` VALUES ('152', '风景图', '265.jpg', '33fefe9a69df');
INSERT INTO `picture` VALUES ('153', '风景图', '266.jpg', '33fefe9a69df');
INSERT INTO `picture` VALUES ('154', '游客拍照', '267.jpg', '33fefe9a69df');
INSERT INTO `picture` VALUES ('156', '风景图', '271.jpg', 'e2ab7a5a1884');
INSERT INTO `picture` VALUES ('157', '风景图', '272.jpg', 'e2ab7a5a1884');
INSERT INTO `picture` VALUES ('158', '水声潺潺', '275.jpg', 'e2ab7a5a1884');
INSERT INTO `picture` VALUES ('159', '住宿', '273.jpg', 'e2ab7a5a1884');
INSERT INTO `picture` VALUES ('160', '风景图', '204.jpg', '6e1ae8ac53e7');
INSERT INTO `picture` VALUES ('161', '风景图', '211.jpg', '6e1ae8ac53e7');
INSERT INTO `picture` VALUES ('162', '水声潺潺', '215.jpg', '6e1ae8ac53e7');
INSERT INTO `picture` VALUES ('163', '高山', '235.jpg', '6e1ae8ac53e7');

-- ----------------------------
-- Table structure for `tourist`
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist` (
  `touristID` varchar(36) NOT NULL,
  `IDCard` varchar(36) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `realName` varchar(30) NOT NULL,
  PRIMARY KEY  (`touristID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist
-- ----------------------------
INSERT INTO `tourist` VALUES ('0cc46fbc83574b08b1006e1cb52e974c', '12312', '015265', '侯旭阳');
INSERT INTO `tourist` VALUES ('0ecad367785441088fdab84e23f4eb2e', '11111111', '11111', '1111');
INSERT INTO `tourist` VALUES ('0fe4b873ac8041b9a86806607bcc184a', '41032319980801', '15290597459', '侯旭阳');
INSERT INTO `tourist` VALUES ('176c9903a86842abb8e5b25436aca3f0', '222', '222', '222');
INSERT INTO `tourist` VALUES ('1fe192e196324a9a80e2012be4b0a418', '111111111111111111', '15290597459', '侯旭阳');
INSERT INTO `tourist` VALUES ('2bf695c1c3714e26b2ee9f2521e311e3', '40521523544444444', '18818818888', '石金枝');
INSERT INTO `tourist` VALUES ('35c45f8a46a44b458420d3fe29f8b8d2', '41032319980801', '1', '王琦');
INSERT INTO `tourist` VALUES ('35fb1ca2e315474496e4d4e8ced1304d', '4052152', '18818818', '石金枝');
INSERT INTO `tourist` VALUES ('35ff91acacd64175865643c02ec8757b', '4052152', '18818818', '石金枝');
INSERT INTO `tourist` VALUES ('40555a4a712241b6a0e1dd6180a309d0', '41032319980801', '1', '石金枝');
INSERT INTO `tourist` VALUES ('4c03476fbd6a4de4aadb95d4ab235096', '12312', '15290597459', '石金枝');
INSERT INTO `tourist` VALUES ('5854b07ef6ec40b084f1d5c91eea5168', '410523', '155555', '王');
INSERT INTO `tourist` VALUES ('5bf924090a424df78f36929e56c955bb', '41032319980801', '15290597459', '侯旭阳');
INSERT INTO `tourist` VALUES ('680398f24d5541e1bd0ef50d2b446d89', '40521523544444444', '18818818888', '石金枝');
INSERT INTO `tourist` VALUES ('7babb908cd61461ca77f00c755f59d1a', '33', '33', '2333');
INSERT INTO `tourist` VALUES ('c916612e9aa54cd6848a421d362c050f', '4105231555555,4105231666666', '1333333,155555', '王天,李超');
INSERT INTO `tourist` VALUES ('d7b2571546f24da98490e4dc794c0eea', '40521523544444444', '10212022121', '石金枝');
INSERT INTO `tourist` VALUES ('f9214febfebb47f38d219cd54e5d1747', '41032319980801', '15290597459', '侯旭阳');
