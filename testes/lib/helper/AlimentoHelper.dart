import 'package:testes/model/Alimento.dart';
import 'package:postgres/postgres.dart';
import 'package:testes/helper/DBHelper.dart';

void main() async{ AlimentoHelper().atualizarAlimento(Alimento('teste update','atualizado','alimentohelper'),9);}
class AlimentoHelper {

  final String nomeTabela = "Alimentos";
  PostgreSQLConnection? connection = inicializarDB().connection;
  PostgreSQLResult? results;
  PostgreSQLResult? alimentoJaCadastrado, resultadoCriarAlimento, resultadoAtualizarAlimento;
//-----------------CREATE---------------------------------------
  Future salvarAlimento(Alimento alimento) async{
    String novoAlimentoFuture = '';
    try{
      await connection!.open();
      await connection!.transaction((novoAlimentoConn) async{
        alimentoJaCadastrado = await novoAlimentoConn.query('SELECT * FROM alimentos WHERE nm_alimento=@nome',
        substitutionValues: {'nome':alimento.nome}, allowReuse: true, timeoutInSeconds: 30);
        if(alimentoJaCadastrado!.affectedRowCount>0){
          novoAlimentoFuture = 'ja_existe';
        }
        else{
          resultadoCriarAlimento = await novoAlimentoConn.query("INSERT INTO ALIMENTOS (nm_alimento,ds_alimento,nm_categoria_alimento) VALUES (@nome,@descricao,@categoria)", 
          substitutionValues: {"nome":alimento.nome,"descricao":alimento.descricao,"categoria":alimento.categoriaAlimento},
          allowReuse: true, timeoutInSeconds: 30);
            //verifica se houve alteração na tabela
          if(resultadoCriarAlimento!.affectedRowCount>0){
            novoAlimentoFuture = 'criado';
          }
          else{
            novoAlimentoFuture = 'nao';
          }
        }
      });
    }
    catch (exception){
      novoAlimentoFuture = 'exception';
      exception.toString();
    } 
    return novoAlimentoFuture;
  } 
//-------------------READ---------------------------------------
  Future recuperarAlimento(id) async{
    // connection = AppDataBase();
    await connection!.open();
    var results = await connection!.query("SELECT * FROM Alimentos WHERE cd_alimento=@id",
    substitutionValues: {'id':id});
    // await connection!.close();
    print(results);
    return results;
  }
  

//---------------------------UPDATE---------------------------------
  Future atualizarAlimento(Alimento alimento,id) async{
    String atualizarAlimentoFuture = '';
    try{
      await connection!.open();
      await connection!.transaction((atualizarAlimentoConn) async{
        PostgreSQLResult checarNomeAlimento = await atualizarAlimentoConn.query(
          'SELECT nm_alimento FROM alimentos WHERE nm_alimento = @nome',
          substitutionValues: {'nome':alimento.nome}, allowReuse: false ,timeoutInSeconds:30
        );
        if(checarNomeAlimento.affectedRowCount > 0){
          // verifica no db se o nome que se vai alterar ja existe no db, 
          // se já existe não necessita duplicatas
          atualizarAlimentoFuture = 'ja_existe';
        }
        else{
          resultadoAtualizarAlimento = await atualizarAlimentoConn.query(
            'UPDATE alimentos SET nm_alimento=@nome, ds_alimento=@descricao, nm_categoria_alimento=@categoria WHERE cd_alimento=@id',
            substitutionValues: {'id':id,'nome':alimento.nome,'descricao':alimento.descricao,'categoria':alimento.categoriaAlimento},
            allowReuse: false, timeoutInSeconds: 30
          );
          if(resultadoAtualizarAlimento!.affectedRowCount>0){
            atualizarAlimentoFuture = 'atualizado';
          }
          else{
            atualizarAlimentoFuture = 'nao';
          }  
        }
      });
    }
    catch (exception){
      atualizarAlimentoFuture = 'exception';
      exception.toString();
    }
    return atualizarAlimentoFuture;
  }
//-----------------------DELETE--------------------------------
    Future removerAlimento(Alimento alimento) async{
    inicializarDB();
     var results = await connection!.query("DELETE FROM Alimentos WHERE cd_alimento=@id",
    substitutionValues:{"id":alimento.id});
    await connection!.close();
    return results;
  }

  // salvarAlimento(Alimento('usando','connection','sem invocar classe'));
  // recuperarAlimento(7);
  // print(results);

}