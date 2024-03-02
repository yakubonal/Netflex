<?php
// Connexion à la base de données
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

// Requête SQL pour récupérer les genres depuis la base de données
$sql = "SELECT idGenre as id, libelle as genre FROM genre";
$requete = $bd->prepare($sql);
$requete->execute();

// Récupération des données sous forme d'objets de la classe stdClass
$donnees = $requete->fetchAll(PDO::FETCH_CLASS);

// Définition de l'en-tête HTTP pour indiquer que la réponse est au format JSON
header('Content-Type: application/json');
// Conversion des données en format JSON et affichage
echo json_encode($donnees);
