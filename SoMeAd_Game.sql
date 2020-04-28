-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 28, 2020 at 03:21 PM
-- Server version: 5.7.29-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SoMeAd_Game`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `data` mediumtext,
  `is_expected` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`question_id`, `answer_id`, `data`, `is_expected`) VALUES
(0, 0, 'Reponse 1', 0),
(0, 1, 'Reponse 2', 1),
(0, 2, 'Réponse 3', 0),
(0, 3, 'Réponse 4', 0),
(1, 0, 'Réponse 1', 0),
(1, 1, 'Réponse 2', 0),
(1, 2, 'Réponse 3', 0),
(1, 3, 'Réponse 4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `id` mediumtext NOT NULL,
  `name` varchar(32) NOT NULL,
  `avatar` text NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `question_counter` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaderboard`
--

INSERT INTO `leaderboard` (`id`, `name`, `avatar`, `score`, `question_counter`) VALUES
('AmDgXPHfcYFabYBT', 'mms92', '000002.png', 1, 2),
('aoZMWCzmDJXYzikj', 'mp', '000001.png', 1, 1),
('askZAaEqlgMdVibO', '', '000002.png', 1, 1),
('awDXzWEadAVgYrPr', '', 'null', 0, 0),
('ayAgRjnqoCGnPQRU', 'mms92', '000001.png', 0, 1),
('bkzsgnBnlzvmukyM', 'mms92', '000002.png', 1, 1),
('bPMdVzUDPvsGmsQt', 'mms92', '000001.png', 0, 0),
('bseJUuQIVrxlgnUv', 'mms92', '000001.png', 2, 2),
('BSylliXBvAErksUw', 'mms92', '000001.png', 0, 0),
('CWHhHRwpvficdxLB', 'mms92', '000006.png', 2, 2),
('cxXnBMEwOFytkFXW', 'aze', '000002.png', 2, 2),
('DBDKWTLRAJLdwgtI', 'mms92', 'null', 0, 0),
('dJSWNIXKtiQNxNUA', 'mms92', '000001.png', 0, 0),
('DkiihRFGgMWznalw', 'aze', '000001.png', 2, 2),
('dlCEdBDbiABIcKcg', 'mms', '000001.png', 0, 0),
('ezpNKOajqKOfYJJU', 'mms92', '000001.png', 2, 3),
('fgCGPCWosnrFpSBh', 'mms92', '000001.png', 0, 0),
('fiuAXenaseSmolBy', 'mms92', '000002.png', 0, 1),
('GJkknGIePwxVGFyr', 'mms92', '000002.png', 2, 8),
('HhrkRIlinGCfKYUm', 'mms92', '000002.png', 0, 1),
('HnSKYlXIxuWwhXAQ', 'aze', '000002.png', 0, 2),
('HOZADqmxBdSTlGrd', 'mms92', '000002.png', 0, 0),
('hqNcajZqMGtTPURc', 'mms', '000002.png', 0, 0),
('ijANGcrexNRgwede', 'aze', '000001.png', 1, 1),
('IOmjvQLjmqEJRcxz', 'Mms92', '000002.png', 0, 0),
('IuJtZnkKIKapPQqP', 'aze', '000003.png', 0, 0),
('JCaEYlTtXrmXAOAg', 'mms92', '000004.png', 2, 2),
('JnFNjNUdNAJmZoaW', 'mms92', '000002.png', 0, 0),
('jwqdSIUABPkJeigj', 'aze', '000001.png', 0, 0),
('KfpQHiFcHbrOAgix', 'mms92', '000001.png', 0, 1),
('lAQrWLfbGhxNnBXw', 'mms', '000003.png', 1, 1),
('LtIfcZXBLoNIuWEk', 'mms92', '000003.png', 0, 0),
('MXUPNsyrQCRoFNmK', 'aze', '000002.png', 2, 2),
('mYKHBBivvpgDIVFH', 'mms92', '000001.png', 0, 0),
('nBMhbuQdoKmFhBiq', 'test', '000001.png', 0, 0),
('NGEcsDFadeIlnvnT', 'mms92', '000003.png', 2, 2),
('nHMKktodWnHgwIwT', 'azr', '000002.png', 0, 0),
('NZSnCMezHHdNbIZH', 'mms92', '000002.png', 2, 2),
('oEpAYFvGvLACKlYF', 'aze', '000001.png', 1, 1),
('OrwMuWbYMNAObQvd', 'aze', '000003.png', 1, 1),
('pjqcZkpTQeeKihcO', 'aze', '000002.png', 1, 2),
('PkUxoKbbAQbQKXUr', 'mms92', '000001.png', 2, 2),
('QmIEWxUApfaXVeyY', 'aze', '000002.png', 0, 0),
('sBumrQMZSJOBxuiH', 'mms', '000004.png', 0, 0),
('SjtbgTDdMhpjLWKR', '', '000001.png', 1, 2),
('SozxObrkBmndgaNN', 'aze', '000002.png', 0, 0),
('STzwkXCWMmmUZNuI', 'zae', '000002.png', 0, 0),
('VNXSBpKtEQwdwBNG', 'mms92', '000002.png', 0, 2),
('vOHtcGbzlzExaXgK', 'aze', '000003.png', 2, 2),
('VtWmjopcbeGMnyyy', 'mms92', '000003.png', 2, 2),
('wazSXAivGlMCIZgs', 'aze', '000002.png', 2, 2),
('WbSePjtjmIqGxZFd', 'mms92', '000004.png', 0, 0),
('wCpIZUedKPySsFFF', 'mms92', '000001.png', 0, 0),
('weMKAyrjpZheZLCX', 'aze', '000002.png', 0, 2),
('WrDQaELUhGrxBduD', 'tesr', '000002.png', 0, 0),
('WXszECLpbRUIGPEj', 'aze', '000002.png', 0, 2),
('xJhJHpoREKfoKEFx', 'mms92', '000001.png', 0, 0),
('YnlYcYRJzLCnOYIC', 'mms92', '000003.png', 2, 3),
('YVrZEElbkksJvrQe', 'aze', '000001.png', 0, 0),
('yZnwYqHGXzuMjWRq', 'aze', '000002.png', 1, 2),
('ZHqHKnvGOnriuwov', 'mms92', '000001.png', 2, 2),
('ZLFQaDRlcWRRjZNj', 'aze', '000002.png', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `data` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `data`) VALUES
(0, 'Question 1'),
(1, 'Question 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`question_id`,`answer_id`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`id`(16)),
  ADD KEY `question_counter` (`question_counter`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_id` (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
