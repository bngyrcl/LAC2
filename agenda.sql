-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2025 at 07:54 AM
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
-- Database: `agenda`
--

-- --------------------------------------------------------

--
-- Table structure for table `m3_agenda`
--

CREATE TABLE `m3_agenda` (
  `agenda_ID` int(11) NOT NULL,
  `measure_ID` int(11) DEFAULT NULL,
  `session_ID` int(11) DEFAULT NULL,
  `agenda_title` varchar(255) DEFAULT NULL,
  `agenda_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `agenda_status` varchar(50) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `modified_date` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m3_agenda_builder`
--

CREATE TABLE `m3_agenda_builder` (
  `builder_ID` int(11) NOT NULL,
  `agenda_ID` int(11) DEFAULT NULL,
  `draft_status` varchar(50) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `sequence_order` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(100) DEFAULT NULL,
  `approval_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m3_agenda_items`
--

CREATE TABLE `m3_agenda_items` (
  `agenda_item_ID` int(11) NOT NULL,
  `agenda_ID` int(11) DEFAULT NULL,
  `measure_ID` int(11) DEFAULT NULL,
  `item_type` varchar(100) DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  `item_status` varchar(50) DEFAULT NULL,
  `item_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m3_calendar_resources`
--

CREATE TABLE `m3_calendar_resources` (
  `calendar_resource_ID` int(11) NOT NULL,
  `event_ID` int(11) DEFAULT NULL,
  `resource_type` varchar(100) DEFAULT NULL,
  `resource_name` varchar(255) DEFAULT NULL,
  `availability_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m3_deadline`
--

CREATE TABLE `m3_deadline` (
  `deadline_ID` int(11) NOT NULL,
  `measure_ID` int(11) DEFAULT NULL,
  `agenda_ID` int(11) DEFAULT NULL,
  `deadline_type` varchar(100) DEFAULT NULL,
  `deadline_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `responsibility_party` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m3_event_calendar`
--

CREATE TABLE `m3_event_calendar` (
  `event_ID` int(11) NOT NULL,
  `agenda_ID` int(11) DEFAULT NULL,
  `session_ID` int(11) DEFAULT NULL,
  `event_type` varchar(100) DEFAULT NULL,
  `event_datetime` datetime DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `organizer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m3_notifications`
--

CREATE TABLE `m3_notifications` (
  `notif_ID` int(11) NOT NULL,
  `measure_ID` int(11) DEFAULT NULL,
  `agenda_ID` int(11) DEFAULT NULL,
  `event_ID` int(11) DEFAULT NULL,
  `notification_type` varchar(50) DEFAULT NULL,
  `recipient` varchar(100) DEFAULT NULL,
  `message_content` text DEFAULT NULL,
  `sent_date` datetime DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `priority_level` varchar(50) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m3_reminders`
--

CREATE TABLE `m3_reminders` (
  `reminder_ID` int(11) NOT NULL,
  `deadline_ID` int(11) DEFAULT NULL,
  `notif_ID` int(11) DEFAULT NULL,
  `reminder_date` datetime DEFAULT NULL,
  `reminder_type` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `days_before` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m3_special_sessions`
--

CREATE TABLE `m3_special_sessions` (
  `special_session_ID` int(11) NOT NULL,
  `session_ID` int(11) DEFAULT NULL,
  `session_purpose` varchar(255) DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `requested_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordinances_test`
--

CREATE TABLE `ordinances_test` (
  `ordinance_id` int(11) NOT NULL,
  `ordinance_number` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date_passed` date DEFAULT NULL,
  `status` enum('Draft','Pending','Approved','Rejected') DEFAULT 'Draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions_test`
--

CREATE TABLE `sessions_test` (
  `session_id` int(11) NOT NULL,
  `session_date` date NOT NULL,
  `session_type` enum('Regular','Special') DEFAULT 'Regular',
  `presiding_officer` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `avatar_url` varchar(255) NOT NULL DEFAULT 'assets/img/default-avatar.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `date_created`, `avatar_url`) VALUES
(1, 'admin', 'admin', 'admin@lgu.gov.ph', '2025-08-19 15:58:49', 'assets/img/default-avatar.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m3_agenda`
--
ALTER TABLE `m3_agenda`
  ADD PRIMARY KEY (`agenda_ID`);

--
-- Indexes for table `m3_agenda_builder`
--
ALTER TABLE `m3_agenda_builder`
  ADD PRIMARY KEY (`builder_ID`),
  ADD KEY `agenda_ID` (`agenda_ID`);

--
-- Indexes for table `m3_agenda_items`
--
ALTER TABLE `m3_agenda_items`
  ADD PRIMARY KEY (`agenda_item_ID`),
  ADD KEY `agenda_ID` (`agenda_ID`);

--
-- Indexes for table `m3_calendar_resources`
--
ALTER TABLE `m3_calendar_resources`
  ADD PRIMARY KEY (`calendar_resource_ID`),
  ADD KEY `event_ID` (`event_ID`);

--
-- Indexes for table `m3_deadline`
--
ALTER TABLE `m3_deadline`
  ADD PRIMARY KEY (`deadline_ID`),
  ADD KEY `agenda_ID` (`agenda_ID`);

--
-- Indexes for table `m3_event_calendar`
--
ALTER TABLE `m3_event_calendar`
  ADD PRIMARY KEY (`event_ID`),
  ADD KEY `agenda_ID` (`agenda_ID`);

--
-- Indexes for table `m3_notifications`
--
ALTER TABLE `m3_notifications`
  ADD PRIMARY KEY (`notif_ID`),
  ADD KEY `agenda_ID` (`agenda_ID`),
  ADD KEY `event_ID` (`event_ID`);

--
-- Indexes for table `m3_reminders`
--
ALTER TABLE `m3_reminders`
  ADD PRIMARY KEY (`reminder_ID`),
  ADD KEY `deadline_ID` (`deadline_ID`),
  ADD KEY `notif_ID` (`notif_ID`);

--
-- Indexes for table `m3_special_sessions`
--
ALTER TABLE `m3_special_sessions`
  ADD PRIMARY KEY (`special_session_ID`);

--
-- Indexes for table `ordinances_test`
--
ALTER TABLE `ordinances_test`
  ADD PRIMARY KEY (`ordinance_id`),
  ADD UNIQUE KEY `ordinance_number` (`ordinance_number`);

--
-- Indexes for table `sessions_test`
--
ALTER TABLE `sessions_test`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m3_agenda`
--
ALTER TABLE `m3_agenda`
  MODIFY `agenda_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3_agenda_builder`
--
ALTER TABLE `m3_agenda_builder`
  MODIFY `builder_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3_agenda_items`
--
ALTER TABLE `m3_agenda_items`
  MODIFY `agenda_item_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3_calendar_resources`
--
ALTER TABLE `m3_calendar_resources`
  MODIFY `calendar_resource_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3_deadline`
--
ALTER TABLE `m3_deadline`
  MODIFY `deadline_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3_event_calendar`
--
ALTER TABLE `m3_event_calendar`
  MODIFY `event_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3_notifications`
--
ALTER TABLE `m3_notifications`
  MODIFY `notif_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3_reminders`
--
ALTER TABLE `m3_reminders`
  MODIFY `reminder_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3_special_sessions`
--
ALTER TABLE `m3_special_sessions`
  MODIFY `special_session_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ordinances_test`
--
ALTER TABLE `ordinances_test`
  MODIFY `ordinance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions_test`
--
ALTER TABLE `sessions_test`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m3_agenda_builder`
--
ALTER TABLE `m3_agenda_builder`
  ADD CONSTRAINT `m3_agenda_builder_ibfk_1` FOREIGN KEY (`agenda_ID`) REFERENCES `m3_agenda` (`agenda_ID`) ON DELETE CASCADE;

--
-- Constraints for table `m3_agenda_items`
--
ALTER TABLE `m3_agenda_items`
  ADD CONSTRAINT `m3_agenda_items_ibfk_1` FOREIGN KEY (`agenda_ID`) REFERENCES `m3_agenda` (`agenda_ID`) ON DELETE CASCADE;

--
-- Constraints for table `m3_calendar_resources`
--
ALTER TABLE `m3_calendar_resources`
  ADD CONSTRAINT `m3_calendar_resources_ibfk_1` FOREIGN KEY (`event_ID`) REFERENCES `m3_event_calendar` (`event_ID`) ON DELETE CASCADE;

--
-- Constraints for table `m3_deadline`
--
ALTER TABLE `m3_deadline`
  ADD CONSTRAINT `m3_deadline_ibfk_1` FOREIGN KEY (`agenda_ID`) REFERENCES `m3_agenda` (`agenda_ID`) ON DELETE CASCADE;

--
-- Constraints for table `m3_event_calendar`
--
ALTER TABLE `m3_event_calendar`
  ADD CONSTRAINT `m3_event_calendar_ibfk_1` FOREIGN KEY (`agenda_ID`) REFERENCES `m3_agenda` (`agenda_ID`) ON DELETE SET NULL;

--
-- Constraints for table `m3_notifications`
--
ALTER TABLE `m3_notifications`
  ADD CONSTRAINT `m3_notifications_ibfk_1` FOREIGN KEY (`agenda_ID`) REFERENCES `m3_agenda` (`agenda_ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `m3_notifications_ibfk_2` FOREIGN KEY (`event_ID`) REFERENCES `m3_event_calendar` (`event_ID`) ON DELETE SET NULL;

--
-- Constraints for table `m3_reminders`
--
ALTER TABLE `m3_reminders`
  ADD CONSTRAINT `m3_reminders_ibfk_1` FOREIGN KEY (`deadline_ID`) REFERENCES `m3_deadline` (`deadline_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `m3_reminders_ibfk_2` FOREIGN KEY (`notif_ID`) REFERENCES `m3_notifications` (`notif_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
