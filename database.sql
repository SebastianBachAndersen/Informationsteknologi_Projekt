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
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_id` (`login_id`),
  CONSTRAINT `FK_bruger_login` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table informationsteknologi.bruger: ~7 rows (approximately)
/*!40000 ALTER TABLE `bruger` DISABLE KEYS */;
INSERT INTO `bruger` (`id`, `fornavn`, `efternavn`, `alder`, `klasse`, `totalmoduler`, `login_id`) VALUES
	(20, 'ulrik ', 'magnusson', 19, '23', '150', 15),
	(22, 'ulrik ', 'magnusson', 19, '23', '150', 20),
	(26, 'ulrik ', 'magnusson', 19, '23', '150', 24),
	(28, 'ulrik ', 'magnusson', 19, '23', '150', 26),
	(34, 'ulrik', 'mangusson', 21, '8i', '150', 32),
	(40, 'ulrik ', 'magnusson', 19, '23', '150', 38),
	(42, 'ulrik ', 'magnusson', 19, '23', '150', 40);
/*!40000 ALTER TABLE `bruger` ENABLE KEYS */;

-- Dumping structure for procedure informationsteknologi.create_user
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user`(
	IN `username` VARCHAR(50),
	IN `PASSWORD` VARCHAR(255),
	IN `fornavn` VARCHAR(50),
	IN `efternavn` VARCHAR(50),
	IN `alder` INT,
	IN `klasse` VARCHAR(50),
	IN `totalmoduler` INT




)
BEGIN

 	DECLARE CONTINUE HANDLER FOR 1062
 	SELECT CONCAT('duplicate keys found') AS msg;
 	
	INSERT INTO login (username, PASSWORD) VALUES (username,PASSWORD);
	

	
	SELECT @id := MAX(ID) FROM login WHERE username = username ;
	
	INSERT INTO bruger (fornavn, efternavn, alder,klasse ,totalmoduler, login_id) VALUES (fornavn, efternavn, alder, klasse, totalmoduler, @id);
	


END//
DELIMITER ;

-- Dumping structure for view informationsteknologi.getpunishmentdataonstudent
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `getpunishmentdataonstudent` (
	`id` INT(11) NOT NULL,
	`straf` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`subject` ENUM('Dansk','Matematik','kemi','fysik','informationsteknologi') NULL COLLATE 'latin1_swedish_ci',
	`bruger_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table informationsteknologi.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Dumping data for table informationsteknologi.login: ~7 rows (approximately)
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`id`, `username`, `password`) VALUES
	(15, 'ulrik', '$2y$10$QpdsSRULUuCI2wP3UpatjOKUV.H1CUtdCCFB1TjK4rP'),
	(20, 'ul1rik', '$2y$10$K44BVe2Yt07AGWjkXYnYQeCoXyp/a/ezL/c1ON1N6dX'),
	(24, 'ul1r1ik', '$2y$10$H2eZEa3UpWJBAh73m9HpUedXQkZu/R16YSeAUlP.UjE'),
	(26, 'ul12r1ik', '$2y$10$S8did3BHPCGZ7aZ.NlmWIe5E4akEJMxYyF84YpVrr1z'),
	(32, 'aqwe', 'Password1'),
	(38, 'ul12r1ikas', '$2y$10$47rbZFDH4MiaP8B5MGyC4.GLGo9MLev8EGd7t4n6L2tTBtLDP7.UG'),
	(40, 'ulrik123', '$2y$10$Ez77jR4A34qIZNCJi0nKXuF2fPEKyLALQfce.2.4GDBEGWac.aDN2');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- Dumping structure for table informationsteknologi.moduler
CREATE TABLE IF NOT EXISTS `moduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bruger_id` int(11) NOT NULL DEFAULT '0',
  `attendance` bit(1) NOT NULL DEFAULT b'0',
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table informationsteknologi.moduler: ~0 rows (approximately)
/*!40000 ALTER TABLE `moduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `moduler` ENABLE KEYS */;

-- Dumping structure for table informationsteknologi.opgaver
CREATE TABLE IF NOT EXISTS `opgaver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `karakter` enum('-3','00','02','4','7','10','12') NOT NULL,
  `bruger_id` int(11) NOT NULL,
  `opgave_karakter` varchar(50) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table informationsteknologi.opgaver: ~2 rows (approximately)
/*!40000 ALTER TABLE `opgaver` DISABLE KEYS */;
INSERT INTO `opgaver` (`id`, `karakter`, `bruger_id`, `opgave_karakter`, `subject_id`) VALUES
	(1, '02', 40, 'do it better ', 2),
	(2, '7', 40, '8ds', 2);
/*!40000 ALTER TABLE `opgaver` ENABLE KEYS */;

-- Dumping structure for table informationsteknologi.strafe
CREATE TABLE IF NOT EXISTS `strafe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bruger_id` int(11) NOT NULL DEFAULT '0',
  `straf` varchar(50) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_strafe_subjects` (`subject_id`),
  CONSTRAINT `FK_strafe_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table informationsteknologi.strafe: ~2 rows (approximately)
/*!40000 ALTER TABLE `strafe` DISABLE KEYS */;
INSERT INTO `strafe` (`id`, `bruger_id`, `straf`, `subject_id`) VALUES
	(1, 40, 'prøv igen', 2),
	(3, 40, 'av', 1);
/*!40000 ALTER TABLE `strafe` ENABLE KEYS */;

-- Dumping structure for table informationsteknologi.subjects
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` enum('Dansk','Matematik','kemi','fysik','informationsteknologi') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table informationsteknologi.subjects: ~5 rows (approximately)
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`id`, `subject`) VALUES
	(1, 'Dansk'),
	(2, 'Matematik'),
	(3, 'kemi'),
	(4, 'fysik'),
	(5, 'informationsteknologi');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;

-- Dumping structure for view informationsteknologi.getpunishmentdataonstudent
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `getpunishmentdataonstudent`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getpunishmentdataonstudent` AS SELECT  strafe.id,strafe.straf, subjects.subject ,strafe.bruger_id
 FROM subjects
 INNER JOIN 
 strafe  ON strafe.subject_id  = subjects.id ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
