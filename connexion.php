<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>Crée un compte</title>
	<link rel="stylesheet" href="CSS/connex.css">
</head>
<header>
	<img id='logo' src="images/logo.png">
</header>

<body>
	<div class="cadre">
		<div class="cadrebody">
			<h1>S'identifier</h1>
			<form action="traitement_connexion.php" method="post">

				<div class="x">
					<input placeholder="Mail" type="text" name="mail" id="mail" required>

					<?php
					if (isset($_GET["erreur"]) && ($_GET["erreur"] == "invMail")) {
						echo "<p class='erreur'> * mail incorrecte  </p> ";
					}
					?>

					<input placeholder="Mot de passe" type="password" name="mdp" id="mdp" required>
				</div>

				<?php
				if (isset($_GET["erreur"]) && ($_GET["erreur"] == "invMdp")) {
					echo "<p class='erreur'> * mot de passe incorrecte </p> ";
				}
				if (isset($_GET["erreur"]) && ($_GET["erreur"] == "connexion")) {
					echo "<p class='erreur'> * pas de compte </p> ";
				}
				?>

				<div class="val">
					<input type="submit" value="S'identifier" id="Valider">
					<input type="reset" value="Effacer" id="Effacer">
				</div>
			</form>
		</div>
		<p id="footerCadre"> Première visite sur Netflex ? <a id="footerCadre" href="inscription.php">
				Inscrivez-vous.</a></p>
	</div>
</body>

</html>