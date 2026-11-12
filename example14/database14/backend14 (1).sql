-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 12 Kas 2026, 14:44:50
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `backend14`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Man', 'man', '2026-11-11 08:48:50', '2026-11-11 08:51:11'),
(3, 'Woman', 'woman', '2026-11-11 11:11:59', '2026-11-11 11:11:59'),
(4, 'Girl Kid', 'girl-kid', '2026-11-11 11:12:09', '2026-11-11 11:12:09'),
(5, 'Boy Kid', 'boy-kid', '2026-11-11 11:12:17', '2026-11-11 11:12:17'),
(6, 'Old Woman', 'old-woman', '2026-11-11 11:12:25', '2026-11-11 11:12:25'),
(7, 'Old Man', 'old-man', '2026-11-11 11:12:32', '2026-11-11 11:12:32');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `colors`
--

INSERT INTO `colors` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Red', 'red', '2026-11-11 11:03:56', '2026-11-11 11:04:07'),
(2, 'Green', 'green', '2026-11-11 11:12:46', '2026-11-11 11:12:46'),
(3, 'Blue', 'blue', '2026-11-11 11:12:52', '2026-11-11 11:12:52'),
(4, 'Yellow', 'yellow', '2026-11-11 11:12:58', '2026-11-11 11:12:58'),
(5, 'Orange', 'orange', '2026-11-11 11:13:05', '2026-11-11 11:13:05'),
(6, 'Brown', 'brown', '2026-11-11 11:13:12', '2026-11-11 11:13:12'),
(7, 'Black', 'black', '2026-11-11 11:13:18', '2026-11-11 11:13:18'),
(8, 'Gray', 'gray', '2026-11-11 11:13:24', '2026-11-11 11:13:24'),
(9, 'Purple', 'purple', '2026-11-11 11:13:30', '2026-11-11 11:13:30');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `color_product`
--

CREATE TABLE `color_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
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
(7, 7, 3, NULL, NULL),
(8, 8, 3, NULL, NULL),
(9, 9, 3, NULL, NULL),
(10, 1, 4, NULL, NULL),
(11, 3, 4, NULL, NULL),
(12, 4, 4, NULL, NULL),
(13, 1, 5, NULL, NULL),
(14, 2, 5, NULL, NULL),
(15, 3, 5, NULL, NULL),
(16, 4, 5, NULL, NULL),
(17, 5, 5, NULL, NULL),
(18, 6, 5, NULL, NULL),
(19, 1, 6, NULL, NULL),
(20, 3, 6, NULL, NULL),
(21, 5, 6, NULL, NULL),
(22, 8, 6, NULL, NULL),
(23, 1, 7, NULL, NULL),
(24, 2, 7, NULL, NULL),
(25, 1, 8, NULL, NULL),
(26, 2, 9, NULL, NULL),
(27, 3, 9, NULL, NULL),
(28, 8, 9, NULL, NULL),
(29, 9, 9, NULL, NULL),
(30, 4, 10, NULL, NULL),
(31, 7, 11, NULL, NULL),
(32, 8, 11, NULL, NULL),
(33, 9, 11, NULL, NULL),
(34, 2, 12, NULL, NULL),
(35, 3, 12, NULL, NULL),
(36, 4, 12, NULL, NULL),
(39, 2, 14, NULL, NULL),
(40, 3, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_11_08_150202_create_roles_table', 1),
(5, '2026_11_08_150220_create_role_user_table', 1),
(6, '2026_11_08_151218_create_personal_access_tokens_table', 1),
(7, '2026_11_11_074114_create_categories_table', 2),
(8, '2026_11_11_074124_create_colors_table', 2),
(9, '2026_11_11_074131_create_sizes_table', 2),
(10, '2026_11_11_074138_create_products_table', 2),
(11, '2026_11_11_074202_create_color_product_table', 2),
(12, '2026_11_11_074215_create_product_size_table', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'new_user', '60ad98854f81ec53ac8fbcec5eba1d8cc913c37dec1e73add21530987ffd2625', '[\"*\"]', NULL, NULL, '2026-11-12 11:44:10', '2026-11-12 11:44:10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `quantity`, `price`, `description`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'Man 1', 'man-1', 2, 12, 12.33, 'Vivamus porttitor dolor elementum sit vendor. Consectetur elit vendor tellus. Consectetur leo semper elementum. Sed ipsum sit vendor elementum ipsum tellus. Vendor consectetur aenean vivamus. Semper elementum vendor semper nisi. Semper porttitor tellus consectetur sed leo. Dolor sed leo semper sit aenean. Eiusmod porttitor tellus dolor eiusmod ipsum. Elit. Leo ipsum elit elementum semper. Sit porttitor vivamus sed elementum sit. Ipsum nisi aenean. Porttitor consectetur sed elit nisi sed vivamus. Dolor elit. Aenean nisi porttitor sit vendor elit. Leo sit vendor leo elit leo. Dolor vivamus elit lorem nisi elit. Consectetur sed aenean sed consectetur eiusmod nisi porttitor tellus. Sed.', 'storage/images/product/JCw6iOgyMLZzsrxEEKQxnScybzRqW7S3oxq943p3.jpg', '2026-11-11 11:25:29', '2026-11-11 11:25:29'),
(2, 'Man 2', 'man-2', 2, 21, 12.45, 'Porttitor semper ipsum elementum porttitor eiusmod. Vendor. Nisi ipsum. Elementum sed elementum nisi vivamus tellus dolor. Semper porttitor leo nisi consectetur vivamus sit vivamus. Elementum nisi sed porttitor sed vivamus. Vendor aenean lorem eiusmod lorem dolor. Tellus leo sed leo elit aenean elit sit semper. Lorem aenean vendor sit lorem porttitor elit ipsum semper. Aenean ipsum. Leo lorem eiusmod sit. Ipsum elementum lorem. Dolor vivamus ipsum. Sit sed elementum dolor nisi eiusmod. Sed consectetur dolor tellus leo consectetur tellus vendor porttitor. Nisi leo eiusmod. Leo tellus nisi ipsum vendor lorem. Ipsum. Vendor consectetur dolor sit. Ipsum lorem consectetur porttitor aenean.', 'storage/images/product/PsJ1pwBDlFPaTBZXpgPvbA2fphGiJcIL6RXUvrD3.jpg', '2026-11-12 02:32:37', '2026-11-12 02:32:37'),
(3, 'Man 3', 'man-3', 2, 44, 12.78, 'Elit sed elit consectetur vendor aenean vendor. Sed porttitor lorem dolor aenean tellus elit. Vivamus lorem eiusmod elementum. Vendor elementum. Eiusmod. Tellus vendor consectetur elementum sit lorem. Aenean consectetur elementum. Vivamus aenean. Vendor nisi vendor. Sed. Ipsum vivamus ipsum leo sed consectetur. Sed vivamus nisi sed eiusmod vivamus dolor. Vendor vivamus eiusmod ipsum dolor. Semper vivamus elementum vivamus nisi consectetur nisi vivamus tellus. Sit semper ipsum nisi lorem vivamus sit aenean porttitor. Elit vivamus sit vendor aenean porttitor semper eiusmod. Leo eiusmod sit consectetur. Ipsum semper elit eiusmod consectetur elementum. Aenean tellus elit sit ipsum. Sit. Vendor dolor aenean consectetur.', 'storage/images/product/9I0UUppoGeJwPRSkWKplUijUAXegiJ7mG1FilBNE.jpg', '2026-11-12 02:39:57', '2026-11-12 02:39:57'),
(4, 'Woman 1', 'woman-1', 3, 21, 13.44, 'Vivamus semper nisi dolor vendor eiusmod ipsum. Lorem porttitor sit lorem eiusmod. Nisi dolor leo dolor. Ipsum lorem. Vivamus vendor. Dolor tellus nisi leo ipsum. Dolor vivamus aenean semper sed. Elit vivamus. Elit leo semper. Vendor. Porttitor tellus eiusmod aenean. Eiusmod nisi eiusmod dolor eiusmod. Tellus leo vivamus elementum. Vendor. Eiusmod porttitor sed sit leo semper. Elementum lorem vendor nisi. Vendor sit elementum. Dolor elementum consectetur tellus elit tellus ipsum. Semper vendor ipsum elit lorem. Ipsum nisi dolor. Ipsum aenean. Vendor porttitor semper lorem vivamus consectetur eiusmod sed. Elementum semper. Ipsum sit dolor vivamus porttitor nisi tellus dolor leo. Tellus.', 'storage/images/product/MLNlHkRzjxUAb20rdNFC6DXzIjHPHcna7kDVHhe8.jpg', '2026-11-12 02:40:52', '2026-11-12 02:40:52'),
(5, 'Woman 2', 'woman-2', 3, 17, 14.34, 'Elementum sit semper vendor tellus porttitor leo elementum elit. Eiusmod aenean nisi tellus consectetur sed eiusmod ipsum aenean. Elementum eiusmod. Ipsum sed nisi elementum dolor. Lorem ipsum vendor. Porttitor semper. Porttitor sed. Sit semper elementum. Ipsum lorem sit tellus vivamus. Tellus lorem elit vendor consectetur porttitor nisi consectetur. Nisi ipsum. Aenean sed vivamus vendor. Dolor aenean. Porttitor vivamus porttitor eiusmod sit vivamus lorem eiusmod. Nisi sit. Lorem sed dolor sit sed semper. Sed elit consectetur vivamus dolor elementum vivamus eiusmod. Tellus vendor elit sed. Lorem vivamus porttitor consectetur elit consectetur tellus. Sed lorem consectetur nisi sit nisi leo. Dolor eiusmod.', 'storage/images/product/0EFUmXYax856eogId8eGvjX2suqXEu0QIY9ulF1L.jpg', '2026-11-12 02:41:38', '2026-11-12 02:41:38'),
(6, 'Woman 3', 'woman-3', 3, 17, 16.54, 'Nisi vendor dolor elit semper dolor nisi elementum. Ipsum. Sed sit vendor elementum consectetur. Tellus aenean dolor semper. Nisi tellus sit vivamus nisi aenean porttitor aenean semper. Eiusmod vendor semper. Aenean eiusmod. Elementum dolor vendor porttitor. Elit nisi sit elementum ipsum elementum semper sit dolor. Vivamus elit sed lorem semper consectetur dolor sit elit. Consectetur elementum sed eiusmod consectetur leo. Elit semper porttitor elit. Sed elementum sit nisi leo semper ipsum porttitor. Semper porttitor consectetur tellus elementum tellus nisi elit. Nisi sed aenean semper. Elit dolor ipsum leo sit elit sed. Vendor sed porttitor eiusmod. Sit elit semper eiusmod. Sit.', 'storage/images/product/b8ytGyCMNaoHyLur7LzICsnWfley2Smipf1BUVUC.jpg', '2026-11-12 02:42:11', '2026-11-12 02:42:11'),
(7, 'Boy Kid 1', 'boy-kid-1', 5, 44, 16.70, 'Dolor vivamus eiusmod sit leo lorem dolor. Vendor. Porttitor nisi sit leo sit eiusmod. Sed. Semper nisi tellus aenean elit. Tellus semper sed eiusmod lorem. Vendor vivamus eiusmod. Semper elit lorem tellus eiusmod aenean sit elementum. Sed porttitor consectetur nisi. Semper elementum tellus vendor eiusmod nisi aenean elementum. Porttitor. Eiusmod dolor consectetur lorem sit nisi consectetur. Vivamus consectetur nisi tellus. Leo tellus vivamus. Semper elementum sed. Tellus lorem elit tellus nisi sed. Dolor sed semper vivamus eiusmod leo. Consectetur nisi tellus. Elementum aenean sed. Dolor semper aenean semper nisi dolor. Elementum semper consectetur porttitor sed elementum. Sed lorem vivamus semper.', 'storage/images/product/cOdEItLr4RRPKCJaGUPPBanGrKfCsCcUTaJAlaiu.jpg', '2026-11-12 02:42:50', '2026-11-12 02:42:50'),
(8, 'Boy Kid 2', 'boy-kid-2', 5, 12, 17.00, 'Sit aenean dolor eiusmod vivamus aenean lorem. Aenean tellus consectetur dolor elementum. Vendor sit tellus nisi elit vendor. Ipsum consectetur elit vivamus sed aenean leo sed lorem. Elit lorem aenean porttitor vivamus sit elit ipsum leo. Vendor elementum eiusmod vendor ipsum leo nisi lorem tellus. Lorem leo vivamus. Porttitor elit. Consectetur lorem vendor porttitor vivamus aenean. Sed vendor consectetur eiusmod leo lorem elit. Eiusmod elit elementum leo lorem vivamus sit. Semper porttitor semper dolor lorem. Porttitor tellus eiusmod consectetur dolor. Vendor dolor sit porttitor. Consectetur dolor tellus lorem sit nisi. Elementum vivamus dolor tellus consectetur semper nisi ipsum nisi. Semper.', 'storage/images/product/jedbEF1sVSwLxUtafAtw13xD3KZOyV68Ude3nSUT.jpg', '2026-11-12 02:43:24', '2026-11-12 02:43:24'),
(9, 'Girl Kid 1', 'girl-kid-1', 4, 12, 16.54, 'Vivamus sit nisi leo elit aenean elementum nisi. Sed dolor ipsum leo eiusmod aenean. Semper sit elit consectetur sed dolor tellus. Nisi elit nisi ipsum sed semper elit. Ipsum vendor eiusmod sit ipsum sed consectetur. Lorem. Aenean elementum lorem sit ipsum lorem leo elit consectetur. Elementum lorem nisi sit. Leo lorem aenean dolor tellus aenean eiusmod. Consectetur leo ipsum elit sed semper ipsum. Eiusmod vendor sit lorem consectetur dolor lorem semper eiusmod. Sed consectetur porttitor nisi vivamus semper. Dolor semper porttitor. Eiusmod sed dolor. Vendor tellus aenean porttitor leo consectetur elementum. Porttitor leo consectetur vivamus. Porttitor elementum ipsum sit. Porttitor.', 'storage/images/product/jt8obhzYpDuQCPQjhekMvj4YGDv9BciQPoZoTGuP.jpg', '2026-11-12 02:43:56', '2026-11-12 02:43:56'),
(10, 'Old Man', 'old-man', 7, 21, 14.34, 'Vivamus ipsum semper elit vivamus elementum elit. Dolor consectetur sed consectetur lorem dolor sit. Aenean. Vivamus semper eiusmod tellus porttitor vendor. Elit dolor sit lorem. Sit sed. Elit. Vendor vivamus semper dolor leo aenean lorem. Sit leo eiusmod consectetur vendor. Eiusmod ipsum. Nisi vendor leo aenean leo consectetur. Nisi elementum dolor aenean elementum vivamus nisi lorem. Nisi lorem elit sed. Ipsum vendor leo. Eiusmod sit vendor. Lorem porttitor consectetur eiusmod. Tellus consectetur. Sit vivamus porttitor dolor semper tellus elit sed. Leo. Elementum sed nisi. Tellus vivamus semper nisi ipsum vivamus. Elementum eiusmod leo eiusmod elementum consectetur vivamus lorem elit. Lorem.', 'storage/images/product/2tWHIKvStzMIdTBz1Ga1LZMmnl7bEkCZQWKTULhi.jpg', '2026-11-12 02:44:32', '2026-11-12 02:44:32'),
(11, 'Old Man 2', 'old-man-2', 7, 22, 15.43, 'Semper aenean sed leo semper leo tellus consectetur sit. Consectetur. Ipsum vivamus. Semper elit vivamus lorem. Vivamus eiusmod vivamus ipsum sed. Vendor tellus porttitor. Vivamus tellus dolor. Lorem eiusmod dolor vivamus lorem leo elementum aenean porttitor. Vivamus nisi leo consectetur. Vendor tellus vivamus sed sit. Semper vendor sed. Consectetur. Aenean nisi elit vendor ipsum porttitor lorem. Elit tellus semper vendor. Tellus elementum nisi elementum. Semper elementum eiusmod aenean ipsum dolor elit sed. Leo porttitor lorem elit vendor consectetur. Eiusmod porttitor sed consectetur dolor elementum. Vivamus sit tellus lorem porttitor ipsum lorem. Sit vendor ipsum semper lorem. Aenean elementum sit. Nisi.', 'storage/images/product/O9PcjnsM92JVbykJX0GKW5YngdhNHSJCxgJmUSmb.jpg', '2026-11-12 02:45:10', '2026-11-12 02:45:10'),
(12, 'Old Woman 1', 'old-woman-1', 7, 12, 12.45, 'Vivamus vendor porttitor elementum elit vendor. Nisi lorem porttitor. Sed. Eiusmod semper elit lorem vivamus consectetur vendor vivamus. Consectetur elit elementum tellus sed ipsum. Vendor elit elementum. Eiusmod vendor tellus nisi elit ipsum elit semper aenean. Vendor dolor eiusmod sit. Dolor eiusmod. Sed vendor porttitor tellus leo ipsum. Tellus vendor. Nisi vendor sed nisi porttitor consectetur. Porttitor sit tellus nisi. Eiusmod elit semper lorem. Sit consectetur tellus vendor consectetur ipsum sit sed. Eiusmod sit eiusmod. Leo sit consectetur tellus consectetur. Vivamus vendor sed aenean semper. Eiusmod ipsum lorem sit dolor. Sed. Ipsum tellus lorem tellus sit nisi vivamus. Dolor elit.', 'storage/images/product/9FRHYJ3dohtBhMDe9cRpAfajN8eQbfipw70CCJal.jpg', '2026-11-12 02:45:40', '2026-11-12 02:45:40'),
(14, 'Old Woman 2', 'old-woman-2', 7, 17, 12.33, 'Vivamus semper eiusmod sit nisi porttitor dolor. Lorem. Semper leo aenean semper lorem aenean. Leo. Consectetur semper elementum. Ipsum porttitor tellus eiusmod nisi consectetur. Eiusmod. Porttitor eiusmod vendor. Dolor porttitor. Eiusmod leo. Nisi aenean dolor elit sit elementum sed elit. Porttitor elementum vivamus eiusmod vivamus. Aenean sed porttitor lorem elit elementum lorem elementum tellus. Consectetur. Nisi tellus elit semper ipsum. Nisi leo nisi. Eiusmod tellus consectetur leo semper tellus leo. Consectetur elit. Semper vivamus elementum tellus dolor vivamus tellus consectetur. Elit vivamus porttitor semper. Aenean elit vivamus vendor consectetur elit. Ipsum porttitor sed aenean semper. Tellus. Dolor consectetur. Lorem nisi.', 'storage/images/product/iW18wzWqUTszIAdakq1aKiuuK71zklT8KL3747m8.jpg', '2026-11-12 02:56:02', '2026-11-12 02:56:02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_size`
--

CREATE TABLE `product_size` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
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
(7, 3, 1, NULL, NULL),
(8, 3, 3, NULL, NULL),
(9, 3, 5, NULL, NULL),
(10, 4, 2, NULL, NULL),
(11, 4, 3, NULL, NULL),
(12, 4, 4, NULL, NULL),
(13, 4, 5, NULL, NULL),
(14, 5, 3, NULL, NULL),
(15, 5, 4, NULL, NULL),
(16, 5, 5, NULL, NULL),
(17, 5, 6, NULL, NULL),
(18, 6, 2, NULL, NULL),
(19, 6, 3, NULL, NULL),
(20, 7, 3, NULL, NULL),
(21, 8, 2, NULL, NULL),
(22, 9, 3, NULL, NULL),
(23, 9, 4, NULL, NULL),
(24, 10, 1, NULL, NULL),
(25, 10, 2, NULL, NULL),
(26, 10, 3, NULL, NULL),
(27, 11, 2, NULL, NULL),
(28, 11, 3, NULL, NULL),
(29, 11, 4, NULL, NULL),
(30, 12, 2, NULL, NULL),
(31, 12, 3, NULL, NULL),
(32, 12, 4, NULL, NULL),
(35, 14, 1, NULL, NULL),
(36, 14, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('GaXy1qXvflQw6zPQgmuirwZMLiUKOzZEbU1KjVCU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJaakh4bnBqaHB3bkJnZFBvVmQ3dVFZenN4NVIxTWREQ3A3ck9vWEpUIiwiX2ZsYXNoIjp7Im5ldyI6W10sIm9sZCI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2FkbWluXC9wcm9kdWN0Iiwicm91dGUiOiJhZG1pbi5wcm9kdWN0LmluZGV4In0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxLCJwYXNzd29yZF9oYXNoX3dlYiI6IjY5YWNmNTIyOTBhNTgzMTk4ZTc5ZmU4YWM4MDFkM2JmYmRjZWFhYmM4Yzg1OTA4ZTMxMTBmZDU1NmU3NGRkZmMifQ==', 1794462962);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'XS', 'xs', '2026-11-11 11:06:15', '2026-11-11 11:06:24'),
(2, 'S', 's', '2026-11-11 11:13:52', '2026-11-11 11:13:52'),
(3, 'M', 'm', '2026-11-11 11:13:59', '2026-11-11 11:13:59'),
(4, 'L', 'l', '2026-11-11 11:14:04', '2026-11-11 11:14:04'),
(5, 'XL', 'xl', '2026-11-11 11:14:09', '2026-11-11 11:14:09'),
(6, 'XXL', 'xxl', '2026-11-11 11:14:14', '2026-11-11 11:14:14');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `profile_completed` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `profile_image`, `address`, `city`, `zip_code`, `profile_completed`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sezer Ünalmış', NULL, NULL, NULL, NULL, 0, 'admin@email.com', NULL, '$2y$12$lsM8KZfoZ7cPe.hLoLUViuAAEg/E64yNfHdG1AmEqKT6g0viyyKr2', NULL, NULL, '2026-11-11 04:34:41');

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
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `color_product`
--
ALTER TABLE `color_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
