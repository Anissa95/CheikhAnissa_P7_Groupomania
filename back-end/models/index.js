//Importer sequelize
const Sequelize = require("sequelize");

// Etablir la cnx avec la BD mysql
const sequelize = new Sequelize("groupomanianissa", "root", "", {
    host: "localhost",
    dialect: "mysql",
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

module.exports = db;