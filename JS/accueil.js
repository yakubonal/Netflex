function toggleAnswer(questionNumber) {
    var reponse = document.getElementById('reponse' + questionNumber);

    // Masquer toutes les réponses sauf celle de la question cliquée
    var toutesLesReponses = document.querySelectorAll('.reponse');
    toutesLesReponses.forEach(function(element) {
        if (element !== reponse) {
            element.style.display = 'none';
        }
    });

    // Afficher ou masquer la réponse correspondant à la question cliquée
    reponse.style.display = (reponse.style.display === 'block') ? 'none' : 'block';

    // Ajouter/retirer la classe "active" pour mettre en évidence la question sélectionnée
    var toutesLesQuestions = document.querySelectorAll('.question');
    toutesLesQuestions.forEach(function(element) {
        element.classList.remove('active');
    });

    // Ajouter la classe "active" à la question sélectionnée, sauf si la réponse est masquée
    if (reponse.style.display !== 'none') {
        var questionCliquee = document.querySelector('.question:nth-child(' + questionNumber + ')');
        questionCliquee.classList.add('active');
    }
}