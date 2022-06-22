-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2022 at 09:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake_bookmarks`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `title`, `description`, `url`, `created`, `modified`) VALUES
(1, 2, 'Dog Book', 'text for book one.', 'https://picsum.photos/id/237/200/300', '2022-06-22 17:02:30', '2022-06-22 17:02:30'),
(2, 1, 'Coffee Book', 'this is a coffe book.', 'https://picsum.photos/200/300/?blur', '2022-06-22 17:03:10', '2022-06-22 17:04:42'),
(3, 1, 'More Dog Books', 'Here we have some more dog books for you.', 'https://picsum.photos/id/237/200/300', '2022-06-22 17:06:22', '2022-06-22 17:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks_tags`
--

CREATE TABLE `bookmarks_tags` (
  `bookmark_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmarks_tags`
--

INSERT INTO `bookmarks_tags` (`bookmark_id`, `tag_id`) VALUES
(1, 1),
(2, 2),
(3, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'baseball', '2022-06-22 17:03:28', '2022-06-22 19:33:53'),
(2, 'coffe', '2022-06-22 17:03:41', '2022-06-22 17:03:41'),
(3, 'funny', '2022-06-22 17:03:49', '2022-06-22 17:03:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(1, 'newcakeuser@example.com', '$2y$10$BKvTQwsfwIg3yjrcoL9zZOykQqliFaH74fcJNCJq2PLwtufAM4.2C', '2022-06-22 16:58:55', '2022-06-22 16:58:55'),
(2, 'seconduser@example.com', '$2y$10$LFoTGTRx.QOp6V/gtMrFiucRK6s.Jsa2k2CpP/faf1/U1yC2LR3IK', '2022-06-22 16:59:23', '2022-06-22 16:59:23'),
(3, 'thirduser@example.com', '$2y$10$MsGp3evo2eo/jd7o38N.TOJ19xlMK46VZMDES4tbgaI9ZCN7AOYma', '2022-06-22 19:31:11', '2022-06-22 19:31:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_key` (`user_id`);

--
-- Indexes for table `bookmarks_tags`
--
ALTER TABLE `bookmarks_tags`
  ADD PRIMARY KEY (`bookmark_id`,`tag_id`),
  ADD KEY `tag_key` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `user_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bookmarks_tags`
--
ALTER TABLE `bookmarks_tags`
  ADD CONSTRAINT `bookmark_key` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmarks` (`id`),
  ADD CONSTRAINT `tag_key` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
