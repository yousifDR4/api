-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2024 at 08:25 AM
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
(7, 'Hot Dishes', 'Hot dishes are typically main courses that are served warm or hot. They often include dishes like stews, curries, pasta, and roasted meats. These dishes are cooked with heat, and their warmth is part of their appeal. Examples: Lasagna, Beef Stew, Grilled Chicken, Stir-fried Vegetables.', '2024-10-08 17:56:24', '2024-10-08 17:56:24'),
(8, 'Cold Dishes', 'Cold dishes are prepared to be served at room temperature or chilled. These can include salads, cold pasta dishes, and some seafood or meat dishes that don\'t require heating before serving. Examples: Caesar Salad, Tuna Tartare, Cold Soba Noodles, Carpaccio.', '2024-10-08 17:56:24', '2024-10-08 17:56:24'),
(9, 'Soup', 'Soups are liquid-based dishes, typically made by simmering ingredients like vegetables, meat, or fish in broth. They can be served hot or cold, and can be light starters or hearty meals. Examples: Chicken Noodle Soup, Tomato Soup, Gazpacho, Miso Soup.', '2024-10-08 17:56:24', '2024-10-08 17:56:24'),
(10, 'Grill', 'Grilled dishes are cooked over an open flame or heat source, typically on a grill. These dishes often feature meats, vegetables, or seafood and are known for their smoky, charred flavor. Examples: Grilled Steak, Grilled Vegetables, BBQ Ribs, Grilled Shrimp.', '2024-10-08 17:56:24', '2024-10-08 17:56:24'),
(11, 'Appetizer', 'Appetizers are small dishes served before the main course to stimulate the appetite. They can range from light snacks to more substantial mini-versions of main dishes. Examples: Bruschetta, Mozzarella Sticks, Stuffed Mushrooms, Spring Rolls.', '2024-10-08 17:56:24', '2024-10-08 17:56:24'),
(12, 'Dessert', 'Desserts are sweet courses served at the end of a meal. They often include baked goods, fruit-based dishes, ice cream, and more indulgent treats. Examples: Chocolate Cake, Tiramisu, Cheesecake, Fruit Tart.', '2024-10-08 17:56:24', '2024-10-08 17:56:24'),
(13, 'Beverage', 'Beverages include a wide variety of drinks served with a meal or on their own. They can be alcoholic or non-alcoholic, hot or cold. Examples: Wine, Coffee, Lemonade, Iced Tea, Cocktails.', '2024-10-08 17:56:24', '2024-10-08 17:56:24');

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
-- Table structure for table `food_category`
--

CREATE TABLE `food_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_category`
--

INSERT INTO `food_category` (`id`, `name`, `created_at`, `updated_at`, `description`) VALUES
(19, 'Hot Dishes', '2024-10-08 18:08:14', '2024-10-08 18:08:14', 'Hot dishes are typically main courses that are served warm or hot. They often include dishes like stews, curries, pasta, and roasted meats. These dishes are cooked with heat, and their warmth is part of their appeal. Examples: Lasagna, Beef Stew, Grilled Chicken, Stir-fried Vegetables.'),
(20, 'Cold Dishes', '2024-10-08 18:08:14', '2024-10-08 18:08:14', 'Cold dishes are prepared to be served at room temperature or chilled. These can include salads, cold pasta dishes, and some seafood or meat dishes that don\'t require heating before serving. Examples: Caesar Salad, Tuna Tartare, Cold Soba Noodles, Carpaccio.'),
(21, 'Soup', '2024-10-08 18:08:14', '2024-10-08 18:08:14', 'Soups are liquid-based dishes, typically made by simmering ingredients like vegetables, meat, or fish in broth. They can be served hot or cold, and can be light starters or hearty meals. Examples: Chicken Noodle Soup, Tomato Soup, Gazpacho, Miso Soup.'),
(22, 'Grill', '2024-10-08 18:08:14', '2024-10-08 18:08:14', 'Grilled dishes are cooked over an open flame or heat source, typically on a grill. These dishes often feature meats, vegetables, or seafood and are known for their smoky, charred flavor. Examples: Grilled Steak, Grilled Vegetables, BBQ Ribs, Grilled Shrimp.'),
(23, 'Appetizer', '2024-10-08 18:08:14', '2024-10-08 18:08:14', 'Appetizers are small dishes served before the main course to stimulate the appetite. They can range from light snacks to more substantial mini-versions of main dishes. Examples: Bruschetta, Mozzarella Sticks, Stuffed Mushrooms, Spring Rolls.'),
(24, 'Dessert', '2024-10-08 18:08:14', '2024-10-08 18:08:14', 'Desserts are sweet courses served at the end of a meal. They often include baked goods, fruit-based dishes, ice cream, and more indulgent treats. Examples: Chocolate Cake, Tiramisu, Cheesecake, Fruit Tart.'),
(25, 'Beverage', '2024-10-08 18:08:14', '2024-10-08 18:08:14', 'Beverages include a wide variety of drinks served with a meal or on their own. They can be alcoholic or non-alcoholic, hot or cold. Examples: Wine, Coffee, Lemonade, Iced Tea, Cocktails.');

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
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `foodCategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `image`, `price`, `restaurantId`, `created_at`, `updated_at`, `foodCategoryId`) VALUES
(1, 'Name is required!', 'Description is required!', NULL, 20.00, 3, '2024-09-14 07:39:22', NULL, NULL),
(2, 'Name35 is required!', 'Description is required!', NULL, 20.00, 3, '2024-09-14 07:42:46', '2024-09-14 07:47:20', NULL),
(5, 'test', '', '', 0.00, 3, '2024-10-07 17:44:54', '2024-10-07 17:44:54', NULL),
(6, 'test', '', '', 0.00, 3, '2024-10-07 17:45:05', '2024-10-07 17:45:05', NULL),
(8, 'test', '', '', 1.99, 3, '2024-10-07 17:49:03', '2024-10-07 17:49:03', NULL),
(9, 'test', '', '', 1.99, 3, '2024-10-07 17:50:22', '2024-10-07 17:50:22', NULL),
(10, 'test', '', '', 1.99, 3, '2024-10-07 17:50:30', '2024-10-07 17:50:30', NULL),
(16, 'yousif', 'sdw', '', 3.00, 3, '2024-10-08 13:04:59', '2024-10-08 13:04:59', NULL),
(17, 'kabab', 'sdw', '', 3432.00, 3, '2024-10-08 13:06:52', '2024-10-08 18:11:00', 21),
(18, 'pizza', 'sdw', 'C:\\Users\\ASUS\\Desktop\\Admin\\api\\..\\uploads\\ba6b0599-3f0e-4419-ab83-a8414c808af0.png', 33.00, 3, '2024-10-08 13:08:19', '2024-10-08 18:10:30', 19);

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
(49, 3);

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isActive` tinyint(1) DEFAULT 1,
  `isCancelled` tinyint(1) DEFAULT 0,
  `AttendanceTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `restaurantId`, `userId`, `tableId`, `person_number`, `type`, `note`, `created_at`, `updated_at`, `isActive`, `isCancelled`, `AttendanceTime`) VALUES
(3, 3, 2, 2, 6, 'NORMAL', 'Window seat preferred', '2024-09-14 09:06:14', '2024-10-04 12:45:08', 0, 1, '2024-10-04 13:49:16'),
(4, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:10', '2024-10-04 10:54:52', 1, 0, '2024-10-04 13:54:27'),
(5, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:11', '2024-09-14 09:54:11', 1, 0, NULL),
(6, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:11', '2024-09-14 09:54:11', 1, 0, NULL),
(7, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:12', '2024-09-14 09:54:12', 1, 0, NULL),
(8, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:12', '2024-09-14 09:54:12', 1, 0, NULL),
(9, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:12', '2024-09-14 09:54:12', 1, 0, NULL),
(10, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:12', '2024-09-14 09:54:12', 1, 0, NULL),
(11, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:13', '2024-09-14 09:54:13', 1, 0, NULL),
(12, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:13', '2024-09-14 09:54:13', 1, 0, NULL),
(13, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:13', '2024-09-14 09:54:13', 1, 0, NULL),
(14, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:13', '2024-09-14 09:54:13', 1, 0, NULL),
(15, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:14', '2024-09-14 09:54:14', 1, 0, NULL),
(16, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:14', '2024-09-14 09:54:14', 1, 0, NULL),
(17, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16', 1, 0, NULL),
(18, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16', 1, 0, NULL),
(19, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16', 1, 0, NULL),
(20, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16', 1, 0, NULL),
(21, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:16', '2024-09-14 09:54:16', 1, 0, NULL),
(22, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:17', '2024-09-14 09:54:17', 1, 0, NULL),
(23, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:17', '2024-09-14 09:54:17', 1, 0, NULL),
(24, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:17', '2024-09-14 09:54:17', 1, 0, NULL),
(25, 3, 2, 2, 6, 'VIP', 'Window seat preferred', '2024-09-14 09:54:18', '2024-09-14 09:54:18', 1, 0, NULL),
(26, 3, 48, 3, 4, 'NORMAL', NULL, '2024-10-04 11:02:41', '2024-10-04 11:02:41', 1, 0, '2024-10-04 14:02:06'),
(30, 3, 51, 4, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-14 21:44:52'),
(31, 3, 52, 11, 4, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-29 22:01:13'),
(32, 3, 53, 5, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-27 02:05:25'),
(33, 3, 54, 12, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-10 08:38:03'),
(34, 3, 55, 2, 5, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-07 14:28:25'),
(35, 3, 56, 3, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-12 08:32:00'),
(36, 3, 57, 11, 0, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-02 07:02:19'),
(37, 3, 58, 9, 5, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-14 03:12:54'),
(38, 3, 59, 9, 4, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-29 09:05:16'),
(39, 3, 60, 8, 8, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-06 07:26:15'),
(40, 3, 61, 5, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-17 13:01:28'),
(41, 3, 62, 12, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-25 18:10:15'),
(42, 3, 63, 12, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-23 20:17:20'),
(43, 3, 64, 4, 4, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-17 00:03:42'),
(44, 3, 65, 4, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-15 12:53:46'),
(45, 3, 66, 11, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-17 04:31:55'),
(46, 3, 67, 3, 0, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-21 11:21:20'),
(47, 3, 68, 6, 0, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-24 02:14:16'),
(48, 3, 69, 4, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-07 04:48:13'),
(49, 3, 70, 7, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-05 01:26:22'),
(50, 3, 71, 11, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-07 13:23:50'),
(51, 3, 72, 9, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-20 21:34:10'),
(52, 3, 73, 3, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-05 08:14:40'),
(53, 3, 74, 3, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-13 12:50:41'),
(54, 3, 75, 4, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-19 23:16:00'),
(55, 3, 76, 8, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-07 03:23:28'),
(56, 3, 77, 10, 8, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-12 07:33:46'),
(57, 3, 78, 3, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-26 06:41:01'),
(58, 3, 79, 9, 8, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-30 09:31:26'),
(59, 3, 80, 2, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-07 07:31:17'),
(60, 3, 81, 7, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-19 11:24:23'),
(61, 3, 82, 3, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-17 18:50:53'),
(62, 3, 83, 3, 8, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-15 09:01:46'),
(63, 3, 84, 8, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-29 18:44:04'),
(64, 3, 85, 4, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-15 21:19:28'),
(65, 3, 86, 10, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-17 20:31:47'),
(66, 3, 87, 3, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-09 10:06:16'),
(67, 3, 88, 3, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-24 19:44:40'),
(68, 3, 89, 7, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-01 16:48:11'),
(69, 3, 90, 2, 4, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-10 05:37:53'),
(70, 3, 91, 10, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-15 12:36:20'),
(71, 3, 92, 12, 5, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-24 17:38:56'),
(72, 3, 93, 6, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-12 14:19:56'),
(73, 3, 94, 2, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-22 09:28:27'),
(74, 3, 95, 8, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-16 11:22:31'),
(75, 3, 96, 5, 0, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-13 20:03:59'),
(76, 3, 97, 10, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-17 02:24:40'),
(77, 3, 98, 2, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-04 10:46:13'),
(78, 3, 99, 11, 8, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-03 02:04:06'),
(79, 3, 100, 12, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-14 03:29:14'),
(80, 3, 101, 11, 8, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-22 13:12:48'),
(81, 3, 102, 11, 0, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-27 09:27:20'),
(82, 3, 103, 5, 0, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-18 13:19:56'),
(83, 3, 104, 9, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-23 15:59:31'),
(84, 3, 105, 11, 4, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-09 12:28:50'),
(85, 3, 106, 8, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-27 22:14:43'),
(86, 3, 107, 6, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-10 10:06:57'),
(87, 3, 108, 6, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-28 05:46:33'),
(88, 3, 109, 8, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-28 20:36:32'),
(89, 3, 110, 6, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-31 12:44:33'),
(90, 3, 111, 9, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-13 06:27:10'),
(91, 3, 112, 11, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-09 14:33:52'),
(92, 3, 113, 9, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-15 08:24:17'),
(93, 3, 114, 6, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-14 01:04:59'),
(94, 3, 115, 2, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-06 16:49:40'),
(95, 3, 116, 7, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-16 04:59:11'),
(96, 3, 117, 2, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-18 22:01:13'),
(97, 3, 118, 2, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-28 09:18:14'),
(98, 3, 119, 8, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-02 17:32:29'),
(99, 3, 120, 8, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-07 00:07:55'),
(100, 3, 121, 3, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-15 03:24:12'),
(101, 3, 122, 5, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-08 11:24:41'),
(102, 3, 123, 10, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-11 22:51:27'),
(103, 3, 124, 7, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-30 13:32:33'),
(104, 3, 125, 9, 0, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-01 11:30:55'),
(105, 3, 126, 2, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-21 13:15:38'),
(106, 3, 127, 8, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-29 18:27:04'),
(107, 3, 128, 5, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-12 20:28:37'),
(108, 3, 129, 11, 5, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-12 10:21:54'),
(109, 3, 130, 9, 5, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-19 10:01:33'),
(110, 3, 131, 10, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-15 05:04:04'),
(111, 3, 132, 2, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-11 15:19:16'),
(112, 3, 133, 6, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-19 15:58:05'),
(113, 3, 134, 5, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-18 14:43:10'),
(114, 3, 135, 8, 5, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-09 10:09:16'),
(115, 3, 136, 8, 8, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-15 15:12:19'),
(116, 3, 137, 9, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-05 16:17:41'),
(117, 3, 138, 7, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-02 15:55:11'),
(118, 3, 139, 2, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 19:28:26', 1, 1, '2024-10-08 01:29:54'),
(119, 3, 140, 8, 5, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-22 02:51:53'),
(120, 3, 141, 5, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-30 02:14:51'),
(121, 3, 142, 6, 7, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-13 14:51:59'),
(122, 3, 143, 6, 0, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-09 12:39:21'),
(123, 3, 144, 6, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-05 22:06:54'),
(124, 3, 145, 6, 3, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-28 20:29:55'),
(125, 3, 146, 7, 2, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-03 03:27:31'),
(126, 3, 147, 2, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-27 08:23:25'),
(127, 3, 148, 9, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-28 21:54:08'),
(128, 3, 149, 5, 8, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-10-27 13:39:41'),
(129, 3, 150, 6, 1, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-03 14:12:20'),
(130, 3, 151, 3, 5, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-12-15 12:28:59'),
(131, 3, 152, 6, 6, NULL, NULL, '2024-10-04 12:41:05', '2024-10-04 12:41:05', 1, 0, '2024-11-15 09:00:59');

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
(3, 'jeiowo', 0.00000000, 0.00000000, 0, '', '', 0, '12345', '0', 0.00, '', 0.00, '', '', '2024-10-05 21:35:03', '2024-10-05 21:35:03', 0, 0),
(5, 'The Cozy Cafe', 99.99999999, 987.65432100, 5, 'None', 'A cozy place with great coffee and pastries.', 1, '12345', '+1234567890', 10.50, 'cover_image_url.jpg', 4.75, '123 Coffee Lane', 'Open 7 days a week.', '2024-09-12 14:09:23', '2024-09-12 14:09:23', 10, 20),
(49, 'The Cozy Cafe', 99.99999999, 987.65432100, 5, 'None', 'A cozy place with great coffee and pastries.', 1, '12345', '+1234567890', 10.50, 'cover_image_url.jpg', 4.75, '123 Coffee Lane', 'Open 7 days a week.', '2024-09-12 14:07:56', '2024-10-04 09:31:06', 10, 20);

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
-- Table structure for table `restaurant_supporters`
--

CREATE TABLE `restaurant_supporters` (
  `id` int(11) NOT NULL,
  `supporterId` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_supporters`
--

INSERT INTO `restaurant_supporters` (`id`, `supporterId`, `restaurantId`) VALUES
(11, 55, 3),
(7, 112, 3);

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
(2, 2, '3', 'Comment is required!', '2024-09-14 13:22:20', '2024-09-14 13:22:32', 3),
(5, 49, '4', 'y4jhy54jh4', '2024-10-04 10:11:11', '2024-10-04 10:11:30', 3),
(6, 51, '1', 'Nemo ut quo voluptatem exercitationem.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(7, 52, '5', 'Non delectus ipsa dignissimos omnis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(8, 53, '5', 'Voluptas deserunt qui aliquam delectus eos aut ut.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(9, 54, '1', 'Ea laudantium sit quo repellendus nemo sed qui.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(10, 55, '4', 'Enim doloremque pariatur magnam distinctio fugit consequuntur animi.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(11, 56, '3', 'Laborum quam sit provident deleniti quam repellendus.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(12, 57, '2', 'Voluptas asperiores voluptatem voluptatem magni in sunt eum.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(13, 58, '5', 'Eaque eum quo.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(14, 59, '2', 'Et nemo dolor sit commodi quam hic.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(15, 60, '4', 'Temporibus asperiores ipsa earum.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(16, 61, '3', 'Aliquid quis quam nostrum repellat cum earum quasi distinctio corporis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(17, 62, '1', 'Earum animi reprehenderit dolorem fuga autem ex.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(18, 63, '2', 'Enim autem et ducimus exercitationem labore dolorem et inventore.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(19, 64, '5', 'Facilis quo laborum quia maiores enim.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(20, 65, '2', 'Perferendis et vel voluptates quis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(21, 66, '5', 'Voluptatum qui mollitia rerum autem nihil et.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(22, 67, '2', 'Consectetur exercitationem magni ratione aut repellat magni nihil quos.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(23, 68, '4', 'Est voluptatem velit quia hic.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(24, 69, '3', 'Dolorem ut a amet laborum eos.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(25, 70, '3', 'Provident facilis sit repudiandae modi aut consequuntur.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(26, 71, '5', 'Ratione libero voluptatum ut dolores tempore nostrum laudantium iusto aut.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(27, 72, '2', 'Labore et maxime suscipit molestias rerum animi ratione molestiae.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(28, 73, '1', 'Ab quos quo.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(29, 74, '1', 'Illo cum totam perspiciatis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(30, 75, '3', 'Est cupiditate eos vel.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(31, 76, '4', 'Sit tempore magnam odio in aliquid laudantium.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(32, 77, '1', 'Dolor qui eligendi eum necessitatibus accusamus delectus earum.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(33, 78, '5', 'Animi pariatur quidem occaecati.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(34, 79, '4', 'Aut est quisquam dolores similique aut velit cum.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(35, 80, '1', 'Reprehenderit vitae voluptate quam veritatis incidunt qui rerum aut dolor.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(36, 81, '3', 'Asperiores eum deleniti nisi est.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(37, 82, '4', 'Rerum eaque est voluptatem rem earum eum.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(38, 83, '5', 'Et blanditiis sint et.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(39, 84, '1', 'Officia autem nam recusandae reiciendis aliquid nostrum sunt animi.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(40, 85, '1', 'Quae repellendus ipsam.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(41, 86, '4', 'Accusamus odio harum aut ut facilis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(42, 87, '2', 'Modi vel in eum minima excepturi qui perferendis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(43, 88, '1', 'Esse dolorem ipsum quidem ut ut est sit minima.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(44, 89, '1', 'Id qui quod animi.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(45, 90, '1', 'Numquam iste molestiae velit.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(46, 91, '5', 'Incidunt qui aperiam recusandae.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(47, 92, '3', 'Dolorem nesciunt dolore neque non enim in.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(48, 93, '1', 'Vitae magnam aperiam id.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(49, 94, '4', 'Nulla sapiente magni magni deleniti sint ea.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(50, 95, '1', 'Nobis cumque quas.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(51, 96, '1', 'Voluptatem ut blanditiis at ipsum deleniti.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(52, 97, '4', 'Omnis nemo ea dolore eaque debitis molestiae dolor qui quae.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(53, 98, '4', 'Numquam delectus libero eum fugit iste odio.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(54, 99, '1', 'Et et et nihil et incidunt voluptatem facere.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(55, 100, '2', 'Repellendus aperiam dolore.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(56, 101, '3', 'Dolore et harum qui velit dolor vero est nesciunt.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(57, 102, '2', 'Mollitia qui fuga quibusdam veniam et aliquam exercitationem ut quis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(58, 103, '3', 'Eum quisquam impedit.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(59, 104, '2', 'Quo ipsam molestias amet est.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(60, 105, '3', 'Odio quis beatae.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(61, 106, '4', 'Fugiat ea non.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(62, 107, '2', 'Aperiam et et et dignissimos nulla aut aut quisquam dolorum.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(63, 108, '5', 'Sapiente sed eius quia labore mollitia.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(64, 109, '5', 'Delectus sint doloribus.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(65, 110, '2', 'Tempore possimus inventore quo.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(66, 111, '1', 'Expedita esse consectetur delectus voluptatum omnis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(67, 112, '4', 'Aut voluptas praesentium aspernatur neque esse quae laboriosam vitae.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(68, 113, '4', 'Sunt dicta officiis unde rerum quia cumque eveniet voluptatibus.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(69, 114, '4', 'Quod voluptates qui aliquam sed corrupti quis ut voluptatem natus.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(70, 115, '4', 'Qui cupiditate voluptatem libero est.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(71, 116, '5', 'Minima debitis esse porro aut id quibusdam itaque ut blanditiis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(72, 117, '1', 'Omnis itaque sint mollitia dolores eveniet tempore possimus.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(73, 118, '4', 'Ut et magni magni et.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(74, 119, '5', 'Aut ut odit id et quaerat cupiditate possimus nisi.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(75, 120, '4', 'Sequi voluptates consequatur in et debitis minima recusandae amet.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(76, 121, '3', 'Beatae officiis architecto dignissimos aspernatur quidem reiciendis sed.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(77, 122, '3', 'Aliquam provident vero in quod cupiditate et a.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(78, 123, '2', 'Sequi vero minima ut quaerat quasi.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(79, 124, '5', 'Est eius sit id voluptatibus quia laborum nesciunt odio tempora.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(80, 125, '1', 'Ducimus enim ipsa soluta.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(81, 126, '3', 'Est enim id voluptatibus ut quod incidunt optio nisi nisi.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(82, 127, '4', 'Laboriosam cupiditate reiciendis et cupiditate at corrupti aspernatur et.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(83, 128, '3', 'Distinctio dolore enim et harum sit voluptas laboriosam fugiat doloremque.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(84, 129, '5', 'Consequuntur aspernatur sint.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(85, 130, '4', 'Facilis omnis voluptatem quia voluptatum harum non.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(86, 131, '2', 'Eum dicta nostrum qui praesentium velit.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(87, 132, '3', 'Odio veniam quod necessitatibus et consequatur aut quasi aperiam.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(88, 133, '2', 'Reprehenderit explicabo eveniet iure error totam harum minima.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(89, 134, '3', 'A provident dolore consequatur perferendis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(90, 135, '2', 'Quas rerum qui dolorem temporibus amet nesciunt odio nisi laborum.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(91, 136, '3', 'Temporibus dolores reiciendis quibusdam sint deserunt animi occaecati iste eligendi.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(92, 137, '5', 'Incidunt ipsam tempore atque corporis ullam.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(93, 138, '3', 'Ducimus nam et et sequi omnis ullam.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(94, 139, '4', 'Qui commodi nam aliquid dolore enim sunt cum dolorem.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(95, 140, '2', 'Voluptatem iusto explicabo est exercitationem officia.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(96, 141, '3', 'Eos rerum temporibus suscipit ipsam dolor earum vitae.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(97, 142, '4', 'Alias ut omnis perferendis consequatur.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(98, 143, '4', 'Fugit numquam at ex accusamus quis et odio enim.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(99, 144, '4', 'Perferendis dolorem aut et culpa quae.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(100, 145, '1', 'Officiis libero dolorum expedita sed dolores minima incidunt error non.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(101, 146, '4', 'Maiores delectus corrupti eos quaerat saepe eveniet.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(102, 147, '2', 'Eligendi libero magnam.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(103, 148, '5', 'Pariatur dolorum rerum pariatur veniam aliquam tenetur.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(104, 149, '5', 'Repellat recusandae exercitationem accusamus quidem cupiditate ut.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(105, 150, '1', 'Sit saepe sunt blanditiis aut et velit sit fugit nobis.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(106, 151, '3', 'Dolores earum accusantium et sunt et ipsam.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3),
(107, 152, '2', 'Culpa minus velit id.', '2024-10-04 12:15:59', '2024-10-04 12:15:59', 3);

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
  `name` text DEFAULT NULL,
  `passwordSalt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `mobile`, `created_at`, `updated_at`, `type`, `city`, `address1`, `address2`, `govId`, `cityId`, `name`, `passwordSalt`) VALUES
(2, 'apk', 'hfdd@knm.com', '$2y$10$7d8pITL0R2evk7w3GWBvDeoQ5JDJPkNUB8GWj6IB2WGzH.9J55q2m', 121, '2024-09-12 10:43:47', '2024-09-12 11:29:34', 'ADMIN', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk', ''),
(3, 'apk1', 'hf@knm.com', '$2y$10$Bg5N2kLy9lph04ltxjZ6le5HgddQTGaMIcsqT1ZoRQ6kmm9tUEdj.', 121, '2024-09-14 13:43:52', '2024-09-14 13:43:52', 'AGENT', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk', ''),
(4, 'apk12', 'hfk@knm.com', '$2y$10$h3Z1SqckwJ7B71qlc7lqYes9bL6MfnorU9jfQGBnYRFFA5qpFw2h6', 121, '2024-09-16 07:42:09', '2024-09-16 07:42:09', 'AGENT', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk', ''),
(5, 'adpk12', 'hsfk@knm.com', '$2y$10$3nFep4XIy5R49OvfhhuOyunpmdTSaL.4NoNBXBXCCHAO1WxCwwll2', 121, '2024-09-17 11:37:27', '2024-09-17 11:37:27', 'AGENT', 'sbhh', 'e2we2wq', 'Address3 is required!1', 0, 0, 'apk', ''),
(6, 'adpk142', 'hsfdk@knm.com', '$2y$10$51Dgf8FcYQyZZ9cWojiL3emDVZfTnNaVIuwj85MpIwZ3UGKtDZe6i', 121, '2024-09-17 12:41:34', '2024-10-01 10:20:40', 'AGENT', 'sbhh', 'NULL', 'Address3 is required!1', 0, 0, 'apk', ''),
(45, '', 'user@example.com', '5h+9J8smFs2QWU0ay2kGIV+C9gaEi2SIyVWM6ZlraUY=', 0, '2024-10-02 10:56:03', '2024-10-02 10:56:03', 'string', NULL, '', '', 0, 0, 'string', 'y0xAItqGZgrtqqTetYNCXQ=='),
(46, '', 'user1@example.com', '98s1PRDuxfxLpTWXOtUssLpPuAOJAMw3SublDgaOPdw=', 0, '2024-10-02 11:53:54', '2024-10-02 11:53:54', 'string', NULL, '', '', 0, 0, 'string', 'TumKMEoT0Ipnxp9xusXikQ=='),
(48, '', 'user2@example.com', 'ddN1hTjkYeR4tQCGGoAOiOmU2SFT2ML/I4qZaj1mTZE=', 0, '2024-10-02 11:54:22', '2024-10-02 11:54:22', 'string', NULL, '', '', 0, 0, 'string', 'gQD36aQyjvtDNMEQND3n4g=='),
(49, '', 'user3@example.com', 'CxKfYQEtRS7qaVts1M8BMcoCxVUiRErEXvm6bH/iLVU=', 0, '2024-10-02 12:19:05', '2024-10-02 12:19:05', 'string', NULL, '', '', 0, 0, 'string', 'J+XRG+UQyJgWZxxYUZTmFw=='),
(51, '', 'alidggggggggetyyhfrfce@example.com', '', 0, '2024-10-04 11:45:17', '2024-10-04 11:45:17', '', NULL, '', '', 0, 0, 'Alice Johnson', ''),
(52, 'Joaquin.Beier45', 'Xavier23@yahoo.com', 'PkQF_VLxKk', -2495, '2024-10-04 11:58:29', '2024-10-04 11:58:29', 'Virtual', NULL, '27298 Wolf Cliff', 'Apt. 244', 3101, 51, 'Owen Mohr', 'ciibk867sm'),
(53, '', 'Burdette_Haley@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Miss Cora Carroll', ''),
(54, '', 'Lacy.Streich@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Woodrow Ziemann PhD', ''),
(55, '', 'Willie91@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'William Johnston III', ''),
(56, '', 'Athena.Little@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Heidi Sanford', ''),
(57, '', 'Constance84@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Clyde Kuhlman Jr.', ''),
(58, '', 'Nona.Lehner@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Miss Dustin Hansen', ''),
(59, '', 'Lula_Skiles4@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Miss Domingo Lemke', ''),
(60, '', 'Edna_Morissette@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Roberta Boehm MD', ''),
(61, '', 'Elyse.Schmitt@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Hugh Nader IV', ''),
(62, '', 'Alysa.Hilpert@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Geoffrey Hermann V', ''),
(63, '', 'Naomi_Hoeger2@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Glenn Quigley Sr.', ''),
(64, '', 'Mary_Dooley@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dana Ward MD', ''),
(65, '', 'Milton_Yundt94@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ivan Witting I', ''),
(66, '', 'Meghan_Powlowski18@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Doug Lockman', ''),
(67, '', 'Jasen.Pouros65@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Abel Swaniawski III', ''),
(68, '', 'Kathleen_Wisoky60@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Robin Witting', ''),
(69, '', 'Eve94@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Gregg Koch Sr.', ''),
(70, '', 'Isac_Franecki@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mr. Arnold Block', ''),
(71, '', 'Kaleb70@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Lois Krajcik', ''),
(72, '', 'Aida34@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Claude Connelly MD', ''),
(73, '', 'Amira.Schaefer43@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Sharon Blick III', ''),
(74, '', 'Simeon_Tillman24@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Lela Murazik', ''),
(75, '', 'Cole_Price77@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Constance Ernser DDS', ''),
(76, '', 'Evert76@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Miss Owen Cummerata', ''),
(77, '', 'Ariane_Doyle36@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Jacquelyn Lockman V', ''),
(78, '', 'Ryleigh.Cummerata59@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Mark Botsford', ''),
(79, '', 'Elsa.Herzog@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Emma Wolf DDS', ''),
(80, '', 'Ibrahim50@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Rene MacGyver', ''),
(81, '', 'Lyla97@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Raquel McCullough I', ''),
(82, '', 'Hildegard.Windler@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Connie Heller Jr.', ''),
(83, '', 'Louie5@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Stephen Schumm DVM', ''),
(84, '', 'Garfield79@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dr. Ellis Corwin', ''),
(85, '', 'Buster.Ledner69@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Jamie Armstrong', ''),
(86, '', 'Ethan31@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Miss Percy Gutmann', ''),
(87, '', 'Frances.Bahringer35@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Phil Miller', ''),
(88, '', 'Eve_Altenwerth90@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mr. Betty Kihn', ''),
(89, '', 'Hanna58@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Danielle Conroy', ''),
(90, '', 'Virginie_Beer43@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Norman Schmeler MD', ''),
(91, '', 'Providenci.McGlynn66@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dr. Robert Keebler', ''),
(92, '', 'Celia95@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Guillermo Ortiz MD', ''),
(93, '', 'Rogers99@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Alexis Kunde', ''),
(94, '', 'Sincere86@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Cory Nolan', ''),
(95, '', 'Damon_Wisoky@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mr. Dana Russel', ''),
(96, '', 'Dewitt.Little38@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Terrence Haag', ''),
(97, '', 'Dortha_Trantow@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Otis Doyle', ''),
(98, '', 'Leora20@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Mathew Graham', ''),
(99, '', 'Name9@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Caroline Mitchell V', ''),
(100, '', 'Bell14@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Alonzo Bogisich', ''),
(101, '', 'Roman.Schultz@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Erika West Jr.', ''),
(102, '', 'Shea_Zulauf@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Jerome Blanda DVM', ''),
(103, '', 'Pierce_Hoeger@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Caroline Kub I', ''),
(104, '', 'Ariel.Mraz55@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mr. Annette Welch', ''),
(105, '', 'Gustave.OKon1@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Danielle Willms', ''),
(106, '', 'Mya.Dickinson@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Penny Ziemann DVM', ''),
(107, '', 'Kris58@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Miss Marilyn Russel', ''),
(108, '', 'Melisa34@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mr. Santos Emmerich', ''),
(109, '', 'Kaleb45@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dr. Leticia Schumm', ''),
(110, '', 'Genoveva59@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Miss Juana Miller', ''),
(111, '', 'Domenico_Stoltenberg@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Stanley Marquardt DVM', ''),
(112, '', 'Hertha10@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Meredith Murazik II', ''),
(113, '', 'Joel_Kozey@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Deborah Hoeger Sr.', ''),
(114, '', 'Wendy_West85@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Grace Champlin', ''),
(115, '', 'Ellie98@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dr. Jimmie Borer', ''),
(116, '', 'Hadley.Schmeler@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mr. Ray Brown', ''),
(117, '', 'Lynn_Larson7@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Roland O\'Kon I', ''),
(118, '', 'Gregory7@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dr. Norman Kub', ''),
(119, '', 'Davon.Auer@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Timothy Lemke I', ''),
(120, '', 'Seamus.Ward19@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Constance Monahan II', ''),
(121, '', 'Rosalee.Friesen30@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dr. Shannon Gulgowski', ''),
(122, '', 'Shany82@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Cameron Kozey', ''),
(123, '', 'Augusta65@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Vincent Sauer DVM', ''),
(124, '', 'Demarcus_Walker@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Saul Labadie MD', ''),
(125, '', 'Emmet_Stroman@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Elizabeth Okuneva IV', ''),
(126, '', 'Eulalia44@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dr. Bobbie Bailey', ''),
(127, '', 'Laurie.Howell91@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Edith Murazik IV', ''),
(128, '', 'Andres.Wuckert73@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Miss Travis Hegmann', ''),
(129, '', 'Llewellyn_Koelpin@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Frederick Kunde', ''),
(130, '', 'Marques.Kuvalis2@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Vivian Gottlieb DVM', ''),
(131, '', 'Tate_Franecki@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Lawrence Roob', ''),
(132, '', 'Helen92@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Pedro Rogahn', ''),
(133, '', 'Heather_Hand3@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Felix Walter Jr.', ''),
(134, '', 'Kamron_Orn@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Brett Veum', ''),
(135, '', 'Augustine89@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Anita Bernier', ''),
(136, '', 'Reagan_Collins83@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Randolph Lesch II', ''),
(137, '', 'Quinten_Cruickshank47@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Denise Corkery V', ''),
(138, '', 'Leila_Dare@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Jeremy Ondricka I', ''),
(139, '', 'Nickolas_Klocko@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Aaron Kuvalis MD', ''),
(140, '', 'Ulices98@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Esther Klein', ''),
(141, '', 'Bert_Rodriguez@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mrs. Bernadette Ferry', ''),
(142, '', 'Joana73@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Ms. Alberta Legros', ''),
(143, '', 'Ricardo_Kunde72@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Cedric McKenzie DVM', ''),
(144, '', 'Lesly.OHara20@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Andrew Torp PhD', ''),
(145, '', 'Dayton_Miller@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Darren Weber PhD', ''),
(146, '', 'Laney_Kozey@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Mr. Christopher Moen', ''),
(147, '', 'Reece.Padberg46@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Darrel Brakus MD', ''),
(148, '', 'Ansel.Bernhard@hotmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Raquel Wolff Sr.', ''),
(149, '', 'Neha55@gmail.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Dr. Orville Bosco', ''),
(150, '', 'Yasmin92@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Vincent Gibson Sr.', ''),
(151, '', 'Kara.Lowe92@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Nicholas Russel DVM', ''),
(152, '', 'Cora19@yahoo.com', '', 0, '2024-10-04 12:04:04', '2024-10-04 12:04:04', '', NULL, '', '', 0, 0, 'Elsa Davis I', ''),
(153, '', 'user3gregertgrtes@example.com', 'YvgjCB7uJBdZH5wQ5+7ea9PGRp/oVrZxOOreC/CHj7c=', 0, '2024-10-05 21:27:45', '2024-10-05 21:27:45', 'AGEEN', NULL, '', '', 0, 0, 'hello', 'LUHioQ87ZtyzRSqzFgWYmA==');

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

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20241003224852_SeedUsers', '8.0.8'),
('20241003225406_SeedUsers', '8.0.8'),
('20241004112443_seedData', '8.0.8'),
('20241004114245_seedData', '8.0.8'),
('20241004114423_seedData2', '8.0.8'),
('20241004115802_seedData3', '8.0.8'),
('20241004120301_seedData4', '8.0.8'),
('20241004120612_seedData5', '8.0.8'),
('20241004122215_seedData7', '8.0.8'),
('20241004123717_seedData9', '8.0.8');

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
-- Indexes for table `food_category`
--
ALTER TABLE `food_category`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `restaurantId` (`restaurantId`),
  ADD KEY `foodCategoryId` (`foodCategoryId`);

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
-- Indexes for table `restaurant_supporters`
--
ALTER TABLE `restaurant_supporters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supporterId` (`supporterId`,`restaurantId`),
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
  ADD KEY `user_cat_pref_ibfk_2` (`catId`);

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
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT for table `food_category`
--
ALTER TABLE `food_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `gov`
--
ALTER TABLE `gov`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
-- AUTO_INCREMENT for table `restaurant_supporters`
--
ALTER TABLE `restaurant_supporters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

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
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`foodCategoryId`) REFERENCES `food_category` (`id`);

--
-- Constraints for table `owners`
--
ALTER TABLE `owners`
  ADD CONSTRAINT `owners_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `owners_ibfk_2` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `owners_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `restaurant_supporters`
--
ALTER TABLE `restaurant_supporters`
  ADD CONSTRAINT `restaurant_supporters_ibfk_1` FOREIGN KEY (`supporterId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurant_supporters_ibfk_2` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `user_cat_pref_ibfk_2` FOREIGN KEY (`catId`) REFERENCES `category` (`id`) ON DELETE CASCADE;

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
