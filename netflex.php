<?php
// Démarrage de la session PHP
session_start();

// Si l'e-mail n'est pas présent dans la session, on redirige vers la page de connexion
if (!isset($_SESSION['mail'])) {
	header('Location: connexion.php');
	die();
}

// Connexion à la base de données
try {
	$bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
	die('Erreur : ' . $e->getMessage());
}
?>

<!doctype html>
<html lang="fr">

<head>
	<!-- Déclaration du jeu de caractères -->
	<meta charset="utf-8">
	<!-- Titre de la page -->
	<title>Netflex</title>
	<!-- Liaison vers la feuille de style CSS -->
	<link rel="stylesheet" href="CSS/netflex.css">
</head>

<!-- En-tête de la page -->
<header>
	<!-- Burger (menu mobile) -->
	<div id="burger" class="burger">
		<!-- Bouton pour fermer le menu -->
		<a id="fermeB" href="#" class="ferme">x</a>
		<!-- Contenu du menu -->
		<ul>
			<!-- Affichage du mail de la personne connectée -->
			<li>
				<?php
				// Récupère le mail de la personne connectée
				$mail = $_SESSION["mail"];
				echo "<div class='mail'>";
				echo $mail;
				echo "</div>";
				?>
			</li>
			<!-- Liens vers les sections Films et Séries -->
			<li><a href="#"> Films </a></li>
			<li><a href="#"> Séries </a></li>

			<!-- Formulaire de déconnexion -->
			<li>
				<form method="post" action="">
					<input class="boutonDeconnexion" type="submit" name="deconnexion" value="Se déconnecter">
				</form>
			</li>
		</ul>
	</div>

	<!-- Bouton d'ouverture du menu Burger -->
	<a href="#" id="ouvreB">
		<span class="logoBurger">
			<span></span>
			<span></span>
			<span></span>
		</span>
	</a>

	<!-- Logo de l'application -->
	<img id='logo' src="images/logo.png">

	<!-- Barre de navigation principale -->
	<ul>
		<!-- Liens vers les sections Accueil, Films, Séries, et Genres -->
		<li><a href="accueil.php"> Accueil </a></li>
		<li><a id="boutonFilms" href="#"> Films </a></li>
		<li><a id="boutonSeries" href="#"> Séries </a></li>
		<li><a id="boutonGenres" href="#">
				<!-- Dropdown pour les genres -->
				<div id="selecteurGenres" class="dropdown-check-list" tabindex="100">
					<span class="anchor">Genres</span>
					<ul id="listeGenres" class="items">
					</ul>
				</div>
			</a>
		</li>
	</ul>
</header>

<!-- Corps de la page -->

<body>
	<!-- Section principale pour les vidéos -->
	<main id="videos">
		<?php
		// Verifier pour le bouton deconnexion et renvoie sur la page d'accueil
		if (isset($_POST['deconnexion'])) {
			// Détruit toutes les variables de session
			$_SESSION = array();

			// Détruit la session
			session_destroy();

			// Redirige vers la page de connexion ou une autre page
			header("Location: accueil.php");
			exit();
		}
		?>
	</main>

	<!-- Inclusion du script JavaScript pour la gestion de l'API Netflex -->
	<script src="JS/api_netflex.js"></script>
</body>

</html>