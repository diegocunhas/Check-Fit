// import 'package:testes/helper/UsuarioHelper.dart';

class Usuario{
  int? id;
  String? nome;
  String? senhaHash;
  String? tipoUsuario;

  Usuario(this.nome, this.senhaHash, this.tipoUsuario);

  Usuario.fromMap(Map map){
    this.id = map["id"];
    this.nome = map["nome"];
    this.senhaHash = map["senhaHash"];
    this.tipoUsuario = map["tipoUsuario"];
  }

  Map toMap(){
    Map<String,dynamic> map={"nome": this.nome,"senhaHash":this.senhaHash,
                        "tipoUsuario":this.tipoUsuario};

    if(this.id != null){
      map["id"] = this.id;
    }

    return map;
  }
}