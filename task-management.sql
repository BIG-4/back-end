-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2020 at 05:09 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task-management`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_auth`
--

CREATE TABLE `api_auth` (
  `id` int(11) NOT NULL,
  `api_token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_auth`
--

INSERT INTO `api_auth` (`id`, `api_token`) VALUES
(1, 'ahjgdj87698bjb89#sfksdfsfb#278');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`) VALUES
(1,	'Project III'),
(4,	'Công nghệ web'),
(5,	'Android'),
(11,	'Big Data');
-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_token` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` tinyint(1) NOT NULL,
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(0, 'Unassigned'),
(1, 'To Do'),
(2, 'Doing'),
(3, 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `task_title` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status_id` tinyint(1) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `task_title`, `project_id`, `user_id`, `status_id`, `create_at`) VALUES
(6,	'Deploy back-end',	1,	5,	1,	'2020-11-24 15:48:41'),
(12,	'task 6',	5,	5,	0,	'2020-11-24 20:44:58'),
(13,	'Fix login error',	1,	5,	2,	'2020-11-24 20:46:24'),
(14,	'Back-end: Sign in / Sign up',	1,	4,	3,	'2020-12-15 15:51:15'),
(17,	'Deploy front-end',	1,	11,	0,	'2020-12-16 16:29:34'),
(20,	'Back-end: CRUD projects',	4,	4,	3,	'2020-12-21 02:42:40'),
(21,	'Back-end: CRUD tasks',	4,	4,	2,	'2020-12-21 02:43:01'),
(22,	'Back-end: Sign in / Sign up',	4,	5,	3,	'2020-12-21 02:43:31'),
(23,	'Coding convention',	4,	4,	3,	'2020-12-21 02:43:54'),
(24,	'Thiết kế API',	4,	12,	3,	'2020-12-21 02:44:21'),
(25,	'Deploy front-end',	4,	11,	1,	'2020-12-21 02:45:52'),
(26,	'Deploy back-end',	4,	4,	0,	'2020-12-21 02:46:03'),
(27,	'Deploy database',	4,	12,	0,	'2020-12-21 02:46:17'),
(28,	'Front-end: Sign in / Sign up',	4,	5,	2,	'2020-12-21 02:47:00'),
(29,	'Front-end: Projects Management',	4,	12,	3,	'2020-12-21 02:47:42'),
(30,	'Front-end: Tasks Management',	4,	11,	3,	'2020-12-21 02:48:03'),
(31,	'Viết báo cáo',	4,	12,	2,	'2020-12-21 02:48:28'),
(32,	'Security',	4,	4,	1,	'2020-12-21 02:48:48'),
(33,	'Deploy database',	1,	12,	1,	'2020-12-21 02:57:43'),
(34,	'Front-end: Sign in / Sign up',	1,	4,	3,	'2020-12-21 02:58:27'),
(35,	'Thiết kế API',	1,	11,	3,	'2020-12-21 02:58:37'),
(36,	'Feature 1',	1,	4,	2,	'2020-12-21 02:59:02'),
(37,	'Feature 2',	1,	11,	2,	'2020-12-21 02:59:11'),
(38,	'Init',	11,	4,	0,	'2020-12-21 02:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `auth_token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `auth_token`) VALUES
(4,	'binhnd',	'$2b$10$tu5pkEg9TMghd1xWa7oLceB42r6hWQjwwc/1Cd2EYSJIcGXsvDYwa',	'TLy&D#aENLPm889Yh22eGlI#bImr7t1u'),
(5,	'huymq',	'$2b$10$BM/7ciw8duYLDROcsuQjBegLA4T3Gehz3lJXXmLZhjBR0DKcD9IQa',	'k@oPotFQ@12@u9jFtssOf4K&xLTIyFUZ'),
(11,	'huylq',	'$2b$10$coPdz3Z0cPGC47Jdn5eJneapfj3sb3QHRIBIEonYzGqj7OC4ICM/2',	'hWuY0UtzDnX$51XsO3MgASvYtXR7cnt4'),
(12,	'thanhlth',	'$2b$10$lFX0QHGiqIF9UvLkYA9CROky.IFbWScpRmKPlzmmgWnO.hKb6CbBm',	'OQIrGsyf9oxCjLjfLyd33o5seC1wBlej');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_auth`
--
ALTER TABLE `api_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_auth`
--
ALTER TABLE `api_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
