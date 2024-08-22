const { DataTypes } = require("sequelize");
const { conecSequelize } = require("../../config/bdConnection");
const { padronizacao } = require("../../config/padronizacao");

const cupom = conecSequelize.define('cupom',{
   id_cupom:{
        type:DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
   },
   ds_tipo: {
    type:DataTypes.ENUM('FRETE','DESCONTO'),
    allowNull:false
   },
   vl_cupom:{
    type:DataTypes.DECIMAL(10,2),
    allowNull:false
   } 
}, padronizacao('cupom'))

module.exports = cupom