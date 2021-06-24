import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {

AdminPage({this.saldo});
final String saldo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenido"),),
      body: Column(
        children: <Widget>[
          Text('estado de cuenta:  $saldo', style: TextStyle(fontSize: 20.0),),

          RaisedButton(
            child: Text("retirar de nuevo"),
            onPressed: (){
              Navigator.pushReplacementNamed(context,'/MyHomePage');
            },
          ),
        ],
      ),
    );
  }
}