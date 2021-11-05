module.exports = (sequelize, Sequelize) => {
    const Comment = sequelize.define(
        "comment", {
            author: {
                type: Sequelize.STRING(50),
                allowNull: false,
                defaultValue: "",
            },
            authorId: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            postId: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },

            comment: {
                type: Sequelize.STRING(2000),
                allowNull: false,
                defaultValue: "",
            },

        },
    );

    return Comment;
};