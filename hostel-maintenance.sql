-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2026 at 11:49 AM
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
-- Database: `hostel-maintenance`
--

-- --------------------------------------------------------

--
-- Table structure for table `issue_types`
--

CREATE TABLE `issue_types` (
  `id` int(11) NOT NULL,
  `issue_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issue_types`
--

INSERT INTO `issue_types` (`id`, `issue_name`) VALUES
(1, 'Plumbing'),
(2, 'Electrical'),
(3, 'Broken Furniture');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `issue_type_id` int(11) DEFAULT NULL,
  `hostel` varchar(50) DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `available_time` datetime DEFAULT NULL,
  `status` enum('pending','in_progress','completed','conflict') NOT NULL DEFAULT 'pending',
  `assigned_staff` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `technician_arrived` tinyint(1) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `alert_supervisor` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `student_id`, `issue_type_id`, `hostel`, `room`, `description`, `available_time`, `status`, `assigned_staff`, `created_at`, `technician_arrived`, `rating`, `alert_supervisor`) VALUES
(1, 2, 1, '2', '211', 'burst pipe', '2026-03-16 19:40:00', 'in_progress', 6, '2026-03-15 15:40:26', NULL, NULL, 0),
(2, 4, 1, '4', '211', 'tape not working', '2026-03-16 10:00:00', 'in_progress', 7, '2026-03-15 19:32:15', NULL, NULL, 0),
(3, 4, 1, '4', '211', 'burst pipe', '2026-03-15 21:49:00', 'in_progress', 8, '2026-03-15 19:49:11', NULL, NULL, 0),
(4, 4, 2, '4', '211', 'light not working', '2026-03-15 22:04:00', 'completed', 1, '2026-03-15 20:02:14', NULL, NULL, 0),
(6, 4, 1, '4', '211', 'the sink is not working', '2026-03-16 15:09:00', 'in_progress', 6, '2026-03-16 13:03:52', 0, NULL, 0),
(7, 4, 3, '4', '211', 'broken chair', '2026-03-17 11:00:00', 'in_progress', 4, '2026-03-17 08:06:01', NULL, NULL, 0),
(8, 13, 2, '2', '214', 'light not working', '2026-03-18 11:13:00', 'completed', 1, '2026-03-18 09:11:20', NULL, NULL, 0),
(9, 4, 1, '4', '211', 'toilet wont flush', '2026-03-19 09:07:00', 'in_progress', 7, '2026-03-19 07:02:29', 0, NULL, 0),
(10, 4, 3, '4', '211', 'broken chair', '2026-03-19 09:14:00', 'completed', 3, '2026-03-19 07:11:11', NULL, NULL, 0),
(11, 4, 2, '4', '101', 'Light bulb not switching on', '2026-03-19 12:37:00', 'in_progress', 5, '2026-03-19 08:35:35', NULL, NULL, 0),
(12, 4, 2, '4', '213', 'Socket not working', '2026-03-20 10:00:00', 'in_progress', 1, '2026-03-19 08:37:13', NULL, NULL, 0),
(13, 4, 2, '4', '214', 'faulty lights', '2026-03-19 11:02:00', 'completed', 1, '2026-03-19 08:56:48', NULL, NULL, 0),
(14, 4, 2, '4', '211', 'light not working', '2026-03-19 13:30:00', 'in_progress', 1, '2026-03-19 11:21:27', NULL, NULL, 0),
(15, 14, 1, '1', '123', 'blocked toilet', '2026-03-19 09:00:00', 'completed', 6, '2026-03-19 14:44:51', 1, 8, 0),
(16, 14, 2, '1', '123', 'faulty lights', '2026-03-20 08:08:00', 'in_progress', 1, '2026-03-19 14:45:43', 0, NULL, 1),
(17, 14, 3, '1', '123', 'broken chair', '2026-03-19 17:46:00', 'in_progress', 4, '2026-03-19 14:46:39', 0, NULL, 1),
(18, 4, 2, '4', '211', 'socket not working', '2026-03-20 10:40:00', 'in_progress', 1, '2026-03-20 08:36:53', NULL, NULL, 0),
(19, 4, 3, '4', '211', 'broken chair', '2026-03-20 11:21:00', 'in_progress', 4, '2026-03-20 09:18:50', NULL, NULL, 0),
(20, 16, 2, '2', '211', 'spaking plug', '2026-04-21 14:28:00', 'in_progress', 1, '2026-04-21 12:26:41', NULL, NULL, 0),
(21, 16, 2, '2', '211', 'faulty light', '2026-04-21 14:28:00', 'in_progress', 5, '2026-04-21 12:27:13', NULL, NULL, 0),
(22, 16, 2, '2', '211', 'light is sparking', '2026-04-21 14:28:00', 'in_progress', 5, '2026-04-21 12:27:35', NULL, NULL, 0),
(23, 14, 1, '2', '211', 'toilet wont flush', '2026-04-21 14:33:00', 'completed', 2, '2026-04-21 12:32:01', 1, 8, 0),
(24, 14, 1, '2', '211', 'leaking tap', '2026-04-21 14:33:00', 'in_progress', 6, '2026-04-21 12:32:16', NULL, NULL, 0),
(25, 14, 1, '2', '211', 'leaking shower', '2026-04-21 14:33:00', 'in_progress', 7, '2026-04-21 12:32:34', NULL, NULL, 0),
(26, 14, 1, '2', '211', 'leaking toilet', '2026-04-22 13:52:00', 'completed', 2, '2026-04-22 11:49:54', 1, 8, 0),
(27, 14, 1, '2', '211', 'shower leaking', '2026-04-22 14:17:00', 'conflict', NULL, '2026-04-22 12:16:02', 0, NULL, 1),
(28, 14, 2, '2', '211', 'faulty light', '2026-04-25 17:25:00', 'in_progress', 1, '2026-04-25 15:29:19', NULL, NULL, 0),
(29, 14, 1, '2', '211', 'faulty chamber', '2026-04-25 17:39:00', 'in_progress', 8, '2026-04-25 15:37:50', NULL, NULL, 0),
(30, 14, 1, '2', '211', 'leaky bath', '2026-04-25 17:40:00', 'conflict', NULL, '2026-04-25 15:38:07', NULL, NULL, 0),
(31, 14, 1, '2', '211', 'leaking tap', '2026-04-25 17:40:00', 'conflict', NULL, '2026-04-25 15:38:26', NULL, NULL, 0),
(32, 14, 1, '2', '211', 'overflowing tap', '2026-04-25 17:47:00', 'in_progress', 6, '2026-04-25 15:38:44', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `specialization` enum('plumber','electrician','carpenter') DEFAULT NULL,
  `status` enum('free','occupied') DEFAULT 'free',
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `specialization`, `status`, `phone`) VALUES
(1, 5, 'electrician', 'occupied', '07756789765'),
(2, 6, 'plumber', 'occupied', '098978767'),
(3, 7, 'carpenter', 'occupied', '0778234575'),
(4, 8, 'carpenter', 'free', '0782323341'),
(5, 9, 'electrician', 'free', '0788723645'),
(6, 10, 'plumber', 'occupied', '0719374784'),
(7, 11, 'plumber', 'occupied', '0713746743'),
(8, 15, 'plumber', 'occupied', '0777107345');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('student','staff','supervisor') DEFAULT NULL,
  `hostel` varchar(50) DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `google_id` varchar(255) DEFAULT NULL,
  `profile_pic` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `hostel`, `room`, `created_at`, `google_id`, `profile_pic`) VALUES
(1, 'Test Student', 'student@test.com', '$2y$10$KbQi9QWc4Uu0m6k7yDPp..examplehash', 'student', NULL, NULL, '2026-03-15 15:10:18', NULL, NULL),
(2, 'Ashley zichawo', 'ashleyzichawo@gmail.com', '$2y$10$sYgSGI29pfVFQBPS/uM9UuBRlWp/YN5cOG3X4EMadrxvJ6IDRljt6', 'student', '2', '211', '2026-03-15 15:17:16', NULL, NULL),
(3, 'System Supervisor', 'supervisor@hit.ac.zw', '$2y$10$OWZKC0LZlGRSTKbvSnvQP.FfwZGcPdl.bM3ab303WAJVLgcGi1lPi', 'supervisor', NULL, NULL, '2026-03-15 15:32:44', NULL, NULL),
(4, 'Ratie', 'ratie@yahoo.com', '$2y$10$uBxv76vezYE3Qkq.FFSlWu1IRLD2kfIYDnjYyDB67nEzGjFp9VX6u', 'student', '4', '211', '2026-03-15 19:19:52', NULL, NULL),
(5, 'john doe', 'johnd@yahoo.com', '$2y$10$dWHA303FqJD2i3VloLbF3eY6.01i.Zrd0StqDBBE3CuCqPtVk57ly', 'staff', NULL, NULL, '2026-03-15 19:40:59', NULL, NULL),
(6, 'Marc', 'marc@yahoo.com', '$2y$10$Scm22BsA2IwS.FlVrEInoOSG5UH2xGxbiklyCzLjZNuRNjSq9G.JW', 'staff', NULL, NULL, '2026-03-15 19:45:09', NULL, NULL),
(7, 'Toney Jaa', 'toney@gmail.com', '$2y$10$7Im1Kt0ZvRx3XMhrFIlqpev8cdq7NizajHJ4RKFcy4Sv/voe2Uyem', 'staff', NULL, NULL, '2026-03-17 09:16:36', NULL, NULL),
(8, 'Kai Leng', 'kai@gmail.com', '$2y$10$r0U7XW1N.uFbPCPfCyH6y.GhjR/4paKnTknIJcnKogrzssVLXhv1u', 'staff', NULL, NULL, '2026-03-17 09:17:47', NULL, NULL),
(9, 'Jah Man', 'jah@gmail.com', '$2y$10$inCeCDDmzkcxfwF8uvWDzeB2EgTcKpV1lWdCzOqnR/TEVhXcsp.Zi', 'staff', NULL, NULL, '2026-03-17 09:21:40', NULL, NULL),
(10, 'Jay B', 'jayb@yahoo.com', '$2y$10$sPYid53onwxwrsBudzGCQO370J4aIqntRkE/3IJ7SXkmBd5Far1y.', 'staff', NULL, NULL, '2026-03-17 09:25:08', NULL, NULL),
(11, 'Smith Rowe', 'smith@yahoo.com', '$2y$10$Onn522.y8s.Cf3aKd9BqMuSZEM1oYpbB8hCWzA4jjjhDzT8FEbEha', 'staff', NULL, NULL, '2026-03-17 09:27:45', NULL, NULL),
(13, 'Mambo ', 'mambo@hit.ac.zw', '$2y$10$lhPyt4bktIU/0.FF0bKbge5cZATeuqE4C.J.Ig1bq6kOojrj44TOi', 'student', '2', '214', '2026-03-18 09:04:18', NULL, NULL),
(14, 'Nigel Majaya', 'majayanigel@gmail.com', '$2y$10$o0ZvDTDocE7MHc4CP3Gjs.38enZYVKCDchvN58qmQ64hLhj9x8doS', 'student', '1', '123', '2026-03-19 14:42:53', NULL, NULL),
(15, 'Lucious Edd', 'lucy@yahoo.com', '$2y$10$.uadTT3LMucTgmlKSIF7m.MpESs96TcSlXj8ICB6JEdm1ElbMcnMC', 'staff', NULL, NULL, '2026-03-19 14:49:05', NULL, NULL),
(16, 'Nigel Majaya', 'h240300m@hit.ac.zw', NULL, 'student', NULL, NULL, '2026-04-21 12:16:32', '107540510860237108848', 'https://lh3.googleusercontent.com/a/ACg8ocJQxs61AnjXVkVzEsGHFywUYHu0iVhnpsmnl6tqr7y42xRt4Q=s96-c');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `issue_types`
--
ALTER TABLE `issue_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `issue_type_id` (`issue_type_id`),
  ADD KEY `assigned_staff` (`assigned_staff`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `issue_types`
--
ALTER TABLE `issue_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`issue_type_id`) REFERENCES `issue_types` (`id`),
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`assigned_staff`) REFERENCES `staff` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
