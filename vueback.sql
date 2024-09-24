-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2024 at 06:13 AM
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
-- Database: `vueback`
--

-- --------------------------------------------------------

--
-- Table structure for table `baskets`
--

CREATE TABLE `baskets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_price` decimal(5,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `baskets`
--

INSERT INTO `baskets` (`id`, `created_at`, `updated_at`, `total_price`, `user_id`) VALUES
(1, '2024-09-24 01:24:42', '2024-09-24 01:24:42', 320.00, 4),
(2, '2024-09-24 01:25:18', '2024-09-24 01:25:18', 643.00, 4),
(3, '2024-09-24 01:26:28', '2024-09-24 01:26:28', 643.00, 4),
(4, '2024-09-24 01:28:21', '2024-09-24 01:28:21', 643.00, 4),
(5, '2024-09-24 01:31:02', '2024-09-24 01:31:02', 323.00, 4),
(6, '2024-09-24 01:35:37', '2024-09-24 01:35:37', 640.00, 4);

-- --------------------------------------------------------

--
-- Table structure for table `basket_item`
--

CREATE TABLE `basket_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `basket_id` bigint(20) UNSIGNED NOT NULL,
  `song_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basket_item`
--

INSERT INTO `basket_item` (`id`, `created_at`, `updated_at`, `basket_id`, `song_id`, `qty`) VALUES
(1, '2024-09-24 01:28:21', '2024-09-24 01:28:21', 4, 6, 1),
(2, '2024-09-24 01:28:21', '2024-09-24 01:28:21', 4, 9, 1),
(3, '2024-09-24 01:31:02', '2024-09-24 01:31:02', 5, 9, 1),
(4, '2024-09-24 01:35:37', '2024-09-24 01:35:37', 6, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `genre_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `created_at`, `updated_at`, `genre_name`) VALUES
(1, '2024-08-30 23:21:28', '2024-08-30 23:21:28', 'Pop'),
(2, '2024-08-30 23:21:28', '2024-08-30 23:21:28', 'Electronic'),
(3, '2024-08-30 23:21:28', '2024-08-30 23:21:28', 'Trance'),
(4, '2024-08-30 23:21:28', '2024-08-30 23:21:28', 'DnB'),
(5, '2024-08-30 23:21:28', '2024-08-30 23:21:28', 'Afro'),
(6, '2024-08-30 23:21:28', '2024-08-30 23:21:28', 'House'),
(7, '2024-08-30 23:21:28', '2024-08-30 23:21:28', 'Techno');

-- --------------------------------------------------------

--
-- Table structure for table `genre_song`
--

CREATE TABLE `genre_song` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `song_id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genre_song`
--

INSERT INTO `genre_song` (`id`, `created_at`, `updated_at`, `song_id`, `genre_id`) VALUES
(7, NULL, NULL, 6, 1),
(8, NULL, NULL, 6, 2),
(9, NULL, NULL, 6, 3),
(12, NULL, NULL, 8, 1),
(13, NULL, NULL, 8, 2),
(14, NULL, NULL, 8, 3),
(15, NULL, NULL, 9, 1),
(16, NULL, NULL, 9, 5),
(17, NULL, NULL, 9, 2),
(18, NULL, NULL, 9, 6),
(19, NULL, NULL, 9, 3),
(20, NULL, NULL, 10, 3),
(21, NULL, NULL, 10, 6),
(23, NULL, NULL, 8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
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
(7, '2024_08_30_234504_create_roles_table', 1),
(25, '0001_01_01_000001_create_cache_table', 2),
(26, '0001_01_01_000002_create_jobs_table', 2),
(27, '2024_08_30_234501_create_users_table', 2),
(28, '2024_08_30_234516_create_genres_table', 2),
(29, '2024_08_30_234614_create_songs_table', 2),
(30, '2024_08_30_234620_create_song_genre_table', 2),
(31, '2024_08_30_234640_create_song_like_table', 2),
(32, '2024_08_30_234649_create_prices_table', 2),
(33, '2024_08_30_234704_create_baskets_table', 2),
(34, '2024_08_30_234708_create_basket_item_table', 2),
(35, '2024_08_31_002453_create_personal_access_tokens_table', 3),
(36, '2024_08_31_010031_create_sessions_table', 4),
(37, '2024_09_10_164009_add_img_to_songs', 5),
(38, '2024_09_10_165505_rename_column_in_table', 6),
(39, '2024_09_10_170321_rename_song_genre_table', 7),
(40, '2024_09_10_170544_rename_column_in_table', 8),
(41, '2024_09_10_170726_rename_column_in_table', 9),
(42, '2024_09_10_171324_remove_date_column_from_prices_table', 10),
(43, '2024_09_23_165652_add_new_column_to_songs_table', 11),
(44, '2024_09_24_014853_add_new_column_to_basket_item_table', 12),
(45, '2024_09_24_021057_add_new_column_to_baskets_table', 13),
(46, '2024_09_24_022305_drop_date_from_baskets_table', 14);

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
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` decimal(5,2) NOT NULL,
  `song_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `created_at`, `updated_at`, `price`, `song_id`) VALUES
(1, '2024-09-10 16:14:17', '2024-09-10 16:14:17', 320.00, 6),
(2, '2024-09-11 00:14:44', '2024-09-11 00:14:44', 323.00, 8),
(3, '2024-09-11 15:17:37', '2024-09-11 15:17:37', 1.00, 8),
(4, '2024-09-12 00:03:44', '2024-09-12 00:03:44', 323.00, 9),
(5, '2024-09-12 00:06:09', '2024-09-12 00:06:09', 323.00, 10),
(6, '2024-09-23 14:56:22', '2024-09-23 14:56:22', 131.00, 8);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `role_name`) VALUES
(1, '2024-08-30 23:22:51', '2024-08-30 23:22:51', 'Artist'),
(2, '2024-08-30 23:22:51', '2024-08-30 23:22:51', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('EqBJvLCIjOd0OltwqkF7IQgebvVdjT25edsh0uwH', NULL, '127.0.0.1', 'PostmanRuntime/7.40.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGh3VUhBMU81NkN3ejQycnhOa0ZOOVpobGJOTmlZZjNMZ29YNWZEViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1725066845),
('lqFFYA3dmjBT5QxFKQ0qmP3D3aLqoUo4lzwwHQ86', NULL, '127.0.0.1', 'PostmanRuntime/7.41.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjZCVFU2T2pva0g1YTVMbTEyUXRqd1FwUE1lTmdZUVJsamVpMGRhayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1725919017),
('oxzDa7osu3SpPPKKLsqTKwPiHKVkTfRvetSDRapT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1dORTd6YUZaSzZyQVZNWUs2dnRrUHJjdnRaM3hUWUgyZHo2Z0RlOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1726067788);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `created_at`, `updated_at`, `name`, `user_id`, `image`, `deleted`) VALUES
(6, '2024-09-10 16:14:17', '2024-09-10 16:14:17', 'PROBA', 1, 'https://fastly.picsum.photos/id/936/200/200.jpg?hmac=IL7mo8CcTgJAO1CveVd2nT25CdqAuZ-htB7FYFW-4gQ', 0),
(8, '2024-09-11 00:14:44', '2024-09-23 16:01:32', 'ProbaVueEdit', 4, 'https://fastly.picsum.photos/id/432/200/200.jpg?hmac=b4-kxXh_oTpvCBH9hueJurvHDdhy0eYNNba-mO9Q8bU', 1),
(9, '2024-09-12 00:03:44', '2024-09-12 00:03:44', 'ProbaVue', 4, 'https://fastly.picsum.photos/id/432/200/200.jpg?hmac=b4-kxXh_oTpvCBH9hueJurvHDdhy0eYNNba-mO9Q8bU', 0),
(10, '2024-09-12 00:06:09', '2024-09-23 16:09:29', 'ProbaVue2', 4, 'https://fastly.picsum.photos/id/432/200/200.jpg?hmac=b4-kxXh_oTpvCBH9hueJurvHDdhy0eYNNba-mO9Q8bU', 1);

-- --------------------------------------------------------

--
-- Table structure for table `song_like`
--

CREATE TABLE `song_like` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `song_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `song_like`
--

INSERT INTO `song_like` (`id`, `created_at`, `updated_at`, `song_id`, `user_id`) VALUES
(1, '2024-09-22 16:56:24', '2024-09-22 16:56:27', 8, 3),
(2, '2024-09-22 16:56:28', '2024-09-22 16:56:29', 8, 6),
(3, '2024-09-24 02:20:48', '2024-09-24 02:20:48', 6, 4),
(4, '2024-09-24 02:21:33', '2024-09-24 02:21:33', 6, 4),
(5, '2024-09-24 02:23:25', '2024-09-24 02:23:25', 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `username`, `email`, `password`, `role_id`) VALUES
(1, '2024-08-31 00:21:49', '2024-08-31 00:21:49', 'proba', 'proba@gmail.com', '$2y$12$eh52unq3l4pbn1KsdFTKZO8nqD7fXO6y53KKdO6VqyzeI562lFW1m', 2),
(2, '2024-09-09 20:38:59', '2024-09-09 20:38:59', 'alen', 'proba22@gmail.com', '$2y$12$rcWlpjDBdYF3XapTssV6t.OUZC9gfCTP4Gt3vFUMZ5fOSJFxZufEe', 2),
(3, '2024-09-09 20:59:32', '2024-09-09 20:59:32', 'alen33', 'wwewwe@gmail.com', '$2y$12$GeSDZ.ZmFgcK.zWaV3UHKuAyFLWMzFJrpmz7NpNu9Opwv1589Tgga', 2),
(4, '2024-09-09 21:18:32', '2024-09-09 21:18:32', 'alen1312', 'alen1312@gmail.com', '$2y$12$6AimFgXQljwmpmGpTexAS.fUkMQA515h9pkqztxwfPFFMEZStiCoe', 1),
(5, '2024-09-09 22:45:02', '2024-09-09 22:45:02', 'proba1312', 'proba1312@gmail.com', '$2y$12$/rqu6EXFCc5mWYS08D9trO7lfXH0RW3amJm6HDcP2RYppdrSVXVP2', 2),
(6, '2024-09-11 22:06:02', '2024-09-11 22:06:02', 'probaprobaproba', 'probaprobaproba@gmail.com', '$2y$12$aqqtuGhyhfY24igLrneWoedCqgJZNTByPt9ka9Faj5a.dlkkkobNm', 2),
(7, '2024-09-24 01:48:41', '2024-09-24 01:48:41', 'alen99', 'alen99@gmail.com', '$2y$12$vxXKiTCNe5aLUSNwg0TdxOugLRgM1gIqu.GkUDUvbKXElg7j4VeRW', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baskets`
--
ALTER TABLE `baskets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `baskets_user_id_foreign` (`user_id`);

--
-- Indexes for table `basket_item`
--
ALTER TABLE `basket_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basket_item_basket_id_foreign` (`basket_id`),
  ADD KEY `basket_item_song_id_foreign` (`song_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `genres_genre_name_unique` (`genre_name`);

--
-- Indexes for table `genre_song`
--
ALTER TABLE `genre_song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `song_genre_songs_id_foreign` (`song_id`),
  ADD KEY `song_genre_genres_id_foreign` (`genre_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prices_song_id_foreign` (`song_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_name_unique` (`role_name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `songs_artist_foreign` (`user_id`);

--
-- Indexes for table `song_like`
--
ALTER TABLE `song_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `song_like_song_id_foreign` (`song_id`),
  ADD KEY `song_like_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baskets`
--
ALTER TABLE `baskets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `basket_item`
--
ALTER TABLE `basket_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `genre_song`
--
ALTER TABLE `genre_song`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `song_like`
--
ALTER TABLE `song_like`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baskets`
--
ALTER TABLE `baskets`
  ADD CONSTRAINT `baskets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `basket_item`
--
ALTER TABLE `basket_item`
  ADD CONSTRAINT `basket_item_basket_id_foreign` FOREIGN KEY (`basket_id`) REFERENCES `baskets` (`id`),
  ADD CONSTRAINT `basket_item_song_id_foreign` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`);

--
-- Constraints for table `genre_song`
--
ALTER TABLE `genre_song`
  ADD CONSTRAINT `song_genre_genres_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  ADD CONSTRAINT `song_genre_songs_id_foreign` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`);

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_song_id_foreign` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_artist_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `song_like`
--
ALTER TABLE `song_like`
  ADD CONSTRAINT `song_like_song_id_foreign` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`),
  ADD CONSTRAINT `song_like_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
