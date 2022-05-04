import 'package:testes/helper/AlimentoHelper.dart';

class Alimento{
  int? id;
  String? nome;
  String? descricao;
  String? categoriaAlimento;

  Alimento(this.nome, this.descricao, this.categoriaAlimento);

  Alimento.fromMap(Map map){
    this.id = map["id"];
    this.nome = map["nome"];
    this.descricao = map["descricao"];
    this.categoriaAlimento = map["categoriaAlimento"];
  }

  Map toMap(){
    Map<String,dynamic> map={"nome": this.nome,"descricao":this.descricao,
                        "categoriaAlimento":this.categoriaAlimento};

    if(this.id != null){
      map["id"] = this.id;
    }

    return map;
  }
}