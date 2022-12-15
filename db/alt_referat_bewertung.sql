-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 14, 2022 at 03:18 PM
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
-- Database: `test_2`
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

-- --------------------------------------------------------

--
-- Table structure for table `T_FRAGE`
--

CREATE TABLE `T_FRAGE` (
  `P_FRAGE_ID` int(11) NOT NULL,
  `F_FORMULAR_ID` int(11) NOT NULL,
  `F_GEWICHTUNG_ID` int(11) NOT NULL,
  `INHALT` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_GEWICHTUNG`
--

CREATE TABLE `T_GEWICHTUNG` (
  `P_GEWICHTUNG_ID` int(11) NOT NULL,
  `BEZEICHNUNG` varchar(64) DEFAULT NULL,
  `PROZENT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `P_FORMULAR_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `T_FRAGE`
--
ALTER TABLE `T_FRAGE`
  MODIFY `P_FRAGE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `T_GEWICHTUNG`
--
ALTER TABLE `T_GEWICHTUNG`
  MODIFY `P_GEWICHTUNG_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `T_REFERAT`
--
ALTER TABLE `T_REFERAT`
  MODIFY `P_REFERAT_ID` int(11) NOT NULL AUTO_INCREMENT;

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
