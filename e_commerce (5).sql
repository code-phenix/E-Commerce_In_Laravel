-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2022 at 12:39 PM
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
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `product_attribute_id`, `value`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, '10', 14, '2022-04-16 05:04:33', '2022-04-16 05:04:33'),
(2, 2, '11', 14, '2022-04-16 05:04:33', '2022-04-16 05:04:33'),
(3, 2, '12', 14, '2022-04-16 05:04:33', '2022-04-16 05:04:33'),
(4, 3, 'Yellow', 14, '2022-04-16 05:04:33', '2022-04-16 05:04:33'),
(5, 3, 'Green', 14, '2022-04-16 05:04:33', '2022-04-16 05:04:33');

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
(17, 'Mobile', 'mobile', '2022-03-23 10:38:44', '2022-03-23 10:38:44'),
(18, 'Electronics', 'electronics', '2022-04-04 13:24:27', '2022-04-04 13:24:27'),
(19, 'Tech', 'tech', '2022-04-04 13:40:31', '2022-04-04 13:40:31'),
(20, 'mainCategory', 'maincategory', '2022-04-10 06:26:58', '2022-04-10 06:26:58');

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
(34, '2022_04_01_202543_create_settings_table', 7),
(35, '2022_04_03_175020_create_shoppingcart_table', 8),
(36, '2022_04_04_183149_create_subcategories_table', 9),
(37, '2022_04_10_105646_add_subcategory_id_to_products_table', 10),
(38, '2022_04_11_182331_create_profiles_table', 11),
(39, '2022_04_14_193806_create_product_attributes_table', 12),
(40, '2022_04_15_083808_create_attribute_values_table', 13);

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
(50, 2, '1000.00', '0.00', '210.00', '1210.00', 'as', 'asd', '09876543210', 'user@gmail.com', 'sdf', 'sdf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-03-29 09:33:17', '2022-03-29 09:33:43', '2022-03-29', NULL),
(51, 1, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'sdf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-04-02 14:35:30', '2022-04-02 14:35:50', '2022-04-03', NULL),
(52, 1, '3000.00', '0.00', '630.00', '3630.00', 'as', 'qwe', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-04-03 07:34:39', '2022-04-03 07:34:39', NULL, NULL),
(53, 1, '1100.00', '0.00', '231.00', '1331.00', 'qwe', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-04-03 07:36:01', '2022-04-03 07:36:01', NULL, NULL),
(54, 1, '100.00', '0.00', '21.00', '121.00', 'qwe', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'as', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-04-03 07:38:18', '2022-04-03 07:38:18', NULL, NULL),
(55, 1, '1000.00', '0.00', '210.00', '1210.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'as', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-04-03 07:40:11', '2022-04-03 07:40:11', NULL, NULL),
(56, 1, '1000.00', '0.00', '210.00', '1210.00', 'as', 'asd', '09876543210', 'admin@gmail.com', 'yb', 'yb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-04-03 07:42:51', '2022-04-03 07:42:51', NULL, NULL),
(57, 3, '2100.00', '0.00', '441.00', '2541.00', 'siva', 'shunmuga sundaram', '09876543210', 'sivashunmugasundaram007@gmail.com', 'n13', 'werf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-04-03 12:42:15', '2022-04-03 12:55:24', '2022-04-03', NULL),
(58, 3, '1000.00', '0.00', '210.00', '1210.00', 'siva', 'shunmuga sundaram', '09876543210', 'sivashunmugasundaram007@gmail.com', 'n13', 'jhb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-04-03 12:58:49', '2022-04-03 12:58:49', NULL, NULL),
(59, 3, '1000.00', '0.00', '210.00', '1210.00', 'siva', 'shunmuga sundaram', '09876543210', 'sivashunmugasundaram007@gmail.com', 'sdf', 'jhb', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-04-03 12:59:30', '2022-04-03 12:59:30', NULL, NULL),
(60, 3, '100.00', '0.00', '21.00', '121.00', 'as', 'asd', '09876543210', 'sivashunmugasundaram007@gmail.com', 'sdf', 'werf', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'ordered', 0, '2022-04-03 13:10:19', '2022-04-03 13:10:19', NULL, NULL),
(61, 2, '100.00', '0.00', '21.00', '121.00', 'user', 'userLastName', '09876543210', 'user@gmail.com', 'Lne1', 'line2', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', 'delivered', 0, '2022-04-14 13:23:17', '2022-04-14 13:24:05', '2022-04-15', NULL);

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
(46, 3, 46, '100.00', 1, '2022-03-23 10:20:23', '2022-03-23 10:22:01', 1),
(48, 3, 48, '100.00', 1, '2022-03-26 02:43:46', '2022-03-26 02:45:26', 1),
(51, 3, 51, '100.00', 1, '2022-04-02 14:35:30', '2022-04-02 14:35:30', 0),
(52, 8, 52, '1000.00', 2, '2022-04-03 07:34:39', '2022-04-03 07:34:39', 0),
(53, 7, 52, '1000.00', 1, '2022-04-03 07:34:39', '2022-04-03 07:34:39', 0),
(54, 3, 53, '100.00', 1, '2022-04-03 07:36:01', '2022-04-03 07:36:01', 0),
(55, 7, 53, '1000.00', 1, '2022-04-03 07:36:01', '2022-04-03 07:36:01', 0),
(56, 3, 54, '100.00', 1, '2022-04-03 07:38:18', '2022-04-03 07:38:18', 0),
(57, 7, 55, '1000.00', 1, '2022-04-03 07:40:11', '2022-04-03 07:40:11', 0),
(58, 7, 56, '1000.00', 1, '2022-04-03 07:42:51', '2022-04-03 07:42:51', 0),
(59, 3, 57, '100.00', 1, '2022-04-03 12:42:15', '2022-04-03 12:42:15', 0),
(60, 7, 57, '1000.00', 1, '2022-04-03 12:42:15', '2022-04-03 12:42:15', 0),
(61, 8, 57, '1000.00', 1, '2022-04-03 12:42:15', '2022-04-03 12:42:15', 0),
(62, 8, 58, '1000.00', 1, '2022-04-03 12:58:49', '2022-04-03 12:58:49', 0),
(63, 8, 59, '1000.00', 1, '2022-04-03 12:59:30', '2022-04-03 12:59:30', 0),
(64, 3, 60, '100.00', 1, '2022-04-03 13:10:19', '2022-04-03 13:10:19', 0),
(65, 3, 61, '100.00', 1, '2022-04-14 13:23:17', '2022-04-14 13:25:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$10$KaY5dqkZA6C./XE2Ysqb7u8W4O8psG2q9XnTfHDPSdRiPYdXkLuA2', '2022-04-02 14:16:04');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`, `subcategory_id`) VALUES
(3, 'mobile1', 'mobile1', '<p>sdfsr dg</p>', '<p>srg sertgrert</p>', '100.00', '90.00', 'Digital1', 'instock', 1, 100, '1642839569.jpg', ',16495945910.jpg,16495945911.jpg,16495945912.jpg', 17, '2022-01-22 02:49:29', '2022-04-10 07:13:11', 2),
(7, 'mobile4', 'mobile4', '<p>sefsf</p>', '<p>sf</p>', '1000.00', '8999.00', '8', 'instock', 1, 10, '1648857112.jpg', ',16488571120.jpg,16488571121.jpg,16488571122.jpg,16488571123.jpg,16488571124.jpg', 18, '2022-04-01 18:21:52', '2022-04-01 18:21:52', 5),
(8, 'Watch', 'watch', '<p><strong>Watch </strong>short description</p>', '<p><em>watch</em> description</p>', '1000.00', '990.00', 'digi12', 'instock', 0, 100, '1648988031.jpg', ',16489880310.jpg,16489880311.jpg', 19, '2022-04-03 06:43:51', '2022-04-03 06:43:51', 3),
(9, 'productForSubcatergory1', 'productforsubcatergory1', '<p>productforsubcatergory1</p>', '<p>productforsubcatergory1</p>', '1500.00', '1300.00', '12', 'instock', 0, 100, '1649591958.jpg', ',16495919580.jpg,16495919581.jpg,16495919582.jpg,16495919583.jpg', 20, '2022-04-10 06:29:18', '2022-04-10 06:29:18', 8),
(10, 'productForSubcatergory2', 'productforsubcatergory2', '<p>productforsubcatergory2</p>', '<p>productforsubcatergory2</p>', '1500.00', '1300.00', '12', 'instock', 0, 100, '1649592013.jpg', ',16495920130.jpg,16495920131.jpg,16495920132.jpg,16495920133.jpg', 20, '2022-04-10 06:30:13', '2022-04-10 06:30:13', 9),
(11, 'productForSubcatergory3', 'productforsubcatergory3', '<p>productforsubcatergory3</p>', '<p>productforsubcatergory3</p>', '1500.00', '1300.00', '12', 'instock', 0, 100, '1649592067.jpg', ',16495920670.jpg,16495920691.jpg,16495920692.jpg,16495920693.jpg', 20, '2022-04-10 06:31:09', '2022-04-10 06:31:09', 10),
(13, 'subcategory3(1)', 'subcategory31', '<p>subcategory3(1)</p>', '<p>subcategory3(1)</p>', '1200.00', '1100.00', '1', 'instock', 0, 1200, '1649594033.jpg', ',16495940330.jpg,16495940331.jpg,16495940332.jpg', 20, '2022-04-10 07:03:53', '2022-04-10 07:03:53', 10),
(14, 'Attribute test panna product', 'attribute-test-panna-product', '<p><em><strong>Attribute test panna product short description</strong></em></p>', '<p><em><strong>Attribute test panna product s description</strong></em></p>', '1500.00', '1200.00', 'sumaSKU', 'instock', 1, 100, '1650105273.jpg', ',16501052730.jpg,16501052731.jpg,16501052732.jpg', 20, '2022-04-16 05:04:33', '2022-04-16 05:04:33', 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'size', '2022-04-14 14:47:24', '2022-04-14 14:47:24'),
(3, 'color', '2022-04-15 03:05:52', '2022-04-15 03:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `image`, `mobile`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 2, '1649962667.jpg', '09876543210', 'line1', 'line2', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', '2022-04-11 13:31:17', '2022-04-14 13:27:47'),
(2, 3, 'default.png', '09876543210', 'line1', 'line2', 'dfgdbfg kgs rgosrijg', 'Tamil Nadu', 'India', '626007', '2022-04-13 13:41:51', '2022-04-13 13:42:47');

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
(4, 2, 'sf', 48, '2022-03-26 02:45:26', '2022-03-26 02:45:26'),
(6, 5, 'IT is nice product, one of the best phone i have ever purchased', 65, '2022-04-14 13:25:26', '2022-04-14 13:25:26');

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
('zG3GuHfBr4nmXn8KS9ypozRiY4AtOLLia3GgBuFp', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoicUo2MHJ0V2FzaUVBV0NOSGJVNUlXQ2RZRGdEM0J5UkFQUTlHcEFHVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0L2VkaXQvYXR0cmlidXRlLXRlc3QtcGFubmEtcHJvZHVjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRILjRDNmgxcGZXWjVIWDcxdFN3UG9lWXEveTVSTmpkU3RmNFR6R1ptYTMwMGw4ejFnVGxlVyI7czo0OiJjYXJ0IjthOjI6e3M6NDoiY2FydCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MTp7czozMjoiMThkNjkzNDQ4M2I5OTRmYjk5NDNiNDNiN2Q3NjQ2YmYiO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjo5OntzOjU6InJvd0lkIjtzOjMyOiIxOGQ2OTM0NDgzYjk5NGZiOTk0M2I0M2I3ZDc2NDZiZiI7czoyOiJpZCI7aTo4O3M6MzoicXR5IjtpOjE7czo0OiJuYW1lIjtzOjU6IldhdGNoIjtzOjU6InByaWNlIjtkOjEwMDA7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo0OToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGFzc29jaWF0ZWRNb2RlbCI7czoxODoiQXBwXE1vZGVsc1xQcm9kdWN0IjtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AdGF4UmF0ZSI7aToyMTtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AaXNTYXZlZCI7YjowO319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjg6Indpc2hsaXN0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkSC40QzZoMXBmV1o1SFg3MXRTd1BvZVlxL3k1Uk5qZFN0ZjRUekdabWEzMDBsOHoxZ1RsZVciO30=', 1650105294);

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
  `map` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `phone`, `phone2`, `address`, `map`, `twitter`, `facebook`, `pinterest`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', '09876543210', '09876543210', 'rggsdg fiujr kjfv irygh hrg rig oiujjs droij', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3916.1857162154984!2d76.99993861480299!3d11.024688692153317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba8582f1435fa59%3A0x137d95bfd8909293!2sPSG%20College%20Of%20Technology!5e0!3m2!1sen!2sin!4v1648851261545!5m2!1sen!2sin', '#', '#', '#', '#', '#', '2022-04-01 16:23:46', '2022-04-01 16:23:46');

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
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('admin@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"18d6934483b994fb9943b43b7d7646bf\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"18d6934483b994fb9943b43b7d7646bf\";s:2:\"id\";i:8;s:3:\"qty\";i:1;s:4:\"name\";s:5:\"Watch\";s:5:\"price\";d:1000;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-04-14 13:58:49', NULL),
('admin@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-04-14 13:58:49', NULL),
('sivashunmugasundaram007@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"18d6934483b994fb9943b43b7d7646bf\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"18d6934483b994fb9943b43b7d7646bf\";s:2:\"id\";i:8;s:3:\"qty\";i:1;s:4:\"name\";s:5:\"Watch\";s:5:\"price\";d:1000;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-04-03 13:24:53', NULL),
('sivashunmugasundaram007@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:2:{s:32:\"808821852042d8780b9f862c35c42c68\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"808821852042d8780b9f862c35c42c68\";s:2:\"id\";i:7;s:3:\"qty\";i:1;s:4:\"name\";s:7:\"mobile4\";s:5:\"price\";d:1000;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}s:32:\"18d6934483b994fb9943b43b7d7646bf\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"18d6934483b994fb9943b43b7d7646bf\";s:2:\"id\";i:8;s:3:\"qty\";i:1;s:4:\"name\";s:5:\"Watch\";s:5:\"price\";d:1000;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-04-03 13:24:53', NULL),
('user@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"a775bac9cff7dec2b984e023b95206aa\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"a775bac9cff7dec2b984e023b95206aa\";s:2:\"id\";i:3;s:3:\"qty\";i:1;s:4:\"name\";s:7:\"mobile1\";s:5:\"price\";d:100;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-04-14 13:25:28', NULL),
('user@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-04-14 13:25:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `slug`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 'Mac-apple', 'mac-apple', 17, '2022-04-04 13:40:17', '2022-04-09 14:38:46'),
(3, 'Spring boot', 'spring-boot', 19, '2022-04-04 13:40:46', '2022-04-04 13:40:46'),
(4, 'Laptop', 'laptop', 18, '2022-04-09 15:23:21', '2022-04-09 15:23:21'),
(5, 'Mobile1', 'mobile1', 18, '2022-04-09 15:23:39', '2022-04-09 15:23:39'),
(6, 'Mobile1', 'mobile1     ', 18, '2022-04-09 15:24:38', '2022-04-09 15:24:38'),
(7, 'Air Cooler', 'air-cooler', 18, '2022-04-09 15:24:51', '2022-04-09 15:24:51'),
(8, 'subCategory1', 'subcategory1', 20, '2022-04-10 06:27:55', '2022-04-10 06:27:55'),
(9, 'subCategory2', 'subcategory2', 20, '2022-04-10 06:27:58', '2022-04-10 06:27:58'),
(10, 'subCategory3', 'subcategory3', 20, '2022-04-10 06:28:03', '2022-04-10 06:28:03');

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
(15, 2, 50, 'cod', 'pending', '2022-03-29 09:33:17', '2022-03-29 09:33:17'),
(16, 1, 51, 'cod', 'pending', '2022-04-02 14:35:30', '2022-04-02 14:35:30'),
(17, 1, 52, 'cod', 'pending', '2022-04-03 07:34:39', '2022-04-03 07:34:39'),
(18, 1, 53, 'cod', 'pending', '2022-04-03 07:36:01', '2022-04-03 07:36:01'),
(19, 1, 54, 'cod', 'pending', '2022-04-03 07:38:18', '2022-04-03 07:38:18'),
(20, 1, 55, 'cod', 'pending', '2022-04-03 07:40:11', '2022-04-03 07:40:11'),
(21, 1, 56, 'cod', 'pending', '2022-04-03 07:42:51', '2022-04-03 07:42:51'),
(22, 3, 57, 'cod', 'pending', '2022-04-03 12:42:15', '2022-04-03 12:42:15'),
(23, 3, 58, 'cod', 'pending', '2022-04-03 12:58:49', '2022-04-03 12:58:49'),
(24, 3, 59, 'cod', 'pending', '2022-04-03 12:59:30', '2022-04-03 12:59:30'),
(25, 3, 60, 'cod', 'pending', '2022-04-03 13:10:19', '2022-04-03 13:10:19'),
(26, 2, 61, 'cod', 'pending', '2022-04-14 13:23:17', '2022-04-14 13:23:17');

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
(2, 'user', 'user@gmail.com', NULL, '$2y$10$OWiMk6dcJuhK2CB52M0d..cT17DSmFIvX/SgJrY3hhHutrulZDZ9m', NULL, NULL, NULL, NULL, 1, NULL, 'USR', '2022-03-20 00:36:05', '2022-03-29 14:01:23'),
(3, 'siva', 'sivashunmugasundaram007@gmail.com', NULL, '$2y$10$Xv22kB1BFZO1mzu/I/FBqesek1SFJ9J9DWhEqRy3YWeAKDncwKJSW', NULL, NULL, NULL, NULL, 1, NULL, 'USR', '2022-04-03 12:41:19', '2022-04-03 12:41:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_product_attribute_id_foreign` (`product_attribute_id`),
  ADD KEY `attribute_values_product_id_foreign` (`product_id`);

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
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

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
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transcations`
--
ALTER TABLE `transcations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

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
