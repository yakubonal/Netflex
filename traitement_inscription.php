<?php
try {
    $bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

// Vérification si genre correct
if (isset($_POST['genre']) && $_POST['genre'] != "") {
    $genre = $_POST["genre"];
} else {
    echo "invGenre";
    // header("Location:inscription.php?erreur=invGenre");
    die();
}


// Vérification si identifiant correct
if (isset($_POST['identifiant']) && $_POST['identifiant'] != "") {
    $identifiant = $_POST["identifiant"];
} else {
    echo "invIdentifiant";
    // header("Location:inscription.php?erreur=invIdentifiant");
    die();
}


// Vérification si mdp correct
if (isset($_POST['mdp']) && $_POST['mdp'] != "") {
    if (isset($_POST['mdp2']) && $_POST['mdp2'] != "") {
        if ($_POST['mdp'] === $_POST['mdp2']) {
            $mdp = hash('sha256', $_POST['mdp']);
        } else {
            echo "invMdp";
            // header("Location:inscription.php?erreur=invMdp");
            die();
        }
    } else {
        echo "invMdp";
        // header("Location:inscription.php?erreur=invMdp");
        die();
    }
} else {
    echo "invMdp";
    // header("Location:inscription.php?erreur=invMdp");
    die();
}


// Vérification si date correcte
if (isset($_POST['dateNaissance']) && $_POST['dateNaissance'] != "") {
    $dateNaissance = $_POST["dateNaissance"];
} else {
    echo "invDateNaissance";
    // header("Location:inscription.php?erreur=invDateNaissance");
    die();
}

// Vérification si mail correct
if (isset($_POST['mail']) && $_POST['mail'] != "") {
    $tmp_mail = filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL);
    if ($tmp_mail == false) {
        echo "invMail";
        // header("Location:inscription.php?erreur=invMail");
        die();
    } else {
        $mail = $tmp_mail;
    }
} else {
    echo "invMail";
    // header("Location:inscription.php?erreur=invMail");
    die();
}


// Vérification si condition correcte
if (isset($_POST['Jaccepte']) && $_POST['Jaccepte'] == "1") {
    $condition = $_POST["Jaccepte"];
} else {
    echo "invJaccepte";
    // header("Location:inscription.php?erreur=invJaccepte");
    die();
}

$sqlVerifMail = "SELECT COUNT(*) AS nbLigne FROM utilisateur WHERE mail=:mail";
$req1 = $bd->prepare($sqlVerifMail);
$req1->bindParam("mail", $mail, PDO::PARAM_STR);
$req1->execute();
$data = $req1->fetchAll();

// Vérification si mail existe deja
if ($data[0]["nbLigne"] == 1) {
    echo "exiMail";
    // header('Location: inscription.php?erreur=exiMail');
    die();
}

$sql = "INSERT INTO utilisateur
    VALUES (:mail,:identifiant,:mdp,:dateNaissance,:genre)";

$req = $bd->prepare($sql);
$req->bindParam("identifiant", $identifiant, PDO::PARAM_STR);
$req->bindParam("mdp", $mdp, PDO::PARAM_STR);
$req->bindParam("dateNaissance", $dateNaissance, PDO::PARAM_STR);
$req->bindParam("mail", $mail, PDO::PARAM_STR);
$req->bindParam("genre", $genre, PDO::PARAM_STR);

$req->execute();
session_start();
$_SESSION["mail"] = $mail;
echo "ok";
die();


