-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Värd: localhost
-- Tid vid skapande: 10 mars 2022 kl 17:43
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
(1, 'Fire_memes', 1),
(2, 'Cat_photos', 1),
(3, 'Dev_notes', 2),
(4, 'Nuclear-launch-codes', 3),
(5, 'Random-album', 13);

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
(1, 'Very_nice_meme', 'https://preview.redd.it/19fq7c002w021.png?width=960&crop=smart&auto=webp&s=6f07026d1381361b7a1716442cfc86c85d567047', 'such_wow', 1),
(2, 'Notes_1', 'https://thumbs.dreamstime.com/z/programming-coding-source-code-screen-abstract-software-developer-computer-script-55910605.jpg', 'javascript notes', 2),
(3, 'Codes_1', 'https://c7.alamy.com/comp/2AM322N/hacking-nuclear-launch-code-password-concept-2AM322N.jpg', '', 3),
(4, 'Confetti Photo', 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30', 'Confetti', 13),
(5, 'cursed-image', 'https://lh3.googleusercontent.com/2hDpuTi-0AMKvoZJGd-yKWvK4tKdQr_kLIpB_qSeMau2TNGCNidAosMEvrEXFO9G6tmlFlPQplpwiqirgrIPWnCKMvElaYgI-HiVvXc=w600', '', 13),
(6, 'cursed-image-2', 'https://www.coogfans.com/uploads/db5902/original/3X/8/1/81173237ffa580ef710b0862fdddaac163274db1.jpeg', NULL, 13);

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
(5, 4, 5);

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
(1, 'johan@developer.com', 'ilovejava123', 'Johan', 'Nordström'),
(2, 'cazpian@noob.com', 'goodpassword1337', 'Cazpian', 'Levén'),
(3, 'cat@kitten.com', '<3tunafish', 'Mister', 'Whiskers'),
(4, 'jn@badcameraphotography.com', 'omg-smile', 'Bobo', 'Smith'),
(5, 'test@user.com', 'secret_password', 'John', 'Smith'),
(7, 'test@user2.com', 'secret_password', 'Johan', 'Smith'),
(8, 'test@user3.com', 'secret_password', 'Johansson', 'Smith'),
(9, 'test@user4.com', 'secret_password', 'Joan', 'Smith'),
(10, 'test@user5.com', 'secret_password42', 'Ben', 'Jerry'),
(11, 'test@user6.com', 'secret_password42', 'Jen', 'Berry'),
(12, 'ooaa@aaoo.com', '$2b$10$u/W0QbgjPupX1sb68nywquIAcYStH8y4.csCecatNLN0DqKpPTx4u', 'John', 'Cena'),
(13, 'random@user.com', '$2b$10$ecG.Jku/qOb1igxN.OD/qePxZ9bCSCGPYVAtsXvymRK8xF3QwJdv2', 'random', 'user');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index för tabell `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index för tabell `photos_albums`
--
ALTER TABLE `photos_albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_id` (`photo_id`),
  ADD KEY `albums_id` (`album_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT för tabell `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT för tabell `photos_albums`
--
ALTER TABLE `photos_albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT för tabell `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
