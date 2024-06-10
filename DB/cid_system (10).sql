-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2024 at 03:27 AM
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
-- Table structure for table `cid_claiming_slip`
--

CREATE TABLE `cid_claiming_slip` (
  `cid_cs_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_cs_number` varchar(100) NOT NULL,
  `cid_cs_color` varchar(255) NOT NULL,
  `cid_cs_accesories` text NOT NULL,
  `cid_cs_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cid_recommendations`
--

CREATE TABLE `cid_recommendations` (
  `cid_r_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_r_content` text NOT NULL,
  `cid_r_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_r_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cid_summary_of_payments`
--

CREATE TABLE `cid_summary_of_payments` (
  `cid_sop_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_sop_service` varchar(255) NOT NULL,
  `cid_sop_cost` float NOT NULL,
  `cid_sop_discounted_price` float NOT NULL,
  `cid_sop_payment_method` varchar(100) NOT NULL,
  `cid_sop_ref_no` varchar(255) NOT NULL,
  `cid_sop_discount` float NOT NULL,
  `cid_sop_paid` tinyint(4) NOT NULL DEFAULT 0,
  `cid_sop_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_sop_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cid_summary_of_payments_r`
--

CREATE TABLE `cid_summary_of_payments_r` (
  `cid_sop_r_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_sop_cr` varchar(100) NOT NULL,
  `cid_sop_or` varchar(100) NOT NULL,
  `cid_sop_r_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_sop_r_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cid_summary_of_repairs`
--

CREATE TABLE `cid_summary_of_repairs` (
  `cid_sor_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_sor_content` text NOT NULL,
  `cid_sor_start_date` datetime NOT NULL,
  `cid_sor_end_date` datetime NOT NULL,
  `cid_sor_warranty_start` date NOT NULL,
  `cid_sor_warranty_end` date NOT NULL,
  `cid_sor_service` varchar(255) NOT NULL,
  `cid_sor_we_value` int(11) NOT NULL,
  `cid_sor_we_duration` varchar(100) NOT NULL,
  `cid_sor_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_sor_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cid_summary_of_repairs`
--
DELIMITER $$
CREATE TRIGGER `insert_sor_trigger` AFTER INSERT ON `cid_summary_of_repairs` FOR EACH ROW BEGIN
    UPDATE cs_cid_information
    SET cid_status = 'On-going Warranty'
    WHERE cid_number = NEW.cid_number;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_information`
--

CREATE TABLE `cs_cid_information` (
  `cid_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_client_full_name` varchar(255) NOT NULL,
  `cid_signature` text NOT NULL,
  `cid_client_contact` varchar(100) NOT NULL,
  `cid_client_email` varchar(100) NOT NULL,
  `cid_platinum` tinyint(4) NOT NULL,
  `cid_platinum_number` int(11) NOT NULL,
  `cid_representative` int(100) NOT NULL,
  `cid_advertisement` varchar(100) NOT NULL,
  `cid_unit_details` text NOT NULL,
  `cid_remarks` text NOT NULL,
  `cid_unit_history` text NOT NULL,
  `cid_device_id` int(11) NOT NULL,
  `cid_status` varchar(100) NOT NULL,
  `cid_type` varchar(100) NOT NULL,
  `cid_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_services`
--

CREATE TABLE `cs_cid_services` (
  `cs_cid_service_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_service_id` int(11) NOT NULL,
  `cs_cid_service_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_cid_service_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_technicians`
--

CREATE TABLE `cs_cid_technicians` (
  `cs_cid_tech_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_technician_id` int(11) NOT NULL,
  `cs_cid_tech_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_cid_tech_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `cs_devices`
--

CREATE TABLE `cs_devices` (
  `cs_device_id` int(11) NOT NULL,
  `cs_device_name` varchar(100) NOT NULL,
  `cs_device_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_device_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_devices`
--

INSERT INTO `cs_devices` (`cs_device_id`, `cs_device_name`, `cs_device_created`, `cs_device_updated`) VALUES
(1, 'Laptop', '2024-05-10 01:52:33', '2024-05-10 01:52:33'),
(2, 'Cellphone', '2024-05-10 01:52:33', '2024-05-10 01:52:33');

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
(1, 'Advanced Diagnostic', '2024-04-03 05:14:25', '2024-05-10 01:44:10'),
(2, 'Board Repair', '2024-04-03 05:14:34', '2024-05-10 01:44:32'),
(3, 'Troubleshooting', '2024-04-03 07:37:40', '2024-05-10 01:45:20'),
(4, 'Detailed Cleaning', '2024-04-03 07:37:40', '2024-05-10 01:45:41'),
(5, 'Data Recovery', '2024-04-03 07:38:03', '2024-05-10 01:45:54'),
(6, 'Reformat', '2024-04-03 07:38:03', '2024-05-10 01:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `cs_settings`
--

CREATE TABLE `cs_settings` (
  `cs_settings_id` int(11) NOT NULL,
  `cs_settings_name` varchar(255) NOT NULL,
  `cs_settings_value` float NOT NULL,
  `cs_settings_unit` varchar(255) NOT NULL,
  `cs_settings_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_settings_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_settings`
--

INSERT INTO `cs_settings` (`cs_settings_id`, `cs_settings_name`, `cs_settings_value`, `cs_settings_unit`, `cs_settings_added`, `cs_settings_updated`) VALUES
(1, 'technician_notification', 1, 'week', '2024-05-07 01:59:43', '2024-05-07 01:59:43');

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
(21, 'Payments must be made exclusively through authorized payment channels. Official receipt turnover upon completion\nof service.', 1, 21, '2024-04-05 02:48:40', '2024-04-15 03:16:04'),
(22, 'We exclusively accommodate individuals who have signed agreements for updates and concerns.', 1, 22, '2024-04-15 03:17:04', '2024-04-15 03:17:04');

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
(6, 2, 'checkbox', 'Advanced diagnostic Check-up-procedures are required to address the issues that necessitate deep troubleshooting.\r\n');

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
(1, 'Admin', '$2y$10$SGs9fXb.BYJaluZkmI2M3Oy6jx0OjqAWS7qzRNAMBcVZiaM6u4/bK', 'Admin', 'Frontdesk', '2024-05-10 04:58:51', '2024-05-10 04:59:53'),
(2, 'Tech', '$2y$10$i0QIGwUKO0kn/25S3N/kC.5AIQwQu6fWGfYrxPQWbvYA7C6pCK1XW', 'Armein', 'Technician', '2024-05-10 04:58:57', '2024-05-10 04:59:28');

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
-- Indexes for table `cid_claiming_slip`
--
ALTER TABLE `cid_claiming_slip`
  ADD PRIMARY KEY (`cid_cs_id`),
  ADD KEY `cid_number` (`cid_number`);

--
-- Indexes for table `cid_recommendations`
--
ALTER TABLE `cid_recommendations`
  ADD PRIMARY KEY (`cid_r_id`),
  ADD UNIQUE KEY `cid_number` (`cid_number`);

--
-- Indexes for table `cid_summary_of_payments`
--
ALTER TABLE `cid_summary_of_payments`
  ADD PRIMARY KEY (`cid_sop_id`);

--
-- Indexes for table `cid_summary_of_payments_r`
--
ALTER TABLE `cid_summary_of_payments_r`
  ADD PRIMARY KEY (`cid_sop_r_id`),
  ADD UNIQUE KEY `cid_number` (`cid_number`);

--
-- Indexes for table `cid_summary_of_repairs`
--
ALTER TABLE `cid_summary_of_repairs`
  ADD PRIMARY KEY (`cid_sor_id`),
  ADD UNIQUE KEY `cid_number` (`cid_number`);

--
-- Indexes for table `cs_cid_information`
--
ALTER TABLE `cs_cid_information`
  ADD PRIMARY KEY (`cid_id`),
  ADD UNIQUE KEY `uc_cid_number` (`cid_number`),
  ADD KEY `cid_representative` (`cid_representative`),
  ADD KEY `cid_device_id` (`cid_device_id`);

--
-- Indexes for table `cs_cid_services`
--
ALTER TABLE `cs_cid_services`
  ADD PRIMARY KEY (`cs_cid_service_id`),
  ADD KEY `cid_service_id` (`cid_service_id`);

--
-- Indexes for table `cs_cid_technicians`
--
ALTER TABLE `cs_cid_technicians`
  ADD PRIMARY KEY (`cs_cid_tech_id`),
  ADD KEY `cid_number` (`cid_number`),
  ADD KEY `cid_technician_id` (`cid_technician_id`);

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
-- Indexes for table `cs_devices`
--
ALTER TABLE `cs_devices`
  ADD PRIMARY KEY (`cs_device_id`);

--
-- Indexes for table `cs_services`
--
ALTER TABLE `cs_services`
  ADD PRIMARY KEY (`cs_service_id`);

--
-- Indexes for table `cs_settings`
--
ALTER TABLE `cs_settings`
  ADD PRIMARY KEY (`cs_settings_id`);

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
-- AUTO_INCREMENT for table `cid_claiming_slip`
--
ALTER TABLE `cid_claiming_slip`
  MODIFY `cid_cs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cid_recommendations`
--
ALTER TABLE `cid_recommendations`
  MODIFY `cid_r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cid_summary_of_payments`
--
ALTER TABLE `cid_summary_of_payments`
  MODIFY `cid_sop_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cid_summary_of_payments_r`
--
ALTER TABLE `cid_summary_of_payments_r`
  MODIFY `cid_sop_r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cid_summary_of_repairs`
--
ALTER TABLE `cid_summary_of_repairs`
  MODIFY `cid_sor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_cid_information`
--
ALTER TABLE `cs_cid_information`
  MODIFY `cid_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_cid_services`
--
ALTER TABLE `cs_cid_services`
  MODIFY `cs_cid_service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_cid_technicians`
--
ALTER TABLE `cs_cid_technicians`
  MODIFY `cs_cid_tech_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_cid_terms_of_service`
--
ALTER TABLE `cs_cid_terms_of_service`
  MODIFY `cid_tos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_cid_terms_of_service_a`
--
ALTER TABLE `cs_cid_terms_of_service_a`
  MODIFY `cid_tos_a_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_devices`
--
ALTER TABLE `cs_devices`
  MODIFY `cs_device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cs_services`
--
ALTER TABLE `cs_services`
  MODIFY `cs_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cs_settings`
--
ALTER TABLE `cs_settings`
  MODIFY `cs_settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cs_terms_of_service`
--
ALTER TABLE `cs_terms_of_service`
  MODIFY `tos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cs_tos_additional`
--
ALTER TABLE `cs_tos_additional`
  MODIFY `tos_a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cs_users`
--
ALTER TABLE `cs_users`
  MODIFY `csu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cid_claiming_slip`
--
ALTER TABLE `cid_claiming_slip`
  ADD CONSTRAINT `cid_claiming_slip_ibfk_1` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`);

--
-- Constraints for table `cid_recommendations`
--
ALTER TABLE `cid_recommendations`
  ADD CONSTRAINT `cid_recommendations_ibfk_1` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`);

--
-- Constraints for table `cid_summary_of_payments_r`
--
ALTER TABLE `cid_summary_of_payments_r`
  ADD CONSTRAINT `cid_summary_of_payments_r_ibfk_1` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`);

--
-- Constraints for table `cid_summary_of_repairs`
--
ALTER TABLE `cid_summary_of_repairs`
  ADD CONSTRAINT `cid_summary_of_repairs_ibfk_1` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`);

--
-- Constraints for table `cs_cid_information`
--
ALTER TABLE `cs_cid_information`
  ADD CONSTRAINT `cs_cid_information_ibfk_3` FOREIGN KEY (`cid_representative`) REFERENCES `cs_users` (`csu_id`),
  ADD CONSTRAINT `cs_cid_information_ibfk_4` FOREIGN KEY (`cid_device_id`) REFERENCES `cs_devices` (`cs_device_id`);

--
-- Constraints for table `cs_cid_services`
--
ALTER TABLE `cs_cid_services`
  ADD CONSTRAINT `cs_cid_services_ibfk_1` FOREIGN KEY (`cid_service_id`) REFERENCES `cs_services` (`cs_service_id`);

--
-- Constraints for table `cs_cid_technicians`
--
ALTER TABLE `cs_cid_technicians`
  ADD CONSTRAINT `cs_cid_technicians_ibfk_1` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`),
  ADD CONSTRAINT `cs_cid_technicians_ibfk_2` FOREIGN KEY (`cid_technician_id`) REFERENCES `cs_users` (`csu_id`);

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

DELIMITER $$
--
-- Events
--
$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
