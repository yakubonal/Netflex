// On lance une fonction au lieu d'envoyer directement le formulaire d'inscription
document.getElementById("formulaire").addEventListener("submit", inscription);

function inscription(event) {
    // On empêche la redirection vers la page de traitement
    event.preventDefault();

    const req = new XMLHttpRequest();
    req.open("POST", "traitement_inscription.php");

    req.onreadystatechange = () => {
        // In local files, status is 0 upon success in Mozilla Firefox
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
                    window.location.href = "netflex.php";
                }
            } else {
                // Oh no! There has been an error with the request!
            }
        }
    };

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
    req.send(data);
}
