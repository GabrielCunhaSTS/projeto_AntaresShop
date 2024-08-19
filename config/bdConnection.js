const { Sequelize } = require("sequelize");

const usuario = 'root'
const password = 'root'
const banco = 'antares_shop'

const conecSequelize = new Sequelize(
    `mysql://${usuario}:${password}@localhost:3306/${banco}`
)

module.exports = {
    banco,
    conecSequelize
}