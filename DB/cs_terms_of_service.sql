-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2024 at 06:00 AM
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
(2, 'You must be of legal age. If not, additional consent from a legal guardian is required.', 1, 1, '2024-04-05 02:40:12', '2024-04-05 03:00:30'),
(3, 'The client is MANDATORY to avail deep cleaning service for units with significant debris and dirt accumulation so that skilled technicians can proceed with diagnosing the issue.', 1, 3, '2024-04-05 02:40:29', '2024-04-05 02:40:29'),
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
(21, 'Official receipt turnover upon completion of service.', 1, 20, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(22, 'das', 1, 22, '2024-04-05 03:59:18', '2024-04-05 03:59:18'),
(23, 'qweqwe', 1, 23, '2024-04-05 03:59:47', '2024-04-05 03:59:47');

--
-- Triggers `cs_terms_of_service`
--
DELIMITER $$
CREATE TRIGGER `before_tos_insert` BEFORE INSERT ON `cs_terms_of_service` FOR EACH ROW BEGIN
    DECLARE new_id INT;
    SET @counter = IFNULL(@counter, 0);
    SET new_id = @counter + 1;
    SET NEW.tos_id = CONCAT('tos_', new_id);
    SET @counter = new_id;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_terms_of_service`
--
ALTER TABLE `cs_terms_of_service`
  ADD PRIMARY KEY (`tos_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cs_terms_of_service`
--
ALTER TABLE `cs_terms_of_service`
  MODIFY `tos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
