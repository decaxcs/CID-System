-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 04:06 AM
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
(156, '042024-2', 'Jolouos Gabon', '0987456321', 1, 420, 3, 'Advertisement', '', 'System Unit', 'Black', 3, 1, 'On-going', '', '2024-04-03 06:03:46', '2024-04-03 06:03:46'),
(157, '042024-3', 'Fhranz Joseph A. Benosa', '213456', 1, 123, 2, 'Advertisement', '', 'Lappy', 'Black', 2, 1, 'On-going', '', '2024-04-03 09:37:32', '2024-04-03 09:37:32'),
(158, '042024-4', 'adfgh', '43253', 1, 1425, 2, 'Advertisement', '', 'reghhfg', 'hgfh', 3, 1, 'On-going', '', '2024-04-03 09:40:44', '2024-04-03 09:40:44'),
(159, '042024-5', 'Fhranz Joseph A. Be24nosa', '42564332', 1, 23423454, 2, 'Advertisement', '', '23445', '425y', 2, 1, 'On-going', '', '2024-04-03 09:41:51', '2024-04-03 09:41:51'),
(161, '042024-6', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 05:35:55', '2024-04-05 05:35:55'),
(162, '042024-7', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 05:51:03', '2024-04-05 05:51:03'),
(163, '042024-8', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 05:58:37', '2024-04-05 05:58:37'),
(165, '042024-9', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:00:33', '2024-04-05 06:00:33'),
(167, '042024-10', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:01:31', '2024-04-05 06:01:31'),
(168, '042024-11', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:02:45', '2024-04-05 06:02:45'),
(169, '042024-12', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:03:19', '2024-04-05 06:03:19'),
(170, '042024-13', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:06:50', '2024-04-05 06:06:50'),
(171, '042024-14', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:07:52', '2024-04-05 06:07:52'),
(172, '042024-15', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:09:00', '2024-04-05 06:09:00'),
(173, '042024-16', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:09:38', '2024-04-05 06:09:38'),
(174, '042024-17', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:10:22', '2024-04-05 06:10:22'),
(175, '042024-18', '', '', 1, 0, 2, 'Advertisement', '', '', '', 2, 1, 'On-going', '', '2024-04-05 06:14:55', '2024-04-05 06:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_terms_of_service`
--

CREATE TABLE `cs_cid_terms_of_service` (
  `cid_tos_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_tos_terms` int(11) NOT NULL,
  `cid_tos_agreement` tinyint(4) NOT NULL,
  `cid_tos_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_cid_terms_of_service`
--

INSERT INTO `cs_cid_terms_of_service` (`cid_tos_id`, `cid_number`, `cid_tos_terms`, `cid_tos_agreement`, `cid_tos_created`) VALUES
(2619, '042024-17', 1, 0, '2024-04-05 06:10:22'),
(2620, '042024-17', 2, 0, '2024-04-05 06:10:22'),
(2621, '042024-17', 3, 0, '2024-04-05 06:10:22'),
(2622, '042024-17', 4, 0, '2024-04-05 06:10:22'),
(2623, '042024-17', 5, 0, '2024-04-05 06:10:22'),
(2624, '042024-17', 6, 0, '2024-04-05 06:10:22'),
(2625, '042024-17', 7, 0, '2024-04-05 06:10:22'),
(2626, '042024-17', 8, 0, '2024-04-05 06:10:22'),
(2627, '042024-17', 9, 0, '2024-04-05 06:10:22'),
(2628, '042024-17', 10, 0, '2024-04-05 06:10:22'),
(2629, '042024-17', 11, 0, '2024-04-05 06:10:22'),
(2630, '042024-17', 12, 0, '2024-04-05 06:10:22'),
(2631, '042024-17', 13, 0, '2024-04-05 06:10:22'),
(2632, '042024-17', 14, 0, '2024-04-05 06:10:22'),
(2633, '042024-17', 15, 0, '2024-04-05 06:10:22'),
(2634, '042024-17', 16, 0, '2024-04-05 06:10:22'),
(2635, '042024-17', 17, 0, '2024-04-05 06:10:22'),
(2636, '042024-17', 18, 0, '2024-04-05 06:10:22'),
(2637, '042024-17', 19, 0, '2024-04-05 06:10:22'),
(2638, '042024-17', 20, 0, '2024-04-05 06:10:22'),
(2639, '042024-17', 21, 0, '2024-04-05 06:10:22'),
(2640, '042024-18', 1, 0, '2024-04-05 06:14:55'),
(2641, '042024-18', 2, 0, '2024-04-05 06:14:55'),
(2642, '042024-18', 3, 0, '2024-04-05 06:14:55'),
(2643, '042024-18', 4, 0, '2024-04-05 06:14:55'),
(2644, '042024-18', 5, 0, '2024-04-05 06:14:55'),
(2645, '042024-18', 6, 0, '2024-04-05 06:14:55'),
(2646, '042024-18', 7, 0, '2024-04-05 06:14:55'),
(2647, '042024-18', 8, 0, '2024-04-05 06:14:55'),
(2648, '042024-18', 9, 0, '2024-04-05 06:14:55'),
(2649, '042024-18', 10, 0, '2024-04-05 06:14:55'),
(2650, '042024-18', 11, 0, '2024-04-05 06:14:55'),
(2651, '042024-18', 12, 0, '2024-04-05 06:14:55'),
(2652, '042024-18', 13, 0, '2024-04-05 06:14:55'),
(2653, '042024-18', 14, 0, '2024-04-05 06:14:55'),
(2654, '042024-18', 15, 0, '2024-04-05 06:14:55'),
(2655, '042024-18', 16, 0, '2024-04-05 06:14:55'),
(2656, '042024-18', 17, 0, '2024-04-05 06:14:55'),
(2657, '042024-18', 18, 0, '2024-04-05 06:14:55'),
(2658, '042024-18', 19, 0, '2024-04-05 06:14:55'),
(2659, '042024-18', 20, 0, '2024-04-05 06:14:55'),
(2660, '042024-18', 21, 0, '2024-04-05 06:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_terms_of_service_a`
--

CREATE TABLE `cs_cid_terms_of_service_a` (
  `cid_tos_a_id` int(11) NOT NULL,
  `tos_id` int(11) NOT NULL,
  `cid_number` varchar(25) NOT NULL,
  `cid_tos_agreement` int(11) NOT NULL,
  `cid_tos_a_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_tos_a_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_cid_terms_of_service_a`
--

INSERT INTO `cs_cid_terms_of_service_a` (`cid_tos_a_id`, `tos_id`, `cid_number`, `cid_tos_agreement`, `cid_tos_a_created`, `cid_tos_a_updated`) VALUES
(33, 5, '042024-17', 0, '2024-04-05 06:10:22', '2024-04-05 06:10:22'),
(34, 6, '042024-17', 0, '2024-04-05 06:10:22', '2024-04-05 06:10:22'),
(35, 4, '042024-17', 1, '2024-04-05 06:10:22', '2024-04-05 06:10:22'),
(37, 5, '042024-18', 0, '2024-04-05 06:14:55', '2024-04-05 06:14:55'),
(38, 6, '042024-18', 0, '2024-04-05 06:14:55', '2024-04-05 06:14:55'),
(39, 4, '042024-18', 1, '2024-04-05 06:14:55', '2024-04-05 06:14:55'),
(40, 7, '042024-18', 0, '2024-04-05 06:14:55', '2024-04-05 06:14:55');

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
-- Table structure for table `cs_terms_of_service`
--

CREATE TABLE `cs_terms_of_service` (
  `tos_id` int(11) NOT NULL,
  `tos_content` text NOT NULL,
  `tos_required` smallint(6) NOT NULL,
  `tos_sequence` int(11) NOT NULL,
  `tos_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `tos_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_terms_of_service`
--

INSERT INTO `cs_terms_of_service` (`tos_id`, `tos_content`, `tos_required`, `tos_sequence`, `tos_created`, `tos_updated`) VALUES
(1, 'FREE INITIAL CHECK-UP limited to Physical and Basic Troubleshooting.\r\n', 1, 2, '2024-04-05 02:19:06', '2024-04-05 03:00:49'),
(2, 'You must be of legal age. If not, additional consent from a legal guardian is required.', 1, 1, '2024-04-05 02:40:12', '2024-04-05 04:06:13'),
(3, 'The client is MANDATORY to avail deep cleaning service for units with significant debris and dirt accumulation so that skilled technicians can proceed with diagnosing the issue.', 1, 3, '2024-04-05 02:40:29', '2024-04-05 04:06:16'),
(4, 'Ensure your data is backed up before we access your system. We\'re not liable for data loss. If you haven\'t backed up, contact us to arrange it. Be aware that hard drive failure or malware can cause data loss during our check-up. We might need to reinstall your operating system; let us know if you want data backed up, but this incurs extra charges.', 1, 4, '2024-04-05 02:42:23', '2024-04-05 02:42:23'),
(5, 'Physical verification happens at TECHYDAVID I.T SOLUTIONS\' Physical Store.', 1, 5, '2024-04-05 02:43:14', '2024-04-05 02:43:29'),
(6, 'Your system must have a License Windows or Apple OS X OS; we\'ll install a retail version if needed, with additional costs and time. We can\'t work on unlicensed Operating System.', 1, 6, '2024-04-05 02:44:00', '2024-04-05 02:44:00'),
(7, 'REMOTE REPAIR: We\'ll do our best to solve requested issues remotely. If needed, we\'ll discuss options for repair. Conditions: Services within Standard Business Hours: 9:00 AM - 8:00 PM, MON - SAT, except Holidays', 1, 7, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(8, 'Board Repair Units: Lead time mostly 3-5 months and above depending on the issue, client is informed first to proceed , if client change of mind incurs charges a specific amount.', 1, 8, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(9, 'Technical Parts: If it becomes necessary to order parts to proceed with the repair, please be aware that we do not have control over the shipment lead time of parts from the manufacturer.', 1, 9, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(10, 'Data Recovery: As part of the data recovery process, it is essential to inform you that we are unable to selectively choose which chance to be recovered. In the event of unsuccessful data recovery, a fee of P1,500.00 will be charged as an Advance Diagnostic Service Fee.', 1, 10, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(11, 'Advertising: We may use before and after pictures of your unit for promotion. We can add our company sticker for tracking and advertising.', 1, 11, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(12, 'Third-Party Pickups: We\'re not responsible for items picked up via Lalamove/Grab & other Courier that may affect the unit. We guarantee test and make sure complete units before release. Down payment of 80% is required.', 1, 12, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(13, 'RTO Units Notice: Client(s) are informed about RTO (Return to the owner) units. Units are released unless client specifies a reason for delay. Kindly Relay to Pick-up Responsibility.', 1, 13, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(14, 'BRAND AWARENESS: Client must uphold the TECHYDAVID I.T SOLUTIONS brand and refrain from disseminating negative Information or comments that undermine or are detrimental to TECHYDAVID I.T SOLUTIONS, the brand, and its products and employees, through any means (including but not limited to verbal, written, screenshots ,online, or media channels). Negotiation must be done between TECHYDAVID I.T SOLUTIONS and Client only.', 1, 14, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(15, 'Unforeseen Issues During Repair: During repair, unexpected problems may arise. We\'re not responsible for resulting to any damages.', 1, 15, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(16, 'Act of God Circumstances: TECHYDAVID IT SOLUTIONS shall not be liable for the damage on Items in case of fire ,earthquake,-flood and other similar natural calamities.', 1, 16, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(17, 'Confidential Accounts: It is the client\'s responsibility to ensure the secure management of sensitive and confidential accounts by logging out of them appropriately.', 1, 17, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(18, 'Claiming Slip Requirement: claiming slip is mandatory, In the event of a missing claiming slip, please present a valid government ID for verification.', 1, 18, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(19, 'Client Rights: Clients can request a copy of these terms and unit diagnosis details upon request.', 1, 19, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(20, 'When Initiating a warranty claim, please be aware that we have implemented a mandatory inspection procedure. This step ensures that our technical experts can thoroughly assess the issue before proceeding with the claim. This approach enables us to address your concern promptly and accurately. NO OFFICIAL RECEIPT NO WARRANTY.', 1, 20, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(21, 'Official receipt turnover upon completion of service.', 1, 21, '2024-04-05 02:48:40', '2024-04-05 04:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `cs_tos_additional`
--

CREATE TABLE `cs_tos_additional` (
  `tos_a_id` int(11) NOT NULL,
  `tos_id` int(11) NOT NULL,
  `tos_a_type` varchar(100) NOT NULL,
  `tos_a_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_tos_additional`
--

INSERT INTO `cs_tos_additional` (`tos_a_id`, `tos_id`, `tos_a_type`, `tos_a_content`) VALUES
(4, 11, 'radiobutton', ''),
(5, 2, 'checkbox', 'RUSH FEE - A rush fee is applicable for urgent repair units. Kindly coordinate with the responsible technician to facilitate the process.\r\n'),
(6, 2, 'checkbox', 'Advanced diagnostic Check-up-procedures are required to address the issues that necessitate deep troubleshooting.\r\n'),
(7, 4, 'radiobutton', '');

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

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_int` int(11) DEFAULT NULL,
  `test_text` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`test_int`, `test_text`) VALUES
(1, 0),
(0, 1),
(1, NULL),
(NULL, 1);

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
  ADD KEY `cid_number` (`cid_number`),
  ADD KEY `cid_tos_terms` (`cid_tos_terms`);

--
-- Indexes for table `cs_cid_terms_of_service_a`
--
ALTER TABLE `cs_cid_terms_of_service_a`
  ADD PRIMARY KEY (`cid_tos_a_id`),
  ADD KEY `cid_number` (`cid_number`),
  ADD KEY `cs_cid_terms_of_service_a_ibfk_1` (`tos_id`);

--
-- Indexes for table `cs_services`
--
ALTER TABLE `cs_services`
  ADD PRIMARY KEY (`cs_service_id`);

--
-- Indexes for table `cs_terms_of_service`
--
ALTER TABLE `cs_terms_of_service`
  ADD PRIMARY KEY (`tos_id`);

--
-- Indexes for table `cs_tos_additional`
--
ALTER TABLE `cs_tos_additional`
  ADD PRIMARY KEY (`tos_a_id`),
  ADD KEY `tos_id` (`tos_id`);

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
  MODIFY `cid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `cs_cid_terms_of_service`
--
ALTER TABLE `cs_cid_terms_of_service`
  MODIFY `cid_tos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2661;

--
-- AUTO_INCREMENT for table `cs_cid_terms_of_service_a`
--
ALTER TABLE `cs_cid_terms_of_service_a`
  MODIFY `cid_tos_a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `cs_services`
--
ALTER TABLE `cs_services`
  MODIFY `cs_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cs_terms_of_service`
--
ALTER TABLE `cs_terms_of_service`
  MODIFY `tos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cs_tos_additional`
--
ALTER TABLE `cs_tos_additional`
  MODIFY `tos_a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `cs_cid_terms_of_service_ibfk_1` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`),
  ADD CONSTRAINT `cs_cid_terms_of_service_ibfk_2` FOREIGN KEY (`cid_tos_terms`) REFERENCES `cs_terms_of_service` (`tos_id`);

--
-- Constraints for table `cs_cid_terms_of_service_a`
--
ALTER TABLE `cs_cid_terms_of_service_a`
  ADD CONSTRAINT `cs_cid_terms_of_service_a_ibfk_1` FOREIGN KEY (`tos_id`) REFERENCES `cs_tos_additional` (`tos_a_id`),
  ADD CONSTRAINT `cs_cid_terms_of_service_a_ibfk_2` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`);

--
-- Constraints for table `cs_tos_additional`
--
ALTER TABLE `cs_tos_additional`
  ADD CONSTRAINT `cs_tos_additional_ibfk_1` FOREIGN KEY (`tos_id`) REFERENCES `cs_terms_of_service` (`tos_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
