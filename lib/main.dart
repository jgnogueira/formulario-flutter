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
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controladorNome,
            ),
            TextField(
              controller: _controladorQuantidade,
            ),
            TextField(
              controller: _controladorValor,
            ),
            RaisedButton(
              onPressed: () {
                final String nome = _controladorNome.text;
                final int quantidade =
                    int.tryParse(_controladorQuantidade.text);
                final double valor = double.tryParse(_controladorValor.text);

                _criarProduto(nome, quantidade, valor);
              },
              child: Text('Salvar'),
            )
          ],
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
