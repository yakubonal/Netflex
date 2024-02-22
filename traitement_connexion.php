<?php
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}


// Vérifiacation si mail correcte
if (isset($_POST['mail']) && $_POST['mail'] != "") {
    $tmp_mail = filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL);
    if ($tmp_mail == false) {
        header("Location: connexion.php?erreur=invMail");
        die();
    } else {
        $mail = $tmp_mail;
    }
} else {
    header("Location: inscription.php?erreur=invMail");
    die();
}

// Vérifiacation si mdp correcte
if (isset($_POST['mdp']) && $_POST['mdp'] != "") {
    $mdp = hash('sha256', $_POST['mdp']);
} else {
    header("Location: connexion.php?erreur=invMdp");
    die();
}


$sqlVerifConnexion = " SELECT COUNT(*) AS nbLigne FROM utilisateur WHERE mail=:mail AND mdp=:mdp";
$req2 = $bd->prepare($sqlVerifConnexion);
$req2->bindParam("mail", $mail, PDO::PARAM_STR);
$req2->bindParam("mdp", $mdp, PDO::PARAM_STR);
$req2->execute();
$data1 = $req2->fetchAll();

if ($data1[0]["nbLigne"] == 1) {
    session_start();
    $_SESSION["mail"] = $mail;
    header('Location: netflex.php');
    die();
} else {
    header('Location: connexion.php?erreur=connexion');
    die();
}
