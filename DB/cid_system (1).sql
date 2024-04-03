-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2024 at 10:04 AM
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
  `cid_client_full_name` varchar(255) NOT NULL,
  `cid_client_contact` varchar(100) NOT NULL,
  `cid_platinum` tinyint(4) NOT NULL,
  `cid_platinum_number` int(11) NOT NULL,
  `cid_representative` int(100) NOT NULL,
  `cid_advertisement` varchar(100) NOT NULL,
  `cid_claiming_slip` varchar(255) NOT NULL,
  `cid_unit_details` text NOT NULL,
  `cid_remarks` text NOT NULL,
  `cid_technician_id` int(11) NOT NULL,
  `cid_service_id` int(11) NOT NULL,
  `cid_status` varchar(100) NOT NULL,
  `cid_type` varchar(100) NOT NULL,
  `cid_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_cid_information`
--

INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`, `cid_client_contact`, `cid_platinum`, `cid_platinum_number`, `cid_representative`, `cid_advertisement`, `cid_claiming_slip`, `cid_unit_details`, `cid_remarks`, `cid_technician_id`, `cid_service_id`, `cid_status`, `cid_type`, `cid_created`, `cid_updated`) VALUES
(155, '042024-1', 'Fhranz Joseph A. Benosa', '09089856740', 1, 69, 2, 'Word of Mouth', '', 'Laptop Acer Nitro An-515', 'Stickers, With Charger', 2, 1, 'On-going', '', '2024-04-03 05:53:51', '2024-04-03 05:53:51'),
(156, '042024-2', 'Jolouos Gabon', '0987456321', 1, 420, 3, 'Advertisement', '', 'System Unit', 'Black', 3, 1, 'On-going', '', '2024-04-03 06:03:46', '2024-04-03 06:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_terms_of_service`
--

CREATE TABLE `cs_cid_terms_of_service` (
  `cid_tos_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_tos_terms` varchar(100) NOT NULL,
  `cid_tos_agreement` tinyint(4) NOT NULL,
  `cid_tos_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_cid_terms_of_service`
--

INSERT INTO `cs_cid_terms_of_service` (`cid_tos_id`, `cid_number`, `cid_tos_terms`, `cid_tos_agreement`, `cid_tos_created`) VALUES
(2268, '042024-1', 'tos_legal_age', 1, '2024-04-03 05:53:51'),
(2269, '042024-1', 'tos_free_initial', 1, '2024-04-03 05:53:51'),
(2270, '042024-1', 'tos_advanced_diagnostic', 0, '2024-04-03 05:53:51'),
(2271, '042024-1', 'tos_rush_fee', 0, '2024-04-03 05:53:51'),
(2272, '042024-1', 'tos_mandatory', 1, '2024-04-03 05:53:51'),
(2273, '042024-1', 'tos_ensure_your_data', 1, '2024-04-03 05:53:51'),
(2274, '042024-1', 'tos_physical_verification', 1, '2024-04-03 05:53:51'),
(2275, '042024-1', 'tos_license_windows', 1, '2024-04-03 05:53:51'),
(2276, '042024-1', 'tos_remote_repair', 1, '2024-04-03 05:53:51'),
(2277, '042024-1', 'tos_board_repair_units', 1, '2024-04-03 05:53:51'),
(2278, '042024-1', 'tos_technical_parts', 1, '2024-04-03 05:53:51'),
(2279, '042024-1', 'tos_data_recovery', 1, '2024-04-03 05:53:51'),
(2280, '042024-1', 'tos_advertising', 1, '2024-04-03 05:53:51'),
(2281, '042024-1', 'tos_third_party', 1, '2024-04-03 05:53:51'),
(2282, '042024-1', 'tos-rto', 1, '2024-04-03 05:53:51'),
(2283, '042024-1', 'tos_brand_awareness', 1, '2024-04-03 05:53:51'),
(2284, '042024-1', 'tos_unforseen_issues', 1, '2024-04-03 05:53:51'),
(2285, '042024-1', 'tos_act_of_god', 1, '2024-04-03 05:53:51'),
(2286, '042024-1', 'tos_confidential_accounts', 1, '2024-04-03 05:53:51'),
(2287, '042024-1', 'tos_claiming_slip', 1, '2024-04-03 05:53:51'),
(2288, '042024-1', 'tos_clients_rights', 1, '2024-04-03 05:53:51'),
(2289, '042024-1', 'tos_warranty_claim', 1, '2024-04-03 05:53:51'),
(2290, '042024-1', 'tos_completion', 1, '2024-04-03 05:53:51'),
(2291, '042024-1', 'tos_advertising_answer', 1, '2024-04-03 05:53:51'),
(2292, '042024-2', 'tos_legal_age', 1, '2024-04-03 06:03:46'),
(2293, '042024-2', 'tos_free_initial', 1, '2024-04-03 06:03:46'),
(2294, '042024-2', 'tos_advanced_diagnostic', 1, '2024-04-03 06:03:46'),
(2295, '042024-2', 'tos_rush_fee', 0, '2024-04-03 06:03:46'),
(2296, '042024-2', 'tos_mandatory', 1, '2024-04-03 06:03:46'),
(2297, '042024-2', 'tos_ensure_your_data', 1, '2024-04-03 06:03:46'),
(2298, '042024-2', 'tos_physical_verification', 1, '2024-04-03 06:03:46'),
(2299, '042024-2', 'tos_license_windows', 1, '2024-04-03 06:03:46'),
(2300, '042024-2', 'tos_remote_repair', 1, '2024-04-03 06:03:46'),
(2301, '042024-2', 'tos_board_repair_units', 1, '2024-04-03 06:03:46'),
(2302, '042024-2', 'tos_technical_parts', 1, '2024-04-03 06:03:46'),
(2303, '042024-2', 'tos_data_recovery', 1, '2024-04-03 06:03:46'),
(2304, '042024-2', 'tos_advertising', 1, '2024-04-03 06:03:46'),
(2305, '042024-2', 'tos_third_party', 1, '2024-04-03 06:03:46'),
(2306, '042024-2', 'tos-rto', 1, '2024-04-03 06:03:46'),
(2307, '042024-2', 'tos_brand_awareness', 1, '2024-04-03 06:03:46'),
(2308, '042024-2', 'tos_unforseen_issues', 1, '2024-04-03 06:03:46'),
(2309, '042024-2', 'tos_act_of_god', 1, '2024-04-03 06:03:46'),
(2310, '042024-2', 'tos_confidential_accounts', 1, '2024-04-03 06:03:46'),
(2311, '042024-2', 'tos_claiming_slip', 1, '2024-04-03 06:03:46'),
(2312, '042024-2', 'tos_clients_rights', 1, '2024-04-03 06:03:46'),
(2313, '042024-2', 'tos_warranty_claim', 1, '2024-04-03 06:03:46'),
(2314, '042024-2', 'tos_completion', 1, '2024-04-03 06:03:46'),
(2315, '042024-2', 'tos_advertising_answer', 0, '2024-04-03 06:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `cs_services`
--

CREATE TABLE `cs_services` (
  `cs_service_id` int(11) NOT NULL,
  `cs_service_name` varchar(100) NOT NULL,
  `cs_service_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_service_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_services`
--

INSERT INTO `cs_services` (`cs_service_id`, `cs_service_name`, `cs_service_created`, `cs_service_updated`) VALUES
(1, 'Computer', '2024-04-03 05:14:25', '2024-04-03 05:14:25'),
(2, 'Printer', '2024-04-03 05:14:34', '2024-04-03 05:14:34'),
(3, 'Laptop', '2024-04-03 07:37:40', '2024-04-03 07:37:40'),
(4, 'Aircon', '2024-04-03 07:37:40', '2024-04-03 07:37:40'),
(5, 'Tablet', '2024-04-03 07:38:03', '2024-04-03 07:38:03'),
(6, 'Cellphone', '2024-04-03 07:38:03', '2024-04-03 07:38:03');

-- --------------------------------------------------------

--
-- Table structure for table `cs_users`
--

CREATE TABLE `cs_users` (
  `csu_id` int(11) NOT NULL,
  `csu_username` varchar(100) NOT NULL,
  `csu_password` varchar(100) NOT NULL,
  `csu_name` varchar(255) NOT NULL,
  `csu_permission` varchar(100) NOT NULL,
  `csu_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `csu_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_users`
--

INSERT INTO `cs_users` (`csu_id`, `csu_username`, `csu_password`, `csu_name`, `csu_permission`, `csu_created`, `csu_updated`) VALUES
(2, 'Admin', '$2y$10$WoY9EQSGKGVg4cqJGe9X.O8qlNRvtnkXZ/Z25FlCuOi5iimqlZhum', 'Armein', 'Frontdesk', '2024-04-01 07:06:31', '2024-04-01 07:08:38'),
(3, 'Asdwasd', 'asdwasd', 'Gerard', 'Technician', '2024-04-01 07:55:47', '2024-04-01 07:55:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_cid_information`
--
ALTER TABLE `cs_cid_information`
  ADD PRIMARY KEY (`cid_id`),
  ADD UNIQUE KEY `uc_cid_number` (`cid_number`),
  ADD KEY `cid_technician_id` (`cid_technician_id`),
  ADD KEY `cid_service_id` (`cid_service_id`),
  ADD KEY `cid_representative` (`cid_representative`);

--
-- Indexes for table `cs_cid_terms_of_service`
--
ALTER TABLE `cs_cid_terms_of_service`
  ADD PRIMARY KEY (`cid_tos_id`),
  ADD KEY `cid_number` (`cid_number`);

--
-- Indexes for table `cs_services`
--
ALTER TABLE `cs_services`
  ADD PRIMARY KEY (`cs_service_id`);

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
  MODIFY `cid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `cs_cid_terms_of_service`
--
ALTER TABLE `cs_cid_terms_of_service`
  MODIFY `cid_tos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2316;

--
-- AUTO_INCREMENT for table `cs_services`
--
ALTER TABLE `cs_services`
  MODIFY `cs_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cs_users`
--
ALTER TABLE `cs_users`
  MODIFY `csu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cs_cid_information`
--
ALTER TABLE `cs_cid_information`
  ADD CONSTRAINT `cs_cid_information_ibfk_1` FOREIGN KEY (`cid_technician_id`) REFERENCES `cs_users` (`csu_id`),
  ADD CONSTRAINT `cs_cid_information_ibfk_2` FOREIGN KEY (`cid_service_id`) REFERENCES `cs_services` (`cs_service_id`),
  ADD CONSTRAINT `cs_cid_information_ibfk_3` FOREIGN KEY (`cid_representative`) REFERENCES `cs_users` (`csu_id`);

--
-- Constraints for table `cs_cid_terms_of_service`
--
ALTER TABLE `cs_cid_terms_of_service`
  ADD CONSTRAINT `cs_cid_terms_of_service_ibfk_1` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
