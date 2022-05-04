import 'package:postgres/postgres.dart';

class inicializarDB{
  PostgreSQLConnection? connection;

  inicializarDB(){
    if(connection==null || connection!.isClosed==true){
      connection = PostgreSQLConnection(
        "ec2-44-196-8-220.compute-1.amazonaws.com", 5432, "d5u41h9ficmo7e",
        username: "ffvkynvtaqjhow",
        password:
            "e7f906db811665563f28752ac1dd625b0366669f9474a6a832768ecc32738a3f",
        useSSL: true);
    }
    else{
      connection=connection;
    }
    // print('acessou o construtor do inicializarDB');
  }
  
}