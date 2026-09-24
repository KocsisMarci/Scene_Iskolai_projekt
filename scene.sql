-- =========================================================
--  SCENE - adatbazis sema
--  MySQL 8.0+ / InnoDB / utf8mb4
-- =========================================================

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

-- =========================================================
-- ARTISTS
-- =========================================================
CREATE TABLE Artists (
    ArtistId        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name            VARCHAR(150) NOT NULL,
    Genre           VARCHAR(100),
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
