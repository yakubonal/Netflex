-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 fév. 2024 à 23:42
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `netflex`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `idActeur` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `dateMort` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`idActeur`, `nom`, `prenom`, `dateNaissance`, `dateMort`) VALUES
(1, 'JOHNSON', 'Dwayne', '1972-05-02', NULL),
(2, 'HODGE', 'Aldis', '1986-09-20', NULL),
(3, 'BROSNAN', 'Pierce', '1963-05-16', NULL),
(4, 'SHAHI', 'Sarah', '1980-01-10', NULL),
(5, 'CENTINEO', 'Noah', '1996-05-09', NULL),
(6, 'WOOD', 'Elijah', '1981-01-28', NULL),
(7, 'MCKELLEN', 'Ian', '1939-05-25', NULL),
(8, 'ASTIN', 'Sean', '1971-02-25', NULL),
(9, 'MORTENSEN', 'Viggo ', '1958-10-20', NULL),
(10, 'TOBEY', 'Maguire', '1975-06-27', NULL),
(11, 'Willem', 'Dafoe', '1955-07-22', NULL),
(12, 'KIRSTEN', 'Dunst', '1982-04-30', NULL),
(13, 'JAMES', 'Franco', '1978-04-19', NULL),
(14, 'KIMBLE', 'Simmons', '1955-01-09', NULL),
(15, 'CLIFF', 'Robertson', '1923-09-09', '2011-09-10'),
(16, 'ROSEMARY', 'Harris', '1926-09-19', NULL),
(17, 'THEODORE', 'Raimi', '1965-12-14', NULL),
(18, 'MOLINA', 'Alfred', '1953-05-24', NULL),
(19, 'WATTS', 'Naomi', '1968-09-28', NULL),
(20, 'BRODY', 'Adrien', '1973-04-14', NULL),
(21, 'IVANA', 'Baquero', '1994-06-11', NULL),
(22, 'DOUG', 'Jones', '1960-05-24', NULL),
(23, 'ARIADNA', 'Gil', '1969-01-23', NULL),
(24, 'JOHNSON', 'Dwayne', '1972-05-02', NULL),
(25, 'BLACK', 'Jack', '1969-08-28', NULL),
(26, 'HART', 'Kevin', '1979-07-06', NULL),
(27, 'KAREN', 'Gilan', '1987-11-28', NULL),
(28, 'MASSAGUE', 'Ivan', '1976-09-04', NULL),
(29, 'MASANGKAY', 'Alexendra', '1992-04-15', NULL),
(30, 'ZORION', 'Egileor', '1946-11-15', NULL),
(31, 'KRASINSKI', 'John', '1979-10-20', NULL),
(32, 'BLUNT', 'Emily', '1983-02-23', NULL),
(33, 'SIMMONDS', 'Millicent', '2003-03-06', NULL),
(34, 'JUPE', 'Noah', '2005-02-25', NULL),
(35, 'STATHAM', 'Jason', '1967-07-26', NULL),
(36, 'EASTWOOD', 'Scott', '1986-03-21', NULL),
(37, 'ALGAR', 'Niamh', '1992-06-28', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `fkVideo` int(11) NOT NULL,
  `fkGenre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `appartient`
--

INSERT INTO `appartient` (`fkVideo`, `fkGenre`) VALUES
(1, 4),
(2, 3),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(6, 3),
(7, 2),
(8, 2),
(9, 5),
(10, 5),
(11, 5),
(12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `idGenre` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`idGenre`, `libelle`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, 'Fantastique'),
(4, 'Super-héros'),
(5, 'Horreur');

-- --------------------------------------------------------

--
-- Structure de la table `joue`
--

CREATE TABLE `joue` (
  `fkVideo` int(11) NOT NULL,
  `fkActeur` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `joue`
--

INSERT INTO `joue` (`fkVideo`, `fkActeur`, `role`) VALUES
(1, 1, 'Black Adam'),
(1, 2, 'Hawkman'),
(1, 3, 'Doctor Fate'),
(1, 4, 'Adrianna Tomaz'),
(2, 6, 'Frodon Sacquet'),
(2, 7, 'Gandalf le Gris'),
(2, 8, 'Samsagace Gamegie'),
(2, 9, 'Aragorn'),
(3, 10, 'Spider-Man'),
(3, 11, 'Norman Osborn'),
(3, 12, 'Mary Jane'),
(3, 13, 'Harry Osborn'),
(3, 14, 'Jonah Jame'),
(3, 15, 'Benjamin Parker'),
(3, 16, 'May Reilly Parker'),
(3, 17, 'Hoffman'),
(4, 10, 'Spider-Man'),
(4, 11, 'Norman Osborn'),
(4, 12, 'Mary Jane'),
(4, 13, 'Harry Osborn'),
(4, 14, 'Jonah Jame'),
(4, 16, 'May Reilly Parker'),
(4, 17, 'Hoffman'),
(4, 18, 'Docteur Octopus'),
(5, 6, 'King Kong'),
(5, 19, 'Dwan'),
(5, 20, 'Jack Driscoll'),
(6, 21, 'Ofelia'),
(6, 22, 'Pale Man'),
(6, 23, 'Carmen'),
(7, 24, 'Smolder'),
(7, 25, 'Sheldon'),
(7, 26, 'Franklin'),
(7, 27, 'Ruby'),
(8, 24, 'Smolder'),
(8, 25, 'Sheldon'),
(8, 26, 'Franklin'),
(8, 27, 'Ruby'),
(9, 28, 'Goreng'),
(9, 29, 'Miharu'),
(9, 30, 'Trimagasi'),
(10, 31, 'Lee'),
(10, 32, 'Evelyn'),
(10, 33, 'Regan'),
(10, 34, 'Marcus'),
(11, 31, 'Lee'),
(11, 32, 'Evelyn'),
(11, 33, 'Regan'),
(11, 34, 'Marcus'),
(12, 35, 'Mason'),
(12, 36, 'Jan'),
(12, 37, 'Dana');

-- --------------------------------------------------------

--
-- Structure de la table `obtientacteur`
--

CREATE TABLE `obtientacteur` (
  `fkActeur` int(11) NOT NULL,
  `fkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `obtientacteur`
--

INSERT INTO `obtientacteur` (`fkActeur`, `fkRecompense`) VALUES
(1, 1),
(6, 2),
(6, 3),
(10, 13),
(20, 13),
(26, 18);

-- --------------------------------------------------------

--
-- Structure de la table `obtientrealisateur`
--

CREATE TABLE `obtientrealisateur` (
  `fkRealisateur` int(11) NOT NULL,
  `fkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `obtientrealisateur`
--

INSERT INTO `obtientrealisateur` (`fkRealisateur`, `fkRecompense`) VALUES
(2, 5),
(3, 12),
(4, 16),
(7, 21);

-- --------------------------------------------------------

--
-- Structure de la table `obtientvideo`
--

CREATE TABLE `obtientvideo` (
  `fkVideo` int(11) NOT NULL,
  `fkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `obtientvideo`
--

INSERT INTO `obtientvideo` (`fkVideo`, `fkRecompense`) VALUES
(2, 2),
(3, 11),
(4, 14),
(5, 5),
(5, 8),
(6, 15),
(7, 17),
(9, 19),
(10, 20);

-- --------------------------------------------------------

--
-- Structure de la table `producteur`
--

CREATE TABLE `producteur` (
  `idProducteur` int(11) NOT NULL,
  `raisonSocial` varchar(255) DEFAULT NULL,
  `dateCreation` year(4) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `producteur`
--

INSERT INTO `producteur` (`idProducteur`, `raisonSocial`, `dateCreation`, `adresse`, `mail`) VALUES
(1, 'DC Studios', '2016', '4000 Warner Boulevard Burbank, CA 91522 ', 'copyright@wb.com'),
(2, 'New Line Cinema ', '1967', '4000 Warner Boulevard Burbank, CA 91522', 'copyright@wb.com'),
(3, 'WingNut Films', '1987', 'Stone StreetWellington 6022New Zealand', 'dion@filmtec.co.nz'),
(4, 'Marvel', '1990', '135 W. 50th Street, 7th Floor New York', 'marvel@gmail.com'),
(5, 'Estudios Picasso', '1964', '28670 Villaviciosa de Odón, Madrid, Espagne', 'picasso@film.com'),
(6, 'Sony Pictures Entertainment', '1987', 'Culver City (Californie)États-Unis', 'sony@sony.com'),
(7, 'Paramount Pictures', '1916', 'Hollywood, Californie États-Unis', 'paramout@para.com');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `fkVideo` int(11) NOT NULL,
  `fkProducteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`fkVideo`, `fkProducteur`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(4, 4),
(5, 2),
(6, 5),
(7, 6),
(8, 6),
(9, 1),
(10, 7),
(11, 7),
(12, 2);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `idRealisateur` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`idRealisateur`, `nom`, `prenom`, `dateNaissance`) VALUES
(1, 'COLLET-SERRA', 'Jaume', '1974-03-23'),
(2, 'JACKSON', 'Peter', '1961-10-31'),
(3, 'SAMMUEL MARSHALL', 'Raimi', '1959-10-23'),
(4, 'DEL TORO', 'Guillermo', '1964-10-09'),
(5, 'KASDAN', 'Jake', '1974-10-28'),
(6, 'GAZTELU-URRUTIA', 'Galder', '1974-01-30'),
(7, 'KRASINSKI', 'John', '1979-10-20'),
(8, 'RITCHIE', 'Guy', '1968-09-10');

-- --------------------------------------------------------

--
-- Structure de la table `realise`
--

CREATE TABLE `realise` (
  `fkVideo` int(11) NOT NULL,
  `fkRealisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `realise`
--

INSERT INTO `realise` (`fkVideo`, `fkRealisateur`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 2),
(6, 4),
(7, 5),
(8, 5),
(9, 6),
(10, 7),
(11, 7),
(12, 8);

-- --------------------------------------------------------

--
-- Structure de la table `recompense`
--

CREATE TABLE `recompense` (
  `idRecompense` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `categorie` varchar(255) DEFAULT NULL,
  `annee` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `recompense`
--

INSERT INTO `recompense` (`idRecompense`, `nom`, `categorie`, `annee`) VALUES
(1, 'Meilleur acteur', 'Kids Choice Awards', '2023'),
(2, 'Meilleur film', 'Empire Awards', '2002'),
(3, 'Meilleur acteur', 'Empire Awards', '2002'),
(5, 'Meilleur réalisateur', 'Saturn Awards 2005', '2004'),
(8, 'Meilleure actrice', 'MTV Movie Award', '2004'),
(11, 'Meilleur film', 'Peoples choice award', '2005'),
(12, 'Meilleure réalisateur', 'Saturn Award', '2003'),
(13, 'Meilleur acteur', 'Teen Choice Award', '2004'),
(14, 'Meilleur film', 'Teen Choice Award', '2001'),
(15, 'Meilleur film', 'Satellite Awards', '2006'),
(16, 'Meilleure réalisateur', 'Prix Goya', '2007'),
(17, 'Meilleur film', 'Golden Trailer Awards', '2020'),
(18, 'Meilleur acteur', 'Kids Choice Awards', '2020'),
(19, 'Meilleur film', 'Festival international du film de Catalogne', '2019'),
(20, 'Meilleur film', 'Saturn Awards', '2019'),
(21, 'Meilleure réalisateur', 'IGN', '2018');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `idType` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`idType`, `nom`) VALUES
(1, 'Film'),
(2, 'Serie');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `mail` varchar(255) NOT NULL,
  `identifiant` varchar(255) NOT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `genre` enum('Homme','Femme','Autres') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`mail`, `identifiant`, `mdp`, `dateNaissance`, `genre`) VALUES
('a@a.a', 'aa', '961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506', '2000-01-01', 'Homme'),
('b@b.b', 'bb', '3b64db95cb55c763391c707108489ae18b4112d783300de38e033b4c98c3deaf', '2002-02-02', 'Homme'),
('c@c.c', 'cc', '355b1bbfc96725cdce8f4a2708fda310a80e6d13315aec4e5eed2a75fe8032ce', '2003-03-03', 'Homme'),
('z@z.z', 'zz', '4a60bf7d4bc1e485744cf7e8d0860524752fca1ce42331be7c439fd23043f151', '2005-01-01', 'Homme');

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `idVideo` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `fkType` int(11) DEFAULT NULL,
  `dateSortie` date DEFAULT NULL,
  `duree` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`idVideo`, `titre`, `fkType`, `dateSortie`, `duree`, `image`) VALUES
(1, 'Black Adam', 1, '2022-10-19', '1h 25m', 'blackadam.jpg'),
(2, 'Le Seigneur des anneaux', 1, '2001-12-19', '1h 78m', 'seigneur.jpg'),
(3, 'Spider-man', 1, '2002-01-01', '2h 01m', 'spiderman.jpg'),
(4, 'Spider-Man 2', 1, '2004-07-24', '2h 07m', 'spiderman2.jpg'),
(5, 'King Kong', 1, '2005-01-01', '1h 87m', 'kingkong.jpg'),
(6, 'Le Labyrinthe de Pan', 1, '2006-11-01', '1h 59m', 'labyrinthePan.jpg'),
(7, 'Jumanji : Bienvenue dans la jungle', 1, '2017-12-20', '1h 59m', 'jumanji1.jpg'),
(8, 'Jumanji: Next Level', 1, '2019-12-04', '2h 3m', 'jumanji2.jpg'),
(9, 'La Plateform', 1, '2019-11-08', '1h 34m', 'laPlateform.jpg'),
(10, 'Sans un bruit', 1, '2018-06-20', '1h 30m', 'sansBruit.jpg'),
(11, 'Sans un bruit 2', 1, '2021-05-28', '1h 37m', 'sansBruit2.jpg'),
(12, 'Un homme en colère', 1, '2021-05-07', '1h 58m', 'unHommeEnColere.jpg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`idActeur`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`fkVideo`,`fkGenre`),
  ADD KEY `fkGenre` (`fkGenre`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`idGenre`);

--
-- Index pour la table `joue`
--
ALTER TABLE `joue`
  ADD PRIMARY KEY (`fkVideo`,`fkActeur`,`role`),
  ADD KEY `joue_ibfk_2` (`fkActeur`);

--
-- Index pour la table `obtientacteur`
--
ALTER TABLE `obtientacteur`
  ADD PRIMARY KEY (`fkActeur`,`fkRecompense`),
  ADD KEY `fkRecompense` (`fkRecompense`);

--
-- Index pour la table `obtientrealisateur`
--
ALTER TABLE `obtientrealisateur`
  ADD PRIMARY KEY (`fkRealisateur`,`fkRecompense`),
  ADD KEY `fkRecompense` (`fkRecompense`);

--
-- Index pour la table `obtientvideo`
--
ALTER TABLE `obtientvideo`
  ADD PRIMARY KEY (`fkVideo`,`fkRecompense`),
  ADD KEY `fkRecompense` (`fkRecompense`);

--
-- Index pour la table `producteur`
--
ALTER TABLE `producteur`
  ADD PRIMARY KEY (`idProducteur`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`fkVideo`,`fkProducteur`),
  ADD KEY `fkProducteur` (`fkProducteur`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`idRealisateur`);

--
-- Index pour la table `realise`
--
ALTER TABLE `realise`
  ADD PRIMARY KEY (`fkVideo`,`fkRealisateur`),
  ADD KEY `fkRealisateur` (`fkRealisateur`);

--
-- Index pour la table `recompense`
--
ALTER TABLE `recompense`
  ADD PRIMARY KEY (`idRecompense`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`idType`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`mail`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`idVideo`),
  ADD KEY `FkType` (`fkType`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`fkVideo`) REFERENCES `video` (`idVideo`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`fkGenre`) REFERENCES `genre` (`idGenre`);

--
-- Contraintes pour la table `joue`
--
ALTER TABLE `joue`
  ADD CONSTRAINT `joue_ibfk_1` FOREIGN KEY (`fkVideo`) REFERENCES `video` (`idVideo`),
  ADD CONSTRAINT `joue_ibfk_2` FOREIGN KEY (`fkActeur`) REFERENCES `acteur` (`idActeur`);

--
-- Contraintes pour la table `obtientacteur`
--
ALTER TABLE `obtientacteur`
  ADD CONSTRAINT `obtientacteur_ibfk_1` FOREIGN KEY (`fkActeur`) REFERENCES `acteur` (`idActeur`),
  ADD CONSTRAINT `obtientacteur_ibfk_2` FOREIGN KEY (`fkRecompense`) REFERENCES `recompense` (`idRecompense`);

--
-- Contraintes pour la table `obtientrealisateur`
--
ALTER TABLE `obtientrealisateur`
  ADD CONSTRAINT `obtientrealisateur_ibfk_1` FOREIGN KEY (`fkRealisateur`) REFERENCES `realisateur` (`idRealisateur`),
  ADD CONSTRAINT `obtientrealisateur_ibfk_2` FOREIGN KEY (`fkRecompense`) REFERENCES `recompense` (`idRecompense`);

--
-- Contraintes pour la table `obtientvideo`
--
ALTER TABLE `obtientvideo`
  ADD CONSTRAINT `obtientvideo_ibfk_1` FOREIGN KEY (`fkVideo`) REFERENCES `video` (`idVideo`),
  ADD CONSTRAINT `obtientvideo_ibfk_2` FOREIGN KEY (`fkRecompense`) REFERENCES `recompense` (`idRecompense`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`fkVideo`) REFERENCES `video` (`idVideo`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`fkProducteur`) REFERENCES `producteur` (`idProducteur`);

--
-- Contraintes pour la table `realise`
--
ALTER TABLE `realise`
  ADD CONSTRAINT `realise_ibfk_1` FOREIGN KEY (`fkVideo`) REFERENCES `video` (`idVideo`),
  ADD CONSTRAINT `realise_ibfk_2` FOREIGN KEY (`fkRealisateur`) REFERENCES `realisateur` (`idRealisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
