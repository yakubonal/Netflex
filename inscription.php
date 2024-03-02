<!-- Titre de la page -->
<title>Inscription</title>
<!-- Liaison vers la feuille de style CSS -->
<link rel="stylesheet" href="CSS/inscription.css">
</head>

<!-- Section En-tête -->
<header>
	<!-- Logo de l'application -->
	<img id='logo' src="images/logo.png">
</header>

<body>
	<!-- Conteneur principal du contenu -->
	<div class="cadre">
		<div class="cadrebody">
			<!-- Titre du formulaire d'inscription -->
			<h1>Créer un nouveau compte</h1>
			<!-- Formulaire d'inscription -->
			<form id="formulaire" action="traitement_inscription.php" method="post">

				<!-- Sélection du genre -->
				<div class="genre">
					<input type="radio" name="genre" id="genre" value="Homme" checked>
					<label for="genre">Homme</label>

					<input type="radio" name="genre" id="genre1" value="Femme">
					<label for="genre">Femme</label>

					<input type="radio" name="genre" id="genre2" value="Autre">
					<label for="genre">Autre</label>
				</div>
				<p class='erreur' id='erreurGenre'></p>

				<!-- Champ pour l'identifiant -->
				<div class="gauche">
					<label for="identifiant" class="required">Identifiant <span class="obligatoire">*</span> : </label>
					<input placeholder="Identifiant" type="text" name="identifiant" id="identifiant" required>
				</div>
				<p class='erreur' id='erreurIdentifiant'></p>

				<!-- Champ pour le mot de passe -->
				<div class="gauche">
					<label for="mdp" class="required">Mot de passe <span class="obligatoire">*</span> : </label>
					<input placeholder="Mot de passe" type="password" name="mdp" id="mdp" required>
				</div>

				<!-- Champ pour la validation du mot de passe -->
				<div class="gauche">
					<label for="mdp2" class="required">Validation de mot de passe <span class="obligatoire">*</span> :
					</label>
					<input placeholder="Mot de passe" type="password" name="mdp2" id="mdp2" required>
				</div>
				<p class='erreur' id='erreurMdp'></p>

				<!-- Champ pour la date de naissance -->
				<div class="gauche">
					<label for="dateNaissance" class="required">Date <span class="obligatoire">*</span> :</label>
					<input type="date" id="dateNaissance" name="dateNaissance" min="1950-01-01" max="2023-09-01"
						required>
				</div>
				<p class='erreur' id='erreurDate'></p>

				<!-- Champ pour l'adresse e-mail -->
				<div class="gauche">
					<label for="mail" class="required">Mail <span class="obligatoire">*</span> : </label>
					<input placeholder="Mail" type="email" name="mail" id="mail" required>
				</div>
				<p class='erreur' id='erreurMail'></p>

				<!-- Acceptation des conditions d'utilisation -->
				<div class="accepte">
					<input type="checkbox" name="Jaccepte" id="Jaccepte" value="1" required>
					<label for="Jaccepte" class="required"> J'accepte les conditions d'utilisation de ce site <span
							class="obligatoire">*</span> </label>
				</div>
				<p class='erreur' id='erreurJaccepte'></p>

				<!-- Boutons de validation et de réinitialisation -->
				<div class="val">
					<input type="submit" value="Valider" id="Valider">
					<input type="reset" value="Vider le formulaire" id="Effacer">
				</div>
			</form>

			<!-- Lien vers la page de connexion -->
			<a id="footerCadre" href="connexion.php">J'ai déjà un compte</a>
		</div>
	</div>
	<!-- Inclusion du script JavaScript pour la validation du formulaire -->
	<script src="JS/api_inscription.js"></script>
</body>

</html>