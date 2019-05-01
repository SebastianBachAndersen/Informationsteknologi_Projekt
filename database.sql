-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5483
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for informationsteknologi
CREATE DATABASE IF NOT EXISTS `informationsteknologi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `informationsteknologi`;

-- Dumping structure for table informationsteknologi.bruger
CREATE TABLE IF NOT EXISTS `bruger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fornavn` varchar(50) DEFAULT NULL,
  `efternavn` varchar(50) DEFAULT NULL,
  `alder` int(11) DEFAULT NULL,
  `klasse` varchar(50) DEFAULT NULL,
  `totalmoduler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table informationsteknologi.moduler
CREATE TABLE IF NOT EXISTS `moduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bruger_id` int(11) NOT NULL DEFAULT '0',
  `attendance` bit(1) NOT NULL DEFAULT b'0',
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table informationsteknologi.opgaver
CREATE TABLE IF NOT EXISTS `opgaver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `karakter` enum('-3','00','02','4','7','10','12') NOT NULL,
  `opgave_id` int(11) NOT NULL,
  `bruger_id` int(11) NOT NULL,
  `opgave_karakter` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table informationsteknologi.straf
CREATE TABLE IF NOT EXISTS `straf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bruger_id` int(11) NOT NULL DEFAULT '0',
  `karakter_id` int(11) NOT NULL DEFAULT '0',
  `straf` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
