-- =========================================================
--  SCENE - adatbazis sema
--  MySQL 8.0+ / InnoDB / utf8mb4
-- =========================================================

-- Fejlesztes alatt: az ujraimportalas elott torli a regi adatbazist.
DROP DATABASE IF EXISTS scene_db;

CREATE DATABASE IF NOT EXISTS scene_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE scene_db;

-- =========================================================
-- USERS
-- =========================================================
CREATE TABLE Users (
    UserId          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Username        VARCHAR(50)  NOT NULL UNIQUE,
    Email           VARCHAR(150) NOT NULL UNIQUE,
    PasswordHash    VARCHAR(255) NOT NULL,
    DisplayName     VARCHAR(100),
    AvatarLevel     INT UNSIGNED NOT NULL DEFAULT 1,
    CurrentXP       INT UNSIGNED NOT NULL DEFAULT 0,
    AvatarImageUrl  VARCHAR(255),
    Bio             VARCHAR(500),
    Role            ENUM('User','Admin') NOT NULL DEFAULT 'User',
    CreatedAt       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
                        ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Kezdo felhasznalok: az Events tabla CreatedByUserId (1, 2, 3) ezekre hivatkozik.
-- A PasswordHash itt csak helyorzo, a valodi hash-t az alkalmazas allitja elo.
INSERT INTO Users
    (Username, Email, PasswordHash, DisplayName, Role)
VALUES
    ('admin',  'admin@scene.hu',  'CHANGE_ME_HASH', 'Admin',        'Admin'),
    ('anna',   'anna@scene.hu',   'CHANGE_ME_HASH', 'Anna',         'User'),
    ('bence',  'bence@scene.hu',  'CHANGE_ME_HASH', 'Bence',        'User');

-- =========================================================
-- EVENTS
-- =========================================================
CREATE TABLE Events (
    EventId         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name            VARCHAR(150) NOT NULL,
    Description     TEXT,
    Location        VARCHAR(255),
    Latitude        DECIMAL(9,6),
    Longitude       DECIMAL(9,6),
    StartDate       DATETIME NOT NULL,
    EndDate         DATETIME NOT NULL,
    Category        VARCHAR(50),
    CoverImageUrl   VARCHAR(255),
    CreatedByUserId INT UNSIGNED,
    CreatedAt       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_Events_CreatedBy
        FOREIGN KEY (CreatedByUserId) REFERENCES Users(UserId)
        ON DELETE SET NULL
) ENGINE=InnoDB;

INSERT INTO Events
    (Name, Description, Location, Latitude, Longitude, StartDate, EndDate, Category, CoverImageUrl, CreatedByUserId)
VALUES
(
    'Budapest Tech Meetup',
    'Kötetlen találkozó fejlesztőknek és tech iránt érdeklődőknek.',
    'Müpa Budapest',
    47.469430,
    19.071010,
    '2026-10-15 18:00:00',
    '2026-10-15 21:00:00',
    'Technology',
    'https://example.com/images/tech-meetup.jpg',
    1
),
(
    'Őszi Street Food Fesztivál',
    'Street food ételek, különleges italok és élő zene egész hétvégén.',
    'Városliget',
    47.514900,
    19.077300,
    '2026-10-17 11:00:00',
    '2026-10-17 22:00:00',
    'Food',
    'https://example.com/images/street-food.jpg',
    2
),
(
    'Budapest Jazz Night',
    'Élő jazz koncert a város szívében.',
    'A38 Hajó',
    47.471500,
    19.062500,
    '2026-10-20 20:00:00',
    '2026-10-20 23:00:00',
    'Music',
    'https://example.com/images/jazz-night.jpg',
    1
),
(
    'Futóklub – Margitsziget',
    'Közös esti futás kezdőknek és haladóknak. A táv körülbelül 7 km.',
    'Margitsziget',
    47.526900,
    19.047900,
    '2026-10-22 18:30:00',
    '2026-10-22 20:00:00',
    'Sport',
    'https://example.com/images/running.jpg',
    3
),
(
    'Budapesti Fotóséta',
    'Közös fotóséta Budapest történelmi belvárosában.',
    'Deák Ferenc tér',
    47.497900,
    19.054900,
    '2026-10-24 15:00:00',
    '2026-10-24 18:00:00',
    'Photography',
    'https://example.com/images/photo-walk.jpg',
    2
),
(
    'Indie Game Developers Meetup',
    'Független játékfejlesztők találkozója, előadásokkal és networkinggel.',
    'Király utca 26.',
    47.498600,
    19.058800,
    '2026-10-27 18:00:00',
    '2026-10-27 21:30:00',
    'Gaming',
    'https://example.com/images/gamedev.jpg',
    1
),
(
    'Halloween Party 2026',
    'Jelmezes Halloween party DJ-vel és különleges programokkal.',
    'Akvárium Klub',
    47.497200,
    19.054300,
    '2026-10-31 21:00:00',
    '2026-11-01 03:00:00',
    'Party',
    'https://example.com/images/halloween.jpg',
    3
),
(
    'Kávékóstoló Workshop',
    'Ismerkedés különböző specialty kávékkal és elkészítési módszerekkel.',
    'Bartók Béla út',
    47.478500,
    19.047700,
    '2026-11-03 17:30:00',
    '2026-11-03 19:30:00',
    'Workshop',
    'https://example.com/images/coffee.jpg',
    2
),
(
    'Startup Networking Night',
    'Startup alapítók, fejlesztők és befektetők találkozója.',
    'Millenáris',
    47.510100,
    19.025900,
    '2026-11-05 18:00:00',
    '2026-11-05 22:00:00',
    'Business',
    'https://example.com/images/startup.jpg',
    1
),
(
    'Őszi Könyvklub',
    'Havi könyvklub beszélgetés, ezúttal kortárs magyar regényekről.',
    'Fővárosi Szabó Ervin Könyvtár',
    47.488900,
    19.065300,
    '2026-11-08 16:00:00',
    '2026-11-08 18:00:00',
    'Culture',
    'https://example.com/images/bookclub.jpg',
    3
);

-- =========================================================
-- ARTISTS
-- =========================================================
CREATE TABLE Artists (
    ArtistId        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name            VARCHAR(150) NOT NULL,
    Genre           ENUM('Musician','DJ','Dancer','Comedian','Magician',
                         'Speaker','Organization','AnimalShow','Workshop','Other')
                        NOT NULL DEFAULT 'Other',
    Bio             TEXT,
    ImageUrl        VARCHAR(255),
    SocialLinks     VARCHAR(500)   -- pl. JSON string vagy vesszovel elvalasztott linkek
) ENGINE=InnoDB;

-- =========================================================
-- VENDORS
-- =========================================================
CREATE TABLE Vendors (
    VendorId        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name            VARCHAR(150) NOT NULL,
    VendorType      VARCHAR(50),   -- pl. 'Food', 'Merch', 'Drink'
    Description     TEXT,
    ContactEmail    VARCHAR(150),
    ContactPhone    VARCHAR(30),
    ImageUrl        VARCHAR(255)
) ENGINE=InnoDB;

-- =========================================================
-- PERFORMANCES (Events <-> Artists, M:N + extra adatok)
-- =========================================================
CREATE TABLE Performances (
    PerformanceId   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EventId         INT UNSIGNED NOT NULL,
    ArtistId        INT UNSIGNED NOT NULL,
    StageName       VARCHAR(100),
    StartTime       DATETIME NOT NULL,
    EndTime         DATETIME NOT NULL,

    CONSTRAINT fk_Performances_Event
        FOREIGN KEY (EventId) REFERENCES Events(EventId)
        ON DELETE CASCADE,
    CONSTRAINT fk_Performances_Artist
        FOREIGN KEY (ArtistId) REFERENCES Artists(ArtistId)
        ON DELETE CASCADE,

    UNIQUE KEY uq_Performance (EventId, ArtistId, StartTime)
) ENGINE=InnoDB;

-- =========================================================
-- BOOKINGS (Users <-> Events, M:N + statusz)
-- =========================================================
CREATE TABLE Bookings (
    BookingId       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    UserId          INT UNSIGNED NOT NULL,
    EventId         INT UNSIGNED NOT NULL,
    Status          ENUM('Interested','Going','Cancelled') NOT NULL DEFAULT 'Interested',
    CreatedAt       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_Bookings_User
        FOREIGN KEY (UserId) REFERENCES Users(UserId)
        ON DELETE CASCADE,
    CONSTRAINT fk_Bookings_Event
        FOREIGN KEY (EventId) REFERENCES Events(EventId)
        ON DELETE CASCADE,

    UNIQUE KEY uq_Booking (UserId, EventId)
) ENGINE=InnoDB;

-- =========================================================
-- EVENTVENDORS (Vendors <-> Events, M:N)
-- =========================================================
CREATE TABLE EventVendors (
    EventId         INT UNSIGNED NOT NULL,
    VendorId        INT UNSIGNED NOT NULL,
    SpotLabel       VARCHAR(50),   -- pl. "A3 standhely"

    PRIMARY KEY (EventId, VendorId),

    CONSTRAINT fk_EventVendors_Event
        FOREIGN KEY (EventId) REFERENCES Events(EventId)
        ON DELETE CASCADE,
    CONSTRAINT fk_EventVendors_Vendor
        FOREIGN KEY (VendorId) REFERENCES Vendors(VendorId)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- (OPCIONALIS - de ajanlott) EVENTPHOTOS
-- Feltoltott kepek egy adott eventhez, XP jutalommal
-- =========================================================
CREATE TABLE EventPhotos (
    PhotoId         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    UserId          INT UNSIGNED NOT NULL,
    EventId         INT UNSIGNED NOT NULL,
    ImageUrl        VARCHAR(255) NOT NULL,
    XPAwarded       INT UNSIGNED NOT NULL DEFAULT 0,
    Status          ENUM('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
    UploadedAt      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_EventPhotos_User
        FOREIGN KEY (UserId) REFERENCES Users(UserId)
        ON DELETE CASCADE,
    CONSTRAINT fk_EventPhotos_Event
        FOREIGN KEY (EventId) REFERENCES Events(EventId)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- (OPCIONALIS) XPTRANSACTIONS
-- Naplozza honnan szarmazott az XP (kepfeltoltes, booking, stb.)
-- =========================================================
CREATE TABLE XPTransactions (
    TransactionId   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    UserId          INT UNSIGNED NOT NULL,
    Amount          INT NOT NULL,
    Reason          VARCHAR(100) NOT NULL,   -- pl. 'PhotoUpload', 'EventCheckIn'
    ReferenceId     INT UNSIGNED,            -- pl. PhotoId vagy BookingId
    CreatedAt       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_XPTransactions_User
        FOREIGN KEY (UserId) REFERENCES Users(UserId)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- Indexek a gyakori lekerdezesekhez
-- =========================================================
CREATE INDEX idx_Events_StartDate ON Events(StartDate);
CREATE INDEX idx_Bookings_UserId ON Bookings(UserId);
CREATE INDEX idx_Bookings_EventId ON Bookings(EventId);
CREATE INDEX idx_EventPhotos_EventId ON EventPhotos(EventId);
