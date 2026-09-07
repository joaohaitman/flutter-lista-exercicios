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
      home: Exercicio07Page(),
    );
  }
}

class Exercicio07Page extends StatefulWidget {
  const Exercicio07Page({super.key});

  @override
  State<Exercicio07Page> createState() => _Exercicio07PageState();
}

class _Exercicio07PageState extends State<Exercicio07Page> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _salarioController = TextEditingController();
  final TextEditingController _percentualController = TextEditingController();
  String _resultado = "";

  @override
  void dispose() {
    _nomeController.dispose();
    _salarioController.dispose();
    _percentualController.dispose();
    super.dispose();
  }

  void _calcularReajuste() {
    setState(() {
      String nome = _nomeController.text;
      double? salario = double.tryParse(_salarioController.text);
      double? percentual = double.tryParse(_percentualController.text);

      if (salario == null || percentual == null) {
        _resultado = "Por favor, informe valores válidos para salário e percentual.";
        return;
      }

      double aumento = salario * (percentual / 100);
      double novoSalario = salario + aumento;

      _resultado = "Funcionário: $nome\n"
          "Salário atual: R\$ ${salario.toStringAsFixed(2)}\n"
          "Aumento: R\$ ${aumento.toStringAsFixed(2)}\n"
          "Novo salário: R\$ ${novoSalario.toStringAsFixed(2)}";
    });
  }

  void _limpar() {
    setState(() {
      _nomeController.clear();
      _salarioController.clear();
      _percentualController.clear();
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 07 - Reajuste Salarial")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: "Nome do Funcionário"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _salarioController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Salário Atual"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _percentualController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Percentual de Reajuste (%)"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calcularReajuste,
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
