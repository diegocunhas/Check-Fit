import 'package:flutter/material.dart';
import 'package:testes/Widget/navigationDrawer.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  static const String routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text('Home placeholder'),
        ]
      ),
      drawer: BuildDrawer(),
    );
  }

  _appbar(){
    return AppBar(
      title: Text('Check-Fit'),
      centerTitle: true,
    );
  }



/*
  _checkUser(user){
    if(user==0){}
    else if(user==1){}
    else if(user==2){}
  }
*/
}