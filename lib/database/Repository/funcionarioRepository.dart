import 'package:mongo_app/model/FuncionarioModel.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../mongoConnection.dart';

class FuncionarioRepository {
  static Future<String> insert(Funcionario data) async{
    try {
      var result = await MongoDB.funcionarioCollection.insertOne(data.toJson());
      if(result.isSuccess){
        return "Dados inseridos";
      }
      return "Falha";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<void> update(Funcionario data) async {
    var result = await MongoDB.funcionarioCollection.findOne({"_id":data.id});
    result['nome'] = data.nome;
    result['cpf'] = data.cpf;
    result['email'] = data.email;
    result['dataNasc'] = data.dataNasc;
    result['telefone'] = data.telefone;
    result['endereco']['cep'] = data.endereco.cep;
    result['endereco']['complemento'] = data.endereco.complemento;
    result['cargo'] = data.cargo;
    var response = await MongoDB.funcionarioCollection.save(result);
  }

  static void delete(Funcionario data) async {
    await MongoDB.funcionarioCollection.remove(where.id(data.id));
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final listaFuncionario = await MongoDB.funcionarioCollection.find().toList();
    return listaFuncionario;
  }

  static Future<List<Map<String, dynamic>>> getQueryData(String param) async{
    final listaFuncionario = await MongoDB.funcionarioCollection.find(where.eq('nome', param)).toList();
    return listaFuncionario;
  }
}