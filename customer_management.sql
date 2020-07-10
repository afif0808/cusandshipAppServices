-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 10 Jul 2020 pada 05.58
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
-- Database: `customer_management`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `company_information`
--

CREATE TABLE `company_information` (
  `company_name` varchar(200) NOT NULL,
  `company_contact` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(100) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_date_added` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_date_added`) VALUES
(1, 'Muhammad Afif', '0000-00-00'),
(2, 'Aulia Shodiq', '0000-00-00'),
(3, 'Miftah Fatimah', '0000-00-00'),
(4, 'Azzami Syauqi', '0000-00-00'),
(5, 'Faqihah Aila Tuwiam', '0000-00-00'),
(6, 'Mila Fatimah', '0000-00-00'),
(7, 'Eva Yanti', '0000-00-00'),
(8, 'Didi Azani', '0000-00-00'),
(9, 'Ijon', '0000-00-00'),
(10, 'Fulan', '0000-00-00'),
(11, 'Lorem Ipsum', '0000-00-00'),
(12, 'John Doe The Unknown Man', '0000-00-00'),
(13, 'Lone wolf', '0000-00-00'),
(14, 'Another Customer A', '2020-02-21'),
(15, 'Unnamed', '2020-02-22'),
(16, 'Anonymous', '2020-02-22'),
(17, 'Eva Yanti', '2020-02-22'),
(18, 'Didi Azani', '2020-02-22'),
(19, 'Another Customer B', '2020-02-22'),
(20, 'Aqil Athal', '2020-02-22'),
(21, 'Another Customer 87', '2020-02-22'),
(22, 'Mo Du', '2020-02-22'),
(23, 'Hunous', '2020-02-22'),
(24, 'Wandei', '2020-02-22'),
(25, 'Wiwil', '2020-02-22'),
(26, 'Loding', '2020-02-22'),
(27, 'Unsin', '2020-02-22'),
(30, 'Did i do right?', '2020-02-22'),
(31, 'Don\'t Give Up', '2020-02-22'),
(32, 'Bapak Afif', '2020-02-22'),
(33, 'Gifitanem', '2020-02-22'),
(34, 'Jastanader', '2020-02-23'),
(35, 'Watgifs', '2020-02-23'),
(36, 'Ainow', '2020-02-23'),
(37, 'Aisiitnow', '2020-02-23'),
(38, 'Really Just Another Giftanem', '2020-02-23'),
(39, 'Wordepeisen', '2020-02-23'),
(40, 'Superseded', '2020-02-23'),
(41, 'Violesien', '2020-02-23'),
(42, 'Well', '2020-02-23'),
(43, 'Nawwat', '2020-02-23'),
(44, 'Pak Ridwan', '2020-02-25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers_information`
--

CREATE TABLE `customers_information` (
  `customer_id` int(100) NOT NULL,
  `customer_information` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customers_information`
--

INSERT INTO `customers_information` (`customer_id`, `customer_information`) VALUES
(1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(2, 'I don\'t accept null information'),
(3, 'I don\'t accept null information'),
(4, 'I don\'t accept null information'),
(5, 'I don\'t accept null information'),
(6, 'I don\'t accept null information'),
(7, 'I don\'t accept null information'),
(8, 'I don\'t accept null information'),
(9, 'I don\'t accept null information'),
(10, 'I don\'t accept null information'),
(11, 'I don\'t accept null information'),
(12, 'I don\'t accept null information'),
(13, 'I don\'t accept null information'),
(14, 'I don\'t accept null information'),
(15, 'I don\'t accept null information'),
(16, 'I don\'t accept null information'),
(17, 'I don\'t accept null information'),
(18, 'I don\'t accept null information'),
(19, 'I don\'t accept null information'),
(20, 'I don\'t accept null information'),
(21, 'I don\'t accept null information'),
(22, 'I don\'t accept null information'),
(23, 'I don\'t accept null information'),
(24, 'I don\'t accept null information'),
(25, 'I don\'t accept null information'),
(26, 'I don\'t accept null information'),
(27, 'I don\'t accept null information'),
(30, 'I don\'t accept null information'),
(31, 'I don\'t accept null information'),
(32, 'Jln Yuda No 12g\nKel Balonggede ,  Kec Regol\nKota Bandung , Provinsi Jawa Barat\nKode pos : 877\nNo Hp : 0878-8787-8787'),
(33, 'What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(34, 'Just Another'),
(35, 'What gives?'),
(36, 'I know'),
(37, 'I see it now'),
(38, 'How do i fix the problem?'),
(39, 'Worth the patience'),
(40, 'Suupersedid'),
(41, 'blablabalba balbal'),
(42, 'I understand'),
(43, 'Now what?'),
(44, '0823-8787-8888\nToko Shahih\nJln Medan No 80\nKota Medan , Sumatera Utara\nKode Pos : 1010');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `shipping_date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_invoice` varchar(200) NOT NULL,
  `shipping_information` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `customers_information`
--
ALTER TABLE `customers_information`
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
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `customers_information`
--
ALTER TABLE `customers_information`
  MODIFY `customer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
