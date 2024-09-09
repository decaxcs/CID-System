-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2024 at 09:35 AM
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

--
-- Triggers `cid_claiming_slip`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cid_claiming_slip` AFTER DELETE ON `cid_claiming_slip` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cid_claiming_slip', OLD.cid_cs_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cid_claiming_slip` AFTER INSERT ON `cid_claiming_slip` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cid_claiming_slip', NEW.cid_cs_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cid_claiming_slip` AFTER UPDATE ON `cid_claiming_slip` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cid_claiming_slip', NEW.cid_cs_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cid_claiming_slip` BEFORE DELETE ON `cid_claiming_slip` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'soft_delete', 'cid_claiming_slip', OLD.cid_cs_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

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

--
-- Triggers `cid_recommendations`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cid_recommendations` AFTER DELETE ON `cid_recommendations` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cid_recommendations', OLD.cid_r_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cid_recommendations` AFTER INSERT ON `cid_recommendations` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cid_recommendations', NEW.cid_r_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cid_recommendations` AFTER UPDATE ON `cid_recommendations` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cid_recommendations', NEW.cid_r_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cid_recommendations` BEFORE DELETE ON `cid_recommendations` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'soft_delete', 'cid_recommendations', OLD.cid_r_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cid_summary_of_payments`
--

CREATE TABLE `cid_summary_of_payments` (
  `cid_sop_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_service_id` int(11) NOT NULL,
  `cid_sop_cost` float NOT NULL,
  `cid_sop_discounted_price` float NOT NULL,
  `cid_sop_discount` float NOT NULL,
  `cid_sop_warranty_start` date DEFAULT NULL,
  `cid_sop_warranty_end` date DEFAULT NULL,
  `cid_sop_warranty_duration` int(11) DEFAULT NULL,
  `cid_sop_warranty_unit` varchar(100) DEFAULT NULL,
  `cid_sop_warranty_type` varchar(100) DEFAULT NULL,
  `cid_sop_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_sop_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cid_summary_of_payments`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cid_summary_of_payments` AFTER DELETE ON `cid_summary_of_payments` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cid_summary_of_payments', OLD.cid_sop_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cid_summary_of_payments` AFTER INSERT ON `cid_summary_of_payments` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cid_summary_of_payments', NEW.cid_sop_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cid_summary_of_payments` AFTER UPDATE ON `cid_summary_of_payments` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cid_summary_of_payments', NEW.cid_sop_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cid_summary_of_payments` BEFORE DELETE ON `cid_summary_of_payments` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'soft_delete', 'cid_summary_of_payments', OLD.cid_sop_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

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
CREATE TRIGGER `log_after_delete_cid_summary_of_repairs` AFTER DELETE ON `cid_summary_of_repairs` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'delete', 'cid_summary_of_repairs', OLD.cid_sor_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cid_summary_of_repairs` AFTER INSERT ON `cid_summary_of_repairs` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cid_summary_of_repairs', NEW.cid_sor_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cid_summary_of_repairs` AFTER UPDATE ON `cid_summary_of_repairs` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'update', 'cid_summary_of_repairs', NEW.cid_sor_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cid_summary_of_repairs` BEFORE DELETE ON `cid_summary_of_repairs` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'soft_delete', 'cid_summary_of_repairs', OLD.cid_sor_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_checklist`
--

CREATE TABLE `cs_cid_checklist` (
  `cs_cid_c_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cs_cid_c_wifi` int(11) DEFAULT 0,
  `cs_cid_c_keyboard` int(11) DEFAULT 0,
  `cs_cid_c_temperature` int(11) DEFAULT 0,
  `cs_cid_c_tracepad` int(11) DEFAULT 0,
  `cs_cid_c_bluetooth` int(11) DEFAULT 0,
  `cs_cid_c_audiojack` int(11) DEFAULT 0,
  `cs_cid_c_speaker` int(11) DEFAULT 0,
  `cs_cid_c_camera` int(11) DEFAULT 0,
  `cs_cid_c_lcd` int(11) DEFAULT 0,
  `cs_cid_c_stresstest` int(11) DEFAULT 0,
  `cs_cid_c_created` timestamp NULL DEFAULT current_timestamp(),
  `cs_cid_c_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_cid_checklist`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_cid_checklist` AFTER DELETE ON `cs_cid_checklist` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'delete', 'cs_cid_checklist', OLD.cs_cid_c_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_cid_checklist` AFTER INSERT ON `cs_cid_checklist` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'insert', 'cs_cid_checklist', NEW.cs_cid_c_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_cid_checklist` AFTER UPDATE ON `cs_cid_checklist` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'update', 'cs_cid_checklist', NEW.cs_cid_c_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cs_cid_checklist` BEFORE DELETE ON `cs_cid_checklist` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'soft_delete', 'cs_cid_checklist', OLD.cs_cid_c_id, OLD.cid_number, CURRENT_TIMESTAMP);
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
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `cid_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_cid_information`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_cid_information` AFTER DELETE ON `cs_cid_information` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'delete', 'cs_cid_information', OLD.cid_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_cid_information` AFTER INSERT ON `cs_cid_information` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'insert', 'cs_cid_information', NEW.cid_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_cid_information` AFTER UPDATE ON `cs_cid_information` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'update', 'cs_cid_information', NEW.cid_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cs_cid_information` BEFORE DELETE ON `cs_cid_information` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'soft_delete', 'cs_cid_information', OLD.cid_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

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

--
-- Triggers `cs_cid_services`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_cid_services` AFTER DELETE ON `cs_cid_services` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'delete', 'cs_cid_services', OLD.cs_cid_service_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_cid_services` AFTER INSERT ON `cs_cid_services` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'insert', 'cs_cid_services', NEW.cs_cid_service_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_cid_services` AFTER UPDATE ON `cs_cid_services` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'update', 'cs_cid_services', NEW.cs_cid_service_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cs_cid_services` BEFORE DELETE ON `cs_cid_services` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'soft_delete', 'cs_cid_services', OLD.cs_cid_service_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

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

--
-- Triggers `cs_cid_technicians`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_cid_technicians` AFTER DELETE ON `cs_cid_technicians` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'delete', 'cs_cid_technicians', OLD.cs_cid_tech_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_cid_technicians` AFTER INSERT ON `cs_cid_technicians` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'insert', 'cs_cid_technicians', NEW.cs_cid_tech_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_cid_technicians` AFTER UPDATE ON `cs_cid_technicians` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'update', 'cs_cid_technicians', NEW.cs_cid_tech_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cs_cid_technicians` BEFORE DELETE ON `cs_cid_technicians` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'soft_delete', 'cs_cid_technicians', OLD.cs_cid_tech_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_cid_terms_of_service`
--

CREATE TABLE `cs_cid_terms_of_service` (
  `cid_tos_id` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cid_tos_terms` int(11) NOT NULL,
  `cid_tos_agreement` tinyint(4) NOT NULL DEFAULT 0,
  `cid_tos_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_cid_terms_of_service`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_cid_terms_of_service` AFTER DELETE ON `cs_cid_terms_of_service` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'delete', 'cs_cid_terms_of_service', OLD.cid_tos_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_cid_terms_of_service` AFTER INSERT ON `cs_cid_terms_of_service` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'insert', 'cs_cid_terms_of_service', NEW.cid_tos_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_cid_terms_of_service` AFTER UPDATE ON `cs_cid_terms_of_service` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'update', 'cs_cid_terms_of_service', NEW.cid_tos_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cs_cid_terms_of_service` BEFORE DELETE ON `cs_cid_terms_of_service` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'soft_delete', 'cs_cid_terms_of_service', OLD.cid_tos_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

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
-- Triggers `cs_cid_terms_of_service_a`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_cid_terms_of_service_a` AFTER DELETE ON `cs_cid_terms_of_service_a` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'delete', 'cs_cid_terms_of_service_a', OLD.cid_tos_a_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_cid_terms_of_service_a` AFTER INSERT ON `cs_cid_terms_of_service_a` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'insert', 'cs_cid_terms_of_service_a', NEW.cid_tos_a_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_cid_terms_of_service_a` AFTER UPDATE ON `cs_cid_terms_of_service_a` FOR EACH ROW BEGIN
   DECLARE user_id_val INT;
   SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
   INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
   VALUES (user_id_val, 'update', 'cs_cid_terms_of_service_a', NEW.cid_tos_a_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cs_cid_terms_of_service_a` BEFORE DELETE ON `cs_cid_terms_of_service_a` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'soft_delete', 'cs_cid_terms_of_service_a', OLD.cid_tos_a_id , OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_cms`
--

CREATE TABLE `cs_cms` (
  `cms_id` int(11) NOT NULL,
  `cms_logo` text NOT NULL,
  `cms_company_name` varchar(255) NOT NULL,
  `cms_email` text NOT NULL,
  `cms_cp1` varchar(100) NOT NULL,
  `cms_cp2` varchar(100) NOT NULL,
  `cms_cp3` varchar(100) NOT NULL,
  `cms_address` text NOT NULL,
  `cms_acknowledgement` text NOT NULL,
  `cms_disclaimer` text NOT NULL,
  `cms_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_cms`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_cms` AFTER DELETE ON `cs_cms` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cs_cms', OLD.cms_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_cms` AFTER INSERT ON `cs_cms` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cs_cms', NEW.cms_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_cms` AFTER UPDATE ON `cs_cms` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cs_cms', NEW.cms_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_devices`
--

CREATE TABLE `cs_devices` (
  `cs_device_id` int(11) NOT NULL,
  `cs_device_name` varchar(100) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `cs_device_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_device_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_devices`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_devices` AFTER DELETE ON `cs_devices` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cs_devices', OLD.cs_device_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_devices` AFTER INSERT ON `cs_devices` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cs_devices', NEW.cs_device_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_devices` AFTER UPDATE ON `cs_devices` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cs_devices', NEW.cs_device_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_mop`
--

CREATE TABLE `cs_mop` (
  `cs_mop_id` int(11) NOT NULL,
  `cs_mop_name` varchar(100) NOT NULL,
  `cs_mop_fee` int(11) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `cs_mop_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_mop_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_mop`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_mop` AFTER DELETE ON `cs_mop` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cs_mop', OLD.cs_mop_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_mop` AFTER INSERT ON `cs_mop` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cs_mop', NEW.cs_mop_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_mop` AFTER UPDATE ON `cs_mop` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cs_mop', NEW.cs_mop_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_payment`
--

CREATE TABLE `cs_payment` (
  `cs_p_id` int(11) NOT NULL,
  `cs_p_note` text NOT NULL,
  `cs_p_amount` float NOT NULL,
  `cs_p_mop` int(11) NOT NULL,
  `cid_number` varchar(100) NOT NULL,
  `cs_p_reference` text NOT NULL,
  `cs_p_vat` float NOT NULL,
  `cs_p_cf` float NOT NULL,
  `cs_p_total` float NOT NULL,
  `cs_p_paid_date` datetime NOT NULL,
  `cs_p_ds` varchar(100) NOT NULL,
  `cs_p_or` varchar(100) NOT NULL,
  `cs_p_balance` float NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT 0,
  `cs_p_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_p_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_payment`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_payment` AFTER DELETE ON `cs_payment` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cs_payment', OLD.cs_p_id, OLD.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_payment` AFTER INSERT ON `cs_payment` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cs_payment', NEW.cs_p_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_payment` AFTER UPDATE ON `cs_payment` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cs_payment', NEW.cs_p_id, NEW.cid_number, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_services`
--

CREATE TABLE `cs_services` (
  `cs_service_id` int(11) NOT NULL,
  `cs_service_name` varchar(100) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `cs_service_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_service_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_services`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_services` AFTER DELETE ON `cs_services` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cs_services', OLD.cs_service_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_services` AFTER INSERT ON `cs_services` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cs_services', NEW.cs_service_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_services` AFTER UPDATE ON `cs_services` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cs_services', NEW.cs_service_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

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
-- Triggers `cs_settings`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_settings` AFTER DELETE ON `cs_settings` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cs_settings', OLD.cs_settings_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_settings` AFTER INSERT ON `cs_settings` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cs_settings', NEW.cs_settings_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_settings` AFTER UPDATE ON `cs_settings` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cs_settings', NEW.cs_settings_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_sources`
--

CREATE TABLE `cs_sources` (
  `cs_source_id` int(11) NOT NULL,
  `cs_source_name` varchar(100) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `cs_source_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `cs_source_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_sources`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_sources` AFTER DELETE ON `cs_sources` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cs_sources', OLD.cs_source_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_sources` AFTER INSERT ON `cs_sources` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cs_sources', NEW.cs_source_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_sources` AFTER UPDATE ON `cs_sources` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cs_sources', NEW.cs_source_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cs_terms_of_service`
--

CREATE TABLE `cs_terms_of_service` (
  `tos_id` int(11) NOT NULL,
  `tos_content` text NOT NULL,
  `tos_required` smallint(6) NOT NULL DEFAULT 1,
  `tos_sequence` int(11) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `tos_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `tos_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cs_terms_of_service`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_terms_of_service` AFTER DELETE ON `cs_terms_of_service` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'delete', 'cs_terms_of_service', OLD.tos_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_terms_of_service` AFTER INSERT ON `cs_terms_of_service` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'insert', 'cs_terms_of_service', NEW.tos_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_terms_of_service` AFTER UPDATE ON `cs_terms_of_service` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, cid_number, timestamp)
    VALUES (user_id_val, 'update', 'cs_terms_of_service', NEW.tos_id, NULL, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

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
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `csu_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `csu_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_users`
--

INSERT INTO `cs_users` (`csu_id`, `csu_username`, `csu_password`, `csu_name`, `csu_permission`, `isDeleted`, `csu_created`, `csu_updated`) VALUES
(1, 'Admin', '$2y$10$SGs9fXb.BYJaluZkmI2M3Oy6jx0OjqAWS7qzRNAMBcVZiaM6u4/bK', 'Frontdesk', 'Frontdesk', 0, '2024-05-10 04:58:51', '2024-06-02 11:11:56'),
(2, 'Tech', '$2y$10$rO0PEFRiAtKVhYXR53a1G.Cu.B06rEoXElf1y2ErTMEvFaUwpObu.', 'Armein', 'Technician', 0, '2024-05-10 04:58:57', '2024-06-02 07:53:47'),
(3, 'Super Admin', '$2y$10$1ASdIKx9fnMTQbDlD.8JF.ZZcTV65rnziWXBvxK5SXWsYBNgkZ6hW', 'Super Admin', 'Super Admin', 0, '2024-05-20 01:31:43', '2024-06-02 06:56:23');

--
-- Triggers `cs_users`
--
DELIMITER $$
CREATE TRIGGER `log_after_delete_cs_users` AFTER DELETE ON `cs_users` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, timestamp)
    VALUES (user_id_val, 'delete', 'cs_users', OLD.csu_id, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_insert_cs_users` AFTER INSERT ON `cs_users` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, timestamp)
    VALUES (user_id_val, 'insert', 'cs_users', NEW.csu_id, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_after_update_cs_users` AFTER UPDATE ON `cs_users` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, timestamp)
    VALUES (user_id_val, 'update', 'cs_users', NEW.csu_id, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_before_soft_delete_cs_users` BEFORE DELETE ON `cs_users` FOR EACH ROW BEGIN
    DECLARE user_id_val INT;
    SELECT user_id INTO user_id_val FROM login_account WHERE id = 1;
    INSERT INTO logs (user_id, action, table_name, record_id, timestamp)
    VALUES (user_id_val, 'soft_delete', 'cs_users', OLD.csu_id, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login_account`
--

CREATE TABLE `login_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `record_id` int(11) NOT NULL,
  `cid_number` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_int` int(11) DEFAULT NULL,
  `test_text` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_table`
--

CREATE TABLE `test_table` (
  `test_id` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD PRIMARY KEY (`cid_sop_id`),
  ADD KEY `cid_service_id` (`cid_service_id`);

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
-- Indexes for table `cs_cid_checklist`
--
ALTER TABLE `cs_cid_checklist`
  ADD PRIMARY KEY (`cs_cid_c_id`),
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
-- Indexes for table `cs_cms`
--
ALTER TABLE `cs_cms`
  ADD PRIMARY KEY (`cms_id`);

--
-- Indexes for table `cs_devices`
--
ALTER TABLE `cs_devices`
  ADD PRIMARY KEY (`cs_device_id`);

--
-- Indexes for table `cs_mop`
--
ALTER TABLE `cs_mop`
  ADD PRIMARY KEY (`cs_mop_id`);

--
-- Indexes for table `cs_payment`
--
ALTER TABLE `cs_payment`
  ADD PRIMARY KEY (`cs_p_id`);

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
-- Indexes for table `cs_sources`
--
ALTER TABLE `cs_sources`
  ADD PRIMARY KEY (`cs_source_id`);

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
-- Indexes for table `login_account`
--
ALTER TABLE `login_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `test_table`
--
ALTER TABLE `test_table`
  ADD PRIMARY KEY (`test_id`);

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
-- AUTO_INCREMENT for table `cs_cid_checklist`
--
ALTER TABLE `cs_cid_checklist`
  MODIFY `cs_cid_c_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `cs_cms`
--
ALTER TABLE `cs_cms`
  MODIFY `cms_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_devices`
--
ALTER TABLE `cs_devices`
  MODIFY `cs_device_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_mop`
--
ALTER TABLE `cs_mop`
  MODIFY `cs_mop_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_payment`
--
ALTER TABLE `cs_payment`
  MODIFY `cs_p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_services`
--
ALTER TABLE `cs_services`
  MODIFY `cs_service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_settings`
--
ALTER TABLE `cs_settings`
  MODIFY `cs_settings_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_sources`
--
ALTER TABLE `cs_sources`
  MODIFY `cs_source_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_terms_of_service`
--
ALTER TABLE `cs_terms_of_service`
  MODIFY `tos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_tos_additional`
--
ALTER TABLE `cs_tos_additional`
  MODIFY `tos_a_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_users`
--
ALTER TABLE `cs_users`
  MODIFY `csu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `login_account`
--
ALTER TABLE `login_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_table`
--
ALTER TABLE `test_table`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
