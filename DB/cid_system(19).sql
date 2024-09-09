-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2024 at 09:39 AM
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
-- Dumping data for table `cid_claiming_slip`
--

INSERT INTO `cid_claiming_slip` (`cid_cs_id`, `cid_number`, `cid_cs_number`, `cid_cs_color`, `cid_cs_accesories`, `cid_cs_created`) VALUES
(30, '052024-1', '062024-1', '', '', '2024-06-02 10:25:43'),
(31, '052024-2', '062024-2', '', '', '2024-06-02 10:25:46'),
(33, 'CID 052024-3', '062024-1', '', '', '2024-06-02 10:26:26'),
(34, '052024-3', '062024-1', '', '', '2024-06-02 10:31:41');

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
-- Dumping data for table `cid_summary_of_payments`
--

INSERT INTO `cid_summary_of_payments` (`cid_sop_id`, `cid_number`, `cid_service_id`, `cid_sop_cost`, `cid_sop_discounted_price`, `cid_sop_discount`, `cid_sop_warranty_start`, `cid_sop_warranty_end`, `cid_sop_warranty_duration`, `cid_sop_warranty_unit`, `cid_sop_warranty_type`, `cid_sop_added`, `cid_sop_updated`) VALUES
(20, '062024-3', 3, 2000, 2000, 0, '2024-06-11', '2024-06-18', 1, 'Week', 'Service', '2024-06-11 13:27:31', '2024-06-11 21:38:32'),
(23, '062024-3', 1, 2000, 2000, 0, NULL, NULL, NULL, NULL, NULL, '2024-06-11 22:12:27', '2024-06-11 22:12:27');

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
-- Dumping data for table `cid_summary_of_repairs`
--

INSERT INTO `cid_summary_of_repairs` (`cid_sor_id`, `cid_number`, `cid_sor_content`, `cid_sor_start_date`, `cid_sor_end_date`, `cid_sor_warranty_start`, `cid_sor_warranty_end`, `cid_sor_service`, `cid_sor_we_value`, `cid_sor_we_duration`, `cid_sor_added`, `cid_sor_updated`) VALUES
(4, '052024-1', 'Drain board, Deep cleaned, replaced b1attery.', '2024-05-14 10:43:00', '2024-05-15 15:08:00', '0000-00-00', '0000-00-00', '', 0, '', '2024-05-14 02:44:00', '2024-06-03 16:47:58'),
(11, '052024-2', '123', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00', '0000-00-00', '', 0, '', '2024-06-02 08:12:22', '2024-06-02 08:12:26'),
(19, '052024-3', 'ywawaw', '2024-06-01 21:15:00', '2024-06-08 21:15:00', '0000-00-00', '0000-00-00', '', 0, '', '2024-06-02 13:15:27', '2024-06-02 13:15:36'),
(23, '062024-3', '1', '2024-06-04 06:26:00', '0000-00-00 00:00:00', '0000-00-00', '0000-00-00', '', 0, '', '2024-06-03 22:03:25', '2024-06-03 22:26:32'),
(49, '062024-2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00', '0000-00-00', '', 0, '', '2024-06-03 22:30:18', '2024-06-03 22:30:18');

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
-- Dumping data for table `cs_cid_checklist`
--

INSERT INTO `cs_cid_checklist` (`cs_cid_c_id`, `cid_number`, `cs_cid_c_wifi`, `cs_cid_c_keyboard`, `cs_cid_c_temperature`, `cs_cid_c_tracepad`, `cs_cid_c_bluetooth`, `cs_cid_c_audiojack`, `cs_cid_c_speaker`, `cs_cid_c_camera`, `cs_cid_c_lcd`, `cs_cid_c_stresstest`, `cs_cid_c_created`, `cs_cid_c_updated`) VALUES
(8, '062024-3', 2, 3, 3, 1, 1, 1, 1, 1, 1, 1, '2024-06-03 22:20:19', '2024-06-12 01:22:28'),
(16, '062024-2', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-03 22:30:18', '2024-06-03 22:30:18'),
(17, '052024-1', 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, '2024-06-03 22:30:49', '2024-06-03 22:30:49');

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
-- Dumping data for table `cs_cid_information`
--

INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`, `cid_signature`, `cid_client_contact`, `cid_client_email`, `cid_platinum`, `cid_platinum_number`, `cid_representative`, `cid_advertisement`, `cid_unit_details`, `cid_remarks`, `cid_unit_history`, `cid_device_id`, `cid_status`, `cid_type`, `isDeleted`, `cid_created`, `cid_updated`) VALUES
(2, '052024-1', 'Fhranz Joseph A. Benosa', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABEwAAAH0CAYAAAAnoLgFAAAAAXNSR0IArs4c6QAAIABJREFUeF7t3X/ofU19IPbZNgXDZrumKBiqNUIDLrTUQKGGmqpsl8Y/SrQYqmSD2gi7sLRVqmj/WOLD7hJtBE1/sCkoKtug2wRM6EJdSoliIMIGzFK6ESqoGyFChLi7KRE25ennHe/EcZ5z753ze849rwtfvs/z/ZwfM6+Zzz3nvM97Zv5c8iFAgAABAgQIECBAgAABAgQIEPgegT/HgwABAgQIECBAgAABAgQIECBA4HsFBEz0CAIECBAgQIAAAQIECBAgQIBAJSBgoksQIECAAAECBAgQIECAAAECBARM9AECBAgQIECAAAECBAgQIECAwG0BGSZ6CAECBAgQIECAAAECBAgQIECgEhAw0SUIECBAgAABAgQIECBAgAABAgIm+gABAgQIECBAgAABAgQIECBA4LaADBM9hAABAgQIECBAgAABAgQIECBQCQiY6BIECBAgQIAAAQIECBAgQIAAAQETfYAAAQIECBAgQIAAAQIECBAgcFtAhokeQoAAAQIECBAgQIAAAQIECBCoBARMdAkCBAgQIECAAAECBAgQIECAgICJPkCAAAECBAgQIECAAAECBAgQuC0gw0QPIUCAAAECBAgQIECAAAECBAhUAgImugQBAgQIECBAgAABAgQIECBAQMBEHyBAgAABAgQIECBAgAABAgQI3BaQYaKHECBAgAABAgQIECBAgAABAgQqAQETXYIAAQIECBAgQIAAAQIECBAgIGCiDxAgQIAAAQIECBAgQIAAAQIEbgvIMNFDCBAgQIAAAQIECBAgQIAAAQKVgICJLkGAAAECBAgQIECAAAECBAgQEDDRBwgQIECAAAECBAgQIECAAAECtwVkmOghBAgQIECAAAECBAgQIECAAIFKQMBElyBAgAABAgQIECBAgAABAgQICJjoAwQIECBAgAABAgQIECBAgACB2wIyTPQQAgQIECBAgAABAgQIECBAgEAlIGCiSxAgQIAAAQIECBAgQIAAAQIEBEz0AQIECBAgQIAAAQIECBAgQIDAbQEZJnoIAQIECBAgQIAAAQIECBAgQKASEDDRJQgQIECAAAECBAgQIECAAAECAib6AAECBAgQIECAAAECBAgQIEDgtoAMEz2EAAECBAgQIECAAAECBAgQIFAJCJjoEgQIECBAgAABAgQIECBAgAABARN9gAABAgQIECBAgAABAgQIECBwW0CGiR5CgAABAgQIECBAgAABAgQIEKgEBEx0CQIECBAgQIAAAQIECBAgQICAgIk+QIAAAQIECBAgQIAAAQIECBC4LSDDRA8hQIAAAQIECBAgQIAAAQIECFQCAia6BAECBAgQIECAAAECBAgQIEBAwEQfIECAAAECBAgQIECAAAECBAjcFpBhoocQIECAAAECBAgQIECAAAECBCoBARNdggABAgQIECBAgAABAgQIECAgYKIPECBAgAABAgQIECBAgAABAgRuC8gw0UMIECBAgAABAgQIECBAgAABApWAgIkuQYAAAQIECBAgQIAAAQIECBAQMNEHCBAgQIAAAQIECBAgQIAAAQK3BWSY6CEECBAgQIAAAQIECBAgQIAAgUpAwESXIECAAAECBAgQIECAAAECBAgImOgDBAgQIECAAAECBAgQIECAAIHbAjJM9BACBAgQIECAAAECBAgQIECAQCUgYKJLECBAgAABAgQIECBAgAABAgQETPQBAgQIECBAgAABAgQIECBAgMBtARkmeggBAgQIECBAgAABAgQIECBAoBIQMNElCBAgQIAAAQIECBAgQIAAAQICJvoAAQIECBAgQIAAAQIECBAgQOC2gAwTPYQAAQIECBAgQIAAAQIECBAgUAkImOgSBAgQIECAAAECBAgQIECAAAEBE32AAAECBAgQIECAAAECBAgQIHBbQIaJHkKAAAECBAgQIECAAAECBAgQqAQETHQJAgQIECBAgAABAgQIECBAgICAiT5AgAABAgQIECBAgAABAgQIELgtIMNEDyFAgAABAgQIECBAgAABAgQIVAICJroEAQIECBAgQIAAAQIECBAgQEDARB8gQIAAAQIECBAgQIAAAQIECNwWkGGihxAgQIAAAQIECBAgQIAAAQIEKgEBE12CAAECBAgQIECAAAECBAgQICBgog8QIECAAAECBAgQIECAAAECBG4LyDDRQwgQIECAAAECBAgQIECAAAEClYCAiS5BgAABAgQIECBAgAABAgQIEBAw0QcIECBAgAABAgQIECBAgAABArcFZJjoIQQIECBAgAABAgQIECBAgACBSkDARJcg0C7wkZTST6eUfjml9Pb23WxJgAABAgQIECBAgAAB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Aj+cUoqASQzHkem5hKhjECBAgAABAlcFBEzGdY7ILon5S942bjdbEyBAgAABAgsIxLDY9z0Nx3H/sgCmQxAgQIAAAQK3BdxwjOsh5i8Z52VrAgQIECCwpEBkl8THCjlLqjoWAQIECBAgMCggYDKuY8SNmpu0cWa2JkCAAAECcwViKM7HLqvjRIaJ+UvmitqfAAECBAgQuCsgYHKX6M82iJu1mL9EwKTdzJYECBAgQGCuQJ63JI4T85ZYTniuqP0JECBAgACBJgEBkyamP93oNSmlGJLjRq3dzJYECBAgQGCuQLysiGuwYMlcSfsTIECAAAECowQETNq5IlgSH2nA7Wa2JECAAAECcwViOGxkmbhnmStpfwIECBAgQGCUgJuPdq54wxXBEssYtpvZkgABAgQIECBAgAABAgQIHFJAwKS92Z71dqsdy5YECBAgQIAAAQIECBAgQODIAgImba1nwtc2J1sRIECAAAECBAgQIECAAIGHEBAwaWtGE762OdmKAAECBAgQIECAAAECBAg8hICASVszxoSvETSxQk6bl60IECBAgAABAgQIECBAgMChBQRM2prPCjltTrYiQIAAAQIECBAgQIAAAQIPISBg0taMsUJOrI5jSeE2L1sRIECAAAECBAgQIECAAIFDCwiYtDXfV1JKb7OkcBuWrQgQIECAAAECBAgQIECAwNEFBEzaWjCWFI75SyLLxIcAAQIECBAgQIAAAQIECBB4cAEBk/sNHEsKR4aJgMl9K1sQIECAAAECBAgQIECAAIGHEBAwud+MOWDC6r6VLQgQIECAAAECBAgQIECAwEMICALcb8ZYTjgmfX1ZSumr9ze3BQECBAgQIECAAAECBAgQIHB0AQGT+y341pTSx55WyGF138oWBAgQIECAAAECBAgQIEDgIQQEAe434/tTSn8jpfQX7m9qCwIECBAgQIAAAQIECBAgQOARBARM7rfizz1t8j4ZJvehbEGAAAECBAgQIECAAAECBB5FQMDkfkvGkJwImsQcJj4ECBAgQIAAAQIECBAgQIDACQQETO43sgyT+0a2IECAAAECBAgQIECAAAECDyUgYHK/OQVM7hvZggABAgQIECBAgAABAgQIPJSAgMn95hQwuW9kCwIECBAgQIAAAQIECBAg8FACAib3m1PA5L6RLQgQIECAAAECBAgQIECAwEMJCJjcb86PpZReY9LX+1C2IECAAAECBAgQIECAAAECjyIgYHK/JX/jsslr729qCwIECBAgQIAAAQIECBAgQOARBARM7rdiBEy+mlJ62/1NbUGAAAECBAgQIECAAAECBAg8goCAyf1WfPZpk/ellJ65v6ktCBAgQIAAAQIECBAgQIAAgUcQEDC53Yo/nFL6ioDJI3R1dSBAgAABAgQIECBAgAABAu0CAiZtAZMYjvPxdlZbEiBAgAABAgQIECBAgAABAkcWEDC53XqxOk7MYRITvn72yA2t7AQIECBAgAABAgQIECBAgEC7gIDJbau3ppRiWWEBk/Y+ZUsCBAgQIECAAAECBAgQIHB4AQGT2034c08/jglfBUwO39VVgAABAgQIECBAgAABAgQItAsImAiYtPcWWxIgQIAAAQIECBAgQIAAgZMICJgImJykq6smAQIECBAgQIAAAQIECBBoFxAwuW0V85fEPCZWyWnvU7YkQIAAAQIECBAgQIAAAQKHFxAwud2EP5xSinlMImDiQ4AAAQIECBAgQIAAAQIECJxEQMDkJA2tmgQIECBAgAABAgQIECBAgEC7gIBJu5UtCRAgQIAAAQIECBAgQIAAgZMICJicpKFVkwABAgQIECBAgAABAgQIEGgXEDBpt7IlAQIECBAgQIAAAQIECBAgcBIBAZOTNLRqEiBAgAABAgQIECBAgAABAu0CAibtVrYkQIAAAQIECBAgQIAAAQIETiIgYHKShlZNAgQIECBAgAABAgQIECBAoF1AwKTdypYECBAgQIAAAQIECBAgQIDASQQETE7S0KpJgAABAgQIECBAgAABAgQItAsImLRb2ZIAAQIECBAgQIAAAQIECBA4iYCAyUkaWjUJECBAgAABAgQIECBAgACBdgEBk3YrWxIgQIAAAQIECBAgQIAAAQInERAwOUlDqyYBAgQIECBAgAABAgQIECDQLiBg0m5lSwIECBAgQIAAAQIECBAgQOAkAgImJ2lo1SRAgAABAgQIECBAgAABAgTaBQRM2q1sSYAAAQIECBAgQIAAAQIECJxEQMDkJA2tmgQIECBAgAABAgQIECBAgEC7gIBJu5UtCRAgQIAAAQIECBAgQIAAgZMICJicpKFVkwABAgQIECBAgAABAgQIEGgXEDBpt7IlAQIECBAgQIAAAQIECBAgcBIBAZOTNLRqEiBAgAABAgQIECBAgAABAu0CAibtVrYkQIAAAQIECBAgQIAAAQIETiIgYHKShlZNAgQIECBAgAABAgQIECBAoF1AwKTdypYECBAgQIAAAQIECBAgQIDASQQETE7S0KpJgAABAgQIECBAgAABAgQItAsImLRb2ZIAAQIECBAgQIAAAQIECBA4iYCAyUkaWjUJECBAgAABAgQIECBAgACBdgEBk3YrWxIgQIAAAQIECBAgQIAAAQInERAwOUlDqyYBAgQIECBAgAABAgQIECDQLiBg0m5lSwIECBAgQIAAAQIECBAgQOAkAgImJ2lo1SRAgAABAgQIECBAgAABAgTaBQRM2q1sSYAAAQIECBAgQIAAAQIECJxEQMDkJA2tmgQIECBAgAABAgQIECBAgEC7gIBJu5UtCRAgQIAAAQIECBAgQIAAgZMICJicpKFVkwABAgQIECBAgAABAgQIEGgXEDBpt7IlAQIECBAgQIAAAQIECBAgcBIBAZOTNLRqEiBAgAABAgQIECBAgAABAu0CAibtVrYkQIAAAQIECBAgQIAAAQIETiIgYHKShlZNAgQIECBAgAABAgQIECBAoF1AwKTdypYECBAgQIAAAQIECBAgQIDASQQETE7S0KpJgAABAgQIECBAgAABAgQItAsImLRb2ZIAAQIECBAgQIAAAQIECBA4iYCAyUkaWjUJECBAgAABAgQIECBAgACBdgEBk3YrWxIgQIAAAQIECBAgQIAAAQInERAwOUlDqyYBAgQIECBAgAABAgQIECDQLiBg0m5lSwIECBAgQIAAAQIECBAgQOAkAgImJ2lo1SRAgAABAgQIECBAgAABAgTaBQRM2q1sSYAAAQIECBAgQIAAAQIECJxEQMDkJA2tmgQIECBAgAABAgQIECBAgEC7gIBJu5UtCRAgQIAAAQIECBAgQIAAgZMICJicpKFVkwABAgQIECBAgAABAgQIEGgXEDBpt7IlAQIECBAgQIAAAQIECBAgcBIBAZOTNLRqEiBAgAABAgQIECBAgAABAu0CAibtVrYkQIAAAQIECBAgQIAAAQIETiIgYHKShlZNAgQIECBAgAABAgQIECBAoF1AwKTdypYECBAgQIAAAQIECBAgQIDASQQETE7S0KpJgAABAgQIECBAgAABAgQItAsImLRb2ZIAAQIECBAgQIAAAQIECBA4iYCAyUkaWjUJECBAgAABAgQIECBAgACBdgEBk3YrWxIgQIAAAQIECBAgQIAAAQInERAwOUlDqyYBAgQIECBAgAABAgQIECDQLiBg0m5lSwIECBAgQIAAAQIECBAgQOAkAgImJ2lo1SRAgAABAgQIECBAgAABAgTaBQRM2q1sSYAAAQIECBAgQIAAAQIECJxEQMDkJA2tmgQIECBAgAABAgQIECBAgEC7gIBJu5UtCRAgQIAAAQIECBAgQIAAgZMICJicpKFVkwABAgQIECBAgAABAgQIEGgXEDBpt7IlAQIECBAgQIAAAQIECBAgcBIBAZOTNLRqEiBAgAABAgQIECBAgAABAu0CAibtVrYkQIAAAQIECBAgQIAAAQIETiIgYHKShlZNAgQIECBAgAABAgQIECBAoF1AwKTdypYECBAgQIAAAQIECBAgQIDASQQETE7S0KpJgAABAgQIECBAgAABAgQItAsImLRb2ZIAAQIECBAgQIAAAQIECBA4iYCAyUkaWjUJECBAgAABAgQIECBAgACBdgEBk3YrWxIgQIAAAQIECBAgQIAAAQInERAwOUlDqyYBAgQIECBAgAABAgQIECDQLiBg0m5lSwIECBAgQIAAAQIECBAgQOAkAgImJ2lo1SRAgAABAgQIECBAgAABAgTaBQRM2q1sSYAAAQIECBAgQIAAAQIECJxEQMDkJA2tmgQIECBAgAABAgQIECBAgEC7gIBJu5UtCRAgQIAAAQIECBAgQIAAgZMICJicpKFVkwABAgQIECBAgAABAgQIEGgXEDBpt7IlAQIECBAgQIAAAQIECBAgcBIBAZOTNLRqEiBAgAABAgQIECBAgAABAu0CAibtVrYkQIAAAQIECBAgQIAAAQIETiIgYHKShlZNAgQIECBAgAABAgQIECBAoF1AwKTdypYECBAgQIAAAQIECBAgQIDASQQETE7S0KpJgAABAgQIECBAgAABAgQItAsImLRb2ZIAAQIECBAgQIAAAQIECBA4iYCAyUkaWjUJECBAgAABAgQIECBAgACBdgEBk3YrWxIgQIAAAQIECBAgQIAAAQInERAwOUlDqyYBAgQIECBAgAABAgQIECDQLiBg0m5lSwIECBAgQIAAAQIECBAgQOAkAgImJ2lo1SRAgAABAgQIECBAgAABAgTaBQRM2q1sSYAAAQIECBAgQIAAAQIECJxEQMDkJA2tmgQIECBAgAABAgQIECBAgEC7wP8PyAHHA+O7YOEAAAAASUVORK5CYII=', '0089856740', 'fhranz789@gmail.com', 1, 20, 2, 'Facebook Page', 'Acer123Nitro 5 AN515-55ss', '123ssss', '123', 4, 'On-going', '', 0, '2024-05-14 02:08:37', '2024-06-12 00:53:10');
INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`, `cid_signature`, `cid_client_contact`, `cid_client_email`, `cid_platinum`, `cid_platinum_number`, `cid_representative`, `cid_advertisement`, `cid_unit_details`, `cid_remarks`, `cid_unit_history`, `cid_device_id`, `cid_status`, `cid_type`, `isDeleted`, `cid_created`, `cid_updated`) VALUES
(3, '052024-2', 'fhranzikso', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABEwAAAH0CAYAAAAnoLgFAAAAAXNSR0IArs4c6QAAIABJREFUeF7t3T+obdt+F/AZsFBImSKF4fgK61gEtBBObifYClZy30WLgIUK9ve9WkEsReTmgYVFWrGSlwspbAWLCAE9mOIVr0ihkOJBPN/c9UvGnW/ttcf6N9ccc3wWHPY+Z8815xifMfY6a37X+PMriwcBAgQIECBAgAABAgQIECBAgMD3BH6FBwECBAgQIECAAAECBAgQIECAwPcFBCZ6BAECBAgQIECAAAECBAgQIEBgJSAw0SUIECBAgAABAgQIECBAgAABAgITfYAAAQIECBAgQIAAAQIECBAgcFnACBM9hAABAgQIECBAgAABAgQIECCwEhCY6BIECBAgQIAAAQIECBAgQIAAAYGJPkCAAAECBAgQIECAAAECBAgQuCxghIkeQoAAAQIECBAgQIAAAQIECBBYCQhMdAkCBAgQIECAAAECBAgQIECAgMBEHyBAgAABAgQIECBAgAABAgQIXBYwwkQPIUCAAAECBAgQIECAAAECBAisBAQmugQBAgQIECBAgAABAgQIECBAQGCiDxAgQIAAAQIECBAgQIAAAQIELgsYYaKHECBAgAABAgQIECBAgAABAgRWAgITXYIAAQIECBAgQIAAAQIECBAgIDDRBwgQIECAAAECBAgQIECAAAEClwWMMNFDCBAgQIAAAQIECBAgQIAAAQIrAYGJLkGAAAECBAgQIECAAAECBAgQEJjoAwQIECBAgAABAgQIECBAgACBywJGmOghBAgQIECAAAECBAgQIECAAIGVgMBElyBAgAABAgQIECBAgAABAgQICEz0AQIECBAgQIAAAQIECBAgQIDAZQEjTPQQAgQIECBAgAABAgQIECBAgMBKQGCiSxAgQIAAAQIECBAgQIAAAQIEBCb6AAECBAgQIECAAAECBAgQIEDgsoARJnoIAQIECBAgQIAAAQIECBAgQGAlIDDRJQgQIECAAAECBAgQIECAAAECAhN9gAABAgQIECBAgAABAgQIECBwWcAIEz2EAAECBAgQIECAAAECBAgQILASEJjoEgQIECBAgAABAgQIECBAgAABgYk+QIAAAQIECBAgQIAAAQIECBC4LGCEiR5CgAABAgQIECBAgAABAgQIEFgJCEx0CQIECBAgQIAAAQIECBAgQICAwEQfIECAAAECBAgQIECAAAECBAhcFjDCRA8hQIAAAQIECBAgQIAAAQIECKwEBCa6BAECBAgQIECAAAECBAgQIEBAYKIPECBAgAABAgQIECBAgAABAgQuCxhhoocQIECAAAECBAgQIECAAAECBFYCAhNdggABAgQIECBAgAABAgQIECAgMNEHCBAgQIAAAQIECBAgQIAAAQKXBYww0UMIECBAgAABAgQIECBAgAABAisBgYkuQYAAAQIECBAgQIAAAQIECBAQmOgDBAgQIECAAAECBAgQIECAAIHLAkaY6CEECBAgQIAAAQIECBAgQIAAgZWAwESXIECAAAECBAgQIECAAAECBAgITPQBAgQIECBAgAABAgQIECBAgMBlASNM9BACBAgQIECAAAECBAgQIECAwEpAYKJLECBAgAABAgQIECBAgAABAgQEJvoAAQIECBAgQIAAAQIECBAgQOCygBEmeggBAgQIECBAgAABAgQIECBAYCUgMNElCBAgQIAAAQIECBAgQIAAAQICE32AAAECBAgQIECAAAECBAgQIHBZwAgTPYQAAQIECBAgQIAAAQIECBAgsBIQmOgSBAgQIECAAAECBAgQIECAAAGBiT5AgAABAgQIECBAgAABAgQIELgsYISJHkKAAAECBAgQIECAAAECBAgQWAkITHQJAgQIECBAgAABAgQIECBAgIDARB8gQIAAAQIECBAgQIAAAQIECFwWMMJEDyFAgAABAgQIECBAgAABAgQIrAQEJroEAQIECBAgQIAAAQIECBAgQEBgog8QIECAAAECBAgQIECAAAECBC4LGGGihxAgQIAAAQIECBAgQIAAAQIEVgICE12CAAECBAgQIECAAAECBAgQICAw0QcIECBAgAABAgQIECBAgAABApcFjDDRQwgQIECAAAECBAgQIECAAAECKwGBiS5BgAABAgQIECBAgAABAgQIEBCY6AMECBAgQIAAAQIECBAgQIAAgcsCRpjoIQQIECBAgAABAgQIECBAgACBlYDARJcgQIAAAQIECBAgQIAAAQIECAhM9AECBAgQIECAAAECBAgQIECAwGUBI0z0EAIECBAgQIAAAQIECBAgQIDASkBgoksQIECAAAECBAgQIECAAAECBAQm+gABAgQIECBAgAABAgQIECBA4LKAESZ6CAECBAgQIECAAAECBAgQIEBgJSAw0SUIECBAgAABAgQIECBAgAABAgITfYAAAQIECBAgQIAAAQIECBAgcFnACBM9hAABAgQIECBAgAABAgQIECCwEhCY6BIECBAgQIAAAQIECBAgQIAAAYGJPkCAAAECBAgQIECAAAECBAgQuCxghIkeQoAAAQIECBAgQIAAAQIECBBYCQhMdAkCBAgQIECAAAECBAgQIECAgMBEHyBAgAABAgQIECBAgAABAgQIXBYwwkQPIUCAAAECBAgQIECAAAECBAisBAQmugQBAgQIECBAgAABAgQIECBAQGCiDxAgQIAAAQIECBAgQIAAAQIELgsYYaKHECBAgAABAgQIECBAgAABAgRWAgITXYIAAQIECBAgQIAAAQIECBAgIDDRBwgQIECAAAECBAgQIECAAAEClwWMMNFDCBAgQIAAAQIECBAgQIAAAQIrAYGJLkGAAAECBAgQIECAAAECBAgQEJjoAwQIECBAgAABAgQIECBAgACBywJGmOghBAgQIECAAAECBAgQIECAAIGVgMBElyBAgAABAgQIECBAgAABAgQICEz0AQIECBAgQIAAAQIECBAgQIDAZQEjTPQQAgQIECBAgAABAgQIECBAgMBKQGCiSxAgQIAAAQIECBAgQIAAAQIEBCb6AAECBAgQIECAAAECBAgQIEDgsoARJnoIAQIECBAgQIAAAQIECBAgQGAlIDDRJQgQIECAAAECBAgQIECAAAECAhN9gAABAgQIECBAgAABAgQIECBwWcAIEz2EAAECBAgQIECAAAECBAgQILASEJjoEgQIECBAgAABAgQIECBAgAABgYk+QIAAAQIECBAgQIAAAQIECBC4LGCEiR5CgAABAgQIECBAgAABAgQIEFgJCEx0CQIECBAgQIAAAQIECBAgQICAwEQfIECAAAECBAgQIECAAAECBAhcFjDCRA8hQIAAAQIECBAgQIAAAQIECKwEBCa6BAECBAgQIECAAAECBAgQIEBAYKIPECBAgAABAgQIECBAgAABAgQuCxhhoocQIECAAAECBAgQIECAAAECBFYCAhNdggABAgQIECBAgAABAgQIECAgMNEHCBAgQIAAAQIECBAgQIAAAQKXBYww0UMIECBAgAABAgQIECBAgAABAisBgYkuQYAAAQIECBAgQIAAAQIECBAQmOgDBAgQIECAAAEC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UCXhSb7/ajIP1e0UEJh0QjmMAAECBAgQIECAAAECBAgQmEdAYDJPW6spAQIECBAgQIAAAQIECBAg0CkgMOmEchgBAgQIECBAgAABAgQIECAwj4DAZJ62VlMCBAgQIECAAAECBAgQIECgU0Bg0gnlMAIECBAgQIAAAQIECBAgQGAeAYHJPG2tpgQIECBAgAABAgQIECBAgECngMCkE8phBAgQIECAAAECBAgQIECAwDwCApN52lpNCRAgQIAAAQIECBAgQIAAgU4BgUknlMMIECBAgAABAgQIECBAgACBeQQEJvO0tZoSIECAAAECBAgQIECAAAECnQICk04ohxEgQIAAAQIECBAgQIAAAQLzCAhM5mlrNSVAgAABAgQIECBAgAABAgQ6BQQmnVAOI0CAAAECBAgQIECAAAECBOYREJjM09ZqSoAAAQIECBAgQIAAAQIECHQKCEw6oRxGgAABAgQIECBAgAABAgQIzCMgMJmnrdWUAAECBAgQIECAAAECBAgQ6BQQmHRCOYwAAQIECBAgQIAAAQIECBCYR0BgMk9bqykBAgQIECBAgAABAgQIECDQKSAw6YRyGAECBAgQIECAAAECBAgQIDCPgMBknrZWUwIECBAgQIAAAQIECBAgQKBTQGDSCeUwAgQIECBAgAABAgQIECBAYB4Bgck8ba2mBAgQIECAAAECBAgQIECAQKeAwKQTymEECBAgQIAAAQIECBAgQIDAPAICk3naWk0JECBAgAABAgQIECBAgACBTgGBSSeUwwgQIECAAAECBAgQIECAAIF5BAQm87S1mhIgQIAAAQIECBAgQIAAAQKdAgKTTiiHESBAgAABAgQIECBAgAABAvMICEzmaWs1JUCAAAECBAgQIECAAAECBDoFBCadUA4jQIAAAQIECBAgQIAAAQIE5hEQmMzT1mpKgAABAgQIECBAgAABAgQIdAoITDqhHEaAAAECBAgQIECAAAECBAjMIyAwmaet1ZQAAQIECBAgQIAAAQIECBDoFBCYdEI5jAABAgQIECBAgAABAgQIEJhHQGAyT1urKQECBAgQIECAAAECBAgQINApIDDphHIYAQIECBAgQIAAAQIECBAgMI+AwGSetlZTAgQIECBAgAABAgQIECBAoFNAYNIJ5TACBAgQIECAAAECBAgQIEBgHgGByTxtraYECBAgQIAAAQIECBAgQIBAp4DApBPKYQQIECBAgAABAgQIECBAgMA8AgKTedpaTQkQIECAAAECBAgQIECAAIFOAYFJJ5TDCBAgQIAAAQIECBAgQIAAgXkEBCbztLWaEiBAgAABAgQIECBAgAABAp0CApNOKIcRIECAAAECBAgQIECAAAEC8wgITOZpazUlQIAAAQIECBAgQIAAAQIEOgUEJp1QDiNAgAABAgQIECBAgAABAgTmERCYzNPWakqAAAECBAgQIECAAAECBAh0CghMOqEcRoAAAQIECBAgQIAAAQIECMwjIDCZp63VlAABAgQIECBAgAABAgQIEOgUEJh0QjmMAAECBAgQIECAAAECBAgQmEdAYDJPW6spAQIECBAgQIAAAQIECBAg0CkgMOmEchgBAgQIECBAgAABAgQIECAwj4DAZJ62VlMCBAgQIECAAAECBAgQIECgU0Bg0gnlMAIECBAgQIAAAQIECBAgQGAeAYHJPG2tpgQIECBAgAABAgQIECBAgECngMCkE8phBAgQIECAAAECBAgQIECAwDwCApN52lpNCRAgQIAAAQIECBAgQIAAgU4BgUknlMMIECBAgAABAgQIECBAgACBeQQEJvO0tZoSIECAAAECBAgQIECAAAECnQICk04ohxEgQIAAAQIECBAgQIAAAQLzCAhM5mlrNSVAgAABAgQIECBAgAABAgQ6BQQmnVAOI0CAAAECBAgQIECAAAECBOYREJjM09ZqSoAAAQIECBAgQIAAAQIECHQKCEw6oRxGgAABAgQIECBAgAABAgQIzCMgMJmnrdWUAAECBAgQIECAAAECBAgQ6BQQmHRCOYwAAQIECBAgQIAAAQIECBCYR0BgMk9bqykBAgQIECBAgAABAgQIECDQKSAw6YRyGAECBAgQIECAAAECBAgQIDCPgMBknrZWUwIECBAgQIAAAQIECBAgQKBTQGDSCeUwAgQIECBAgAABAgQIECBAYB4Bgck8ba2mBAgQIECAAAECBAgQIECAQKeAwKQTymEECBAgQIAAAQIECBAgQIDAPAICk3naWk0JECBAgAABAgQIECBAgACBTgGBSSeUwwgQIECAAAECBAgQIECAAIF5BAQm87S1mhIgQIAAAQIECBAgQIAAAQKdAgKTTiiHESBAgAABAgQIECBAgAABAvMICEzmaWs1JUCAAAECBAgQIECAAAECBDoFBCadUA4jQIAAAQIECBAgQIAAAQIE5hEQmMzT1mpKgAABAgQIECBAgAABAgQIdAoITDqhHEaAAAECBAgQIECAAAECBAjMIyAwmaet1ZQAAQIECBAgQIAAAQIECBDoFBCYdEI5jAABAgQIECBAgAABAgQIEJhHQGAyT1urKQECBAgQIECAAAECBAgQINApIDDphHIYAQIECBAgQIAAAQIECBAgMI+AwGSetlZTAgQIECBAgAABAgQIECBAoFNAYNIJ5TACBAgQIECAAAECBAgQIEBgHgGByTxtraYECBAgQIAAAQIECBAgQIBAp4DApBPKYQQIECBAgAABAgQIECBAgMA8AgKTedpaTQkQIECAAAECBAgQIECAAIFOAYFJJ5TDCBAgQIAAAQIECBAgQIAAgXkEBCbztLWaEiBAgAABAgQIECBAgAABAp0CApNOKIcRIECAAAECBAgQIECAAAEC8wgITOZpazUlQIAAAQIECBAgQIAAAQIEOgUEJp1QDiNAgAABAgQIECBAgAABAgTmERCYzNPWakqAAAECBAgQIECAAAECBAh0CghMOqEcRoAAAQIECBAgQIAAAQIECMwjIDCZp63VlAABAgQIECBAgAABAgQIEOgUEJh0QjmMAAECBAgQIECAAAECBAgQmEdAYDJPW6spAQIECBAgQIAAAQIECBAg0CkgMOmEchgBAgQIECBAgAABAgQIECAwj4DAZJ62VlMCBAgQIECAAAECBAgQIECgU0Bg0gnlMAIECBAgQIAAAQIECBAgQGAeAYHJPG2tpgQIECBAgAABAgQIECBAgECngMCkE8phBAgQIECAAAECBAgQIECAwDwCApN52lpNCRAgQIAAAQIECBAgQIAAgU4BgUknlMMIECBAgAABAgQIECBAgACBeQQEJvO0tZoSIECAAAECBAgQIECAAAECnQICk04ohxEgQIAAAQIECBAgQIAAAQLzCAhM5mlrNSVAgAABAgQIECBAgAABAgQ6BQQmnVAOI0CAAAECBAgQIECAAAECBOYREJjM09ZqSoAAAQIECBAgQIAAAQIECHQKCEw6oRxGgAABAgQIECBAgAABAgQIzCMgMJmnrdWUAAECBAgQIECAAAECBAgQ6BQQmHRCOYwAAQIECBAgQIAAAQIECBCYR0BgMk9bqykBAgQIECBAgAABAgQIECDQKSAw6YRyGAECBAgQIECAAAECBAgQIDCPgMBknrZWUwIECBAgQIAAAQIECBAgQKBTQGDSCeUwAgQIECBAgAABAgQIECBAYB4Bgck8ba2mBAgQIECAAAECBAgQIECAQKeAwKQTymEECBAgQIAAAQIECBAgQIDAPAICk3naWk0JECBAgAABAgQIECBAgACBTgGBSSeUwwgQIECAAAECBAgQIECAAIF5BAQm87S1mhIgQIAAAQIECBAgQIAAAQKdAv8fgxqUbcdSwkMAAAAASUVORK5CYII=', '425412541', 'sdvfbge', 0, 0, 1, 'Facebook Page', 'Acer Nitro 5 AN515-55', 'Black/Red, W/ Crack on Top Right, W/ Chargers', 'LCD Replacement History, Detailed cleaning by client.', 4, 'On-going Warranty', '', 1, '2024-05-15 09:57:51', '2024-06-04 00:03:09');
INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`, `cid_signature`, `cid_client_contact`, `cid_client_email`, `cid_platinum`, `cid_platinum_number`, `cid_representative`, `cid_advertisement`, `cid_unit_details`, `cid_remarks`, `cid_unit_history`, `cid_device_id`, `cid_status`, `cid_type`, `isDeleted`, `cid_created`, `cid_updated`) VALUES
(4, '052024-3', 'Fhranz Joseph A. Benosa', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABEwAAAH0CAYAAAAnoLgFAAAAAXNSR0IArs4c6QAAIABJREFUeF7svX/IblmV57cmOGCDQgkOVE9sqoWWKEmgChJQYlMWoZOWELBBE2UIZTGGYf4IqYKStmGG6SIDM6JgNWRIYEasYhIsUFDIQAtJsAoFDRmwYAJjiFAWLShMgQXtoGQk5v1aZ1nr7nue5zk/9j5n//gcuLz33vecffb+rH3O2fu711r7rxgHBCAAAQhAAAIQgAAE+iTwQTP71tS0n5nZ2/tsJq2CAAQgAIESBP5KiUIpEwIQgAAEIAABCEAAApUQ+NVUjxfN7LFK6kQ1IAABCECgAQIIJg0YiSpCAAIQgAAEIAABCGwi8Ltm9sp05XNm9sSmUrgIAhCAAASGJIBgMqTZaTQEIAABCEAAAhAYgkAUTPAwGcLkNBICEIBAPgIIJvlYUhIEIAABCEAAAhCAQF0EEEzqsge1gQAEINAUAQSTpsxFZSEAAQhAAAIQgAAEVhD4kJl9czqfkJwV4DgVAhCAAATMEEzoBRCAAAQgAAEIQAACvRJAMOnVsrQLAhCAwAEEEEwOgMwtIAABCEAAAhCAAAROIRAFkz81s2dOqQU3hQAEIACBJgkgmDRpNioNAQhAAAIQgAAEILCAwCfN7EvTeQgmC4BxCgQgAAEIvEkAwYTeAAEIQAACEIAABCDQKwEEk14tS7sgAAEIHEAAweQAyNwCAhCAAAQgAAEIQOAUAn/v7q7yLNGBh8kpJuCmEIAABNolgGDSru2oOQQgAAEIQAACEIDAdQIIJvQQCEAAAhDYTADBZDM6LoQABCAAAQhAAAIQqJwAgknlBqJ6EIAABGomgGBSs3WoGwQgAAEIQAACEIDAHgIIJnvocS0EIACBwQkgmAzeAWg+BCAAAQhAAAIQ6JhAFEyeMLPnOm4rTYMABCAAgcwEEEwyA6U4CEAAAhCAAAQgAIFqCGhLYe2Uo4Okr9WYhYpAAAIQaIMAgkkbdqKWEIAABCAAAQhAAALrCUTBBA+T9fy4AgIQgMDQBBBMhjY/jYcABCAAAQhAAAJdE/immX1oaiGCSdempnEQgAAE8hNAMMnPlBIhAAEIQAACEIAABOoggGBShx2oBQQgAIEmCSCYNGk2Kg0BCEAAAhCAAAQgsIBAFEweu/M2eXHBNZwCAQhAAAIQ+DUBBBM6AgQgAAEIQAACEIBArwReudsZ53enxiGY9Gpl2gUBCECgEAEEk0JgKRYCEIAABCAAAQhA4HQCCCanm4AKQAACEGiXAIJJu7aj5hCAAAQgAAEIQAAC1wkgmNBDIAABCEBgMwEEk83ouBACEIAABCAAAQhAoHICvwr1IySncmNRPQhAAAK1EUAwqc0i1AcCEIAABCAAAQhAIBeBKJi828x+mKtgyoEABCAAgf4JIJj0b2NaCAEIQAACEIAABEYl8GMze3BqPILJqL2AdkMAAhDYSADBZCM4LoMABCAAAQhAAAIQqJ4AITnVm4gKQgACEKiXAIJJvbahZhCAAAQgAAEIQAAC+wgQkrOPH1dDAAIQGJoAgsnQ5qfxEIAABCAAAQhAoGsCeJh0bV4aBwEIQKAsAQSTsnwpHQIQgAAEIAABCEDgHAK/a2baVtgPcpicYwfuCgEIQKBZAggmzZqOikNgCALfM7P3mtkTdz9fGKLFNBICEIAABHISwMMkJ03KggAEIDAYAQSTwQxOcyHQEIGPm9mXp/r+wMze01DdqSoEIAABCJxPAA+T821ADSAAAQg0TQDBpGnzUXkIdE3gC2b25NTCz5rZZ7puLY2DAAQgAIESBEj6WoIqZUIAAhAYhACCySCGppkQaIxAXBX8oZkp7pwDAhCAAAQgsJYAgslaYpwPAQhAAAK/IYBgQmeAAARqJPD37ir1p1PF9POZGitJnSAAAQhAoGoChORUbR4qBwEIQKB+Aggm9duIGkJgRALa1UADXR3sajBiD6DNEIAABPYTQDDZz5ASIAABCAxNAMFkaPPTeAhUSYBwnCrNQqUgAAEINEcAwaQ5k1FhCEAAAnURQDCpyx7UBgIQMCMch14AAQhAAAK5CJDDJBdJyoEABCAwIAEEkwGNTpMhUDEBvEsqNg5VgwAEINAYATxMGjMY1YUABCBQGwEEk9osQn0gMDYBvEvGtj+thwAEIJCTAIJJTpqUFQmob33JzB4ws//GzL4NHghAoE8CCCZ92pVWQaBVAiR7bdVy1BsCEIBAfQQQTOqzSS81igs8r5vZI2b2w14aRzsgAIE3CSCY0BsgAIFaCBCOU4slqAcEIACBPgikggnj3j7senYr0n7l9WFXv7Mtw/0hUIAAH44CUCkSAhDYRECurZ+crvxTM3tmUylcBAEIQAACEHiDAIIJPaEEgThe+aWZvWW6yRN3fe65EjekTAhA4DwCCCbnsefOEIDAmwTwLqE3QAACEIBAbgIfMrNvhkIZ9+YmPF55qQinBR4t9uj/JZZINOGAAAQ6IsCHoyNj0hQINEyAZK8NG4+qQwACEKiUAIJJpYbZWK2Pm9n/MOUKUc6QMw4JcOpXOpSzRGE47nHyopk9dkaluCcEIFCOAIJJObaUDAEILCNAUr5lnDgLAhCAAATWEYiCiU9u15XA2TUR+LGZPThV6BNm9sLBlUsFOA8fjv9PHpODjcLtIFCaAIJJacKUDwEI3CIQvUsY0N6ixe8hAAEIQGApAQSTpaTqP09hL/Lk0KG8IX/1hCrHnfzieCUu/CCYnGAYbgmBkgQQTErSpWwIQGAJgTgAIWHaEmKcAwEIQAACSwggmCyhVP85qSeqwl4U/nLkERd3dN80Of1PzewB8pgcaRLuBYFjCCCYHMOZu0AAAvMEGMzSMyAAAQhAoBSB6JVAfolSlMuXG8WKM+yYCjZz3rB/bmZ/OAk55DEp3ye4AwQOI4BgchhqbgQBCMwQiN4lbCVMF4EABCAAgZwEomBCyGdOsseVVUOes9S7ZM7DhTwmx/UJ7gSBQwkgmByKm5tBAAKBQDoI4n1E94AABCAAgZwE8DDJSfOcsnwHGt39rIWVX4WmX9s62BeByGNyTl/hrhAoQoAJShGsFAoBCCwgwFbCCyBxCgQgAAEIbCaAYLIZXRUXxoWVszyEYh8SlGtiiG85TD62KroPlYBAHgIIJnk4UgoEILCOQA0J3NbVmLMhAAEIQKA1AnGye80zoLV2jVJfFyDU3rO8S9Z4uPi5CCaj9FDaOQQBBJMhzEwjIVAdAbYSrs4kVAgCEIBAdwQQTNo1aQ3eJWvzp3hIDvOrdvsdNYfAfQR4oOkUEIDAGQRiPPBZq0ZntJt7QgACEIDAcQSiOI+HyXHcc9yphqTwaxZ3XFw5K3QoB3PKgAAEZgggmNAtIACBowlE91bdm/fQ0RbgfhCAAATGIECurDbtXIN3icitCcfxvkY4Tpt9jlpD4CIBJip0DghA4GgCPzWzB6abft3M/ujoCnA/CEAAAhAYggCCSZtmriF3ichFb9hbO9/oXLxL2uxv1BoCVwkgmNBBIACBIwmk8cCfMLMXjqwA94IABCAAgWEIRMGElf82zF6Ld8maevi5hBi30ceoJQRWEUAwWYWLkyEAgZ0E1sQD77wVl0MAAhCAwOAEEEza6wBrwmBKtm6Nd9K/vFv8ea+ZPWZmL5asFGVDAALHE0AwOZ45d4TAqARS7xJWYkbtCbQbAhCAwDEE4qSXyewxzPfcZY1Xx577LLk2hgVd6zt+3rNm9tSSgjkHAhBoiwCCSVv2orYQaJkA3iUtW4+6QwACEGiPQPRWuJWDor3W9VfjNV4dJVu/VLjx/iWvEokqHBCAQIcEEEw6NCpNgkClBNhKuFLDUC0IQAACnRKIE3AEk7qNvFSkOKIVS4QbPwex5AiLcA8InEgAweRE+NwaAgMR+OS0PZ83mYHrQManqRCAAAROIhA9TBjznmSEhbddIlIsLGr3abHfzIXjfMjMFIrDrji7UVMABOonwMejfhtRQwj0QCDGAjPA6MGitAECEIBA/QQQTOq3kWpYk3eJ6uMesT8zs7cnCGNdyYvTRv+ilhDYRQDBZBc+LoYABBYQSJO9srXjAmicAgEIQAACuwm4YIJQvxtl0QJq8i6JY5afmNlvh5YjlhTtBhQOgToJIJjUaRdqBYGeCJDstSdr0hYIQAAC7RBAMKnfVrV5l1wTb9xbll3+6u9X1BAC2QggmGRDSUEQgMAMAbYSpltAAAIQgMBZBNjF5Czyy+9bk3eJav3KFCKkv8d5koslJHldblvOhEAXBBBMujAjjYBAtQTiQCgdfFRbaSoGAQhAAAJdEEAwqduMtXmXXKoP/ajufkTtIFCUAIJJUbwUDoHhCcSVGlxYh+8OAIAABCBwKAGf6D5nZsqfxVEXgZiU91kze+rk6s15uxDWdbJRuD0EziaAYHK2Bbg/BPol4NvueQvZSrhfW9MyCEAAAjUSIOdEjVZ5s06+qPKamf21Cqoad/TTDjgSUDSWIWlwBcahChA4iwCCyVnkuS8E+icQV44YbPRvb1oIAQhAoDYCCCa1WeTN+sTwlxo8UGN9fmRmP5jEEnKW1NuHqBkEDiGAYHIIZm4CgeEIsJXwcCanwRCAAASqI+DCfQ0T8urgnFyhGP6icCmFTZ15pDnXVBdCuc60CPeGQCUEEEwqMQTVgEBnBNhKuDOD0hwIQAACDRJwwaSGCXmD+IpW+VdT6bV4oEavWFVNITnyLuGAAAQGJ4BgMngHoPkQKECArYQLQKVICEAAAhBYTcAnwUx+V6MrekFt4Tgx59ovzewPEEuK2p/CIdAUAQSTpsxFZSHQBAG8S5owE5WEAAQg0D0BBJM6TRy9Oc5OCJ96lhC+VWefoVYQOI0Agslp6LkxBLol4G62aiADj27NTMMgAAEIVE/Ak76ePSmvHtSBFYzeJWeG48irRGKJ6qN66KcOwrcO7AzcCgItEEAwacFK1BEC7RBIk6bxjmnHdtQUAhCAQG8E3HsAwaQey8ZxwlmLKt8zs4cnJKqD/ug4U8Cpx0LUBAIQuIcAkxk6BAQgkJPAK2GV5qyBUM72UBYEIAABCLRLAMGkPtv5OOEMcUJeJRJs9PNlM/ujCY/qpIMthOvrL9QIAqcTQDA53QRUAALdEEiTvbKi141paQgEIACBJgl4SA7j3TrMd2ay10ueLTV4vNRhHWoBAQjMEuADQseAAARyEYiJ01ilyUWVciAAAQhAYCsBfZfkTSABn+N8Amcke5VI4/1AXi3KURK3C65te+PzrUQNIACBewggmNAhIACBHATwLslBkTIgAAEIQCAnAXmY6PuEYJKT6vWyxPvx6ZRXp58SKh40sy+Hfx9hk7hd8HOTWBJrf6bHy3EW4U4QgMAuAggmu/BxMQQgMBFgK2G6AgQgAAEI1EYAD5NjLOIiiSdPvXXXI3ai8XAs1eWxxKvE6xfHLkfU6RYXfg8BCFRIAMGkQqNQJQg0RgDvksYMRnUhAAEIDELAt43VhJkjL4E5kUSeJPqjkBd5lzwaEsHL20PHvzazt+Wtyj2lxe2CVY9nLogluohwnIKGoGgI9EIAwaQXS9IOCJxHAO+S89hzZwhAAAIQuEwAwSRv77gkkijc5aUrwsTTZva5qSrPmtlTeav1m9LWJHAlHKeQESgWAr0RQDDpzaK0BwLHEki9Sy65vR5bK+4GAQhAAAIQMFNYxuth+1iYrCfgIolED/cMkeeG/lwTSeKdfjzlMJEt3rG+CjeviNsFzyV2nSuAcJybWDkBAhAQAQQT+gEEILCHQBxwsDPOepI+EP3k5DasVToOCEAAAhDIQ0CCiYdl5ClxjFLmPEleM7N/dpdA9/krniRzdD4ekr2W8C5Z41US6/fKFC4kgeWIBLRj9BxaCYEOCSCYdGhUmgSBAwl4/K9uqQGHBh4ctwnEweiPzOxdV5LS3S6NMyAAgdYJaIU8bnXaentqqb9CcvRdUh4LjusE1AeVcyQmbhW7W+E210qNYkbucYIWGlS+vqdLvUq8roTj8DRAAAKLCSCYLEbFiRCAQEIA75J1XSJ6k/gAzwfxYskK1zqenA2BXghoUq/JnyaqTOzzWhUPk+s8r+UkkSfJ1kUQlavvmvq1H1oc+J0M5o3hNypuy3MTxy+EEmcwCkVAoGcCCCY9W5e2QaAsAXdn1V3wLrmXtQ9C9VN/NMDznQPS1U4N3PR7dnEo218pHQK1EiCXQjnL6DslDwmEqHsZu5ih75MO9yTZI5L4HVSmhCov2/9/i7ARa63yfJto/b/bdYuo41sOE45T7tmjZAh0QwDBpBtT0hAIHEoAd9Z53L7yJT4azGlbRRdKLhmIFdBDuy43g0CVBKJoggCdz0S8X99kmXqT5BRJ/C7yKJGo4Yfu4R6Ve7wo3QtL5d7aKvhW72H8cosQv4cABO4hgGBCh4AABLYQiIMXBvdvDAjFRAO5tSt0ygOzd+Vtiw25BgIQqIuAiyaaZMrjbMvKeV0tOr828jCRd8nICbUvCSU5vW5S7w9ZXszdw3LrNy6nUOK9kXCc859LagCBpgggmDRlLioLgSoIsDrzphk8Tls/n9g4wZFgomtHHtBX0bGpBAQqIOChjlsnmBU0oaoq6P36fTP77IDv2DmhpIR4JM/KL0/bBrvxvf96Yvi1eULSHGmqd66kyC7CEI5T1aNKZSBQLwEEk3ptQ80gUCuBOJAZ+R0i1+PHp9XLPQM5VkBr7enUCwLHE4j5H/De28/fJ+wjCVBzQkkpj6V0FxxZzBcAfHFlqTCh8/9bM3tyMrvn+8q9mDBin9j/JFECBAYmMPJkZ2Cz03QIbCaAd8kbLsYaJObaqpKQnM3dkQsh0CUBn4SONMkvZUifHI/gxZfuTLMnKeoSe3jiVD/3NTP7D4On5dLdn1KB53Uze6qQR1AcwyBILrEy50AAAoZgQieAAATWEIgx9nsSuK25Z03nqv0efpOjXj54Y2KUgyZlQKAfAh6aw6Run023hoTsu+uxV6c73nzRzP7+xhDRJTWfy1cyl3fnx1OYzu+b2bdnCk4FHk9CmzO3Snrb0ccwS+zLORCAQEIAwYQuAQEIrCEwqiurr4Bp15uc7sE+eONdvKYXci4E+ieAl8l+G0dvgrU5NPbfvXwJUSg5QmxQi5SvRJ4l8VBIqvjG41o4zpxQUiK3ypwFyBFUvl9yBwh0R4BBencmpUEQKEZg1JUZDRAfnXKV5ITrA0oJMHIX54AABCAQCWhyp6NU/oneaUfBpJfx7hE73lzqF3P5Si55R86F46SeKaVylFyqf+8CWu/PM+2DwGkEevmAnAaQG0NgIAIjrswosetDBcQSdRuP/8blfqCHiKZCYAUBvExWwJo5tTfBJAoWR4sNab4SF/LmEp6n3iVnhN7M9Rz3jlmahHZf7+NqCECgGwIIJt2YkoZAoCiBtdnui1bmgMJ9gCc3YQ2uch8+cCN3SW6ylAeBfgj4jjk+OS3xLuqH1v0t6WWCnG6xu3UL+y22FkPdXz/9kEhybZtfr++zZvbA3TdUCw86jgobutTOXgRIteOljNssb+kXXAOBoQggmAxlbhoLgc0Elma733yDii7UJEWDw5y5SmLzyNJfkbGpCgQqJ9DLJO8MzJqo69s1l2PjjPqsvae+Q6q/vhkSGySU7NnCfu3950JwloSQeq4zv9/ZQonXo4cEwD4W+6WZ/U+E867t0pwPgW0EEEy2ceMqCIxEYATvEo8L12rYnxXyKvE+M5L4NNJzQlshUIoAO+ZsI/u0mX1uEr9byhMVc32cIZTM7YIjC9xKnKvr/qmZfXAyVy1CiarTwzhmLizq6NCsbU8iV0GgcQIIJo0bkOpD4AACvsp0a7B0QFWy38KFEhX8fGGhRPfwFU9iqLObkgIh0C2B+N4gAexyM7coTkevjjNCNi/tgnMtBEf9U/XW99SP2rx6/Bk6g+nyHjt/5iUBK57d4/hsLzeuh0A2Aggm2VBSEAS6JNDDqsycYTR40s43Ei6OEEpUBzL0d/mI0CgIHELAJ9JP3eWFUG4IjtsEvmdmD09hC6VCLG/XYtkZcVIsseHIPCX+fZLAFHOV6P8vCQzpbj0690dm9q7pu6pk5jUdLS/8pJ4lHpr1+GQfcWYRpqbeRl26I4Bg0p1JaRAEshJoeZBxSSjRIMOT1mWFdaMwH/QsiQE/sl7cCwIQaIPAX5jZD6bQiDZqfG4tfzolHa19JzL/zp4RfiMLzeUquVSXOaHEw0K0o5wElhq9OJS/pEVRwb2k/EmSWBLFP/ec0e/xMjn3fcPdOyaAYNKxcWkaBDIQUOy8jtpWi9Y2zbP8nyGUqK6E4qy1GOdDAAIpAZ881S4A1GI5T/JZ61g3JnU9Q2SY2wFHtkvr4iKJvmMx7EbnRQ/NWnm7d2eLixUxge6cIBI9V2sLg6rlPUA9ILCbQK0fkd0NowAIQGA3AQ2OvmBmf9vMXthd2vEFxEGeBkqKwT7jiAOadHXojPpwTwhAoE0Cnl+ixYnf0cT9vfv6XSLvdxx98xv3i14aZ3mVzCUQTfvVJW+Sue+pe6nUOGlvNX9J9C659sz7eS160FT2aFIdCMwTQDChZ0AAApcIaEClQ6saLR1RKJFIcnbsug9Mz1hBbMlu1BUCELhNgB1zbjPSGT6Br01c8p17VMczvgkxhMNJipE8RSR2XPImeXnaQe7S99T7ZY2LAt4XWpvzOFMfh13aUjouynzazD6/7BHhLAhAYCmB1l4eS9vFeRCAwD4CPqhqKSY2DvQ8Kdo+Cvuv9hVhVn72s6QECIxIwIVrTwLa6mr50bb7jpm938xqSZIbw1/OSOo6F34zJ5RIxPHDtwW+lRi99uTwfznl/nnk6E64436psHVrvubiys/M7N8/YMe/HU3jUgi0R+DWA9hei6gxBCCQg4AG6e4qnKO8kmXU5lHibdUA9WtT0sEaV91K2oSyIQCB/QT0/vjIVMwX73Yh+dT0d02O9H5uzftvP5HlJdSSTyPufnNW+E2aONRzeblHiTwwNEFPhZKlYazuwXGGx8ytHuFiTo11u1b3peE4XsbZnku37MDvIdA0AQSTps1H5SFQhEAr3iW1CiVuFF/xiROdIgajUAhAoEsCcRL0WTP7zNTKHpO/xmSiEhb2HDFE4cxxbtx95gzRPPVSSD1K5oSStWGstXuXtBqO82/M7C3TQ7C07/iYw8XUvc/RnmeQayHQFYEzPyRdgaQxEOiIQO3eJbULJeoKcaDMjhYdPRw0ZXgCPrE/YjIS3yNxhdxD/VpbNZ/rPD5pT3dfWerdcKlMsTkr4Wvc/eaMHCpiKe+khyc4SzxKtoax1uxdouZrPCMeLe30tzYcx5+BswW64T8OAOiXAIJJv7alZRDYQqBm75Iac5TMMY6rmz1MaLb0I66BQI8EtGvYk1PDjhBCLwkmqkLrYTl6T/pkNu0rz065R7b2IV9p/66ZfWBrIRuv8yTfUaTYWNTqy1Lx6dtm9neTZK5pjpKtQolXrpbQp2vf4ta+wzEcZ23+s+hl0pJItLqzcwEEjiSAYHIkbe4FgfoJ6GPrCelqqW0rQonz8gHz2oFOLbypBwSWENAq+qPT7hpHeFssqVOpc+Z2FjlaMEk9FVoLy/H3uH6m+TLkTaL2+LGHrQvWSn75VTOTIHDE4V4/utfSEIpc9UqFkpgr5dLWwGtDb+bqWrt3iddvT3/KZaOl5cQFF12zVuyJImtLSfuX8uE8CJxCAMHkFOzcFAJVEvBJQS2DixZCb1JDnjlorrJTUaluCfx0gITGMbQiGvIbZvbhAyzr4qtupcn/x8I9a3tfz+G4tEWtzv2Jmf3JtO17nOTtFZqveeWUMln0KjkqEe+cECJRTUKIGF4SSvycHCxq3+K6xXCcvc9CFFzOCAfL0a8oAwLVEUAwqc4kVAgCpxGoybtEkwENHHIO7o4A6wNIeekcNXA+ol3cAwKRwNGhKUfTn9uCNdZh7arv1vr7+8QFht+eEUyO9ma41ZZLIolvUfvS5MUYy4nt3NuenGXdamsU1PbW+9a9/PdzQoj6o2/9e4RQorrUnuxVdVS40FHP6lL73Tov9t+tdY9l1LIAdqvd/B4CVRNAMKnaPFQOAocRqMV1teVkhrjCHtZdudGJBKIX1ctm9siJdSlx69g+L18TF030tWKt46jJsXvx6J5pAlOv51F1ucV6bqIu4dhzeVy6Pq6I7/Uu8bJ+ZGbvmkRr3b/E4fyP2io45esClCfHPUoocZYeElZr2Ifbp9b6zfXJNBxna90Zi5R44ilzaAIIJkObn8ZD4DcEtBJzpvumr+jeGlzXajISvdZqGeqVm8B3zOz9U6G9rV7GZItqoudz0uQ0hscc1e54T9UnjtlqEJfnvEnSifyt/pczhMbL0rdMXoql7OThUEd4Et4SSsQ3MtS/19rglo3S37fgXeJ5XVpKfLo3HMftRGjw2h7N+RC4QQDBhC4CAQic6V2igZfur8Njr1u0CIleW7QadV5LICY/3esNsPbepc9PxZK5bXxVh61u8lvqn9YpCgBnCiZ6Z8fkrT5B97CQNW31XVZ0zV6Bw9/DnzWzP04EpjV1unau26S0WLJFKFGi289P39Jc7Z0rx8cMtXg3zdWxxXCc+Czsfc8QHlzyCaDs4QggmAxnchoMgfsInDGw8MGgBv0SSkq5TR9h7rias3eQc0R9uQcEthL4iynU4WjhYGt9l16XenKkE8GzJh+p50B00T86JOdSyI1EEnl0bDlKhOO4eOMeJlvqdekaF0tKemMuEUp0juqiPuDHUd+eFrxLvI5bQ1py9pmlZaXP+t75GYs4S8lzHgQWENj7QC64BadAAAIVEzjDu8RdZTUpaVkokVnjgL/0imPF3ehq1XwCMJfssdU2jVjv3AP6WhimXhzpJCv+/ugJWA2CydwE/h9Nngx7bZgzHCeGyehdLDEhZ+Jt7welhAn3tvQtly+F1cyF36idR23tXftWwuqTLYbjRNE2Rx+L7629nltAiMTjAAAgAElEQVR7n3Ouh0DzBBBMmjchDYDALgJH5S6Jse7yKNm6IrmrsQUujoNXBiVvAn7azP7tu0SVTybMNajvyf4FulSVRabJCHMM6Gto6C3Pkug9VtKr4BKLGAKlc6LnS2kPE590yvY6cufFyOld4pNk9Uv9ERtPxpqjn3k/KRGCslQoSbe4zm2PJZxa8C5ROzSuaWkBI1ey12jD+O4o0W+X9BfOgUA3BBBMujElDYHAagI+2S/9HvCBd28TZRK93t/l5lzF5zrmT8zsEx14GK1+6Bq9QBPGB8zs4an+PYiDt8QSNdVDcc7K13LNw8QnRDknQ0futJLTu8Qnyfqp79m/MrMvmtlnMjxvpcSSOaHk0jcyFc7OEgNa8C7x73JLom6uZK+xu0ex9+tm9kcZngWKgMCwBEpPlIYFS8Mh0ACB0rlLNMjTQEArs771YQNYFleRGOF7UaUroPG3mnDqT4y514TmU4tpc+JZBGSzfxB2xjlLPMjZ/jQMZ050+ELwkDo6FMfbukQwyVG3I4UStS1dUd8rwKWeD/q25eDi/SS3KBXzj9zyukv7wJlCgLjW/vwftRCU832UM9lrrNfPzeytZvZdM/tAzgpTFgRGI4BgMprFaS8E3iDgA8ES7wAJJY9OA6sehRLxi4PYHAPz1vtlXM2KbXnWzP4sxNdrYvMv7vIfvI1BXDMm/6mZvWZmvzfV+MwJWw5oSzxLdB+fxHzDzD6c48YbyliSw2TP+ycNu1EVb03gNzTjvkty52v4lpl9MIjz8gzaK8J4HffwjQ2fC3G6lccrcvIQo7PyfrXgXeLP7VkeOFuejdyhabEO5DHZYhGugcAMgRKTJUBDAAL1EyjhXaIPvwZ4vXqUuFXjAOeMvAa19a50td4nXZcmA+R9qc2Cl+szl2BSE9FWj+8ETxm14dJkOPbpM8dJ1xLtepjG2gn9nDfJUUKJ7lMiebCHTqlvSrzVPfb001xiSczd5blgJDje2n45DW2swatDjHXs4Vr6vdF6OE5uMTqGcu0VEEvbjvIhUDWBMwcCVYOhchDomEBu7xINUOVRoqNXj5LYHQjFeYPGpXwlGtzf2rXBV+/5BtX7ovHJx8shd0nuAf2RrU/FkkthFlEQXStG5G7PtdwGPhlaOhG6JpTc8nTI1a4SyYOdg4sKe3dIySGWzO0stHQhIX2v1uAt0YoQ0Xo4ztJneenzGD0/c4aVLb0/50GgGwIMVrsxJQ2BwCICPvDJ8fH0pHW6scob4YgDkJYnj3ttdSkEZ4nHTSs7Lexl1Pr1PXmXpG259v7zCXMNE9UlgsktUacGocSfhRLJLdM8I7KfbLdFvN8rlizd8ebSu0HX/59m9s7phBr6oKqikCfV7Xcqf6m14AUTEZYMx/H7uPfVyOOVyrst1WuBAIJJC1aijhDIRyCHd8mIQoksEAc3tQxk8/WM5SXNheDo6lsTt3TSxABuOfOjz/S+rt2MHpxu3qq9UnFPeXWeugA0npt7tXeLDaPAkIqR/8TM/oaZ/YGZfXum8EtCid5dEozkkXHkkdph6fviVh3dW83ttTXcVB5I6utrvW3SsBvf7vdW2E3arnQnnFqeN38XLBHDb9mq5O9b8YKJDHLvFDXHF8GkZK+j7GEIIJgMY2oaCoHfTPj3eJfoA6/tRS9NOHrGTCjOGzlq4k43srev5i5NRphOcHruM622TXZWktd3TQ34mZm9vcHGpCEg14TOmkJxUnFR/04nrP4spuO42oQSb4tP3PTvXGKAiwxuV7fhWjFGLN+7cqvzPWE36aMU36sSKT97952VsFfDkWOR5Yh2tBiOE+1eaj7m39tcz9wRtuQeEKiOQKkHtLqGUiEIQODXO+NosrslaZvHha9dfesFe1z9WzsY74XBnFiydhDmHH9gZu/pBUxn7fBJpyahLo6ttXMtSNJdRi69+6JYskdQzt3uayvQmghFAahWoURMfBcb/T1nAlMXYdxm7sWyZmy7JgwnlzeJ95Ma85XEPtyS14bsqPpuGd/kfm6XlHeEx2qNIvASNpwDgeoIrPmoVFd5KgQBCCwm4APJtZMBTXA1aF+asG5xhRo6MQ46andLLoU1FUu2bnHpgsnafliqXZR7PwFNQt8SvEt0Rg3hKWttlfbZa0Knn1vb8/20mX1uangMJYphEsrV8fjdORK14rH1GV3L+db5aahJLsF5LnxqbcLXpWJJKkaJ9avTd/FW+6/9PvbR2vqe6u2CXe3Pf0vCjveH+FyU+h7Ge/Q+31Mf+Dtm9u+a2Qf2PJRcC4E5Ar0/QFgdAhB4g8Da1Rdf+dqaPK8n7qOH4qQ5S/bkQHCWtQ/Ae+q/a9riE6ToXZLTI2BNXfacmyZ5veYh871pF6Aa8xJ9wcyenEBEoSGGoqQhcrUIJar2mpCotfb291IUGmR38RCrW8ctsSRnyM1cXaJYUqMHVyu5S6Kw09Kcxt9RJd+vR9zj1nNW+vdznnWML0pTH7D8ll4uA5qHJkMgC4E13iWe0NUHnUcnBszS4IyFxIlXrpXRjNUrXlQ68dw7qVQYQY0rqcVBNnADnyDpmdff/Si1+lkKSZpc9Fqf9Unr983sfaUqtKPc+PzFScBceJzsJm8TPV+1HEtDotbW91KowdIdci55uvnkS31IfzyB65Ydd661Ka781/o+bMW7RJzXLgit7W8lzj8iGas/fzUKcnuZXgpB/C4eJnvRcv0cAQQT+gUE+iegj6aOW6tuo+cpSXtCHJT3OOC41fPXTDxvlaXf+yRhROFpCZ+zz/EJkiZwspWOkqufJdq71KMh5o7YKwKWaIeXGb27JJh4vaOgVWpSv7ddqdia87mPXOI4dskOOXPvIf3fo1O/P4JnTVtXz9k5iqe15wRpMRznqNwiP52S9Pc0fpnz/NIz23q+rb3vW64vTADBpDBgiofAyQSWeJeQp+R+I+mj7KtWNU+oSnWvdOKZYxVUK2oezlOq3pS7jUCcIKkEn5C3NtBOPS8ujXFqn7C6FWN7tFPR24J5f3mXa+bvT14l26xe7qr0/ZGzH8Wyo/eT//81Yca/h56Ty3O/uEjy0vSOKkfmTeFY98gpIuWss4tdtdYvtrXF3XE8N9HrZvaOnIZLyuppR7pLIXL6/1YF/oKmp+jcBBBMchOlPAjUReCad4mLAiMndL1krdHzlsRdLXIIRuQuqeu9kNbG7fMJM/vy9MvWvEuWejTUmuB1rof8ZSKSxHNyPJelemX0AMndjy5txeqeI5fGtS6WeJipvn9i+PzBYUweipFDhC5lP020c9utVF1bDMeZy7+Tm09PCV/juz16gKX51VoQ+HLbmfIOIoBgchBobgOBEwj4ADH9iLhbt8e8j56nJDXN6HlL4oQkx6TsUj884ZHgljMEfGCtCZzeBb7bSk6vgNLg0/CxubwrrYThiFW6s4z+70d3W3H/z2b22rRzTq32Sb1LciZgjHZObXxth5wPTlsbi+MRITeX+nsL29P796+F3EWth+PkfDbSPneEKFP6vR7f2elzmwrkLfTX0rwovyABBJOCcCkaAicTSL1L3KVRgzZ9XDQZ5riXwFGxxbVyj2JJjkSYPsGpdXJXqx2OrFd029bqtx8tjQ+WiHyteJbMJXT9qpl9bDKMTxRqfabiqm/uOnpfnfN+SHfIiS78vzAz/XlkEkyOfL7ivfAuyUu+xXCco3au8b7WqpAQBZH0PZIK5PH9mLeHURoEJgItDYgwGgQgsJxAuqrvq2+E31xmOHKS17iSI0I5PEucZ46ylvf8c870yZnurr+719arE8tavbji5Ft1d++S0rH1Oa0UV+3nJtKxb9ccBpE+gy9P2x27XXynllvb4eZku7as1Lsk5xgzCklzrve+Q45CbGJuEk8Ieba7fgueiy15l6hvthiO46JfbjExPqtRUMj5DK59H2w5P+aPu7RFuotBKr+V0LEtLLimIgKtPUgVoaMqEKiagHuXaJCtFT+EktvmamUF+nZL1p1RIsGravCdaVX31u5M62pb39mpa3Baw1oHdDHRq2wUvUvOnlyusbJPQHTNpfBDTSBKTlDW1Hfu3LkkqVHAiqvE3t4ax2/XVoX3MFpSrrhI6HtgmkTp26dnT+/1Gvqz71jydTP7oz0wCl7bUu6S1sNxSj6/rY5lljznqQdeDc92wUeSomshUPKBraWN1AMCoxHwFVetUGrwqA9KrSvctdjmKDfZWtrr9ViS+2FLnSWWPNh53xM7DwO4xahkrPqte1/6ffRUiO2oWVhI23JtgN2KZ0mar8QnALFt3n+iyFXbdq+lvEviOyr1Vkt3zvCFAX3vvD61eBUd4Vmw9V2g61rzLmkxHMfD1Uq+Yy9tub2nb5S+NvUquTRmTd+VJTmWbjPlN0YAwaQxg1FdCNwgoA/P98zsrWb2YfKULOovcfeE2iYhixqw8aRULMmxUuOTVFWpV88StfELZvaRhLsnpYtilBjrqC0syScbqpdW4t0jrVZvmEtd3CehcxNpTRxq9yz5ipl9dGpc6n4+t1NXzflLlqwOr31VpSKMv6OiUCJusr8mU3FMey0J7Np67D2/9txYNQtx1wTflr4zpftAmiC1lTx1LvDcSsacjldq+6bufUdwfeUEEEwqNxDVg8BCAulKW47J78JbN31a6UFMrXDSvA85Ble+SqSBT69iiew5l5Tz0uCtRs+l2Oc1Bojx4C2t2F3KCREH1jW/B2M/+sHdDjjvSV4WcwlO/Zra7BT7VE7RLTLSltf/ziSMeJ4giX3yIEnFEa9PLQkvY1+tcdzt9av5eYmPR4vhOCW/BfF7rm+R+n3tXsWxzkowrwW+a3VOv7s1em3WOt6jXhkI1PjiztAsioDAUATiarE8S7QbQM8T1pzGrTmBYs52xrLiwONSUrW19x5FLJnb7vXa5LXkIHmtjfz8OOlWUlqt8OnIOdHdWrc117mgEEMuWhBLovv5Je5RgIj9y9tc28Q2vlNyiTnpzkeyra9CK7FrnFylO+S4d1EtHoM1vgf8WWvRu6TFcBwXpnM9H26/Ep5da97Da8+NnjC6dsm7jLwlaylzfnYCCCbZkVIgBA4joAGkT3a0ouAfoiUfoMMqWfGNWovZzoEyFUtyTCi833l4R4561lpGTDCqOt5a5ToiZn0Nq3Ry1Kp3SRSu3Abx/2p9B/o7W3a4JlLNec+knkFr7F7y3FivXG7yCnl7MlT6lru+75AjjxOvz61nsySTtOxaPYNUT+9rZ/PyZ8J/+vMx53Ugni72H2nHrfeKz8gWzrpe746Hpv6tf+vPO83sbROLFnLVxfwqS3MLkbdka6/juqwEEEyy4qQwCBxCICr0cbXC8xDgXXLbDL4SvfSjfbvE+s9IV2xz9BPvi5qoaLLU85Guci1x9/9X06D203cD289XAMcFEh9c+844rXmX/OU0UfD3X1zBzxFeVsJUaQz+NcHtWv6S2mz14ynB84/M7Hd2gpNI8l+a2fuDoLRkIigh0/uCJmV6L+V4v+1szm8ud6F1yTsj1z2XlHN2aIuHEuvZ8HxPc/V20UTfmL9uZv/JXV/7opl9e+bkOYEl/t8ZoSprPIxcDHl0YnKNy2tm9s+mEJwl9j7rnCgU+8LKkvECeUvOshj3vY8AggmdAgJtEfAPb9wNQC1wFb7WldWaKPsgMddqaE1tm6tL6gKbq90jiyVLGbpgUsNzGd8dmri15srtfdvr/Usz+6shp8xSm5zxvM6JJdf6xFwy2xq9FGIf2iMKxh2n/j8z+7cmIy15bvx9HkXALav4pfrFXu+CUvVSud6njpwLuEiiMUv0JinZzrRsF03iz5dCmJf+/5qwktb7XWYmwVDH3HWXwnG8HPceuSYcxaTiWqBo5YgLDWsFw+gB6bnRzhC8WmFNPQsSOPIlWbAZFA2B7gnEnVzmVlD1YfFkX93D2NFAn+SriJpWIHc06eqlqViSy6NmJLFkLm/JkomcDBM9OpasqJXsB6pL9E6I4UWtjAWi8KAkoH9rWoXtSSyJE2z3mqh10u39e6t3iSdrVb//R2b2ufAALH3G/PlUH65pZxxvSnx/1PSc+bOUO6dG+g6TTdR/xeHaMSdSXPOuKPWujOXOTc6XiDxRiFFeOfeY8m+Ae5Hc4qHvtYScM78dWznvTURL3pKt5LmuCIGaXt5FGkihEGicwKXwm9gsvEuWG/mMFbXltct7ZpxkqeScYokGwUq82OJAbi3lNG/J0omc7uPXnr3ineZSicJD6QnTWt6Xzld/1vOrn98wsz+cTqy5/ukzqCrfWmWd21FljUt/Lt63yrm0S9Gt6/T76KIv+/3fdzvgfDlc+JSZPbukoCCS6LmUgHOL78Jis51Wo+3UOA/Hy5HH6hKspxMRLD1P349bua9cXNDP/2LaTUXlSJRYIl5kM2ThglwwusWjcDWyFB/FjjXfS795fLcseWdmqTSFQOAaAQQT+gcE6iUQd7+55g2Bd8kyG/rgbcsHfNkd6jkrDQHINYnwSWuteSJyWyAduK3tOy6YnPmtjd5pPjmKyffOFnOW2swH4T+ZcmbourX2WHqvXOelq6RLPGH8mnhujeE47l2yNqdKFL7U92LycnG/JoB5OIeLLvq3OPlPLR6UFAC29IsaBROvU2mxMQomyrfxf0322uo1ccmD6JZwsiSMQ2VEEeaaF0hansIDf2/qHMo94ofK+KCZvWUqO82l4v9uKcTm2jOQ5irZ4sWbjl1K99EtzzTXDEjgzEHcgLhpMgQWEUh3v7m2iu/eJa1MehYBKHCSf4Tlxv9CgfJrKjIdcOSaVHq/XJKEsSYee+oSY6i3eOhIMFk7odxT37lr07Cg6PVwdt2WtnVPWNTSe+Q+L4pSKnsJ61bCcWI914qxniT2B1O4wd8M4OMz5hPWW8kvJaDJ40h9pMbJVW2CidtuSX/c+0zMeUvtKTPuhrSnnKOujc9J7/Ot+L7bOuZIPfKWCMxH2ZL7DE6g9wd4cPPS/MYI+OqZBn1LB354l9w2sq9oeqLc21e0e0ZJsUSD3y0rRq3STCfpa7+XPvg7c9CXJnqVLVpL9joX1rJ1QH5UX1yb5NXrNZfvorYJt+rqk6O1k+45W3rbfxHEbJ23JH+FewToGdP5a5/RI/pDbTlMvD8d8Qxt9UKas4v3nSPqnatf1Pjs5mqblxPDxj2P3hKPnrl6lNjJL3d7KW9QAjV+XAY1Bc0enIAPqtZkAse7ZFmnGWW75VJiiQZ9KnsksSROCvX3Ld4lR7m9X3oKLq1u5pzELHsC953VYvK/tM5L+88XzExb67oQMedxso9mnqs91GypsB/vqjb9+Z048t4VVfEJmDi+OvHxUBz1Z4V7/Pd3gkmNoQ3xvXz2mPtI75IoFOUQOWpM6HurC9cYSnerzmt+nzMXVhTy1wqxa+rMuRDYRODsl/emSnMRBDoi4Oq8fq71gMC75HZH8CSRtcW13675ujPiwEWDjRw5RrxvKrmr+uZox8/NTDsc6NgS8uaD5S3X5mA9J9jEScyWyW6Oeq0pI/XyyTHxWnP/LeemdV4z+P/pXbLTB8zss2b2meANtKaMLXVec82ecJy4Gu331A47f/cuoa9CbzwXhSfAvJXrItblrOfsFrv4bj67ji7IHVGPpTnYbvHz33/nLtHzd81MCYFbOHoPx/HvW47xRjp+GSnst4W+TB0rdV/EMBAYhcCcu/zStuNdcpvUKLsHlRBLVKb6p1ZsR9gJJ+1NkenrZvaO293tnjOOXMmdq9ql+/uEfOs2sCsx7Do9Dd9oQSxRg7fuqjQXurHHk2MX/CsXx2djjU3SBMq6xV4hKHpm1iyKu1fX2nwvOW3oz9NSb6e99/awrRz387ofIfTsbbdf32s4joc462eOcNNW3/O5+gnlNEIAD5NGDEU1uyLgk1F9KLZ6AuBdcr1L+KB+zYC+xU4WJ1l7Jx9xoDdiCI63Px3AbZnknB2O46t/se6xXe7BUHOfjwl3W3mO00SvayYU6QSz1gnX2lCLOa+SHGKJynCPiS3P6JF93/vymV5dR3tbej9Z8wxcskmL4ThnfwNK9O/47Od65vZuQVyinZQJgfsIIJjQKSBwHIEtSV3naod3yXWb1ZBs84helVssGT0Ex222N/Hc2d4lc9sIq225d6wo1cfF78t3O5+8f7qBXPCfLXWzjOWmQpuKXiP0uDeJX1Ojd4natNTD5JJQojJyTKJVzvemXCi/ldGOJYr6yt2Wuh+ddvP5cIkb3CjTvxVHCjY5w6UkOK0NWT4B8z23rGFL+ZwM4nbnuTxP4zdpzbsyZ7soCwKLCCCYLMLESRDYTSBOYvbGZ+pDnMPNdXejKi1ghCSvucUS93rSqtHWDPeVdodV1cqReO7slUVfzU7d12PMea3hC94PfYeUl83skVUWPO/krYleVeM0HKdmceuWh4l+r/p7PpJoEb1bck589S3MJb6U7DlfM7OPmNn3zex9JW90oWy9E3Qc/dzn8KxpMRwnp3fNCd3lnlvqXSzvN8+zpzFCjiMKr4xncxCljKIEEEyK4qVwCPz6I6OPjT4OOVZ3fCDdUizvkd3A3dp7Xq2IA40ck4V/YmZ/UekOE0f2nVyx1D5JOOP76iEKc++aWj0W3MZzW/G28p7bW/d0Ylmzrf6hmf1xmID71r7qew9fEEp0eo7vX3wffHzyRMpdbol3zpnhVWcKuC4c7MmZRDhOiR65rEzZ7x+b2VtWesvdKj2+L88SEW/Vkd9D4B4CZwzoMAEERiEQs8TnWrnXQLqFAeIZNh4hb0lc3c0hlmhVPJd77Rk2z3nPvaE4qouLLmc9o5fcwKMYVKOYOJcQ9CyGW/pU6l2ypu6x7RKIHp/e8apHjWO0p83scxMk383GPYLm2K1hsYa9i4M19ue0HWd5DJ0dHigO/k7aKn62Go6TK6fYmmci17nqNy5USez6hJl9O1PhuRd8MlWLYiBwnUCNH2NsBoHWCbhXibswakKa4/BBF8/t/TT9I5wrEVkOe+UuI+dAw/soYskbVsoV4uQT5zMmce5d9Wkz+3zS+c6asN16BtI8Fxqcv2u6aOsE69Y9c/8+Cghe9tJ39Jxbes3eJWpfzMV1iWXu0Ju5++ydiOfuB9fKS0Wxo8Ie/b5nvI+cxx47tRiO4890KaGwdL+N7+QcizKxvjnHMKU5UD4E7iGw9KMONghAYBmB6FWiQUrOA++SeZr+Ee45DjbnQAOx5P5+FLeC3TrQdRv9wMzek/PBX1CW3/vSALfG/CVpGIvqromkxKutNliAKvsp7ungBS/dgSgNAdN47MzQjbVgUq8gbb/9k7skrC8cEN4X2bUwjj0juWUt38U0mfGaftZiOI4L1y0u3uQcZ6R2Lln2mj7FuRDYRKCFD82mhnERBA4mEL1Ktm4VfK3K/hHmmb2X0gg74uRMjuZJNXOLeQc/bllvlyPRqyrkosQZnhG37l2b10I62ZZYovemJ6ds6T2XhuMsrbt2eFHODx2eCNzb34pgpPev/sh+Rx7qP0/e/ZFIc3Qi0y3tPEMwOSvRa8pnj2DS4iKR6vwzM3v7lo5y4jWxj+Z+/yCWnGhYbp2HwNIPe567UQoE+iRwRFI1fYRbXLEoafFbq+ol731U2YglZUmnq/xbxY4zV3M9nOiS231sY+6B8BbrXMr34aJwDXVc067onbQ0b0EUS9wzriXvkjV8SpyrPvTAJJi0IP7GkL8jvuNHjEmW2tWfj7Xt9vdWS/MUr3NL3q5pWORaO93qB/H7kzvE59a9+T0EshFo6UWUrdEUBIFMBPQh8C1sS3iVeDXxLrnfYKOJJXsnkRpAi1kLk4tMj+eiYuLkfQ/jM1dzb22tGkW3M3MZpANziQv+3qwhOeWiDpOclApuSyZKc/lyahO1trA46hpnpS2nv35A+E+OdkWbL+kje+7pz/tS8W7PvZZcu1UwaTEcpyahaolt4rchvo+XXLv0nBrDQZfWnfMg8BsCCCZ0BgisJxCT3u2ZZC25sw8Oc6v+S+5d6zmjiSV7bS/BTYOhXMmHa+0Xa+uVDha3uvafmVhRg1G9I67VPU7WzhJM5vKVxITDrXqXpO26NRlOQ5Hco8m3Fa5lkrv2WTryfJ9Iq9+X/v7mateRIQlnJp6e4+V9e+13rMVwHGffwtwqFW5LLPpFscTDDnM9U0eVo/fMUUmaj2oT99lAoIWHekOzuAQCxQho4KPBvY4SH5i04rqX7rl1MlcMxEkFnxn6cFSTc3oEsG3wZav5QF5nbBUSzsyhs1SoiQPjrSFHe/q+iyFeRjrJbdW7xNsT+5H+L2Wcetb4dd7nIh9t36mkqRyXCeid9pqZfXTHc3s031zi7K161+jhsEUwaTEcR7aRyFO76Jm+j0qFyUTvza3f11v9veTvxUmhkwr9Wyv2lawXZZ9EAMHkJPDctkkCX5kGaUetauFdcm83qXEwmLsj5xJL2AnnumXiSv8tr4BrJd1Ktpq7f3h53k+WDOSiYHLkN39OKJgbODvDo96ruW2Seo38wsz+4d1k/qW7kM1H726mdqWH2y0+70tsmbvurZXn38Rnp6SvZwiAW5jlypV07d61el66YLLm+W4xHMdtvKadW/rSnmvSflhKLDkjyfEeLvHa6EHu/79njJCrXpRzMoEjB08nN5XbQ2AzAZ9w6OMS3cg3F7jwQrxL3gTlk6qeJxW5xBL3gjrCA2phV67qtHTQuPU7uNTDI3fjvZ8sHZjHbW+PmmDeCsFxJq17l3g7Ui+TSzbXtrvyIvFdZbZMJnP3p5bK82dO7zZ9H7c+u2e0OfaR3M9hfKflLnsvqy07dLUYjlP7gk4q7C79fqy1f8sicMrI215KWFrLlvNPJNDSx+ZETNx6UAI+8dRg5OiJug+AWnRlzNld4ip1zyzixHGP0MG2wbd7X47tE89azfVE03L7XprAV94OfzxhOeKbPyeWXKqr7xbT+rMdvXjmeuCPzOx/m+U5kT4AACAASURBVL4j/nsPxWEwfvuZjczUv7TiK+YthapGwST3eKJmL621SV/9/XzEu2p5z7t9Zs35S9KdyUq9b+O7v5Qgc9sS286IoZF6J+vPvzd5lavE1tqzjQJXXSTQ2gsJU0LgCAJxkn6WK57vvrN0UnQEl6PvEUWEVhOGLWEWdzXYI5awE85t2nEldutE9SyvCH8vqZVr3gtHblebDsyvTQxr283jdu+5fsbTZvY3plMenn5K2NI3JE24HCcWjMOWk3fPA13R2q5fcUKWc1zhz/fW99ly+tvOXCuYxBxx2+54/FVnfRNutdQFdv3UUWonHH8efdxaa1+8xOuSd2/KrzbvrVv25/cZCfChzgiTorogECcXeyave2D4y7vUKsCeuh117Vkr+Ee1z+8TJ417RCENVDxk7Og2tHS/OKHfMvhx0UI/j17d3iqieptzTtLmbL52FdNX3LfYofY+p/5xaWeFXKF3tTPIXT/npnGr+ppP/nLfp1R50Qsp14SydtExCtRLvGpazdvmtq3JCyH1esvV5+aejyN3gcr9fN56H0ehc+QxeW7uzZWHYNKcyahwIQIx/Obsj97WiVEhNIcXW3sscC4gOQa7JHddbo04eN/yjJ+5iujZ+reINFtyCCyn+kZohK8K67olq5gxL9Qab5k19arx3JaTIZ7NMyYCbTHHRRqqlkMo9Ge71oncWsGkxWSvei7Oymd16ZlMxeuSYnl8/5e8T4n3j57JP79L0v3WK2H3UTBZIvqVqCdlVkAAwaQCI1CFUwnE8Jujk7peU+prHQCVNpZ/6Htvfw4PGpK7ruuN7tGwZaUth73W1fbNszUY/7iZvW9jAT6pyj2Y1bvTJzhetZfN7JEF9ezZu2Su+ZpUiJV7npzlvbjANNWeEkUS/b3Fb0SOrczdQP6t/KyZfaZSq0XBZIm9WvWUrGU74Tie9S6xZXFgaXeK+bG2fFeX3qfEeVHA/LqZ/dGFm5QKpSvRJsosSADBpCBciq6eQI2rfS26GucwtMeKqqw9oSk56lK6jA+a2bem3AaaOG05yFeyjloMtVvbv84WSzTgXTLZuETEJ2meKPZSqMgaoulqua79qpl9bEEhZ3rqLKhe1lOi5+KlfCZZb9hpYTEJujiqT+95Js7CFFf+96xW1563xPmuEUxaTXRfy/ssfScv8fTb8xxEz5Kl7/4998t57RqvmCiYlBSfcraPsgoQQDApAJUiqycQB7E1qeL+Em9xILjH6GdOSPfUe8u1PrjasyrY6ircFl45rhHz/8fM3nJX2NoBz5nhYblyGUVheM8kTbaYW8HU/68pN24NK6+XXg+33+tm9uxM4tde212iXTFUI+YyKXGvkmWmO3FsCUe7lXOhZP3Xlr1GMGk9HGftt2Uty2vnH5mvRPWIwt+Z7d7CcK1oGc/P7aW5pf5ccxIBBJOTwHPbUwjEwX5p9X1LA0f0LtEgSe7ELyRbbm7hV/s1PnjcKtKRr2SbhX2S8m0z+/0VRfh1a8SAFcVfPdUnRTkGaHGCpffeljwo6nuPT4JTrPiW96iHCPU8/oj5iQi/2f9UyKNE702xbHViLQp785isESD2U99fQqzvrZwtrS4EnB1GHAVxWSzHN+Oa5b29W979+3vU9hLijjdr6l6jJ/p2Cly5mUDPA5bNULiwSwLxpVf6g7IFoK8Q3BpUbCm7xmvibiPacrPnlWbx3yuWaKCtPqwJQ46Qihr7RIk6bdmFKPbNMya77gHnITQ5uPybycNGZS1ZERQD1eOhGZHE67NF+KvFfT0H00tltDapLckiR9nO0/tty4KJeMQ8Jmu/90fteJXDbqlAdM1z1m28lkeueu4p58z8JWly1yXv9q1trX3B8Vq74vh/y6KBvoW6jrHX1t7TwXUIJh0YkSZcJeATTX/hnTEBWmKikbxLXBzKmVNhCeOzzvGVja0TYPKVbLfc2h1i9J74X8zsn085ErbfeduVUazZ4gly6a4xFOCSaOJeJGKgP9eOrQNzf/ZrFK23Wezeq+Iq5hmeSTnaUFsZPtnx8arvyLQ1/9PZ7fuXdx6V750q8UUz+9TCCvnkeItQufAW2U9b6mHSqgi2dyFkK/C50MiS75toxy2Cw9Z27r0u9eja+t3aWw+u74AAgkkHRqQJFwnU7lXiFR/Ju8QnbqN8uPaIJYTg7Hu5xUSvt8QHsfZBu/JNPLXv1puvLunenbpu+2qZ2r7kyJG0tGfBJE5iSk5eltiqp3PSyXSroRtuE20R/vD0jyXCYbqyf+tdVpPtPcG56qRwSIVFzh3yuhELeZu2dJyR4yqKsmK1JrxkC9soOrQi1qWCkofz4SGypQdwza8JIJjQEXok0JrrYKuDhTV9xz/yuqZWL5817VlyrvdDnbs2uR9bBi8hfPmcNWERtfTNkmKJSEVRaA3dHEKJ3++MCcaatm49N/a3UcTgrazWXhe3E9a1rW4p7O2OCTpvrdbHyXHpifFauyw5P7b10nyj5XAcf58dlah/bieckgJaa2JJKpS0+Mwsea445wQCCCYnQOeWRQnED3QLarjXt+dn0QcVS1bTinaOAwvfI5bIC0fXrxVZDmxe9bdaGutfy/acR3leediNJvWXDhdI9PvcK75HtfPIDhonFXiW5CWf5i9peXLtZJYmfk2TNbe40BC92i6NcVoNx5E9tdilo6RocanflB7ftiaWpHlKWvRYyvv2pLSsBHqepGUFRWHVE0iV5VYGrvrg9pr0dGQXdU3YdawRPQjByfOaiQO9S0kEY9882yPgDNFG7fc/7zSz/8jMXr4b+D9fOLFdb4JJS1u85nm6ji0l3VrbBZPWx64x8evc+yf1QmlRLFFP8ef9midN6kF0bA/bfjfvi6WFC9Uw3Ta49OJT9Gw6on3brXD/zlNnf8/3tIVrKybQ+kenYrRU7UACra7EpMnsDkRW/FYjb6spsUQDjjWrToTg5OuSPhm5NHCKuU3Onoj4c1L7oDSXddzzpxVB+1q74w4VR7nk57JDK+Wk30hNHPV/a96tNbb1WhLmGN71SzN7T2ERsyQfT7p9STBpWQDzd3fpCfqShN25bdhCguG5PCVrFqhyM6O8zgkgmHRu4AGaF93wWpt0aDDRw8Qh7Wa9rSKveYxcLNGHe2mCsdaTGK7hU/rca4le4wCrhndFFBVbnwAuteuPzezBGwkgl5Z11nkubqo/ESNf1gr6loi3Px+97BiWJu4URb2T9EeikH6vo8VtdmOPuCWYtGxP/9aUHMN9y8yUONePkvfye9TuNZfm4nrNzD42PTtl30aUPjQBBJOhzd9041N1ubUVvpYHCpc6Tkye2WuY0bWHxsWSpV4LhODkfQXFldn0fRAnuaVXBJe0Koola8S1JWXXfE7LHiZxi3oxLu0WX7Mdj6pbGtooAUUiVe7cOke1J97Hc3e4OJLWobUxTVr/+D6eE6j990eIACXs6wtDpeZR0YPtZ2b2nx8kCni7anu/pUKJbFrDt7xE36LMCgmUetArbCpV6ohAqyE4bgIfKLQ+IEoHf/p41bByf0ZX90HGUpv65EuDxaWeKGe0q6V7ug3SPlhTCI541r6CV9LmLQomqVCi/qUJu35ylCWQ5rfozRsv3erbabYqIsTeEN9zc5PvlpO9qp1bQm+XPi1RLNE1S8cVS8u/dp6HtB55z2v1iYsdfp4ndGXslMPilLGIAILJIkycVBGBlkNwHGNPu6DUlDzzrG7qCdmWDjB6G/SfxT3eN65muht7bSE4o4slPsnQALiFCaGe68cngUt1d88GDdY5yhNId8jRHVvfUniOmsY0T5rZA408F0stf2vHwta9hdQXcy8QpaFaeucc6YG4ZBvopfbfc5446N0bw9NUHmL1Hqpcu4sAgskufFx8MIGourcw4J7D05N3yciJXd22zmBJf3SXUu1Ewup03peHvxvcRTeubtbithtFnSX9JS+hOkpbut3zmbVNhRI9q3pmEUqOtUr6rfR/t57X41iK590tLm6lHiat29Lr/0Uz+1QmxOl200eLJVHQPuub6UJJuu09uaIydTKK2U4AwWQ7O648jkCcaLT+4tyy3exxpJff6YytUJfX7pgzvV8uifX1SRghOPlt46tivhODT8prelfUKODkt8TtEmPYVG3PAqE3t+135BnplsL+b8atR1ph+72iYJJOwFsPx8md8HVOLDk6EXisw1HPmMZQuu9Dd90sFUnU8/QN9/Cb7T2RKyGQgcBRD0WGqlLEoARuuXW2hCUdALZUd68rIThvWk2xvr4KdM2WhOCU7ekec/2smX1k2mEit6v0nhbcSn64p+zWro2DctmoBtEEoaTOXuTffh+n9rKlcJ2089cqboebCiZ6Z7c8EXZRPsccKs1jc9a3K/XSzN8j3tj9yQWSNNwm3o/wxxL0KXMXgRwP+64KcDEErhCIIThnuQjmNJDa46veOcs9qixCcN4kvWT7YHbBKd8zfbD5+pQDQHes6V2RCgSKRx/9iBOps+2V5sQimWs9vdNt4+NU/VvvVIlsHPUTuDR+cwG55fmH8pe4R+MeS6TJXZd4q+6536VrvzDl0ckt1kSBRN9C/bl0uDeJwh9J5lrCypS5i0DLL6xdDefiqglELwZVdGkyzZob5ROnVuOvffBa02T0LHs7i2v9kl1wylsnem7objWF4Kg+iCWX+0C6perLZvZnB+UJUb/xb4x+ni3alH9S2rxDGraBp15bdpSo4Ef8VrYejjOXjHitZdIxrq4/SyzRvd1W3zCzz+7IsbZGIPFvttr90o57rmXP+RDYRADBZBM2LipIoEaX7RzNbXWw51nbxUAre6MnK12S5LVVW+fo50eWUbMHGmLJ7Z4gRl82sweTUyV86T2jQfTeRKueRNAFrHSFM/eK6u1Wc8ZSAggmS0nVeV4UTOJCUbpVdJ21v1yrvYtHc9vknrkQpXfk58zso6HJS7btdbFZu9no7x80s9+7YUz3ItFp8ubjgEAzBBBMmjHVEBW9liSsZQCtJqsjseu9vc5Xli5NsgjBOeYp1fP0T83sXdPtnroLx1H+kloOxJLlltAg+x+b2XsvXKIBtv+RgOJiSnq6e408Ov3imvu3ynCPltEF4OWWOv7MNEG6JtqtemgeT+/cO6aJ+j2BqS/AHJ3QNCcNF+q3eD7HnHxepy3l5GyPl5XuUBNDZPz9quSs+rvaseRAIFlCiXOaIIBg0oSZuq9kjyE40WiteRyQ2HX+kfO8JXODPV81wgun3OsqHdDpTrV5CCCWbLO/u3JL8BBDX728VFqMcV9yrlZMX83gsbKtdVy1hUDM+dVD3ostDFq9JgoDMdeHFmF0tOxdsDV/SZqvpLYQ0kvCyZI+qLY8MAnaX+dduwQZ57RGAMGkNYv1V99eQ3DcUq1l9veBaa0f87OegGt5S/Q79WMSepazTvQ++1HwLqlpxbmnHb3KWXJZyS6gyN37WqLAudJY1VzGuPaztJOK76TkgnTLngm1885Zv/i+9twcPrao6Z29ts23vEznynOvmijs5kgYu7bua8/X9yy+f12kjl5+7vVHkta1dDm/OQIIJs2ZrKsKR8X9zIRXJaFq0KfVlL2x+CXr6GXXHoLzcTP77gkZ1H0iPOc6K2YkLCvXO2O8d5wIK+b7zLjvtMVRLOn1XVbOytdL9omG+oKH3KSTD/UNnsOzLFTmvnHrWbd9y54JZSjVWerclsKtJ3sV6bX5S9Itg1UG34c6+yy1gsBVAggmdJAzCGiw+zUze3i6ucIYWhAU1rJqxbukhRCc70395Rd3Wdx/a60hdpzvK0rpIEcDeG3Fp/wZ5EHYAfjCpWmYnosjMTa+lpXKudXU/EQoEQJjEVDog793ewjlGMl6Ertc1PTxXWuhyXP28nf9rTFr+v3ysm5dN1Ifoa0QaIoAgklT5uqisvqQfGtyqf+JmX3gBI+Bo0Bq0FB7TgsPiao5BCdOkmW7o95bft/XzOyvTZ1G/6dBk3ix2pn/SUrzlLhLvrv8rl3hy1/De0useaee0m2nfAiUJBB3U8GTryTp/GX/3MzeOhWr73UvOWhcCLqWqHUusWvN46v81qdECHRI4KiJR4foaNIGAjGWU7sUPLKhjFYu8fjPmvNa+OSzdhfRuFp1VF1jLhd5MvhEXgKThBK8SvI/idFTY26AGYWzGr5dUSxh5TB/f6DEsQlEwaSFxYexrXVv631LYV9s6CEc59b355JXyVFjFvofBCBQkEANg86CzaPoigjE5K6aDElI6DlRlCZTmkTV2MYoXNU+0Usn0Uck/ZsTS2RPDXzwKsn/UkltfCnnTy3eJenAuJZtIfNbhhIhcA4Bfwd7KJ4EkyPe/ee0tq+7ziW/bimX2yVrRG/ctC/GXFt+PV4lffVrWjM4AQSTwTvAQc1Pt5jrXSxRe5WcUGJEbUdM7FqroOPMosim/zsqZ4V7Dvy+mf3NqTI12rK2vrW2PnMJXa8JUr5qeeZ3C7FkrZU5HwLrCbhg4iGtSiJas7fm+hb2e0Uc70nwev5uPKRvauuClyeyTT1G5hK71rbdfb+9jZZB4CACZw48D2oitzmZwC03+5OrV+T2mtjV9my1kNg1NUYMxTlqR5S4baD+3soOR0U6cqFCxfXPzey9U/lLbFuDd0n0zGL1sFDnoFgImNkHzex/NbM/MLPfq3gBAmPdTyCO+SRy+c5WrXtn/sWUe++zZvaZKUxXIkrc9tx3cmu9rfRrCEAgIVDbpA4D9UUgxviPEIYj62l1RUdNu/7EEJPak9D6E5D2naNWp75iZh9l679iL6I4mH522mVoyc0kQuodclQ/SOuUhhS28hwtYcs5EKiNQPQweejOW/PVyr6ptfGqqT5xS2G9r7Xw0XrYYvSa0bwp9X4V/zO/TzXZn7pAoEsCCCZdmvX0RqVu66OsxvoK9FmTujnDxxCcVlyaUxfXowZb2ib4STPT7k2/ffpT1FcFoneG3JXXJM4927skJvsb5V3WV++jNa0RiILJ44TjNGU+X+zwneQU1qrw1paPGI6jdskrMh5LvCRbbj91h8DwBBBMhu8C2QGkW8CONMHQR/WlSlbCWgzBUWdM+88RAxHf0Uj318rREffM/uBVWqBvwyzGW92Vz/QuGS1ZdaXdiGoNRiAKJgrpkMBaYwL1wcyyqLkumMjLVuMh2a31XeU8PPj7IZRUMEYa3y4yPidBoFcCCCa9WvacdqVuiiN9TNR2rYTX4MXh7qOt8Z8T20p667iopJ9/YmZfnh6bo5LLnvOUHnfX6Cm0VYQ607tkbreH4+hxJwiMS8DHEvqeaiGi5HdgXMplWu7igt75smPtyeVvUUjHJX4+iV1vkeP3EOiIAIJJR8Y8uSlxcuHKe++74UTkGtQpG/zZKylnTjD3dsEj85aknDwc52dm9va9DRn8+rj7jZ6HPQPms7xLovjLwHjwDk3zDyfgz9+nzew/q2Qh4nAIjd7QBZOvm9kDndju52b21mCPrQsAjZqUakMAAggm9IEcBObEkpFWhDS4U5z1mVvPeo4I2bPFhJRH5S25xMljlBkIbX8jxDCwHN5NZ4l/sS8ilmzvD1wJga0EXDDRjiSarLLryFaSx1/nCx+vmZkEr5oS4G+l8T0ze3i6+KicalvrynUQgEABAggmBaAOVmTMiK6mj5gpXAOEPavoe7tMi4ldY5tTwU0DrBLi07UJuDwZXGzqYYC3t0+tuV5cZUMJJjmEEr/3X94l4X3dzH5nTWV2nhvFklL9cGcVuRwC3RPwb4KeQU8e2n2jO2lg9BTtZY6hb5tEPMYGnXRSmgGBtQR6eZmtbTfn5yGAWPLGR/Qs75JWE7vG3ndE3hJfrbw0mY914J247N0gZur3vluAfiokLVdiRhcutLvCt5dVafdZ8X2GWLIbJwVAYDMBf/71HNYQ6rq5IQNe6IsP3zWzDwzYfpoMAQh0SIDJQYdGPahJqVfAqK7rWk05I9Gr89+bI+Kg7jJ7m7jVrJ+Q09017tByLdQm5qvgnXi9R7hAuGfXm1t9zgWsI98piCW3rMLvIXAcARdMXjazR467LXfaSSAuPpA8fSdMLocABOohwOSgHlu0VJO53XBGylnittKkUVselggfudQfevAq8bZF1139X878IWt2CvLB+YjhZEveO6k3iW8XWco9Wf1C9zwqafRXzOyjE4icfXAJW86BAATuJ4Bg0m6v0Ptb+Us+1m4TqDkEIACBewkgmNAj1hKYE0uOmtisrWvp85UN/si2RxHgyPuW4Pg1M/tIKDiXN8FSr5LYJvcuIAzjXks7S4kJGgCLT+nki97HjxAuoviolkv4LCUClXiGKBMCvRJwweQbZvbhXhtJuyAAAQhAoA0CCCZt2KmWWs7tR58zhKKWdi6phyZ2Oo6YYPXkVSJmqej2kynWeW/+izVeJdHG7ulyxCR9Sd8685zUm0Q2+RMze+GgSkmE1FHaYy3tg0/dbYH57EFt5DYQgMB1AojY9BAIQAACEKiGAIJJNaZooiJpCMWoYomMpQHdEaE4MWFp614l4jYnumnryM/seAL2CkqapKuMkQUTDy9zIVAeP/Im0c+jDu8bpe0Qd8LJuavPUZy4DwR6J+BjjU8cKNb2zpT2QQACEIDARgIIJhvBDXhZKpaM7L6uCderhb1L9ooAtXbRtB/tzaS/1ask8nHBZLQ+nXqTiEnu3W7W9EMXMkrZIQ3BQSxZYx3OhcBxBPw7QeLQ45hzJwhAAAIQuEAAwYSusYRA6r4+eq4HTbBLhgw47zNW+Zf0h63npGLJniSrOQWlkQQTF0nUx/RHh+xwRH6SW/3Gxa8Sgkm6q5fa3IPH1i2m/B4CLRLwdzJj1BatR50hAAEIdEaAj1FnBi3QnFQsyZWcs0BVDylSq+AvFQpViCv+pcMSDoEVbpL2I/1qa0hXDq+S2P4R4uXnvElqEUrcFu5hkrPvp14lLhCVFDyPfra4HwR6I/CrqUGMUXuzLO2BAAQg0CABPkYNGu3gKv/0LhniA+GeI7vI+q4hJXKXRK8Slb83AerB3eTq7ebEki2T4jj5zSncuWCSs8wa+M+JJC4YKD/JEQmL13DIKZhcantvNl7Dl3Mh0AoBBJNWLEU9IQABCAxAAMFkACPvaOL3zOzhcP1Wj4AdVajqUk2sn8/sXZIztKQqWFNl1D6F4uinH1tCunJ7lURWMVyjdUHQhQK1KTJ3bxL131rFuD83sz80s6+a2cc2duZLQomK2yLSbawGl0EAAhsJxMTgjFE3QuQyCEAAAhDIR4CPUT6WvZXkq+7err07mbTOp4R3Sc9eJW7vvXlLnLsEgFLeAdEDpkXB5JJIIhvUFnZz7T3gAu3abaaviSTOgHwlrb+Bqf8oBFwwed3M3jFKo2knBCAAAQjUSwDBpF7bnFmzuO2m6rF3J5Mz25Lr3pr45wqVca8S/VSZR27dmovHknJS0W1tos0oZJT2Dmgt8avYPHpnBHFJjxa8Seb6T1xZvraDzVzi2rnyVEaNoUdLnh3OgcCoBPy9j2Ayag+g3RCAAAQqI4BgUplBKqgOSV7vN8LHp/96IYN9nO+WsJQMtz+siFR0043XhHT59WtFlq0N/Asze9fOcJCt915y3RKRQMKbQm5qy02ypH1+TgzhcuFH/+d/HjSzt14psFWxaA0jzoVAzwT8GylPs9/uuaG0DQIQgAAE2iCAYNKGnY6qJWLJPGl5SuxN9OpeJbqDVr179SpR++aSvC7dKjZOmEt7lURre+jQ983sfUc9cDfu414kaT6SeFlLITdLsUZPkyXXOINSu1ctqQPnQAACeQj49+NlM3skT5GUAgEIQAACENhOAMFkO7verkwnKaXyRbTGzSetEjm2Hp5U9EgBYGtd9163Z0ec6FVydKhSDXlMlniRyD49iiRpv5M91B/0c+5AJNn7pHI9BOok4N9LxiB12odaQQACEBiOAILJcCafbXC6k4kmI0p+yWG2x7skepXkyn9Ss03mPAOWhB7VslOQ5zFZUudcdriWsNXv4eLAq42H22xlJkZikO76s7U8roMABOolgGBSr22oGQQgAIEhCSCYDGn2+xoddzK5lmxxNFo+md3iXaLVcQ38jvaUONNG6Y44S1YIz/QqSVnF7YXdbrm34PU+pXvPJWxNRRLCTM7s0dwbAhA4mgCCydHEuR8EIAABCFwlgGBCB0knuWsSc/ZOT2zEY83h3hISC7YILWvuVdO5aT+65aURvUqWCCtHtdW9THQ/iSVfN7P/w8z2JPxdEmqje4mD7+xyVHu5DwQgAIGaCCCY1GQN6gIBCEAAAoZgMnYniCvqIoFY8mZ/EJuHVogeMbRiJK8SEUvFklu5WuIOOrfOPfoJTcPT/P5Lc2Z42Ih23PmP7y7Gi+RoC3I/CECgZQIIJi1bj7pDAAIQ6JAAgkmHRl3YpA/eTei+Fc6tbeK6sBnFTlvjXeKTbHlVjORVIvjK8aIBrh/XdsOp1atkrhNJ1PnUtNVw+vvoDeK/U3LSSwlK4/XyIhnN+6jYQ0rBEIBAdwSeNrPPTe/JtR6e3cGgQRCAAAQgcD4BBJPzbXBWDX5qZg9MN68pJOIsHvG+LgBIALl2SADQxFqHhJLc+S5qYHGtDms8lOK5LYlzEoRk5yViyByrpZ4ptdua+kEAAhA4gsCTZvYFBJMjUHMPCEAAAhBYQgDBZAmlPs/xMIrXzewdfTZxc6uUx+LWLkESACSWSCi5JaxsrkjFF6bbB1/yLIleJS0nFF6Sh0Tm8rwnOv+pAUW0irssVYMABBogILFEogm79TVgLKoIAQhAYAQCCCYjWPlyGxWW8+2xEdzX+ugxModm1KSukUW6ffCl3DdRVGnJq+TWIxE9TpTnRtv9epjOrWv5PQQgAAEIXCaAYELvgAAEIACBqgggmFRlDipTAYFr3iUjbhWcmkRiwb8ws7dNIsFcglv3xpBI0rJXSQXdkSpAAAIQIM8IZgAAIABJREFUGIrAV8zso1OLGaMOZXoaCwEIQKBOAnyM6rQLtTqHgASRl6bY6ViDkZO6phwkKOlQKNcjMyEnvXqVnNMjuSsEIACBsQjEROKMUceyPa2FAAQgUCUBPkZVmoVKnUDARZE0d8mtEJ0TqnrKLWMYjrxGFIYTk9z2kqvkFLjcFAIQgAAEfk1Aorxvz67v8WjJ1OkGEIAABCBQGQEEk8oMQnVOIyBh5PkwONO//9DMPsGA7dc7xChJsI65RHx4lZzWbbkxBCAAgW4IuPCun/pzKT9WNw2mIRCAAAQgUD8BBJP6bUQNyxOI3iUkdb2X9zWxhFwl5fsmd4AABCAwCgH//qq9+vYgmIxiedoJAQhAoGICCCYVG4eqHUZA3iT/u5n9d1P+Em0VzPHGgPWSZ4m2VVasuY6edsDB7hCAAAQgcA4BfXMen7xL9PdL29WfUzvuCgEIQAACQxJAMBnS7DQ6ENDWysrK/41pcAacNwhEseTFaaVP/0+uEnoIBCAAAQiUIKDvzqPTd0aiPGJ8CcqUCQEIQAACqwggmKzCxcmdEZBnydNm9l+b2QudtW1Pcy6JJeKlAawOBrJ7CHMtBCAAAQikBDzJ+quTByPfGfoIBCAAAQicTgDB5HQTUIGCBNy9VyE2MdO+/7+2xn0Az5J7LDAnluBVUrCTUjQEIAABCPyagLxKdLzXzP54CpFVHhMOCEAAAhCAwGkEEExOQ8+NCxOI3hAeUuJJSvVTsdHKwaGfHG8QiHlJnBleJfQOCEAAAhA4gkDqYRLDQY+4P/eAAAQgAAEI3EcAwYRO0SMBJSqVp4QfEkUemgQB/V2DMI+VJsHrG5RSgUmcxFHikniJk35yQAACEIAABEoQ0HfopZAra24b+xL3pUwIQAACEIDARQIIJnSOngjE0BG1S4OtPzGzvzWz+43EAIkCMVSnJxZr2hLFkucmJoodFxv9G1FpDU3OhQAEIACBLQRSwURlME7dQpJrIAABCEAgGwE+RNlQUtDJBOKkX1WRN4T+KMxEMdBRGNH/yeMEIeCNsCSPG5c44n/HFfrkDs3tIQABCAxGQAsZ+i5rpxxPMP5uFjYG6wU0FwIQgEBlBBBMKjMI1dlEIA3B+YSZ/YMr3hHkLnkDc+QmQUkeOvqpAavEEw4IQAACEIDAUQT0TdICR1wA0b8JBz3KAtwHAhCAAATuI4BgQqdomYDykGhg5flKvmtm358m/pfCbTyp3OjeJanIpH7AFo4tPw3UHQIQgEDbBBBM2rYftYcABCDQJQEEky7NOkSj0hCcb0xbEd7KufGKmcnFd+QjFUvkVZKGLY3Mh7ZDAAIQgMDxBBBMjmfOHSEAAQhA4AYBBBO6SGsE0sSuPzKz18zs6wtykozuXSJ2Xzaz909G/4mZ/Y8LuLXWR6gvBCAAAQi0R8CTsT9+V3XPYSJvUUJE27MlNYYABCDQDQEEk25MOURDlJBU+Uf8kGeE59y4FeMssUCDsVG9S9R+edf4IY+cv00yvSGeGxoJAQhAoAUCcx4mCCYtWI46QgACEOiYAIJJx8btqGmpV8nrZvaLacvgpStP8i55ddCVqo9PniXqEr80sz8giV5HTwdNgQAEINAHARdM4u5t5Nbqw7a0AgIQgECzBBBMmjXdMBVXQlcNovyQWPLsyjCSkb1LvmZmH5ngyRtnVA+bYR4YGgoBCECgUQLyglQ+rRiSg2DSqDGpNgQgAIFeCCCY9GLJPtsRk5NKKFGeErnnrj1G9C6R0CSx5IEJlkSmp9aC43wIQAACEIDAQQQ8KXv0MJEX6Zbv/kFV5jYQgAAEINA7AQST3i3cZvvSEJyXzeyRjU3xsrRqNcKh9kogUr4XP9T2WzleRmBDGyEAAQhAoF4CLpjExRIEk3rtRc0gAAEIDEEAwWQIMzfVSA+f0c9/fZdz4+9MIThbG6GVqucHEQzSrZbZLnhrr+E6CEAAAhA4kkBc3IiCCSE5R1qBe0EAAhCAwH0EEEzoFDURiPlK5BGx1ytkFO+SuF2wkrq+ZRKI9vKrqW9QFwhAAAIQ6JvAd8zsA9OObvqu6UAw6dvmtA4CEIBA9QQQTKo30TAVzC2WCJxn3O8ZYupVwgCzZ2vTNghAAAJ9EogLHArNccGEkJw+7U2rIAABCDRDAMGkGVN1XdESYokGW8q0/0yn5GKel9fM7J13eUsUgqPkeOQr6dToNAsCEIBAxwR8keNXoY14mHRscJoGAQhAoAUCCCYtWKnvOj5pZl+YmphzJcmTx/VIL3qVaPcg7YRDvpIeLU2bIAABCIxBIHqYIJiMYXNaCQEIQKAJAggmTZip20pGz5Kcq0gSFHT05l0SE+KqfT83s9+6c13OKTR129loGAQgAAEIVEtA4wElaX/33U5vUTCR16S+cRwQgAAEIACBUwggmJyCnZtOBNxTIueE30UFDbp6OuZ2wFFbP21mn++pobQFAhCAAASGI/DJO6FE37lUMMm5mDIcVBoMAQhAAAL7CSCY7GdICfsIaNKvcJJchwZcr3a0IpV6lURO2gWHfCW5eg7lQAACEIDAWQQkmCjvmL5rhOScZQXuCwEIQAAC9xFAMKFT9ESgN++S1KvE85VIJJGbck6hqad+QFsgAAEIQKAtAi6Y6NumHGR+EJLTlh2pLQQgAIHuCCCYdGfSoRvUi3fJnFeJiyU5w5eG7iw0HgIQgAAEqiGg77fymCCYVGMSKgIBCEAAAiKAYEI/6IVAzLDfcptSr5LYFlbaWrYsdYcABCAAgUsELgkmhJ7SZyAAAQhA4FQCCCan4ufmGQl8s/EwFRd8tMLmx0/M7MEp9EZiCflKMnYYioIABCAAgWoI4GFSjSmoCAQgAAEIRAIIJvSHHghIZHi04W2E57xKXCyRSKIVNg4IQAACEIBArwTwMOnVsrQLAhCAQOMEEEwaNyDV/zUBJYhrcRvhOa8StQexhI4NAQhAAAIjEZBgosSvWiAg6etIlqetEIAABCongGBSuYGo3k0CGmTpeObmmXWdIK8YhRGlx2tm9s4pvEgJXjkgAAEIQAACvRNwwUSLH3FbYXKY9G552gcBCECgcgIIJpUbiOrdJNCid8m1EBxtFUy+kptm5wQIQAACEOiIgH8XP2FmXw7tYpzakZFpCgQgAIEWCfAhatFq1NkJaID1UkPJUC+F4PiWwcpXIrFEogkHBCAAAQhAYBQCLph82sw+NzVa38IWw21HsRnthAAEIDAEAQSTIczcZSMlPiikpZXB1KUQHA0I1RaF30gs4YAABCAAAQiMRuDpSSj5qpl9dGo8Sc9H6wW0FwIQgECFBBBMKjQKVVpEoCXvkrkQHPcqUWOJ0V5kck6CAAQgAIFOCSjh65emxQP9XcefNpifrFPz0CwIQAAC4xJAMBnX9i23XB4ZEiFa8MiYE0t+YWZvnUKJCMFpuSdSdwhAAAIQyEHABZNvm9kHpwJZTMhBljIgAAEIQGAXAQSTXfi4+CQCCsWpXWi4lK/EkbFydlLn4bYQgAAEIFAdARdMvm9m70Uwqc4+VAgCEIDAsAQQTIY1fbMN16DqocrddCWWaPeeuYNdcJrtelQcAhCAAAQKEXDBxIsn4Wsh0BQLAQhAAALrCCCYrOPF2ecTkHeJ3HRrPS4ld1V9Sexaq9WoFwQgAAEInEkgFUzwwjzTGtwbAhCAAAR+QwDBhM7QEgHlA9HxTKWVTgd8sZrEYldqNKoFAQhAAAKnE0gXGxifnm4SKgABCEAAAiLAB4l+0AqB2rcRVnZ/z+wfmX7XzD5x9zu5F3NAAAIQgAAEIHA/gRjK+qyZPQUkCEAAAhCAQA0EEExqsAJ1WEJA3iWvTmEtS84/8hyFCWl1LB7aCefD0044R9aFe0EAAhCAAARaJPA9M3vYzN7NIkOL5qPOEIAABPokgGDSp117a1Wt3iWXdsL5iZn9dm9GoD0QgAAEIAABCEAAAhCAAARGIoBgMpK1222rwl2Ut6S2sJYfm9mDCVa5EcudmAMCEIAABCAAAQhAAAIQgAAEGiaAYNKw8Qapurw4FI7zREXtVZ2+MyOWKFfJCxXVk6pAAAIQgAAEIAABCEAAAhCAwEYCCCYbwXHZYQTkXVKbWKI6xZwl/++dgPKfkq/ksD7BjSAAAQhAAAIQgAAEIAABCBQngGBSHDE32EFAu848VNE2wjGLvzdLYTl/fUcbuRQCEIAABCAAAQhAAAIQgAAEKiSAYFKhUajSbwi8MmXLrwHJXBjOy2b2SA2Vow4QgAAEIAABCEAAAhCAAAQgkJcAgklenpSWj0BN2wgr/EZbB8fjRTN7LF9zKQkCEIAABCAAAQhAAAIQgAAEaiKAYFKTNaiLE6hpG+E5sUQ5VZ7DXBCAAAQgAAEIQAACEIAABCDQLwEEk35t23LL5F3yfAXbCCuHihK8xkNeJfIu4YAABCAAAQhAAAIQgAAEIACBjgkgmHRs3EabVss2wk+b2ecCwx+Z2X+FWNJor6LaEIAABCAAAQhAAAIQgAAEVhJAMFkJjNOLE1CukLNzgzxpZl8ILf2umX2geMu5AQQgAAEIQAACEIAABCAAAQhUQwDBpBpTUJG7EJwathFGLKErQgACEIAABCAAAQhAAAIQgIAhmNAJaiJwtneJwoG0lbEfXzWzj9UEiLpAAAIQgAAEIAABCEAAAhCAwDEEEEyO4cxdbhOoZRvhH5vZg2b2fTN73+1qcwYEIAABCEAAAhCAAAQgAAEI9EgAwaRHq7bXptq2EVZ92Da4vX5EjSEAAQhAAAIQgAAEIAABCGQjgGCSDSUF7SAg75KX2IFmB0EuhQAEIAABCEAAAhCAAAQgAIGsBBBMsuKksA0EatlGeEPVuQQCEIAABCAAAQhAAAIQgAAEeiWAYNKrZdtpl7xLnr/bIeeH7VSZmkIAAhCAAAQgAAEIQAACEIBA7wQQTHq3cN3tw7ukbvtQOwhAAAIQgAAEIAABCEAAAsMSQDAZ1vRVNPzsbYSrgEAlIAABCEAAAhCAAAQgAAEIQKA+Aggm9dlklBp9yMz+AzP7/CgNpp0QgAAEIAABCEAAAhCAAAQg0A4BBJN2bNVbTfEu6c2itAcCEIAABCAAAQhAAAIQgEBHBBBMOjJmQ01hG+GGjEVVIQABCEAAAhCAAAQgAAEIjEgAwWREq5/bZhK9nsufu0MAAhCAAAQgAAEIQAACEIDAAgIIJgsgcUpWAoTiZMVJYRCAAAQgAAEIQAACEIAABCBQggCCSQmqlHmJgEJxXjWz50AEAQhAAAIQgAAEIAABCEAAAhComQCCSc3W6atuCsX5kpk91lezaA0EIAABCEAAAhCAAAQgAAEI9EgAwaRHq9bZJkJx6rQLtYIABCAAAQhAAAIQgAAEIACBGQIIJnSLIwh88s675CEze+aIm3EPCEAAAhCAAAQgAAEIQAACEIDAXgIIJnsJcv0tAgrFkXfJu2+dyO8hAAEIQAACEIAABCAAAQhAAAK1EEAwqcUS/dZDeUueN7MX+20iLYMABCAAAQhAAAIQgAAEIACB3gggmPRm0braI+8S7YzzRF3VojYQgAAEIAABCEAAAhCAAAQgAIHrBBBM6CElCZDotSRdyoYABCAAAQhAAAIQgAAEIACBYgQQTIqhHb5geZa8ambPDU8CABCAAAQgAAEIQAACEIAABCDQHAEEk+ZM1kSFFYqj3CWPNVFbKgkBCEAAAhCAAAQgAAEIQAACEEgIIJjQJUoQUCiOthAm0WsJupQJAQhAAAIQgAAEIAABCEAAAsUJIJgURzzcDT50t43wo5NgMlzjaTAEIAABCEAAAhCAAAQgAAEI9EEAwaQPO9bUChK91mQN6gIBCEAAAhCAAAQgAAEIQAACmwggmGzCxkUXCCjRqw6F43BAAAIQgAAEIAABCEAAAhCAAASaJYBg0qzpqqs4iV6rMwkVggAEIAABCEAAAhCAAAQgAIGtBBBMtpLjupSAQnGeMLMfggYCEIAABCAAAQhAAAIQgAAEINA6AQST1i1YR/1J9FqHHagFBCAAAQhAAAIQgAAEIAABCGQigGCSCeTgxbxiZu8enAHNhwAEIAABCEAAAhCAAAQgAIGOCCCYdGTMk5pCoteTwHNbCEAAAhCAAAQgAAEIQAACEChHAMGkHNsRSlaiV+UuwbtkBGvTRghAAAIQgAAEIAABCEAAAgMRQDAZyNgFmiqxRFsIv1igbIqEAAQgAAEIQAACEIAABCAAAQicRgDB5DT0zd+YRK/Nm5AGQAACEIAABCAAAQhAAAIQgMAlAggm9I2tBORd8tjWi7kOAhCAAAQgAAEIQAACEIAABCBQMwEEk5qtU2/dSPRar22oGQQgAAEIQAACEIAABCAAAQhkIIBgkgHiYEWQ6HUwg9NcCEAAAhCAAAQgAAEIQAACIxJAMBnR6vvaLO+Sl0j0ug8iV0MAAhCAAAQgAAEIQAACEIBA3QQQTOq2T221w7ukNotQHwhAAAIQgAAEIAABCEAAAhAoQgDBpAjWbgtVotcnzOyH3baQhkEAAhCAAAQgAAEIQAACEIAABMwMwYRusJQA2wgvJcV5EIAABCAAAQhAAAIQgAAEINA8AQST5k14WANeMbN3H3Y3bgQBCEAAAhCAAAQgAAEIQAACEDiRAILJifAbujXbCDdkLKoKAQhAAAIQgAAEIAABCEAAAvsJIJjsZ9h7CSR67d3CtA8CEIAABCAAAQhAAAIQgAAE7iOAYEKnuEWAbYRvEeL3EIAABCAAAQhAAAIQgAAEINAdAQST7kyatUHyLvmSmT2WtVQKgwAEIAABCEAAAhCAAAQgAAEIVE4AwaRyA51cPbYRPtkA3B4CEIAABCAAAQhAAAIQgAAEziGAYHIO9xbuyjbCLViJOkIAAhCAAAQgAAEIQAACEIBAEQIIJkWwdlEo2wh3YUYaAQEIQAACEIAABCAAAQhAAAJbCCCYbKHW/zVsI9y/jWkhBCAAAQhAAAIQgAAEIAABCFwhgGBC90gJsI0wfQICEIAABCAAAQhAAAIQgAAEhieAYDJ8F7gPgHbFed7MXgQNBCAAAQhAAAIQgAAEIAABCEBgVAIIJqNafr7dSvT6uJk9ARYIQAACEIAABCAAAQhAAAIQgMDIBBBMRrb+/W0n0Sv9AQIQgAAEIAABCEAAAhCAAAQgYGYIJnQDJ0CiV/oCBCAAAQhAAAIQgAAEIAABCEBgIoBgQlcQARK90g8gAAEIQAACEIAABCAAAQhAAAKBAIIJ3UEEvjnlLfkhOCAAAQhAAAIQgAAEIAABCEAAAhAgJIc+YKZEr4/ehWc9AwwIQAACEIAABCAAAQhAAAIQgAAE3iCAhwk9gUSv9AEIQAACEIAABCAAAQhAAAIQgEBCAMFk7C6hRK+v3uUweW5sDLQeAhCAAAQgAAEIQAACEIAABCBwLwEEk3F7BIlex7U9LYcABCAAAQhAAAIQgAAEIACBGwQQTMbtIiR6Hdf2tBwCEIAABCAAAQhAAAIQgAAEEEzoAzMESPRKt4AABCAAAQhAAAIQgAAEIAABCFwhgIfJeN1DoThfMrPHxms6LYYABCAAAQhAAAIQgAAEIAABCCwjgGCyjFNPZynR60tm9mJPjaItEIAABCAAAQhAAAIQgAAEIACBnAQQTHLSrL8seZdIMHmi/qpSQwhAAAIQgAAEIAABCEAAAhCAwHkEEEzOY3/GnRWKg1hyBnnuCQEIQAACEIAABCAAAQhAAAJNEUAwacpcuyorzxIdz+wqhYshAAEIQAACEIAABCAAAQhAAAIDEEAwGcDIZkai1zHsTCshAAEIQAACEIAABCAAAQhAIBMBBJNMICsvRqE48iz5YeX1pHoQgAAEIAABCEAAAhCAAAQgAIEqCCCYVGGGopX4kJk9SihOUcYUDgEIQAACEIAABCAAAQhAAAKdEUAw6cygM815xcze3X8zaSEEIAABCEAAAhCAAAQgAAEIQCAfAQSTfCxrLOlpM/sqoTg1moY6QQACEIAABCAAAQhAAAIQgEDNBBBMarbOvrop0at2xmEb4X0cuRoCEIAABCAAAQhAAAIQgAAEBiSAYNKv0QnF6de2tAwCEIAABCAAAQhAAAIQgAAEChNAMCkM+KTiP2lmD5Ho9ST63BYCEIAABCAAAQhAAAIQgAAEmieAYNK8CWcbgHdJn3alVRCAAAQgAAEIQAACEIAABCBwEAEEk4NAH3gb5S3R8cyB9+RWEIAABCAAAQhAAAIQgAAEIACBrgggmHRlzl83Bu+S/mxKiyAAAQhAAAIQgAAEIAABCEDgYAIIJgcDL3w7eZe8ZGYvFr4PxUMAAhCAAAQgAAEIQAACEIAABLomgGDSj3m1jfCX7gSTx/ppEi2BAAQgAAEIQAACEIAABCAAAQicQwDB5BzuJe4q75LnzeyHJQqnTAhAAAIQgAAEIAABCEAAAhCAwEgEEEz6sLa8Sx4n0WsfxqQVEIAABCAAAQhAAAIQgAAEIHA+AQST822QowYkes1BkTIgAAEIQAACEIAABCAAAQhAAAITAQST9rvCJ+9ylzyEd0n7hqQFEIAABCAAAQhAAAIQgAAEIFAPAQSTemyxtSZ4l2wlx3UQgAAEIAABCEAAAhCAAAQgAIELBBBM2u4aSvSq45m2m0HtIQABCEAAAhCAAAQgAAEIQAACdRFAMKnLHmtqo0Sv37zbGefday7iXAhAAAIQgAAEIAABCEAAAhCAAARuE0Awuc2o1jPwLqnVMtQLAhCAAAQgAAEIQAACEIAABJongGDSpgnxLmnTbtQaAhCAAAQgAAEIQAACEIAABBohgGDSiKGSasq75FUze67N6lNrCEAAAhCAAAQgAAEIQAACEIBA3QQQTOq2z1zt8C5pz2bUGAIQgAAEIAABCEAAAhCAAAQaI4Bg0pjBzAzvkvZsRo0hAAEIQAACEIAABCAAAQhAoDECCCZtGQzvkrbsRW0hAAEIQAACEIAABCAAAQhAoFECCCZtGe5LZvYSuUvaMhq1hQAEIAABCEAAAhCAAAQgAIH2CCCYtGMzvEvasRU1hQAEIAABCEAAAhCAAAQgAIHGCSCYtGNA5S7R8Uw7VaamEIAABCAAAQhAAAIQgAAEIACBNgkgmLRhN7xL2rATtYQABCAAAQhAAAIQgAAEIACBTgggmLRhSLxL2rATtYQABCAAAQhAAAIQgAAEIACBTgggmNRvSLxL6rcRNYQABCAAAQhAAAIQgAAEIACBzgggmNRvULxL6rcRNYQABCAAAQhAAAIQgAAEIACBzgggmNRtULxL6rYPtYMABCAAAQhAAAIQgAAEIACBTgkgmNRt2E+a2UPsjFO3kagdBCAAAQhAAAIQgAAEIAABCPRHAMGkbpu+YmaPmdkP664mtYMABCAAAQhAAAIQgAAEIAABCPRFAMGkXnvKu+RRM3ui3ipSMwhAAAIQgAAEIAABCEAAAhCAQJ8EEEzqtau8SySWvFhvFakZBCAAAQhAAAIQgAAEIAABCECgTwIIJnXaVd4l2h3n3XVWj1pBAAIQgAAEIAABCEAAAhCAAAT6JoBgUqd95V3yHMle6zQOtYIABCAAAQhAAAIQgAAEIACB/gkgmNRp4y+Ru6ROw1ArCEAAAhCAAAQgAAEIQAACEBiDAILJGHamlRCAAAQgAAEIQAACEIAABCAAAQisIIBgsgIWp0IAAhCAAAQgAAEIQAACEIAABCAwBgEEkzHsTCshAAEIQAACEIAABCAAAQhAAAIQWEEAwWQFLE6FAAQgAAEIQAACEIAABCAAAQhAYAwCCCZj2JlWQgACEIAABCAAAQhAAAIQgAAEILCCAILJClicCgEIQAACEIAABCAAAQhAAAIQgMAYBBBMxrAzrYQABCAAAQhAAAIQgAAEIAABCEBgBQEEkxWwOBUCEIAABCAAAQhAAAIQgAAEIACBMQggmIxhZ1oJAQhAAAIQgAAEIAABCEAAAhCAwAoCCCYrYHEqBCAAAQhAAAIQgAAEIAABCEAAAmMQQDAZw860EgIQgAAEIAABCEAAAhCAAAQgAIEVBBBMVsDiVAhAAAIQgAAEIAABCEAAAhCAAATGIIBgMoadaSUEIAABCEAAAhCAAAQgAAEIQAACKwggmKyAxakQgAAEIAABCEAAAhCAAAQgAAEIjEEAwWQMO9NKCEAAAhCAAAQgAAEIQAACEIAABFYQQDBZAYtTIQABCEAAAhCAAAQgAAEIQAACEBiDAILJGHamlRCAAAQgAAEIQAACEIAABCAAAQisIIBgsgIWp0IAAhCAAAQgAAEIQAACEIAABCAwBgEEkzHsTCshAAEIQAACEIAABCAAAQhAAAIQWEEAwWQFLE6FAAQgAAEIQAACEIAABCAAAQhAYAwCCCZj2JlWQgACEIAABCAAAQhAAAIQgAAEILCCAILJClicCgEIQAACEIAABCAAAQhAAAIQgMAYBBBMxrAzrYQABCAAAQhAAAIQgAAEIAABCEBgBQEEkxWwOBUCEIAABCAAAQhAAAIQgAAEIACBMQggmIxhZ1oJAQhAAAIQgAAEIAABCEAAAhCAwAoCCCYrYHEqBCAAAQhAAAIQgAAEIAABCEAAAmMQQDAZw860EgIQgAAEIAABCEAAAhCAAAQgAIEVBBBMVsDiVAhAAAIQgAAEIAABCEAAAhCAAATGIIBgMoadaSUEIAABCEAAAhCAAAQgAAEIQAACKwggmKyAxakQgAAEIAABCEAAAhCAAAQgAAEIjEEAwWQMO9NKCEAAAhCAAAQgAAEIQAACEIAABFYQQDBZAYtTIQABCEAAAhCAAAQgAAEIQAACEBiDAILJGHamlRCAAAQgAAEIQAACEIAABCAAAQisIIBgsgIWp0IAAhCAAAQgAAEIQAACEIAABCAwBgEEkzHsTCshAAEIQAACEIAABCAAAQhAAAIQWEEAwWQFLE6FAAQgAAEIQAACEIAABCCcDYF6AAAFr0lEQVQAAQhAYAwCCCZj2JlWQgACEIAABCAAAQhAAAIQgAAEILCCAILJClicCgEIQAACEIAABCAAAQhAAAIQgMAYBBBMxrAzrYQABCAAAQhAAAIQgAAEIAABCEBgBQEEkxWwOBUCEIAABCAAAQhAAAIQgAAEIACBMQggmIxhZ1oJAQhAAAIQgAAEIAABCEAAAhCAwAoCCCYrYHEqBCAAAQhAAAIQgAAEIAABCEAAAmMQQDAZw860EgIQgAAEIAABCEAAAhCAAAQgAIEVBBBMVsDiVAhAAAIQgAAEIAABCEAAAhCAAATGIIBgMoadaSUEIAABCEAAAhCAAAQgAAEIQAACKwggmKyAxakQgAAEIAABCEAAAhCAAAQgAAEIjEEAwWQMO9NKCEAAAhCAAAQgAAEIQAACEIAABFYQQDBZAYtTIQABCEAAAhCAAAQgAAEIQAACEBiDAILJGHamlRCAAAQgAAEIQAACEIAABCAAAQisIIBgsgIWp0IAAhCAAAQgAAEIQAACEIAABCAwBgEEkzHsTCshAAEIQAACEIAABCAAAQhAAAIQWEEAwWQFLE6FAAQgAAEIQAACEIAABCAAAQhAYAwCCCZj2JlWQgACEIAABCAAAQhAAAIQgAAEILCCAILJClicCgEIQAACEIAABCAAAQhAAAIQgMAYBBBMxrAzrYQABCAAAQhAAAIQgAAEIAABCEBgBYH/vx07JAAAAEAY1r81Ga6ZxzAcDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCDpOAJUqAAAECBAgQIECAAAECBAh8CDhMPnbWkgABAgQIECBAgAABAgQIEAgCA3CAzV0U/6qFAAAAAElFTkSuQmCC', '09089856740', 'fhranz789@gmail.com', 0, 0, 1, 'Facebook Page', 'Acer Nitro 5 AN515-55', 'Black/Red, W/ Crack on Top Right, W/ Chargers', 'LCD Replacement History, Detailed cleaning by client.', 4, 'On-going Warranty', '', 0, '2024-05-29 09:25:05', '2024-06-03 19:59:07');
INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`, `cid_signature`, `cid_client_contact`, `cid_client_email`, `cid_platinum`, `cid_platinum_number`, `cid_representative`, `cid_advertisement`, `cid_unit_details`, `cid_remarks`, `cid_unit_history`, `cid_device_id`, `cid_status`, `cid_type`, `isDeleted`, `cid_created`, `cid_updated`) VALUES
(5, '062024-1', 'Fhranz Joseph A. Benosa', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABEwAAAH0CAYAAAAnoLgFAAAAAXNSR0IArs4c6QAAIABJREFUeF7t3V+obcd9H/BfwIFAUojBBYWmWKIJbaBQufTBBRlb9KENebADKdhQkETy0odQGxLShxbpkoe0xGAHWkggQTIN2KUB+zFvkrEhgVKkhwYSErBEXCKIoX5IaKAq6vlZe6zR0j777LX3WmvPrPksEPfec/eeNfOZOVdnfff8+YFwESBAgAABAgQIECBAgAABAgQIvEfgB3gQIECAAAECBAgQIECAAAECBAi8V0BgYkQQIECAAAECBAgQIECAAAECBCYCAhNDggABAgQIECBAgAABAgQIECAgMDEGCBAgQIAAAQIECBAgQIAAAQKnBcwwMUIIECBAgAABAgQIECBAgAABAhMBgYkhQYAAAQIECBAgQIAAAQIECBAQmBgDBAgQIECAAAECBAgQIECAAIHTAmaYGCEECBAgQIAAAQIECBAgQIAAgYmAwMSQIECAAAECBAgQIECAAAECBAgITIwBAgQIECBAgAABAgQIECBAgMBpATNMjBACBAgQIECAAAECBAgQIECAwERAYGJIECBAgAABAgQIECBAgAABAgQEJsYAAQIECBAgQIAAAQIECBAgQOC0gBkmRggBAgQIECBAgAABAgQIECBAYCIgMDEkCBAgQIAAAQIECBAgQIAAAQICE2OAAAECBAgQIECAAAECBAgQIHBawAwTI4QAAQIECBAgQIAAAQIECBAgMBEQmBgSBAgQIECAAAECBAgQIECAAAGBiTFAgAABAgQIECBAgAABAgQIEDgtYIaJEUKAAAECBAgQIECAAAECBAgQmAgITAwJAgQIECBAgAABAgQIECBAgIDAxBggQIAAAQIECBAgQIAAAQIECJwWMMPECCFAgAABAgQIECBAgAABAgQITAQEJoYEAQIECBAgQIAAAQIECBAgQEBgYgwQIECAAAECBAgQIECAAAECBE4LmGFihBAgQIAAAQIECBAgQIAAAQIEJgICE0OCAAECBAgQIECAAAECBAgQICAwMQYIECBAgAABAgQIECBAgAABAqcFzDAxQggQIECAAAECBAgQIECAAAECEwGBiSFBgAABAgQIECBAgAABAgQIEBCYGAMECBAgQIAAAQIECBAgQIAAgdMCZpgYIQQIECBAgAABAgQIECBAgACBiYDAxJAgQIAAAQIECBAgQIAAAQIECAhMjAECBAgQIECAAAECBAgQIECAwGkBM0yMEAIECBAgQIAAAQIECBAgQIDAREBgYkgQIECAAAECBAgQIECAAAECBAQmxgABAgQIECBAgAABAgQIECBA4LSAGSZGCAECBAgQIECAAAECBAgQIEBgIiAwMSQIECBAgAABAgQIECBAgAABAgITY4AAAQIECBAgQIAAAQIECBAgcFrADBMjhAABAgQIECBAgAABAgQIECAwERCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQOC1ghokRQoAAAQIECBAgQIAAAQIECBCYCAhMDAkCBAgQIECAAAECBAgQIECAgMDEGCBAgAABAgQIECBAgAABAgQInBYww8QIIUCAAAECBAgQIECAAAECBAhMBAQmhgQBAgQIECBAgAABAgQIECBAQGBiDBAgQIAAAQIECBAgQIAAAQIETguYYWKEECBAgAABAgQIECBAgAABAgQmAgITQ4IAAQIECBAgQIAAAQIECBAgIDAxBggQIECAAAECBAgQIECAAAECpwXMMDFCCBAgQIAAAQIECBAgQIAAAQITAYGJIUGAAAECBAgQIECAAAECBAgQEJgYAwQIECBAgAABAgQIECBAgACB0wJmmBghBAgQIECAAAECBAgQIECAAIGJgMDEkCBAgAABAgQIECBAgAABAgQICEyMAQIECBAgQIAAAQIECBAgQIDAaQEzTIwQAgQIECBAgAABAgQIECBAgMBEQGBiSBAgQIAAAQIECBAgQIAAAQIEBCbGAAECBAgQIECAAAECBAgQIEDgtIAZJkYIAQIECBAgQIAAAQIECBAgQGAiIDAxJAgQIECAAAECBAgQIECAAAECAhNjgAABAgQIECBAgAABAgQIECBwWsAMEyOEAAECBAgQIECAAAECBAgQIDAREJgYEgQIECBAgAABAgQIECBAgAABgYkxQIAAAQIECBAgQIAAAQIECBA4LWCGiRFCgAABAgQIECBAgAABAgQIEJgICEwMCQIECBAgQIAAAQIECBAgQICAwMQYIECAAAECBAgQIECAAAECBAicFjDDxAghQIAAAQIECBAgQIAAAQIECEwEBCaGBAECBAgQIECAAAECBAgQIEBAYGIMECBAgAABAgQIECBAgAABAgROC5hhYoQQIECAAAECBAgQIECAAAECBCYCAhNDggABAgQIECBAgAABAgQIECAgMDEGCBAgQIAAAQIECBAgQIAAAQKnBcwwMUIIECBAgAABAgQIECBAgAABAhMBgcl+h8TjEfHvIuKliPjmfpupZQQIECBAgAABAgQIECBAYHkBgcnypq2U+BcR8dhdaPJWRPxkRLzeSsXUgwABAgQIECBAgAABAgQItC4gMGm9hy6v39vVW/Xz5Y7eSYAAAQIECBAgQIAAAQIDCniQ3men53Kcbx2a9ocR8U/32UytIkCAAAECBAgQIECAAAEC6wgITNZxvXWpdWDySkQ8fesKuT8BAgQIECBAgAABAgQIEOhJQGDSU2+dX9dPRMTLh5fnpq/Pnf9WryRAgAABAgQIECBAgAABAgQEJvscA3VgYobJPvtYqwgQIECAAAECBAgQIEBgRQGByYq4Ny66bPqap+M8ceO6uD0BAgQIECBAgAABAgQIEOhKQGDSVXfNqmxu+pp7mQhMZrF5MQECBAgQIECAAAECBAgQiBCY7HcU/EFEfDQi3oyIH9tvM7WMAAECBAgQIECAAAECBAgsLyAwWd60lRL/NCJ+IiLeiogfbKVS6kGAAAECBAgQIECAAAECBHoQEJj00EuX1fG/RcTPHd6ae5jk0hwXAQIECBAgQIAAAQIECBAgcIaAwOQMpE5fUp+U80JEPOq0HapNgAABAgQIECBAgAABAgQ2FxCYbE6+6Q3Lxq+OFt6U3c0IECBAgAABAgQIECBAoHcBgUnvPXi6/i/eLcV59vASy3L23ddaR4AAAQIECBAgQIAAAQILCghMFsRssKgMSzI0yeu5u2OGX2qwjqpEgAABAgQIECBAgAABAgSaExCYNNcli1ao3sckw5IMTVwECBAgQIAAAQIECBAgQIDAAwICk/0PEfuY7L+PtZAAAQIECBAgQIAAAQIEFhYQmCwM2mBx9jFpsFNUiQABAgQIECBAgAABAgTaFhCYtN0/S9TOPiZLKCqDAAECBAgQIECAAAECBIYSEJiM0d1lWY59TMbob60kQIAAAQIECBAgQIAAgSsFBCZXAnby9pcjIjeAzcvxwp10mmoSIECAAAECBAgQIECAwO0EBCa3s9/yzpblbKntXgQIECBAgAABAgQIECDQvYDApPsuPLsBluWcTeWFBAgQIECAAAECBAgQIDC6gMBknBHw/F1TXzg017KccfpdSwkQIECAAAECBAgQIEDgAgGByQVonb7l8YjIWSZ5fS0ifrbTdqg2AQIECBAgQIAAAQIECBBYXUBgsjpxUzf4RkQ8FRGvHzZ/bapyKkOAAAECBAgQIECAAAECBFoREJi00hPb1KPe/NWynG3M3YUAAQIECBAgQIAAAQIEOhQQmHTYaVdWuWz+mvuZPLqyLG8nQIAAAQIECBAgQIAAAQK7FBCY7LJbTzbqxbslOTnTJC+zTMbrfy0mQIAAAQIECBAgQIAAgTMEBCZnIO3sJZ+IiJcPbXouIl7aWfs0hwABAgQIECBAgAABAgQIXC0gMLmasMsCyrKcDEsyNHERIECAAAECBAgQIECAAAEClYDAZMzhYFnOmP2u1QQIECBAgAABAgQIECBwpoDA5Eyonb3MspyddajmECBAgAABAgQIECBAgMCyAgKTZT17Kq0sy3klIp7uqeLqSoAAAQIECBAgQIAAAQIE1hYQmKwt3G75z99VLY8WzstpOe32k5oRIECAAAECBAgQIECAwA0EBCY3QG/klpblNNIRqkGAAAECBAgQIECAAAEC7QkITNrrky1rZFnOltruRYAAAQIECBAgQIAAAQLdCAhMuumqVSpqWc4qrAolQIAAAQIECBAgQIAAgd4FBCa99+B19bcs5zo/7yZAgAABAgQIECBAgACBnQoITHbasTOaZVnODCwvJUCAAAECBAgQIECAAIExBAQmY/TzqVZalmMMECBAgAABAgQIECBAgACBiYDAxJCwLMcYIECAAAECBAgQIECAAAECAhNj4IiAZTmGBQECBAgQIECAAAECBAgQqATMMDEcUsCyHOOAAAECBAgQIECAAAECBAgITIyBiYBlOYYEAQIECBAgQIAAAQIECBAQmBgDRwTKspyXIuI5QgQIECBAgAABAgQIECBAYGQBS3JG7v33tt2yHGOBAAECBAgQIECAAAECBAgcBAQmhkIRsCzHWCBAgAABAgQIECBAgAABAgITY+CIgGU5hgUBAgQIECBAgAABAgQIEIgIM0wMg1rgxYh49vCFJ+5+/zoeAgQIECBAgAABAgQIECAwooDAZMRev7/N9bKcpyPiFTwECBAgQIAAAQIECBAgQGBEAYHJiL1+us1lWc4LdzOQHuEhQIAAAQIECBAgQIAAAQIjCghMRuz1020uy3JydknOMnERIECAAAECBAgQIECAAIHhBAQmw3X5gw3OPUwyNMnLPiYPcnkBAQIECBAgQIAAAQIECOxRQGCyx169vk1lWc5zEfHS9cUpgQABAgQIECBAgAABAgQI9CUgMOmrv7aq7ct3G77mBrAZlmRo4iJAgAABAgQIECBAgAABAkMJCEyG6u6zG/v83Stz09e8LMs5m80LCRAgQIAAAQIECBAgQGAvAgKTvfTksu1wvPCynkojQIAAAQIECBAgQIAAgc4EBCadddiG1XW88IbYbkWAAAECBAgQIECAAAECbQkITNrqj5Zq43jhlnpDXQgQIECAAAECBAgQIEBgUwGByabcXd3M8cJddZfKEiBAgAABAgQIECBAgMCSAgKTJTX3V1ZZlvP03ak5r+yveVpEgAABAgQIECBAgAABAgSOCwhMjIxTAo4XNj4IECBAgAABAgQIECBAYEgBgcmQ3X52o8vxwjm7JGeZuAgQIECAAAECBAgQIECAwBACApMhuvniRtbHCz8REa9fXJI3EiBAgAABAgQIECBAgACBjgQEJh111o2qWvYxeS4iXrpRHdyWAAECBAgQIECAAAECBAhsKiAw2ZS7y5uV44UzLMnQxEWAAAECBAgQIECAAAECBHYvIDDZfRdf3cByvLB9TK6mVAABAgQIECBAgAABAgQI9CIgMOmlp25bz7Isxz4mt+0HdydAgAABAgQIECBAgACBjQQEJhtBd36bcrxwnpSTM01cBAgQIECAAAECBAgQIEBg1wICk11372KNK8cL32ofk8fvNpzN//Iqv3540rr8+qlTfN44olFe/1hEvHl4/7Fy8nUPlb8YtoIIECBAgAABAgQIECBA4PYCApPb90EPNSjHCy+9j0kJIUog8vEKI/dOKVcdWOTvy5/z7+vfH7MsAUv5u/rP5fcZlmRoMuc6FqJMv3YswKm/Ng1xyt9N3+c45zk947UECBAgQIAAAQIECBBYQEBgsgDiIEVcso9JCSQycMkZIX8SEX//bllP/rkOSzKIyVAgA4Q6NNgqKKhnj0wDluzeuq518DINa47NepkOj/sCnGP3nb53GqhM/1wCmFsYDvJtoJkECBAgQIAAAQIECIwiIDAZpaevb2c5XjiPFi77mJSZIRkU1EtmMhCpr/IA/18j4vcPochWYcj1Ld+uhHPDlKl3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RmkLAQIECBAgQIAAAQIECBA4JiAwMS7OFcgZJq8LTM7l8joCBAgQIECAAAECBAgQ6FlAYNJz721bdzNMtvV2NwIECBAgQIAAAQIECBC4oYDA5Ib4nd36LyPiFyPiK53VW3UJECBAgAABAgQIECBAgMBsAYHJbLJh32CGybBdr+EECBAgQIAAAQIECBAYT0BgMl6fX9ribx32L3np0gK8jwABAgQIECBAgAABAgQI9CIgMOmlp25fTzNMbt8HakCAAAECBAgQIECAAAECGwkITDaC3sFtzDDZQSdqAgECBAgQIECAAAECBAicJyAwOc/JqyIEJkYBAQIECN4Diz4AABDaSURBVBAgQIAAAQIECAwjIDAZpquvbqjA5GpCBRAgQIAAAQIECBAgQIBALwICk1566vb1FJjcvg/UgAABAgQIECBAgAABAgQ2EhCYbAS9g9sITHbQiZpAgAABAgQIECBAgAABAucJCEzOc/Iqe5gYAwQIECBAgAABAgQIECAwkIDAZKDOvrKpZphcCejtBAgQIECAAAECBAgQINCPgMCkn766dU0FJrfuAfcnQIAAAQIECBAgQIAAgc0EBCabUXd/I4FJ912oAQQIECBAgAABAgQIECBwroDA5Fwpr8vA5KWIeISCAAECBAgQIECAAAECBAjsXUBgsvceXq59ApPlLJVEgAABAgQIECBAgAABAo0LCEwa76CGqicwaagzVIUAAQIECBAgQIAAAQIE1hUQmKzru6fSX46I1yPiuT01SlsIECBAgAABAgQIECBAgMAxAYGJcXGugMDkXCmvI0CAAAECBAgQIECAAIHuBQQm3XfhZg3IwCSvpze7oxsRIECAAAECBAgQIECAAIEbCQhMbgTf4W1fvDsl53GBSYc9p8oECBAgQIAAAQIECBAgMFtAYDKbbNg3ZGDy7N2xwsbMsENAwwkQIECAAAECBAgQIDCOgIffcfr62pY+f1fACwKTaxm9nwABAgQIECBAgAABAgR6EBCY9NBLbdQxZ5fkLJMnDqfltFErtSBAgAABAgQIECBAgAABAisICExWQN1pkZ+IiNz4NTd9fWWnbdQsAgQIECBAgAABAgQIECDwPQGBiYFwrsCnI+LLEfGxiPjmuW/yOgIECBAgQIAAAQIECBAg0KOAwKTHXrtNncsMk9zH5NFtquCuBAgQIECAAAECBAgQIEBgGwGByTbOe7hLHin8rYh47u544Zf20CBtIECAAAECBAgQIECAAAEC9wkITIyNcwVKYGKGybliXkeAAAECBAgQIECAAAEC3QoITLrtuptU/O3D7JKcZeIiQIAAAQIECBAgQIAAAQK7FRCY7LZrV2lYBiZ5Qk6elOMiQIAAAQIECBAgQIAAAQK7FRCY7LZrV2lY7mGSS3OeiIjXV7mDQgkQIECAAAECBAgQIECAQAMCApMGOqGjKrx4F5Q8a+PXjnpMVQkQIECAAAECBAgQIEDgIgGByUVsw74pw5IMTfKUHPuYDDsMNJwAAQIECBAgQIAAAQL7FxCY7L+Pl2zhJyLi5UOBH4uIby5ZuLIIECBAgAABAgQIECBAgEArAgKTVnqin3r834j4gGU5/XSYmhIgQIAAAQIECBAgQIDAfAGByXyz0d+RM0xypollOaOPBO0nQIAAAQIECBAgQIDAjgUEJjvu3JWaVjZ+zVNy8rQcFwECBAgQIECAAAECBAgQ2J2AwGR3Xbp6g8rGr3kjxwuvzu0GBAgQIECAAAECBAgQIHALAYHJLdT7v+fbhybkSTm5NMdFgAABAgQIECBAgAABAgR2JSAw2VV3btaYb90FJY/bx2QzbzciQIAAAQIECBAgQIAAgY0FBCYbg+/kdmUfk2yOMbSTTtUMAgQIECBAgAABAgQIEHhXwMOu0XCJQJ6Sk6fl5GUfk0sEvYcAAQIECBAgQIAAAQIEmhYQmDTdPU1XzrKcprtH5QgQIECAAAECBAgQIEDgGgGByTV6Y7/3+bvmv3AgMMtk7LGg9QQIECBAgAABAgQIENidgMBkd126WYNy09dclpO/ZnDyaLM7uxEBAgQIECBAgAABAgQIEFhZQGCyMvDOi69nmTwdEa/svL2aR4AAAQIECBAgQIAAAQKDCAhMBunoFZtZ9jJ5PSIyNMlfXQQIECBAgAABAgQIECBAoGsBgUnX3ddE5Z+NiDxmOC9Lc5roEpUgQIAAAQIECBAgQIAAgWsFBCbXCnp/CtgA1jggQIAAAQIECBAgQIAAgV0JCEx21Z03bUxZmmOWyU27wc0JECBAgAABAgQIECBAYAkBgckSispIAbNMjAMCBAgQIECAAAECBAgQ2I2AwGQ3XdlEQ/KY4bxy81cXAQIECBAgQIAAAQIECBDoVkBg0m3XqTgBAgQIECBAgAABAgQIECCwloDAZC1Z5RIgQIAAAQIECBAgQIAAAQLdCghMuu06FSdAgAABAgQIECBAgAABAgTWEhCYrCWrXAIECBAgQIAAAQIECBAgQKBbAYFJt12n4gQIECBAgAABAgQIECBAgMBaAgKTtWSVS4AAAQIECBAgQIAAAQIECHQrIDDptutUnAABAgQIECBAgAABAgQIEFhLQGCylqxyCRAgQIAAAQIECBAgQIAAgW4FBCbddp2KEyBAgAABAgQIECBAgAABAmsJCEzWklUuAQIECBAgQIAAAQIECBAg0K2AwKTbrlNxAgQIECBAgAABAgQIECBAYC0BgclassolQIAAAQIECBAgQIAAAQIEuhUQmHTbdSpOgAABAgQIECBAgAABAgQIrCUgMFlLVrkECBAgQIAAAQIECBAgQIBAtwICk267TsUJECBAgAABAgQIECBAgACBtQQEJmvJKpcAAQIECBAgQIAAAQIECBDoVkBg0m3XqTgBAgQIECBAgAABAgQIECCwloDAZC1Z5RIgQIAAAQIECBAgQIAAAQLdCghMuu06FSdAgAABAgQIECBAgAABAgTWEhCYrCWrXAIECBAgQIAAAQIECBAgQKBbAYFJt12n4gQIECBAgAABAgQIECBAgMBaAgKTtWSVS4AAAQIECBAgQIAAAQIECHQrIDDptutUnAABAgQIECBAgAABAgQIEFhLQGCylqxyCRAgQIAAAQIECBAgQIAAgW4FBCbddp2KEyBAgAABAgQIECBAgAABAmsJCEzWklUuAQIECBAgQIAAAQIECBAg0K2AwKTbrlNxAgQIECBAgAABAgQIECBAYC0BgclassolQIAAAQIECBAgQIAAAQIEuhUQmHTbdSpOgAABAgQIECBAgAABAgQIrCUgMFlLVrkECBAgQIAAAQIECBAgQIBAtwICk267TsUJECBAgAABAgQIECBAgACBtQQEJmvJKpcAAQIECBAgQIAAAQIECBDoVkBg0m3XqTgBAgQIECBAgAABAgQIECCwloDAZC1Z5RIgQIAAAQIECBAgQIAAAQLdCghMuu06FSdAgAABAgQIECBAgAABAgTWEhCYrCWrXAIECBAgQIAAAQIECBAgQKBbAYFJt12n4gQIECBAgAABAgQIECBAgMBaAgKTtWSVS4AAAQIECBAgQIAAAQIECHQrIDDptutUnAABAgQIECBAgAABAgQIEFhLQGCylqxyCRAgQIAAAQIECBAgQIAAgW4FBCbddp2KEyBAgAABAgQIECBAgAABAmsJCEzWklUuAQIECBAgQIAAAQIECBAg0K2AwKTbrlNxAgQIECBAgAABAgQIECBAYC0BgclassolQIAAAQIECBAgQIAAAQIEuhUQmHTbdSpOgAABAgQIECBAgAABAgQIrCUgMFlLVrkECBAgQIAAAQIECBAgQIBAtwICk267TsUJECBAgAABAgQIECBAgACBtQQEJmvJKpcAAQIECBAgQIAAAQIECBDoVkBg0m3XqTgBAgQIECBAgAABAgQIECCwloDAZC1Z5RIgQIAAAQIECBAgQIAAAQLdCghMuu06FSdAgAABAgQIECBAgAABAgTWEhCYrCWrXAIECBAgQIAAAQIECBAgQKBbAYFJt12n4gQIECBAgAABAgQIECBAgMBaAgKTtWSVS4AAAQIECBAgQIAAAQIECHQrIDDptutUnAABAgQIECBAgAABAgQIEFhLQGCylqxyCRAgQIAAAQIECBAgQIAAgW4FBCbddp2KEyBAgAABAgQIECBAgAABAmsJCEzWklUuAQIECBAgQIAAAQIECBAg0K2AwKTbrlNxAgQIECBAgAABAgQIECBAYC0BgclassolQIAAAQIECBAgQIAAAQIEuhUQmHTbdSpOgAABAgQIECBAgAABAgQIrCUgMFlLVrkECBAgQIAAAQIECBAgQIBAtwICk267TsUJECBAgAABAgQIECBAgACBtQQEJmvJKpcAAQIECBAgQIAAAQIECBDoVkBg0m3XqTgBAgQIECBAgAABAgQIECCwloDAZC1Z5RIgQIAAAQIECBAgQIAAAQLdCghMuu06FSdAgAABAgQIECBAgAABAgTWEhCYrCWrXAIECBAgQIAAAQIECBAgQKBbAYFJt12n4gQIECBAgAABAgQIECBAgMBaAgKTtWSVS4AAAQIECBAgQIAAAQIECHQrIDDptutUnAABAgQIECBAgAABAgQIEFhLQGCylqxyCRAgQIAAAQIECBAgQIAAgW4FBCbddp2KEyBAgAABAgQIECBAgAABAmsJCEzWklUuAQIECBAgQIAAAQIECBAg0K2AwKTbrlNxAgQIECBAgAABAgQIECBAYC0BgclassolQIAAAQIECBAgQIAAAQIEuhUQmHTbdSpOgAABAgQIECBAgAABAgQIrCUgMFlLVrkECBAgQIAAAQIECBAgQIBAtwICk267TsUJECBAgAABAgQIECBAgACBtQQEJmvJKpcAAQIECBAgQIAAAQIECBDoVkBg0m3XqTgBAgQIECBAgAABAgQIECCwloDAZC1Z5RIgQIAAAQIECBAgQIAAAQLdCghMuu06FSdAgAABAgQIECBAgAABAgTWEhCYrCWrXAIECBAgQIAAAQIECBAgQKBbAYFJt12n4gQIECBAgAABAgQIECBAgMBaAgKTtWSVS4AAAQIECBAgQIAAAQIECHQrIDDptutUnAABAgQIECBAgAABAgQIEFhLQGCylqxyCRAgQIAAAQIECBAgQIAAgW4FBCbddp2KEyBAgAABAgQIECBAgAABAmsJCEzWklUuAQIECBAgQIAAAQIECBAg0K2AwKTbrlNxAgQIECBAgAABAgQIECBAYC0BgclassolQIAAAQIECBAgQIAAAQIEuhUQmHTbdSpOgAABAgQIECBAgAABAgQIrCUgMFlLVrkECBAgQIAAAQIECBAgQIBAtwICk267TsUJECBAgAABAgQIECBAgACBtQQEJmvJKpcAAQIECBAgQIAAAQIECBDoVkBg0m3XqTgBAgQIECBAgAABAgQIECCwloDAZC1Z5RIgQIAAAQIECBAgQIAAAQLdCghMuu06FSdAgAABAgQIECBAgAABAgTWEhCYrCWrXAIECBAgQIAAAQIECBAgQKBbAYFJt12n4gQIECBAgAABAgQIECBAgMBaAgKTtWSVS4AAAQIECBAgQIAAAQIECHQrIDDptutUnAABAgQIECBAgAABAgQIEFhLQGCylqxyCRAgQIAAAQIECBAgQIAAgW4FBCbddp2KEyBAgAABAgQIECBAgAABAmsJCEzWklUuAQIECBAgQIAAAQIECBAg0K2AwKTbrlNxAgQIECBAgAABAgQIECBAYC0BgclassolQIAAAQIECBAgQIAAAQIEuhUQmHTbdSpOgAABAgQIECBAgAABAgQIrCUgMFlLVrkECBAgQIAAAQIECBAgQIBAtwICk267TsUJECBAgAABAgQIECBAgACBtQQEJmvJKpcAAQIECBAgQIAAAQIECBDoVkBg0m3XqTgBAgQIECBAgAABAgQIECCwloDAZC1Z5RIgQIAAAQIECBAgQIAAAQLdCghMuu06FSdAgAABAgQIECBAgAABAgTWEhCYrCWrXAIECBAgQIAAAQIECBAgQKBbAYFJt12n4gQIECBAgAABAgQIECBAgMBaAv8fuUgzbaVCYhAAAAAASUVORK5CYII=', '0908985640', 'fhransisko@gmail.com', 1, 21, 2, 'Facebook Page', 'Acer Nitro 5 AN515-55', 'Black/Red, W/ Crack on Top Right, W/ Chargers', 'LCD Replacement History, Detailed cleaning by client.', 4, 'On-going', '', 0, '2024-06-02 17:55:18', '2024-06-03 19:59:07');
INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`, `cid_signature`, `cid_client_contact`, `cid_client_email`, `cid_platinum`, `cid_platinum_number`, `cid_representative`, `cid_advertisement`, `cid_unit_details`, `cid_remarks`, `cid_unit_history`, `cid_device_id`, `cid_status`, `cid_type`, `isDeleted`, `cid_created`, `cid_updated`) VALUES
(8, '062024-2', 'fhranzikso', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABEwAAAH0CAYAAAAnoLgFAAAAAXNSR0IArs4c6QAAIABJREFUeF7t3T/Iddl+F/AViBDILW5hEcEwDgimEGLAwsCVuYONVsYuReSdwcbyBiLGImQGAxIMpBBBITIzkMLCQotgo9wZYiMExM7iwsxwU9xC0OIKFsL4fG/Outlz8jzn2fuc/WetvT4Hhued991n77U+v/X+Od9n/fmJ4kWAAAECBAgQIECAAAECBAgQIPA1gZ/gQYAAAQIECBAgQIAAAQIECBAg8HUBgYkRQYAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQuC1ghokRQoAAAQIECBAgQIAAAQIECBC4EhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQ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7nWmxzTMyI8TaPx8KeW/T25W9wcRaiwRdi0BAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGERCYjFNrPSVAgAABAgQIECBAgAABAgRmCghMZkK5jAABAgQIECBAgAABAgQIEBhHQGAyTq31lAABAgQIECBAgAABAgQIEJgpIDCZCeUyAgQIECBAgAABAgQIECBAYBwBgck4tdZTAgQIECBAgAABAgQIECBAYKaAwGQmlMsIECBAgAABAgQIECBAgACBcQQEJuPUWk8JECBAgAABAgQIECBAgACBmQICk5lQLiNAgAABAgQIECBAgAABAgTGEfj/BTV7XvLK4+wAAAAASUVORK5CYII=', '3124', 'abhi@gmail.com', 1, 123, 2, 'Facebook Page', 'Acer Nitro 5 AN515-55', 'Black/Red, W/ Crack on Top Right, W/ Chargers', 'LCD Replacement History, Detailed cleaning by client.', 4, 'On-going Warranty', '', 0, '2024-06-02 17:56:51', '2024-06-03 22:30:18');
INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`, `cid_signature`, `cid_client_contact`, `cid_client_email`, `cid_platinum`, `cid_platinum_number`, `cid_representative`, `cid_advertisement`, `cid_unit_details`, `cid_remarks`, `cid_unit_history`, `cid_device_id`, `cid_status`, `cid_type`, `isDeleted`, `cid_created`, `cid_updated`) VALUES
(11, '062024-3', 'Deca XCS', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABEwAAAH0CAYAAAAnoLgFAAAAAXNSR0IArs4c6QAAIABJREFUeF7t3U/Iddt9F/Al7SBiwQiWtpByDWaQUsEWOqiQchucOKsBhQjK7aUZOEzRYgsFc0EQaSF2VqFyc3WQgoLXkYJKG1KwBSERhAod3FyaQQaFBkwxg2J8fsn5Nevue/7sc87ea6+192fDy/vn2WfvtT5rPed99vesP3+uOAgQIECAAAECBAgQIECAAAECBN4j8Od4ECBAgAABAgQIECBAgAABAgQIvFdAYKJHECBAgAABAgQIECBAgAABAgQmAgITXYIAAQIECBAgQIAAAQIECBAgIDDRBwgQIECAAAECBAgQIECAAAEC1wWMMNFDCBAgQIAAAQIECBAgQIAAAQITAYGJLkGAAAECBAgQIECAAAECBAgQEJjoAwQIECBAgAABAgQIECBAgACB6wJGmOghBAgQIECAAAECBAgQIECAAIGJgMBElyBAgAABAgQIECBAgAABAgQICEz0AQIECBAgQIAAAQIECBAgQIDAdQEjTPQQAgQIECBAgAABAgQIECBAgMBEQGCiSxAgQIAAAQIECBAgQIAAAQIEBCb6AAECBAgQIECAAAECBAgQIEDguoARJnoIAQIECBAgQIAAAQIECBAgQGAiIDDRJQgQIECAAAECBAgQIECAAAECAhN9gAABAgQIECBAgAABAgQIECBwXcAIEz2EAAECBAgQIECAAAECBAgQIDAREJjoEgQIECBAgAABAgQIECBAgAABgYk+QIAAAQIECBAgQIAAAQIECBC4LmCEiR5CgAABAgQIECBAgAABAgQIEJgICEx0CQIECBAgQIAAAQIECBAgQICAwEQfIECAAAECBAgQIECAAAECBAhcFzDCRA8hQIAAAQIECBAgQIAAAQIECEwEBCa6BAECBAgQIECAAAECBAgQIEBAYKIPECBAgAABAgQIECBAgAABAgSuCxhhoocQIECAAAECBAgQIECAAAECBCYCAhNdggABAgQIECBAgAABAgQIECAgMNEHCBAgQIAAAQIECBAgQIAAAQLXBYww0UMIECBAgAABAgQIECBAgAABAhMBgYkuQYAAAQIECBAgQIAAAQIECBAQmOgDBAgQIECAAAECBAgQIECAAIHrAkaY6CEECBAgQIAAAQIECBAgQIAAgYmAwESXIECAAAECBAgQIECAAAECBAgITPQBAgQIECBAgAABAgQIECBAgMB1ASNM9BACBAgQIECAAAECBAgQIECAwERAYKJLECBAgAABAgQIECBAgAABAgQEJvoAAQIECBAgQIAAAQIECBAgQOC6gBEmeggBAgQIECBAgAABAgQIECBAYCIgMNElCBAgQIAAAQIECBAgQIAAAQICE32AAAECBAgQIECAAAECBAgQIHBdwAgTPYQAAQIECBAgQIAAAQIECBAgMBEQmOgSBAgQIECAAAECBAgQIECAAAGBiT5AgAABAgQIECBAgAABAgQIELguYISJHkKAAAECBAgQIECAAAECBAgQmAgITHQJAgQIECBAgAABAgQIECBAgIDARB8gQIAAAQIECBAgQIAAAQIECFwXMMJEDyFAgAABAgQIECBAgAABAgQITAQEJroEAQIECBAgQIAAAQIECBAgQEBgog8QIECAAAECBAgQIECAAAECBK4LGGGihxAgQIAAAQIECBAgQIAAAQIEJgICE12CAAECBAgQIECAAAECBAgQICAw0QcIECBAgAABAgQIECBAgAABAtcFjDDRQwgQIECAAAECBAgQIECAAAECEwGBiS5BgAABAgQIECBAgAABAgQIEBCY6AMECBAgQIAAAQIECBAgQIAAgesCRpjoIQQIECBAgAABAgQIECBAgACBiYDARJcgQIAAAQIECBAgQIAAAQIECAhM9AECBAgQIECAAAECBAgQIECAwHUBI0z0EAIECBAgQIAAAQIECBAgQIDAREBgoksQIECAAAECBAgQIECAAAECBAQm+gCBiwJ/UEr5SCnlt0spH+dEgAABAgQIECBAgAABAscVMMLkuG2v5u8X+Nbpn75eSvlLgAgQIECAAAECBAgQIEDguAICk+O2vZq/X+CPSykfPP2z7w09hAABAgQIECBAgAABAgcW8FB44MZX9fcJ/NbLdJyfPv3rh0spX2FEgAABAgQIECBAgAABAscUEJgcs93V+rzAmy8hyc+evvR6KeVzoAgQIECAAAECBAgQIEDgmAICk2O2u1qfF4iwJEKTOAQmegkBAgQIECBAgAABAgQOLCAwOXDjq/r7BOrAJEaXRGjiIECAAAECBAgQIECAAIEDCghMDtjoqnxRINYviXVM4rC1sI5CgAABAgQIECBAgACBAwsITA7c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AQIEHhEQmDyi5jW/VUp562WnnM+hIECAAAECBAgQIECAAAECexQQmOyxVdevk8BkfWN3IECAAAECBAgQIECAAIENBQQmG+IPfGuBycCNp+gECBAgQIAAAQIECBAgcFtAYHLbyBnvFxCY6BUECBAgQIAAAQIECBAgsGsBgcmum3e1ykVgElsKv7HaHVyYAAECBAgQIECAAAECBAhsKCAw2RB/4Fu/WUr5isBk4BZUdAIECBAgQIAAAQIECBC4KiAw0UEeEYhthd+1S84jdF5DgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKmAwKQpt5sRIECAAAECBAgQIECAAAECIwgITEZoJWUkQIAAAQIECBAgQIAAAQIEmgoITJpyuxkBAgQIECBAgAABAgQIECAwgoDAZIRWUkYCBAgQIECAAAECBAgQIECgqYDApCm3mxEgQIAAAQIECBAgQIAAAQIjCAhMRmglZSRAgAABAgQIECBAgAABAgSaCghMmnK7GQECBAgQIECAAAECBAgQIDCCgMBkhFZSRgIECBAgQIAAAQIECBAgQKCpgMCkKbebESBAgAABAgQIECBAgAABAiMICExGaCVlJECAAAECBAgQIECAAAECBJoKCEyacrsZAQIECBAgQIAAAQIECBAgMIKAwGSEVlJGAgQIECBAgAABAgQIECBAoKnA/wcSfNuLHgYSsQAAAABJRU5ErkJggg==', '0987456311', 'fhransisko@gmail.com', 0, 0, 1, 'Referral', 'Acer Nitro 5 AN515-55', 'Black/Red, W/ Crack on Top Right, W/ Chargersssss', 'LCD Replacement History, Detailed cleaning by client.', 4, 'On-going Warranty', '', 0, '2024-06-02 19:51:02', '2024-06-03 22:03:25');
INSERT INTO `cs_cid_information` (`cid_id`, `cid_number`, `cid_client_full_name`, `cid_signature`, `cid_client_contact`, `cid_client_email`, `cid_platinum`, `cid_platinum_number`, `cid_representative`, `cid_advertisement`, `cid_unit_details`, `cid_remarks`, `cid_unit_history`, `cid_device_id`, `cid_status`, `cid_type`, `isDeleted`, `cid_created`, `cid_updated`) VALUES
(12, '062024-4', 'fhranzikso', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABEwAAAH0CAYAAAAnoLgFAAAAAXNSR0IArs4c6QAAIABJREFUeF7t3T+oZVueF/A10IEgwggDCgpvCgYmGMEBkw4a3nvYgmCi0OBk7xUamIlgYlRVmWCggsEYSNXLBBF6MsFgqmGkZ8CgA4NuFN57WQcTdKA4QkN7fz37N7Nqv3PP373PWX8+B4p7696z117rs1bVPfd71p9fKR4ECBAgQIAAAQIECBAgQIAAAQIfCPwKDwIECBAgQIAAAQIECBAgQIAAgQ8FBCZGBAECBAgQIECAAAECBAgQIEBgJSAwMSQIECBAgAABAgQIECBAgAABAgITY4AAAQIECBAgQIAAAQIECBAgcFzADBMjhAABAgQIECBAgAABAgQIECCwEhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQOC5ghokRQoAAAQIECBAgQIAAAQIECBBYCQhMDAkCBAgQIECAAAECBAgQIECAgMDEGCBAgAABAgQIECBAgAABAgQIHBcww8QIIUCAAAECBAgQIECAAAECBAisBAQmhgQBAgQIECBAgAABAgQIECBAQGBiDBAgQIAAAQIECBAgQIAAAQIEjguYYWKEECBAgAABAgQIECBAgAABAgRWAgITQ4IAAQIECBAgQIAAAQIECBAgIDAxBggQIECAAAECBAgQIECAAAECxwXMMDFCCBAgQIAAAQIECBAgQIAAAQIrAYGJIUGAAAECBAgQIECAAAECBAgQEJgYAwQIECBAgAABAgQIECBAgACB4wJmmBghBAgQIECAAAECBAgQIECAAIGVgMDEkCBAgAABAgQIECBAgAABAgQICEyMAQIECBAgQIAAAQIECBAgQIDAcQEzTIwQAgQIECBAgAABAgQIECBAgMBKQGBiSBAgQIAAAQIECBAgQIAAAQIEBCbGAAECBAgQIECAAAECBAgQIEDguIAZJkYIAQIECBAgQIAAAQIECBAgQGAlIDAxJAgQIECAAAECBAgQIECAAAECAhNjgAABAgQIECBAgAABAgQIECBwXMAMEyOEAAECBAgQIECAAAECBAgQILASEJgYEgQIECBAgAABAgQIECBAgAABgYkxQIAAAQIECBAgQIAAAQIECBA4LmCGiRFCgAABAgQIECBAgAABAgQIEFgJCEwMCQIECBAgQIAAAQIECBAgQICAwMQYIECAAAECBAgQIECAAAECBAgcFzDDxAghQIAAAQIECBAgQIAAAQIECKwEBCaGBAECBAgQIECAAAECBAgQIEBAYGIMECBAgAABAgQIECBAgAABAgSOC5hhYoQQIECAAAECBAgQIECAAAECBFYCAhNDggABAgQIECBAgAABAgQIECAgMDEGCBAgQIAAAQIECBAgQIAAAQLHBcwwMUIIECBAgAABAgQIECBAgAABAisBgYkhQYAAAQIECBAgQIAAAQIECBAQmBgDBAgQIECAAAECBAgQIECAAIHjAmaYGCEECBAgQIAAAQIECBAgQIAAgZWAwMSQIECAAAECBAgQIECAAAECBAgITIwBAgQIECBAgAABAgQIECBAgMBxATNMjBACBAgQIECAAAECBAgQIECAwEpAYGJIECBAgAABAgQIECBAgAABAgQEJsYAAQIECBAgQIAAAQIECBAgQOC4gBkmRggBAgQIECBAgAABAgQIECBAYCUgMDEkCBAgQIAAAQIECBAgQIAAAQICE2OAAAECBAgQIECAAAECBAgQIHBcwAwTI4QAAQIECBAgQIAAAQIECBAgsBIQmBgSBAgQIECAAAECBAgQIECAAAGBiTFAgAABAgQIECBAgAABAgQIEDguYIaJEUKAAAECBAgQIECAAAECBAgQWAkITAwJAgQIECBAgAABAgQIECBAgIDAxBggQIAAAQIECBAgQIAAAQIECBwXMMPECCFAgAABAgQIECBAgAABAgQIrAQEJoYEAQIECBAgQIAAAQIECBAgQEBgYgwQIECAAAECBAgQIECAAAECBI4LmGFihBAgQIAAAQIECBAgQIAAAQIEVgICE0OCAAECBAgQIECAAAECBAgQICAwMQYIECBAgAABAgQIECBAgAABAscFzDAxQggQIECAAAECBAgQIECAAAECKwGBiSFBgAABAgQIECBAgAABAgQIEBCYGAMECBAgQIAAAQIECBAgQIAAgeMCZpgYIQQIECBAgAABAgQIECBAgACBlYDAxJAgQIAAAQIECBAgQIAAAQIECAhMjAECBAgQIECAAAECBAgQIECAwHEBM0yMEAIECBAgQIAAAQIECBAgQIDASkBgYkgQIECAAAECBAgQIECAAAECBAQmxgABAgQIECBAgAABAgQIECBA4LiAGSZGCAECBAgQIECAAAECBAgQIEBgJSAwMSQIECBAgAABAgQIECBAgAABAgITY4AAAQIECBAgQIAAAQIECBAgcFzADBMjhAABAgQIECBAgAABAgQIECCwEhCYGBIECBAgQIAAAQIECBAgQIAAAYGJMUCAAAECBAgQIECAAAECBAgQOC5ghokRQoAAAQIECBAgQIAAAQIECBBYCQhMDAkCBAgQIECAAAECBAgQIECAgMDEGCBAgAABAgQIECBAgAABAgQIHBcww8QIIUCAAAECBAgQIECAAAECBAisBAQmhgQBAgQIECBAgAABAgQIECBAQGBiDBAgQIAAAQIECBAgQIAAAQIEjguYYWKEECBAgAABAgQIECBAgAABAgRWAgITQ4IAAQIECBAgQIAAAQIECBAgIDAxBggQIECAAAECBAgQIECAAAECxwXMMDFCCBAgQIAAAQIECBAgQIAAAQIrAYGJIUGAAAECBAgQIECAAAECBAgQEJgYAwQIECBAgAABAgQIECBAgACB4wJmmBghBAgQIECAAAECBAgQIECAAIGVgMDEkCBAgAABAgQIECBAgAABAgQICEyMAQIECBAgQIAAAQIECBAgQIDAcQEzTIwQAgQIECBAgAABAgQIECBAgMBKQGBiSBAgQIAAAQIECBAgQIAAAQIEBCbGAAECBAgQIECAAAECBAgQIEDguIAZJkYIAQIECBAgQIAAAQIECBAgQGAlIDAxJAgQIECAAAECBAgQIECAAAECAhNjgAABAgQIECBAgAABAgQIECBwXMAMEyOEAAECBAgQIECAAAECBAgQILASEJgYEgQIECBAgAABAgQIECBAgAABgYkxQIAAAQIECBAgQIAAAQIECBA4LmCGiRFCgAABAgQIECBAgAABAgQIEFgJCEwMCQIECBAgQIAAAQIECBAgQICAwMQYIECAAAECBAgQIECAAAECBAgcFzDDxAghQIAAAQIECBAgQIAAAQIECKwEBCaGBAECBAgQIECAAAECBAgQIEBAYGIMECBAgAABAgQIECBAgAABAgSOC5hhYoQQIECAAAECBAgQIECAAAECBFYCAhNDggABAgQIECBAgAABAgQIECAgMDEGCBAgQIAAAQIECBAgQIAAAQLHBcwwMUIIECBAgAABAgQIECBAgAABAisBgYkhQYAAAQIECBAgQIAAAQIECBAQmBgD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QIAAAQIECBAgQIAAAQKbCQhMNqNUEAECBAgQIECAAAECBAgQIDCKgMBklJ7UDgIECBAgQIAAAQIECBAgQGAzAYHJZpQKIkCAAAECBAgQIECAAAECBEYREJiM0pPaQYAAAQIECBAgQIAAAQIECGwmIDDZjFJBBAgQIECAAAECBAgQIECAwCgCApNRelI7CBAgQIAAAQIECBAgQIAAgc0EBCabUSqIAAECBAgQIECAAAECBAgQGEVAYDJKT2oHAQIECBAgQIAAAQIECBAgsJmAwGQzSgURIECAAAECBAgQIECAAAECowgITEbpSe0gQIAAAQIECBAgQIAAAQIENhMQmGxGqSACBAgQIECAAAECBAgQIEBgFAGBySg9qR0ECBAgQIAAAQIECBAgQIDAZgICk80oFUSAAAECBAgQIECAAAECBAiMIiAwGaUntYMAAQIECBAgQIAAAQIECBDYTEBgshmlgggQIECAAAECBAgQIECAAIFRBAQmo/SkdhAgQIAAAQIECBAgQIAAAQKbCQhMNqNUEAECBAgQIECAAAECBAgQIDCKgMBklJ7UDgIECBAgQIAAAQIECBAgQGAzAYHJZpQKIkCAAAECBAgQIECAAAECBEYREJiM0pPaQYAAAQIECBAgQIAAAQIECGwmIDDZjFJBBAgQIECAAAECBAgQIECAwCgCApNRelI7CBAgQIAAAQIECBAgQIAAgc0EBCabUSqIAAECBAgQIECAAAECBAgQGEVAYDJKT2oHAQIECBAgQIAAAQIECBAgsJmAwGQzSgURIECAAAECBAgQIECAAAECowgITEbpSe0gQIAAAQIECBAgQIAAAQIENhMQmGxGqSACBAgQIECAAAECBAgQIEBgFAGBySg9qR0ECBAgQIAAAQIECBAgQIDAZgICk80oFUSAAAECBAgQIECAAAECBAiMIiAwGaUntYMAAQIECBAgQIAAAQIECBDYTEBgshmlgggQIECAAAECBAgQIECAAIFRBAQmo/SkdhAgQIAAAQIECBAgQIAAAQKbCQhMNqNUEAECBAgQIECAAAECBAgQIDCKgMBklJ7UDgIECBAgQIAAAQIECBAgQGAzAYHJZpQKIkCAAAECBAgQIECAAAECBEYREJiM0pPaQYAAAQIECBAgQIAAAQIECGwmIDDZjFJBBAgQIECAAAECBAgQIECAwCgC/x/SAkNeBwXJzAAAAABJRU5ErkJggg==', '213', '21', 0, 0, 1, 'Facebook Page', 'ewda', 'wedas', 'wadsc', 2, 'On-going', '', 0, '2024-06-05 07:36:30', '2024-06-05 07:36:30');

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
-- Dumping data for table `cs_cid_services`
--

INSERT INTO `cs_cid_services` (`cs_cid_service_id`, `cid_number`, `cid_service_id`, `cs_cid_service_created`, `cs_cid_service_updated`) VALUES
(1, '052024-1', 2, '2024-05-13 01:36:18', '2024-05-13 01:36:18');

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
-- Dumping data for table `cs_cid_technicians`
--

INSERT INTO `cs_cid_technicians` (`cs_cid_tech_id`, `cid_number`, `cid_technician_id`, `cs_cid_tech_created`, `cs_cid_tech_updated`) VALUES
(3, '052024-2', 2, '2024-05-15 09:57:51', '2024-05-16 02:46:47'),
(4, '052024-3', 2, '2024-05-29 09:25:05', '2024-05-29 09:25:05'),
(10, '062024-1', 2, '2024-06-02 17:55:18', '2024-06-02 17:55:18'),
(11, '062024-2', 2, '2024-06-02 17:56:51', '2024-06-02 17:56:51'),
(12, '062024-3', 2, '2024-06-02 19:51:02', '2024-06-02 19:51:02'),
(13, '052024-1', 2, '2024-06-02 21:03:40', '2024-06-02 21:03:40'),
(14, '062024-4', 2, '2024-06-05 07:36:30', '2024-06-05 07:36:30');

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
-- Dumping data for table `cs_cid_terms_of_service`
--

INSERT INTO `cs_cid_terms_of_service` (`cid_tos_id`, `cid_number`, `cid_tos_terms`, `cid_tos_agreement`, `cid_tos_created`) VALUES
(23, '052024-1', 1, 1, '2024-05-14 02:08:37'),
(24, '052024-1', 2, 1, '2024-05-14 02:08:37'),
(25, '052024-1', 3, 1, '2024-05-14 02:08:37'),
(26, '052024-1', 4, 1, '2024-05-14 02:08:37'),
(27, '052024-1', 5, 1, '2024-05-14 02:08:37'),
(28, '052024-1', 6, 1, '2024-05-14 02:08:37'),
(29, '052024-1', 7, 1, '2024-05-14 02:08:37'),
(30, '052024-1', 8, 1, '2024-05-14 02:08:37'),
(31, '052024-1', 9, 1, '2024-05-14 02:08:37'),
(32, '052024-1', 10, 1, '2024-05-14 02:08:37'),
(33, '052024-1', 11, 1, '2024-05-14 02:08:37'),
(34, '052024-1', 12, 1, '2024-05-14 02:08:37'),
(35, '052024-1', 13, 1, '2024-05-14 02:08:37'),
(36, '052024-1', 14, 1, '2024-05-14 02:08:37'),
(37, '052024-1', 15, 1, '2024-05-14 02:08:37'),
(38, '052024-1', 16, 1, '2024-05-14 02:08:37'),
(39, '052024-1', 17, 1, '2024-05-14 02:08:37'),
(40, '052024-1', 18, 1, '2024-05-14 02:08:37'),
(41, '052024-1', 19, 1, '2024-05-14 02:08:37'),
(42, '052024-1', 20, 1, '2024-05-14 02:08:37'),
(43, '052024-1', 21, 1, '2024-05-14 02:08:37'),
(44, '052024-1', 22, 1, '2024-05-14 02:08:37'),
(45, '052024-2', 1, 1, '2024-05-15 09:57:51'),
(46, '052024-2', 2, 1, '2024-05-15 09:57:51'),
(47, '052024-2', 3, 1, '2024-05-15 09:57:51'),
(48, '052024-2', 4, 1, '2024-05-15 09:57:51'),
(49, '052024-2', 5, 1, '2024-05-15 09:57:51'),
(50, '052024-2', 6, 1, '2024-05-15 09:57:51'),
(51, '052024-2', 7, 1, '2024-05-15 09:57:51'),
(52, '052024-2', 8, 1, '2024-05-15 09:57:51'),
(53, '052024-2', 9, 1, '2024-05-15 09:57:51'),
(54, '052024-2', 10, 1, '2024-05-15 09:57:51'),
(55, '052024-2', 11, 1, '2024-05-15 09:57:51'),
(56, '052024-2', 12, 1, '2024-05-15 09:57:51'),
(57, '052024-2', 13, 1, '2024-05-15 09:57:51'),
(58, '052024-2', 14, 1, '2024-05-15 09:57:51'),
(59, '052024-2', 15, 1, '2024-05-15 09:57:51'),
(60, '052024-2', 16, 1, '2024-05-15 09:57:51'),
(61, '052024-2', 17, 1, '2024-05-15 09:57:51'),
(62, '052024-2', 18, 1, '2024-05-15 09:57:51'),
(63, '052024-2', 19, 1, '2024-05-15 09:57:51'),
(64, '052024-2', 20, 1, '2024-05-15 09:57:51'),
(65, '052024-2', 21, 1, '2024-05-15 09:57:51'),
(66, '052024-2', 22, 1, '2024-05-15 09:57:51'),
(67, '052024-3', 1, 1, '2024-05-29 09:25:05'),
(68, '052024-3', 2, 1, '2024-05-29 09:25:05'),
(69, '052024-3', 3, 1, '2024-05-29 09:25:05'),
(70, '052024-3', 4, 1, '2024-05-29 09:25:05'),
(71, '052024-3', 5, 1, '2024-05-29 09:25:05'),
(72, '052024-3', 6, 1, '2024-05-29 09:25:05'),
(73, '052024-3', 7, 1, '2024-05-29 09:25:05'),
(74, '052024-3', 8, 1, '2024-05-29 09:25:05'),
(75, '052024-3', 9, 1, '2024-05-29 09:25:05'),
(76, '052024-3', 10, 1, '2024-05-29 09:25:05'),
(77, '052024-3', 11, 1, '2024-05-29 09:25:05'),
(78, '052024-3', 12, 1, '2024-05-29 09:25:05'),
(79, '052024-3', 13, 1, '2024-05-29 09:25:05'),
(80, '052024-3', 14, 1, '2024-05-29 09:25:05'),
(81, '052024-3', 15, 1, '2024-05-29 09:25:05'),
(82, '052024-3', 16, 1, '2024-05-29 09:25:05'),
(83, '052024-3', 17, 1, '2024-05-29 09:25:05'),
(84, '052024-3', 18, 1, '2024-05-29 09:25:05'),
(85, '052024-3', 19, 1, '2024-05-29 09:25:05'),
(86, '052024-3', 20, 1, '2024-05-29 09:25:05'),
(87, '052024-3', 21, 1, '2024-05-29 09:25:05'),
(88, '052024-3', 22, 1, '2024-05-29 09:25:05'),
(89, '062024-1', 1, 1, '2024-06-02 17:55:18'),
(90, '062024-1', 2, 1, '2024-06-02 17:55:18'),
(91, '062024-1', 3, 1, '2024-06-02 17:55:18'),
(92, '062024-1', 4, 1, '2024-06-02 17:55:18'),
(93, '062024-1', 5, 1, '2024-06-02 17:55:18'),
(94, '062024-1', 6, 1, '2024-06-02 17:55:18'),
(95, '062024-1', 7, 1, '2024-06-02 17:55:18'),
(96, '062024-1', 8, 1, '2024-06-02 17:55:18'),
(97, '062024-1', 9, 1, '2024-06-02 17:55:18'),
(98, '062024-1', 10, 1, '2024-06-02 17:55:18'),
(99, '062024-1', 11, 1, '2024-06-02 17:55:18'),
(100, '062024-1', 12, 1, '2024-06-02 17:55:18'),
(101, '062024-1', 13, 1, '2024-06-02 17:55:18'),
(102, '062024-1', 14, 1, '2024-06-02 17:55:18'),
(103, '062024-1', 15, 1, '2024-06-02 17:55:18'),
(104, '062024-1', 16, 1, '2024-06-02 17:55:18'),
(105, '062024-1', 17, 1, '2024-06-02 17:55:18'),
(106, '062024-1', 18, 1, '2024-06-02 17:55:18'),
(107, '062024-1', 19, 1, '2024-06-02 17:55:18'),
(108, '062024-1', 20, 1, '2024-06-02 17:55:18'),
(109, '062024-1', 21, 1, '2024-06-02 17:55:18'),
(110, '062024-1', 22, 1, '2024-06-02 17:55:18'),
(111, '062024-2', 1, 1, '2024-06-02 17:56:51'),
(112, '062024-2', 2, 1, '2024-06-02 17:56:51'),
(113, '062024-2', 3, 1, '2024-06-02 17:56:51'),
(114, '062024-2', 4, 1, '2024-06-02 17:56:51'),
(115, '062024-2', 5, 1, '2024-06-02 17:56:51'),
(116, '062024-2', 6, 1, '2024-06-02 17:56:51'),
(117, '062024-2', 7, 1, '2024-06-02 17:56:51'),
(118, '062024-2', 8, 1, '2024-06-02 17:56:51'),
(119, '062024-2', 9, 1, '2024-06-02 17:56:51'),
(120, '062024-2', 10, 1, '2024-06-02 17:56:51'),
(121, '062024-2', 11, 1, '2024-06-02 17:56:51'),
(122, '062024-2', 12, 1, '2024-06-02 17:56:51'),
(123, '062024-2', 13, 1, '2024-06-02 17:56:51'),
(124, '062024-2', 14, 1, '2024-06-02 17:56:51'),
(125, '062024-2', 15, 1, '2024-06-02 17:56:51'),
(126, '062024-2', 16, 1, '2024-06-02 17:56:51'),
(127, '062024-2', 17, 1, '2024-06-02 17:56:51'),
(128, '062024-2', 18, 1, '2024-06-02 17:56:51'),
(129, '062024-2', 19, 1, '2024-06-02 17:56:51'),
(130, '062024-2', 20, 1, '2024-06-02 17:56:51'),
(131, '062024-2', 21, 1, '2024-06-02 17:56:51'),
(132, '062024-2', 22, 1, '2024-06-02 17:56:51'),
(133, '062024-3', 1, 1, '2024-06-02 19:51:02'),
(134, '062024-3', 2, 1, '2024-06-02 19:51:02'),
(135, '062024-3', 3, 1, '2024-06-02 19:51:02'),
(136, '062024-3', 4, 1, '2024-06-02 19:51:02'),
(137, '062024-3', 5, 1, '2024-06-02 19:51:02'),
(138, '062024-3', 6, 1, '2024-06-02 19:51:02'),
(139, '062024-3', 7, 1, '2024-06-02 19:51:02'),
(140, '062024-3', 8, 1, '2024-06-02 19:51:02'),
(141, '062024-3', 9, 1, '2024-06-02 19:51:02'),
(142, '062024-3', 10, 1, '2024-06-02 19:51:02'),
(143, '062024-3', 11, 1, '2024-06-02 19:51:02'),
(144, '062024-3', 12, 1, '2024-06-02 19:51:02'),
(145, '062024-3', 13, 1, '2024-06-02 19:51:02'),
(146, '062024-3', 14, 1, '2024-06-02 19:51:02'),
(147, '062024-3', 15, 1, '2024-06-02 19:51:02'),
(148, '062024-3', 16, 1, '2024-06-02 19:51:02'),
(149, '062024-3', 17, 1, '2024-06-02 19:51:02'),
(150, '062024-3', 18, 1, '2024-06-02 19:51:03'),
(151, '062024-3', 19, 1, '2024-06-02 19:51:03'),
(152, '062024-3', 20, 1, '2024-06-02 19:51:03'),
(153, '062024-3', 21, 1, '2024-06-02 19:51:03'),
(154, '062024-3', 22, 1, '2024-06-02 19:51:03'),
(155, '062024-4', 1, 1, '2024-06-05 07:36:30'),
(156, '062024-4', 2, 1, '2024-06-05 07:36:30'),
(157, '062024-4', 3, 1, '2024-06-05 07:36:30'),
(158, '062024-4', 4, 1, '2024-06-05 07:36:30'),
(159, '062024-4', 5, 1, '2024-06-05 07:36:30'),
(160, '062024-4', 6, 1, '2024-06-05 07:36:30'),
(161, '062024-4', 7, 1, '2024-06-05 07:36:30'),
(162, '062024-4', 8, 1, '2024-06-05 07:36:30'),
(163, '062024-4', 9, 1, '2024-06-05 07:36:30'),
(164, '062024-4', 10, 1, '2024-06-05 07:36:30'),
(165, '062024-4', 11, 1, '2024-06-05 07:36:30'),
(166, '062024-4', 12, 1, '2024-06-05 07:36:30'),
(167, '062024-4', 13, 1, '2024-06-05 07:36:30'),
(168, '062024-4', 14, 1, '2024-06-05 07:36:30'),
(169, '062024-4', 15, 1, '2024-06-05 07:36:30'),
(170, '062024-4', 16, 1, '2024-06-05 07:36:30'),
(171, '062024-4', 17, 1, '2024-06-05 07:36:30'),
(172, '062024-4', 18, 1, '2024-06-05 07:36:30'),
(173, '062024-4', 19, 1, '2024-06-05 07:36:30'),
(174, '062024-4', 20, 1, '2024-06-05 07:36:30'),
(175, '062024-4', 21, 1, '2024-06-05 07:36:30'),
(176, '062024-4', 22, 1, '2024-06-05 07:36:30');

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
-- Dumping data for table `cs_cid_terms_of_service_a`
--

INSERT INTO `cs_cid_terms_of_service_a` (`cid_tos_a_id`, `tos_id`, `cid_number`, `cid_tos_agreement`, `cid_tos_a_created`, `cid_tos_a_updated`) VALUES
(4, 5, '052024-1', 0, '2024-05-14 02:08:37', '2024-05-14 02:08:37'),
(5, 6, '052024-1', 0, '2024-05-14 02:08:37', '2024-05-14 02:08:37'),
(6, 4, '052024-1', 1, '2024-05-14 02:08:37', '2024-05-14 02:08:37'),
(7, 5, '052024-2', 1, '2024-05-15 09:57:51', '2024-05-15 09:57:51'),
(8, 6, '052024-2', 1, '2024-05-15 09:57:51', '2024-05-15 09:57:51'),
(9, 4, '052024-2', 1, '2024-05-15 09:57:51', '2024-05-15 09:57:51'),
(10, 5, '052024-3', 0, '2024-05-29 09:25:05', '2024-05-29 09:25:05'),
(11, 6, '052024-3', 0, '2024-05-29 09:25:05', '2024-05-29 09:25:05'),
(12, 4, '052024-3', 1, '2024-05-29 09:25:05', '2024-05-29 09:25:05');

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
-- Dumping data for table `cs_cms`
--

INSERT INTO `cs_cms` (`cms_id`, `cms_logo`, `cms_company_name`, `cms_email`, `cms_cp1`, `cms_cp2`, `cms_cp3`, `cms_address`, `cms_acknowledgement`, `cms_disclaimer`, `cms_updated`) VALUES
(1, 'data:image/png;base64,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', 'TechyDavid I.T Solutions', 'techydavid2020@techydavid.com', '0968 855 5399', '0961 149 4441', '046-424-5604', 'Daisy St. Plaridel 3 Subd. Bayan Luma 7 , Imus, Philippines', 'I hereby acknowledge that I have received and throughly reviewed the diagnostic summary provided by the TECHYDAVID I.T SOLUTIONS .1. The diagnostic summary outlines the\nfindings ,recommendations , and necessary repairs for the units or items in questions. I have the opportunity to discuss and clarify the questions. I understand that any actions or\ndecisions made regarding the repairs and recommendations mentioned in the diagnostic summary are my sole responsibility.4.TECHYDAVID I.T SOLUTIONS is not liable to any\nconsequences ,damages, or losses that may arise from my decisions or actions taken based on the diagnostic summary or representatives explanations. Furthermore, I confirm\nthat I have recieved all the items mentioned in our agreement and find them to be complete and in satisfactory conditions. By signing below, I acknowledge that I have read,\nunderstood and agree terms outlined in the disclaimer.', 'Confidentiality, Copyright and other Intellectual property rights.\nThe information contained herein is confidential and proprietary to TECHYDAVID I.T SOLUTIONS.It may not be disclosed or transferred, directly or indirectly, to any third party without\nthe explicit written permission of TECHYDAVID I.T SOLUTIONS. All rights reserved. No part of this document may be reproduced, stored in a retrieval system, tran', '2024-06-11 00:23:35');

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
-- Dumping data for table `cs_devices`
--

INSERT INTO `cs_devices` (`cs_device_id`, `cs_device_name`, `isDeleted`, `cs_device_created`, `cs_device_updated`) VALUES
(1, 'Laptop', 0, '2024-05-10 01:52:33', '2024-05-30 19:13:34'),
(2, 'Cellphone', 0, '2024-05-10 01:52:33', '2024-06-03 17:14:36'),
(4, 'Computer', 0, '2024-05-30 19:13:21', '2024-05-30 19:13:21'),
(5, 'Printer', 0, '2024-05-30 19:13:45', '2024-05-30 19:13:45');

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
-- Dumping data for table `cs_mop`
--

INSERT INTO `cs_mop` (`cs_mop_id`, `cs_mop_name`, `cs_mop_fee`, `isDeleted`, `cs_mop_created`, `cs_mop_updated`) VALUES
(1, 'Cash', 0, 0, '2024-06-11 00:40:41', '2024-06-11 01:34:15'),
(2, 'Credit Card', 3, 0, '2024-06-11 00:56:10', '2024-06-12 07:15:17'),
(3, 'Maya', 3, 0, '2024-06-11 00:58:50', '2024-06-11 00:58:50'),
(4, 'GCash', 0, 0, '2024-06-11 00:59:05', '2024-06-11 00:59:05'),
(5, 'Bank Transfer', 3, 0, '2024-06-11 01:00:06', '2024-06-11 01:00:06');

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
-- Dumping data for table `cs_payment`
--

INSERT INTO `cs_payment` (`cs_p_id`, `cs_p_note`, `cs_p_amount`, `cs_p_mop`, `cid_number`, `cs_p_reference`, `cs_p_vat`, `cs_p_cf`, `cs_p_total`, `cs_p_paid_date`, `cs_p_ds`, `cs_p_or`, `cs_p_balance`, `isDeleted`, `cs_p_created`, `cs_p_updated`) VALUES
(5, 'dp for lcd asdwas', 2000, 3, '062024-3', '111', 480, 60, 4480, '2024-06-12 07:06:00', '0', '0', 2480, 0, '2024-06-11 23:06:11', '2024-06-11 23:29:51');

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
-- Dumping data for table `cs_services`
--

INSERT INTO `cs_services` (`cs_service_id`, `cs_service_name`, `isDeleted`, `cs_service_created`, `cs_service_updated`) VALUES
(1, 'Advanced Diagnostic', 0, '2024-04-03 05:14:25', '2024-06-11 01:12:25'),
(2, 'Board Repair', 0, '2024-04-03 05:14:34', '2024-05-10 01:44:32'),
(3, 'Troubleshooting', 0, '2024-04-03 07:37:40', '2024-05-10 01:45:20'),
(4, 'Detailed Cleaning', 0, '2024-04-03 07:37:40', '2024-05-10 01:45:41'),
(5, 'Data Recovery', 0, '2024-04-03 07:38:03', '2024-05-10 01:45:54'),
(6, 'Reformat', 0, '2024-04-03 07:38:03', '2024-05-10 01:47:26'),
(30, 'LCD', 0, '2024-06-05 07:57:56', '2024-06-05 07:57:56');

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
-- Dumping data for table `cs_settings`
--

INSERT INTO `cs_settings` (`cs_settings_id`, `cs_settings_name`, `cs_settings_value`, `cs_settings_unit`, `cs_settings_added`, `cs_settings_updated`) VALUES
(1, 'technician_notification', 7, 'day', '2024-05-07 01:59:43', '2024-06-12 00:14:11'),
(2, 'vat_value', 12, '', '2024-06-10 20:03:56', '2024-06-11 21:38:46');

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
-- Dumping data for table `cs_sources`
--

INSERT INTO `cs_sources` (`cs_source_id`, `cs_source_name`, `isDeleted`, `cs_source_created`, `cs_source_updated`) VALUES
(1, 'Facebook Page', 0, '2024-06-02 19:27:28', '2024-06-02 19:27:37'),
(2, 'Referral', 0, '2024-06-02 19:27:28', '2024-06-02 19:27:28'),
(3, 'Google', 0, '2024-06-02 19:27:51', '2024-06-02 19:27:51'),
(4, 'Walk-ins', 0, '2024-06-02 19:37:13', '2024-06-02 20:55:12'),
(5, 'Tiktok', 0, '2024-06-05 07:59:58', '2024-06-05 07:59:58');

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
-- Dumping data for table `cs_terms_of_service`
--

INSERT INTO `cs_terms_of_service` (`tos_id`, `tos_content`, `tos_required`, `tos_sequence`, `isDeleted`, `tos_created`, `tos_updated`) VALUES
(1, 'FREE INITIAL CHECK-UP limited to Physical and Basic Troubleshooting.\n', 1, 2, 0, '2024-04-05 02:19:06', '2024-06-02 20:57:39'),
(2, 'You must be of legal age. If not, additional consent from a legal guardian is required. 1', 1, 1, 0, '2024-04-05 02:40:12', '2024-06-02 20:57:34'),
(3, 'The client is MANDATORY to avail deep cleaning service for units with significant debris and dirt accumulation so that skilled technicians can proceed with diagnosing the issue.', 1, 3, 0, '2024-04-05 02:40:29', '2024-05-28 16:39:48'),
(4, 'Ensure your data is backed up before we access your system. We\'re not liable for data loss. If you haven\'t backed up, contact us to arrange it. Be aware that hard drive failure or malware can cause data loss during our check-up. We might need to reinstall your operating system; let us know if you want data backed up, but this incurs extra charges.', 1, 4, 0, '2024-04-05 02:42:23', '2024-05-28 16:39:50'),
(5, 'Physical verification happens at TECHYDAVID I.T SOLUTIONS\' Physical Store.', 1, 5, 0, '2024-04-05 02:43:14', '2024-04-05 02:43:29'),
(6, 'Your system must have a License Windows or Apple OS X OS; we\'ll install a retail version if needed, with additional costs and time. We can\'t work on unlicensed Operating System.', 1, 6, 0, '2024-04-05 02:44:00', '2024-04-05 02:44:00'),
(7, 'REMOTE REPAIR: We\'ll do our best to solve requested issues remotely. If needed, we\'ll discuss options for repair. Conditions: Services within Standard Business Hours: 9:00 AM - 8:00 PM, MON - SAT, except Holidays', 1, 7, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(8, 'Board Repair Units: Lead time mostly 3-5 months and above depending on the issue, client is informed first to proceed , if client change of mind incurs charges a specific amount.', 1, 8, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(9, 'Technical Parts: If it becomes necessary to order parts to proceed with the repair, please be aware that we do not have control over the shipment lead time of parts from the manufacturer.', 1, 9, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(10, 'Data Recovery: As part of the data recovery process, it is essential to inform you that we are unable to selectively choose which chance to be recovered. In the event of unsuccessful data recovery, a fee of P1,500.00 will be charged as an Advance Diagnostic Service Fee.', 1, 10, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(11, 'Advertising: We may use before and after pictures of your unit for promotion. We can add our company sticker for tracking and advertising.', 1, 11, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(12, 'Third-Party Pickups: We\'re not responsible for items picked up via Lalamove/Grab & other Courier that may affect the unit. We guarantee test and make sure complete units before release. Down payment of 80% is required.', 1, 12, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(13, 'RTO Units Notice: Client(s) are informed about RTO (Return to the owner) units. Units are released unless client specifies a reason for delay. Kindly Relay to Pick-up Responsibility.', 1, 13, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(14, 'BRAND AWARENESS: Client must uphold the TECHYDAVID I.T SOLUTIONS brand and refrain from disseminating negative Information or comments that undermine or are detrimental to TECHYDAVID I.T SOLUTIONS, the brand, and its products and employees, through any means (including but not limited to verbal, written, screenshots ,online, or media channels). Negotiation must be done between TECHYDAVID I.T SOLUTIONS and Client only.', 1, 14, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(15, 'Unforeseen Issues During Repair: During repair, unexpected problems may arise. We\'re not responsible for resulting to any damages.', 1, 15, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(16, 'Act of God Circumstances: TECHYDAVID IT SOLUTIONS shall not be liable for the damage on Items in case of fire ,earthquake,-flood and other similar natural calamities.', 1, 16, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(17, 'Confidential Accounts: It is the client\'s responsibility to ensure the secure management of sensitive and confidential accounts by logging out of them appropriately.', 1, 17, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(18, 'Claiming Slip Requirement: claiming slip is mandatory, In the event of a missing claiming slip, please present a valid government ID for verification.', 1, 18, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(19, 'Client Rights: Clients can request a copy of these terms and unit diagnosis details upon request.', 1, 19, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(20, 'When Initiating a warranty claim, please be aware that we have implemented a mandatory inspection procedure. This step ensures that our technical experts can thoroughly assess the issue before proceeding with the claim. This approach enables us to address your concern promptly and accurately. NO OFFICIAL RECEIPT NO WARRANTY.', 1, 20, 0, '2024-04-05 02:48:40', '2024-04-05 02:48:40'),
(21, 'Payments must be made exclusively through authorized payment channels. Official receipt turnover upon completion\nof service.', 1, 21, 0, '2024-04-05 02:48:40', '2024-04-15 03:16:04'),
(22, 'We exclusively accommodate individuals who have signed agreements for updates and concerns.', 1, 22, 0, '2024-04-15 03:17:04', '2024-04-15 03:17:04');

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

--
-- Dumping data for table `login_account`
--

INSERT INTO `login_account` (`id`, `user_id`, `last_login`) VALUES
(1, 3, '2024-06-12 07:14:44');

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

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `user_id`, `action`, `table_name`, `record_id`, `cid_number`, `timestamp`) VALUES
(1, 1, 'logout', 'cs_users', 1, NULL, '2024-06-12 00:36:34'),
(2, 3, 'login', 'cs_users', 3, NULL, '2024-06-12 00:36:37'),
(3, 3, 'update', 'cs_users', 1, NULL, '2024-06-12 00:36:50'),
(4, 3, 'logout', 'cs_users', 3, NULL, '2024-06-12 00:53:01'),
(5, 2, 'login', 'cs_users', 2, NULL, '2024-06-12 00:53:04'),
(6, 2, 'update', 'cs_cid_information', 2, '052024-1', '2024-06-12 00:53:10'),
(7, 2, 'logout', 'cs_users', 2, NULL, '2024-06-12 00:53:14'),
(8, 3, 'login', 'cs_users', 3, NULL, '2024-06-12 00:53:17'),
(9, 3, 'logout', 'cs_users', 3, NULL, '2024-06-12 01:21:55'),
(10, 2, 'login', 'cs_users', 2, NULL, '2024-06-12 01:22:01'),
(11, 2, 'update', 'cs_cid_checklist', 8, '062024-3', '2024-06-12 01:22:28'),
(12, 2, 'logout', 'cs_users', 2, NULL, '2024-06-12 01:22:32'),
(13, 3, 'login', 'cs_users', 3, NULL, '2024-06-12 01:22:36'),
(14, 3, 'logout', 'cs_users', 3, NULL, '2024-06-12 01:45:53'),
(15, 1, 'login', 'cs_users', 1, NULL, '2024-06-12 01:45:56'),
(16, 1, 'logout', 'cs_users', 1, NULL, '2024-06-12 01:49:54'),
(17, 3, 'login', 'cs_users', 3, NULL, '2024-06-12 01:49:57'),
(18, 3, 'logout', 'cs_users', 3, NULL, '2024-06-12 01:56:13'),
(19, 1, 'login', 'cs_users', 1, NULL, '2024-06-12 01:56:20'),
(20, 3, 'login', 'cs_users', 3, NULL, '2024-06-12 07:11:43'),
(21, 3, 'logout', 'cs_users', 3, NULL, '2024-06-12 07:12:02'),
(22, 3, 'login', 'cs_users', 3, NULL, '2024-06-12 07:12:10'),
(23, 3, 'logout', 'cs_users', 3, NULL, '2024-06-12 07:12:26'),
(24, 2, 'login', 'cs_users', 2, NULL, '2024-06-12 07:12:29'),
(25, 2, 'logout', 'cs_users', 2, NULL, '2024-06-12 07:14:39'),
(26, 3, 'login', 'cs_users', 3, NULL, '2024-06-12 07:14:44'),
(27, 3, 'update', 'cs_mop', 2, NULL, '2024-06-12 07:15:17');

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

-- --------------------------------------------------------

--
-- Table structure for table `test_table`
--

CREATE TABLE `test_table` (
  `test_id` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_table`
--

INSERT INTO `test_table` (`test_id`, `test_name`) VALUES
(1, 'Test_1'),
(2, 'Test_2'),
(3, '123'),
(4, '321'),
(5, '12334');

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
  MODIFY `cid_cs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `cid_recommendations`
--
ALTER TABLE `cid_recommendations`
  MODIFY `cid_r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cid_summary_of_payments`
--
ALTER TABLE `cid_summary_of_payments`
  MODIFY `cid_sop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cid_summary_of_payments_r`
--
ALTER TABLE `cid_summary_of_payments_r`
  MODIFY `cid_sop_r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cid_summary_of_repairs`
--
ALTER TABLE `cid_summary_of_repairs`
  MODIFY `cid_sor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `cs_cid_checklist`
--
ALTER TABLE `cs_cid_checklist`
  MODIFY `cs_cid_c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cs_cid_information`
--
ALTER TABLE `cs_cid_information`
  MODIFY `cid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cs_cid_services`
--
ALTER TABLE `cs_cid_services`
  MODIFY `cs_cid_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cs_cid_technicians`
--
ALTER TABLE `cs_cid_technicians`
  MODIFY `cs_cid_tech_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cs_cid_terms_of_service`
--
ALTER TABLE `cs_cid_terms_of_service`
  MODIFY `cid_tos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `cs_cid_terms_of_service_a`
--
ALTER TABLE `cs_cid_terms_of_service_a`
  MODIFY `cid_tos_a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cs_cms`
--
ALTER TABLE `cs_cms`
  MODIFY `cms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cs_devices`
--
ALTER TABLE `cs_devices`
  MODIFY `cs_device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cs_mop`
--
ALTER TABLE `cs_mop`
  MODIFY `cs_mop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cs_payment`
--
ALTER TABLE `cs_payment`
  MODIFY `cs_p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cs_services`
--
ALTER TABLE `cs_services`
  MODIFY `cs_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `cs_settings`
--
ALTER TABLE `cs_settings`
  MODIFY `cs_settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cs_sources`
--
ALTER TABLE `cs_sources`
  MODIFY `cs_source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cs_terms_of_service`
--
ALTER TABLE `cs_terms_of_service`
  MODIFY `tos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cs_tos_additional`
--
ALTER TABLE `cs_tos_additional`
  MODIFY `tos_a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cs_users`
--
ALTER TABLE `cs_users`
  MODIFY `csu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `login_account`
--
ALTER TABLE `login_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `test_table`
--
ALTER TABLE `test_table`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
