-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Lis 14, 2025 at 09:29 AM
-- Wersja serwera: 9.5.0
-- Wersja PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `pythonapp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `id_kategoria` int NOT NULL,
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `kategoria`
--

INSERT INTO `kategoria` (`id_kategoria`, `nazwa`) VALUES
(1, 'Koncert'),
(2, 'Wystawa'),
(3, 'Festiwal'),
(4, 'Warsztaty'),
(5, 'Sport'),
(6, 'Spotkanie autorskie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lokalizacja`
--

CREATE TABLE `lokalizacja` (
  `id_lokalizacja` int NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `lokalizacja`
--

INSERT INTO `lokalizacja` (`id_lokalizacja`, `nazwa`, `adres`, `opis`) VALUES
(1, 'Miejski Dom Kultury', 'ul. Warszawska 173, Mińsk Mazowiecki', 'Główne centrum kulturalne miasta, sala widowiskowa i galeria.'),
(2, 'Park Dernałowiczów', 'ul. Okrzei, Mińsk Mazowiecki', 'Zabytkowy park miejski, miejsce wydarzeń plenerowych.'),
(3, 'Muzeum Ziemi Mińskiej', 'ul. Okrzei 16, Mińsk Mazowiecki', 'Placówka muzealna z ekspozycjami lokalnej historii i sztuki.'),
(4, 'Stadion MOSiR', 'ul. Sportowa 1, Mińsk Mazowiecki', 'Stadion miejski, obiekt sportowy i koncertowy.'),
(5, 'Biblioteka Miejska', 'ul. Piłsudskiego 1A, Mińsk Mazowiecki', 'Nowoczesna biblioteka z salą spotkań i zajęć dla dzieci.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `organizator`
--

CREATE TABLE `organizator` (
  `id_organizator` int NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `organizator`
--

INSERT INTO `organizator` (`id_organizator`, `nazwa`, `mail`, `tel`) VALUES
(1, 'Miejski Dom Kultury w Mińsku Mazowieckim', 'mdk@minsk.pl', '257567890'),
(2, 'Urząd Miasta Mińsk Mazowiecki', 'urzad@minsk-maz.pl', '257566666'),
(3, 'Muzeum Ziemi Mińskiej', 'muzeum@minsk.pl', '257567321'),
(4, 'MOSiR Mińsk Mazowiecki', 'mosir@minsk.pl', '257564444'),
(5, 'Biblioteka Miejska', 'biblioteka@minsk.pl', '257565555');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydarzenia`
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

--
-- Zrzut danych tabeli `wydarzenia`
--

INSERT INTO `wydarzenia` (`id_wydarzenia`, `nazwa`, `data_poczatek`, `data_koniec`, `opis`, `id_lokalizacja`, `id_kategoria`, `id_organizator`) VALUES
(1, 'Dni Mińska Mazowieckiego 2025', '2025-06-13', '2025-06-15', 'Coroczne święto miasta z koncertami, pokazami i atrakcjami dla całych rodzin w Parku Dernałowiczów.', 2, 3, 2),
(2, 'Koncert Orkiestry Kameralnej', '2025-03-22', '2025-03-22', 'Występ Mińskiej Orkiestry Kameralnej w sali widowiskowej MDK.', 1, 1, 1),
(3, 'Wystawa „Mińsk na dawnych fotografiach”', '2025-02-10', '2025-04-10', 'Ekspozycja starych zdjęć miasta ze zbiorów mieszkańców i archiwów lokalnych.', 3, 2, 3),
(4, 'Bieg Niepodległości', '2025-11-11', '2025-11-11', 'Uroczysty bieg ulicami Mińska Mazowieckiego z okazji Święta Niepodległości.', 4, 5, 4),
(5, 'Warsztaty ceramiczne dla dzieci', '2025-04-18', '2025-04-18', 'Zajęcia plastyczne z tworzenia ceramiki w Bibliotece Miejskiej.', 5, 4, 5),
(6, 'Spotkanie autorskie z Joanną Jax', '2025-05-25', '2025-05-25', 'Autorka bestsellerowych powieści opowie o swojej twórczości i spotka się z czytelnikami.', 5, 6, 5),
(7, 'Updated Name', '2025-12-01', '2025-12-02', 'Updated Opis', 2, 2, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id_kategoria`);

--
-- Indeksy dla tabeli `lokalizacja`
--
ALTER TABLE `lokalizacja`
  ADD PRIMARY KEY (`id_lokalizacja`);

--
-- Indeksy dla tabeli `organizator`
--
ALTER TABLE `organizator`
  ADD PRIMARY KEY (`id_organizator`);

--
-- Indeksy dla tabeli `wydarzenia`
--
ALTER TABLE `wydarzenia`
  ADD PRIMARY KEY (`id_wydarzenia`),
  ADD KEY `fk_lokalizacja` (`id_lokalizacja`),
  ADD KEY `fk_kategoria` (`id_kategoria`),
  ADD KEY `fk_organizator` (`id_organizator`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id_kategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `lokalizacja`
--
ALTER TABLE `lokalizacja`
  MODIFY `id_lokalizacja` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `organizator`
--
ALTER TABLE `organizator`
  MODIFY `id_organizator` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `wydarzenia`
--
ALTER TABLE `wydarzenia`
  MODIFY `id_wydarzenia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `wydarzenia`
--
ALTER TABLE `wydarzenia`
  ADD CONSTRAINT `fk_wydarzenia_kategoria` FOREIGN KEY (`id_kategoria`) REFERENCES `kategoria` (`id_kategoria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wydarzenia_lokalizacja` FOREIGN KEY (`id_lokalizacja`) REFERENCES `lokalizacja` (`id_lokalizacja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wydarzenia_organizator` FOREIGN KEY (`id_organizator`) REFERENCES `organizator` (`id_organizator`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
