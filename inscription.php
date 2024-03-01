<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>Inscription</title>
	<link rel="stylesheet" href="CSS/inscription.css">
</head>
<header>
	<img id='logo' src="images/logo.png">
</header>

<body>
	<div class="cadre">
		<div class="cadrebody">
			<h1>Crée un nouveau compte</h1>
			<form id="formulaire" action="traitement_inscription.php" method="post">
				<div class="genre">
					<input type="radio" name="genre" id="genre" value="Homme" checked>
					<label for="genre">Homme</label>

					<input type="radio" name="genre" id="genre1" value="Femme">
					<label for="genre">Femme</label>

					<input type="radio" name="genre" id="genre2" value="Autre">
					<label for="genre">Autre</label>
				</div>
				<p class='erreur' id='erreurGenre'></p>

				<div class="gauche">
					<label for="identifiant" class="required">Identifiant <span class="obligatoire">*</span> : </label>
					<input placeholder="Identifiant" type="text" name="identifiant" id="identifiant" required>
				</div>

				<p class='erreur' id='erreurIdentifiant'></p>

				<div class="gauche">
					<label for="mdp" class="required">Mot de passe <span class="obligatoire">*</span> : </label>
					<input placeholder="Mot de passe" type="password" name="mdp" id="mdp" required>
				</div>


				<div class="gauche">
					<label for="mdp2" class="required">Validation de mot de passe <span class="obligatoire">*</span> :
					</label>
					<input placeholder="Mot de passe" type="password" name="mdp2" id="mdp2" required>
				</div>

				<p class='erreur' id='erreurMdp'></p>

				<div class="gauche">
					<label for="dateNaissance" class="required">Date <span class="obligatoire">*</span> :</label>
					<input type="date" id="dateNaissance" name="dateNaissance" min="1950-01-01" max="2023-09-01"
						required>
				</div>

				<p class='erreur' id='erreurDate'></p>

				<div class="gauche">
					<label for="mail" class="required">Mail <span class="obligatoire">*</span> : </label>
					<input placeholder="Mail" type="email" name="mail" id="mail" required>
				</div>

				<p class='erreur' id='erreurMail'></p>

				<div class="accepte">
					<input type="checkbox" name="Jaccepte" id="Jaccepte" value="1" required>
					<label for="Jaccepte" class="required"> J'accepte les conditions d'utilisation de ce site <span
							class="obligatoire">*</span> </label>
				</div>

				<p class='erreur' id='erreurJaccepte'></p>

				<div class="val">
					<input type="submit" value="Valider" id="Valider">
					<input type="reset" value="Vider le formulaire" id="Effacer">
				</div>

			</form>

			<a id="footerCadre" href="connexion.php">J'ai déjà un compte</a>
		</div>
	</div>
	<script src="JS/api_inscription.js"></script>
</body>

</html>