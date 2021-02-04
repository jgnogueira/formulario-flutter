import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrando produto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(labelText: 'Nome'),
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorQuantidade,
                  decoration: InputDecoration(labelText: 'Quantidade'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorValor,
                  decoration: InputDecoration(labelText: 'Valor'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    final String nome = _controladorNome.text;
                    final int quantidade =
                        int.tryParse(_controladorQuantidade.text);
                    final double valor =
                        double.tryParse(_controladorValor.text);

                    _criarProduto(nome, quantidade, valor);
                  },
                  child: Text('Salvar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _criarProduto(nome, quantidade, valor) {
    if (nome != null && quantidade != null && valor != null) {
      final Produto novoProduto = Produto(nome, quantidade, valor);
      print('$novoProduto');
    } else {
      print('Não foi possível criar o produto.');
    }
  }
}

class Produto {
  final String nome;
  final int quantidade;
  final double valor;

  Produto(
    this.nome,
    this.quantidade,
    this.valor,
  );

  @override
  String toString() {
    return 'Produto{nome: $nome, quantidade: $quantidade, valor: $valor}';
  }
}
