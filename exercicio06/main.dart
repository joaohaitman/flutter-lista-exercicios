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
      home: Exercicio06Page(),
    );
  }
}

class Exercicio06Page extends StatefulWidget {
  const Exercicio06Page({super.key});

  @override
  State<Exercicio06Page> createState() => _Exercicio06PageState();
}

class _Exercicio06PageState extends State<Exercicio06Page> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _resultado = "";

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  void _somar() {
    _operacao((a, b) => a + b);
  }

  void _subtrair() {
    _operacao((a, b) => a - b);
  }

  void _multiplicar() {
    _operacao((a, b) => a * b);
  }

  void _dividir() {
    setState(() {
      double? n1 = double.tryParse(_num1Controller.text);
      double? n2 = double.tryParse(_num2Controller.text);

      if (n1 == null || n2 == null) {
        _resultado = "Por favor, digite números válidos.";
        return;
      }

      if (n2 == 0) {
        _resultado = "Erro: Divisão por zero não é permitida.";
        return;
      }

      double res = n1 / n2;
      _resultado = "Resultado: $res";
    });
  }

  void _operacao(double Function(double, double) calc) {
    setState(() {
      double? n1 = double.tryParse(_num1Controller.text);
      double? n2 = double.tryParse(_num2Controller.text);

      if (n1 == null || n2 == null) {
        _resultado = "Por favor, digite números válidos.";
        return;
      }

      double res = calc(n1, n2);
      _resultado = "Resultado: $res";
    });
  }

  void _limpar() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 06 - Calculadora 4 Operações")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Número 1"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _num2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Número 2"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _somar, child: const Text("+")),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _subtrair, child: const Text("-")),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _multiplicar, child: const Text("×")),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _dividir, child: const Text("÷")),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _limpar,
              child: const Text("Limpar"),
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
