-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2026 at 10:30 PM
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
-- Database: `caterconnectt_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `caterer_profile_id` bigint(20) UNSIGNED NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `event_location` varchar(255) DEFAULT NULL,
  `dietary_requirements` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `selected_package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `selected_package_name` varchar(255) DEFAULT NULL,
  `selected_menu_ids` text DEFAULT NULL,
  `estimated_total` decimal(10,2) DEFAULT NULL,
  `downpayment_amount` decimal(10,2) DEFAULT NULL,
  `downpayment_deadline` date DEFAULT NULL,
  `downpayment_paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_methods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_methods`)),
  `payment_receipt_path` varchar(500) DEFAULT NULL,
  `payment_method_used` varchar(50) DEFAULT NULL,
  `payment_status` varchar(30) NOT NULL DEFAULT 'unpaid',
  `payment_verified_at` timestamp NULL DEFAULT NULL,
  `payment_rejection_reason` varchar(500) DEFAULT NULL,
  `auto_cancelled_at` timestamp NULL DEFAULT NULL,
  `cancellation_type` varchar(30) DEFAULT NULL,
  `pax` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `rejection_reason` varchar(500) DEFAULT NULL,
  `special_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `caterer_profiles`
--

CREATE TABLE `caterer_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `specialty` varchar(255) NOT NULL,
  `min_budget` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_budget` decimal(10,2) NOT NULL DEFAULT 0.00,
  `profile_picture` varchar(255) DEFAULT NULL,
  `business_permit` varchar(255) DEFAULT NULL,
  `sanitary_permit` varchar(255) DEFAULT NULL,
  `government_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `gcash_number` varchar(255) DEFAULT NULL,
  `gcash_qr_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `caterer_profiles`
--

INSERT INTO `caterer_profiles` (`id`, `user_id`, `business_name`, `contact_number`, `location`, `specialty`, `min_budget`, `max_budget`, `profile_picture`, `business_permit`, `sanitary_permit`, `government_id`, `status`, `gcash_number`, `gcash_qr_path`, `created_at`, `updated_at`) VALUES
(3, 5, 'Adok\'s Catering Services', '09753273587', 'Naga City', 'Filipino buffet, Lechon', 250.00, 1200.00, 'profiles/WGMYN2XvbJz1GwCMnHYw2Kkpx99MdYbRB5mQ4gOz.jpg', 'permits/Gp0dWKsSvsWVjRC2UkWaSdTbrBGscJDSTmecjzfH.jpg', 'permits/eQ2TfGg9KGxnzyxHDu9L7e35XYDp2cNAqy0fv0ZM.jpg', 'permits/sIhTIg1AjsVfE2BoWybyusZKPIrhBLBkkWxhzVcS.jpg', 'verified', '09621732271', 'gcash_qr/d0PeOPPnj7TV6jpnEonWD3m4rcL8RyM186cSYkT6.jpg', '2026-04-13 03:29:47', '2026-04-19 12:10:47'),
(4, 9, 'Juan Catering Services', '09123256789', 'Naga City, Cebu', 'Filipino buffet, lechon, birthday catering', 250.00, 800.00, 'profiles/LifANbYcgHrEvt4NGdTMWDyM0CVrsZ6KptIqdMts.jpg', 'permits/wTzwyDWXXWWYclFbnmHvIhk2PMv82IcAPdHOU5xA.jpg', 'permits/c8xC4yekIhsFayl67jnXE0Hyxaa7AGBEsTjKQdIT.jpg', 'permits/LKV0L7BnsxhAPhL1wUppO3w0lOU1jGbm2cci6edN.jpg', 'verified', NULL, NULL, '2026-04-17 08:04:49', '2026-04-17 08:04:49'),
(5, 10, 'Maria’s Food Hub', '09123456780', 'Cebu City', 'Wedding catering, pasta station, desserts', 300.00, 1100.00, 'profiles/njYMXl17m3b6a3InglWSzt4WlKxbtymWIWXAuH1M.jpg', 'permits/tBR8TpwruO5QE21CfrJevD5HI2odyhqkZV00SIJs.jpg', 'permits/VYPnU0Zi4hOPdDiC9tEc4Zgpj4SRocm4FyXtPMBy.jpg', 'permits/WJOdBJ9EFqEaUzDW5WBxQCnYbg4eS9uLgVEb6gRt.jpg', 'verified', NULL, NULL, '2026-04-17 08:13:20', '2026-04-17 08:14:34'),
(6, 11, 'Pedro Lechon House', '09123456781', 'Talisay City', 'Lechon, grilled foods, fiesta packages', 400.00, 1000.00, 'profiles/UtscCdKhr4uD3V4KiO8Iubgn1JhO7GS5zsu5kx0h.jpg', 'permits/ndLkuOtZ2qfUfXkiJlPiQ5xpMGo2w371JkTMQ7ho.jpg', 'permits/Uy2vXJrAv5kpHi7cXU42mgFyhCA7i6uyNvLTu0dQ.jpg', 'permits/KAkpmkkXprfOUIYruBwWEDQ4amqleYAR16lxHit7.jpg', 'verified', NULL, NULL, '2026-04-17 08:17:00', '2026-04-17 08:34:28'),
(7, 12, 'Ana Catering', '09123456782', 'Minglanilla', 'Debut, birthday, Filipino dishes', 200.00, 700.00, 'profiles/w5Kp7lOKwNpNCb5nEmANqwKowVhr0jP6KVskkgyW.jpg', 'permits/mkFUgKp0cFNVjric20FfN12vdGfQ7q0J75riB5gT.jpg', 'permits/6quyu804d8AIVsIauWew8SYK9guGlKaboOc7lCv1.jpg', 'permits/q0wcytzpYks1beKnLmHREYgoFBn558oRXXH9vDYC.jpg', 'verified', NULL, NULL, '2026-04-17 08:22:56', '2026-04-17 08:34:38'),
(8, 13, 'Mark Event Catering', '09123456783', 'San Fernando', 'Corporate events, buffet, catering packages', 350.00, 1100.00, 'profiles/oI9bKonZAKDm4mJ5PXgvnv7dNoKBYi4NZ55UfDeR.jpg', 'permits/YENs1VRBfAZ3MwWtBgB8szJJUl1dxzRv72nCqG5Q.jpg', 'permits/NkfJqbj6V1Bu0H3J79jwARwOkW9BUJTjqnUyi5IF.jpg', 'permits/YygkyZmodMlCTCO9mvLFbEViNNB2BuNkgkLFoEkk.jpg', 'verified', NULL, NULL, '2026-04-17 08:25:07', '2026-04-17 08:34:36'),
(9, 14, 'Liza’s Kitchen', '09123456784', 'Carcar City', 'Local delicacies, lechon, desserts', 250.00, 900.00, 'profiles/xMzA4jeNrYGF4ev79Wa6D7j6kiTHktQlNagWghf7.jpg', 'permits/rZdzQRLoHPUE7Z25atbArZNZkNp44SSJWijAgBO0.jpg', 'permits/JAalDG3kwZPXRr6NXlCXq3HzdUDSMZ6VX7gmXf2o.jpg', 'permits/RXp55JexLtNPAPV2WvAh6JpR09rUVh1F95TVQByP.jpg', 'verified', NULL, NULL, '2026-04-17 08:26:41', '2026-04-17 08:34:34'),
(10, 15, 'JP Catering Services', '09123456785', 'Naga City', 'Birthday catering, party packages', 200.00, 600.00, 'profiles/1aXLA9VoYfxxnNQsScwiZs7KveC23dYsWSx8aWvx.jpg', 'permits/nUdbjrjcgRIPDQ1ryhhzA8Osk2A9ZfDSNQHvJqcX.jpg', 'permits/iYX7XNRPwtIVLf3NgSBEE7xPTSnWqKznG8lTQhAm.jpg', 'permits/2AHR5KPAMvNCzpUJy1BXv7Mik3OQG5ZrqxWKmvlj.jpg', 'verified', NULL, NULL, '2026-04-17 08:28:43', '2026-04-17 08:34:32'),
(11, 16, 'Karen Derya', '09123452786', 'Toledo City', 'Wedding, buffet, elegant dining', 500.00, 1500.00, 'profiles/aRRdLEn49GLxdkLDToPdPzamdku2M8tFQi6P28yL.jpg', 'permits/ig63TxJ5Yh2zbh8Y5m4D6wH50mYR2sagHcHYBvpR.jpg', 'permits/WOveKynqcLZfRndE5ILcC92GTqSJQApI7TuMADEk.jpg', 'permits/SzVj8USFjdh4XtI5ujs9J0lCkb1TBIDHSDwKd3Iz.jpg', 'verified', NULL, NULL, '2026-04-17 08:30:01', '2026-04-17 19:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caterer_profile_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `caterer_profile_id`, `name`, `category`, `description`, `price`, `is_available`, `created_at`, `updated_at`) VALUES
(5, 4, 'Lechon Cebu', 'Main Course', 'Crispy roasted pig with liver sauce', 350.00, 1, '2026-04-17 09:03:02', '2026-04-17 09:03:02'),
(6, 4, 'Pancit Canton', 'Others', 'Stir-fried noodles with vegetables', 120.00, 1, '2026-04-17 09:03:35', '2026-04-17 09:03:35'),
(7, 4, 'Fruit Salad', 'Dessert', 'Mixed fruits with cream', 90.00, 1, '2026-04-17 09:04:04', '2026-04-17 09:04:04'),
(8, 5, 'Carbonara', 'Others', 'Creamy white sauce pasta', 180.00, 1, '2026-04-17 09:09:28', '2026-04-17 09:09:28'),
(9, 5, 'Chicken Cordon Bleu', 'Main Course', 'Stuffed chicken with cheese', 250.00, 1, '2026-04-17 09:10:10', '2026-04-17 09:10:10'),
(10, 5, 'Chocolate Cake', 'Dessert', 'Moist chocolate layered cake', 120.00, 1, '2026-04-17 09:10:32', '2026-04-17 09:10:32'),
(11, 6, 'Lechon Belly', 'Main Course', 'Roasted pork belly', 300.00, 1, '2026-04-17 09:16:04', '2026-04-17 09:16:04'),
(12, 6, 'BBQ Skewers', 'Side Dish', 'Pork barbecue sticks', 100.00, 1, '2026-04-17 09:16:49', '2026-04-17 09:16:49'),
(13, 6, 'Extra Rice', 'Side Dish', 'Steamed rice', 50.00, 1, '2026-04-17 09:17:15', '2026-04-17 09:17:15'),
(14, 7, 'Fried Chicken', 'Main Course', 'Crispy seasoned chicken', 150.00, 1, '2026-04-17 09:20:52', '2026-04-17 09:20:52'),
(15, 7, 'Spaghetti', 'Appetizer', 'Sweet Filipino-style spaghetti', 120.00, 1, '2026-04-17 09:21:14', '2026-04-17 09:21:14'),
(16, 7, 'Ice Cream', 'Dessert', 'Assorted flavors', 80.00, 1, '2026-04-17 09:21:39', '2026-04-17 09:21:39'),
(17, 8, 'Roast Beef', 'Main Course', 'Tender beef slices with gravy', 300.00, 1, '2026-04-17 09:24:05', '2026-04-17 09:24:05'),
(18, 8, 'Caesar Salad', 'Salad', 'Fresh greens with dressing', 120.00, 1, '2026-04-17 09:24:27', '2026-04-17 09:24:27'),
(19, 8, 'Cheesecake', 'Dessert', 'Creamy cheesecake slice', 150.00, 1, '2026-04-17 09:24:54', '2026-04-17 09:24:54'),
(20, 9, 'Lechon Kawali', 'Main Course', 'Crispy pork belly', 200.00, 1, '2026-04-17 09:34:48', '2026-04-17 09:34:48'),
(22, 9, 'Puto', 'Appetizer', 'Steamed rice cake', 50.00, 1, '2026-04-17 09:36:15', '2026-04-17 09:36:15'),
(23, 9, 'Bibingka', 'Appetizer', 'Traditional rice cake', 79.98, 1, '2026-04-17 09:36:38', '2026-04-17 09:36:38'),
(24, 10, 'Hotdog & Marshmallow', 'Appetizer', 'Party stick combo', 60.00, 1, '2026-04-17 09:39:00', '2026-04-17 09:39:00'),
(27, 11, 'Steak', 'Main Course', 'Grilled beef steak', 300.00, 1, '2026-04-17 09:45:40', '2026-04-17 09:45:40'),
(28, 11, 'Pasta Alfredo', 'Others', 'Creamy pasta', 200.00, 1, '2026-04-17 09:46:03', '2026-04-17 09:46:03'),
(29, 11, 'Macarons', 'Dessert', 'French cookies', 149.98, 1, '2026-04-17 09:46:33', '2026-04-17 09:46:33'),
(30, 3, 'Lechon Baboy (Signature)', 'Main Course', 'Crispy lechon highlight', 300.00, 1, '2026-04-17 10:00:31', '2026-04-17 10:00:31'),
(33, 10, 'Juice', 'Drinks', 'Fruit juice', 30.00, 1, '2026-04-17 10:03:53', '2026-04-17 10:03:53'),
(34, 10, 'Chicken Nuggets', NULL, 'fried nuggets', 300.00, 1, '2026-04-17 10:04:05', '2026-04-17 10:04:05'),
(36, 3, 'Pancit Bihon', 'Main Course', 'Classic noodle dish', 120.00, 1, '2026-04-17 10:06:22', '2026-04-17 10:06:22'),
(37, 3, 'Chicken Adobo', NULL, 'malamian nga manok', 120.00, 1, '2026-04-19 11:17:38', '2026-04-19 11:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(57, '2014_10_12_000000_create_users_table', 1),
(58, '2014_10_12_000001_add_profile_fields_to_users_table', 1),
(59, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(60, '2019_08_19_000000_create_failed_jobs_table', 1),
(61, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(62, '2026_02_10_154532_add_role_to_users_table', 1),
(63, '2026_02_10_154937_create_caterer_profiles_table', 1),
(64, '2026_02_10_161615_create_bookings_table', 1),
(65, '2026_02_10_162750_create_reviews_table', 1),
(66, '2026_02_11_161324_add_permits_and_pricing_to_caterer_profiles_table', 1),
(67, '2026_02_12_162811_create_notifications_table', 1),
(68, '2026_02_12_164923_create_messages_table', 1),
(69, '2026_03_16_165000_create_menus_table', 1),
(70, '2026_03_16_165001_create_packages_table', 1),
(71, '2026_03_17_063224_add_booking_details_to_bookings_table', 1),
(72, '2026_03_18_063224_add_columns_to_bookings_table', 2),
(73, '2026_04_05_162751_add_caterer_reply_to_reviews_table', 3),
(74, '2026_04_05_162752_add_payment_flow_to_bookings_table', 4),
(75, '2026_04_19_154937_add_gcash_to_caterer_profiles_table', 5),
(76, '2026_04_19_200852_add_gcash_fields_to_caterer_profiles_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('038b346a-8398-42c3-9976-9d54e2450b90', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 22, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/24\",\"type\":\"info\"}', '2026-04-19 10:37:34', '2026-04-19 10:25:04', '2026-04-19 10:37:34'),
('05c471bf-a6f3-4a9e-a226-81f86237d375', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 30, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b16,250.00) by Apr 23, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/25\",\"type\":\"success\"}', NULL, '2026-04-19 12:10:47', '2026-04-19 12:10:47'),
('07b6379b-a27b-4dc2-8cef-ba7bbaf93e41', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Event Completed!\",\"message\":\"Your event on Apr 30, 2026 has been marked as completed. We\'d love to hear your feedback!\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/23\",\"type\":\"success\"}', '2026-04-19 07:24:52', '2026-04-18 23:20:59', '2026-04-19 07:24:52'),
('0881017d-8a9a-4f57-ba91-9e7e87936582', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Rexy catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-04-18 22:36:32', '2026-04-18 22:36:32'),
('0caf7796-9536-4bec-879f-46c27c9bcdc7', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Payment Verified \\u2014 Booking Secured!\",\"message\":\"Your downpayment for Apr 30, 2026 has been confirmed. Your booking is now fully secured!\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/23\",\"type\":\"success\"}', '2026-04-19 07:24:52', '2026-04-18 23:20:43', '2026-04-19 07:24:52'),
('0e999e77-0fb3-4360-b11e-8677b2bcd6e8', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Message\",\"message\":\"Benedict Alicante sent a message regarding the booking on 2026-04-22 00:00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/24\",\"type\":\"info\"}', '2026-04-19 10:37:34', '2026-04-19 10:33:20', '2026-04-19 10:37:34'),
('0eda551f-e185-49c8-869b-54bae457b238', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/10\",\"type\":\"info\"}', '2026-04-13 18:46:39', '2026-04-13 18:45:08', '2026-04-13 18:46:39'),
('1183459d-cfd4-468a-be03-28861f37d2b5', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 30, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b18,000.00) by Apr 21, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/10\",\"type\":\"success\"}', '2026-04-13 19:29:39', '2026-04-13 18:46:22', '2026-04-13 19:29:39'),
('123d3e86-17ab-464a-ac9b-7a7777a29fcb', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Booking Auto-Cancelled (Deadline Passed)\",\"message\":\"Booking by Benedict Alicante for Apr 15, 2026 was auto-cancelled \\u2014 downpayment deadline passed.\",\"url\":\"http:\\/\\/localhost\\/bookings\\/20\",\"type\":\"warning\"}', '2026-04-18 23:19:08', '2026-04-18 22:56:59', '2026-04-18 23:19:08'),
('14b549ff-0ee5-4bd3-8057-4c91a61cd8ae', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Payment Receipt Rejected\",\"message\":\"Your payment receipt was not accepted. Reason: fake. Please upload a new receipt before the deadline.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/19\",\"type\":\"danger\"}', '2026-04-18 22:52:15', '2026-04-18 22:51:24', '2026-04-18 22:52:15'),
('15fc8577-2408-4eab-8f2f-fae7504d89ac', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Maria\\u2019s Food Hub has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 08:14:23', '2026-04-17 08:13:20', '2026-04-17 08:14:23'),
('16a86ebc-c76c-4fa9-b5b2-097d46658b6e', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/25\",\"type\":\"info\"}', '2026-04-19 11:22:41', '2026-04-19 11:22:23', '2026-04-19 11:22:41'),
('1bcd9f81-352d-4e42-ab50-148ab28f118a', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Event Completed\",\"message\":\"Your booking for May 09, 2026 is now Completed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/6\",\"type\":\"success\"}', '2026-04-13 08:34:59', '2026-04-13 08:32:31', '2026-04-13 08:34:59'),
('25a1cbe1-88c9-4fd1-a1d5-ead39deb8104', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Adok\'s Catering Services has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-13 03:34:54', '2026-04-13 03:34:24', '2026-04-13 03:34:54'),
('281cd372-dc73-4cd5-927d-be78853527d7', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for May 02, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/9\",\"type\":\"info\"}', '2026-04-13 18:46:39', '2026-04-13 18:43:43', '2026-04-13 18:46:39'),
('29538575-4c63-4503-ba9e-897e6266f209', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Payment Receipt Rejected\",\"message\":\"Your payment receipt was not accepted. Reason: unverified source. Please upload a new receipt before the deadline.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/5\",\"type\":\"danger\"}', '2026-04-13 07:59:59', '2026-04-13 07:50:16', '2026-04-13 07:59:59'),
('2c259f13-8cfe-40e4-bf47-d39cc7759b38', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 30, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b131,250.00) by Apr 23, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/23\",\"type\":\"success\"}', '2026-04-19 07:24:52', '2026-04-18 23:19:30', '2026-04-19 07:24:52'),
('30960851-7aab-420d-9aae-ec0796c47226', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Chris Catering Hub has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 11:29:36', '2026-04-17 08:36:10', '2026-04-17 11:29:36'),
('310ffe6e-67af-47ea-bb57-9d0bcb44daf8', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/4\",\"type\":\"info\"}', '2026-04-13 07:14:00', '2026-04-13 03:52:54', '2026-04-13 07:14:00'),
('31abe9c4-8e55-48ca-afb7-9e050ef59caf', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Review Received\",\"message\":\"Benedict Alicante left a 3 stars review for your service on Apr 24, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/14\",\"type\":\"info\"}', '2026-04-15 03:13:26', '2026-04-13 19:56:10', '2026-04-15 03:13:26'),
('32148849-cbb1-4734-9d06-b55a86ec8f0d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/20\",\"type\":\"info\"}', '2026-04-18 23:19:08', '2026-04-18 22:54:19', '2026-04-18 23:19:08'),
('33eecae7-b31a-448a-beb2-b8824a9c4491', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Message\",\"message\":\"Benedict Alicante sent a message regarding the booking on 2026-04-24 00:00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/14\",\"type\":\"info\"}', '2026-04-13 19:54:47', '2026-04-13 19:54:17', '2026-04-13 19:54:47'),
('353afdcd-23ed-4b80-bf78-4db1b8428f8f', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Rejected\",\"message\":\"Your booking for Apr 30, 2026 has been declined.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/17\",\"type\":\"danger\"}', '2026-04-18 22:52:15', '2026-04-18 22:42:05', '2026-04-18 22:52:15'),
('397dfba2-2627-44d0-86cf-c953af2acff8', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 24, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/8\",\"type\":\"info\"}', '2026-04-13 18:46:39', '2026-04-13 09:11:31', '2026-04-13 18:46:39'),
('39b5ac1d-25a0-4746-ab68-113b1c152749', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 30, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b16,250.00) by Apr 23, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/25\",\"type\":\"success\"}', '2026-04-19 11:57:07', '2026-04-19 11:49:24', '2026-04-19 11:57:07'),
('3d9e66a5-9a6b-480f-82f4-a97e1b361193', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"New Message\",\"message\":\"Adok Alicante sent a message regarding the booking on 2026-04-15 00:00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/7\",\"type\":\"info\"}', '2026-04-13 08:53:19', '2026-04-13 08:37:00', '2026-04-13 08:53:19'),
('3efe0aec-3161-4ab5-8634-0b2be2cc384e', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Review Received\",\"message\":\"Benedict Alicante left a 5 stars review for your service on Apr 29, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/11\",\"type\":\"success\"}', '2026-04-13 19:54:47', '2026-04-13 19:34:43', '2026-04-13 19:54:47'),
('40f35188-a350-4f57-b9d5-ca5e649c66e2', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for May 08, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b16,250.00) by Apr 27, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/21\",\"type\":\"success\"}', '2026-04-19 07:24:52', '2026-04-18 23:00:09', '2026-04-19 07:24:52'),
('43e1d7dd-2e3e-4a73-b784-3935ee9b9512', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed!\",\"message\":\"Your booking for Apr 29, 2026 is now Confirmed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/5\",\"type\":\"success\"}', '2026-04-13 08:01:32', '2026-04-13 08:00:56', '2026-04-13 08:01:32'),
('4536d9dc-dab1-4195-9632-656a0e02426e', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 11, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Pedro Lechon House has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-17 09:15:29', '2026-04-17 08:34:28', '2026-04-17 09:15:29'),
('4748594a-9e2b-4918-a2b6-88737db9f695', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 15, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for May 02, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/16\",\"type\":\"info\"}', NULL, '2026-04-18 22:21:49', '2026-04-18 22:21:49'),
('478e805f-a641-488f-bd75-4c0b03f80e9e', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed!\",\"message\":\"Your booking for Apr 24, 2026 is now Confirmed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/8\",\"type\":\"success\"}', '2026-04-13 18:42:56', '2026-04-13 09:12:17', '2026-04-13 18:42:56'),
('49a6fbdd-1b5b-4bed-bcc0-d48194c361fe', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Adok\'s Catering Services has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-13 03:34:54', '2026-04-13 03:34:25', '2026-04-13 03:34:54'),
('4c288978-7287-4a71-b8cb-60c649b570de', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 16, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Karen Derya has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-17 09:45:15', '2026-04-17 08:34:30', '2026-04-17 09:45:15'),
('4c66c77a-a54d-49f7-b105-19d1bf0cfd2c', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 2, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/1\",\"type\":\"info\"}', '2026-03-17 00:14:41', '2026-03-17 00:12:02', '2026-03-17 00:14:41'),
('4e78abbe-8984-4f66-964c-803eb1cbb247', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 3, '{\"title\":\"New Caterer Application\",\"message\":\"Adok\'s Catering Services has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-03-17 00:05:09', '2026-03-17 00:05:09'),
('4f9fc9b0-5aee-41db-8978-9b8e89dc9500', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 15, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for JP Catering Services has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-17 09:38:41', '2026-04-17 08:34:32', '2026-04-17 09:38:41'),
('51a1dbcd-7c3f-4763-a417-b2adf5e56760', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Juan Catering Services has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 08:14:23', '2026-04-17 08:04:52', '2026-04-17 08:14:23'),
('55bc877b-d98f-4cca-825c-0a93d3c60d97', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for Apr 30, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/23\",\"type\":\"warning\"}', '2026-04-18 23:23:59', '2026-04-18 23:20:15', '2026-04-18 23:23:59'),
('578cddbc-9751-4d1d-b976-994ca70dc632', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Auto-Cancelled\",\"message\":\"Booking automatically cancelled due to non-payment of 50% downpayment before the deadline (Apr 13, 2026).\",\"url\":\"http:\\/\\/localhost\\/bookings\\/11\",\"type\":\"danger\"}', '2026-04-13 19:29:39', '2026-04-13 19:29:23', '2026-04-13 19:29:39'),
('5980bafd-2c74-49f7-942c-9eb7ce627d2c', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Rejected\",\"message\":\"Your booking for Apr 30, 2026 is now Rejected.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/4\",\"type\":\"danger\"}', '2026-04-13 07:59:59', '2026-04-13 06:36:21', '2026-04-13 07:59:59'),
('59b71fd1-25e6-4bf5-9100-26468caadec0', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 14, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/5\",\"type\":\"info\"}', '2026-04-13 07:37:57', '2026-04-13 07:21:58', '2026-04-13 07:37:57'),
('5a4e977a-d765-4d18-a023-4958edc01503', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Payment Receipt Rejected\",\"message\":\"Your payment receipt was not accepted. Reason: bati. Please upload a new receipt before the deadline.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/5\",\"type\":\"danger\"}', '2026-04-13 07:59:59', '2026-04-13 07:57:45', '2026-04-13 07:59:59'),
('5cca9348-feab-4f79-9053-96f05090b57d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 29, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b18,000.00) by Apr 22, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/11\",\"type\":\"success\"}', '2026-04-13 19:29:39', '2026-04-13 19:27:57', '2026-04-13 19:29:39'),
('5e863716-59af-45c3-93fc-762e34c422c7', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Review Received\",\"message\":\"Benedict Alicante left a 1 star review for your service on Apr 30, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/4\",\"type\":\"info\"}', '2026-04-13 07:14:00', '2026-04-13 03:54:59', '2026-04-13 07:14:00'),
('60b7e2fb-be46-481c-9250-b6c0875b4399', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 19, '{\"title\":\"Booking Auto-Cancelled\",\"message\":\"Booking automatically cancelled due to non-payment of 50% downpayment before the deadline (Apr 15, 2026).\",\"url\":\"http:\\/\\/localhost\\/bookings\\/22\",\"type\":\"danger\"}', '2026-04-19 07:56:15', '2026-04-18 23:12:51', '2026-04-19 07:56:15'),
('65f44602-997b-462a-a4bc-35b90d0d5bf4', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Payment Verified \\u2014 Booking Secured!\",\"message\":\"Your downpayment for Apr 24, 2026 has been confirmed. Your booking is now fully secured!\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/14\",\"type\":\"success\"}', '2026-04-13 19:55:54', '2026-04-13 19:54:54', '2026-04-13 19:55:54'),
('66a8400a-825e-4ced-a654-1afd804b2893', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Ana Catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 08:34:20', '2026-04-17 08:22:56', '2026-04-17 08:34:20'),
('68a0321c-ec0f-4f68-a73e-b10a672f46b4', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Booking Auto-Cancelled (Deadline Passed)\",\"message\":\"Booking by Benedict Alicante for May 08, 2026 was auto-cancelled \\u2014 downpayment deadline passed.\",\"url\":\"http:\\/\\/localhost\\/bookings\\/21\",\"type\":\"warning\"}', '2026-04-18 23:19:08', '2026-04-18 23:02:45', '2026-04-18 23:19:08'),
('6af7c05c-7c67-44b0-bf4a-75ef6f607fff', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for Apr 29, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/5\",\"type\":\"warning\"}', '2026-04-13 07:51:51', '2026-04-13 07:48:46', '2026-04-13 07:51:51'),
('6bab541d-54e2-46d9-b985-619a4e852666', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/23\",\"type\":\"info\"}', '2026-04-18 23:19:08', '2026-04-18 23:18:38', '2026-04-18 23:19:08'),
('6d0130e3-0574-47b2-b4e9-788a537d04b8', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"jc catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-04-19 08:38:14', '2026-04-19 08:38:14'),
('6fcac932-47df-406b-aa21-316e3caebca2', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New User Registered\",\"message\":\"Villarico Jc (@jc_caterer) has joined the platform.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/users\",\"type\":\"info\"}', NULL, '2026-04-18 22:33:09', '2026-04-18 22:33:09'),
('71bbe1a1-0b66-4ae6-9d61-e0bbb2ac7045', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/19\",\"type\":\"info\"}', '2026-04-18 22:49:34', '2026-04-18 22:48:02', '2026-04-18 22:49:34'),
('722201d5-338d-42f1-a3a9-27e56b04ff54', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 13, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Mark Event Catering has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-17 09:23:23', '2026-04-17 08:34:36', '2026-04-17 09:23:23'),
('72c2c7d7-88c4-415b-ac6e-234ea0f10993', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Auto-Cancelled\",\"message\":\"Booking automatically cancelled \\u2014 payment receipt was not verified before the deadline (Apr 13, 2026).\",\"url\":\"http:\\/\\/localhost\\/bookings\\/10\",\"type\":\"danger\"}', '2026-04-13 19:29:39', '2026-04-13 19:22:47', '2026-04-13 19:29:39'),
('76590219-cc07-46ea-9785-8afc60e48be0', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"jc catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-04-19 08:15:41', '2026-04-19 08:15:41'),
('7702e8a8-79b5-44cf-a45a-648e4e7a0b43', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Event Completed!\",\"message\":\"Your event on Apr 29, 2026 has been marked as completed. We\'d love to hear your feedback!\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/11\",\"type\":\"success\"}', '2026-04-13 19:45:44', '2026-04-13 19:33:37', '2026-04-13 19:45:44'),
('771210a6-73e0-46f2-81cd-a970195f5200', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"jc catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-04-19 07:58:14', '2026-04-19 07:58:14'),
('7aacde4e-b522-4a06-9528-f2fd6db87e0b', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Booking Cancelled\",\"message\":\"Benedict Alicante cancelled their booking for Apr 24, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/13\",\"type\":\"warning\"}', '2026-04-13 19:54:47', '2026-04-13 19:51:23', '2026-04-13 19:54:47'),
('7b06966d-e7b0-4941-be66-2de1f30bd192', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Message\",\"message\":\"Benedict Alicante sent a message regarding the booking on 2026-04-15 00:00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/7\",\"type\":\"info\"}', '2026-04-13 08:39:15', '2026-04-13 08:36:18', '2026-04-13 08:39:15'),
('7b4261c2-1694-4c83-89af-1335dbda246e', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 19, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for May 21, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b121,450.00) by Apr 28, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/22\",\"type\":\"success\"}', '2026-04-19 07:56:15', '2026-04-18 23:10:53', '2026-04-19 07:56:15'),
('7c92aa7e-0ff3-4cc0-af49-9244afeefaf8', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Auto-Cancelled\",\"message\":\"Booking automatically cancelled due to non-payment of 50% downpayment before the deadline (Apr 10, 2026).\",\"url\":\"http:\\/\\/localhost\\/bookings\\/21\",\"type\":\"danger\"}', '2026-04-19 07:24:52', '2026-04-18 23:02:45', '2026-04-19 07:24:52'),
('7d419eed-900a-408a-a836-f06efe167ceb', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for May 08, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/21\",\"type\":\"info\"}', '2026-04-18 23:19:08', '2026-04-18 22:59:27', '2026-04-18 23:19:08'),
('7e1e4bc7-246f-4354-9691-a61b0f237c88', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Event Completed!\",\"message\":\"Your event on Apr 24, 2026 has been marked as completed. We\'d love to hear your feedback!\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/14\",\"type\":\"success\"}', '2026-04-13 19:55:54', '2026-04-13 19:55:16', '2026-04-13 19:55:54'),
('80d36af6-07ba-43b2-8b73-78c81322e28d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed!\",\"message\":\"Your booking for Apr 29, 2026 is now Confirmed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/5\",\"type\":\"success\"}', '2026-04-13 07:59:59', '2026-04-13 07:34:06', '2026-04-13 07:59:59'),
('80e1b5f5-f9f7-4ec0-be59-5fbf4b075313', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Payment Verified \\u2014 Booking Secured!\",\"message\":\"Your downpayment for Apr 29, 2026 has been confirmed. Your booking is now fully secured!\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/11\",\"type\":\"success\"}', '2026-04-13 19:45:44', '2026-04-13 19:31:48', '2026-04-13 19:45:44'),
('80ec17a2-3245-4ef9-92b3-0dc48bd4a26a', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Pedro Lechon House has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 08:34:20', '2026-04-17 08:17:00', '2026-04-17 08:34:20'),
('81febd7d-f609-4049-a864-83b859dd7b8a', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 15, '{\"title\":\"New Message\",\"message\":\"Benedict Alicante sent a message regarding the booking on 2026-04-30 00:00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/17\",\"type\":\"info\"}', NULL, '2026-04-18 22:42:55', '2026-04-18 22:42:55'),
('8513a5cd-d516-426b-ac8e-243d7940cd9b', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for Apr 30, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/19\",\"type\":\"warning\"}', '2026-04-18 23:19:08', '2026-04-18 22:50:40', '2026-04-18 23:19:08'),
('862c7520-546e-447c-b0e1-98bf9e85e195', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Mark Event Catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 08:34:20', '2026-04-17 08:25:07', '2026-04-17 08:34:20'),
('86ecc825-9319-4fef-85f0-b13df88826c8', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 15, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/17\",\"type\":\"info\"}', NULL, '2026-04-18 22:40:24', '2026-04-18 22:40:24'),
('8c306ea0-1f65-4808-8ff5-31477f3c36d1', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Event Completed\",\"message\":\"Your booking for Apr 30, 2026 is now Completed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/4\",\"type\":\"success\"}', '2026-04-13 03:57:33', '2026-04-13 03:54:14', '2026-04-13 03:57:33'),
('8d5623db-8d3b-4adb-94d1-f7eb09f683ba', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 2, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Mar 28, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/2\",\"type\":\"info\"}', '2026-03-17 00:38:39', '2026-03-17 00:30:05', '2026-03-17 00:38:39'),
('8ef953a9-4dc7-46b5-9d83-5390c9361c11', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed!\",\"message\":\"Your booking for Apr 22, 2026 is now Confirmed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/7\",\"type\":\"success\"}', '2026-04-13 08:53:19', '2026-04-13 08:38:27', '2026-04-13 08:53:19'),
('8f33c3cc-7fee-4cb5-8c5a-1aab4652337e', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for May 09, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/6\",\"type\":\"info\"}', '2026-04-13 08:39:15', '2026-04-13 08:20:37', '2026-04-13 08:39:15'),
('946961db-e17e-453f-b50b-7b73dcb4c8bd', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"JP Catering Services has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 08:34:20', '2026-04-17 08:28:44', '2026-04-17 08:34:20'),
('9648f9c2-96c9-4191-8aa9-cefbbd98dd7e', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 25, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/15\",\"type\":\"info\"}', '2026-04-15 03:13:26', '2026-04-15 03:11:00', '2026-04-15 03:13:26'),
('9d7ccc12-63e2-4d92-a08e-8b7577f9d022', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 12, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Ana Catering has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-17 09:19:27', '2026-04-17 08:34:38', '2026-04-17 09:19:27'),
('a00ee200-7db1-4a46-8b6b-36b664df7361', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"jc catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-04-19 08:01:09', '2026-04-19 08:01:09'),
('a1bdb18b-44ba-4d24-a7f3-2996a4dfb4bd', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 17, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Chris Catering Hub has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', NULL, '2026-04-17 08:41:13', '2026-04-17 08:41:13'),
('a27de693-1a69-4a5d-a2b3-8fa0f96e174d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 24, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/13\",\"type\":\"info\"}', '2026-04-13 19:54:47', '2026-04-13 19:50:54', '2026-04-13 19:54:47'),
('a5e329b3-6933-41b9-97a7-682455e3a21d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 30, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/18\",\"type\":\"info\"}', '2026-04-18 22:49:34', '2026-04-18 22:46:48', '2026-04-18 22:49:34'),
('a6bbfca7-2367-406e-8fa1-80670ff00a77', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 24, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b110,000.00) by Apr 16, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/14\",\"type\":\"success\"}', '2026-04-13 19:55:54', '2026-04-13 19:53:04', '2026-04-13 19:55:54'),
('a7dff8f8-0ca0-456c-8860-d4d055d060c4', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Review Received \\u2014 2 stars\",\"message\":\"Benedict Alicante left a 2 stars review for your service on Apr 30, 2026. Your average rating is now 2\\/5 (1 review).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/23\",\"type\":\"info\"}', '2026-04-18 23:23:59', '2026-04-18 23:21:49', '2026-04-18 23:23:59'),
('a8f2f33b-9f65-42de-abd7-708ee552f89c', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for Apr 29, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/5\",\"type\":\"warning\"}', '2026-04-13 07:51:51', '2026-04-13 07:51:08', '2026-04-13 07:51:51'),
('aa61682d-d53d-430e-9adc-cadac5b9c72b', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Booking Cancelled\",\"message\":\"Benedict Alicante cancelled their booking for May 02, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/9\",\"type\":\"warning\"}', '2026-04-13 18:46:39', '2026-04-13 18:44:02', '2026-04-13 18:46:39'),
('abbad487-c163-4878-b7a6-c4c09393db4f', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed!\",\"message\":\"Your booking for May 09, 2026 is now Confirmed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/6\",\"type\":\"success\"}', '2026-04-13 08:34:59', '2026-04-13 08:21:37', '2026-04-13 08:34:59'),
('ae2e80e5-7802-43df-a3a4-2f68ae5333e0', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Karen Derya has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 08:34:19', '2026-04-17 08:30:01', '2026-04-17 08:34:19'),
('aee06916-c32c-4800-a620-87b3dfa4681d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Payment Verified!\",\"message\":\"Your downpayment for May 09, 2026 has been confirmed by the caterer. Your booking is fully secured!\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/6\",\"type\":\"success\"}', '2026-04-13 08:34:59', '2026-04-13 08:31:28', '2026-04-13 08:34:59'),
('b04b85e1-6251-4eec-ab2b-078bff6db818', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Booking Auto-Cancelled (Deadline Passed)\",\"message\":\"Booking by Benedict Alicante for Apr 29, 2026 was auto-cancelled \\u2014 downpayment deadline passed.\",\"url\":\"http:\\/\\/localhost\\/bookings\\/11\",\"type\":\"warning\"}', '2026-04-13 19:33:18', '2026-04-13 19:29:23', '2026-04-13 19:33:18'),
('b3e26baf-137d-449e-97bc-b7aea45c5389', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 10, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Maria\\u2019s Food Hub has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-17 09:08:43', '2026-04-17 08:14:34', '2026-04-17 09:08:43'),
('b5049c79-8519-46d7-a039-8b5edb65e8bc', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 29, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/11\",\"type\":\"info\"}', '2026-04-13 19:33:18', '2026-04-13 19:27:03', '2026-04-13 19:33:18'),
('b6effbbf-6a47-496d-9228-416fa9428b6f', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"New Message\",\"message\":\"Adok Alicante sent a message regarding the booking on 2026-04-29 00:00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/11\",\"type\":\"info\"}', '2026-04-13 19:45:44', '2026-04-13 19:31:56', '2026-04-13 19:45:44'),
('b8a5e348-e015-40fe-a1a1-f8be03b32f00', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Auto-Cancelled\",\"message\":\"Booking automatically cancelled due to non-payment of 50% downpayment before the deadline (Apr 15, 2026).\",\"url\":\"http:\\/\\/localhost\\/bookings\\/20\",\"type\":\"danger\"}', '2026-04-19 07:24:52', '2026-04-18 22:56:59', '2026-04-19 07:24:52'),
('b8d4feb7-d882-4663-a4da-5776bdb7c3d9', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 4, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Benedict\'s Lechon has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', NULL, '2026-03-17 01:00:12', '2026-03-17 01:00:12'),
('bb9484cd-d4dc-42a4-8e01-5b7b7176da7d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 24, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/14\",\"type\":\"info\"}', '2026-04-13 19:54:47', '2026-04-13 19:52:27', '2026-04-13 19:54:47'),
('bc15047c-3956-4750-bd64-be1e9b97f674', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 9, '{\"title\":\"Booking Auto-Cancelled (Deadline Passed)\",\"message\":\"Booking by Villarico Jc for May 21, 2026 was auto-cancelled \\u2014 downpayment deadline passed.\",\"url\":\"http:\\/\\/localhost\\/bookings\\/22\",\"type\":\"warning\"}', NULL, '2026-04-18 23:12:51', '2026-04-18 23:12:51'),
('bced382a-33aa-4029-acfb-88ea32b33766', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 25, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/12\",\"type\":\"info\"}', '2026-04-13 19:54:47', '2026-04-13 19:47:28', '2026-04-13 19:54:47'),
('c20cd915-97a9-412f-8f6e-0b77e2c437f5', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"jc catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-04-19 08:06:28', '2026-04-19 08:06:28'),
('c26b03bc-348b-4cff-909e-0896ee7efa13', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 30, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b12,750.00) by Apr 23, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/19\",\"type\":\"success\"}', '2026-04-18 22:52:15', '2026-04-18 22:49:14', '2026-04-18 22:52:15'),
('c2af3e2c-f78d-48f7-9ced-dfb9d35bfce6', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 30, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b16,250.00) by Apr 23, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/25\",\"type\":\"success\"}', '2026-04-19 11:57:07', '2026-04-19 11:40:14', '2026-04-19 11:57:07'),
('c3611e03-d981-47da-b58a-2090de3a30be', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"jc catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-04-19 08:12:30', '2026-04-19 08:12:30'),
('c4e1bb8b-ff17-468c-80b8-c7123c6b157b', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Catering Service ni Angel has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 19:07:23', '2026-04-17 12:05:16', '2026-04-17 19:07:23'),
('c7f23eb2-0ee8-43fe-a13a-148fe4237811', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for May 09, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/6\",\"type\":\"warning\"}', '2026-04-13 08:39:15', '2026-04-13 08:30:21', '2026-04-13 08:39:15'),
('c811788e-c623-429a-8f2b-2281058c2ba9', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 1, '{\"title\":\"Event Completed\",\"message\":\"Your booking for Mar 28, 2026 is now Completed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/2\",\"type\":\"success\"}', '2026-04-12 06:52:42', '2026-03-17 01:18:15', '2026-04-12 06:52:42'),
('c86f578b-8217-4cd4-aaa1-ead1d79cf894', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Booking Auto-Cancelled (Deadline Passed)\",\"message\":\"Booking by Benedict Alicante for Apr 30, 2026 was auto-cancelled \\u2014 downpayment deadline passed.\",\"url\":\"http:\\/\\/localhost\\/bookings\\/10\",\"type\":\"warning\"}', '2026-04-13 19:25:21', '2026-04-13 19:22:47', '2026-04-13 19:25:21'),
('cbe43592-ce03-4b29-b881-f8bfd764f9fd', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New User Registered\",\"message\":\"Cater Connect (@admin_user1) has joined the platform.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/users\",\"type\":\"info\"}', '2026-04-17 06:56:09', '2026-04-15 03:07:05', '2026-04-17 06:56:09'),
('ccd43817-e0d4-46b7-bb4b-ccdfc52b1576', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Caterer Replied to Your Review\",\"message\":\"Adok\'s Catering Services responded to your review.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/caterer\\/3\",\"type\":\"info\"}', '2026-04-13 03:57:33', '2026-04-13 03:56:56', '2026-04-13 03:57:33'),
('cd095a4d-e26c-4e5f-a248-be94824e0c45', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 3, '{\"title\":\"New User Registered\",\"message\":\"Adok Alicante (@adok_cater) has joined the platform.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/users\",\"type\":\"info\"}', NULL, '2026-03-17 00:58:25', '2026-03-17 00:58:25'),
('d08cf9ce-8dad-4897-ad39-acbfd6c15246', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Booking Cancelled\",\"message\":\"Benedict Alicante cancelled their booking for Apr 30, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/18\",\"type\":\"warning\"}', '2026-04-18 22:49:34', '2026-04-18 22:46:56', '2026-04-18 22:49:34'),
('d486ee89-244c-4d32-affa-796482640157', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Apr 15, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/7\",\"type\":\"info\"}', '2026-04-13 08:39:15', '2026-04-13 08:36:04', '2026-04-13 08:39:15'),
('dbdb51d5-67ed-4f54-8408-72f7069cb6fa', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 9, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for May 21, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/22\",\"type\":\"info\"}', NULL, '2026-04-18 23:07:46', '2026-04-18 23:07:46'),
('ddd1cd22-32ff-4621-82f1-409fd3d3494f', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"Liza\\u2019s Kitchen has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', '2026-04-17 08:34:20', '2026-04-17 08:26:41', '2026-04-17 08:34:20'),
('e428daa8-a20d-4502-8d60-9846c57ba602', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed \\u2014 Payment Required\",\"message\":\"Your booking for Apr 30, 2026 has been confirmed! Please pay the 50% downpayment (\\u20b16,250.00) by Apr 23, 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/20\",\"type\":\"success\"}', '2026-04-18 22:55:32', '2026-04-18 22:54:58', '2026-04-18 22:55:32'),
('e4440b69-93c8-45ab-a91a-8e259b5c8af5', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"New Message\",\"message\":\"Adok Alicante sent a message regarding the booking on 2026-04-24 00:00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/14\",\"type\":\"info\"}', '2026-04-13 19:55:54', '2026-04-13 19:53:15', '2026-04-13 19:55:54'),
('e4f7f4aa-89a2-413c-b5a1-f8de1abc5735', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for Apr 29, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/11\",\"type\":\"warning\"}', '2026-04-13 19:33:18', '2026-04-13 19:31:16', '2026-04-13 19:33:18'),
('e7a1c380-154c-47d9-96bb-48817beb38b9', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for Apr 24, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/14\",\"type\":\"warning\"}', '2026-04-13 19:54:47', '2026-04-13 19:54:12', '2026-04-13 19:54:47'),
('e8db14e1-e39b-49e3-8170-1a3ba7819884', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 2, '{\"title\":\"New Inquiry\",\"message\":\"New booking request for Mar 31, 2026\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/3\",\"type\":\"info\"}', NULL, '2026-03-17 02:59:34', '2026-03-17 02:59:34'),
('e96f492d-b02e-4423-8e8a-7b5a7c9ead1c', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Caterer Replied to Your Review\",\"message\":\"Adok\'s Catering Services responded to your review.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/caterer\\/3\",\"type\":\"info\"}', '2026-04-13 19:45:44', '2026-04-13 19:35:47', '2026-04-13 19:45:44'),
('ed01c3bd-068f-4115-bbab-140fd1218178', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Caterer Replied to Your Review\",\"message\":\"Adok\'s Catering Services responded to your review.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/caterer\\/3\",\"type\":\"info\"}', '2026-04-19 07:24:52', '2026-04-18 23:23:20', '2026-04-19 07:24:52'),
('ef216ba7-87bb-4f5a-9eee-c17ac45ed370', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 3, '{\"title\":\"New Caterer Application\",\"message\":\"Benedict\'s Lechon has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-03-17 00:59:48', '2026-03-17 00:59:48'),
('f08f401a-968f-4ada-b375-696d79efd00e', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 14, '{\"title\":\"Caterer Profile Approved\",\"message\":\"Congratulations! Your caterer profile for Liza\\u2019s Kitchen has been verified and is now live on CaterConnect.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\",\"type\":\"success\"}', '2026-04-17 09:27:54', '2026-04-17 08:34:34', '2026-04-17 09:27:54'),
('f3f352ef-8fc6-4a1f-a4aa-3aae8740522b', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for Apr 30, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/25\",\"type\":\"warning\"}', NULL, '2026-04-19 12:21:16', '2026-04-19 12:21:16'),
('f57484ac-1269-4af9-8c20-0b260a047b0d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 7, '{\"title\":\"New Caterer Application\",\"message\":\"jc catering has submitted documents for verification.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/verifications\",\"type\":\"warning\"}', NULL, '2026-04-19 08:25:43', '2026-04-19 08:25:43'),
('f675c873-1117-4b26-878e-07b6182e783d', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 6, '{\"title\":\"Booking Confirmed!\",\"message\":\"Your booking for Apr 30, 2026 is now Confirmed.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/4\",\"type\":\"success\"}', '2026-04-13 03:57:33', '2026-04-13 03:54:01', '2026-04-13 03:57:33'),
('f8559f52-5960-4bf8-917c-e730aa778fdc', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 5, '{\"title\":\"Payment Receipt Submitted\",\"message\":\"Benedict Alicante has uploaded a downpayment receipt for Apr 30, 2026. Please verify.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/bookings\\/10\",\"type\":\"warning\"}', '2026-04-13 19:25:21', '2026-04-13 18:57:02', '2026-04-13 19:25:21'),
('ff3c7c78-4136-43c2-b6e3-4cad899c64d7', 'App\\Notifications\\AppNotification', 'App\\Models\\User', 19, '{\"title\":\"Caterer Application Rejected\",\"message\":\"Your application for jc catering was not approved. Reason: dasdada\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/become-caterer\",\"type\":\"danger\"}', '2026-04-19 08:41:11', '2026-04-19 08:38:44', '2026-04-19 08:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caterer_profile_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price_per_guest` decimal(10,2) NOT NULL,
  `min_guests` int(11) NOT NULL DEFAULT 50,
  `max_guests` int(11) DEFAULT NULL,
  `inclusions` text DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `caterer_profile_id`, `name`, `description`, `price_per_guest`, `min_guests`, `max_guests`, `inclusions`, `is_available`, `created_at`, `updated_at`) VALUES
(4, 4, 'Basic Fiesta', 'Filipino dishes with rice & drinks', 300.00, 50, 150, NULL, 1, '2026-04-17 09:05:27', '2026-04-17 09:05:27'),
(5, 4, 'Birthday Special', 'Buffet with dessert station', 400.00, 50, 200, NULL, 1, '2026-04-17 09:06:31', '2026-04-17 09:06:31'),
(6, 4, 'Premium Fiesta', 'Full buffet with lechon', 600.00, 100, 298, NULL, 1, '2026-04-17 09:06:59', '2026-04-17 09:06:59'),
(7, 5, 'Wedding Basic', 'Elegant buffet setup', 500.00, 100, 300, 'Professional Waitstaff', 1, '2026-04-17 09:11:23', '2026-04-17 09:11:23'),
(9, 5, 'Grand Wedding', 'Full-course catering', 1000.00, 150, 500, 'Professional Waitstaff,High-Quality Dinnerware', 1, '2026-04-17 09:13:22', '2026-04-17 09:13:22'),
(10, 5, 'Classic Wedding', 'With pasta & dessert bar', 700.00, 150, 400, 'Professional Waitstaff', 1, '2026-04-17 09:14:30', '2026-04-17 09:14:30'),
(11, 6, 'Fiesta Grill', 'BBQ & lechon combo', 400.00, 50, 200, NULL, 1, '2026-04-17 09:17:52', '2026-04-17 09:17:52'),
(12, 6, 'Barkada Feast', 'Grilled meats set', 500.00, 30, 99, NULL, 1, '2026-04-17 09:18:23', '2026-04-17 09:18:23'),
(13, 6, 'Premium Lechon', 'Whole lechon package', 800.00, 100, 300, NULL, 1, '2026-04-17 09:18:57', '2026-04-17 09:18:57'),
(14, 7, 'Kiddie Party', 'Fun meals for kids', 250.00, 30, 99, NULL, 1, '2026-04-17 09:22:02', '2026-04-17 09:22:02'),
(15, 7, 'Birthday Set', 'Party buffet', 350.00, 50, 150, NULL, 1, '2026-04-17 09:22:25', '2026-04-17 09:22:25'),
(16, 7, 'Celebration Pack', 'Complete event food', 500.00, 80, 200, NULL, 1, '2026-04-17 09:22:53', '2026-04-17 09:22:53'),
(17, 8, 'Corporate Basic', 'Simple buffet', 400.00, 50, 200, NULL, 1, '2026-04-17 09:25:33', '2026-04-17 09:25:33'),
(18, 8, 'Business Premium', 'With dessert & drinks', 600.00, 100, 300, 'Professional Waitstaff', 1, '2026-04-17 09:26:13', '2026-04-17 09:26:13'),
(19, 8, 'Executive Buffet', 'Full-course meals', 900.00, 150, 400, 'Professional Waitstaff,High-Quality Dinnerware', 1, '2026-04-17 09:27:20', '2026-04-17 09:27:20'),
(20, 9, 'Local Feast', 'Filipino delicacies', 300.00, 50, 150, NULL, 1, '2026-04-17 09:37:10', '2026-04-17 09:37:10'),
(21, 9, 'Native Buffet', 'Traditional meals', 450.00, 80, 200, NULL, 1, '2026-04-17 09:37:40', '2026-04-17 09:37:40'),
(22, 9, 'Fiesta Deluxe', 'Full local spread', 700.00, 100, 300, 'Professional Waitstaff', 1, '2026-04-17 09:38:16', '2026-04-17 09:38:16'),
(23, 10, 'Party Basic', 'Simple party meals', 200.00, 30, 100, NULL, 1, '2026-04-17 09:40:01', '2026-04-17 09:40:01'),
(24, 10, 'Fun Party', 'With snacks & drinks', 300.00, 50, 150, 'Clown', 1, '2026-04-17 09:40:41', '2026-04-17 09:40:41'),
(25, 10, 'Party Deluxe', 'Full party setup', 500.00, 80, 200, 'Professional Waitstaff', 1, '2026-04-17 09:41:15', '2026-04-17 09:41:15'),
(26, 11, 'Elegant Basic', 'Fine dining buffet', 600.00, 100, 300, 'Professional Waitstaff,High-Quality Dinnerware', 1, '2026-04-17 09:47:14', '2026-04-17 09:47:14'),
(28, 11, 'Luxury Dining', 'Premium setup with upgraded service', 900.00, 150, 400, 'Professional waitstaff + head waiter,Elegant buffet styling & decorations,High-quality chafing dishes & food display', 1, '2026-04-17 09:49:52', '2026-04-17 09:49:52'),
(29, 11, 'Royal Feast', 'High-end catering experience', 1300.00, 200, 500, 'Full professional service team,VIP table setup with premium décor,Unlimited drinks (juice-soda),Full event styling (theme-based),Fine dining tableware,Live cooking station / chef station,On-site event manager', 1, '2026-04-17 09:51:16', '2026-04-17 09:51:16'),
(31, 3, 'Standard Filipino Buffet', 'Balanced buffet with variety', 500.00, 50, 200, 'Professional Waitstaff', 1, '2026-04-17 10:09:04', '2026-04-17 10:09:04'),
(32, 3, 'Premium Filipino Buffet', 'Full-service lechon buffet', 900.00, 50, NULL, 'Professional Waitstaff', 1, '2026-04-17 10:10:15', '2026-04-17 10:10:15'),
(33, 3, 'Basic Filipino Buffet', 'basic', 250.00, 50, NULL, NULL, 1, '2026-04-19 11:20:22', '2026-04-19 11:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `caterer_profile_id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 5,
  `comment` text DEFAULT NULL,
  `caterer_reply` text DEFAULT NULL,
  `caterer_reply_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `date_of_birth`, `phone`, `username`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Adok Alicante', 'Brgy. Colon, City of Naga, Cebu', '2008-03-13', '09753273585', 'adok_cater', 'adok@gmail.com', 'caterer', NULL, '$2y$12$opAOmON.ll/HO8ecaiQ7qu05.Vkx7pRF0NG4kU5A8Y3y9Dc2Rjvvu', NULL, '2026-04-13 03:28:01', '2026-04-13 03:34:20'),
(6, 'Benedict Alicante', 'Brgy. Colon, City of Naga, Cebu', '2008-04-09', '09753273582', 'adok_cater1', 'dok@gmail.com', 'user', NULL, '$2y$12$b72yjjEIEZAPYt4HgR1cxeuKKhS1suhkKpMH1lXG.4LfBGNx0Z/Xq', NULL, '2026-04-13 03:32:14', '2026-04-13 03:32:14'),
(7, 'Cater Connect', 'Brgy. West Poblacion, City of Naga, Cebu', '2008-04-10', '09123456879', 'admin_user', 'admin@gmail.com', 'admin', NULL, '$2y$12$jlHNtumJBSu5UjYV7XNmIuFpClhkM/f.TmEq6g5SXbg9AxozmFLEe', NULL, '2026-04-13 03:33:20', '2026-04-13 03:33:20'),
(9, 'Juan Dela Cruz', 'Brgy. North Poblacion, City of Naga, Cebu', '2000-01-15', '09123456789', 'juan01', 'juan@example.com', 'caterer', NULL, '$2y$12$5HB6AwoRxr.r91xxiL2cJOihucuw1bnWvNh3L9ZpTuA.iT/WSUOJy', NULL, NULL, NULL),
(10, 'Maria Santos', 'Brgy. South Poblacion, Cebu City', '1999-05-20', '09123456780', 'maria02', 'maria@example.com', 'caterer', NULL, '$2y$12$u/txIEFnW7j/HylatxzM1.zTU1kvpZh8LO35Fx/6djoEsRrBfSAq6', NULL, NULL, '2026-04-17 08:14:34'),
(11, 'Pedro Reyes', 'Talisay City, Cebu', '2001-03-10', '09123456781', 'pedro03', 'pedro@example.com', 'caterer', NULL, '$2y$12$CD8OIh6WLcjAZe0CdUG3EuGpZ08CuMKO7wZ/I5H7hAgqqtCSCwJKa', NULL, NULL, '2026-04-17 08:34:28'),
(12, 'Ana Lopez', 'Minglanilla, Cebu', '2002-07-25', '09123456782', 'ana04', 'ana@example.com', 'caterer', NULL, '$2y$12$5nb6RxDV6xMXGgrsocJeCOLikeXfiMk4r5hX4KMfW/a6Z.42qEg2i', NULL, NULL, '2026-04-17 08:34:38'),
(13, 'Mark Garcia', 'San Fernando, Cebu', '1998-11-12', '09123456783', 'mark05', 'mark@example.com', 'caterer', NULL, '$2y$12$SPr0165KYtwiWGilF2qtHO7vZdn7wKZrx3OfPg0lwxw1fOdbnImfe', NULL, NULL, '2026-04-17 08:34:36'),
(14, 'Liza Ramos', 'Carcar City, Cebu', '2000-09-30', '09123456784', 'liza06', 'liza@example.com', 'caterer', NULL, '$2y$12$GfZpdA3e5fis8qEVnfWaMuCNQ3FO1IZ3s2.V99XXou0efuw1KXG2q', NULL, NULL, '2026-04-17 08:34:34'),
(15, 'John Paul Cruz', 'Naga City, Cebu', '2001-06-18', '09123456785', 'john07', 'john@example.com', 'caterer', NULL, '$2y$12$sS6Tluv1Yy9w2pLEb1NZJ.CSs/.HfQNBrogTTCQ6XSvq65dYEj3hy', NULL, NULL, '2026-04-17 08:34:32'),
(16, 'Karen Villanueva', 'Toledo City, Cebu', '1997-12-05', '09123456786', 'karen08', 'karen@example.com', 'caterer', NULL, '$2y$12$X8GMX6z3kbUwdRTfwDkLpuFb0TnR31HWyh67Kyhj01oSjBXjc1pgW', NULL, NULL, '2026-04-17 08:34:30'),
(18, 'Angelica Flores', 'Mandaue City, Cebu', '2002-08-22', '09123456788', 'angel10', 'angel@example.com', 'user', NULL, '$2y$12$jRonCU084WB6c4MNMq1tW.DzveFHnTnpRHnwNgDMsE.a4ZeY3SS7.', NULL, NULL, NULL),
(19, 'Villarico Jc', 'Brgy. Colon, City of Naga, Cebu', '2008-03-18', '09362005279', 'jc_caterer', 'jcjc@gmail.com', 'user', NULL, '$2y$12$NJE28o4UQDri42ZV1j8F8.Z1cd8UPyilSNwGO3GsZWPEi5hfNiEFi', NULL, '2026-04-18 22:33:08', '2026-04-18 22:33:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_caterer_profile_id_foreign` (`caterer_profile_id`),
  ADD KEY `bookings_selected_package_id_foreign` (`selected_package_id`);

--
-- Indexes for table `caterer_profiles`
--
ALTER TABLE `caterer_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caterer_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_caterer_profile_id_foreign` (`caterer_profile_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_booking_id_foreign` (`booking_id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_caterer_profile_id_foreign` (`caterer_profile_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_caterer_profile_id_foreign` (`caterer_profile_id`),
  ADD KEY `reviews_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `caterer_profiles`
--
ALTER TABLE `caterer_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_caterer_profile_id_foreign` FOREIGN KEY (`caterer_profile_id`) REFERENCES `caterer_profiles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_selected_package_id_foreign` FOREIGN KEY (`selected_package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `caterer_profiles`
--
ALTER TABLE `caterer_profiles`
  ADD CONSTRAINT `caterer_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_caterer_profile_id_foreign` FOREIGN KEY (`caterer_profile_id`) REFERENCES `caterer_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_caterer_profile_id_foreign` FOREIGN KEY (`caterer_profile_id`) REFERENCES `caterer_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_caterer_profile_id_foreign` FOREIGN KEY (`caterer_profile_id`) REFERENCES `caterer_profiles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
