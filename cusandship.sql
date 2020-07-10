-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 10 Jul 2020 pada 05.56
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cusandship`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(200) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_information` text NOT NULL,
  `customer_addedat` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_information`, `customer_addedat`) VALUES
(2, 'Muhammad Afif', '0823-8433-7698\nJln Yuda No 12g\nKel Balonggede , Kec Regol\nKota Bandung , Prov Jawa Barat\nKode Pos : 878787', '2020-03-05'),
(5, 'Aqil Athall', 'Jln Baturaden No 20/7  , Ciwastra', '2020-03-13'),
(7, 'Arjuna R Nandie', '0878-9895-5555\nJln Muhammad Toha 27\nKel Pungkur , Kec Regol\nKota Bandung , Prov Jambar', '2020-03-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(200) NOT NULL,
  `shipping_invoice` varchar(200) NOT NULL,
  `shipping_date` date NOT NULL DEFAULT current_timestamp(),
  `shipping_information` text NOT NULL,
  `customer_id` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `shipping_invoice`, `shipping_date`, `shipping_information`, `customer_id`) VALUES
(1, 'SMS001', '2020-03-11', 'Berat 3 Kilo', 1),
(2, 'SMS001', '2020-03-11', 'Berat 3 Kilo', 1),
(3, 'SMS003', '2020-03-12', 'Berat 3kg', 2),
(4, 'SMS004', '2020-03-12', 'Karung 3 pcs', 2),
(5, 'SMS004', '2020-03-12', 'Karung 3 pcs', 2),
(6, 'SMS009', '2020-03-12', 'Pakaian', 4),
(7, 'SMS005', '2020-03-12', 'Apa ya', 4),
(8, 'SMS005', '2020-03-12', 'Apa ya', 4),
(9, 'SMS099', '2020-03-13', 'Pakaian', 4),
(10, 'SMS87', '2020-03-13', 'Pakaian', 4),
(11, 'SMS88', '2020-03-13', 'Baju', 4),
(12, 'SMS88', '2020-03-13', 'Baju', 4),
(13, 'SMS88', '2020-03-13', 'Baju', 4),
(14, 'SMS88', '2020-03-13', 'Baju', 4),
(15, 'SMS009', '2020-03-13', 'Pakaian', 5),
(16, 'SMS87', '2020-03-14', 'Pakaian . 3 Karung', 2),
(17, 'SMS001', '2020-03-14', 'Pakaian', 2),
(18, '', '2020-03-14', '', 6),
(19, '', '2020-03-14', '', 6),
(20, '', '2020-03-14', '', 6),
(21, '', '2020-03-14', '', 6),
(22, '-', '2020-03-14', '', 5),
(23, '-', '2020-03-14', '', 2),
(24, '-', '2020-03-14', '', 6),
(25, '-', '2020-03-14', '', 6),
(26, '-', '2020-03-14', '', 6),
(27, '-', '2020-03-14', '', 6),
(28, '-', '2020-03-14', '', 6),
(29, '-', '2020-03-14', '', 6),
(30, '142', '2020-07-01', '', 7),
(31, 'A051', '2020-07-01', '', 7),
(32, 'A051', '2020-07-01', '3 KG , QItarabu', 7);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shipping_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
