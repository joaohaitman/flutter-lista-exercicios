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
      home: Exercicio03Page(),
    );
  }
}

class Exercicio03Page extends StatefulWidget {
  const Exercicio03Page({super.key});

  @override
  State<Exercicio03Page> createState() => _Exercicio03PageState();
}

class _Exercicio03PageState extends State<Exercicio03Page> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = "";

  @override
  void dispose() {
    _numeroController.dispose();
    super.dispose();
  }

  void _calcular() {
    setState(() {
      int? numero = int.tryParse(_numeroController.text);

      if (numero == null) {
        _resultado = "Por favor, digite um número inteiro válido.";
        return;
      }

      int antecessor = numero - 1;
      int sucessor = numero + 1;

      _resultado = "Número: $numero\nAntecessor: $antecessor\nSucessor: $sucessor";
    });
  }

  void _limpar() {
    setState(() {
      _numeroController.clear();
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 03 - Antecessor e Sucessor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Número Inteiro"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calcular,
                  child: const Text("Calcular"),
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
