import 'package:flutter/material.dart';
import 'package:testes/Pages/home.dart';
import 'package:testes/Pages/avaliacao_fisica.dart';
import 'package:testes/Pages/plano_alimentar.dart';
import 'package:testes/Pages/meu_treino.dart';
import 'package:testes/Pages/criar_treino.dart';
import 'package:testes/Pages/login.dart';
import 'package:testes/routes/pageRoute.dart';
import 'package:testes/Pages/criar_plano_alimentar.dart';

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
      routes: {
        PageRoutes.home: (context) => Home(),
        PageRoutes.avaliacaoFisica: (context) => AvaliacaoFisica(),
        PageRoutes.meuTreino: (context) => MeuTreino(),
        PageRoutes.criarTreino: (context) => CriarTreino(),
        PageRoutes.planoAlimentar: (context) => PlanoAlimentar(),
        PageRoutes.criarPlanoAlimentar: (context) => CriarPlanoAlimentar(),
      }
    );
  }
}