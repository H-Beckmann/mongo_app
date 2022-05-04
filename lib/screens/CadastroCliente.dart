import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mongo_app/database/mongoConnection.dart';
import 'package:mongo_app/model/ClienteModel.dart';
import 'package:mongo_dart/mongo_dart.dart' as mdb;

import '../database/Repository/clienteRepository.dart';

class CadastroCliente extends StatefulWidget {
  const CadastroCliente({Key? key}) : super(key: key);

  @override
  State<CadastroCliente> createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  var nomeTextController = TextEditingController();
  var cpfTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var dataNascTextController = TextEditingController();
  var telefoneTextController = TextEditingController();
  var cepTextController = TextEditingController();
  var complementoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de clientes"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nomeTextController,
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: cpfTextController,
                  decoration: const InputDecoration(labelText: "CPF"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailTextController,
                  decoration: const InputDecoration(labelText: "e-mail"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: dataNascTextController,
                  decoration:
                      const InputDecoration(labelText: "Data de nascimento"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: telefoneTextController,
                  decoration: const InputDecoration(labelText: "Telefone"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Endereço"),
                const Divider(
                  thickness: 5,
                  color: Colors.grey,
                ),
                TextField(
                  controller: cepTextController,
                  decoration: const InputDecoration(labelText: "CEP"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: complementoTextController,
                  decoration: const InputDecoration(labelText: "Compelento"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        _dataFaker();
                      },
                      child: const Text("Gerar dados aleatorios"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        insertData(
                            nomeTextController.text,
                            cpfTextController.text,
                            emailTextController.text,
                            dataNascTextController.text,
                            telefoneTextController.text,
                            cepTextController.text,
                            complementoTextController.text);
                      },
                      child: const Text("Inserir dados"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> insertData(String nome, String cpf, String email,
      String dataNasc, String telefone, String cep, String complemento) async {
        Endereco _end = Endereco(cep: cep, complemento: complemento);
        var _id = mdb.ObjectId();
        final data = Cliente(id: _id, nome: nome, cpf: cpf, email: email, dataNasc: dataNasc, telefone: telefone, endereco: _end);
        var result = await ClienteRepository.insert(data);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
        _clearAll();  
      }

  void _clearAll(){
    nomeTextController.text = "";
      cpfTextController.text = "";
      emailTextController.text = "";
      dataNascTextController.text ="";
      telefoneTextController.text = "";
      cepTextController.text = "";
      complementoTextController.text = "";
  }

  void _dataFaker() {
    setState(() {
      nomeTextController.text = faker.person.name();
      cpfTextController.text = faker.randomGenerator.decimal().toString();
      emailTextController.text = faker.internet.email();
      dataNascTextController.text =
          faker.date.dateTime(maxYear: 2005, minYear: 1980).toString();
      telefoneTextController.text = faker.phoneNumber.us();
      cepTextController.text = faker.address.zipCode();
      complementoTextController.text = faker.address.buildingNumber();
    });
  }
}
