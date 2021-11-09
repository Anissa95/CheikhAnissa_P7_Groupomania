module.exports = (sequelize, Sequelize) => {
    const Post = sequelize.define(
        "post", {
            userId: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            titre: {
                type: Sequelize.STRING(200),
                allowNull: false,
                defaultValue: "",
            },
            username: {
                type: Sequelize.STRING(50),
                allowNull: false,
                defaultValue: "",
            },
            description: {
                type: Sequelize.STRING(2000),
                allowNull: false,
                defaultValue: "",
            },
            imageUrl: {
                type: Sequelize.STRING(2000),
                allowNull: false,
                defaultValue: "",
            },

        }
    );

    return Post;
};