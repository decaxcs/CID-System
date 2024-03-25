-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2024 at 10:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cid_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_information`
--

CREATE TABLE `cs_cid_information` (
  `cid_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_client_full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_cid_information`
--

INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`) VALUES
(20, '032024-1', '1123'),
(21, '032024-2', '1123asdw'),
(22, '032024-3', '123'),
(23, '032024-4', ''),
(24, '032024-5', '123'),
(25, '032024-6', '123'),
(26, '032024-7', '123'),
(27, '032024-8', 'fhranz');

-- --------------------------------------------------------

--
-- Table structure for table `cs_users`
--

CREATE TABLE `cs_users` (
  `csu_id` int(11) NOT NULL,
  `csu_username` varchar(100) NOT NULL,
  `csu_password` varchar(100) NOT NULL,
  `csu_permission` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_users`
--

INSERT INTO `cs_users` (`csu_id`, `csu_username`, `csu_password`, `csu_permission`) VALUES
(2, 'Admin', '$2y$10$WoY9EQSGKGVg4cqJGe9X.O8qlNRvtnkXZ/Z25FlCuOi5iimqlZhum', 'Frontdesk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_cid_information`
--
ALTER TABLE `cs_cid_information`
  ADD PRIMARY KEY (`cid_id`);

--
-- Indexes for table `cs_users`
--
ALTER TABLE `cs_users`
  ADD PRIMARY KEY (`csu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cs_cid_information`
--
ALTER TABLE `cs_cid_information`
  MODIFY `cid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cs_users`
--
ALTER TABLE `cs_users`
  MODIFY `csu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
