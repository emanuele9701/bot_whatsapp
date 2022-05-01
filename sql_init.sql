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

-- Dump dei dati della tabella gmaps.history_msg: ~0 rows (circa)
DELETE FROM `history_msg`;
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

-- Dump dei dati della tabella gmaps.history_msg_answer: ~1 rows (circa)
DELETE FROM `history_msg_answer`;
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

-- Dump della struttura di vista gmaps.msg_answers
-- Rimozione temporanea di tabella e creazione della struttura finale della vista
DROP TABLE IF EXISTS `msg_answers`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `msg_answers` AS SELECT hm.id AS id_msg_ricevuto,hm.msg_from AS mittente,hm.msg_body AS messaggio_ricevuto,hm.datetime AS data_ricezione_mex,hma.id AS id_risposta, hma.answer AS risposta, hma.date AS data_risposta 
FROM history_msg hm left JOIN history_msg_answer hma ON hm.id = hma.id_msg_from ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
