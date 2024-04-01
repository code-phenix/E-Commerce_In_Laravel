-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2022 at 11:26 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'digital1', 'digital1', '2021-11-25 11:32:43', '2022-01-22 08:09:19'),
(15, 'digital15', 'digital15', '2021-11-25 11:32:43', '2022-01-22 08:09:19'),
(16, 'Watch', 'watch', '2022-03-23 10:00:00', '2022-03-23 10:00:00'),
(17, 'Mobile', 'mobile', '2022-03-23 10:38:44', '2022-03-23 10:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '09876543210', 'asdasd asd asd asd asd ', '2022-03-31 14:06:14', '2022-03-31 14:06:14'),
(2, 'admin', 'admin@gmail.com', '09876543210', 'asdasd asd asd asd asd ', '2022-03-31 14:06:20', '2022-03-31 14:06:20'),
(3, 'admin', 'admin@gmail.com', '09876543210', 'asdasd asd asd asd asd ', '2022-03-31 14:06:21', '2022-03-31 14:06:21');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
(1, 'OFF1', 'fixed', '100.00', '1000.00', '2022-01-22 02:53:25', '2022-01-25 09:02:19', '2022-01-24'),
(2, 'OFF2', 'percent', '100.00', '10.00', '2022-01-22 02:54:57', '2022-01-25 08:48:54', '2022-01-26'),
(3, 'OFF6', 'percent', '10.00', '100.00', '2022-01-25 08:06:02', '2022-01-25 08:48:28', '2022-01-27'),
(4, 'OFF10', 'percent', '2.00', '100.00', '2022-03-23 10:13:20', '2022-03-23 10:13:20', '2022-03-25'),
(5, 'OFF11', 'fixed', '10.00', '1000.00', '2022-03-23 10:51:48', '2022-03-23 10:51:48', '2022-03-24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '1,15,16,17', 1, '2021-11-25 11:32:43', '2022-03-23 10:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'title ', 'sub Title', '100', 'https://www.google.com/', '1648049767.jpg', 1, '2022-03-23 10:06:09', '2022-03-23 10:06:09'),
(2, 'title', 'subtitle', '100', 'http://127.0.0.1:8000/', '1648052045.jpg', 1, '2022-03-23 10:44:05', '2022-03-23 10:44:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(18, '2021_11_17_170426_create_sessions_table', 1),
(19, '2021_11_22_123106_create_categories_table', 1),
(20, '2021_11_22_123158_create_products_table', 1),
(21, '2021_11_27_135611_create_home_sliders_table', 1),
(22, '2021_11_28_112550_create_home_categories_table', 1),
(23, '2021_12_11_164957_create_sales_table', 1),
(24, '2022_01_16_070951_create_coupons_table', 1),
(25, '2022_01_25_130056_add_expiry_date_to_coupons_table', 2),
(26, '2022_01_25_145005_create_orders_table', 3),
(27, '2022_01_25_145018_create_order_items_table', 3),
(28, '2022_01_25_145031_create_shippings_table', 3),
(29, '2022_01_25_145044_create_transcations_table', 3),
(30, '2022_03_20_070314_add_delivered_canceled_date_to_orders_table', 4),
(31, '2022_03_20_120703_create_reviews_table', 5),
(32, '2022_03_20_121505_add_rstatus_to_order_items_table', 5),
(33, '2022_03_30_163532_create_contacts_table', 6),
(34, '2022_04_01_202543_create_settings_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
(1, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '12', 'India', '626007', 'ordered', 0, '2022-03-19 00:36:16', '2022-03-19 00:36:16', NULL, NULL),
(2, 1, '100.00', '0.00', '21.00', '121.00', 'Test', 'Test', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '12', 'India', '626007', 'ordered', 0, '2022-03-19 00:41:26', '2022-03-19 00:41:26', NULL, NULL),
(3, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '12', 'India', '626007', 'ordered', 0, '2022-03-19 00:54:21', '2022-03-19 00:54:21', NULL, NULL),
(4, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '123', 'India', '626007', 'ordered', 0, '2022-03-19 00:56:37', '2022-03-19 00:56:37', NULL, NULL),
(5, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '123', 'India', '626007', 'ordered', 0, '2022-03-19 00:57:01', '2022-03-19 00:57:01', NULL, NULL),
(6, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '124', 'India', '626007', 'ordered', 0, '2022-03-19 01:04:59', '2022-03-19 01:04:59', NULL, NULL),
(7, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '12', 'India', '626007', 'ordered', 0, '2022-03-19 01:07:08', '2022-03-19 01:07:08', NULL, NULL),
(8, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '123', 'India', '626007', 'ordered', 0, '2022-03-19 01:18:17', '2022-03-19 01:18:17', NULL, NULL),
(9, 1, '600.00', '0.00', '126.00', '726.00', 'as', 'qwe', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '13', 'India', '626007', 'ordered', 0, '2022-03-19 01:23:20', '2022-03-19 01:23:20', NULL, NULL),
(10, 1, '600.00', '0.00', '126.00', '726.00', 'as', 'qwe', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '13', 'India', '626007', 'ordered', 0, '2022-03-19 01:36:30', '2022-03-19 01:36:30', NULL, NULL),
(11, 1, '600.00', '0.00', '126.00', '726.00', 'as', 'qwe', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '13', 'India', '626007', 'ordered', 0, '2022-03-19 01:40:10', '2022-03-19 01:40:10', NULL, NULL),
(12, 1, '600.00', '0.00', '126.00', '726.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '121', 'India', '626007', 'ordered', 0, '2022-03-19 01:47:41', '2022-03-19 01:47:41', NULL, NULL),
(13, 1, '600.00', '0.00', '126.00', '726.00', 'code', 'pheonix', '9876543210', 'siva@gmail.com', 'n13', NULL, 'asd', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:00:32', '2022-03-19 02:00:32', NULL, NULL),
(14, 1, '600.00', '0.00', '126.00', '726.00', 'code', 'pheonix', '9876543210', 'siva@gmail.com', 'n13', NULL, 'asd', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:02:11', '2022-03-19 02:02:11', NULL, NULL),
(15, 1, '600.00', '0.00', '126.00', '726.00', 'code', 'pheonix', '9876543210', 'siva@gmail.com', 'n13', NULL, 'asd', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:02:19', '2022-03-19 02:02:19', NULL, NULL),
(16, 1, '600.00', '0.00', '126.00', '726.00', 'code', 'pheonix', '9876543210', 'siva@gmail.com', 'n13', NULL, 'asd', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:04:33', '2022-03-19 02:04:33', NULL, NULL),
(17, 1, '600.00', '0.00', '126.00', '726.00', 'qwe', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:13:00', '2022-03-19 02:13:00', NULL, NULL),
(18, 1, '600.00', '0.00', '126.00', '726.00', 'qwe', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:16:29', '2022-03-19 02:16:29', NULL, NULL),
(19, 1, '600.00', '0.00', '126.00', '726.00', 'as', 'sef', '09876543210', 'admin@gmail.com', 'werf', 'sdgf ', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:22:19', '2022-03-19 02:22:19', NULL, NULL),
(20, 1, '600.00', '0.00', '126.00', '726.00', 'as', 'sef', '09876543210', 'admin@gmail.com', 'werf', 'sdgf ', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:22:30', '2022-03-19 02:22:30', NULL, NULL),
(21, 1, '600.00', '0.00', '126.00', '726.00', 'as', 'sef', '09876543210', 'admin@gmail.com', 'sf', 'qdv', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:25:10', '2022-03-19 02:25:10', NULL, NULL),
(22, 1, '600.00', '0.00', '126.00', '726.00', 'qwe', 'gvgv', '09876543210', 'admin@gmail.com', 'jhb', 'tbhnj', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:28:21', '2022-03-19 02:28:21', NULL, NULL),
(23, 1, '600.00', '0.00', '126.00', '726.00', 'qwe', 'gvgv', '09876543210', 'admin@gmail.com', 'jhb', 'tbhnj', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:28:36', '2022-03-19 02:28:36', NULL, NULL),
(24, 1, '600.00', '0.00', '126.00', '726.00', 'qwe', 'gvgv', '09876543210', 'admin@gmail.com', 'jhb', 'tbhnj', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:32:59', '2022-03-19 02:32:59', NULL, NULL),
(25, 1, '600.00', '0.00', '126.00', '726.00', 'qwe', 'gvgv', '09876543210', 'admin@gmail.com', 'jhb', 'tbhnj', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:33:05', '2022-03-19 02:33:05', NULL, NULL),
(26, 1, '600.00', '0.00', '126.00', '726.00', 'as', 'sef', '09876543210', 'admin@gmail.com', 'asd', 'qd', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:37:10', '2022-03-19 02:37:10', NULL, NULL),
(27, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'sf', '09876543210', 'admin@gmail.com', 'yb', 'qe', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:46:36', '2022-03-19 02:46:36', NULL, NULL),
(28, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'as', 'asd', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:48:16', '2022-03-19 02:48:16', NULL, NULL),
(29, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'sad', '09876543210', 'admin@gmail.com', 'asd', 'sdf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:49:28', '2022-03-19 02:49:28', NULL, NULL),
(30, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.comq', 'yb', 'n13', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:54:38', '2022-03-19 02:54:38', NULL, NULL),
(31, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.comq', 'yb', 'n13', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 02:55:16', '2022-03-19 02:55:16', NULL, NULL),
(32, 1, '100.00', '0.00', '21.00', '121.00', 'qwe', 'asd', '09876543210', 'admin@gmail.com', 'k', 'm ', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 03:04:02', '2022-03-19 03:04:02', NULL, NULL),
(33, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '098765432101', 'admin@gmail.com', '12', 'xfgb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 03:17:02', '2022-03-19 03:17:02', NULL, NULL),
(34, 1, '200.00', '0.00', '42.00', '242.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'as', 'asd', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 1, '2022-03-19 13:13:43', '2022-03-19 13:13:43', NULL, NULL),
(35, 1, '200.00', '0.00', '42.00', '242.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'as', 'asd', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 1, '2022-03-19 13:13:48', '2022-03-19 13:13:48', NULL, NULL),
(36, 1, '200.00', '0.00', '42.00', '242.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'as', 'asd', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 1, '2022-03-19 13:13:56', '2022-03-19 13:13:56', NULL, NULL),
(37, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'as', 'n13', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 14:33:48', '2022-03-19 14:33:48', NULL, NULL),
(38, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'as', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 1, '2022-03-19 14:35:22', '2022-03-19 14:35:22', NULL, NULL),
(39, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'as', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 1, '2022-03-19 14:35:27', '2022-03-19 14:35:27', NULL, NULL),
(40, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'as', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-03-19 23:07:02', '2022-03-19 23:07:02', NULL, NULL),
(41, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'qwe', '09876543210', 'admin@gmail.com', 'yb', 'as', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 1, '2022-03-19 23:08:54', '2022-03-19 23:08:54', NULL, NULL),
(42, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'qwe', '09876543210', 'admin@gmail.com', 'as', 'yb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 1, '2022-03-19 23:10:07', '2022-03-19 23:10:07', NULL, NULL),
(43, 2, '100.00', '0.00', '21.00', '121.00', 'as', 'pheonix', '09876543210', 'user@gmail.com', 'yb', 'as', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'canceled', 1, '2022-03-20 00:50:49', '2022-03-20 04:34:23', NULL, '2022-03-20'),
(44, 2, '200.00', '0.00', '42.00', '242.00', 'as', 'asd', '09876543210', 'user@gmail.com', 'asd', 'asd', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 1, '2022-03-20 00:54:46', '2022-03-20 04:07:17', '2022-03-20', '2022-03-20'),
(45, 1, '176.40', '3.60', '37.04', '213.44', 'as', 'qwe', '09876543210', 'admin@gmail.com', 'sdf', 'sdf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-03-23 10:16:14', '2022-03-23 10:17:29', '2022-03-23', NULL),
(46, 2, '100.00', '0.00', '21.00', '121.00', 'as', 'pheonix', '09876543210', 'user@gmail.com', 'yb', 'werf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-03-23 10:20:23', '2022-03-23 10:20:53', '2022-03-23', NULL),
(47, 2, '100.00', '0.00', '21.00', '121.00', 'sf', 'dfg', '9876543210', 'user@gmail.com', 'qwe', 'qwd', 'Tirunelveli', 'TAMIL NADU', 'India', '627757', 'delivered', 0, '2022-03-23 10:57:08', '2022-03-23 10:57:43', '2022-03-23', NULL),
(48, 2, '100.00', '0.00', '21.00', '121.00', 'sdf', '123', '09876543210', 'user@gmail.com', '46464', 'sadf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-03-26 02:43:46', '2022-03-26 02:44:39', '2022-03-26', '2022-03-26'),
(49, 1, '1000.00', '0.00', '210.00', '1210.00', 'sf', 'sdf', '09876543210', 'admin@gmail.com', '123', 'sdf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-03-29 09:32:08', '2022-03-29 09:32:25', '2022-03-29', NULL),
(50, 2, '1000.00', '0.00', '210.00', '1210.00', 'as', 'asd', '09876543210', 'user@gmail.com', 'sdf', 'sdf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-03-29 09:33:17', '2022-03-29 09:33:43', '2022-03-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`, `rstatus`) VALUES
(1, 3, 1, '100.00', 1, '2022-03-19 00:36:16', '2022-03-19 00:36:16', 0),
(2, 3, 2, '100.00', 1, '2022-03-19 00:41:26', '2022-03-19 00:41:26', 0),
(3, 3, 3, '100.00', 1, '2022-03-19 00:54:21', '2022-03-19 00:54:21', 0),
(4, 3, 4, '100.00', 1, '2022-03-19 00:56:37', '2022-03-19 00:56:37', 0),
(5, 3, 5, '100.00', 1, '2022-03-19 00:57:01', '2022-03-19 00:57:01', 0),
(6, 3, 6, '100.00', 1, '2022-03-19 01:04:59', '2022-03-19 01:04:59', 0),
(7, 3, 7, '100.00', 1, '2022-03-19 01:07:08', '2022-03-19 01:07:08', 0),
(8, 3, 8, '100.00', 1, '2022-03-19 01:18:17', '2022-03-19 01:18:17', 0),
(9, 3, 9, '100.00', 6, '2022-03-19 01:23:20', '2022-03-19 01:23:20', 0),
(10, 3, 10, '100.00', 6, '2022-03-19 01:36:30', '2022-03-19 01:36:30', 0),
(11, 3, 11, '100.00', 6, '2022-03-19 01:40:10', '2022-03-19 01:40:10', 0),
(12, 3, 12, '100.00', 6, '2022-03-19 01:47:41', '2022-03-19 01:47:41', 0),
(13, 3, 13, '100.00', 6, '2022-03-19 02:00:32', '2022-03-19 02:00:32', 0),
(14, 3, 14, '100.00', 6, '2022-03-19 02:02:11', '2022-03-19 02:02:11', 0),
(15, 3, 15, '100.00', 6, '2022-03-19 02:02:19', '2022-03-19 02:02:19', 0),
(16, 3, 16, '100.00', 6, '2022-03-19 02:04:33', '2022-03-19 02:04:33', 0),
(17, 3, 17, '100.00', 6, '2022-03-19 02:13:00', '2022-03-19 02:13:00', 0),
(18, 3, 18, '100.00', 6, '2022-03-19 02:16:29', '2022-03-19 02:16:29', 0),
(19, 3, 19, '100.00', 6, '2022-03-19 02:22:19', '2022-03-19 02:22:19', 0),
(20, 3, 20, '100.00', 6, '2022-03-19 02:22:30', '2022-03-19 02:22:30', 0),
(21, 3, 21, '100.00', 6, '2022-03-19 02:25:10', '2022-03-19 02:25:10', 0),
(22, 3, 22, '100.00', 6, '2022-03-19 02:28:21', '2022-03-19 02:28:21', 0),
(23, 3, 23, '100.00', 6, '2022-03-19 02:28:36', '2022-03-19 02:28:36', 0),
(24, 3, 24, '100.00', 6, '2022-03-19 02:32:59', '2022-03-19 02:32:59', 0),
(25, 3, 25, '100.00', 6, '2022-03-19 02:33:05', '2022-03-19 02:33:05', 0),
(26, 3, 26, '100.00', 6, '2022-03-19 02:37:10', '2022-03-19 02:37:10', 0),
(27, 3, 27, '100.00', 1, '2022-03-19 02:46:36', '2022-03-19 02:46:36', 0),
(28, 3, 28, '100.00', 1, '2022-03-19 02:48:16', '2022-03-19 02:48:16', 0),
(29, 3, 29, '100.00', 1, '2022-03-19 02:49:28', '2022-03-19 02:49:28', 0),
(30, 3, 30, '100.00', 1, '2022-03-19 02:54:38', '2022-03-19 02:54:38', 0),
(31, 3, 31, '100.00', 1, '2022-03-19 02:55:16', '2022-03-19 02:55:16', 0),
(32, 3, 32, '100.00', 1, '2022-03-19 03:04:02', '2022-03-19 03:04:02', 0),
(33, 3, 33, '100.00', 1, '2022-03-19 03:17:02', '2022-03-19 03:17:02', 0),
(34, 3, 34, '100.00', 2, '2022-03-19 13:13:43', '2022-03-19 13:13:43', 0),
(35, 3, 35, '100.00', 2, '2022-03-19 13:13:48', '2022-03-19 13:13:48', 0),
(36, 3, 36, '100.00', 2, '2022-03-19 13:13:57', '2022-03-19 13:13:57', 0),
(37, 3, 37, '100.00', 1, '2022-03-19 14:33:48', '2022-03-19 14:33:48', 0),
(38, 3, 38, '100.00', 1, '2022-03-19 14:35:22', '2022-03-19 14:35:22', 0),
(39, 3, 39, '100.00', 1, '2022-03-19 14:35:27', '2022-03-19 14:35:27', 0),
(40, 3, 40, '100.00', 1, '2022-03-19 23:07:02', '2022-03-19 23:07:02', 0),
(41, 3, 41, '100.00', 1, '2022-03-19 23:08:54', '2022-03-19 23:08:54', 0),
(42, 3, 42, '100.00', 1, '2022-03-19 23:10:07', '2022-03-19 23:10:07', 0),
(43, 3, 43, '100.00', 1, '2022-03-20 00:50:49', '2022-03-20 00:50:49', 0),
(44, 3, 44, '100.00', 2, '2022-03-20 00:54:46', '2022-03-21 14:33:13', 1),
(45, 4, 45, '90.00', 2, '2022-03-23 10:16:14', '2022-03-23 10:16:14', 0),
(46, 3, 46, '100.00', 1, '2022-03-23 10:20:23', '2022-03-23 10:22:01', 1),
(47, 4, 47, '100.00', 1, '2022-03-23 10:57:08', '2022-03-23 10:58:23', 1),
(48, 3, 48, '100.00', 1, '2022-03-26 02:43:46', '2022-03-26 02:45:26', 1),
(49, 5, 49, '1000.00', 1, '2022-03-29 09:32:08', '2022-03-29 09:32:08', 0),
(50, 5, 50, '1000.00', 1, '2022-03-29 09:33:17', '2022-03-29 09:39:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`) VALUES
(3, 'mobile1', 'mobile1', '<p>sdfsr dg</p>', '<p>srg sertgrert</p>', '100.00', '90.00', 'Digital1', 'instock', 1, 100, '1642839569.jpg', NULL, 1, '2022-01-22 02:49:29', '2022-01-22 02:50:32'),
(4, 'Watch 1', 'watch-1', '<p><strong>dsfsdf sdkf</strong></p>', '<p>sfdsdf sdfsdf</p>', '100.00', '90.00', 'digi-1', 'instock', 1, 100, '1648049562.jpg', NULL, 16, '2022-03-23 10:02:42', '2022-03-23 10:02:42'),
(5, 'mobile 2', 'mobile-2', '<p><strong>mobile oda short description</strong></p>', '<p>mobile oda&nbsp; description</p>', '1000.00', '999.00', '10', 'instock', 1, 1000, '1648566068.jpg', NULL, 17, '2022-03-29 09:31:08', '2022-03-29 09:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `comment`, `order_item_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'review 1', 44, '2022-03-21 14:33:13', '2022-03-21 14:33:13'),
(2, 2, 'sdfsdf', 46, '2022-03-23 10:22:01', '2022-03-23 10:22:01'),
(3, 2, 'esfsf', 47, '2022-03-23 10:58:23', '2022-03-23 10:58:23'),
(4, 2, 'sf', 48, '2022-03-26 02:45:26', '2022-03-26 02:45:26'),
(5, 1, 'asdasdasd', 50, '2022-03-29 09:39:55', '2022-03-29 09:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2022-03-25 09:21:30', 1, '2021-11-25 11:32:43', '2022-03-23 10:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('eQ73J7IjHO5BW9jYCvnHzWBDEomMgJsuGeVON5Do', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoickdhZXVqcHVwdjZyd3BlY3pTUnBoa1ZJMU1zS2FyMFFwNjRxdGZscyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zZXR0aW5ncyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRILjRDNmgxcGZXWjVIWDcxdFN3UG9lWXEveTVSTmpkU3RmNFR6R1ptYTMwMGw4ejFnVGxlVyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkSC40QzZoMXBmV1o1SFg3MXRTd1BvZVlxL3k1Uk5qZFN0ZjRUekdabWEzMDBsOHoxZ1RsZVciO30=', 1648848326);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `order_id`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 36, 'as', 'asd', '09876543210', 'admin@gmail.com', 'werf', 'werf', 'dfgdbfg kgs rgosrijg', '123', 'India', '626007', '2022-03-19 13:13:57', '2022-03-19 13:13:57'),
(2, 39, 'as', 'qwe', '09876543210', 'admin@gmail.com', 'yb', 'n13', 'dfgdbfg kgs rgosrijg', '123', 'India', '626007', '2022-03-19 14:35:27', '2022-03-19 14:35:27'),
(3, 41, 'as', 'asd', '09876543210', 'admin@gmail.comq', 'n13', 'n13', 'dfgdbfg kgs rgosrijg', '123', 'India', '626007', '2022-03-19 23:08:54', '2022-03-19 23:08:54'),
(4, 42, 'qwe', 'qwe', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', '123', 'India', '626007', '2022-03-19 23:10:07', '2022-03-19 23:10:07'),
(5, 43, 'as', 'asd', '09876543210', 'admin@gmail.com', '23', 'n13', 'dfgdbfg kgs rgosrijg', '23', 'India', '626007', '2022-03-20 00:50:49', '2022-03-20 00:50:49'),
(6, 44, 'as', 'asd', '09876543210', 'user@gmail.com', 'n13', 'jhb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', '2022-03-20 00:54:46', '2022-03-20 00:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `transcations`
--

CREATE TABLE `transcations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transcations`
--

INSERT INTO `transcations` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 33, 'card', 'approved', '2022-03-19 03:17:06', '2022-03-19 03:17:06'),
(2, 1, 36, 'cod', 'pending', '2022-03-19 13:13:57', '2022-03-19 13:13:57'),
(3, 1, 37, 'cod', 'pending', '2022-03-19 14:33:48', '2022-03-19 14:33:48'),
(4, 1, 39, 'cod', 'pending', '2022-03-19 14:35:27', '2022-03-19 14:35:27'),
(5, 1, 40, 'cod', 'pending', '2022-03-19 23:07:02', '2022-03-19 23:07:02'),
(6, 1, 41, 'cod', 'pending', '2022-03-19 23:08:54', '2022-03-19 23:08:54'),
(7, 1, 42, 'card', 'approved', '2022-03-19 23:10:12', '2022-03-19 23:10:12'),
(8, 2, 43, 'cod', 'pending', '2022-03-20 00:50:49', '2022-03-20 00:50:49'),
(9, 2, 44, 'card', 'approved', '2022-03-20 00:54:51', '2022-03-20 00:54:51'),
(10, 1, 45, 'cod', 'pending', '2022-03-23 10:16:14', '2022-03-23 10:16:14'),
(11, 2, 46, 'cod', 'pending', '2022-03-23 10:20:23', '2022-03-23 10:20:23'),
(12, 2, 47, 'cod', 'pending', '2022-03-23 10:57:08', '2022-03-23 10:57:08'),
(13, 2, 48, 'cod', 'pending', '2022-03-26 02:43:46', '2022-03-26 02:43:46'),
(14, 1, 49, 'cod', 'pending', '2022-03-29 09:32:08', '2022-03-29 09:32:08'),
(15, 2, 50, 'cod', 'pending', '2022-03-29 09:33:17', '2022-03-29 09:33:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT 1,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin ,USR for User/customer,NM for Network Markter,SUP for Supplier',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `is_valid`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$H.4C6h1pfWZ5HX71tSwPoeYq/y5RNjdStf4TzGZma300l8z1gTleW', NULL, NULL, NULL, NULL, 1, NULL, 'ADM', '2022-01-22 02:46:59', '2022-01-22 02:46:59'),
(2, 'user', 'user@gmail.com', NULL, '$2y$10$OWiMk6dcJuhK2CB52M0d..cT17DSmFIvX/SgJrY3hhHutrulZDZ9m', NULL, NULL, NULL, NULL, 1, NULL, 'USR', '2022-03-20 00:36:05', '2022-03-29 14:01:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `transcations`
--
ALTER TABLE `transcations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transcations_user_id_foreign` (`user_id`),
  ADD KEY `transcations_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transcations`
--
ALTER TABLE `transcations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transcations`
--
ALTER TABLE `transcations`
  ADD CONSTRAINT `transcations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transcations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
