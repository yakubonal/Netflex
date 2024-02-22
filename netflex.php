<?php
session_start();

// Si l'e-mail n'est pas présent dans la session, on redirige vers la page de connexion
if (!isset($_SESSION['mail'])) {
	header('Location: connexion.php');
	die();
}

try {
	$bd = new PDO('mysql:host=localhost;dbname=netflex;charset=utf8', 'root', '');
} catch (Exception $e) {
	die('Erreur : ' . $e->getMessage());
}
?>

<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>Netflex</title>
	<link rel="stylesheet" href="netflex.css">
</head>

<header>
	<!-- Burger -->
	<div id="burger" class="burger">
		<a id="fermeB" href="#" class="ferme">x</a>
		<ul>
			<li>
				<?php
				// Récupère le mail de la personne connectée
				$mail = $_SESSION["mail"];
				echo "<div class='mail'>";
				echo $mail;
				echo "</div>";
				?>
			</li>
			<li><a href="#"> Films </a></li>
			<li><a href="#"> Séries </a></li>
			<li>
				<form method="post" action="">
					<input class="boutonDeconnexion" type="submit" name="deconnexion" value="Se déconnecter">
				</form>
			</li>
		</ul>
	</div>

	<a href="#" id="ouvreB">
		<span class="logoBurger">
			<span></span>
			<span></span>
			<span></span>
		</span>
	</a>

	<img id='logo' src="images/logo.png">

	<ul>
		<li><a href="accueil.php"> Accueil </a></li>
		<li><a id="boutonFilms" href="#"> Films </a></li>
		<li><a id="boutonSeries" href="#"> Séries </a></li>
		<li><a id="boutonGenres" href="#"> Genres </a></li>
	</ul>
</header>

<body>
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
	<script src="script.js"></script>
</body>

</html>