-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 29 nov. 2024 à 14:42
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centercall`
--
CREATE DATABASE IF NOT EXISTS `centercall` DEFAULT CHARACTER SET utf8mb4 ;
USE `centercall`;

-- --------------------------------------------------------

--
-- Structure de la table `auth_groups_users`
--

DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE IF NOT EXISTS `auth_groups_users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_groups_users_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`) VALUES
(2, 1, 'admin', '2024-11-08 15:18:10'),
(6, 6, 'client', '2024-11-29 13:22:25'),
(7, 7, 'client', '2024-11-29 13:26:51'),
(8, 8, 'client', '2024-11-29 13:42:35');

-- --------------------------------------------------------

--
-- Structure de la table `auth_identities`
--

DROP TABLE IF EXISTS `auth_identities`;
CREATE TABLE IF NOT EXISTS `auth_identities` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `secret2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text COLLATE utf8mb4_general_ci,
  `force_reset` tinyint(1) NOT NULL DEFAULT '0',
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_secret` (`type`,`secret`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `auth_identities`
--

INSERT INTO `auth_identities` (`id`, `user_id`, `type`, `name`, `secret`, `secret2`, `expires`, `extra`, `force_reset`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'email_password', NULL, 'eliaz@gmail.com', '$2y$12$UdPe0lirDmqDWZCC8aHFfOj7QmtjNfsWZqSV5Pdpv4kA4QhQlhqsi', NULL, NULL, 0, '2024-11-29 13:42:45', '2024-11-08 13:55:10', '2024-11-29 13:42:45'),
(6, 6, 'email_password', NULL, 'King@gmail.com', '$2y$12$.viDQp2jSC5GHGlWaOzVVuWyFhQLI57ow1SObxA9ORI9ZhqwSvuHG', NULL, NULL, 0, NULL, '2024-11-29 13:22:24', '2024-11-29 13:22:25'),
(7, 7, 'email_password', NULL, 'Nutella@gmail.com', '$2y$12$sKS9RyFVnsnhBfdhunhJ/ukCtX.Ia40tj86nEuQpDTuIpy7WoYmoa', NULL, NULL, 0, '2024-11-29 14:38:31', '2024-11-29 13:26:51', '2024-11-29 14:38:31'),
(8, 8, 'email_password', NULL, 'Darty@gmail.com', '$2y$12$5U7Jc7ZW27n7AyRX8va5temuWf6qC72bxn4mAJ5QKoQnfxYNiZa2q', NULL, NULL, 0, '2024-11-29 14:39:18', '2024-11-29 13:42:34', '2024-11-29 14:39:18');

-- --------------------------------------------------------

--
-- Structure de la table `auth_logins`
--

DROP TABLE IF EXISTS `auth_logins`;
CREATE TABLE IF NOT EXISTS `auth_logins` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_identifier` (`id_type`,`identifier`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-08 13:55:30', 1),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-08 14:34:45', 1),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz82@gmail.com', NULL, '2024-11-08 14:58:18', 0),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz82@gmail.com', NULL, '2024-11-08 14:58:24', 0),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz82@gmail.com', NULL, '2024-11-08 15:04:29', 0),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-08 15:04:43', 1),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz82@gmail.com', NULL, '2024-11-15 11:40:26', 0),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz82@gmail.com', NULL, '2024-11-15 11:40:31', 0),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 11:40:41', 1),
(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 11:49:33', 1),
(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', NULL, '2024-11-15 11:54:52', 0),
(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', NULL, '2024-11-15 11:55:00', 0),
(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 11:55:07', 1),
(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 12:51:02', 1),
(15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'stephan@gmail.com', 3, '2024-11-15 13:01:06', 1),
(16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', 2, '2024-11-15 13:03:47', 1),
(17, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'stephan@gmail.com', NULL, '2024-11-15 13:18:26', 0),
(18, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'stephan@gmail.com', 3, '2024-11-15 13:18:32', 1),
(19, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', 2, '2024-11-15 13:38:13', 1),
(20, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', 2, '2024-11-15 13:41:05', 1),
(21, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 13:45:21', 1),
(22, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 13:48:50', 1),
(23, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 13:49:43', 1),
(24, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'stephan@gmail.com', 3, '2024-11-15 13:54:38', 1),
(25, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 13:54:48', 1),
(26, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'thomas@gmail.com', 4, '2024-11-15 13:55:18', 1),
(27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', 2, '2024-11-15 13:55:39', 1),
(28, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'stephan@gmail.com', 3, '2024-11-15 13:56:01', 1),
(29, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 13:56:14', 1),
(30, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'stephan@gmail.com', 3, '2024-11-15 13:59:40', 1),
(31, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-15 14:07:10', 1),
(32, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', NULL, '2024-11-15 14:09:12', 0),
(33, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', 2, '2024-11-15 14:09:22', 1),
(34, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-22 11:38:05', 1),
(35, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'Bts@gmail.com', NULL, '2024-11-22 11:58:03', 0),
(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'Bts@gmail.com', 5, '2024-11-22 11:58:10', 1),
(37, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-22 11:58:18', 1),
(38, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'Bts@gmail.com', 5, '2024-11-22 11:59:53', 1),
(39, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'Bts@gmail.com', 5, '2024-11-22 12:00:32', 1),
(40, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-22 12:00:56', 1),
(41, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', NULL, '2024-11-22 12:14:47', 0),
(42, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-22 12:14:53', 1),
(43, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', NULL, '2024-11-22 15:16:35', 0),
(44, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', 2, '2024-11-22 15:16:45', 1),
(45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-22 15:22:22', 1),
(46, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'nutella@gmail.com', 2, '2024-11-22 15:23:11', 1),
(47, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-29 11:46:39', 1),
(48, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-29 12:59:36', 1),
(49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-29 13:07:08', 1),
(50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-29 13:22:42', 1),
(51, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-29 13:28:04', 1),
(52, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'eliaz@gmail.com', 1, '2024-11-29 13:42:45', 1),
(53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'Nutella@gmail.com', 7, '2024-11-29 14:38:31', 1),
(54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'email_password', 'Darty@gmail.com', 8, '2024-11-29 14:39:18', 1);

-- --------------------------------------------------------

--
-- Structure de la table `auth_permissions_users`
--

DROP TABLE IF EXISTS `auth_permissions_users`;
CREATE TABLE IF NOT EXISTS `auth_permissions_users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_permissions_users_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_remember_tokens`
--

DROP TABLE IF EXISTS `auth_remember_tokens`;
CREATE TABLE IF NOT EXISTS `auth_remember_tokens` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `hashedValidator` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `auth_remember_tokens_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_token_logins`
--

DROP TABLE IF EXISTS `auth_token_logins`;
CREATE TABLE IF NOT EXISTS `auth_token_logins` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_identifier` (`id_type`,`identifier`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Structure de la table `campagne`
--

DROP TABLE IF EXISTS `campagne`;
CREATE TABLE IF NOT EXISTS `campagne` (
  `ID_CAMPAGNE` smallint NOT NULL AUTO_INCREMENT,
  `ID_CLIENT` smallint DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `TITRE` varchar(50) CHARACTER SET utf8mb4  DEFAULT NULL,
  `LIBELLE` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `CONTACTS` varchar(300) CHARACTER SET utf8mb4  DEFAULT NULL,
  PRIMARY KEY (`ID_CAMPAGNE`),
  KEY `I_FK_CAMPAGNE_CLIENT` (`ID_CLIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `campagne`
--

INSERT INTO `campagne` (`ID_CAMPAGNE`, `ID_CLIENT`, `DATE`, `TITRE`, `LIBELLE`, `CONTACTS`) VALUES
(15, 23, '2025-09-10', 'Nouvelle Recette Nutella', 'Nous avons créer une nouvelle recette de Nutella et nous aimerions connaitre votre avis. Partagez vos impressions et vos suggestions pour nous aider à améliorer notre produit.', '﻿Dlardy@gmail.com\n;MartyA@hotmail.com\n;François84@gmail.com\n;Guillaume@gmail.com\n;Amazon@gmail.com\n'),
(16, 23, '2025-09-11', 'Votre moment de douceur', 'Partagez avec nous vos meilleures à base de nutella.', '﻿OrdiInfo@gmail.com\r\n;Nathalie@hotmail.com\r\n;Gérard55@gmail.com\r\n;BillyE@gmail.com\r\n;Wappli@gmail.com\r\n'),
(17, 22, '2025-06-24', 'Jouet pour enfant', 'Donnez votre avis sur les jouets pour enfant dans nos magasins. ', '﻿OrdiInfo@gmail.com\r\n;Nathalie@hotmail.com\r\n;Gérard55@gmail.com\r\n;BillyE@gmail.com\r\n;Wappli@gmail.com\r\n'),
(18, 24, '2024-12-10', 'Edition Noel ', 'Venez découvrir nos offres de noël et donnez nous votre avis.', '﻿Sandra77@gmail.com\r\n;DimitriO@hotmail.fr\r\n;RachelMira974@gmail.com\r\n;KingJ@gmail.com\r\n;JNathacha@hotmail.com\r\n;Matthew@gmail.com\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `ID_CLIENT` smallint NOT NULL AUTO_INCREMENT,
  `ID_UTILISATEUR` smallint DEFAULT NULL,
  `RAISON_SOCIALE` varchar(25) DEFAULT NULL,
  `NOM` char(20) CHARACTER SET utf8mb4  NOT NULL,
  `PRENOM` char(20) CHARACTER SET utf8mb4  NOT NULL,
  `EMAIL` char(32) CHARACTER SET utf8mb4  NOT NULL,
  `TELEPHONE` varchar(15) NOT NULL,
  `ADRESSE` char(32) CHARACTER SET utf8mb4  NOT NULL,
  `CODE_POSTAL` int NOT NULL,
  `VILLE` char(32) CHARACTER SET utf8mb4  NOT NULL,
  PRIMARY KEY (`ID_CLIENT`),
  UNIQUE KEY `I_FK_CLIENT_UTILISATEUR` (`ID_UTILISATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`ID_CLIENT`, `ID_UTILISATEUR`, `RAISON_SOCIALE`, `NOM`, `PRENOM`, `EMAIL`, `TELEPHONE`, `ADRESSE`, `CODE_POSTAL`, `VILLE`) VALUES
(22, 6, 'King Jouet', 'Lesage', 'Sidney', 'Sidney@gmail.com', '06-52-68-92-05', '23 rue Petite Fusterie', 62200, 'Boulogne-sur-mer'),
(23, 7, 'Nutella', 'Ferrero', 'Pietro', 'Nutella@gmail.com', '06-78-88-52-32', '78 chemin de matras', 82440, 'realville'),
(24, 8, 'Darty', 'Dicto', 'Eric', 'Darty@gmail.com', '06-52-67-44-88', ' 915 Rte du Nord', 82000, 'Montauban');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `namespace` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2020-12-28-223112', 'CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables', 'default', 'CodeIgniter\\Shield', 1731071026, 1),
(2, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1731071026, 1),
(3, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1731071026, 1);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `ID_QUESTION` smallint NOT NULL AUTO_INCREMENT,
  `ID_CAMPAGNE` smallint NOT NULL,
  `QUESTION` varchar(500) DEFAULT NULL,
  `TOTAL_REPONSES_1` int DEFAULT NULL,
  `TOTAL_REPONSES_2` int DEFAULT NULL,
  `TOTAL_REPONSES_3` int DEFAULT NULL,
  `TOTAL_REPONSES_4` int DEFAULT NULL,
  `TOTAL_REPONSES_5` int DEFAULT NULL,
  PRIMARY KEY (`ID_QUESTION`),
  KEY `I_FK_QUESTION_CAMPAGNE` (`ID_CAMPAGNE`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`ID_QUESTION`, `ID_CAMPAGNE`, `QUESTION`, `TOTAL_REPONSES_1`, `TOTAL_REPONSES_2`, `TOTAL_REPONSES_3`, `TOTAL_REPONSES_4`, `TOTAL_REPONSES_5`) VALUES
(31, 15, 'Comment évaluez vous le goût de la nouvelle recette de Nutella ?', NULL, NULL, NULL, NULL, NULL),
(32, 15, 'Quelle est votre satisfaction concernant la texture du produit ?', NULL, NULL, NULL, NULL, NULL),
(33, 15, 'Recommanderiez vous ce produit à vos amis ou votre famille ? ', NULL, NULL, NULL, NULL, NULL),
(34, 16, 'Comment évaluez vous votre satisfaction général avec le nouveau produit Nutella ?', NULL, NULL, NULL, NULL, NULL),
(35, 17, 'Que pensez vous des nouveaux jouets lego éditions 2025 ?', NULL, NULL, NULL, NULL, NULL),
(36, 17, 'Quel est votre satisfaction sur les jeux de société en famille proposé en magasin ? ', NULL, NULL, NULL, NULL, NULL),
(37, 18, 'Que pensez vous de nos offres de noël à - 25% sur les ordinateurs ? ', NULL, NULL, NULL, NULL, NULL),
(38, 18, 'Comment qualifierez vous la marque Samsung en therme de qualité photo ? ', NULL, NULL, NULL, NULL, NULL),
(39, 18, 'Recommanderiez vous nos produit électronique à vos amis ou votre famille ?', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `value` text COLLATE utf8mb4_general_ci,
  `type` varchar(31) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string',
  `context` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_message` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `status`, `status_message`, `active`, `last_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', NULL, NULL, 0, '2024-11-29 14:37:23', '2024-11-08 13:55:10', '2024-11-08 13:55:10', NULL),
(6, 'KingJouet', NULL, NULL, 1, '2024-11-29 13:22:25', '2024-11-29 13:22:24', '2024-11-29 13:22:25', NULL),
(7, 'Nutella', NULL, NULL, 1, '2024-11-29 14:39:05', '2024-11-29 13:26:51', '2024-11-29 13:26:51', NULL),
(8, 'Darty', NULL, NULL, 1, '2024-11-29 14:40:11', '2024-11-29 13:42:34', '2024-11-29 13:42:35', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `auth_identities`
--
ALTER TABLE `auth_identities`
  ADD CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  ADD CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  ADD CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;