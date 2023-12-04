-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Des 2023 pada 14.49
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `masakan`
--

CREATE TABLE `masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `status_makanan` enum('Tersedia','Habis','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masakan`
--

INSERT INTO `masakan` (`id_masakan`, `nama_masakan`, `harga`, `status_makanan`) VALUES
(1, 'Bakso', 15000, 'Tersedia'),
(3, 'Sate', 17000, 'Tersedia'),
(11, 'Soto', 15000, 'Habis'),
(22, 'Pecel', 13000, 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `nama_masakan` varchar(30) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `waktu_pesan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `metode_pembayaran` enum('Tunai','Kartu Kredit','Transfer','') NOT NULL,
  `status_pembayaran` enum('Belum Lunas','Lunas','Gagal','') NOT NULL,
  `total_bayar` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `nama_masakan`, `jumlah`, `waktu_pesan`, `metode_pembayaran`, `status_pembayaran`, `total_bayar`) VALUES
(9, 'Soto', 3, '2023-12-04 10:31:43', 'Tunai', 'Lunas', 45000),
(10, 'Soto', 2, '2023-12-04 10:33:35', 'Tunai', 'Lunas', 30000),
(14, 'Bakso', 23, '2023-12-04 12:03:07', 'Tunai', 'Lunas', 345000),
(15, 'Pecel', 5, '2023-12-04 12:03:51', 'Tunai', 'Lunas', 65000),
(16, 'Sate', 20, '2023-12-04 12:42:36', 'Tunai', 'Lunas', 340000),
(17, 'Pecel', 11, '2023-12-04 13:13:48', 'Kartu Kredit', 'Lunas', 143000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_user` varchar(20) NOT NULL,
  `id_level` enum('1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_user`, `id_level`) VALUES
(123, 'geral', 'geral', 'gerald', '1'),
(1223, 'iya', 'iya', 'iya', '5'),
(12333, 'rio', 'rio', 'rio', '3'),
(21124, 'nay', 'nay', 'nay', '4'),
(1231244, 'ari', 'ari', 'ari', '2');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masakan`
--
ALTER TABLE `masakan`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1231245;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
