import 'package:mongo_dart/mongo_dart.dart';

import '../../model/ClienteModel.dart';
import '../mongoConnection.dart';

class ClienteRepository {
  static Future<String> insert(Cliente data) async{
    try {
      var result = await MongoDB.clienteCollection.insertOne(data.toJson());
      if(result.isSuccess){
        return "Dados inseridos";
      }
      return "Falha";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
  
  static Future<void> update(Cliente data) async {
    var result = await MongoDB.clienteCollection.findOne({"_id":data.id});
    result['nome'] = data.nome;
    result['cpf'] = data.cpf;
    result['email'] = data.email;
    result['dataNasc'] = data.dataNasc;
    result['telefone'] = data.telefone;
    result['endereco']['cep'] = data.endereco.cep;
    result['endereco']['complemento'] = data.endereco.complemento;
    var response = await MongoDB.clienteCollection.save(result);
  }

  static void delete(Cliente data) async {
    await MongoDB.clienteCollection.remove(where.id(data.id));
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final listaCliente = await MongoDB.clienteCollection.find().toList();
    return listaCliente;
  }

  static Future<List<Map<String, dynamic>>> getQueryData(String param) async{
    final listaCliente = await MongoDB.clienteCollection.find(where.eq('nome', param)).toList();
    return listaCliente;
  }
}