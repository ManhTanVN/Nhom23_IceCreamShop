-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: icecream-shop
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `summary` text,
  `content` longtext,
  `image_url` text,
  `author` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` (`id`, `title`, `summary`, `content`, `image_url`, `author`, `created_at`) VALUES (1,'Bí quyết làm kem dâu không cần máy','Bạn không cần phải sở hữu một chiếc máy làm kem đắt tiền để thưởng thức vị dâu tây tươi mát. Chỉ với vài mẹo nhỏ từ whipping cream và màng bọc thực phẩm, bạn hoàn toàn có thể tạo ra mẻ kem mịn mướt, tan chảy ngay đầu lưỡi.','Làm kem dâu tại nhà chưa bao giờ dễ dàng đến thế. Bạn chỉ cần chuẩn bị 500g dâu tây tươi, 200ml sữa đặc và 400ml whipping cream. \n\nBước 1: Xay nhuyễn dâu tây với sữa đặc. \nBước 2: Đánh bông whipping cream cho đến khi tạo chóp cứng. \nBước 3: Trộn nhẹ nhàng hỗn hợp dâu vào kem. \nBước 4: Để ngăn đông từ 6-8 tiếng. \n\nKết quả là món kem mịn mượt, không hề bị dăm đá dù không dùng máy chuyên dụng!','https://images.unsplash.com/photo-1497034825429-c343d7c6a68f','Tân Nguyễn','2026-05-09 07:48:25'),(2,'Lịch sử của món kem Gelato Ý','Gelato không chỉ là món tráng miệng, nó là cả một di sản văn hóa của nước Ý thơ mộng. Khám phá hành trình từ những tảng băng tuyết trên đỉnh núi đến nghệ thuật chế biến bậc thầy của các nghệ nhân để hiểu tại sao nó lại quyến rũ cả thế giới.','Gelato có nguồn gốc từ thời Phục hưng tại Ý. Điểm khác biệt lớn nhất giữa Gelato và kem thông thường (Ice Cream) chính là hàm lượng chất béo thấp hơn và lượng khí ít hơn, giúp kết cấu kem đậm đặc và hương vị bùng nổ ngay khi chạm đầu lưỡi. Nghệ nhân làm Gelato thường sử dụng nguyên liệu hoàn toàn tự nhiên và bảo quản ở nhiệt độ cao hơn kem thường một chút để giữ được độ dẻo đặc trưng.','https://plus.unsplash.com/premium_photo-1776100439615-3c9d26961414?q=80&w=762&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Cảnh Tuấn','2026-05-09 07:48:25'),(3,'Top 5 món kem giải nhiệt mùa hè 2026','Mùa hè rực lửa 2026 đang đến gần, hãy để TasteOfJoy dẫn lối bạn đến với thiên đường mát lạnh. Từ vị chanh dây chua thanh đến bạc hà socola bùng nổ, đây là danh sách những siêu phẩm giúp bạn đánh bại cái nắng gay gắt chỉ trong một nốt nhạc.','Mùa hè 2026 chứng kiến sự lên ngôi của các vị kem trái cây nhiệt đới. \n\n1. Kem Chanh Dây: Vị chua thanh mát lành. \n2. Kem Bạc Hà Socola: Cảm giác sảng khoái tức thì. \n3. Kem Dừa Non: Béo ngậy đặc trưng Việt Nam. \n4. Kem Sorbet Xoài: Không béo, cực kỳ tốt cho sức khỏe. \n5. Kem Muối Biển: Sự kết hợp lạ miệng giữa ngọt và mặn.','https://plus.unsplash.com/premium_photo-1752502982110-9d5fe2dc084c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Thủy Nguyễn','2026-05-09 07:48:25'),(4,'Cách bảo quản kem thủ công luôn mềm mịn','Một hộp kem ngon có thể bị hỏng chỉ sau một đêm nếu không biết cách cất giữ đúng cách. Học ngay kỹ thuật dùng màng bọc thực phẩm ép sát bề mặt và bí quyết ổn định nhiệt độ ngăn đông để giữ cho cấu trúc kem luôn dẻo mịn như mới vừa ra lò.','Để kem thủ công không bị dăm đá, bạn cần lưu ý: \n\n- Sử dụng hộp đựng kín khí để tránh kem hấp thụ mùi từ thực phẩm khác. \n- Ép một lớp màng bọc thực phẩm sát bề mặt kem trước khi đậy nắp. \n- Để kem ở phần sâu nhất của ngăn đông, nơi nhiệt độ ổn định nhất. \n- Không nên để kem ở cánh cửa tủ lạnh vì nhiệt độ thay đổi thường xuyên khi mở cửa.','https://images.unsplash.com/photo-1551024601-bec78aea704b','Long Phạm','2026-05-09 07:59:17'),(5,'Kem hữu cơ (Organic) - Xu hướng mới 2026','Khi sức khỏe trở thành ưu tiên hàng đầu, kem Organic đang dẫn đầu xu hướng ẩm thực xanh năm 2026. Tìm hiểu lý do tại sao sữa từ bò ăn cỏ tự nhiên lại tạo nên sự khác biệt hoàn toàn về cả hương vị lẫn giá trị dinh dưỡng cho gia đình bạn.','Người tiêu dùng hiện đại ngày càng quan tâm đến sức khỏe. Kem Organic sử dụng sữa từ bò ăn cỏ tự nhiên, đường mía hữu cơ và không có chất bảo quản hay màu thực phẩm nhân tạo. Mặc dù giá thành cao hơn, nhưng giá trị dinh dưỡng và sự an tâm mà nó mang lại là hoàn toàn xứng đáng cho gia đình bạn.','https://plus.unsplash.com/premium_photo-1667683701928-ab179b86fc1f?q=80&w=732&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Chung Trịnh','2026-05-09 07:59:17'),(6,'Bí quyết làm kem dâu tại nhà','Dâu tây Đà Lạt đang vào mùa rộ, đây là thời điểm vàng để bạn trổ tài khéo tay cho cả nhà. Bài viết này hướng dẫn chi tiết cách chọn lựa những quả dâu chín mọng nhất và mẹo nhỏ để giữ cho màu kem luôn hồng tươi rực rỡ mà không cần phẩm màu.','Tiếp nối bí quyết làm kem dâu, khâu chọn nguyên liệu chiếm 70% thành công. Bạn nên chọn những quả dâu tây có màu đỏ mọng, cuống còn xanh và mùi thơm nồng. Tránh chọn dâu tây quá to vì thường bị rỗng ruột và nhạt. Một chút nước cốt chanh thêm vào hỗn hợp dâu sẽ giúp màu kem giữ được độ tươi sáng rực rỡ.','https://images.unsplash.com/photo-1497034825429-c343d7c6a68f','Nguyễn Văn Tân','2026-05-09 08:19:06'),(7,'Gelato vs Kem thường','Đều là kem nhưng tại sao Gelato lại dẻo hơn và ít béo hơn kem thường? Hãy cùng đặt lên bàn cân so sánh về hàm lượng không khí, nhiệt độ phục vụ và tỷ lệ chất béo để trở thành một chuyên gia sành ăn thứ thiệt trong giới mộ điệu kem lạnh.','Bảng so sánh nhanh: \n\n- Chất béo: Gelato (4-9%), Kem thường (10-25%). \n- Không khí: Gelato rất ít khí nên đặc hơn, Kem thường nhiều khí nên xốp hơn. \n- Nhiệt độ phục vụ: Gelato ăn ở mức -13 độ C (dẻo), Kem thường ăn ở -18 độ C (cứng). \n\nĐó là lý do tại sao Gelato mang lại cảm giác tan chảy mượt mà hơn rất nhiều.','https://plus.unsplash.com/premium_photo-1683147864503-e96f9b30db56?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Nguyễn Cảnh Tuấn','2026-05-09 08:19:06'),(8,'Kem bơ sáp Đắk Lắk','Đặc sản vùng cao nguyên nay đã có mặt tại TasteOfJoy với một diện mạo hoàn toàn mới. Với sự kết hợp tinh tế giữa bơ sáp dẻo quánh và viên kem dừa trắng muốt, ly kem bơ này hứa hẹn sẽ mang đến cho bạn một trải nghiệm ẩm thực đậm chất Việt Nam.','Kem bơ sáp Đắk Lắk là niềm tự hào của ẩm thực Tây Nguyên. Để có ly kem ngon, bơ phải là loại bơ sáp già, thịt vàng ươm và dẻo. Bơ được xay cùng một ít sữa dừa, ăn kèm với viên kem dừa trắng muốt, rắc thêm dừa khô và đậu phộng rang. Một sự kết hợp hoàn hảo giữa vị béo của bơ và vị ngọt thanh của kem.','https://plus.unsplash.com/premium_photo-1752502983066-404559a320be?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Phạm Văn Long','2026-05-09 08:19:06'),(9,'Bảo quản kem đúng cách','Đừng bao giờ để cả hộp kem lớn tan chảy rồi lại cất vào tủ lạnh! Bài viết chia sẻ mẹo chia nhỏ phần ăn vào các hũ đơn lẻ để đảm bảo chất lượng kem luôn ổn định, giúp bạn thưởng thức trọn vẹn hương vị đỉnh cao đến muỗng cuối cùng.','Một mẹo nhỏ nhưng cực kỳ hữu ích là hãy chia kem vào các hũ nhỏ vừa đủ một lần ăn. Việc lấy hộp kem lớn ra ngoài rồi lại cất vào ngăn đá nhiều lần sẽ làm kem tan chảy một phần và tái đông thành tinh thể đá to, làm mất đi độ mịn mượt ban đầu của kem.','https://images.unsplash.com/photo-1551024601-bec78aea704b','Trịnh Văn Chung','2026-05-09 08:19:06'),(10,'Xu hướng kem Organic 2026','Không chỉ là sạch, kem Organic 2026 còn là sự kết hợp độc đáo với các loại hạt siêu thực phẩm như hạnh nhân và hạt chia. Khám phá cách chúng tôi sáng tạo ra những viên kem không chỉ thỏa mãn cơn thèm ngọt mà còn bổ sung năng lượng cho cơ thể.','Bạn hoàn toàn có thể tự làm kem hữu cơ tại nhà bằng cách mua sữa tươi đạt chuẩn Organic và mật ong tự nhiên để thay thế đường tinh luyện. Xu hướng 2026 cũng ưu tiên việc thêm các loại hạt như hạnh nhân, hạt dẻ cười vào kem để tăng hàm lượng chất xơ và omega-3 cho món tráng miệng của bạn.','https://plus.unsplash.com/premium_photo-1667683701939-9ba16ddc44e2?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Nguyễn Thị Thủy','2026-05-09 08:19:06');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image_url` text,
  `quantity` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` (`id`, `user_id`, `product_name`, `price`, `image_url`, `quantity`, `created_at`) VALUES (3,8,'Berry Pops',450000,'https://images.unsplash.com/photo-1488900128323-21503983a07e',1,'2026-05-07 11:40:38'),(20,1,'Kem Cầu Vồng (Rainbow)',320000,'https://images.unsplash.com/photo-1549395156-e0c1fe6fc7a5',1,'2026-05-10 06:48:25'),(23,10,'Kem Cầu Vồng (Rainbow)',320000,'https://images.unsplash.com/photo-1549395156-e0c1fe6fc7a5',1,'2026-05-10 08:02:21'),(24,10,'Kem Saffron (Nhụy Hoa Nghệ Tây)',990000,'https://plus.unsplash.com/premium_photo-1695750678153-e7148811673e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',1,'2026-05-10 08:02:24'),(25,10,'Kem Tiramisu Ý',490000,'https://images.unsplash.com/photo-1580915411954-282cb1b0d780',1,'2026-05-10 08:02:25'),(26,1,'Kem Đặc Biệt TasteOfJoy',600000,'https://images.unsplash.com/photo-1567206563064-6f60f40a2b57',3,'2026-05-10 08:29:42'),(27,11,'Kem Saffron (Nhụy Hoa Nghệ Tây)',990000,'https://plus.unsplash.com/premium_photo-1695750678153-e7148811673e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',2,'2026-05-10 16:11:55');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `image_url` varchar(500) DEFAULT NULL,
  `price` int NOT NULL,
  `original_price` int DEFAULT NULL,
  `allergies` varchar(255) DEFAULT '[]',
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `description`, `image_url`, `price`, `original_price`, `allergies`, `handle`) VALUES (1,'Nutty Butterscotch','Sự pha trộn tuyệt vời giữa các loại hạt giòn rụm và kẹo bơ béo ngậy, tạo nên món tráng miệng tan chảy trong miệng!','https://plus.unsplash.com/premium_photo-1678198786405-28e947bb8a12',380000,500000,'[\"nuts\",\"salt\"]','nutty-butterscotch'),(2,'Berry Pops','Món tráng miệng đông lạnh tươi mát bùng nổ hương vị từ các loại quả mọng, hoàn hảo cho một ngày mát mẻ!','https://images.unsplash.com/photo-1488900128323-21503983a07e',450000,500000,'[]','berry-pops'),(3,'Cherry Sherbet Pops','Kem que kem mềm mịn hòa quyện cùng hương vị cherry thanh mát, mang lại cảm giác mùa hè trong từng miếng cắn!','https://images.unsplash.com/photo-1633933037611-f26e54366832',450000,500000,'[]','cherry-sherbet-pops'),(4,'Dripping Vanilla','Món kem vani béo ngậy tan chảy ngọt ngào, mang lại trải nghiệm hương vị vô cùng đậm đà!','https://images.unsplash.com/photo-1570197788417-0e82375c9371',380000,500000,'[\"dairy\"]','dripping-vanilla'),(5,'Very Berry Strawberry','Sự kết hợp tuyệt vời của dâu tây tươi và hỗn hợp các loại quả mọng, mang đến sự bùng nổ hương vị rực rỡ và ngọt ngào!','https://images.unsplash.com/photo-1532678465554-94846274c297',400000,500000,'[]','very-berry-strawberry'),(6,'Rainbow Classic Cone','Một biến tấu đầy màu sắc của hương vị vượt thời gian, mang lại trải nghiệm hoài cổ, vui tươi qua từng lớp kem!','https://images.unsplash.com/photo-1705103654898-d663145f5f50',450000,500000,'[\"dairy\"]','rainbow-classic-cone'),(7,'Orange Pops','Món kem que giải khát bùng nổ hương vị cam chua ngọt, lý tưởng để xua tan cái nóng!','https://images.unsplash.com/photo-1559340160-146586a4f9b6',300000,500000,'[]','orange-pops'),(8,'Choco-Hazel Pops','Món tráng miệng sang trọng với chocolate đậm đà và hạt dẻ cười giòn tan, mang lại trải nghiệm đầy cuốn hút!','https://images.unsplash.com/photo-1594305178909-03ab72b8205e',450000,500000,'[\"nuts\", \"dairy\"]','choco-hazel-pops'),(9,'Very Very Peachy','Hương vị ngọt ngào và mọng nước từ những trái đào chín cây, mang lại cảm giác mùa hè bất tận!','https://images.unsplash.com/photo-1499638472904-ea5c6178a300',380000,500000,'[]','very-very-peachy'),(10,'Very Berry Strawberrys 222','GOOD','https://images.unsplash.com/photo-1532678465554-94846274c297',390000,678000,'[]','very-berry-strawberrys-222'),(11,'Test Món Mới','Tuyệt vời','https://images.unsplash.com/photo-1532678465554-94846274c297',123000,234000,'[]','test-mon-moi'),(12,'Kem Vani Madagascar','Hương vị vani nguyên bản từ vùng Madagascar, mang lại cảm giác thanh khiết và dịu nhẹ.','https://images.unsplash.com/photo-1570197788417-0e82375c9371',350000,420000,'Dairy','vani-madagascar'),(13,'Kem Socola Bỉ Đậm Đặc','Được làm từ 70% cacao nguyên chất nhập khẩu từ Bỉ, dành cho những tín đồ cuồng socola.','https://images.unsplash.com/photo-1563805042-7684c019e1cb',380000,450000,'Dairy, Soy','socola-bi'),(14,'Kem Dâu Tây Đà Lạt','Sử dụng dâu tây tươi mọng nước từ các farm Đà Lạt, vị chua ngọt tự nhiên.','https://images.unsplash.com/photo-1497034825429-c343d7c6a68f',320000,390000,'None','dau-tay-da-lat'),(15,'Kem Trà Xanh Matcha Uji','Bột matcha thượng hạng từ vùng Uji Nhật Bản, hậu vị đắng nhẹ và thơm lừng.','https://plus.unsplash.com/premium_photo-1738036168749-4fa391a26d43?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',420000,500000,'Dairy','matcha-uji'),(16,'Kem Việt Quất New Zealand','Sự kết hợp giữa sữa tươi và những quả việt quất tím mọng từ New Zealand.','https://images.unsplash.com/photo-1567206563064-6f60f40a2b57',450000,520000,'Dairy','viet-quat-nz'),(17,'Kem Sầu Riêng Ri6','Đặc sản miền Tây với hương vị sầu riêng nồng nàn, béo ngậy đặc trưng.','https://images.unsplash.com/photo-1543269865-cbf427effbad',480000,550000,'Dairy','sau-rieng-ri6'),(18,'Kem Bơ Sáp Đắk Lắk','Bơ sáp loại 1 xay nhuyễn cùng cốt dừa, tạo nên độ dẻo mịn khó cưỡng.','https://plus.unsplash.com/premium_photo-1683147864503-e96f9b30db56?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',390000,460000,'Dairy, Coconut','bo-sap-dak-lak'),(19,'Kem Dừa Non Bến Tre','Vị ngọt thanh từ nước dừa và những sợi dừa non giòn sần sật.','https://plus.unsplash.com/premium_photo-1675279010966-9bee20af667f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',300000,350000,'Coconut','dua-non-ben-tre'),(20,'Kem Hạt Dẻ Cười Ý','Hạt dẻ cười nhập khẩu từ vùng Bronte, mang lại vị bùi béo sang trọng.','https://images.unsplash.com/photo-1580915411954-282cb1b0d780',550000,650000,'Nuts, Dairy','hat-de-cuoi'),(21,'Kem Bạc Hà Socola Chip','Sảng khoái tức thì với tinh chất bạc hà và những mảnh socola vụn giòn tan.','https://plus.unsplash.com/premium_photo-1675279010969-e85bfbd402dc?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',360000,430000,'Dairy, Soy','bac-ha-socola'),(22,'Kem Xoài Cát Hòa Lộc','Hương vị xoài chín vàng rực rỡ, ngọt lịm như đang thưởng thức trái cây tươi.','https://images.unsplash.com/photo-1553177595-4de2bb0842b9',330000,400000,'None','xoai-cat-hoa-loc'),(23,'Kem Caramel Muối Biển','Sự kết hợp hoàn hảo giữa vị ngọt lịm của caramel và chút mặn nhẹ từ muối biển.','https://plus.unsplash.com/premium_photo-1675279027780-05ab8b4a4c1f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',410000,490000,'Dairy','caramel-muoi-bien'),(24,'Kem Khoai Môn Tím','Vị bùi đặc trưng của khoai môn kết hợp cùng cốt dừa truyền thống.','https://images.unsplash.com/photo-1549395156-e0c1fe6fc7a5',290000,350000,'Dairy','khoai-mon-tim'),(25,'Kem Chuối Nướng Cốt Dừa','Lấy cảm hứng từ món chè chuối nướng, mang hương vị dân dã mà tinh tế.','https://images.unsplash.com/photo-1564021345996-c4d4e8ac84b8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',280000,340000,'Coconut','chuoi-nuong'),(26,'Kem Chanh Dây Sorbet','Dòng kem đá không sữa, cực kỳ giải nhiệt với vị chua bùng nổ.','https://plus.unsplash.com/premium_photo-1663840277908-30bacba5cde6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',310000,380000,'None','chanh-day-sorbet'),(27,'Kem Vải Thiều Lục Ngạn','Hương thơm nồng nàn của vải thiều tươi, vị ngọt thanh mát.','https://images.unsplash.com/photo-1570197788417-0e82375c9371',340000,410000,'None','vai-thieu'),(28,'Kem Mâm Xôi Đỏ','Màu sắc rực rỡ từ quả mâm xôi đỏ, giàu vitamin và hương vị tinh tế.','https://images.unsplash.com/photo-1563805042-7684c019e1cb',460000,540000,'None','mam-xoi-do'),(29,'Kem Hạt Óc Chó Caramel','Hạt óc chó giòn rụm hòa quyện cùng sốt caramel thủ công đậm đà.','https://images.unsplash.com/photo-1580915411954-282cb1b0d780',490000,580000,'Nuts, Dairy','oc-cho-caramel'),(30,'Kem Cà Phê Espresso','Được làm từ những hạt cà phê Robusta và Arabica rang xay nguyên chất.','https://images.unsplash.com/photo-1564021345996-c4d4e8ac84b8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',320000,380000,'Dairy','cafe-espresso'),(31,'Kem Tinh Than Tre','Màu đen huyền bí từ than tre hoạt tính Nhật Bản, giúp thanh lọc cơ thể.','https://images.unsplash.com/photo-1592413890637-ea80fb4ed093?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',370000,440000,'Dairy','tinh-than-tre'),(32,'Kem Phô Mai Việt Quất','Vị béo ngậy của Cream Cheese hòa quyện cùng mứt việt quất chua ngọt.','https://images.unsplash.com/photo-1567206563064-6f60f40a2b57',470000,560000,'Dairy','pho-mai-viet-quat'),(33,'Kem Sữa Chua Lên Men','Vị chua nhẹ hỗ trợ tiêu hóa, cực kỳ phù hợp cho người ăn kiêng.','https://images.unsplash.com/photo-1570197788417-0e82375c9371',330000,400000,'Dairy','sua-chua'),(34,'Kem Hạt Điều Bình Phước','Hạt điều rang muối xay mịn, mang lại hương vị bùi mặn độc đáo.','https://images.unsplash.com/photo-1580915411954-282cb1b0d780',380000,450000,'Nuts, Dairy','hat-dieu'),(35,'Kem Rum Nho Mỹ','Nho khô được ngâm ủ trong rượu Rum cao cấp nhiều tháng trời.','https://images.unsplash.com/photo-1563805042-7684c019e1cb',440000,520000,'Dairy, Alcohol','rum-nho'),(36,'Kem Trà Sữa Trân Châu','Mang trọn vẹn hương vị trà sữa yêu thích vào viên kem mát lạnh.','https://plus.unsplash.com/premium_photo-1664392057588-1c44f0e59c9b?q=80&w=761&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',350000,420000,'Dairy','tra-sua'),(37,'Kem Sữa Đậu Nành','Lựa chọn hoàn hảo cho người thích hương vị thuần mộc từ đậu nành.','https://images.unsplash.com/photo-1549395156-e0c1fe6fc7a5',270000,330000,'Soy','sua-dau-nanh'),(38,'Kem Hoa Oải Hương (Lavender)','Hương thơm thư giãn từ tinh dầu lavender Pháp, mang lại trải nghiệm độc bản.','https://images.unsplash.com/photo-1570197788417-0e82375c9371',520000,620000,'Dairy','oai-huong'),(39,'Kem Hoa Hồng Damask','Sử dụng nước hoa hồng tinh khiết, mang lại cảm giác quý tộc.','https://images.unsplash.com/photo-1563805042-7684c019e1cb',540000,640000,'Dairy','hoa-hong'),(40,'Kem Mật Ong Rừng','Ngọt thanh nhẹ nhàng từ mật ong hoa cà phê vùng Tây Nguyên.','https://images.unsplash.com/photo-1580915411954-282cb1b0d780',400000,480000,'None','mat-ong-rung'),(41,'Kem Gừng Ấm Áp','Vị cay nồng của gừng giúp làm ấm cơ thể, phù hợp ngay cả khi trời lạnh.','https://plus.unsplash.com/premium_photo-1664391744509-2a96af429dc4?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',320000,390000,'Dairy','gung-am-ap'),(42,'Kem Bắp Mỹ Ngọt Trào','Vị ngọt thanh từ những hạt bắp Mỹ vàng ruộm, béo ngậy vị sữa.','https://images.unsplash.com/photo-1549395156-e0c1fe6fc7a5',310000,370000,'Dairy','bap-my'),(43,'Kem Đào Sapa','Những trái đào chín đỏ vùng cao Sapa mang lại vị thanh tao.','https://images.unsplash.com/photo-1567206563064-6f60f40a2b57',340000,410000,'None','dao-sapa'),(44,'Kem Mè Đen Nhật Bản','Vị bùi béo và hương thơm đậm đà từ hạt mè đen rang thơm.','https://images.unsplash.com/photo-1570197788417-0e82375c9371',360000,430000,'Dairy, Sesame','me-den'),(45,'Kem Phô Mai Nướng','Hương vị cháy cạnh của Basque Cheesecake được tái hiện hoàn hảo.','https://images.unsplash.com/photo-1563805042-7684c019e1cb',480000,570000,'Dairy','pho-mai-nuong'),(46,'Kem Táo Xanh Sorbet','Chua giòn sảng khoái với tinh chất táo xanh Granny Smith.','https://images.unsplash.com/photo-1580915411954-282cb1b0d780',300000,360000,'None','tao-xanh'),(47,'Kem Ổi Xá Lị','Hương vị ổi xá lị quen thuộc, vừa thơm vừa mát.','https://plus.unsplash.com/premium_photo-1695927469809-d19eba174dd5?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',310000,370000,'None','oi-xa-li'),(48,'Kem Dưa Lưới Nhật','Dòng kem cao cấp làm từ dưa lưới Yubari trứ danh.','https://images.unsplash.com/photo-1549395156-e0c1fe6fc7a5',580000,680000,'Dairy','dua-luoi-nhat'),(49,'Kem Hạt Sen Long Nhãn','Sự kết hợp tinh tế giữa hạt sen bùi và nhãn lồng ngọt lịm.','https://images.unsplash.com/photo-1567206563064-6f60f40a2b57',450000,530000,'None','hat-sen-long-nhan'),(50,'Kem Bí Đỏ Hạt Sen','Vị béo tự nhiên của bí đỏ và bùi của hạt sen, rất tốt cho sức khỏe.','https://images.unsplash.com/photo-1570197788417-0e82375c9371',360000,420000,'Dairy','bi-do-hat-sen'),(51,'Kem Gạo Lứt Huyết Rồng','Thanh mát, giàu dinh dưỡng từ những hạt gạo lứt tuyển chọn.','https://images.unsplash.com/photo-1563805042-7684c019e1cb',330000,390000,'Dairy','gao-lut'),(52,'Kem Me Cay Muối Ớt','Trải nghiệm bùng nổ với vị chua của me và cay nhẹ của muối ớt.','https://images.unsplash.com/photo-1580915411954-282cb1b0d780',290000,350000,'None','me-cay'),(53,'Kem Sữa Tươi Trân Châu Đường Đen','Hòa quyện giữa sữa tươi thơm béo và sốt đường đen đậm đà.','https://plus.unsplash.com/premium_photo-1695035006328-71bf8f9c768c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',390000,460000,'Dairy','duong-den'),(54,'Kem Dâu Tằm Đà Lạt','Vị chua ngọt đặc trưng của quả dâu tằm chín mọng.','https://images.unsplash.com/photo-1549395156-e0c1fe6fc7a5',330000,390000,'None','dau-tam'),(55,'Kem Sữa Dừa Hạnh Nhân','Sự kết hợp béo ngậy giữa cốt dừa và hạt hạnh nhân giòn tan.','https://images.unsplash.com/photo-1567206563064-6f60f40a2b57',410000,490000,'Coconut, Nuts','sua-dua-hanh-nhan'),(56,'Kem Bánh Quy Oreo','Những mẩu bánh Oreo vụn giòn rụm trong nền kem vani mịn màng.','https://images.unsplash.com/photo-1570197788417-0e82375c9371',360000,430000,'Dairy, Gluten','oreo-cream'),(57,'Kem Socola Trắng Macca','Hương vị ngọt ngào từ socola trắng và hạt macca đắt giá.','https://images.unsplash.com/photo-1563805042-7684c019e1cb',550000,650000,'Dairy, Nuts','socola-trang-macca'),(58,'Kem Tiramisu Ý','Tái hiện hoàn hảo món bánh Tiramisu trứ danh từ Ý.','https://images.unsplash.com/photo-1580915411954-282cb1b0d780',490000,580000,'Dairy, Caffeine','tiramisu-italy'),(59,'Kem Saffron (Nhụy Hoa Nghệ Tây)','Dòng kem sang trọng bậc nhất với nhụy hoa nghệ tây Iran.','https://plus.unsplash.com/premium_photo-1695750678153-e7148811673e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',990000,1200000,'Dairy','saffron-luxury'),(60,'Kem Cầu Vồng (Rainbow)','Sự tổng hợp từ nhiều vị trái cây, tạo nên sắc màu rực rỡ.','https://images.unsplash.com/photo-1549395156-e0c1fe6fc7a5',320000,380000,'Dairy','rainbow-ice'),(61,'Kem Đặc Biệt TasteOfJoy','Món kem bí mật hội tụ tất cả những gì tinh túy nhất của chúng tôi.','https://images.unsplash.com/photo-1567206563064-6f60f40a2b57',600000,750000,'Dairy, Nuts','taste-of-joy-special');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `role`) VALUES (1,'Admin Tối Cao','admin@tasteofjoy.com','123456',1),(2,'Joe Nguyen','tannv.k55v@gmail.com','123456',0),(3,'Phạm Thị Mai','mai@gmail.com','123456',0),(5,'Nguyễn Gia Ân','gia_an@gmail.com','123456',0),(6,'Nguyễn Trúc Linh','truclinh@gmail.com','123456',0),(7,'Joseph Nguyen','joseph.nguyen@clearer.io','123456',0),(8,'Joe','joe@gmail.com','123456',0),(9,'test 1','test@gmail.com','123456',0),(10,'Nguyen Van H','hh@tasteofjoy.com','123456',0),(11,'Nguyen Van K','k@tasteofjoy.com','123456',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-11 10:34:23
