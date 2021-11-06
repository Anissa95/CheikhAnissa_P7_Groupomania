const fs = require("fs");
const db = require("../models");
const jwt = require("jsonwebtoken");

// Ajout d'un commentaire
exports.addComment = (req, res, next) => {
    // Déclaration du token
    const token = req.headers.authorization.split(" ")[1];
    const decodedToken = jwt.verify(token, "RANDOM_TOKEN_SECRET");
    const userId = decodedToken.userId;
    // Récupèrer le user de la BDD 
    db.user
        .findOne({
            attributes: ["username"],
            where: { id: userId },
        })
        .then((user) => {
            const newComment = {
                author: user.dataValues.username,
                authorId: userId,
                postId: req.params.id,
                comment: req.body.comment,
            };
            // création d'un comment
            db.comment.create(newComment).then(() => {
                res.status(201).json({ message: "Commentaire ajouté!" });
            });
        })
        .catch((error) => res.status(500).json({ error }));
};

// Modifier un commentaire
exports.updateComment = (req, res, next) => {

};

// Suppression d'un commentaire
exports.deleteComment = (req, res, next) => {

};