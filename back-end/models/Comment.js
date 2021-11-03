module.exports = (sequelize, Sequelize) => {
    const Comment = sequelize.define(
        "Comment", {
            postId: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },

            comment: {
                type: Sequelize.STRING(2000),
                allowNull: false,
                defaultValue: "",
            },
            dateComment: {
                type: Sequelize.DATE,
                defaultValue: Sequelize.NOW
            }
        },
    );

    return Comment;
};