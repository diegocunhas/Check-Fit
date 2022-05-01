import 'package:flutter/material.dart';
import 'package:testes/Widget/navigationDrawer.dart';

class AvaliacaoFisica extends StatefulWidget {
  const AvaliacaoFisica({ Key? key }) : super(key: key);
  static const String routeName = '/avaliacaoFisica';

  @override
  _AvaliacaoFisicaState createState() => _AvaliacaoFisicaState();
}

class _AvaliacaoFisicaState extends State<AvaliacaoFisica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avaliação Física'),centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Text('Avaliacao Fisica PlaceHolder')
          ],
        ),
      ),
      drawer: BuildDrawer(),
    );
  }
}