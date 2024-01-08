-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 10:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bk_poli`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(10) UNSIGNED NOT NULL,
  `id_jadwal` int(10) UNSIGNED NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `tanggal`) VALUES
(23, 5, 3, 'jantung berdetak keras', 1, '2024-01-05 15:52:16'),
(24, 7, 1, 'GIGI BERLUBANG', 1, '2024-01-06 07:15:23'),
(25, 8, 1, 'gigi berlubang', 2, '2024-01-06 07:17:44'),
(26, 5, 3, 'jantung berdebar', 2, '2024-01-06 07:19:53'),
(27, 5, 2, 'jantung berdetak lebih kencang', 1, '2024-01-06 07:20:37'),
(28, 9, 1, 'gigi sakit', 3, '2024-01-06 07:27:27'),
(29, 10, 4, 'sesak napas dan nyeri dada', 1, '2024-01-06 07:30:40'),
(30, 11, 5, 'demam', 1, '2024-01-06 07:41:51'),
(31, 12, 5, 'demam, batuk pilek', 2, '2024-01-06 07:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_periksa` int(10) UNSIGNED NOT NULL,
  `id_obat` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(19, 83, 1),
(20, 84, 4),
(21, 85, 4),
(22, 86, 5),
(23, 87, 7),
(24, 88, 6),
(25, 89, 4),
(26, 90, 8);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(10) UNSIGNED NOT NULL,
  `nip` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`, `nip`, `password`) VALUES
(1, 'dr. Bram', 'jalan ga tau', '083424212321', 1, 903218321, '$2y$10$sXiPp4ih.utTW9ZQ7E66eOh7EJwwGTFHdrFNvzXQ2.Naa8rVFraPK'),
(2, 'dr. Heartman', 'Heartman\'s Lab', '08639284892', 2, 903218117, '$2y$10$gguvWIkx7qoNCgCmtLDj8upxPVRZGaD3yTjgEpSHDr.G8i7nb8nGO'),
(3, 'dr. Sulfat', 'jalanin aja dulu', '087927482648', 2, 903218116, '$2y$10$Ts5szdz5/I1yf8XfnDFNT.KTk..BiRQIdz3Zm.rvsrwLVpZ.M/G.u'),
(4, 'dr.vvita', 'jalan kenangan bersamamu', '081667889180', 6, 903218307, '$2y$10$QoBzlBuQ16PwAz/uMKVHr.8gtR0WihFxddex5JZ54RIJtpSrmmx6S');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dokter` int(10) UNSIGNED NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(1, 1, 'Senin', '13:00:00', '15:00:00'),
(2, 2, 'Selasa', '10:00:00', '12:00:00'),
(3, 3, 'Kamis', '20:16:00', '23:19:00'),
(4, 2, 'Kamis', '10:50:00', '00:50:00'),
(5, 4, 'Rabu', '06:51:00', '09:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'sulfats', 'plastic', 27000),
(2, 'folat', 'gelas', 32000),
(4, 'paracetamol', 'kaplet', 10000),
(5, 'lasik', 'tablet', 50000),
(6, 'concor', 'tablet', 60000),
(7, 'asam mafenamat', 'tablet', 10000),
(8, 'paratusin', 'tablet', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(1, 'Blahaj', 'jl. boyke734', '$2y$10$FKl1GSqTQZBstnCNEQYzieX5rmGfa/Z4LbIZm1vzR7wPjIuTwrumy', '083479826732', '2024-01-05-1'),
(2, 'Blohoj', 'Lautan Blahaj', '$2y$10$U1H6LgzwtY.flL22.l0uPOLLYdsOjB3WR6RAjjLIqfOwluqtB4Ns6', '08326718321', '2024-01-05-2'),
(3, 'Blehej', 'jl. boyke736', '$2y$10$yAKMShvXk5gubp/LENyEKuJDNb6zy78i0shnyetN9U/qHBmO23suC', '083479826732', '2024-01-05-3'),
(5, 'vita', 'ngaliyan', '$2y$10$oDtmmRREw6YBVt24zJoLQeC3rjrWqx0i5/RTfLpjOxhX3RGg84Kna', '113444', '2024-01-05-4'),
(6, 'vitaaa', 'semarang', '$2y$10$RhNnKUQ2VWeO1j70NlX0WuGAUx7iTWaJDcmhH9RqyG3mKKZGdcKia', '08161778922', '2024-01-05-5'),
(7, 'vitaekaa', 'ngaliyan', '$2y$10$97ii31aHppx1sbJI6YulI.dPeVmfGRq5dmwUP821rxPLUQSPChgZO', '081617789100', '2024-01-05-6'),
(8, 'hendrik', 'podorejo', '$2y$10$2v9NJaLjkddAsn0rukbL9uWuk/96NDiB1z0aj3WtsTfYRAQzDBTSG', '081617789186', '2024-01-06-7'),
(9, 'enzi', 'ngaliyan', '$2y$10$p1lIeYIV1ELl1wV/cNylieXfgsGMTmDqSp85YG07pbWFobF1WriZm', '08165528865', '2024-01-06-8'),
(10, 'clara', 'podorejo', '$2y$10$WNeGXlibD/Bb8r/FdyIOEulnWnW12HNFOvcxtivvmgGx4eRNZRY7S', '0816657782', '2024-01-06-9'),
(11, 'teman', 'surabaya', '$2y$10$8Lk/WNrI0E3momFmhRGHNuCD4DUBSOzy2JLidR6EoLEq2mg86h/yK', '0877766554', '2024-01-06-10'),
(12, 'laura', 'mangkang', '$2y$10$ZiP6EG8erRe1SuWEW4Qby.KLpwKuRlniqJViCAPUGuk25C6e8kF2i', '0897765543', '2024-01-06-11');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_daftar_poli` int(10) UNSIGNED NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(83, 23, '2024-01-05 16:54:40', 'minum obat 3x1', 177000),
(84, 24, '2024-01-06 08:18:38', 'minum obat pereda nyeri', 160000),
(85, 25, '2024-01-06 08:18:54', 'minum obat 3x1', 160000),
(86, 27, '2024-01-06 08:23:40', 'minum obat ', 200000),
(87, 28, '2024-01-06 08:28:22', 'minum obat 3x1', 160000),
(88, 29, '2024-01-06 08:31:14', 'minum obat ', 210000),
(89, 30, '2024-01-06 08:42:47', 'minum obat 3x1', 160000),
(90, 31, '2024-01-06 08:53:52', 'minum obat 3x1', 175000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'poli gigi', 'sakit gigi berlubang'),
(2, 'poli jantung', 'sakit serangan jantung'),
(6, 'poli anak', 'untuk anak');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'rayhand', '$2y$10$Vm8PKNcH1y8NbRGb6uGCmuAMR21aAQHOVeK3HbkfUws50bgOSL5Ha'),
(2, 'tukinem', '$2y$10$DajdmG5k4yWMql5Q8TVg6.137mKzNsTNAXZYjHaZuKts//malkKby'),
(3, 'vita', '$2y$10$2j99cstm6b0Ch.z1mLzje.NTLjYHWZvQKXFn7ebS0EzN3jZc.W6iC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_periksa` (`id_periksa`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periksa_ibfk_1` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `daftar_poli_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`),
  ADD CONSTRAINT `daftar_poli_ibfk_4` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `detail_periksa_ibfk_2` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `jadwal_periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
