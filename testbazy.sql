-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Nov 13, 2025
-- Server version: 9.5.0
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `wydarzenia`;
DROP TABLE IF EXISTS `organizator`;
DROP TABLE IF EXISTS `lokalizacja`;
DROP TABLE IF EXISTS `kategoria`;

-- --------------------------------------------------------
-- Table: kategoria
-- --------------------------------------------------------
CREATE TABLE `kategoria` (
  `id_kategoria` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  PRIMARY KEY (`id_kategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table: lokalizacja
-- --------------------------------------------------------
CREATE TABLE `lokalizacja` (
  `id_lokalizacja` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `opis` text NOT NULL,
  PRIMARY KEY (`id_lokalizacja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table: organizator
-- --------------------------------------------------------
CREATE TABLE `organizator` (
  `id_organizator` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  PRIMARY KEY (`id_organizator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table: wydarzenia
-- --------------------------------------------------------
CREATE TABLE `wydarzenia` (
  `id_wydarzenia` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `data_poczatek` date NOT NULL,
  `data_koniec` date NOT NULL,
  `opis` text NOT NULL,
  `id_lokalizacja` int NOT NULL,
  `id_kategoria` int NOT NULL,
  `id_organizator` int NOT NULL,
  PRIMARY KEY (`id_wydarzenia`),
  KEY `fk_lokalizacja` (`id_lokalizacja`),
  KEY `fk_kategoria` (`id_kategoria`),
  KEY `fk_organizator` (`id_organizator`),
  CONSTRAINT `fk_wydarzenia_kategoria` FOREIGN KEY (`id_kategoria`) REFERENCES `kategoria` (`id_kategoria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_wydarzenia_lokalizacja` FOREIGN KEY (`id_lokalizacja`) REFERENCES `lokalizacja` (`id_lokalizacja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_wydarzenia_organizator` FOREIGN KEY (`id_organizator`) REFERENCES `organizator` (`id_organizator`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Sample data (Mińsk Mazowiecki)
-- --------------------------------------------------------

-- Kategorie wydarzeń
INSERT INTO `kategoria` (`nazwa`) VALUES
('Koncert'),
('Wystawa'),
('Festiwal'),
('Warsztaty'),
('Sport'),
('Spotkanie autorskie');

-- Lokalizacje w Mińsku Mazowieckim
INSERT INTO `lokalizacja` (`nazwa`, `adres`, `opis`) VALUES
('Miejski Dom Kultury', 'ul. Warszawska 173, Mińsk Mazowiecki', 'Główne centrum kulturalne miasta, sala widowiskowa i galeria.'),
('Park Dernałowiczów', 'ul. Okrzei, Mińsk Mazowiecki', 'Zabytkowy park miejski, miejsce wydarzeń plenerowych.'),
('Muzeum Ziemi Mińskiej', 'ul. Okrzei 16, Mińsk Mazowiecki', 'Placówka muzealna z ekspozycjami lokalnej historii i sztuki.'),
('Stadion MOSiR', 'ul. Sportowa 1, Mińsk Mazowiecki', 'Stadion miejski, obiekt sportowy i koncertowy.'),
('Biblioteka Miejska', 'ul. Piłsudskiego 1A, Mińsk Mazowiecki', 'Nowoczesna biblioteka z salą spotkań i zajęć dla dzieci.');

-- Organizatorzy lokalni
INSERT INTO `organizator` (`nazwa`, `mail`, `tel`) VALUES
('Miejski Dom Kultury w Mińsku Mazowieckim', 'mdk@minsk.pl', '257567890'),
('Urząd Miasta Mińsk Mazowiecki', 'urzad@minsk-maz.pl', '257566666'),
('Muzeum Ziemi Mińskiej', 'muzeum@minsk.pl', '257567321'),
('MOSiR Mińsk Mazowiecki', 'mosir@minsk.pl', '257564444'),
('Biblioteka Miejska', 'biblioteka@minsk.pl', '257565555');

-- Wydarzenia w Mińsku Mazowieckim
INSERT INTO `wydarzenia`
(`nazwa`, `data_poczatek`, `data_koniec`, `opis`, `id_lokalizacja`, `id_kategoria`, `id_organizator`)
VALUES
('Dni Mińska Mazowieckiego 2025', '2025-06-13', '2025-06-15',
 'Coroczne święto miasta z koncertami, pokazami i atrakcjami dla całych rodzin w Parku Dernałowiczów.',
 2, 3, 2),

('Koncert Orkiestry Kameralnej', '2025-03-22', '2025-03-22',
 'Występ Mińskiej Orkiestry Kameralnej w sali widowiskowej MDK.',
 1, 1, 1),

('Wystawa „Mińsk na dawnych fotografiach”', '2025-02-10', '2025-04-10',
 'Ekspozycja starych zdjęć miasta ze zbiorów mieszkańców i archiwów lokalnych.',
 3, 2, 3),

('Bieg Niepodległości', '2025-11-11', '2025-11-11',
 'Uroczysty bieg ulicami Mińska Mazowieckiego z okazji Święta Niepodległości.',
 4, 5, 4),

('Warsztaty ceramiczne dla dzieci', '2025-04-18', '2025-04-18',
 'Zajęcia plastyczne z tworzenia ceramiki w Bibliotece Miejskiej.',
 5, 4, 5),

('Spotkanie autorskie z Joanną Jax', '2025-05-25', '2025-05-25',
 'Autorka bestsellerowych powieści opowie o swojej twórczości i spotka się z czytelnikami.',
 5, 6, 5);

COMMIT;