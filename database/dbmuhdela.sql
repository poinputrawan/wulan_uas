-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jan 2021 pada 06.44
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmuhdela`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(3) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT 'administrator',
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'admin',
  `alamat` text NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`, `level`, `alamat`, `no_telp`, `email`, `blokir`, `id_session`) VALUES
(4, 'admin', 'b816d6b75c7d6892d07e74a2e1dd8b98', 'Wulan Cahyani', 'admin', 'Janeperie', '0796846746', 'Wulan@gmail.com', 'N', '1s3hu3cjtpvpnoafliugcicuv2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `file_materi`
--

CREATE TABLE `file_materi` (
  `id_file` int(7) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_matapelajaran` varchar(5) NOT NULL,
  `nama_file` varchar(100) NOT NULL,
  `tgl_posting` date NOT NULL,
  `pembuat` varchar(50) NOT NULL,
  `hits` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jawaban`
--

CREATE TABLE `jawaban` (
  `id` int(50) NOT NULL,
  `id_tq` int(50) NOT NULL,
  `id_quiz` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `jawaban` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jawaban`
--

INSERT INTO `jawaban` (`id`, `id_tq`, `id_quiz`, `id_siswa`, `jawaban`) VALUES
(5, 28, 77, 5, 'persamaan kata'),
(6, 28, 78, 5, 'perlawanan kata'),
(7, 29, 79, 5, 'persamaan kata'),
(8, 29, 80, 5, 'pelawanaan kata');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` int(5) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_pengajar` int(9) NOT NULL,
  `id_siswa` int(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `id_kelas`, `nama`, `id_pengajar`, `id_siswa`) VALUES
(8, '7c', 'VII - C', 6, 0),
(6, '7a', 'VII - A', 1, 5),
(12, '8b', 'VIII - B', 0, 0),
(13, '8c', 'VIII - C', 0, 0),
(14, '8d', 'VIII - D', 0, 0),
(15, '8e', 'VIII - E', 0, 0),
(16, '9a', 'VIIII - A', 0, 0),
(17, '9b', 'VIIII - B', 0, 0),
(18, '9c', 'VIIII - C', 0, 0),
(19, '9d', 'VIIII - D', 0, 0),
(20, '9e', 'VIIII - E', 0, 0),
(27, '7b', 'VII - B', 3, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id` int(5) NOT NULL,
  `id_matapelajaran` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_pengajar` int(9) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id`, `id_matapelajaran`, `nama`, `id_kelas`, `id_pengajar`, `deskripsi`) VALUES
(11, 'BI1', 'Bahasa Indonesia', '7a', 0, ''),
(10, 'M1', 'Matematika', '7a', 1, ''),
(12, 'B1', 'Bahasa Inggris', '7a', 0, ''),
(13, 'G1', 'Geografi', '7a', 0, ''),
(15, 'BI2', 'Bahasa Indonesia', '7b', 6, ''),
(16, 'B2', 'Bahasa Inggris', '7b', 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(5) NOT NULL,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `publish` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `status` enum('pengajar','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `urutan` int(5) NOT NULL,
  `link_seo` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `static_content`, `gambar`, `publish`, `status`, `aktif`, `urutan`, `link_seo`) VALUES
(2, 'Manajemen Admin', '?module=admin', '', '', 'N', 'admin', 'N', 2, ''),
(18, 'Materi', '?module=materi', '', '', 'N', 'pengajar', 'Y', 6, 'semua-berita.html'),
(37, 'Manajemen Siswa', '?module=siswa', '', 'gedungku.jpg', 'Y', 'admin', 'Y', 3, 'profil-kami.html'),
(10, 'Manajemen Modul', '?module=modul', '', '', 'N', 'admin', 'N', 1, ''),
(31, 'Mata Pelajaran', '?module=matapelajaran', '', '', 'Y', 'pengajar', 'Y', 5, ''),
(63, 'Manajemen Quiz', '?module=quiz', '', '', 'N', 'pengajar', 'Y', 7, ''),
(41, 'Manajemen Kelas', ' ?module=kelas', '', '', 'N', 'pengajar', 'Y', 4, 'semua-agenda.html'),
(65, 'Registrasi Siswa', '?module=registrasi', '', '', 'Y', 'admin', 'Y', 8, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id` int(50) NOT NULL,
  `id_tq` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `benar` int(10) NOT NULL,
  `salah` int(10) NOT NULL,
  `tidak_dikerjakan` int(50) NOT NULL,
  `persentase` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id`, `id_tq`, `id_siswa`, `benar`, `salah`, `tidak_dikerjakan`, `persentase`) VALUES
(1, 29, 5, 2, 0, 0, 100),
(2, 30, 7, 4, 1, 0, 80);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_soal_esay`
--

CREATE TABLE `nilai_soal_esay` (
  `id` int(50) NOT NULL,
  `id_tq` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `nilai` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_soal_esay`
--

INSERT INTO `nilai_soal_esay` (`id`, `id_tq`, `id_siswa`, `nilai`) VALUES
(14, 29, 5, '80');

-- --------------------------------------------------------

--
-- Struktur dari tabel `online`
--

CREATE TABLE `online` (
  `ip` varchar(20) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `tanggal` date NOT NULL,
  `online` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `online`
--

INSERT INTO `online` (`ip`, `id_siswa`, `tanggal`, `online`) VALUES
('::1', 7, '2021-01-25', 'T'),
('127.0.0.1', 5, '2011-07-14', 'T'),
('::1', 9, '2011-12-28', 'T');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajar`
--

CREATE TABLE `pengajar` (
  `id_pengajar` int(9) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username_login` varchar(100) NOT NULL,
  `password_login` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'pengajar',
  `alamat` text NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `jabatan` varchar(200) NOT NULL,
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengajar`
--

INSERT INTO `pengajar` (`id_pengajar`, `nip`, `nama_lengkap`, `username_login`, `password_login`, `level`, `alamat`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_telp`, `email`, `foto`, `website`, `jabatan`, `blokir`, `id_session`) VALUES
(1, '10101010102', 'Almazari', 'guru1', '92afb435ceb16630e9827f54330c59c9', 'pengajar', 'Depoan Kg 2 No.0 Rt 0 Rw 2 Yogyakarta', 'Rimbo Bujang, Jambi', '1989-10-23', 'L', 'Islam', '085228482669', 'almazary@gmail.com', 'IMG_4200.JPG', 'www.dokumenary.wordpress.com', 'Kepala Sekolah', 'N', 'lumoap51gv2n50cn50djvg3kg6'),
(2, '121212121212', 'rizka gustikasari', 'rizkag', '63622dc90b4299b2c2572f8dcd8b870a', 'pengajar', 'jl.veteran', 'Tangerang, Jakarta', '1990-10-10', 'P', 'Islam', '0852', 'rizka@gmail.com', '06112009087.jpg', 'www.rizka.co.cc', '', 'N', 'asntshpb48alcqr3svfe4s21v0'),
(3, '987673647234', 'Nurkholis Vannia Kusuma', 'guru3', 'ba6e3bb0215b631f473dd97cd3de08b2', 'pengajar', 'jl.kenari 145B', 'Klaten', '1989-01-07', 'L', 'Kristen', '0000', 'almazary@gmail.com', 'IMG_4191.JPG', 'www.dokumenary.co.cc', '', 'N', 'k05hb9m4amgigjqmv8euovp9e6'),
(6, '1234567891', 'rizka gustikasari', 'guru2', '440a21bd2b3a7c686cf3238883dd34e9', 'pengajar', 'jl.veteran', 'tangerang', '1990-08-10', 'P', 'Islam', '0000', 'asd', '05052010514.jpg', 'asdf', '', 'N', 'b52fskg7rvc6hkfb08h5sat9i4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `quiz_esay`
--

CREATE TABLE `quiz_esay` (
  `id_quiz` int(9) NOT NULL,
  `id_tq` int(9) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_buat` date NOT NULL,
  `jenis_soal` varchar(50) NOT NULL DEFAULT 'esay'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `quiz_esay`
--

INSERT INTO `quiz_esay` (`id_quiz`, `id_tq`, `pertanyaan`, `gambar`, `tgl_buat`, `jenis_soal`) VALUES
(79, 29, 'pengertian dari sinonim', '', '2011-07-13', 'esay'),
(80, 29, 'pengertian dari antonim', '', '2011-07-13', 'esay');

-- --------------------------------------------------------

--
-- Struktur dari tabel `quiz_pilganda`
--

CREATE TABLE `quiz_pilganda` (
  `id_quiz` int(10) NOT NULL,
  `id_tq` int(9) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `pil_a` text NOT NULL,
  `pil_b` text NOT NULL,
  `pil_c` text NOT NULL,
  `pil_d` text NOT NULL,
  `kunci` varchar(1) NOT NULL,
  `tgl_buat` date NOT NULL,
  `jenis_soal` varchar(50) NOT NULL DEFAULT 'pilganda'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `quiz_pilganda`
--

INSERT INTO `quiz_pilganda` (`id_quiz`, `id_tq`, `pertanyaan`, `gambar`, `pil_a`, `pil_b`, `pil_c`, `pil_d`, `kunci`, `tgl_buat`, `jenis_soal`) VALUES
(204, 29, 'pengertian dari antonim<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>', '', 'persamaan', 'perlawanan', 'perumpamaan', 'perulangan', 'B', '2011-07-13', 'pilganda'),
(203, 29, 'pengertina dari sinonim', '', 'persamaan', 'perlawanan', 'perumpamaan', 'perulangan', 'A', '2011-07-13', 'pilganda'),
(205, 30, 'adfa', '', 'asda', 'asdf', 'asdf', 'asdf', 'B', '2012-03-10', 'pilganda'),
(206, 30, 'asdfaasd', '', 'asd', 'asd', 'asdfsd', 'asdf', 'B', '2012-03-10', 'pilganda'),
(207, 30, 'asdfasdf', '', 'asdf', 'asd', 'asd', 'asdfasd', 'B', '2012-03-10', 'pilganda'),
(208, 30, 'fgderd', '', 'sdf', 'asdfgasdfg', 'sdfgs', 'sdf', 'B', '2012-03-10', 'pilganda'),
(209, 30, 'jjhljhlj', '', ';kj', 'kjjh', 'jhkjh', 'kjhkjhjkh', 'B', '2012-03-10', 'pilganda'),
(210, 31, 'test pertanyaan', '', 'iya', 'tidak ', 'bukan', 'bukan sekali', 'C', '2012-03-22', 'pilganda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `templates`
--

CREATE TABLE `templates` (
  `id_templates` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pembuat` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `folder` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `templates`
--

INSERT INTO `templates` (`id_templates`, `judul`, `pembuat`, `folder`, `aktif`) VALUES
(4, 'Standar', 'Almazari', 'templates/almazari', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `topik_quiz`
--

CREATE TABLE `topik_quiz` (
  `id_tq` int(9) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_matapelajaran` varchar(10) NOT NULL,
  `tgl_buat` date NOT NULL,
  `pembuat` varchar(100) NOT NULL,
  `waktu_pengerjaan` int(50) NOT NULL,
  `info` text NOT NULL,
  `terbit` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `topik_quiz`
--

INSERT INTO `topik_quiz` (`id_tq`, `judul`, `id_kelas`, `id_matapelajaran`, `tgl_buat`, `pembuat`, `waktu_pengerjaan`, `info`, `terbit`) VALUES
(29, 'Tes Ulangan', '7a', 'BI1', '2011-07-13', '6', 3600, 'mohon dikerjakan dengan benar', 'Y'),
(30, 'Ujian Bahasa Indonesia', '7a', 'BI1', '2012-03-10', 'admin', 5400, 'ini test bahasa indonesia', 'Y'),
(31, 'Test Masuk', '7a', 'M1', '2012-03-22', '1', 3000, '', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `file_materi`
--
ALTER TABLE `file_materi`
  ADD PRIMARY KEY (`id_file`);

--
-- Indeks untuk tabel `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nilai_soal_esay`
--
ALTER TABLE `nilai_soal_esay`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `online`
--
ALTER TABLE `online`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `pengajar`
--
ALTER TABLE `pengajar`
  ADD PRIMARY KEY (`id_pengajar`);

--
-- Indeks untuk tabel `quiz_esay`
--
ALTER TABLE `quiz_esay`
  ADD PRIMARY KEY (`id_quiz`);

--
-- Indeks untuk tabel `quiz_pilganda`
--
ALTER TABLE `quiz_pilganda`
  ADD PRIMARY KEY (`id_quiz`);

--
-- Indeks untuk tabel `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id_templates`);

--
-- Indeks untuk tabel `topik_quiz`
--
ALTER TABLE `topik_quiz`
  ADD PRIMARY KEY (`id_tq`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `file_materi`
--
ALTER TABLE `file_materi`
  MODIFY `id_file` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT untuk tabel `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `nilai_soal_esay`
--
ALTER TABLE `nilai_soal_esay`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pengajar`
--
ALTER TABLE `pengajar`
  MODIFY `id_pengajar` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `quiz_esay`
--
ALTER TABLE `quiz_esay`
  MODIFY `id_quiz` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `quiz_pilganda`
--
ALTER TABLE `quiz_pilganda`
  MODIFY `id_quiz` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT untuk tabel `templates`
--
ALTER TABLE `templates`
  MODIFY `id_templates` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `topik_quiz`
--
ALTER TABLE `topik_quiz`
  MODIFY `id_tq` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
