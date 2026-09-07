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
      home: Exercicio04Page(),
    );
  }
}

class Exercicio04Page extends StatefulWidget {
  const Exercicio04Page({super.key});

  @override
  State<Exercicio04Page> createState() => _Exercicio04PageState();
}

class _Exercicio04PageState extends State<Exercicio04Page> {
  final TextEditingController _celsiusController = TextEditingController();
  String _resultado = "";

  @override
  void dispose() {
    _celsiusController.dispose();
    super.dispose();
  }

  void _converter() {
    setState(() {
      double? celsius = double.tryParse(_celsiusController.text);

      if (celsius == null) {
        _resultado = "Por favor, digite uma temperatura válida.";
        return;
      }

      double fahrenheit = (celsius * 9 / 5) + 32;
      _resultado = "Temperatura em Fahrenheit: ${fahrenheit.toStringAsFixed(1)} °F";
    });
  }

  void _limpar() {
    setState(() {
      _celsiusController.clear();
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 04 - Conversor de Temperatura")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _celsiusController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Temperatura em Celsius (°C)"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _converter,
                  child: const Text("Converter"),
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
