import 'package:flutter/material.dart';

class PlanoAlimentar extends StatefulWidget {
  const PlanoAlimentar({ Key? key }) : super(key: key);
  static const String routeName = '/planoAlimentar';

  @override
  _PlanoAlimentar createState() => _PlanoAlimentar();
}

class _PlanoAlimentar extends State<PlanoAlimentar> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(color: Colors.green, height:36, width: 28,),
            Container(color: Colors.blue, height:36, width: 28,),
            Container(color: Colors.red)
          ]
        ),
        TableRow(
          children: <Widget>[
            Container(color: Colors.blue, child: Text('coluna1,linha2') ),
            Container(color: Colors.yellow, height:36, width: 28,),
            Container(color: Colors.pink, height:36, width: 28),
          ]
        ),
      ]
    );
  }
}