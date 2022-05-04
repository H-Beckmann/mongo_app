import 'package:flutter/material.dart';
import 'package:mongo_app/database/mongoConnection.dart';
import 'package:mongo_app/screens/CadastroCliente.dart';
import 'package:mongo_app/screens/cadastroFuncionario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const cadastroFuncionario(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage ({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(),);
  }
}
