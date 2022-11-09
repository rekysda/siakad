-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2022 at 07:07 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `purchase` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `profit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `year`, `purchase`, `sale`, `profit`) VALUES
(1, 2013, 2000, 3000, 1000),
(2, 2014, 4500, 5000, 500),
(3, 2015, 3000, 4500, 1500),
(4, 2016, 2000, 3000, 1000),
(5, 2017, 2000, 4000, 2000),
(6, 2018, 2200, 3000, 800),
(7, 2019, 5000, 7000, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `akad_journalkbm`
--

DROP TABLE IF EXISTS `akad_journalkbm`;
CREATE TABLE `akad_journalkbm` (
  `id` int(10) NOT NULL,
  `jadwal_id` int(10) NOT NULL,
  `tahunakademik_id` int(10) NOT NULL,
  `mapel_id` int(10) NOT NULL,
  `kelas_id` int(10) NOT NULL,
  `guru_id` int(10) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `jamke` varchar(50) NOT NULL,
  `materi` text NOT NULL,
  `keterangan` text NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akad_journalkbm`
--

INSERT INTO `akad_journalkbm` (`id`, `jadwal_id`, `tahunakademik_id`, `mapel_id`, `kelas_id`, `guru_id`, `hari`, `tanggal`, `jamke`, `materi`, `keterangan`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 5, 'kamis', '2019-07-25', '4', 'test 444', 'keterangan 444', '2019-07-24 21:06:56'),
(3, 4, 1, 3, 1, 2, 'Rabu', '2019-07-24', '3', 'Jurnal 3', '', '2019-07-24 20:06:42'),
(4, 1, 1, 1, 1, 5, 'Senin', '2019-07-22', '1', 'Pertemuan 1', '', '2019-07-24 20:19:44'),
(6, 1, 1, 1, 1, 5, 'Jumat', '2019-07-26', '6', 'jam ke 6', '', '2019-07-24 21:03:50'),
(7, 1, 1, 1, 1, 5, 'Senin', '2019-06-24', '1', 'Materi 00', '', '2019-07-26 08:51:08'),
(8, 8, 1, 1, 3, 5, 'Rabu', '2019-07-29', '1', 'perkenalan', '', '2019-07-26 09:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `akad_kegiatanakademik`
--

DROP TABLE IF EXISTS `akad_kegiatanakademik`;
CREATE TABLE `akad_kegiatanakademik` (
  `id` int(6) NOT NULL,
  `judul` varchar(500) NOT NULL,
  `tanggal_awal` datetime NOT NULL,
  `tanggal_akhir` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akad_kegiatanakademik`
--

INSERT INTO `akad_kegiatanakademik` (`id`, `judul`, `tanggal_awal`, `tanggal_akhir`) VALUES
(1, 'Makan Siang', '2019-07-04 06:00:49', '2019-07-05 16:00:58'),
(3, 'Makan Malam', '2019-07-12 12:00:06', '2019-07-13 12:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `akad_siswaabsenharian`
--

DROP TABLE IF EXISTS `akad_siswaabsenharian`;
CREATE TABLE `akad_siswaabsenharian` (
  `id` int(5) NOT NULL,
  `tahunakademik_id` varchar(10) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `kelas_id` varchar(10) NOT NULL,
  `siswa_id` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akad_siswaabsenharian`
--

INSERT INTO `akad_siswaabsenharian` (`id`, `tahunakademik_id`, `semester`, `bulan`, `tahun`, `tanggal`, `kelas_id`, `siswa_id`, `status`) VALUES
(1, '1', '1', '6', '2019', '2019-06-02', '1', '1', 'H'),
(2, '1', '1', '6', '2019', '2019-06-02', '1', '3', 'H'),
(3, '1', '1', '6', '2019', '2019-06-02', '1', '5', 'H'),
(4, '1', '1', '6', '2019', '2019-06-02', '1', '7', 'H'),
(5, '1', '1', '6', '2019', '2019-06-02', '1', '8', 'H'),
(6, '1', '1', '6', '2019', '2019-06-02', '1', '11', 'H'),
(7, '1', '1', '6', '2019', '2019-06-03', '1', '1', 'H'),
(8, '1', '1', '6', '2019', '2019-06-03', '1', '3', 'A'),
(9, '1', '1', '6', '2019', '2019-06-03', '1', '5', 'A'),
(10, '1', '1', '6', '2019', '2019-06-03', '1', '7', 'H'),
(11, '1', '1', '6', '2019', '2019-06-03', '1', '8', 'H'),
(12, '1', '1', '6', '2019', '2019-06-03', '1', '11', 'H'),
(28, '1', '1', '6', '2019', '2019-06-01', '4', '6', 'S'),
(29, '1', '1', '6', '2019', '2019-06-03', '4', '6', 'A'),
(36, '1', '1', '6', '2019', '2019-06-01', '3', '9', 'S'),
(37, '1', '1', '6', '2019', '2019-06-01', '3', '13', 'H'),
(38, '1', '1', '6', '2019', '2019-06-01', '3', '15', 'H'),
(39, '1', '1', '6', '2019', '2019-06-01', '3', '17', 'H'),
(40, '1', '1', '6', '2019', '2019-06-01', '3', '18', 'S'),
(46, '1', '1', '6', '2019', '2019-06-04', '3', '9', 'H'),
(47, '1', '1', '6', '2019', '2019-06-04', '3', '13', 'H'),
(48, '1', '1', '6', '2019', '2019-06-04', '3', '15', 'H'),
(49, '1', '1', '6', '2019', '2019-06-04', '3', '17', 'S'),
(50, '1', '1', '6', '2019', '2019-06-04', '3', '18', 'S'),
(51, '1', '1', '6', '2019', '2019-06-24', '1', '1', 'H'),
(52, '1', '1', '6', '2019', '2019-06-24', '1', '3', 'S'),
(53, '1', '1', '6', '2019', '2019-06-24', '1', '5', 'S'),
(54, '1', '1', '6', '2019', '2019-06-24', '1', '7', 'H'),
(55, '1', '1', '6', '2019', '2019-06-24', '1', '8', 'H'),
(56, '1', '1', '6', '2019', '2019-06-24', '1', '11', 'H'),
(57, '1', '1', '6', '2019', '2019-06-01', '1', '1', 'H'),
(58, '1', '1', '6', '2019', '2019-06-01', '1', '3', 'S'),
(59, '1', '1', '6', '2019', '2019-06-01', '1', '5', 'S'),
(60, '1', '1', '6', '2019', '2019-06-01', '1', '7', 'S'),
(61, '1', '1', '6', '2019', '2019-06-01', '1', '8', 'H'),
(62, '1', '1', '6', '2019', '2019-06-01', '1', '11', 'H'),
(63, '1', '1', '7', '2019', '2019-07-01', '1', '1', 'I'),
(64, '1', '1', '7', '2019', '2019-07-01', '1', '3', 'H'),
(65, '1', '1', '7', '2019', '2019-07-01', '1', '5', 'H'),
(66, '1', '1', '7', '2019', '2019-07-01', '1', '7', 'H'),
(67, '1', '1', '7', '2019', '2019-07-01', '1', '8', 'H'),
(68, '1', '1', '7', '2019', '2019-07-01', '1', '11', 'H'),
(69, '1', '1', '7', '2019', '2019-07-02', '1', '1', 'A'),
(70, '1', '1', '7', '2019', '2019-07-02', '1', '3', 'H'),
(71, '1', '1', '7', '2019', '2019-07-02', '1', '5', 'H'),
(72, '1', '1', '7', '2019', '2019-07-02', '1', '7', 'H'),
(73, '1', '1', '7', '2019', '2019-07-02', '1', '8', 'H'),
(74, '1', '1', '7', '2019', '2019-07-02', '1', '11', 'H');

-- --------------------------------------------------------

--
-- Table structure for table `apiemail`
--

DROP TABLE IF EXISTS `apiemail`;
CREATE TABLE `apiemail` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apiemail`
--

INSERT INTO `apiemail` (`id`, `name`, `value`) VALUES
(1, 'email_sekolah', 'rekysda@gmail.com'),
(3, 'sent_notif_paid', '1'),
(4, 'email_kepsek', 'rekyefin@gmail.com'),
(5, 'send_notif_bukutamu', '1'),
(6, 'send_notif_pelanggaran', '1');

-- --------------------------------------------------------

--
-- Table structure for table `apisms`
--

DROP TABLE IF EXISTS `apisms`;
CREATE TABLE `apisms` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apisms`
--

INSERT INTO `apisms` (`id`, `name`, `value`) VALUES
(1, 'user_api_sms', 'reky'),
(2, 'user_key_sms', 'cd9c3b3c0d59ef02ef21736f32688159'),
(3, 'sent_notif_paid', '0'),
(4, 'hp_kepsek', '081335054383'),
(5, 'send_notif_bukutamu', '1'),
(6, 'send_notif_pelanggaran', '1');

-- --------------------------------------------------------

--
-- Table structure for table `bk_kategori_pelanggaran`
--

DROP TABLE IF EXISTS `bk_kategori_pelanggaran`;
CREATE TABLE `bk_kategori_pelanggaran` (
  `id` int(5) NOT NULL,
  `kategori` varchar(215) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bk_kategori_pelanggaran`
--

INSERT INTO `bk_kategori_pelanggaran` (`id`, `kategori`) VALUES
(7, 'A. KEDISIPLINAN'),
(8, 'B. KEBERSIHAN'),
(9, 'C. KESEHATAN'),
(10, 'D. TANGGUNG JAWAB'),
(11, 'E. SOPAN SANTUN'),
(12, 'F. HUBUNGAN SOSIAL'),
(13, 'G. KEJUJURAN'),
(14, 'H. PELAKSANAAN IBADAH');

-- --------------------------------------------------------

--
-- Table structure for table `bk_pelanggaran`
--

DROP TABLE IF EXISTS `bk_pelanggaran`;
CREATE TABLE `bk_pelanggaran` (
  `id` int(5) NOT NULL,
  `kategori_id` int(4) NOT NULL,
  `pelanggaran` varchar(512) NOT NULL,
  `point` int(10) NOT NULL,
  `sanksi` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bk_pelanggaran`
--

INSERT INTO `bk_pelanggaran` (`id`, `kategori_id`, `pelanggaran`, `point`, `sanksi`) VALUES
(25, 7, 'Meninggalkan kelas, pelajaran dan sekolah tanpa izin guru pengajar', 20, ''),
(26, 7, 'Tidak segera masuk kelas setelah bel dibunyikan', 10, ''),
(27, 7, 'Membawa kartu/bermain kartu', 15, ''),
(28, 7, 'Dengan sengaja mengoperasikan HP pada saat pelajaran sedang berlangsung', 15, ''),
(29, 7, 'Tidak/lupa/lalai mematikan HP pada saat pelajaran sedang berlangsung', 10, ''),
(31, 7, 'Mengkonsumsi makanan dan minuman dalam bentuk apapun saat pelajaran sedang berlangsung', 15, ''),
(32, 7, 'Terlambat masuk sekolah', 10, 'Siswa diberi sanksi ketertiban seperti baris berbaris, lari'),
(33, 7, 'Ke kantin saat jam pelajaran sedang berlangsung', 20, ''),
(34, 7, 'Absen tanpa keterangan/alpha', 20, ''),
(35, 7, 'Mengeluarkan baju selama berada di lingkungan sekolah (Seragam Putih Abu Abu)', 10, ''),
(36, 7, 'Mengenakan seragam yang tidak sesuai dengan ketentuan sekolah', 15, ''),
(37, 7, 'Tidak memakai seragam (pada saat pelajaran olah raga)', 10, ''),
(38, 7, 'Tidak memakai baju batik pada Hardiknas dan Harkitnas', 10, ''),
(39, 7, 'Memakai model seragam yang tidak sesuai dengan ketentuan sekolah', 15, ''),
(40, 7, 'Potongan rambut yang tidak sesuai dengan ketentuan sekolah ', 15, ''),
(41, 8, ' Mencorat-coret/merusak fasilitas sekolah', 20, ''),
(42, 8, 'Menyemir rambut kecuali warna hitam', 20, ''),
(43, 8, 'Membuang sampah tidak pada tempatnya', 10, ''),
(44, 8, 'Kuku di cat', 20, ''),
(45, 8, 'Seragam yang dicorat-coret (baju,dasi,rok dan celana)', 20, ''),
(46, 9, ' Merokok dan minum minuman keras', 50, ''),
(47, 9, 'Mengkonsumsi Narkoba', 100, ''),
(48, 9, 'Tidak Mengikuti pelajaran Olah Raga tanpa keterangan', 20, ''),
(49, 9, 'Mentato tubuh permanen maupun tidak permanen', 50, ''),
(50, 9, 'Memakai kosmetik berlebihan', 20, ''),
(51, 10, 'Mengerjakan tugas yang tidak sesuai dengan mata pelajaran yang sedang dikerjakan', 10, ''),
(52, 10, 'Mengabaikan panggilan yang diberikan oleh kepala sekoalah, guru dan pegawai', 20, ''),
(53, 10, 'Tidak Membawa buku pribadi selama proses belajar mengajar berlangsung', 10, ''),
(54, 10, 'Buku pribadi hilang', 20, ''),
(55, 10, 'Tidak mengerjakan PR/tugas dari guru', 20, ''),
(56, 11, 'Berpilaku tidak sopan', 20, ''),
(57, 11, 'Mengeluarkan kata-kata kotor', 20, ''),
(58, 11, 'Tidak Menghargai orang lain', 10, ''),
(59, 12, 'Memakai perhiasan yang dilarang', 10, ''),
(60, 12, 'Putra memakai giwang, putri memakai giwang lebih dari satu pasang', 15, ''),
(61, 12, 'Berkelahi', 50, ''),
(62, 12, 'Mencuri', 100, ''),
(63, 12, 'Hamil dan Menghamili', 100, ''),
(64, 13, ' Mencontek pada saat ujian/ulangan', 20, ''),
(65, 13, 'Memberikan contekan pada saat ujian/ulangan', 20, ''),
(66, 13, 'Mengubah/memalsu rapor', 100, ''),
(67, 13, 'Membuat izin palsu', 50, ''),
(68, 13, 'Memalsu tanda tangan pegawai/guru/orang tua/wali/kepala sekolah/stempel sekolah', 100, ''),
(69, 13, 'Berbohong pada kepala sekolah,guru dan pegawai', 25, ''),
(71, 14, 'Ramai saat mengikuti ibadah', 25, ''),
(72, 14, 'Tidak Mengikuti Ibadah Wajib yang diadakan Sekolah', 25, '');

-- --------------------------------------------------------

--
-- Table structure for table `bk_siswapelanggaran`
--

DROP TABLE IF EXISTS `bk_siswapelanggaran`;
CREATE TABLE `bk_siswapelanggaran` (
  `id` int(5) NOT NULL,
  `tahunakademik_id` varchar(10) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `siswa_id` varchar(10) NOT NULL,
  `kelas_id` varchar(50) NOT NULL,
  `pelanggaran_id` varchar(10) NOT NULL,
  `point` varchar(50) NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bk_siswapelanggaran`
--

INSERT INTO `bk_siswapelanggaran` (`id`, `tahunakademik_id`, `semester`, `tanggal`, `siswa_id`, `kelas_id`, `pelanggaran_id`, `point`, `status`) VALUES
(3, '1', '1', '2019-08-26', '1', '1', '64', '20', '1'),
(4, '1', '1', '2019-08-26', '11', '1', '32', '10', '1'),
(5, '1', '1', '2019-08-26', '6', '4', '29', '10', '1'),
(6, '1', '1', '2019-08-27', '3', '1', '69', '25', '1'),
(7, '1', '1', '2019-08-27', '1', '1', '41', '20', '0'),
(8, '1', '1', '2019-08-28', '6', '4', '58', '10', '0');

-- --------------------------------------------------------

--
-- Table structure for table `bukutamu`
--

DROP TABLE IF EXISTS `bukutamu`;
CREATE TABLE `bukutamu` (
  `id` int(6) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `maksud` varchar(500) NOT NULL,
  `diterima` varchar(500) NOT NULL,
  `catatan` varchar(500) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bukutamu`
--

INSERT INTO `bukutamu` (`id`, `tahun`, `nomor`, `tanggal`, `nama`, `jabatan`, `hp`, `maksud`, `diterima`, `catatan`, `status`) VALUES
(1, '2019', '20190001', '2019-08-22', 'Bobby', 'Marketing', '081335054383', 'Penawaran Sistem', 'Kepala Sekolah', 'tdk ada', 1),
(3, '2019', '20190002', '2019-08-23', 'Goldie', 'Guru', '08123271294', 'Tidak Ada', 'Kepsek', '-', 1),
(4, '2019', '20190003', '2019-08-23', 'Andre', 'CEO', '081223345', 'Kerjasama', 'Kepala Sekolah', 'Pertemuan pertama', 1),
(6, '2019', '20190005', '2019-08-24', '123', '123', '123', '123', '123', '', 0),
(7, '2019', '20190006', '2019-10-18', 'Andri', 'Panitia Lomba', '081335054838', 'Bantuan Dana untuk Lomba', 'Kepala Sekolah', '-', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hrd_penggajian`
--

DROP TABLE IF EXISTS `hrd_penggajian`;
CREATE TABLE `hrd_penggajian` (
  `id` int(2) NOT NULL,
  `id_pegawai` int(6) NOT NULL,
  `bulan` int(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tanggalcetak` timestamp NOT NULL DEFAULT current_timestamp(),
  `gajipokok` varchar(50) NOT NULL DEFAULT '0',
  `gelar` varchar(50) NOT NULL,
  `sertifikasi` varchar(50) NOT NULL,
  `masakerja` varchar(50) NOT NULL,
  `gajiperjam` varchar(50) NOT NULL,
  `jamngajar` varchar(50) NOT NULL,
  `gajingajar` varchar(50) NOT NULL,
  `transport` varchar(50) NOT NULL,
  `laboratorium` varchar(50) NOT NULL,
  `walikelas` varchar(50) NOT NULL,
  `sosial` varchar(50) NOT NULL,
  `bpjs` varchar(50) NOT NULL,
  `gajiditerima` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hrd_penggajian`
--

INSERT INTO `hrd_penggajian` (`id`, `id_pegawai`, `bulan`, `tahun`, `tanggalcetak`, `gajipokok`, `gelar`, `sertifikasi`, `masakerja`, `gajiperjam`, `jamngajar`, `gajingajar`, `transport`, `laboratorium`, `walikelas`, `sosial`, `bpjs`, `gajiditerima`) VALUES
(4, 1, 1, '2019', '2019-06-14 17:00:00', '800000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '800000'),
(5, 1, 2, '2019', '2019-06-14 17:00:00', '1500000', '70000', '80000', '50000', '10000', '50', '500000', '500000', '80000', '50000', '80000', '120000', '2630000'),
(6, 1, 6, '2019', '2019-06-15 17:00:00', '3500000', '600000', '50000', '700000', '10', '12500', '125000', '25000', '25000', '70000', '60000', '100000', '4935000');

-- --------------------------------------------------------

--
-- Table structure for table `m_agama`
--

DROP TABLE IF EXISTS `m_agama`;
CREATE TABLE `m_agama` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_agama`
--

INSERT INTO `m_agama` (`id`, `nama`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Katolik'),
(4, 'Hindu'),
(5, 'Budha'),
(6, 'KongHuChu'),
(7, 'Aliran Kepercayaan');

-- --------------------------------------------------------

--
-- Table structure for table `m_biaya`
--

DROP TABLE IF EXISTS `m_biaya`;
CREATE TABLE `m_biaya` (
  `id` int(6) NOT NULL,
  `category_id` int(6) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `is_publish` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_biaya`
--

INSERT INTO `m_biaya` (`id`, `category_id`, `nama`, `is_publish`) VALUES
(2, 1, 'Uang Gedung1', 1),
(4, 1, 'Uang SPP Bulan Juli', 1),
(5, 3, 'Seragam', 1),
(6, 3, 'Buku', 1),
(7, 4, 'Extra Komputer', 1),
(10, 1, 'Uang Gedung2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_biaya_categories`
--

DROP TABLE IF EXISTS `m_biaya_categories`;
CREATE TABLE `m_biaya_categories` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_biaya_categories`
--

INSERT INTO `m_biaya_categories` (`id`, `nama`) VALUES
(1, 'PPDB'),
(2, 'SPP'),
(3, 'DAFTARULANG'),
(4, 'LAIN-LAIN');

-- --------------------------------------------------------

--
-- Table structure for table `m_carabayar`
--

DROP TABLE IF EXISTS `m_carabayar`;
CREATE TABLE `m_carabayar` (
  `id` int(11) NOT NULL,
  `carabayar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_carabayar`
--

INSERT INTO `m_carabayar` (`id`, `carabayar`) VALUES
(1, 'TUNAI'),
(2, 'TRANSFER'),
(3, 'DEBIT');

-- --------------------------------------------------------

--
-- Table structure for table `m_gelombang`
--

DROP TABLE IF EXISTS `m_gelombang`;
CREATE TABLE `m_gelombang` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_gelombang`
--

INSERT INTO `m_gelombang` (`id`, `nama`) VALUES
(1, 'Gelombang 1'),
(2, 'Gelombang 2');

-- --------------------------------------------------------

--
-- Table structure for table `m_gelombang_jalur`
--

DROP TABLE IF EXISTS `m_gelombang_jalur`;
CREATE TABLE `m_gelombang_jalur` (
  `id` int(6) NOT NULL,
  `tahun_id` text NOT NULL,
  `gelombang_id` int(6) NOT NULL,
  `jalur_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_gelombang_jalur`
--

INSERT INTO `m_gelombang_jalur` (`id`, `tahun_id`, `gelombang_id`, `jalur_id`) VALUES
(10, '2023-2024', 1, 2),
(11, '2023-2024', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `m_golongan`
--

DROP TABLE IF EXISTS `m_golongan`;
CREATE TABLE `m_golongan` (
  `id` int(5) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_golongan`
--

INSERT INTO `m_golongan` (`id`, `nama`, `keterangan`) VALUES
(1, 'IV/a', 'Golongan IV/a'),
(2, 'IV/b', 'Golongan IV/b'),
(3, 'IV/c', 'Golongan IV/c'),
(4, 'IV/d', 'Golongan IV/d'),
(5, 'IV/e', 'Golongan IV/e'),
(6, 'III/a', 'Golongan III/a'),
(7, 'III/b', 'Golongan III/b'),
(8, 'III/c', 'Golongan III/c'),
(9, 'III/d', 'Golongan III/d');

-- --------------------------------------------------------

--
-- Table structure for table `m_jalur`
--

DROP TABLE IF EXISTS `m_jalur`;
CREATE TABLE `m_jalur` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_jalur`
--

INSERT INTO `m_jalur` (`id`, `nama`) VALUES
(2, 'UMUM');

-- --------------------------------------------------------

--
-- Table structure for table `m_jalur_biaya`
--

DROP TABLE IF EXISTS `m_jalur_biaya`;
CREATE TABLE `m_jalur_biaya` (
  `id` int(6) NOT NULL,
  `gelombangjalur_id` int(6) NOT NULL,
  `biaya_id` int(6) NOT NULL,
  `nominal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_jalur_biaya`
--

INSERT INTO `m_jalur_biaya` (`id`, `gelombangjalur_id`, `biaya_id`, `nominal`) VALUES
(10, 2, 2, '15000000'),
(11, 2, 4, '1000000'),
(12, 7, 2, '15000000'),
(14, 7, 4, '1000000'),
(15, 6, 2, '12000000'),
(16, 6, 4, '1000000'),
(17, 5, 2, '7000000'),
(18, 5, 4, '1000000'),
(19, 8, 2, '3000000'),
(20, 8, 10, '3000000'),
(21, 8, 4, '750000');

-- --------------------------------------------------------

--
-- Table structure for table `m_jenisptk`
--

DROP TABLE IF EXISTS `m_jenisptk`;
CREATE TABLE `m_jenisptk` (
  `id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_jenisptk`
--

INSERT INTO `m_jenisptk` (`id`, `nama`, `keterangan`) VALUES
(1, 'Tenaga Administrasi Sekolah', ''),
(2, 'Guru Mapel', ''),
(3, 'Guru BK', ''),
(4, 'Guru Kelas', '');

-- --------------------------------------------------------

--
-- Table structure for table `m_jurusan`
--

DROP TABLE IF EXISTS `m_jurusan`;
CREATE TABLE `m_jurusan` (
  `id` int(6) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_jurusan`
--

INSERT INTO `m_jurusan` (`id`, `nama_jurusan`) VALUES
(1, '-'),
(2, 'IPA'),
(3, 'IPS');

-- --------------------------------------------------------

--
-- Table structure for table `m_kelamin`
--

DROP TABLE IF EXISTS `m_kelamin`;
CREATE TABLE `m_kelamin` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_kelamin`
--

INSERT INTO `m_kelamin` (`id`, `nama`) VALUES
(1, 'Laki-Laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `m_kelas`
--

DROP TABLE IF EXISTS `m_kelas`;
CREATE TABLE `m_kelas` (
  `id` int(6) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `wali_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_kelas`
--

INSERT INTO `m_kelas` (`id`, `tahun`, `jurusan`, `nama_kelas`, `wali_kelas`) VALUES
(1, '2022-2023', '1', 'X IPA 1', '54'),
(3, '2022-2023', '2', 'X IPS 1', '64'),
(5, '2022-2023', '1', 'XI IPA 1', '90');

-- --------------------------------------------------------

--
-- Table structure for table `m_kelas_siswa`
--

DROP TABLE IF EXISTS `m_kelas_siswa`;
CREATE TABLE `m_kelas_siswa` (
  `id` int(6) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `kelas_id` varchar(50) NOT NULL,
  `siswa_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_kelas_siswa`
--

INSERT INTO `m_kelas_siswa` (`id`, `tahun`, `kelas_id`, `siswa_id`) VALUES
(37, '2022-2023', '4', '6'),
(40, '2022-2023', '1', '1'),
(41, '2022-2023', '1', '3'),
(42, '2022-2023', '1', '5'),
(46, '2022-2023', '1', '7'),
(47, '2022-2023', '1', '8'),
(49, '2022-2023', '3', '15'),
(50, '2022-2023', '3', '17'),
(51, '2022-2023', '3', '18'),
(52, '2022-2023', '3', '13'),
(53, '2022-2023', '3', '9'),
(55, '2022-2023', '1', '11');

-- --------------------------------------------------------

--
-- Table structure for table `m_logoslip`
--

DROP TABLE IF EXISTS `m_logoslip`;
CREATE TABLE `m_logoslip` (
  `id` int(6) NOT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_logoslip`
--

INSERT INTO `m_logoslip` (`id`, `image`) VALUES
(1, '1559218599163.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `m_options`
--

DROP TABLE IF EXISTS `m_options`;
CREATE TABLE `m_options` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_options`
--

INSERT INTO `m_options` (`id`, `name`, `value`) VALUES
(1, 'tahun_ppdb_default', '2023-2024'),
(2, 'tahun_akademik_default', '7'),
(3, 'is_ppdb_online', '1'),
(4, 'gelombang_ppdb_default', '1'),
(5, 'tahun_default', '2022-2023'),
(6, 'is_preregistrasi_online', '1'),
(7, 'harga_formulir', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `m_pegawai`
--

DROP TABLE IF EXISTS `m_pegawai`;
CREATE TABLE `m_pegawai` (
  `id` int(6) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_guru` varchar(150) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` varchar(50) NOT NULL,
  `niy_nigk` varchar(50) NOT NULL,
  `nuptk` varchar(50) NOT NULL,
  `id_status_kepegawaian` int(5) NOT NULL,
  `id_jenis_ptk` int(5) NOT NULL,
  `pengawas_bidang_studi` varchar(150) NOT NULL,
  `id_agama` int(5) NOT NULL,
  `alamat_jalan` varchar(255) NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `nama_dusun` varchar(100) NOT NULL,
  `desa_kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `tugas_tambahan` varchar(100) NOT NULL,
  `id_status_keaktifan` int(5) NOT NULL,
  `sk_cpns` varchar(150) NOT NULL,
  `tanggal_cpns` date NOT NULL,
  `sk_pengangkatan` varchar(150) NOT NULL,
  `tmt_pengangkatan` date NOT NULL,
  `lembaga_pengangkatan` varchar(150) NOT NULL,
  `id_golongan` int(5) NOT NULL,
  `keahlian_laboratorium` varchar(150) NOT NULL,
  `sumber_gaji` varchar(150) NOT NULL,
  `nama_ibu_kandung` varchar(100) NOT NULL,
  `id_status_pernikahan` int(5) NOT NULL,
  `nama_suami_istri` varchar(100) NOT NULL,
  `nip_suami_istri` varchar(30) NOT NULL,
  `pekerjaan_suami_istri` varchar(100) NOT NULL,
  `tmt_pns` date NOT NULL,
  `lisensi_kepsek` varchar(20) NOT NULL,
  `jumlah_sekolah_binaan` int(5) NOT NULL,
  `diklat_kepengawasan` varchar(20) NOT NULL,
  `mampu_handle_kk` varchar(20) NOT NULL,
  `keahlian_breile` varchar(20) NOT NULL,
  `keahlian_bahasa_isyarat` varchar(20) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `kewarganegaraan` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `login_oauth_uid` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_pegawai`
--

INSERT INTO `m_pegawai` (`id`, `nip`, `password`, `nama_guru`, `id_jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nik`, `niy_nigk`, `nuptk`, `id_status_kepegawaian`, `id_jenis_ptk`, `pengawas_bidang_studi`, `id_agama`, `alamat_jalan`, `rt`, `rw`, `nama_dusun`, `desa_kelurahan`, `kecamatan`, `kode_pos`, `telepon`, `hp`, `email`, `tugas_tambahan`, `id_status_keaktifan`, `sk_cpns`, `tanggal_cpns`, `sk_pengangkatan`, `tmt_pengangkatan`, `lembaga_pengangkatan`, `id_golongan`, `keahlian_laboratorium`, `sumber_gaji`, `nama_ibu_kandung`, `id_status_pernikahan`, `nama_suami_istri`, `nip_suami_istri`, `pekerjaan_suami_istri`, `tmt_pns`, `lisensi_kepsek`, `jumlah_sekolah_binaan`, `diklat_kepengawasan`, `mampu_handle_kk`, `keahlian_breile`, `keahlian_bahasa_isyarat`, `npwp`, `kewarganegaraan`, `image`, `login_oauth_uid`) VALUES
(1, '195704111980032004', '195704111980032004', 'April Daniati', 2, 'Padang Panjang', '1957-04-11', '1374025104571989', '', '1743735636300012', 3, 3, '', 3, 'Jl.Perintis Kemerdekaan No.121 B', '000', '000', '', 'Balai-Balai', 'Kec. Padang Panjang Barat', 27114, '0751461692', '081267771344', 'saya@pusatweb.store', 'Kepala Laboratorium', 3, '56483/C/2/80', '1980-03-01', '56483/C/2/80', '1980-03-01', 'Pemerintah Pusat', 3, '', 'APBD Kabupaten/Kota', 'Hj. Djawana', 3, 'Zainudin, S.PD.I', '', 'Wiraswasta', '1981-05-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', '1560593858547.jpg', ''),
(54, '198710052010012011', '10789201352', 'Meliya Defrina', 2, 'Agam', '1987-10-05', '1374025104571989', '', '', 3, 1, '', 1, 'Jl.Perintis Kemerdekaan No.146', '1', '2', '', 'jati', 'Kec. Padang Timur', 0, '0751461692', '081267771344', 'pusatweb1@gmail.com', '', 1, '813/119-5D/BKD-2010', '2010-01-01', '821/159-3D/BKD-2011', '2011-05-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Ratna Ernita', 1, 'Muhamad Farid', '', 'Karyawan Swasta', '2011-05-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', 'default.jpg', '113342174082927069989'),
(64, '195806161984000009', '7013893422', 'Nova Camelia', 2, 'Bukittinggi', '1991-11-15', '1374025104571989', '', '', 2, 3, '', 1, 'Panji Jorong Tigo SUrau', '0', '0', '', 'Koto Baru III Jorong', 'Kec. Baso', 0, '0751461692', '081267771344', 'saya@pusatweb.store', '', 1, '', '0000-00-00', '', '2015-07-13', 'Kepala Sekolah', 1, '', 'Sekolah', 'Jasnidar', 2, '', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', 'default.jpg', ''),
(90, '196107101984122001', '6550475455', 'Yulfah Yetti', 2, 'Agam', '1961-07-10', '1374025104571989', '', '1042739640300023', 3, 2, '', 1, 'Jl.Prof.M.Yamin,SH', '0', '0', '', 'Aur Kuning', 'Kec. Guguk Panjang', 26117, '0751461692', '081267771344', 'saya@pusatweb.store', '', 1, '822/407/disdik.bkt/tu-2008', '2008-12-01', '822/407/disdik.bkt/tu-2008', '2008-12-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Saridan', 1, 'Zamtiardi', '', 'Tidak bekerja', '2008-12-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '593529272202000', 'INDONESIA', 'default.jpg', ''),
(91, '195806161984000015', '5864246749', 'Yulia Sari', 2, 'Bukittingi', '1986-01-27', '1374025104571989', '', '', 1, 1, '', 1, 'Jl.Padang Gamuak No.16 B', '1', '5', '', 'Tarok Dipo', 'Kec. Guguk Panjang', 26117, '0751461692', '081267771344', 'saya@pusatweb.store', '', 1, '', '0000-00-00', '800.041.sma.3.bkt-2012', '2012-02-06', 'Kepala Sekolah', 1, '', 'Sekolah', 'Lili Sri', 1, 'Julyanton', '', 'Karyawan Swasta', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', 'default.jpg', ''),
(96, '197712282006042005', '9218814438', 'Zulvanisma', 2, 'Situjuh Batur,50Kota', '1977-12-28', '1374025104571989', '', '3560755657300033', 3, 2, '', 1, 'Jl.Khatib Sulaiman, Situjuh Batur', '0', '0', '', 'Situjuah Batua', 'Kec. Situjuah Limo Nagari', 26263, '0751461692', '081267771344', 'saya@pusatweb.store', '', 1, '813/005-5D/BKD-2006', '2006-04-01', '813/005-5D/BKD-2006', '2006-04-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Hj. Zulbaidah Ham', 1, 'Satria Irandi', '', 'Peternak', '2007-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470836202000', 'INDONESIA', 'default.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `m_pendidikan`
--

DROP TABLE IF EXISTS `m_pendidikan`;
CREATE TABLE `m_pendidikan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_pendidikan`
--

INSERT INTO `m_pendidikan` (`id`, `nama`) VALUES
(1, 'SMU/SMK'),
(2, 'D3'),
(3, 'D4'),
(4, 'S1'),
(5, 'S2'),
(6, 'S3');

-- --------------------------------------------------------

--
-- Table structure for table `m_sekolah`
--

DROP TABLE IF EXISTS `m_sekolah`;
CREATE TABLE `m_sekolah` (
  `id` int(5) NOT NULL,
  `sekolah` varchar(255) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `nss` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `kodepos` int(7) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `website` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_sekolah`
--

INSERT INTO `m_sekolah` (`id`, `sekolah`, `npsn`, `nss`, `alamat`, `kodepos`, `telepon`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `website`, `email`) VALUES
(1, 'SMA NEGERI 99 SURABAYA', '-', '-', 'Jl. SURABAYA 21 SURABAYA', 60272, '081234567890', '-', '-', 'SURABAYA', 'Jawa Timur', 'https://pusatweb.store/siska', 'sma@siska.com');

-- --------------------------------------------------------

--
-- Table structure for table `m_statuskeaktifan`
--

DROP TABLE IF EXISTS `m_statuskeaktifan`;
CREATE TABLE `m_statuskeaktifan` (
  `id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_statuskeaktifan`
--

INSERT INTO `m_statuskeaktifan` (`id`, `nama`, `keterangan`) VALUES
(1, 'Aktif', ''),
(2, 'Tidak Aktif', ''),
(3, 'Pensiun', '');

-- --------------------------------------------------------

--
-- Table structure for table `m_statusnikah`
--

DROP TABLE IF EXISTS `m_statusnikah`;
CREATE TABLE `m_statusnikah` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_statusnikah`
--

INSERT INTO `m_statusnikah` (`id`, `nama`) VALUES
(1, 'Belum Menikah'),
(2, 'Menikah'),
(3, 'Janda/Duda');

-- --------------------------------------------------------

--
-- Table structure for table `m_statuspegawai`
--

DROP TABLE IF EXISTS `m_statuspegawai`;
CREATE TABLE `m_statuspegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_statuspegawai`
--

INSERT INTO `m_statuspegawai` (`id`, `nama`) VALUES
(1, 'PNS'),
(2, 'GTY'),
(3, 'GTT Provinsi'),
(4, 'GTT/PTT Kab/Kota'),
(5, 'Guru Bantu Pusat'),
(6, 'Guru Bantu Sekolah'),
(7, 'Tenaga honorer');

-- --------------------------------------------------------

--
-- Table structure for table `m_tahunakademik`
--

DROP TABLE IF EXISTS `m_tahunakademik`;
CREATE TABLE `m_tahunakademik` (
  `id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `semester` int(2) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_tahunakademik`
--

INSERT INTO `m_tahunakademik` (`id`, `nama`, `tahun`, `semester`) VALUES
(2, 'Semester Genap 2022/2023', '2022-2023', 2),
(7, 'Semester Ganjil 2022/2023', '2022-2023', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_tahunppdb`
--

DROP TABLE IF EXISTS `m_tahunppdb`;
CREATE TABLE `m_tahunppdb` (
  `id` int(6) NOT NULL,
  `nama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_tahunppdb`
--

INSERT INTO `m_tahunppdb` (`id`, `nama`) VALUES
(3, '2022-2023'),
(8, '2023-2024');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'site_title', 'PusatWebStore Indonesia'),
(2, 'site_description', 'PusatWebStore Indonesia'),
(3, 'site_keyword', 'pusatwebstore, indonesia, surabaya, hosting, domain'),
(4, 'forgot_password', '0'),
(5, 'signup_member', '0'),
(6, 'protocol', 'smtp'),
(7, 'smtp_host', 'ssl://mail.pusatweb.store'),
(8, 'smtp_user', 'info@pusatweb.store'),
(9, 'smtp_pass', 'Pusatweb20220810'),
(10, 'smtp_port', '465'),
(11, 'mailtype', 'html'),
(12, 'charset', 'utf-8'),
(13, 'newline', '\\r\\n'),
(14, 'forbidden', '0'),
(15, 'email_master', 'info@pusatweb.store'),
(16, 'login_token', '');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `created_at`, `updated_at`) VALUES
(6, 'halaman 12', '<p>hal 12</p>\r\n', 'halaman-12', '0000-00-00 00:00:00', '2019-05-07 07:32:49'),
(7, 'iii', '<p><strong>Lorem Ipsum</strong>&nbsp;adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum.</p>\r\n', 'iii', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'asd', '<p>asd dsa asdadads</p>\r\n', 'asd', '2019-05-04 03:03:06', '2019-05-04 03:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `hit` int(11) NOT NULL DEFAULT 0,
  `feature` int(2) NOT NULL DEFAULT 0,
  `is_publish` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `content`, `slug`, `image`, `hit`, `feature`, `is_publish`, `created_at`, `updated_at`) VALUES
(4, 3, 10, 'Vario terbaru 2020', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do<br />\r\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br />\r\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'vario-terbaru-2020', '1557155672895.jpg', 0, 0, 1, '2019-05-05 06:07:36', '2019-05-06 15:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `posts_categories`
--

DROP TABLE IF EXISTS `posts_categories`;
CREATE TABLE `posts_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts_categories`
--

INSERT INTO `posts_categories` (`id`, `parent_id`, `name`, `description`, `slug`) VALUES
(1, 0, 'HONDA', 'HONDA', 'HONDA'),
(7, 0, 'YAMAHA', 'YAMAHA', 'YAMAHA'),
(8, 7, 'MIO', 'MIO', 'MIO'),
(9, 7, 'NMAX', 'NMAX', 'NMAX'),
(10, 1, 'VARIO', 'VARIO', 'vario'),
(11, 1, 'SUPRA', 'SUPRA', 'supra');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_formulir`
--

DROP TABLE IF EXISTS `ppdb_formulir`;
CREATE TABLE `ppdb_formulir` (
  `id` int(6) NOT NULL,
  `tahun_ppdb` text NOT NULL,
  `noformulir` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppdb_formulir`
--

INSERT INTO `ppdb_formulir` (`id`, `tahun_ppdb`, `noformulir`, `password`, `status`) VALUES
(144, '2023-2024', '23001', '872941', 'tersedia'),
(145, '2023-2024', '23002', '368724', 'tersedia'),
(146, '2023-2024', '23003', '976425', 'tersedia'),
(147, '2023-2024', '23004', '915863', 'tersedia'),
(148, '2023-2024', '23005', '857463', 'tersedia'),
(149, '2023-2024', '23006', '362745', 'tersedia'),
(150, '2023-2024', '23007', '256931', 'tersedia'),
(151, '2023-2024', '23008', '824396', 'tersedia'),
(152, '2023-2024', '23009', '128749', 'tersedia'),
(153, '2023-2024', '23010', '236159', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_formulir_jual`
--

DROP TABLE IF EXISTS `ppdb_formulir_jual`;
CREATE TABLE `ppdb_formulir_jual` (
  `id_nota` int(6) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama` varchar(50) NOT NULL,
  `asalsekolah` varchar(50) NOT NULL,
  `alamat` varchar(512) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `jumlah_form` varchar(50) NOT NULL,
  `harga_form` varchar(50) NOT NULL,
  `bayar_form` varchar(50) NOT NULL,
  `no_formulir` varchar(512) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppdb_formulir_jual`
--

INSERT INTO `ppdb_formulir_jual` (`id_nota`, `tanggal`, `nama`, `asalsekolah`, `alamat`, `hp`, `jumlah_form`, `harga_form`, `bayar_form`, `no_formulir`, `user_id`) VALUES
(2, '2019-06-19 09:48:47', '19094,19095', '19094,19095', '19094,19095', '1909419095', '2', '250000', '0', '19094,19095', '3'),
(3, '2019-06-19 11:05:01', '19094,19095', '19094,19095', '19094,19095', '1909419095', '2', '250000', '0', '19094,19095', '3');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_kirimemail`
--

DROP TABLE IF EXISTS `ppdb_kirimemail`;
CREATE TABLE `ppdb_kirimemail` (
  `id` int(5) NOT NULL,
  `noformulir` text NOT NULL,
  `tanggal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ppdb_kirimemail`
--

INSERT INTO `ppdb_kirimemail` (`id`, `noformulir`, `tanggal`) VALUES
(1, '23001', '2022-11-09 12:58:27'),
(2, '23001', '2022-11-09 12:58:29'),
(3, '23001', '2022-11-09 13:00:56'),
(4, '23001', '2022-11-09 13:01:55'),
(5, '23001', '2022-11-09 13:02:42'),
(6, '23001', '2022-11-09 13:03:16'),
(7, '23001', '2022-11-09 13:05:01'),
(8, '23001', '2022-11-09 13:05:21'),
(9, '23001', '2022-11-09 13:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_kirimva`
--

DROP TABLE IF EXISTS `ppdb_kirimva`;
CREATE TABLE `ppdb_kirimva` (
  `id` int(11) NOT NULL,
  `noformulir` text NOT NULL,
  `tanggal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ppdb_kirimva`
--

INSERT INTO `ppdb_kirimva` (`id`, `noformulir`, `tanggal`) VALUES
(1, '23001', '2022-11-09 06:28:27'),
(2, '23001', '2022-11-09 06:30:42'),
(3, '23001', '2022-11-09 06:33:20'),
(4, '23001', '2022-11-09 06:39:47'),
(5, '23001', '2022-11-09 06:40:50'),
(6, '23001', '2022-11-09 06:41:28'),
(7, '23001', '2022-11-09 12:42:48'),
(8, '23001', '2022-11-09 12:55:31'),
(9, '23001', '2022-11-09 13:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_preregistrasi`
--

DROP TABLE IF EXISTS `ppdb_preregistrasi`;
CREATE TABLE `ppdb_preregistrasi` (
  `id` int(6) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `hp_ortu` text NOT NULL,
  `asalsekolah` text NOT NULL,
  `email` text NOT NULL,
  `noformulir` text NOT NULL,
  `buktibayar` text NOT NULL,
  `status_bayar` text NOT NULL DEFAULT 'UNPAID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppdb_preregistrasi`
--

INSERT INTO `ppdb_preregistrasi` (`id`, `tanggal`, `nama`, `hp`, `hp_ortu`, `asalsekolah`, `email`, `noformulir`, `buktibayar`, `status_bayar`) VALUES
(3, '2022-11-09', 'REKYSDA@GMAIL.COM', 'rekysda@gmail.com', 'rekysda@gmail.com', 'rekysda@gmail.com', 'rekysda@gmail.com', '23001', '', 'PAID');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_siswa`
--

DROP TABLE IF EXISTS `ppdb_siswa`;
CREATE TABLE `ppdb_siswa` (
  `id` int(5) NOT NULL,
  `tanggaldaftar` timestamp NULL DEFAULT current_timestamp(),
  `tahun_ppdb` text DEFAULT NULL,
  `gelombang_id` text DEFAULT NULL,
  `jalur_id` text DEFAULT NULL,
  `jalurbiaya_id` text DEFAULT NULL,
  `noformulir` text DEFAULT NULL,
  `namasiswa` varchar(500) NOT NULL,
  `nis` text DEFAULT NULL,
  `nrp` text DEFAULT NULL,
  `nisn` text DEFAULT NULL,
  `nik` text DEFAULT NULL,
  `panggilansiswa` text DEFAULT NULL,
  `agamasiswa` text DEFAULT NULL,
  `kelaminsiswa` text DEFAULT NULL,
  `tempatlahirsiswa` text DEFAULT NULL,
  `tanggallahirsiswa` date DEFAULT NULL,
  `warganegarasiswa` text DEFAULT NULL,
  `beratsiswa` text DEFAULT NULL,
  `tinggisiswa` text DEFAULT NULL,
  `photosiswa` text DEFAULT NULL,
  `alamatsiswa` varchar(1000) DEFAULT NULL,
  `propinsisiswa` text DEFAULT NULL,
  `kotasiswa` text DEFAULT NULL,
  `kodepossiswa` text DEFAULT NULL,
  `teleponsiswa` text DEFAULT NULL,
  `hpsiswa` text DEFAULT NULL,
  `emailsiswa` text DEFAULT NULL,
  `sekolahasal` text DEFAULT NULL,
  `alamatsekolahasal` varchar(1000) DEFAULT NULL,
  `ijazah` text DEFAULT NULL,
  `skhun` text DEFAULT NULL,
  `statusanak` text DEFAULT NULL,
  `anakke` text DEFAULT NULL,
  `jumlahsaudara` text DEFAULT NULL,
  `bahasasiswa` text DEFAULT NULL,
  `statusayah` text DEFAULT NULL,
  `namaayah` text DEFAULT NULL,
  `tempatlahirayah` text DEFAULT NULL,
  `tanggallahirayah` date DEFAULT NULL,
  `agamaayah` text DEFAULT NULL,
  `alamatayah` varchar(1000) DEFAULT NULL,
  `propinsiayah` text DEFAULT NULL,
  `kotaayah` text DEFAULT NULL,
  `teleponayah` text DEFAULT NULL,
  `hpayah` text DEFAULT NULL,
  `pendidikanayah` text DEFAULT NULL,
  `pekerjaanayah` text DEFAULT NULL,
  `statusibu` text DEFAULT NULL,
  `namaibu` text DEFAULT NULL,
  `tempatlahiribu` text DEFAULT NULL,
  `tanggalahiribu` date DEFAULT NULL,
  `agamaibu` text DEFAULT NULL,
  `alamatibu` varchar(1000) DEFAULT NULL,
  `propinsiibu` text DEFAULT NULL,
  `kotaibu` text DEFAULT NULL,
  `teleponibu` text DEFAULT NULL,
  `hpibu` text DEFAULT NULL,
  `pendidikanibu` text DEFAULT NULL,
  `pekerjaanibu` text DEFAULT NULL,
  `statuswali` text DEFAULT NULL,
  `namawali` text DEFAULT NULL,
  `tempatlahirwali` text DEFAULT NULL,
  `tanggallahirwali` date DEFAULT NULL,
  `agamawali` text DEFAULT NULL,
  `alamatwali` varchar(1000) DEFAULT NULL,
  `propinsiwali` text DEFAULT NULL,
  `kotawali` text DEFAULT NULL,
  `teleponwali` text DEFAULT NULL,
  `hpwali` text DEFAULT NULL,
  `pendidikanwali` text DEFAULT NULL,
  `pekerjaanwali` text DEFAULT NULL,
  `ppdb_status` varchar(50) DEFAULT 'calon',
  `noakta` text DEFAULT NULL,
  `jarak` text DEFAULT NULL,
  `transportasi` text DEFAULT NULL,
  `nikayah` text DEFAULT NULL,
  `gajiayah` text DEFAULT NULL,
  `nikibu` text DEFAULT NULL,
  `gajiibu` text DEFAULT NULL,
  `gajiwali` text DEFAULT NULL,
  `jenistinggal` text DEFAULT NULL,
  `kelurahan` text DEFAULT NULL,
  `kecamatan` text DEFAULT NULL,
  `nopesertaun` text DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ppdb_siswa`
--

INSERT INTO `ppdb_siswa` (`id`, `tanggaldaftar`, `tahun_ppdb`, `gelombang_id`, `jalur_id`, `jalurbiaya_id`, `noformulir`, `namasiswa`, `nis`, `nrp`, `nisn`, `nik`, `panggilansiswa`, `agamasiswa`, `kelaminsiswa`, `tempatlahirsiswa`, `tanggallahirsiswa`, `warganegarasiswa`, `beratsiswa`, `tinggisiswa`, `photosiswa`, `alamatsiswa`, `propinsisiswa`, `kotasiswa`, `kodepossiswa`, `teleponsiswa`, `hpsiswa`, `emailsiswa`, `sekolahasal`, `alamatsekolahasal`, `ijazah`, `skhun`, `statusanak`, `anakke`, `jumlahsaudara`, `bahasasiswa`, `statusayah`, `namaayah`, `tempatlahirayah`, `tanggallahirayah`, `agamaayah`, `alamatayah`, `propinsiayah`, `kotaayah`, `teleponayah`, `hpayah`, `pendidikanayah`, `pekerjaanayah`, `statusibu`, `namaibu`, `tempatlahiribu`, `tanggalahiribu`, `agamaibu`, `alamatibu`, `propinsiibu`, `kotaibu`, `teleponibu`, `hpibu`, `pendidikanibu`, `pekerjaanibu`, `statuswali`, `namawali`, `tempatlahirwali`, `tanggallahirwali`, `agamawali`, `alamatwali`, `propinsiwali`, `kotawali`, `teleponwali`, `hpwali`, `pendidikanwali`, `pekerjaanwali`, `ppdb_status`, `noakta`, `jarak`, `transportasi`, `nikayah`, `gajiayah`, `nikibu`, `gajiibu`, `gajiwali`, `jenistinggal`, `kelurahan`, `kecamatan`, `nopesertaun`, `image`) VALUES
(1, '2016-12-08 03:00:00', '2019', '1', '1', '5', '0001', 'FAHMI MUHLISIN', '190001', '', '', '', '', 'Islam', 'Laki-Laki', 'Medan', '2005-06-18', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMPN 1 GALIS PAMEKASAN', '', '', '', '1', '', '', 'INDONESIA', '1', 'JAFAR', '', '0000-00-00', '3', '', '', '', '', '081335054383', '', '', '1', 'ISABEL', '', '0000-00-00', '3', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '', '0', '', '', '', '', '', '', '', 'default.jpg'),
(3, '2016-07-03 03:00:00', '2020', '1', '1', '8', '0003', 'FIRHAN GHULAM ACHMAD', '190002', '', '', '', '', 'Islam', 'Laki-Laki', '', '2019-08-28', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMP', '', '', '', 'kandung', '0003', '0003', 'INDONESIA', 'Hidup', 'BRIAN', '', '0000-00-00', 'Islam', '0003', '0003', '0003', '', '081335054383', 'SMU/SMK', '0003', 'Hidup', 'RAHAYU', '0003', '0000-00-00', 'Islam', '0003', '0003', '0003', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '0003', '0', '0003', '', '0', '', '0003', '0003', '', 'default.jpg'),
(5, '2016-07-03 03:00:00', '2019', '1', '3', '', '0005', 'GEOVANY EDY W', '190003', '', '', '', '', 'Islam', 'Laki-Laki', '', '2010-06-21', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMP HANG TUAH 4 SURABAYA', '', '', '', 'kandung', '2', '2', 'INDONESIA', 'Hidup', 'ALEX', '', '0000-00-00', 'Islam', 'GEOVANY ', 'GEOVANY ', 'GEOVANY ', '', '081335054383', 'SMU/SMK', 'GEOVANY ', 'Hidup', 'GEOVANY ', '', '0000-00-00', 'Islam', 'GEOVANY ', 'GEOVANY ', 'GEOVANY ', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', 'GEOVANY ', '0', 'GEOVANY ', '', '0', '', 'GEOVANY ', 'GEOVANY ', '', 'default.jpg'),
(6, '2016-07-03 03:00:00', '2019', '1', '3', '', '0006', 'Cynthia Budiyanto', '190004', '', '', '', '', 'Islam', 'Perempuan', '', '0000-00-00', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMPN 3 MUNCAR', '', '', '', '1', '', '', 'INDONESIA', '1', 'BENYAMIN', '', '0000-00-00', '3', '', '', '', '', '081249991001', '', '', '1', 'ELOK', '', '0000-00-00', '3', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '', '0', '', '', '0', '', '', '', '', 'default.jpg'),
(7, '2016-07-03 03:00:00', '2019', '1', '3', '', '0007', 'Clara Graciella Alim', '190005', '', '', '', '', 'Islam', 'Perempuan', '', '0000-00-00', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMPN 1 JOMBANG', '', '', '', '1', '', '', 'INDONESIA', '1', 'BURHAN', '', '0000-00-00', '3', '', '', '', '', '081249991001', '', '', '1', 'LISA', '', '0000-00-00', '3', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '', '0', '', '', '0', '', '', '', '', 'default.jpg'),
(8, '2016-07-03 03:00:00', '2019', '1', '3', '', '0008', 'Agatha Tirtana', '190006', '', '', '', '', 'Islam', 'Perempuan', '', '0000-00-00', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'MTSN 1 MATARAM', '', '', '', '1', '', '', 'INDONESIA', '1', 'MIKAIL', '', '0000-00-00', '3', '', '', '', '', '081249991001', '', '', '1', 'JENNY', '', '0000-00-00', '3', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '', '0', '', '', '0', '', '', '', '', 'default.jpg'),
(9, '2016-07-03 03:00:00', '2019', '1', '3', '', '0009', 'Felicia Stewennie', '190007', '', '', '', '', 'Islam', 'Perempuan', '', '0000-00-00', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMP', '', '', '', '1', '', '', 'INDONESIA', '1', 'MUHAMMAD SOLEH', '', '0000-00-00', '3', '', '', '', '', '081249991001', '', '', '1', 'JESSIE', '', '0000-00-00', '3', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '', '0', '', '', '0', '', '', '', '', 'default.jpg'),
(10, '2016-07-03 03:00:00', '2019', '1', '3', '', '0010', 'Hillary Kaory', '190008', '', '', '', '', 'Islam', 'Perempuan', '', '0000-00-00', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMP', '', '', '', '1', '', '', 'INDONESIA', '1', 'DODY', '', '0000-00-00', '3', '', '', '', '', '081249991001', '', '', '1', 'LALA', '', '0000-00-00', '3', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '', '0', '', '', '0', '', '', '', '', 'default.jpg'),
(11, '2016-07-03 03:00:00', '2019', '1', '3', '', '0011', 'Ivana Kristiono', '190009', '', '', '', '', 'Islam', 'Perempuan', '', '0000-00-00', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMP', '', '', '', '1', '', '', 'INDONESIA', '1', 'DIDIT MULYANTO', '', '0000-00-00', '3', '', '', '', '', '081249991001', '', '', '1', 'KARMELIA', '', '0000-00-00', '3', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '', '0', '', '', '0', '', '', '', '', 'default.jpg'),
(12, '2016-07-03 03:00:00', '2019', '1', '3', '', '0012', 'Janet Ellora Wibowo', '190010', '', '', '', '', 'Islam', 'Perempuan', '', '0000-00-00', 'INDONESIA', '', '', '', '', '', '', '', '', '0', '', 'SMPN 1 PURWOHARJO', '', '', '', '1', '', '', 'INDONESIA', '1', 'TOTO ISKANDAR', '', '0000-00-00', '3', '', '', '', '', '081249991001', '', '', '1', 'RAISO', '', '0000-00-00', '3', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', 'aktif', '', '', '', '', '0', '', '', '0', '', '', '', '', 'default.jpg'),
(13, '2019-08-28 06:36:51', '2020', '1', NULL, NULL, '2010', 'Kristiono Wibowo', '190011', NULL, NULL, NULL, NULL, 'Islam', 'laki-Laki', NULL, '0000-00-00', 'INDONESIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 'SMP', NULL, NULL, NULL, '1', NULL, NULL, 'INDONESIA', '1', 'MIKAILS', NULL, NULL, '3', NULL, NULL, NULL, NULL, '081249991001', NULL, NULL, '1', 'JENNY', NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'calon', NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_status`
--

DROP TABLE IF EXISTS `ppdb_status`;
CREATE TABLE `ppdb_status` (
  `id` int(6) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppdb_status`
--

INSERT INTO `ppdb_status` (`id`, `nama`) VALUES
(1, 'calon'),
(2, 'aktif'),
(3, 'alumni'),
(4, 'keluar'),
(5, 'ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_status_anak`
--

DROP TABLE IF EXISTS `ppdb_status_anak`;
CREATE TABLE `ppdb_status_anak` (
  `id` int(6) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppdb_status_anak`
--

INSERT INTO `ppdb_status_anak` (`id`, `nama`) VALUES
(1, 'Kandung'),
(2, 'Tiri'),
(3, 'Angkat'),
(4, 'Wali');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_status_formulir`
--

DROP TABLE IF EXISTS `ppdb_status_formulir`;
CREATE TABLE `ppdb_status_formulir` (
  `id` int(6) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppdb_status_formulir`
--

INSERT INTO `ppdb_status_formulir` (`id`, `nama`) VALUES
(1, 'tersedia'),
(2, 'terjual'),
(3, 'terpakai');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_status_ortu`
--

DROP TABLE IF EXISTS `ppdb_status_ortu`;
CREATE TABLE `ppdb_status_ortu` (
  `id` int(6) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppdb_status_ortu`
--

INSERT INTO `ppdb_status_ortu` (`id`, `nama`) VALUES
(1, 'Hidup'),
(2, 'Alm');

-- --------------------------------------------------------

--
-- Table structure for table `rab_kegiatan`
--

DROP TABLE IF EXISTS `rab_kegiatan`;
CREATE TABLE `rab_kegiatan` (
  `id` int(6) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `kegiatan` text NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_catatan_walikelas`
--

DROP TABLE IF EXISTS `r_catatan_walikelas`;
CREATE TABLE `r_catatan_walikelas` (
  `id` int(10) NOT NULL,
  `tahunakademik_id` int(5) NOT NULL,
  `siswa_id` varchar(20) NOT NULL,
  `kelas_id` varchar(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_catatan_walikelas`
--

INSERT INTO `r_catatan_walikelas` (`id`, `tahunakademik_id`, `siswa_id`, `kelas_id`, `deskripsi`, `user_id`, `update_at`) VALUES
(1, 1, '1', '1', 'Tingkatkan Belajarmu', '3', '2019-07-05 12:35:02'),
(2, 1, '3', '1', '', '3', '2019-07-05 12:35:02'),
(3, 1, '5', '1', '', '3', '2019-07-05 12:35:02'),
(4, 1, '7', '1', '', '3', '2019-07-05 12:35:02'),
(5, 1, '8', '1', '', '3', '2019-07-05 12:35:02'),
(6, 1, '11', '1', '', '3', '2019-07-05 12:35:02'),
(7, 2, '1', '1', 'Tingkatkan Belajarmu ok', '', '2019-07-10 16:31:15'),
(8, 2, '3', '1', '', '', '2019-07-10 16:31:15'),
(9, 2, '5', '1', '', '', '2019-07-10 16:31:15'),
(10, 2, '7', '1', '', '', '2019-07-10 16:31:15'),
(11, 2, '8', '1', '', '', '2019-07-10 16:31:15'),
(12, 2, '11', '1', '', '', '2019-07-10 16:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `r_jadwal_pelajaran`
--

DROP TABLE IF EXISTS `r_jadwal_pelajaran`;
CREATE TABLE `r_jadwal_pelajaran` (
  `id` int(6) NOT NULL,
  `tahunakademik_id` varchar(50) NOT NULL,
  `mapel_id` varchar(50) NOT NULL,
  `kelas_id` varchar(50) NOT NULL,
  `guru_id` varchar(50) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `jam_mulai` varchar(50) NOT NULL,
  `jam_selesai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_jadwal_pelajaran`
--

INSERT INTO `r_jadwal_pelajaran` (`id`, `tahunakademik_id`, `mapel_id`, `kelas_id`, `guru_id`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(9, '1', '4', '1', '1', 'Senin', '09:30:00', '09:30:00'),
(10, '1', '5', '1', '54', 'Senin', '09:33:31', '09:33:31'),
(11, '2', '5', '3', '1', 'Senin', '09:49:28', '09:49:28'),
(12, '1', '5', '3', '54', 'Senin', '09:49:58', '09:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `r_kelompok_mapel`
--

DROP TABLE IF EXISTS `r_kelompok_mapel`;
CREATE TABLE `r_kelompok_mapel` (
  `id` int(6) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `nama_kelompok` varchar(50) NOT NULL,
  `keterangan` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_kelompok_mapel`
--

INSERT INTO `r_kelompok_mapel` (`id`, `jenis`, `nama_kelompok`, `keterangan`) VALUES
(1, 'A', 'Kelompok A', ''),
(2, 'B', 'Kelompok B', ''),
(3, 'C', 'Kelompok C (Peminatan)', '');

-- --------------------------------------------------------

--
-- Table structure for table `r_mapel`
--

DROP TABLE IF EXISTS `r_mapel`;
CREATE TABLE `r_mapel` (
  `id` int(6) NOT NULL,
  `kode_mapel` varchar(50) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `sk_mapel` varchar(50) NOT NULL,
  `jurusan_id` varchar(50) NOT NULL,
  `guru_mgmp` varchar(50) NOT NULL,
  `tingkat` varchar(50) NOT NULL,
  `urutan` varchar(50) NOT NULL,
  `kelompok_id` varchar(50) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_mapel`
--

INSERT INTO `r_mapel` (`id`, `kode_mapel`, `nama_mapel`, `sk_mapel`, `jurusan_id`, `guru_mgmp`, `tingkat`, `urutan`, `kelompok_id`, `is_active`) VALUES
(4, 'MK01', 'MATEMATIKA', 'MAT', '1', '1', '1', '1', '1', 1),
(5, 'MK02', 'BAHASA INDONESIA', 'BHSINDO', '1', '54', '1', '2', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `r_nilai_extrakulikuler`
--

DROP TABLE IF EXISTS `r_nilai_extrakulikuler`;
CREATE TABLE `r_nilai_extrakulikuler` (
  `id` int(10) NOT NULL,
  `tahunakademik_id` varchar(10) NOT NULL,
  `siswa_id` varchar(10) NOT NULL,
  `kelas_id` varchar(10) NOT NULL,
  `kegiatan` text NOT NULL,
  `nilai` varchar(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_nilai_extrakulikuler`
--

INSERT INTO `r_nilai_extrakulikuler` (`id`, `tahunakademik_id`, `siswa_id`, `kelas_id`, `kegiatan`, `nilai`, `deskripsi`, `user_id`, `update_at`) VALUES
(5, '1', '1', '1', 'Renang', '78', 'Cukup Menguasai Renang', '3', '2019-07-05 11:13:52'),
(2, '1', '1', '1', 'Basketball', '80', 'Bisa menguasai Bola basket', '3', '2019-07-05 11:13:30'),
(3, '1', '3', '1', 'Masak', '78', 'OKE', '3', '2019-06-28 13:17:12'),
(6, '2', '1', '1', 'Renang', '80', 'Baik', '4', '2019-07-10 17:19:12');

-- --------------------------------------------------------

--
-- Table structure for table `r_nilai_keterampilan`
--

DROP TABLE IF EXISTS `r_nilai_keterampilan`;
CREATE TABLE `r_nilai_keterampilan` (
  `id` int(5) NOT NULL,
  `jadwal_id` varchar(50) NOT NULL,
  `tahunakademik_id` varchar(50) NOT NULL,
  `mapel_id` varchar(50) NOT NULL,
  `kelas_id` varchar(50) NOT NULL,
  `guru_id` varchar(50) NOT NULL,
  `siswa_id` varchar(50) NOT NULL,
  `siswa_urut` varchar(2) NOT NULL,
  `nil1` varchar(500) NOT NULL,
  `nil2` varchar(50) NOT NULL,
  `nil3` varchar(50) NOT NULL,
  `nil4` varchar(50) NOT NULL,
  `nil5` varchar(50) NOT NULL,
  `nil6` varchar(50) NOT NULL,
  `nil7` varchar(50) NOT NULL,
  `nil8` varchar(50) NOT NULL,
  `rata2` varchar(50) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `deskripsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_nilai_keterampilan`
--

INSERT INTO `r_nilai_keterampilan` (`id`, `jadwal_id`, `tahunakademik_id`, `mapel_id`, `kelas_id`, `guru_id`, `siswa_id`, `siswa_urut`, `nil1`, `nil2`, `nil3`, `nil4`, `nil5`, `nil6`, `nil7`, `nil8`, `rata2`, `grade`, `deskripsi`) VALUES
(7, '1', '1', '1', '1', '2', '1', '2', '80', '80', '', '', '', '', '', '', '80', 'C', 'Cukup, terampil dalam  semua  kompetensi'),
(8, '1', '1', '1', '1', '2', '3', '3', '', '', '', '', '', '', '', '', '0', '', ''),
(9, '1', '1', '1', '1', '2', '5', '4', '', '', '', '', '', '', '', '', '0', '', ''),
(10, '1', '1', '1', '1', '2', '7', '5', '', '', '', '', '', '', '', '', '0', '', ''),
(11, '1', '1', '1', '1', '2', '8', '6', '', '', '', '', '', '', '', '', '0', '', ''),
(12, '1', '1', '1', '1', '2', '11', '7', '', '', '', '', '', '', '', '', '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `r_nilai_pengetahuan`
--

DROP TABLE IF EXISTS `r_nilai_pengetahuan`;
CREATE TABLE `r_nilai_pengetahuan` (
  `id` int(5) NOT NULL,
  `jadwal_id` varchar(50) NOT NULL,
  `tahunakademik_id` varchar(50) NOT NULL,
  `mapel_id` varchar(50) NOT NULL,
  `kelas_id` varchar(50) NOT NULL,
  `guru_id` varchar(50) NOT NULL,
  `siswa_id` varchar(50) NOT NULL,
  `siswa_urut` varchar(2) NOT NULL,
  `ph1` varchar(500) NOT NULL,
  `ph2` varchar(50) NOT NULL,
  `ph3` varchar(50) NOT NULL,
  `ph4` varchar(50) NOT NULL,
  `ph5` varchar(50) NOT NULL,
  `ph6` varchar(50) NOT NULL,
  `pt1` varchar(50) NOT NULL,
  `pt2` varchar(50) NOT NULL,
  `pt3` varchar(50) NOT NULL,
  `pt4` varchar(50) NOT NULL,
  `pt5` varchar(50) NOT NULL,
  `pt6` varchar(50) NOT NULL,
  `rph` varchar(50) NOT NULL,
  `rpt` varchar(50) NOT NULL,
  `uts` varchar(50) NOT NULL,
  `uas` varchar(50) NOT NULL,
  `rata2` varchar(50) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `deskripsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_nilai_pengetahuan`
--

INSERT INTO `r_nilai_pengetahuan` (`id`, `jadwal_id`, `tahunakademik_id`, `mapel_id`, `kelas_id`, `guru_id`, `siswa_id`, `siswa_urut`, `ph1`, `ph2`, `ph3`, `ph4`, `ph5`, `ph6`, `pt1`, `pt2`, `pt3`, `pt4`, `pt5`, `pt6`, `rph`, `rpt`, `uts`, `uas`, `rata2`, `grade`, `deskripsi`) VALUES
(319, '1', '1', '1', '1', '2', '1', '1', '99', '90', '', '', '', '', '80', '', '', '', '', '', '89', '357', '90', '88', '89', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(320, '1', '1', '1', '1', '2', '3', '2', '80', '80', '', '', '', '', '80', '', '', '', '', '', '80', '336', '88', '80', '84', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(321, '1', '1', '1', '1', '2', '5', '3', '78', '80', '', '', '', '', '80', '', '', '', '', '', '79', '310', '78', '75', '78', 'C', 'Sudah  memahami semua kompetensi dengan cukup'),
(322, '1', '1', '1', '1', '2', '7', '4', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(323, '1', '1', '1', '1', '2', '8', '5', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(324, '1', '1', '1', '1', '2', '11', '6', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(325, '4', '1', '3', '1', '18', '1', '1', '77', '80', '', '', '', '', '90', '', '', '', '', '', '83', '', '88', '', '', '', ''),
(326, '4', '1', '3', '1', '18', '3', '2', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(327, '4', '1', '3', '1', '18', '5', '3', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(328, '4', '1', '3', '1', '18', '7', '4', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(329, '4', '1', '3', '1', '18', '8', '5', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(330, '4', '1', '3', '1', '18', '11', '6', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(331, '3', '1', '2', '1', '5', '1', '1', '90', '', '', '', '', '', '80', '88', '', '', '', '', '88', '', '77', '', '', '', ''),
(332, '3', '1', '2', '1', '5', '3', '2', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(333, '3', '1', '2', '1', '5', '5', '3', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(334, '3', '1', '2', '1', '5', '7', '4', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(335, '3', '1', '2', '1', '5', '8', '5', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(336, '3', '1', '2', '1', '5', '11', '6', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(337, '5', '2', '1', '1', '5', '1', '1', '88', '', '', '', '', '', '88', '', '', '', '', '', '88', '331', '79', '85', '83', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(338, '5', '2', '1', '1', '5', '3', '2', '88', '', '', '', '', '', '88', '', '', '', '', '', '88', '354', '88', '90', '89', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(339, '5', '2', '1', '1', '5', '5', '3', '88', '', '', '', '', '', '88', '', '', '', '', '', '88', '326', '79', '80', '82', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(340, '5', '2', '1', '1', '5', '7', '4', '88', '', '', '', '', '', '88', '', '', '', '', '', '88', '352', '88', '88', '88', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(341, '5', '2', '1', '1', '5', '8', '5', '88', '', '', '', '', '', '88', '', '', '', '', '', '88', '355', '90', '87', '89', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(342, '5', '2', '1', '1', '5', '11', '6', '88', '', '', '', '', '', '88', '', '', '', '', '', '88', '305', '70', '77', '76', 'C', 'Sudah  memahami semua kompetensi dengan cukup'),
(343, '6', '2', '3', '1', '2', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(344, '6', '2', '3', '1', '2', '3', '2', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(345, '6', '2', '3', '1', '2', '5', '3', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(346, '6', '2', '3', '1', '2', '7', '4', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(347, '6', '2', '3', '1', '2', '8', '5', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(348, '6', '2', '3', '1', '2', '11', '6', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(349, '7', '2', '2', '1', '5', '1', '1', '90', '', '', '', '', '', '88', '', '', '', '', '', '89', '354', '88', '89', '89', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(350, '7', '2', '2', '1', '5', '3', '2', '90', '', '', '', '', '', '88', '', '', '', '', '', '89', '363', '88', '98', '91', 'A', 'Sudah  memahami semua kompetensi dengan sangat bai'),
(351, '7', '2', '2', '1', '5', '5', '3', '90', '', '', '', '', '', '88', '', '', '', '', '', '89', '354', '88', '89', '89', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(352, '7', '2', '2', '1', '5', '7', '4', '90', '', '', '', '', '', '88', '', '', '', '', '', '89', '363', '88', '98', '91', 'A', 'Sudah  memahami semua kompetensi dengan sangat bai'),
(353, '7', '2', '2', '1', '5', '8', '5', '90', '', '', '', '', '', '88', '', '', '', '', '', '89', '354', '88', '89', '89', 'B', 'Sudah  memahami semua kompetensi dengan baik'),
(354, '7', '2', '2', '1', '5', '11', '6', '90', '', '', '', '', '', '88', '', '', '', '', '', '89', '363', '88', '98', '91', 'A', 'Sudah  memahami semua kompetensi dengan sangat bai');

-- --------------------------------------------------------

--
-- Table structure for table `r_nilai_prestasi`
--

DROP TABLE IF EXISTS `r_nilai_prestasi`;
CREATE TABLE `r_nilai_prestasi` (
  `id` int(10) NOT NULL,
  `tahunakademik_id` int(5) NOT NULL,
  `siswa_id` varchar(20) NOT NULL,
  `kelas_id` varchar(10) NOT NULL,
  `jenis_kegiatan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_nilai_prestasi`
--

INSERT INTO `r_nilai_prestasi` (`id`, `tahunakademik_id`, `siswa_id`, `kelas_id`, `jenis_kegiatan`, `keterangan`, `user_id`, `update_at`) VALUES
(2, 1, '1', '1', 'Basket', 'C', '4', '2019-07-10 17:48:55'),
(3, 2, '1', '1', 'Renang', 'B', '4', '2019-07-10 17:49:19');

-- --------------------------------------------------------

--
-- Table structure for table `r_nilai_sikap_semester`
--

DROP TABLE IF EXISTS `r_nilai_sikap_semester`;
CREATE TABLE `r_nilai_sikap_semester` (
  `id` int(10) NOT NULL,
  `tahunakademik_id` int(5) NOT NULL,
  `siswa_id` varchar(20) NOT NULL,
  `kelas_id` varchar(10) NOT NULL,
  `spiritual_predikat` varchar(2) NOT NULL,
  `spiritual_deskripsi` text NOT NULL,
  `sosial_predikat` varchar(2) NOT NULL,
  `sosial_deskripsi` text NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_nilai_sikap_semester`
--

INSERT INTO `r_nilai_sikap_semester` (`id`, `tahunakademik_id`, `siswa_id`, `kelas_id`, `spiritual_predikat`, `spiritual_deskripsi`, `sosial_predikat`, `sosial_deskripsi`, `user_id`, `update_at`) VALUES
(75, 1, '17', '3', '', '', '', '', '3', '2019-06-28 12:07:58'),
(74, 1, '15', '3', '', '', '', '', '3', '2019-06-28 12:07:58'),
(73, 1, '13', '3', '', '', '', '', '3', '2019-06-28 12:07:58'),
(72, 1, '9', '3', 'A', 'A', 'A', 'A', '3', '2019-06-28 12:07:58'),
(76, 1, '18', '3', '', '', '', '', '3', '2019-06-28 12:07:58'),
(116, 1, '7', '1', '', '', '', '', '3', '2022-10-27 14:50:43'),
(115, 1, '5', '1', '', '', '', '', '3', '2022-10-27 14:50:43'),
(114, 1, '3', '1', 'B', 'Taat melaksanakan ibadah dengan baik, menunjukkan sikap syukur, selalu berdoa sebelum dan sesudah melaksanakan aktifitas', 'B', 'Mampu menjaga hubungan baik dengan teman, guru, pegawai, suka menolong sesama, mampu bekerja sama dalam kegiatan positif di sekolah dengan baik.\r\n      ', '3', '2022-10-27 14:50:43'),
(113, 1, '1', '1', 'A', 'Taat melaksanakan ibadah dengan sangat baik, menunjukkan sikap syukur, selalu berdoa sebelum dan sesudah melaksanakan aktifitas', 'A', 'Mampu menjaga hubungan sangat baik dengan teman, guru, pegawai, suka menolong sesama, mampu bekerja sama dalam kegiatan positif di sekolah dengan baik.\r\n      ', '3', '2022-10-27 14:50:43'),
(107, 2, '1', '1', 'B', 'Taat melaksanakan ibadah dengan baik, menunjukkan sikap syukur, selalu berdoa sebelum dan sesudah melaksanakan aktifitas', 'B', 'Mampu menjaga hubungan baik dengan teman, guru, pegawai, suka menolong sesama, mampu bekerja sama dalam kegiatan positif di sekolah dengan baik.\r\n    ', '4', '2019-07-10 16:47:02'),
(108, 2, '3', '1', '', '', '', '', '4', '2019-07-10 16:47:02'),
(109, 2, '5', '1', '', '', '', '', '4', '2019-07-10 16:47:02'),
(110, 2, '7', '1', '', '', '', '', '4', '2019-07-10 16:47:02'),
(111, 2, '8', '1', '', '', '', '', '4', '2019-07-10 16:47:02'),
(112, 2, '11', '1', '', '', '', '', '4', '2019-07-10 16:47:02'),
(117, 1, '8', '1', '', '', '', '', '3', '2022-10-27 14:50:43'),
(118, 1, '11', '1', '', '', '', '', '3', '2022-10-27 14:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `r_siswa_masuk`
--

DROP TABLE IF EXISTS `r_siswa_masuk`;
CREATE TABLE `r_siswa_masuk` (
  `siswa_id` int(6) NOT NULL,
  `masuk_kelas` varchar(50) NOT NULL,
  `masuk_tanggal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_siswa_masuk`
--

INSERT INTO `r_siswa_masuk` (`siswa_id`, `masuk_kelas`, `masuk_tanggal`) VALUES
(1, 'X IPA 1', '2019-07-04'),
(3, '', ''),
(5, '', ''),
(7, '', ''),
(8, '', ''),
(11, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sar_gedung`
--

DROP TABLE IF EXISTS `sar_gedung`;
CREATE TABLE `sar_gedung` (
  `id` int(10) NOT NULL,
  `kode_gedung` varchar(500) NOT NULL,
  `nama_gedung` varchar(500) NOT NULL,
  `lantai` varchar(50) NOT NULL,
  `panjang` varchar(50) NOT NULL,
  `tinggi` varchar(50) NOT NULL,
  `lebar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_gedung`
--

INSERT INTO `sar_gedung` (`id`, `kode_gedung`, `nama_gedung`, `lantai`, `panjang`, `tinggi`, `lebar`) VALUES
(1, 'G0001', 'Gedung A', '5', '6', '6', '6'),
(2, 'G0002', 'Gedung B', '6', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sar_inventaris`
--

DROP TABLE IF EXISTS `sar_inventaris`;
CREATE TABLE `sar_inventaris` (
  `id` int(10) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `kode_inv` varchar(50) NOT NULL,
  `barang_id` varchar(50) NOT NULL,
  `kondisi_id` varchar(50) NOT NULL,
  `sumber_id` varchar(50) NOT NULL,
  `supplier_id` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `umur_bulan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_inventaris`
--

INSERT INTO `sar_inventaris` (`id`, `tanggal`, `kode_inv`, `barang_id`, `kondisi_id`, `sumber_id`, `supplier_id`, `jumlah`, `harga`, `umur_bulan`) VALUES
(1, '', 'INV001', '1', '1', '1', '', '100', '150000', '24'),
(2, '', 'INV002', '1', '2', '1', '1', '50', '100000', '48'),
(3, '', 'INV003', '2', '1', '4', '', '150', '150000', '12'),
(5, '', 'INV002', '1', '2', '1', '1', '50', '100000', ''),
(8, '', 'INV001', '1', '1', '1', '', '-10', '150000', '24'),
(9, '', 'INV002', '1', '2', '1', '1', '-5', '100000', '48'),
(10, '', 'INV003', '2', '1', '4', '', '-50', '150000', '12'),
(11, '2019-08-16', 'INV004', '2', '1', '1', '1', '48', '100000', '24');

-- --------------------------------------------------------

--
-- Table structure for table `sar_kondisi`
--

DROP TABLE IF EXISTS `sar_kondisi`;
CREATE TABLE `sar_kondisi` (
  `id` int(10) NOT NULL,
  `kondisi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_kondisi`
--

INSERT INTO `sar_kondisi` (`id`, `kondisi`) VALUES
(1, 'BARU'),
(2, 'SECOND'),
(3, 'REKONDISI');

-- --------------------------------------------------------

--
-- Table structure for table `sar_mutasi_barang`
--

DROP TABLE IF EXISTS `sar_mutasi_barang`;
CREATE TABLE `sar_mutasi_barang` (
  `id` int(10) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `barang_id` varchar(50) NOT NULL,
  `ruangan_id` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_mutasi_barang`
--

INSERT INTO `sar_mutasi_barang` (`id`, `kode`, `tanggal`, `barang_id`, `ruangan_id`, `jumlah`, `created_at`) VALUES
(8, 'MUT001', '2019-08-09', '1', '2', '50', '2019-08-09 20:02:22'),
(9, 'MUT001', '2019-08-09', '2', '2', '50', '2019-08-09 20:02:23'),
(10, 'MUT002', '2019-08-09', '1', '1', '50', '2019-08-09 20:02:40'),
(11, 'MUT002', '2019-08-09', '2', '1', '50', '2019-08-09 20:02:40'),
(12, 'MUT003', '2019-08-09', '1', '3', '50', '2019-08-09 20:02:54'),
(13, 'MUT003', '2019-08-09', '2', '3', '50', '2019-08-09 20:02:54'),
(14, 'MUT004', '2019-08-09', '1', '2', '-50', '2019-08-09 20:03:28'),
(15, 'MUT005', '2019-08-09', '1', '2', '50', '2019-08-09 20:05:15'),
(16, 'MUT006', '2019-08-09', '1', '3', '-50', '2019-08-09 20:06:27'),
(17, 'MUT006', '2019-08-09', '2', '3', '-50', '2019-08-09 20:06:28'),
(18, 'MUT007', '2019-08-09', '2', '1', '-10', '2019-08-09 20:08:38'),
(19, 'MUT008', '2019-08-09', '1', '2', '50', '2019-08-09 20:09:05'),
(20, 'MUT008', '2019-08-09', '2', '2', '60', '2019-08-09 20:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `sar_mutasi_rusak`
--

DROP TABLE IF EXISTS `sar_mutasi_rusak`;
CREATE TABLE `sar_mutasi_rusak` (
  `id` int(10) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `kode_inv` varchar(50) NOT NULL,
  `barang_id` varchar(50) NOT NULL,
  `keterangan` varchar(516) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_mutasi_rusak`
--

INSERT INTO `sar_mutasi_rusak` (`id`, `kode`, `tanggal`, `kode_inv`, `barang_id`, `keterangan`, `jumlah`, `created_at`) VALUES
(6, 'RSK006', '2019-08-16', 'INV001', '1', '77', '10', '2019-08-16 13:59:27'),
(7, 'RSK007', '2019-08-16', 'INV002', '1', '2', '5', '2019-08-16 14:01:23'),
(8, 'RSK008', '2019-08-16', 'INV003', '2', '9', '50', '2019-08-16 14:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `sar_namabarang`
--

DROP TABLE IF EXISTS `sar_namabarang`;
CREATE TABLE `sar_namabarang` (
  `id` int(10) NOT NULL,
  `namabarang` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_namabarang`
--

INSERT INTO `sar_namabarang` (`id`, `namabarang`, `image`) VALUES
(1, 'KURSI SISWA', '1564848094133.jpg'),
(2, 'MEJA SISWA', '1564848032725.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sar_ruangan`
--

DROP TABLE IF EXISTS `sar_ruangan`;
CREATE TABLE `sar_ruangan` (
  `id` int(10) NOT NULL,
  `gedung_id` varchar(100) NOT NULL,
  `kode_ruangan` varchar(100) NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_ruangan`
--

INSERT INTO `sar_ruangan` (`id`, `gedung_id`, `kode_ruangan`, `nama_ruangan`) VALUES
(1, '1', 'R0002', 'Ruangan 2'),
(2, '1', 'R0001', 'Ruangan 1'),
(3, '2', 'R003', 'Ruangan 3');

-- --------------------------------------------------------

--
-- Table structure for table `sar_sumberdana`
--

DROP TABLE IF EXISTS `sar_sumberdana`;
CREATE TABLE `sar_sumberdana` (
  `id` int(10) NOT NULL,
  `sumber_dana` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_sumberdana`
--

INSERT INTO `sar_sumberdana` (`id`, `sumber_dana`) VALUES
(1, 'Pembelian Sendiri'),
(2, 'Hibah'),
(3, 'Bantuan WaliMurid'),
(4, 'BOS'),
(6, 'Tukar');

-- --------------------------------------------------------

--
-- Table structure for table `sar_supplier`
--

DROP TABLE IF EXISTS `sar_supplier`;
CREATE TABLE `sar_supplier` (
  `id` int(10) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(600) NOT NULL,
  `telepon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sar_supplier`
--

INSERT INTO `sar_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`) VALUES
(1, 'S001', 'PT. Perkasa Abadi', 'Jl. Semeru 55 Surabaya', '08133344554');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_bayar_batal`
--

DROP TABLE IF EXISTS `siswa_bayar_batal`;
CREATE TABLE `siswa_bayar_batal` (
  `id_master` int(11) NOT NULL,
  `nomor_nota` varchar(40) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `keterangan_batal` text NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `user_batal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_bayar_batal`
--

INSERT INTO `siswa_bayar_batal` (`id_master`, `nomor_nota`, `tanggal`, `keterangan_batal`, `siswa_id`, `user_batal`) VALUES
(18, '5CEFB47168C51 ', '2019-05-30 13:05:45', ' 555', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `siswa_bayar_detail`
--

DROP TABLE IF EXISTS `siswa_bayar_detail`;
CREATE TABLE `siswa_bayar_detail` (
  `id_detail` int(1) UNSIGNED NOT NULL,
  `id_master` int(1) UNSIGNED NOT NULL,
  `biaya_id` int(1) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `biaya` varchar(50) NOT NULL,
  `nominal` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_bayar_detail`
--

INSERT INTO `siswa_bayar_detail` (`id_detail`, `id_master`, `biaya_id`, `jenis`, `biaya`, `nominal`) VALUES
(19, 19, 2, 'PPDB', 'Uang Gedung', '9878909'),
(18, 18, 4, 'PPDB', 'Uang SPP Bulan Juli', '1000000'),
(17, 18, 2, 'PPDB', 'Uang Gedung', '6000000'),
(20, 20, 2, 'ppdb', 'Uang Gedung1', '3000000'),
(21, 21, 5, 'DAFTARULANG', 'Seragam', '1000000'),
(22, 22, 2, 'PPDB', 'Uang Gedung1', '5000000');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_bayar_master`
--

DROP TABLE IF EXISTS `siswa_bayar_master`;
CREATE TABLE `siswa_bayar_master` (
  `id_master` int(11) UNSIGNED NOT NULL,
  `nomor_nota` varchar(40) NOT NULL,
  `tanggal` datetime NOT NULL,
  `totalcart` int(11) NOT NULL,
  `carabayar` varchar(50) NOT NULL DEFAULT 'TUNAI',
  `bayar` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `siswa_id` mediumint(1) UNSIGNED DEFAULT NULL,
  `user_id` mediumint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_bayar_master`
--

INSERT INTO `siswa_bayar_master` (`id_master`, `nomor_nota`, `tanggal`, `totalcart`, `carabayar`, `bayar`, `keterangan`, `siswa_id`, `user_id`) VALUES
(18, '5CEFB47168C51', '2019-05-30 12:46:09', 7000000, 'TUNAI', 0, '', 3, 3),
(19, '5CEFBC21DB22A', '2019-05-30 13:18:57', 9878909, 'TUNAI', 10000000, '', 1, 3),
(20, '5D107E8B41916', '2019-06-24 09:40:59', 3000000, 'TUNAI', 3000000, '', 3, 3),
(21, '5D2743757554D', '2019-07-11 16:11:01', 1000000, 'TUNAI', 1000000, '', 1, 3),
(22, '5D5AB1273D23E', '2019-08-19 00:00:00', 5000000, 'TUNAI', 5000000, '', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `siswa_keterangan`
--

DROP TABLE IF EXISTS `siswa_keterangan`;
CREATE TABLE `siswa_keterangan` (
  `siswa_id` int(5) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_keterangan`
--

INSERT INTO `siswa_keterangan` (`siswa_id`, `keterangan`) VALUES
(1, 'test 01112 rrr'),
(3, ''),
(4, ''),
(402, '');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_keuangan`
--

DROP TABLE IF EXISTS `siswa_keuangan`;
CREATE TABLE `siswa_keuangan` (
  `id` int(10) NOT NULL,
  `siswa_id` int(6) NOT NULL,
  `biaya_id` int(6) NOT NULL,
  `nominal` int(50) NOT NULL,
  `is_paid` int(2) NOT NULL DEFAULT 0,
  `jenis` varchar(50) NOT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_keuangan`
--

INSERT INTO `siswa_keuangan` (`id`, `siswa_id`, `biaya_id`, `nominal`, `is_paid`, `jenis`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 31, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:14', '0000-00-00 00:00:00'),
(2, 32, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:14', '0000-00-00 00:00:00'),
(3, 33, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(4, 34, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(5, 35, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(6, 36, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(7, 37, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(8, 38, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(9, 39, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(10, 40, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(11, 3, 5, 1200000, 1, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(12, 5, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(13, 6, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(14, 7, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(15, 8, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:15', '0000-00-00 00:00:00'),
(16, 9, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(17, 10, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(18, 11, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(19, 12, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(20, 13, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(21, 14, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(22, 15, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(23, 16, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(24, 17, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(25, 19, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(26, 20, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(27, 22, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(28, 23, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(29, 21, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(30, 18, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(31, 24, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:16', '0000-00-00 00:00:00'),
(32, 25, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:17', '0000-00-00 00:00:00'),
(33, 26, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:17', '0000-00-00 00:00:00'),
(34, 27, 5, 1200000, 0, 'DAFTARULANG', 3, '2019-06-25 19:39:17', '0000-00-00 00:00:00'),
(35, 1, 5, 1000000, 1, 'DAFTARULANG', 3, '2019-07-11 21:03:30', '2019-07-11 21:11:17'),
(36, 12, 2, 50000, 0, 'PPDB', 3, '2019-07-31 13:37:18', '2019-07-31 13:37:25'),
(37, 1, 2, 5000000, 1, 'PPDB', 3, '2019-08-19 21:24:00', '2019-08-19 21:24:52'),
(38, 1, 4, 1200000, 1, 'PPDB', 3, '2019-08-19 21:24:12', '2019-09-04 09:42:15'),
(39, 1, 10, 6000000, 1, 'PPDB', 3, '2019-08-19 21:24:23', '2019-09-04 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_pemutihan_batal`
--

DROP TABLE IF EXISTS `siswa_pemutihan_batal`;
CREATE TABLE `siswa_pemutihan_batal` (
  `id_master` int(11) NOT NULL,
  `nomor_nota` varchar(40) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `keterangan_batal` text NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `user_batal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_pemutihan_batal`
--

INSERT INTO `siswa_pemutihan_batal` (`id_master`, `nomor_nota`, `tanggal`, `keterangan_batal`, `siswa_id`, `user_batal`) VALUES
(23, '5D6F24496221F ', '2019-09-04 06:50:29', '  batal', 1, 3),
(24, '5D6F447B34D24 ', '2019-09-04 06:58:55', ' 123', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `siswa_pemutihan_detail`
--

DROP TABLE IF EXISTS `siswa_pemutihan_detail`;
CREATE TABLE `siswa_pemutihan_detail` (
  `id_detail` int(1) UNSIGNED NOT NULL,
  `id_master` int(1) UNSIGNED NOT NULL,
  `biaya_id` int(1) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `biaya` varchar(50) NOT NULL,
  `nominal` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_pemutihan_detail`
--

INSERT INTO `siswa_pemutihan_detail` (`id_detail`, `id_master`, `biaya_id`, `jenis`, `biaya`, `nominal`) VALUES
(23, 23, 4, 'PPDB', 'Uang SPP Bulan Juli', '1200000'),
(24, 24, 10, 'PPDB', 'Uang Gedung2', '6000000'),
(25, 25, 10, 'PPDB', 'Uang Gedung2', '6000000');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_pemutihan_master`
--

DROP TABLE IF EXISTS `siswa_pemutihan_master`;
CREATE TABLE `siswa_pemutihan_master` (
  `id_master` int(11) UNSIGNED NOT NULL,
  `nomor_nota` varchar(40) NOT NULL,
  `tanggal` datetime NOT NULL,
  `totalcart` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `penanggungjawab` varchar(500) NOT NULL,
  `lampiran` varchar(500) NOT NULL,
  `siswa_id` mediumint(1) UNSIGNED DEFAULT NULL,
  `user_id` mediumint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_pemutihan_master`
--

INSERT INTO `siswa_pemutihan_master` (`id_master`, `nomor_nota`, `tanggal`, `totalcart`, `keterangan`, `penanggungjawab`, `lampiran`, `siswa_id`, `user_id`) VALUES
(23, '5D6F24496221F', '2019-09-04 00:00:00', 1200000, 'asd', 'asd', 'default.jpg', 1, 3),
(24, '5D6F447B34D24', '2019-09-04 00:00:00', 6000000, 'asd', 'asd', 'default.jpg', 1, 3),
(25, '5D6F44CC20F48', '2019-09-04 00:00:00', 6000000, '-', '-', 'default.jpg', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `siswa_spp`
--

DROP TABLE IF EXISTS `siswa_spp`;
CREATE TABLE `siswa_spp` (
  `siswa_id` int(6) NOT NULL,
  `nominal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_spp`
--

INSERT INTO `siswa_spp` (`siswa_id`, `nominal`) VALUES
(1, '1000000'),
(3, '750000'),
(4, '1000000'),
(5, '1000000'),
(6, '1000000'),
(7, '1000000'),
(8, '1000000'),
(9, '1000000'),
(10, '1000000'),
(11, '1000000'),
(12, '1000000'),
(13, '900000'),
(14, '1000000'),
(15, '1000000'),
(16, '1000000'),
(17, '1000000'),
(18, '1000000'),
(19, '1000000'),
(20, '1000000'),
(21, '1000000'),
(22, '1000000'),
(23, '1000000'),
(24, '1000000'),
(25, '1000000'),
(26, '1000000'),
(27, '1000000'),
(30, '1000000'),
(31, '1000000'),
(32, '1000000'),
(33, '1000000'),
(34, '1000000'),
(35, '1000000'),
(36, '1000000'),
(37, '1000000'),
(38, '1000000'),
(39, '1000000'),
(40, '1000000'),
(41, '1000000'),
(42, '1000000'),
(43, '1000000'),
(44, '1000000'),
(45, '1000000'),
(46, '1000000'),
(47, '1000000'),
(48, '1000000'),
(49, '1000000'),
(50, '1000000'),
(51, '1000000'),
(52, '1000000'),
(53, '1000000'),
(54, '1000000'),
(55, '1000000'),
(56, '1000000'),
(58, '1000000'),
(60, '1000000'),
(61, '1000000'),
(62, '1000000'),
(63, '1000000'),
(64, '1000000'),
(65, '1000000'),
(66, '1000000'),
(67, '1000000'),
(68, '1000000'),
(71, '1000000'),
(72, '1000000'),
(73, '800000'),
(74, '1000000'),
(75, '1000000'),
(76, '1000000'),
(78, '1000000'),
(79, '1000000'),
(80, '1000000'),
(81, '1000000'),
(82, '1000000'),
(85, '1000000'),
(86, '1000000'),
(87, '1000000'),
(88, '800000'),
(89, '1000000'),
(90, '1000000'),
(91, '1000000'),
(92, '1000000'),
(93, '1000000'),
(94, '1000000'),
(95, '1000000'),
(96, '1000000'),
(97, '1000000'),
(98, '1000000'),
(99, '1000000'),
(100, '1000000'),
(101, ''),
(102, ''),
(103, ''),
(104, ''),
(105, ''),
(106, ''),
(107, ''),
(108, ''),
(109, ''),
(110, ''),
(111, ''),
(112, ''),
(113, ''),
(115, ''),
(116, ''),
(117, ''),
(119, ''),
(120, ''),
(121, ''),
(122, ''),
(123, ''),
(124, ''),
(125, ''),
(126, ''),
(127, ''),
(128, ''),
(129, ''),
(130, ''),
(131, ''),
(132, ''),
(133, ''),
(134, ''),
(135, ''),
(136, ''),
(137, ''),
(138, ''),
(139, ''),
(140, ''),
(141, ''),
(142, ''),
(143, ''),
(144, ''),
(145, ''),
(146, ''),
(147, ''),
(148, ''),
(149, ''),
(150, ''),
(151, ''),
(152, ''),
(153, ''),
(154, ''),
(155, ''),
(156, ''),
(157, ''),
(158, ''),
(159, ''),
(160, ''),
(161, ''),
(162, ''),
(164, ''),
(165, ''),
(167, ''),
(169, ''),
(170, ''),
(171, ''),
(172, ''),
(173, ''),
(174, ''),
(175, ''),
(176, ''),
(177, ''),
(178, ''),
(179, ''),
(180, ''),
(181, ''),
(182, ''),
(183, ''),
(185, ''),
(186, ''),
(187, ''),
(188, ''),
(189, ''),
(190, ''),
(191, ''),
(192, ''),
(193, ''),
(194, ''),
(195, ''),
(196, ''),
(197, ''),
(198, ''),
(199, ''),
(200, ''),
(201, ''),
(202, ''),
(203, ''),
(204, ''),
(205, ''),
(206, ''),
(207, ''),
(208, ''),
(209, ''),
(210, ''),
(211, ''),
(212, ''),
(213, ''),
(214, ''),
(215, ''),
(216, ''),
(217, ''),
(218, ''),
(219, ''),
(220, ''),
(221, ''),
(222, ''),
(223, ''),
(224, ''),
(225, ''),
(226, ''),
(227, ''),
(228, ''),
(229, ''),
(230, ''),
(231, ''),
(232, ''),
(233, ''),
(234, ''),
(235, ''),
(236, ''),
(237, ''),
(238, ''),
(239, ''),
(240, ''),
(241, ''),
(242, ''),
(243, ''),
(244, ''),
(245, ''),
(246, ''),
(247, ''),
(248, ''),
(249, ''),
(250, ''),
(251, ''),
(252, ''),
(253, ''),
(254, ''),
(256, ''),
(257, ''),
(258, ''),
(259, ''),
(261, ''),
(263, ''),
(264, ''),
(267, ''),
(282, ''),
(283, ''),
(285, ''),
(286, ''),
(287, ''),
(288, ''),
(289, ''),
(290, ''),
(291, ''),
(292, ''),
(293, ''),
(294, ''),
(295, ''),
(296, ''),
(297, ''),
(298, ''),
(299, ''),
(300, ''),
(301, ''),
(302, ''),
(303, ''),
(304, ''),
(305, ''),
(306, ''),
(307, ''),
(308, ''),
(309, ''),
(310, ''),
(311, ''),
(312, ''),
(313, ''),
(314, ''),
(315, ''),
(316, ''),
(317, ''),
(318, ''),
(319, ''),
(320, ''),
(321, ''),
(322, ''),
(323, ''),
(324, ''),
(325, ''),
(326, ''),
(327, ''),
(328, ''),
(329, ''),
(330, ''),
(331, ''),
(332, ''),
(333, ''),
(334, ''),
(335, ''),
(336, ''),
(337, ''),
(338, ''),
(339, ''),
(340, ''),
(341, ''),
(342, ''),
(343, ''),
(344, ''),
(345, ''),
(346, ''),
(347, ''),
(348, ''),
(349, ''),
(350, ''),
(351, ''),
(352, ''),
(353, ''),
(354, ''),
(355, ''),
(356, ''),
(357, ''),
(358, ''),
(359, ''),
(360, ''),
(361, ''),
(362, ''),
(363, ''),
(364, ''),
(365, ''),
(366, ''),
(367, ''),
(368, ''),
(369, ''),
(370, ''),
(371, ''),
(372, ''),
(373, ''),
(374, ''),
(375, ''),
(376, ''),
(377, ''),
(378, ''),
(379, ''),
(380, ''),
(381, ''),
(382, ''),
(383, ''),
(384, ''),
(385, ''),
(386, ''),
(388, ''),
(389, ''),
(390, ''),
(391, ''),
(392, ''),
(393, ''),
(394, ''),
(395, ''),
(396, ''),
(397, ''),
(398, ''),
(399, ''),
(400, ''),
(401, ''),
(402, '1000000'),
(403, '800000');

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar`
--

DROP TABLE IF EXISTS `surat_keluar`;
CREATE TABLE `surat_keluar` (
  `id` int(6) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `penerima` varchar(500) NOT NULL,
  `alamat_penerima` varchar(500) NOT NULL,
  `tanggal_keluar` varchar(50) NOT NULL,
  `nomor_surat` varchar(50) NOT NULL,
  `perihal` varchar(500) NOT NULL,
  `penanggung_jawab` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat_kode`
--

DROP TABLE IF EXISTS `surat_kode`;
CREATE TABLE `surat_kode` (
  `id` int(1) NOT NULL,
  `kode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_kode`
--

INSERT INTO `surat_kode` (`id`, `kode`) VALUES
(1, 'SMAN.SBY');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

DROP TABLE IF EXISTS `surat_masuk`;
CREATE TABLE `surat_masuk` (
  `id` int(6) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `pengirim` varchar(500) NOT NULL,
  `alamat_pengirim` varchar(500) NOT NULL,
  `tanggal_masuk` varchar(50) NOT NULL,
  `nomor_surat` varchar(50) NOT NULL,
  `perihal` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id`, `tahun`, `nomor`, `pengirim`, `alamat_pengirim`, `tanggal_masuk`, `nomor_surat`, `perihal`) VALUES
(1, '2019', '20190001', 'DINAS PENDIDIKAN SURABAYA', 'Jl. Jagir Wonokromo No.356', '2020-01-18', '--', 'Simulasi UNBK 2020');

-- --------------------------------------------------------

--
-- Table structure for table `tb_log`
--

DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` int(10) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` varchar(100) NOT NULL,
  `aksi` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_log`
--

INSERT INTO `tb_log` (`id`, `tanggal`, `user`, `aksi`, `item`) VALUES
(15, '2019-10-02 06:17:40', 'admin@admin.com', 'Tambah Role', 'asd'),
(16, '2019-10-02 06:17:56', 'admin@admin.com', 'Edit Role', 'asd dsa'),
(17, '2019-10-02 06:18:06', 'admin@admin.com', 'Hapus Role', 'asd dsa'),
(18, '2019-10-02 06:22:08', 'admin@admin.com', 'Tambah Menu', 'asd'),
(19, '2019-10-02 06:27:41', 'admin@admin.com', 'Tambah Sub Menu', 'asd'),
(20, '2019-10-02 06:28:20', 'admin@admin.com', 'Edit Sub Menu', 'aktifitas'),
(21, '2019-10-02 06:29:04', 'admin@admin.com', 'Edit Sub Menu', 'zzz'),
(22, '2019-10-02 06:29:23', 'admin@admin.com', 'Edit Sub Menu', 'zzz'),
(23, '2019-10-02 06:33:16', 'admin@admin.com', 'Tambah Sub Menu', 'zzz'),
(24, '2019-10-02 06:33:23', 'admin@admin.com', 'Hapus Sub Menu', 'zzz'),
(25, '2019-10-02 06:33:29', 'admin@admin.com', 'Tambah Menu', 'zzz'),
(26, '2019-10-02 06:34:04', 'admin@admin.com', 'Tambah Menu', 'zzzzzzzzzz'),
(27, '2019-10-02 06:34:07', 'admin@admin.com', 'Hapus Menu', 'zzzzzzzzzz'),
(28, '2019-11-21 04:31:58', 'admin@admin.com', 'Edit User', 'rekysda@gmail.com'),
(29, '2020-01-26 02:11:14', 'rekysda@gmail.com', 'Edit Websetting', ''),
(30, '2020-01-26 02:11:55', 'rekysda@gmail.com', 'Edit Websetting', ''),
(31, '2020-01-26 02:12:57', 'rekysda@gmail.com', 'Edit Websetting', ''),
(32, '2020-01-26 02:30:41', 'rekysda@gmail.com', 'Edit Websetting', ''),
(33, '2022-10-26 06:25:17', 'admin@admin.com', 'Edit Profil', 'admin@admin.com'),
(34, '2022-10-26 06:26:08', 'admin@admin.com', 'Hapus Role', 'Member'),
(35, '2022-10-26 06:27:00', 'admin@admin.com', 'Tambah User', 'rifqihakim5889@gmail.com'),
(36, '2022-10-26 06:27:08', 'admin@admin.com', 'Edit User', 'rekysda@gmail.com'),
(37, '2022-10-26 06:32:50', 'rekysda@gmail.com', 'Edit User', 'rifqihakim5889@gmail.com'),
(38, '2022-10-26 07:12:37', 'rekysda@gmail.com', 'Edit User', 'rekysda@gmail.com'),
(39, '2022-10-26 07:12:43', 'rekysda@gmail.com', 'Edit User', 'rifqihakim5889@gmail.com'),
(40, '2022-10-27 05:35:27', 'rekysda@gmail.com', 'Tambah Role', 'Demo'),
(41, '2022-10-27 05:45:15', 'rekysda@gmail.com', 'Tambah User', 'pusatweb1@gmail.com'),
(42, '2022-10-27 07:18:55', 'rekysda@gmail.com', 'Edit Guru', 'Desmainil'),
(43, '2022-10-27 07:21:23', 'rekysda@gmail.com', 'Hapus Mapel', 'Matematika'),
(44, '2022-10-27 07:21:25', 'rekysda@gmail.com', 'Hapus Mapel', 'Bahasa Indonesia'),
(45, '2022-10-27 07:21:27', 'rekysda@gmail.com', 'Hapus Mapel', 'FISIKA'),
(46, '2022-10-27 07:21:36', 'rekysda@gmail.com', 'Hapus Jadwal', ''),
(47, '2022-10-27 07:21:42', 'rekysda@gmail.com', 'Hapus Jadwal', ''),
(48, '2022-10-27 07:21:47', 'rekysda@gmail.com', 'Hapus Jadwal', ''),
(49, '2022-10-27 07:21:55', 'rekysda@gmail.com', 'Hapus Jadwal', ''),
(50, '2022-10-27 07:22:03', 'rekysda@gmail.com', 'Hapus Jadwal', ''),
(51, '2022-10-27 07:22:11', 'rekysda@gmail.com', 'Hapus Jadwal', ''),
(52, '2022-10-27 07:22:15', 'rekysda@gmail.com', 'Hapus Jadwal', ''),
(53, '2022-10-27 07:23:59', 'rekysda@gmail.com', 'Hapus Guru', '#ID Pegawai : 8 '),
(54, '2022-10-27 07:24:11', 'rekysda@gmail.com', 'Hapus Guru', 'Darmawati'),
(55, '2022-10-27 07:24:13', 'rekysda@gmail.com', 'Hapus Guru', 'Dellya'),
(56, '2022-10-27 07:24:14', 'rekysda@gmail.com', 'Hapus Guru', 'Desi Eriani'),
(57, '2022-10-27 07:24:15', 'rekysda@gmail.com', 'Hapus Guru', 'Desmainil'),
(58, '2022-10-27 07:24:17', 'rekysda@gmail.com', 'Hapus Guru', 'Dian Lestari'),
(59, '2022-10-27 07:24:18', 'rekysda@gmail.com', 'Hapus Guru', 'Edwardi'),
(60, '2022-10-27 07:24:18', 'rekysda@gmail.com', 'Hapus Guru', 'Efayanti'),
(61, '2022-10-27 07:24:19', 'rekysda@gmail.com', 'Hapus Guru', 'Efrizal M'),
(62, '2022-10-27 07:24:20', 'rekysda@gmail.com', 'Hapus Guru', 'Ega Nerifalinda'),
(63, '2022-10-27 07:24:21', 'rekysda@gmail.com', 'Hapus Guru', 'Eli Noverma'),
(64, '2022-10-27 07:24:21', 'rekysda@gmail.com', 'Hapus Guru', 'Elianis'),
(65, '2022-10-27 07:24:24', 'rekysda@gmail.com', 'Hapus Guru', 'Elza Refni'),
(66, '2022-10-27 07:24:25', 'rekysda@gmail.com', 'Hapus Guru', 'Erdison'),
(67, '2022-10-27 07:24:28', 'rekysda@gmail.com', 'Hapus Guru', 'Ernawilis'),
(68, '2022-10-27 07:24:34', 'rekysda@gmail.com', 'Hapus Guru', 'Fitria Lisa'),
(69, '2022-10-27 07:24:41', 'rekysda@gmail.com', 'Hapus Guru', 'Zulfiwadris'),
(70, '2022-10-27 07:24:45', 'rekysda@gmail.com', 'Hapus Guru', 'Hanifah'),
(71, '2022-10-27 07:24:47', 'rekysda@gmail.com', 'Hapus Guru', 'Faridawaty'),
(72, '2022-10-27 07:24:48', 'rekysda@gmail.com', 'Hapus Guru', 'Fauzana Fitri zalona'),
(73, '2022-10-27 07:24:48', 'rekysda@gmail.com', 'Hapus Guru', 'Firdawati'),
(74, '2022-10-27 07:24:51', 'rekysda@gmail.com', 'Hapus Guru', 'Floria Napolis'),
(75, '2022-10-27 07:24:52', 'rekysda@gmail.com', 'Hapus Guru', 'Dasmir'),
(76, '2022-10-27 07:24:52', 'rekysda@gmail.com', 'Hapus Guru', 'Destri Eka Putri'),
(77, '2022-10-27 07:24:53', 'rekysda@gmail.com', 'Hapus Guru', 'Elno'),
(78, '2022-10-27 07:24:53', 'rekysda@gmail.com', 'Hapus Guru', 'Erlis'),
(79, '2022-10-27 07:24:54', 'rekysda@gmail.com', 'Hapus Guru', 'Erwin'),
(80, '2022-10-27 07:24:54', 'rekysda@gmail.com', 'Hapus Guru', 'Frimayasti'),
(81, '2022-10-27 07:24:54', 'rekysda@gmail.com', 'Hapus Guru', 'Herman Novia Rozi'),
(82, '2022-10-27 07:24:55', 'rekysda@gmail.com', 'Hapus Guru', 'Indrawati'),
(83, '2022-10-27 07:24:57', 'rekysda@gmail.com', 'Hapus Guru', 'Irma Hadi Surya'),
(84, '2022-10-27 07:25:01', 'rekysda@gmail.com', 'Hapus Guru', 'Irma Yunita'),
(85, '2022-10-27 07:25:01', 'rekysda@gmail.com', 'Hapus Guru', 'Jusnawita'),
(86, '2022-10-27 07:25:02', 'rekysda@gmail.com', 'Hapus Guru', 'Khairiati'),
(87, '2022-10-27 07:25:03', 'rekysda@gmail.com', 'Hapus Guru', 'Khairina Hafni'),
(88, '2022-10-27 07:25:04', 'rekysda@gmail.com', 'Hapus Guru', 'Krisnal Razali'),
(89, '2022-10-27 07:25:04', 'rekysda@gmail.com', 'Hapus Guru', 'Kurnia Mira Lestari'),
(90, '2022-10-27 07:25:05', 'rekysda@gmail.com', 'Hapus Guru', 'Lasmiyenti'),
(91, '2022-10-27 07:25:06', 'rekysda@gmail.com', 'Hapus Guru', 'Leli Novianti'),
(92, '2022-10-27 07:25:07', 'rekysda@gmail.com', 'Hapus Guru', 'Lili Suyani'),
(93, '2022-10-27 07:25:08', 'rekysda@gmail.com', 'Hapus Guru', 'M.Nasir'),
(94, '2022-10-27 07:25:09', 'rekysda@gmail.com', 'Hapus Guru', 'Maria Magdalena'),
(95, '2022-10-27 07:25:10', 'rekysda@gmail.com', 'Hapus Guru', 'Masrafli'),
(96, '2022-10-27 07:25:13', 'rekysda@gmail.com', 'Hapus Guru', 'Leni Marlina'),
(97, '2022-10-27 07:25:14', 'rekysda@gmail.com', 'Hapus Guru', 'Lidya Puspita Sari'),
(98, '2022-10-27 07:25:15', 'rekysda@gmail.com', 'Hapus Guru', 'Masril Hakim'),
(99, '2022-10-27 07:25:15', 'rekysda@gmail.com', 'Hapus Guru', 'Megawati'),
(100, '2022-10-27 07:25:16', 'rekysda@gmail.com', 'Hapus Guru', 'Meiri Hasnetty'),
(101, '2022-10-27 07:25:17', 'rekysda@gmail.com', 'Hapus Guru', 'Metraneliza'),
(102, '2022-10-27 07:25:18', 'rekysda@gmail.com', 'Hapus Guru', 'Mira Fujiati'),
(103, '2022-10-27 07:25:18', 'rekysda@gmail.com', 'Hapus Guru', 'Misteti'),
(104, '2022-10-27 07:25:19', 'rekysda@gmail.com', 'Hapus Guru', 'Murnita'),
(105, '2022-10-27 07:25:20', 'rekysda@gmail.com', 'Hapus Guru', 'Musniar'),
(106, '2022-10-27 07:25:21', 'rekysda@gmail.com', 'Hapus Guru', 'Naan'),
(107, '2022-10-27 07:25:21', 'rekysda@gmail.com', 'Hapus Guru', 'Nadra Juami'),
(108, '2022-10-27 07:25:22', 'rekysda@gmail.com', 'Hapus Guru', 'Nilusmi'),
(109, '2022-10-27 07:25:23', 'rekysda@gmail.com', 'Hapus Guru', 'Nofitatri Purnama'),
(110, '2022-10-27 07:25:24', 'rekysda@gmail.com', 'Hapus Guru', 'p'),
(111, '2022-10-27 07:25:26', 'rekysda@gmail.com', 'Hapus Guru', 'Nurlaili'),
(112, '2022-10-27 07:25:27', 'rekysda@gmail.com', 'Hapus Guru', 'Oki Surya Ananda'),
(113, '2022-10-27 07:25:27', 'rekysda@gmail.com', 'Hapus Guru', 'Oktamira'),
(114, '2022-10-27 07:25:28', 'rekysda@gmail.com', 'Hapus Guru', 'Putra Alfajri Wanto'),
(115, '2022-10-27 07:25:29', 'rekysda@gmail.com', 'Hapus Guru', 'Rahmawati'),
(116, '2022-10-27 07:25:29', 'rekysda@gmail.com', 'Hapus Guru', 'Rahmawitri'),
(117, '2022-10-27 07:25:30', 'rekysda@gmail.com', 'Hapus Guru', 'Rahmayenti Bustami'),
(118, '2022-10-27 07:25:30', 'rekysda@gmail.com', 'Hapus Guru', 'Rasti Mirza'),
(119, '2022-10-27 07:25:31', 'rekysda@gmail.com', 'Hapus Guru', 'Rezki Putra'),
(120, '2022-10-27 07:25:31', 'rekysda@gmail.com', 'Hapus Guru', 'Riadi'),
(121, '2022-10-27 07:25:32', 'rekysda@gmail.com', 'Hapus Guru', 'Rini'),
(122, '2022-10-27 07:25:32', 'rekysda@gmail.com', 'Hapus Guru', 'Riry Mardiyan'),
(123, '2022-10-27 07:25:33', 'rekysda@gmail.com', 'Hapus Guru', 'Rismitri'),
(124, '2022-10-27 07:25:34', 'rekysda@gmail.com', 'Hapus Guru', 'Rozi Kurniawan'),
(125, '2022-10-27 07:25:35', 'rekysda@gmail.com', 'Hapus Guru', 'Salmah'),
(126, '2022-10-27 07:25:35', 'rekysda@gmail.com', 'Hapus Guru', 'Suhardiman'),
(127, '2022-10-27 07:25:37', 'rekysda@gmail.com', 'Hapus Guru', 'Telfi Yendra'),
(128, '2022-10-27 07:25:37', 'rekysda@gmail.com', 'Hapus Guru', 'Tuti Triana'),
(129, '2022-10-27 07:25:38', 'rekysda@gmail.com', 'Hapus Guru', 'Vera Tri Ningsih'),
(130, '2022-10-27 07:25:38', 'rekysda@gmail.com', 'Hapus Guru', 'Vivi Sunarti'),
(131, '2022-10-27 07:25:39', 'rekysda@gmail.com', 'Hapus Guru', 'Yelfina'),
(132, '2022-10-27 07:25:40', 'rekysda@gmail.com', 'Hapus Guru', 'Yernita'),
(133, '2022-10-27 07:25:40', 'rekysda@gmail.com', 'Hapus Guru', 'Yetmaliar'),
(134, '2022-10-27 07:25:41', 'rekysda@gmail.com', 'Hapus Guru', 'Yosnimar'),
(135, '2022-10-27 07:25:42', 'rekysda@gmail.com', 'Hapus Guru', 'Yusnel'),
(136, '2022-10-27 07:25:44', 'rekysda@gmail.com', 'Hapus Guru', 'Zaitun'),
(137, '2022-10-27 07:25:45', 'rekysda@gmail.com', 'Hapus Guru', 'Zetri Zainal'),
(138, '2022-10-27 07:25:47', 'rekysda@gmail.com', 'Hapus Guru', 'Syamsiwarni'),
(139, '2022-10-27 07:27:26', 'rekysda@gmail.com', 'Tambah Mapel', 'MATEMATIKA'),
(140, '2022-10-27 07:29:22', 'rekysda@gmail.com', 'Tambah Mapel', 'BAHASA INDONESIA'),
(141, '2022-10-27 07:30:06', 'rekysda@gmail.com', 'Tambah Jadwal', ''),
(142, '2022-10-27 07:33:40', 'rekysda@gmail.com', 'Tambah Jadwal', ''),
(143, '2022-10-27 07:49:36', 'rekysda@gmail.com', 'Tambah Jadwal', ''),
(144, '2022-10-27 07:50:14', 'rekysda@gmail.com', 'Tambah Jadwal', ''),
(145, '2022-11-09 03:20:49', 'rekysda@gmail.com', 'Tambah Sub Menu', 'preregistrasi'),
(146, '2022-11-09 03:36:58', 'rekysda@gmail.com', 'Hapus Preregistrasi', ''),
(147, '2022-11-09 03:50:19', 'rekysda@gmail.com', 'Hapus Formulir', ''),
(148, '2022-11-09 03:51:18', 'rekysda@gmail.com', 'Tambah Sub Menu', 'tahun-ppdb'),
(149, '2022-11-09 03:53:13', 'rekysda@gmail.com', 'Edit Sub Menu', 'tahun-ppdb'),
(150, '2022-11-09 03:55:03', 'rekysda@gmail.com', 'Tambah Tahun PPDB', '2324-2025'),
(151, '2022-11-09 03:56:24', 'rekysda@gmail.com', 'Hapus Tahun PPDB', '2324-2025'),
(152, '2022-11-09 03:56:34', 'rekysda@gmail.com', 'Tambah Tahun PPDB', '1234-2134'),
(153, '2022-11-09 03:56:38', 'rekysda@gmail.com', 'Hapus Tahun PPDB', '1234-2134'),
(154, '2022-11-09 04:11:26', 'rekysda@gmail.com', 'Edit Kelas', 'X IPA 1'),
(155, '2022-11-09 04:11:34', 'rekysda@gmail.com', 'Edit Kelas', 'X IPS 1'),
(156, '2022-11-09 04:11:38', 'rekysda@gmail.com', 'Edit Kelas', 'XI IPA 1'),
(157, '2022-11-09 04:16:20', 'rekysda@gmail.com', 'Edit Kelas', 'X IPA 1'),
(158, '2022-11-09 04:17:12', 'rekysda@gmail.com', 'Tambah TahunAkademik', 'Semester Ganjil 2022/2023'),
(159, '2022-11-09 04:18:02', 'rekysda@gmail.com', 'Hapus TahunAkademik', 'Semester Ganjil 2019/2020'),
(160, '2022-11-09 04:19:27', 'rekysda@gmail.com', 'Edit TahunAkademik', 'Semester Genap 2022/2023'),
(161, '2022-11-09 04:19:40', 'rekysda@gmail.com', 'Edit Kelas', 'X IPS 1'),
(162, '2022-11-09 04:19:49', 'rekysda@gmail.com', 'Edit Kelas', 'XI IPA 1'),
(163, '2022-11-09 04:19:54', 'rekysda@gmail.com', 'Edit Kelas', 'XI IPA 1'),
(164, '2022-11-09 04:22:35', 'rekysda@gmail.com', 'Hapus Jalur', 'SEYAYASAN'),
(165, '2022-11-09 04:22:45', 'rekysda@gmail.com', 'Hapus Biaya', '#ID : 8'),
(166, '2022-11-09 04:22:47', 'rekysda@gmail.com', 'Hapus Biaya', '#ID : 9'),
(167, '2022-11-09 04:23:17', 'rekysda@gmail.com', 'Hapus Gelombang Jalur', '#ID : 5'),
(168, '2022-11-09 04:23:19', 'rekysda@gmail.com', 'Hapus Gelombang Jalur', '#ID : 8'),
(169, '2022-11-09 04:23:22', 'rekysda@gmail.com', 'Hapus Gelombang Jalur', '#ID : 9'),
(170, '2022-11-09 04:23:27', 'rekysda@gmail.com', 'Hapus Gelombang Jalur', '#ID : 7'),
(171, '2022-11-09 04:23:29', 'rekysda@gmail.com', 'Hapus Gelombang Jalur', '#ID : 6'),
(172, '2022-11-09 04:26:03', 'rekysda@gmail.com', 'Tambah Gelombang Jalur', ''),
(173, '2022-11-09 05:03:08', 'rekysda@gmail.com', 'Tambah Gelombang Jalur', ''),
(174, '2022-11-09 05:05:01', 'rekysda@gmail.com', 'Edit Gelombang Jalur', ''),
(175, '2022-11-09 05:05:04', 'rekysda@gmail.com', 'Edit Gelombang Jalur', ''),
(176, '2022-11-09 05:05:12', 'rekysda@gmail.com', 'Edit Gelombang Jalur', ''),
(177, '2022-11-09 05:05:15', 'rekysda@gmail.com', 'Edit Gelombang Jalur', ''),
(178, '2022-11-09 05:05:25', 'rekysda@gmail.com', 'Tambah Gelombang Jalur', ''),
(179, '2022-11-09 05:05:31', 'rekysda@gmail.com', 'Hapus Gelombang Jalur', '#ID : 12'),
(180, '2022-11-09 05:08:42', 'rekysda@gmail.com', 'Tambah Formulir', ''),
(181, '2022-11-09 05:09:42', 'rekysda@gmail.com', 'Tambah Formulir', ''),
(182, '2022-11-09 05:10:36', 'rekysda@gmail.com', 'Tambah Formulir', ''),
(183, '2022-11-09 05:10:47', 'rekysda@gmail.com', 'Hapus Formulir', ''),
(184, '2022-11-09 05:11:00', 'rekysda@gmail.com', 'Tambah Formulir', ''),
(185, '2022-11-09 05:14:09', 'rekysda@gmail.com', 'Edit Formulir', '23010'),
(186, '2022-11-09 05:14:14', 'rekysda@gmail.com', 'Edit Formulir', '23010');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL,
  `login_oauth_uid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`, `login_oauth_uid`) VALUES
(3, 'Super Administrator', 'superadmin', 'rekysda@gmail.com', '1666765517616.jpg', '$2y$10$MPnKRsUT8l7GHr.0/Bm2UOwgZj70oSwRKM0clSuU3EfMK75RJcu5q', 1, 1, 1555463755, '115893857561817154855'),
(11, 'Administrator', 'admin', 'rifqihakim5889@gmail.com', 'default.jpg', '$2y$10$HkpekNzXW8oKxPJZOiLGXuzTjOVtQ2Zta2nczci2l9hMprxj3k8uq', 1, 1, 1666765620, ''),
(12, 'Demo User', 'Demo', 'pusatweb1@gmail.com', 'default.jpg', '$2y$10$Dd/d880Y4eRxn0PrN1KtQ.Oc/1cg0sROf3gUYIR1IIj8pfWLoMQnO', 6, 1, 1666849515, '113342174082927069989');

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

DROP TABLE IF EXISTS `user_access_menu`;
CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(3, 2, 2),
(4, 1, 3),
(8, 1, 2),
(16, 1, 6),
(17, 1, 7),
(18, 1, 8),
(20, 3, 9),
(21, 4, 9),
(22, 1, 10),
(23, 1, 11),
(24, 1, 12),
(25, 5, 13),
(26, 1, 14),
(27, 1, 15),
(28, 1, 16),
(29, 1, 17),
(30, 1, 18),
(31, 1, 19),
(32, 6, 2),
(33, 6, 6),
(34, 6, 7),
(35, 6, 8),
(37, 6, 10),
(38, 6, 11),
(39, 6, 12),
(40, 6, 14),
(41, 6, 15),
(42, 6, 16),
(43, 6, 17),
(44, 6, 18),
(45, 6, 19);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_submenu`
--

DROP TABLE IF EXISTS `user_access_submenu`;
CREATE TABLE `user_access_submenu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `submenu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access_submenu`
--

INSERT INTO `user_access_submenu` (`id`, `role_id`, `submenu_id`) VALUES
(1, 2, 2),
(2, 2, 3),
(3, 2, 8),
(4, 1, 2),
(5, 1, 3),
(6, 1, 8),
(7, 1, 4),
(8, 1, 5),
(10, 1, 12),
(11, 1, 13),
(12, 1, 1),
(13, 1, 10),
(14, 1, 9),
(15, 1, 7),
(16, 1, 14),
(17, 1, 15),
(18, 1, 16),
(19, 1, 17),
(20, 1, 18),
(21, 1, 19),
(22, 1, 20),
(23, 1, 21),
(24, 1, 22),
(25, 1, 23),
(26, 1, 24),
(27, 1, 25),
(28, 1, 26),
(29, 1, 27),
(31, 1, 28),
(32, 1, 29),
(33, 1, 30),
(34, 1, 31),
(36, 3, 32),
(37, 3, 33),
(38, 4, 32),
(39, 4, 33),
(40, 1, 34),
(41, 1, 35),
(42, 1, 36),
(43, 1, 37),
(44, 1, 38),
(45, 1, 39),
(46, 1, 40),
(47, 1, 41),
(48, 1, 42),
(49, 1, 43),
(50, 1, 44),
(51, 1, 45),
(52, 1, 46),
(53, 1, 47),
(54, 1, 48),
(55, 1, 49),
(56, 1, 50),
(57, 1, 51),
(58, 1, 52),
(59, 1, 53),
(60, 1, 54),
(61, 1, 55),
(62, 1, 56),
(63, 1, 57),
(64, 1, 58),
(65, 1, 59),
(66, 1, 60),
(67, 1, 61),
(68, 5, 62),
(69, 5, 63),
(70, 5, 64),
(71, 5, 65),
(72, 5, 66),
(73, 5, 67),
(74, 5, 68),
(75, 5, 69),
(76, 1, 70),
(77, 1, 71),
(78, 1, 72),
(79, 5, 73),
(80, 4, 74),
(81, 1, 75),
(83, 5, 76),
(84, 1, 77),
(85, 1, 78),
(86, 1, 79),
(87, 1, 80),
(88, 1, 81),
(89, 1, 82),
(90, 1, 83),
(91, 1, 84),
(92, 1, 85),
(93, 1, 86),
(94, 1, 87),
(95, 1, 88),
(96, 1, 89),
(97, 1, 90),
(98, 1, 91),
(99, 1, 92),
(100, 1, 93),
(101, 1, 94),
(102, 1, 95),
(103, 1, 96),
(104, 1, 97),
(105, 1, 98),
(106, 1, 99),
(107, 1, 100),
(108, 1, 101),
(109, 1, 102),
(110, 1, 103),
(111, 1, 104),
(112, 4, 105),
(113, 1, 106),
(114, 1, 107),
(115, 1, 108),
(116, 1, 109),
(117, 1, 110),
(118, 6, 2),
(119, 6, 14),
(120, 6, 15),
(121, 6, 16),
(122, 6, 17),
(123, 6, 19),
(124, 6, 22),
(125, 6, 23),
(126, 6, 29),
(127, 6, 44),
(128, 6, 45),
(129, 6, 46),
(130, 6, 47),
(131, 6, 48),
(132, 6, 50),
(133, 6, 72),
(134, 6, 75),
(135, 6, 77),
(136, 6, 104),
(137, 6, 106),
(138, 6, 18),
(139, 6, 20),
(140, 6, 21),
(141, 6, 24),
(142, 6, 35),
(143, 6, 36),
(144, 6, 40),
(145, 6, 41),
(146, 6, 42),
(147, 6, 49),
(148, 6, 71),
(149, 6, 25),
(150, 6, 26),
(151, 6, 27),
(152, 6, 28),
(153, 6, 30),
(154, 6, 31),
(155, 6, 34),
(156, 6, 37),
(157, 6, 38),
(158, 6, 39),
(159, 6, 43),
(160, 6, 51),
(161, 6, 52),
(162, 6, 53),
(163, 6, 54),
(164, 6, 55),
(165, 6, 56),
(166, 6, 57),
(167, 6, 58),
(168, 6, 59),
(169, 6, 60),
(170, 6, 61),
(171, 6, 70),
(172, 6, 78),
(173, 6, 79),
(174, 6, 80),
(175, 6, 81),
(176, 6, 82),
(177, 6, 83),
(178, 6, 84),
(179, 6, 85),
(180, 6, 86),
(181, 6, 87),
(182, 6, 88),
(183, 6, 89),
(184, 6, 90),
(185, 6, 91),
(186, 6, 92),
(187, 6, 93),
(188, 6, 94),
(189, 6, 95),
(190, 6, 96),
(191, 6, 97),
(192, 6, 98),
(193, 6, 99),
(194, 6, 100),
(195, 6, 101),
(196, 6, 102),
(197, 6, 103),
(198, 6, 107),
(199, 6, 108),
(200, 6, 109),
(201, 6, 110),
(202, 1, 111),
(203, 1, 112);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `menu_id` varchar(50) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `icon`, `menu_id`, `menu`) VALUES
(1, 'fa fa-fw fa-wrench', 'admin', 'Admin'),
(2, 'fa fa-fw fa-users', 'user', 'User'),
(3, 'fa fa-fw fa-navicon', 'menu', 'Menu'),
(4, 'fa fa-fw fa-folder', 'page', 'Page'),
(5, 'fa fa-fw fa-folder', 'post', 'Post'),
(6, 'fa fa-fw fa-graduation-cap', 'akademik', 'Akademik'),
(7, 'fa fa-fw fa-user-plus', 'ppdb', 'PPDB'),
(8, 'fa fa-fw fa-money', 'keuangan', 'Keuangan'),
(9, 'fa fa-fw fa-users', 'siswa', 'Siswa'),
(10, 'fa fa-fw fa-users', 'kepegawaian', 'Kepegawaian'),
(11, 'fa fa-fw fa-gear', 'api', 'API'),
(12, 'fa fa-fw fa-book', 'rapor', 'Rapor'),
(13, 'fa fa-fw fa-users', 'guru', 'Guru'),
(14, 'fa fa-fw fa-building', 'sarpras', 'Sarpras'),
(15, 'fa fa-fw fa-envelope', 'surat', 'Surat'),
(16, 'fa fa-fw fa-book', 'bukutamu', 'BukuTamu'),
(17, 'fa fa-fw fa-exclamation-circle', 'bk', 'BK'),
(18, 'fa fa-fw fa-address-book', 'pemutihan', 'Pemutihan'),
(19, 'fa fa-fw fa-users', 'log', 'Log');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(3, 'CalonSiswa'),
(4, 'SiswaAktif'),
(5, 'Guru'),
(6, 'Demo');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

DROP TABLE IF EXISTS `user_sub_menu`;
CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 1,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `sort`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fa fa-fw fa-dashboard', 1, 0),
(2, 2, 'My Profile', 'user', 'fa fa-fw fa-user', 1, 1),
(3, 2, 'Edit Profile', 'user/edit', 'fa fa-fw fa-user', 1, 1),
(4, 3, 'Menu Management', 'menu', 'fa fa-fw fa-folder', 1, 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fa fa-fw fa-folder-open', 2, 1),
(7, 1, 'Role', 'admin/role', 'fa fa-fw fa-user-secret', 1, 1),
(8, 2, 'Change Password', 'user/changepassword', 'fa fa-fw fa-key', 1, 1),
(9, 1, 'Users', 'admin/userlogin', 'fa fa-fw fa-users', 1, 1),
(10, 1, 'Web Setting', 'admin/websetting', 'fa fa-fw fa-wrench', 1, 1),
(11, 4, 'All Pages', 'page', 'fa fa-fw fa-folder', 1, 1),
(12, 5, 'Categories', 'post/postcategories', 'fa fa-fw fa-folder', 2, 1),
(13, 5, 'All Posts', 'post', 'fa fa-fw fa-folder', 1, 1),
(14, 6, 'Sekolah', 'akademik/sekolah', 'fa fa-fw fa-folder', 1, 1),
(15, 6, 'Tahun Akademik', 'akademik/tahunakademik', 'fa fa-fw fa-folder', 2, 1),
(16, 6, 'Gelombang', 'akademik/gelombang', 'fa fa-fw fa-folder', 3, 1),
(17, 6, 'Jalur', 'akademik/jalur', 'fa fa-fw fa-folder', 4, 1),
(18, 7, 'Jalur Biaya', 'ppdb/jalurbiaya', 'fa fa-fw fa-folder', 1, 1),
(19, 6, 'Biaya', 'akademik/biaya', 'fa fa-fw fa-folder', 5, 1),
(20, 7, 'Siswa', 'ppdb/siswa', '', 4, 1),
(21, 7, 'Formulir', 'ppdb/formulir', '', 2, 1),
(22, 6, 'Setting', 'akademik/setting', '', 6, 1),
(23, 6, 'Gelombang Jalur', 'akademik/gelombangjalur', '', 7, 1),
(24, 7, 'Siswa Jalur', 'ppdb/siswajalur', '', 6, 1),
(25, 8, 'Keuangan Siswa', 'keuangan/siswakeuangan', '', 1, 1),
(26, 8, 'Pembayaran Siswa', 'keuangan/siswabayar', '', 3, 1),
(27, 8, 'Laporan Keuangan', 'keuangan/laporan_keuangan', '', 5, 1),
(28, 8, 'Pembayaran Siswa Batal', 'keuangan/siswabayarvoid', '', 7, 1),
(29, 6, 'Logo Slip', 'akademik/logoslip', '', 8, 1),
(30, 8, 'Cetak Pembayaran Siswa', 'keuangan/siswabayar_list', '', 4, 1),
(31, 8, 'Tagihan Siswa', 'keuangan/siswatagihan', '', 6, 1),
(32, 9, 'My Profile', 'siswa', '', 1, 1),
(33, 9, 'Tagihan', 'siswa/tagihan', '', 2, 1),
(34, 8, 'Keuangan SPP', 'keuangan/siswaspp', '', 2, 1),
(35, 7, 'Siswa CSV', 'ppdb/siswacsv', '', 7, 1),
(36, 7, 'Laporan PPDB', 'ppdb/laporanppdb', '', 10, 1),
(37, 10, 'Pegawai', 'kepegawaian/pegawai', '', 1, 1),
(38, 10, 'Penggajian', 'kepegawaian/penggajian', '', 2, 1),
(39, 10, 'Laporan Penggajian', 'kepegawaian/laporan_penggajian', '', 3, 1),
(40, 7, 'Penjualan Formulir', 'ppdb/formulir_penjualan', '', 3, 1),
(41, 7, 'Laporan Penjualan', 'ppdb/laporan_penjualan', '', 8, 1),
(42, 7, 'Penjualan Formulir Batal', 'ppdb/formulir_penjualan_void', '', 9, 1),
(43, 11, 'API Public', 'api/apipublic', '', 1, 1),
(44, 6, 'Kelas', 'akademik/kelas', '', 10, 1),
(45, 6, 'Kelas Siswa', 'akademik/kelas_addsiswa', '', 12, 1),
(46, 6, 'Presensi Siswa', 'akademik/presensi_siswa', '', 13, 1),
(47, 6, 'Rekap Presensi Siswa', 'akademik/presensi_rekap_siswa', '', 14, 1),
(48, 6, 'Presensi perSiswa', 'akademik/presensi_persiswa', '', 15, 1),
(49, 7, 'Siswa Status', 'ppdb/siswastatus', '', 5, 1),
(50, 6, 'Jurusan', 'akademik/jurusan', '', 9, 1),
(51, 12, 'Kelompok Mapel', 'rapor/kelompok_mapel', '', 1, 1),
(52, 12, 'Mata Pelajaran', 'rapor/mapel', '', 2, 1),
(53, 12, 'Jadwal Pelajaran', 'rapor/jadwal_pelajaran', '', 3, 1),
(54, 12, 'Siswa Masuk', 'rapor/siswa_masuk', '', 4, 1),
(55, 12, 'Capaian Belajar', 'rapor/capaian_belajar', '', 5, 1),
(56, 12, 'Extrakulikuler', 'rapor/extrakulikuler', '', 7, 1),
(57, 12, 'Prestasi', 'rapor/prestasi', '', 8, 1),
(58, 12, 'Input Nilai', 'rapor/input_nilai', '', 9, 1),
(59, 12, 'Cetak Raport UTS', 'rapor/cetak_uts', '', 10, 1),
(60, 12, 'Cetak Raport', 'rapor/cetak_rapor', '', 11, 1),
(61, 12, 'Catatan WaliKelas', 'rapor/catatan_walikelas', '', 6, 1),
(62, 13, 'Profile', 'guru', '', 1, 1),
(63, 13, 'Capaian Belajar', 'guru/capaian_belajar', '', 2, 1),
(64, 13, 'Catatan WaliKelas', 'guru/catatan_walikelas', '', 3, 1),
(65, 13, 'Extrakulikuler', 'guru/extrakulikuler', '', 4, 1),
(66, 13, 'Prestasi', 'guru/prestasi', '', 5, 1),
(67, 13, 'Input Nilai', 'guru/input_nilai', '', 6, 1),
(68, 13, 'Cetak Raport UTS', 'guru/cetak_uts', '', 7, 1),
(69, 13, 'Cetak Raport', 'guru/cetak_rapor', '', 8, 1),
(70, 12, 'Cetak DKN', 'rapor/cetak_dkn', '', 12, 1),
(71, 7, 'Analisa PPDB', 'ppdb/analisa_ppdb', '', 11, 1),
(72, 6, 'Kegiatan Akademik', 'akademik/kegiatanakademik', '', 16, 1),
(73, 13, 'Kalender Kegiatan', 'guru/view_fullcalendar', '', 9, 1),
(74, 9, 'Kalender Kegiatan', 'siswa/view_fullcalendar', '', 4, 1),
(75, 6, 'Journal KBM', 'akademik/journalkbm', '', 17, 1),
(76, 13, 'Journal KBM', 'guru/journalkbm', '', 10, 1),
(77, 6, 'Rekap KBM', 'akademik/rekapkbm', '', 18, 1),
(78, 14, 'Gedung', 'sarpras/gedung', '', 1, 1),
(79, 14, 'Ruangan', 'sarpras/ruangan', '', 2, 1),
(80, 14, 'Sumber Dana', 'sarpras/sumberdana', '', 3, 1),
(81, 14, 'Nama Barang', 'sarpras/namabarang', '', 6, 1),
(82, 14, 'Kondisi Barang', 'sarpras/kondisi', '', 4, 1),
(83, 14, 'Inventaris', 'sarpras/inventaris', '', 7, 1),
(84, 14, 'Supplier', 'sarpras/supplier', '', 5, 1),
(85, 14, 'Mutasi Masuk', 'sarpras/mutasi_masuk', '', 8, 1),
(86, 14, 'Mutasi Keluar', 'sarpras/mutasi_keluar', '', 9, 1),
(87, 14, 'Laporan Mutasi', 'sarpras/laporan_mutasi', '', 10, 1),
(88, 14, 'Laporan Barang', 'sarpras/laporan_barang', '', 11, 1),
(89, 14, 'Rekap Barang', 'sarpras/rekap_barang', '', 12, 1),
(90, 14, 'Mutasi Rusak', 'sarpras/mutasi_rusak', '', 13, 1),
(91, 14, 'Laporan Mutasi Rusak', 'sarpras/laporan_mutasi_rusak', '', 14, 1),
(92, 14, 'Cetak Label', 'sarpras/cetak_label', '', 15, 1),
(93, 11, 'API SMS', 'api/apisms', '', 2, 1),
(94, 15, 'Surat Masuk', 'surat/surat_masuk', '', 2, 1),
(95, 15, 'Surat Keluar', 'surat/surat_keluar', '', 3, 1),
(96, 15, 'Surat Kode', 'surat/surat_kode', '', 1, 1),
(97, 16, 'BukuTamu', 'bukutamu', '', 1, 1),
(98, 16, 'Laporan BukuTamu', 'bukutamu/laporan_bukutamu', '', 2, 1),
(99, 17, 'Kategori Pelanggaran', 'bk/kategori_pelanggaran', '', 1, 1),
(100, 17, 'Pelanggaran', 'bk/pelanggaran', '', 2, 1),
(101, 17, 'Pelanggaran Siswa', 'bk/pelanggaran_siswa', '', 3, 1),
(102, 17, 'Laporan Pelanggaran Siswa', 'bk/laporan_pelanggaran_siswa', '', 4, 1),
(103, 17, 'Laporan Pelanggaran Tanggal', 'bk/laporan_pelanggaran_tanggal', '', 5, 1),
(104, 6, 'Siswa', 'akademik/siswa', '', 11, 1),
(105, 9, 'Pelanggaran', 'siswa/pelanggaran', '', 3, 1),
(106, 6, 'Ultah Siswa', 'akademik/ultah_siswa', '', 19, 1),
(107, 10, 'Ultah Pegawai', 'kepegawaian/ultah_pegawai', '', 4, 1),
(108, 18, 'Pemutihan Siswa', 'pemutihan/pemutihansiswa', '', 1, 1),
(109, 18, 'Pemutihan Siswa Batal', 'pemutihan/pemutihanvoid', '', 2, 1),
(110, 19, 'Aktifitas', 'log/aktifitas', '', 2, 1),
(111, 7, 'Preregistrasi', 'ppdb/preregistrasi', '', 2, 1),
(112, 7, 'Tahun PPDB', 'ppdb/tahunppdb', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES
(1, 'rekysda@gmail.com', 'tfXT0G7MRLemkgiI9pJrDsUo3Zyc4wzh', 1557902817),
(2, 'rekysda@gmail.com', 'UQ6ZHjNoVrF4GKlPqERpMOIJnaAsv198', 1557902983),
(3, 'rekysda@gmail.com', 'Ud4iFoeJGywaR51PgOIHEsfSXt0vkc3n', 1557903370);

-- --------------------------------------------------------

--
-- Table structure for table `web_setting`
--

DROP TABLE IF EXISTS `web_setting`;
CREATE TABLE `web_setting` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_setting`
--

INSERT INTO `web_setting` (`id`, `name`, `is_active`) VALUES
(1, 'signup_member', 1),
(2, 'forgot_password', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akad_journalkbm`
--
ALTER TABLE `akad_journalkbm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akad_kegiatanakademik`
--
ALTER TABLE `akad_kegiatanakademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akad_siswaabsenharian`
--
ALTER TABLE `akad_siswaabsenharian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apiemail`
--
ALTER TABLE `apiemail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apisms`
--
ALTER TABLE `apisms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bk_kategori_pelanggaran`
--
ALTER TABLE `bk_kategori_pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bk_pelanggaran`
--
ALTER TABLE `bk_pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bk_siswapelanggaran`
--
ALTER TABLE `bk_siswapelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bukutamu`
--
ALTER TABLE `bukutamu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrd_penggajian`
--
ALTER TABLE `hrd_penggajian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_agama`
--
ALTER TABLE `m_agama`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_biaya`
--
ALTER TABLE `m_biaya`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_biaya_categories`
--
ALTER TABLE `m_biaya_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_carabayar`
--
ALTER TABLE `m_carabayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_gelombang`
--
ALTER TABLE `m_gelombang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_gelombang_jalur`
--
ALTER TABLE `m_gelombang_jalur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_golongan`
--
ALTER TABLE `m_golongan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_jalur`
--
ALTER TABLE `m_jalur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_jalur_biaya`
--
ALTER TABLE `m_jalur_biaya`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_jenisptk`
--
ALTER TABLE `m_jenisptk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_jurusan`
--
ALTER TABLE `m_jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_kelamin`
--
ALTER TABLE `m_kelamin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_kelas`
--
ALTER TABLE `m_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_kelas_siswa`
--
ALTER TABLE `m_kelas_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_logoslip`
--
ALTER TABLE `m_logoslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_options`
--
ALTER TABLE `m_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_pegawai`
--
ALTER TABLE `m_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_pendidikan`
--
ALTER TABLE `m_pendidikan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_sekolah`
--
ALTER TABLE `m_sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_statuskeaktifan`
--
ALTER TABLE `m_statuskeaktifan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_statusnikah`
--
ALTER TABLE `m_statusnikah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_statuspegawai`
--
ALTER TABLE `m_statuspegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_tahunakademik`
--
ALTER TABLE `m_tahunakademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_tahunppdb`
--
ALTER TABLE `m_tahunppdb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_categories`
--
ALTER TABLE `posts_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_formulir`
--
ALTER TABLE `ppdb_formulir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_formulir_jual`
--
ALTER TABLE `ppdb_formulir_jual`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indexes for table `ppdb_kirimemail`
--
ALTER TABLE `ppdb_kirimemail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_kirimva`
--
ALTER TABLE `ppdb_kirimva`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_preregistrasi`
--
ALTER TABLE `ppdb_preregistrasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_siswa`
--
ALTER TABLE `ppdb_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_status`
--
ALTER TABLE `ppdb_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_status_anak`
--
ALTER TABLE `ppdb_status_anak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_status_formulir`
--
ALTER TABLE `ppdb_status_formulir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppdb_status_ortu`
--
ALTER TABLE `ppdb_status_ortu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rab_kegiatan`
--
ALTER TABLE `rab_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_catatan_walikelas`
--
ALTER TABLE `r_catatan_walikelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_jadwal_pelajaran`
--
ALTER TABLE `r_jadwal_pelajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_kelompok_mapel`
--
ALTER TABLE `r_kelompok_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_mapel`
--
ALTER TABLE `r_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_nilai_extrakulikuler`
--
ALTER TABLE `r_nilai_extrakulikuler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_nilai_keterampilan`
--
ALTER TABLE `r_nilai_keterampilan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_nilai_pengetahuan`
--
ALTER TABLE `r_nilai_pengetahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_nilai_prestasi`
--
ALTER TABLE `r_nilai_prestasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_nilai_sikap_semester`
--
ALTER TABLE `r_nilai_sikap_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_siswa_masuk`
--
ALTER TABLE `r_siswa_masuk`
  ADD PRIMARY KEY (`siswa_id`);

--
-- Indexes for table `sar_gedung`
--
ALTER TABLE `sar_gedung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sar_inventaris`
--
ALTER TABLE `sar_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sar_kondisi`
--
ALTER TABLE `sar_kondisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sar_mutasi_barang`
--
ALTER TABLE `sar_mutasi_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sar_mutasi_rusak`
--
ALTER TABLE `sar_mutasi_rusak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sar_namabarang`
--
ALTER TABLE `sar_namabarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sar_ruangan`
--
ALTER TABLE `sar_ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sar_sumberdana`
--
ALTER TABLE `sar_sumberdana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sar_supplier`
--
ALTER TABLE `sar_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa_bayar_batal`
--
ALTER TABLE `siswa_bayar_batal`
  ADD PRIMARY KEY (`id_master`);

--
-- Indexes for table `siswa_bayar_detail`
--
ALTER TABLE `siswa_bayar_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `siswa_bayar_master`
--
ALTER TABLE `siswa_bayar_master`
  ADD PRIMARY KEY (`id_master`);

--
-- Indexes for table `siswa_keterangan`
--
ALTER TABLE `siswa_keterangan`
  ADD PRIMARY KEY (`siswa_id`);

--
-- Indexes for table `siswa_keuangan`
--
ALTER TABLE `siswa_keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa_pemutihan_batal`
--
ALTER TABLE `siswa_pemutihan_batal`
  ADD PRIMARY KEY (`id_master`);

--
-- Indexes for table `siswa_pemutihan_detail`
--
ALTER TABLE `siswa_pemutihan_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `siswa_pemutihan_master`
--
ALTER TABLE `siswa_pemutihan_master`
  ADD PRIMARY KEY (`id_master`);

--
-- Indexes for table `siswa_spp`
--
ALTER TABLE `siswa_spp`
  ADD PRIMARY KEY (`siswa_id`);

--
-- Indexes for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_kode`
--
ALTER TABLE `surat_kode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_log`
--
ALTER TABLE `tb_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_submenu`
--
ALTER TABLE `user_access_submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_setting`
--
ALTER TABLE `web_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `akad_journalkbm`
--
ALTER TABLE `akad_journalkbm`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `akad_kegiatanakademik`
--
ALTER TABLE `akad_kegiatanakademik`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `akad_siswaabsenharian`
--
ALTER TABLE `akad_siswaabsenharian`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `apiemail`
--
ALTER TABLE `apiemail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `apisms`
--
ALTER TABLE `apisms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bk_kategori_pelanggaran`
--
ALTER TABLE `bk_kategori_pelanggaran`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bk_pelanggaran`
--
ALTER TABLE `bk_pelanggaran`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `bk_siswapelanggaran`
--
ALTER TABLE `bk_siswapelanggaran`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bukutamu`
--
ALTER TABLE `bukutamu`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hrd_penggajian`
--
ALTER TABLE `hrd_penggajian`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_agama`
--
ALTER TABLE `m_agama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_biaya`
--
ALTER TABLE `m_biaya`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `m_biaya_categories`
--
ALTER TABLE `m_biaya_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_carabayar`
--
ALTER TABLE `m_carabayar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_gelombang`
--
ALTER TABLE `m_gelombang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_gelombang_jalur`
--
ALTER TABLE `m_gelombang_jalur`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `m_golongan`
--
ALTER TABLE `m_golongan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `m_jalur`
--
ALTER TABLE `m_jalur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_jalur_biaya`
--
ALTER TABLE `m_jalur_biaya`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `m_jenisptk`
--
ALTER TABLE `m_jenisptk`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_jurusan`
--
ALTER TABLE `m_jurusan`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_kelamin`
--
ALTER TABLE `m_kelamin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_kelas`
--
ALTER TABLE `m_kelas`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_kelas_siswa`
--
ALTER TABLE `m_kelas_siswa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `m_logoslip`
--
ALTER TABLE `m_logoslip`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_options`
--
ALTER TABLE `m_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_pegawai`
--
ALTER TABLE `m_pegawai`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `m_pendidikan`
--
ALTER TABLE `m_pendidikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_sekolah`
--
ALTER TABLE `m_sekolah`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_statuskeaktifan`
--
ALTER TABLE `m_statuskeaktifan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_statusnikah`
--
ALTER TABLE `m_statusnikah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_statuspegawai`
--
ALTER TABLE `m_statuspegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_tahunakademik`
--
ALTER TABLE `m_tahunakademik`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_tahunppdb`
--
ALTER TABLE `m_tahunppdb`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts_categories`
--
ALTER TABLE `posts_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ppdb_formulir`
--
ALTER TABLE `ppdb_formulir`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `ppdb_formulir_jual`
--
ALTER TABLE `ppdb_formulir_jual`
  MODIFY `id_nota` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ppdb_kirimemail`
--
ALTER TABLE `ppdb_kirimemail`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ppdb_kirimva`
--
ALTER TABLE `ppdb_kirimva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ppdb_preregistrasi`
--
ALTER TABLE `ppdb_preregistrasi`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ppdb_siswa`
--
ALTER TABLE `ppdb_siswa`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ppdb_status`
--
ALTER TABLE `ppdb_status`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ppdb_status_anak`
--
ALTER TABLE `ppdb_status_anak`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ppdb_status_formulir`
--
ALTER TABLE `ppdb_status_formulir`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ppdb_status_ortu`
--
ALTER TABLE `ppdb_status_ortu`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rab_kegiatan`
--
ALTER TABLE `rab_kegiatan`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_catatan_walikelas`
--
ALTER TABLE `r_catatan_walikelas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `r_jadwal_pelajaran`
--
ALTER TABLE `r_jadwal_pelajaran`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `r_kelompok_mapel`
--
ALTER TABLE `r_kelompok_mapel`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_mapel`
--
ALTER TABLE `r_mapel`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `r_nilai_extrakulikuler`
--
ALTER TABLE `r_nilai_extrakulikuler`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `r_nilai_keterampilan`
--
ALTER TABLE `r_nilai_keterampilan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `r_nilai_pengetahuan`
--
ALTER TABLE `r_nilai_pengetahuan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT for table `r_nilai_prestasi`
--
ALTER TABLE `r_nilai_prestasi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_nilai_sikap_semester`
--
ALTER TABLE `r_nilai_sikap_semester`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `sar_gedung`
--
ALTER TABLE `sar_gedung`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sar_inventaris`
--
ALTER TABLE `sar_inventaris`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sar_kondisi`
--
ALTER TABLE `sar_kondisi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sar_mutasi_barang`
--
ALTER TABLE `sar_mutasi_barang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sar_mutasi_rusak`
--
ALTER TABLE `sar_mutasi_rusak`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sar_namabarang`
--
ALTER TABLE `sar_namabarang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sar_ruangan`
--
ALTER TABLE `sar_ruangan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sar_sumberdana`
--
ALTER TABLE `sar_sumberdana`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sar_supplier`
--
ALTER TABLE `sar_supplier`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa_bayar_detail`
--
ALTER TABLE `siswa_bayar_detail`
  MODIFY `id_detail` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `siswa_bayar_master`
--
ALTER TABLE `siswa_bayar_master`
  MODIFY `id_master` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `siswa_keuangan`
--
ALTER TABLE `siswa_keuangan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `siswa_pemutihan_detail`
--
ALTER TABLE `siswa_pemutihan_detail`
  MODIFY `id_detail` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `siswa_pemutihan_master`
--
ALTER TABLE `siswa_pemutihan_master`
  MODIFY `id_master` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_kode`
--
ALTER TABLE `surat_kode`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_log`
--
ALTER TABLE `tb_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_access_submenu`
--
ALTER TABLE `user_access_submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `web_setting`
--
ALTER TABLE `web_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
