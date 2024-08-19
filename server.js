const express = require('express')
const app = express()
const { conecSequelize, banco } = require("./config/bdConnection");

conecSequelize.authenticate().then(() => {
    console.log(`----- conexão com o banco ${banco} estabelecida com sucesso! -----`);
}).catch(erroConn => {
    console.log(`----- erro ao conectar-se ao banco ${banco} -----`);
    console.log(erroConn);
});

const porta = 3000

app.listen(porta, ()=> {
    console.log(`servidor rodando na porta ${porta}`)
})  