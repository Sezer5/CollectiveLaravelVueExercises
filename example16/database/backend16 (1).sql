-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 23 Kas 2026, 13:37:14
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
-- Veritabanı: `backend16`
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
(2, 'man', 'Man', '2026-11-20 10:32:14', '2026-11-20 11:18:34'),
(3, 'old-man', 'Old Man', '2026-11-20 11:18:41', '2026-11-20 11:18:41'),
(4, 'woman', 'Woman', '2026-11-20 11:18:48', '2026-11-20 11:18:48'),
(5, 'old-woman', 'Old Woman', '2026-11-20 11:18:55', '2026-11-20 11:18:55'),
(6, 'girl-kid', 'Girl Kid', '2026-11-20 11:19:02', '2026-11-20 11:19:02'),
(7, 'boy-kid', 'Boy Kid', '2026-11-20 11:19:09', '2026-11-20 11:19:09');

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
(2, 'red', 'Red', '2026-11-20 10:36:00', '2026-11-20 10:36:00'),
(3, 'green', 'Green', '2026-11-20 11:19:17', '2026-11-20 11:19:17'),
(4, 'blue', 'Blue', '2026-11-20 11:19:23', '2026-11-20 11:19:23'),
(5, 'gray', 'Gray', '2026-11-20 11:19:31', '2026-11-20 11:19:31'),
(6, 'orange', 'Orange', '2026-11-20 11:19:38', '2026-11-20 11:19:38'),
(7, 'purple', 'Purple', '2026-11-20 11:19:44', '2026-11-20 11:19:44'),
(8, 'black', 'Black', '2026-11-20 11:19:52', '2026-11-20 11:19:52'),
(9, 'brown', 'Brown', '2026-11-20 11:20:15', '2026-11-20 11:20:15');

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
(10, 2, 2, NULL, NULL),
(11, 4, 2, NULL, NULL),
(12, 6, 2, NULL, NULL),
(13, 9, 3, NULL, NULL),
(14, 6, 3, NULL, NULL),
(15, 2, 3, NULL, NULL),
(16, 8, 3, NULL, NULL),
(17, 7, 3, NULL, NULL),
(18, 4, 3, NULL, NULL),
(19, 3, 3, NULL, NULL),
(20, 5, 3, NULL, NULL),
(21, 6, 4, NULL, NULL),
(22, 7, 4, NULL, NULL),
(23, 5, 4, NULL, NULL),
(24, 9, 4, NULL, NULL),
(25, 2, 4, NULL, NULL),
(26, 4, 4, NULL, NULL),
(27, 3, 4, NULL, NULL),
(28, 8, 4, NULL, NULL),
(29, 5, 5, NULL, NULL),
(30, 8, 5, NULL, NULL),
(31, 6, 6, NULL, NULL),
(32, 4, 6, NULL, NULL),
(33, 2, 6, NULL, NULL),
(34, 8, 6, NULL, NULL),
(35, 6, 7, NULL, NULL),
(36, 9, 7, NULL, NULL),
(37, 3, 8, NULL, NULL),
(38, 7, 8, NULL, NULL),
(39, 5, 8, NULL, NULL),
(40, 4, 8, NULL, NULL),
(41, 8, 8, NULL, NULL),
(42, 2, 8, NULL, NULL),
(43, 6, 8, NULL, NULL),
(44, 9, 8, NULL, NULL),
(45, 9, 9, NULL, NULL),
(46, 3, 9, NULL, NULL),
(47, 7, 9, NULL, NULL),
(48, 8, 9, NULL, NULL),
(49, 4, 9, NULL, NULL),
(50, 5, 9, NULL, NULL),
(51, 6, 9, NULL, NULL),
(52, 7, 10, NULL, NULL),
(53, 2, 10, NULL, NULL),
(54, 3, 10, NULL, NULL),
(55, 8, 10, NULL, NULL),
(56, 6, 10, NULL, NULL),
(57, 9, 10, NULL, NULL),
(58, 5, 10, NULL, NULL),
(59, 3, 11, NULL, NULL),
(60, 8, 11, NULL, NULL),
(61, 5, 11, NULL, NULL),
(62, 7, 11, NULL, NULL),
(63, 6, 11, NULL, NULL),
(64, 2, 11, NULL, NULL),
(65, 4, 11, NULL, NULL),
(66, 9, 11, NULL, NULL),
(67, 5, 12, NULL, NULL),
(68, 4, 12, NULL, NULL),
(69, 7, 12, NULL, NULL),
(70, 6, 12, NULL, NULL),
(71, 9, 12, NULL, NULL),
(72, 8, 12, NULL, NULL),
(73, 7, 13, NULL, NULL),
(74, 9, 13, NULL, NULL),
(75, 2, 13, NULL, NULL),
(76, 8, 13, NULL, NULL),
(77, 2, 14, NULL, NULL),
(78, 9, 14, NULL, NULL),
(79, 8, 14, NULL, NULL),
(80, 6, 14, NULL, NULL),
(81, 7, 14, NULL, NULL),
(82, 4, 14, NULL, NULL),
(83, 5, 14, NULL, NULL),
(84, 3, 14, NULL, NULL),
(85, 7, 15, NULL, NULL),
(86, 6, 15, NULL, NULL),
(87, 4, 15, NULL, NULL),
(88, 9, 15, NULL, NULL),
(89, 5, 16, NULL, NULL),
(90, 2, 16, NULL, NULL),
(91, 9, 16, NULL, NULL),
(92, 7, 16, NULL, NULL),
(93, 4, 16, NULL, NULL),
(94, 8, 16, NULL, NULL),
(95, 9, 17, NULL, NULL),
(96, 8, 17, NULL, NULL),
(97, 6, 17, NULL, NULL),
(98, 7, 17, NULL, NULL),
(99, 2, 17, NULL, NULL),
(100, 4, 18, NULL, NULL),
(101, 7, 18, NULL, NULL),
(102, 6, 18, NULL, NULL),
(103, 3, 18, NULL, NULL),
(104, 8, 18, NULL, NULL),
(105, 8, 19, NULL, NULL),
(106, 9, 19, NULL, NULL),
(107, 2, 19, NULL, NULL),
(108, 6, 19, NULL, NULL),
(109, 9, 20, NULL, NULL),
(110, 4, 20, NULL, NULL),
(111, 8, 20, NULL, NULL),
(112, 7, 20, NULL, NULL),
(113, 9, 21, NULL, NULL),
(114, 3, 21, NULL, NULL),
(115, 7, 21, NULL, NULL),
(116, 4, 22, NULL, NULL),
(117, 9, 22, NULL, NULL),
(118, 2, 23, NULL, NULL),
(119, 6, 23, NULL, NULL),
(120, 4, 23, NULL, NULL),
(121, 9, 23, NULL, NULL),
(122, 7, 23, NULL, NULL),
(123, 6, 24, NULL, NULL),
(124, 4, 24, NULL, NULL),
(125, 5, 24, NULL, NULL),
(126, 2, 24, NULL, NULL),
(127, 3, 24, NULL, NULL),
(128, 8, 24, NULL, NULL),
(129, 7, 24, NULL, NULL),
(130, 9, 24, NULL, NULL),
(131, 7, 25, NULL, NULL),
(132, 3, 25, NULL, NULL),
(133, 8, 25, NULL, NULL),
(134, 5, 26, NULL, NULL),
(135, 6, 26, NULL, NULL),
(136, 7, 26, NULL, NULL),
(137, 2, 26, NULL, NULL),
(138, 8, 26, NULL, NULL),
(139, 4, 26, NULL, NULL),
(140, 5, 27, NULL, NULL),
(141, 9, 27, NULL, NULL),
(142, 2, 27, NULL, NULL),
(143, 9, 28, NULL, NULL),
(144, 5, 28, NULL, NULL),
(145, 6, 28, NULL, NULL),
(146, 3, 28, NULL, NULL),
(147, 3, 29, NULL, NULL),
(148, 2, 29, NULL, NULL),
(149, 9, 29, NULL, NULL),
(150, 5, 29, NULL, NULL),
(151, 6, 30, NULL, NULL),
(152, 9, 30, NULL, NULL),
(153, 4, 30, NULL, NULL),
(154, 8, 30, NULL, NULL),
(155, 5, 30, NULL, NULL),
(156, 3, 30, NULL, NULL),
(157, 7, 31, NULL, NULL),
(158, 9, 31, NULL, NULL),
(159, 2, 31, NULL, NULL),
(160, 8, 31, NULL, NULL),
(161, 5, 31, NULL, NULL),
(162, 6, 31, NULL, NULL),
(163, 8, 32, NULL, NULL),
(164, 9, 32, NULL, NULL);

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
(4, '2026_11_20_060241_create_roles_table', 1),
(5, '2026_11_20_060302_create_role_user_table', 1),
(6, '2026_11_20_060739_create_personal_access_tokens_table', 1),
(7, '2026_11_20_080731_create_categories_table', 1),
(8, '2026_11_20_080738_create_colors_table', 1),
(9, '2026_11_20_080744_create_sizes_table', 1),
(10, '2026_11_20_080754_create_products_table', 1),
(11, '2026_11_20_080819_create_color_product_table', 1),
(12, '2026_11_20_080839_create_product_size_table', 1);

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
  `thumbnail` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `slug`, `name`, `thumbnail`, `description`, `quantity`, `price`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 'men-1', 'Men 1', 'storage/images/products/YgCV70niqtD5AslRVqx9iEciD5YxZqzSaWob3Qts.jpg', 'Vendor elit nisi elit aenean dolor tellus. Dolor. Vendor vivamus sit lorem leo ipsum aenean vivamus. Eiusmod tellus elit vendor. Dolor leo elit lorem elementum. Aenean nisi. Semper eiusmod porttitor. Vendor porttitor leo semper nisi lorem. Vendor porttitor vendor sed. Consectetur tellus elementum leo semper. Tellus leo lorem consectetur eiusmod. Porttitor lorem porttitor elit. Elementum. Sit consectetur lorem sed semper elementum consectetur leo. Eiusmod sit vivamus elit nisi consectetur sit leo elementum. Semper elit aenean porttitor aenean. Vendor. Consectetur sit tellus. Leo ipsum dolor sit leo sed leo. Sed vivamus. Sed elementum semper elementum leo. Nisi ipsum vendor. Porttitor. Ipsum.', 12, 12.33, 2, '2026-11-20 11:44:31', '2026-11-20 11:44:31'),
(3, 'quo-ab2', 'Quo ab2', 'storage/images/products/nsmtoXcliwjj93BslsiPLMyNRAnFQdI8Qvfvvef1.jpg', 'Quas nam recusandae reprehenderit voluptatum. Voluptatibus aperiam consequatur ad recusandae beatae qui. Rem incidunt tempora ut quia numquam impedit veritatis.', 22, 979.08, 2, '2026-11-23 02:42:40', '2026-11-23 02:44:09'),
(4, 'explicabo-aut2', 'Explicabo aut2', 'storage/images/products/oEioHZxGQLW37ZpyCSTfZZHDfWWQljqGr5a6Gn5q.jpg', 'Dolor tempora voluptas est consequuntur sint tenetur. Repellendus voluptatem ut minima ad libero placeat a suscipit. Impedit exercitationem itaque tempore eos. Suscipit accusantium voluptatem consectetur voluptatum sint.', 85, 310.78, 3, '2026-11-23 02:42:40', '2026-11-23 02:44:24'),
(5, 'aut-dolorum2', 'Aut dolorum2', 'storage/images/products/vQp1clFx3q4DGgHVc8nJ0qt7YqycMSDXKo9oy6uR.jpg', 'Velit minus maiores exercitationem at. Odit quam totam doloremque tenetur consequatur est. Facilis aut dolor autem et qui sint.', 87, 649.14, 7, '2026-11-23 02:42:40', '2026-11-23 02:44:43'),
(6, 'totam-sequi2', 'Totam sequi2', 'storage/images/products/6uBP2kulKwtVEABNOtFms3edmn9L2OumLguaiufC.jpg', 'Quo dolor voluptate aut quia qui veritatis. Ullam expedita sed quo modi sint quae. Aut ut porro qui voluptatem aut quia. Voluptas maiores eaque eaque nesciunt recusandae.', 15, 537.67, 6, '2026-11-23 02:42:40', '2026-11-23 02:46:05'),
(7, 'et-incidunt2', 'Et incidunt2', 'storage/images/products/iOvZiUCsGHutaTCBc7KE9aDyqCd7y8nvZdOF9oMg.jpg', 'In illum qui et exercitationem. Iure esse deserunt accusantium sequi dolores omnis. At saepe aut et aut provident voluptatem exercitationem. Distinctio quos quibusdam nihil sint.', 8, 214.22, 7, '2026-11-23 02:42:40', '2026-11-23 02:47:09'),
(8, 'sit-fugit2', 'Sit fugit2', 'storage/images/products/IngL2yQVH8a6jY5GclyvdSEP7DvFyaz8tyDkL0Y3.jpg', 'Sed repellat et sequi eaque blanditiis ut. Quia quam perferendis sunt laborum quam.', 39, 91.50, 5, '2026-11-23 02:42:40', '2026-11-23 02:47:23'),
(9, 'repellat-at2', 'Repellat at2', 'storage/images/products/oFEGeNz8DR7rLXYJthShW5FNXR6uHEPkxk0WQ9Z1.jpg', 'Qui saepe quis voluptatem blanditiis illo in omnis illum. Voluptas eos temporibus quia culpa nostrum qui maxime. Vero aut alias et deleniti voluptatem minima consequatur. Ipsam voluptatibus architecto rerum earum dolor. Velit esse autem qui nam.', 90, 969.92, 5, '2026-11-23 02:42:40', '2026-11-23 02:47:41'),
(10, 'excepturi-voluptatem2', 'Excepturi voluptatem2', 'storage/images/products/kLBV8Sl9gbRAv7oIIysQUfEnovfn3K80EkwFTCZt.jpg', 'Recusandae sed a explicabo et iste in. Voluptatem consectetur quas ut velit aut ad possimus. Impedit corporis non aliquid commodi sed maxime. Vel dignissimos nihil saepe ut repellat.', 36, 390.82, 5, '2026-11-23 02:42:40', '2026-11-23 02:47:56'),
(11, 'exercitationem-quisquam2', 'Exercitationem quisquam2', 'storage/images/products/jTwpAi99jJDRUlfvGSz6RSZEfYzl2HQZQOcGfDHA.jpg', 'Illum qui enim nam expedita nostrum doloremque. Distinctio assumenda vitae perferendis nemo repellat maiores necessitatibus maiores.', 78, 387.37, 4, '2026-11-23 02:42:40', '2026-11-23 02:48:07'),
(12, 'et-nobis2', 'Et nobis2', 'storage/images/products/QWerqlDYq3WPwJfCsS92NmB4Ifh1j54EmNDz2jN6.jpg', 'Voluptas aut sed voluptas quibusdam at. Nobis facilis sunt nihil. Est voluptates ad exercitationem voluptatum voluptate maxime nulla.', 44, 405.10, 5, '2026-11-23 02:42:40', '2026-11-23 02:48:21'),
(13, 'minus-soluta3', 'Minus soluta3', 'storage/images/products/KuzHM2fUfNU0mZld3pyrECyvMslY68Y6LvYb88kt.jpg', 'Culpa quibusdam quos itaque sit error deserunt assumenda unde. Debitis quos commodi porro occaecati earum ad ea earum.', 43, 844.50, 4, '2026-11-23 02:42:40', '2026-11-23 02:48:34'),
(14, 'et-ipsa2', 'Et ipsa2', 'storage/images/products/mSr0APl2b3iFj3G1kJXBe9TCVdpFwKNo1j8uB2H7.jpg', 'Nemo velit non eaque est necessitatibus velit. Suscipit earum velit expedita non animi quae. Et dignissimos ut reiciendis dolor molestiae.', 59, 109.17, 2, '2026-11-23 02:42:40', '2026-11-23 02:48:52'),
(15, 'nihil-nesciunt1', 'Nihil nesciunt1', 'storage/images/products/yhVFGgkCM1mAV1Z7ZLVn78Um3VPxgBkjEx5tpENw.jpg', 'Soluta culpa aut soluta nulla. Non id numquam fugiat qui in iste voluptatem. Qui dolores natus modi rem quia rerum. Sit explicabo voluptatem in suscipit occaecati.', 59, 574.51, 7, '2026-11-23 02:42:40', '2026-11-23 02:49:07'),
(16, 'aspernatur-nihil2', 'Aspernatur nihil2', 'storage/images/products/utXSjnxvlf1uleqzziXQlQmx6n3HQcf9JGCmxtpD.jpg', 'Quia eveniet error exercitationem quisquam. Sit molestias exercitationem earum accusantium rem corporis voluptas.', 71, 756.16, 4, '2026-11-23 02:42:40', '2026-11-23 02:49:29'),
(17, 'reprehenderit-voluptatem1', 'Reprehenderit voluptatem1', 'storage/images/products/0P17qgfH6zQlS0hINJ6bFE97Q8uofq6pglUx3Pwr.jpg', 'Voluptatibus cum autem molestiae voluptas. Rerum iusto nam ea placeat. Dolor accusantium officiis voluptatem vel perferendis voluptas mollitia. Occaecati est non alias vero velit dignissimos aspernatur.', 96, 627.78, 3, '2026-11-23 02:42:40', '2026-11-23 02:49:43'),
(18, 'aut-quos2', 'Aut quos2', 'storage/images/products/XYHGXjqC8M0yoehJs18mGh1gcLrRMpnV6vIkUufB.jpg', 'Labore rerum quo provident sit cumque a ut. Et tenetur tempore cumque molestias dolorem. Esse fugiat expedita quos voluptas sunt.', 29, 834.44, 4, '2026-11-23 02:42:40', '2026-11-23 02:49:56'),
(19, 'ipsa-atque121', 'Ipsa atque121', 'storage/images/products/QiYFPyvmPCKtoRVW8FXusWCVU5XrxpxMDlMZgmFy.jpg', 'Ipsam eaque saepe aperiam nisi libero praesentium officiis. Illum ut veritatis qui est. Non qui dolor dolore.', 96, 656.21, 7, '2026-11-23 02:42:40', '2026-11-23 02:51:23'),
(20, 'omnis-at2222', 'Omnis at2222', 'storage/images/products/bNDTdxhU2Rz6IFOGyw9Ygotoaw4YgUBld9s9abkg.jpg', 'Et minima est in maxime. Aliquam sunt qui corporis odio occaecati. Et architecto vero eum vel.', 37, 694.26, 2, '2026-11-23 02:42:40', '2026-11-23 02:51:35'),
(21, 'quasi-consequuntur3', 'Quasi consequuntur3', 'storage/images/products/BF57MaS1Yyvne4BaHcSZbfJ1VEUAQZG58IevxY4f.jpg', 'Quibusdam quibusdam enim maxime impedit numquam. Est accusantium quia explicabo praesentium cum. Perferendis et qui ut aut eum quis.', 58, 225.04, 3, '2026-11-23 02:42:40', '2026-11-23 02:51:47'),
(22, 'repellat-rem2', 'Repellat rem2', 'storage/images/products/v5Ygdv3MVCZNhTl2ukN75YeFT3HlRT7u6RhK3vv1.jpg', 'Fugit laudantium omnis ducimus dicta commodi. Necessitatibus praesentium nisi et molestiae. Quis numquam molestiae neque autem. Sint unde libero est non et tenetur aut.', 83, 963.86, 5, '2026-11-23 02:42:40', '2026-11-23 02:51:58'),
(23, 'hic-et2', 'Hic et2', 'storage/images/products/NfKCA4s5SiqugLNyCE9MCUXyg3KX958cosOpI7xK.jpg', 'Qui autem sunt nobis non. Ut rerum sunt dolor dolor eaque ex. Velit nesciunt maxime repellat minima eligendi et minus. Quae harum consequatur sapiente qui.', 38, 747.52, 2, '2026-11-23 02:42:40', '2026-11-23 02:52:12'),
(24, 'veniam-tempore2', 'Veniam tempore2', 'storage/images/products/AQnunpzTXAEMaOEhiNaXMz9yWRtWYF9RgaXAVENH.jpg', 'Vitae eos ipsa sed et similique et deserunt alias. Nihil harum minus numquam est aspernatur. Accusamus illum tempore veritatis.', 54, 15.88, 6, '2026-11-23 02:42:40', '2026-11-23 02:52:27'),
(25, 'error-aut21212', 'Error aut21212', 'storage/images/products/A5s4Zorvg31j3rjnh2O4o7P7nsg7tNlsduluuDny.jpg', 'Enim eos consequatur optio iure dolores voluptatem quas. Qui tempore quaerat suscipit repellat veritatis asperiores. Dignissimos aut et rerum quia officia quia dolor. Odio odio tenetur porro ea minima.', 70, 244.50, 5, '2026-11-23 02:42:40', '2026-11-23 02:52:40'),
(26, 'consequatur-consequatur1234', 'Consequatur consequatur1234', 'storage/images/products/o9SyDcvRDmgSqaZqB1nGbBuFZjDodZta5SFp1GnH.jpg', 'Soluta enim dolor enim autem voluptas iure sed voluptate. Exercitationem ut est totam autem. Maxime rerum voluptatem atque voluptas reprehenderit dolorum est.', 34, 900.83, 6, '2026-11-23 02:42:40', '2026-11-23 02:52:55'),
(27, 'aspernatur-et3', 'Aspernatur et3', 'storage/images/products/v3MO8y3S9kImxlWFRV8Pj8ruGxkyZVKB1j2aTqo2.jpg', 'Id aspernatur consequuntur dolorum quis. Ea animi laboriosam et qui iusto non rem. Enim officia quas non exercitationem odio. Expedita quos molestiae soluta quibusdam non ut.', 73, 904.37, 6, '2026-11-23 02:42:40', '2026-11-23 02:53:09'),
(28, 'ipsam-unde2', 'Ipsam unde2', 'storage/images/products/b9sLIBHo425lxPU1D1Jq3ygAByZrfbs46Um68Zw3.jpg', 'Vel quam sed voluptatem quia vel fugiat. Eum id non doloremque qui autem dolor repellat. Et tenetur et eum sed sequi reprehenderit.', 54, 376.85, 2, '2026-11-23 02:42:40', '2026-11-23 02:51:11'),
(29, 'aliquam-recusandae21', 'Aliquam recusandae21', 'storage/images/products/VzpxyrRk8jx8w6yoeTZ5ZJy0h9QbOo4Jxi00np5l.jpg', 'Nisi sequi cupiditate inventore ea. Dolorum dicta in nihil assumenda. Dolorem veniam aliquam et dicta iste. Et repudiandae totam deleniti ut. Hic odit fuga nulla occaecati consequatur.', 23, 497.78, 7, '2026-11-23 02:42:40', '2026-11-23 02:50:58'),
(30, 'et-corporis33', 'Et corporis33', 'storage/images/products/ASwQTgAI2JDBHcfeXVP3UJWOgGcZ6q26An5sCheO.jpg', 'Sunt nisi laborum eum quisquam nulla voluptatem debitis voluptatibus. Nam non et facilis ut. Libero illum eos aspernatur quae a libero nobis.', 92, 29.63, 6, '2026-11-23 02:42:40', '2026-11-23 02:50:43'),
(31, 'voluptatibus-vero2', 'Voluptatibus vero2', 'storage/images/products/7KjcnGrpRGs8XJwmuzUoQpYWyHmlGL7xOzZtYhpm.jpg', 'Suscipit veritatis ex veritatis voluptatum reiciendis qui cumque. Voluptas illum voluptatibus natus eveniet officiis. Qui officiis sint commodi delectus et atque expedita. Doloribus in delectus nam quasi. Omnis sunt nesciunt qui perferendis voluptas itaque non est.', 1, 171.39, 6, '2026-11-23 02:42:40', '2026-11-23 02:50:27'),
(32, 'tempora-atque3', 'Tempora atque3', 'storage/images/products/hrcamvi8f72yIMAoIO13s2CLdA5VpxsZoJhImrjq.jpg', 'Rerum commodi ut voluptates voluptatem commodi. Quasi et necessitatibus enim quibusdam. Aut assumenda adipisci et omnis.', 46, 839.67, 3, '2026-11-23 02:42:40', '2026-11-23 02:50:12');

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
(10, 2, 5, NULL, NULL),
(11, 2, 6, NULL, NULL),
(12, 2, 7, NULL, NULL),
(13, 3, 6, NULL, NULL),
(14, 3, 5, NULL, NULL),
(15, 3, 7, NULL, NULL),
(16, 4, 7, NULL, NULL),
(17, 4, 6, NULL, NULL),
(18, 4, 4, NULL, NULL),
(19, 5, 4, NULL, NULL),
(20, 5, 7, NULL, NULL),
(21, 5, 5, NULL, NULL),
(22, 5, 2, NULL, NULL),
(23, 5, 3, NULL, NULL),
(24, 5, 6, NULL, NULL),
(25, 6, 4, NULL, NULL),
(26, 6, 7, NULL, NULL),
(27, 6, 3, NULL, NULL),
(28, 6, 2, NULL, NULL),
(29, 6, 6, NULL, NULL),
(30, 7, 2, NULL, NULL),
(31, 7, 3, NULL, NULL),
(32, 8, 6, NULL, NULL),
(33, 8, 3, NULL, NULL),
(34, 8, 2, NULL, NULL),
(35, 8, 5, NULL, NULL),
(36, 8, 7, NULL, NULL),
(37, 8, 4, NULL, NULL),
(38, 9, 4, NULL, NULL),
(39, 9, 5, NULL, NULL),
(40, 10, 6, NULL, NULL),
(41, 10, 3, NULL, NULL),
(42, 10, 5, NULL, NULL),
(43, 10, 2, NULL, NULL),
(44, 11, 7, NULL, NULL),
(45, 11, 6, NULL, NULL),
(46, 12, 5, NULL, NULL),
(47, 12, 4, NULL, NULL),
(48, 12, 3, NULL, NULL),
(49, 12, 7, NULL, NULL),
(50, 12, 6, NULL, NULL),
(51, 13, 4, NULL, NULL),
(52, 13, 7, NULL, NULL),
(53, 13, 3, NULL, NULL),
(54, 13, 2, NULL, NULL),
(55, 14, 3, NULL, NULL),
(56, 14, 7, NULL, NULL),
(57, 14, 2, NULL, NULL),
(58, 15, 2, NULL, NULL),
(59, 15, 7, NULL, NULL),
(60, 15, 3, NULL, NULL),
(61, 15, 4, NULL, NULL),
(62, 15, 5, NULL, NULL),
(63, 15, 6, NULL, NULL),
(64, 16, 6, NULL, NULL),
(65, 16, 7, NULL, NULL),
(66, 16, 3, NULL, NULL),
(67, 16, 4, NULL, NULL),
(68, 16, 2, NULL, NULL),
(69, 16, 5, NULL, NULL),
(70, 17, 3, NULL, NULL),
(71, 17, 6, NULL, NULL),
(72, 17, 7, NULL, NULL),
(73, 18, 6, NULL, NULL),
(74, 18, 5, NULL, NULL),
(75, 19, 6, NULL, NULL),
(76, 19, 2, NULL, NULL),
(77, 19, 3, NULL, NULL),
(78, 19, 7, NULL, NULL),
(79, 19, 5, NULL, NULL),
(80, 20, 3, NULL, NULL),
(81, 20, 7, NULL, NULL),
(82, 21, 7, NULL, NULL),
(83, 21, 6, NULL, NULL),
(84, 21, 3, NULL, NULL),
(85, 22, 2, NULL, NULL),
(86, 22, 4, NULL, NULL),
(87, 22, 5, NULL, NULL),
(88, 22, 6, NULL, NULL),
(89, 22, 3, NULL, NULL),
(90, 22, 7, NULL, NULL),
(91, 23, 4, NULL, NULL),
(92, 23, 3, NULL, NULL),
(93, 23, 5, NULL, NULL),
(94, 24, 4, NULL, NULL),
(95, 24, 5, NULL, NULL),
(96, 24, 2, NULL, NULL),
(97, 24, 3, NULL, NULL),
(98, 24, 6, NULL, NULL),
(99, 24, 7, NULL, NULL),
(100, 25, 3, NULL, NULL),
(101, 25, 6, NULL, NULL),
(102, 25, 4, NULL, NULL),
(103, 25, 2, NULL, NULL),
(104, 25, 7, NULL, NULL),
(105, 25, 5, NULL, NULL),
(106, 26, 3, NULL, NULL),
(107, 26, 4, NULL, NULL),
(108, 26, 2, NULL, NULL),
(109, 26, 5, NULL, NULL),
(110, 26, 6, NULL, NULL),
(111, 26, 7, NULL, NULL),
(112, 27, 7, NULL, NULL),
(113, 27, 2, NULL, NULL),
(114, 27, 6, NULL, NULL),
(115, 28, 7, NULL, NULL),
(116, 28, 5, NULL, NULL),
(117, 28, 4, NULL, NULL),
(118, 28, 2, NULL, NULL),
(119, 28, 3, NULL, NULL),
(120, 29, 2, NULL, NULL),
(121, 29, 4, NULL, NULL),
(122, 29, 6, NULL, NULL),
(123, 30, 6, NULL, NULL),
(124, 30, 7, NULL, NULL),
(125, 30, 4, NULL, NULL),
(126, 30, 3, NULL, NULL),
(127, 30, 2, NULL, NULL),
(128, 30, 5, NULL, NULL),
(129, 31, 7, NULL, NULL),
(130, 31, 3, NULL, NULL),
(131, 31, 6, NULL, NULL),
(132, 31, 5, NULL, NULL),
(133, 31, 4, NULL, NULL),
(134, 31, 2, NULL, NULL),
(135, 32, 7, NULL, NULL),
(136, 32, 6, NULL, NULL),
(137, 32, 5, NULL, NULL),
(138, 32, 3, NULL, NULL);

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
('DBtmGoAZEotBFbba6fmxNF3LkzVaTfLGvvhrJLaU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJObzZSRGJWNDdLVDNLT0Jyc29GaUNEd3lUaVJaZDVFYVVHam91Nkx6IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiY2VkZTIzODdhMjM5NDI3MTYzM2NlZTRiOTdmYTQwZDMwZjNkMTFiNzY0ODEyMTJmYTM3OGYzZmU2YjE3ZGU4YyIsIl9mbGFzaCI6eyJuZXciOltdLCJvbGQiOltdfSwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pblwvcHJvZHVjdCIsInJvdXRlIjoiYWRtaW4ucHJvZHVjdC5pbmRleCJ9fQ==', 1795185920),
('Rojy2DK2mCjUJ7UzZmyWJnBC1zCDwE5vzssz9i63', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJJeXprMDB1cTZranN1UjRFYTlnV0FBUVhES25nQTU0cjR4dDA2SXJHIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pblwvcHJvZHVjdCIsInJvdXRlIjoiYWRtaW4ucHJvZHVjdC5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxLCJwYXNzd29yZF9oYXNoX3dlYiI6ImNlZGUyMzg3YTIzOTQyNzE2MzNjZWU0Yjk3ZmE0MGQzMGYzZDExYjc2NDgxMjEyZmEzNzhmM2ZlNmIxN2RlOGMifQ==', 1795413485);

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
(2, 'xs', 'XS', '2026-11-20 10:40:08', '2026-11-20 10:40:08'),
(3, 's', 'S', '2026-11-20 11:20:24', '2026-11-20 11:20:24'),
(4, 'm', 'M', '2026-11-20 11:20:31', '2026-11-20 11:20:31'),
(5, 'l', 'L', '2026-11-20 11:20:38', '2026-11-20 11:20:38'),
(6, 'xl', 'XL', '2026-11-20 11:20:43', '2026-11-20 11:20:43'),
(7, 'xxl', 'XXL', '2026-11-20 11:20:49', '2026-11-20 11:20:49');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `profile_completed` varchar(255) NOT NULL DEFAULT '0',
  `profile_image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `name`, `profile_completed`, `profile_image`, `address`, `country`, `zip_code`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sezer Ünalmış', '0', 'storage/images/users/uoNOUteyCM31eJRJZP6cNP9OqpQUoMTLJmNsI4Fe.jpg', NULL, NULL, NULL, 'admin@email.com', NULL, '$2y$12$JvQt4Zqi8HeaPIjBfZDTXexNa8d8.d.XY3opkvJHQwIvgNdfSlGXq', NULL, NULL, '2026-11-23 10:36:15');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Tablo için AUTO_INCREMENT değeri `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
