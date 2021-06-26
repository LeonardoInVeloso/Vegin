-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Maio-2021 às 07:23
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `adm_vegin`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-03-20 00:48:10', '2021-03-20 00:48:10'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-03-20 00:48:10', '2021-03-20 00:48:10'),
(3, 1, 3, 'category 3', 'category-3', '2021-04-10 06:53:41', '2021-04-10 06:53:41');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `dish_id`, `created_at`, `updated_at`) VALUES
(1, 'Tasty!!!', 2, 3, '2021-04-10 02:22:05', '2021-04-10 02:22:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `animal_prod` tinyint(4) DEFAULT NULL,
  `animal_tests` tinyint(4) DEFAULT NULL,
  `animal_event` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `companies`
--

INSERT INTO `companies` (`id`, `name`, `animal_prod`, `animal_tests`, `animal_event`, `notes`, `status`, `image`, `created_at`, `updated_at`, `group_id`) VALUES
(1, 'Nabisco', 1, 0, 0, 'Nabisco, cujo nome advém das iniciais de National Biscuit Company, é uma empresa americana fabricante de biscoitos e outros tipos de doces.', 2, 'companies\\April2021\\w3tdMdMgzuX3Ym4GrhWN.png', '2021-04-21 07:29:00', '2021-04-24 03:06:57', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `company_groups`
--

CREATE TABLE `company_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `animal_tests` tinyint(4) DEFAULT NULL,
  `animal_event` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `company_groups`
--

INSERT INTO `company_groups` (`id`, `name`, `image`, `animal_tests`, `animal_event`, `notes`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mondelez International', 'company-groups\\April2021\\vjJ32247RIm3dAJ9hO8l.png', 0, 0, 'Mondelēz International, Inc. é um conglomerado multinacional estadunidense de alimentos.  A empresa fica sediada em Deerfield, Illinois e fabrica chocolates, biscoitos, chicletes, confeitos e bebidas em pó.', 2, '2021-04-21 07:26:20', '2021-04-21 07:26:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `company_group_reports`
--

CREATE TABLE `company_group_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_group_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `company_reports`
--

CREATE TABLE `company_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(66, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(67, 1, 'Location', 'text', 'Location', 0, 0, 0, 0, 0, 0, '{}', 12),
(68, 1, 'last_long', 'text', 'Last Long', 0, 0, 0, 0, 0, 0, '{}', 13),
(69, 1, 'last_lat', 'text', 'Last Lat', 0, 0, 0, 0, 0, 0, '{}', 14),
(70, 1, 'language', 'text', 'Language', 0, 0, 0, 0, 0, 0, '{}', 15),
(77, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(78, 19, 'content', 'text', 'Content', 1, 1, 1, 1, 1, 1, '{}', 2),
(79, 19, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 0, '{}', 3),
(80, 19, 'dish_id', 'text', 'Dish Id', 1, 1, 1, 1, 1, 0, '{}', 4),
(81, 19, 'comment_belongsto_dish_relationship', 'relationship', 'dishes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Dish\",\"table\":\"dishes\",\"type\":\"belongsTo\",\"column\":\"dish_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(83, 19, 'comment_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(84, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(85, 21, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(86, 21, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 3),
(87, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(88, 21, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 5),
(89, 21, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
(90, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(93, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(94, 22, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 5),
(95, 22, 'coordinates', 'coordinates', 'Coordinates', 1, 1, 1, 1, 1, 1, '{}', 2),
(96, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(97, 23, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(98, 23, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 3),
(99, 23, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"omnivore\",\"options\":{\"0\":\"omnivore\",\"1\":\"vegan\",\"2\":\"vegetarian\",\"3\":\"carnivore\"}}', 4),
(100, 23, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 0, '{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}', 5),
(101, 23, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 6),
(102, 23, 'rating', 'text', 'Rating', 0, 1, 1, 0, 1, 0, '{}', 7),
(103, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(104, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(106, 22, 'location_belongsto_establishment_relationship', 'relationship', 'establishments', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Establishment\",\"table\":\"establishments\",\"type\":\"belongsTo\",\"column\":\"establishment_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(107, 22, 'establishment_id', 'text', 'Establishment Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(116, 21, 'dish_belongsto_establishment_relationship', 'relationship', 'Establishments', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Establishment\",\"table\":\"establishments\",\"type\":\"belongsTo\",\"column\":\"establishment_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(117, 21, 'establishment_id', 'text', 'Establishment Id', 1, 1, 1, 1, 1, 1, '{}', 7),
(124, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(125, 25, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(126, 25, 'animal_ing', 'checkbox', 'Animal Ing', 0, 1, 1, 1, 1, 1, '{}', 4),
(127, 25, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 6),
(128, 25, 'barcode_id', 'text', 'Barcode Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(129, 25, 'barcode_format', 'text', 'Barcode Format', 0, 1, 1, 1, 1, 1, '{}', 8),
(130, 25, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"3\":\"checked\"}}', 5),
(131, 25, 'company_id', 'text', 'Company Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(132, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(133, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(134, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(135, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(136, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(137, 26, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(138, 26, 'animal_prod', 'checkbox', 'Animal Prod', 0, 1, 1, 1, 1, 1, '{}', 5),
(139, 26, 'animal_tests', 'checkbox', 'Animal Tests', 0, 1, 1, 1, 1, 1, '{}', 6),
(140, 26, 'animal_event', 'checkbox', 'Animal Event', 0, 1, 1, 1, 1, 1, '{}', 7),
(141, 26, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 8),
(142, 26, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}', 4),
(143, 26, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 3),
(144, 26, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(145, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(146, 25, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 3),
(147, 25, 'product_belongsto_company_relationship', 'relationship', 'companies', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(148, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(149, 27, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(150, 27, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 3),
(151, 27, 'animal_tests', 'checkbox', 'Animal Tests', 0, 1, 1, 1, 1, 1, '{}', 4),
(152, 27, 'animal_event', 'checkbox', 'Animal Event', 0, 1, 1, 1, 1, 1, '{}', 5),
(153, 27, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 6),
(154, 27, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}', 7),
(155, 27, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(156, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(157, 26, 'company_belongsto_company_group_relationship', 'relationship', 'company_groups', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\CompanyGroup\",\"table\":\"company_groups\",\"type\":\"belongsTo\",\"column\":\"group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(158, 26, 'group_id', 'text', 'Group Id', 0, 1, 1, 1, 1, 1, '{}', 11),
(159, 29, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(160, 29, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(161, 29, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}', 3),
(162, 29, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(163, 29, 'company_id', 'text', 'Company Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(164, 29, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(165, 29, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(166, 29, 'company_report_belongsto_company_relationship', 'relationship', 'companies', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(167, 29, 'company_report_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(168, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(169, 30, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(170, 30, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}', 3),
(171, 30, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(172, 30, 'company_group_id', 'text', 'Company Group Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(173, 30, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(174, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(175, 30, 'company_group_report_belongsto_company_group_relationship', 'relationship', 'company_groups', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\CompanyGroup\",\"table\":\"company_groups\",\"type\":\"belongsTo\",\"column\":\"company_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(176, 30, 'company_group_report_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(177, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(178, 31, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(179, 31, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}', 3),
(180, 31, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(181, 31, 'product_id', 'text', 'Product Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(182, 31, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(183, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(184, 31, 'product_report_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(185, 31, 'product_report_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(186, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(187, 33, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(188, 33, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"2\",\"options\":{\"0\":\"to check\",\"1\":\"checking\",\"2\":\"checked\"}}', 3),
(189, 33, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(190, 33, 'establishment_id', 'text', 'Establishment Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(191, 33, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(192, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(193, 33, 'establishment_report_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(194, 33, 'establishment_report_belongsto_establishment_relationship', 'relationship', 'establishments', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"},\"model\":\"App\\\\Models\\\\Establishment\",\"table\":\"establishments\",\"type\":\"belongsTo\",\"column\":\"establishment_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-03-20 00:47:55', '2021-04-10 06:26:45'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-03-20 00:47:55', '2021-03-20 00:47:55'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-03-20 00:47:55', '2021-03-20 00:47:55'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-03-20 00:48:09', '2021-03-20 00:48:09'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-03-20 00:48:11', '2021-03-20 00:48:11'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-03-20 00:48:13', '2021-03-20 00:48:13'),
(19, 'comments', 'comments', 'Comment', 'Comments', 'voyager-chat', 'App\\Models\\Comment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-09 02:48:29', '2021-04-21 06:11:18'),
(21, 'dishes', 'dishes', 'Dish', 'Dishes', 'voyager-pizza', 'App\\Models\\Dish', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-10 02:17:45', '2021-04-25 00:26:48'),
(22, 'locations', 'locations', 'Location', 'Locations', 'voyager-location', 'App\\Models\\Location', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-10 02:36:14', '2021-04-25 00:29:57'),
(23, 'establishments', 'establishments', 'Establishment', 'Establishments', 'voyager-shop', 'App\\Models\\Establishment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-10 05:23:29', '2021-04-21 06:11:33'),
(25, 'products', 'products', 'Product', 'Products', 'voyager-cup', 'App\\Models\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-21 05:53:21', '2021-04-25 00:31:03'),
(26, 'companies', 'companies', 'Company', 'Companies', 'voyager-lighthouse', 'App\\Models\\Company', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-21 06:40:44', '2021-04-21 07:16:38'),
(27, 'company_groups', 'company-groups', 'Company Group', 'Company Groups', 'voyager-company', 'App\\Models\\CompanyGroup', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-04-21 07:12:32', '2021-04-21 07:12:32'),
(29, 'company_reports', 'company-reports', 'Company Report', 'Company Reports', 'voyager-warning', 'App\\Models\\CompanyReport', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-23 02:10:45', '2021-04-25 00:28:37'),
(30, 'company_group_reports', 'company-group-reports', 'Company Group Report', 'Company Group Reports', 'voyager-warning', 'App\\Models\\CompanyGroupReport', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-23 02:17:17', '2021-04-25 00:28:57'),
(31, 'product_reports', 'product-reports', 'Product Report', 'Product Reports', 'voyager-warning', 'App\\Models\\ProductReport', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-23 02:33:52', '2021-04-25 00:30:15'),
(33, 'establishment_reports', 'establishment-reports', 'Establishment Report', 'Establishment Reports', 'voyager-warning', 'App\\Models\\EstablishmentReport', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-23 02:41:12', '2021-04-25 00:29:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dishes`
--

CREATE TABLE `dishes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `dishes`
--

INSERT INTO `dishes` (`id`, `name`, `image`, `created_at`, `updated_at`, `description`, `establishment_id`) VALUES
(3, 'Vegan Burger', 'dishes\\April2021\\6H4gY43cYD8wQ6VxSo9a.jpg', '2021-04-10 02:16:31', '2021-04-25 00:20:41', 'Melhor hamburguer vegano da cidade', 2),
(4, 'Coxinha de Jaca', 'dishes\\April2021\\AkP3dY1835lf5INuetu4.jpg', '2021-04-25 00:18:58', '2021-04-25 00:20:03', 'Já comi melhores mas ela é muito boa', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `establishments`
--

CREATE TABLE `establishments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `establishments`
--

INSERT INTO `establishments` (`id`, `name`, `image`, `type`, `status`, `notes`, `rating`, `created_at`, `updated_at`) VALUES
(2, 'The Fifties', 'establishments\\April2021\\uWeryxBJsdRCJXW7U9A5.png', 0, 0, 'They have only had one hamburger type as an option for a vegan, but it\'s very tasty.', 8, '2021-04-10 06:19:19', '2021-04-10 06:19:19'),
(3, 'HareBurger', 'establishments\\April2021\\mG3sKPyeLmfo1G8he3W7.jpg', 2, 2, 'A vegetarian fast-food from Rio', 10, '2021-04-20 07:37:35', '2021-04-20 07:37:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `establishment_reports`
--

CREATE TABLE `establishment_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `establishment_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
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
-- Estrutura da tabela `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `coordinates` geometry NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `establishment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `locations`
--

INSERT INTO `locations` (`id`, `coordinates`, `created_at`, `updated_at`, `establishment_id`) VALUES
(3, 0x00000000010100000064f4870ea19645c0e67570e3f6f436c0, '2021-04-10 06:20:35', '2021-04-10 06:20:35', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-03-20 00:47:56', '2021-03-20 00:47:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-03-20 00:47:57', '2021-03-20 00:47:57', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2021-03-20 00:47:57', '2021-04-07 02:03:53', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-03-20 00:47:57', '2021-04-07 02:03:53', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-03-20 00:47:57', '2021-04-07 02:03:53', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 18, '2021-03-20 00:47:57', '2021-04-23 02:42:20', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-03-20 00:47:57', '2021-04-06 22:43:14', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2021-03-20 00:47:57', '2021-04-06 22:43:14', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-03-20 00:47:57', '2021-04-06 22:43:14', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-03-20 00:47:57', '2021-04-06 22:43:14', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 19, '2021-03-20 00:47:57', '2021-04-23 02:42:20', 'voyager.settings.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2021-03-20 00:48:12', '2021-04-07 02:03:54', 'voyager.posts.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2021-03-20 00:48:18', '2021-04-06 22:43:14', 'voyager.hooks', NULL),
(22, 1, 'Comments', '', '_self', 'voyager-chat', '#000000', NULL, 9, '2021-04-09 02:48:29', '2021-04-10 06:54:57', 'voyager.comments.index', 'null'),
(23, 1, 'Dishes', '', '_self', 'voyager-pizza', '#000000', NULL, 8, '2021-04-10 02:17:46', '2021-04-10 06:54:57', 'voyager.dishes.index', 'null'),
(24, 1, 'Locations', '', '_self', 'voyager-location', '#000000', NULL, 6, '2021-04-10 02:36:14', '2021-04-10 06:54:57', 'voyager.locations.index', 'null'),
(25, 1, 'Establishments', '', '_self', 'voyager-shop', '#000000', NULL, 7, '2021-04-10 05:23:29', '2021-04-10 06:54:57', 'voyager.establishments.index', 'null'),
(27, 1, 'Products', '', '_self', 'voyager-cup', NULL, NULL, 12, '2021-04-21 05:53:21', '2021-04-21 07:13:58', 'voyager.products.index', NULL),
(28, 1, 'Companies', '', '_self', 'voyager-lighthouse', NULL, NULL, 11, '2021-04-21 06:40:44', '2021-04-21 07:13:58', 'voyager.companies.index', NULL),
(29, 1, 'Company Groups', '', '_self', 'voyager-company', NULL, NULL, 10, '2021-04-21 07:12:33', '2021-04-21 07:13:58', 'voyager.company-groups.index', NULL),
(30, 1, 'Company Reports', '', '_self', 'voyager-warning', '#000000', NULL, 14, '2021-04-23 02:10:46', '2021-04-23 02:13:16', 'voyager.company-reports.index', 'null'),
(31, 1, 'Company Group Reports', '', '_self', 'voyager-warning', NULL, NULL, 15, '2021-04-23 02:17:17', '2021-04-23 02:42:15', 'voyager.company-group-reports.index', NULL),
(32, 1, 'Product Reports', '', '_self', 'voyager-warning', NULL, NULL, 16, '2021-04-23 02:33:52', '2021-04-23 02:42:18', 'voyager.product-reports.index', NULL),
(33, 1, 'Establishment Reports', '', '_self', 'voyager-warning', '#000000', NULL, 17, '2021-04-23 02:41:12', '2021-04-23 02:43:24', 'voyager.establishment-reports.index', 'null');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-03-20 00:48:14', '2021-03-20 00:48:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-03-20 00:47:58', '2021-03-20 00:47:58'),
(2, 'browse_bread', NULL, '2021-03-20 00:47:58', '2021-03-20 00:47:58'),
(3, 'browse_database', NULL, '2021-03-20 00:47:58', '2021-03-20 00:47:58'),
(4, 'browse_media', NULL, '2021-03-20 00:47:58', '2021-03-20 00:47:58'),
(5, 'browse_compass', NULL, '2021-03-20 00:47:58', '2021-03-20 00:47:58'),
(6, 'browse_menus', 'menus', '2021-03-20 00:47:58', '2021-03-20 00:47:58'),
(7, 'read_menus', 'menus', '2021-03-20 00:47:58', '2021-03-20 00:47:58'),
(8, 'edit_menus', 'menus', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(9, 'add_menus', 'menus', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(10, 'delete_menus', 'menus', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(11, 'browse_roles', 'roles', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(12, 'read_roles', 'roles', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(13, 'edit_roles', 'roles', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(14, 'add_roles', 'roles', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(15, 'delete_roles', 'roles', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(16, 'browse_users', 'users', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(17, 'read_users', 'users', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(18, 'edit_users', 'users', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(19, 'add_users', 'users', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(20, 'delete_users', 'users', '2021-03-20 00:47:59', '2021-03-20 00:47:59'),
(21, 'browse_settings', 'settings', '2021-03-20 00:48:00', '2021-03-20 00:48:00'),
(22, 'read_settings', 'settings', '2021-03-20 00:48:00', '2021-03-20 00:48:00'),
(23, 'edit_settings', 'settings', '2021-03-20 00:48:00', '2021-03-20 00:48:00'),
(24, 'add_settings', 'settings', '2021-03-20 00:48:00', '2021-03-20 00:48:00'),
(25, 'delete_settings', 'settings', '2021-03-20 00:48:00', '2021-03-20 00:48:00'),
(26, 'browse_categories', 'categories', '2021-03-20 00:48:10', '2021-03-20 00:48:10'),
(27, 'read_categories', 'categories', '2021-03-20 00:48:10', '2021-03-20 00:48:10'),
(28, 'edit_categories', 'categories', '2021-03-20 00:48:10', '2021-03-20 00:48:10'),
(29, 'add_categories', 'categories', '2021-03-20 00:48:10', '2021-03-20 00:48:10'),
(30, 'delete_categories', 'categories', '2021-03-20 00:48:10', '2021-03-20 00:48:10'),
(31, 'browse_posts', 'posts', '2021-03-20 00:48:12', '2021-03-20 00:48:12'),
(32, 'read_posts', 'posts', '2021-03-20 00:48:12', '2021-03-20 00:48:12'),
(33, 'edit_posts', 'posts', '2021-03-20 00:48:12', '2021-03-20 00:48:12'),
(34, 'add_posts', 'posts', '2021-03-20 00:48:12', '2021-03-20 00:48:12'),
(35, 'delete_posts', 'posts', '2021-03-20 00:48:13', '2021-03-20 00:48:13'),
(36, 'browse_pages', 'pages', '2021-03-20 00:48:14', '2021-03-20 00:48:14'),
(37, 'read_pages', 'pages', '2021-03-20 00:48:14', '2021-03-20 00:48:14'),
(38, 'edit_pages', 'pages', '2021-03-20 00:48:14', '2021-03-20 00:48:14'),
(39, 'add_pages', 'pages', '2021-03-20 00:48:14', '2021-03-20 00:48:14'),
(40, 'delete_pages', 'pages', '2021-03-20 00:48:14', '2021-03-20 00:48:14'),
(41, 'browse_hooks', NULL, '2021-03-20 00:48:18', '2021-03-20 00:48:18'),
(72, 'browse_comments', 'comments', '2021-04-09 02:48:29', '2021-04-09 02:48:29'),
(73, 'read_comments', 'comments', '2021-04-09 02:48:29', '2021-04-09 02:48:29'),
(74, 'edit_comments', 'comments', '2021-04-09 02:48:29', '2021-04-09 02:48:29'),
(75, 'add_comments', 'comments', '2021-04-09 02:48:29', '2021-04-09 02:48:29'),
(76, 'delete_comments', 'comments', '2021-04-09 02:48:29', '2021-04-09 02:48:29'),
(77, 'browse_dishes', 'dishes', '2021-04-10 02:17:46', '2021-04-10 02:17:46'),
(78, 'read_dishes', 'dishes', '2021-04-10 02:17:46', '2021-04-10 02:17:46'),
(79, 'edit_dishes', 'dishes', '2021-04-10 02:17:46', '2021-04-10 02:17:46'),
(80, 'add_dishes', 'dishes', '2021-04-10 02:17:46', '2021-04-10 02:17:46'),
(81, 'delete_dishes', 'dishes', '2021-04-10 02:17:46', '2021-04-10 02:17:46'),
(82, 'browse_locations', 'locations', '2021-04-10 02:36:14', '2021-04-10 02:36:14'),
(83, 'read_locations', 'locations', '2021-04-10 02:36:14', '2021-04-10 02:36:14'),
(84, 'edit_locations', 'locations', '2021-04-10 02:36:14', '2021-04-10 02:36:14'),
(85, 'add_locations', 'locations', '2021-04-10 02:36:14', '2021-04-10 02:36:14'),
(86, 'delete_locations', 'locations', '2021-04-10 02:36:14', '2021-04-10 02:36:14'),
(87, 'browse_establishments', 'establishments', '2021-04-10 05:23:29', '2021-04-10 05:23:29'),
(88, 'read_establishments', 'establishments', '2021-04-10 05:23:29', '2021-04-10 05:23:29'),
(89, 'edit_establishments', 'establishments', '2021-04-10 05:23:29', '2021-04-10 05:23:29'),
(90, 'add_establishments', 'establishments', '2021-04-10 05:23:29', '2021-04-10 05:23:29'),
(91, 'delete_establishments', 'establishments', '2021-04-10 05:23:29', '2021-04-10 05:23:29'),
(97, 'browse_products', 'products', '2021-04-21 05:53:21', '2021-04-21 05:53:21'),
(98, 'read_products', 'products', '2021-04-21 05:53:21', '2021-04-21 05:53:21'),
(99, 'edit_products', 'products', '2021-04-21 05:53:21', '2021-04-21 05:53:21'),
(100, 'add_products', 'products', '2021-04-21 05:53:21', '2021-04-21 05:53:21'),
(101, 'delete_products', 'products', '2021-04-21 05:53:21', '2021-04-21 05:53:21'),
(102, 'browse_companies', 'companies', '2021-04-21 06:40:44', '2021-04-21 06:40:44'),
(103, 'read_companies', 'companies', '2021-04-21 06:40:44', '2021-04-21 06:40:44'),
(104, 'edit_companies', 'companies', '2021-04-21 06:40:44', '2021-04-21 06:40:44'),
(105, 'add_companies', 'companies', '2021-04-21 06:40:44', '2021-04-21 06:40:44'),
(106, 'delete_companies', 'companies', '2021-04-21 06:40:44', '2021-04-21 06:40:44'),
(107, 'browse_company_groups', 'company_groups', '2021-04-21 07:12:33', '2021-04-21 07:12:33'),
(108, 'read_company_groups', 'company_groups', '2021-04-21 07:12:33', '2021-04-21 07:12:33'),
(109, 'edit_company_groups', 'company_groups', '2021-04-21 07:12:33', '2021-04-21 07:12:33'),
(110, 'add_company_groups', 'company_groups', '2021-04-21 07:12:33', '2021-04-21 07:12:33'),
(111, 'delete_company_groups', 'company_groups', '2021-04-21 07:12:33', '2021-04-21 07:12:33'),
(112, 'browse_company_reports', 'company_reports', '2021-04-23 02:10:46', '2021-04-23 02:10:46'),
(113, 'read_company_reports', 'company_reports', '2021-04-23 02:10:46', '2021-04-23 02:10:46'),
(114, 'edit_company_reports', 'company_reports', '2021-04-23 02:10:46', '2021-04-23 02:10:46'),
(115, 'add_company_reports', 'company_reports', '2021-04-23 02:10:46', '2021-04-23 02:10:46'),
(116, 'delete_company_reports', 'company_reports', '2021-04-23 02:10:46', '2021-04-23 02:10:46'),
(117, 'browse_company_group_reports', 'company_group_reports', '2021-04-23 02:17:17', '2021-04-23 02:17:17'),
(118, 'read_company_group_reports', 'company_group_reports', '2021-04-23 02:17:17', '2021-04-23 02:17:17'),
(119, 'edit_company_group_reports', 'company_group_reports', '2021-04-23 02:17:17', '2021-04-23 02:17:17'),
(120, 'add_company_group_reports', 'company_group_reports', '2021-04-23 02:17:17', '2021-04-23 02:17:17'),
(121, 'delete_company_group_reports', 'company_group_reports', '2021-04-23 02:17:17', '2021-04-23 02:17:17'),
(122, 'browse_product_reports', 'product_reports', '2021-04-23 02:33:52', '2021-04-23 02:33:52'),
(123, 'read_product_reports', 'product_reports', '2021-04-23 02:33:52', '2021-04-23 02:33:52'),
(124, 'edit_product_reports', 'product_reports', '2021-04-23 02:33:52', '2021-04-23 02:33:52'),
(125, 'add_product_reports', 'product_reports', '2021-04-23 02:33:52', '2021-04-23 02:33:52'),
(126, 'delete_product_reports', 'product_reports', '2021-04-23 02:33:52', '2021-04-23 02:33:52'),
(127, 'browse_establishment_reports', 'establishment_reports', '2021-04-23 02:41:12', '2021-04-23 02:41:12'),
(128, 'read_establishment_reports', 'establishment_reports', '2021-04-23 02:41:12', '2021-04-23 02:41:12'),
(129, 'edit_establishment_reports', 'establishment_reports', '2021-04-23 02:41:12', '2021-04-23 02:41:12'),
(130, 'add_establishment_reports', 'establishment_reports', '2021-04-23 02:41:12', '2021-04-23 02:41:12'),
(131, 'delete_establishment_reports', 'establishment_reports', '2021-04-23 02:41:12', '2021-04-23 02:41:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(40, 3),
(72, 1),
(72, 3),
(73, 1),
(73, 3),
(74, 1),
(75, 1),
(76, 1),
(76, 3),
(77, 1),
(77, 3),
(78, 1),
(78, 3),
(79, 1),
(79, 3),
(80, 1),
(80, 3),
(81, 1),
(81, 3),
(82, 1),
(82, 3),
(83, 1),
(83, 3),
(84, 1),
(84, 3),
(85, 1),
(85, 3),
(86, 1),
(86, 3),
(87, 1),
(87, 3),
(88, 1),
(88, 3),
(89, 1),
(89, 3),
(90, 1),
(90, 3),
(91, 1),
(91, 3),
(97, 1),
(97, 3),
(98, 1),
(98, 3),
(99, 1),
(99, 3),
(100, 1),
(100, 3),
(101, 1),
(101, 3),
(102, 1),
(102, 3),
(103, 1),
(103, 3),
(104, 1),
(104, 3),
(105, 1),
(105, 3),
(106, 1),
(106, 3),
(107, 1),
(107, 3),
(108, 1),
(108, 3),
(109, 1),
(109, 3),
(110, 1),
(110, 3),
(111, 1),
(111, 3),
(112, 1),
(112, 3),
(113, 1),
(113, 3),
(114, 1),
(114, 3),
(115, 1),
(115, 3),
(116, 1),
(116, 3),
(117, 1),
(117, 3),
(118, 1),
(118, 3),
(119, 1),
(119, 3),
(120, 1),
(120, 3),
(121, 1),
(121, 3),
(122, 1),
(122, 3),
(123, 1),
(123, 3),
(124, 1),
(124, 3),
(125, 1),
(125, 3),
(126, 1),
(126, 3),
(127, 1),
(127, 3),
(128, 1),
(128, 3),
(129, 1),
(129, 3),
(130, 1),
(130, 3),
(131, 1),
(131, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-20 00:48:13', '2021-03-20 00:48:13'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-20 00:48:13', '2021-03-20 00:48:13'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-20 00:48:13', '2021-03-20 00:48:13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `animal_ing` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `name`, `animal_ing`, `notes`, `barcode_id`, `barcode_format`, `status`, `company_id`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Oreo', 0, 'Oreo é uma marca de biscoito recheado da Nabisco, uma divisão do grupo empresarial estadunidense Mondelēz International. Consiste em dois biscoitos redondos de chocolate e um recheio doce sabor baunilha.', '7622300830151', 'GTIN/EAN', 3, 1, '2021-04-21 07:32:00', '2021-04-21 07:38:07', 'products\\April2021\\H1g8W02zvFP6OnPA7kyC.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_reports`
--

CREATE TABLE `product_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-03-20 00:47:57', '2021-03-20 00:47:57'),
(2, 'user', 'Normal User', '2021-03-20 00:47:58', '2021-03-20 00:47:58'),
(3, 'Contributor', 'Contributor', '2021-04-07 02:23:09', '2021-04-07 02:23:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Vegin', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Vegin the easy way to be vegan', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\April2021\\dqODUq96hBPhBRWzsJ4e.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\April2021\\4hDmNXy1aRJpgMnQypOw.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Vegin Admin', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Creating a better world for us', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\April2021\\m4tfbZjbJOACEs5gZsth.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\April2021\\aqdfYsK8pc8GhTrhIoCf.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-03-20 00:48:15', '2021-03-20 00:48:15'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-03-20 00:48:16', '2021-03-20 00:48:16'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-03-20 00:48:17', '2021-03-20 00:48:17'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-03-20 00:48:17', '2021-03-20 00:48:17'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-03-20 00:48:17', '2021-03-20 00:48:17'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-03-20 00:48:17', '2021-03-20 00:48:17'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-03-20 00:48:17', '2021-03-20 00:48:17'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-03-20 00:48:17', '2021-03-20 00:48:17'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-03-20 00:48:17', '2021-03-20 00:48:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_long` decimal(10,0) DEFAULT NULL,
  `last_lat` decimal(10,0) DEFAULT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `Location`, `last_long`, `last_lat`, `language`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users\\April2021\\59YzjmV2CB7UGEPRWfTL.jpg', NULL, '$2y$10$jmVE92/8b6JPZbtnUoha0uDc7/BnffThvdWS8OiPwZnenlBHETYd2', 'jH2znZudpdUk9ZnGVZsrTafW1hzoI9xdpPSEEoM74Gu8AZCoSaqxbpHMpzRm', '{\"locale\":\"en\"}', '2021-03-20 00:48:10', '2021-04-10 06:25:04', NULL, NULL, NULL, NULL),
(2, 3, 'Leonardo', 'leo-veloso@gmail.com', 'users\\April2021\\GZBWhtkIPUzM68dMa05b.jpg', NULL, '$2y$10$ubIiPmgAd6xl3c1kZNMcge4XY7oEZ8jZ1G.I437ff39QwCQj12j9u', NULL, '{\"locale\":\"pt_br\"}', '2021-04-07 02:24:18', '2021-04-07 02:33:18', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Índices para tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_index` (`user_id`),
  ADD KEY `comments_dish_id_index` (`dish_id`);

--
-- Índices para tabela `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `company_groups`
--
ALTER TABLE `company_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `company_group_reports`
--
ALTER TABLE `company_group_reports`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `company_reports`
--
ALTER TABLE `company_reports`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Índices para tabela `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Índices para tabela `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `establishments`
--
ALTER TABLE `establishments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `establishment_reports`
--
ALTER TABLE `establishment_reports`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Índices para tabela `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Índices para tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `product_reports`
--
ALTER TABLE `product_reports`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Índices para tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Índices para tabela `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Índices para tabela `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `company_groups`
--
ALTER TABLE `company_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `company_group_reports`
--
ALTER TABLE `company_group_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `company_reports`
--
ALTER TABLE `company_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT de tabela `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `establishments`
--
ALTER TABLE `establishments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `establishment_reports`
--
ALTER TABLE `establishment_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `product_reports`
--
ALTER TABLE `product_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Limitadores para a tabela `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
