SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `cid_summary_of_payments` (
  `cid_sop_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_service_id` int(11) NOT NULL,
  `cid_sop_cost` float NOT NULL,
  `cid_sop_discounted_price` float NOT NULL,
  `cid_sop_payment_method` varchar(100) NOT NULL,
  `cid_sop_ref_no` varchar(255) NOT NULL,
  `cid_sop_discount` float NOT NULL,
  `cid_sop_paid` tinyint(4) NOT NULL DEFAULT 0,
  `cid_sop_warranty_start` date DEFAULT NULL,
  `cid_sop_warranty_end` date DEFAULT NULL,
  `cid_sop_warranty_duration` int(11) DEFAULT NULL,
  `cid_sop_warranty_unit` varchar(100) DEFAULT NULL,
  `cid_sop_warranty_type` varchar(100) DEFAULT NULL,
  `cid_sop_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_sop_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `cs_cid_technicians` (
  `cs_cid_tech_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_technician_id` int(11) NOT NULL,
  `cs_cid_tech_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_cid_tech_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `cs_services` (
  `cs_service_id` int(11) NOT NULL,
  `cs_service_name` varchar(100) NOT NULL,
  `cs_service_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_service_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `cs_users` (
  `csu_id` int(11) NOT NULL,
  `csu_username` varchar(100) NOT NULL,
  `csu_password` varchar(100) NOT NULL,
  `csu_name` varchar(255) NOT NULL,
  `csu_permission` varchar(100) NOT NULL,
  `csu_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `csu_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `cid_summary_of_payments`
  ADD PRIMARY KEY (`cid_sop_id`),
  ADD KEY `cid_service_id` (`cid_service_id`);

ALTER TABLE `cs_cid_information`
  ADD PRIMARY KEY (`cid_id`),
  ADD UNIQUE KEY `uc_cid_number` (`cid_number`),
  ADD KEY `cid_representative` (`cid_representative`),
  ADD KEY `cid_device_id` (`cid_device_id`);

ALTER TABLE `cs_cid_technicians`
  ADD PRIMARY KEY (`cs_cid_tech_id`),
  ADD KEY `cid_number` (`cid_number`),
  ADD KEY `cid_technician_id` (`cid_technician_id`);

ALTER TABLE `cs_services`
  ADD PRIMARY KEY (`cs_service_id`);

ALTER TABLE `cs_users`
  ADD PRIMARY KEY (`csu_id`);


ALTER TABLE `cid_summary_of_payments`
  MODIFY `cid_sop_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cs_cid_information`
  MODIFY `cid_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cs_cid_technicians`
  MODIFY `cs_cid_tech_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cs_services`
  MODIFY `cs_service_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cs_users`
  MODIFY `csu_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `cs_cid_information`
  ADD CONSTRAINT `cs_cid_information_ibfk_3` FOREIGN KEY (`cid_representative`) REFERENCES `cs_users` (`csu_id`),
  ADD CONSTRAINT `cs_cid_information_ibfk_4` FOREIGN KEY (`cid_device_id`) REFERENCES `cs_devices` (`cs_device_id`);

ALTER TABLE `cs_cid_technicians`
  ADD CONSTRAINT `cs_cid_technicians_ibfk_1` FOREIGN KEY (`cid_number`) REFERENCES `cs_cid_information` (`cid_number`),
  ADD CONSTRAINT `cs_cid_technicians_ibfk_2` FOREIGN KEY (`cid_technician_id`) REFERENCES `cs_users` (`csu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
