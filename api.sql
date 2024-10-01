-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 10:50 AM
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
-- Database: `resturant`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2, '1', 'A cozy place with great coffee and pastries.', '2024-09-12 19:09:55', '2024-09-12 19:09:55'),
(3, '1', 'A cozy place with great coffee and pastries.', '2024-09-12 19:10:16', '2024-09-12 19:10:16'),
(4, '1', 'A cozy place with great coffee and pastries.', '2024-09-14 06:27:25', '2024-09-14 06:27:25'),
(5, 'noor', 'A cozy place with great coffee and pastries.', '2024-09-14 06:28:30', '2024-09-14 06:29:54'),
(6, 'yousif', 'A cozy place with great coffee and pastries.', '2024-09-14 06:28:56', '2024-09-14 06:28:56');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `govId` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `restaurantId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extra`
--

INSERT INTO `extra` (`id`, `name`, `image`, `description`, `restaurantId`) VALUES
(1, 'Name is required!', NULL, 'Description is required!', 3),
(2, 'Name is required!', NULL, 'Description is required!', 3);

-- --------------------------------------------------------

--
-- Table structure for table `gov`
--

CREATE TABLE `gov` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `image`, `price`, `restaurantId`, `created_at`, `updated_at`) VALUES
(1, 'Name is required!', 'Description is required!', NULL, 20.00, 3, '2024-09-14 07:39:22', NULL),
(2, 'Name35 is required!', 'Description is required!', NULL, 20.00, 3, '2024-09-14 07:42:46', '2024-09-14 07:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `userId` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`userId`, `restaurantId`) VALUES
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `tableId` int(11) NOT NULL,
  `person_number` int(11) NOT NULL,
  `type` enum('VIP','NORMAL','FAMILY') DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `restaurantId`, `userId`, `tableId`, `person_number`, `type`, `note`, `created_at`, `updated_at`) VALUES
(3, 3, 2, 2, 6, 'NORMAL', 'Window seat preferred', '2024-09-14 09:06:14', '2024-09-14 11:38:04'),
(4, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:10', '2024-09-14 09:54:10'),
(5, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:11', '2024-09-14 09:54:11'),
(6, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:11', '2024-09-14 09:54:11'),
(7, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:12', '2024-09-14 09:54:12'),
(8, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:12', '2024-09-14 09:54:12'),
(9, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:12', '2024-09-14 09:54:12'),
(10, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:12', '2024-09-14 09:54:12'),
(11, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:13', '2024-09-14 09:54:13'),
(12, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:13', '2024-09-14 09:54:13'),
(13, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:13', '2024-09-14 09:54:13'),
(14, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:13', '2024-09-14 09:54:13'),
(15, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:14', '2024-09-14 09:54:14'),
(16, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:14', '2024-09-14 09:54:14'),
(17, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16'),
(18, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16'),
(19, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16'),
(20, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16'),
(21, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16'),
(22, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:17', '2024-09-14 09:54:17'),
(23, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:17', '2024-09-14 09:54:17'),
(24, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:17', '2024-09-14 09:54:17'),
(25, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:18', '2024-09-14 09:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `atu` decimal(10,8) DEFAULT NULL,
  `ltu` decimal(11,8) DEFAULT NULL,
  `images` int(11) DEFAULT NULL,
  `contrary` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `shisha` tinyint(1) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `cover_image` text DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `govId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `atu`, `ltu`, `images`, `contrary`, `description`, `shisha`, `zip`, `mobile`, `discount`, `cover_image`, `rating`, `street`, `note`, `created_at`, `updated_at`, `govId`, `cityId`) VALUES
(3, '1', 99.99999999, 987.65432100, 5, 'None', 'A cozy place with great coffee and pastries.', 1, '12345', '+1234567890', 10.50, 'cover_image_url.jpg', 4.75, '123 Coffee Lane', 'Open 7 days a week.', '2024-09-12 13:56:14', '2024-09-12 14:20:51', 10, 20),
(4, 'The Cozy Cafe', 99.99999999, 987.65432100, 5, 'None', 'A cozy place with great coffee and pastries.', 1, '12345', '+1234567890', 10.50, 'cover_image_url.jpg', 4.75, '123 Coffee Lane', 'Open 7 days a week.', '2024-09-12 14:07:56', '2024-09-12 14:07:56', 10, 20),
(5, 'The Cozy Cafe', 99.99999999, 987.65432100, 5, 'None', 'A cozy place with great coffee and pastries.', 1, '12345', '+1234567890', 10.50, 'cover_image_url.jpg', 4.75, '123 Coffee Lane', 'Open 7 days a week.', '2024-09-12 14:09:23', '2024-09-12 14:09:23', 10, 20);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_category`
--

CREATE TABLE `restaurant_category` (
  `id` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_category`
--

INSERT INTO `restaurant_category` (`id`, `restaurantId`, `categoryId`, `created_at`, `updated_at`) VALUES
(1, 3, 3, '2024-09-14 12:36:05', '2024-09-14 12:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_images`
--

CREATE TABLE `restaurant_images` (
  `id` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `stars` enum('1','2','3','4','5') NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `restaurantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `userId`, `stars`, `comment`, `created_at`, `updated_at`, `restaurantId`) VALUES
(2, 2, '3', 'Comment is required!', '2024-09-14 13:22:20', '2024-09-14 13:22:32', 3);

-- --------------------------------------------------------

--
-- Table structure for table `siting_map`
--

CREATE TABLE `siting_map` (
  `id` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `chair_capacity` int(11) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `restaurantId` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `number`, `chair_capacity`, `section`, `restaurantId`, `created_at`, `updated_at`) VALUES
(2, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:35:56', '2024-09-14 08:35:56'),
(3, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:02', '2024-09-14 08:36:02'),
(4, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:03', '2024-09-14 08:36:03'),
(5, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:03', '2024-09-14 08:36:03'),
(6, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:03', '2024-09-14 08:36:03'),
(7, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:03', '2024-09-14 08:36:03'),
(8, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:03', '2024-09-14 08:36:03'),
(9, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:04', '2024-09-14 08:36:04'),
(10, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:04', '2024-09-14 08:36:04'),
(11, 1, 20, 'Main Dining Area', 3, '2024-09-14 08:36:04', '2024-09-14 08:36:04'),
(12, 1, 20, ' Dining Area', 3, '2024-09-14 08:36:10', '2024-09-14 08:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist`
--

CREATE TABLE `token_blacklist` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userfriends`
--

CREATE TABLE `userfriends` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `friendId` int(11) NOT NULL,
  `isCloseFriend` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userfriends`
--

INSERT INTO `userfriends` (`id`, `userId`, `friendId`, `isCloseFriend`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, '2024-09-14 13:45:32', '2024-09-15 11:46:59'),
(14, 4, 2, 0, '2024-09-16 07:43:06', '2024-09-16 07:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `ltu` decimal(9,6) DEFAULT NULL,
  `atu` decimal(9,6) DEFAULT NULL,
  `preferred_search_distance` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`id`, `userId`, `profileImage`, `gender`, `birth_date`, `ltu`, `atu`, `preferred_search_distance`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'Male', NULL, NULL, NULL, NULL, '2024-09-16 07:14:36', '2024-09-16 07:20:36'),
(2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-16 07:49:26', '2024-09-16 07:49:26'),
(3, 4, NULL, 'Male', NULL, NULL, NULL, NULL, '2024-09-16 07:49:29', '2024-09-16 07:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `govId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `mobile`, `created_at`, `updated_at`, `type`, `city`, `address1`, `address2`, `govId`, `cityId`, `name`) VALUES
(2, 'apk', 'hfdd@knm.com', '$2y$10$7d8pITL0R2evk7w3GWBvDeoQ5JDJPkNUB8GWj6IB2WGzH.9J55q2m', 121, '2024-09-12 10:43:47', '2024-09-12 11:29:34', 'ADMIN', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk'),
(3, 'apk1', 'hf@knm.com', '$2y$10$Bg5N2kLy9lph04ltxjZ6le5HgddQTGaMIcsqT1ZoRQ6kmm9tUEdj.', 121, '2024-09-14 13:43:52', '2024-09-14 13:43:52', 'AGENT', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk'),
(4, 'apk12', 'hfk@knm.com', '$2y$10$h3Z1SqckwJ7B71qlc7lqYes9bL6MfnorU9jfQGBnYRFFA5qpFw2h6', 121, '2024-09-16 07:42:09', '2024-09-16 07:42:09', 'AGENT', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk'),
(5, 'adpk12', 'hsfk@knm.com', '$2y$10$3nFep4XIy5R49OvfhhuOyunpmdTSaL.4NoNBXBXCCHAO1WxCwwll2', 121, '2024-09-17 11:37:27', '2024-09-17 11:37:27', 'AGENT', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk'),
(6, 'adpk142', 'hsfdk@knm.com', '$2y$10$51Dgf8FcYQyZZ9cWojiL3emDVZfTnNaVIuwj85MpIwZ3UGKtDZe6i', 121, '2024-09-17 12:41:34', '2024-09-17 12:41:34', 'AGENT', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk'),
(7, '', 'john@example.com', '', 0, '2024-09-30 09:11:55', '2024-09-30 09:11:55', NULL, NULL, NULL, NULL, 0, 0, 'John Doe'),
(9, '', 'john@htrhr.com', 'w', 0, '2024-09-30 09:32:34', '2024-09-30 09:32:34', '', '', '', '', 0, 0, 'John Doe');

-- --------------------------------------------------------

--
-- Table structure for table `user_cat_pref`
--

CREATE TABLE `user_cat_pref` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_cat_pref`
--

INSERT INTO `user_cat_pref` (`id`, `userId`, `catId`, `rating`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, '2024-09-16 08:27:59', '2024-09-16 08:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `user_city_pref`
--

CREATE TABLE `user_city_pref` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cityId` int(11) NOT NULL,
  `govId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_restaurant_reaction`
--

CREATE TABLE `user_restaurant_reaction` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `reaction` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_restaurant_reaction`
--

INSERT INTO `user_restaurant_reaction` (`id`, `userId`, `restaurantId`, `reaction`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'like', '2024-09-16 10:03:28', '2024-09-16 10:03:28'),
(2, 3, 3, 'dislike', '2024-09-16 10:04:49', '2024-09-16 10:04:49'),
(4, 4, 3, 'like', '2024-09-16 10:05:51', '2024-09-16 10:05:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `govId` (`govId`);

--
-- Indexes for table `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- Indexes for table `gov`
--
ALTER TABLE `gov`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`userId`,`restaurantId`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurantId` (`restaurantId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `tableId` (`tableId`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_category`
--
ALTER TABLE `restaurant_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurantId` (`restaurantId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `restaurant_images`
--
ALTER TABLE `restaurant_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `reviews_fk_res` (`restaurantId`);

--
-- Indexes for table `siting_map`
--
ALTER TABLE `siting_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_restaurant_table` (`restaurantId`);

--
-- Indexes for table `token_blacklist`
--
ALTER TABLE `token_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userfriends`
--
ALTER TABLE `userfriends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_table` (`userId`,`friendId`),
  ADD UNIQUE KEY `unique_user_tablef` (`friendId`),
  ADD UNIQUE KEY `unique_user_tableu` (`userId`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_city_u` (`cityId`);

--
-- Indexes for table `user_cat_pref`
--
ALTER TABLE `user_cat_pref`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `catId` (`catId`);

--
-- Indexes for table `user_city_pref`
--
ALTER TABLE `user_city_pref`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `user_restaurant_reaction`
--
ALTER TABLE `user_restaurant_reaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extra`
--
ALTER TABLE `extra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gov`
--
ALTER TABLE `gov`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `restaurant_category`
--
ALTER TABLE `restaurant_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_images`
--
ALTER TABLE `restaurant_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `siting_map`
--
ALTER TABLE `siting_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `token_blacklist`
--
ALTER TABLE `token_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userfriends`
--
ALTER TABLE `userfriends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `userprofile`
--
ALTER TABLE `userprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_cat_pref`
--
ALTER TABLE `user_cat_pref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_city_pref`
--
ALTER TABLE `user_city_pref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_restaurant_reaction`
--
ALTER TABLE `user_restaurant_reaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`govId`) REFERENCES `gov` (`id`);

--
-- Constraints for table `extra`
--
ALTER TABLE `extra`
  ADD CONSTRAINT `extra_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `owners`
--
ALTER TABLE `owners`
  ADD CONSTRAINT `owners_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `owners_ibfk_2` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`);

--
-- Constraints for table `restaurant_category`
--
ALTER TABLE `restaurant_category`
  ADD CONSTRAINT `restaurant_category_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurant_category_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_images`
--
ALTER TABLE `restaurant_images`
  ADD CONSTRAINT `restaurant_images_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_fk_res` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `siting_map`
--
ALTER TABLE `siting_map`
  ADD CONSTRAINT `siting_map_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`);

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `fk_restaurant_table` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tables_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`);

--
-- Constraints for table `userfriends`
--
ALTER TABLE `userfriends`
  ADD CONSTRAINT `userfriends_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userfriends_ibfk_2` FOREIGN KEY (`friendId`) REFERENCES `users` (`id`);

--
-- Constraints for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD CONSTRAINT `userprofile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_cat_pref`
--
ALTER TABLE `user_cat_pref`
  ADD CONSTRAINT `user_cat_pref_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_cat_pref_ibfk_2` FOREIGN KEY (`catId`) REFERENCES `category` (`id`);

--
-- Constraints for table `user_city_pref`
--
ALTER TABLE `user_city_pref`
  ADD CONSTRAINT `user_city_pref_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_restaurant_reaction`
--
ALTER TABLE `user_restaurant_reaction`
  ADD CONSTRAINT `user_restaurant_reaction_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_restaurant_reaction_ibfk_2` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `delete_expired_tokens` ON SCHEDULE EVERY 1 HOUR STARTS '2024-09-11 17:01:02' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DELETE FROM full_texts
    WHERE expires_at < NOW();
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
