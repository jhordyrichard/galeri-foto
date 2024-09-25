-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Sep 2024 pada 06.08
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_galerifoto`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `albumid` int(11) NOT NULL,
  `namaalbum` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggalbuat` date NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`albumid`, `namaalbum`, `deskripsi`, `tanggalbuat`, `userid`) VALUES
(24, 'Teknologi', 'teknologi', '2024-08-21', 10),
(25, 'Otomotif', 'otomotif', '2024-08-21', 9),
(26, 'Teknologi', 'teknologi', '2024-08-21', 9),
(28, 'Otomotif', 'otomotif', '2024-08-22', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `fotoid` int(11) NOT NULL,
  `judulfoto` varchar(255) NOT NULL,
  `deskripsifoto` text NOT NULL,
  `tanggalunggahan` date NOT NULL,
  `lokasifile` varchar(255) NOT NULL,
  `albumid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `foto`
--

INSERT INTO `foto` (`fotoid`, `judulfoto`, `deskripsifoto`, `tanggalunggahan`, `lokasifile`, `albumid`, `userid`) VALUES
(21, 'Mobil', 'mobil', '2024-09-25', '190988390-mobil.jpg', 25, 9),
(25, 'Motor', 'motor', '2024-08-22', '858932842-zx.jpg', 28, 10),
(27, 'Kamera', 'kamera', '2024-08-26', '156610820-kamera.jpg', 26, 9),
(28, 'Komputer', 'komputer', '2024-09-25', '1934919312-komputer.jpg', 24, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `komentarid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `isikomentar` text NOT NULL,
  `tanggalkomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `komentarfoto`
--

INSERT INTO `komentarfoto` (`komentarid`, `fotoid`, `userid`, `isikomentar`, `tanggalkomentar`) VALUES
(1, 21, 9, 'Keren sekali bro', '2024-08-26'),
(2, 21, 9, 'Mau beli ini', '2024-08-26'),
(4, 25, 9, 'Jelek gambar foto nya', '2024-08-26'),
(6, 27, 9, 'Mantap bro', '2024-08-26'),
(7, 25, 10, 'motor jelek', '2024-08-27'),
(9, 27, 9, 'Nikon kurang bagus bro', '2024-08-28'),
(10, 28, 10, 'biasa aja bro', '2024-09-25'),
(11, 28, 9, 'lumayanlah', '2024-09-25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likefoto`
--

CREATE TABLE `likefoto` (
  `likeid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tanggallike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `likefoto`
--

INSERT INTO `likefoto` (`likeid`, `fotoid`, `userid`, `tanggallike`) VALUES
(37, 21, 9, '2024-08-26'),
(38, 25, 9, '2024-08-26'),
(43, 21, 10, '2024-08-27'),
(44, 27, 10, '2024-08-27'),
(46, 25, 10, '2024-08-27'),
(48, 27, 9, '2024-08-27'),
(49, 28, 10, '2024-09-25'),
(50, 28, 9, '2024-09-25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `namalengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `email`, `namalengkap`, `alamat`) VALUES
(1, 'aa', 'aa', 'aa@gmail.com', 'aa', 'aa'),
(9, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'Admin', 'Indonesia'),
(10, 'akun2', '9ce0ca3d09106a37842cfcbfbdf2f60d', 'akun2@gmail.com', 'Akun2', 'Indonesia'),
(11, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'Admin', 'Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`albumid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`fotoid`),
  ADD KEY `albumid` (`albumid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`komentarid`),
  ADD KEY `fotoid` (`fotoid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`likeid`),
  ADD KEY `fotoid` (`fotoid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `albumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `fotoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `komentarid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `likeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foto_ibfk_2` FOREIGN KEY (`albumid`) REFERENCES `album` (`albumid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD CONSTRAINT `komentarfoto_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komentarfoto_ibfk_2` FOREIGN KEY (`fotoid`) REFERENCES `foto` (`fotoid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD CONSTRAINT `likefoto_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likefoto_ibfk_2` FOREIGN KEY (`fotoid`) REFERENCES `foto` (`fotoid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
