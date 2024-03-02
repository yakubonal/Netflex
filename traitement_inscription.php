<?php
// Connexion à la base de données
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    // En cas d'erreur de connexion à la base de données, affiche un message d'erreur et arrête le script
    die('Erreur : ' . $e->getMessage());
}

// Vérification si genre correct
if (isset($_POST['genre']) && $_POST['genre'] != "") {
    $genre = $_POST["genre"];
} else {
    echo "invGenre";
    // Affiche un message d'erreur si le genre n'est pas correct
    die();
}


// Vérification si identifiant correct
if (isset($_POST['identifiant']) && $_POST['identifiant'] != "") {
    $identifiant = $_POST["identifiant"];
} else {
    echo "invIdentifiant";
    // Affiche un message d'erreur si l'identifiant n'est pas correct
    die();
}


// Vérification si le mot de passe est correct
if (isset($_POST['mdp']) && $_POST['mdp'] != "") {
    // Vérification si la confirmation du mot de passe est également correcte
    if (isset($_POST['mdp2']) && $_POST['mdp2'] != "") {
        if ($_POST['mdp'] === $_POST['mdp2']) {
            // Hashage du mot de passe avec l'algorithme SHA-256
            $mdp = hash('sha256', $_POST['mdp']);
        } else {
            echo "invMdp";
            // Affiche un message d'erreur si la confirmation du mot de passe ne correspond pas
            die();
        }
    } else {
        echo "invMdp";
        // Affiche un message d'erreur si la confirmation du mot de passe n'est pas fournie
        die();
    }
} else {
    echo "invMdp";
    // Affiche un message d'erreur si le mot de passe n'est pas correct
    die();
}


// Vérification si la date de naissance est correcte
if (isset($_POST['dateNaissance']) && $_POST['dateNaissance'] != "") {
    $dateNaissance = $_POST["dateNaissance"];
} else {
    echo "invDateNaissance";
    // Affiche un message d'erreur si la date de naissance n'est pas correcte
    die();
}

// Vérification si l'adresse e-mail est correcte
if (isset($_POST['mail']) && $_POST['mail'] != "") {
    $tmp_mail = filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL);
    if ($tmp_mail == false) {
        echo "invMail";
        // Affiche un message d'erreur si l'adresse e-mail n'est pas correcte        
        die();
    } else {
        $mail = $tmp_mail;
    }
} else {
    echo "invMail";
    // Affiche un message d'erreur si l'adresse e-mail n'est pas correcte
    die();
}


// Vérification si la condition est correcte
if (isset($_POST['Jaccepte']) && $_POST['Jaccepte'] == "1") {
    $condition = $_POST["Jaccepte"];
} else {
    echo "invJaccepte";
    // Affiche un message d'erreur si la condition n'est pas correcte
    die();
}

// Vérification si l'adresse e-mail existe déjà dans la base de données
$sqlVerifMail = "SELECT COUNT(*) AS nbLigne FROM utilisateur WHERE mail=:mail";
$req1 = $bd->prepare($sqlVerifMail);
$req1->bindParam("mail", $mail, PDO::PARAM_STR);
$req1->execute();
$data = $req1->fetchAll();

// Si l'adresse e-mail existe déjà, affiche un message d'erreur
if ($data[0]["nbLigne"] == 1) {
    echo "exiMail";
    // Affiche un message d'erreur si l'adresse e-mail existe déjà
    die();
}

// Requête d'insertion des données dans la table utilisateur
$sql = "INSERT INTO utilisateur
    VALUES (:mail,:identifiant,:mdp,:dateNaissance,:genre)";

$req = $bd->prepare($sql);
$req->bindParam("identifiant", $identifiant, PDO::PARAM_STR);
$req->bindParam("mdp", $mdp, PDO::PARAM_STR);
$req->bindParam("dateNaissance", $dateNaissance, PDO::PARAM_STR);
$req->bindParam("mail", $mail, PDO::PARAM_STR);
$req->bindParam("genre", $genre, PDO::PARAM_STR);

// Exécution de la requête d'insertion
$req->execute();

// Démarrage de la session, stockage de l'adresse e-mail et affichage d'un message de succès
session_start();
$_SESSION["mail"] = $mail;
echo "ok";
die();


