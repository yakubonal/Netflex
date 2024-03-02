<?php
// Connexion à la base de données
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}


// Vérifiacation si mail correcte
if (isset($_POST['mail']) && $_POST['mail'] != "") {
    $tmp_mail = filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL);
    // Si l'adresse e-mail n'est pas valide, redirige vers la page de connexion avec une erreur
    if ($tmp_mail == false) {
        header("Location: connexion.php?erreur=invMail");
        die();
    } else {
        $mail = $tmp_mail;
    }
} else {
    // Si l'adresse e-mail n'est pas fournie, redirige vers la page d'inscription avec une erreur
    header("Location: inscription.php?erreur=invMail");
    die();
}

// Vérifiacation si mdp correcte
if (isset($_POST['mdp']) && $_POST['mdp'] != "") {
    $mdp = hash('sha256', $_POST['mdp']);
} else {
    // Si le mot de passe n'est pas fourni, redirige vers la page de connexion avec une erreur
    header("Location: connexion.php?erreur=invMdp");
    die();
}

// Vérification des informations de connexion dans la base de données
$sqlVerifConnexion = " SELECT COUNT(*) AS nbLigne FROM utilisateur WHERE mail=:mail AND mdp=:mdp";
$req2 = $bd->prepare($sqlVerifConnexion);
$req2->bindParam("mail", $mail, PDO::PARAM_STR);
$req2->bindParam("mdp", $mdp, PDO::PARAM_STR);
$req2->execute();
$data1 = $req2->fetchAll();

// Si une seule ligne correspond, démarrage de la session, stockage de l'adresse e-mail et redirection
if ($data1[0]["nbLigne"] == 1) {
    session_start();
    $_SESSION["mail"] = $mail;
    header('Location: netflex.php');
    die();
} else {
    // Si aucune ligne ne correspond, redirige vers la page de connexion avec une erreur
    header('Location: connexion.php?erreur=connexion');
    die();
}
