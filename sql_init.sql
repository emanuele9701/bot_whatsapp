-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.24-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database gmaps
CREATE DATABASE IF NOT EXISTS `gmaps` /*!40100 DEFAULT CHARACTER SET utf16 COLLATE utf16_unicode_ci */;
USE `gmaps`;

-- Dump della struttura di tabella gmaps.history_msg
CREATE TABLE IF NOT EXISTS `history_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_from` text COLLATE utf16_unicode_ci DEFAULT NULL,
  `msg_body` longtext COLLATE utf16_unicode_ci DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Indice 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- Dump dei dati della tabella gmaps.history_msg: ~2 rows (circa)
/*!40000 ALTER TABLE `history_msg` DISABLE KEYS */;
INSERT INTO `history_msg` (`id`, `msg_from`, `msg_body`, `datetime`) VALUES
	(1, '393348261327@c.us', 'Pippo', '2022-05-02 00:53:12');
INSERT INTO `history_msg` (`id`, `msg_from`, `msg_body`, `datetime`) VALUES
	(2, '393348261327@c.us', 'Un altro messaggio di test', '2022-05-02 01:11:59');
/*!40000 ALTER TABLE `history_msg` ENABLE KEYS */;

-- Dump della struttura di tabella gmaps.history_msg_answer
CREATE TABLE IF NOT EXISTS `history_msg_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_msg_from` int(11) DEFAULT NULL,
  `answer` longtext COLLATE utf16_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Indice 1` (`id`),
  KEY `FK__history_msg` (`id_msg_from`),
  CONSTRAINT `FK__history_msg` FOREIGN KEY (`id_msg_from`) REFERENCES `history_msg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- Dump dei dati della tabella gmaps.history_msg_answer: ~2 rows (circa)
/*!40000 ALTER TABLE `history_msg_answer` DISABLE KEYS */;
INSERT INTO `history_msg_answer` (`id`, `id_msg_from`, `answer`, `date`) VALUES
	(1, 1, 'Prova di risposta', '2022-05-02 01:07:54');
INSERT INTO `history_msg_answer` (`id`, `id_msg_from`, `answer`, `date`) VALUES
	(2, 2, 'Questa Ã¨ la risposta al messaggio di prova', '2022-05-02 01:14:31');
/*!40000 ALTER TABLE `history_msg_answer` ENABLE KEYS */;

-- Dump della struttura di vista gmaps.msg_answers
-- Creazione di una tabella temporanea per risolvere gli errori di dipendenza della vista
CREATE TABLE `msg_answers` (
	`id_msg_ricevuto` INT(11) NOT NULL,
	`mittente` TEXT(32767) NULL COLLATE 'utf16_unicode_ci',
	`messaggio_ricevuto` LONGTEXT NULL COLLATE 'utf16_unicode_ci',
	`data_ricezione_mex` TIMESTAMP NULL,
	`id_risposta` INT(11) NULL,
	`risposta` LONGTEXT NULL COLLATE 'utf16_unicode_ci',
	`data_risposta` TIMESTAMP NULL
) ENGINE=MyISAM;

-- Dump della struttura di tabella gmaps.tmp_nums
CREATE TABLE IF NOT EXISTS `tmp_nums` (
  `tmp_nums_id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(50) COLLATE utf16_unicode_ci DEFAULT NULL,
  `date_add` timestamp NULL DEFAULT current_timestamp(),
  UNIQUE KEY `univocità` (`numero`),
  KEY `Indice 1` (`tmp_nums_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1185 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- Dump dei dati della tabella gmaps.tmp_nums: ~0 rows (circa)
/*!40000 ALTER TABLE `tmp_nums` DISABLE KEYS */;
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(1, '3488791869', '2022-05-05 01:00:05');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(2, '3485179986', '2022-05-05 01:00:05');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(3, '3317147652', '2022-05-05 01:00:05');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(4, '3461885316', '2022-05-05 01:00:05');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(5, '3425476848', '2022-05-05 01:00:05');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(6, '3476480248', '2022-05-05 01:00:05');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(7, '3791566086', '2022-05-05 01:00:05');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(8, '3278411612', '2022-05-05 01:00:05');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(9, '3458183482', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(10, '3496268645', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(11, '3385444204', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(12, '3287252261', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(13, '3391509425', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(14, '3200745795', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(15, '3493905444', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(16, '3291546933', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(17, '3314371569', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(18, '3388734556', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(19, '3486011384', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(20, '3406011239', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(21, '3477958365', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(22, '3476230592', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(23, '3664585302', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(24, '3381866489', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(25, '3516663062', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(26, '3471972824', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(27, '3389743948', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(28, '3381065099', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(29, '3209520025', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(30, '3928779910', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(31, '3288591670', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(32, '3208644763', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(33, '3493982323', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(34, '3249553500', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(35, '3923705179', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(36, '3294076558', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(37, '3337900362', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(38, '3895132122', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(39, '3926497066', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(40, '3317657112', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(41, '3248114798', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(42, '8119913174', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(43, '3476910464', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(44, '3341821608', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(45, '3922286916', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(46, '3205651893', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(47, '3920541684', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(48, '3313132381', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(49, '3491073337', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(50, '3925928888', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(51, '3886534836', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(52, '3661251155', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(53, '3791604565', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(54, '3383960623', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(55, '3337715963', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(56, '3922538649', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(57, '3473483266', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(58, '3285982408', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(59, '3397269771', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(60, '3312961138', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(61, '3294038293', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(62, '3286450326', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(63, '3480581607', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(64, '3938499248', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(65, '3382775577', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(66, '3286193504', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(67, '3382234592', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(68, '3395997843', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(69, '3494152132', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(70, '3487609174', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(71, '3805918400', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(72, '3348081782', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(73, '3469682165', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(74, '3288477782', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(75, '3519498990', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(76, '3314148174', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(77, '3476294952', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(78, '3297899192', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(79, '3278827448', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(80, '3313373348', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(81, '3358311640', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(82, '3284217218', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(83, '3391538644', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(84, '3927646767', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(85, '3489724016', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(86, '3394825886', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(87, '3317369664', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(88, '3206015033', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(89, '3334051224', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(90, '3932140325', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(91, '3381730954', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(92, '3491307262', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(93, '3737630226', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(94, '3488551982', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(95, '3911731324', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(96, '3349465311', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(97, '3880531416', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(98, '3921736700', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(99, '3495895862', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(100, '3475750204', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(101, '3663160279', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(102, '3460098608', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(103, '3314005240', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(104, '3663941809', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(105, '3382005172', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(106, '3398202831', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(107, '3807664131', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(108, '3203066744', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(109, '3455853093', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(110, '3426983858', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(111, '3389008238', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(112, '0811993607', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(113, '3925868736', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(114, '3405634301', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(115, '3383030033', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(116, '3280349268', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(117, '3496373700', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(118, '3207478466', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(119, '3664856980', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(120, '3333726352', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(121, '3384304190', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(122, '3397855654', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(123, '3487434269', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(124, '3240798747', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(125, '3338487300', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(126, '3395786009', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(127, '3939267090', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(128, '3342884061', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(129, '3356798819', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(130, '3358073562', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(131, '3496857043', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(132, '3899319985', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(133, '3756731454', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(134, '3491982351', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(135, '3331399278', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(136, '3481111590', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(137, '3498157901', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(138, '3472615753', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(139, '3387410272', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(140, '3914264318', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(141, '3401261557', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(142, '3289054831', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(143, '3332265576', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(144, '3403959547', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(145, '3456901909', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(146, '3382272664', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(147, '3395070513', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(148, '3482657755', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(149, '3791564056', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(150, '3898744164', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(151, '3483742569', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(152, '3755626517', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(153, '3483234622', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(154, '3336494013', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(155, '3285509811', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(156, '3760395601', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(157, '3401654824', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(158, '3518302686', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(159, '3343031948', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(160, '3479031690', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(161, '3385216223', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(162, '3511336814', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(163, '3496461722', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(164, '3517825713', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(165, '3393377421', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(166, '3393549496', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(167, '3382441069', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(168, '3408681763', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(169, '3401412931', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(170, '3661369967', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(171, '3475531655', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(172, '3462169832', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(173, '3889397747', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(174, '3668701656', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(175, '3334904723', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(176, '3664766123', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(177, '3515818889', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(178, '3387619180', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(179, '3342240762', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(180, '3459169488', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(181, '3476250305', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(182, '3779461156', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(183, '3348412959', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(184, '3249023665', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(185, '3931735741', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(186, '3249528356', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(187, '3346282095', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(188, '3929688596', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(189, '3273509692', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(190, '3348565482', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(191, '3921471886', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(192, '3883742373', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(193, '3297748755', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(194, '3922970127', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(195, '3477912394', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(196, '3473662787', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(197, '3454287900', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(198, '3894866156', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(199, '3497942774', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(200, '3319984668', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(201, '3468828935', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(202, '3463103249', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(203, '3358311323', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(204, '3929398800', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(205, '3277820577', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(206, '3397465238', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(207, '3483359427', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(208, '3888924737', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(209, '3276510820', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(210, '3408909561', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(211, '3406148901', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(212, '3208697551', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(213, '3454103987', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(214, '3471789630', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(215, '3426299243', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(216, '3409642261', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(217, '3801731321', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(218, '3402635483', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(219, '3476299035', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(220, '3296427988', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(221, '3478436432', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(222, '3348060264', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(223, '3383919833', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(224, '3470780195', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(225, '3299261070', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(226, '3338429506', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(227, '3890430716', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(228, '3420434427', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(229, '3201667538', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(230, '3401935180', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(231, '3920861820', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(232, '3336439465', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(233, '3888327487', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(234, '3337969793', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(235, '3338628983', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(236, '3887242804', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(237, '3899625555', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(238, '3287144711', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(239, '3391886846', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(240, '3468637189', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(241, '3402158861', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(242, '3884071760', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(243, '3792788110', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(244, '3516212488', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(245, '3283343573', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(246, '3939633030', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(247, '3669716912', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(248, '368449634', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(249, '3270469186', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(250, '3394032162', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(251, '3669517683', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(252, '3279522578', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(253, '3291112685', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(254, '3246269304', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(255, '3388640976', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(256, '3737510701', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(257, '3939433822', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(258, '3476589177', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(259, '3921090431', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(260, '3318455864', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(261, '3245375914', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(262, '3355481335', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(263, '3384309567', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(264, '3383324204', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(265, '3282234108', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(266, '3348880649', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(267, '3294919763', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(268, '3935012967', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(269, '3317474274', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(270, '3458499373', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(271, '3391410955', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(272, '3890797348', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(273, '3334545455', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(274, '3389176597', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(275, '3294347192', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(276, '3884710045', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(277, '3204395332', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(278, '3404738092', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(279, '3476329070', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(280, '086182887', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(281, '3335618064', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(282, '3477447775', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(283, '3277354764', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(284, '3454015685', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(285, '3775015001', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(286, '3292640134', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(287, '3427909285', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(288, '3490685964', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(289, '0861200250', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(290, '3937661911', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(291, '3920934931', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(292, '3516999350', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(293, '3317073996', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(294, '3451495220', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(295, '3477007417', '2022-05-05 01:00:06');
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`) VALUES
	(296, '3910578931', '2022-05-05 01:00:06');
	
DROP TABLE IF EXISTS `msg_answers`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `msg_answers` AS SELECT hm.id AS id_msg_ricevuto,hm.msg_from AS mittente,hm.msg_body AS messaggio_ricevuto,hm.datetime AS data_ricezione_mex,hma.id AS id_risposta, hma.answer AS risposta, hma.date AS data_risposta 
FROM history_msg hm left JOIN history_msg_answer hma ON hm.id = hma.id_msg_from ;


CREATE TABLE IF NOT EXISTS `liste_contatti` (
  `contatto_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `lista_provenienza` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `Indice 2` (`telefono`,`nome`),
  KEY `Indice 1` (`contatto_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1646 DEFAULT CHARSET=utf16;


INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1, 'Battilapaglia', '3402158861', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(2, 'BistrÃ² del mare sbt', '3468637189', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(3, 'RISTOperscheria ferrandino', '3391886846', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(4, 'Nodi Formia', '3887242804', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(5, 'Marenna e mammÃ¡', '3287144711', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(6, 'Pizzadoc dal 1986', '3899625555', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(7, 'Risto Antica Pizzeria Ciro 1923', '3887242804', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(8, 'BORROFINO', '3338628983', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(9, 'AGRITURISMO FONTANA MADONNA', '3337969793', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(10, 'Take Away Pizzeria by Bar Rosanna', '3888327487', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(11, 'CON GUSTO RISTO PIZZA', '3336439465', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(12, 'A\'storia tipica cucina tradizionale', '3920861820', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(13, 'Pizzeria GennarÃ­', '3401935180', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(14, 'Locanda Raro', '3201667538', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(15, 'Il forno panificio e pizzettera', '3488791869', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(16, 'La Corte dei filangieri', '3338429506', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(17, 'TERRAZZA 98', '3420434427', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(18, 'La pizzeria di Antonio Mansi', '3890430716', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(19, 'La pizzeria di Antonio Mansi', '3240798747', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(20, 'Torre salinas Soc coop', '3470780195', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(21, 'Torre salinas Soc coop', '3383919833', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(22, 'Torre salinas Soc coop', '3478436432', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(23, 'Pizzeria capri', '3296427988', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(24, 'Green pepper', '3476299035', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(25, 'Green pepper', '3801731321', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(26, 'Mania di Pizza', '3409642261', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(27, 'Braceria macelleria eurospesa', '3471789630', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(28, 'Braceria macelleria eurospesa', '3454103987', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(29, 'Braceria arrusti e mangia', '3406148901', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(30, 'La pizza per te', '3276510820', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(31, 'La pizza per te', '3888924737', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(32, 'Il giardino di bacco', '3483359427', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(33, 'Tutti pazzi per i fritti', '3277820577', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(34, 'Pizzeria a casa mia', '3929398800', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(35, 'Vesoma', '3463103249', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(36, 'Pizzeria della corte', '3468828935', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(37, 'Sapori & delizie', '3497942774', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(38, 'Meat grill & Wine', '3454287900', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(39, 'L\'altro buco', '3473662787', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(40, 'Ristorante pizzeria moonlighting', '3922970127', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(41, 'Mister Angus', '3883742373', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(42, 'Supremo piacere', '3921471886', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(43, 'Pizzeria Lievito Madre', '3348565482', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(44, 'Il testone pizzeria', '3929688596', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(45, 'NiRÃ²', '3346282095', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(46, 'Ristoro Sant Andrea', '3931735741', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(47, 'FATTORIA DEL RE', '3249023665', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(48, 'TRATTORIA IL GUFO', '3779461156', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(49, 'Origami ristorante giapponese', '3661438930', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(50, 'Origami ristorante giapponese', '3459169488', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(51, 'Pizzeria Luna Rossa', '3342240762', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(52, 'Altamarea Ristorante Pizzeria Braceria', '3515818889', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(53, 'Pizzeria vecchioborgo con cucina', '3334904723', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(54, 'Trattoria La madia', '3477958365', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(55, 'PIZZERIA MALU', '3668701656', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(56, 'Trattoria Pizzeria Acqua Dolce', '3462169832', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(57, 'Eleven', '3475531655', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(58, 'Trattoria Lillicu', '3661369967', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(59, 'Midori sushi take away', '3401412931', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(60, 'De Gustibus', '3408681763', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(61, 'ANTICHI SAPORI PARTENOPEI SRL', '3382441069', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(62, 'iFornai.it', '3895132122', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(63, 'Divina Commedia 2.0', '3880531416', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(64, 'Divina Commedia 2.0', '3393377421', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(65, 'SPEZZA PIZZA', '3517825713', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(66, 'MORDI E FUGGI', '3496461722', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(67, 'ANDREW S PUB DAL 1995', '3511336814', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(68, 'BOMBO\'S PUB', '3385216223', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(69, 'ATHOS BISTROT', '3479031690', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(70, 'PaisÃ  pizzeria sfizioseria', '3343031948', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(71, 'RABAT gourmet crudi e capricci', '3518302686', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(72, 'Blackwood Vanvitelli', '3401654824', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(73, 'LA TANA DEL LUPO', '3760395601', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(74, 'Ristorante E pizzeria Gino & Pina', '3471972824', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(75, 'Ristorante E pizzeria Gino & Pina', '3336494013', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(76, 'Agrodolce bistrÃ²', '3755626517', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(77, 'BISTROT WINE BAR', '3483742569', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(78, 'OSTERIA LO SCUDO', '3898744164', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(79, 'RISTORANTE PIZZERIA LA RUOTA', '3482657755', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(80, 'RISTORANTE LA REGINA DEL MARE', '3331399278', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(81, 'Osteria Varanalle', '3382272664', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(82, 'Osteria da Artico', '3403959547', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(83, 'Via Ingrao n.14', '3332265576', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(84, 'Ristorante agli amici', '3401261557', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(85, 'La vera bellezza', '3389743948', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(86, 'PIZZERIA FLORIS', '3498157901', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(87, 'RISTORANTE LUNA ROSSA', '3481111590', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(88, 'RISTORANTE LUNA ROSSA', '3756731454', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(89, 'MAGNA PIZZA', '3899319985', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(90, 'Ristorante pizzeria Il Brutto Anatroccolo', '3358073562', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(91, 'RISTORANTE LUNA ROSSA', '3356798819', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(92, 'Pizzeria il canestrello d\'oro', '3663160279', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(93, 'Ristopizza Quarti di Luna', '3939267090', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(94, 'Ristopizza Quarti di Luna', '3338487300', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(95, 'La pizza di Antonio Mansi', '3240798747', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(96, 'mary read', '3397855654', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(97, 'Tenuta Marrandino', '3384304190', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(98, 'Hosteria Dei Matti', '3333726352', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(99, 'TRATTORIA BOLINA', '3664856980', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(100, 'PIZZERIA IL BORGO', '3207478466', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(101, 'Pizza pazza a pezzi', '3496373700', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(102, 'LOCANDA NEL CASSERO', '3383030033', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(103, 'TENDENTIA', '3280349268', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(104, 'MARE NEL PIATTO', '3925868736', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(105, 'LA TAVERNA DEL LEONE', '0811993607', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(106, 'LA TAVERNA DEL LEONE', '3389008238', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(107, 'LA TAVERNA DEL LEONE', '3426983858', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(108, 'LA TAVERNA DEL LEONE', '3455853093', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(109, 'Ristorante Emozionando', '3203066744', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(110, 'kannella', '3807664131', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(111, 'DA CAMILLO MILLELUCCIOLE', '3398202831', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(112, 'LE DELIZIE', '3382005172', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(113, 'GARDEN EVENTI', '3663941809', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(114, 'Terra mia', '3314005240', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(115, 'Giovanna', '3460098608', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(116, 'SOLERO BEACH', '3475750204', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(117, 'COME A CASA TUA', '3495895862', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(118, 'MANUEL PIZZA LIDO', '3921736700', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(119, 'LIDO MARGHERITA', '3880531416', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(120, 'Baita la Gallinola', '3384342876', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(121, 'TERZO TEMPO Village', '3349465311', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(122, 'CASTELVERNIERI Sapori Nei Sapori', '3911731324', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(123, 'NUNÃ™', '3488551982', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(124, 'Da Nando', '3737630226', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(125, 'Pizzeria \'Sicilia Bedda\'', '3491307262', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(126, 'PIZZERIA POSILLIPO', '3381730954', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(127, 'LA CUEVA', '3932140325', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(128, 'LOCANDA DEL BUONGUSTAIO', '3334051224', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(129, 'The tango Saloon', '3473741051', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(130, 'IL RIFUGIO DEL MASSARO', '3396934698', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(131, 'RISTORANTE IL BUONGUSTAIO', '3206015033', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(132, 'RISTORANTE 13Undici', '3383647551', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(133, 'SALE E PEPE A FOGLIA', '3282803076', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(134, 'PIZZERIA ROSSO VERACE', '3317369664', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(135, 'Pizza village Afragola', '3394825886', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(136, 'Pizzeria Trattoria il Brigante', '3489724016', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(137, 'Gallo d\'oro', '3927646767', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(138, 'A casa mia risto-pizzeria', '3391538644', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(139, 'Le Colonne', '3284217218', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(140, 'Pappa e Ciccia', '3358311640', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(141, 'Trattoria degli Apostoli', '3313373348', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(142, 'OSTERIA DELLA CIPOLLA ROSSA', '3278827448', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(143, 'Morhum', '3297899192', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(144, 'PUB VECCHIA AMERICA', '3476294952', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(145, 'Teglia e pala', '3314148174', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(146, 'Dodici burger', '3519498990', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(147, 'La tavernaccia', '3288477782', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(148, 'MaunÃ¬ pizza & risto pub', '3469682165', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(149, 'Pizzeria Vincenzo Di Fiore', '3348081782', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(150, 'Star pizzas', '3805918400', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(151, 'Voglia di Pizza', '3487609174', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(152, 'Ristorante Marechiaro', '3494152132', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(153, 'Osteria gustosissimo', '3395997843', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(154, 'La stella', '3382234592', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(155, 'Divina Vietri pizzeria', '3286193504', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(156, 'Black roses', '3382775577', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(157, 'Osteria braceria addo Mastone', '3938499248', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(158, 'Mordy e fuggy', '3480581607', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(159, 'sakura MERCOGLIANO', '3925928888', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(160, 'Paninoteca Peter pan', '3286450326', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(161, 'Mani in pasta', '3928779910', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(162, 'hotel ristorante giordan', '3294038293', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(163, 'er macellaio', '3312961138', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(164, 'Sq\'amami', '3397269771', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(165, 'Un cuore di pizza', '3285982408', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(166, 'T-Bone Soverato', '3473483266', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(167, 'Panificio S.Giuseppe', '3922538649', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(168, 'Cucina da oscar', '3337715963', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(169, 'Mattia pub', '3381065099', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(170, 'Ristorante pizzeria bar lago grande', '3383960623', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(171, 'Bellafigliola', '3791604565', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(172, 'Marcantonio steackhouse', '3661251155', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(173, 'Il cantiere', '3886534836', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(174, 'La bottega naturalmente giorgio', '3209520025', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(175, 'Antica osteria da Tonino dal 1880', '3491073337', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(176, 'Ilovetoast', '3313132381', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(177, 'IL PIATTO PRONTO', '3920541684', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(178, 'IL PIATTO PRONTO', '3922286916', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(179, 'Ciropaninishow', '3205651893', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(180, 'Cillo Grill & Barbecue House', '3248114798', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(181, 'Pizzeria Pulecenella', '3341821608', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(182, 'STREET&ROUTE', '3476910464', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(183, 'Paninoteca da ManuÃ©', '8119913174', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(184, 'Paninoteca da ManuÃ©', '3317657112', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(185, 'Bufalo grill', '3926497066', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(186, 'La Ricciaia', '3895132122', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(187, 'Fantasy Restaurant PizzerÃ­a', '3337900362', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(188, 'Nel nome della pizza', '3294076558', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(189, 'Paninoteca asterix', '3923705179', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(190, 'Paninoteca sant andrea', '3249553500', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(191, 'Pizzeria civico 9', '3493982323', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(192, 'Titanic Pub & Beer', '3208644763', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(193, 'Pizzeria Alba', '3288591670', 'INVIO LISTA ATTIVITA\' (4).xlsx', '2022-05-05 09:43:22');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1282, 'al solito posto', '3349424691', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1281, 'da lin', '3421784293', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1280, 'la torre', '3926507520', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1279, 'beerhouse', '3345276419', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1278, 'la cucina come un volta', '3346793185', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1277, 'il portico', '3385266258', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1276, 'sport', '3402385882', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1275, 'radice', '3347258553', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1274, 'il cortile', '3474733720', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1273, 'le terre del grignolino', '3936109730', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1272, 'accademia', '3355452237', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1271, 'il galletto', '3899241127', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1270, 'rossignoli 1913', '3473261459', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1269, 'gubistrÃ²', '3317485548', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1268, 'la spiga', '3518447020', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1267, 'fermento', '3484647447', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1266, 'wally\'s', '3468917532', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1265, 'rehan ali kebab', '3406090831', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1264, 'labo', '3703004433', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1263, 'columbia pub', '3458437962', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1262, 'l\'artigiano della pizza', '3495580815', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1261, 'pizza a go-go', '3312100242', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1260, 'oasushi', '3348712097', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1259, 'sushi magic', '3318066595', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1258, 'fujiyama', '3314988587', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1257, 'gigi\'s', '3474169605', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1256, 'sfizio rosso', '3463892536', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1255, 'montecarlo', '3403709043', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1254, 'controsenso', '3289197043', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1253, 'l\'officina della pizza', '3358221544', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1252, 'urban pizza', '01311952871', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1251, 'aurora girarrosto', '0131863033', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1250, 'il voltone 3.0', '3283110590', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1249, 'due punto zero', '3466215353', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1248, 'la bottega della pizza', '3454385338', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1247, 'molino alpha', '3392040506', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1246, 'l\'agnolotto', '3473117913', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1245, 'pace', '3807259117', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1244, 'billis', '3929112362', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1243, '38', '3471005597', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1242, 'anna ghisolfi', '3384797142', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1241, 'la corte', '3457841373', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1240, 'infernot', '3391903278', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1239, 'vineria derthona', '3358311528', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1238, 'girasole', '3801857059', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1237, 'bell\'italia', '3774296706', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1236, 'i tre moschettieri', '3407262757', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1235, 'oriente classico', '3384636622', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1234, 'peperoncino rosso', '3486484459', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1233, 'big ben', '3270679075', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1232, 'da vittorio', '3486052344', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1231, 'da tito', '3453588495', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1230, 'la bottega della piada', '3485142301', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1229, 'la cucina in bottega', '3388858852', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1228, 'le aie', '3420888155', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1227, 'da pietro', '3478856882', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1226, 'panda', '3883575258', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1225, 'il locale', '3462204111', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1224, 'il gadano', '3339384387', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1223, 'san domenico', '3481919704', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1222, 'il campanile', '3490831031', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1221, 'la grotta di barbanera', '3714458613', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1220, 'la locanda', '3496125957', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1219, 'la pignatta', '3348180666', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1218, 'l\'archivolto', '3480468078', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1217, 'mammalena', '3285366438', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1216, 'yoi', '3394114827', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1215, 'la corbula', '3927497888', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1214, 'la cucina di luisa', '3471549919', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1213, 'del fortunato', '3388100931', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1212, 'tokyo', '3661623557', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1211, 'magic pizza', '3282998328', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1210, 'la pinta', '3290192221', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1209, 'st. george', '3452859423', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1208, 'a\' vera pizza', '3389195024', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1207, 'brenta rossa', '3343995655', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1206, 'feng', '3270089432', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1205, 'furia\'s', '3498935606', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1204, 'dorian gray', '3393958744', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1203, 'la filanda', '3483597358', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1202, 'malaspina', '3405224095', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1201, 'kiko', '3342355475', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1200, 'la conac', '3206280264', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1199, 'da maria', '3408067831', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1198, 'al cortiletto', '3245375385', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1197, 'portami via', '3397003591', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1196, 'all\'angolo del vecchio mulino', '3407777307', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1195, 'maiori', '3389537813', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1194, 'il mongetto', '3477251306', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1193, 'la classe non Ã¨ acqua', '3925367150', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1192, 'villa morneto', '3498510505', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1191, 'della luna', '3398099809', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1190, 'le tre lasagne', '3408941858', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1189, 'universo', '335237617', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1188, 'cascina nuova', '3356230457', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1187, 'la rosa blu', '3349644707', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1186, 'roffry pizza', '3920855152', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1185, 'turkish kebap', '3404148448', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1184, 'il cavallino', '3315679315', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1183, 'poldo', '3385890366', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1182, 'tesoro express', '3342727559', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1181, 'ventisette', '3427954662', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1180, 'le mout', '3663065513', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1179, 'si giusy', '3516899287', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1178, 'dÃ¨bÃ©t', '3501518077', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1177, 'adelizia e pizzerentola', '3337724855', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1176, 'piadineria elena ', '3298046749', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1175, 'achille', '3347847651', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1174, 'l\'alfiere', '3471739230', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1173, 'treville', '3453215472', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1172, 'il cavalluccio', '3337975765', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1171, 'villa poggio pozzo 12', '3477642931', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1170, 'al chiar di luna', '3394925637', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1169, 'nessuno Ã¨ normale', '3388858852', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1168, 'l\'angolo dei gusti', '3458067287', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1167, 'villa cheti', '3403738486', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1166, 'la montaldina', '3669534876', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1165, 'antica bettola', '3519008905', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1164, 'duma c\'anduma', '3405666480', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1163, 'the fassushi', '3463938590', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1162, '272', '3922313062', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1161, 'da carletto', '3922080797', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1160, 'il gabbiano', '3349539733', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1159, 'sabatini', '3917555612', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1158, 'sushi stella', '3338057737', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1157, 'da dino', '3387463451', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1156, 'naturalmente pizza', '3423381337', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1155, 'la diavola', '3896560591', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1154, 'de rosa\'s', '3921949501', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1153, '3 scalini', '3348274243', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1152, 'pesca e mangia', '3387463451', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1151, 'la foglia d\'oro', '3460202000', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1150, 'il lampino', '3347967155', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1149, 'montegualdone', '3486720056', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1148, 'la rava e la fava', '3491162468', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1147, 'feeling', '3482202339', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1146, 'a casa del sindaco', '3427477827', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1145, 'locnda del barco', '3490610063', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1144, 'la contea', '3398296737', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1143, 'il tilacino', '3487951419', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1142, 'cascina battignana', '3404606340', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1141, 'corona', '3487648413', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1140, 'l\'erica', '3477742671', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1139, 'olimpia', '3476036580', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1138, 'laura', '3398287447', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1137, 'forno in frasca', '3476050882', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1136, 'stella', '3299608808', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1135, 'la serignola', '3383601466', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1134, 'modugno', '3472700585', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1133, 'la luna e i falÃ²', '3286541037', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1132, 'dal kaccia', '3515270424', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1131, 'santo stefano', '3890327127', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1130, 'antichi sapori', '3406613261', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1129, 'a casa di babette', '3477130521', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1128, 'alpi', '3772492133', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1127, 'da beppe', '3284893270', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1126, 'alla rocca', '3478858877', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1125, 'c\'me na\' vota', '3201914713', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1124, 'olivazzi', '3395025920', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1123, 'albystrÃ²', '3495521104', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1122, 'fuori di pizza', '3922715939', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1121, 'delle zucche vuote', '3891623562', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1120, 'ai quattro gatti', '3397814626', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1119, 'villa magnolia', '3312633350', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1118, 'il ritrovo', '3807171412', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1117, 'hotel cascata', '3290203807', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1116, 'la giorgetta', '3385806653', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1115, 'dei narcisi', '3485116638', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1114, 'urban bbq 1982', '3294274556', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1113, 'casa tui', '3248423036', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1112, 'del groppo', '3495311226', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1111, 'san lorenzo', '3403309643', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1110, 'le piagge', '3475172362', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1109, 'il viandante', '3452736124', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1108, 'cascina zenevrea', '3393699594', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1107, 'nonno pierino', '3755968574', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1106, 'casa anna', '3515461830', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1105, 'belvedere dei laghi', '3297960385', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1104, 'saray', '3512729016', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1103, 'il tiglio', '3807064652', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1102, 'da giÃ²', '3397744839', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1101, 'la fontana', '3288855436', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1100, 'dei paoli', '3911710699', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1099, 'concordia bros', '3472403904', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1098, 'la cucina', '3348350112', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1097, 'il laghetto', '3467749432', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1096, 'cascina bozzetti', '3889050493', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1095, 'l\'erba luisa', '3406138406', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1094, 'la ghiotta ', '3334457008', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1093, 'cascinotta', '3515608575', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1092, 'i due buoi', '3662549251', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1091, 'la tana dei sapori', '3477347293', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1090, 'la magione', '3284310600', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1089, 'serra', '3881756202', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1088, 'ci voleva', '3277456280', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1087, 'la ca\' veja', '3468126589', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1086, 'lamberti', '3420734176', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1085, 'dal moro', '3469511550', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1084, 'ciak si pizza', '3887592843', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1083, 'lo stivale', '3404009184', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1082, 'san candido', '3492856386', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1081, 'regina', '3387255735', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1080, 'la rossa', '3351419517', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1079, 'mani man', '3483903117', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1078, 'l\'oca lola', '3391414977', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1077, 'la selva', '3494110861', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1076, 'tre castelli', '3408585903', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1075, 'cascina carrata', '3474414807', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1074, 'costa salata', '3382343866', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1073, 'il fienile', '3337253922', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1072, 'la nuova valle', '3358407334', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1071, 'ca\' dell\'aglio', '3402728738', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1070, 'castello', '3471209743', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1069, 'dubini', '3294003506', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1068, 'coro & bentu', '3457410750', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1067, 'la cuntro\' delle langhe', '3917156978', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1066, 'la trinitÃ ', '3392871505', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1065, 'la fontana', '3383006178', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1064, 'porrati', '3280089909', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1063, 'orazio', '3407662682', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1062, 'la commedia della pentola', '3398833626', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1061, 'antico monastero', '3382053569', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1060, '0\' sole mio', '3498813193', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1059, 'da manuela', '3394340032', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1058, 'in breiga', '3662095180', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1057, 'guardamonte', '3494363191', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1056, 'la baita', '3407679864', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1055, 'cascina san martino', '3471236789', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1054, 'ai nebbioli', '3495375708', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1053, 'nonna du', '3488932198', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1052, 'dei fuenti', '3791192914', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1051, 'vino & bruschette', '3470464909', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1050, 'tucagnÃ©i', '3484566633', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1049, 'il borgo', '3935668136', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1048, 'cantine del gavi', '3349101449', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1047, 'al caminetto', '3663071843', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1046, 'usteria e firadu', '3395374775', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1045, 'cacciatori', '3936768632', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1044, 'la chance', '3315623624', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1043, 'commercio', '3489156495', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1042, 'il biancospino', '3401638181', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1041, 'cantico dei capperi', '3476046285', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1040, 'ai due olmi', '3895559359', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1039, 'corte dei sapori', '3351057395', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1038, 'richard\'s house', '3516298868', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1037, 'pitipizza', '3791077473', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1036, 'i pioppi', '3898395454', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1035, 'fer.mo', '3475872309', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1034, 'gallo martino', '3299841348', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1033, '1340', '3332482210', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1032, 'la sereta', '3495826357', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1031, 'val lemme', '3386571343', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1030, 'cacciatori', '3483667411', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1029, 'pian dei grilli', '3495311343', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1028, 'sebastiano  & stefania', '3389256426', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1027, 'monte boglelio', '3347843519', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1026, 'la baita', '3336979548', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1025, 'la bruceta', '3456044090', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1024, 'vetta', '3407867374', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1023, 'del pozzo', '3339293871', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1022, 'sapori monferrini', '3496708878', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1021, 'al kilometro zero', '3315246662', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1020, 'celtic oak', '3389062621', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1019, 'italia', '3714243873', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1018, 'la pesa', '3318575068', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1017, 'airale', '3406791836', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1016, 'monferrato resort', '3480557316', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1015, 'tenuta monvillone', '3383218385', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1014, 'del castello', '3406087970', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1013, 'il carpino', '3791482654', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1012, 'l\'orto dei nonni', '3398564798', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1011, 'la rachela', '3480354524', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1010, 'la pista', '3382416721', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1009, 'mani in pasta', '3922512256', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1008, 'la fossa romeo', '0131845471', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1007, 'cascina beneficio', '3386833474', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1006, 'il giardino dei cherubini', '3391434117', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1005, 'la casta', '3922090902', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1004, 'il grande airone', '3342837521', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1003, 'la moglietta', '3283828180', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1002, 'il campanile', '3920149817', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1001, 'la.ti.mi.da', '3337104611', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1000, 'surÃ¬', '3518652425', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(999, 'passeggeri', '3333217304', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(998, 'il quadrifoglio', '3332774626', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(997, 'cascina cabella', '3405731697', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(996, 'al solito posto', '3395096780', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(995, 'la corte dei vaccÃ ', '3454877388', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(994, 'la locanda del seicento', '3459381745', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(993, 'antica locanda', '3482996838', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(992, 'del pallone', '3393576368', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(991, 'la locanda della pesca', '3402779416', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(990, 'il portico', '3472524549', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(989, 'albachiara', '3421272815', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(988, 'lolli', '3917394490', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(987, 'il vecchio portico', '3381733551', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(986, 'stevano', '3355481630', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(985, 'gatti', '3294385393', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(984, 'the iron cutter pub', '3392229570', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(983, 'billy bau', '3517336768', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(982, 'del peso', '3397841406', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(981, 'la rocca di camagna', '3391753128', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(980, 'il patio', '3339973425', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(979, 'il chiringuito', '3890364458', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(978, 'le braci', '3338122567', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(977, 'pian della castagna', '3474294244', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(976, 'rio gorzente', '3477789371', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(975, 'il ciacrotto', '3383971968', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(974, '50 special', '3384811631', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(973, 'spazzarini', '3338272360', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(972, 'raviolpub', '3343474251', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(971, 'il mulino ', '3483309760', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(970, 'l\'orchidea', '3479713824', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(969, 'la teca', '3922028572', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(968, 'cercopiteco', '3914974303', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(967, 'la fenice ', '3485510930', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(966, 'belvedere', '3337236832', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(965, 'da margherita', '3498779296', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(964, 'da pietrino', '3484419322', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(963, 'amico', '3778867623', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(962, 'la torre', '3343509694', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(961, 'dely', '3291445368', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(960, 'la corte degli olivieri', '3755748350', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(959, 'decÃ²', '3913800927', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(958, 'da fausto', '3939598095', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(957, 'al tranvai', '3479554635', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(956, 'materia prima', '3515007930', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(955, 'ra mansena', '3394811945', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(954, 'that\'s amore ', '3486836017', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(953, 'hotel belvedere', '3472843848', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(952, 'belvedere', '3489044172', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(951, 'z', '3484585112', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(950, 'ciaplÃ¬', '3208034597', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(949, 'mirepuÃ ', '3925971396', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(948, 'da vincÃ¨', '3516620025', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(947, 'l\'oro di napoli', '3334407151', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(946, 'cittu bai', '3714987694', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(945, 'new castle pub', '3498026021', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(944, 'pappa e vini', '3477863726', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(943, 'albergo nuovo gianduja', '3389776834', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(942, 'new gallery', '3381158782', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(941, 'la farinata da gianni', '3482313597', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(940, 'hotel acqui', '3425502836', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(939, 'napul\'Ã¨', '3516333649', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(938, 'jo sushi', '3888780829', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(937, 'moon sha', '0144981353', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(936, 'la casa di ro', '3388183793', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(935, 'mondo pizza ', '3400873554', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(934, 'hakuna matata', '3466359326', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(933, 'le aie', '3519119424', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(932, 'la fonte', '3516247070', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(931, 'davÃ¬ food lab', '3332310438', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(930, 'bo russ', '3495103826', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(929, 'i caffi', '3474582609', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(928, 'da nonna gina', '3477038984', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(927, 'turkish kebap', '3485292282', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(926, 'angolo divino', '3737904222', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(925, 'nuovo parisio', '3485245277', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(924, 'la loggia', '3346114267', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(923, 'la curia', '3339801111', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(922, 'mazzini', '3339330222', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(921, 'il moncalvo', '3335088214', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1283, 'il pangolino', '3485106277', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1284, 'bella napoli', '3480849573', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1285, 'apollo', '3756517161', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1286, 'sakura', '3341290117', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1287, 'strapizzami', '3451169518', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1288, 'angolo 45', '3338675032', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1289, 'sushi long', '3341864070', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1290, 'arditi fisherman', '3206304487', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1291, 'spizzicotto', '3338492419', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1292, 'l\'operetta', '3397285719', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1293, 'bocconcino', '3381321602', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1294, 'la locanda', '3881229858', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1295, 'santa lucia', '3478113172', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1296, 'bellavista ', '3441441290', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1297, 'mondo pizza ', '3408737101', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1298, 'la lanterna', '3755753738', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1299, 'la possavina', '3335035901', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1300, 'sciapa pum', '3388959809', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1301, 'arts burger', '3534051336', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1302, 'tenuta valdorso', '3333566822', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1303, 'a modo mio', '3400525249', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1304, 'gallo nero', '3887562639', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1305, 'il burlino', '3493172943', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1306, 'maniman', '3483903117', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1307, 'napoleon', '3393155912', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1308, 'della luna in brodo', '3479952882', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1309, 'la chiacchierata', '3348486139', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1310, 'tom & ann', '3289613913', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1311, 'antica casa rava', '3331281346', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1312, 'cappelverde', '3889819989', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1313, 'arterÃ¬a', '3395480968', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1314, 'kuuk', '3249978099', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1315, 'stadio', '0131223704', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1316, 'la pampelonne', '3441202064', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1317, 'la ghiottosa', '3355239585', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1318, 'elio\'s', '3335747843', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1319, 'il griso/il tegamone', '3313442330', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1320, 'bio gusto', '3756110495', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1321, 'timo e rosmarino', '3757222330', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1322, 'il chicco', '3891136669', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1323, 'al pilota', '3423239911', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1324, 'la poligonia', '3337995127', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1325, 'il pescatore 7', '3472743647', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1326, 'il trio', '3713433353', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1327, 'al vecchio rio', '3518000416', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1328, 'le nouveau bistrot', '3355731244', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1329, 'swagat', '3777067020', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1330, 'la vita Ã¨ bella', '3295678076', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1331, 'roxy 45', '3497321580', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1332, 'il porfido', '3482635988', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1333, 'glitch', '3516356367', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1334, 'al rock cafÃ¨', '3332309331', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1335, 'piazza maino', '3421493466', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1336, 'shiso', '3313218585', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1337, 'porta genova', '3338845932', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1338, 'sama sama', '3890217844', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1339, 'dastan', '3406626539', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1340, 'taproom', '3510701983', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1341, 'malafemmena', '3396077083', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1342, 'girone dei golosi', '3271484873', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1343, 'mag mell', '3388152559', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1344, 'hop', '3470151401', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1345, 'osen', '3663680388', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1346, 'asado', '3428532931', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1347, 'strapizzami', '3661020068', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1348, 'il saraceno', '3517371169', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1349, 'ratafiÃ ', '3939070013', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1350, 'tip tap', '3481387823', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1351, 'moonshine', '3318602160', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1352, 'asmara', '3296398044', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1353, 'juice bio bistrot', '3394827116', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1354, 'el taco', '3460890974', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1355, 'divagar', '3662336452', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1356, 'il moscardo', '3755023734', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1357, 'di Rosa', '3209363635', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1358, 'alla rotonda', '3714719777', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1359, 'il buco', '3802865853', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1360, 'l\'agricola', '3802082558', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1361, 'ismail', '3337229375', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1362, 'del gasometro', '3384997628', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1363, 'la cucina di francesca', '3661220260', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1364, 'da ciro', '3348445507', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1365, 'xiao III', '3778465831', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1366, 'il crotto', '3477388019', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1367, 'la grattarola', '3460211765', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1368, 'kebabberya antalya', '3319393823', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1369, 'wok gran gusto', '3339016529', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1370, 'marconi bistrot', '3355842302', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1371, 'la prosciutteria', '3404792114', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1372, 'chivitos', '3917264883', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1373, 'gatti', '3407086513', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1374, 'del moro', '3469511550', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1375, 'la fontanella', '3667007262', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1376, 'kapuziner hof', '3477291670', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1377, 'fondovalle', '3482433435', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1378, 'barcollando', '3471796504', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1379, 'cacciatori', '3473003075', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1380, 'agresto', '3396918783', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1381, 'la milonga', '3475228922', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1382, 'ca\' mariuccia', '3357507496', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1383, 'sapor do brasil', '3662989888', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1384, 'alle tre colline', '3337905376', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1385, 'al dante', '3357821242', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1386, 'la corte del barbio', '3357429997', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1387, 'arcobaleno ', '3474191801', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1388, 'dente', '3485956749', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1389, 'i suri\'', '3895367210', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1390, 'madama vigna', '3888675708', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1391, 'la stazione', '3274045119', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1392, 'cascina lanÃ¨', '3341160271', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1393, 'pizza & churrasco', '3291636075', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1394, 'da conrado', '3470055768', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1395, 'sette colli', '3776917369', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1396, 'bella ciao', '3887918983', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1397, 'la baccante', '3494059338', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1398, 'villa sibilla', '3515550820', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1399, 'tre colline in langa', '3333403963', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1400, 'bella vita', '3339696893', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1401, 'la gallina bionda', '360874028', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1402, 'cascina campora', '3477699296', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1403, 'il quartino', '3483536204', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1404, 'i portici', '3802570380', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1405, 'adagio / anima ', '0141769109', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1406, 'santisÃ¨', '3479763247', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1407, 'la pizza di mario e sonja', '3807417578', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1408, 'da mich', '3331955780', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1409, 'il volo', '3389593470', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1410, 'luna rossa', '3509073035', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1411, 'del conte', '3270427105', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1412, 'casa crippa', '3463248546', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1413, 'd\'la sternia', '3337546327', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1414, 'dei meravigliati', '3922224171', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1415, 'civico 15', '3294379547', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1416, 'dal grezzo', '3246867767', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1417, 'risveglio dei sapori', '3278954448', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1418, 'sulla bocca di tutti', '3666870752', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1419, 'c\'era una volta', '3935310288', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1420, 'la dota', '3404579800', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1421, 'la nuova drogheria', '3480037786', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1422, 'bispender', '3478497364', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1423, 'cascina moncucchetto', '3484585200', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1424, 'l\'oca giuliva', '3934280287', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1425, 'castello', '3343022246', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1426, 'wine story', '3355409939', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1427, 'asso di quadri', '3396988590', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1428, 'antichi sapori', '3394018837', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1429, 'pan pist', '3397261510', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1430, 'bell\'italia', '3938342626', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1431, 'di rosanna', '3338999587', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1432, 'il laghetto', '3487485870', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1433, 'cÃ  \'d toniot', '3289017270', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1434, 'il brigantino', '3494182718', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1435, 'l\'armonia dei sapori', '3339012970', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1436, 'del casot', '3664753051', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1437, 'la fioraia', '3389921227', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1438, 'wild west saloon', '3807059110', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1439, 'caruso', '3665287452', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1440, 'poldo ', '3282876473', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1441, 'cristina\'s cooking', '3337474051', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1442, 'krcko', '3296347609', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1443, 'il brindo', '3427623961', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1444, 'la santa pizza', '3498319030', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1445, 'cassiopea', '3917988571', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1446, 'al numero 1', '3333135354', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1447, 'santamonica', '3456812131', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1448, 'la villetta', '3895324374', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1449, 'madonna della neve', '3393195537', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1450, 'tenuta antica', '3397951498', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1451, 'bodrito', '3351594458', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1452, 'garibaldi', '3331784635', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1453, 'la ca\' rossa', '3381964360', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1454, 'all\'asilo', '3880485811', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1455, 'cÃ  d\' linet', '3385768466', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1456, 'nicola', '3929543291', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1457, 'cascina rosengana', '3518617305', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1458, 'martelletti', '0141907686', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1459, 'il sottosopra', '3405015628', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1460, 'il puffo', '3473850738', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1461, 'dei fiori', '3384509001', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1462, 'cascina collavini', '0141966440', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1463, 'il grappolo rosso', '3201963642', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1464, 'podere la piazza', '3409607608', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1465, '7burger', '3885730679', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1466, 'villa pattono', '3345949356', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1467, 'orlandi', '3395807860', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1468, 'sette colli', '3297197459', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1469, 'dell\'allegria', '3338324453', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1470, 'cascina monticone', '3450387747', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1471, 'la belecauda', '3479767517', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1472, 'la casa dell\'architetto', '3314003715', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1473, 'ca\' del medic', '3398899156', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1474, 'c bianca', '3482317764', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1475, 'poggio giardino', '3335364206', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1476, 'tra la terra e il cielo', '3246873737', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1477, 'la panza', '3519136657', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1478, 'la marlera', '3384442560', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1479, 'da erminio', '3475234061', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1480, 'fontanabuona', '3490885115', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1481, 'lijavÃ¬', '3389741588', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1482, 'perigolosi', '3400637453', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1483, 'san desiderio', '3283284567', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1484, 'villa la madonna', '3488366141', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1485, 'corona reale', '3337376794', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1486, 'moncalv eat', '3347792553', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1487, 'gust\'osa', '3501200150', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1488, 'spinerola hotel & uvaspina', '3385031410', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1489, 'cascina bric', '330684075', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1490, 'cascina dimaggio', '3475744665', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1491, 'la tomatica in commedia', '3331461984', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1492, 'la preja', '3791919114', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1493, 'san bastian', '3471987382', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1494, 'alcastlÃ¨', '3391016616', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1495, 'montafia caffÃ¨', '3714141080', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1496, 'don chisciotte', '3496582414', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1497, 'il viandante', '3920980865', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1498, 'cascina vignole', '3661869763', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1499, 'el argentino', '3335328427', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1500, 'l\'universo', '3273028058', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1501, 'cascina s. nazario', '3336866814', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1502, 'centrale', '3332330948', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1503, 'il borgo vecchio', '3290857356', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1504, 'lo spaiato', '3466374578', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1505, 'la corte del re', '3881676806', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1506, 'da elena', '3384497356', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1507, 'la rustica', '3333353863', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1508, 'foce', '3920877945', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1509, 'la braja', '3311799615', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1510, 'del rooster', '3317326271', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1511, 'l\'munfra', '3486729424', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1512, 'roico', '3512110677', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1513, 'dell\'angelo', '3334343790', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1514, 'gheub', '3496533687', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1515, 'dei cacciatori', '3397863150', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1516, 'i bergÃ¨ di muscandia', '3498246489', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1517, 'della buona notte', '3474671443', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1518, 'terre d\'origine', '3277867161', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1519, 'cascina ratafiÃ ', '3885619118', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1520, 'so\'vino', '3291448945', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1521, 'del bramante', '3498690399', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1522, 'borghetto la radice', '3495518005', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1523, 'braida wine resort', '3282334387', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1524, 'madama la barbera', '3348092604', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1525, 'q120', '3497737262', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1526, 'pizza da pat', '3342485414', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1527, 'il bric dell\'usignolo', '3669801983', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1528, 'del piccolo principe', '3331546822', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1529, 'il re d\'egli ignoranti', '3389582737', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1530, 'la rosa blu', '3343396355', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1531, 'il sole di vergina', '3277871040', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1532, 'cinque camini', '3335204952', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1533, 'la viranda', '3382304131', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1534, 'la raviola galante', '3477909458', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1535, 'il giardinetto', '3389559489', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1536, 'bricco gallo', '3391012333', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1537, 'da mariuccia', '3371091938', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1538, 'la corte di gerardo', '3403123264', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1539, 'il balcone sul monferrato', '3357688855', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1540, 'moia', '3336930319', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1541, 'paolo \'d nandu', '3421725441', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1542, 'la taverna di san michele', '3355644649', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1543, 'roma', '3474655336', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1544, 'margherita', '3383416640', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1545, 'l\'ostu d\'la vila', '3386392257', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1546, 'le taverne', '3913187049', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1547, 'bistrÃ²', '3492557759', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1548, 'villa bordone', '3911018269', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1549, 'sceriffo pizza & kebab', '3282404384', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1550, 'la brace', '3402275574', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1551, 'scacco matto', '3923329844', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1552, 'agri break piadineria', '3457936480', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1553, 'cascina rossa', '3479420462', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1554, 'ristoro andirivieni', '3462408634', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1555, 'mulino del casale', '3489023631', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1556, 'non solo crudo', '3477968778', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1557, 'margherita', '3404897900', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1558, 'il cannon d\'oro', '3461259554', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1559, 'pappa', '3487336646', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1560, 'la signora in rosso', '3297137204', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1561, 'tantÃ¬', '3484821356', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1562, 'bun ben bon', '3478927831', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1563, 'la rotonda', '3475562312', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1564, 'l\'ambaradan', '3381900324', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1565, 'vulcano', '3296444185', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1566, 'piccola torre', '3285434186', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1567, 'i salici ridenti', '3440640890', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1568, 'kazan sushi', '3664468882', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1569, 'casablanca kebab', '3292775656', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1570, 'scuderi', '3755527607', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1571, 'campanarÃ²', '3888129185', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1572, 'tacabanda', '3204949711', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1573, 'del palio', '3282166778', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1574, 'il cavallo sosso', '3669758351', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1575, 'le teste di rapa', '3931324671', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1576, 'pompa magna', '3495452601', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1577, 'alla piazza', '3661400588', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1578, 'viotti', '3275526112', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1579, 'gina', '3485828538', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1580, 'becheri', '3351203533', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1581, 'pa.pas', '3755046686', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1582, 'ibo', '3398120832', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1583, 'wei sushi', '3381924147', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1584, 'pollicino', '3801204245', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1585, 'brut & bon', '3397558808', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1586, 'monterainero', '3389696530', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1587, 'cit ma bon', '3492896400', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1588, 'assaggio d\'india', '3334552908', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1589, 'hai ou', '3319468258', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1590, 'del diavolo', '3342005184', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1591, 'dai toscanacci', '3889313209', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1592, 'francese', '3487729101', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1593, 'albacco', '3206971886', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1594, 'oeuf', '3389937171', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1595, 'divino', '3333789750', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1596, 'barbapizza', '3884471010', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1597, 'universal', '3206945072', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1598, 'raffael', '3756072214', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1599, 'angolo del beato', '3386332441', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1600, 'black sheep', '3938557411', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1601, 'la pizza di maury', '3884710986', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1602, 'sakana', '3778262133', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1603, 'you jia', '3315401918', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1604, 'da sasha', '3899806098', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1605, 'il golosone', '3924895828', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1606, 'divina', '3289084264', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1607, 'picnic', '3661870100', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1608, 'la douia', '3494310002', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1609, 'marjurÃ¨', '3458972444', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1610, 'regli', '3888342525', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1611, 'ca\' \'d\' pinot', '3666268622', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1612, 'u\' carrettu', '3289199798', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1613, 'il delfino ', '3201907445', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1614, 'pizza 6 sfizi', '3335083098', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1615, 'ziriguidum', '3289824978', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1616, 'ristocafÃ¨', '3913931366', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1617, 'mangi e tasti', '3755004440', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1618, 'la tartaruga', '3892889900', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1619, 'c\'Ã¨ pizza per te the western', '3275963000', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1620, 'al centouno', '3381223082', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1621, 'house food ', '3801033963', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1622, 'streetfood 6 burger', '3515566871', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1623, 'antico monastero', '3394905465', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1624, 'zenit pub', '3280035666', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1625, 'la carrozza', '3356173250', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1626, 'pulcinella', '3314336912', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1627, 'la cometa', '3201859483', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1628, 'basti', '3511036421', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1629, 'l\'antico casale', '3472520350', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1630, 'one more', '3475374877', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1631, 'madama lela', '3896630303', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1632, 'la fertÃ¨', '0141273468', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1633, 'la regibussa', '3472626814', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1634, 'il giglio matto', '3470091401', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1635, 'black storm', '3921964696', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1636, 'primavera', '3934039972', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1637, 'mediterranea', '3899975935', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1638, 'il cavolo a merenda', '3895407774', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1639, 'vicolo battisti', '3202274222', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1640, 'il cavallino alato', '3493168081', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1641, 'universo pollo', '3314376843', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1642, 'daij gÃ©polÃ¬n', '3474131226', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1643, 'ca\' nadin', '3334559307', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1644, 'super kebab', '3345922466', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
INSERT INTO `liste_contatti` (`contatto_id`, `nome`, `telefono`, `lista_provenienza`, `date_add`) VALUES
	(1645, 'il fiordaliso', '3487031474', 'numeri whatsapp AT AL.xlsx', '2022-05-05 09:46:01');
/*!40000 ALTER TABLE `liste_contatti` ENABLE KEYS */;

-- Dump della struttura di tabella gmaps.numeri_salvati
CREATE TABLE IF NOT EXISTS `numeri_salvati` (
  `numero_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `univocità` (`numero`,`nome`),
  KEY `Indice 1` (`numero_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella gmaps.numeri_salvati: 36 rows
/*!40000 ALTER TABLE `numeri_salvati` DISABLE KEYS */;
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(1, 'Abruzzo Fritto Salato ', '3485179986', '2022-05-05 11:01:28');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(2, 'Abruzzo Bottega Del Luppolo', '3425476848', '2022-05-05 11:03:30');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(3, 'Abruzzo Pizzeria Odeon', '3476480248', '2022-05-05 11:03:51');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(4, 'Abruzzo L\'angolo della pizza', '3791566086', '2022-05-05 11:04:06');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(7, 'Abruzzo Officina della pasta San Salvo', '3496268645', '2022-05-05 11:15:24');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(8, 'Abruzzo Pizzeria mordi e fuggi', '3385444204', '2022-05-05 11:15:38');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(9, 'Abruzzo Alba Chiara 3', '3287252261', '2022-05-05 11:15:59');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(10, 'Abruzzo Enoteca Le Sommelier', '3391509425', '2022-05-05 11:17:19');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(11, 'Abruzzo DranK', '3493905444', '2022-05-05 11:17:41');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(12, 'Pizzeria "La Porta Della Terra"', '3291546933', '2022-05-05 11:17:50');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(13, 'Alibabar da Monica Centofanti', '3314371569', '2022-05-05 11:18:00');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(14, 'Peligro Hamburgeria', '3388734556', '2022-05-05 11:18:07');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(15, 'Pepebianco', '3486011384', '2022-05-05 11:18:14');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(16, 'Trattoria Caruso', '3406011239', '2022-05-05 11:18:24');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(17, 'Osteria del mare', '3476230592', '2022-05-05 11:18:32');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(18, 'Osteria Del Padre', '3664585302', '2022-05-05 11:18:40');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(19, 'Cantina Degli Angeli', '3381866489', '2022-05-05 11:18:49');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(20, 'Al metrò', '3386291986', '2022-05-05 12:10:06');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(21, 'Abruzzo Ristorante Antica Ricetta', '3405634301', '2022-05-05 14:56:19');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(22, 'Abruzzo L\'Osteria del Tarassaco', '3487434269', '2022-05-05 14:56:30');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(23, 'Abruzzo L\'angolo Del Gusto', '3395786009', '2022-05-05 14:56:44');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(24, 'Abruzzo Zio Nicola', '3342884061', '2022-05-05 14:56:58');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(25, 'Abruzzo Ristorante Pizzeria Aufidena', '3496857043', '2022-05-05 14:57:08');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(26, 'Abruzzo Trattoria Perticone', '3491982351', '2022-05-05 14:57:35');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(27, 'Abruzzo Ristorante Rifugio Campetto degli Alpini', '3387410272', '2022-05-05 14:57:53');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(28, 'Abruzzo Ristorante Chichibio', '3289054831', '2022-05-05 14:58:09');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(29, 'Abruzzo Ristorante La Staffa', '3456901909', '2022-05-05 14:58:20');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(30, 'Abruzzo Ristorante la Tavernetta', '3791564056', '2022-05-05 14:58:36');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(31, 'Abruzzo Bar Moma', '3483234622', '2022-05-05 14:58:46');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(32, 'Abruzzo Agriturismo La Rondinella', '3889397747', '2022-05-05 14:59:07');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(33, 'Abruzzo Lo Chalet delle tradizioni', '3664766123', '2022-05-05 14:59:21');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(34, 'Abruzzo Porta Pia Bollicine', '3387619180', '2022-05-05 14:59:30');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(35, 'Abruzzo La Focaccia', '3476250305', '2022-05-05 14:59:41');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(36, 'Abruzzo Bruschetteria Da Fred Pizzeria e Creperia', '3348412959', '2022-05-05 14:59:52');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(37, 'Abruzzo Ristorante Pizzeria Bella e Buona', '3249528356', '2022-05-05 15:00:03');
INSERT INTO `numeri_salvati` (`numero_id`, `nome`, `numero`, `date_add`) VALUES
	(38, 'Abruzzo Il Sorriso Pizzeria Napoletana', '3273509692', '2022-05-05 15:00:15');
/*!40000 ALTER TABLE `numeri_salvati` ENABLE KEYS */;

-- Dump della struttura di tabella gmaps.tmp_nums
CREATE TABLE IF NOT EXISTS `tmp_nums` (
  `tmp_nums_id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(50) COLLATE utf16_unicode_ci DEFAULT NULL,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `non_trovato` tinyint(1) DEFAULT '0',
  UNIQUE KEY `univocità` (`numero`),
  KEY `Indice 1` (`tmp_nums_id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- Dump dei dati della tabella gmaps.tmp_nums: ~78 rows (circa)
/*!40000 ALTER TABLE `tmp_nums` DISABLE KEYS */;
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(8, '3278411612', '2022-05-05 01:00:05', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(9, '3458183482', '2022-05-05 01:00:06', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(14, '3200745795', '2022-05-05 01:00:06', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(25, '3516663062', '2022-05-05 01:00:06', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(138, '3472615753', '2022-05-05 01:00:06', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(140, '3914264318', '2022-05-05 01:00:06', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(147, '3395070513', '2022-05-05 01:00:06', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(155, '3285509811', '2022-05-05 01:00:06', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(166, '3393549496', '2022-05-05 01:00:06', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(193, '3297748755', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(195, '3477912394', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(198, '3894866156', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(200, '3319984668', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(203, '3358311323', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(206, '3397465238', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(210, '3408909561', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(212, '3208697551', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(215, '3426299243', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(218, '3402635483', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(222, '3348060264', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(225, '3299261070', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(242, '3884071760', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(243, '3792788110', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(244, '3516212488', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(245, '3283343573', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(246, '3939633030', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(247, '3669716912', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(248, '368449634', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(249, '3270469186', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(250, '3394032162', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(251, '3669517683', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(252, '3279522578', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(253, '3291112685', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(254, '3246269304', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(255, '3388640976', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(256, '3737510701', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(257, '3939433822', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(258, '3476589177', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(259, '3921090431', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(260, '3318455864', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(261, '3245375914', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(262, '3355481335', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(263, '3384309567', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(264, '3383324204', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(265, '3282234108', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(266, '3348880649', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(267, '3294919763', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(268, '3935012967', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(269, '3317474274', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(270, '3458499373', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(271, '3391410955', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(272, '3890797348', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(273, '3334545455', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(274, '3389176597', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(275, '3294347192', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(276, '3884710045', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(277, '3204395332', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(278, '3404738092', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(279, '3476329070', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(280, '086182887', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(281, '3335618064', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(282, '3477447775', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(283, '3277354764', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(284, '3454015685', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(285, '3775015001', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(286, '3292640134', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(287, '3427909285', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(288, '3490685964', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(289, '0861200250', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(290, '3937661911', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(291, '3920934931', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(292, '3516999350', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(293, '3317073996', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(294, '3451495220', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(295, '3477007417', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(296, '3910578931', '2022-05-05 01:00:06', 0);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(297, '3317147652', '2022-05-05 11:11:42', 1);
INSERT INTO `tmp_nums` (`tmp_nums_id`, `numero`, `date_add`, `non_trovato`) VALUES
	(298, '3461885316', '2022-05-05 11:11:57', 1);
	
