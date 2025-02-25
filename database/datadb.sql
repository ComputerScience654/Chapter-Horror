-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2024 at 11:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL COMMENT 'ลำดับที่',
  `orderID` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'เลขที่ใบสั่งซื้อ',
  `pro_id` int(6) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสสินค้า',
  `orderPrice` float NOT NULL COMMENT 'ราคาสินค้า',
  `orderQty` int(11) NOT NULL COMMENT 'จำนวนที่สั่งซื้อ',
  `Total` float NOT NULL COMMENT 'ราคารวม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `orderID`, `pro_id`, `orderPrice`, `orderQty`, `Total`) VALUES
(1, 0000000005, 000002, 40000, 2, 80000),
(2, 0000000005, 000001, 40000, 2, 80000),
(3, 0000000006, 000009, 40000, 5, 200000),
(4, 0000000007, 000013, 40000, 2, 80000),
(5, 0000000008, 000003, 40000, 5, 200000),
(6, 0000000008, 000004, 40000, 2, 80000),
(7, 0000000009, 000009, 40000, 1, 40000),
(8, 0000000009, 000013, 40000, 2, 80000),
(9, 0000000010, 000001, 40000, 1, 40000),
(10, 0000000011, 000002, 40000, 2, 80000),
(11, 0000000012, 000002, 40000, 2, 80000),
(12, 0000000012, 000003, 40000, 2, 80000),
(13, 0000000013, 000002, 40000, 2, 80000),
(14, 0000000014, 000001, 40000, 1, 40000),
(15, 0000000015, 000001, 40000, 1, 40000),
(16, 0000000016, 000006, 40000, 3, 120000),
(17, 0000000016, 000002, 40000, 6, 240000),
(18, 0000000017, 000002, 40000, 4, 160000),
(19, 0000000018, 000016, 40000, 2, 80000),
(20, 0000000018, 000003, 40000, 3, 120000),
(21, 0000000019, 000002, 40000, 3, 120000),
(22, 0000000019, 000016, 40000, 3, 120000),
(23, 0000000019, 000033, 40000, 4, 160000),
(24, 0000000019, 000004, 40000, 2, 80000),
(25, 0000000020, 000002, 40000, 1, 40000),
(26, 0000000020, 000016, 40000, 1, 40000),
(27, 0000000021, 000062, 40000, 3, 120000),
(28, 0000000022, 000016, 40000, 6, 240000),
(29, 0000000022, 000020, 40000, 2, 80000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(6) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสสินค้า',
  `pro_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ชื่อสินค้า',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'รายละเอียด',
  `type_id` int(3) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสประเภทสินค้า',
  `price` float(8,2) DEFAULT NULL COMMENT 'ราคาขาย',
  `amount` int(11) DEFAULT NULL COMMENT 'จำนวน',
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'รูปภาพ',
  `brand` varchar(50) NOT NULL COMMENT 'แบรนด์'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `detail`, `type_id`, `price`, `amount`, `image`, `brand`) VALUES
(000001, 'IPHONE 15 PRO MAX', 'หน้าจอ: Super Retina XDR 6.7 นิ้ว (ProMotion 120Hz)\r\nชิปเซ็ต: A17 Pro (ครั้งแรกในโลกกับชิปขนาด 3 นาโนเมตร)\r\nกล้อง: กล้องหลัง 3 ตัว พร้อมเลนส์ซูม Optical Zoom 5x\r\nแบตเตอรี่: ประสิทธิภาพดีขึ้น พร้อม USB-C\r\nฟีเจอร์เด่น: Action Button, การบันทึกวิดีโอ ProRes 4K, รองรับ Spatial Video\r\n', 001, 40000.00, 16, 'iPhone-15promax.png', 'Iphone'),
(000002, 'iphone-15', 'หน้าจอ: Super Retina XDR 6.1 นิ้ว\r\nชิปเซ็ต: A16 Bionic\r\nกล้อง: กล้องคู่ 48MP พร้อม Night Mode และ Photonic Engine\r\nฟีเจอร์เด่น: การบันทึกวิดีโอ 4K, USB-C\r\n\r\n', 001, 40000.00, -2, 'iphone-15.jpg', 'Iphone'),
(000003, 'iPhone 14 Pro Max\r\n', 'หน้าจอ: Super Retina XDR 6.7 นิ้ว (ProMotion 120Hz)\r\nชิปเซ็ต: A16 Bionic\r\nกล้อง: กล้องหลัง 3 ตัว (หลัก 48MP, Ultra-wide 12MP, Telephoto 12MP)\r\nแบตเตอรี่: ใช้งานได้สูงสุด 29 ชั่วโมงต่อการชาร์จหนึ่งครั้ง\r\nฟีเจอร์เด่น: Dynamic Island, Always-On Display, การถ่ายภาพ ProRAW และ ProRes\r\n', 001, 40000.00, 10, 'iPhone-14-Pro-Max.png', 'Iphone'),
(000004, 'iPhone 14\r\n', 'หน้าจอ: Super Retina XDR 6.1 นิ้ว\r\nชิปเซ็ต: A15 Bionic\r\nกล้อง: กล้องคู่ 12MP (หลักและ Ultra-wide)\r\nฟีเจอร์เด่น: โหมดถ่ายภาพ Cinematic Mode, ฟีเจอร์ Crash Detection, การเชื่อมต่อ 5G\r\n', 001, 40000.00, 16, 'iphone-14.png', 'Iphone'),
(000005, 'iPhone 14 Pro\r\n', 'หน้าจอ: Super Retina XDR 6.1 นิ้ว (ProMotion 120Hz)\r\nชิปเซ็ต: A16 Bionic\r\nกล้อง: ระบบกล้อง 3 ตัว (คล้ายกับ Pro Max)\r\nฟีเจอร์เด่น: Dynamic Island, การถ่ายภาพ ProRAW และ ProRes\r\n', 001, 40000.00, 20, 'iPhone-14-Pro.png', 'Iphone'),
(000006, 'iPhone 13', 'หน้าจอ: Super Retina XDR 6.1 นิ้ว\r\nชิปเซ็ต: A15 Bionic\r\nกล้อง: กล้องคู่ 12MP พร้อมฟีเจอร์ Night Mode\r\nฟีเจอร์เด่น: Cinematic Mode, Photographic Styles, 5G', 001, 40000.00, 17, 'iphone-13.png', 'Iphone'),
(000007, 'iPhone 15 Pro\r\n', 'หน้าจอ: Super Retina XDR 6.1 นิ้ว (ProMotion 120Hz)\r\nชิปเซ็ต: A17 Pro\r\nกล้อง: กล้องหลัง 3 ตัว พร้อม LiDAR Scanner\r\nฟีเจอร์เด่น: Action Button, ProRAW, ProRes, การบันทึก Spatial Video\r\n', 001, 40000.00, 20, 'iPhone-15 pro.png', 'Iphone'),
(000009, 'iPhone SE (2022)', 'หน้าจอ: Retina HD 4.7 นิ้ว\r\nชิปเซ็ต: A15 Bionic\r\nกล้อง: กล้องเดี่ยว 12MP\r\nฟีเจอร์เด่น: รองรับ 5G, ขนาดกะทัดรัด และปุ่ม Home พร้อม Touch ID\r\n', 001, 40000.00, 10, 'iphone-se.png', 'Iphone'),
(000011, 'iPhone 12 Pro\r\n', 'หน้าจอ: Super Retina XDR 6.1 นิ้ว\r\nชิปเซ็ต: A14 Bionic\r\nกล้อง: กล้อง 3 ตัวพร้อม LiDAR Scanner\r\nฟีเจอร์เด่น: รองรับ Dolby Vision, Night Mode\r\n', 001, 40000.00, 20, 'iphone-12-pro.png', 'Iphone'),
(000013, 'iPhone 13 Pro\r\n', 'หน้าจอ: Super Retina XDR 6.1 นิ้ว (ProMotion 120Hz)\r\nชิปเซ็ต: A15 Bionic\r\nกล้อง: กล้อง 3 ตัว (คล้ายกับ iPhone 13 Pro Max)\r\nฟีเจอร์เด่น: Cinematic Mode, Photographic Styles, ProRAW\r\n', 001, 40000.00, 5, 'iphone-13-pro.png', 'Iphone'),
(000015, 'Samsung Galaxy S24 Ultra\r\n', 'หน้าจอ: Dynamic AMOLED 6.8 นิ้ว ความละเอียด QHD+\r\nชิปเซ็ต: Exynos 2400 หรือ Snapdragon 8 Gen 3 (ขึ้นอยู่กับตลาด)\r\nกล้อง: กล้องหลัก 200MP + Ultra-wide 12MP + Telephoto 10MP\r\nฟีเจอร์เด่น: การถ่ายภาพระดับโปร, ซูมแบบ Space Zoom 100x, รองรับการถ่ายวิดีโอ 8K​\r\n', 002, 40000.00, 20, 's24Ultra.png', 'Samsung'),
(000016, 'Samsung Galaxy S23 Ultra\r\n', 'หน้าจอ: Dynamic AMOLED 6.8 นิ้ว QHD+\r\nชิปเซ็ต: Snapdragon 8 Gen 2\r\nกล้อง: กล้องหลัก 200MP + Telephoto 10MP (2 ตัว) + Ultra-wide 12MP\r\nฟีเจอร์เด่น: Space Zoom 100x, การถ่ายวิดีโอ 8K, รองรับ S-Pen​\r\n', 002, 40000.00, 8, 's23Ultra.png', 'Samsung'),
(000017, 'Samsung Galaxy Z Flip5\r\n', 'หน้าจอ: Dynamic AMOLED 6.7 นิ้ว แบบพับได้\r\nชิปเซ็ต: Snapdragon 8 Gen 2\r\nกล้อง: กล้องหลัก 12MP + Ultra-wide 12MP\r\nฟีเจอร์เด่น: การพับหน้าจอแนวตั้ง, โหมด Flex Mode​\r\n', 002, 40000.00, 20, 'flip5.png', 'Samsung'),
(000018, 'Samsung Galaxy Z Fold5\r\n', 'หน้าจอ: Dynamic AMOLED 7.6 นิ้ว แบบพับได้\r\nชิปเซ็ต: Snapdragon 8 Gen 2\r\nกล้อง: กล้องหลัก 50MP + Ultra-wide 12MP + Telephoto 10MP\r\nฟีเจอร์เด่น: การใช้งานหลายหน้าจอพร้อมกัน, รองรับ S-Pen​\r\n', 002, 40000.00, 20, 'galaxy-z-fold5.png', 'Samsung'),
(000020, 'Samsung Galaxy A54 5G\r\n', 'หน้าจอ: Super AMOLED 6.4 นิ้ว ความละเอียด Full HD+\r\nชิปเซ็ต: Exynos 1380\r\nกล้อง: กล้องหลัก 50MP + Ultra-wide 12MP + Macro 5MP\r\nฟีเจอร์เด่น: ถ่ายภาพกลางคืนคมชัด, รองรับ 5G​\r\n', 002, 40000.00, 18, 'a54 5g.png', 'Samsung'),
(000022, 'Samsung Galaxy A14 5G\r\n', 'หน้าจอ: LCD 6.6 นิ้ว Full HD+\r\nชิปเซ็ต: Dimensity 700\r\nกล้อง: กล้องหลัก 50MP + Macro 2MP + Depth 2MP\r\nฟีเจอร์เด่น: มือถือราคาประหยัด, รองรับ 5G​\r\n', 002, 40000.00, 20, 'a14 5g.png', 'Samsung'),
(000024, 'Samsung Galaxy A55 5G\r\n', 'หน้าจอ: Super AMOLED 6.5 นิ้ว Full HD+\r\nชิปเซ็ต: Exynos 1380\r\nกล้อง: กล้องหลัก 50MP + Ultra-wide 12MP\r\nฟีเจอร์เด่น: กล้องคุณภาพสูง, รองรับ 5G​\r\n', 002, 40000.00, 20, 'a555g.png', 'Samsung'),
(000026, 'Samsung Galaxy S24+\r\n', 'หน้าจอ: Dynamic AMOLED 6.7 นิ้ว QHD+\r\nชิปเซ็ต: Exynos 2400 หรือ Snapdragon 8 Gen 3\r\nกล้อง: กล้องหลัก 50MP + Ultra-wide 12MP + Telephoto 10MP\r\nฟีเจอร์เด่น: รองรับการถ่ายวิดีโอ 8K, แบตเตอรี่ขนาดใหญ่​\r\n', 002, 40000.00, 20, 's24plus.png', 'Samsung'),
(000028, 'Samsung Galaxy S23\r\n', 'หน้าจอ: Dynamic AMOLED 6.1 นิ้ว Full HD+\r\nชิปเซ็ต: Snapdragon 8 Gen 2\r\nกล้อง: กล้องหลัก 50MP + Ultra-wide 12MP + Telephoto 10MP\r\nฟีเจอร์เด่น: ขนาดกะทัดรัด, ประสิทธิภาพกล้องดีเยี่ยม​\r\n', 002, 40000.00, 20, 's23.png', 'Samsung'),
(000030, 'Samsung Galaxy A05s\r\n', 'หน้าจอ: PLS LCD 6.5 นิ้ว HD+\r\nชิปเซ็ต: Snapdragon 680\r\nกล้อง: กล้องหลัก 50MP + Depth 2MP + Macro 2MP\r\nฟีเจอร์เด่น: มือถือราคาย่อมเยา, แบตเตอรี่ใช้งานยาวนาน​\r\n', 002, 40000.00, 20, 's23Ultra.png', 'Samsung'),
(000032, 'Realme GT NEO 3T\r\n', 'หน้าจอ: AMOLED 6.62 นิ้ว Full HD+\r\nชิปเซ็ต: Snapdragon 870 5G\r\nแบตเตอรี่: 5000mAh รองรับการชาร์จเร็ว 80W\r\nกล้อง: กล้องหลัง 64MP + Ultra-wide 8MP + Macro 2MP\r\nฟีเจอร์เด่น: ออกแบบมาเพื่อประสบการณ์การเล่นเกมที่ลื่นไหล รองรับ 5G และการชาร์จเร็วทันใจ\r\n', 006, 40000.00, 20, 'realme-GT-NEO-3T.png', 'Realme'),
(000033, 'Realme 11 Pro 5G\r\n', 'หน้าจอ: AMOLED 6.7 นิ้ว 120Hz\r\nชิปเซ็ต: Dimensity 7050\r\nแบตเตอรี่: 5000mAh รองรับการชาร์จเร็ว 67W\r\nกล้อง: กล้องหลัก 100MP + Ultra-wide 8MP + Macro 2MP\r\nฟีเจอร์เด่น: เน้นการถ่ายภาพ ด้วยกล้องความละเอียดสูง รองรับการถ่ายวิดีโอคุณภาพสูงและการประมวลผลที่รวดเร็ว\r\n', 006, 40000.00, 16, 'realme-11-pro.png', 'Realme'),
(000034, 'Realme C55\r\n', 'หน้าจอ: LCD 6.72 นิ้ว Full HD+\r\nชิปเซ็ต: MediaTek Helio G88\r\nแบตเตอรี่: 5000mAh รองรับการชาร์จเร็ว 33W\r\nกล้อง: กล้องหลัก 50MP + Depth Sensor 2MP\r\nฟีเจอร์เด่น: ราคาประหยัด แต่ได้ฟีเจอร์ที่ครบครัน รวมถึงดีไซน์หรูหรา​\r\n', 006, 40000.00, 20, 'realme-c55.png', 'Realme'),
(000035, 'Realme C35\r\n', 'หน้าจอ: LCD 6.6 นิ้ว Full HD+\r\nชิปเซ็ต: Unisoc T616\r\nแบตเตอรี่: 5000mAh รองรับการชาร์จ 18W\r\nกล้อง: กล้องหลัก 50MP + Macro 2MP + Depth Sensor 2MP\r\nฟีเจอร์เด่น: เหมาะสำหรับการใช้งานทั่วไปในชีวิตประจำวัน มาพร้อมกล้องคุณภาพดีในราคาที่คุ้มค่า​\r\n', 006, 40000.00, 20, 'realme-c35.png', 'Realme'),
(000036, 'Realme C25Y\r\n', 'หน้าจอ: LCD 6.5 นิ้ว HD+\r\nชิปเซ็ต: Unisoc T610\r\nแบตเตอรี่: 5000mAh รองรับการชาร์จ 18W\r\nกล้อง: กล้องหลัก 50MP + Macro 2MP + Depth Sensor 2MP\r\nฟีเจอร์เด่น: เหมาะกับผู้ใช้งานเบื้องต้น เน้นการใช้งานแบตเตอรี่ที่ทนทาน​\r\n', 006, 40000.00, 20, 'realme_c25y.png', 'Realme'),
(000037, 'Realme GT 6\r\n', 'หน้าจอ: AMOLED 6.74 นิ้ว 144Hz\r\nชิปเซ็ต: Snapdragon 8 Gen 2\r\nแบตเตอรี่: 5000mAh รองรับการชาร์จเร็ว 100W\r\nกล้อง: กล้องหลัก 50MP + Ultra-wide 8MP\r\nฟีเจอร์เด่น: เหมาะสำหรับเกมเมอร์ มาพร้อมประสิทธิภาพการเล่นเกมที่ลื่นไหลและ AI ขั้นสูง​\r\n', 006, 40000.00, 20, 'realme-gt6.png', 'Realme'),
(000038, 'Realme Note 60\r\n', 'หน้าจอ: LCD 6.5 นิ้ว HD+\r\nชิปเซ็ต: Unisoc SC9863A\r\nแบตเตอรี่: 5000mAh\r\nฟีเจอร์เด่น: มือถือระดับเริ่มต้นที่มีคุณสมบัติทนทาน แข็งแรง รองรับการใช้งานทั่วไปได้ดี​\r\n', 006, 40000.00, 20, 'realme-note60.png', 'Realme'),
(000039, 'Realme 12 Pro Plus 5G\r\n', 'หน้าจอ: AMOLED 6.7 นิ้ว Full HD+ 120Hz\r\nชิปเซ็ต: MediaTek Dimensity 1080\r\nแบตเตอรี่: 5000mAh รองรับการชาร์จเร็ว 67W\r\nกล้อง: กล้องหลัก 200MP + Ultra-wide 8MP + Macro 2MP\r\nฟีเจอร์เด่น: สมาร์ทโฟนระดับกลาง ที่มาพร้อมกล้องความละเอียดสูง รองรับการถ่ายภาพและวิดีโอ 5G\r\n', 006, 40000.00, 20, 'realme-12proplus.png', 'Realme'),
(000040, 'Realme GT2 Pro\r\n', 'หน้าจอ: AMOLED 6.7 นิ้ว 2K 120Hz\r\nชิปเซ็ต: Snapdragon 8 Gen 1\r\nแบตเตอรี่: 5000mAh รองรับการชาร์จเร็ว 65W\r\nกล้อง: กล้องหลัก 50MP + Ultra-wide 50MP + Macro\r\nฟีเจอร์เด่น: ออกแบบมาเพื่อประสิทธิภาพสูงในการทำงานและการเล่นเกม รองรับ 5G\r\n\r\n', 006, 40000.00, 20, 'gt2pro.png', 'Realme'),
(000041, 'Realme X50 Pro 5G\r\n', 'หน้าจอ: Super AMOLED 6.44 นิ้ว 90Hz\r\nชิปเซ็ต: Snapdragon 865\r\nแบตเตอรี่: 4200mAh รองรับการชาร์จเร็ว 65W\r\nกล้อง: กล้องหลัก 64MP + Ultra-wide 8MP + Telephoto 13MP\r\nฟีเจอร์เด่น: แม้จะเป็นรุ่นเก่า แต่ยังคงได้รับความนิยมด้วยประสิทธิภาพการถ่ายภาพและการเชื่อมต่อ 5G\r\n', 006, 40000.00, 20, 'realme-x50-pro-5g.png', 'Realme'),
(000042, 'OPPO Find N3\r\n', 'หน้าจอ: LTPO AMOLED 7.1 นิ้ว แบบพับได้\r\nชิปเซ็ต: Snapdragon 8 Gen 2\r\nกล้อง: กล้องหลังสามตัวที่พัฒนาโดย Hasselblad เน้นการถ่ายภาพคุณภาพสูง\r\nฟีเจอร์เด่น: รองรับการใช้งานหลายแอปพร้อมกันบนหน้าจอขนาดใหญ่ และแบตเตอรี่ขนาดใหญ่ รองรับการชาร์จเร็ว​\r\n\r\n', 005, 40000.00, 20, 'oppo-find-n3.png', 'Oppo'),
(000043, 'OPPO Find N3 Flip\r\n', 'หน้าจอ: AMOLED 6.8 นิ้ว (พับได้) + หน้าจอด้านนอก 3.26 นิ้ว\r\nชิปเซ็ต: MediaTek Dimensity 9200\r\nกล้อง: กล้องหลัก 50MP, Telephoto 32MP, Ultra-wide 48MP\r\nฟีเจอร์เด่น: พัฒนาร่วมกับ Hasselblad สำหรับการถ่ายภาพคุณภาพสูง มีดีไซน์จอพับเล็กกะทัดรัด\r\n', 005, 40000.00, 20, 'find-n3-flip.png', 'Oppo'),
(000044, 'OPPO Reno10 Pro+ 5G\r\n', 'หน้าจอ: AMOLED 6.7 นิ้ว 120Hz\r\nชิปเซ็ต: Snapdragon 8+ Gen 1\r\nกล้อง: กล้องหลัก 50MP, กล้อง Telephoto 64MP ซูมแบบ Optical 3X\r\nฟีเจอร์เด่น: รองรับการชาร์จเร็ว 100W, กล้องคุณภาพสูงพร้อมโหมด Portrait​\r\n', 005, 40000.00, 20, 'reno_10_pro_plus.png', 'Oppo'),
(000045, 'OPPO Reno11 Pro\r\n', 'หน้าจอ: OLED 120Hz\r\nชิปเซ็ต: MediaTek Dimensity 8200\r\nกล้อง: กล้องหลัก 50MP + Ultra-wide 8MP + Telephoto 32MP\r\nฟีเจอร์เด่น: ถ่ายภาพ Portrait คุณภาพสูง รองรับการเล่นเกมได้ดี​\r\n', 005, 40000.00, 20, 'oppo_reno_11_pro.png', 'Oppo'),
(000046, 'OPPO Reno11F\r\n', 'หน้าจอ: AMOLED 6.43 นิ้ว\r\nชิปเซ็ต: MediaTek Dimensity 7050\r\nกล้อง: กล้องหลัก 64MP + Ultra-wide 8MP\r\nฟีเจอร์เด่น: มือถือราคากลาง ที่มาพร้อมคุณสมบัติการถ่ายภาพที่ยอดเยี่ยม​\r\n', 005, 40000.00, 20, 'oppo-reno-11-f.png', 'Oppo'),
(000047, 'OPPO A57\r\n', 'หน้าจอ: LCD 6.56 นิ้ว HD+\r\nชิปเซ็ต: MediaTek Helio G35\r\nกล้อง: กล้องหลัก 13MP\r\nฟีเจอร์เด่น: แบตเตอรี่ 5000mAh รองรับการชาร์จเร็ว 33W เหมาะสำหรับผู้ที่มองหามือถือราคาย่อมเยา​\r\n', 005, 40000.00, 20, 'Oppo-A57.png', 'Oppo'),
(000048, 'OPPO A78\r\n', 'หน้าจอ: LCD 6.72 นิ้ว Full HD+\r\nชิปเซ็ต: MediaTek Dimensity 700\r\nกล้อง: กล้องหลัก 50MP + Depth Sensor 2MP\r\nฟีเจอร์เด่น: รองรับ 5G, แบตเตอรี่ 5000mAh, ชาร์จเร็ว 33W​\r\n', 005, 40000.00, 20, 'Oppo-A78.png', 'Oppo'),
(000049, 'OPPO A58\r\n', 'หน้าจอ: LCD 6.72 นิ้ว\r\nชิปเซ็ต: MediaTek Helio G85\r\nกล้อง: กล้องหลัก 50MP + Depth Sensor 2MP\r\nฟีเจอร์เด่น: หน้าจอใหญ่, แบตเตอรี่ 5000mAh รองรับชาร์จเร็ว 33W​\r\n', 005, 40000.00, 20, 'Oppo A58.png', 'Oppo'),
(000050, 'OPPO A38\r\n', 'หน้าจอ: LCD 6.5 นิ้ว HD+\r\nชิปเซ็ต: Snapdragon 680\r\nกล้อง: กล้องหลัก 50MP\r\nฟีเจอร์เด่น: ราคาประหยัด, แบตเตอรี่ 5000mAh​\r\n', 005, 40000.00, 20, 'a38.png', 'Oppo'),
(000051, 'OPPO A18\r\n', 'หน้าจอ: LCD 6.56 นิ้ว HD+\r\nชิปเซ็ต: MediaTek Helio G85\r\nกล้อง: กล้องหลัก 50MP + Depth Sensor 2MP\r\nฟีเจอร์เด่น: แบตเตอรี่ 5000mAh เหมาะสำหรับการใช้งานทั่วไปในราคาประหยัด\r\n', 005, 40000.00, 20, 'a18.png', 'Oppo'),
(000052, 'Vivo X100 5G', 'หน้าจอ: 6.78 นิ้ว LTPO AMOLED, รีเฟรชเรท 120Hz\r\nชิปประมวลผล: MediaTek Dimensity 9300\r\nกล้อง: 50MP (OIS) + 64MP + 50MP, กล้องหน้า 32MP\r\nแบตเตอรี่: 5,000mAh รองรับชาร์จเร็ว 120W\r\nจุดเด่น: เน้นการถ่ายภาพขั้นสูงและประสิทธิภาพระดับเรือธง พร้อมระบบซูมและกันสั่นที่ยอดเยี่ยม\r\n', 003, 40000.00, 20, 'Vivo X100 5G.png', 'Vivo'),
(000053, 'Vivo X90 Pro 5G', 'หน้าจอ: AMOLED 6.78 นิ้ว FHD+\r\nชิปประมวลผล: MediaTek Dimensity 9200\r\nกล้อง: เลนส์หลัก 50MP พร้อมเลนส์เทเลและอัลตร้าไวด์\r\nจุดเด่น: โดดเด่นด้านการออกแบบและการถ่ายภาพระดับโปร ใช้งานราบรื่น เหมาะสำหรับผู้ที่ชอบกล้องคุณภาพสูง\r\n', 003, 40000.00, 20, 'Vivo X90 Pro 5G.png', 'Vivo'),
(000054, 'Vivo V30 5G', 'หน้าจอ: AMOLED รีเฟรชเรท 120Hz\r\nกล้อง: 64MP พร้อมโหมดพอร์เทรต\r\nจุดเด่น: เหมาะสำหรับสายโซเชียลและการถ่ายภาพ มีดีไซน์ทันสมัยพร้อมภาพที่ลื่นไหล\r\n', 003, 40000.00, 20, 'Vivo V30 5G.png', 'Vivo'),
(000055, 'Vivo V29 5G', 'หน้าจอ: AMOLED 6.78 นิ้ว รีเฟรชเรท 120Hz\r\nแบตเตอรี่: 4,600mAh รองรับชาร์จเร็ว\r\nจุดเด่น: เน้นการใช้งานมัลติมีเดียและประสิทธิภาพที่ลงตัว\r\n', 003, 40000.00, 20, 'Vivo V29 5G.png', 'Vivo'),
(000056, 'Vivo V25 5G\r\n', 'กล้อง: กล้องหลัก 50MP และกล้องหน้า 32MP\r\nแบตเตอรี่: 4,500mAh\r\nจุดเด่น: เหมาะสำหรับการใช้งานทั่วไปและกล้องคุณภาพดีในราคาคุ้มค่า\r\n', 003, 40000.00, 20, 'Vivo V25 5G.png', 'Vivo'),
(000057, 'Vivo Y100 5G\r\n', 'ชิปประมวลผล: MediaTek Dimensity\r\nกล้อง: 50MP พร้อมโหมดสร้างสรรค์ต่าง ๆ\r\nจุดเด่น: รองรับ 5G ในราคาย่อมเยา เหมาะสำหรับผู้ใช้ทั่วไปที่ต้องการความคุ้มค่า\r\n', 003, 40000.00, 20, 'Vivo Y100 5G.png', 'Vivo'),
(000058, 'Vivo iQOO Z7x 5G\r\n', 'แบตเตอรี่: 6,000mAh\r\nจุดเด่น: ออกแบบมาเพื่อการเล่นเกม ด้วยแบตใหญ่และประสิทธิภาพสูงสำหรับเกมเมอร์\r\n', 003, 40000.00, 20, 'Vivo iQOO Z7x 5G.png', 'Vivo'),
(000059, 'Vivo Y27s', 'หน้าจอ: 6.5 นิ้ว HD+\r\nชิปประมวลผล: Helio\r\nจุดเด่น: เหมาะกับการใช้งานทั่วไปด้วยแบต 5,000mAh ใช้งานได้นาน\r\n', 003, 40000.00, 20, 'Vivo Y27s.png', 'Vivo'),
(000060, 'Vivo Y17s\r\n', 'แบตเตอรี่: 5,000mAh\r\nฟีเจอร์: รองรับ Reverse Charging\r\nจุดเด่น: รุ่นประหยัดที่เหมาะสำหรับการใช้งานพื้นฐานและใช้แบตเตอรี่เป็นพาวเวอร์แบงก์ได้\r\n', 003, 40000.00, 20, 'Vivo Y17s.png', 'Vivo'),
(000061, 'Vivo V23 5G\r\n', 'หน้าจอ: AMOLED, รีเฟรชเรท 90Hz\r\nกล้อง: กล้องหลัก 64MP และกล้องหน้าคู่\r\nจุดเด่น: เหมาะสำหรับการถ่ายเซลฟี่และการสนทนาวิดีโอพร้อมประสิทธิภาพที่มั่นคง​\r\n\r\n', 003, 40000.00, 20, 'Vivo V23 5G.png', 'Vivo'),
(000062, 'Xiaomi 14 Ultra\r\n', 'หน้าจอ: 6.73 นิ้ว AMOLED, 120Hz\r\nกล้อง: 50MP (4 ตัว), รองรับการถ่ายภาพคุณภาพสูง\r\nแบตเตอรี่: 5,000mAh, ชาร์จเร็ว\r\nเหมาะสำหรับผู้ใช้ที่ต้องการสมาร์ตโฟนระดับเรือธงพร้อมกล้องที่โดดเด่น\r\n', 004, 40000.00, 17, 'xiaomi-14-ultra.png', 'Xiaomi'),
(000063, 'Xiaomi 13T Pro\r\n', 'หน้าจอ: 6.67 นิ้ว AMOLED, 144Hz\r\nชิปเซ็ต: MediaTek Dimensity 9200+\r\nแบตเตอรี่: 5,000mAh, ชาร์จไว 120W\r\nเน้นกล้องคุณภาพสูงพร้อมเลนส์ Leica และกันน้ำ IP68\r\n', 004, 40000.00, 20, 'Xiaomi 13T Pro.png', 'Xiaomi'),
(000064, 'Xiaomi 14', 'หน้าจอ: 6.36 นิ้ว LTPO AMOLED, 120Hz\r\nชิปเซ็ต: Snapdragon 8 Gen 3\r\nกล้อง: 50MP พร้อมโหมดถ่ายภาพหลากหลาย\r\nตัวเครื่องขนาดเล็กพกพาง่าย พร้อมรองรับการชาร์จไร้สาย\r\n', 004, 40000.00, 20, 'Xiaomi 14.png', 'Xiaomi'),
(000065, 'Poco F6 Pro\r\n', 'หน้าจอ: 6.67 นิ้ว AMOLED, 120Hz\r\nชิปเซ็ต: Snapdragon 8 Gen 2\r\nคุ้มค่าเงินและเหมาะกับการเล่นเกมและใช้งานทั่วไป\r\n', 004, 40000.00, 20, 'Poco F6 Pro.png', 'Xiaomi'),
(000066, 'Poco X6 Pro', 'หน้าจอ: AMOLED ความสว่างสูง\r\nแบตเตอรี่: 5,000mAh, ชาร์จเร็ว 67W\r\nมือถือราคาประหยัดที่ปรับปรุงจากรุ่นก่อนหน้า\r\n', 004, 40000.00, 20, 'Poco X6 Pro.png', 'Xiaomi'),
(000067, 'Redmi Note 13 Pro+', 'หน้าจอ: 6.67 นิ้ว AMOLED, 120Hz\r\nกล้อง: 200MP พร้อมฟีเจอร์การถ่ายภาพขั้นสูง\r\nแบตเตอรี่ขนาดใหญ่พร้อมชาร์จไว 120W\r\n', 004, 40000.00, 20, 'Redmi Note 13 Pro+.png', 'Xiaomi'),
(000068, 'Xiaomi 13 Pro\r\n', 'หน้าจอ: 6.73 นิ้ว AMOLED, 120Hz\r\nกล้องหลัก: 50MP ร่วมพัฒนากับ Leica\r\nสมาร์ตโฟนระดับสูงที่เน้นการถ่ายภาพและดีไซน์พรีเมียม\r\n\r\n', 004, 40000.00, 20, 'Xiaomi 13 Pro.png', 'Xiaomi'),
(000069, 'Redmi K60 Ultra\r\n', 'ชิปเซ็ต: MediaTek Dimensity 9200\r\nหน้าจอ: 144Hz AMOLED\r\nเน้นการเล่นเกมและการใช้งานหนัก\r\n', 004, 40000.00, 20, 'Redmi K60 Ultra.png', 'Xiaomi'),
(000070, 'Xiaomi 12T Pro\r\n', 'กล้อง: 200MP\r\nแบตเตอรี่: 5,000mAh, ชาร์จไว 120W\r\nฟีเจอร์ครบครันในราคาที่เข้าถึงได้\r\n', 004, 40000.00, 20, 'Xiaomi 12T Pro.png', 'Xiaomi'),
(000071, 'Redmi Note 12 Turbo\r\n', 'ชิปเซ็ต: Snapdragon 7+ Gen 2\r\nเน้นประสิทธิภาพการใช้งานและแบตเตอรี่ทนทาน', 004, 40000.00, 20, 'Redmi Note 12 Turbo.png', 'Xiaomi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `orderID` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'เลขที่ใบสั่งซื้อ',
  `cus_name` varchar(60) NOT NULL COMMENT 'ชื่อ-นามสกุล',
  `address` text NOT NULL COMMENT 'ที่อยู่การจัดส่งสินค้า',
  `telephone` varchar(10) NOT NULL COMMENT 'เบอร์โทรศัพท์',
  `total_price` float NOT NULL COMMENT 'ราคารวมสุทธิ',
  `order_status` varchar(1) NOT NULL COMMENT '0=ยกเลิก,1=ยังไม่ชำระเงิน,2=ชำระเงิน',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สั่งซื้อ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`orderID`, `cus_name`, `address`, `telephone`, `total_price`, `order_status`, `reg_date`) VALUES
(0000000001, 'สมชาย หมายดี', ' 113/142 ม.3 ต.เมืองที อ.เมือง จ.อยุธยา', '0988889955', 120000, '1', '2024-10-19 15:22:02'),
(0000000002, 'นานา สมดี', '  113/142 ม.3 ต.เมืองที อ.เมือง จ.อยุธยา', '0983737379', 160000, '1', '2024-10-19 15:29:12'),
(0000000003, 'นานา สมดี', '  113/142 ม.3 ต.เมืองที อ.เมือง จ.อยุธยา', '0983737379', 160000, '1', '2024-10-19 15:31:13'),
(0000000004, 'นานา สมดี', '  113/142 ม.3 ต.เมืองที อ.เมือง จ.อยุธยา', '0987676754', 160000, '1', '2024-10-19 15:32:03'),
(0000000005, 'นานี สมดี', '  113/142 ม.3 ต.เมืองที อ.เมือง จ.อยุธยา', '0987676754', 160000, '1', '2024-10-19 15:34:07'),
(0000000006, 'มุนี สมดี', ' 113/142 ม.3 ต.เมืองที อ.เมือง จ.อยุธยา\r\n', '0898933421', 200000, '1', '2024-10-19 15:36:04'),
(0000000007, 'สมหญิง หมายดี', '   113/142 ม.3 ต.เมืองที อ.เมือง จ.อยุธยา\r\n', '093243212', 80000, '1', '2024-10-19 15:37:46'),
(0000000008, 'นานา สมดี', ' 114/23 ', '0898787654', 280000, '1', '2024-10-19 15:49:20'),
(0000000009, 'สมชาย หมายดี', '  112/121 TTT', '0847353633', 120000, '1', '2024-10-19 15:54:49'),
(0000000010, 'นานา สมดี', '  jtrhfd', '323423', 40000, '1', '2024-10-19 15:59:19'),
(0000000011, 'นานา สมดี', '  rgrdf', '232323', 80000, '1', '2024-10-19 18:34:45'),
(0000000012, 'สมชาย หมายดี', '  112/121 อ.เมือง จ.อยุธยา', '07865456', 160000, '1', '2024-10-19 19:34:15'),
(0000000013, 'นานา สมดี', '  kg', '90', 80000, '1', '2024-10-19 20:03:48'),
(0000000014, 'นานา สมดี', '  gx', '9867', 40000, '1', '2024-10-20 08:03:41'),
(0000000015, 'jou', '  i', '098', 40000, '1', '2024-10-20 08:21:04'),
(0000000016, 'สมชาย หมายดี', ' ด', '13', 360000, '1', '2024-10-20 10:15:58'),
(0000000017, 'นานี สมดี', ' yfg', '56', 160000, '1', '2024-10-21 09:02:36'),
(0000000018, 'สมชาย หมายดี', ' ส้แปดเ้า่าสาน้ร', '9876756456', 200000, '1', '2024-10-21 13:54:38'),
(0000000019, 'นานา สมดี', ' pkify', '098765', 480000, '1', '2024-10-22 04:31:33'),
(0000000020, 'gtfv', ' fgg', '111', 80000, '1', '2024-10-22 08:19:40'),
(0000000021, 'นานา สมดี', ' 113/123 ต.เขาใหญ่ อ.เมือง จ.อยุธยา', '0809909876', 120000, '1', '2024-10-22 08:25:46'),
(0000000022, 'นานา สมดี', ' jgft', '543456789', 320000, '1', '2024-10-22 08:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(3) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสประเภทสินค้า',
  `type_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อประเภทสินค้า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(001, 'IPHONE'),
(002, 'SAMSUNG'),
(003, 'VIVO'),
(004, 'XIAOMI'),
(005, 'OPPO'),
(006, 'REALME');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับที่', AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pro_id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า', AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `orderID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'เลขที่ใบสั่งซื้อ', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภทสินค้า', AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
