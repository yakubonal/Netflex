<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>Accueil</title>
	<link rel="stylesheet" href="accueil.css">
</head>

<header>
	<img id='logo' src="images/logo.png">
	<form class="lesboutons" method="post" action="">
		<input id="bouton" type="submit" name="connexion" value="S'identifier">
		<input id="bouton" type="submit" name="inscription" value="Crée un compte">
	</form>
</header>

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

	<div >
		<h2>Foire aux questions</h2>
	</div>
    <button id="menuButton">Afficher le menu</button>
    <div id="dropdownMenu" class="dropdown-content">
        <a href="#">Option 1</a>
        <a href="#">Option 2</a>
        <a href="#">Option 3</a>
    </div>
    <!-- <script src="script.js"></script> -->
<!-- regarder chatgpt pour js -->


</body>

<footer>


</footer>

</html>