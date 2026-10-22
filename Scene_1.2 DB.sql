-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Okt 22. 11:06
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fesztival`
--
CREATE DATABASE IF NOT EXISTS `fesztival` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `fesztival`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `latogato`
--

DROP TABLE IF EXISTS `latogato`;
CREATE TABLE `latogato` (
  `id` int(11) NOT NULL,
  `felhasznaloNev` varchar(100) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nem` enum('férfi','nő','x','egyéb') NOT NULL,
  `lakcim` varchar(200) NOT NULL,
  `szuletesi_datum` date NOT NULL,
  `telefonszam` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendezveny`
--

DROP TABLE IF EXISTS `rendezveny`;
CREATE TABLE `rendezveny` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `hely` varchar(100) NOT NULL,
  `kezdesi_ido` datetime NOT NULL,
  `vegzesi_ido` datetime NOT NULL,
  `ferohely` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci COMMENT='Lehet, hogy ez nem tábla, hanem adatbázis kell legyen';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendezvenyszervezo`
--

DROP TABLE IF EXISTS `rendezvenyszervezo`;
CREATE TABLE `rendezvenyszervezo` (
  `id` int(11) NOT NULL,
  `felhasznaloNev` varchar(100) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefonszam` varchar(25) NOT NULL,
  `korzetSzam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `latogato`
--
ALTER TABLE `latogato`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `rendezveny`
--
ALTER TABLE `rendezveny`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `rendezvenyszervezo`
--
ALTER TABLE `rendezvenyszervezo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`telefonszam`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `latogato`
--
ALTER TABLE `latogato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendezveny`
--
ALTER TABLE `rendezveny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendezvenyszervezo`
--
ALTER TABLE `rendezvenyszervezo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
