-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 28, 2020 at 07:01 PM
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
(0, 0, '24 minutes', 0),
(0, 1, '1 heure', 0),
(0, 2, '24 heures', 1),
(1, 0, 'Une sphère privée', 0),
(1, 1, 'Une sphère public', 1),
(2, 0, 'Ma date de naissance', 0),
(2, 1, '12 caractères dont des minuscules, des majuscules, des chiffres et des caractères spéciaux', 1),
(2, 2, 'Mon nom et mon prénom', 0),
(3, 0, 'Vrai', 0),
(3, 1, 'Faux', 1),
(4, 0, 'Une personne qui partage vos photos', 0),
(4, 1, 'Une personne qui suit votre compte', 1),
(4, 2, 'Une personne qui vous parle en message privé', 0),
(5, 0, '20 millions', 0),
(5, 1, '40 millions', 1),
(5, 2, '70 millions', 0),
(6, 0, 'Une personne qui cherche la polémique sur les réseaux sociaux', 1),
(6, 1, 'Un faux compte', 0),
(6, 2, 'Une personne qui pirate les comptes', 0),
(7, 0, 'Une personne dont l\'opinion compte de par sa grande communauté', 1),
(7, 1, 'Un outil qui permet de savoir quelles sont les tendances à la mode', 0),
(7, 2, 'Un post publicitaire', 0),
(8, 0, 'Permettre aux étudiants des universités de communiquer', 1),
(8, 1, 'Pour une utilisation militaire', 0),
(8, 2, 'Comme une encyclopédie libre', 0),
(9, 0, 'Vrai', 1),
(9, 1, 'Faux', 0),
(10, 0, 'En parler avec un adulte', 1),
(10, 1, 'Dénoncer les faits à la police', 0),
(10, 2, 'C\'est normal, ça arrive constamment', 0),
(11, 0, 'Vrai', 1),
(11, 1, 'Faux', 0),
(12, 0, 'Vrai', 1),
(12, 1, 'Faux', 0),
(13, 0, 'Vrai', 0),
(13, 1, 'Faux', 1),
(14, 0, 'Vrai', 1),
(14, 1, 'Faux', 0),
(15, 0, 'Vrai', 1),
(15, 1, 'Faux', 0),
(16, 0, '10 ans', 0),
(16, 1, '13 ans', 1),
(16, 2, '18 ans', 0),
(17, 0, 'Aucune précaution à prendre, il n\'y a aucun danger', 0),
(17, 1, 'Il installe un contrôle parental', 1),
(17, 2, 'Il va sur les jeux où vont ses amis', 0),
(18, 0, 'On demande à ses parents', 0),
(18, 1, 'On s\'inscrit en trichant sur l\'âge', 0),
(18, 2, 'On ne s\'inscrit pas', 1),
(19, 0, 'Une infraction', 1),
(19, 1, 'Autorisé', 0),
(20, 0, 'Oui', 0),
(20, 1, 'Pas tout le temps', 1),
(20, 2, 'Non', 0),
(21, 0, 'D\'échanger avec des amis', 0),
(21, 1, 'D\'être menacé constamment sur les réseau sociaux', 1),
(21, 2, 'Un jeu vidéo', 0),
(22, 0, 'Ça ne craint rien', 0),
(22, 1, 'C\'est se mettre en danger', 1),
(22, 2, 'Tout le monde le fait', 0),
(23, 0, 'Oui', 0),
(23, 1, 'Non', 1),
(24, 0, 'Se prendre en selfie avec des filtres', 0),
(24, 1, 'Recevoir des photos d’inconnus', 0),
(24, 2, 'Suivre en direct et 24h/24 les déplacements de ses amis', 1),
(25, 0, 'Accepter des invitations de personnes inconnues et mal-intentionné', 1),
(25, 1, 'Facebook conserve votre historique tout le temps', 0),
(25, 2, 'Les images publiées peuvent rester en ligne des dizaines d’années', 0),
(26, 0, 'J\'accepte tout de suite', 0),
(26, 1, 'Je regarde son profil pour être sûr de savoir qui c\'est', 1),
(26, 2, 'Je refuse', 0),
(27, 0, 'On lui demande', 1),
(27, 1, 'Si elle a publié des photos de soi, on peut en publier d\'elle', 0),
(27, 2, 'On les publie sans rien demander', 0),
(28, 0, 'Je lui fixe un rendez-vous proche de chez moi', 0),
(28, 1, 'J’y vais avec un(e) ami(e)', 0),
(28, 2, 'Je n\'y vais pas, c\'est trop dangereux', 1),
(29, 0, 'Tu le laisses faire', 0),
(29, 1, 'Tu ne le connais pas! Super un nouveau copain à ajouter dans tes amis', 0),
(29, 2, 'Tu ne le connais pas tu le bloques', 1);

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
('AmElLDYicpPmbSXV', 'mms92', '000007.png', 0, 0),
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
('egTjkUQcFnvFvfZD', 'mms92', '000007.png', 1, 1),
('EonzRxFurzroLrbH', 'mms92', '000004.png', 1, 2),
('eRGensHZusvCfotv', 'mms92', '000003.png', 1, 17),
('ezpNKOajqKOfYJJU', 'mms92', '000001.png', 2, 3),
('fgCGPCWosnrFpSBh', 'mms92', '000001.png', 0, 0),
('fiuAXenaseSmolBy', 'mms92', '000002.png', 0, 1),
('GJkknGIePwxVGFyr', 'mms92', '000002.png', 2, 8),
('GqAmbzWKqHhKklID', '', '000005.png', 1, 1),
('HhrkRIlinGCfKYUm', 'mms92', '000002.png', 0, 1),
('HnSKYlXIxuWwhXAQ', 'aze', '000002.png', 0, 2),
('HOZADqmxBdSTlGrd', 'mms92', '000002.png', 0, 0),
('hqNcajZqMGtTPURc', 'mms', '000002.png', 0, 0),
('idqyQOFZxFwghcuI', 'mms92', '000006.png', 2, 2),
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
('NGGZhzrFZYlyiGyr', 'mms92', '000007.png', 0, 0),
('nHMKktodWnHgwIwT', 'azr', '000002.png', 0, 0),
('NZSnCMezHHdNbIZH', 'mms92', '000002.png', 2, 2),
('oEpAYFvGvLACKlYF', 'aze', '000001.png', 1, 1),
('OrwMuWbYMNAObQvd', 'aze', '000003.png', 1, 1),
('OVAGmnGlzuuWwRIw', 'mms92', '000004.png', 30, 30),
('pjqcZkpTQeeKihcO', 'aze', '000002.png', 1, 2),
('PkUxoKbbAQbQKXUr', 'mms92', '000001.png', 2, 2),
('QmIEWxUApfaXVeyY', 'aze', '000002.png', 0, 0),
('qxDjfkujAvZWPZeo', 'mms92', '000007.png', 2, 2),
('REmFUgdrkaLDSjVS', '', '000007.png', 0, 0),
('sBumrQMZSJOBxuiH', 'mms', '000004.png', 0, 0),
('SjtbgTDdMhpjLWKR', '', '000001.png', 1, 2),
('SozxObrkBmndgaNN', 'aze', '000002.png', 0, 0),
('STzwkXCWMmmUZNuI', 'zae', '000002.png', 0, 0),
('VgeEUQSvbLydssVN', 'mms92', '000005.png', 0, 0),
('VNXSBpKtEQwdwBNG', 'mms92', '000002.png', 0, 2),
('vOHtcGbzlzExaXgK', 'aze', '000003.png', 2, 2),
('VOYxeRslyPsIiTHF', 'mms92', '000007.png', 2, 2),
('VtWmjopcbeGMnyyy', 'mms92', '000003.png', 2, 2),
('wazSXAivGlMCIZgs', 'aze', '000002.png', 2, 2),
('WbSePjtjmIqGxZFd', 'mms92', '000004.png', 0, 0),
('wCpIZUedKPySsFFF', 'mms92', '000001.png', 0, 0),
('weMKAyrjpZheZLCX', 'aze', '000002.png', 0, 2),
('wnsddClszMZDzmAX', 'mms92', '000007.png', 2, 2),
('WrDQaELUhGrxBduD', 'tesr', '000002.png', 0, 0),
('WXszECLpbRUIGPEj', 'aze', '000002.png', 0, 2),
('xbTuhDVtjixFUrZX', 'mms92', '000006.png', 0, 2),
('xIomLeaadEFtWQDh', 'mms92', '000007.png', 1, 2),
('xJhJHpoREKfoKEFx', 'mms92', '000001.png', 0, 0),
('YnlYcYRJzLCnOYIC', 'mms92', '000003.png', 2, 3),
('YVrZEElbkksJvrQe', 'aze', '000001.png', 0, 0),
('yZnwYqHGXzuMjWRq', 'aze', '000002.png', 1, 2),
('zatdjnPMfABDEzeJ', 'mms92', '000005.png', 0, 1),
('ZhPSMfoxhdosSLxC', 'mms92', '000007.png', 2, 2),
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
(0, 'Quelle est la durée de vie des stories ?'),
(1, 'Les réseaux sociaux sont...'),
(2, 'Pour éviter les piratages sur les réseaux sociaux, votre mot de passe est composé de :'),
(3, 'Sur les réseaux, je peux facilement cacher mon identité en utilisant un bon pseudo'),
(4, 'Qu’est-ce qu’un "follower"?'),
(5, 'Combien y a t-il de photo postée par jour sur Instagram ? '),
(6, ' Si on vous parle d’un "troll", à quoi fait-il référence ? '),
(7, 'Qu\'est-ce qu\'un influenceur? '),
(8, 'Pourquoi Facebook était utilisé au début de sa création?'),
(9, 'Les notifications des réseaux perturbent le sommeil des jeunes.'),
(10, 'Un échange sur les réseaux sociaux me fait me sentir menacé, il faut ...'),
(11, 'L’usage excessif du smartphone peut nuire à la fertilité ?'),
(12, 'L’usage prolongée des réseaux peut avoir de lourdes conséquences sur le squelette et les muscles ?'),
(13, 'Consulter régulièrement les réseaux n’a aucun impact sur le stress ?'),
(14, 'La lumière bleue peut entraîner la DMLA (Dégénérescence Maculaire Liée à l’âge )'),
(15, 'La lumière bleue émise par les écrans nuit au sommeil  ?'),
(16, 'Quel est l\'âge minimum pour s\'inscrire sur Facebook ?'),
(17, 'Quelle précaution doit prendre un mineur sur Internet ?'),
(18, 'Que faut-il faire si on veut s\'inscrire à un réseau qui n\'est pas de votre âge ?'),
(19, 'Créer un compte avec des fausses informations est ...'),
(20, 'Connaît-on les personnes avec qui on échange sur les réseaux sociaux ?'),
(21, 'Qu’est-ce que le cyber-harcèlement ?'),
(22, 'Divulguer trop d\'informations à caractère personnel sur Internet...'),
(23, 'Tous vos contacts "amis" sont réellement vos amis ?'),
(24, 'La dernière nouveauté de Snapchat permet de...'),
(25, 'Quel est le principal risque sur Facebook?'),
(26, 'Sur Facebook, une personne me demande en ami :'),
(27, 'Que doit-on faire si on veut publier des photos d\'une de ses amies ?'),
(28, 'Que doit-je faire si un inconnu, par le biais d’un réseau, me demande de le rejoindre chez lui ?'),
(29, 'Un pseudo inconnu vient "s\'incruster" dans la discussion sur le chat');

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
