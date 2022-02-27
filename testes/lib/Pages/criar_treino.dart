import 'package:flutter/material.dart';

class CriarTreino extends StatefulWidget {
  const CriarTreino({ Key? key }) : super(key: key);

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
    );
  }

  _appbar(){
    return AppBar(
      title: Text('Criar Treino'),
      centerTitle: true,
    );
  }

}