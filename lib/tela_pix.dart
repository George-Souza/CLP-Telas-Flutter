import 'package:flutter/material.dart';

class TelaPix extends StatefulWidget {
  @override
  _TelaPixState createState() => _TelaPixState();
}

class _TelaPixState extends State<TelaPix> {
  final TextEditingController _chaveController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  // Função para realizar o pagamento
  void _realizarPagamento(BuildContext context) {
    final chave = _chaveController.text;
    final valor = double.tryParse(_valorController.text);
    final descricao = _descricaoController.text;

    if (chave.isEmpty || valor == null || valor <= 0 || descricao.isEmpty) {
      // Mostrar um alerta se os campos estiverem inválidos
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Por favor, preencha todos os campos corretamente.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'),
              ),
            ],
          );
        },
      );
    } else {
      // Lógica para realizar o pagamento (simulação)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pagamento Realizado'),
            content: Text('Pagamento de R\$ $valor para chave $chave realizado com sucesso!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Redirecionar ou limpar campos se necessário
                },
                child: Text('Fechar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Realizar Pagamento via PIX',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        actions: [
          // Logo da lua no canto superior direito
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/lua.png', // Caminho para a imagem
              width: 40, // Ajuste o tamanho da logo
              height: 40, // Ajuste o tamanho da logo
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Texto de saudação
            Text(
              'Valeime! Para quem você deseja enviar o pix?',
              style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold, fontFamily: 'FonteOxe'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Campo para a chave PIX
            TextField(
              controller: _chaveController,
              decoration: InputDecoration(
                labelText: 'Chave PIX',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Campo para o valor
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Campo para a descrição
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Botão para realizar o pagamento
            ElevatedButton(
              onPressed: () => _realizarPagamento(context),
              child: Text('Realizar Pagamento'),
            ),
          ],
        ),
      ),
    );
  }
}
