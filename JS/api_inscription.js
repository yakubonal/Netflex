// On lance une fonction au lieu d'envoyer directement le formulaire d'inscription
document.getElementById("formulaire").addEventListener("submit", inscription);

function inscription(event) {
    // On empêche la redirection vers la page de traitement
    event.preventDefault();

    // Création d'une nouvelle requête XMLHttpRequest
    const req = new XMLHttpRequest();
    req.open("POST", "traitement_inscription.php");

    // Gestionnaire d'événements pour le changement d'état de la requête
    req.onreadystatechange = () => {
        // Traitement des réponses du serveur en fonction des cas
        if (req.readyState === XMLHttpRequest.DONE) {
            const status = req.status;
            console.log("requete ok");
            console.log(req);
            if (status === 0 || (status >= 200 && status < 400)) {
                if (req.responseText == "exiMail") {
                    document.getElementById("erreurMail").innerHTML = " * mail déja utilisé ";
                }
                else if (req.responseText == "invMail") {
                    document.getElementById("erreurMail").innerHTML = " * mail incorrect ";
                }
                else if (req.responseText == "invDateNaissance") {
                    document.getElementById("erreurDate").innerHTML = " * date incorrecte ";
                }
                else if (req.responseText == "invMdp") {
                    document.getElementById("erreurMdp").innerHTML = " * mdp incorrect ";
                }
                else if (req.responseText == "invIdentifiant") {
                    document.getElementById("erreurIdentifiant").innerHTML = " * identifiant incorrect ";
                }
                else if (req.responseText == "invGenre") {
                    document.getElementById("erreurGenre").innerHTML = " * genre incorrect ";
                }
                else if (req.responseText == "invJaccepte") {
                    document.getElementById("erreurJaccepte").innerHTML = " * Vous devez accepter les conditions ";
                }
                else if (req.responseText == "ok") {
                    // Redirection vers la page "netflex.php" en cas de succès
                    window.location.href = "netflex.php";
                }
            } else {
                // Oh non ! Il y a eu une erreur avec la requête !
            }
        }
    };

    // Création d'un objet FormData pour envoyer les données du formulaire
    var data = new FormData();
    data.append('genre', document.getElementById("genre").value);
    data.append('identifiant', document.getElementById("identifiant").value);
    data.append('mdp', document.getElementById("mdp").value);
    data.append('mdp2', document.getElementById("mdp2").value);
    data.append('dateNaissance', document.getElementById("dateNaissance").value);
    data.append('mail', document.getElementById("mail").value);
    // Si la case est cochée, on envoie 1, sinon 0
    data.append('Jaccepte', document.getElementById("Jaccepte").checked ? "1" : "0");
    console.log(data);

    // Envoi de la requête avec les données du formulaire
    req.send(data);
}
