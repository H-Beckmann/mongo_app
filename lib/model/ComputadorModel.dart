// To parse this JSON data, do
//
//     final computador = computadorFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Computador computadorFromJson(String str) => Computador.fromJson(json.decode(str));

String computadorToJson(Computador data) => json.encode(data.toJson());

class Computador {
    Computador({
        required this.id,
        required this.marca,
        required this.modelo,
        required this.memoria,
        required this.processador,
        required this.tipo,
        required this.monitor,
        required this.adicionais,
        required this.dono,
    });

    ObjectId id;
    String marca;
    String modelo;
    String memoria;
    String processador;
    String tipo;
    String monitor;
    List<String> adicionais;
    Dono dono;

    factory Computador.fromJson(Map<String, dynamic> json) => Computador(
        id: json["_id"],
        marca: json["marca"],
        modelo: json["modelo"],
        memoria: json["memoria"],
        processador: json["processador"],
        tipo: json["tipo"],
        monitor: json["monitor"],
        adicionais: List<String>.from(json["Adicionais"].map((x) => x)),
        dono: Dono.fromJson(json["dono"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "marca": marca,
        "modelo": modelo,
        "memoria": memoria,
        "processador": processador,
        "tipo": tipo,
        "monitor": monitor,
        "Adicionais": List<dynamic>.from(adicionais.map((x) => x)),
        "dono": dono.toJson(),
    };
}

class Dono {
    Dono({
        required this.id,
        required this.nome,
    });

    ObjectId id;
    String nome;

    factory Dono.fromJson(Map<String, dynamic> json) => Dono(
        id: json["id"],
        nome: json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
    };
}
