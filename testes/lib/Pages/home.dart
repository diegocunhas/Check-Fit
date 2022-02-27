import 'package:flutter/material.dart';
import 'package:testes/Pages/avaliacao_fisica.dart';
import 'package:testes/Pages/plano_alimentar.dart';
import 'package:testes/Pages/meu_treino.dart';
import 'package:testes/Pages/criar_treino.dart';
import 'package:testes/Widget/buildDrawer.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentPage = 0;

  final telas = [
    Center(child: Text('Tela Home')),
    MeuTreino(),
    PlanoAlimentar(),
    AvaliacaoFisica(),
    CriarTreino(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      backgroundColor: Colors.white,
      body: Text('Home placeholder'),
      drawer: BuildDrawer(),
    );
  }

  _appbar(){
    return AppBar(
      title: Text('Check-Fit'),
      centerTitle: true,
    );
  }

  _checkUser(user){
    if(user==0){}
    else if(user==1){}
    else if(user==2){}
  }

}