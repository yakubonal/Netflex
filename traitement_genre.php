<?php
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

$sql = "SELECT idGenre as id, libelle as genre FROM genre";
$requete = $bd->prepare($sql);
$requete->execute();

$donnees = $requete->fetchAll(PDO::FETCH_CLASS);

header('Content-Type: application/json');
echo json_encode($donnees);
