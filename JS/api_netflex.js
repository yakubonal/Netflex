// Fonction qui affiche ou masque les détails d'un élément
function afficheDetail(e) {
  // ID du bouton sur lequel on clique
  let id = e.currentTarget.id;
  let elem = document.getElementById(id);
  if (elem.nextElementSibling.style.display !== "block") {
    elem.nextElementSibling.style.display = "block";
  } else {
    elem.nextElementSibling.style.display = "none";
  }
}

/* Burger */
let burger = document.getElementById("burger");
let ouvreB = document.getElementById("ouvreB");
let fermeB = document.getElementById("fermeB");

ouvreB.onclick = ouvrirBurger;
fermeB.onclick = fermerBurger;

/* Ouvrir le burger */
function ouvrirBurger() {
  burger.classList.add("active");
}

/* Fermer le burger */
function fermerBurger() {
  burger.classList.remove("active");
}

// Sélection films / séries
let boutonSeries = document.getElementById("boutonSeries");
let boutonFilms = document.getElementById("boutonFilms");

// Change la couleur du texte quand on clique dessus
boutonFilms.onclick = function () {
  boutonFilms.style.color = "white";
  boutonSeries.style.color = "#757575";
  boutonFilms.classList.add("active");
  boutonSeries.classList.remove("active");

  afficherFilms();
};
// Change la couleur du texte quand on clique dessus
boutonSeries.onclick = function () {
  boutonFilms.style.color = "#757575";
  boutonSeries.style.color = "white";
  boutonSeries.classList.add("active");
  boutonFilms.classList.remove("active");

  afficherFilms();
};

// Gestion du menu déroulant des genres
var checkList = document.getElementById('selecteurGenres');
checkList.getElementsByClassName('anchor')[0].onclick = function (evt) {
  if (checkList.classList.contains('visible'))
    checkList.classList.remove('visible');
  else
    checkList.classList.add('visible');
}

// Fonction qui affiche la liste des genres en faisant une requête ajax
function afficherGenres() {
  var listeGenres = document.getElementById('listeGenres');

  const req = new XMLHttpRequest();
  req.open("GET", "traitement_genre.php");

  req.onreadystatechange = () => {
    // In local files, status is 0 upon success in Mozilla Firefox
    if (req.readyState === XMLHttpRequest.DONE) {
      const status = req.status;
      if (status === 0 || (status >= 200 && status < 400)) {
        // On interprète le JSON reçu
        const response = JSON.parse(req.responseText);

        // On ajoute chaque genre au formulaire
        response.forEach(genre => {
          // On créé un élément "input"
          var inputGenre = document.createElement("input");
          inputGenre.classList.add("selecteurGenre");
          inputGenre.type = "checkbox";
          inputGenre.value = genre.id;

          // On créé un élément "li"
          var li = document.createElement("li");

          // On définit la fonction à exécuter lors du clic sur le texte / checkbox
          li.onclick = () => {
            inputGenre.checked = !inputGenre.checked;
            afficherFilms();
          };

          // On ajoute les éléments au HTML
          li.appendChild(inputGenre);
          listeGenres.appendChild(li);

          // On ajoute le texte ("Action", "Aventure", etc.)
          li.appendChild(document.createTextNode(genre.genre));
        });

        // Premier affichage des films
        afficherFilms();
      }
    }
  };

  req.send();
}

// Fonction qui met à jour les films et séries en faisant une requête ajax
function afficherFilms() {
  // On vérifie si des cases de sélection de genre ont été cochées
  var listeGenres = [];
  var selecteursGenre = document.getElementsByClassName("selecteurGenre");
  for (let selecteur of selecteursGenre) {
    if (selecteur.checked) {
      listeGenres.push(parseInt(selecteur.value));
    }
  }
  // Si aucune case n'a été cochée, on ne trie pas par genre (donc on ajoute tous les genres au tableau)
  if (listeGenres.length === 0) {
    for (let selecteur of selecteursGenre) {
      listeGenres.push(parseInt(selecteur.value));
    }
  }

  // On vérifie si "Films" ou "Séries" a été sélectionné
  let boutonSeries = document.getElementById("boutonSeries");
  let boutonFilms = document.getElementById("boutonFilms");

  var filtreType = "tous";
  if (boutonSeries.classList.contains("active")) {
    filtreType = "series";
  }
  else if (boutonFilms.classList.contains("active")) {
    filtreType = "films";
  }

  const req = new XMLHttpRequest();
  req.open("GET", "traitement_netflex.php?type=" + filtreType + "&genres=" + JSON.stringify(listeGenres));

  req.onreadystatechange = () => {
    if (req.readyState === XMLHttpRequest.DONE) {
      const status = req.status;
      if (status === 0 || (status >= 200 && status < 400)) {
        // On interprète le JSON reçu
        const response = JSON.parse(req.responseText);

        // On supprime les films/séries de la page
        document.getElementById("videos").innerHTML = "";

        // On ajoute chaque films/séries à la page
        response.forEach(film => {
          document.getElementById("videos").innerHTML += `
            <div class='lesimages cadre plus'>
              <img class='image' id='image${film.idVideo}' src='./images/${film.image}'>
              <div class='plus'>
                <a class='titre'><br>Titre : ${film.titre}<br>Date : ${film.dateSortie}<br>Durée : ${film.duree}<br>Réalisateur : ${film.nom} ${film.prenom}</a>
                <div class='bouton'>
                  <img class='bouton clicBouton' id='bouton${film.idVideo}' src='./images/bouton.jpg'>
                  <div class='detail'>
                    Résumé : ${film.resume}
                  </div>
                </div>
              </div>
            </div>
          `
        });

        // Ajout de listeners sur les boutons "Plus de détails"
        let boutonsDetails = document.getElementsByClassName("clicBouton");
        for (let bouton of boutonsDetails) {
          bouton.addEventListener("click", afficheDetail);
          bouton.myParam = bouton.id;
        }
      }
    }
  };

  req.send();
}

// Affichage initial des genres
afficherGenres();
