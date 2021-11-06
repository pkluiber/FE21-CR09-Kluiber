-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Nov 2021 um 14:52
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr9_famazon_peterkluiber`
--
CREATE DATABASE IF NOT EXISTS `cr9_famazon_peterkluiber` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr9_famazon_peterkluiber`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `id_customers` int(11) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `adresse` varchar(50) NOT NULL,
  `zip_of_code` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`id_customers`, `fName`, `lName`, `date_of_birth`, `adresse`, `zip_of_code`, `city`, `email`) VALUES
(1, 'Peter', 'Kluiber', '1987-08-22', 'Webgasse 10/11', '1060', 'Vienna', 'pkluiber@gmail.com'),
(2, 'Gabi', 'Jagadits', '1985-01-28', 'Kuppelstand 11', '2453', 'Sommerein', 'gjagadits@gmail.com'),
(3, 'Laura', 'Jagadits', '2015-11-15', 'Johannesgasse 24/4/2', '2453', 'Sommerein', 'ljagadits@gmail.com'),
(4, 'Maggie', 'Jagadits', '2000-02-04', 'Opalgasse 16', '1210', 'Vienna', 'maggiejagadits@gmail.com'),
(5, 'Chuck', 'Kluiber', '2005-02-03', 'Mustergasse 6', '1010', 'Vienna', 'chuckjagadits@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `orders`
--

INSERT INTO `orders` (`id_orders`, `name`, `description`, `price`) VALUES
(1, 'Dune', 'Der Wüstenplanet: Roman', '9.99'),
(2, 'Fizban s Treasury of Dragons', 'Erfahre in diesem unentbehrlichen Referenzleitfade', '34.99'),
(3, 'Vergissmeinnicht', 'Was man bei Licht nicht sehen kann', '25.99'),
(4, 'Das Reich der sieben Höfe', 'Silbernes Feuer: Roman', '23.99'),
(5, 'Crescent City 2', 'Wenn ein Stern erstrahlt: Roman', '14.99'),
(6, 'Drachenreiter', '3. Der Fluch der Aurelia', '12.99');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `transfer` varchar(50) NOT NULL,
  `creditcard` varchar(50) NOT NULL,
  `paypal` varchar(50) NOT NULL,
  `klarna` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sales`
--

CREATE TABLE `sales` (
  `fk_customers` int(11) NOT NULL,
  `fk_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customers`);

--
-- Indizes für die Tabelle `orders`
--
ALTER TABLE `orders`
  ADD UNIQUE KEY `id_customers` (`id_orders`);

--
-- Indizes für die Tabelle `sales`
--
ALTER TABLE `sales`
  ADD UNIQUE KEY `id_customers` (`fk_customers`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `sales`
--
ALTER TABLE `sales`
  MODIFY `fk_customers` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`fk_customers`) REFERENCES `customers` (`id_customers`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
