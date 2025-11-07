-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Nov 07, 2025 at 09:21 AM
-- Server version: 9.5.0
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wydarzenia`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategoria`
--

CREATE TABLE `kategoria` (
  `id_kategoria` int NOT NULL,
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lokalizacja`
--

CREATE TABLE `lokalizacja` (
  `id_lokalizacja` int NOT NULL,
  `opis` text NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizator`
--

CREATE TABLE `organizator` (
  `id_organizator` int NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `tel` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wydarzenia`
--

CREATE TABLE `wydarzenia` (
  `id_wydarzenia` int NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `data_poczatek` date NOT NULL,
  `data_koniec` date NOT NULL,
  `opis` text NOT NULL,
  `id_lokalizacja` int NOT NULL,
  `id_kategoria` int NOT NULL,
  `id_organizator` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
