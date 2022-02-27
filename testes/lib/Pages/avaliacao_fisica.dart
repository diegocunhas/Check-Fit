import 'package:flutter/material.dart';

class AvaliacaoFisica extends StatefulWidget {
  const AvaliacaoFisica({ Key? key }) : super(key: key);

  @override
  _AvaliacaoFisicaState createState() => _AvaliacaoFisicaState();
}

class _AvaliacaoFisicaState extends State<AvaliacaoFisica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Avaliacao Fisica PlaceHolder')
          ],
        ),
      ),
    );
  }
}