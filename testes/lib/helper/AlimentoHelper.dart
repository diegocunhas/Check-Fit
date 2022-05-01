import 'package:testes/model/Alimento.dart';
import 'package:postgres/postgres.dart';
import 'package:path/path.dart';

class AlimentoHelper {
  static final String nomeTabela = "Alimentos";
  static final AlimentoHelper _alimentoHelper = AlimentoHelper();
  var _db;

  factory AlimentoHelper(){
    return _alimentoHelper;
  }

  inicializarDB() async{
    var connection = PostgreSQLConnection("ec2-44-196-8-220.compute-1.amazonaws.com", 5432, 
      "d5u41h9ficmo7e", username: "ffvkynvtaqjhow", password: "e7f906db811665563f28752ac1dd625b0366669f9474a6a832768ecc32738a3f");
    await connection.open();
    return connection;
  }
  Future salvarAlimento(Alimento alimento) async{
    var connection = inicializarDB();
    List<List<dynamic>> results = await connection.query("INSERT nome,descricao,categoria INTO Alimentos WHERE nome=@nome, descricao=@descricao,categoria=@categoria", 
    substitutionValues: {"nome":"batata","descricao":"fonte de amido","categoria":"tuberculo"});
    return results;
  }

  Future exibirAlimentos(Alimento alimento) async{
    var connection = inicializarDB();
    List<List<dynamic>> results = await connection.query("SELECT * FROM Alimentos ");
    return results;
  }
  

  //Future

}