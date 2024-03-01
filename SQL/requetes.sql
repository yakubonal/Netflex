-- Filtrage
SELECT * FROM video
JOIN realise ON realise.fkVideo = video.idVideo
JOIN realisateur ON realise.fkRealisateur = realisateur.idRealisateur;

SELECT * FROM video
JOIN realise ON realise.fkVideo = video.idVideo
JOIN realisateur ON realise.fkRealisateur = realisateur.idRealisateur
JOIN appartient ON video.idVideo = appartient.fkVideo
JOIN genre ON genre.idGenre = appartient.fkGenre

-- Tri et groupement des genres
SELECT
    video.idVideo,
    video.titre,
    video.dateSortie,
    video.duree,
    video.`image`,
    realisateur.nom,
    realisateur.prenom,
    `type`.nom AS `type`,
    GROUP_CONCAT(genre.libelle) AS genres
FROM
    video
JOIN realise ON realise.fkVideo = video.idVideo
JOIN realisateur ON realise.fkRealisateur = realisateur.idRealisateur
JOIN appartient ON video.idVideo = appartient.fkVideo
JOIN genre ON genre.idGenre = appartient.fkGenre
JOIN `type` ON `type`.idType = video.fkType
WHERE
    genre.idGenre IN(1, 4) AND `type`.nom LIKE "Film"
GROUP BY
    video.idVideo