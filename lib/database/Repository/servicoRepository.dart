import 'package:mongo_app/model/ServicoModel.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../mongoConnection.dart';

class ServicoRepository {
  static Future<String> insert(Servico data) async{
    try {
      var result = await MongoDB.servicoCollection.insertOne(data.toJson());
      if(result.isSuccess){
        return "Dados inseridos";
      }
      return "Falha";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

    static Future<void> update(Servico data) async {
    var result = await MongoDB.servicoCollection.findOne({"_id":data.id});
    result['computador']['id'] = data.computador.id;
    result['computador']['modelo'] = data.computador.modelo;
    result['cliente']['id'] = data.cliente.id;
    result['cliente']['nome'] = data.cliente.nome;
    result['defeito'] = data.defeito;
    result['responsavel']['id'] = data.responsavel.id;
    result['responsavel']['nome'] = data.responsavel.nome;
    result['preco'] = data.preco;
    result['dataEntrada'] = data.dataEntrada;
    result['previsaoSaida'] = data.previsaoSaida;
    result['observacao'] = data.observacao;
    result['status'] = data.status;
    var response = await MongoDB.servicoCollection.save(result);
  }

  static void delete(Servico data) async {
    await MongoDB.servicoCollection.remove(where.id(data.id));
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final listaServico = await MongoDB.servicoCollection.find().toList();
    return listaServico;
  }

  static Future<List<Map<String, dynamic>>> getQueryData(String param) async{
    //.eq pode ser substituido por outras funcoes do mongo, como .gt ou .gte por exemplo
    final listaServico = await MongoDB.servicoCollection.find(where.eq('cliente.nome', param)).toList();
    return listaServico;
  }
}