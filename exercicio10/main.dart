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
      home: Exercicio10Page(),
    );
  }
}

class Exercicio10Page extends StatefulWidget {
  const Exercicio10Page({super.key});

  @override
  State<Exercicio10Page> createState() => _Exercicio10PageState();
}

class _Exercicio10PageState extends State<Exercicio10Page> {
  final TextEditingController _qtdController = TextEditingController();
  int _estoque = 0;
  String _mensagem = "";

  @override
  void dispose() {
    _qtdController.dispose();
    super.dispose();
  }

  void _entrada() {
    setState(() {
      int? qtd = int.tryParse(_qtdController.text);
      if (qtd == null || qtd < 0) {
        _mensagem = "Digite uma quantidade válida para entrada.";
        return;
      }
      _estoque += qtd;
      _mensagem = "Entrada realizada com sucesso.";
    });
  }

  void _saida() {
    setState(() {
      int? qtd = int.tryParse(_qtdController.text);
      if (qtd == null || qtd < 0) {
        _mensagem = "Digite uma quantidade válida para saída.";
        return;
      }
      if (qtd > _estoque) {
        _mensagem = "Aviso: Quantidade solicitada maior que o estoque disponível.";
        return;
      }
      _estoque -= qtd;
      _mensagem = "Saída realizada com sucesso.";
    });
  }

  void _limparCampo() {
    setState(() {
      _qtdController.clear();
      _mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 10 - Controle de Estoque")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Quantidade atual em estoque: $_estoque",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _qtdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Quantidade"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _entrada,
                  child: const Text("Entrada"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _saida,
                  child: const Text("Saída"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _limparCampo,
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
