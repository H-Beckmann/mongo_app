import 'package:mongo_app/model/ComputadorModel.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../mongoConnection.dart';

class ComputadorRepository {
  static Future<String> insert(Computador data) async{
    try {
      var result = await MongoDB.computadorCollection.insertOne(data.toJson());
      if(result.isSuccess){
        return "Dados inseridos";
      }
      return "Falha";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<void> update(Computador data) async {
    var result = await MongoDB.computadorCollection.findOne({"_id":data.id});
    result['marca'] = data.marca;
    result['modelo'] = data.modelo;
    result['memoria'] = data.memoria;
    result['processador'] = data.tipo;
    result['monitor'] = data.monitor;
    result['adicionais'] = data.adicionais;
    result['dono']['id'] = data.dono.id;
    result['dono']['nome'] = data.dono.nome;
    var response = await MongoDB.computadorCollection.save(result);
  }

  static void delete(Computador data) async {
    await MongoDB.computadorCollection.remove(where.id(data.id));
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final listaComputador = await MongoDB.computadorCollection.find().toList();
    return listaComputador;
  }

  static Future<List<Map<String, dynamic>>> getQueryData(String param) async{
    //.eq pode ser substituido por outras funcoes do mongo, como .gt ou .gte por exemplo
    final listaComputador = await MongoDB.computadorCollection.find(where.eq('modelo', param)).toList();
    return listaComputador;
  }
}