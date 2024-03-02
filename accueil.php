<!doctype html>
<html lang="fr">

<head>
	<!-- Déclaration de l'encodage du document -->
	<meta charset="utf-8">
	<!-- Titre de la page affiché dans l'onglet du navigateur -->
	<title>Accueil</title>
	<!-- Liaison vers le fichier de style CSS -->
	<link rel="stylesheet" href="CSS/accueil.css">
</head>

<!-- Entête de la page -->
<header>
	<!-- Logo de Netflex -->
	<img id='logo' src="images/logo.png">
	<!-- Formulaire de connexion/inscription -->
	<form class="lesboutons" method="post" action="">
		<input id="bouton" type="submit" name="connexion" value="S'identifier">
		<input id="bouton" type="submit" name="inscription" value="Crée un compte">
	</form>
</header>

<!-- Corps de la page -->

<body>
	<?php
	if (isset($_POST['connexion'])) {
		// Redirige vers la page de connexion
		header("Location: connexion.php");
		exit();
	}
	if (isset($_POST['inscription'])) {
		// Redirige vers la page d'inscription
		header("Location: inscription.php");
		exit();
	}
	?>

	<!-- Titre principal de la page -->
	<h1>Plongez dans l'univers captivant de Netflex, où chaque instant compte.</h1>

	<!-- Sections d'information -->
	<div class="lesParties">
		<!-- Première partie d'information -->
		<div class="partie1">
			<img id='imgPartie' src="images/partie1.png">
			<a>Bienvenue sur Netflex : Explorez notre vaste bibliothèque de films, séries et documentaires
				soigneusement sélectionnés pour votre plaisir de visionnage.
			</a>
		</div>

		<!-- Deuxième partie d'information -->
		<div class="partie2">
			<img id='imgPartie' src="images/partie2.png">
			<a>Accès Multiplateforme : Regardez où vous voulez, quand vous voulez. Netflex est disponible
				sur tous vos appareils, du grand écran à votre smartphone.
			</a>
		</div>
	</div>

	<!-- Foire aux questions -->
	<h3>Foire aux questions</h3>

	<div class="questions">
		<!-- Création de plusieurs boutons (questions) -->
		<button class="question" onclick="toggleAnswer(1)">Comment puis-je m'abonner au service de streaming ?</button>
		<!-- Réponse à la première question -->
		<div class="reponse" id="reponse1">Pour vous abonner, cliquez sur le bouton "Crée un compte" en haut de la page
			d'accueil.Suivez ensuite les étapes pour créer un compte</div>

		<!-- Boutons (questions) avec fonctions JavaScript -->
		<button class="question" onclick="toggleAnswer(2)">Quels types de contenu proposez-vous ?</button>
		<!-- Réponse à la première question -->
		<div class="reponse" id="reponse2">Nous proposons une variété de contenus, y compris des films, des séries et
			bien plus encore. Explorez nos catégories pour trouver le contenu qui vous intéresse.</div>

		<!-- Boutons (questions) avec fonctions JavaScript -->
		<button class="question" onclick="toggleAnswer(3)">Quels appareils sont compatibles avec votre service de
			streaming ?</button>
		<!-- Réponse à la première question -->
		<div class="reponse" id="reponse3">Notre service est compatible avec les téléphones, tablettes, ordinateurs,
			télévisions intelligentes, et d'autres appareils connectés à Internet. Assurez-vous d'avoir la dernière
			version de notre application pour une expérience optimale.</div>

		<!-- Boutons (questions) avec fonctions JavaScript -->
		<button class="question" onclick="toggleAnswer(4)">Puis-je partager mon compte avec d'autres personnes?</button>
		<!-- Réponse à la première question -->
		<div class="reponse" id="reponse4">La politique de partage de compte autorise un certain nombre d'appareils
			connectés à un seul compte. Cependant, le partage avec des personnes hors du foyer peut entraîner la
			suspension du compte.</div>
	</div>
	<script src="JS/accueil.js"></script>
</body>

</html>