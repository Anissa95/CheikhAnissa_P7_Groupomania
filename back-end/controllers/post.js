const db = require("../models");
const fs = require("fs");
const jwt = require("jsonwebtoken");
require('dotenv').config();

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
    // recuperer le token dans le header authorization
    const token = req.headers.authorization.split(" ")[1];
    // on decode le token avec fonction verify de jwt, le token payload et sa clé secrète en argument
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY);
    const userId = decodedToken.userId;
    db.user
        .findOne({
            attributes: ["username"],
            where: { id: userId },
        })
        .then((user) => {
            console.log(user);
            const newPost = {
                userId: userId,
                title: req.body.title,
                username: user.dataValues.username,
                description: req.body.description,
                imageUrl: `${req.protocol}://${req.get("host")}/images/${
          req.file.filename
        }`,
            };
            db.post
                .create(newPost)
                .then(() => {
                    res.status(201).json({ message: `Post Créé avec Succès ` });
                })
                .catch((error) => res.status(500).json({ error: `Impossible de Créer le post !!` }));
        });
};
//  modifier un post
exports.updatePost = (req, res, next) => {
    const token = req.headers.authorization.split(" ")[1];
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY);
    const userId = decodedToken.userId;
    db.user
        .findOne({
            attributes: ["isAdmin"],
            where: { id: userId },
        })
        .then((user) => {
            db.post
                .findOne({
                    attributes: ["userId", "username", "imageUrl"],
                    where: { id: req.params.id },
                })
                .then((post) => {
                    console.log({ post, user });
                    //verifier s'il s'agit du meme utilisateur ou un admin
                    if (
                        userId == post.dataValues.userId ||
                        user.dataValues.isAdmin == "1"
                    ) {
                        let postObject = {
                            title: req.body.title,
                            description: req.body.description,
                        };
                        const filename = post.dataValues.imageUrl.split("/images/")[1];
                        if (req.file) {
                            //supprimer l'ancienne image si une nouvelle image est postée
                            postObject["imageUrl"] = `${req.protocol}://${req.get(
                  "host"
                )}/images/${req.file.filename}`;
                            fs.unlink(`images/${filename}`, (err) => {
                                if (err) {
                                    console.log(`images/${filename} not found !`);
                                } else {
                                    console.log(`deleted old images/${filename}`);
                                }
                            });
                        }
                        // mettre à jour le post
                        db.post
                            .update(postObject, { where: { id: req.params.id } })
                            .then(() => {
                                console.log("post modifié par " + user.dataValues.username);
                                res.status(200).json({ message: "post modifié!" });
                            })
                            .catch((error) => res.status(500).json({ error }));
                    } else {
                        throw new Error("unauthorized");
                    }
                })
                .catch((error) => res.status(401).json({ error: "Invalid user ID" }));
        });
};

// supprimer post
exports.deletePost = (req, res, next) => {
    const token = req.headers.authorization.split(" ")[1];
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY);
    const userId = decodedToken.userId;
    db.user
        .findOne({
            attributes: ["isAdmin", "username"],
            where: { id: userId },
        })
        .then((user) => {
            db.post
                .findOne({
                    attributes: ["userId", "imageUrl"],
                    where: { id: req.params.id },
                })
                .then((post) => {
                    //vérifier si il s'agit d'un utilisateur ou d'un admin
                    if (
                        userId == post.dataValues.userId ||
                        user.dataValues.isAdmin == "1"
                    ) {
                        const filename = post.dataValues.imageUrl.split("/images/")[1];
                        //supprimer l'image liée au post
                        fs.unlink(`images/${filename}`, () => {
                            console.log(`deleted images/${filename}`);
                            //supprimer le post séleectionné
                            db.post
                                .destroy({
                                    where: { id: req.params.id },
                                })
                                .then(() => {
                                    //effacer les commentaires relié au post supprimé
                                    db.comment
                                        .destroy({
                                            where: { postId: req.params.id },
                                        })
                                        .then(() => {
                                            console.log(
                                                "Item deleted by userId " + user.dataValues.username
                                            );
                                            res.status(200).json({ message: "Item deleted!" });
                                        });
                                })
                                .catch((error) => res.status(400).json({ error }));
                        });
                    } else {
                        throw new Error("unauthorized");
                    }
                })
                .catch((error) => res.status(401).json({ error }));
        });

};