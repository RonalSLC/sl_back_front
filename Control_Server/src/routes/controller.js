const express = require('express');

const router = express.Router();
//llamamos a la conexion de mysql
//var requ = require('../database.js').request;
const pool = require('../database.js');
var nodemailer = require("nodemailer");
var smtpConfig = {
  host: 'smtp.office365.com',
  port: 587, //en el caso de utilizar SSL se debe cambiar el puerto y colocar el predeterminado para https 467
  secure: false, // use SSL, es necesario utilizar el certificado para que outlook reciba los correos.
  auth: {
    user: 'notificaciones@slc.com.gt',
    pass: 'Clase1919*'
  }
};
var smtpTransport = nodemailer.createTransport(smtpConfig);
//GET CONFIGURACIO

router.get('/motivos', (req, res) => {
 
   const query=`select * from motivos where activo=1;`

  //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
    //console.log(recuperado)
    
});
});



// GET all history
router.post('/getMotivos', (req, res) => {
  const { CodigoUsuario } = req.body;
  const { idMotivo } = req.body;
  var query=``
  if(idMotivo==null || idMotivo=="Undefined" || idMotivo==""){
  query+=`select distinct m.id_motivo, m.descripcion from motivos m join
registros r where
 m.cantidad>(select count(*) from registros where id_motivo=m.id_motivo 
 and id_tipo_registro=1
 and fecha between date_format(now(),'%Y-%m-%d 00:00:00') and date_format(now(),'%Y-%m-%d 23:59:59')
 and codigo_usuario='${CodigoUsuario}') and m.activo=1
 order by m.id_motivo asc;
 `
  }else{
    query+=`select * from motivos where id_motivo ='${idMotivo}';`
  }
 // console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
    //console.log(recuperado)
    
});
});


// POSTS DE MOVIMIENTOS
router.post('/movimientos', (req, res) => {
  const { codigoUsuario } = req.body;
  const { nombreUsuario } = req.body;
  const { idTipoRegistro } = req.body;
  const { idMotivo } = req.body;
  const { fecha } = req.body;
  const { marco } = req.body;
  const { id_kiosco } = req.body;
  const query = `
    INSERT INTO registros values 
    '${codigoUsuario}','${nombreUsuario}','${idTipoRegistro}','${idMotivo}','${fecha}',${marco},'${id_kiosco}');
  `;
  //console.log(query);
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
    //console.log(recuperado)
    
});

});

// POSTS DE Registros
router.post('/registroVendedor', (req, res) => {
  const { CodigoUsuario } = req.body;
  const { fecha } = req.body;
  const query = `
    SELECT * FROM vw_registros where codigo_usuario = '${CodigoUsuario}' and fecha='${fecha}';
  `;
  //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
    //console.log(recuperado)
    
});
});

// POSTS DE Cumplimiento
router.post('/cumplimientoVendedor', (req, res) => {
  const { CodigoUsuario } = req.body;
  const { fecha_inicial } = req.body;
  const { fecha_final } = req.body;
  const query = `
    SELECT * FROM vw_cumplimientos where fechas between '${fecha_inicial} 00:00:00' and '${fecha_final} 23:59:59'
    and codigo_usuario='${CodigoUsuario}';
  `;
  console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   // console.log(recuperado)
    
});
});
router.post('/getStatus', (req, res) => {
  const { id_kiosco } = req.body;
  const { fecha } = req.body;
  const query = `
  select id_tipo_registro, id_motivo from registros where id_kiosco='${id_kiosco}'
  and fecha between '${fecha} 00:00:00' and '${fecha} 23:59:00'
  order by id_registros desc
  Limit 1;
  `;
 // console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   //console.log(recuperado)
    
});
});


router.post('/marcar', (req, res) => {
  const { CodigoUsuario } = req.body;
  const { NombreUsuario } = req.body;
  const { id_tipo_registro } = req.body;
  const { id_motivo } = req.body;
  const { marco } = req.body;
  const { id_kiosco } = req.body;
  const query = `
  INSERT INTO registros values (null,'${CodigoUsuario}','${NombreUsuario}',${id_tipo_registro},${id_motivo},now(),'${marco}','${id_kiosco}');
  `;
 //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   //console.log(recuperado)
    
});
});

router.post('/ingresosEgresos', (req, res) => {
  const { fecha_final } = req.body;
  const { fecha_inicial } = req.body;

  const query = `
  select * from vw_registros where fechas between '${fecha_inicial}' and '${fecha_final}';
  `;
 //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   //console.log(recuperado)
    
});
});

// POSTS DE Registros
router.post('/registros', (req, res) => {
  const { fecha } = req.body;
  const query = `
    SELECT * FROM vw_registros where fecha = '${fecha}';
  `;
  console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
    //console.log(recuperado)
    
});
});

// POSTS DE CONTROL ASISTENCIAS
router.post('/asistencias', (req, res) => {
  const { fecha } = req.body;
  const query = `
    SELECT * FROM vw_asistencia where fecha = '${fecha}';
  `;
 //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
    //console.log(recuperado)
    
});
});

// POSTS DE CONFIGURACIONES
router.post('/configuraciones', (req, res) => {
  const { config } = req.body;
  var query="";
  if(config=="delete"){
    const { id_motivo } = req.body;
   query += `
    UPDATE motivos set activo=0 where id_motivo=${id_motivo};
  `;
  }else if(config=="add"){
    const { motivo } = req.body;
    const { tiempo } = req.body;
    const { tiempo_flex } = req.body;
    const { cantidad } = req.body;
     query += `
    INSERT INTO motivos values (null,'${motivo}',${tiempo},'${tiempo_flex}',1,'${cantidad}');
  `;
  }else if(config=="select"){
    const { id_motivo } = req.body;
    query += `Select * from motivos where id_motivo='${id_motivo}';`
  }else if(config=="edit"){
    const {id_motivo} = req.body;
    const { tiempo } = req.body;
    const { tiempo_flex } = req.body;
    const { cantidad } = req.body;
    if(id_motivo<=2){
      query +=`UPDATE motivos set
      tiempo_flexibilidad = '${tiempo_flex}'
      where id_motivo = '${id_motivo}';
      `
    }else{
    query +=`UPDATE motivos set
    tiempo = '${tiempo}',
    tiempo_flexibilidad = '${tiempo_flex}',
    cantidad = '${cantidad}'
    where id_motivo = '${id_motivo}';
    `
    }
  }
 //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   // console.log(recuperado)
    
});
});


router.post('/statusNotification', (req, res) => {
  const { id_kiosco } = req.body;
  const { fecha } = req.body;
    const query = `
    select 
    r.id_tipo_registro, 
    time(r.fecha) as hora, 
    r.id_motivo,
    r.fecha,
    m.tiempo,
    m.tiempo_flexibilidad
     from registros r
     join motivos m on r.id_motivo = m.id_motivo
  where id_kiosco = '${id_kiosco}'
    and fecha between '${fecha} 00:00:00' and '${fecha} 23:59:59'
    order by r.id_registros desc
    limit 1;
  `;
  
 //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   // console.log(recuperado)
    
});
});

router.post('/heartbeat', (req, res) => {
  const { id_kiosco } = req.body;
    const query = `
    select 
    *
    from kiosco_ubicacion
    where id_kiosco='${id_kiosco}';
  `;
  
 //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   // console.log(recuperado)
    
});
});

router.post('/getUbication', (req, res) => {
  const { id_kiosco } = req.body;
    const query = `
    select 
    *
    from kiosco_ubicacion
    where id_kiosco='${id_kiosco}';
  `;
  
 //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   // console.log(recuperado)
    
});
});

router.post('/newUbicacion', (req, res) => {
  const { id_kiosco } = req.body;
  const { longitud } = req.body;
  const { latitud } = req.body;
  const { hora_apertura } = req.body;
  const { hora_cierre } = req.body;
  const { direccion } = req.body;
    const query = `
    INSERT INTO kiosco_ubicacion values (null,'${id_kiosco}','${latitud}','${longitud}','${hora_apertura}','${hora_cierre}','${direccion}');
  `;
  
 console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   // console.log(recuperado)
    
});
});

router.get('/getKioscos', (req, res) => {
    const query = `
    select * from kiosco_ubicacion; 
  `;
  
 //console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   // console.log(recuperado)
    
});
});

router.post('/updateKiosco', (req, res) => {
  const { id_ubicacion } = req.body;
  const { longitud } = req.body;
  const { latitud } = req.body;
  const { hora_apertura } = req.body;
  const { hora_cierre } = req.body;
  const { direccion } = req.body;
    const query = `
    update kiosco_ubicacion set longitud = '${longitud}',
    latitud = '${latitud}',
    hora_apertura = '${hora_apertura}',
    hora_cierre = '${hora_cierre}',
    direccion = '${direccion}'
    where id_kiosco_ubicacion = '${id_ubicacion}'; 
  `;
  
  console.log(query)
  pool.query(query, function (err, recuperado) {
            
    if (err) console.log(err)

    // send records as a response
    res.json(recuperado);
   // console.log(recuperado)
    
});
});

router.post('/getKioscosForId', (req, res) => {
  const { id_ubicacion } = req.body;
  const query = `
  select * from kiosco_ubicacion
  where id_kiosco_ubicacion='${id_ubicacion}'; 
`;

//console.log(query)
pool.query(query, function (err, recuperado) {
          
  if (err) console.log(err)

  // send records as a response
  res.json(recuperado);
 // console.log(recuperado)
  
});
});

router.post('/deleteKioscos', (req, res) => {
  const { id_ubicacion } = req.body;
  const query = `
  delete from kiosco_ubicacion
  where id_kiosco_ubicacion='${id_ubicacion}'; 
`;

//console.log(query)
pool.query(query, function (err, recuperado) {
          
  if (err) console.log(err)

  // send records as a response
  res.json(recuperado);
 // console.log(recuperado)
  
});
});


/**SEND MAIL */
router.post("/sendemail", function (req, res) {
  const { subject } = req.body;
  const { cuerpo } = req.body;
  console.log("Este es el asunto"+ subject)
  var mailOptions = {
    from: 'notificaciones@slc.com.gt',
    to: 'mcastillo@slc.com.gt, ecentes@slc.com.gt',
    cc: "",
    //sac@tav.com.gt,
    subject: subject,
    //text: cuerpo
    html: cuerpo
  };

  smtpTransport.sendMail(mailOptions, function (error, respuesta) {
    if (error) {
      console.log(error)
    } else {
      res.send('correo enviado')
    }
  });

  //console.log("funciona")
  //res.json
  //return res;
});


function VerificacionHorario() {
  dateday1 = new Date().getFullYear()+"-"+(0+(new Date().getMonth()+1).toString()).slice(-2)+"-"+new Date().getDate()+" 00:00:00";
  dateday2 = new Date().getFullYear()+"-"+(0+(new Date().getMonth()+1).toString()).slice(-2)+"-"+new Date().getDate()+" 23:59:59";

  const query = `
  select * from kiosco_ubicacion k
where not exists (select id_kiosco from registros r
where fecha between '${dateday1}' and '${dateday2}'
and id_motivo=1 and k.id_kiosco = r.id_kiosco);
`;
  var hora_actual = new Date();
  pool.query(query, function (err, recuperado) {
    //console.log(recuperado)
    recuperado.forEach(function(recup){
      pool.query("select * from motivos where id_motivo=1;", function (err, motivos) {
        //console.log(motivos)
        if (err) console.log(err)

        motivos.forEach(function(mot){
          //console.log(recup.hora_apertura);
          //console.log(mot.tiempo_flexibilidad)
          hora_entrada = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(),
             numero(recup.hora_apertura),mot.tiempo_flexibilidad, 0,0);
            //hora_entrada = new Date(2021, 03, 18,10, 0, 0);
            //console.log(numero(recup.hora_apertura))
          //console.log(hora_actual)
          //console.log(hora_entrada)
          if (hora_actual > hora_entrada) {
            cuerpo = ` <p> El Kiosco <b> ${recup.id_kiosco}</b> no se aperturo en el horario indicado.</p>
           <p> Favor ponerse en contacto con el vendedor </p>`;
           query2 =`INSERT INTO registros values (null,'No Ingreso','No Ingreso',1,1,now(),'0','${recup.id_kiosco}');`;
           pool.query(query2, function (err, motivos) {console.log("inserto tu inasistencia")});
           asunto = "Notificacion Apertura"
                 noApertura(cuerpo,asunto)
          } else {
            //console.log("Kiosco " + recup.id_kiosco + " Esta en buena hora")
          }

        });
        
       
  
      });
    });
   


    //res.json(recuperado);
    // console.log(recuperado)


  });

}

///FUNCION QUE NOTIFICARA EN CASO NO SE MARQUE RETORNO EN TIEMPO
function verificaRetornos() {
  dateday1 = new Date().getFullYear()+"-"+(0+(new Date().getMonth()+1).toString()).slice(-2)+"-"+new Date().getDate()+" 00:00:00";
  dateday2 = new Date().getFullYear()+"-"+(0+(new Date().getMonth()+1).toString()).slice(-2)+"-"+new Date().getDate()+" 23:59:59";

  const query = `
  select distinct id_kiosco from kiosco_ubicacion;
`;
  
  pool.query(query, function (err, recuperado) {
    //console.log(recuperado)
    //Recorro todos los kioscos
    recuperado.forEach(function(recup){

      pool.query(`select * from registros where id_kiosco='${recup.id_kiosco}'
      and id_motivo>2
      order by 1 desc
      limit 1;`, function (err, registros) {
        //console.log(motivos)
        if (err) console.log(err)
        //busco el ultimo permiso y lo recorro
        registros.forEach(function(ultimo){
          

          //si encuentro una salida abierta como ultimo registro verifico los horarios. 
          if(ultimo.id_tipo_registro==2 && ultimo.id_motivo>2){
           
            pool.query(`select * from motivos where id_motivo='${ultimo.id_motivo}';`, function (err, motivos) {
              //console.log(motivos)
              if (err) console.log(err)
      
              motivos.forEach(function(mot){
                //console.log(recup.hora_apertura);
                //console.log(mot.tiempo_flexibilidad)
                var hora_actual = new Date();
                hora_retorno = ultimo.fecha;
                min = hora_retorno.getMinutes();
                hora_retorno.setMinutes(min+mot.tiempo+mot.tiempo_flexibilidad)
                  //hora_entrada = new Date(2021, 03, 18,10, 0, 0);
                  //console.log(numero(recup.hora_apertura))
                
                if (hora_actual > hora_retorno) {
                  cuerpo = ` <p> El Usuario <b> ${ultimo.nombre_usuario}</b> no marco su regreso de <b>${mot.descripcion}</b> </p>
                 <p> Favor ponerse en contacto con el vendedor </p>`;
                 query2 =`INSERT INTO registros values (null,'${ultimo.codigo_usuario}','${ultimo.nombre_usuario}',1,${ultimo.id_motivo},now(),'0','${recup.id_kiosco}');`;
                 pool.query(query2, function (err, motivos) {console.log("inserto tu no marcaje")});
                 asunto = "No Marcaje"
                 noApertura(cuerpo,asunto)
                } else {
                  console.log("Kiosco " + ultimo.codigo_usuario + " Esta en buena hora")
                }
      
              });
              
             
        
            });


          }else{
            console.log("no encuentro nada.")
          }

        });
        
       
  
      });
      
      
    });
   


    //res.json(recuperado);
    // console.log(recuperado)


  });

}

function numero(number) {
  var firstTwoDigits = Math.floor(number / 100);
  return firstTwoDigits;
}
setInterval(VerificacionHorario, 300* 1000);
setInterval(verificaRetornos, 60* 1000);

function noApertura(cuerpo,asunto){
  var mailOptions = {
    from: 'notificaciones@slc.com.gt',
    to: 'mcastillo@slc.com.gt, ecentes@slc.com.gt',
    cc: "",
    //sac@tav.com.gt,
    subject: asunto,
    //text: cuerpo
    html: cuerpo
  };

  smtpTransport.sendMail(mailOptions, function (error, respuesta) {
    if (error) {
      console.log(error)
    } else {
      res.send('correo enviado')
    }
  });
}


module.exports = router;
