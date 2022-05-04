// To parse this JSON data, do
//
//     final funcionario = funcionarioFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Funcionario funcionarioFromJson(String str) => Funcionario.fromJson(json.decode(str));

String funcionarioToJson(Funcionario data) => json.encode(data.toJson());

class Funcionario {
    Funcionario({
        required this.id,
        required this.nome,
        required this.cpf,
        required this.email,
        required this.dataNasc,
        required this.telefone,
        required this.endereco,
        required this.cargo,
    });

    ObjectId id;
    String nome;
    String cpf;
    String email;
    String dataNasc;
    String telefone;
    Endereco endereco;
    String cargo;

    factory Funcionario.fromJson(Map<String, dynamic> json) => Funcionario(
        id: json["_id"],
        nome: json["nome"],
        cpf: json["cpf"],
        email: json["email"],
        dataNasc: json["dataNasc"],
        telefone: json["telefone"],
        endereco: Endereco.fromJson(json["endereco"]),
        cargo: json["cargo"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nome": nome,
        "cpf": cpf,
        "email": email,
        "dataNasc": dataNasc,
        "telefone": telefone,
        "endereco": endereco.toJson(),
        "cargo": cargo,
    };
}

class Endereco {
    Endereco({
        required this.cep,
        required this.complemento,
    });

    String cep;
    String complemento;

    factory Endereco.fromJson(Map<String, dynamic> json) => Endereco(
        cep: json["cep"],
        complemento: json["complemento"],
    );

    Map<String, dynamic> toJson() => {
        "cep": cep,
        "complemento": complemento,
    };
}
