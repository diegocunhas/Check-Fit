import 'package:testes/helper/AlimentoHelper.dart';

class Alimento{
  int? id;
  String? nome;

  Alimento(this.nome);

  Alimento.fromMap(Map map){
    this.id = map["id"];
    this.nome = map["nome"];
  }

  Map toMap(){
    Map<String,dynamic> map={"nome": this.nome};

    if(this.id != null){
      map["id"] = this.id;
    }

    return map;
  }
}