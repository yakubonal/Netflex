function afficheDetail(e) {
  // ID du bouton sur lequel on clique
  let id = e.currentTarget.myParam;
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
};
// Change la couleur du texte quand on clique dessus
boutonSeries.onclick = function () {
  boutonFilms.style.color = "#757575";
  boutonSeries.style.color = "white";
};

// Fonction qui affiche la liste des genres en faisant une requête ajax
function afficherGenres(event) {
  const req = new XMLHttpRequest();
  req.open("GET", "traitement_genres.php");

  req.onreadystatechange = () => {
    // In local files, status is 0 upon success in Mozilla Firefox
    if (req.readyState === XMLHttpRequest.DONE) {
      const status = req.status;
      if (status === 0 || (status >= 200 && status < 400)) {
        // On interprète le JSON reçu
        const response = JSON.parse(req.responseText);

        // On ajoute chaque genre au formulaire
        response.forEach(genre => {
          
        });
      }
    }
  };

  req.send();
}

// Fonction qui met à jour les films et séries en faisant une requête ajax
function afficherFilms(event) {
  const req = new XMLHttpRequest();
  req.open("GET", "traitement_netflex.php");

  req.onreadystatechange = () => {
    // In local files, status is 0 upon success in Mozilla Firefox
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
            <div class='lesimages'>
              <img class='image' id='image${film.idVideo}' src='./images/${film.image}'>
              <a class='titre'><br>${film.titre}<br>${film.dateSortie}<br>${film.duree}</a>
              <img class='bouton' id='bouton${film.idVideo}' src='./images/bouton.jpg'>
              <div class='detail'>
                Réalisateur : ${film.nom}<br>${film.prenom}
              </div>
            </div>
          `
        });

        // Ajout de listeners sur les boutons "Plus de détails"
        let image = document.getElementsByClassName("bouton");
        for (let i = 0; i < image.length; i++) {
          image[i].addEventListener("click", afficheDetail);
          image[i].myParam = image[i].id;
        }
      } else {
        // Oh no! There has been an error with the request!
      }
    }
  };

  // var data = new FormData();
  // data.append('type', document.getElementById("type").value); // Série / Film
  // data.append('genre', document.getElementById("genre").value);
  // console.log(data);
  // req.send(data);
  req.send();
}

afficherGenres();
afficherFilms();
