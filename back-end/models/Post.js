module.exports = (sequelize, Sequelize) => {
    const Post = sequelize.define(
        "Post", {
            userId: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            titre: {
                type: Sequelize.STRING(200),
                allowNull: false,
                defaultValue: "",
            },

            message: {
                type: Sequelize.STRING(2000),
                allowNull: false,
                defaultValue: "",
            },
            imageUrl: {
                type: Sequelize.STRING(2000),
                allowNull: false,
                defaultValue: "",
            },
            datePost: {
                type: Sequelize.DATE,
                defaultValue: Sequelize.NOW
            }
        }
    );

    return Post;
};