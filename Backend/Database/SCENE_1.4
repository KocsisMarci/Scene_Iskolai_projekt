-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Nov 12. 14:00
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
-- Adatbázis: `scene_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `artists`
--

CREATE TABLE `artists` (
  `ArtistId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Bio` text DEFAULT NULL,
  `ImageUrl` varchar(255) DEFAULT NULL,
  `SocialLinks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`SocialLinks`)),
  `Genre` enum('Musician','DJ','Dancer','Comedian','Magician','Speaker','Organization','AnimalShow','Workshop','Other') NOT NULL DEFAULT 'Other'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bookings`
--

CREATE TABLE `bookings` (
  `BookingId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `EventId` int(10) UNSIGNED NOT NULL,
  `Status` enum('Interested','Going','Cancelled') NOT NULL DEFAULT 'Interested',
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eventphotos`
--

CREATE TABLE `eventphotos` (
  `PhotoId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `EventId` int(10) UNSIGNED NOT NULL,
  `ImageUrl` varchar(255) NOT NULL,
  `XPAwarded` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `UploadedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eventreviews`
--

CREATE TABLE `eventreviews` (
  `ReviewId` int(10) UNSIGNED NOT NULL,
  `EventId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `Rating` tinyint(3) UNSIGNED NOT NULL CHECK (`Rating` between 1 and 5),
  `Comment` text DEFAULT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `events`
--

CREATE TABLE `events` (
  `EventId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Description` text DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Latitude` decimal(9,6) DEFAULT NULL,
  `Longitude` decimal(9,6) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `CoverImageUrl` varchar(255) DEFAULT NULL,
  `MaxCapacity` int(10) UNSIGNED DEFAULT NULL,
  `Status` enum('Published','Draft','Cancelled') NOT NULL DEFAULT 'Published',
  `CreatedByUserId` int(10) UNSIGNED DEFAULT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `OrganizerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `events`
--

INSERT INTO `events` (`EventId`, `Name`, `Description`, `Location`, `Latitude`, `Longitude`, `StartDate`, `EndDate`, `Category`, `CoverImageUrl`, `MaxCapacity`, `Status`, `CreatedByUserId`, `CreatedAt`, `UpdatedAt`, `OrganizerId`) VALUES
(4, 'Rock Koncert 2026', 'Az év legzúzosabb rock bulija élő zenekarral, fergeteges hangulattal és látványos fénytechnikával.', 'Budapest Park', NULL, NULL, '2026-06-15 20:00:00', '2026-06-15 23:30:00', 'Koncert', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=600&q=80', 500, '', NULL, '2026-11-04 16:35:30', '2026-11-04 16:35:30', 1),
(5, 'Modern Művészeti Kiállítás', 'Fiatal tehetséges festők és szobrászok modern kiállítása a kortárs művészet kedvelőinek.', 'Művészetek Múzeuma, Miskolc', NULL, NULL, '2026-07-01 10:00:00', '2026-07-01 18:00:00', 'Kiállítás', 'https://images.unsplash.com/photo-1536924940846-227afb31e2a5?auto=format&fit=crop&w=600&q=80', 150, '', NULL, '2026-11-04 16:35:30', '2026-11-04 16:35:30', 1),
(6, 'Stand-up Comedy Est', '', 'Kulturális Központ', NULL, NULL, '2026-07-20 19:00:00', '0001-01-01 00:00:00', 'Szórakozás és nevetés', 'https://images.unsplash.com/photo-1585699324551-f6c309eedf7b?auto=format&fit=crop&w=600&q=80', 0, '', NULL, '2026-11-04 16:35:30', '2026-11-12 11:55:26', 1),
(7, '', '', '', NULL, NULL, '2026-11-12 00:00:00', '0001-01-01 00:00:00', '', NULL, 0, 'Published', NULL, '2026-11-12 11:52:05', '2026-11-12 11:52:05', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eventvendors`
--

CREATE TABLE `eventvendors` (
  `EventId` int(10) UNSIGNED NOT NULL,
  `VendorId` int(10) UNSIGNED NOT NULL,
  `SpotLabel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `performances`
--

CREATE TABLE `performances` (
  `PerformanceId` int(10) UNSIGNED NOT NULL,
  `EventId` int(10) UNSIGNED NOT NULL,
  `ArtistId` int(10) UNSIGNED NOT NULL,
  `StageName` varchar(100) DEFAULT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `refreshtokens`
--

CREATE TABLE `refreshtokens` (
  `RefreshTokenId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `Token` varchar(255) NOT NULL,
  `ExpiresAt` datetime(6) NOT NULL,
  `IsRevoked` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `refreshtokens`
--

INSERT INTO `refreshtokens` (`RefreshTokenId`, `UserId`, `Token`, `ExpiresAt`, `IsRevoked`, `CreatedAt`) VALUES
(1, 1, '7hGX4w0ZMIK8q2VtK3MBW8XNc6FhRzDy4U08KhosUjX+sHWNfBKFhcbErGH3PPXF01DonixCOIdwjcXaQ2jzIQ==', '2026-11-19 10:51:04.123699', 0, '2026-11-12 10:51:04.123916'),
(2, 1, 'fkdMjiit172yexKF8h+f3sZPB4UT01oIk6Tqkiu5aiv+SqkmyFyLdYy/yY61dk2grenHOoZOC9i25nD6FByLaw==', '2026-11-19 10:55:10.499320', 0, '2026-11-12 10:55:10.499401'),
(3, 1, '87G4hsbafFV2XQ22mmzmyjjzOzcyzjxxHjI+1rlqOyGclACEch9zAxW92M4CBovucu0lqP/3Q1jWWtdxSaxt3g==', '2026-11-19 12:11:07.011331', 0, '2026-11-12 12:11:07.011421'),
(4, 1, 'PZn25n3O/soepFtMjAUp3XIlJji/ljqCvuAhyHHyBWh6R3XkpX8xVnKhlG6lnYnu36KdvrqI6KZJO3hgVdKasw==', '2026-11-19 12:21:27.497096', 0, '2026-11-12 12:21:27.497189'),
(5, 1, 'MiNygDEdSHopw3oBafdUtO9ehBB31+JqhLyUQfxUPZ7Y4JFqrcv5jOgnTsvwcHWLJknQnYB1hLa+3eAv6w4Kuw==', '2026-11-19 12:33:08.898828', 0, '2026-11-12 12:33:08.898906');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `UserId` int(10) UNSIGNED NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `DisplayName` varchar(100) DEFAULT NULL,
  `AvatarLevel` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `CurrentXP` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `AvatarImageUrl` varchar(255) DEFAULT NULL,
  `Bio` varchar(500) DEFAULT NULL,
  `Role` enum('User','Admin') NOT NULL DEFAULT 'User',
  `IsActive` tinyint(1) NOT NULL DEFAULT 1,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`UserId`, `Username`, `Email`, `PasswordHash`, `DisplayName`, `AvatarLevel`, `CurrentXP`, `AvatarImageUrl`, `Bio`, `Role`, `IsActive`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'admin', 'admin@scene.hu', '$2a$11$gKt33ZoW2Mms.GOhyrSBi.O8GpSAlbB7VUl1Ad0u1tShvoPC8JsQm', NULL, 1, 0, NULL, NULL, 'Admin', 1, '2026-11-05 14:06:50', '2026-11-05 14:06:50');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vendors`
--

CREATE TABLE `vendors` (
  `VendorId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(150) NOT NULL,
  `VendorType` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `ContactEmail` varchar(150) DEFAULT NULL,
  `ContactPhone` varchar(30) DEFAULT NULL,
  `ImageUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `xptransactions`
--

CREATE TABLE `xptransactions` (
  `TransactionId` int(10) UNSIGNED NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `Amount` int(11) NOT NULL,
  `Reason` varchar(100) NOT NULL,
  `ReferenceId` int(10) UNSIGNED DEFAULT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`ArtistId`);

--
-- A tábla indexei `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingId`),
  ADD UNIQUE KEY `uq_Booking` (`UserId`,`EventId`),
  ADD KEY `idx_Bookings_UserId` (`UserId`),
  ADD KEY `idx_Bookings_EventId` (`EventId`);

--
-- A tábla indexei `eventphotos`
--
ALTER TABLE `eventphotos`
  ADD PRIMARY KEY (`PhotoId`),
  ADD KEY `fk_EventPhotos_User` (`UserId`),
  ADD KEY `idx_EventPhotos_EventId` (`EventId`);

--
-- A tábla indexei `eventreviews`
--
ALTER TABLE `eventreviews`
  ADD PRIMARY KEY (`ReviewId`),
  ADD UNIQUE KEY `uq_User_Event_Review` (`EventId`,`UserId`),
  ADD KEY `fk_Reviews_User` (`UserId`);

--
-- A tábla indexei `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`EventId`),
  ADD KEY `fk_Events_CreatedBy` (`CreatedByUserId`),
  ADD KEY `idx_Events_StartDate` (`StartDate`),
  ADD KEY `idx_Events_Category` (`Category`);

--
-- A tábla indexei `eventvendors`
--
ALTER TABLE `eventvendors`
  ADD PRIMARY KEY (`EventId`,`VendorId`),
  ADD KEY `fk_EventVendors_Vendor` (`VendorId`);

--
-- A tábla indexei `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`PerformanceId`),
  ADD UNIQUE KEY `uq_Performance` (`EventId`,`ArtistId`,`StartTime`),
  ADD KEY `fk_Performances_Artist` (`ArtistId`);

--
-- A tábla indexei `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD PRIMARY KEY (`RefreshTokenId`),
  ADD KEY `FK_RefreshTokens_Users_UserId` (`UserId`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- A tábla indexei `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`VendorId`);

--
-- A tábla indexei `xptransactions`
--
ALTER TABLE `xptransactions`
  ADD PRIMARY KEY (`TransactionId`),
  ADD KEY `idx_XPTransactions_UserId` (`UserId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `artists`
--
ALTER TABLE `artists`
  MODIFY `ArtistId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `eventphotos`
--
ALTER TABLE `eventphotos`
  MODIFY `PhotoId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `eventreviews`
--
ALTER TABLE `eventreviews`
  MODIFY `ReviewId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `events`
--
ALTER TABLE `events`
  MODIFY `EventId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `performances`
--
ALTER TABLE `performances`
  MODIFY `PerformanceId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `refreshtokens`
--
ALTER TABLE `refreshtokens`
  MODIFY `RefreshTokenId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `vendors`
--
ALTER TABLE `vendors`
  MODIFY `VendorId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `xptransactions`
--
ALTER TABLE `xptransactions`
  MODIFY `TransactionId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_Bookings_Event` FOREIGN KEY (`EventId`) REFERENCES `events` (`EventId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Bookings_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE;

--
-- Megkötések a táblához `eventphotos`
--
ALTER TABLE `eventphotos`
  ADD CONSTRAINT `fk_EventPhotos_Event` FOREIGN KEY (`EventId`) REFERENCES `events` (`EventId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_EventPhotos_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE;

--
-- Megkötések a táblához `eventreviews`
--
ALTER TABLE `eventreviews`
  ADD CONSTRAINT `fk_Reviews_Event` FOREIGN KEY (`EventId`) REFERENCES `events` (`EventId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Reviews_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE;

--
-- Megkötések a táblához `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_Events_CreatedBy` FOREIGN KEY (`CreatedByUserId`) REFERENCES `users` (`UserId`) ON DELETE SET NULL;

--
-- Megkötések a táblához `eventvendors`
--
ALTER TABLE `eventvendors`
  ADD CONSTRAINT `fk_EventVendors_Event` FOREIGN KEY (`EventId`) REFERENCES `events` (`EventId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_EventVendors_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `vendors` (`VendorId`) ON DELETE CASCADE;

--
-- Megkötések a táblához `performances`
--
ALTER TABLE `performances`
  ADD CONSTRAINT `fk_Performances_Artist` FOREIGN KEY (`ArtistId`) REFERENCES `artists` (`ArtistId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Performances_Event` FOREIGN KEY (`EventId`) REFERENCES `events` (`EventId`) ON DELETE CASCADE;

--
-- Megkötések a táblához `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD CONSTRAINT `FK_RefreshTokens_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE;

--
-- Megkötések a táblához `xptransactions`
--
ALTER TABLE `xptransactions`
  ADD CONSTRAINT `fk_XPTransactions_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
