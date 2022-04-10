-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Värd: localhost
-- Tid vid skapande: 10 apr 2022 kl 19:12
-- Serverversion: 5.7.34
-- PHP-version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `Photo-app`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `albums`
--

INSERT INTO `albums` (`id`, `title`, `user_id`) VALUES
(1, 'Fire_memes', 14),
(2, 'Cat_photos', 14),
(3, 'Dev_notes', 15),
(4, 'Nuclear-launch-codes', 16),
(5, 'Random-album', 18),
(13, 'Plain Album', 18),
(14, 'Really Plain Album', 18),
(15, 'Really Plain Album - Tester', 18),
(16, 'Really Plain Album - Tester', 18),
(17, 'Really Plain Album - Tester', 18),
(18, 'Really Plain Album - Tester', 18),
(19, 'Really Plain Album - Tester', 18),
(20, 'Really Plain Album - Tester', 18),
(21, 'Really Plain Album - Tester', 18),
(22, 'Really Plain Album - Tester', 18),
(23, 'Really Plain Album - Tester', 18),
(24, 'Really Plain Album - Tester', 18),
(25, 'Really Plain Album - Tester', 18),
(26, 'Really Plain Album - Tester', 18),
(27, 'Really Plain Album - Tester', 18),
(28, 'Really Plain Album - Tester', 18),
(29, 'testing album', 19),
(30, 'Coffee Album', 14);

-- --------------------------------------------------------

--
-- Tabellstruktur `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `photos`
--

INSERT INTO `photos` (`id`, `title`, `url`, `comment`, `user_id`) VALUES
(1, 'Very_nice_meme', 'https://preview.redd.it/19fq7c002w021.png?width=960&crop=smart&auto=webp&s=6f07026d1381361b7a1716442cfc86c85d567047', 'such_wow', 14),
(2, 'Notes_1', 'https://thumbs.dreamstime.com/z/programming-coding-source-code-screen-abstract-software-developer-computer-script-55910605.jpg', 'javascript notes', 15),
(3, 'Codes_1', 'https://c7.alamy.com/comp/2AM322N/hacking-nuclear-launch-code-password-concept-2AM322N.jpg', '', 16),
(4, 'Confetti Photo', 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30', 'Confetti', 18),
(5, 'cursed-image', 'https://lh3.googleusercontent.com/2hDpuTi-0AMKvoZJGd-yKWvK4tKdQr_kLIpB_qSeMau2TNGCNidAosMEvrEXFO9G6tmlFlPQplpwiqirgrIPWnCKMvElaYgI-HiVvXc=w600', '', 18),
(6, 'cursed-image-2', 'https://www.coogfans.com/uploads/db5902/original/3X/8/1/81173237ffa580ef710b0862fdddaac163274db1.jpeg', '', 18),
(7, 'testing', 'https://i0.wp.com/mobilanyheter.net/wp-content/uploads/2020/06/783px-Test-Logo.svg_-5.png?w=783&ssl=1', '', 19),
(8, 'Great Coffee', 'https://joya.info/images/content/438914-1200x700c56x50-Kaffee-mit-pflanzlicher-Milch-Barista_1200x798.jpg', 'Such taste many energi', 14);

-- --------------------------------------------------------

--
-- Tabellstruktur `photos_albums`
--

CREATE TABLE `photos_albums` (
  `id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `photos_albums`
--

INSERT INTO `photos_albums` (`id`, `photo_id`, `album_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 4),
(4, 4, 5),
(5, 4, 5),
(6, 7, 29),
(7, 8, 30);

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`) VALUES
(14, 'johan@developer.com', '$2b$10$AoL1disHqktPD4uBslVonugNiSifXlpR1APM3NHkrvCtMlVdi/kKy', 'Johan', 'Nordström'),
(15, 'cazpian@noob.com', '$2b$10$Hps83Jr0Ct3T9uEntM7.v.T4JnMsPVbOsUXl6fbKp.2.TTR1jTjOy', 'Cazpian', 'Levén'),
(16, 'cat@kitten.com', '$2b$10$wN5RdQy8C7aKVghDmG9EGeRndtUTqSWrnnOr/yWtJTsy5phjvdf6.', 'Mister', 'Whiskers'),
(17, 'ooaa@aaoo.com', '$2b$10$DQGyJ6c5qW4tRT0p/QQMk.GyUsLfnR.XypRgphkzo8FFzKhN6.I4C', 'Ooaa', 'Aaoo'),
(18, 'random@user.com', '$2b$10$J.eHPLDIZePg5hZwvD8JV.UyKDNfPI5F4uDgNWvO7UZVVFP3YF97.', 'Random', 'User'),
(19, 'tester@test.com', '$2b$10$sbNIKvAiB7scP.pcGZ/FEOR3MaKGXLCwoVSj.j4Oo14ZfqetDV7pW', 'Tester', 'Testingson'),
(20, 'test@tester.com', '$2b$10$1tE/5DiNwnrUeY5KairTaOHvsjr/NO0rmbmftF8vsoAi5GO38h8U6', 'Testerina', 'Testingson');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `albums_ibfk_1` (`user_id`);

--
-- Index för tabell `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_ibfk_1` (`user_id`);

--
-- Index för tabell `photos_albums`
--
ALTER TABLE `photos_albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_albums_ibfk_1` (`photo_id`),
  ADD KEY `photos_albums_ibfk_2` (`album_id`);

--
-- Index för tabell `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT för tabell `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT för tabell `photos_albums`
--
ALTER TABLE `photos_albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT för tabell `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restriktioner för tabell `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restriktioner för tabell `photos_albums`
--
ALTER TABLE `photos_albums`
  ADD CONSTRAINT `photos_albums_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  ADD CONSTRAINT `photos_albums_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
