/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : waimai

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 14/09/2023 14:57:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (2, 4, '11', '0', '18050000000', '11', '北京市', '1101', '市辖区', '110102', '西城区', '123132', '1', 0);
INSERT INTO `address_book` VALUES (3, 4, '里大炮', '0', '17763631325', '42', '湖北省', '4201', '武汉市', '420102', '江岸区', '五号\n123', '2', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (11, 1, '酒水饮料', 10, 1, '2022-06-09 22:09:18', '2022-06-09 22:09:18', 1, 1);
INSERT INTO `category` VALUES (23, 1, '小炒', 1, 1, '2023-09-12 15:58:28', '2023-09-12 16:06:31', 1, 1);
INSERT INTO `category` VALUES (24, 1, '爆炒', 2, 0, '2023-09-12 15:58:36', '2023-09-12 15:58:36', 1, 1);
INSERT INTO `category` VALUES (25, 1, '剁椒', 3, 0, '2023-09-12 15:58:45', '2023-09-12 15:58:45', 1, 1);
INSERT INTO `category` VALUES (26, 1, '水煮', 1, 1, '2023-09-12 15:59:05', '2023-09-12 16:06:26', 1, 1);
INSERT INTO `category` VALUES (27, 1, '炖煲', 4, 1, '2023-09-12 16:00:18', '2023-09-12 16:06:36', 1, 1);
INSERT INTO `category` VALUES (28, 1, '主食', 5, 1, '2023-09-12 16:00:51', '2023-09-12 16:06:39', 1, 1);
INSERT INTO `category` VALUES (29, 1, '面食', 4, 1, '2023-09-12 16:01:06', '2023-09-12 16:06:35', 1, 1);
INSERT INTO `category` VALUES (30, 2, '人气套餐', 1, 1, '2023-09-12 16:30:22', '2023-09-12 16:30:37', 1, 1);
INSERT INTO `category` VALUES (32, 1, '大炒', 1, 0, '2023-09-13 18:13:01', '2023-09-13 18:13:01', 1, 1);
INSERT INTO `category` VALUES (33, 2, '美味套餐', 2, 0, '2023-09-13 18:13:37', '2023-09-13 18:13:37', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (46, '王老吉', 11, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '', 1, '2022-06-09 22:40:47', '2022-06-09 22:40:47', 1, 1);
INSERT INTO `dish` VALUES (48, '雪花啤酒', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', '', 1, '2022-06-10 09:22:54', '2022-06-10 09:22:54', 1, 1);
INSERT INTO `dish` VALUES (72, '爆炒鱼虾', 23, 20.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/f62afe19-e1db-4957-a31a-56629aa45400.jpg', '很好吃', 1, '2023-09-12 16:06:07', '2023-09-12 16:07:02', 1, 1);
INSERT INTO `dish` VALUES (73, '剁椒鱼头', 23, 33.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/f8fda064-0f46-4510-9752-8e1be5667941.jpg', '', 1, '2023-09-12 16:10:59', '2023-09-12 16:29:52', 1, 1);
INSERT INTO `dish` VALUES (74, '火辣鸡煲', 27, 25.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/3a68ee12-7bc0-450d-81af-ef270760e849.jpg', '', 1, '2023-09-12 16:12:28', '2023-09-12 16:29:51', 1, 1);
INSERT INTO `dish` VALUES (75, '火辣腊肉', 23, 17.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ef398e4c-17c9-48e8-8ce5-097def58524d.jpg', '好吃 再吃一盘', 1, '2023-09-12 16:13:09', '2023-09-12 16:29:50', 1, 1);
INSERT INTO `dish` VALUES (76, '椒香黄鱼', 23, 21.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/95b57eec-d994-4a65-9438-ae9b23994f78.jpg', '', 1, '2023-09-12 16:13:57', '2023-09-12 16:29:48', 1, 1);
INSERT INTO `dish` VALUES (77, '辣子鸡', 23, 22.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/0c2701ff-f813-4e69-82f9-7afe89e0dcd8.jpg', '', 1, '2023-09-12 16:14:42', '2023-09-12 16:29:47', 1, 1);
INSERT INTO `dish` VALUES (78, '炒鸡爪', 23, 22.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/dbe5b476-032d-4031-8af3-0ae7bf33e200.jpg', '', 1, '2023-09-12 16:15:15', '2023-09-12 16:34:19', 1, 1);
INSERT INTO `dish` VALUES (79, '麻婆豆腐', 23, 31.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/c82635ac-3a5e-4dbf-8216-97aeef787de1.jpg', '', 1, '2023-09-12 16:16:30', '2023-09-12 16:29:41', 1, 1);
INSERT INTO `dish` VALUES (80, '牛肉煲', 27, 31.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/87ecb346-6bc5-45b4-84f0-524a133de0e3.jpg', '', 1, '2023-09-12 16:19:58', '2023-09-12 16:29:40', 1, 1);
INSERT INTO `dish` VALUES (81, '水煮肉片', 26, 24.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/6e11fba6-4663-4bfc-94f2-254eb859e133.jpg', '', 1, '2023-09-12 16:20:51', '2023-09-12 16:29:39', 1, 1);
INSERT INTO `dish` VALUES (82, '水煮鱼', 26, 24.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ec1ffd0f-8dcb-49e2-b5b4-6c075e1db49e.jpg', '', 1, '2023-09-12 16:21:14', '2023-09-12 16:29:37', 1, 1);
INSERT INTO `dish` VALUES (83, '馒头', 28, 2.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed5f012e-8d75-4236-a929-e1ad9fcb8c40.png', '', 1, '2023-09-12 16:22:11', '2023-09-12 16:29:35', 1, 1);
INSERT INTO `dish` VALUES (84, '拉面面条', 29, 4.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/bc9491dc-df71-4381-af3d-8506014b266d.png', '', 1, '2023-09-12 16:25:26', '2023-09-12 16:29:23', 1, 1);
INSERT INTO `dish` VALUES (85, '米饭', 28, 2.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/35999f78-0909-40e4-892f-7a326dd2a855.png', '', 1, '2023-09-12 16:27:14', '2023-09-12 16:29:22', 1, 1);
INSERT INTO `dish` VALUES (86, '蜜汁鲍鱼', 26, 25.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/d25b753e-f219-4db9-a60a-050a64a5ed04.jpg', '', 1, '2023-09-12 16:28:45', '2023-09-12 16:29:21', 1, 1);
INSERT INTO `dish` VALUES (87, '水煮蟹', 26, 31.00, 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed78f51f-8fe7-41b1-8813-f033726a3bb5.jpg', '', 1, '2023-09-12 16:29:12', '2023-09-12 16:29:17', 1, 1);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (40, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (41, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (42, 7, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (45, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (46, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (47, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (48, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (49, 2, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (50, 4, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (51, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (52, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (109, 72, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (110, 72, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (111, 73, '', '[]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', '123456', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);
INSERT INTO `employee` VALUES (2, '王五', '123', '123456', '18111111111', '1', '111111111111111111', 1, '2023-09-06 11:10:49', '2023-09-14 14:56:48', 1, 1);
INSERT INTO `employee` VALUES (4, '里大炮', '1239745', '123456', '17765631333', '1', '111111111111111111', 1, '2023-09-13 18:14:27', '2023-09-13 18:14:27', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, '123', NULL, 1, 1, 1, '1', 1, 50.00);
INSERT INTO `order_detail` VALUES (5, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 4, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (6, '江团鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', 5, 66, NULL, '不辣', 1, 119.00);
INSERT INTO `order_detail` VALUES (7, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 6, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (8, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 7, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (9, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 8, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (10, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 9, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (11, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 10, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (12, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 11, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (13, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 11, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (14, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 12, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (15, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 13, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (16, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 14, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (17, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 15, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (18, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 16, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (19, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 17, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (20, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 18, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (21, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 19, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (22, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 20, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (23, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 21, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (24, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 22, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (25, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 23, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (26, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 24, 65, NULL, '不辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (27, '江团鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', 25, 66, NULL, '不辣', 1, 119.00);
INSERT INTO `order_detail` VALUES (28, '大鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/2f368aec-3e03-4759-ad17-50d1cf527b2d.jpg', 26, 71, NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (29, '大鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/2f368aec-3e03-4759-ad17-50d1cf527b2d.jpg', 27, 71, NULL, NULL, 4, 10.00);
INSERT INTO `order_detail` VALUES (30, '爱吃套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', 28, NULL, 34, NULL, 1, 46.00);
INSERT INTO `order_detail` VALUES (31, '爱吃套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', 29, NULL, 34, NULL, 1, 46.00);
INSERT INTO `order_detail` VALUES (32, '喜欢套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/948af90e-f806-44ae-b092-762f56167e3b.png', 29, NULL, 35, NULL, 1, 44.00);
INSERT INTO `order_detail` VALUES (33, '水煮蟹', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed78f51f-8fe7-41b1-8813-f033726a3bb5.jpg', 30, 87, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (34, '蜜汁鲍鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/d25b753e-f219-4db9-a60a-050a64a5ed04.jpg', 30, 86, NULL, NULL, 1, 25.00);
INSERT INTO `order_detail` VALUES (35, '水煮鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ec1ffd0f-8dcb-49e2-b5b4-6c075e1db49e.jpg', 30, 82, NULL, NULL, 1, 24.00);
INSERT INTO `order_detail` VALUES (36, '水煮蟹', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed78f51f-8fe7-41b1-8813-f033726a3bb5.jpg', 31, 87, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (37, '蜜汁鲍鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/d25b753e-f219-4db9-a60a-050a64a5ed04.jpg', 31, 86, NULL, NULL, 1, 25.00);
INSERT INTO `order_detail` VALUES (38, '水煮鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ec1ffd0f-8dcb-49e2-b5b4-6c075e1db49e.jpg', 31, 82, NULL, NULL, 1, 24.00);
INSERT INTO `order_detail` VALUES (39, '爱吃套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', 31, NULL, 34, NULL, 1, 46.00);
INSERT INTO `order_detail` VALUES (40, '水煮蟹', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed78f51f-8fe7-41b1-8813-f033726a3bb5.jpg', 32, 87, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (41, '蜜汁鲍鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/d25b753e-f219-4db9-a60a-050a64a5ed04.jpg', 32, 86, NULL, NULL, 1, 25.00);
INSERT INTO `order_detail` VALUES (42, '牛肉煲', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/87ecb346-6bc5-45b4-84f0-524a133de0e3.jpg', 33, 80, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (43, '火辣鸡煲', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/3a68ee12-7bc0-450d-81af-ef270760e849.jpg', 33, 74, NULL, NULL, 1, 25.00);
INSERT INTO `order_detail` VALUES (44, '火辣鸡煲', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/3a68ee12-7bc0-450d-81af-ef270760e849.jpg', 34, 74, NULL, NULL, 1, 25.00);
INSERT INTO `order_detail` VALUES (45, '米饭', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/35999f78-0909-40e4-892f-7a326dd2a855.png', 34, 85, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (46, '水煮蟹', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed78f51f-8fe7-41b1-8813-f033726a3bb5.jpg', 34, 87, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (47, '麻婆豆腐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/c82635ac-3a5e-4dbf-8216-97aeef787de1.jpg', 35, 79, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (48, '炒鸡爪', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/dbe5b476-032d-4031-8af3-0ae7bf33e200.jpg', 35, 78, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (49, '米饭', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/35999f78-0909-40e4-892f-7a326dd2a855.png', 35, 85, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (50, '炒鸡爪', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/dbe5b476-032d-4031-8af3-0ae7bf33e200.jpg', 36, 78, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (51, '米饭', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/35999f78-0909-40e4-892f-7a326dd2a855.png', 36, 85, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (52, '辣子鸡', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/0c2701ff-f813-4e69-82f9-7afe89e0dcd8.jpg', 36, 77, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (53, '炒鸡爪', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/dbe5b476-032d-4031-8af3-0ae7bf33e200.jpg', 37, 78, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (54, '米饭', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/35999f78-0909-40e4-892f-7a326dd2a855.png', 37, 85, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (55, '辣子鸡', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/0c2701ff-f813-4e69-82f9-7afe89e0dcd8.jpg', 37, 77, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (56, '拉面面条', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/bc9491dc-df71-4381-af3d-8506014b266d.png', 37, 84, NULL, NULL, 2, 4.00);
INSERT INTO `order_detail` VALUES (57, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 37, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (58, '炒鸡爪', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/dbe5b476-032d-4031-8af3-0ae7bf33e200.jpg', 38, 78, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (59, '米饭', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/35999f78-0909-40e4-892f-7a326dd2a855.png', 38, 85, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (60, '辣子鸡', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/0c2701ff-f813-4e69-82f9-7afe89e0dcd8.jpg', 38, 77, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (61, '拉面面条', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/bc9491dc-df71-4381-af3d-8506014b266d.png', 38, 84, NULL, NULL, 2, 4.00);
INSERT INTO `order_detail` VALUES (62, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 38, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (63, '水煮蟹', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed78f51f-8fe7-41b1-8813-f033726a3bb5.jpg', 38, 87, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (64, '米饭', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/35999f78-0909-40e4-892f-7a326dd2a855.png', 39, 85, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (65, '拉面面条', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/bc9491dc-df71-4381-af3d-8506014b266d.png', 39, 84, NULL, NULL, 2, 4.00);
INSERT INTO `order_detail` VALUES (66, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 39, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (67, '水煮蟹', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed78f51f-8fe7-41b1-8813-f033726a3bb5.jpg', 39, 87, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (68, '麻婆豆腐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/c82635ac-3a5e-4dbf-8216-97aeef787de1.jpg', 39, 79, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (69, '火辣腊肉', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ef398e4c-17c9-48e8-8ce5-097def58524d.jpg', 39, 75, NULL, NULL, 1, 17.00);
INSERT INTO `order_detail` VALUES (70, '剁椒鱼头', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/f8fda064-0f46-4510-9752-8e1be5667941.jpg', 39, 73, NULL, NULL, 1, 33.00);
INSERT INTO `order_detail` VALUES (71, '爱吃套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', 48, NULL, 34, NULL, 2, 46.00);
INSERT INTO `order_detail` VALUES (72, '喜欢套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/948af90e-f806-44ae-b092-762f56167e3b.png', 48, NULL, 35, NULL, 1, 44.00);
INSERT INTO `order_detail` VALUES (73, '拉面面条', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/bc9491dc-df71-4381-af3d-8506014b266d.png', 49, 84, NULL, NULL, 19, 4.00);
INSERT INTO `order_detail` VALUES (74, '麻婆豆腐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/c82635ac-3a5e-4dbf-8216-97aeef787de1.jpg', 50, 79, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (75, '炒鸡爪', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/dbe5b476-032d-4031-8af3-0ae7bf33e200.jpg', 50, 78, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (76, '拉面面条', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/bc9491dc-df71-4381-af3d-8506014b266d.png', 51, 84, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (77, '牛肉煲', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/87ecb346-6bc5-45b4-84f0-524a133de0e3.jpg', 51, 80, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (78, '火辣鸡煲', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/3a68ee12-7bc0-450d-81af-ef270760e849.jpg', 51, 74, NULL, NULL, 1, 25.00);
INSERT INTO `order_detail` VALUES (79, '麻婆豆腐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/c82635ac-3a5e-4dbf-8216-97aeef787de1.jpg', 52, 79, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (80, '炒鸡爪', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/dbe5b476-032d-4031-8af3-0ae7bf33e200.jpg', 52, 78, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (81, '辣子鸡', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/0c2701ff-f813-4e69-82f9-7afe89e0dcd8.jpg', 52, 77, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (82, '剁椒鱼头', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/f8fda064-0f46-4510-9752-8e1be5667941.jpg', 53, 73, NULL, NULL, 1, 33.00);
INSERT INTO `order_detail` VALUES (83, '火辣腊肉', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ef398e4c-17c9-48e8-8ce5-097def58524d.jpg', 53, 75, NULL, NULL, 1, 17.00);
INSERT INTO `order_detail` VALUES (84, '爆炒鱼虾', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/f62afe19-e1db-4957-a31a-56629aa45400.jpg', 53, 72, NULL, '不辣,多糖', 1, 20.00);
INSERT INTO `order_detail` VALUES (85, '爱吃套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', 54, NULL, 34, NULL, 1, 46.00);
INSERT INTO `order_detail` VALUES (86, '麻婆豆腐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/c82635ac-3a5e-4dbf-8216-97aeef787de1.jpg', 55, 79, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (87, '爱吃套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', 55, NULL, 34, NULL, 1, 46.00);
INSERT INTO `order_detail` VALUES (88, '喜欢套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/948af90e-f806-44ae-b092-762f56167e3b.png', 55, NULL, 35, NULL, 1, 44.00);
INSERT INTO `order_detail` VALUES (89, '爱吃套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', 56, NULL, 34, NULL, 1, 46.00);
INSERT INTO `order_detail` VALUES (90, '喜欢套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/948af90e-f806-44ae-b092-762f56167e3b.png', 56, NULL, 35, NULL, 1, 44.00);
INSERT INTO `order_detail` VALUES (91, '水煮蟹', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ed78f51f-8fe7-41b1-8813-f033726a3bb5.jpg', 56, 87, NULL, NULL, 1, 31.00);
INSERT INTO `order_detail` VALUES (92, '蜜汁鲍鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/d25b753e-f219-4db9-a60a-050a64a5ed04.jpg', 56, 86, NULL, NULL, 1, 25.00);
INSERT INTO `order_detail` VALUES (93, '水煮鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ec1ffd0f-8dcb-49e2-b5b4-6c075e1db49e.jpg', 56, 82, NULL, NULL, 1, 24.00);
INSERT INTO `order_detail` VALUES (94, '炒鸡爪', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/dbe5b476-032d-4031-8af3-0ae7bf33e200.jpg', 56, 78, NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (95, '爆炒鱼虾', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/f62afe19-e1db-4957-a31a-56629aa45400.jpg', 56, 72, NULL, '重辣,全糖', 1, 20.00);
INSERT INTO `order_detail` VALUES (96, '剁椒鱼头', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/f8fda064-0f46-4510-9752-8e1be5667941.jpg', 56, 73, NULL, NULL, 9, 33.00);
INSERT INTO `order_detail` VALUES (97, '火辣腊肉', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/ef398e4c-17c9-48e8-8ce5-097def58524d.jpg', 56, 75, NULL, NULL, 3, 17.00);
INSERT INTO `order_detail` VALUES (98, '椒香黄鱼', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/95b57eec-d994-4a65-9438-ae9b23994f78.jpg', 56, 76, NULL, NULL, 5, 21.00);
INSERT INTO `order_detail` VALUES (99, '拉面面条', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/bc9491dc-df71-4381-af3d-8506014b266d.png', 56, 84, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (100, '爱吃套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', 57, NULL, 34, NULL, 1, 46.00);
INSERT INTO `order_detail` VALUES (101, '喜欢套餐', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/948af90e-f806-44ae-b092-762f56167e3b.png', 58, NULL, 35, NULL, 1, 44.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '1', 5, 1, 1, '2023-09-09 11:46:31', '2023-09-09 11:46:35', 1, 1, 10.00, '1', '1', '1', '123', '', '', '', '2023-09-27 11:46:51', '2023-09-28 11:46:59', 1, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES (4, '1694421939817', 6, 4, 2, '2023-09-11 16:45:40', NULL, 1, 0, 79.00, '', '18050000000', '123132', NULL, '11', '订单超时，自动取消', NULL, '2023-09-11 17:01:00', '2023-09-11 17:45:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (5, '1694422258843', 6, 4, 2, '2023-09-11 16:50:59', '2023-09-11 17:19:04', 1, 1, 126.00, '', '18050000000', '123132', NULL, '11', '订单超时，自动取消', '订单量较多，暂时无法接单', '2023-09-12 09:57:20', '2023-09-11 17:50:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (6, '1694423969125', 6, 4, 2, '2023-09-11 17:19:29', '2023-09-11 17:29:26', 1, 1, 79.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:18', '2023-09-11 18:19:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (7, '1694479684371', 6, 4, 2, '2023-09-12 08:48:04', '2023-09-12 08:53:49', 1, 1, 75.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:16', '2023-09-12 09:48:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (8, '1694480831054', 6, 4, 2, '2023-09-12 09:07:11', '2023-09-12 09:08:50', 1, 1, 79.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:14', '2023-09-12 10:07:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (9, '1694480997879', 6, 4, 2, '2023-09-12 09:09:58', '2023-09-12 09:10:34', 1, 1, 75.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:12', '2023-09-12 10:09:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (10, '1694481072470', 6, 4, 2, '2023-09-12 09:11:12', '2023-09-12 09:11:21', 1, 1, 75.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:10', '2023-09-12 10:11:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (11, '1694481374871', 6, 4, 2, '2023-09-12 09:16:15', '2023-09-12 09:16:16', 1, 1, 148.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:08', '2023-09-12 10:16:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (12, '1694481434743', 6, 4, 2, '2023-09-12 09:17:15', '2023-09-12 09:17:16', 1, 1, 79.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:05', '2023-09-12 10:17:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (13, '1694481480726', 6, 4, 2, '2023-09-12 09:18:01', '2023-09-12 09:18:02', 1, 1, 79.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:03', '2023-09-12 10:17:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (14, '1694481519825', 6, 4, 2, '2023-09-12 09:18:40', '2023-09-12 09:18:42', 1, 1, 75.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:57:01', '2023-09-12 10:18:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (15, '1694481659561', 6, 4, 2, '2023-09-12 09:21:00', NULL, 1, 0, 79.00, '', '18050000000', '123132', NULL, '11', '订单超时，自动取消', NULL, '2023-09-12 09:36:00', '2023-09-12 10:20:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (16, '1694482034655', 6, 4, 2, '2023-09-12 09:27:15', NULL, 1, 0, 79.00, '', '18050000000', '123132', NULL, '11', '用户取消', NULL, '2023-09-12 09:27:54', '2023-09-12 10:27:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (17, '1694482085382', 6, 4, 2, '2023-09-12 09:28:05', NULL, 1, 0, 79.00, '', '18050000000', '123132', NULL, '11', '订单超时，自动取消', NULL, '2023-09-12 09:44:00', '2023-09-12 10:28:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (18, '1694482235412', 6, 4, 2, '2023-09-12 09:30:35', NULL, 1, 0, 79.00, '', '18050000000', '123132', NULL, '11', '订单超时，自动取消', NULL, '2023-09-12 09:46:00', '2023-09-12 10:30:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (19, '1694482436170', 6, 4, 2, '2023-09-12 09:33:56', '2023-09-12 09:33:57', 1, 2, 75.00, '', '18050000000', '123132', NULL, '11', '用户取消', NULL, '2023-09-12 09:35:47', '2023-09-12 10:33:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (20, '1694482562260', 5, 4, 2, '2023-09-12 09:36:02', '2023-09-12 09:36:03', 1, 1, 75.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 10:36:00', 0, '2023-09-12 09:39:22', 1, 0, 0);
INSERT INTO `orders` VALUES (21, '1694483516886', 6, 4, 2, '2023-09-12 09:51:57', '2023-09-12 09:51:58', 1, 1, 79.00, '', '18050000000', '123132', NULL, '11', '客户电话取消', NULL, '2023-09-12 09:56:31', '2023-09-12 10:51:00', 0, '2023-09-12 09:55:54', 1, 0, 0);
INSERT INTO `orders` VALUES (22, '1694483653518', 6, 4, 2, '2023-09-12 09:54:14', '2023-09-10 09:54:16', 1, 2, 95.00, '', '18050000000', '123132', NULL, '11', '用户取消', NULL, '2023-09-12 09:54:19', '2023-09-12 10:54:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (23, '1694483662823', 6, 4, 2, '2023-09-12 09:54:23', '2023-09-11 09:54:24', 1, 1, 95.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:56:57', '2023-09-12 10:54:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (24, '1694483684877', 6, 4, 2, '2023-09-12 09:54:45', '2023-09-12 09:54:46', 1, 1, 75.00, '', '18050000000', '123132', NULL, '11', NULL, '订单量较多，暂时无法接单', '2023-09-12 09:56:54', '2023-09-12 10:54:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (25, '1694489151360', 6, 4, 2, '2023-09-12 11:25:51', '2023-09-11 11:25:52', 1, 2, 126.00, '', '18050000000', '123132', NULL, '11', '用户取消', NULL, '2023-09-12 11:25:56', '2023-09-12 12:25:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (26, '1694503569163', 5, 4, 2, '2023-09-12 15:26:09', '2023-09-12 15:26:11', 1, 1, 17.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 16:26:00', 0, '2023-09-12 15:26:48', 1, 0, 0);
INSERT INTO `orders` VALUES (27, '1694506683243', 5, 4, 2, '2023-09-12 16:18:03', '2023-09-12 16:18:04', 1, 1, 50.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:18:00', 0, '2023-09-12 16:36:52', 4, 0, 0);
INSERT INTO `orders` VALUES (28, '1694507839545', 5, 4, 2, '2023-09-12 16:37:20', '2023-09-12 16:37:21', 1, 1, 53.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:37:00', 0, '2023-09-12 16:38:05', 1, 0, 0);
INSERT INTO `orders` VALUES (29, '1694507853954', 5, 4, 2, '2023-09-13 16:37:34', '2023-09-13 16:37:35', 1, 1, 98.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:37:00', 0, '2023-09-12 16:38:04', 2, 0, 0);
INSERT INTO `orders` VALUES (30, '1694507861971', 5, 4, 2, '2023-09-13 16:37:42', '2023-09-13 16:37:43', 1, 1, 89.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:37:00', 0, '2023-09-12 16:38:04', 3, 0, 0);
INSERT INTO `orders` VALUES (31, '1694508299041', 5, 4, 2, '2023-09-12 16:44:59', '2023-09-12 16:45:01', 1, 1, 136.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:44:00', 0, '2023-09-12 16:47:22', 4, 0, 0);
INSERT INTO `orders` VALUES (32, '1694508310299', 5, 4, 2, '2023-09-15 16:45:10', '2023-09-15 16:45:11', 1, 1, 64.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:45:00', 0, '2023-09-15 16:47:20', 2, 0, 0);
INSERT INTO `orders` VALUES (33, '1694508320116', 5, 4, 2, '2023-09-14 16:45:20', '2023-09-14 16:45:21', 1, 1, 64.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:45:00', 0, '2023-09-14 16:47:18', 2, 0, 0);
INSERT INTO `orders` VALUES (34, '1694508332657', 5, 4, 2, '2023-09-14 16:45:33', '2023-09-14 16:45:33', 1, 1, 67.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:45:00', 0, '2023-09-14 16:47:16', 3, 0, 0);
INSERT INTO `orders` VALUES (35, '1694508365509', 5, 4, 2, '2023-09-12 16:46:06', '2023-09-12 16:46:06', 1, 1, 64.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:46:00', 0, '2023-09-12 16:47:15', 3, 0, 0);
INSERT INTO `orders` VALUES (36, '1694508374454', 5, 4, 2, '2023-09-13 16:46:14', '2023-09-13 16:46:15', 1, 1, 55.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:46:00', 0, '2023-09-13 16:47:13', 3, 0, 0);
INSERT INTO `orders` VALUES (37, '1694508385481', 5, 4, 2, '2023-09-13 16:46:25', '2023-09-13 16:46:26', 1, 1, 70.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:46:00', 0, '2023-09-13 16:47:11', 6, 0, 0);
INSERT INTO `orders` VALUES (38, '1694508391337', 5, 4, 2, '2023-09-13 16:46:31', '2023-09-13 16:46:32', 1, 1, 102.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-12 17:46:00', 0, '2023-09-13 16:47:09', 7, 0, 0);
INSERT INTO `orders` VALUES (48, '1694567643992', 5, 4, 2, '2023-09-13 09:14:04', '2023-09-13 09:14:06', 1, 1, 145.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-13 10:14:00', 0, '2023-09-13 09:17:43', 3, 0, 0);
INSERT INTO `orders` VALUES (49, '1694567655919', 6, 4, 2, '2023-09-13 09:14:16', '2023-09-13 09:14:17', 1, 1, 101.00, '', '18050000000', '123132', NULL, '11', '不合理订单', NULL, '2023-09-13 09:17:38', '2023-09-13 10:14:00', 0, NULL, 19, 0, 0);
INSERT INTO `orders` VALUES (50, '1694567928960', 5, 4, 2, '2023-09-13 09:18:49', '2023-09-13 09:18:50', 1, 1, 61.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-13 10:18:00', 0, '2023-09-13 09:21:23', 2, 0, 0);
INSERT INTO `orders` VALUES (51, '1694567937219', 5, 4, 2, '2023-09-13 09:18:57', '2023-09-13 09:18:58', 1, 1, 69.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-13 10:18:00', 0, '2023-09-13 09:21:22', 3, 0, 0);
INSERT INTO `orders` VALUES (52, '1694567942761', 6, 4, 2, '2023-09-13 09:19:03', NULL, 1, 0, 84.00, '', '18050000000', '123132', NULL, '11', '订单超时，自动取消', NULL, '2023-09-13 09:35:00', '2023-09-13 10:19:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (53, '1694567954442', 5, 4, 2, '2023-09-13 09:19:14', '2023-09-13 09:19:16', 1, 1, 79.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-13 10:19:00', 0, '2023-09-13 09:21:22', 3, 0, 0);
INSERT INTO `orders` VALUES (54, '1694574419224', 6, 4, 2, '2023-09-13 11:06:59', '2023-09-13 11:07:02', 1, 1, 53.00, '', '18050000000', '123132', NULL, '11', NULL, '餐厅已打烊，暂时无法接单', '2023-09-13 11:07:24', '2023-09-13 12:06:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (55, '1694599338633', 5, 4, 2, '2023-09-13 18:02:19', '2023-09-13 18:02:21', 1, 1, 130.00, '', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-13 19:02:00', 0, '2023-09-13 18:02:33', 3, 0, 0);
INSERT INTO `orders` VALUES (56, '1694600390073', 5, 4, 2, '2023-09-13 18:19:50', '2023-09-13 18:19:52', 1, 1, 700.00, '多点肉', '18050000000', '123132', NULL, '11', NULL, NULL, NULL, '2023-09-13 19:19:00', 0, '2023-09-13 18:21:17', 25, 25, 1);
INSERT INTO `orders` VALUES (57, '1694600509045', 6, 4, 2, '2023-09-13 18:21:49', '2023-09-13 18:21:50', 1, 1, 53.00, '', '18050000000', '123132', NULL, '11', NULL, '菜品已销售完，暂时无法接单', '2023-09-13 18:22:03', '2023-09-13 19:21:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (58, '1694600539975', 6, 4, 2, '2023-09-13 18:22:20', '2023-09-13 18:22:21', 1, 2, 51.00, '', '18050000000', '123132', NULL, '11', '用户取消', NULL, '2023-09-13 18:22:27', '2023-09-13 19:22:00', 0, NULL, 1, 0, 0);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (34, 30, '爱吃套餐', 46.00, 1, '', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/cc5a95c7-75f2-4a39-befd-7f539c50ebc5.png', '2023-09-12 16:32:43', '2023-09-12 16:33:58', 1, 1);
INSERT INTO `setmeal` VALUES (35, 30, '喜欢套餐', 44.00, 1, '', 'https://whisperwjw.oss-cn-guangzhou.aliyuncs.com/948af90e-f806-44ae-b092-762f56167e3b.png', '2023-09-12 16:33:52', '2023-09-12 16:33:57', 1, 1);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (63, 34, 46, '王老吉', 6.00, 1);
INSERT INTO `setmeal_dish` VALUES (64, 34, 85, '米饭', 2.00, 1);
INSERT INTO `setmeal_dish` VALUES (65, 34, 77, '辣子鸡', 22.00, 1);
INSERT INTO `setmeal_dish` VALUES (66, 34, 86, '蜜汁鲍鱼', 25.00, 1);
INSERT INTO `setmeal_dish` VALUES (67, 35, 84, '拉面面条', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (68, 35, 74, '火辣鸡煲', 25.00, 1);
INSERT INTO `setmeal_dish` VALUES (69, 35, 76, '椒香黄鱼', 21.00, 1);
INSERT INTO `setmeal_dish` VALUES (70, 35, 46, '王老吉', 6.00, 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks', NULL, NULL, NULL, NULL, NULL, '2023-09-11 16:44:34');
INSERT INTO `user` VALUES (5, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks1', NULL, NULL, NULL, NULL, NULL, '2023-09-11 16:44:34');
INSERT INTO `user` VALUES (6, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks2', NULL, NULL, NULL, NULL, NULL, '2023-09-11 16:44:34');
INSERT INTO `user` VALUES (7, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks7', NULL, NULL, NULL, NULL, NULL, '2023-09-11 16:44:34');
INSERT INTO `user` VALUES (8, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks8', NULL, NULL, NULL, NULL, NULL, '2023-09-11 16:44:34');
INSERT INTO `user` VALUES (9, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-12 16:44:34');
INSERT INTO `user` VALUES (10, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-12 16:44:34');
INSERT INTO `user` VALUES (11, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-12 16:44:34');
INSERT INTO `user` VALUES (12, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-13 16:44:34');
INSERT INTO `user` VALUES (13, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-13 16:44:34');
INSERT INTO `user` VALUES (14, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-13 16:44:34');
INSERT INTO `user` VALUES (15, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-13 16:44:34');
INSERT INTO `user` VALUES (16, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-13 16:44:34');
INSERT INTO `user` VALUES (17, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-14 16:44:34');
INSERT INTO `user` VALUES (18, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-14 16:44:34');
INSERT INTO `user` VALUES (19, 'oQh-15jd9KlGR1yY27XBjNUpQ5ks9', NULL, NULL, NULL, NULL, NULL, '2023-09-15 16:44:34');

SET FOREIGN_KEY_CHECKS = 1;
