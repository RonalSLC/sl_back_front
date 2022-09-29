

const sql = require('mysql');
// configuracion de conexion a la base de datos
const config = {
  "host": "localhost",  
  "user": "root",
  "password": "Qn710123",
  "database": "asistencia_sl",
};
//pool para que sea mas efectiva la conectividad. 

const pool = new sql.createPool(config);
//const poolConnect = pool.connect();

pool.on('error', err => {
  console.log("error al conectarse a sql server ", err);
})
/*
async function messageHandler() {
  await poolConnect;
  try {
    const request = pool.request();
    const result = request.query('select 1 as number')
    console.dir(result)
    return result;
  } catch (err) {
    console.error('Error al conectarse a la db', err);
  }
}
*/


module.exports = pool;