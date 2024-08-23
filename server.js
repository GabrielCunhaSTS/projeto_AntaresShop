const express = require('express')
const app = express()
const { conecSequelize, banco } = require("./config/bdConnection");
const routes = require('./src/routes/index')
const path = require('path')
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');


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

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json())
app.use(cookieParser())
app.use('/', routes)
app.use(express.static('./src/views/'));
app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'src','views'))

