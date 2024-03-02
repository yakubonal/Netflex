<!doctype html>
<html lang="fr">

<head>
	<!-- Déclaration du jeu de caractères -->
	<meta charset="utf-8">
	<!-- Titre de la page -->
	<title>Créer un compte</title>
	<!-- Liaison vers la feuille de style CSS -->
	<link rel="stylesheet" href="CSS/connexion.css">
</head>

<!-- Section En-tête -->
<header>
	<img id='logo' src="images/logo.png">
</header>

<body>
	<!-- Conteneur principal du contenu -->
	<div class="cadre">
		<div class="cadrebody">
			<!-- Titre du formulaire -->
			<h1>S'identifier</h1>
			<!-- Formulaire de connexion utilisateur -->
			<form action="traitement_connexion.php" method="post">

				<div class="x">
					<!-- Champ pour l'adresse e-mail -->
					<input placeholder="Mail" type="text" name="mail" id="mail" required>

					
					<?php
					// Vérifie s'il y a une erreur liée à une adresse e-mail incorrecte
					if (isset($_GET["erreur"]) && ($_GET["erreur"] == "invMail")) {
						echo "<p class='erreur'> * mail incorrecte  </p> ";
					}
					?>

					<!-- Champ pour le mot de passe -->
					<input placeholder="Mot de passe" type="password" name="mdp" id="mdp" required>
				</div>

				<?php
				// Vérifie s'il y a une erreur liée à un mot de passe incorrect
				if (isset($_GET["erreur"]) && ($_GET["erreur"] == "invMdp")) {
					echo "<p class='erreur'> * mot de passe incorrecte </p> ";
				}
				// Vérifie s'il y a une erreur liée à une connexion infructueuse
				if (isset($_GET["erreur"]) && ($_GET["erreur"] == "connexion")) {
					echo "<p class='erreur'> * pas de compte </p> ";
				}
				?>

				<!-- Boutons de validation -->
				<div class="val">
					<input type="submit" value="S'identifier" id="Valider">
					<input type="reset" value="Effacer" id="Effacer">
				</div>
			</form>
		</div>

		<!-- Pied de page avec un lien vers la page d'inscription -->
		<p id="footerCadre"> Première visite sur Netflex ? <a id="footerCadre" href="inscription.php">
				Inscrivez-vous.</a></p>
	</div>
</body>

</html>