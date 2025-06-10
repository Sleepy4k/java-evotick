-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for evotick
CREATE DATABASE IF NOT EXISTS `evotick` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `evotick`;

-- Dumping structure for table evotick.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` varchar(36) NOT NULL,
  `username` char(50) NOT NULL,
  `full_name` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `password` char(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.admin: ~1 rows (approximately)
INSERT INTO `admin` (`admin_id`, `username`, `full_name`, `email`, `password`) VALUES
	('13075565-4f59-43a6-96df-c2ce7586ddb2', 'benjamin', 'Apri Data', 'sarahpalastrin@gmail.com', '$2a$12$jFL6XSfwpzEaXhYtCIqFmeEqRA.k.0IyA9Yj2St.x5ate34519sRS');

-- Dumping structure for table evotick.event_status
CREATE TABLE IF NOT EXISTS `event_status` (
  `status_id` char(36) NOT NULL,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.event_status: ~1 rows (approximately)
INSERT INTO `event_status` (`status_id`, `name`) VALUES
('6c59f690-9baf-415a-bf7a-89e0be7076a8', 'ongoing'),
('e934d074-9d1b-49b9-8c7e-49b1e614e32d', 'pre-order');

-- Dumping structure for table evotick.event_type
CREATE TABLE IF NOT EXISTS `event_type` (
  `type_event_id` char(36) NOT NULL,
  `title` char(50) NOT NULL,
  `guest` char(50) DEFAULT NULL,
  `duration` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rules` char(50) NOT NULL,
  `venue` char(50) NOT NULL,
  PRIMARY KEY (`type_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.event_type: ~1 rows (approximately)
INSERT INTO `event_type` (`type_event_id`, `title`, `guest`, `duration`, `rules`) VALUES
('d3efe6c3-6774-4709-9058-1fe2fad473f8', 'olahraga', 'Atlet Profesional', '2025-06-10 07:39:18', '<li>Peserta wajib registrasi ulang.</li><li>Gunaka'),
('dff2806b-47cf-4910-bd1d-987b1bf44765', 'konser', 'Bintang Tamu', '2025-06-10 07:39:08', '<li>Dilarang membawa kamera profesional.</li><li>D'),
('f214673b-be0e-4ab0-86fd-5ec805ba0c93', 'seminar', 'Guest Star', '2025-06-10 07:39:30', '<li>dsgsdg</li><li>test</li>');

-- Dumping structure for table evotick.events
CREATE TABLE IF NOT EXISTS `events` (
  `event_id` char(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `location` varchar(100) NOT NULL,
  `status_id` char(50) NOT NULL,
  `type_id` char(50) NOT NULL,
  `penyelenggara` varchar(100) NOT NULL,
  `poster_url` varchar(255) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `status_id` (`status_id`),
  KEY `type_id` (`type_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `event_status` (`status_id`) ON UPDATE CASCADE,
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `event_type` (`type_event_id`) ON UPDATE CASCADE,
  CONSTRAINT `events_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `admin` (`admin_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.events: ~1 rows (approximately)
INSERT INTO `events` (`event_id`, `name`, `description`, `start_date`, `end_date`, `location`, `status_id`, `type_id`, `penyelenggara`, `poster_url`, `created_by`) VALUES
('08587b43-34b2-42a4-9c3d-389e5d9a0881', 'PETRONAS GRAND PRIX OF MALAYSIA 2025', 'Siap-siaplah untuk aksi seru yang mendebarkan di edisi ke-26 PETRONAS GRAND PRIX OF MALAYSIA! Acara ini akan berlangsung dari tanggal 24 hingga 24 Oktober 2025, acara ini menandai Round 21 di kalender MotoGP™ dan akan memicu adrenalin di lintasan ikonik PETRONAS Sepang International Circuit (PETRONAS SIC). Dengan panjang 5.543 km dan 15 tikungan, bersiaplah untuk menyaksikan momen-momen yang memacu jantung saat para pembalap mengejar batasnya, mencapai kecepatan lebih dari 300 km/jam! Bagi para pencinta adrenalin dan penggemar olahraga otomotif, jangan lewatkan kesempatan Anda untuk merasakan acara balap terbaik di Malaysia! ', '2025-06-10 10:13:09', '2025-10-01 15:13:10', 'Sirquit Petronas, Malaysia', '6c59f690-9baf-415a-bf7a-89e0be7076a8', 'd3efe6c3-6774-4709-9058-1fe2fad473f8', 'MOTO GP', 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/platform-mweb-high/events/2025/03/13/bfe5eea5-9c88-4603-b357-19b8eb5207fd-1741841406411-5c872ce3e7bdc6c23cd8599f6ad20b62.jpg', '13075565-4f59-43a6-96df-c2ce7586ddb2'),
('34538bdc-a2ab-4599-8b75-7bfc755602da', 'Seminar Dengan Anomali', 'ya biasa', '2025-06-10 03:05:51', '2025-06-10 04:05:52', 'purwokerto', 'e934d074-9d1b-49b9-8c7e-49b1e614e32d', 'f214673b-be0e-4ab0-86fd-5ec805ba0c93', 'YPT', 'https://th.bing.com/th/id/OIP.FqSxBcU1STzPV4MYK8hjxwHaEj?rs=1&pid=ImgDetMain', '13075565-4f59-43a6-96df-c2ce7586ddb2'),
('477a9d97-ca09-4d2a-b475-7c58c6a5307e', 'KOSTCON - Korean OST Concert In Jakarta', 'Setelah sukses besar di Seoul dan berbagai kota besar di Asia, KOSTCON (Korean OST Concert) akhirnya akan hadir di Jakarta! Perayaan musik yang sangat dinantikan ini akan mempertemukan suara-suara paling ikonik dalam dunia soundtrack drama Korea (Lyn, Kim Bum Soo, K.Will, Soyou, Heize, dan Lee Mujin) dalam satu malam yang tak terlupakan. Dikenal melalui penampilan emosional dan lagu-lagu OST hits yang telah mewarnai berbagai K-Drama populer, keenam penyanyi berbakat ini akan membawa para penggemar menyusuri kembali adegan-adegan paling membekas dalam sejarah drama Korea.\r\n\r\nSetelah sukses besar di Seoul dan berbagai kota besar di Asia, KOSTCON (Korean OST Concert) akhirnya akan hadir di Jakarta! Perayaan musik yang sangat dinantikan ini akan mempertemukan suara-suara paling ikonik dalam dunia soundtrack drama Korea (Lyn, Kim Bum Soo, K.Will, Soyou, Heize, dan Lee Mujin) dalam satu malam yang tak terlupakan. Dikenal melalui penampilan emosional dan lagu-lagu OST hits yang telah mewarnai berbagai K-Drama populer, keenam penyanyi berbakat ini akan membawa para penggemar menyusuri kembali adegan-adegan paling membekas dalam sejarah drama Korea.', '2025-08-02 15:04:22', '2025-08-02 18:04:22', 'Gelora Bung Karno, Jakarta', '6c59f690-9baf-415a-bf7a-89e0be7076a8', 'dff2806b-47cf-4910-bd1d-987b1bf44765', 'Holywing', 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/platform-mweb-high/events/2025/05/05/a9f66184-517e-4f47-9d1a-aeb736894216-1746379030857-cb01494c84070fd8078ef998fc419867.png', '13075565-4f59-43a6-96df-c2ce7586ddb2'),
('9102a8a8-02be-44c2-9e37-4755a430eab0', 'Callebaut Grand Baking Demo With Kirsten Tibballs', 'Jangan lewatkan kesempatan langka untuk menyaksikan langsung aksi dari Chef Kirsten Tibballs, pastry chef dan chocolatier kelas dunia, di acara Grand Baking Demo by Callebaut! Berasal dari Australia, Chef Kirsten akan membagikan teknik-teknik andalannya dan mengungkap rahasia di balik kreasi dessert-nya yang memukau, semuanya dibuat menggunakan cokelat premium dari Callebaut.', '2025-06-10 10:15:58', '2025-07-09 15:15:59', 'St. Regis, Jakarta', '6c59f690-9baf-415a-bf7a-89e0be7076a8', 'f214673b-be0e-4ab0-86fd-5ec805ba0c93', 'Callebaut', 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/platform-mweb-high/events/2025/05/02/11e2db96-50f3-4ef9-9400-1fd2b7452fdc-1746174918049-a34ffd9d12eb1c0de42ec4714b4b55f0.jpg', '13075565-4f59-43a6-96df-c2ce7586ddb2'),
('9f6a489d-c576-4d89-ae21-00d1177b194b', 'BLACKPINK WORLD TOUR <DEADLINE> IN JAKARTA - DAY 1', 'Girl group global ikonik, BLACKPINK telah mengumumkan tur Asia mereka sebagai rangkaian tur dunia, BLACKPINK WORLD TOUR <DEADLINE>! Tur ini menandai comeback pertama mereka setelah tur dunia bersejarah, BORN PINK di tahun 2022-2023.\r\n\r\nJakarta, bersiap untuk BLACKPINK WORLD TOUR <DEADLINE> IN JAKARTA yang akan berlangsung pada 1-2 November 2025 di Stadion Utama Gelora Bung Karno, Jakarta!', '2025-11-11 14:52:56', '2025-11-11 20:52:56', 'Istora Senayan, Jakarta', 'e934d074-9d1b-49b9-8c7e-49b1e614e32d', 'dff2806b-47cf-4910-bd1d-987b1bf44765', 'YtFunny', 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit1440960gsm/events/2025/06/06/53f80e45-7ec1-44da-b969-fb3eac0f9740-1749193315996-c828dd6126193d6476c903ee8413be7e.jpeg', '13075565-4f59-43a6-96df-c2ce7586ddb2'),
('a4c8bc54-4474-4067-842f-b36ffe75f4d8', 'Market Outlook 2H 2025', 'Ikuti webinar edukatif seputar pasar modal yang dirancang khusus untuk masyarakat umum dan investor ritel cerdas yang ingin meningkatkan literasi keuangan dan kemampuan analisis investasi. Webinar ini disampaikan oleh para ahli berpengalaman di bidang pasar modal, sehingga sangat cocok bagi pemula maupun investor berpengalaman yang ingin memperluas wawasan. Dapatkan informasi yang relevan dan praktis untuk mendukung pengambilan keputusan investasi yang lebih bijak dan terarah.\r\n\r\n', '2025-06-10 10:15:58', '2025-07-16 15:15:59', 'Zoom Link', '6c59f690-9baf-415a-bf7a-89e0be7076a8', 'f214673b-be0e-4ab0-86fd-5ec805ba0c93', 'YUDI CHEN', 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/platform-mweb-high/events/2025/05/05/1bf2bceb-eded-4d36-b3c8-5805e1e36e57-1746426402170-5cd9f1491c61366368fec7a8d9621d5d.png', '13075565-4f59-43a6-96df-c2ce7586ddb2'),
('cf8d09be-279c-483a-a163-bf8ba82a301f', 'One Pride Fight Night 87', 'Saksikan pertarungan sengit yang memadukan kekuatan seni bela diri Indonesia seperti pencak silat dengan gaya global seperti Muay Thai dan Brazilian Jiu-jitsu.\r\nSetiap pertandingan bukan hanya tentang menang atau kalah, tapi juga panggung bagi petarung lokal untuk menunjukkan kemampuan terbaik mereka.\r\nAtmosfer acara yang meriah dan penuh semangat membuat setiap detik pertandingan jadi hiburan yang seru dan tak terlupakan.\r\nYuk, dukung petarung favoritmu dan rasakan serunya atmosfer One Pride MMA langsung dari tempatnya!\r\n\r\n', '2025-06-10 15:09:39', '2025-06-14 15:09:39', 'Cibeunying Kaler, Bandung', '6c59f690-9baf-415a-bf7a-89e0be7076a8', 'd3efe6c3-6774-4709-9058-1fe2fad473f8', 'BYON', 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/platform-mweb-high/events/2025/06/03/561cec15-f120-43a2-aed4-c33496f68f1d-1748929536583-f7e14b506e841139bd50953c2b6e688e.jpg', '13075565-4f59-43a6-96df-c2ce7586ddb2');

-- Dumping structure for table evotick.event_package
CREATE TABLE IF NOT EXISTS `event_package` (
  `type_package_id` char(36) NOT NULL,
  `name` char(50) NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `quota` int(11) NOT NULL,
  `detail` text NOT NULL,
  `event_id` char(50) NOT NULL,
  PRIMARY KEY (`type_package_id`),
  KEY `event_package_ibfk_1` (`event_id`),
  CONSTRAINT `event_package_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.event_package: ~1 rows (approximately)
INSERT INTO `event_package` (`type_package_id`, `name`, `price`, `quota`, `detail`, `event_id`) VALUES
('11df713f-45e9-11f0-9847-0a0027000010', 'Bronze', 200.000, 10, 'Udah enak tuh', '08587b43-34b2-42a4-9c3d-389e5d9a0881'),
('11df8567-45e9-11f0-9847-0a0027000010', 'Gold', 500.000, 13, 'Lebih dari enak tuh', '08587b43-34b2-42a4-9c3d-389e5d9a0881'),
('11df909c-45e9-11f0-9847-0a0027000010', 'Platinum', 700.000, 15, 'Wes pokok enak bet', '08587b43-34b2-42a4-9c3d-389e5d9a0881'),
('18b4fc74-45e5-11f0-9847-0a0027000010', 'Bronze', 200.000, 10, 'Udah enak pokoknya', '9f6a489d-c576-4d89-ae21-00d1177b194b'),
('18b50840-45e5-11f0-9847-0a0027000010', 'Gold', 500.000, 13, 'Lebih dari enak pokoknya', '9f6a489d-c576-4d89-ae21-00d1177b194b'),
('18b51206-45e5-11f0-9847-0a0027000010', 'Platinum', 700.000, 15, 'Wis paling mantapp', '9f6a489d-c576-4d89-ae21-00d1177b194b'),
('33cd5826-45ef-11f0-9847-0a0027000010', 'Bronze', 100.000, 10, '+ Sertifikat\r\n', 'a4c8bc54-4474-4067-842f-b36ffe75f4d8'),
('33cd6b7e-45ef-11f0-9847-0a0027000010', 'Gold', 120.000, 13, '+ Sertifikat\r\n+ Mercendise', 'a4c8bc54-4474-4067-842f-b36ffe75f4d8'),
('33cd79eb-45ef-11f0-9847-0a0027000010', 'Platinum', 200.000, 15, '+ Sertifikat\r\n+ Mercendise\r\n+ Member Market', 'a4c8bc54-4474-4067-842f-b36ffe75f4d8'),
('751e14fb-45e4-11f0-9847-0a0027000010', 'Bronze', 200.000, 10, 'Enak pokoknya', '477a9d97-ca09-4d2a-b475-7c58c6a5307e'),
('751e209a-45e4-11f0-9847-0a0027000010', 'Gold', 500.000, 13, 'Lebih dari enak pokoknya', '477a9d97-ca09-4d2a-b475-7c58c6a5307e'),
('751e2a02-45e4-11f0-9847-0a0027000010', 'Platinum', 700.000, 15, 'Wiss paling mantepp', '477a9d97-ca09-4d2a-b475-7c58c6a5307e'),
('79b46458-a271-4486-9ca1-4c48aa8456dc', 'Platinum', 25000.000, 12, 'ya begitulah', '34538bdc-a2ab-4599-8b75-7bfc755602da'),
('a01a2be1-45e3-11f0-9847-0a0027000010', 'Bronze', 250.000, 10, 'Udah enak pokoknya', '34538bdc-a2ab-4599-8b75-7bfc755602da'),
('b1ffaa89-45ee-11f0-9847-0a0027000010', 'Bronze', 100.000, 10, '+ Sertifikat', '9102a8a8-02be-44c2-9e37-4755a430eab0'),
('b1ffbc5d-45ee-11f0-9847-0a0027000010', 'Gold', 120.000, 13, '+ Sertifikat\r\n+ Merchendise', '9102a8a8-02be-44c2-9e37-4755a430eab0'),
('b1ffcb1d-45ee-11f0-9847-0a0027000010', 'Platinum', 200.000, 15, '+ Sertifikat\r\n+ Merchendise\r\n+ Magang', '9102a8a8-02be-44c2-9e37-4755a430eab0'),
('d744e701-45ec-11f0-9847-0a0027000010', 'Reguler', 200.000, 10, 'Paling depan nontonnnya', 'cf8d09be-279c-483a-a163-bf8ba82a301f'),
('d74509cb-45ec-11f0-9847-0a0027000010', 'VIP', 500.000, 13, 'Lumayan nyaman liatnya', 'cf8d09be-279c-483a-a163-bf8ba82a301f'),
('d74523f2-45ec-11f0-9847-0a0027000010', 'VVIP', 700.000, 15, 'Wes paling PW(Panggon Wenak)', 'cf8d09be-279c-483a-a163-bf8ba82a301f'),
('f03083ac-45e3-11f0-9847-0a0027000010', 'Gold', 850.000, 11, 'Lebih dari enak pokoknya', '34538bdc-a2ab-4599-8b75-7bfc755602da');

-- Dumping structure for table evotick.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` char(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.users: ~1 rows (approximately)
INSERT INTO `users` (`user_id`, `username`, `full_name`, `email`, `password`, `phone`, `address`) VALUES
('56f2bfe8-33a9-447f-a536-b7efd3541b66', 'rangga', 'Rangga', 'rangga@gmail.com', '$2a$12$81IRqnhUrURxi8uTiDxsHOOLymRyVlHGyI2qK0rdxj955O4UwgbPi', '000', 'pwt'),
('79b46458-a271-4486-9ca1-4c48aa86bdfc', 'sleepykz', 'Apri Pandu Wicaksono', 'pandu300478@gmail.com', '$2a$12$DJI7T4h1Z1KfsAl0vaYDSuEQ/yve7LdTqdiHv8ul0HeT/kqqw26ZO', '081318977078', 'Jl utama blok c no 8 rt 1 rw 7 perum griya satria indah sumampir, sumampir, purwokerto utara, banyumas');

-- Dumping structure for table evotick.transaction_status
CREATE TABLE IF NOT EXISTS `transaction_status` (
  `transaction_status_id` char(50) NOT NULL,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`transaction_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.transaction_status: ~0 rows (approximately)

-- Dumping structure for table evotick.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` char(50) NOT NULL,
  `event_id` char(50) NOT NULL,
  `user_id` char(50) NOT NULL,
  `purchased_at` datetime NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status_id` char(50) NOT NULL,
  `package_id` char(50) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  KEY `purchased_at` (`purchased_at`),
  KEY `transactions_ibfk_4` (`package_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `transaction_status` (`transaction_status_id`) ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`package_id`) REFERENCES `event_package` (`type_package_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.transactions: ~0 rows (approximately)

-- Dumping structure for table evotick.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `ticket_id` char(50) NOT NULL,
  `transaction_id` char(50) NOT NULL,
  `unique_code` char(50) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `unique_code` (`unique_code`),
  KEY `transaction_id` (`transaction_id`),
  KEY `unique_code_2` (`unique_code`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table evotick.tickets: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
