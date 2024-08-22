const { DataTypes } = require("sequelize");
const { conecSequelize } = require("../../config/bdConnection");
const { padronizacao } = require("../../config/padronizacao");

const nacionalidade = conecSequelize.define('nacionalidade',{
    id_nacionalidade:{
        type:DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
    },
    nm_nacionalidade: {
        type:DataTypes.TEXT(100),
        allowNull:false
    }
},padronizacao('nacionalidade'))

module.exports = nacionalidade
