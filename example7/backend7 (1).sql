-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 16 Eyl 2026, 14:47:16
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
-- Veritabanı: `backend7`
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
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(1, 'man', 'Man', '2026-09-16 04:39:58', '2026-09-16 04:39:58'),
(2, 'women', 'Women', '2026-09-16 04:40:08', '2026-09-16 04:40:08'),
(4, 'kid', 'Kid', '2026-09-16 04:40:39', '2026-09-16 04:44:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `colors`
--

INSERT INTO `colors` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(2, 'red', 'Red', '2026-09-16 04:57:17', '2026-09-16 04:57:17'),
(3, 'green', 'Green', '2026-09-16 04:57:23', '2026-09-16 04:57:23'),
(4, 'blue', 'Blue', '2026-09-16 04:57:29', '2026-09-16 04:57:29'),
(5, 'black', 'Black', '2026-09-16 04:57:36', '2026-09-16 04:57:36');

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
(5, 2, 2, NULL, NULL),
(6, 4, 2, NULL, NULL),
(7, 3, 3, NULL, NULL),
(8, 5, 3, NULL, NULL),
(9, 2, 4, NULL, NULL),
(10, 4, 4, NULL, NULL),
(11, 5, 4, NULL, NULL),
(12, 3, 5, NULL, NULL),
(13, 4, 5, NULL, NULL),
(14, 5, 5, NULL, NULL),
(15, 3, 6, NULL, NULL),
(16, 4, 6, NULL, NULL),
(17, 5, 6, NULL, NULL),
(18, 2, 7, NULL, NULL),
(19, 3, 7, NULL, NULL),
(20, 4, 7, NULL, NULL),
(21, 5, 7, NULL, NULL),
(22, 3, 8, NULL, NULL),
(23, 4, 8, NULL, NULL),
(24, 5, 8, NULL, NULL);

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
(4, '2026_09_15_132017_create_roles_table', 1),
(5, '2026_09_15_132024_create_role_users_table', 1),
(6, '2026_09_16_061807_create_categories_table', 2),
(7, '2026_09_16_061814_create_colors_table', 2),
(8, '2026_09_16_061821_create_sizes_table', 2),
(9, '2026_09_16_061829_create_products_table', 3),
(10, '2026_09_16_061900_create_color_product_table', 3),
(11, '2026_09_16_061914_create_product_size_table', 3),
(12, '2026_09_16_101735_create_personal_access_tokens_table', 4);

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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `slug`, `name`, `category_id`, `description`, `quantity`, `price`, `thumbnail`, `created_at`, `updated_at`) VALUES
(2, 'men-1', 'Men 1', 1, 'Elementum semper tellus nisi semper vivamus consectetur sit vivamus. Eiusmod. Porttitor sed leo elementum porttitor vivamus. Lorem tellus sed consectetur lorem porttitor nisi elit. Leo aenean dolor. Aenean tellus elementum. Vivamus nisi eiusmod elementum tellus leo. Lorem nisi consectetur tellus. Elit sit. Porttitor consectetur elit consectetur semper elit. Sit dolor nisi ipsum tellus eiusmod. Consectetur vivamus. Elementum aenean dolor elementum ipsum porttitor eiusmod. Consectetur lorem sed leo nisi elit consectetur lorem aenean. Nisi consectetur vivamus lorem porttitor tellus porttitor semper dolor. Vendor vivamus elementum. Ipsum sit consectetur porttitor consectetur lorem. Tellus sit tellus elementum leo aenean. Sit lorem dolor elit.', 12, 12.33, 'storage/images/products/yia3xoJbsHZFKXeEJkonUGURdCB4WjS4IO9wkqb1.jpg', '2026-09-16 05:51:56', '2026-09-16 05:51:56'),
(3, 'men-2', 'Men 2', 1, 'Aenean sit porttitor ipsum nisi tellus vendor dolor sit. Elementum leo elit vivamus sed. Nisi lorem. Elementum vendor. Tellus elit aenean porttitor eiusmod vivamus eiusmod lorem tellus. Elementum sed nisi. Eiusmod elit. Vendor vivamus elit tellus. Porttitor aenean semper porttitor. Dolor leo aenean eiusmod sed. Sit nisi tellus. Nisi elit vivamus elementum leo semper. Porttitor sed. Sit leo dolor elementum vivamus aenean vendor. Tellus vendor. Elit. Leo vivamus elementum eiusmod. Leo lorem elit ipsum sed sit vivamus. Ipsum. Nisi semper dolor leo aenean porttitor. Aenean vivamus vendor eiusmod. Lorem eiusmod. Sit leo vendor porttitor nisi aenean. Semper lorem semper sit.', 12, 21.30, 'storage/images/products/j8MJJAVrSuIUPJ34BvnVpjW9SAeCKgbuanEyFZ6Z.jpg', '2026-09-16 05:52:32', '2026-09-16 05:52:32'),
(4, 'women-1', 'Women 1', 2, 'Aenean dolor sed consectetur eiusmod lorem dolor. Consectetur vivamus eiusmod vendor consectetur. Nisi consectetur aenean. Vivamus. Tellus sed. Ipsum nisi consectetur tellus sed elementum sed sit consectetur. Vendor elementum porttitor elementum leo. Nisi eiusmod sed aenean lorem nisi porttitor semper. Elementum elit vendor eiusmod porttitor sed sit tellus. Semper tellus sed consectetur dolor semper. Aenean vivamus sed porttitor sed vivamus consectetur eiusmod semper. Aenean sit porttitor elit porttitor ipsum vendor consectetur nisi. Sed semper vivamus. Aenean sit. Tellus eiusmod lorem. Sit vivamus elit eiusmod. Vendor consectetur nisi elit elementum semper. Leo. Nisi elit vendor nisi sit. Vendor lorem nisi. Sit.', 22, 23.40, 'storage/images/products/I0jQ1KiwN9rq5eFvf0OWOAp1Okoq3Qqme2q52P9a.jpg', '2026-09-16 05:53:01', '2026-09-16 05:53:01'),
(5, 'women-2', 'Women 2', 2, 'Vendor eiusmod elit dolor lorem dolor elit. Tellus vivamus ipsum. Sit leo lorem semper lorem sed semper nisi. Lorem sed elit consectetur lorem sed lorem aenean elit. Sed lorem semper consectetur eiusmod. Aenean porttitor elit vendor dolor vivamus leo elementum. Sed eiusmod dolor leo dolor. Elementum sed elementum eiusmod. Elit. Tellus consectetur elit vivamus sed. Vendor nisi sed semper nisi. Tellus vivamus nisi. Elementum tellus elementum sed elit nisi sed. Porttitor sit aenean leo elementum. Nisi tellus vivamus tellus porttitor tellus. Ipsum dolor ipsum. Sit. Eiusmod semper tellus vendor nisi semper. Ipsum sed vendor elit aenean tellus porttitor. Elit. Porttitor.', 33, 32.10, 'storage/images/products/RVhmGztOxK9dhvYM216buWNrVsK0Bfxe310YNqfw.jpg', '2026-09-16 05:53:23', '2026-09-16 05:53:23'),
(6, 'women-3', 'Women 3', 2, 'Leo tellus elit dolor ipsum elementum ipsum aenean ipsum. Elit semper vendor nisi semper sit tellus. Nisi lorem. Dolor sed dolor. Lorem sit consectetur sit lorem aenean ipsum. Semper eiusmod tellus dolor sit elementum nisi. Consectetur tellus vivamus tellus elementum. Leo tellus. Vivamus semper leo. Semper sed porttitor. Dolor sed. Elit ipsum sit aenean vivamus. Elit. Semper dolor ipsum vivamus sit lorem elit. Aenean elementum dolor eiusmod semper nisi lorem. Consectetur vivamus. Elit vendor elit. Elementum lorem porttitor leo semper. Vivamus sit nisi tellus ipsum. Consectetur ipsum aenean elementum porttitor. Lorem dolor consectetur vendor nisi elementum lorem sed elit. Semper.', 33, 21.55, 'storage/images/products/AipcfHUMZdzR8Rf8Kq52VJGnunRUC9v5oOCNpObz.jpg', '2026-09-16 05:53:55', '2026-09-16 05:53:55'),
(7, 'kid-1', 'Kid 1', 4, 'Elementum porttitor nisi ipsum dolor aenean ipsum. Vendor elit sit. Tellus vendor sit elit dolor. Sit dolor porttitor. Aenean consectetur eiusmod vivamus consectetur elementum leo vendor aenean. Sed tellus elit. Semper vendor vivamus eiusmod elementum. Tellus. Elementum eiusmod aenean elementum eiusmod dolor. Nisi porttitor tellus lorem ipsum sed. Dolor sed dolor sed semper elit. Dolor. Aenean. Vivamus vendor aenean lorem leo semper elementum. Ipsum leo vendor aenean elit sit tellus. Dolor leo. Elementum nisi sit elementum vendor sit vivamus lorem eiusmod. Elementum elit porttitor semper elit sed ipsum. Vendor nisi. Sed elit eiusmod sed elementum tellus. Vendor elit nisi. Vivamus.', 21, 44.10, 'storage/images/products/U8qL3wdWXvUq6z14kQWiAl7quHjE5Fl21vIoKK4v.jpg', '2026-09-16 05:54:28', '2026-09-16 05:54:28'),
(8, 'kid-2', 'Kid 2', 4, 'Semper dolor tellus semper eiusmod. Tellus. Sed eiusmod semper. Nisi. Eiusmod tellus. Nisi vendor semper sed semper aenean. Sed consectetur eiusmod leo elementum ipsum. Tellus ipsum sed elementum. Tellus elit dolor consectetur. Ipsum vendor ipsum. Sit. Sed dolor ipsum sed aenean vivamus. Eiusmod ipsum dolor eiusmod vivamus sed. Aenean porttitor sit leo eiusmod sit. Lorem semper. Nisi sed leo vivamus. Elit ipsum lorem porttitor leo. Dolor sed sit nisi sit. Aenean leo. Dolor elit consectetur dolor ipsum vivamus elit sed vivamus. Leo semper leo. Elit vivamus leo consectetur dolor tellus vendor. Sed vivamus vendor lorem elementum lorem semper. Lorem. Semper.', 34, 32.10, 'storage/images/products/srsRwAS929t6PXe7m0AagXTGxpOywWGWegOMxe4d.jpg', '2026-09-16 05:54:58', '2026-09-16 05:54:58');

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
(7, 2, 3, NULL, NULL),
(8, 2, 4, NULL, NULL),
(9, 3, 2, NULL, NULL),
(10, 3, 3, NULL, NULL),
(11, 3, 4, NULL, NULL),
(12, 4, 2, NULL, NULL),
(13, 4, 3, NULL, NULL),
(14, 4, 4, NULL, NULL),
(15, 4, 5, NULL, NULL),
(16, 5, 1, NULL, NULL),
(17, 5, 2, NULL, NULL),
(18, 5, 3, NULL, NULL),
(19, 5, 4, NULL, NULL),
(20, 5, 5, NULL, NULL),
(21, 6, 2, NULL, NULL),
(22, 6, 3, NULL, NULL),
(23, 7, 1, NULL, NULL),
(24, 7, 2, NULL, NULL),
(25, 7, 3, NULL, NULL),
(26, 7, 4, NULL, NULL),
(27, 7, 5, NULL, NULL),
(28, 8, 1, NULL, NULL),
(29, 8, 2, NULL, NULL),
(30, 8, 3, NULL, NULL),
(31, 8, 4, NULL, NULL);

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
(1, 'admin', NULL, NULL),
(2, 'editor', NULL, NULL);

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
('jcPRXm9hoLFNxUG9qSxCXhpJsrjxYyXlKG3x9yVX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ4a3ZhbXlPSTBuMzFoNXVkaExCeXR2ODN6amlkRllBbzhYcWpJRHhmIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pblwvcHJvZHVjdCIsInJvdXRlIjoiYWRtaW4ucHJvZHVjdC5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxfQ==', 1789556821);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sizes`
--

INSERT INTO `sizes` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(1, 'xs', 'XS', '2026-09-16 04:57:47', '2026-09-16 04:57:58'),
(2, 's', 'S', '2026-09-16 04:58:05', '2026-09-16 04:58:05'),
(3, 'm', 'M', '2026-09-16 04:58:12', '2026-09-16 04:58:12'),
(4, 'l', 'L', '2026-09-16 04:58:18', '2026-09-16 04:58:18'),
(5, 'xl', 'XL', '2026-09-16 04:58:23', '2026-09-16 04:58:23');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
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

INSERT INTO `users` (`id`, `name`, `country`, `address`, `zip_code`, `profile_image`, `profile_completed`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sezer Unalmis', 'Turkei', '5849 Oak Ln', '87201', '', 0, 'admin@email.com', NULL, '$2y$12$7ZQz9DS8QF.yh4SeHjLbSulXAcOPQ4IblK0JsoUrD8Wqdus7SbzYm', NULL, NULL, '2026-09-15 10:58:22');

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
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `color_product`
--
ALTER TABLE `color_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
