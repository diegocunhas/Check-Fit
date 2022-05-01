import 'package:flutter/material.dart';
import 'package:testes/Widget/navigationDrawer.dart';

class CriarTreino extends StatefulWidget {
  const CriarTreino({ Key? key }) : super(key: key);
  static const String routeName = '/criarTreino';
  
  @override
  _CriarTreinoState createState() => _CriarTreinoState();
}

class _CriarTreinoState extends State<CriarTreino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
      child: Text('criar treino placeholder')
      ),
      drawer: BuildDrawer(),
    );
  }

  _appbar(){
    return AppBar(
      title: Text('Criar Treino'),
      centerTitle: true,
    );
  }

}