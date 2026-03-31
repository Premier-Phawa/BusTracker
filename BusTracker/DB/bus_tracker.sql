-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2026 at 06:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` int(11) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `bus_number`, `route_id`, `driver_id`, `status`, `created_at`) VALUES
(1, 'BUS-001', 1, NULL, 'active', '2026-02-23 06:00:00'),
(2, 'BUS-002', 2, NULL, 'active', '2026-02-23 06:05:00'),
(3, 'BUS-003', 3, NULL, 'active', '2026-02-23 06:10:00'),
(4, 'BUS-004', 4, NULL, 'active', '2026-02-23 06:15:00'),
(5, 'BUS-005', 5, NULL, 'active', '2026-02-23 06:20:00'),
(6, 'BUS-006', 6, NULL, 'active', '2026-02-23 06:25:00'),
(7, 'BUS-007', 7, NULL, 'active', '2026-02-23 06:30:00'),
(8, 'BUS-008', 8, NULL, 'active', '2026-02-23 06:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `bus_locations`
--

CREATE TABLE `bus_locations` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Dumping data for table `bus_locations`
--

INSERT INTO `bus_locations` (`id`, `bus_id`, `latitude`, `longitude`, `updated_at`) VALUES
(1, 1, 26.7082, 92.7880, '2026-03-04 10:00:00'),
(2, 2, 26.7095, 92.7895, '2026-03-04 10:05:00'),
(3, 3, 26.7108, 92.7910, '2026-03-04 10:10:00'),
(4, 4, 26.7121, 92.7925, '2026-03-04 10:15:00'),
(5, 5, 26.7134, 92.7940, '2026-03-04 10:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `bus_schedules`
--

CREATE TABLE `bus_schedules` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `day` varchar(20) NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Dumping data for table `bus_schedules`
--

INSERT INTO `bus_schedules` (`id`, `bus_id`, `route_id`, `day`, `departure_time`, `arrival_time`, `created_at`) VALUES
(1, 1, 1, 'Monday', '08:00:00', '08:30:00', '2026-02-23 06:00:00'),
(2, 2, 2, 'Monday', '08:30:00', '09:00:00', '2026-02-23 06:05:00'),
(3, 3, 3, 'Monday', '09:00:00', '09:30:00', '2026-02-23 06:10:00'),
(4, 4, 4, 'Monday', '09:30:00', '10:00:00', '2026-02-23 06:15:00'),
(5, 5, 5, 'Monday', '10:00:00', '10:30:00', '2026-02-23 06:20:00'),
(6, 6, 6, 'Monday', '10:30:00', '11:00:00', '2026-02-23 06:25:00'),
(7, 7, 7, 'Monday', '11:00:00', '11:30:00', '2026-02-23 06:30:00'),
(8, 8, 8, 'Monday', '14:00:00', '14:30:00', '2026-02-23 06:35:00'),
(9, 1, 1, 'Tuesday', '08:00:00', '08:30:00', '2026-02-23 06:00:00'),
(10, 2, 2, 'Tuesday', '08:30:00', '09:00:00', '2026-02-23 06:05:00'),
(11, 3, 3, 'Tuesday', '09:00:00', '09:30:00', '2026-02-23 06:10:00'),
(12, 4, 4, 'Tuesday', '09:30:00', '10:00:00', '2026-02-23 06:15:00'),
(13, 5, 5, 'Tuesday', '10:00:00', '10:30:00', '2026-02-23 06:20:00'),
(14, 6, 6, 'Tuesday', '10:30:00', '11:00:00', '2026-02-23 06:25:00'),
(15, 7, 7, 'Tuesday', '11:00:00', '11:30:00', '2026-02-23 06:30:00'),
(16, 8, 8, 'Tuesday', '14:00:00', '14:30:00', '2026-02-23 06:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `bus_stops`
--

CREATE TABLE `bus_stops` (
  `id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `stop_name` varchar(100) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `route_name` varchar(100) NOT NULL,
  `start_point` varchar(100) DEFAULT NULL,
  `end_point` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `route_name`, `start_point`, `end_point`, `created_at`) VALUES
(1, 'University Gate - Main Campus', 'University Main Gate', 'Academic Block A', '2026-02-23 06:00:00'),
(2, 'Main Campus - Library', 'Academic Block A', 'Central Library', '2026-02-23 06:05:00'),
(3, 'Library - Student Hostel', 'Central Library', 'Student Hostel Block A', '2026-02-23 06:10:00'),
(4, 'Main Campus - Sports Complex', 'Academic Block A', 'Sports Complex', '2026-02-23 06:15:00'),
(5, 'University Gate - Engineering Block', 'University Main Gate', 'Engineering Block', '2026-02-23 06:20:00'),
(6, 'Engineering Block - Main Campus', 'Engineering Block', 'Academic Block A', '2026-02-23 06:25:00'),
(7, 'Main Campus - Medical Center', 'Academic Block A', 'University Medical Center', '2026-02-23 06:30:00'),
(8, 'Sports Complex - Student Hostel', 'Sports Complex', 'Student Hostel Block B', '2026-02-23 06:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `department` varchar(100) NOT NULL,
  `year` varchar(20) NOT NULL,
  `emergency_contact` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','student','driver') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','blocked') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `student_id`, `email`, `address`, `phone`, `department`, `year`, `emergency_contact`, `password`, `role`, `created_at`, `status`) VALUES
(3, 'Phawa Admin', '', 'phawa@gmail.com', 'Mihmyntdu', '987654321', '---', '---', '987654322', 'phawa123', 'admin', '2026-02-23 05:10:07', 'active'),
(5, 'Andrew', '', 'andrew@gmail.com', '', '', '', '', '', 'andrew123', 'student', '2026-02-23 05:20:11', 'active'),
(6, 'Vivid Warjri', 'DC2025MCA0035', 'vivid@gmail.com', 'Sohra', '1234567890', 'MCA', '1st Year', '9876555432', 'vivid123', 'student', '2026-02-23 06:11:54', 'active'),
(8, 'Sonya Ferrell', 'Laboris ut aliqua M', 'hejaloryk@mailinator.com', 'Et ipsa ratione ali', '+1 (244) 125-3259', 'Eaque reprehenderit ', '2nd Year', 'Dolore nihil quasi b', '123', 'student', '2026-03-03 18:03:41', 'active'),
(10, 'Clinton Estrada', 'Rerum est anim ratio', 'semozodo@mailinator.com', 'Autem dolores aute m', '+1 (987) 767-3213', 'Nisi dolorum ad qui ', '3rd Year', 'Quam in incidunt er', 'Pa$$w0rd!', 'student', '2026-03-04 12:53:26', 'active'),
(12, 'vividlang warjri', 'BCA2022099', 'vividlangwarjri@gmail.com', 'Mawmluh', '08414822124', 'BCA', '1st Year', '08414822124', '12345678', 'student', '2026-03-04 12:54:34', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_reports`
--

CREATE TABLE `user_reports` (
  `id` int(11) NOT NULL,
  `reported_user` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `reported_by` int(11) NOT NULL,
  `status` enum('pending','resolved','dismissed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_reports`
--

INSERT INTO `user_reports` (`id`, `reported_user`, `reason`, `reported_by`, `status`, `created_at`) VALUES
(2, 'Test User', 'This is a sample report for testing DataTables functionality', 3, 'dismissed', '2026-03-04 17:52:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `bus_locations`
--
ALTER TABLE `bus_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `bus_schedules`
--
ALTER TABLE `bus_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `bus_stops`
--
ALTER TABLE `bus_stops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reported_by` (`reported_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bus_locations`
--
ALTER TABLE `bus_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bus_schedules`
--
ALTER TABLE `bus_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bus_stops`
--
ALTER TABLE `bus_stops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_reports`
--
ALTER TABLE `user_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `buses_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `bus_locations`
--
ALTER TABLE `bus_locations`
  ADD CONSTRAINT `bus_locations_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bus_schedules`
--
ALTER TABLE `bus_schedules`
  ADD CONSTRAINT `bus_schedules_bus_fk` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bus_schedules_route_fk` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `bus_stops`
--
ALTER TABLE `bus_stops`
  ADD CONSTRAINT `bus_stops_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD CONSTRAINT `user_reports_ibfk_1` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
