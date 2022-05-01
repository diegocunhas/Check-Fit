import 'package:flutter/material.dart';

class MeuTreino extends StatefulWidget {
  const MeuTreino({ Key? key }) : super(key: key);
  static const String routeName = '/meuTreino';

  @override
  _MeuTreinoState createState() => _MeuTreinoState();
}

class _MeuTreinoState extends State<MeuTreino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Meu Treino PlaceHolder')
          ],
        ),
      ),
    );
  }
}