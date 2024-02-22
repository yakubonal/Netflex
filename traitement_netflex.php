<?php
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

$sql = "SELECT * FROM video
JOIN realise ON fkVideo = idVideo
JOIN realisateur ON fkRealisateur = idRealisateur";
$requete = $bd->prepare($sql);
$requete->execute();

$donnees = $requete->fetchAll(PDO::FETCH_CLASS);

header('Content-Type: application/json');
echo json_encode($donnees);
