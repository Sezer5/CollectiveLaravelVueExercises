-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 30 Eyl 2026, 14:52:02
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `backend8`
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
(2, 'Red', 'red', '2026-09-29 10:18:51', '2026-09-29 10:20:05'),
(3, 'Green', 'green', '2026-09-29 10:20:13', '2026-09-29 10:20:13'),
(4, 'Blue', 'blue', '2026-09-29 10:20:19', '2026-09-29 10:20:19'),
(5, 'Gray', 'gray', '2026-09-29 10:20:27', '2026-09-29 10:20:27'),
(7, 'Yellow', 'yellow', '2026-09-29 10:20:41', '2026-09-29 10:20:41'),
(8, 'Purple', 'purple', '2026-09-29 10:20:47', '2026-09-29 10:20:47'),
(9, 'Brown', 'brown', '2026-09-29 10:20:55', '2026-09-29 10:20:55'),
(10, 'Black', 'black', '2026-09-29 10:21:13', '2026-09-29 10:21:13'),
(11, 'Orange', 'orange', '2026-09-29 10:21:35', '2026-09-29 10:21:35');

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
(7, 2, 2, NULL, NULL),
(8, 3, 2, NULL, NULL),
(9, 4, 2, NULL, NULL),
(10, 5, 3, NULL, NULL),
(11, 7, 3, NULL, NULL),
(12, 8, 3, NULL, NULL),
(13, 9, 4, NULL, NULL),
(14, 10, 4, NULL, NULL),
(15, 11, 4, NULL, NULL),
(16, 9, 5, NULL, NULL),
(17, 10, 5, NULL, NULL),
(18, 11, 5, NULL, NULL),
(19, 3, 6, NULL, NULL),
(20, 8, 6, NULL, NULL),
(21, 9, 6, NULL, NULL),
(22, 11, 6, NULL, NULL),
(23, 4, 7, NULL, NULL),
(24, 5, 7, NULL, NULL),
(25, 10, 7, NULL, NULL),
(26, 11, 7, NULL, NULL),
(27, 3, 8, NULL, NULL),
(28, 9, 8, NULL, NULL),
(29, 10, 8, NULL, NULL),
(30, 3, 9, NULL, NULL),
(31, 8, 9, NULL, NULL),
(32, 10, 9, NULL, NULL),
(33, 3, 10, NULL, NULL),
(34, 4, 10, NULL, NULL),
(35, 8, 10, NULL, NULL),
(36, 9, 10, NULL, NULL),
(37, 11, 10, NULL, NULL);

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
(4, '2026_09_29_081040_create_roles_table', 2),
(5, '2026_09_29_081100_create_role_user_table', 2),
(6, '2026_09_29_111116_create_colors_table', 3),
(7, '2026_09_29_111122_create_sizes_table', 3),
(8, '2026_09_29_111131_create_products_table', 3),
(9, '2026_09_29_111610_create_color_product_table', 4),
(10, '2026_09_29_111638_create_product_size_table', 4),
(11, '2026_09_29_142955_create_personal_access_tokens_table', 5);

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
(1, 'App\\Models\\User', 2, 'new_user', '23914f3dfd785a6e1fbef1678b2089a217dafd9d5d76c96d8488d1458ab9f7e5', '[\"*\"]', NULL, NULL, '2026-09-30 11:01:34', '2026-09-30 11:01:34');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `quantity`, `price`, `description`, `thumbnail`, `created_at`, `updated_at`) VALUES
(2, 'Men 1', 'men-1', 12, 12.33, 'Tellus elementum elit semper elementum semper nisi. Porttitor. Nisi tellus elit elementum semper vivamus porttitor dolor. Sit ipsum. Dolor aenean consectetur semper sit aenean. Semper. Sit lorem vendor eiusmod elementum sed vendor. Aenean vendor leo. Sed leo elementum porttitor dolor. Elit dolor. Sit consectetur aenean. Eiusmod nisi aenean. Porttitor vivamus elit eiusmod semper dolor. Eiusmod vivamus leo porttitor semper sed ipsum tellus leo. Vendor semper. Eiusmod lorem vivamus aenean porttitor lorem semper. Dolor porttitor lorem. Vivamus nisi elit consectetur semper. Elementum. Consectetur elit tellus consectetur nisi sit lorem nisi consectetur. Eiusmod. Tellus sed aenean leo tellus. Elementum tellus ipsum sit.', 'storage/images/product/1ZSCu7ccS8GkBefpUGcMsdkSSRaYLurhnto8Mp8h.jpg', '2026-09-29 11:18:20', '2026-09-29 11:18:20'),
(3, 'Men 2', 'men-2', 22, 12.45, 'Porttitor elementum porttitor tellus ipsum. Consectetur. Sit. Eiusmod. Elementum sit porttitor consectetur. Eiusmod vivamus. Tellus porttitor sed aenean porttitor nisi lorem. Semper leo lorem vivamus consectetur sed eiusmod. Elementum elit. Tellus vivamus elit lorem elementum ipsum. Semper leo dolor ipsum elit consectetur sit tellus vendor. Dolor leo ipsum eiusmod. Aenean dolor lorem sed lorem. Elementum. Ipsum. Sit dolor lorem sed. Nisi ipsum lorem eiusmod sit. Vivamus elit consectetur eiusmod elementum. Leo semper. Elit elementum consectetur aenean sed. Elementum vivamus sed. Aenean sit lorem vendor. Ipsum sit elit dolor porttitor leo. Vivamus. Consectetur dolor sed tellus elit porttitor nisi. Sed aenean.', 'storage/images/product/uSUgCdySUL1wp5IpceEbI6IFsp9CsCyflbPdM2xO.jpg', '2026-09-29 11:18:55', '2026-09-29 11:18:55'),
(4, 'Men 3', 'men-3', 33, 12.66, 'Lorem leo ipsum sit leo porttitor. Tellus. Sed vendor semper vivamus semper. Elit consectetur eiusmod lorem. Semper sit nisi leo lorem elementum dolor sit. Vivamus. Semper nisi ipsum tellus vendor. Aenean tellus semper elit sed. Leo semper consectetur semper dolor. Tellus ipsum nisi elit eiusmod. Semper vivamus vendor. Tellus sed sit vivamus ipsum eiusmod tellus lorem. Nisi elit elementum aenean leo vivamus consectetur. Elementum tellus ipsum. Semper sit aenean elementum leo semper. Porttitor sit elit semper lorem. Aenean elementum lorem. Aenean consectetur sed semper. Vivamus elementum elit semper dolor ipsum. Semper. Tellus elit aenean tellus ipsum. Lorem tellus porttitor semper.', 'storage/images/product/EdkdGFi2EomhQlFKRAFzteFjducmuemECW9T3dw9.jpg', '2026-09-29 11:19:28', '2026-09-29 11:19:28'),
(5, 'Women 1', 'women-1', 44, 23.40, 'Elit aenean vivamus eiusmod consectetur sit. Consectetur ipsum lorem. Semper. Sit elit consectetur ipsum sit. Consectetur sed lorem. Eiusmod ipsum aenean nisi semper eiusmod. Leo lorem vivamus leo tellus porttitor. Elit consectetur lorem vivamus eiusmod. Semper sit dolor aenean sit aenean leo. Ipsum leo semper dolor eiusmod vendor lorem. Tellus. Nisi vendor sit elementum semper elementum. Vendor vivamus leo sit. Aenean eiusmod dolor vivamus sed. Nisi tellus dolor nisi vendor aenean sit. Elementum consectetur elementum vendor elementum porttitor tellus eiusmod elementum. Semper dolor sit leo porttitor lorem porttitor vendor sed. Leo. Lorem tellus leo dolor sed elementum aenean. Sed sit.', 'storage/images/product/28zDI4WqAwsItCgEaus2j6Wov0QTWwWnHIDXgKry.jpg', '2026-09-29 11:20:12', '2026-09-29 11:20:12'),
(6, 'Women 2', 'women-2', 44, 21.55, 'Sed dolor tellus porttitor lorem nisi porttitor eiusmod sed. Lorem. Leo nisi aenean vivamus semper. Vivamus nisi porttitor leo aenean. Sit consectetur elit sit leo. Eiusmod dolor eiusmod vendor tellus aenean sed. Elementum semper lorem. Ipsum. Lorem eiusmod consectetur vendor elementum lorem nisi porttitor vendor. Sed semper consectetur. Ipsum semper lorem dolor aenean leo. Sed elit elementum sed sit sed elementum eiusmod semper. Vendor sed nisi. Elementum porttitor elit consectetur. Elit semper. Aenean sed leo. Vendor leo consectetur elementum porttitor ipsum. Tellus semper leo. Sed semper lorem vendor eiusmod dolor sed. Elementum aenean semper sed. Aenean. Sed dolor elementum leo.', 'storage/images/product/4f9S3sVXhxHPPjX64pBK3s1E5q5LcjI5LWvHSI7N.jpg', '2026-09-29 11:20:46', '2026-09-29 11:20:46'),
(7, 'Women 3', 'women-3', 21, 22.30, 'Lorem dolor aenean porttitor nisi elementum vendor elementum elit. Porttitor sit lorem nisi elit porttitor dolor consectetur sed. Aenean porttitor. Vendor aenean sit elementum. Sit. Leo elementum. Porttitor. Tellus consectetur. Porttitor eiusmod consectetur aenean ipsum. Elit. Sit consectetur ipsum aenean tellus sed. Lorem vendor aenean elementum ipsum leo sit. Sed vendor semper nisi elementum. Semper. Ipsum consectetur vivamus lorem tellus. Semper leo nisi lorem nisi. Ipsum eiusmod vendor leo ipsum sed sit. Consectetur vivamus elit semper nisi vivamus consectetur aenean dolor. Lorem eiusmod ipsum consectetur elit leo sit ipsum elit. Porttitor dolor porttitor elit vivamus eiusmod. Elit eiusmod vendor ipsum.', 'storage/images/product/zrAmaTRn2PfOodKv7ZdqQK6q1Is5JRYxrXMaozXP.jpg', '2026-09-29 11:21:32', '2026-09-29 11:21:32'),
(8, 'Old Men 1', 'old-men-1', 32, 12.33, 'Nisi tellus ipsum sed aenean semper tellus porttitor lorem. Eiusmod lorem semper. Dolor porttitor. Lorem eiusmod. Consectetur ipsum elit porttitor semper sed elit elementum. Elit eiusmod sit ipsum aenean nisi elit sed. Elit sit aenean leo. Elementum lorem ipsum tellus. Eiusmod vendor elementum ipsum tellus. Elit vendor sit ipsum dolor nisi elementum dolor eiusmod. Semper leo tellus sit lorem tellus nisi elit tellus. Lorem consectetur. Elementum elit vendor leo ipsum vivamus elit. Consectetur ipsum consectetur sed leo porttitor ipsum tellus leo. Consectetur eiusmod aenean sit. Dolor elementum vivamus tellus lorem. Sit tellus dolor aenean consectetur. Elementum consectetur porttitor lorem ipsum.', 'storage/images/product/ypL8RIj24wphcocDjAmB04LwMWLKa3kfks5nldp8.jpg', '2026-09-29 11:22:31', '2026-09-29 11:22:31'),
(9, 'Old Men 2', 'old-men-2', 21, 21.30, 'Lorem aenean leo eiusmod elit leo. Vendor. Eiusmod ipsum. Porttitor. Leo consectetur aenean vivamus. Elementum consectetur semper ipsum vivamus elit nisi. Sit elementum consectetur. Vendor aenean tellus. Porttitor tellus nisi. Lorem sit dolor consectetur ipsum. Semper. Eiusmod ipsum aenean porttitor. Aenean vivamus aenean lorem semper. Elit eiusmod vivamus. Tellus. Consectetur aenean sed sit leo aenean consectetur. Elit nisi vivamus tellus elit semper dolor lorem. Tellus elit nisi vivamus semper vivamus aenean elit. Aenean elementum porttitor vendor consectetur. Sed elit ipsum sed. Elit semper consectetur porttitor. Leo consectetur tellus vendor porttitor. Ipsum vivamus consectetur lorem semper. Sit. Vivamus consectetur leo. Elit.', 'storage/images/product/qZHCZDcRVatO67ZapDRLQAUon4fAjmiPEDlHRXVT.jpg', '2026-09-29 11:23:02', '2026-09-29 11:23:02'),
(10, 'Old Men 3', 'old-men-3', 21, 21.55, 'Eiusmod sit dolor porttitor elit leo consectetur lorem. Aenean. Ipsum eiusmod ipsum semper sed vivamus tellus ipsum sed. Sit eiusmod elit porttitor sed elementum. Eiusmod consectetur sit ipsum dolor sit. Vendor leo lorem semper nisi eiusmod. Porttitor sed sit vivamus aenean leo. Nisi lorem ipsum lorem ipsum semper. Ipsum leo tellus eiusmod porttitor consectetur porttitor lorem. Elit ipsum vendor sit. Ipsum dolor nisi sit. Semper eiusmod sed ipsum porttitor elit leo sed. Vivamus elit semper. Lorem semper consectetur eiusmod tellus. Porttitor elit dolor sit dolor leo sit semper. Vivamus nisi vendor. Semper leo sed ipsum lorem. Elementum sit aenean. Nisi.', 'storage/images/product/K70aec9MDhHcKOnXZ7YjyRRMi6qWxS5iCrLdwoa7.jpg', '2026-09-29 11:23:41', '2026-09-29 11:23:41');

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
(6, 2, 1, NULL, NULL),
(7, 2, 2, NULL, NULL),
(8, 2, 3, NULL, NULL),
(9, 3, 4, NULL, NULL),
(10, 3, 5, NULL, NULL),
(11, 3, 6, NULL, NULL),
(12, 4, 6, NULL, NULL),
(13, 4, 7, NULL, NULL),
(14, 4, 8, NULL, NULL),
(15, 5, 4, NULL, NULL),
(16, 5, 5, NULL, NULL),
(17, 5, 6, NULL, NULL),
(18, 6, 1, NULL, NULL),
(19, 6, 3, NULL, NULL),
(20, 6, 6, NULL, NULL),
(21, 6, 8, NULL, NULL),
(22, 7, 1, NULL, NULL),
(23, 7, 3, NULL, NULL),
(24, 7, 7, NULL, NULL),
(25, 8, 5, NULL, NULL),
(26, 8, 7, NULL, NULL),
(27, 8, 8, NULL, NULL),
(28, 9, 2, NULL, NULL),
(29, 9, 3, NULL, NULL),
(30, 9, 7, NULL, NULL),
(31, 10, 1, NULL, NULL),
(32, 10, 3, NULL, NULL),
(33, 10, 6, NULL, NULL),
(34, 10, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
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
('6TG5r5qLPRmxpm2KkWkpIFjjhNgz9lUkFQiRYAW4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJpQ3o3VE5TWmF4cFEzdndPTnBrYloxNHFyQ2hQdWsxQ1Z1M1Q5MTBSIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pblwvcHJvZHVjdCIsInJvdXRlIjoiYWRtaW4ucHJvZHVjdC5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxLCJwYXNzd29yZF9oYXNoX3dlYiI6Ijk3OGM4MTRhYjVjMGQ4OWU1MTJjZDgwZWIxMGEwZDRkYzJiMDZjNzY2MWE0NTM2MzdkYjkwZTY5Mzc0YzJiYzQifQ==', 1790691822),
('fz1q7oReQHDwweaKsaT7jDIZBVBuyjMMlgkVmwFL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ0Q3lVdU9SWVJMZ2x2YTY0MVBCam1oRzZuWmZsMllnbEZPSGlBckdkIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pblwvcHJvZHVjdCIsInJvdXRlIjoiYWRtaW4ucHJvZHVjdC5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxLCJwYXNzd29yZF9oYXNoX3dlYiI6Ijk3OGM4MTRhYjVjMGQ4OWU1MTJjZDgwZWIxMGEwZDRkYzJiMDZjNzY2MWE0NTM2MzdkYjkwZTY5Mzc0YzJiYzQifQ==', 1790745336);

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
(1, 'XXS', 'xxs', '2026-09-29 10:24:16', '2026-09-29 10:24:16'),
(2, 'XS', 'xs', '2026-09-29 10:24:22', '2026-09-29 10:24:22'),
(3, 'S', 's', '2026-09-29 10:24:26', '2026-09-29 10:24:26'),
(4, 'M', 'm', '2026-09-29 10:24:32', '2026-09-29 10:24:32'),
(5, 'L', 'l', '2026-09-29 10:24:39', '2026-09-29 10:24:39'),
(6, 'XL', 'xl', '2026-09-29 10:24:45', '2026-09-29 10:24:45'),
(7, 'XXL', 'xxl', '2026-09-29 10:24:50', '2026-09-29 10:24:50'),
(8, 'XXXL', 'xxxl', '2026-09-29 10:24:55', '2026-09-29 10:24:55');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `profile_completed` varchar(255) NOT NULL DEFAULT '0',
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

INSERT INTO `users` (`id`, `name`, `address`, `country`, `zip_code`, `profile_image`, `profile_completed`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sezer Ünalmış', '7329 Pine Blvd', 'Turkey', '84259', NULL, '0', 'admin@email.com', NULL, '$2y$12$7pUsC3Ox8XHdey6jFLX2ieRreAboFAo9gT.WX2sH8V9RfMfF6Ub7m', NULL, NULL, '2026-09-29 08:04:12'),
(2, 'Sezer Ünalmış', NULL, NULL, NULL, NULL, '0', 'unalmissezer@gmail.com', NULL, '$2y$12$uy6ypsSrn/qDplHoM2xgs.Yueb9t25sedNK3YiUiGa0cCpJgSxNvG', NULL, '2026-09-30 10:57:10', '2026-09-30 10:57:10');

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
  ADD PRIMARY KEY (`id`);

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
-- Tablo için AUTO_INCREMENT değeri `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `color_product`
--
ALTER TABLE `color_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
