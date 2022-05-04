// To parse this JSON data, do
//
//     final servico = servicoFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_app/model/FuncionarioModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

Servico servicoFromJson(String str) => Servico.fromJson(json.decode(str));

String servicoToJson(Servico data) => json.encode(data.toJson());

class Servico {
    Servico({
        required this.id,
        required this.computador,
        required this.cliente,
        required this.defeito,
        required this.responsavel,
        required this.preco,
        required this.dataEntrada,
        required this.previsaoSaida,
        required this.observacao,
        required this.status,
    });

    ObjectId id;
    Computador computador;
    Cliente cliente;
    String defeito;
    Funcionario responsavel;
    int preco;
    DateTime dataEntrada;
    DateTime previsaoSaida;
    String? observacao;
    String status;

    factory Servico.fromJson(Map<String, dynamic> json) => Servico(
        id: json["_id"],
        computador: Computador.fromJson(json["computador"]),
        cliente: Cliente.fromJson(json["cliente"]),
        defeito: json["defeito"],
        responsavel: Funcionario.fromJson(json["responsavel"]),
        preco: json["preco"],
        dataEntrada: DateTime.parse(json["dataEntrada"]),
        previsaoSaida: DateTime.parse(json["previsaoSaida"]),
        observacao: json["observacao"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "computador": computador.toJson(),
        "cliente": cliente.toJson(),
        "defeito": defeito,
        "responsavel": responsavel.toJson(),
        "preco": preco,
        "dataEntrada": "${dataEntrada.year.toString().padLeft(4, '0')}-${dataEntrada.month.toString().padLeft(2, '0')}-${dataEntrada.day.toString().padLeft(2, '0')}",
        "previsaoSaida": "${previsaoSaida.year.toString().padLeft(4, '0')}-${previsaoSaida.month.toString().padLeft(2, '0')}-${previsaoSaida.day.toString().padLeft(2, '0')}",
        "observacao": observacao,
        "status": status,
    };
}

class Funcionario {
    Funcionario({
        required this.id,
        required this.nome,
    });

    ObjectId id;
    String nome;

    factory Funcionario.fromJson(Map<String, dynamic> json) => Funcionario(
        id: json["id"],
        nome: json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
    };
}

class Cliente {
    Cliente({
        required this.id,
        required this.nome,
    });

    ObjectId id;
    String nome;

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nome: json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
    };
}

class Computador {
    Computador({
        required this.id,
        required this.modelo,
    });

    ObjectId id;
    String modelo;

    factory Computador.fromJson(Map<String, dynamic> json) => Computador(
        id: json["id"],
        modelo: json["modelo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "modelo": modelo,
    };
}
