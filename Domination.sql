-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.1.18-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für domination
CREATE DATABASE IF NOT EXISTS `domination` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `domination`;

-- Exportiere Struktur von Tabelle domination.missionsave
CREATE TABLE IF NOT EXISTS `missionsave` (
  `name` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `d_maintargets` int(11) NOT NULL,
  `d_maintargets_list` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_current_target_index` int(11) NOT NULL,
  `d_cur_sm_idx` int(11) NOT NULL,
  `d_resolved_targets` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_recapture_indices` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `d_side_missions_random` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_current_mission_counter` int(11) NOT NULL,
  `d_searchintel` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_bonus_vecs_db` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `d_worldname` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_combiname` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  `missionname` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle domination.missionsavett
CREATE TABLE IF NOT EXISTS `missionsavett` (
  `name` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `d_maintargets` int(11) NOT NULL,
  `d_maintargets_list` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_current_target_index` int(11) NOT NULL,
  `d_cur_sm_idx` int(11) NOT NULL,
  `d_resolved_targets` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_recapture_indices` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `d_side_missions_random` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `d_current_mission_counter` int(11) NOT NULL,
  `d_searchintel` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_bonus_vecs_db_w` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `d_bonus_vecs_db_e` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `d_worldname` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_points_blufor` int(11) NOT NULL,
  `d_points_opfor` int(11) NOT NULL,
  `d_kill_points_blufor` int(11) NOT NULL,
  `d_kill_points_opfor` int(11) NOT NULL,
  `d_points_array` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `d_combiname` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  `missionname` varchar(130) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle domination.players
CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `playerid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `playtime` int(11) NOT NULL DEFAULT '0',
  `infkills` int(11) NOT NULL DEFAULT '0',
  `softveckills` int(11) NOT NULL DEFAULT '0',
  `armorkills` int(11) NOT NULL DEFAULT '0',
  `airkills` int(11) NOT NULL DEFAULT '0',
  `deaths` int(11) NOT NULL DEFAULT '0',
  `totalscore` int(11) NOT NULL DEFAULT '0',
  `radiotowerkills` int(11) NOT NULL DEFAULT '0',
  `numplayedonserver` int(11) NOT NULL DEFAULT '1',
  `campscaptured` int(11) NOT NULL DEFAULT '0',
  `mtsmkills` int(11) NOT NULL DEFAULT '0',
  `teamkills` int(11) NOT NULL DEFAULT '0',
  `revives` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
