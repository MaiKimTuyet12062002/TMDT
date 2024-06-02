/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432
 Source Host           : localhost:3306
 Source Schema         : project

 Target Server Type    : MySQL
 Target Server Version : 100432
 File Encoding         : 65001

 Date: 02/06/2024 16:40:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `IdCat` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NameCat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HideCat` int NULL DEFAULT NULL,
  PRIMARY KEY (`IdCat`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('DC', 'Dreamcatcher', 0);
INSERT INTO `category` VALUES ('MK', 'Móc khóa', 0);
INSERT INTO `category` VALUES ('OP', 'Ốp lưng', 0);
INSERT INTO `category` VALUES ('SPK', 'Sản  phẩm khác', 0);
INSERT INTO `category` VALUES ('TH', 'Thiệp', 0);

-- ----------------------------
-- Table structure for detailsinvoices
-- ----------------------------
DROP TABLE IF EXISTS `detailsinvoices`;
CREATE TABLE `detailsinvoices`  (
  `IddetailIn` int NOT NULL AUTO_INCREMENT,
  `IdIn` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Idpro` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Quantity` int NULL DEFAULT NULL,
  `Price` double NULL DEFAULT NULL,
  PRIMARY KEY (`IddetailIn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detailsinvoices
-- ----------------------------
INSERT INTO `detailsinvoices` VALUES (1, '1', '1', 1, 150000);
INSERT INTO `detailsinvoices` VALUES (2, '1', '2', 2, 240000);
INSERT INTO `detailsinvoices` VALUES (3, '1', '3', 1, 250000);
INSERT INTO `detailsinvoices` VALUES (4, '2', '1', 1, 150000);
INSERT INTO `detailsinvoices` VALUES (5, '2', '55', 1, 80000);
INSERT INTO `detailsinvoices` VALUES (6, '2', '11', 2, 240000);
INSERT INTO `detailsinvoices` VALUES (7, '3', '1', 2, 150000);
INSERT INTO `detailsinvoices` VALUES (8, '3', '65', 1, 300000);
INSERT INTO `detailsinvoices` VALUES (9, '3', '4', 1, 240000);
INSERT INTO `detailsinvoices` VALUES (10, '3', '43', 1, 58000);
INSERT INTO `detailsinvoices` VALUES (11, '3', '79', 1, 77000);
INSERT INTO `detailsinvoices` VALUES (12, '4', '1', 1, 150000);
INSERT INTO `detailsinvoices` VALUES (13, '4', '81', 1, 38000);
INSERT INTO `detailsinvoices` VALUES (14, '4', '68', 1, 70000);
INSERT INTO `detailsinvoices` VALUES (15, '4', '20', 1, 30000);
INSERT INTO `detailsinvoices` VALUES (16, '5', '3', 1, 250000);
INSERT INTO `detailsinvoices` VALUES (17, '5', '4', 1, 240000);
INSERT INTO `detailsinvoices` VALUES (18, '5', '85', 4, 95000);
INSERT INTO `detailsinvoices` VALUES (19, '5', '22', 3, 20000);
INSERT INTO `detailsinvoices` VALUES (20, '5', '55', 1, 80000);
INSERT INTO `detailsinvoices` VALUES (21, '5', '43', 1, 58000);
INSERT INTO `detailsinvoices` VALUES (22, '5', '12', 1, 250000);
INSERT INTO `detailsinvoices` VALUES (23, '5', '79', 2, 77000);
INSERT INTO `detailsinvoices` VALUES (24, '6', '1', 1, 150000);
INSERT INTO `detailsinvoices` VALUES (25, '7', '1', 2, 150000);
INSERT INTO `detailsinvoices` VALUES (26, '7', '2', 1, 240000);
INSERT INTO `detailsinvoices` VALUES (27, '8', '4', 1, 240000);
INSERT INTO `detailsinvoices` VALUES (28, '9', '11', 1, 240000);

-- ----------------------------
-- Table structure for doanhso
-- ----------------------------
DROP TABLE IF EXISTS `doanhso`;
CREATE TABLE `doanhso`  (
  `IdPro` int NULL DEFAULT NULL,
  `soluong` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doanhso
-- ----------------------------
INSERT INTO `doanhso` VALUES (1, 25);
INSERT INTO `doanhso` VALUES (2, 3);
INSERT INTO `doanhso` VALUES (3, 2);
INSERT INTO `doanhso` VALUES (55, 2);
INSERT INTO `doanhso` VALUES (11, 3);
INSERT INTO `doanhso` VALUES (65, 1);
INSERT INTO `doanhso` VALUES (4, 8);
INSERT INTO `doanhso` VALUES (43, 2);
INSERT INTO `doanhso` VALUES (79, 3);
INSERT INTO `doanhso` VALUES (81, 1);
INSERT INTO `doanhso` VALUES (68, 1);
INSERT INTO `doanhso` VALUES (20, 1);
INSERT INTO `doanhso` VALUES (85, 4);
INSERT INTO `doanhso` VALUES (22, 3);
INSERT INTO `doanhso` VALUES (12, 1);
INSERT INTO `doanhso` VALUES (9, 2);

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `IdInvoice` int NOT NULL AUTO_INCREMENT,
  `NameUs` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PayType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StatusIn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Total` double NULL DEFAULT NULL,
  `Exportdate` datetime NULL DEFAULT NULL,
  `Phone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdUs` int NULL DEFAULT NULL,
  PRIMARY KEY (`IdInvoice`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invoices
-- ----------------------------
INSERT INTO `invoices` VALUES (1, 'Mai Thi', 'Đồng Nai', 'Thanh toán khi nhận hàng', 'null', 880000, '2023-05-03 21:40:37', '5456', 2);
INSERT INTO `invoices` VALUES (2, 'Thúy Diễm', 'Bình Dương', 'Thanh toán khi nhận hàng', 'null', 710000, '2023-05-03 21:42:06', '34567', 1);
INSERT INTO `invoices` VALUES (3, 'Khắc Thuận', 'Long An', 'Thanh toán khi nhận hàng', 'null', 975000, '2023-05-03 21:43:18', '5456', 3);
INSERT INTO `invoices` VALUES (4, 'Thanh Lộc', 'Thanh Hóa', 'Thanh toán khi nhận hàng', 'null', 288000, '2023-05-03 21:44:47', '68223233', 5);
INSERT INTO `invoices` VALUES (5, 'Ngọc Trần', 'Long An', 'Thanh toán khi nhận hàng', 'null', 1472000, '2023-05-03 21:49:16', '54568787', 4);
INSERT INTO `invoices` VALUES (6, 'Khắc Nhuận', 'đăng hưng phước', 'Thanh toán khi nhận hàng', 'null', 150000, '2023-05-07 16:52:57', '0363347214', 3);
INSERT INTO `invoices` VALUES (7, 'Khắc Nhuận', 'đăng hưng phước', 'Thanh toán khi nhận hàng', 'null', 540000, '2023-05-07 16:56:14', '0363347214', 3);
INSERT INTO `invoices` VALUES (8, 'kim tuyết', '202', 'tt', 'null', 240000, '2024-06-02 16:32:29', '0769965009', 12);
INSERT INTO `invoices` VALUES (9, '', 'Tỉnh/Thành Phố', 'ck', 'null', 240000, '2024-06-02 16:35:17', '', 12);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int NOT NULL,
  `level` tinyint NULL DEFAULT NULL,
  `user` int NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createAt` datetime NOT NULL DEFAULT current_timestamp,
  `status` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `IdProduct` int NOT NULL AUTO_INCREMENT,
  `IdCategory` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NameProduct` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Image` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PriceNew` int NULL DEFAULT NULL,
  `PriceOld` int NULL DEFAULT NULL,
  `QuantityStock` int NULL DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Isnew` int NULL DEFAULT NULL,
  `Discount` int NULL DEFAULT NULL,
  `HideProduct` int NULL DEFAULT 0,
  PRIMARY KEY (`IdProduct`) USING BTREE,
  INDEX `FK_IDLoai`(`IdCategory` ASC) USING BTREE,
  CONSTRAINT `FK_IDLoai` FOREIGN KEY (`IdCategory`) REFERENCES `category` (`IdCat`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'DC', 'Đại Dương', './image/dc2.jpg', 150000, 250000, 52, 'Sản phẩm được lấy ý tưởng từ hình ảnh màu xanh của nước biển kết hợp với lông vũ màu xanh khiến cho sản phẩm đẹp hơn bao giờ hết', NULL, NULL, 0);
INSERT INTO `products` VALUES (2, 'DC', 'Mị', './image/dc6.jpg', 240000, 260000, 19, 'Sản phẩm được lấy ý tưởng từ trang phục Mị của Hoàng Thùy Linh trong MV Để Mị Nói Cho Mà Nghe', NULL, NULL, 0);
INSERT INTO `products` VALUES (3, 'DC', 'Ánh Sáng', './image/dc8.jpg', 250000, 280000, 30, 'Sản phẩm được lấy ý tưởng từ tia sáng, với sự kết hợp từ lông vũ màu trắng hoa cúc trắng cùng với đèn đã tạo nên một sản phẩm tuyệt đẹp', NULL, NULL, 0);
INSERT INTO `products` VALUES (4, 'DC', 'Đêm Trăng', './image/dc11.jpg', 240000, 250000, 9, 'Hình ảnh của trăng tron và trăng khuyết được nhà thiết kế sử dụng tinh tế trong sản phẩm', 1, NULL, 0);
INSERT INTO `products` VALUES (5, 'DC', 'Cao nguyên', './image/dc7.jpg', 270000, 280000, 15, 'Sản phẩm được lấy ý tưởng từ tia sáng,Nhà thiết kế đã kết hợp từ lông vũ màu trắng cùng với hoa cúc trắng và hiệu ứng từ đèn led đã tạo nên một sản phẩm tuyệt đẹp khiến cho người khác ấn tượng từ lần đầu nhìn', NULL, NULL, 0);
INSERT INTO `products` VALUES (6, 'DC', 'Cao bồi', './image/dc4.jpg', 270000, 280000, 25, 'Hình ảnh của trăng tron và trăng khuyết được nhà thiết kế sử dụng tinh tế trong sản phẩm', NULL, NULL, 0);
INSERT INTO `products` VALUES (7, 'DC', 'Mặt trời', './image/dc3.jpg', 240000, 250000, 30, 'Mặt trời là nguồn gốc của mọi năng lượng trong cuộc sống và sự tồn tại của bạn.', NULL, NULL, 0);
INSERT INTO `products` VALUES (8, 'DC', 'Sóng biển', './image/dc5.jpg', 250000, 260000, 25, 'Sự uốn lượn của nước biển', NULL, NULL, 0);
INSERT INTO `products` VALUES (9, 'DC', 'Trời xanh', './image/dc10.jpg', 250000, 280000, 40, 'Thể hiện nhiều ý nghĩa khác nhau như hòa bình, bình yên, bao la, thanh thản… nó tạo ra cảm giác tin tưởng, hy vọng cho người nhìn', 1, NULL, 0);
INSERT INTO `products` VALUES (10, 'DC', 'Lông vũ', './image/dream1-min.jpg', 150000, 250000, 25, 'Được thiết kế đơn giản nhưng không kém phần sang trọng', NULL, NULL, 0);
INSERT INTO `products` VALUES (11, 'DC', 'Đom đóm', './image/dream2-min.jpg', 240000, 260000, -1, 'Sản phẩm được lấy ý tưởng từ hình ảnh màu xanh của nước biển kết hợp với lông vũ màu xanh khiến cho sản phẩm đẹp hơn bao giờ hết', 1, NULL, 0);
INSERT INTO `products` VALUES (12, 'DC', 'Tinh khiết', './image/dream5-min.jpg', 250000, 280000, 5, 'Sản phẩm được thiết kế màu trắng có thể xem như sự trong trắng, tươi trẻ trong mỗi người', 1, NULL, 0);
INSERT INTO `products` VALUES (13, 'DC', 'Lưới bắt giấc mơ', './image/dream7-min.jpg', 240000, 250000, 10, 'Sản phẩm được thiết kế đan nhau ví như cái lưới, nhìn rất đặc biệt khi trang trí', NULL, NULL, 0);
INSERT INTO `products` VALUES (14, 'DC', 'Ảo mộng', './image/dream8-min.jpg', 270000, 280000, 25, 'Được thiết kế rất tinh xảo và dùng màu trắng làm chủ đạo', 1, NULL, 0);
INSERT INTO `products` VALUES (15, 'DC', 'Mộng hồng', './image/dream9-min.jpg', 270000, 280000, 14, 'Vòng được dùng màu hồng thơ mộng nên tạo cảm giác dễ chịu khi nhìn vào', NULL, NULL, 0);
INSERT INTO `products` VALUES (16, 'DC', 'Ngày hội', './image/dream13-min.jpg', 240000, 250000, 25, 'Sản phẩm được thiết kế xen lẫn với những bông hoa nên nhìn thoải mái và có cảm giác như đang ở lễ hội', NULL, NULL, 0);
INSERT INTO `products` VALUES (17, 'DC', 'Trắng', './image/dream6-min.jpg', 250000, 260000, 20, 'Sản phẩm được thiết kế hoàn toàn với màu trắng tinh khiết', NULL, NULL, 0);
INSERT INTO `products` VALUES (18, 'DC', 'Chiều tà', './image/dream11.jpg', 250000, 280000, 18, 'Sản phẩm được thiết kế với 1 màu tối, giúp người nhìn thoải mái thư giãn sau ngày làm việc mệt mỏi', 1, NULL, 0);
INSERT INTO `products` VALUES (19, 'MK', 'Móc khóa gỗ', './image/mockhoago.jpg', 42000, 58000, 17, 'Với thiết kế tinh tế và nhiều mẫu như : mảnh ghép , hình tròn.Được in nhiều chi tiết trên móc khóa không tạo cảm giác nhàm chán.\r\nNếu có thêm yêu cầu hoặc thắc mắc, hãy nhắn tin cho mình nhé!', NULL, NULL, 0);
INSERT INTO `products` VALUES (20, 'MK', 'Móc khóa lân', './image/mockhoalan.jpg', 30000, 50000, 10, 'Móc khóa được đan bằng tay với nhiều màu sắc và được kết hợp lại tạo nên 1 cái móc khóa đan rất đẹp được lấy ý tưởng từ con lân ngày tết', NULL, NULL, 0);
INSERT INTO `products` VALUES (21, 'MK', 'Móc khóa đan', './image/mockhoadan.jpg', 80000, 90000, 0, 'Móc khóa được đan bằng tay với nhiều màu sắc và được kết hợp lại tạo nên 1 cái móc khóa đan rất đẹp', NULL, NULL, 0);
INSERT INTO `products` VALUES (22, 'MK', 'Móc khóa chữ', './image/mockhoachu1.jpg', 20000, 25000, 100, 'Móc khóa được làm từ chất nhựa epoxy nên móc khóa có độ trong suốt với những màu sắc lấp lánh cũng các họa tiết khác đã làm nên món khóa nhìn sắc xảo như vậy.', 1, NULL, 0);
INSERT INTO `products` VALUES (23, 'MK', 'Móc khóa hình nhân', './image/mockhoahinh.jpg', 35000, 55000, 50, 'Móc khóa được làm từ gỗ được khắc thành nhiều hình dáng có nhiều mẫu', NULL, NULL, 0);
INSERT INTO `products` VALUES (24, 'MK', 'Móc khóa đan trắng', './image/mockhoach.jpg', 98000, 99000, 20, 'Móc khóa được đan bằng tay với nhiều màu sắc và được kết hợp lại tạo nên 1 cái móc khóa đan rất đẹp', NULL, NULL, 0);
INSERT INTO `products` VALUES (25, 'MK', 'Móc khóa ốc', './image/mockhoacollection.jpg', 80000, 90000, 50, 'Móc khóa được đan bằng len với nhiều màu sắc khác nhau giúp cho sản phẩm nhìn đẹp hơn', NULL, NULL, 0);
INSERT INTO `products` VALUES (26, 'MK', 'Móc khóa vải', './image/mockhoavai.jpg', 80000, 90000, 40, 'Móc khóa được may bằng vải với nhiều màu sắc, kiểu mẫu khác nhau giúp cho người mua dễ dàng lựa chọn những cái mình thích', NULL, NULL, 0);
INSERT INTO `products` VALUES (27, 'MK', 'Móc khóa chữ', './image/mockhoachu-min.jpg', 50000, 70000, 30, 'Móc khóa được làm từ chất nhựa epoxy nên móc khóa có độ trong suốt với những màu sắc lấp lánh cũng các họa tiết khác đã làm nên món khóa nhìn sắc xảo như vậy.', 1, NULL, 0);
INSERT INTO `products` VALUES (28, 'MK', 'Móc khóa con bò', './image/mockhoabo-min.jpg', 45000, 55000, 45, 'Móc khóa được may bằng vải với nhiều màu sắc, kiểu mẫu khác nhau giúp cho người mua dễ dàng lựa chọn những cái mình thích', 1, NULL, 0);
INSERT INTO `products` VALUES (29, 'MK', 'Móc khóa cáo', './image/mockhoacao-min.jpg', 30000, 50000, 0, 'Móc khóa được đan bằng len với nhiều màu sắc khác nhau giúp cho sản phẩm nhìn đẹp hơn', NULL, NULL, 0);
INSERT INTO `products` VALUES (30, 'MK', 'Móc khóa cỏ 4 lá', './image/mockhoaco4la-min.jpeg', 35000, 50000, 54, 'Móc khóa được đan bằng len với nhiều màu sắc khác nhau giúp cho sản phẩm nhìn đẹp hơn', NULL, NULL, 0);
INSERT INTO `products` VALUES (31, 'MK', 'Móc khóa đan dây', './image/mockhoadanday-min.jpg', 20000, 35000, 20, 'Móc khóa được đan bằng tay với nhiều màu sắc và được kết hợp lại tạo nên 1 cái móc khóa đan rất đẹp', NULL, NULL, 0);
INSERT INTO `products` VALUES (32, 'MK', 'Móc khóa con ếch', './image/mockhoaech-min.jpg', 50000, 65000, 22, 'Móc khóa được đan bằng len với nhiều màu sắc khác nhau giúp cho sản phẩm nhìn đẹp hơn', 1, NULL, 0);
INSERT INTO `products` VALUES (33, 'MK', 'Móc khóa gấu', './image/mockhoagau-min.jpg', 50000, 75000, 54, 'Móc khóa được may bằng vải với nhiều màu sắc, kiểu mẫu khác nhau giúp cho người mua dễ dàng lựa chọn những cái mình thích', NULL, NULL, 0);
INSERT INTO `products` VALUES (34, 'MK', 'Móc khóa thêu', './image/mockhoatheu.jpg', 55000, 80000, 55, 'Móc khóa được thêu với những đường chỉ tinh xảo làm nên sản phẩm tuyệt đẹp', NULL, NULL, 0);
INSERT INTO `products` VALUES (35, 'MK', 'Móc khóa len', './image/mockhoalen-min.jpg', 70000, 90000, 65, 'Móc khóa được đan bằng len với nhiều màu sắc khác nhau giúp cho sản phẩm nhìn đẹp hơn', NULL, NULL, 0);
INSERT INTO `products` VALUES (36, 'MK', 'Móc khóa sao biển', './image/mockhoacau.jpg', 98000, 99000, 15, 'Móc khóa được làm từ chất nhựa epoxy nên móc khóa có độ trong suốt với những màu sắc lấp lánh cũng các họa tiết khác đã làm nên món khóa nhìn sắc xảo như vậy.', NULL, NULL, 0);
INSERT INTO `products` VALUES (37, 'OP', 'Ốp lưng đính đá', './image/oplungdinhda.jpg', 80000, 90000, 0, 'Chiếc ốp được người thợ đính một cách kĩ càng từ nhiều loại đá và màu sắc khác nhau tạo nên một sự hài hoà của chiếc ốp', NULL, NULL, 0);
INSERT INTO `products` VALUES (38, 'OP', 'Ốp lưng hoa khô', './image/oplunghoakho.jpg', 80000, 100000, 25, 'Nếu có thêm yêu cầu hoặc thắc mắc, hãy nhắn tin cho mình nhé!', NULL, NULL, 0);
INSERT INTO `products` VALUES (39, 'OP', 'Ốp lưng BIGHERO', './image/onglungvetay.jpg', 150000, 180000, 10, 'Được lấy cảm hứng từ nhân vật trong phim hoạt hình của BigHero6 của Maverl nhà thiết kế đã tạo ra một sản phẩm xứng đáng được chốt đơn. Nếu có thêm yêu cầu hoặc thắc mắc, hãy nhắn tin cho mình nhé!', NULL, NULL, 0);
INSERT INTO `products` VALUES (40, 'OP', 'Ốp lưng len', './image/oplunglen.jpg', 38000, 50000, 10, 'Sản phẩm là sự kết hơp của len và vải lông , sự kết hợp ấy đã tạo nên một chiếc ốp tuyệt đẹp.', NULL, NULL, 0);
INSERT INTO `products` VALUES (41, 'OP', 'Ốp lưng vẽ tay', './image/onglungvetay.jpg', 38000, 58000, 25, 'Ốp lưng được vẽ tay một cách khéo léo, có thể thỏa sức sáng tạo với những mẫu không giống nhau', NULL, NULL, 0);
INSERT INTO `products` VALUES (42, 'OP', 'Ốp lưng hoạt hình', './image/oplungsilermoon.jpg', 88000, 108000, 45, 'Ốp lưng được đính thêm nhìn hình ảnh dễ thương, giúp cho điện thoại của người dùng trở nên dễ thương hơn', NULL, NULL, 0);
INSERT INTO `products` VALUES (43, 'OP', 'Ốp lưng sinh nhật', './image/oplungsinhnhat.jpg', 58000, 88000, 5, 'Sản phẩm được thiết kế đính kèm những cái bánh ngọt nhìn rất nữ tính nhưng không kém phần đặc sắc ', NULL, NULL, 0);
INSERT INTO `products` VALUES (44, 'OP', 'Ốp lưng thỏ', './image/oplungthotim.jpg', 78000, 98000, 0, 'Sản phẩm được thiết kế thêm một con thỏ nhìn rất dễ thương', NULL, NULL, 0);
INSERT INTO `products` VALUES (45, 'OP', 'Ốp lưng trong suốt', './image/oplunn.jpg', 38000, 58000, 52, 'Ốp lưng thiết kế nhựa trong suốt trên đó được thêm những chi tiết nhỏ giúp cho nhìn vào ốp lưng thêm sang trong không kém phần nào', NULL, NULL, 0);
INSERT INTO `products` VALUES (46, 'OP', 'Ốp lưng vẽ', './image/OpVe.jpg', 80000, 90000, 45, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (47, 'OP', 'Ốp lưng nơ', './image/OpNo.jpg', 80000, 100000, 40, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (48, 'OP', 'Đính hoa hồng', './image/OpHoaHong.jpg', 88000, 100000, 25, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (49, 'OP', 'Ba chú heo con', './image/OpHeo.jpg', 150000, 180000, 35, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (50, 'OP', 'Ốp bé chuột', './image/OpCHuot.jpg', 108000, 158000, 38, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (51, 'OP', 'Công chúa', './image/OpCG.jpg', 88000, 108000, 15, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (52, 'OP', 'Bươm bướm', './image/OpBuom.jpg', 58000, 88000, 25, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (53, 'OP', '2 cậu bé', './image/Op2Be.jpg', 78000, 98000, 15, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (54, 'OP', 'Ốp lưng khủng long', './image/OpBo.jpg', 38000, 58000, 58, 'Sản phẩm handmade bảo vệ điện thoại tuyệt vời đến từ NTT shop', NULL, NULL, 0);
INSERT INTO `products` VALUES (55, 'SPK', 'Keo làm ốp', './image/keolamop.jpg', 80000, 90000, 200, 'Keo làm ốp được nhập từ nước ngoài với nhiều màu sắc khác nhau phục vụ đủ mục đích sáng tạo của khách hàng', NULL, NULL, 0);
INSERT INTO `products` VALUES (56, 'SPK', 'Bộ kit làm móc khóa', './image/bokitlammockhoa.jpg', 50000, 60000, 10, '1 Set bao gồm:+Keo\r\n+Khuôn\r\n+Móc khóa\r\n+Lá,hoa khô\r\n+Cây khuấy\r\n+Ly nhựa', NULL, NULL, 0);
INSERT INTO `products` VALUES (57, 'SPK', 'Giấy Quilling', './image/giayquilling.jpg', 45000, 57000, 20, 'Một combo giấy sẽ bao gồm 10 cuộn giấy màu sắc khác nhau, giúp cho khách hàng thỏa sức sáng tạo', NULL, NULL, 0);
INSERT INTO `products` VALUES (58, 'SPK', 'Bộ kit làm móc khóa', './image/kitmockhoani.jpg', 30000, 50000, 52, 'Bộ kit này vừa đáp ứng về một cái chìa khóa đẹp mà còn đáp ứng về sở thích thực vật', NULL, NULL, 0);
INSERT INTO `products` VALUES (59, 'SPK', 'Bộ kit đầy đủ', './image/bokitmockhoa2.jpg', 80000, 90000, 30, 'Để tạo ra một cái móc khóa hoàn hảo theo sở thích của mình thì không thể thiếu bộ kit làm móc khóa này được.', NULL, NULL, 0);
INSERT INTO `products` VALUES (60, 'SPK', 'Phụ kiện làm ốp', './image/charmop.jpg', 77000, 99000, 5, 'Với những icon được tạo ra nhằm giúp cho người dùng có thể thỏa sức sáng tạo những cái ốp lưng, nhằm tạo ra những cái ốp theo sở thích của người dùng', NULL, NULL, 0);
INSERT INTO `products` VALUES (61, 'SPK', 'Bộ dụng cụ Quilling', './image/bodungcuquilling.jpg', 55000, 88000, 41, 'Giấy quilling là nguyên liệu chính trong một bức thiệp quilling', NULL, NULL, 0);
INSERT INTO `products` VALUES (62, 'SPK', 'Bộ kit làm Dreamcatcher', './image/kitdc25.jpg', 108000, 150000, 28, 'Shop chuyên bán buôn bán lẻ Dreamcatcher , lông vũ , phụ kiện làm dreamcatcher...', NULL, NULL, 0);
INSERT INTO `products` VALUES (63, 'SPK', 'Bộ kit Dreamcatcher1', './image/kitdc12.jpg', 88000, 108000, 25, 'Shop chuyên bán buôn bán lẻ Dreamcatcher , lông vũ , phụ kiện làm dreamcatcher...', NULL, NULL, 0);
INSERT INTO `products` VALUES (64, 'SPK', 'Bộ kit đầy đủ', './image/kitmockhoa5-min.jpg', 200000, 300000, 15, 'Sản phẩm giúp bạn có thể làm những cái móc khóa theo sở thích cá nhân, tự do sáng tạo', NULL, NULL, 0);
INSERT INTO `products` VALUES (65, 'SPK', 'Bộ kit làm móc khóa', './image/kitmockhoa6-min.jpg', 300000, 450000, 18, 'Sản phẩm giúp bạn có thể làm những cái móc khóa theo sở thích cá nhân, tự do sáng tạo', NULL, NULL, 0);
INSERT INTO `products` VALUES (66, 'SPK', 'Bộ kit làm mặt dây chuyền', './image/kitmockhoa7-min.jpg', 80000, 90000, 20, 'Với những dụng cụ và nguyên liệu sẽ giúp bạn sáng tạo ra những mặt dây chuyền thật đẹp và đầy sáng tạo', NULL, NULL, 0);
INSERT INTO `products` VALUES (67, 'SPK', 'Kit làm handmade', './image/kitmockhoa8-min.jpg', 200000, 230000, 25, 'Sản phẩm sẽ giúp cho bạn thỏa sức thiết kế handmade', NULL, NULL, 0);
INSERT INTO `products` VALUES (68, 'SPK', 'Bộ kit làm chữ trong suốt', './image/kitmockhoa9-min.jpg', 70000, 90000, 55, 'Đến với sản phẩm nhà NTT bạn sẽ được thỏa sức sáng tạo với những đam mê tự mình làm ra sản phẩm độc đáo', NULL, NULL, 0);
INSERT INTO `products` VALUES (69, 'SPK', 'Kit làm phụ kiện', './image/kitmockhoa10-min.jpg', 90000, 100000, 51, 'Bộ kit giúp bạn tạo ra những sản phẩm hoặc phụ kiện dùng để trang trí và sử dụng', NULL, NULL, 0);
INSERT INTO `products` VALUES (70, 'SPK', 'Dụng cụ làm móc khóa con mèo', './image/kitmockhoa11-min.jpg', 60000, 90000, 40, 'Với bộ dụng cụ này bạn có thể tự làm móc khóa con mèo cho mình', NULL, NULL, 0);
INSERT INTO `products` VALUES (71, 'SPK', 'Bộ kit làm móc khóa vải nỉ', './image/kitmockhoa14-min.jpg', 80000, 95000, 54, 'Đến với sản phẩm nhà NTT bạn sẽ được thỏa sức sáng tạo với những đam mê tự mình làm ra sản phẩm độc đáo', NULL, NULL, 0);
INSERT INTO `products` VALUES (72, 'SPK', 'Dụng cụ làm ốp lưng', './image/kitmockhoa13-min.jpg', 100000, 150000, 45, 'Bộ dụng cụ có thể giúp cho người dùng thỏa sức sáng tạo ra những cái ốp lưng theo đam mê và sở thích của bản thân', NULL, NULL, 0);
INSERT INTO `products` VALUES (73, 'TH', 'Thiệp bó hoa', './image/quillingbohoa.jpg', 48000, 58000, 52, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (74, 'TH', 'Thiệp cây thông', './image/quillingcaythong.jpg', 50000, 80000, 15, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (75, 'TH', 'Thiệp hoa hồng', './image/quillinghoahong.jpg', 60000, 70000, 20, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (76, 'TH', 'Thiệp mẹ', './image/quillingme.jpg', 55000, 88000, 18, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (77, 'TH', 'Thiệp hoa sen', './image/quillinghoasen.jpg', 65000, 87000, 25, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (78, 'TH', 'Thiệp giáng sinh', './image/quillingthiepgiangsinh.jpg', 48000, 60000, 24, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (79, 'TH', 'Thiệp trái tim', './image/quillingtraitim.jpg', 77000, 99000, 25, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (80, 'TH', 'Thiệp ba hoa', './image/quillinghoa.jpg', 78000, 98000, 28, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (81, 'TH', 'Thiệp chim', './image/chim.jpg', 38000, 58000, 30, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (82, 'TH', 'Thiệp con voi', './image/thiepvoi.jpg', 85000, 95000, 21, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (83, 'TH', 'Thiệp hoa tím', './image/thiepHoaTim.jpg', 80000, 90000, 25, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (84, 'TH', 'Thiệp cú mèo', './image/thiepCuMeo.jpg', 90000, 120000, 58, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (85, 'TH', 'Thiệp hoa cẩm tú cầu', './image/thiepCTC.jpg', 95000, 167000, 58, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (86, 'TH', 'Thiệp áo dài Việt Nam', './image/thiepAD.jpg', 80000, 90000, 25, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (87, 'TH', 'Thiệp Valentine', './image/thienVLT.jpg', 77000, 99000, 51, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (88, 'TH', 'Thiệp bong bóng', './image/ca.jpg', 48000, 58000, 21, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (89, 'TH', 'Hoa và bướm', './image/thiepB.jpg', 78000, 98000, 22, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);
INSERT INTO `products` VALUES (90, 'TH', 'Bông hoa', './image/thiephoa.jpg', 38000, 58000, 10, 'Thiệp được trang trí làm nổi bật họa tiết với cách quấn giấy quilling. Quilling được quấn tỉ mỉ thành hình những chú chim, bông hoa, các cặp đôi,... làm cho tấm thiệp đặc sắc hơn. Với kiểu thiệp này có rất nhiều mẫu cho nhiều dịp sinh nhật, Valentine, tri ân, các dịp lễ khác,...', NULL, NULL, 0);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `IdAccount` int NULL DEFAULT NULL,
  `Idproduct` int NULL DEFAULT NULL,
  `ContentReview` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dateReview` datetime NULL DEFAULT NULL,
  `NameID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Score` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (3, 1, 'đẹp', '2023-05-05 22:24:03', 'Khắc Nhuận', 4);
INSERT INTO `review` VALUES (3, 1, 'đẹp', '2023-05-05 22:24:22', 'Khắc Nhuận', 5);
INSERT INTO `review` VALUES (3, 1, 'đẹp', '2023-05-05 22:25:21', 'Khắc Nhuận', 5);
INSERT INTO `review` VALUES (3, 1, 'great', '2023-05-05 23:24:28', 'Khắc Nhuận', 5);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `IdUser` int NOT NULL,
  `NameUser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EmailUs` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Pass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Phone` int NULL DEFAULT NULL,
  `RegistrationDate` date NULL DEFAULT NULL,
  `RoleUs` int NULL DEFAULT NULL,
  `active` int NULL DEFAULT NULL,
  `Keyactive` int NULL DEFAULT NULL,
  `Manager` int NULL DEFAULT NULL,
  PRIMARY KEY (`IdUser`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Thúy Diễm', 'thuydiem@gmail.com', '1234', 123456789, '2022-12-01', 1, 1, NULL, 1);
INSERT INTO `users` VALUES (2, 'Mai Thi', 'maithi@gmail.com', '1122', 213654987, '2022-12-02', 0, 1, NULL, 0);
INSERT INTO `users` VALUES (3, 'Khắc Nhuận', 'khacnhuan@gmail.com', '3456', 321456978, '2022-12-03', 1, 1, NULL, 0);
INSERT INTO `users` VALUES (4, 'Ngọc Trân', 'ngoctran06@gmail.com', '0609', 522610243, '2022-12-04', NULL, 1, NULL, 1);
INSERT INTO `users` VALUES (5, 'Thanh Lộc', 'thanhloc@gmail.com', '1104', 675431204, '2022-12-05', 0, 1, NULL, 1);
INSERT INTO `users` VALUES (6, 'Kim Tuyet', 'thuydiem@gmail.com', '1234', 123756789, '2022-12-01', 0, 1, NULL, 0);
INSERT INTO `users` VALUES (12, 'Kim Tuyết', 'kimtuyet@gmail.com', '1206', 769965009, '2022-12-06', 1, 1, NULL, 0);

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `IdPro` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Image` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NamePro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PriceNew` int NULL DEFAULT NULL,
  `IdU` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
INSERT INTO `wishlist` VALUES ('1', './image/dc2.jpg', 'Đại Dương', 150000, 3);
INSERT INTO `wishlist` VALUES ('4', './image/dc11.jpg', 'Đêm Trăng', 240000, 3);
INSERT INTO `wishlist` VALUES ('15', './image/dream9-min.jpg', 'Mộng hồng', 270000, 3);
INSERT INTO `wishlist` VALUES ('9', './image/dc10.jpg', 'Trời xanh', 250000, 12);

SET FOREIGN_KEY_CHECKS = 1;
