//Importer sequelize
const Sequelize = require("sequelize");
require("dotenv").config();

// Etablir la cnx avec la BD mysql
const sequelize = new Sequelize(process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD, {
        host: process.env.DB_HOST,
        dialect: process.env.DB_DIALECT,
    });
// pour tester la cnx
sequelize
    .authenticate()
    .then(() => console.log("Connection has been established successfully."))
    .catch((err) => console.error("Unable to connect to the database:", error));

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;
//Importer le model User.js / Comments.js / Post.js
db.user = require("./User.js")(sequelize, Sequelize);
db.comment = require("./Comment.js")(sequelize, Sequelize);
db.post = require("./Post.js")(sequelize, Sequelize);

//------------------Création des clé étrangère----------------------
db.user.hasMany(db.post);
db.post.belongsTo(db.user);

db.post.hasMany(db.comment);
db.comment.belongsTo(db.post);

db.user.hasMany(db.comment);
db.comment.belongsTo(db.user);

module.exports = db;