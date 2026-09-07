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
      home: Exercicio05Page(),
    );
  }
}

class Exercicio05Page extends StatefulWidget {
  const Exercicio05Page({super.key});

  @override
  State<Exercicio05Page> createState() => _Exercicio05PageState();
}

class _Exercicio05PageState extends State<Exercicio05Page> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();
  String _resultado = "";

  @override
  void dispose() {
    _nota1Controller.dispose();
    _nota2Controller.dispose();
    _nota3Controller.dispose();
    super.dispose();
  }

  void _calcularMedia() {
    setState(() {
      double? n1 = double.tryParse(_nota1Controller.text);
      double? n2 = double.tryParse(_nota2Controller.text);
      double? n3 = double.tryParse(_nota3Controller.text);

      if (n1 == null || n2 == null || n3 == null) {
        _resultado = "Por favor, preencha todas as três notas corretamente.";
        return;
      }

      double media = (n1 + n2 + n3) / 3;
      String situacao = media >= 6 ? "Aprovado" : "Reprovado";

      _resultado = "Média: ${media.toStringAsFixed(1)}\nSituação: $situacao";
    });
  }

  void _limpar() {
    setState(() {
      _nota1Controller.clear();
      _nota2Controller.clear();
      _nota3Controller.clear();
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 05 - Calculadora de Média")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nota1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Nota 1"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nota2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Nota 2"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nota3Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Nota 3"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calcularMedia,
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
