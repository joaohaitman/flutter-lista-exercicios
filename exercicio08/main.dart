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
      home: Exercicio08Page(),
    );
  }
}

class Exercicio08Page extends StatefulWidget {
  const Exercicio08Page({super.key});

  @override
  State<Exercicio08Page> createState() => _Exercicio08PageState();
}

class _Exercicio08PageState extends State<Exercicio08Page> {
  final TextEditingController _distanciaController = TextEditingController();
  final TextEditingController _litrosController = TextEditingController();
  String _resultado = "";

  @override
  void dispose() {
    _distanciaController.dispose();
    _litrosController.dispose();
    super.dispose();
  }

  void _calcularConsumo() {
    setState(() {
      double? distancia = double.tryParse(_distanciaController.text);
      double? litros = double.tryParse(_litrosController.text);

      if (distancia == null || litros == null || litros == 0) {
        _resultado = "Por favor, insira valores válidos (litros diferente de zero).";
        return;
      }

      double consumo = distancia / litros;
      String classificacao = consumo >= 12 ? "Econômico" : "Consumo elevado";

      _resultado = "Consumo médio: ${consumo.toStringAsFixed(1)} km/l\n"
          "Classificação: $classificacao";
    });
  }

  void _limpar() {
    setState(() {
      _distanciaController.clear();
      _litrosController.clear();
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 08 - Consumo de Combustível")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _distanciaController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Distância percorrida (km)"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _litrosController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Combustível utilizado (litros)"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calcularConsumo,
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
