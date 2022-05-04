// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
    Cliente({
        required this.id,
        required this.nome,
        required this.cpf,
        required this.email,
        required this.dataNasc,
        required this.telefone,
        required this.endereco,
    });

    ObjectId id;
    String nome;
    String cpf;
    String email;
    String dataNasc;
    String telefone;
    Endereco endereco;

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["_id"],
        nome: json["nome"],
        cpf: json["cpf"],
        email: json["email"],
        dataNasc: json["dataNasc"],
        telefone: json["telefone"],
        endereco: Endereco.fromJson(json["endereco"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nome": nome,
        "cpf": cpf,
        "email": email,
        "dataNasc": dataNasc,
        "telefone": telefone,
        "endereco": endereco.toJson(),
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
