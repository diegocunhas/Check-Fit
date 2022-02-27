import 'package:flutter/material.dart';
import 'package:testes/Pages/home.dart';
import 'package:testes/Pages/avaliacao_fisica.dart';
import 'package:testes/Pages/plano_alimentar.dart';
import 'package:testes/Pages/meu_treino.dart';
import 'package:testes/Pages/criar_treino.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({ Key? key }) : super(key: key);
  

  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  
  int _currentPage = 0;

  final pageList = [
    '/home',
    '/meu_treino',
    '/plano_alimentar',
    '/avaliacao_fisica',
    '/criar_treino',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blue.shade100,
        child: ListView(
          children: [
            FlutterLogo(size:45),
            Text('nome do usuario', textAlign: TextAlign.center,),
            _listTile('Meu Perfil',Icon(Icons.account_tree),0),
            _listTile('Meu Treino/Criar Treino - trocar com o perfil',Icon(Icons.access_alarms_rounded),1),
            _criarTreino(2),
            _listTile('Plano Alimentar/Criar Plano Alimentar - trocar com o perfil',Icon(Icons.cable_outlined),2),
            _listTile('Avaliaca Fisica',Icon(Icons.dangerous),3),
          ],
        ),
      ),
    );
  }

   _listTile(String titulo, icone, setPage){
    return ListTile(
      title: Text(titulo),
      //subtitle: Text('Grade de treinos'),
      leading: icone,
      //icons possuem altura e largura de 24.0
      onTap: (){
        setState((){
          Navigator.of(context)
                  .pushNamed('/home');
        });
        Navigator.pop(context);
      },
    );
  }

  _criarTreino(user){
    if(user==0 || user==2){
      return _listTile('Criar Treino',Icon(Icons.psychology),4);
    }
    else return Container(width: 0.0, height: 0.0);
  }


}