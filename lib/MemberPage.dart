import 'package:flutter/material.dart';

class Estado extends StatelessWidget {

Estado({this.saldo});
final String saldo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Member"),),
      body: Column(
        children: <Widget>[
          Text('Hallo $saldo', style: TextStyle(fontSize: 20.0),),

          RaisedButton(
            child: Text("LogOUt"),
            onPressed: (){
              Navigator.pushReplacementNamed(context,'/MyHomePage');
            },
          ),
        ],
      ),
    );
  }
}
