-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 24 juin 2024 à 21:20
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `reservationdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `reason` text NOT NULL,
  `appointmentDate` date NOT NULL,
  `appointmentTime` time NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `workingHours` decimal(5,2) DEFAULT NULL,
  `workDaysOfWeek` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `uuid`, `name`, `category`, `userId`, `workingHours`, `workDaysOfWeek`, `createdAt`, `updatedAt`) VALUES
(1, 'd4d769dc-8de1-44aa-9ede-a30697169f16', 'Andrianasolo Ny Ando ', 'Développer Backend ', 3, 8.00, 'Lundi , Mardi , Jeudi ', '2024-06-11 16:03:57', '2024-06-11 16:03:57'),
(8, '0b53698c-629c-4c0d-b5b9-3dfbfe816e64', 'Responsable Informatique', 'ok', 3, 8.00, 'Lundi', '2024-06-17 16:01:04', '2024-06-17 16:01:13');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('--mpu5BfS8hUYNFy1GhF7XXMo5sdbZo8', '2024-06-24 21:23:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:23:20', '2024-06-23 21:23:20'),
('-mlGSrhn7SaY5Rpti8hl08e38vSoG73n', '2024-06-25 19:12:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:12:57', '2024-06-24 19:12:57'),
('-visAN41MZUUq_01AvJtXDKkPVgnpu86', '2024-06-24 22:22:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:22:08', '2024-06-23 22:22:08'),
('11CvbKh_ZXHmZRdhXd1LzuG05oJhFZT4', '2024-06-24 23:02:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 23:02:19', '2024-06-23 23:02:19'),
('1207AcF0FB6JMOXfbffGTKdM1EcTlaR6', '2024-06-25 04:34:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:34:22', '2024-06-24 04:34:22'),
('175eNndPg9mEbpEKQqJR-HTX5EKrUNmd', '2024-06-24 21:50:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:50:57', '2024-06-23 21:50:57'),
('1ZC3Y_lAloqxJig2komICqf1tlZj9um-', '2024-06-25 05:57:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 05:57:15', '2024-06-24 05:57:15'),
('2DgMZnsanAdqeF6siAGSSeReyOju_qTW', '2024-06-24 22:46:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:46:36', '2024-06-23 22:46:36'),
('2iR3mduXYFUR2rdYTYQcYA9eGpir6fQH', '2024-06-24 21:23:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:23:57', '2024-06-23 21:23:57'),
('2KmxS6e_eRCEQ_xbLWowFw9ICAX70i7Q', '2024-06-25 05:56:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 05:56:50', '2024-06-24 05:56:50'),
('3vffaGtJD01Shas-jgEhzUJ4pzYMbm2A', '2024-06-24 20:50:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:50:20', '2024-06-23 20:50:20'),
('3wqhhjyu8_rm-GOqfp1SNh9FKtsAHx_I', '2024-06-24 20:04:14', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:04:14', '2024-06-23 20:04:14'),
('4k6jSaMvi-IJRzBTXhO7PPsumCyyl3Vd', '2024-06-24 20:30:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:30:04', '2024-06-23 20:30:04'),
('577YRddY8OktaR3iv2FERIPAmZ2CwU9E', '2024-06-24 22:53:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:53:20', '2024-06-23 22:53:20'),
('5aO_am1QWvX46MKTWDxw2sMjozhRCq09', '2024-06-24 19:58:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:58:18', '2024-06-23 19:58:18'),
('5FPhNMclekOg0gu02RqPgw_iV1LVV1-w', '2024-06-24 21:22:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:22:58', '2024-06-23 21:22:58'),
('5kfBnUFZ1qgh2EaVw0_z3_CtB3rSNuo9', '2024-06-25 06:03:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 06:03:15', '2024-06-24 06:03:15'),
('5x6RP9wPB8TsvVIZdPBEBUgTcYh0m4X5', '2024-06-24 19:59:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:59:02', '2024-06-23 19:59:02'),
('6AOirOztxjIiIh_xM4Nhq0-_GmfMQTyP', '2024-06-24 20:55:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:55:08', '2024-06-23 20:55:08'),
('6wGSPRcE6pX2mFgY22IoFtQ7Oy5Jnh-F', '2024-06-24 21:58:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:58:22', '2024-06-23 21:58:22'),
('7ccqR7mZmCGqno1APrtA7FjUsdDx6V_4', '2024-06-24 22:38:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:38:35', '2024-06-23 22:38:35'),
('7lMVikYjoAdfLMHfyJEog9B4-ecBqL4W', '2024-06-24 20:50:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:50:25', '2024-06-23 20:50:25'),
('83G8CSKbz6aVjDjGJUIfOtpJx2DtjhA1', '2024-06-25 19:14:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:14:55', '2024-06-24 19:14:55'),
('8enSViHF5CXHwXOkUoFuCBklc2Tsq2xZ', '2024-06-24 23:25:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 23:25:21', '2024-06-23 23:25:21'),
('91-2XkxngW9aAz4r-uAdAf4XFnLyyvEC', '2024-06-24 20:35:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:35:44', '2024-06-23 20:35:44'),
('9LpGq57-aBCRQcIxXHI37Hev7ODTeghF', '2024-06-25 04:33:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:33:56', '2024-06-24 04:33:56'),
('9MSGK_51g9l_mafSFo1jmLncwcgAXrJJ', '2024-06-24 20:42:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:42:17', '2024-06-23 20:42:17'),
('afwTlCY73WqppghuDWdst4afF8ozopkd', '2024-06-25 04:29:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:29:48', '2024-06-24 04:29:48'),
('aLDWrz13uKk1perk8hyKqRItPAegwC7-', '2024-06-24 22:27:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:27:44', '2024-06-23 22:27:44'),
('A_IKpauZczigPphosXSo61n7nhcMs-Pv', '2024-06-24 21:34:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:34:49', '2024-06-23 21:34:49'),
('BgvMKUlkXaTBLygxq15QT332Fryhkiiu', '2024-06-24 20:00:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:00:49', '2024-06-23 20:00:49'),
('bvfHGfehd61OADqrO8vZ_TPqAM5iXXwn', '2024-06-24 20:32:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:32:47', '2024-06-23 20:32:47'),
('c98sz66EIFszh0H1KEJlb2rpvKz6hroL', '2024-06-24 21:14:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:14:33', '2024-06-23 21:14:33'),
('CC3PXEni4-xJqpyase9ir25XruRGtGKJ', '2024-06-24 19:45:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:45:43', '2024-06-23 19:45:43'),
('cc9mYpXjMEYkWicPyEiXLRtLXpxn7AIk', '2024-06-24 22:46:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:46:29', '2024-06-23 22:46:29'),
('cfUAFoXBAyBE03h3WB0vGsk0NvqwEaOg', '2024-06-24 19:57:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:57:53', '2024-06-23 19:57:53'),
('cKtSKy2H-QpVUpDGCubwHVeOn-apgqRy', '2024-06-24 19:58:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:58:40', '2024-06-23 19:58:40'),
('Cn4g9eUpWga9dDOxS5p64ccoe_tgDLmC', '2024-06-25 04:32:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:32:15', '2024-06-24 04:32:15'),
('d-cqo4UGjyYG-o87l_JADtuUf2oq2Iij', '2024-06-24 21:03:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:03:25', '2024-06-23 21:03:25'),
('D5oYBfRtUG3-mVf1oWvqGBjSnc9A5sDM', '2024-06-25 04:33:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:33:43', '2024-06-24 04:33:43'),
('dAL43uGjg0pjuhC13oLAmOMLrZLePWTo', '2024-06-25 04:15:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:15:00', '2024-06-24 04:15:00'),
('djSs1IYRyMrFhJqaA4IQ3AntzxngMSco', '2024-06-25 19:05:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:05:16', '2024-06-24 19:05:16'),
('Dq8MmzmufsOMoxScBh7VTnNB4ZjqFpn4', '2024-06-25 05:57:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 05:57:47', '2024-06-24 05:57:47'),
('e2-mG7ETcsPnuCF4l4nAU7sDhVZkZqYR', '2024-06-24 21:19:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:19:00', '2024-06-23 21:19:00'),
('e9gPW2pgost1SqTqFmEpnmhAzRc153ii', '2024-06-25 05:57:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 05:57:00', '2024-06-24 05:57:00'),
('eDlu6eioUw3CGO3AA6J1zLbrWBYJPVrB', '2024-06-24 20:00:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:00:24', '2024-06-23 20:00:24'),
('EduCNBN7DDuaa3wDjRRXWbj4cE4MnGt4', '2024-06-25 05:54:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 05:54:51', '2024-06-24 05:54:51'),
('eXO-qW8COM6kEIlzSV42fCenOEMz7smj', '2024-06-24 22:52:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:52:41', '2024-06-23 22:52:41'),
('ey5XQwKK1gAoYdRW2JmMmhE3pIHgJAc_', '2024-06-24 20:37:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:37:26', '2024-06-23 20:37:26'),
('F2mObxkgQZeyl21RYJXPqAO-cPKrYjC_', '2024-06-25 05:55:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 05:55:27', '2024-06-24 05:55:27'),
('g-joBDPEBWywllwnJxwGEdCoRtGQU2-3', '2024-06-24 19:42:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:42:42', '2024-06-23 19:42:42'),
('gBPA3O64oMKGpRKid3oXyr1e58iwkOvN', '2024-06-24 19:45:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:45:08', '2024-06-23 19:45:08'),
('GlRGWtMGid5CXhidWeT9p6NmLdEq4gtG', '2024-06-24 22:40:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:40:25', '2024-06-23 22:40:25'),
('goVtfisRRIUBcM_XsIfqGftTXWPd15p2', '2024-06-24 22:52:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:52:35', '2024-06-23 22:52:35'),
('gwjMT5RAnd2-J1YDXZq9Smr7j6c3h3eX', '2024-06-24 22:34:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:34:02', '2024-06-23 22:34:02'),
('HGGaRDVvhoUd8tloK07jHGbkrQVjKFXa', '2024-06-25 19:14:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:14:45', '2024-06-24 19:14:45'),
('hJ9Y0QtBpaKdaDom_TtcLO5lMmfOoVSj', '2024-06-24 21:15:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:15:47', '2024-06-23 21:15:47'),
('HNc9RRJqTbLQ6fzjMoA-4cg_B_FNlI8W', '2024-06-24 21:25:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:25:23', '2024-06-23 21:25:23'),
('HsWoyLNZbwOVSmMH6vr2WgGM3AE9y1dq', '2024-06-25 19:11:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:11:23', '2024-06-24 19:11:23'),
('hVa-9d2L9Cs-Lx7l9jBHTSGy0mJ09Dyf', '2024-06-24 23:02:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 23:02:33', '2024-06-23 23:02:33'),
('hVW7Tz3x5KmhwRAivUQGmlfocsXnHBhc', '2024-06-24 21:23:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:23:16', '2024-06-23 21:23:16'),
('I7YWQdGM-KuiwjVak0dwu78g-pI3ELZt', '2024-06-24 22:47:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:47:44', '2024-06-23 22:47:44'),
('Ie5ZwhzOcexIKlmhRuPxIEwkZMiPsiDk', '2024-06-24 21:22:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:22:46', '2024-06-23 21:22:46'),
('IFnrJ4E7obRPXWKKxtoEG0p4V_jJ65hC', '2024-06-24 21:57:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:57:25', '2024-06-23 21:57:25'),
('IKzT2pZM2xNx1uhJZ7Yp35_czMkZ-_Rq', '2024-06-25 04:18:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:18:18', '2024-06-24 04:18:18'),
('J0YscU6mZ3X-fqg-pYtn_OGedOh3fnMa', '2024-06-24 21:03:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:03:00', '2024-06-23 21:03:00'),
('j8evDOPbPDYlk8zSP5V83K-AHqRW_S5e', '2024-06-25 04:30:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:30:57', '2024-06-24 04:30:57'),
('jc0GVEndLo-EAVxEw8WlJat9JivNyHgu', '2024-06-24 21:33:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:33:50', '2024-06-23 21:33:50'),
('JEJO0mDnZDGwAEs0my46cfr2KZHCwXvn', '2024-06-24 22:31:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:31:22', '2024-06-23 22:31:22'),
('JH9qWTaPkrE1DaHoUng4RBRmcMX9k0jY', '2024-06-24 21:18:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:18:55', '2024-06-23 21:18:55'),
('jMagK9sG5Qr5gfh1MltVjqht-khKhYqA', '2024-06-24 22:31:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:31:19', '2024-06-23 22:31:19'),
('jNxCgN-fZdc6HAjDWHqZp1fcXFm-bJZL', '2024-06-24 20:40:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:40:08', '2024-06-23 20:40:08'),
('JzDxrkJ1hSgh3nmgvCPWqszJXuYYbxWo', '2024-06-25 19:11:34', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:11:34', '2024-06-24 19:11:34'),
('k1dc4o9eap01k43PkoIxD3x0cRA0nrwj', '2024-06-25 19:14:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"de024b0d-7091-465b-8385-b4e92ac18805\"}', '2024-06-24 19:14:45', '2024-06-24 19:14:56'),
('kEaoaFYNNPPKlqn2UbZlq_nPj-bltuS_', '2024-06-25 04:18:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"2c4d908d-a337-4c19-add7-c2e956963482\"}', '2024-06-24 04:07:44', '2024-06-24 04:18:19'),
('kohojOc85ce3DVklj5weKJ54oc0i_qWL', '2024-06-24 22:53:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:53:39', '2024-06-23 22:53:39'),
('kqKFaMhefAoW4t58OiLHWael9iFHXq2_', '2024-06-25 19:06:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:06:21', '2024-06-24 19:06:21'),
('L6-xwTURVXjlqqbzA8cUwMPoCLI2qoMj', '2024-06-24 22:19:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:19:45', '2024-06-23 22:19:45'),
('L79_PrmZh900nXbTnbaWPL49-RCcNEyW', '2024-06-24 21:44:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:44:55', '2024-06-23 21:44:55'),
('LbVNfpS1rL9fkW0z0Kj4g3DPds53Sv2k', '2024-06-24 21:12:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:12:11', '2024-06-23 21:12:11'),
('lF5QRzar8nGVRz3VtMNg06OHDse6YEZZ', '2024-06-24 22:38:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:38:45', '2024-06-23 22:38:45'),
('lNmdl61TW7ueYkJ53Om1bl34R95M0crl', '2024-06-25 19:11:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:11:00', '2024-06-24 19:11:00'),
('lsMh_75e2SH6PU-9FbZMDIGGM4hlQasv', '2024-06-24 22:53:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:53:05', '2024-06-23 22:53:05'),
('m0-zrvhU8fO-OaKWplmugdtDp2SIHz4r', '2024-06-24 19:45:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:45:42', '2024-06-23 19:45:42'),
('MlsN_4_jRR2Nuhn0H_lgy3NCBmYK0ogb', '2024-06-24 20:55:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:55:07', '2024-06-23 20:55:07'),
('mQxQMWguahilJ9JbRAEroQynVP-ALVrG', '2024-06-24 19:45:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:45:46', '2024-06-23 19:45:46'),
('MtXUDXSXszrvGuvM2_UA8usgSqKlh1Mq', '2024-06-25 04:31:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:31:02', '2024-06-24 04:31:02'),
('mvCxD0ITtNsdjFrWL1tCiEYzPT3_-O_g', '2024-06-25 19:14:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:14:39', '2024-06-24 19:14:39'),
('n5ahOy_uyrPh-2hfsuP0OQpRdqfbRNL2', '2024-06-24 21:03:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:03:19', '2024-06-23 21:03:19'),
('NHG2uF36R7NtW_T9zOf2YHSfn1QAQzmK', '2024-06-24 22:31:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:31:23', '2024-06-23 22:31:23'),
('NNY8l8prJfDbfwqSTPqjhAr3U89sK-Ax', '2024-06-24 19:41:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:41:21', '2024-06-23 19:41:21'),
('nSSivBTCk82yto3WouiUgIT7Mv4fAk36', '2024-06-24 21:53:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:53:49', '2024-06-23 21:53:49'),
('O2hl0OC_naIReqn2TNVL0rpd1NjxvcJu', '2024-06-24 21:25:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:25:28', '2024-06-23 21:25:28'),
('OcKs0VZRX9EMGDBimBAgz5oj18LeQR78', '2024-06-24 22:19:09', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:19:09', '2024-06-23 22:19:09'),
('oiNq0iQMDSMTUuP3Mg5DCfYvc04duESB', '2024-06-24 21:03:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:03:04', '2024-06-23 21:03:04'),
('OrCf89DPhklppBfMgFrwpSkHSbSYS4gq', '2024-06-24 21:12:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:12:00', '2024-06-23 21:12:00'),
('p1Ma0CaOI9ra-29v1MzSruIdecqvUa13', '2024-06-24 21:43:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:43:59', '2024-06-23 21:43:59'),
('PbwmzS0Fy1e8VIIRHDcsRkG_zVjJBaY5', '2024-06-24 22:47:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:47:55', '2024-06-23 22:47:55'),
('pD8lRtVAN4sAYGl8PhrIiW72aSyoeknC', '2024-06-24 21:23:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:23:36', '2024-06-23 21:23:36'),
('PDdWtEYfLS8T94nxHL97OH5R9lj-FfpW', '2024-06-24 19:43:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:43:45', '2024-06-23 19:43:45'),
('pFuWAaS28dkzWL0raqux5c45dcSyblDi', '2024-06-24 19:45:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:45:41', '2024-06-23 19:45:41'),
('pJizW-Z2CL5-px_MT2tvr2v4OAcxeNxE', '2024-06-24 21:48:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:48:54', '2024-06-23 21:48:54'),
('pjYOvlhTFCWGUUJUM0nDGmhw3TIS0VIf', '2024-06-24 23:02:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 23:02:38', '2024-06-23 23:02:38'),
('PT97UFEnw_0Z7ysYWJIxT5IeELuKIp5w', '2024-06-24 20:32:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:32:55', '2024-06-23 20:32:55'),
('Q-taZ09jcpzdbApeMMGEea8hKAeRPREl', '2024-06-24 22:27:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:27:31', '2024-06-23 22:27:31'),
('QAMPo0c1MV33ROgAaKbt2zWIOArkhiTT', '2024-06-24 19:42:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:42:15', '2024-06-23 19:42:15'),
('QzHeEk932p4MWCjaD7NlWcT_eLm8Vm3s', '2024-06-24 21:42:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:42:49', '2024-06-23 21:42:49'),
('rDcNclpOStzimZljXUELk9jIqmxJNJgT', '2024-06-24 21:58:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:58:58', '2024-06-23 21:58:58'),
('RjRox8gkFagC3pejnjdJhKNseLW-W9VH', '2024-06-24 21:12:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:12:54', '2024-06-23 21:12:54'),
('s2luy0A7GXDsS9E2Hln0uKecPs8DZr7o', '2024-06-24 21:02:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:02:46', '2024-06-23 21:02:46'),
('ShOzDojFzFs-toDsazvhu1feu_XlvxRr', '2024-06-24 23:26:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 23:26:08', '2024-06-23 23:26:08'),
('T4E7FYxLpy1sqCp26AHewVmbFz7A5H3D', '2024-06-25 19:14:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:14:32', '2024-06-24 19:14:32'),
('taTWgJCw2EBkzgKlApaXb5BNfozePqHE', '2024-06-25 19:13:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:13:58', '2024-06-24 19:13:58'),
('TB0JtCdfgbt_vN3r_YtKvxthq-WkVym9', '2024-06-24 19:57:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:57:32', '2024-06-23 19:57:32'),
('TiCmjORXt8xYY7JZxnM6tWSczCnOUVBX', '2024-06-24 22:33:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:33:56', '2024-06-23 22:33:56'),
('tM1aIR7fXjgaVVJrz3flgvRkm4FTusvN', '2024-06-24 21:38:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:38:48', '2024-06-23 21:38:48'),
('tTUK9_EoI1WkXD5n7o600MEk8Ismm8us', '2024-06-24 23:26:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"305ad3ef-ea67-47b3-b53e-8b19ff9c925f\"}', '2024-06-23 23:02:33', '2024-06-23 23:26:10'),
('uZZpcKK9voDx1DxR5G4vweKJAiLpSUlo', '2024-06-24 21:54:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:54:27', '2024-06-23 21:54:27'),
('VfkfU-IypsYZALsTHH4qltAc8URParp4', '2024-06-24 21:24:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:24:25', '2024-06-23 21:24:25'),
('VPO75DwdEmpXC3ii_0HjYbDXj8wlCkos', '2024-06-24 19:37:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:37:08', '2024-06-23 19:37:08'),
('vtt9RaD3Yn2XIfvQKXoEh6HCsndmoEBq', '2024-06-24 21:19:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:19:52', '2024-06-23 21:19:52'),
('vviA8bkMR4M3nRx4NGWlpngKSw_p8JQl', '2024-06-24 19:37:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:37:42', '2024-06-23 19:37:42'),
('vyBaYruPfdrHqy2_AgMQVDz8pjYzNu3J', '2024-06-24 22:52:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:52:49', '2024-06-23 22:52:49'),
('wcQEp1u08fDNv7nAWcZCoTp6kVHzu0VN', '2024-06-24 22:51:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:51:42', '2024-06-23 22:51:42'),
('WfWhGxDpdVVNmZeFAwrPj8VlWRV7z479', '2024-06-24 20:01:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:01:57', '2024-06-23 20:01:57'),
('wk_hux1Pd6MsjSGfGxfTaEdDE0tx_XB6', '2024-06-24 20:40:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:40:20', '2024-06-23 20:40:20'),
('WntSECB-cPMQWggNDKrIoWUXPK5Ab4cg', '2024-06-25 19:13:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:13:47', '2024-06-24 19:13:47'),
('wU8-Kpsy6kD5LLoqRlXkqAQWCLpiTgr7', '2024-06-24 20:29:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:29:57', '2024-06-23 20:29:57'),
('X3bVxRMHW7Iq_ixZuOWvnv0RjdvcAOYx', '2024-06-24 21:42:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:42:53', '2024-06-23 21:42:53'),
('xChKDdgAEbz55-Zs7BAXCuA6WsHrF0Lk', '2024-06-24 20:04:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:04:07', '2024-06-23 20:04:07'),
('XhzKOf6ZXaj4NjEwa1xHnzHL_T71bLEP', '2024-06-25 04:07:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:07:44', '2024-06-24 04:07:44'),
('xSA24EC22GAYffoNNCXb_YQMxleoW_RC', '2024-06-25 05:58:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 05:58:07', '2024-06-24 05:58:07'),
('XUcVgwE214w1dItzriOsMSoAfXVkpf90', '2024-06-24 22:22:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:22:03', '2024-06-23 22:22:03'),
('y6VN88lKVkzuzuYxrJlEMZEqqOAckpyG', '2024-06-24 19:41:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:41:50', '2024-06-23 19:41:50'),
('YoCSgjQHXVtgvxP7ANXkrCiFz4d8EEC_', '2024-06-24 23:01:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 23:01:48', '2024-06-23 23:01:48'),
('YUBjnvhS5p61WRj4PLdIuTCAqnLgrCTc', '2024-06-24 20:42:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 20:42:31', '2024-06-23 20:42:31'),
('yZDkbVwu-fN93S5qkT9ATPDKDmZ1h0oW', '2024-06-25 05:58:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 05:58:01', '2024-06-24 05:58:01'),
('zf0qTbQzgCu62VriBd_Lh5HP9FL7E6TW', '2024-06-25 19:05:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:05:35', '2024-06-24 19:05:35'),
('ZO5OFWTSlnCGMxY_yBLBB8yQL0lQD1SL', '2024-06-24 22:19:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 22:19:00', '2024-06-23 22:19:00'),
('ZqJvcHqDiiXt_K9xAK6IKk21vHuuAAun', '2024-06-24 19:45:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 19:45:15', '2024-06-23 19:45:15'),
('ZxZ9t2o3V179zXIfFXb128w0Rl11gKRb', '2024-06-25 04:31:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 04:31:15', '2024-06-24 04:31:15'),
('zzFw_sePEi9dZyynyaP-05b0CmoEySJ5', '2024-06-24 21:25:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:25:11', '2024-06-23 21:25:11'),
('_i7FYLTGIcU4Ym9-2RqSOIHevVP6Nnvp', '2024-06-24 21:23:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:23:41', '2024-06-23 21:23:41'),
('_jZuGWTUff8CushL-RwZ8yxdKSj4eu4x', '2024-06-24 21:55:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-23 21:55:37', '2024-06-23 21:55:37'),
('_PrHCUqL1Y7223lbjo-hgMaiL05dc_Ou', '2024-06-25 19:04:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-24 19:04:31', '2024-06-24 19:04:31');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(3, '305ad3ef-ea67-47b3-b53e-8b19ff9c925f', 'Administrateur ', 'administrateur@rdv.com', '$argon2id$v=19$m=65536,t=3,p=4$EOUjhK4y1dGmrJw6FqH6Gw$vrOXHBAJu9dSsHvW5mNtd/4tjycOzDNW0WSoOEVq6uw', 'admin', '2024-06-10 17:48:21', '2024-06-10 17:51:18'),
(16, 'de024b0d-7091-465b-8385-b4e92ac18805', 'Secretaire de Direction Générale', 'rabetsiesotrajessie@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$wIa7pIqy4ICWossYdAEJUg$Kp/5yruWr7zDOKTnWvtouSu31A/8YYkcjO3i2AJ1GOc', 'user', '2024-06-17 15:40:27', '2024-06-22 22:51:50'),
(17, '4673d72c-b671-436a-bcc6-920a0c727e70', 'Responsable Informatique', 'responsable.informatique@rdv.mg', '$argon2id$v=19$m=65536,t=3,p=4$YIuxlulh3HeqdvsFxfiDtA$/O1AIRIKihN+oWj6Mx2ao9N205R/BBmGzR3QULvW2gc', 'user', '2024-06-17 15:41:41', '2024-06-21 09:20:50'),
(18, '2c4d908d-a337-4c19-add7-c2e956963482', 'Responsable du Service Client', 'andrianantoandrofynomena@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$k2bRt1O0qlGu8OjXWNiW8Q$3bx8YNb0vUoxKzQcRfKxZLUyw5Uxh7y+m/g1wdBM5RY', 'user', '2024-06-17 15:42:27', '2024-06-23 21:23:17'),
(19, 'ff497201-7558-4042-87ac-08e5494ff5e7', 'Responsable Marketing', 'responsable.marketing@rdv.mg', '$argon2id$v=19$m=65536,t=3,p=4$VPA4738AFWdIhG27/XtG7A$s8LM9cfSZc7ahIJJSPZGJ6SafscnKfHlkrLcXAtynG8', 'user', '2024-06-17 15:43:06', '2024-06-17 15:43:06'),
(20, 'bc20f9fb-f80f-46be-8211-845d9e608447', 'Responsable Financier', 'responsable.financier@rdv.com', '$argon2id$v=19$m=65536,t=3,p=4$JATbEuQOK37uauKT+2kg6A$t5OnT8H8gVvlQOMeHjVmgD9xFBQ+FyUAKfWuJCwvmBI', 'user', '2024-06-17 15:43:58', '2024-06-17 15:43:58'),
(21, 'befc4c8b-69b3-4cf0-ac4f-16b694d3f6c4', 'Responsable des Opérations', 'responsable.operation@rdv.mg', '$argon2id$v=19$m=65536,t=3,p=4$HHH8X7E4M6RM4HgX/jEfNw$5WWbyaE838QeDfPgIRb3x6vm/hh4cgdsTxW8QQJA628', 'user', '2024-06-17 15:44:59', '2024-06-17 15:44:59'),
(22, '59305ff1-3550-4bd0-856e-9729afda8a46', 'Ny Ando Andrianasolo', 'nyandoandrianasolo12@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$KO3sFTGNEnVrFYn1oqzRoQ$AOkNI8nJ6eCgJvS4zcxsDXyz13WfOC2SREyJiXkzboA', 'client', '2024-06-17 15:47:50', '2024-06-17 15:47:50'),
(23, 'af62c612-b231-44d9-8fb0-e3bc46321bdf', 'Elvis', 'elvisaaron1904@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$sha61u/hLIeNrv8zpa7NuA$4viJMFpLNpCxo+B3M1YG2gfxEz4Oe94VMLj2dW3MeX4', 'client', '2024-06-21 09:18:36', '2024-06-21 09:18:36'),
(24, '57d77dbc-d96e-46c6-a9d6-e86ecb4a2818', 'Tendry', 'elvisaaron1906@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$n5Lfw9uelQLytJCi/fArGA$yTqM12owuWCOK9L4pi33oMuZLtAKRk88exsKRII5+Ao', 'user', '2024-06-21 12:41:53', '2024-06-21 12:41:53');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `personne_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
