-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2019 at 06:11 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sakul`
--
CREATE DATABASE IF NOT EXISTS `sakul` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sakul`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` float DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `stok`, `harga`, `tanggal_masuk`) VALUES
(2, 'sikat', 5, 20000, '2019-03-24'),
(3, 'ember', 5, 25000, '2019-03-24');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tipe_mobil` varchar(255) NOT NULL,
  `plat_nomor_mobil` varchar(255) NOT NULL,
  `tanggal_cuci` date NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `jenis_cuci_id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `customer_name`, `tipe_mobil`, `plat_nomor_mobil`, `tanggal_cuci`, `status`, `jenis_cuci_id`, `user_id`) VALUES
(17, 'Test2', 'Nissan', 'A1234BC', '2019-03-18', 'Sudah diterima Admin', 2, 4),
(18, 'TestOffline', 'Mazda CX5', 'D1234KK', '2019-03-31', 'Sudah dibayar', 1, 1),
(20, 'Test1', 'Mazda', 'D1234FI', '2019-03-31', 'Sudah dibayar', 1, 3),
(21, 'Test1', 'Mazda', 'D1234FI', '2019-04-01', 'Sudah diterima Admin', 2, 3),
(22, 'Test1', 'Mazda', 'D1234FI', '2019-04-04', 'Menunggu konfirmasi', 2, 3),
(23, 'Test1', 'Mazda', 'D1234FI', '2019-04-12', 'Menunggu konfirmasi', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_cuci`
--

CREATE TABLE `jenis_cuci` (
  `id` int(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_cuci`
--

INSERT INTO `jenis_cuci` (`id`, `nama`, `harga`) VALUES
(1, 'Cuci Biasa', 100000),
(2, 'Salon\r\n', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'customer\r\n'),
(3, 'owner\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `tipe_mobil` varchar(255) DEFAULT NULL,
  `plat_nomor_mobil` varchar(255) DEFAULT NULL,
  `role_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `phone_number`, `tipe_mobil`, `plat_nomor_mobil`, `role_id`) VALUES
(1, 'administrator', '21232f297a57a5a743894a0e4a801fc3', 'adminsakul@gmail.com', '0812345678910', '--', '--', 1),
(2, 'dummyCustomer', '275876e34cf609db118f3d84b799a790', 'dummy1@gmail.com', '0812345678910', NULL, NULL, 2),
(3, 'Test1', '098f6bcd4621d373cade4e832627b4f6', 'test1@gmail.com', '08123213131', 'Mazda', 'D1234FI', 2),
(4, 'Test2', '098f6bcd4621d373cade4e832627b4f6', 'test2@gmail.com', '0812345678910', 'Nissan', 'A1234BC', 2),
(5, 'Test3', '098f6bcd4621d373cade4e832627b4f6', 'test3@gmail.com', '081234567899', NULL, NULL, 2),
(6, 'lukas ', '1d028378e12ca6bdafa3b8b21bc5a9ea', 'lukas@gmail.com', '0812312313', NULL, NULL, 2),
(7, 'owner', '72122ce96bfec66e2396d2e25225d70a', 'ownersakul@gmail.com', '081231313123', '---', '---', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_cuci_id_booking` (`jenis_cuci_id`),
  ADD KEY `user_id_booking` (`user_id`);

--
-- Indexes for table `jenis_cuci`
--
ALTER TABLE `jenis_cuci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id_user` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jenis_cuci`
--
ALTER TABLE `jenis_cuci`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `jenis_cuci_id_booking` FOREIGN KEY (`jenis_cuci_id`) REFERENCES `jenis_cuci` (`id`),
  ADD CONSTRAINT `user_id_booking` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `role_id_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
