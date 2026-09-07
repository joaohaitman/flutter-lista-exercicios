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
      home: Exercicio09Page(),
    );
  }
}

class Exercicio09Page extends StatefulWidget {
  const Exercicio09Page({super.key});

  @override
  State<Exercicio09Page> createState() => _Exercicio09PageState();
}

class _Exercicio09PageState extends State<Exercicio09Page> {
  final TextEditingController _produtoController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _qtdController = TextEditingController();
  String _resultado = "";

  @override
  void dispose() {
    _produtoController.dispose();
    _precoController.dispose();
    _qtdController.dispose();
    super.dispose();
  }

  void _calcularVenda() {
    setState(() {
      String produto = _produtoController.text;
      double? preco = double.tryParse(_precoController.text);
      int? qtd = int.tryParse(_qtdController.text);

      if (preco == null || qtd == null) {
        _resultado = "Por favor, insira valores válidos para preço e quantidade.";
        return;
      }

      double subtotal = preco * qtd;
      double desconto = subtotal > 500 ? subtotal * 0.10 : 0.0;
      double total = subtotal - desconto;

      _resultado = "Produto: $produto\n"
          "Quantidade: $qtd\n"
          "Subtotal: R\$ ${subtotal.toStringAsFixed(2)}\n"
          "Desconto: R\$ ${desconto.toStringAsFixed(2)}\n"
          "Total: R\$ ${total.toStringAsFixed(2)}";
    });
  }

  void _limpar() {
    setState(() {
      _produtoController.clear();
      _precoController.clear();
      _qtdController.clear();
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 09 - Sistema de Vendas")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _produtoController,
              decoration: const InputDecoration(labelText: "Nome do Produto"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _precoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Preço Unitário"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _qtdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Quantidade Comprada"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calcularVenda,
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
