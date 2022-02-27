import 'package:flutter/material.dart';
//import 'package:testes/Pages/home.dart';
import 'package:testes/Pages/avaliacao_fisica.dart';
import 'package:testes/Pages/plano_alimentar.dart';
import 'package:testes/Pages/meu_treino.dart';
import 'package:testes/Pages/criar_treino.dart';
import 'package:testes/Pages/login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check-Fit',
      home: LoginScreen(),
      //initialRoute: '/home',
      routes: <String,WidgetBuilder>{
        //'/home': (BuildContext context) => Home(),
        '/meu_treino': (BuildContext context) => MeuTreino(),
        '/criar_treino': (BuildContext context) => CriarTreino(),
        '/plano_alimentar': (BuildContext context) => PlanoAlimentar(),
        '/avaliacao_fisica': (BuildContext context) => AvaliacaoFisica(),
      },
    );
  }
}