
const express = require('express');
var fs = require("fs");
var https = require("https");
const app = express();
/*
const op = {
  key: fs.readFileSync('/etc/ssl/private/apache-selfsigned.key'),
  cert: fs.readFileSync('/etc/ssl/certs/apache-selfsigned.crt')
};
*/

// Configurar cabeceras y cors



const bodyParser = require('body-parser');
const { options } = require('./routes/controller');
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-COntrol-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
}) 
//app.set('port', process.env.PORT ||3000);


app.use(express.json());


app.use(require('./routes/controller'));

https.createServer({
  key: fs.readFileSync('/etc/letsencrypt/live/asis.sistemaslogisticosgt.com/privkey.pem'),
  cert: fs.readFileSync('/etc/letsencrypt/live/asis.sistemaslogisticosgt.com/cert.pem')
},app).listen(443,function(){
  console.log(`Server on port ${app.get('port')}`);
})

/*

app.listen(app.get('port'), () => {
  console.log(`Server on port ${app.get('port')}`);
})*/
