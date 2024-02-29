<?php
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

// Interprétation du JSON des genres à filtrer
$genres = json_decode($_GET['genres']);

// On ajoute des "?" dans la requête SQL pour les genres
$symboles = '?';
for ($i = 0; $i < (count($genres) - 1); $i++) {
    $symboles = $symboles . ',?';
}

$sql = "SELECT
    video.idVideo,
    video.titre,
    video.dateSortie,
    video.duree,
    video.`image`,
    realisateur.nom,
    realisateur.prenom,
    `type`.nom AS `type`,
    GROUP_CONCAT(genre.libelle) AS genres
FROM
    video
JOIN realise ON realise.fkVideo = video.idVideo
JOIN realisateur ON realise.fkRealisateur = realisateur.idRealisateur
JOIN produit ON produit.fkVideo = video.idVideo
JOIN producteur ON produit.fkProducteur = producteur.idProducteur
JOIN joue ON joue.fkVideo = video.idVideo
JOIN acteur ON joue.fkActeur = acteur.idActeur
JOIN appartient ON video.idVideo = appartient.fkVideo
JOIN genre ON genre.idGenre = appartient.fkGenre
JOIN `type` ON `type`.idType = video.fkType
WHERE
    genre.idGenre IN($symboles) AND `type`.nom LIKE ?
GROUP BY
    video.idVideo";

$requete = $bd->prepare($sql);

// On ajoute chaque id de genre à la requête SQL
for ($i = 0; $i < count($genres); $i++) {
    $requete->bindParam($i + 1, $genres[$i], PDO::PARAM_INT);
}

// On détermine le type de vidéos à filtrer
$type = "";
if ($_GET["type"] == "films") {
    $type = "Film";
}
else if ($_GET["type"] == "series") {
    $type = "Serie";
}
else {
    $type = "%";
}

$requete->bindParam(count($genres) + 1, $type, PDO::PARAM_STR);
$requete->execute();

$donnees = $requete->fetchAll(PDO::FETCH_CLASS);

header('Content-Type: application/json');
echo json_encode($donnees);
