-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 04:46 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fast_learn`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id_admin` char(8) NOT NULL,
  `Nama_admin` varchar(30) NOT NULL,
  `Jenis_kelamin` char(1) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `ID` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `Kode_fak` char(8) NOT NULL,
  `Nama_fak` varchar(30) NOT NULL,
  `Alamat` varchar(40) NOT NULL,
  `Kode_materi` char(8) NOT NULL,
  `Id_siswa` char(8) NOT NULL,
  `Id_tanya` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ID` char(8) NOT NULL,
  `Text_feedback` varchar(300) NOT NULL,
  `Tgl_feedback` date NOT NULL,
  `Id_siswa` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `Kode_materi` char(8) NOT NULL,
  `Nama_materi` varchar(30) NOT NULL,
  `Biaya` int(10) NOT NULL,
  `Prasyarat` varchar(60) NOT NULL,
  `Id_siswa` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `Id_tanya` char(8) NOT NULL,
  `Text_tanya` varchar(100) NOT NULL,
  `Tgl_tanya` date NOT NULL,
  `Text_respon` varchar(500) NOT NULL,
  `Tgl_respon` date NOT NULL,
  `Id_siswa` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pusat_studi`
--

CREATE TABLE `pusat_studi` (
  `Kode_studi` char(8) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Lokasi` varchar(40) NOT NULL,
  `Id_siswa` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `Id_siswa` char(8) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis_kelamin` char(1) NOT NULL,
  `Tgl_lahir` date NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_admin`),
  ADD KEY `melihat/dilihat` (`ID`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`Kode_fak`),
  ADD KEY `mengajari/diajari` (`Kode_materi`),
  ADD KEY `menyuruh/mengirimkan` (`Id_siswa`),
  ADD KEY `menyelesaikan` (`Id_tanya`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `memberikan` (`Id_siswa`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`Kode_materi`),
  ADD KEY `mengikuti` (`Id_siswa`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`Id_tanya`),
  ADD KEY `memposting` (`Id_siswa`);

--
-- Indexes for table `pusat_studi`
--
ALTER TABLE `pusat_studi`
  ADD PRIMARY KEY (`Kode_studi`),
  ADD KEY `menyuruh` (`Id_siswa`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`Id_siswa`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `feedback` (`ID`);

--
-- Constraints for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD CONSTRAINT `fakultas_ibfk_1` FOREIGN KEY (`Kode_materi`) REFERENCES `materi` (`Kode_materi`),
  ADD CONSTRAINT `fakultas_ibfk_2` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`),
  ADD CONSTRAINT `fakultas_ibfk_3` FOREIGN KEY (`Id_tanya`) REFERENCES `pertanyaan` (`Id_tanya`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`);

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`);

--
-- Constraints for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD CONSTRAINT `pertanyaan_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`);

--
-- Constraints for table `pusat_studi`
--
ALTER TABLE `pusat_studi`
  ADD CONSTRAINT `pusat_studi_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
