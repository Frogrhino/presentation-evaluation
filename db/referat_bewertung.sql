-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 15, 2022 at 01:46 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `referat_bewertung`
--

-- --------------------------------------------------------

--
-- Table structure for table `T_ANTWORT`
--

CREATE TABLE `T_ANTWORT` (
  `PF_FRAGE_ID` int(11) NOT NULL,
  `PF_USER_ID` int(11) NOT NULL,
  `PF_REFERAT_ID` int(11) NOT NULL,
  `WERT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_FORMULAR`
--

CREATE TABLE `T_FORMULAR` (
  `P_FORMULAR_ID` int(11) NOT NULL,
  `TITEL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_FORMULAR`
--

INSERT INTO `T_FORMULAR` (`P_FORMULAR_ID`, `TITEL`) VALUES
(1, 'Projekt Unternehmenspräsentation');

-- --------------------------------------------------------

--
-- Table structure for table `T_FRAGE`
--

CREATE TABLE `T_FRAGE` (
  `P_FRAGE_ID` int(11) NOT NULL,
  `F_FORMULAR_ID` int(11) NOT NULL,
  `F_GEWICHTUNG_ID` int(11) NOT NULL,
  `TITEL` varchar(64) NOT NULL,
  `BESCHREIBUNG` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_FRAGE`
--

INSERT INTO `T_FRAGE` (`P_FRAGE_ID`, `F_FORMULAR_ID`, `F_GEWICHTUNG_ID`, `TITEL`, `BESCHREIBUNG`) VALUES
(1, 1, 1, 'Sachliche Gliederung', '(Struktur erkennbar, roter Faden)'),
(2, 1, 1, 'Zeitliche Gliederung der Präsentation', '(Einhaltung der Präsentationszeit, Schwerpunktsetzung )'),
(3, 1, 1, 'Darstellung Fachinhalte', '(fachliche Richtigkeit)'),
(4, 1, 1, 'Fachsprache', '(Ver/- Anwendung des Fachvokabulars)'),
(5, 1, 2, 'Angepasste Vortragsweise', '(Freundlichkeit, Verständlichkeit, Körpersprache, Blickkontakt)'),
(6, 1, 2, 'Angepasste Ausdrucksweise', '(Lautstärke, Sprachtempo, Artikulation)'),
(7, 1, 2, 'Angepasste Darstellungsweise', '(Text gut lesbar, einheitliches Layout, übersichtliche Gestaltung, Verknüpfung verbaler Aussagen mit Text und Bild der Präsentation, ausgewogenes Verhältnis Text und Bild)'),
(8, 1, 2, 'Medieneinsatz', '(Einsatz und Umgang mit Medien)');

-- --------------------------------------------------------

--
-- Table structure for table `T_GEWICHTUNG`
--

CREATE TABLE `T_GEWICHTUNG` (
  `P_GEWICHTUNG_ID` int(11) NOT NULL,
  `BEZEICHNUNG` varchar(64) DEFAULT NULL,
  `PROZENT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_GEWICHTUNG`
--

INSERT INTO `T_GEWICHTUNG` (`P_GEWICHTUNG_ID`, `BEZEICHNUNG`, `PROZENT`) VALUES
(1, 'A', 60),
(2, 'B', 40);

-- --------------------------------------------------------

--
-- Table structure for table `T_REFERAT`
--

CREATE TABLE `T_REFERAT` (
  `P_REFERAT_ID` int(11) NOT NULL,
  `CODE` varchar(256) NOT NULL,
  `DATUM` date NOT NULL,
  `KLASSE` varchar(64) DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_REFERAT`
--

INSERT INTO `T_REFERAT` (`P_REFERAT_ID`, `CODE`, `DATUM`, `KLASSE`, `NAME`) VALUES
(1, '123456', '2022-12-15', '7J', 'Chicken Alfredo - Gut für Herz');

-- --------------------------------------------------------

--
-- Table structure for table `T_USER`
--

CREATE TABLE `T_USER` (
  `P_USER_ID` int(11) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `T_ANTWORT`
--
ALTER TABLE `T_ANTWORT`
  ADD PRIMARY KEY (`PF_FRAGE_ID`,`PF_USER_ID`,`PF_REFERAT_ID`),
  ADD KEY `t_antwort_ibfk_1` (`PF_REFERAT_ID`);

--
-- Indexes for table `T_FORMULAR`
--
ALTER TABLE `T_FORMULAR`
  ADD PRIMARY KEY (`P_FORMULAR_ID`);

--
-- Indexes for table `T_FRAGE`
--
ALTER TABLE `T_FRAGE`
  ADD PRIMARY KEY (`P_FRAGE_ID`),
  ADD KEY `t_frage_ibfk_1` (`F_FORMULAR_ID`),
  ADD KEY `t_frage_ibfk_2` (`F_GEWICHTUNG_ID`);

--
-- Indexes for table `T_GEWICHTUNG`
--
ALTER TABLE `T_GEWICHTUNG`
  ADD PRIMARY KEY (`P_GEWICHTUNG_ID`);

--
-- Indexes for table `T_REFERAT`
--
ALTER TABLE `T_REFERAT`
  ADD PRIMARY KEY (`P_REFERAT_ID`);

--
-- Indexes for table `T_USER`
--
ALTER TABLE `T_USER`
  ADD PRIMARY KEY (`P_USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `T_FORMULAR`
--
ALTER TABLE `T_FORMULAR`
  MODIFY `P_FORMULAR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `T_FRAGE`
--
ALTER TABLE `T_FRAGE`
  MODIFY `P_FRAGE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `T_GEWICHTUNG`
--
ALTER TABLE `T_GEWICHTUNG`
  MODIFY `P_GEWICHTUNG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_REFERAT`
--
ALTER TABLE `T_REFERAT`
  MODIFY `P_REFERAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `T_USER`
--
ALTER TABLE `T_USER`
  MODIFY `P_USER_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `T_ANTWORT`
--
ALTER TABLE `T_ANTWORT`
  ADD CONSTRAINT `t_antwort_ibfk_1` FOREIGN KEY (`PF_REFERAT_ID`) REFERENCES `T_REFERAT` (`P_REFERAT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_antwort_ibfk_2` FOREIGN KEY (`PF_FRAGE_ID`) REFERENCES `T_FRAGE` (`P_FRAGE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `T_FRAGE`
--
ALTER TABLE `T_FRAGE`
  ADD CONSTRAINT `t_frage_ibfk_1` FOREIGN KEY (`F_FORMULAR_ID`) REFERENCES `T_FORMULAR` (`P_FORMULAR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_frage_ibfk_2` FOREIGN KEY (`F_GEWICHTUNG_ID`) REFERENCES `T_GEWICHTUNG` (`P_GEWICHTUNG_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
