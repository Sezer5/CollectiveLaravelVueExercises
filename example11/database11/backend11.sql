-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 11 Eki 2026, 18:59:23
-- Sunucu sürümü: 8.4.3
-- PHP Sürümü: 8.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `backend11`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(2, 'kid', 'Kid', '2026-10-11 14:25:24', '2026-10-11 15:32:52'),
(3, 'women', 'Women', '2026-10-11 15:31:49', '2026-10-11 15:32:57'),
(4, 'men', 'Men', '2026-10-11 15:32:29', '2026-10-11 15:32:29'),
(5, 'old', 'Old', '2026-10-11 15:32:36', '2026-10-11 15:32:36');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `colors`
--

CREATE TABLE `colors` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `colors`
--

INSERT INTO `colors` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(1, 'red', 'Red', '2026-10-11 15:13:59', '2026-10-11 15:14:08'),
(2, 'green', 'Green', '2026-10-11 15:33:07', '2026-10-11 15:33:07'),
(3, 'blue', 'Blue', '2026-10-11 15:33:12', '2026-10-11 15:33:12'),
(4, 'black', 'Black', '2026-10-11 15:33:17', '2026-10-11 15:33:17'),
(5, 'brown', 'Brown', '2026-10-11 15:33:24', '2026-10-11 15:33:24'),
(6, 'yellow', 'Yellow', '2026-10-11 15:33:30', '2026-10-11 15:33:30'),
(7, 'orange', 'Orange', '2026-10-11 15:33:38', '2026-10-11 15:33:38'),
(8, 'purple', 'Purple', '2026-10-11 15:33:44', '2026-10-11 15:33:44'),
(9, 'gray', 'Gray', '2026-10-11 15:33:57', '2026-10-11 15:33:57');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `color_product`
--

CREATE TABLE `color_product` (
  `id` bigint UNSIGNED NOT NULL,
  `color_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `color_product`
--

INSERT INTO `color_product` (`id`, `color_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 2, NULL, NULL),
(5, 5, 2, NULL, NULL),
(6, 6, 2, NULL, NULL),
(10, 7, 4, NULL, NULL),
(11, 8, 4, NULL, NULL),
(12, 9, 4, NULL, NULL),
(13, 2, 5, NULL, NULL),
(14, 5, 5, NULL, NULL),
(15, 7, 5, NULL, NULL),
(16, 2, 6, NULL, NULL),
(17, 3, 6, NULL, NULL),
(18, 9, 6, NULL, NULL),
(19, 2, 7, NULL, NULL),
(20, 7, 7, NULL, NULL),
(21, 8, 7, NULL, NULL),
(22, 9, 7, NULL, NULL),
(23, 2, 8, NULL, NULL),
(24, 7, 8, NULL, NULL),
(25, 9, 8, NULL, NULL),
(26, 7, 9, NULL, NULL),
(27, 8, 9, NULL, NULL),
(28, 9, 9, NULL, NULL),
(29, 5, 10, NULL, NULL),
(30, 7, 10, NULL, NULL),
(31, 9, 10, NULL, NULL),
(32, 1, 11, NULL, NULL),
(33, 3, 11, NULL, NULL),
(34, 7, 11, NULL, NULL),
(35, 9, 11, NULL, NULL),
(39, 2, 13, NULL, NULL),
(40, 8, 13, NULL, NULL),
(41, 9, 13, NULL, NULL),
(42, 7, 14, NULL, NULL),
(43, 8, 14, NULL, NULL),
(44, 9, 14, NULL, NULL),
(45, 1, 15, NULL, NULL),
(46, 3, 15, NULL, NULL),
(47, 7, 15, NULL, NULL),
(48, 9, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_10_10_180846_create_roles_table', 1),
(5, '2026_10_10_180907_create_role_user_table', 1),
(6, '2026_10_10_184046_create_categories_table', 2),
(7, '2026_10_10_184052_create_colors_table', 2),
(8, '2026_10_10_184058_create_sizes_table', 2),
(9, '2026_10_10_184105_create_products_table', 2),
(10, '2026_10_10_184901_create_color_product_table', 2),
(11, '2026_10_10_184922_create_product_size_table', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `slug`, `name`, `quantity`, `price`, `description`, `thumbnail`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'kid-1', 'Kid 1', 12, 12.33, 'Dolor sed nisi elementum dolor elementum. Lorem consectetur porttitor tellus ipsum vendor. Ipsum porttitor sed semper. Dolor nisi. Tellus eiusmod lorem vendor elementum vendor. Porttitor semper porttitor tellus ipsum dolor lorem leo. Dolor vivamus dolor sed. Elementum vivamus aenean elit. Lorem eiusmod. Consectetur sit semper. Ipsum lorem leo. Ipsum dolor leo ipsum elit eiusmod dolor elit. Porttitor tellus sed dolor. Elementum lorem elementum. Consectetur nisi ipsum. Vivamus elementum dolor sed vivamus sit. Semper ipsum elit eiusmod consectetur leo. Porttitor elit nisi. Vivamus lorem dolor aenean. Sit leo ipsum vendor elementum. Ipsum consectetur leo dolor sed elit consectetur dolor semper. Consectetur.', 'storage/images/products/g6GCUBy1LrUS4gPEnHTz2fJIGjG1VE6i7Sy9zmIY.jpg', 2, '2026-10-11 15:35:24', '2026-10-11 15:43:01'),
(2, 'kid-2', 'Kid 2', 21, 21.30, 'Aenean sed dolor nisi porttitor ipsum consectetur. Sit tellus porttitor eiusmod aenean. Elit elementum porttitor sit semper vendor. Elit vendor leo. Eiusmod aenean sed. Eiusmod vivamus vendor dolor ipsum leo sed elit. Ipsum consectetur semper tellus. Eiusmod porttitor elit lorem. Porttitor sed vivamus sed ipsum. Nisi elementum eiusmod vendor. Eiusmod dolor leo elementum leo. Sit dolor eiusmod porttitor eiusmod consectetur. Dolor semper sit porttitor. Ipsum consectetur. Vivamus sit elementum eiusmod nisi ipsum. Lorem elementum ipsum porttitor aenean elementum sed aenean porttitor. Vivamus lorem dolor sed. Ipsum dolor nisi vendor lorem. Tellus vendor aenean consectetur lorem ipsum leo vivamus eiusmod. Nisi.', 'storage/images/products/iIJwio3DtbV0OVJv57SdJR0bRWt0KHT8TloK31Sk.jpg', 2, '2026-10-11 15:49:57', '2026-10-11 15:49:57'),
(4, 'kid-3', 'Kid 3', 22, 22.30, 'Elit dolor porttitor sed tellus eiusmod ipsum. Porttitor sit vivamus eiusmod vendor aenean elementum. Vendor ipsum porttitor sed. Lorem semper eiusmod vendor ipsum elit. Semper nisi vendor. Porttitor dolor ipsum eiusmod lorem. Elementum sit lorem sit. Vendor vivamus vendor elementum sed nisi vivamus sit nisi. Dolor semper lorem vivamus tellus ipsum consectetur elit vivamus. Aenean elementum. Porttitor tellus aenean sit vendor elementum eiusmod. Vivamus dolor nisi sed semper tellus ipsum. Tellus semper. Sed porttitor vendor semper vendor. Sit dolor semper sed. Porttitor vivamus elit porttitor elit semper ipsum tellus sed. Elementum leo vivamus elementum tellus elementum consectetur ipsum vendor. Consectetur.', 'storage/images/products/RnZurIUcJ4PTEw3V1geqzedVyNnvyHVXOabjKgZ8.jpg', 2, '2026-10-11 15:50:51', '2026-10-11 15:50:51'),
(5, 'man-1', 'Man 1', 23, 24.30, 'Elit sed consectetur dolor consectetur. Ipsum vivamus elementum tellus eiusmod. Ipsum lorem. Elit consectetur sed vendor. Elementum consectetur. Sit vivamus. Sit eiusmod leo ipsum consectetur dolor porttitor. Sed porttitor vendor dolor sit. Vendor aenean vendor. Elementum. Aenean consectetur vivamus porttitor leo elementum. Dolor aenean semper aenean elementum elit. Lorem vendor consectetur porttitor tellus lorem. Leo eiusmod dolor eiusmod porttitor nisi. Lorem sit vendor. Ipsum lorem. Eiusmod semper aenean sed semper vendor lorem. Leo ipsum porttitor vivamus sed nisi leo tellus. Nisi semper porttitor sed. Nisi sit vivamus semper. Porttitor consectetur aenean consectetur lorem elementum ipsum dolor. Nisi elit elementum consectetur.', 'storage/images/products/PuogAxsjMJSijhmlysnND2PP7lN1UmR4ITI1qy3U.jpg', 4, '2026-10-11 15:52:01', '2026-10-11 15:52:01'),
(6, 'man-2', 'Man 2', 24, 28.50, 'Tellus sed nisi eiusmod consectetur sed lorem semper. Vivamus aenean. Semper dolor vivamus sed dolor porttitor sed semper. Vivamus ipsum elementum tellus leo lorem. Consectetur leo ipsum leo elit eiusmod. Vivamus sit vivamus elit leo. Porttitor tellus porttitor tellus eiusmod elit porttitor. Dolor vivamus dolor. Porttitor vivamus tellus sit lorem porttitor ipsum aenean elit. Nisi consectetur. Vendor elit sit vivamus lorem elementum vivamus. Elementum elit eiusmod lorem consectetur eiusmod dolor. Vendor tellus. Nisi vivamus leo tellus ipsum. Nisi sed nisi. Eiusmod vivamus tellus nisi leo vendor semper leo. Porttitor sed eiusmod porttitor eiusmod leo sed eiusmod. Elementum vendor porttitor leo.', 'storage/images/products/zJBJIz5gk8GEiDCS6VJ8kYB4OSBleBrwW5RN1UWI.jpg', 4, '2026-10-11 15:53:02', '2026-10-11 15:53:02'),
(7, 'man-3', 'Man 3', 25, 29.20, 'Eiusmod vendor leo sed leo ipsum lorem dolor porttitor. Consectetur vivamus elementum aenean elit tellus leo. Sed eiusmod. Nisi vivamus. Tellus ipsum leo elit. Lorem vendor elit ipsum tellus sit. Elit sit. Elementum porttitor semper. Eiusmod. Aenean consectetur ipsum leo. Aenean porttitor nisi leo elementum vivamus eiusmod sed. Ipsum lorem aenean nisi consectetur semper. Ipsum tellus. Vendor tellus elit ipsum sit semper consectetur. Porttitor. Tellus elementum. Porttitor sit ipsum elementum. Semper ipsum. Elit lorem nisi porttitor lorem. Aenean nisi semper vivamus porttitor leo porttitor. Dolor. Ipsum aenean dolor consectetur semper. Nisi vendor lorem sit vendor nisi vivamus dolor elementum. Tellus.', 'storage/images/products/6JsHeZHU9hDmkjBTnjIB41hOpEH9VNREsqsmt4I7.jpg', 4, '2026-10-11 15:53:49', '2026-10-11 15:53:49'),
(8, 'women-1', 'Women 1', 26, 28.50, 'Sed sit semper consectetur vivamus. Dolor elementum sit. Aenean. Eiusmod tellus sed. Leo consectetur nisi eiusmod nisi vendor. Eiusmod semper vivamus nisi elementum sed elit vendor aenean. Tellus eiusmod porttitor. Elit sed dolor semper dolor vivamus. Nisi leo elit ipsum elementum porttitor. Tellus vivamus elementum aenean vendor sed aenean. Tellus vendor dolor ipsum vivamus semper dolor. Ipsum aenean ipsum elementum. Vendor ipsum sit eiusmod tellus. Semper. Consectetur elit tellus dolor elit vivamus. Dolor lorem tellus dolor vendor sit aenean eiusmod elit. Elementum elit elementum elit. Ipsum elit vivamus. Porttitor dolor. Semper elementum porttitor aenean sed porttitor nisi ipsum tellus. Vivamus.', 'storage/images/products/14nsDQW5rNSoRPFhLfTxJQ9OF0intuOblCNrAFHe.jpg', 3, '2026-10-11 15:54:29', '2026-10-11 15:54:29'),
(9, 'women-2', 'Women 2', 28, 21.30, 'Vendor leo elementum elit vivamus tellus sit. Aenean tellus. Consectetur tellus semper. Ipsum lorem vendor dolor. Elit sit nisi porttitor elementum sit nisi dolor. Sit porttitor dolor sit. Tellus eiusmod porttitor sit leo vendor vivamus. Ipsum eiusmod nisi tellus dolor. Aenean sed vendor semper vivamus. Sit leo ipsum porttitor nisi lorem porttitor sit lorem. Aenean. Lorem nisi consectetur vendor sit. Semper sed nisi sit. Leo lorem consectetur leo dolor elementum vivamus tellus. Aenean porttitor tellus aenean vendor aenean. Nisi lorem. Vivamus. Tellus leo ipsum. Leo tellus vivamus vendor elit vivamus lorem. Sit eiusmod dolor lorem porttitor nisi vendor elit. Vivamus.', 'storage/images/products/zsMlxw0cVBpF4ibTvokEYJ8NRyx9yRuBUasAaYAZ.jpg', 3, '2026-10-11 15:55:00', '2026-10-11 15:55:00'),
(10, 'women-3', 'Women 3', 32, 32.10, 'Ipsum nisi consectetur vivamus leo sit eiusmod. Vivamus. Lorem sed elit lorem elit vivamus lorem leo. Elit lorem tellus sit leo vendor leo nisi. Semper tellus vendor semper. Vendor sit vendor eiusmod aenean sed vivamus. Semper porttitor lorem nisi elementum. Aenean ipsum. Aenean eiusmod elit lorem porttitor aenean. Elementum porttitor semper eiusmod dolor leo elementum lorem. Consectetur semper ipsum eiusmod. Elementum elit lorem elementum nisi. Leo. Aenean sit porttitor consectetur semper elementum. Vendor porttitor sit aenean porttitor dolor. Leo eiusmod aenean ipsum vivamus aenean. Elit dolor vendor vivamus aenean lorem. Porttitor vivamus elementum dolor sit. Vendor semper elit lorem. Tellus.', 'storage/images/products/GfTJT6DICKdy9Qg3reYqtcoaLh4dAZZAI9lWnSgm.jpg', 3, '2026-10-11 15:55:36', '2026-10-11 15:55:36'),
(11, 'old-men-1', 'Old Men 1', 32, 29.20, 'Sed ipsum vivamus ipsum tellus. Vendor leo consectetur. Tellus eiusmod. Porttitor tellus porttitor aenean elementum aenean. Porttitor nisi. Dolor lorem vivamus sit semper elit. Eiusmod sed vivamus aenean. Semper sed aenean semper. Consectetur tellus elit. Sit. Elit semper dolor sit. Consectetur eiusmod. Nisi elementum elit porttitor elit sit elementum. Porttitor. Elit aenean eiusmod dolor. Elementum elit aenean sed porttitor semper sed eiusmod elit. Lorem tellus eiusmod porttitor sit porttitor sed. Ipsum porttitor. Aenean consectetur sit lorem sit leo tellus vendor vivamus. Sit elementum eiusmod aenean. Semper elit consectetur. Lorem tellus. Ipsum aenean sed nisi consectetur dolor eiusmod vendor nisi. Dolor.', 'storage/images/products/z4xn1zyPRLNqNyMvSf7Qtm53IlE0Ewi6w4QYDpJ3.jpg', 5, '2026-10-11 15:56:35', '2026-10-11 15:56:35'),
(13, 'old-men-2', 'Old Men 2', 33, 33.60, 'Semper aenean nisi leo elementum vendor consectetur aenean. Leo porttitor consectetur vivamus. Sed vendor vivamus sit. Ipsum lorem vivamus vendor. Porttitor sed porttitor nisi sit. Sed consectetur. Aenean. Consectetur tellus elementum elit leo sit lorem semper. Ipsum consectetur dolor vendor eiusmod sit. Eiusmod porttitor vivamus semper consectetur aenean tellus. Elit eiusmod vivamus lorem dolor. Aenean vendor. Leo eiusmod semper sed aenean lorem eiusmod. Leo sed dolor elementum tellus vivamus porttitor. Elementum sit vivamus sed eiusmod. Porttitor tellus aenean elit leo consectetur. Eiusmod sit elementum. Sed aenean lorem sed aenean tellus. Vendor. Elementum nisi consectetur vendor nisi lorem consectetur vivamus. Dolor.', 'storage/images/products/nFs0heWtZhV07CBET5UVAV8QM7yg6E2QZoG3M9xN.jpg', 5, '2026-10-11 15:57:19', '2026-10-11 15:57:19'),
(14, 'old-men-3', 'Old Men 3', 34, 33.60, 'Sed ipsum vendor tellus dolor sed consectetur. Sed. Aenean vendor dolor semper. Vivamus elementum vendor sit dolor porttitor. Elementum nisi eiusmod porttitor leo nisi. Tellus ipsum elit. Sit vendor vivamus. Eiusmod ipsum. Dolor semper elit tellus. Vivamus sit semper consectetur. Elit lorem elit tellus semper. Vivamus porttitor tellus. Aenean vivamus sed ipsum elementum semper vendor sit. Elementum ipsum vivamus vendor tellus sit consectetur. Porttitor eiusmod vendor porttitor nisi semper ipsum leo ipsum. Sed ipsum elementum. Ipsum nisi. Elit. Sit dolor nisi. Elit consectetur sed. Vendor elementum eiusmod ipsum vivamus semper eiusmod. Vendor sed elementum eiusmod tellus. Semper leo ipsum sed.', 'storage/images/products/fz7rdPMzASxt5YvVROtBdbMAAufk4zUiMyIMwqma.jpg', 5, '2026-10-11 15:57:58', '2026-10-11 15:57:58'),
(15, 'old-men-4', 'Old Men 4', 41, 32.10, 'Nisi elementum porttitor consectetur sit. Dolor lorem. Elit leo vendor porttitor vendor. Sed eiusmod. Porttitor. Vendor sed vivamus nisi tellus nisi. Vivamus elementum vendor. Semper vendor sit semper aenean lorem elementum ipsum. Leo aenean sed elit. Sit lorem ipsum semper lorem elementum. Lorem vivamus porttitor semper leo ipsum. Elementum porttitor sit porttitor lorem sed tellus elementum. Dolor elementum leo elit sit nisi tellus. Nisi. Aenean tellus. Vivamus sed aenean porttitor. Sed dolor. Sed ipsum vendor tellus semper. Elementum. Ipsum eiusmod aenean lorem vendor elit. Dolor lorem aenean sit. Vendor sit. Tellus sed eiusmod leo nisi elit. Elementum tellus dolor porttitor.', 'storage/images/products/hIdl4UuecGtE9R4EAglT1m2hc1An3eQwKlhTlfQj.jpg', 5, '2026-10-11 15:58:39', '2026-10-11 15:58:39');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_size`
--

CREATE TABLE `product_size` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `size_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `product_size`
--

INSERT INTO `product_size` (`id`, `product_id`, `size_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 2, 4, NULL, NULL),
(5, 2, 5, NULL, NULL),
(6, 2, 6, NULL, NULL),
(7, 4, 5, NULL, NULL),
(8, 4, 6, NULL, NULL),
(9, 4, 7, NULL, NULL),
(10, 5, 2, NULL, NULL),
(11, 5, 4, NULL, NULL),
(12, 5, 5, NULL, NULL),
(13, 6, 2, NULL, NULL),
(14, 6, 6, NULL, NULL),
(15, 6, 7, NULL, NULL),
(16, 7, 2, NULL, NULL),
(17, 7, 3, NULL, NULL),
(18, 7, 5, NULL, NULL),
(19, 8, 2, NULL, NULL),
(20, 8, 4, NULL, NULL),
(21, 8, 5, NULL, NULL),
(22, 9, 2, NULL, NULL),
(23, 9, 6, NULL, NULL),
(24, 9, 7, NULL, NULL),
(25, 10, 2, NULL, NULL),
(26, 10, 4, NULL, NULL),
(27, 10, 7, NULL, NULL),
(28, 11, 2, NULL, NULL),
(29, 11, 5, NULL, NULL),
(30, 11, 7, NULL, NULL),
(31, 13, 4, NULL, NULL),
(32, 13, 5, NULL, NULL),
(33, 13, 6, NULL, NULL),
(34, 14, 3, NULL, NULL),
(35, 14, 5, NULL, NULL),
(36, 14, 7, NULL, NULL),
(37, 15, 1, NULL, NULL),
(38, 15, 2, NULL, NULL),
(39, 15, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('tfz10DzVclF461wBrPR3G55nkHDG9aJJxaWu5aqa', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIzZWlRTm9OR2NJODJjMWZqN0w0a3dZMTBGZEVSTWttMVBFaXJWYng5IiwiX2ZsYXNoIjp7Im5ldyI6W10sIm9sZCI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2FkbWluXC9pbmRleCIsInJvdXRlIjoiYWRtaW4uaW5kZXgifSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiNDMwNWJjNmQzZmMxMTNhODE3YjNlOThiMTQwMzBlN2QxN2FjYjE2YmQzY2JmYTE3N2ZhMWIwN2EzN2IxMThlNyJ9', 1791745127);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sizes`
--

INSERT INTO `sizes` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(1, 'xxs', 'XXS', '2026-10-11 15:15:15', '2026-10-11 15:15:24'),
(2, 'xs', 'XS', '2026-10-11 15:34:08', '2026-10-11 15:34:08'),
(3, 's', 'S', '2026-10-11 15:34:12', '2026-10-11 15:34:12'),
(4, 'm', 'M', '2026-10-11 15:34:18', '2026-10-11 15:34:18'),
(5, 'l', 'L', '2026-10-11 15:34:23', '2026-10-11 15:34:23'),
(6, 'xl', 'XL', '2026-10-11 15:34:28', '2026-10-11 15:34:28'),
(7, 'xxl', 'XXL', '2026-10-11 15:34:33', '2026-10-11 15:34:33');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_completed` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `country`, `zip_code`, `profile_completed`, `profile_image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sezer Ünalmış', NULL, NULL, NULL, '0', NULL, 'admin@email.com', NULL, '$2y$12$4b7YGlBOL0blJG/hAAvqKOkKwLVVO0mSfLISslNWf0U2.ZJbpIeL6', NULL, NULL, '2026-10-10 15:36:30');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Tablo için indeksler `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `color_product`
--
ALTER TABLE `color_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_product_color_id_foreign` (`color_id`),
  ADD KEY `color_product_product_id_foreign` (`product_id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Tablo için indeksler `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Tablo için indeksler `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_size_product_id_foreign` (`product_id`),
  ADD KEY `product_size_size_id_foreign` (`size_id`);

--
-- Tablo için indeksler `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `color_product`
--
ALTER TABLE `color_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `color_product`
--
ALTER TABLE `color_product`
  ADD CONSTRAINT `color_product_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `color_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `product_size_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_size_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
