import 'dart:async';
import 'dart:convert';

import 'package:banco/estado.dart';
import 'package:banco/MemberPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 

void main() => runApp(new MyApp());

String saldo='';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'banco',     
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/Estado': (BuildContext context)=> new Estado(saldo: saldo),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController user=new TextEditingController();
TextEditingController pass=new TextEditingController();

String msg='';

Future<List> _retiro() async {
  final response = await http.post("http://topicos.decoquito.com/ajax/RetiroController.php?op=guardaryeditar", body: {
    "idCuenta": user.text,
    "monto": pass.text,
  });

  var datos = json.decode(response.body);
  print('datos');
 print(datos[0][1]);
  if(datos.length==0){
    setState(() {
          msg="Retiro fallido";
        });
  }else{
    if(datos[0][0]=='registro exitoso'){
      Navigator.pushReplacementNamed(context, '/Estado');
    }else if(datos[0][0]=='registro fallido'){
      Navigator.pushReplacementNamed(context, '/Estado');
    }

    setState(() {
          saldo= datos[0][1].toString();
        });

  }

  return datos;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CAJERO"),centerTitle: true,),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text("numero de cuenta",style: TextStyle(fontSize: 18.0),),
                TextField(   
                  controller: user,                
                  decoration: InputDecoration(
                    hintText: 'numero de cuenta'
                  ),           
                  ),
                Text("monto a retirar",style: TextStyle(fontSize: 18.0),),
                TextField(  
                  controller: pass,  
                  obscureText: false,                
                   decoration: InputDecoration(
                    hintText: 'monto'
                  ),                
                  ),
                
                RaisedButton(
                  child: Text("retirar"),
                  onPressed: (){
                    _retiro();
                  },
                ),

                Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
               

              ],
            ),
          ),
        ),
      ),
    );
}
}