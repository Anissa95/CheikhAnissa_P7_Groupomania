module.exports = (sequelize, Sequelize) => {
    const Comments = sequelize.define(
        "Comments", {
            postId: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },

            comment: {
                type: Sequelize.STRING(250),
                allowNull: false,
                defaultValue: "",
            },
            dateComment: {
                type: Sequelize.DATE,
                defaultValue: Sequelize.NOW
            }
        },
    );

    return Comments;
};