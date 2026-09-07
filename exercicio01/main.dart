import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Exercicio01Page(),
    );
  }
}

class Exercicio01Page extends StatefulWidget {
  const Exercicio01Page({super.key});

  @override
  State<Exercicio01Page> createState() => _Exercicio01PageState();
}

class _Exercicio01PageState extends State<Exercicio01Page> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  String _mensagem = "";

  @override
  void dispose() {
    _nomeController.dispose();
    _cidadeController.dispose();
    super.dispose();
  }

  void _mostrarMensagem() {
    setState(() {
      String nome = _nomeController.text;
      String cidade = _cidadeController.text;
      _mensagem = "Olá, $nome! Você mora em $cidade.";
    });
  }

  void _limpar() {
    setState(() {
      _nomeController.clear();
      _cidadeController.clear();
      _mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 01 - Identificação")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _cidadeController,
              decoration: const InputDecoration(labelText: "Cidade"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _mostrarMensagem,
                  child: const Text("Mostrar"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _limpar,
                  child: const Text("Limpar"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _mensagem,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
