SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `{prefix}systemmanager_framework` (
  `id_systemmanager_framework` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `version` float(99,4) NOT NULL,
  `changes_log` text NOT NULL,
  PRIMARY KEY (`id_systemmanager_framework`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}systemmanager_institute` (
  `id_systemmanager_institute` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `INSTITUTE` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL COMMENT 'alamat',
  `VILLAGE` varchar(255) NOT NULL COMMENT 'kelurahan',
  `REGION` varchar(255) NOT NULL COMMENT 'kecamatan',
  `COUNTY` varchar(255) NOT NULL COMMENT 'kabupaten',
  `CITY` varchar(255) NOT NULL COMMENT 'kota',
  `PROVINCE` varchar(255) NOT NULL COMMENT 'provinsi',
  `POSTAL_CODE` varchar(255) NOT NULL COMMENT 'kode pos',
  `COUNTRY` varchar(255) NOT NULL COMMENT 'negara',
  `PHONE` varchar(255) NOT NULL,
  `FAX` varchar(255) NOT NULL,
  `WEB` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  PRIMARY KEY (`id_systemmanager_institute`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}systemmanager_license` (
  `id_systemmanager_license` int(11) NOT NULL AUTO_INCREMENT,
  `id_systemmanager_institute` int(11) NOT NULL,
  `APP_ID` varchar(12) NOT NULL,
  `APP_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`id_systemmanager_license`),
  KEY `id_systemmanager_institute` (`id_systemmanager_institute`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}systemmanager_license_exp` (
  `id_systemmanager_license_exp` int(11) NOT NULL AUTO_INCREMENT,
  `id_systemmanager_license` int(11) NOT NULL,
  `UNIQUE_KEY` varchar(12) NOT NULL,
  `INITIATE` date NOT NULL,
  `EXPIRED` date NOT NULL,
  `VERSION` enum('DEMO','FULL','PREMIUM') NOT NULL DEFAULT 'DEMO',
  `PERSONAL` varchar(255) NOT NULL,
  `PERSONAL_EMAIL` varchar(255) NOT NULL,
  `PERSONAL_PHONE` varchar(255) NOT NULL,
  `create` datetime NOT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `download` tinyint(1) NOT NULL DEFAULT '0',
  `dari` varchar(255) DEFAULT NULL COMMENT 'kwitansi diterima dari',
  `price` int(11) DEFAULT NULL COMMENT 'kwitansi nominal',
  `price_display` int(11) DEFAULT NULL COMMENT 'kwitansi nominal yg ditampilkan',
  PRIMARY KEY (`id_systemmanager_license_exp`),
  UNIQUE KEY `UNIQUE_KEY` (`UNIQUE_KEY`),
  KEY `id_systemmanager_license` (`id_systemmanager_license`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}systemmanager_license_modules` (
  `id_systemmanager_license_modules` int(11) NOT NULL AUTO_INCREMENT,
  `id_systemmanager_license` int(11) NOT NULL,
  `id_systemmanager_modules` int(11) NOT NULL,
  PRIMARY KEY (`id_systemmanager_license_modules`),
  UNIQUE KEY `id_systemmanager_license` (`id_systemmanager_license`,`id_systemmanager_modules`),
  KEY `id_systemmanager_modules` (`id_systemmanager_modules`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}systemmanager_modules` (
  `id_systemmanager_modules` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_systemmanager_modules`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}systemmanager_support` (
  `id_systemmanager_support` int(11) NOT NULL AUTO_INCREMENT,
  `id_systemmanager_license` int(11) NOT NULL,
  `UNIQUE_KEY` varchar(12) NOT NULL,
  `initiate` date NOT NULL,
  `expired` date NOT NULL,
  `created` datetime NOT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateable` tinyint(1) NOT NULL DEFAULT '0',
  `dari` varchar(255) DEFAULT NULL COMMENT 'kwitansi diterima dari',
  `price` int(11) DEFAULT NULL COMMENT 'kwitansi nominal',
  `price_display` int(11) DEFAULT NULL COMMENT 'kwitansi nominal yg ditampilkan',
  PRIMARY KEY (`id_systemmanager_support`),
  UNIQUE KEY `UNIQUE_KEY` (`UNIQUE_KEY`),
  KEY `systemmanager_support_systemmanager_license` (`id_systemmanager_license`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}systemmanager_updates` (
  `id_systemmanager_updates` int(11) NOT NULL AUTO_INCREMENT,
  `id_systemmanager_modules` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `version` float(99,2) NOT NULL,
  `changes_log` text NOT NULL,
  PRIMARY KEY (`id_systemmanager_updates`),
  KEY `id_systemmanager_modules` (`id_systemmanager_modules`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;


ALTER TABLE `{prefix}systemmanager_institute`
  ADD CONSTRAINT `systemmanager_institute_users` FOREIGN KEY (`id_users`) REFERENCES `{prefix}users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}systemmanager_license`
  ADD CONSTRAINT `systemmanager_license_systemmanager_institute` FOREIGN KEY (`id_systemmanager_institute`) REFERENCES `{prefix}systemmanager_institute` (`id_systemmanager_institute`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}systemmanager_license_exp`
  ADD CONSTRAINT `systemmanager_license_exp_systemmanager_license` FOREIGN KEY (`id_systemmanager_license`) REFERENCES `{prefix}systemmanager_license` (`id_systemmanager_license`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}systemmanager_license_modules`
  ADD CONSTRAINT `systemmanager_license_modules_systemmanager_license` FOREIGN KEY (`id_systemmanager_license`) REFERENCES `{prefix}systemmanager_license` (`id_systemmanager_license`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `systemmanager_license_modules_systemmanager_modules` FOREIGN KEY (`id_systemmanager_modules`) REFERENCES `{prefix}systemmanager_modules` (`id_systemmanager_modules`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}systemmanager_support`
  ADD CONSTRAINT `systemmanager_support_systemmanager_license` FOREIGN KEY (`id_systemmanager_license`) REFERENCES `{prefix}systemmanager_license` (`id_systemmanager_license`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}systemmanager_updates`
  ADD CONSTRAINT `systemmanager_updates_systemmanager_modules` FOREIGN KEY (`id_systemmanager_modules`) REFERENCES `{prefix}systemmanager_modules` (`id_systemmanager_modules`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
