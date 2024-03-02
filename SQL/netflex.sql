-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 02 mars 2024 à 19:39
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
(37, 'ALGAR', 'Niamh', '1992-06-28', NULL),
(38, 'GUSTIN', 'Grant', '1990-01-14', NULL),
(39, 'AMELL', 'Stephen', '1981-05-08', NULL);

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
(12, 1),
(13, 1),
(13, 3),
(13, 4),
(14, 1),
(14, 3),
(14, 4),
(15, 1),
(15, 5),
(16, 1),
(16, 3),
(16, 5),
(17, 1),
(17, 3),
(18, 1),
(18, 2),
(19, 2),
(19, 3),
(20, 2),
(21, 2),
(21, 4);

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
(12, 37, 'Dana'),
(13, 38, 'Barry allen'),
(14, 39, 'Arrow');

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
(12, 2),
(13, 4),
(14, 4),
(15, 3),
(16, 1),
(17, 2),
(18, 2),
(19, 2),
(20, 3),
(21, 7);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `idRealisateur` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `dateMort` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`idRealisateur`, `nom`, `prenom`, `dateNaissance`, `dateMort`) VALUES
(1, 'COLLET-SERRA', 'Jaume', '1974-03-23', NULL),
(2, 'JACKSON', 'Peter', '1961-10-31', NULL),
(3, 'SAMMUEL MARSHALL', 'Raimi', '1959-10-23', NULL),
(4, 'DEL TORO', 'Guillermo', '1964-10-09', NULL),
(5, 'KASDAN', 'Jake', '1974-10-28', NULL),
(6, 'GAZTELU-URRUTIA', 'Galder', '1974-01-30', NULL),
(7, 'KRASINSKI', 'John', '1979-10-20', NULL),
(8, 'RITCHIE', 'Guy', '1968-09-10', NULL),
(9, 'MUSCHIETTI', 'Andrès', '1973-08-26', NULL),
(10, 'NUTTER', 'David', '1960-07-21', NULL),
(11, 'BODIN', 'Samuel', '1980-08-29', NULL),
(12, 'KLEVBERG', 'Lars', '1980-05-01', NULL),
(13, 'MYLOD', 'Mark', '1965-01-21', NULL),
(14, 'PHILIPS', 'Robert', '1975-03-01', NULL);

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
(12, 8),
(13, 9),
(14, 10),
(15, 11),
(16, 12),
(17, 13),
(18, 13),
(19, 13),
(20, 10),
(21, 14);

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
('a@a.a', 'a@a.a', '961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506', '2001-01-01', 'Homme'),
('b@b.b', 'b', '3b64db95cb55c763391c707108489ae18b4112d783300de38e033b4c98c3deaf', '2000-10-01', 'Homme'),
('c@c.c', 'c', '2e7d2c03a9507ae265ecf5b5356885a53393a2029d241394997265a1a25aefc6', '2000-01-01', 'Homme'),
('i@i.i', 'ii', '5d7f49449ab22deac22d767b89549c554134c8e47de4d38e748049875c83503b', '2001-01-01', 'Homme'),
('k@k.k', 'kk', 'ad370ed99b189921e7fe26057c40aab9f4fee8385e47606f50f348b9a5530af0', '2001-01-01', 'Homme'),
('p@p.p', 'pp', 'd53315bea08cec50d2591fcaf3b32dc5d289cdc6c16b7e8bed8c8e3f7ceaa34e', '2000-01-01', 'Homme'),
('t@t.t', 't', 'e3b98a4da31a127d4bde6e43033f66ba274cab0eb7eb1c70ec41402bf6273dd8', '2000-10-01', 'Homme'),
('y@y.y', 'yy', 'ef90d9c1ec76b1edc9edfaf2c0c05359c10ccc49ae8ecf7b7fd25ce9c02e86a4', '2000-01-01', 'Homme'),
('z@z.z', 'z', '4a60bf7d4bc1e485744cf7e8d0860524752fca1ce42331be7c439fd23043f151', '2000-01-01', 'Homme');

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
  `image` varchar(100) DEFAULT NULL,
  `resume` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`idVideo`, `titre`, `fkType`, `dateSortie`, `duree`, `image`, `resume`) VALUES
(1, 'Black Adam', 1, '2022-10-19', '1h 25m', 'blackadam.jpg', 'Teth Adam a reçu les pouvoirs tout-puissants des dieux. Après avoir utilisé ces pouvoirs pour se venger, il a été emprisonné, devenant Black Adam. Près de 5 000 ans se sont écoulés et Black Adam est passé de lhomme au mythe puis à la légende.'),
(2, 'Le Seigneur des anneaux', 1, '2001-12-19', '1h 78m', 'seigneur.jpg', 'Les armées de Sauron ont attaqué Minas Tirith, la capitale du Gondor. Jamais ce royaume autrefois puissant na eu autant besoin de son roi.'),
(3, 'Spider-man', 1, '2002-01-01', '2h 01m', 'spiderman.jpg', 'Peter Parker est élevé par sa tante May et son oncle Ben dans le quartier Queens de New York. Tout en poursuivant ses études à luniversité, il trouve un emploi de photographe au journal Daily Bugle.'),
(4, 'Spider-Man 2', 1, '2004-07-24', '2h 07m', 'spiderman2.jpg', 'Ecartelé entre son identité secrète de Spider-Man et sa vie détudiant, Peter Parker na pas réussi à garder celle quil aime, Mary Jane, qui est aujourdhui comédienne et fréquente quelquun dautre.'),
(5, 'King Kong', 1, '2005-01-01', '1h 87m', 'kingkong.jpg', 'Ann Darrow est une artiste de music-hall dont la carrière a été brisée net par la Dépression. Se retrouvant sans emploi ni ressources, la jeune femme rencontre laudacieux explorateur-réalisateur Carl Denham et se laisse entraîner dans la plus périlleuse des aventures.'),
(6, 'Le Labyrinthe de Pan', 1, '2006-11-01', '1h 59m', 'labyrinthePan.jpg', 'Fin de la guerre. Carmen, récemment remariée, sinstalle avec sa fille Ofélia chez son nouvel époux, le très autoritaire Vidal, capitaine de larmée franquiste.'),
(7, 'Jumanji : Bienvenue dans la jungle', 1, '2017-12-20', '1h 59m', 'jumanji1.jpg', 'Après avoir découvert une vieille console contenant un jeu vidéo dont ils navaient jamais entendu parler, quatre jeunes se retrouvent mystérieusement propulsés au coeur de la jungle de Jumanji, dans le corps de leurs avatars.'),
(8, 'Jumanji: Next Level', 1, '2019-12-04', '2h 3m', 'jumanji2.jpg', 'Lorsque Spencer retourne dans le monde fantastique de Jumanji, ses amis Martha, Fridge et Bethany y retournent aussi pour le sauver, mais le jeu est maintenant brisé.'),
(9, 'La Plateforme', 1, '2019-11-08', '1h 34m', 'laPlateform.jpg', 'Dans le futur, des prisonniers sont détenus dans des cellules verticales. Ceux qui logent dans les cellules supérieures sont nourris, tandis que ceux des cellules inférieures meurent de faim.'),
(10, 'Sans un bruit', 1, '2018-06-20', '1h 30m', 'sansBruit.jpg', 'Dans le nord de lÉtat de New York, un couple et ses deux enfants doivent rester silencieux dans leur ferme isolée pour éviter des créatures mystérieuses qui utilisent le son pour chasser leurs proies.'),
(11, 'Sans un bruit 2', 1, '2021-05-28', '1h 37m', 'sansBruit2.jpg', 'La famille Abbott doit maintenant faire face aux terreurs du monde extérieur alors quelle poursuit en silence son combat pour la survie.'),
(12, 'Un homme en colère', 1, '2021-05-07', '1h 58m', 'unHommeEnColere.jpg', 'Alex, un Américain traversant une période difficile, se trouve un travail auprès dune entreprise londonienne de camions blindés, gagnant la confiance dune équipe de braquage dont les membres entretiennent une amitié serrée.'),
(13, 'Flash', 2, '2023-05-24', '9 saisons', 'flash.jpg', 'À la suite dun accident de laboratoire au cours duquel il est frappé par la foudre, le chercheur Barry Allen, qui travaille pour le département de la police scientifique, découvre quil est capable de se déplacer à une vitesse supersonique.'),
(14, 'Arrow', 2, '2020-01-28', '8 saisons', 'arrow.jpg', 'Disparu en mer avec son père et sa petite amie après un violent naufrage, le milliardaire et playboy Oliver Queen est retrouvé vivant cinq ans plus tard, complètement transformé.'),
(15, 'Marianne', 2, '2019-09-13', '1 saisons', 'marianne.jpg', 'Emma, jeune romancière acerbe, découvre que les personnages monstrueux qui la hantaient et quelle a créés dans sa série de romans dépouvante sont réellement en train de prendre vie.'),
(16, 'Chucky', 2, '2021-08-12', '3 saisons', 'chucky.jpg', 'À Hackensack, une paisible banlieue américaine, Jake Wheeler, un ado solitaire de 14 ans, fait la découverte dune poupée Chucky lors dune vente de garage.'),
(17, 'Game of Thrones', 2, '2011-05-19', '8 saisons', 'game.jpg', 'Neuf familles nobles rivalisent pour le contrôle du Trône de Fer dans les sept royaumes de Westeros. Pendant ce temps, des anciennes créatures mythiques oubliées reviennent pour faire des ravages.'),
(18, 'Prison Break', 2, '2005-08-29', '5 saisons', 'prison.jpg', 'Son frère injustement accusé de meurtre, un ingénieur en génie civil décide de le faire évader de prison.'),
(19, 'Stranger Things', 2, '2016-07-15', '4 saisons', 'stranger.jpg', 'En 1983, à Hawkins dans lIndiana, Will Byers disparaît de son domicile. Ses amis se lancent alors dans une recherche semée dembûches pour le retrouver. Pendant leur quête de réponses, les garçons rencontrent une étrange jeune fille en fuite.'),
(20, 'Alerte Contagion', 2, '2016-09-28', '1 saisons', 'alerte.jpg', 'Une mystérieuse épidémie sabat sur Atlanta. Une vaste zone de quarantaine est alors décrétée, forçant ceux qui se trouvent à lintérieur à lutter pour leur survie pendant que les autorités sattèlent à trouver un remède.'),
(21, 'Comment élever un super-héros', 2, '2022-02-01', '2 saisons', 'elever.jpg', 'Une mère se bat pour cacher les super-pouvoirs de son jeune fils afin de le protéger de lexploitation de personnes malveillantes, tout en enquêtant sur leurs origines et la mort de son mari.');

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
