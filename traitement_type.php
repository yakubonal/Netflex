<?php
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

$sql = "SELECT idType as id, nom as `type` FROM `type`";
$requete = $bd->prepare($sql);
$requete->execute();

$donnees = $requete->fetchAll(PDO::FETCH_CLASS);

header('Content-Type: application/json');
echo json_encode($donnees);
