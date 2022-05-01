import 'package:flutter/material.dart';
import 'package:testes/routes/pageRoute.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({ Key? key }) : super(key: key);
  

  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  

  final routeList = [
    PageRoutes.home,
    PageRoutes.meuTreino,
    PageRoutes.planoAlimentar,
    PageRoutes.avaliacaoFisica,
    PageRoutes.criarTreino,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blue.shade100,
        child: ListView(
          children: [
            FlutterLogo(size:45),
            Text('Teste', textAlign: TextAlign.center,),
            _listTile('Meu Perfil',Icon(Icons.account_tree),routeList[0]),
            _listTile('Meu Treino/Criar Treino - trocar com o perfil',Icon(Icons.access_alarms_rounded),routeList[1]),
            //_criarTreino(2),
            _listTile('Plano Alimentar/Criar Plano Alimentar - trocar com o perfil',Icon(Icons.cable_outlined),routeList[2]),
            _listTile('Avaliação Fisica',Icon(Icons.dangerous),routeList[3]),
          ]
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
          Navigator.pushNamed(context,setPage);
        });
      },
    );
  }
/*
  _criarTreino(user){
    if(user==0 || user==2){
      return _listTile('Criar Treino',Icon(Icons.psychology),4);
    }
    else return Container(width: 0.0, height: 0.0);
  }
*/

}