<?php
// Connexion à la base de données
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    // En cas d'erreur de connexion à la base de données, affiche un message d'erreur et arrête le script
    die('Erreur : ' . $e->getMessage());
}

// Interprétation du JSON des genres à filtrer
$genres = json_decode($_GET['genres']);

// On ajoute des "?" dans la requête SQL pour les genres
$symboles = '?';
for ($i = 0; $i < (count($genres) - 1); $i++) {
    $symboles = $symboles . ',?';
}

// Requête SQL pour récupérer les vidéos en fonction des genres et du type spécifiés
$sql = "SELECT
    video.idVideo,
    video.titre,
    video.dateSortie,
    video.duree,
    video.`image`,
    realisateur.nom,
    realisateur.prenom,
    `resume`,
    `type`.nom AS `type`,
    GROUP_CONCAT(genre.libelle) AS genres
FROM
    video
JOIN realise ON realise.fkVideo = video.idVideo
JOIN realisateur ON realise.fkRealisateur = realisateur.idRealisateur
JOIN appartient ON video.idVideo = appartient.fkVideo
JOIN genre ON genre.idGenre = appartient.fkGenre
JOIN `type` ON `type`.idType = video.fkType
WHERE
    genre.idGenre IN($symboles) AND `type`.nom LIKE ?
GROUP BY
    video.idVideo";

// Préparation de la requête SQL
$requete = $bd->prepare($sql);

// On ajoute chaque id de genre à la requête SQL
for ($i = 0; $i < count($genres); $i++) {
    $requete->bindParam($i + 1, $genres[$i], PDO::PARAM_INT);
}

// On détermine le type de vidéos à filtrer
$type = "";
if ($_GET["type"] == "films") {
    $type = "Film";
} else if ($_GET["type"] == "series") {
    $type = "Serie";
} else {
    $type = "%";
}

// On ajoute le type à la requête SQL
$requete->bindParam(count($genres) + 1, $type, PDO::PARAM_STR);

// Exécution de la requête SQL
$requete->execute();

// Récupération des données sous forme d'objets de la classe stdClass
$donnees = $requete->fetchAll(PDO::FETCH_CLASS);

// Définition de l'en-tête HTTP pour indiquer que la réponse est au format JSON
header('Content-Type: application/json');

// Conversion des données en format JSON et affichage
echo json_encode($donnees);
