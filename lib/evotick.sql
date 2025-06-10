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
	('79b46458-a271-4486-9ca1-4c48aa8456dc', 'pre-order');

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
INSERT INTO `event_type` (`type_event_id`, `title`, `guest`, `duration`, `rules`, `venue`) VALUES
	('79b46458-a271-4486-9ca1-4c48aa86bdfc', 'seminar', 'saya', '2025-06-09 21:27:03', '<li>dsgsdg</li><li>test</li>', 'telkom');

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
	('79b46458-a271-4486-9ca1-4c48aa86bdfc', 'Seminar Dengan Anomali', 'ya biasa', '2025-06-10 03:05:51', '2025-06-10 04:05:52', 'purwokerto', '79b46458-a271-4486-9ca1-4c48aa8456dc', '79b46458-a271-4486-9ca1-4c48aa86bdfc', 'YPT', 'https://th.bing.com/th/id/OIP.FqSxBcU1STzPV4MYK8hjxwHaEj?rs=1&pid=ImgDetMain', '13075565-4f59-43a6-96df-c2ce7586ddb2');

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
	('79b46458-a271-4486-9ca1-4c48aa8456dc', 'Platinum', 25000.000, 12, 'ya begitulah', '79b46458-a271-4486-9ca1-4c48aa86bdfc');

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
