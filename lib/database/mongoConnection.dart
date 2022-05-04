import 'dart:developer';

import 'package:mongo_app/database/dbConnectionStrings.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDB{
  //As constantes são diferentes para cada aplicação
  static var db, clienteCollection, funcionarioCollection, computadorCollection, servicoCollection;
  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    clienteCollection = db.collection(CLIENTE_COLL);
    funcionarioCollection = db.collection(FUNCIONARIO_COLL);
    computadorCollection = db.collection(COMPUTADOR_COLL);
    servicoCollection = db.collection(SERVICO_COLL);
  }
} 