import 'package:flutter/material.dart';
import 'package:testes/Widget/navigationDrawer.dart';
import 'package:testes/model/Alimento.dart';
import 'package:testes/helper/AlimentoHelper.dart';


class CriarPlanoAlimentar extends StatefulWidget {
  const CriarPlanoAlimentar({ Key? key }) : super(key: key);

  static const String routeName = '/criarPlanoAlimentar';

  @override
  State<CriarPlanoAlimentar> createState() => _CriarPlanoAlimentarState();
}

class _CriarPlanoAlimentarState extends State<CriarPlanoAlimentar> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _categoriaController = TextEditingController();

  var _connection = AlimentoHelper();
  List<Alimento>? _alimentos = [];

  //metodos

  _exibirTelaCadastro({Alimento? alimento}){
    String textoSalvarAtualizar ="";
    if(alimento==null){
      //salvar
      _nomeController.text ="";
      _descricaoController.text="";
      textoSalvarAtualizar = "Salvar";
    }
    else{
      //atualizar
      _nomeController.text = alimento.nome!;
      _descricaoController.text = alimento.descricao!;
      textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('$textoSalvarAtualizar alimento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nomeController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Alimento", hintText: "Digite o nome do alimento",
                ),
              ),
              TextField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  labelText: "Descrição", hintText: "Digite a descrição ...",
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=>Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: (){
                _salvarAtualizarAlimento(alimentoSelecionado: alimento);
                Navigator.pop(context);
              },
              child: Text(textoSalvarAtualizar),
            ),
          ],
        );
      }
    );
  }

  _recuperarAlimentos() async{
    List alimentosRecuperados = await _connection.recuperarAlimento();

    List<Alimento>? listaTemporaria = [];
    for (var item in alimentosRecuperados){
      Alimento alimento = Alimento.fromMap(item);
      listaTemporaria.add(alimento);
    }

    setState((){
      _alimentos = listaTemporaria;
    });

    listaTemporaria=null;

  }

  _salvarAtualizarAlimento({Alimento? alimentoSelecionado}) async {
    String nome = _nomeController.text;
    String descricao = _descricaoController.text;
    String categoria = _categoriaController.text;

    if(alimentoSelecionado==null){
      //salvar
      Alimento alimento = Alimento(nome, descricao, categoria);
      int resultado = await _connection.salvarAlimento(alimento);
    }
    else{
      //atualizar
      alimentoSelecionado.nome = nome;
      alimentoSelecionado.descricao = descricao;
      alimentoSelecionado.categoriaAlimento = categoria;
      int resultado = await _connection.atualizarAlimento(alimentoSelecionado);
    }

    _nomeController.clear();
    _descricaoController.clear();

    _recuperarAlimentos();
  }

  _removerAlimento(Alimento? alimento) async{
    await _connection.removerAlimento(alimento!);

    _recuperarAlimentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(title:Text('Criar Plano Alimentar'),centerTitle:true),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Text('Relação de Alimentos'),
                  _listView(),
                ]
              ),
            ),
            Container(),
          ]
        ), 
      ),
      floatingActionButton: _button(),
    );
  }

  _listView(){
    return Expanded(
      child: SizedBox(
        height:200,
        child: ListView.builder(
          itemCount: _alimentos!.length,
          itemBuilder: (context,index){
            final alimento = _alimentos![index];
            return Card(
              child: ListTile(
                title: Text(alimento.nome!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        _exibirTelaCadastro(alimento: alimento);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.edit, color: Colors.blueGrey),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _removerAlimento(alimento);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Icon(Icons.remove_circle, color: Colors.red),
                      ),
                    ),
                  ]
                ),
              ),
            );
          },
        )
      )
    );
  }

  _button(){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){_exibirTelaCadastro();}
    );
  }
  
}