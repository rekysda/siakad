-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2024 pada 10.18
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sisterv4fratz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `telegram_autobot`
--

DROP TABLE IF EXISTS `telegram_autobot`;
CREATE TABLE `telegram_autobot` (
  `id` int(11) NOT NULL,
  `date` text NOT NULL,
  `chat_id` text NOT NULL,
  `text` text NOT NULL,
  `usernametele` text NOT NULL,
  `email` text NOT NULL,
  `usernamelogin` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `telegram_autobot`
--
ALTER TABLE `telegram_autobot`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `telegram_autobot`
--
ALTER TABLE `telegram_autobot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
