const db = require("../models");
const fs = require("fs");
const jwt = require("jsonwebtoken");

// Lire tous les posts avec leurs comments
exports.getAllPost = (req, res, next) => {
    db.post
        .findAll()
        .then((posts) => {
            db.comment.findAll().then((comments) => {
                // retourne un objet json result contenant des posts et des comments
                res.status(200).json({
                    result: {
                        posts: posts,
                        comments: comments,
                    },
                });
            });
        })
        .catch((error) => res.status(400).json({ error }));
};

//Lire un post un post
exports.getOnePost = (req, res, next) => {
    db.post
        .findOne({
            where: { id: req.params.id },
        })
        .then((post) => {
            res.status(200).json({
                post,
            });
        })
        .catch((error) => res.status(400).json({ error }));
};

//Créer un post
exports.createPost = (req, res, next) => {

};

//  modifier un post
exports.updatePost = (req, res, next) => {

};

// supprimer post
exports.deletePost = (req, res, next) => {

};