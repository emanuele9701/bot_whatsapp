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
/*!40000 ALTER TABLE `tmp_nums` ENABLE KEYS */;

-- Dump della struttura di vista gmaps.msg_answers
-- Rimozione temporanea di tabella e creazione della struttura finale della vista
DROP TABLE IF EXISTS `msg_answers`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `msg_answers` AS SELECT hm.id AS id_msg_ricevuto,hm.msg_from AS mittente,hm.msg_body AS messaggio_ricevuto,hm.datetime AS data_ricezione_mex,hma.id AS id_risposta, hma.answer AS risposta, hma.date AS data_risposta 
FROM history_msg hm left JOIN history_msg_answer hma ON hm.id = hma.id_msg_from ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
