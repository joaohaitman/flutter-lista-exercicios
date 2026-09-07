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
      home: Exercicio02Page(),
    );
  }
}

class Exercicio02Page extends StatefulWidget {
  const Exercicio02Page({super.key});

  @override
  State<Exercicio02Page> createState() => _Exercicio02PageState();
}

class _Exercicio02PageState extends State<Exercicio02Page> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  String _resultado = "";

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    super.dispose();
  }

  void _verificarIdade() {
    setState(() {
      String nome = _nomeController.text;
      int? idade = int.tryParse(_idadeController.text);

      if (idade == null) {
        _resultado = "Por favor, digite uma idade válida.";
        return;
      }

      if (idade >= 18) {
        _resultado = "$nome é maior de idade.";
      } else {
        _resultado = "$nome é menor de idade.";
      }
    });
  }

  void _limpar() {
    setState(() {
      _nomeController.clear();
      _idadeController.clear();
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 02 - Verificador de Idade")),
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
              controller: _idadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Idade"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _verificarIdade,
                  child: const Text("Verificar"),
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
              _resultado,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
