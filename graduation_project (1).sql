-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2024 at 05:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `graduation_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `paysimdatabase`
--

CREATE TABLE `paysimdatabase` (
  `ID` int(255) NOT NULL,
  `userId` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phonenumber` int(10) NOT NULL,
  `Amount` double NOT NULL,
  `newbalance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paysimdatabase`
--

INSERT INTO `paysimdatabase` (`ID`, `userId`, `username`, `password`, `phonenumber`, `Amount`, `newbalance`) VALUES
(1, 732002, 'rogina', '123456', 213465987, 100, 200),
(2, 8112019, 'roro', '123456', 789456123, 10, 1700),
(3, 54455, 'sameera', '123456', 123456789, 0, 400),
(4, 0, 'rogina1', '123456', 978654322, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `paysimdatabase`
--
ALTER TABLE `paysimdatabase`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `paysimdatabase`
--
ALTER TABLE `paysimdatabase`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
